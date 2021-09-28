// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Nov_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Nov_3 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Nov_3_EXIT_Condition;
	information	= Info_Nov_3_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ";
};                       

FUNC INT Info_Nov_3_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Nov_3_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Nov_3_EinerVonEuchWerden_Condition;
	information	= Info_Nov_3_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Как мне присоединиться к этому Лагерю?";
};                       

FUNC INT Info_Nov_3_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Nov_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_3_EinerVonEuchWerden_15_00"); //Как мне присоединиться к этому Лагерю?
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_01"); //Это очень просто. Иди, друг.
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_02"); //Поговори с Гуру - они наставят тебя на путь истинный.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Nov_3_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Nov_3_WichtigePersonen_Condition;
	information	= Info_Nov_3_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто здесь главный?";
};                       

FUNC INT Info_Nov_3_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_3_WichtigePersonen_15_00"); //Кто здесь главный?
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_01"); //Ю`Берион! Хвала Спящему! Он привел нас в это славное место.
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_02"); //Все это было создано по его воле.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Nov_3_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Nov_3_DasLager_Condition;
	information	= Info_Nov_3_DasLager_Info;
	permanent	= 1;
	description = "На что здесь стоит обратить внимание? ";
};                       

FUNC INT Info_Nov_3_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_3_DasLager_Info()
{
	AI_Output(other,self,"Info_Nov_3_DasLager_15_00"); //Расскажи мне что-нибудь об этом месте.
	AI_Output(self,other,"Info_Nov_3_DasLager_03_01"); //Здесь есть такой Фортуно. Он бесплатно дает болотник всем последователям секты.
	AI_Output(self,other,"Info_Nov_3_DasLager_03_02"); //Ты найдешь его под лабораторией Кор Галома.
	
	var C_NPC CorKalom;		CorKalom= Hlp_GetNpc(Gur_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Nov_3_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Nov_3_DieLage_Condition;
	information	= Info_Nov_3_DieLage_Info;
	permanent	= 1;
	description = "Как дела?";
};                       

FUNC INT Info_Nov_3_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_3_DieLage_15_00"); //Как дела?
	AI_Output(self,other,"Info_Nov_3_DieLage_03_01"); //Я на небесах, приятель!
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Nov_3(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);
	
	Info_Nov_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Nov_3_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Nov_3_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Nov_3_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Nov_3_DieLage.npc				= Hlp_GetInstanceID(slf);
};
