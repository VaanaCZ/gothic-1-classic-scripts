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
	description = "KONEC";
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
	description = "ÿekni mi nÏco o t·bo¯e.";
};                       

FUNC INT Info_Mine_Org_7_Mine_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_7_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_Mine_15_00"); //ÿekni mi nÏco o t·bo¯e.
	AI_Output(self,other,"Info_Mine_Org_7_Mine_07_01"); //T·bor? MyslÌö tu Kotlinu. Ale nenÌ to tak zlÈ, v·ûnÏ. ruda¯i shromaûÔujÌ rudu, ûold·ci drûÌ str·û a my, banditÈ, je m·me pod kontrolou.
	
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
	description = "Kdo to tady m· na starosti?";
};                       

FUNC INT Info_Mine_Org_7_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_WichtigePersonen_15_00"); //Kdo to m· pak na starosti?
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_01"); //To z·leûÌ na tom, od koho p¯ijÌm·ö rozkazy.
	AI_Output(self,other,"Info_Mine_Org_7_WichtigePersonen_07_02"); //Aù je to jak chce, pokud Okyl nÏco chce, nemÏl bys nic namÌtat. Dok·ûe b˝t pÏknÏ nep¯Ìjemn˝, kdyû se naötve.
	
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
	description = "Jak to jde?";
};                       

FUNC INT Info_Mine_Org_7_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_7_DieLage_15_00"); //Jak se m·ö?
	AI_Output(self,other,"Info_Mine_Org_7_DieLage_07_01"); //Chlape, hrajeö mi na nervy!
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
