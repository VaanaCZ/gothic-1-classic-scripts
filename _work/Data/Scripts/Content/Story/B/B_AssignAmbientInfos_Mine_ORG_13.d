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
	description = "KONEC";
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
	description = "�ekni mi n�co o t�bo�e.";
};                       

FUNC INT Info_Mine_Org_13_Mine_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_Mine_15_00"); //�ekni mi n�co o t�bo�e.
	AI_Output(self,other,"Info_Mine_Org_13_Mine_13_01"); //Ta d�ra ve sk�le n�s odsud dostane. Jakmile budeme m�t dost rudy, m��e n�m b�t Star� t�bor ukraden�.
	
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
	description = "Kdo tady d�v� rozkazy?";
};                       

FUNC INT Info_Mine_Org_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_WichtigePersonen_15_00"); //Kdo tady d�v� rozkazy?
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_01"); //Okyl to tady vede.
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_02"); //N�s bandity ale obvykle nech�v� na pokoji.
	
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
	description = "Jsi v po��dku?";
};                       

FUNC INT Info_Mine_Org_13_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_DieLage_15_00"); //Jsi  v po��dku?
	AI_Output(self,other,"Info_Mine_Org_13_DieLage_13_01");//V�era bylo h��.
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
