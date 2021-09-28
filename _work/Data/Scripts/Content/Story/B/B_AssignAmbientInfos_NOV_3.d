// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Nov_3_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Nov_3 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Nov_3_EXIT_Condition;
	information	= Info_Nov_3_EXIT_Info;
	permanent	= 1;
	description = "FINE";
};                       

FUNC INT Info_Nov_3_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_3_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Nov_3_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Nov_3_EinerVonEuchWerden_Condition;
	information	= Info_Nov_3_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Come faccio a unirmi a questo campo?";
};                       

FUNC INT Info_Nov_3_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Nov_3_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Nov_3_EinerVonEuchWerden_15_00"); //Come faccio a unirmi a questo campo?
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_01"); //È semplice. Fallo e basta.
	AI_Output(self,other,"Info_Nov_3_EinerVonEuchWerden_03_02"); //Parla coi guru, ti faranno da guida!
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Nov_3_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Nov_3_WichtigePersonen_Condition;
	information	= Info_Nov_3_WichtigePersonen_Info;
	permanent	= 1;
	description = "Chi è il capo, qui?";
};                       

FUNC INT Info_Nov_3_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_3_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Nov_3_WichtigePersonen_15_00"); //Chi è il capo, qui?
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_01"); //Y'Berion, che il Dormiente sia lodato, ci ha condotti in questo luogo sacro.
	AI_Output(self,other,"Info_Nov_3_WichtigePersonen_03_02"); //Tutto questo è stato creato dalle sue visioni.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Nov_3_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Nov_3_DasLager_Condition;
	information	= Info_Nov_3_DasLager_Info;
	permanent	= 1;
	description = "Quali luoghi devo conoscere?";
};                       

FUNC INT Info_Nov_3_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_3_DasLager_Info()
{
	AI_Output(other,self,"Info_Nov_3_DasLager_15_00"); //C'è un luogo importante che devo visitare?
	AI_Output(self,other,"Info_Nov_3_DasLager_03_01"); //Vai da Fortuno. Fornisce l'erba di palude a tutti i seguaci della Setta.
	AI_Output(self,other,"Info_Nov_3_DasLager_03_02"); //Lo troverai sotto il laboratorio alchemico di Cor Kalom.
	
	var C_NPC CorKalom;		CorKalom= Hlp_GetNpc(Gur_1201_CorKalom);
	CorKalom.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Nov_3_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Nov_3_DieLage_Condition;
	information	= Info_Nov_3_DieLage_Info;
	permanent	= 1;
	description = "Come va?";
};                       

FUNC INT Info_Nov_3_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Nov_3_DieLage_Info()
{
	AI_Output(other,self,"Info_Nov_3_DieLage_15_00"); //Come va?
	AI_Output(self,other,"Info_Nov_3_DieLage_03_01"); //Una favola, amico!
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Nov_3(var c_NPC slf)
{
	B_AssignFindNpc_ST(slf);
	
	Info_Nov_3_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Nov_3_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Nov_3_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Nov_3_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Nov_3_DieLage.npc				= Hlp_GetInstanceID(slf);
};
