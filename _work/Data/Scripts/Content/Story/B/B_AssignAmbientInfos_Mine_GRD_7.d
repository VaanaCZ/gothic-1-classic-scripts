// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Grd_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Grd_7_EXIT_Condition;
	information	= Info_Mine_Grd_7_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Mine_Grd_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Grd_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Mine
// *************************************************************************

INSTANCE Info_Mine_Grd_7_Mine (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_7_Mine_Condition;
	information	= Info_Mine_Grd_7_Mine_Info;
	permanent	= 1;
	description = "Opowiedz mi o kopalni.";
};                       

FUNC INT Info_Mine_Grd_7_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_7_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_Mine_15_00"); //Opowiedz mi o kopalni.
	AI_Output(self,other,"Info_Mine_Grd_7_Mine_07_01"); //Kopacze wydobywają tu rudę, a my bronimy ich przed pełzaczami.
	
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Grd_7_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_7_WichtigePersonen_Condition;
	information	= Info_Mine_Grd_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu rządzi?";
};                       

FUNC INT Info_Mine_Grd_7_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_WichtigePersonen_15_00"); //Kto tu rządzi?
	AI_Output(self,other,"Info_Mine_Grd_7_WichtigePersonen_07_01"); //Ian i Asghan. Jeśli szukasz czegoś konkretnego - lepiej pogadaj z nimi.
	
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Grd_7_Minecrawler(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Grd_7_Minecrawler_Condition;
	information	= Info_Mine_Grd_7_Minecrawler_Info;
	permanent	= 1;
	description = "Wiesz coś więcej o tych pełzaczach?";
};                       

FUNC INT Info_Mine_Grd_7_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_7_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_Minecrawler_15_00"); //Wiesz coś więcej o tych pełzaczach?
	AI_Output(self,other,"Info_Mine_Grd_7_Minecrawler_07_01"); //Po mojemu, cały ten zwierzyniec należałoby wytępić raz a dobrze.
	
	
};
// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Grd_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Grd_7_DieLage_Condition;
	information	= Info_Mine_Grd_7_DieLage_Info;
	permanent	= 1;
	description = "Jak się masz?";
};                       

FUNC INT Info_Mine_Grd_7_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Grd_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Grd_7_DieLage_15_00"); //Jak się masz?
	AI_Output(self,other,"Info_Mine_Grd_7_DieLage_07_01"); //Zaczynasz mnie denerwować, chłopcze.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_grd_7(var c_NPC slf)
{
	
	
	Info_Mine_Grd_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_Mine.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Grd_7_DieLage.npc				= Hlp_GetInstanceID(slf);
};
