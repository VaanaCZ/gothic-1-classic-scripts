// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Org_6_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_6 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Org_6_EXIT_Condition;
	information	= Info_Mine_Org_6_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Mine_Org_6_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_6_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Org_6_Mine (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Org_6_Mine_Condition;
	information	= Info_Mine_Org_6_Mine_Info;
	permanent	= 1;
	description = "Co si� dzieje w kopalni?";
};                       

FUNC INT Info_Mine_Org_6_Mine_Condition()
{
		return 1;
};

FUNC VOID Info_Mine_Org_6_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_Mine_15_00"); //Co si� dzieje w kopalni?
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_01"); //W kopalni? Kto tam siedzi - ju� nie wyjdzie. Kto nie siedzi - nie wejdzie.
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_02"); //Ciesz si�, �e ci� tam nie ma.
	
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Org_6_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Org_6_WichtigePersonen_Condition;
	information	= Info_Mine_Org_6_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu dowodzi?";
};                       

FUNC INT Info_Mine_Org_6_WichtigePersonen_Condition()
{
		return 1;
};

FUNC VOID Info_Mine_Org_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_00"); //Kto tu dowodzi?
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_01"); //Mi nikt nie rozkazuje, ale trzeba wiedzie�, jak do tego doj��.
	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_01"); //A ja ty to osi�gn��e�?
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_02"); //Tajemnica zawodowa. Ale mi�dzy nami m�wi�c - dla Szkodnika to �aden problem.
};


// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Org_6_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Org_6_DieLage_Condition;
	information	= Info_Mine_Org_6_DieLage_Info;
	permanent	= 1;
	description = "Nie wygl�dasz mi na kogo�, kto by si� przepracowywa�.";
};                       

FUNC INT Info_Mine_Org_6_DieLage_Condition()
{
		return 1;
};

FUNC VOID Info_Mine_Org_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_DieLage_15_00"); //Nie wygl�dasz mi na kogo�, kto by si� przepracowywa�.
 	AI_Output(self,other,"Info_Mine_Org_6_DieLage_06_01"); //Ja, pracowa�? Jakby mi si� chcia�o pracowa�, nie trafi�bym pod Barier�, kapujesz?
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Org_6(var c_NPC slf)
{
	Info_Mine_Org_6_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Org_6_DieLage.npc					= Hlp_GetInstanceID(slf);
};
