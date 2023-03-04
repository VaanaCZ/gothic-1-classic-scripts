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
	description = "Que fais-tu ici ?";
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
	AI_Output (other, self,"DIA_Skip_First_15_00"); //Que fais-tu ici ?
	AI_Output (self, other,"DIA_Skip_First_12_01"); //J'entretiens les armes des gardes
	AI_Output (other, self,"DIA_Skip_First_15_02"); //Tu as des armes à vendre?
	AI_Output (self, other,"DIA_Skip_First_12_03"); //Seulement à Gomez et à ses hommes.

	if	!Npc_KnowsInfo(hero, DIA_Raven_Equipment)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"Le garde Skip dans la cours arrière vend des ARMES. Mais seulement aux hommes de Gomez.");
	};
	
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"J'ai compris. Au revoir.",DIA_Skip_First_BACK);
	Info_Addchoice 		(DIA_Skip_First,"Thorus m'envoie. Il m'a dit de prendre une arme.",DIA_Skip_First_Thorus);
	Info_Addchoice 		(DIA_Skip_First,"Gomez m'envoie. Il a dit que tu m'équiperais.",DIA_Skip_First_Gomez);
		
};

func void DIA_Skip_First_Gomez()
{
	AI_Output (other, self,"DIA_Skip_First_Gomez_15_00"); //Gomez m'envoie. Il a dit que tu m'équiperais.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_01"); //Comme d'habitude, hein ? Une nouvelle armure et la meilleure arme que j'ai en stock.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_02"); //Sors-d'ici, avant que je me fâche !
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_15_00"); //Thorus m'envoie. Il m'a dit de prendre une arme.
	AI_Output (self, other,"DIA_Skip_First_Thorus_12_01"); //Oh?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Pourquoi tu ne vas pas lui demander ?",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"Il a dit qu'il te donnera un bon coup de pied au cul jusqu'à ce que tu me donnes une arme.",DIA_Skip_First_Thorus_KickAss);
	Info_Addchoice 		(DIA_Skip_First,"Il m'a demandé de faire quelque chose que vous ne pouvez pas faire, tu vois ?",DIA_Skip_First_Thorus_Stranger);
};

func void DIA_Skip_First_BACK()
{
	AI_Output (other, self,"DIA_Skip_First_BACK_15_00"); //J'ai compris. Au revoir.
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};
//------------------------------------------------------
func void DIA_Skip_First_Thorus_Stranger()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_Stranger_15_00"); //Il m'a demandé de faire quelque chose que vous ne pouvez pas faire, tu vois ?
	AI_Output (self, other,"DIA_Skip_First_Thorus_Stranger_12_01"); //Ouais ? Et je suppose qu'il n'a rien de mieux à faire que de t'envoyer à moi, c'est ça?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Pourquoi tu ne vas pas lui demander ?",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"Il a dit qu'il te donnera un bon coup de pied au cul jusqu'à ce que tu me donnes une arme.",DIA_Skip_First_Thorus_KickAssAGAIN);
};

func void DIA_Skip_First_Thorus_KickAss()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAss_15_00"); //Il a dit de te flanquer un grand coup-de-pied dans le haut-de-chausse, à moins que tu me donnes une arme
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAss_12_01"); //Ah oui ? Ce que je vois, à moins que tu ne sortes d'ici rapidement, c'est que c'est toi qui va recevoir ce coup de pied!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_AskHim()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_AskHim_15_00"); //Pourquoi tu ne vas pas lui demander ?
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_01"); //Tu as parié que je le ferais. Mais pas maintenant. Moi je parie plutôt qu'il sera intéressé de connaître les histoires que tu racontes à son sujet.
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_02"); //Je ne sais pas qui t'a enfermé ici, mais tu ferais mieux de prendre le chemin le plus court pour sortir de là !
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_KickAssAGAIN()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00"); //Il a dit de te flanquer un grand coup-de-pied dans le haut-de-chausse, à moins que tu me donnes une arme
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAssAGAIN_12_01"); //D'accord l'ami, qu'est-ce que tu veux?
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
	description = "J'ai juste pensé revenir et parler de l'équipement...";
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
	AI_Output (other, self,"DIA_Skip_VERPATZT_15_00"); //J'ai juste pensé revenir et parler de l'équipement...
	AI_Output (self, other,"DIA_Skip_VERPATZT_12_01"); //Dégage !
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
	description		= "Je pourrais le faire avec le matériel."; 
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
	AI_Output (other, self,"GRD_211_Skip_TRADE_Info_15_01"); //Je pourrais le faire avec le matériel.
	AI_Output (self, other,"GRD_211_Skip_TRADE_Info_12_02"); //Je pourrais te vendre des choses.
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
	AI_Output (self, other,"GRD_211_Skip_WELCOME_Info_12_01"); //Hé, tu es sacrément en avance, pour quelqu'un qui vient d'arriver.
};
