// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_grd_13_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_grd_13 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_grd_13_EXIT_Condition;
	information	= Info_grd_13_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_grd_13_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_grd_13_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_grd_13_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_13_EinerVonEuchWerden_Condition;
	information	= Info_grd_13_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Voglio diventare una guardia.";
};                       

FUNC INT Info_grd_13_EinerVonEuchWerden_Condition()
{
	if	(Npc_GetTrueGuild(other) != GIL_GRD)
	&&	(Npc_GetTrueGuild(other) != GIL_KDF)
	&&  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_grd_13_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_grd_13_EinerVonEuchWerden_15_00"); //Voglio entrare a far parte delle guardie.
	AI_Output(self,other,"Info_grd_13_EinerVonEuchWerden_13_01"); //Hai molta strada da fare, ragazzo!
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_grd_13_WichtigePersonen(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_13_WichtigePersonen_Condition;
	information	= Info_grd_13_WichtigePersonen_Info;
	permanent	= 1;
	description = "Chi comanda qui?";
};                       

FUNC INT Info_grd_13_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_grd_13_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_grd_13_WichtigePersonen_15_00"); //Chi comanda, qui?
	AI_Output(self,other,"Info_grd_13_WichtigePersonen_13_01"); //Io. Farai meglio a stare attento a ciò che dici!
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_grd_13_DasLager(C_INFO)
{
	nr			= 1;
	condition	= Info_grd_13_DasLager_Condition;
	information	= Info_grd_13_DasLager_Info;
	permanent	= 1;
	description = "Come arrivo al castello?";
};                       

FUNC INT Info_grd_13_DasLager_Condition()
{
	if (Kapitel == 1) 
	{
	return 1;
	};
};

FUNC VOID Info_grd_13_DasLager_Info()
{
	AI_Output(other,self,"Info_grd_13_DasLager_15_00"); //Come arrivo al castello?
	AI_Output(self,other,"Info_grd_13_DasLager_13_01"); //Non ci arrivi. Solo la gente di Gomez è autorizzata ad accedervi.
	Info_ClearChoices(Info_grd_13_DasLager);
	Info_AddChoice(Info_grd_13_DasLager,"Capisco.", Info_grd_13_DasLager_Verstehe);
	Info_AddChoice(Info_grd_13_DasLager,"Posso corrompere le guardie?", Info_grd_13_DasLager_WachenBestechen);
	Info_AddChoice(Info_grd_13_DasLager,"Come faccio a parlare con Gomez?", Info_grd_13_DasLager_GomezSprechen);
};

FUNC VOID Info_grd_13_DasLager_Verstehe()
{
	AI_Output(other,self,"Info_grd_13_DasLager_Verstehe_15_00"); //Capisco.
	Info_ClearChoices(Info_grd_13_DasLager);
};

FUNC VOID Info_grd_13_DasLager_WachenBestechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_00"); //Posso corrompere le guardie?
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_01"); //Hai sangue freddo, ragazzo. Forse puoi persuaderle a guardare dall'altra parte per un minuto, se possiedi metallo a sufficienza.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_02"); //Ma se Gomez si accorge che ti hanno fatto passare, li getta nelle segrete!
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_03"); //Per questo motivo, chiudono un occhio solo per i più coraggiosi.
	AI_Output(self,other,"Info_grd_13_DasLager_WachenBestechen_13_04"); //Ma una volta dentro cosa pensi di fare? Tutti gli edifici sono strettamente sorvegliati!
	AI_Output(other,self,"Info_grd_13_DasLager_WachenBestechen_15_05"); //Sono solo curioso. Tutto qui.
};

FUNC VOID Info_grd_13_DasLager_GomezSprechen()
{
	AI_Output(other,self,"Info_grd_13_DasLager_GomezSprechen_15_00"); //Come faccio a parlare con Gomez?
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_01"); //A Gomez non interessano i novellini che devono ancora dimostrare il proprio valore.
	AI_Output(self,other,"Info_grd_13_DasLager_GomezSprechen_13_02"); //Se fai sul serio, posso parlare con Thorus.

	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_grd_13_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_grd_13_DieLage_Condition;
	information	= Info_grd_13_DieLage_Info;
	permanent	= 1;
	description = "Come va?";
};                       

FUNC INT Info_grd_13_DieLage_Condition()
{	
	if  (!C_NpcBelongsToNewCamp (other))
	&&  (!C_NpcBelongsToPsiCamp (other))
	{
		return 1;
	};
};
FUNC VOID Info_grd_13_DieLage_Info()
{
	AI_Output(other,self,"Info_grd_13_DieLage_15_00"); //Come va?
	AI_Output(self,other,"Info_grd_13_DieLage_13_01"); //Tutto tranquillo. Solo qualche rissa occasionale con il Campo Nuovo o con quei pazzi della Setta.
	AI_Output(self,other,"Info_grd_13_DieLage_13_02"); //Dato che sei nuovo, tutto questo non t'interessa. Ma quando sceglierai il campo al quale appartenere, ti ci ritroverai immerso fino al collo.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_grd_13(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_grd_13_EXIT.npc				= Hlp_GetInstanceID(slf);
	Info_grd_13_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_grd_13_WichtigePersonen.npc	= Hlp_GetInstanceID(slf);
	Info_grd_13_DasLager.npc			= Hlp_GetInstanceID(slf);
	Info_grd_13_DieLage.npc				= Hlp_GetInstanceID(slf);
};
