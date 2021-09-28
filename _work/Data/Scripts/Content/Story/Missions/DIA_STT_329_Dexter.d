// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dexter_Exit (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 999;
	condition	= DIA_Dexter_Exit_Condition;
	information	= DIA_Dexter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dexter_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begrüssung
// **************************************************

INSTANCE DIA_Dexter_First (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_First_Condition;
	information	= DIA_Dexter_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Dexter_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_First_Info()
{
	AI_Output (self,other,"DIA_Dexter_IAmNew_10_00"); //Ehi, tu! Vendo erba di palude e pozioni della Setta. Vuoi qualcosa?
};

// **************************************************
// 					Kraut
// **************************************************

INSTANCE DIA_Dexter_Kraut (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_Kraut_Condition;
	information	= DIA_Dexter_Kraut_Info;
	permanent	= 0;
	description	= "Cos'è l'erba di palude?";
};                       

FUNC INT DIA_Dexter_Kraut_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Kraut_Info()
{
	AI_Output (other,self,"DIA_Dexter_Kraut_15_00"); //Cos'è l'erba di palude?
	AI_Output (self,other,"DIA_Dexter_Kraut_10_01"); //Sei nuovo, vero? Si fuma. Noi la troviamo molto rilassante.
};

// **************************************************
// 					TRADE
// **************************************************

// **************************************************

INSTANCE DIA_Dexter_Trade (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_Trade_Condition;
	information	= DIA_Dexter_Trade_Info;
	permanent	= 1;
	description	= "Mostrami la merce.";
	Trade		= 1;
};                       

FUNC INT DIA_Dexter_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Trade_Info()
{
	AI_Output (other,self,"DIA_Dexter_Trade_15_00"); //Mostrami la merce.
	AI_Output (self,other,"DIA_Dexter_Trade_10_01"); //Ho la roba migliore...
	
	if	(Dexter_Traded == FALSE)
	{
		Log_CreateTopic(GE_TraderOC, LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Dexter l'Ombra commercia in erba di palude e POZIONI della Setta.");
	
		Dexter_Traded = TRUE;
	};
};

// **************************************************
// 					JOIN OC
// **************************************************
	var int Dexter_GetKalomsRecipe;
// **************************************************

INSTANCE DIA_Dexter_JoinOC (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_JoinOC_Condition;
	information	= DIA_Dexter_JoinOC_Info;
	permanent	= 0;
	description	= "Voglio entrare a far parte del campo e diventare un'Ombra?";
};                       

FUNC INT DIA_Dexter_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Dexter_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_00"); //Voglio entrare a far parte del campo e diventare un'Ombra.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_01"); //Oh? Cerchi un'opportunità per dimostrare il tuo valore?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_02"); //Bene. Puoi farmi un favore. Se ti comporterai bene, parlerò di te con Diego.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_03"); //Di che si tratta?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_04"); //Nella Setta c'è un uomo di nome Cor Kalom. Si tratta di un pezzo grosso: uno dei guru.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_05"); //Kalom è un alchimista e possiede la ricetta di una pozione di guarigione.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_06"); //Vorrei acquistare la ricetta, così potrei iniziare a produrla per conto mio.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_07"); //Ma nessuno riesce ad avvicinarsi a Kalom.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_08"); //Cosa ti aspetti che faccia?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_09"); //I pazzi della Setta cercano sempre nuovi adepti. Tu sei nuovo. Fai finta di voler essere reclutato.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_10"); //Kalom è uno dei guru, quindi controlla i nuovi candidati. Entra in contatto con lui e cerca di ottenere la ricetta.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_11"); //Non m'interessa se la paghi o no.

	Info_ClearChoices(DIA_Dexter_JoinOC);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Va bene. Vedrò cosa posso fare.",DIA_Dexter_JoinOC_Ok);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Sembra un lavoro difficile. Quale sarà la mia ricompensa?",DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Ok_15_00"); //Va bene. Vedrò cosa posso fare.
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, l'Ombra che si trova al mercato, mi ha chiesto di andare alla Setta e farmi consegnare una ricetta dal guru Cor Kalom.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter mi ha detto che, se voglio entrare, devo fingere di essere un amico della Setta.");
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch()	
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_HowMuch_15_00"); //Sembra un lavoro difficile. Quale sarà la mia ricompensa?
	AI_Output (self,other,"DIA_Dexter_JoinOC_HowMuch_10_01"); //Prima o poi, Diego mi chiederà se ti reputo adatto a far parte del nostro campo. Indovina da cosa dipenderà la mia risposta.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Forse dovrò pagare per la ricetta. Dammi un anticipo di 50 pezzi di metallo.",DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Advance_15_00"); //Forse dovrò pagare per la ricetta. Dammi un anticipo di 50 pezzi di metallo.
	AI_Output (self,other,"DIA_Dexter_JoinOC_Advance_10_01"); //Scordatelo.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Niente metallo, niente ricetta!",DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Threat_15_00"); //Niente metallo, niente ricetta!
	AI_Output (self,other,"DIA_Dexter_JoinOC_Threat_10_01"); //Va bene! Ne riparleremo quando mi avrai portato la ricetta.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"No! Voglio vedere il metallo subito, altrimenti vai a prendertela da solo.",DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00"); //No! Voglio vedere il metallo subito, altrimenti vai a prendertela da solo.
	AI_Output (self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01"); //Ci sono altri nuovi arrivati, penso dovrei affidare questo compito a uno di loro...
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"D'accordo, lasciamo stare.",DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00"); //D'accordo, lasciamo stare.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01"); //Non così in fretta! Volevo solo vedere fino a che punto ti saresti spinto... 50 pezzi di metallo sono molti per un nuovo arrivato, non credi?
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02"); //Così va meglio.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03"); //D'accordo. Ho giusto 50 pezzi da parte. Non deludermi, ragazzo!
	
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, l'Ombra che si trova al mercato, mi ha chiesto di andare alla Setta e farmi consegnare una ricetta dal guru Cor Kalom.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter mi ha detto che, se voglio entrare, devo fingere di essere un amico della Setta.");
	
	CreateInvItems(self, itminugget, 50);
	B_GiveInvItems(self, other, itminugget, 50);
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

// **************************************************
// 					Where ST
// **************************************************
var int Dexter_PsiCamp;
// **************************************************

INSTANCE DIA_Dexter_WhereST (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_WhereST_Condition;
	information	= DIA_Dexter_WhereST_Info;
	permanent	= 1;
	description	= "Dove si trova la Setta?";
};                       

FUNC INT DIA_Dexter_WhereST_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_WhereST_Info()
{
	AI_Output (other,self,"DIA_Dexter_WhereST_15_00"); //Dove si trova la Setta?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_01"); //Esci dal campo attraverso la porta a sud, quindi dirigiti a est. Ti servirà una mappa...
	
	if (Npc_HasItems(self,ItWrWorldmap) >0)														//Björn
		{																						//Björn
			AI_Output (self,other,"DIA_Dexter_WhereST_10_02"); //Ne ho una che costa 50 pezzi di metallo...
		};																						//Björn
	
	AI_Output (other,self,"DIA_Dexter_WhereST_15_02"); //La porta a sud sarebbe la torre crollata, vero?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_03"); //Esattamente.
	
	if	!Dexter_PsiCamp
	{
		B_LogEntry    (CH1_KalomsRecipe,"Il campo della Setta si trova a est di Campo Vecchio.");
		Dexter_PsiCamp = TRUE;
	};
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Dexter_KalomsRecipeSuccess (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_KalomsRecipeSuccess_Condition;
	information	= DIA_Dexter_KalomsRecipeSuccess_Info;
	permanent	= 1;
	description	= "Ho la ricetta che cercavi!";
};                       

FUNC INT DIA_Dexter_KalomsRecipeSuccess_Condition()
{
	if ( (Dexter_GetKalomsRecipe == LOG_RUNNING) && (Npc_HasItems (other, KalomsRecipe) > 0) )
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_KalomsRecipeSuccess_Info()
{
	AI_Output (other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00"); //Ho la ricetta che cercavi!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01"); //Molto bene! Mostramela!
	
	B_UseFakeScroll();
	
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02"); //Ottimo! Ora posso iniziare a produrre le pozioni da solo.
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03"); //Sui un brav'uomo! Lo dirò a Diego!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //Ecco! Prendi questo per il tuo sforzo...
	
	CreateInvItems (other,itminugget,50);
	
	B_GiveInvItems (other, self, KalomsRecipe, 1);
	
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter è rimasto favorevolmente colpito. Sono sicuro che parlerà bene di me con Diego.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter è rimasto favorevolmente colpito. Purtroppo, non mi servirà a nulla: non posso più diventare un'Ombra.");
	};
	B_GiveXP (XP_DexterKalom);
};

