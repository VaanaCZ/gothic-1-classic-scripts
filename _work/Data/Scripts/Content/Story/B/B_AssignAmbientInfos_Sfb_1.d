// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_1_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_1_EXIT_Condition;
	information	= Info_SFB_1_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};                       

FUNC INT Info_SFB_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_1_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_1_EinerVonEuchWerden_Condition;
	information	= Info_SFB_1_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Я хочу быть рудокопом. Как мне присоединиться к вам?";
};                       

FUNC INT Info_SFB_1_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_1_EinerVonEuchWerden_15_00"); //Я хочу быть рудокопом. Как мне присоединиться к вам?
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_01"); //Одним из нас? Только не думай, что если нас не заставляют, мы здесь не работаем.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_02"); //Если ты надеешься бездельничать здесь, то ты сильно ошибаешься. Иди и займись чем-нибудь еще.
	AI_Output(self,other,"Info_SFB_1_EinerVonEuchWerden_01_03"); //Если ты все еще думаешь, что сможешь справиться с этим делом, поговори с Суини. Это тот рудокоп, что весь день стоит в сторонке и курит.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_1_WichtigePersonen_Condition;
	information	= Info_SFB_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь командует?";
};                       

FUNC INT Info_SFB_1_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_1_WichtigePersonen_15_00"); //Кто здесь командует?
	AI_Output(self,other,"Info_SFB_1_WichtigePersonen_01_01"); //Командует? А ты оглянись вокруг. Уж конечно не те, кто целыми днями машет киркой, чтобы добыть немного руды.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_1_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_1_DasLager_Condition;
	information	= Info_SFB_1_DasLager_Info;
	permanent	= 1;
	description = "Что это за место?";
};                       

FUNC INT Info_SFB_1_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_1_DasLager_15_00"); //Что это за место?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_01"); //А на что оно, по-твоему, похоже? На королевский дворец?
	AI_Output(self,other,"Info_SFB_1_DasLager_01_02"); //Если уж ты в самом деле захотел поработать в Свободной шахте, то сначала ты должен доказать, что сможешь принести нам хоть какую-то пользу.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_1_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_1_DieLage_Condition;
	information	= Info_SFB_1_DieLage_Info;
	permanent	= 1;
	description = "Как жизнь?";
};                       

FUNC INT Info_SFB_1_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_1_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_1_DieLage_15_00"); //Как жизнь?
	AI_Output(self,other,"Info_SFB_1_DieLage_01_01"); //А ты как думаешь? Хуже не бывает. Работаю как вол, а руды и на горсть риса не всегда хватает.
	AI_Output(self,other,"Info_SFB_1_DieLage_01_02"); //Ты здесь можешь найти только одного довольного рудокопа - Суини. Окил назначил его главным среди нас. А теперь он слоняется по шахте и старается не набить себе мозоли ходьбой.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_1(var c_NPC slf)
{
	
	Info_SFB_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_1_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_1_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_1_DieLage.npc				= Hlp_GetInstanceID(slf);
};
