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
	description = "ЗАКОНЧИТЬ";
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
	description = "Как мне присоединиться к этому Лагерю?";
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
	AI_Output(other,self,"Info_Vlk_1_EinerVonEuchWerden_15_00"); //Как мне присоединиться к этому Лагерю?
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_01"); //Это очень просто. Хватаешь кирку и отправляешься в шахту. Половину добытой руды придется отдать за защиту, ну а оставшейся как раз хватит на то, чтобы не протянуть ноги с голода. 
	AI_Output(self,other,"Info_Vlk_1_EinerVonEuchWerden_01_02"); //Гомез заламывает за свои припасы просто грабительскую цену. Но все равно это лучше, чем целыми днями жевать рис, как это делают в Новом Лагере.
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
	description = "Кто здесь командует?";
};                       

FUNC INT Info_Vlk_1_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_1_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_1_WichtigePersonen_15_00"); //Кто здесь главный?
	AI_Output(self,other,"Info_Vlk_1_WichtigePersonen_01_01"); //Бароны рудника. Они наладили обмен с королем. Естественно, чем ты важнее, тем больше ты получаешь.
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
	description = "Здесь есть что-нибудь, кроме этих хижин?";
};                       

FUNC INT Info_Vlk_1_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_1_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_1_DasLager_15_00"); //Здесь есть что-нибудь, кроме этих хижин?
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_01"); //Ну, вечером можно пойти на арену и посмотреть, как стражники сворачивают друг другу челюсти.
	AI_Output(self,other,"Info_Vlk_1_DasLager_01_02"); //Поистине, это стоит своих денег.
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
	description = "Как дела?";
};                       

FUNC INT Info_Vlk_1_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_1_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_1_DieLage_15_00"); //Как дела?
	AI_Output(self,other,"Info_Vlk_1_DieLage_01_01"); //Последние две недели я провел в шахте. Все, чего я сейчас хочу, это покой, так что убирайся с глаз моих. 
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
