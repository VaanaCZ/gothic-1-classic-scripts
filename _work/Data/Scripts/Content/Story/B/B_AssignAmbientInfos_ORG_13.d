// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Org_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Org_13_EXIT_Condition;
	information	= Info_Org_13_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Org_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Org_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Org_13_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Org_13_EinerVonEuchWerden_Condition;
	information	= Info_Org_13_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Co muszę zrobić, żeby dołączyć do waszego Obozu?";
};                       

FUNC INT Info_Org_13_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Org_13_EinerVonEuchWerden_15_00"); //Co muszę zrobić, żeby dołączyć do waszego Obozu?
	AI_Output(self,other,"Info_Org_13_EinerVonEuchWerden_13_01"); //Wyjdź na pole i pomóż przy zbieraniu ryżu.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Org_13_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Org_13_WichtigePersonen_Condition;
	information	= Info_Org_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto tu dowodzi?";
};                       

FUNC INT Info_Org_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Org_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Org_13_WichtigePersonen_15_00"); //Kto tu dowodzi?
	AI_Output(self,other,"Info_Org_13_WichtigePersonen_13_01"); //Lee jest szefem Najemników, jeśli o to ci chodzi. Ale JA nie jestem Najemnikiem, więc niech mnie szlag, jeśli pozwolę mu sobą pomiatać!
	var C_NPC Lee;			Lee		= Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Org_13_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Org_13_DasLager_Condition;
	information	= Info_Org_13_DasLager_Info;
	permanent	= 1;
	description = "Chciałbym się dowiedzieć więcej o waszym Obozie.";
};                       

FUNC INT Info_Org_13_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Org_13_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_13_DasLager_15_00"); //Chciałbym się dowiedzieć czegoś więcej o waszym Obozie.
	AI_Output(self,other,"Info_Org_13_DasLager_13_01"); //Najlepiej wejdź do środka i po prostu rozejrzyj się! Tak długo jak nie jesteś jednym z ludzi Gomeza, nikt cię nie będzie zaczepiał.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Org_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Org_13_DieLage_Condition;
	information	= Info_Org_13_DieLage_Info;
	permanent	= 1;
	description = "Co słychać?";
};                       

FUNC INT Info_Org_13_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Org_13_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_13_DieLage_15_00"); //Co słychać?
	AI_Output(self,other,"Info_Org_13_DieLage_13_01"); //A czego chcesz?
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

INSTANCE Info_Org_13_Krautprobe (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_Org_13_Krautprobe_Condition;
	information	= Info_Org_13_Krautprobe_Info;
	permanent	= 1;
	description = "Wyglądasz mi na kogoś, komu przydałoby się trochę ziela.";
};                       

FUNC INT Info_Org_13_Krautprobe_Condition()
{
	if	((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_13_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_13_Krautprobe_15_00"); //Wyglądasz mi na kogoś, komu przydałoby się trochę bagiennego ziela.
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_01"); //A masz je przy sobie? Dam ci 10 bryłek rudy!
		AI_Output(self,other,"Info_Org_13_Krautprobe_13_02"); //Wracaj, kiedy tylko zechcesz, Bracie!
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output (self, other,"Info_Org_13_Krautprobe_No_Joint_13_00"); //Ale ty wcale nie masz ziela! Przestań mnie wkurzać!
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Org_13(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);
	
	Info_Org_13_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_Org_13_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Org_13_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_Org_13_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_Org_13_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Org_13_Krautprobe.npc			= Hlp_GetInstanceID(slf);
};
