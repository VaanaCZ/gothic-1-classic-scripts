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
	description = "KONEC";
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
	description = "Co se v tom dole dìje?";
};                       

FUNC INT Info_Mine_Org_6_Mine_Condition()
{
		return 1;
};

FUNC VOID Info_Mine_Org_6_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_Mine_15_00"); //Co se v tom dole dìje?
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_01"); //V tom dole? Chlapi tam zùstávají. Nikdo nechodí dovnitø, nikdo ven.
	AI_Output(self,other,"Info_Mine_Org_6_Mine_06_02"); //Mìl bys být rád, že jsi venku.
	
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
	description = "Kdo tady dává rozkazy?";
};                       

FUNC INT Info_Mine_Org_6_WichtigePersonen_Condition()
{
		return 1;
};

FUNC VOID Info_Mine_Org_6_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_00"); //Kdo tady dává rozkazy?
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_01"); //Nikdo mi nedává rozkazy, ale musíš vìdìt, jak si to zaøídit.
	AI_Output(other,self,"Info_Mine_Org_6_WichtigePersonen_15_01"); //A jak se to zaøídí?
	AI_Output(self,other,"Info_Mine_Org_6_WichtigePersonen_06_02"); //To je staré tajemství! Ale mezi náma, pro banditu to není nic tìžkého.
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
	description = "Nevypadáš, že bys byl právì pøepracovaný.";
};                       

FUNC INT Info_Mine_Org_6_DieLage_Condition()
{
		return 1;
};

FUNC VOID Info_Mine_Org_6_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_6_DieLage_15_00"); //Nevypadáš, že bys byl právì pøepracovaný.
 	AI_Output(self,other,"Info_Mine_Org_6_DieLage_06_01"); //Já a práce?! Pokud já jsem pracoval, pak to nebylo v Paláci, jestli mi rozumíš.
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
