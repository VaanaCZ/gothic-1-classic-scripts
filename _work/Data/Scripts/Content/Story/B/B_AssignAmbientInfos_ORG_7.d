// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Org_7_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Org_7 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Org_7_EXIT_Condition;
	information	= Info_Org_7_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Org_7_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Org_7_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Org_7_EinerVonEuchWerden_Condition;
	information	= Info_Org_7_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "W jaki sposób mogę dołączyć do Obozu?";
};                       

FUNC INT Info_Org_7_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_7_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_00"); //W jaki sposób mogę dołączyć do Obozu?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_01"); //Możesz się przyłączyć do naszej bandy. Ale najpierw musisz udowodnić, że nie trzymasz z Gomezem.
	AI_Output(other,self,"Info_Org_7_EinerVonEuchWerden_15_02"); //Jak mam to zrobić?
	AI_Output(self,other,"Info_Org_7_EinerVonEuchWerden_07_03"); //Na twoim miejscu spróbowałbym zabrać coś bardzo ważnego ze Starego Obozu albo ze Starej Kopalni, i przyniósłbym to Laresowi.
	var C_NPC Lares;		Lares	= Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Org_7_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Org_7_WichtigePersonen_Condition;
	information	= Info_Org_7_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kto wami dowodzi?";
};                       

FUNC INT Info_Org_7_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Org_7_WichtigePersonen_15_00"); //Kto wami dowodzi?
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_01"); //Hersztem bandy jest Lares. Większość z nas uznaje jego zwierzchność.
	AI_Output(self,other,"Info_Org_7_WichtigePersonen_07_02"); //Ale on nie mówi nam, co mamy robić.
	var C_NPC Lares;		Lares	= Hlp_GetNpc(Org_801_Lares);
	Lares.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Org_7_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Org_7_DasLager_Condition;
	information	= Info_Org_7_DasLager_Info;
	permanent	= 1;
	description = "Co możesz mi opowiedzieć o tym obozie?";
};                       

FUNC INT Info_Org_7_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_DasLager_Info()
{
	AI_Output(other,self,"Info_Org_7_DasLager_15_00"); //Co możesz mi opowiedzieć o tym obozie?
	AI_Output(self,other,"Info_Org_7_DasLager_07_01"); //To taka "społeczność z przymusu", jeśli wiesz, co mam na myśli. Każdy robi tu to, co chce, ale jest nas na tyle dużo, że Gomez boi się wydać nam walną bitwę.
	AI_Output(self,other,"Info_Org_7_DasLager_07_02"); //Chociaż głowę dam, że bardzo by chciał.
	AI_Output(other,self,"Info_Org_7_DasLager_15_03"); //Jak wyglądają wasze stosunki z Gomezem?
	AI_Output(self,other,"Info_Org_7_DasLager_07_04"); //Okradamy go!
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Org_7_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Org_7_DieLage_Condition;
	information	= Info_Org_7_DieLage_Info;
	permanent	= 1;
	description = "Co się tutaj dzieje?";
};                       

FUNC INT Info_Org_7_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Org_7_DieLage_Info()
{
	AI_Output(other,self,"Info_Org_7_DieLage_15_00"); //Co się tutaj dzieje?
	AI_Output(self,other,"Info_Org_7_DieLage_07_01"); //Jesteś tu od niedawna, co?
	AI_Output(self,other,"Info_Org_7_DieLage_07_02"); //Magowie od dłuższego czasu przygotowywali się do wysadzenia kopca rudy w powietrze. Teraz mówią, że są już prawie gotowi.
	AI_Output(self,other,"Info_Org_7_DieLage_07_03"); //Sądząc po wielkiej hałdzie, którą usypały Krety, wygląda na to, że tym razem nie żartują.
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

INSTANCE Info_Org_7_Krautprobe (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_Org_7_Krautprobe_Condition;
	information	= Info_Org_7_Krautprobe_Info;
	permanent	= 1;
	description = "Chcesz trochę bagiennego ziela?";
};                       

FUNC INT Info_Org_7_Krautprobe_Condition()
{
	if	((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID Info_Org_7_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Org_7_Krautprobe_15_00"); //Chcesz trochę bagiennego ziela?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_01"); //Dam ci za nie 10 bryłek rudy - proszę.
		AI_Output(self,other,"Info_Org_7_Krautprobe_07_02"); //Jak będziesz miał jeszcze trochę na zbyciu, zajrzyj do mnie koniecznie.
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
	}
	else
	{
		AI_Output (self, other,"Info_Org_7_Krautprobe_No_Joint_07_00"); //Gdzie? Nie widzę żadnego ziela.
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Org_7(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);
	
	Info_Org_7_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Org_7_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Org_7_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Org_7_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Org_7_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Org_7_Krautprobe.npc			= Hlp_GetInstanceID(slf);
};
