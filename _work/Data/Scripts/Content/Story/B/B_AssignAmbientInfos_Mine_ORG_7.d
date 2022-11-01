// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Org_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Org_7_EXIT_Condition;
	information	= Info_Mine_Org_7_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Mine_Org_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Mine
// *************************************************************************

INSTANCE Info_Mine_Org_7_Mine (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Org_7_Mine_Condition;
	information	= Info_Mine_Org_7_Mine_Info;
	permanent	= 1;
	description = "Opowiedz mi o tym obozie.";
};                       

FUNC INT Info_Mine_Org_7_Mine_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_7_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_Mine_15_00"); //Opowiedz mi o tym obozie.
	AI_Output(self,other,"Info_Mine_Org_7_Mine_07_01"); //Obóz? Masz na myśli Kocioł? Nie jest tu tak źle jak mówią. Krety wydobywają rudę, Najemnicy ich pilnują a my - Szkodniki - patrzymy im wszystkim na ręce.
	
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Org_7_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Org_7_WichtigePersonen_Condition;
	information	= Info_Mine_Org_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "W takim razie kto tu rządzi.";
};                       

FUNC INT Info_Mine_Org_7_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_WichtigePersonen_15_00"); //W takim razie kto tu rządzi?
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_01"); //To zależy, od kogo przyjmujesz rozkazy.
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_02"); //W każdym razie jak Okyl sobie czegoś zażyczy, lepiej mu nie odmawiać. Gdy się wkurzy, potrafi być bardzo nieprzyjemny.
	
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Org_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Org_7_DieLage_Condition;
	information	= Info_Mine_Org_7_DieLage_Info;
	permanent	= 1;
	description = "Co słychać?";
};                       

FUNC INT Info_Mine_Org_7_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_DieLage_15_00"); //Co słychać?
	AI_Output(self,other,"Info_Mine_Org_7_DieLage_07_01"); //Zaczynasz mnie denerwować, chłopcze.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Org_7(var c_NPC slf)
{
	
	
	Info_Mine_Org_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Org_7_Mine.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Org_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Org_7_DieLage.npc				= Hlp_GetInstanceID(slf);
};
