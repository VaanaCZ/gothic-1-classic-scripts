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
	description = "Co siê dzieje w kopalni?";
};                       

FUNC INT Info_Mine_Org_6_Mine_Condition()
{
		return 1;
};

FUNC VOID Info_Mine_Org_6_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_Mine_15_00"); //Co siê dzieje w kopalni?
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_01"); //W kopalni? Kto tam siedzi - ju¿ nie wyjdzie. Kto nie siedzi - nie wejdzie.
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_02"); //Ciesz siê, ¿e ciê tam nie ma.
	
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
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_01"); //Mi nikt nie rozkazuje, ale trzeba wiedzieæ, jak do tego dojœæ.
	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_01"); //A ja ty to osi¹gn¹³eœ?
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_02"); //Tajemnica zawodowa. Ale miêdzy nami mówi¹c - dla Szkodnika to ¿aden problem.
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
	description = "Nie wygl¹dasz mi na kogoœ, kto by siê przepracowywa³.";
};                       

FUNC INT Info_Mine_Org_6_DieLage_Condition()
{
		return 1;
};

FUNC VOID Info_Mine_Org_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_DieLage_15_00"); //Nie wygl¹dasz mi na kogoœ, kto by siê przepracowywa³.
 	AI_Output(self,other,"Info_Mine_Org_6_DieLage_06_01"); //Ja, pracowaæ? Jakby mi siê chcia³o pracowaæ, nie trafi³bym pod Barierê, kapujesz?
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
