// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									Vor Gespr�ch
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
	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_00"); //Czego chcesz? Nie chc� mie� przez ciebie jakich� k�opot�w.
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
	description = "KONIEC";
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
	description = "Co mam zrobi�, �eby do was do��czy�?";
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
	AI_Output(other,self,"Info_SFB_2_EinerVonEuchWerden_15_00"); //Co mam zrobi�, �eby do was do��czy�?
	AI_Output(self,other,"Info_SFB_2_EinerVonEuchWerden_02_01"); //Tu ci nie pomog�. Jestem tylko drobn� p�otk�. Porozmawiaj ze Swineyem.
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
	description = "Kto tu dowodzi?";
};                       

FUNC INT Info_SFB_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_2_WichtigePersonen_15_00"); //Kto tu dowodzi?
	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_01"); //Ca�ym Kot�em trz�s� Najemnicy, ale w Nowym Obozie sprawy maj� si� nieco inaczej.
	AI_Output(self,other,"Info_SFB_2_WichtigePersonen_02_02"); //Dlatego lepiej uwa�aj, z kim zadzierasz.
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
	description = "Chcia�bym dowiedzie� si� wi�cej o waszym Obozie.";
};                       

FUNC INT Info_SFB_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_2_DasLager_15_00"); //Chcia�bym dowiedzie� si� czego� wi�cej o waszym Obozie.
	AI_Output(self,other,"Info_SFB_2_DasLager_02_01"); //Nie wiem, czy mog� ci z tym jako� pom�c. Porozmawiaj lepiej ze Swineyem albo z najemnikami.
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
	description = "Jak wygl�da �ycie tutaj?";
};                       

FUNC INT Info_SFB_2_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_2_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_2_DieLage_15_00"); //Jak wygl�da �ycie tutaj?
	AI_Output(self,other,"Info_SFB_2_DieLage_02_01"); //Nie mog� narzeka�. Ka�dy musi odpracowa� swoje i tyle.
	AI_Output(self,other,"Info_SFB_2_DieLage_02_02"); //Ale i tak jest tu lepiej ni� w Starym Obozie.
	AI_Output(self,other,"Info_SFB_2_DieLage_02_03"); //Przybywasz ze Starego Obozu?
	AI_Output(self,other,"Info_SFB_2_DieLage_02_04"); //Je�li jeste� ze Starego Obozu, wiedz, �e ja nie szukam �adnych k�opot�w!
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
