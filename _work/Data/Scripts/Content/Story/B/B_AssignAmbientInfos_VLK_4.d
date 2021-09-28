// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_4_EXIT_Condition;
	information	= Info_Vlk_4_EXIT_Info;
	permanent	= 1;
	description = "FINE";
};                       

FUNC INT Info_Vlk_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_EXIT_Info()
{	
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00"); //Grazie, buona fortuna.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01"); //Coraggio, ragazzo.
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_4_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_4_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_4_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Cosa devo fare per unirmi a questo campo?";
};                       

FUNC INT Info_Vlk_4_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_4_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01"); //Cosa devo fare per unirmi a questo campo?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04"); //Come Ombra o come guardia? Non sarà facile, amico. Dovrai superare alcune prove, prima che il vecchio Thorus ti permetta di vedere Gomez.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02"); //E dovrai risultare simpatico alla gente di qui. In ogni caso, finché non scegli un campo nessuno ti prenderà sul serio.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03"); //Se fossi in te, andrei a scambiare due parole con qualche Ombra. Forse troverai qualcuno disposto ad aiutarti, se hai qualcosa da offrire in cambio.
	
	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_4_WichtigePersonen_Condition;
	information	= Info_Vlk_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "C'è qualcosa che dovrei sapere?";
};                       

FUNC INT Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00"); //C'è qualcosa che dovrei sapere?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01"); //Essendo nuovo, farai meglio a non far innervosire Gravo. È solo un minatore, ma sa come trattare coi baroni delle miniere.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02"); //Se ti metti nei guai col branco di Gomez, lui può aiutarti.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_4_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_4_DasLager_Condition;
	information	= Info_Vlk_4_DasLager_Info;
	permanent	= 1;
	description = "Quali luoghi devo conoscere?";
};                       

FUNC INT Info_Vlk_4_DasLager_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00"); //Quali luoghi devo conoscere?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01"); //A meno che non ti piaccia lavorare nelle miniere, farai bene a girare fra il cancello a nord e l'entrata del castello.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02"); //Se sarai fortunato, Thorus o Diego potranno affidarti un compito, in questo modo, potrai riuscire a farti prendere in simpatia.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03"); //Oppure potresti incontrare un mago. A volte, chiedono alla gente di compiere delle commissioni per conto loro (e pagano bene).
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04"); //I maghi escono dal castello? Quando?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05"); //Che ne so! Chiedi alla gente che vive lì.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_4_DieLage_Condition;
	information	= Info_Vlk_4_DieLage_Info;
	permanent	= 1;
	description = "Come va?";
};                       

FUNC INT Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00"); //Come va?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01"); //Esattamente come 20 anni fa. Da allora non è cambiato molto.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_4(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_4_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_4_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_4_DieLage.npc				= Hlp_GetInstanceID(slf);
};
