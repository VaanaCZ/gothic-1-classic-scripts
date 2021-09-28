// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									Vor Gesprдch
// *************************************************************************

INSTANCE Info_SFB_2_Pre(C_INFO)
{
	nr			= 1;
	condition	= Info_SFB_2_Pre_Condition;
	information	= Info_SFB_2_Pre_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_SFB_2_Pre_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_Pre_Info()
{	
	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_00"); //Что тебе нужно? Я не хочу неприятностей.
};

// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_2_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_2_EXIT_Condition;
	information	= Info_SFB_2_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ";
};                       

FUNC INT Info_SFB_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_2_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_2_EinerVonEuchWerden_Condition;
	information	= Info_SFB_2_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Что нужно сделать, чтобы присоединиться к вам?";
};                       

FUNC INT Info_SFB_2_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_2_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_2_EinerVonEuchWerden_15_00"); //Что нужно сделать, чтобы присоединиться к вам?
	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_01"); //В этом я тебе не помощник. Я слишком мелкая сошка. Поговори со Суини.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_2_WichtigePersonen_Condition;
	information	= Info_SFB_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь главный?";
};                       

FUNC INT Info_SFB_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_2_WichtigePersonen_15_00"); //Кто здесь главный?
	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_01"); //Здесь, в Лощине, всем распоряжаются наемники, но в Новом Лагере все немного по-другому.
	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_02"); //Думай сам, кого не стоит наживать себе в качестве врагов.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_2_DasLager_Condition;
	information	= Info_SFB_2_DasLager_Info;
	permanent	= 1;
	description = "Расскажи мне о Лагере.";
};                       

FUNC INT Info_SFB_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_2_DasLager_15_00"); //Мне нужно больше узнать об этом Лагере.
	AI_Output(self,other,"Info_SFB_2_DasLager_02_01"); //Не знаю, чем и помочь тебе. Ты лучше поговори со Суини или с наемниками.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_2_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_2_DieLage_Condition;
	information	= Info_SFB_2_DieLage_Info;
	permanent	= 1;
	description = "И как здесь живется?";
};                       

FUNC INT Info_SFB_2_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_2_DieLage_15_00"); //Как здесь живется?
	AI_Output(self,other,"Info_SFB_2_DieLage_02_01"); //Я не жалуюсь. Мы все должны делать одно дело.
	AI_Output(self,other,"Info_SFB_2_DieLage_02_02"); //По крайней мере, лучше работать здесь, чем в Старом Лагере.
	AI_Output(self,other,"Info_SFB_2_DieLage_02_03"); //Ты из Старого Лагеря?
	AI_Output(self,other,"Info_SFB_2_DieLage_02_04"); //Если ты из Старого Лагеря, запомни: я не хочу неприятностей!
	AI_StopProcessInfos	(self);
};	
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_2(var c_NPC slf)
{

	Info_SFB_2_Pre.npc					= Hlp_GetInstanceID(slf);
	
	Info_SFB_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_2_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_2_DieLage.npc				= Hlp_GetInstanceID(slf);
};
