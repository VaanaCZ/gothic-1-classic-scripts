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
	description = "ЗАКОНЧИТЬ";
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
	description = "Расскажи мне об этом Лагере.";
};                       

FUNC INT Info_Mine_Org_13_Mine_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_Mine_15_00"); //Расскажи мне что-нибудь об этом Лагере.
	AI_Output(self,other,"Info_Mine_Org_13_Mine_13_01"); //Эта дыра в скале выведет нас отсюда. Как только у нас будет достаточно руды, мы сможем забыть про Старый Лагерь.
	
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
	description = "Кто здесь командует?";
};                       

FUNC INT Info_Mine_Org_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_WichtigePersonen_15_00"); //Кто здесь командует?
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_01"); //Окил.
	AI_Output(self,other,"Info_Mine_Org_13_WichtigePersonen_13_02"); //Но нас, воров, он обычно не трогает.
	
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
	description = "Все в порядке?";
};                       

FUNC INT Info_Mine_Org_13_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Org_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Org_13_DieLage_15_00"); //Все в порядке?
	AI_Output(self,other,"Info_Mine_Org_13_DieLage_13_01");//Не хуже, чем вчера.
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
