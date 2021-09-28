// **************************************
//					EXIT 
// **************************************

instance  DIA_Skip_Exit (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  999;
	condition	=  DIA_Skip_Exit_Condition;
	information	=  DIA_Skip_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Skip_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Skip_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				First
// **************************************
	var int Skip_TradeFree;
// **************************************

instance  DIA_Skip_First (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  1;
	condition	=  DIA_Skip_First_Condition;
	information	=  DIA_Skip_First_Info;
	permanent	=  0;
	description = "Cosa stai facendo?";
};                       

FUNC int  DIA_Skip_First_Condition()
{
	if ( !( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) ) )
	{	
		return 1;
	};
};

FUNC VOID  DIA_Skip_First_Info()
{
	AI_Output (other, self,"DIA_Skip_First_15_00"); //Tu cosa fai qui?
	AI_Output (self, other,"DIA_Skip_First_12_01"); //Mi occupo delle armi delle guardie
	AI_Output (other, self,"DIA_Skip_First_15_02"); //Vendi armi?
	AI_Output (self, other,"DIA_Skip_First_12_03"); //Solo a Gomez e ai suoi uomini.

	if	!Npc_KnowsInfo(hero, DIA_Raven_Equipment)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"Skip, la guardia che si trova presso il cortile posteriore, vende ARMI. Ma solo agli uomini di Gomez.");
	};
	
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"La prendo. Ci vediamo.",DIA_Skip_First_BACK);
	Info_Addchoice 		(DIA_Skip_First,"Mi manda Thorus. Ha detto che devo prendermi un'arma.",DIA_Skip_First_Thorus);
	Info_Addchoice 		(DIA_Skip_First,"Mi manda Gomez. Ha detto che devi darmi un po' d'equipaggiamento.",DIA_Skip_First_Gomez);
		
};

func void DIA_Skip_First_Gomez()
{
	AI_Output (other, self,"DIA_Skip_First_Gomez_15_00"); //Sono stato inviato da Gomez. Ha detto che devi equipaggiarmi.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_01"); //Il solito, vero? Un'armatura nuova e la migliore arma che ho in magazzino.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_02"); //Vattene subito o te la vedrai con me!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_15_00"); //Mi manda Thorus. Ha detto che devo prendermi un'arma.
	AI_Output (self, other,"DIA_Skip_First_Thorus_12_01"); //Oh?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Perché non vai a chiederglielo?",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"Ha detto di prenderti a calci nel sedere finché non mi avrai dato un'arma.",DIA_Skip_First_Thorus_KickAss);
	Info_Addchoice 		(DIA_Skip_First,"Vuole che io faccia una cosa che nessuno di voi può fare, capisci?",DIA_Skip_First_Thorus_Stranger);
};

func void DIA_Skip_First_BACK()
{
	AI_Output (other, self,"DIA_Skip_First_BACK_15_00"); //La prendo. Ci vediamo.
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};
//------------------------------------------------------
func void DIA_Skip_First_Thorus_Stranger()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_Stranger_15_00"); //Vuole che io faccia una cosa che nessuno di voi può fare, capisci?
	AI_Output (self, other,"DIA_Skip_First_Thorus_Stranger_12_01"); //Ah sì? E suppongo che non abbia niente di meglio da fare che inviarti da me, giusto?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Perché non vai a chiederglielo?",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"Ha detto di prenderti a calci nel sedere finché non mi avrai dato un'arma.",DIA_Skip_First_Thorus_KickAssAGAIN);
};

func void DIA_Skip_First_Thorus_KickAss()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAss_15_00"); //Ha detto di prenderti a calci nel sedere finché non mi avrai dato un'arma.
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAss_12_01"); //Davvero? Per come la vedo, sarò IO a prendere a calci il TUO sedere se non te ne andrai subito!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_AskHim()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_AskHim_15_00"); //Perché non vai a chiederglielo?
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_01"); //Puoi scommetterci che lo farò, ma non ora. Scommetto che troverà molto interessanti le storie che racconti sul suo conto.
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_02"); //Non so chi t'abbia fatto entrare, ma farai meglio a squagliartela in fretta!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_KickAssAGAIN()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00"); //Ha detto di prenderti a calci nel sedere finché non mi avrai dato un'arma.
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAssAGAIN_12_01"); //Va bene, cosa vuoi?
	Info_ClearChoices 	(DIA_Skip_First);
	Skip_TradeFree = TRUE;
};

// **************************************
//			VERPATZT
// **************************************

instance  DIA_Skip_VERPATZT (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  1;
	condition	=  DIA_Skip_VERPATZT_Condition;
	information	=  DIA_Skip_VERPATZT_Info;
	permanent	=  1;
	description = "Pensavo di tornare a chiederti quell'equipaggiamento...";
};                       

FUNC int  DIA_Skip_VERPATZT_Condition()
{
	if 	( 
		( !( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) ) )
		&& ( (Npc_KnowsInfo(hero,DIA_Skip_First)) && (Skip_TradeFree == FALSE) ) 
		)
	{	
		return 1;
	};
};

FUNC VOID  DIA_Skip_VERPATZT_Info()
{
	AI_Output (other, self,"DIA_Skip_VERPATZT_15_00"); //Pensavo di tornare a chiederti quell'equipaggiamento...
	AI_Output (self, other,"DIA_Skip_VERPATZT_12_01"); //Sparisci!
};

/*------------------------------------------------------------------------
							Waffenhandel								
------------------------------------------------------------------------*/

instance  GRD_211_Skip_TRADE (C_INFO)
{
	npc				= GRD_211_Skip;
	condition		= GRD_211_Skip_TRADE_Condition;
	information		= GRD_211_Skip_TRADE_Info;
	permanent		= 1;
	description		= "Mi serve qualche oggetto."; 
	trade 			= 1;
};

FUNC int  GRD_211_Skip_TRADE_Condition()
{
	if ( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) 
			||	(Skip_TradeFree == TRUE) )
	{
		return TRUE;
	};
};


FUNC void  GRD_211_Skip_TRADE_Info()
{
	AI_Output (other, self,"GRD_211_Skip_TRADE_Info_15_01"); //Mi serve qualche oggetto.
	AI_Output (self, other,"GRD_211_Skip_TRADE_Info_12_02"); //Posso venderti qualcosa.
};  

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_211_Skip_WELCOME (C_INFO)
{
	npc				= GRD_211_Skip;
	condition		= GRD_211_Skip_WELCOME_Condition;
	information		= GRD_211_Skip_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_211_Skip_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_211_Skip_WELCOME_Info()
{
	AI_Output (self, other,"GRD_211_Skip_WELCOME_Info_12_01"); //Ehi! Hai fatto molta strada, considerando che sei qui da poco!
};
