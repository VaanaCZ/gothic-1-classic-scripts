// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Org_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Org_13_EXIT_Condition;
	information	= Info_Mine_Org_13_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Mine_Org_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Mine
// *************************************************************************

INSTANCE Info_Mine_Org_13_Mine (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Org_13_Mine_Condition;
	information	= Info_Mine_Org_13_Mine_Info;
	permanent	= 1;
	description = "Opowiedz mi coœ o tym obozie.";
};                       

FUNC INT Info_Mine_Org_13_Mine_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_Mine_15_00"); //Opowiedz mi coœ o tym obozie.
	AI_Output(self,other,"Info_Mine_Org_13_Mine_13_01"); //Ta dziura w ziemi pomo¿e nam siê st¹d wydostaæ. Jak tylko uzbieramy doœæ rudy, bêdziemy mieli gdzieœ Stary Obóz.
	
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Org_13_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_Mine_Org_13_WichtigePersonen_Condition;
	information	= Info_Mine_Org_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu rz¹dzi?";
};                       

FUNC INT Info_Mine_Org_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_WichtigePersonen_15_00"); //Kto tu rz¹dzi?
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_01"); //Okyl jest tu szefem.
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_02"); //Ale zwykle zostawia Szkodniki w spokoju.
	
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Org_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Org_13_DieLage_Condition;
	information	= Info_Mine_Org_13_DieLage_Info;
	permanent	= 1;
	description = "Dobrze siê czujesz?";
};                       

FUNC INT Info_Mine_Org_13_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_DieLage_15_00"); //Dobrze siê czujesz?
	AI_Output(self,other,"Info_Mine_Org_13_DieLage_13_01");//Nie gorzej ni¿ wczoraj.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Org_13(var c_NPC slf)
{
	
	
	Info_Mine_Org_13_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Org_13_Mine.npc	= Hlp_GetInstanceID(slf);
	Info_Mine_Org_13_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Org_13_DieLage.npc				= Hlp_GetInstanceID(slf);
};
