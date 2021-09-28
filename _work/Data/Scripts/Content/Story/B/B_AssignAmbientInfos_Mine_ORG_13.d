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
	description = "FINE";
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
	description = "Parlami di questo campo.";
};                       

FUNC INT Info_Mine_Org_13_Mine_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_Mine_15_00"); //Parlami di questo campo.
	AI_Output(self,other,"Info_Mine_Org_13_Mine_13_01"); //Questo buco nella roccia ci permetterà di andarcene. Quando avremo metallo sufficiente, lasceremo per sempre Campo Vecchio.
	
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
	description = "Chi dà gli ordini, qui?";
};                       

FUNC INT Info_Mine_Org_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_WichtigePersonen_15_00"); //Chi dà gli ordini, qui?
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_01"); //Okyl è il capo.
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_02"); //Ma di solito lascia in pace noi ladri.
	
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
	description = "Tutto bene?";
};                       

FUNC INT Info_Mine_Org_13_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_DieLage_15_00"); //Come va?
	AI_Output(self,other,"Info_Mine_Org_13_DieLage_13_01");//Non peggio di ieri.
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
