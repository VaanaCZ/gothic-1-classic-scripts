// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kharim_Exit (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 999;
	condition		= Info_Kharim_Exit_Condition;
	information		= Info_Kharim_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kharim_Exit_Condition()
{
	return 1;
};

func VOID Info_Kharim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kharim_What(C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_What_Condition;
	information		= Info_Kharim_What_Info;
	permanent		= 0;
	description 	= "Sono nuovo di qui. Tu chi sei?";
};                       

FUNC INT Info_Kharim_What_Condition()
{
	return 1;
};

func VOID Info_Kharim_What_Info()
{
	AI_Output (other, self,"Info_Kharim_What_15_00"); //Sono nuovo di qui. Tu chi sei?
	AI_Output (self, other,"Info_Kharim_What_09_01"); //Io sono Kharim! Devi essere arrivato proprio da poco, altrimenti avresti sentito parlare di me!
	AI_Output (self, other,"Info_Kharim_What_09_02"); //Sono il miglior combattente che questo dannato campo abbia mai conosciuto.
};

// **************************************
//				Fordern
// **************************************
	var int Kharim_Charged;
// **************************************

instance Info_Kharim_Charge(C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 2;
	condition		= Info_Kharim_Charge_Condition;
	information		= Info_Kharim_Charge_Info;
	permanent		= 1;
	description 	= "Ti sfido! Andiamo all'arena!";
};                       

FUNC INT Info_Kharim_Charge_Condition()
{
	if ( Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo(hero,Info_Kharim_What) && (Kharim_Charged != TRUE) && (Kapitel <= 1) ) // Kapitelfix ***Björn***
	{
		return 1;
	};
};

func VOID Info_Kharim_Charge_Info()
{
	AI_Output (other, self,"Info_Kharim_Charge_15_00"); //Ti sfido! Andiamo all'arena!
	AI_Output (self, other,"Info_Kharim_Charge_09_01"); //TU??? Ti mangerò per colazione, ragazzo!
	AI_Output (self, other,"Info_Kharim_Charge_09_02"); //Fatti un favore e sparisci!

	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"D'accordo, d'accordo. Lasciamo stare.",Info_Kharim_Charge_BACK);
	Info_AddChoice		(Info_Kharim_Charge,"Hai paura che ti faccia male, fifone?",Info_Kharim_Charge_Insult);

};

func void Info_Kharim_Charge_BACK()
{
	AI_Output (other, self,"Info_Kharim_Charge_BACK_15_00"); //D'accordo, d'accordo. Lasciamo stare.
	
	AI_StopProcessInfos (self);
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_15_00"); //Hai paura che ti faccia male, fifone?
	AI_Output (self, other,"Info_Kharim_Charge_Insult_09_01"); //Non hai altro da fare, ragazzo?
	
	Info_ClearChoices	(Info_Kharim_Charge );
	Info_AddChoice		(Info_Kharim_Charge,"Sei qui solo perché sei un lecchino di Gomez!",Info_Kharim_Charge_Insult_GomezAss);
	Info_AddChoice		(Info_Kharim_Charge,"Tua madre si fa i pastori!",Info_Kharim_Charge_Insult_Goats);
	Info_AddChoice		(Info_Kharim_Charge,"No, non riesco a pensare a nulla che tu possa comprendere.",Info_Kharim_Charge_Insult_Stupid);
	Info_AddChoice		(Info_Kharim_Charge,"Hai le braccia sottili, ma poi ho visto il tuo brutto muso.",Info_Kharim_Charge_Insult_Face);
	Info_AddChoice		(Info_Kharim_Charge,"D'accordo, d'accordo. Lasciamo stare.",Info_Kharim_Charge_BACK);
	
};

// --------------------------------------------------------------------------------------

func void Info_Kharim_Charge_Insult_Goats()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Goats_15_00"); //Tua madre se la intende coi pastori!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Goats_09_01"); //Sì, lo penso anch'io...
};

func void Info_Kharim_Charge_Insult_GomezAss()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_GomezAss_15_00"); //Sei qui solo perché sei un lecchino di Gomez!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_01"); //COSA? Brutto verme! Non sai nulla di noi! Campo Nuovo è INDIPENDENTE da tutta quella merda!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_02"); //A parte questo, c'è un solo motivo per cui mi trovo qui. Per rompere la testa dei furboni come te!
	AI_Output (self, other,"Info_Kharim_Charge_Insult_GomezAss_09_03"); //E sarà mio piacere fare lo stesso con TE! Il tuo destino ti attende nell'arena!
	
	Kharim_Charged = TRUE;
	
	Info_ClearChoices	(Info_Kharim_Charge );
	AI_StopProcessInfos	( self );
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

func void Info_Kharim_Charge_Insult_Stupid()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Stupid_15_00"); //Aspetta... No, non riesco a pensare a nulla che tu possa comprendere.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Stupid_09_01"); //Provaci comunque.
};

func void Info_Kharim_Charge_Insult_Face()
{
	AI_Output (other, self,"Info_Kharim_Charge_Insult_Face_15_00"); //Da principio volevo dire qualcosa sulle tue braccia sottili, ma poi ho visto il tuo brutto muso.
	AI_Output (self, other,"Info_Kharim_Charge_Insult_Face_09_01"); //Questa è la tua ultima possibilità per SPARIRE!
};

// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kharim_InArena (C_INFO)
{
	npc				= Sld_729_Kharim;
	nr				= 1;
	condition		= Info_Kharim_InArena_Condition;
	information		= Info_Kharim_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kharim_InArena_Condition()
{
	if ( (Kharim_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kharim_InArena_Info()
{
	if (Kapitel <= 1)				// Kapitelfix ***Björn***
	{
		AI_Output (self, other,"Info_Kharim_InArena_09_00"); //Il dolore dipende dalla forza di volontà!
		
		AI_StopProcessInfos	( self );
		
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_9_LetsForgetOurLittleFight"); //Che ne dici di dimenticare la nostra piccola discussione?	
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};
	
	
};
