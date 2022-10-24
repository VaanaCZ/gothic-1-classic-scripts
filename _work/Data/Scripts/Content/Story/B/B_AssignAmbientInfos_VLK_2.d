// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_2_EXIT_Condition;
	information	= Info_Vlk_2_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};                       

FUNC INT Info_Vlk_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_2_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_2_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_2_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Я хочу стать одним из вас.";
};                       

FUNC INT Info_Vlk_2_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_2_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_2_EinerVonEuchWerden_15_00"); //Я хочу стать одним из вас.
	AI_Output(self,other,"Info_Vlk_2_EinerVonEuchWerden_02_01"); //Не понимаю, зачем тебе добровольно соваться в шахту. Таким как ты дорога одна - в замок.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_2_WichtigePersonen_Condition;
	information	= Info_Vlk_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь всем управляет?";
};                       

FUNC INT Info_Vlk_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_2_WichtigePersonen_15_00"); //Кто здесь всем управляет?
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_01"); //Здесь, во Внешнем Кольце, деньги за защиту собирают Флетчер, Бладвин и Шакал. У каждого из них есть свой район.
	AI_Output(self,other,"Info_Vlk_2_WichtigePersonen_02_02"); //Если поладишь с ними, считай, все в порядке.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_2_DasLager_Condition;
	information	= Info_Vlk_2_DasLager_Info;
	permanent	= 1;
	description = "Расскажи мне что-нибудь еще о лагере.";
};                       

FUNC INT Info_Vlk_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DasLager_15_00"); //Расскажи мне что-нибудь еще о лагере.
	AI_Output(self,other,"Info_Vlk_2_DasLager_02_01"); //Тебе нужно поговорить с Призраками. Они знают обо всем, что тебе нужно. Но будь осторожен - большинству из них нельзя доверять.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_2_DieLage_Condition;
	information	= Info_Vlk_2_DieLage_Info;
	permanent	= 1;
	description = "Как здесь живется?";
};                       

FUNC INT Info_Vlk_2_DieLage_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_00"); //Как здесь живется?
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_01"); //Если тебя прислали Бароны, скажи им, что я не хочу неприятностей. Я ни с кем не говорю об этом.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_02"); //Я доволен тем, что они дают нам.
	AI_Output(other,self,"Info_Vlk_2_DieLage_15_03"); //Никто меня не посылал. Я совсем недавно пришел сюда.
	AI_Output(self,other,"Info_Vlk_2_DieLage_02_04"); //Новенький, а? Новички всегда быстро попадают в неприятности. А мне не нужны проблемы, понял?
};	
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_2(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_2_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_2_DieLage.npc				= Hlp_GetInstanceID(slf);
};
