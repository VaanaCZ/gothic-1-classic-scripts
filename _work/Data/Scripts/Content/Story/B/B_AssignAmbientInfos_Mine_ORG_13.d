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
	description = "FIN";
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
	description = "Dit-moi quelque chose sur ce camp.";
};                       

FUNC INT Info_Mine_Org_13_Mine_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_Mine_15_00"); //Dit-moi quelque chose sur ce camp.
	AI_Output(self,other,"Info_Mine_Org_13_Mine_13_01"); //Ce trou dans la roche nous permet de sortir. Une fois que nous aurons assez de minerai, nous pourrons oublier le Vieux Camp.
	
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
	description = "Qui donne les ordres ici ?";
};                       

FUNC INT Info_Mine_Org_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_WichtigePersonen_15_00"); //Qui donne les ordres ici ?
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_01"); //Okyl appelle le responsable.
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_02"); //Mais il nous laisse généralement les bandits.
	
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
	description = "Tu te sens bien ?";
};                       

FUNC INT Info_Mine_Org_13_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_DieLage_15_00"); //Tu te sens bien ?
	AI_Output(self,other,"Info_Mine_Org_13_DieLage_13_01");//Pas pire qu'hier.
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
