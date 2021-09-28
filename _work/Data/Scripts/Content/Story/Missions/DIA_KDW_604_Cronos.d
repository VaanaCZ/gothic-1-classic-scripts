// ************************ EXIT **************************
instance  KDW_604_Cronos_Exit (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  999;	
	condition	=  KDW_604_Cronos_Exit_Condition;
	information	=  KDW_604_Cronos_Exit_Info;
	permanent	=  1;
	important	=  0;
	description = DIALOG_ENDE;
};                       

FUNC int  KDW_604_Cronos_Exit_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Exit_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneIceCube))
	{
	CreateInvItem (self, ItArRuneIceCube);
	};
	if (!Npc_HasItems (self,ItArRuneThunderbolt))
	{
	CreateInvItem (self, ItArRuneThunderbolt);
	};
};

/*
// *****************************************
//					Greet
// *****************************************

instance  KDW_604_Cronos_Greet (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  1;	
	condition	=  KDW_604_Cronos_Greet_Condition;
	information	=  KDW_604_Cronos_Greet_Info;
	permanent	=  0;
	description = "Ich grüße dich, Magier.";
};                       

FUNC int  KDW_604_Cronos_Greet_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Greet_Info()
{
	AI_Output (other, self,"DIA_Cronos_Greet_15_00"); //Ich grüße dich, Magier.
	AI_Output (self, other,"DIA_Cronos_Greet_08_01"); //Warum störst du den Hüter des Erzes?
};
*/

// *****************************************
//					Brief
// *****************************************

instance  KDW_604_Cronos_Brief (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  1;	
	condition	=  KDW_604_Cronos_Brief_Condition;
	information	=  KDW_604_Cronos_Brief_Info;
	permanent	=  0;
	description = "Ho una lettera per il Gran Mago del Circolo di Fuoco.";
};                       

FUNC int  KDW_604_Cronos_Brief_Condition()
{
	if	Npc_KnowsInfo(hero, KDW_604_Cronos_Greet)
	&&	(Npc_GetTrueGuild(hero) != GIL_STT)
	&&	(Npc_GetTrueGuild(hero) != GIL_KDF)
	&&	(hero.level < 10)
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Brief_Info()
{
	AI_Output (other, self,"DIA_Cronos_Brief_15_00"); //Ho una lettera per il Gran Mago del Circolo del Fuoco.
	AI_Output (self, other,"DIA_Cronos_Brief_08_01"); //Noi siamo i maghi del Circolo dell'Acqua. Il Circolo del Fuoco si trova a Campo Vecchio.
	AI_Output (other, self,"DIA_Cronos_Brief_15_02"); //Non riesco a entrare nel castello. Puoi aiutarmi?
	AI_Output (self, other,"DIA_Cronos_Brief_08_03"); //Beh, a volte inviamo dei messaggeri ai nostri fratelli di Campo Vecchio...
	AI_Output (self, other,"DIA_Cronos_Brief_08_04"); //Ma ci fidiamo solo degli uomini di Lares. Sono molti anni, oramai, che si occupa di far arrivare a destinazione i nostri messaggeri sani e salvi.
};

// *****************************************
//					Barrier
// *****************************************

instance  KDW_604_Cronos_Barrier (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  2;	
	condition	=  KDW_604_Cronos_Barrier_Condition;
	information	=  KDW_604_Cronos_Barrier_Info;
	permanent	=  0;
	description = "Esattamente, come avete intenzione di distruggere la Barriera?";
};                       

FUNC int  KDW_604_Cronos_Barrier_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Barrier_Info()
{
	AI_Output (other, self,"DIA_Cronos_Barrier_15_00"); //Esattamente, come avete intenzione di distruggere la Barriera?
	AI_Output (self, other,"DIA_Cronos_Barrier_08_01"); //Abbiamo bisogno di una gran quantità di metallo magico.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_02"); //Durante una cerimonia, sprigioneremo l'intero potere magico per distruggere la Barriera.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_03"); //Ovviamente una tale quantità di metallo attira ladri e balordi.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_04"); //Ecco perché abbiamo bisogno che qualcuno ci difenda.
};

// *****************************************
//					WannaJoin
// *****************************************

instance  KDW_604_Cronos_WannaJoin (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_WannaJoin_Condition;
	information	=  KDW_604_Cronos_WannaJoin_Info;
	permanent	=  0;
	description = "Voglio unirmi a voi!";
};                       

FUNC int  KDW_604_Cronos_WannaJoin_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Cronos_WannaJoin_15_00"); //Voglio unirmi a voi!
	AI_Output (self, other,"DIA_Cronos_WannaJoin_08_01"); //In questo caso devi parlare con Lee o Lares.
};

// *****************************************
//					WannaMage
// *****************************************

instance  KDW_604_Cronos_WannaMage (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_WannaMage_Condition;
	information	=  KDW_604_Cronos_WannaMage_Info;
	permanent	=  0;
	description = "Voglio diventare un mago!";
};                       

FUNC int  KDW_604_Cronos_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_WannaJoin))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_WannaMage_Info()
{
	AI_Output (other, self,"DIA_Cronos_WannaMage_15_00"); //Voglio diventare un mago!
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_01"); //Non possiamo permetterci che la nostra conoscenza cada in mano nemica.
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_02"); //Non prenderemo neppure in considerazione l'idea d'istruirti, se prima non avrai dimostrato la tua lealtà nei nostri confronti.
};

///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 2        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////

// *****************************************
//					Bandit --> Messenger
// *****************************************

instance  KDW_604_Cronos_Bandit (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  4;	
	condition	=  KDW_604_Cronos_Bandit_Condition;
	information	=  KDW_604_Cronos_Bandit_Info;
	permanent	=  0;
	description = "Ora sono uno degli uomini di Lares. Hai un messaggio per i Maghi del Fuoco?";
};                       

FUNC int  KDW_604_Cronos_Bandit_Condition()
{
	if ( (Npc_GetTrueGuild(hero)==GIL_ORG) || (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Bandit_Info()
{
	AI_Output (other, self,"DIA_Cronos_Bandit_15_00"); //Ora sono uno degli uomini di Lares. Hai un messaggio da farmi recapitare ai Maghi del Fuoco?
	AI_Output (self, other,"DIA_Cronos_Bandit_08_01"); //In effetti, sì. Ma dovrai portare addosso il simbolo dei nostri messaggeri, altrimenti Gomez non ti permetterà d'entrare nel castello.
	AI_Output (self, other,"DIA_Cronos_Bandit_08_02"); //Ecco la lettera e il simbolo. Ora vai e sbrigati!
	
	CreateInvItem (other,KdW_Amulett);
	CreateInvItem (other,Cronos_Brief);
	
	Cronos_Messenger = LOG_RUNNING;
};

// *****************************************
//					BriefBack
// *****************************************

instance  KDW_604_Cronos_BriefBack (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_BriefBack_Condition;
	information	=  KDW_604_Cronos_BriefBack_Info;
	permanent	=  0;
	description = "Ho recapitato il messaggio!";
};                       

FUNC int  KDW_604_Cronos_BriefBack_Condition()
{
	if (Cronos_Messenger == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_BriefBack_Info()
{
	AI_Output (other, self,"DIA_Cronos_BriefBack_15_00"); //Ho recapitato il messaggio!
	AI_Output (self, other,"DIA_Cronos_BriefBack_08_01"); //Ah, bene! Ecco una piccola ricompensa per i tuoi sforzi...
	
	CreateInvItems (self,itminugget, 200);
	B_GiveInvItems (self, other, itminugget, 200);
	
	B_GiveXP(XP_CronosLetter);
};

///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 3        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////


//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Cronos_NEWS (C_INFO)
{
	npc			= KDW_604_Cronos;
	condition	= Info_Cronos_NEWS_Condition;
	information	= Info_Cronos_NEWS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Porto un importante messaggio per Saturas!";
};

FUNC INT Info_Cronos_NEWS_Condition()
{	
	if	(CorAngar_SendToNC==TRUE)
	&&	!Npc_KnowsInfo(hero, Info_Cronos_SLEEPER)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_NEWS_Info()
{
	AI_Output			(other, self,"Info_Cronos_NEWS_15_01"); //Porto un importante messaggio per Saturas!
	AI_Output			(self, other,"Info_Cronos_NEWS_08_02"); //Cosa può essere tanto importante da meritare di disturbare gli studi del nostro capo spirituale?
};

//***************************************************************************
//	Info KALOM
//***************************************************************************
instance Info_Cronos_KALOM (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 10;
	condition	= Info_Cronos_KALOM_Condition;
	information	= Info_Cronos_KALOM_Info;
	permanent	= 0;
	important 	= 0;
	description = "Cor Kalom ha abbandonato la Fratellanza.";
};

FUNC INT Info_Cronos_KALOM_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS) && !Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_KALOM_Info()
{
	AI_Output			(other, self,"Info_Cronos_KALOM_15_01"); //Cor Kalom ha abbandonato la Fratellanza insieme ad alcuni templari invasati!
	AI_Output			(other, self,"Info_Cronos_KALOM_15_02"); //Vuole trovare il Dormiente e svegliarlo ad ogni costo.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_03"); //Non mi sono mai fidato di lui. Nonostante sia il secondo guru, è superbo, insidioso e capace di qualsiasi cosa.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_04"); //La Fratellanza starà meglio senza di lui!
	AI_Output			(self, other,"Info_Cronos_KALOM_08_05"); //Riferirò il messaggio a Saturas non appena mi sarà possibile. Ora vattene!

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Cronos_YBERION (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 20;
	condition	= Info_Cronos_YBERION_Condition;
	information	= Info_Cronos_YBERION_Info;
	permanent	= 0;
	important 	= 0;
	description = "Y'Berion, capo della Setta, è morto!";
};

FUNC INT Info_Cronos_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS) && !Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_YBERION_Info()
{
	AI_Output			(other, self,"Info_Cronos_YBERION_15_01"); //Y'Berion, capo della Setta, è morto!
	AI_Output			(self, other,"Info_Cronos_YBERION_08_02"); //COSAAA??? Come è potuto accadere?
	AI_Output			(other, self,"Info_Cronos_YBERION_15_03"); //La Fratellanza ha eseguito un rito per evocare il proprio dio.
	AI_Output			(other, self,"Info_Cronos_YBERION_15_04"); //Sembra che lo sforzo mentale sia stato troppo per Y'Berion.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_05"); //Tutto ciò è molto triste. Y'Berion era un alleato affidabile.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_06"); //Ma non è un motivo sufficiente a interrompere gli studi di Saturas.

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SLEEPER
//***************************************************************************
instance Info_Cronos_SLEEPER (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_SLEEPER_Condition;
	information	= Info_Cronos_SLEEPER_Info;
	permanent	= 0;
	important 	= 0;
	description = "I guru hanno capito che stano pregando un demone malvagio!";
};

FUNC INT Info_Cronos_SLEEPER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_SLEEPER_Info()
{
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_01"); //I guru hanno capito che stano pregando un demone malvagio!
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_02"); //Tutto a un tratto ora pensano che il Dormiente sia un demone?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_03"); //Sembrerebbe un'altra stramberia della Fratellanza, però...
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_04"); //...potrebbero aver ragione... Allora tutti noi che viviamo nella colonia saremmo in grave pericolo.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_05"); //Devi riferirlo subito a Saturas. Deciderà lui cosa fare.
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_06"); //Dove si trova Saturas?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_07"); //Vai al livello superiore e dì alle guardie che hai il mio permesso per passare.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_08"); //La parola d'ordine è TETRIANDOCH.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_09"); //Saturas si trova vicino al pentacolo.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_10"); //Passa lì quasi tutto il suo tempo, studiando il modo per far esplodere il cumulo di metallo.

	B_LogEntry			(CH3_EscapePlanNC,"Cronos mi ha accordato il permesso di far visita a Saturas, al livello superiore. Di solito, il Gran Mago del Circolo dell'Acqua si trova al pentacolo. La parola d'ordine per le guardie è... Maledizione! Qual era?");

	B_GiveXP			(XP_GetCronosPermission);

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info PAROLE
//***************************************************************************
instance Info_Cronos_PAROLE (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_PAROLE_Condition;
	information	= Info_Cronos_PAROLE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Puoi ripetermi la parola d'ordine?";
};

FUNC INT Info_Cronos_PAROLE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_SLEEPER) && !Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_PAROLE_Info()
{
	AI_Output			(other, self,"Info_Cronos_PAROLE_15_01"); //Puoi ripetermi la parola d'ordine?
	AI_Output			(self, other,"Info_Cronos_PAROLE_08_02"); //Sei più rimbambito di mia nonna! È 'TETRIANDOCH'.
};

//***************************************************************************
//	Info REWARD
//***************************************************************************
instance Info_Cronos_REWARD (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_REWARD_Condition;
	information	= Info_Cronos_REWARD_Info;
	permanent	= 0;
	important 	= 0;
	description = "Saturas ha detto che hai una ricompensa per me.";
};

FUNC INT Info_Cronos_REWARD_Condition()
{	
	if (Saturas_BringFoci == 5)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_REWARD_Info()
{
	AI_Output			(other, self,"Info_Cronos_REWARD_15_01"); //Saturas ha detto che hai una ricompensa per me.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_02"); //In qualità di custode del metallo, ho pensato di dartene una piccola parte come ringraziamento per i tuoi servizi.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_03"); //Spero che tu ne faccia buon uso!

	B_LogEntry		(CH3_BringFoci,"Cronos mi ha dato un mucchio di metallo. Nulla che possa minimamente scalfire il gigantesco cumulo, comunque.");
	if	Npc_KnowsInfo(hero, Info_Riordian_REWARD)
	{
		Log_SetTopicStatus	(CH3_BringFoci,	LOG_SUCCESS);
	};
	
	CreateInvItems		(self, ItMiNugget,	1000);
	B_GiveInvItems (self, hero, ItMiNugget,	1000);
};
/*------------------------------------------------------------------------
//						NACH DER WEIHE							//
------------------------------------------------------------------------*/
instance KDW_604_Cronos_WELCOME (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_WELCOME_Condition;
	information		= KDW_604_Cronos_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_604_Cronos_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};
};
func void  KDW_604_Cronos_WELCOME_Info()
{
	AI_Output			(self, other,"KDW_604_Cronos_WELCOME_Info_08_01"); //La tua decisione di unirti ai Maghi dell'Acqua è stata saggia. Benvenuto, fratello!
	AI_StopProcessInfos	( self );  
};
//--------------------------------------------------------------------------
// 							MANA KAUFEN
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  KDW_604_Cronos_MANA (C_INFO)
{
	npc				= KDW_604_Cronos;
	nr				= 800;
	condition		= KDW_604_Cronos_MANA_Condition;
	information		= KDW_604_Cronos_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Ho bisogno di più potere magico."; 
};

FUNC int  KDW_604_Cronos_MANA_Condition()
{	
	if	(Npc_KnowsInfo (hero,KDW_604_Cronos_GREET))
	&&	((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Cronos_MANA_Info()
{
	AI_Output			(other, self,"KDW_604_Cronos_MANA_Info_15_01"); //Ho bisogno di più potere magico.
	AI_Output			(self, other,"KDW_604_Cronos_MANA_Info_08_02"); //Posso aiutarti, ma usa saggiamente il tuo nuovo potere.
	
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);
};  
func void KDW_604_Cronos_MANA_BACK()
{
	Info_ClearChoices	(KDW_604_Cronos_MANA);
};

func void KDW_604_Cronos_MANA_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);

};

func void KDW_604_Cronos_MANA_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);

};
//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  KDW_604_Cronos_SELLSTUFF (C_INFO)
{
	npc				= KDW_604_Cronos;
	nr				= 900;
	condition		= KDW_604_Cronos_SELLSTUFF_Condition;
	information		= KDW_604_Cronos_SELLSTUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  KDW_604_Cronos_SELLSTUFF_Condition()
{	
	if	(Npc_KnowsInfo (hero,KDW_604_Cronos_GREET))
	&&	((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Cronos_SELLSTUFF_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_SELLSTUFF_Info_15_01"); //Voglio acquistare degli scritti magici.
	
};  
/*------------------------------------------------------------------------
						BEGRÜSSUNG						
------------------------------------------------------------------------*/

instance  KDW_604_Cronos_GREET (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_GREET_Condition;
	information		= KDW_604_Cronos_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Salute a te, mago!"; 
};

FUNC int  KDW_604_Cronos_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_604_Cronos_GREET_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_GREET_Info_15_01"); //Salute a te, mago!
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_02"); //Che la benedizione di Adanos scenda su di te! Posso aiutarti ad aumentare il tuo potere magico o darti qualche oggetto utile.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_03"); //Cosa posso fare per te?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry (GE_TraderNC,"Cronos vende oggetti magici, come RUNE, INCATESIMI e ANELLI. Lo troverò giorno e notte presso la griglia sopra il cumulo di metallo."); 
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry (GE_TeacherNC,"Cronos può aiutarmi ad aumentare il MANA. Lo troverò giorno e notte presso la griglia sopra il cumulo di metallo.");
};
