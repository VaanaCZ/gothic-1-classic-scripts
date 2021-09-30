// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_1_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_1 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_1_EXIT_Condition;
	information	= Info_Vlk_1_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ РАЗГОВОР";
};                       

FUNC INT Info_Vlk_1_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_1_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_1_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_1_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_1_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Я хочу присоединиться к лагерю. Как мне это сделать?";
};                       

FUNC INT Info_Vlk_1_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_1_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_1_EinerVonEuchWerden_15_00"); //Я хочу присоединиться к лагерю. Как мне это сделать?
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_01"); //Очень просто. Найди себе кирку и иди в шахту. Около половины руды тебе придется отдавать солдатам, а на оставшуюся часть можно лишь кое-как сводить концы с концами.
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_02"); //Цены, которые назначает Гомез за товары из внешнего мира, просто драконовские. Но это все же лучше, чем целыми днями жевать рис, как в Новом лагере.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_1_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_1_WichtigePersonen_Condition;
	information	= Info_Vlk_1_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь всем управляет?";
};                       

FUNC INT Info_Vlk_1_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_1_WichtigePersonen_15_00"); //Кто здесь всем управляет?
	AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_01"); //Бароны. Они организуют поставки руды для короля. Чем ближе ты к ним, тем больше получаешь.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_1_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_1_DasLager_Condition;
	information	= Info_Vlk_1_DasLager_Info;
	permanent	= 1;
	description = "Здесь есть что-нибудь интересное, кроме этих лачуг?";
};                       

FUNC INT Info_Vlk_1_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_1_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_1_DasLager_15_00"); //Здесь есть что-нибудь интересное, кроме этих лачуг?
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_01"); //Ну, по вечерам можно полюбоваться тем, как стражники избивают друг друга на арене.
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_02"); //Понятно.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_1_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_1_DieLage_Condition;
	information	= Info_Vlk_1_DieLage_Info;
	permanent	= 1;
	description = "Как у тебя дела?";
};                       

FUNC INT Info_Vlk_1_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_1_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_1_DieLage_15_00"); //Как у тебя дела?
	AI_Output(self,other,"Info_Vlk_1_DieLage_01_01"); //Последние две недели я работал в шахте. Теперь я хочу отдохнуть, так что не мешай.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_1(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_1_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_1_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_1_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_1_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_1_DieLage.npc				= Hlp_GetInstanceID(slf);
};
