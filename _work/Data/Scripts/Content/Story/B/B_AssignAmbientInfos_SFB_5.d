// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									Vor Gespräch
// *************************************************************************

INSTANCE Info_SFB_5_Pre(C_INFO)
{
	nr			= 1;
	condition	= Info_SFB_5_Pre_Condition;
	information	= Info_SFB_5_Pre_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_SFB_5_Pre_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_Pre_Info()
{	
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_00"); //Salve!
};

// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_SFB_5_EXIT(C_INFO)
{
	
	nr			= 999;
	condition	= Info_SFB_5_EXIT_Condition;
	information	= Info_SFB_5_EXIT_Info;
	permanent	= 1;
	description = "FINE";
};                       

FUNC INT Info_SFB_5_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_SFB_5_EinerVonEuchWerden (C_INFO) 
{
	nr			= 4;
	condition	= Info_SFB_5_EinerVonEuchWerden_Condition;
	information	= Info_SFB_5_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "E se volessi unirmi a voi?";
};                       

FUNC INT Info_SFB_5_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_SFB_5_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_00"); //E se volessi unirmi a voi?
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_01"); //Unirti a noi? E come? Trasportando l'acqua?
	AI_Output(other,self,"Info_SFB_5_EinerVonEuchWerden_15_02"); //No, come minatore.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_03"); //Ascoltami bene: nessuno VUOLE diventare un minatore.
	AI_Output(self,other,"Info_SFB_5_EinerVonEuchWerden_02_04"); //Ovviamente, se proprio insisti... Vai a parlarne con Swiney: sicuramente ha da parte un piccone per te.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_SFB_5_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_SFB_5_WichtigePersonen_Condition;
	information	= Info_SFB_5_WichtigePersonen_Info;
	permanent	= 1;
	description = "Chi è il pezzo grosso, qui?";
};                       

FUNC INT Info_SFB_5_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_SFB_5_WichtigePersonen_15_00"); //Chi è il pezzo grosso, qui?
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_01"); //Il pezzo grosso? Io, ovviamente!
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_02"); //Ma immagino che tu voglia sapere chi comanda.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_03"); //Beh, penso farai meglio a parlare coi mercenari o i ladri. Non avvicinarti neppure ai Maghi dell'Acqua.
	AI_Output(self,other,"Info_SFB_5_WichtigePersonen_02_04"); //Quel culone di Swiney si crede più importante di quanto non sia in realtà: il suo lavoro consiste nel consegnare i picconi ed eseguire gli ordini di Okyl.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_SFB_5_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_SFB_5_DasLager_Condition;
	information	= Info_SFB_5_DasLager_Info;
	permanent	= 1;
	description = "Cosa offre il campo?";
};                       

FUNC INT Info_SFB_5_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DasLager_Info()
{
	AI_Output(other,self,"Info_SFB_5_DasLager_15_00"); //Cosa offre il campo?
	AI_Output(self,other,"Info_SFB_5_DasLager_02_01"); //Quello che riesci a trarne: per alcuni, nient'altro che lavoro, per altri, un sacco di divertimento.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_SFB_5_DieLage(C_INFO) 
{
	nr			= 1;
	condition	= Info_SFB_5_DieLage_Condition;
	information	= Info_SFB_5_DieLage_Info;
	permanent	= 1;
	description = "Come va la vita?";
};                       

FUNC INT Info_SFB_5_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_SFB_5_DieLage_Info()
{
	AI_Output(other,self,"Info_SFB_5_DieLage_15_00"); //Com'è la vita, qui?
	AI_Output(self,other,"Info_SFB_5_DieLage_02_01"); //Ottima!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_02"); //E siccome siamo tanto felici di stare qui, cerchiamo in ogni modo di andarcene!
	AI_Output(self,other,"Info_SFB_5_DieLage_02_03"); //Come pensi che possa essere? È una prigione! E a nessuno piace vivere in prigione.
	
};	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_SFB_5(var c_NPC slf)
{

	Info_SFB_5_Pre.npc					= Hlp_GetInstanceID(slf);
	
	Info_SFB_5_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_SFB_5_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_SFB_5_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_SFB_5_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_SFB_5_DieLage.npc				= Hlp_GetInstanceID(slf);
};
