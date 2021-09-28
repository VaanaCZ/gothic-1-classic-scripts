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
	description = "FIN";
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
	description = "Háblame de este campamento.";
};                       

FUNC INT Info_Mine_Org_7_Mine_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_7_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_Mine_15_00"); //Háblame de este campamento.
	AI_Output(self,other,"Info_Mine_Org_7_Mine_07_01"); //¿El campamento? Te refieres a la Hondonada. Tampoco es tan malo. Los raspadores extraen mineral, los mercenarios montan guardia y los bandidos lo mantenemos todo bajo control.
	
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
	description = "¿Quién está al mando?";
};                       

FUNC INT Info_Mine_Org_7_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_WichtigePersonen_15_00"); //¿Quién está al mando?
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_01"); //Depende de quién sea el que te da las órdenes.
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_02"); //En cualquier caso, si Okyl quiere algo, será mejor que no pongas objeciones. Puede volverse muy peligroso si se cabrea.
	
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
	description = "¿Qué tal estás?";
};                       

FUNC INT Info_Mine_Org_7_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_DieLage_15_00"); //¿Qué tal estás?
	AI_Output(self,other,"Info_Mine_Org_7_DieLage_07_01"); //¡Tío, me estás crispando los nervios!
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
