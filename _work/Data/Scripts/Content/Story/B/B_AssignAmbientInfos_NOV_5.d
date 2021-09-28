// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Nov_5_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Nov_5 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Nov_5_EXIT_Condition;
	information	= Info_Nov_5_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Nov_5_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Nov_5_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Nov_5_EinerVonEuchWerden_Condition;
	information	= Info_Nov_5_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Jak se mùžu pøidat k táboru?";
};                       

FUNC INT Info_Nov_5_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Nov_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_5_EinerVonEuchWerden_15_00"); //Jak se mùžu pøidat k táboru?
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_01"); //Není nic jednoduššího. Prostì øekneš pár mladým Guru. Pomùžou ti.
	AI_Output(self,other,"Info_Nov_5_EinerVonEuchWerden_05_02"); //Bude se ti tu líbit, uvidíš.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Nov_5_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Nov_5_WichtigePersonen_Condition;
	information	= Info_Nov_5_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo to tady vede?";
};                       

FUNC INT Info_Nov_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_5_WichtigePersonen_15_00"); //Kdo tady má velení?
	AI_Output(self,other,"Info_Nov_5_WichtigePersonen_05_01"); //Guru mají všechno pod kontrolou. Pokud ale na sebe nebudeš pøitahovat pozornost, nechají tì na pokoji
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Nov_5_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Nov_5_DasLager_Condition;
	information	= Info_Nov_5_DasLager_Info;
	permanent	= 1;
	description = "Co mi mùžeš øíci o táboøe?";
};                       

FUNC INT Info_Nov_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_DasLager_Info()
{
	AI_Output(other,self,"Info_Nov_5_DasLager_15_00"); //Co mi mùžeš øíci o táboru?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_01"); //Je to nejlepší místo v celé téhle proklaté kolonii.
	AI_Output(self,other,"Info_Nov_5_DasLager_05_02"); //Dokonce i když nebudeš vìøit Spáèovu uèení, dostaneš svùj denní pøídìl drogy z bažin. Všechno, co musíš udìlat, je øíci si Fortunovi.
	AI_Output(other,self,"Info_Nov_5_DasLager_15_03"); //Kde ho najdu?
	AI_Output(self,other,"Info_Nov_5_DasLager_05_04"); //Dole pod dílnou Cora Kaloma, kousek od velkého templáøského dvora.
	
	var C_NPC CorKalom;		CorKalom = Hlp_GetNpc(Gur_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Nov_5_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Nov_5_DieLage_Condition;
	information	= Info_Nov_5_DieLage_Info;
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_Nov_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_5_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_5_DieLage_15_00"); //Jak to jde?
	AI_Output(self,other,"Info_Nov_5_DieLage_05_01"); //Nemùžu si stìžovat. Ty jsi tady nový?
	AI_Output(other,self,"Info_Nov_5_DieLage_15_02"); //Jen jsem právì pøišel.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Nov_5(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);
	
	Info_Nov_5_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Nov_5_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Nov_5_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Nov_5_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Nov_5_DieLage.npc				= Hlp_GetInstanceID(slf);
};
