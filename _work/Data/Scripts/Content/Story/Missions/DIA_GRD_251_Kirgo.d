// **************************************************
//						 EXIT 
// **************************************************

instance Info_Kirgo_Exit (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 999;
	condition		= Info_Kirgo_Exit_Condition;
	information		= Info_Kirgo_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Kirgo_Exit_Condition()
{
	return 1;
};

func VOID Info_Kirgo_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_Kirgo_What(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_What_Condition;
	information		= Info_Kirgo_What_Info;
	permanent		= 0;
	description 	= "Salve! Sono nuovo di qui.";
};                       

FUNC INT Info_Kirgo_What_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
func VOID Info_Kirgo_What_Info()
{
	AI_Output (other, self,"Info_Kirgo_What_15_00"); //Salve! Sono nuovo di qui.
	AI_Output (self, other,"Info_Kirgo_What_05_01"); //Davvero? Parlami del mondo esterno! È più di un mese che non ricevo notizie!
	AI_Output (self, other,"Info_Kirgo_What_05_02"); //Io sono Kirgo e combatto nell'arena.
};

// **************************************************
//				Bit du gut
// **************************************************

instance Info_Kirgo_Good (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Good_Condition;
	information		= Info_Kirgo_Good_Info;
	permanent		= 0;
	description 	= "Sei bravo? A combattere, ovviamente.";
};                       

FUNC INT Info_Kirgo_Good_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_What))
	{
		return 1;
	};
};

func VOID Info_Kirgo_Good_Info()
{
	AI_Output (other, self,"Info_Kirgo_Good_15_00"); //Sei bravo?
	AI_Output (self, other,"Info_Kirgo_Good_05_01"); //A combattere? Non ho molta esperienza, ma ho già vinto un incontro!
};

// **************************************
//				Fordern (Vorspiel)
// **************************************

instance Info_Kirgo_Charge(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_Charge_Condition;
	information		= Info_Kirgo_Charge_Info;
	permanent		= 0;
	description 	= "Mi piacerebbe combattere contro di te nell'arena!";
};                       

FUNC INT Info_Kirgo_Charge_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Scatty_JoinOC) && Npc_KnowsInfo (hero,Info_Kirgo_What) && (Kapitel <= 1))	// Kapitelfix   ***Björn***
	{
		return 1;
	};
};

func VOID Info_Kirgo_Charge_Info()
{
	AI_Output (other, self,"Info_Kirgo_Charge_15_00"); //Mi piacerebbe combattere contro di te nell'arena!
	AI_Output (self, other,"Info_Kirgo_Charge_05_01"); //Cosa? No, non voglio! Perché invece non beviamo una birra e mi parli del mondo esterno?
	Info_ClearChoices	(Info_Kirgo_Charge );
	Info_AddChoice		(Info_Kirgo_Charge,"No, voglio combattere. Ora!",Info_Kirgo_Charge_NOW);
	Info_AddChoice		(Info_Kirgo_Charge,"OK, dammi una birra allora!",Info_Kirgo_Charge_Beer);
};

func void Info_Kirgo_Charge_NOW()
{
	AI_Output (other, self,"Info_Kirgo_Charge_NOW_15_00"); //No, voglio combattere. Ora!
	AI_Output (self, other,"Info_Kirgo_Charge_NOW_05_01"); //In questo caso... Sono pronto.
	Info_ClearChoices	(Info_Kirgo_Charge );
};

func void Info_Kirgo_Charge_Beer()
{
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_00"); //Bene, dammi una birra!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_01"); //Ecco!
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_02"); //Grazie! Temo di non poterti dire molto sul mondo esterno: sono stato rinchiuso in un una cella oscura per quasi due mesi, prima di essere gettato quaggiù.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_03"); //Che peccato... Beh, non fa nulla. Ehi! Ti sei mantenuto bene, per essere uno che è stato rinchiuso per due mesi.
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_04"); //E mi piacerebbe continuare così.
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_05"); //Allora perché insisti a voler combattere?
	AI_Output (other, self,"Info_Kirgo_Charge_Beer_15_06"); //Voglio farmi un nome nel campo!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_07"); //Vuoi dire presso Scatty? Uhm... Si tratta di uno degli uomini più influenti nell'Anello Esterno... Potresti impressionarlo favorevolmente, se riuscissi a battermi...
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_08"); //Ma se vuoi veramente fare colpo su di lui, devi riuscire a sconfiggere Kharim. L'unico problema è che temo sia troppo forte per te!
	AI_Output (self, other,"Info_Kirgo_Charge_Beer_05_09"); //Se vuoi ancora sfidarmi, fammelo sapere! Però non mi piacerebbe farti secco.
	
	CreateInvItem (other, ItFoBeer);
	B_GiveInvItems (other, self, ItFoBeer, 1);
	
	self.npctype = npctype_FRIEND;
	
	Info_ClearChoices	(Info_Kirgo_Charge );
};

// **************************************
//				Fordern REAL
// **************************************
	var int Kirgo_Charged;
// **************************************

instance Info_Kirgo_ChargeREAL(C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_ChargeREAL_Condition;
	information		= Info_Kirgo_ChargeREAL_Info;
	permanent		= 0;
	description 	= "Battiamoci! Sei pronto?";
};                       

FUNC INT Info_Kirgo_ChargeREAL_Condition()
{
	if (Npc_KnowsInfo (hero,Info_Kirgo_Charge) &&  (Kapitel <= 1))	//Kapitelfix	****Björn****
	{
		return 1;
	};
};

func VOID Info_Kirgo_ChargeREAL_Info()
{
	AI_Output (other, self,"Info_Kirgo_ChargeREAL_15_00"); //Battiamoci! Sei pronto?
	AI_Output (self, other,"Info_Kirgo_ChargeREAL_05_01"); //Seguimi!
	
	AI_StopProcessInfos	( self );
	
	Kirgo_Charged = TRUE;
	
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************
//				IN DER ARENA
// **************************************

instance Info_Kirgo_InArena (C_INFO)
{
	npc				= Grd_251_Kirgo;
	nr				= 1;
	condition		= Info_Kirgo_InArena_Condition;
	information		= Info_Kirgo_InArena_Info;
	permanent		= 0;
	important 		= 1;
};                       

FUNC INT Info_Kirgo_InArena_Condition()
{
	if ( (Kirgo_Charged == TRUE) && (Npc_GetDistToWp (hero,"OCR_ARENABATTLE_TRAIN") < 500) )
	{
		return 1;
	};
};

func VOID Info_Kirgo_InArena_Info()
{
	if (Kapitel <= 1)			//Fix für spätere Kapitel ****Björn****
	{
		AI_Output (self, other,"Info_Kirgo_InArena_05_00"); //Bene, cominciamo! Che vinca il migliore!
		
		AI_StopProcessInfos	( self );
			
		Npc_ExchangeRoutine(self,"START");
		
		Npc_SetTarget(self,other);
		AI_StartState(self,ZS_ATTACK,1,"");
	}
	else
	{
		AI_Output (self, other,"SVM_5_LetsForgetOurLittleFight"); //Dimentichiamo la nostra piccola discussione, va bene?		
		AI_StopProcessInfos	( self );
		Npc_ExchangeRoutine(self,"START");
	};

};


















