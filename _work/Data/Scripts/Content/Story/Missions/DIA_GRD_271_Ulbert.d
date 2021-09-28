// ************************ EXIT **************************

instance  GRD_271_ULBERT_Exit (C_INFO)
{
	npc			=  GRD_271_ULBERT;
	nr			=  999;
	condition	=  GRD_271_ULBERT_Exit_Condition;
	information	=  GRD_271_ULBERT_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  GRD_271_ULBERT_Exit_Condition()
{
	return 1;
};

FUNC VOID  GRD_271_ULBERT_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************** Infos *****************************
instance  GRD_271_ULBERT_KEY (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_KEY_Condition;
	information		= GRD_271_ULBERT_KEY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Cosa c'è nel magazzino?"; 
};

FUNC int  GRD_271_ULBERT_KEY_Condition()
{
	return 1;
};


FUNC void  GRD_271_ULBERT_KEY_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_KEY_Info_15_01"); //Cosa c'è nel magazzino?
	AI_Output			(self, other,"GRD_271_ULBERT_KEY_Info_07_02"); //Non sono affari tuoi.
};  
// ***************** Infos *****************************

instance  GRD_271_ULBERT_TRICK (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_TRICK_Condition;
	information		= GRD_271_ULBERT_TRICK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Stare in piedi per così tanto tempo deve averti messo una gran sete."; 
};

FUNC int  GRD_271_ULBERT_TRICK_Condition()
{
	if (Npc_KnowsInfo(hero, GRD_271_ULBERT_KEY))
	{	
		return 1;
	};
};


FUNC void  GRD_271_ULBERT_TRICK_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_TRICK_Info_15_01"); //Stare in piedi per così tanto tempo deve averti messo una gran sete.
	AI_Output			(self, other,"GRD_271_ULBERT_TRICK_Info_07_02"); //Puoi scommetterci! Mi farei proprio una bella bevuta. Hai niente con te?

	Log_CreateTopic		(CH2_StorageShed,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_StorageShed,	LOG_RUNNING);
	B_LogEntry		(CH2_StorageShed,"Ulbert è la guardia che custodisce il magazzino della vecchia miniera. Devo portargli qualcosa da bere!"); 
};  

// ***************** Infos *****************************

instance  GRD_271_ULBERT_DRINK (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_DRINK_Condition;
	information		= GRD_271_ULBERT_DRINK_Info;
	important		= 0;
	permanent		= 0;
	description		= "(dai da bere)"; 
};

FUNC int  GRD_271_ULBERT_DRINK_Condition()
{	
	if  (Npc_KnowsInfo ( hero, GRD_271_ULBERT_TRICK) ) &&	(Npc_HasItems (hero, ItFobeer )|| 
															 Npc_HasItems (hero, ItFoWine )||
															 Npc_HasItems (hero, ItFoBooze)  )
	{
		return 1;
	};

};
FUNC void  GRD_271_ULBERT_DRINK_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_DRINK_Info_15_01"); //Ecco! Bevi alla mia salute!
	AI_Output			(self, other,"GRD_271_ULBERT_DRINK_Info_07_02"); //Grazie.
	
	if 		(Npc_HasItems (hero, ItFobeer ))
	{
		B_GiveInvItems  	(hero, self, ItFobeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem  		(self,	ItFobeer);
	}
	else if (Npc_HasItems (hero, ItFowine ))
	{
		B_GiveInvItems	    (hero, self, ItFowine, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem  		( self, ItFoWine);
	}
	else if (Npc_HasItems (hero, ItFoBooze))
	{
		B_GiveInvItems	(hero, self, ItFoBooze, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem  		( self, ItFoBooze);
	};
};  
// ***************** Infos *****************************
instance  GRD_271_ULBERT_DRUNK (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_DRUNK_Condition;
	information		= GRD_271_ULBERT_DRUNK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Allora... C'è qualcosa di speciale nel magazzino, ADESSO?"; 
};

FUNC int  GRD_271_ULBERT_DRUNK_Condition()
{
	if ( Npc_KnowsInfo (hero, GRD_271_ULBERT_DRINK) )
	{
		return 1;
	};

};
FUNC void  GRD_271_ULBERT_DRUNK_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_DRUNK_Info_15_01"); //Allora... C'è qualcosa di speciale nel magazzino, ADESSO?
	AI_Output			(self, other,"GRD_271_ULBERT_DRUNK_Info_07_02"); //Alcuni scrigni pieni di rifornimenti. Però la chiave è sparita.
	AI_Output			(other, self,"GRD_271_ULBERT_DRUNK_Info_15_03"); //Sparita?
	AI_Output			(self, other,"GRD_271_ULBERT_DRUNK_Info_07_04"); //Scommetto che Aleph è coinvolto. Non ci si può fidare di lui.

	B_LogEntry		(CH2_StorageShed,"Dopo che gli ho portato da bere, Ulbert mi ha confessato di aver perso la chiave degli scrigni. Si suppone sia coinvolto Aleph, il minatore.");
};  
// ***************** Infos *****************************
instance  GRD_271_ULBERT_LOCK (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_LOCK_Condition;
	information		= GRD_271_ULBERT_LOCK_Info;
	important		= 0;
	permanent		= 0;
	description		= "(allontana Ulbert)"; 
};

FUNC int  GRD_271_ULBERT_LOCK_Condition()
{
	if ( Npc_KnowsInfo (hero ,GRD_271_ULBERT_DRUNK))
	{
		return 1;
	};

};
FUNC void  GRD_271_ULBERT_LOCK_Info()
{
	AI_Output			(other, self,"GRD_271_ULBERT_LOCK_Info_15_01"); //Ascolta. Ian e gli altri stanno facendo un barbecue sul fondo.
	AI_Output			(self, other,"GRD_271_ULBERT_LOCK_Info_07_02"); //Cosa? Senza di me? Vado a prendermi la mia parte!
	
	B_LogEntry		(CH2_StorageShed,"Allontanare Uleph dal magazzino è stato un gioco da ragazzi. Non sembra un tipo troppo sveglio!");

	Npc_ExchangeRoutine	(self,	"away");
	AI_StopProcessInfos	(self);
};

// ***************** Ulbert ist sauer *****************************
instance  GRD_271_ULBERT_ANGRY (C_INFO)
{
	npc				= GRD_271_ULBERT;
	condition		= GRD_271_ULBERT_ANGRY_Condition;
	information		= GRD_271_ULBERT_ANGRY_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_271_ULBERT_ANGRY_Condition()
{
	if	Npc_KnowsInfo(hero,GRD_271_ULBERT_LOCK)
	&&	(Npc_GetDistToWP(hero, "OM_CAVE1_49") < 600)
	{
		return TRUE;
	};

};
FUNC void  GRD_271_ULBERT_ANGRY_Info()
{
	AI_Output			(self, other,"GRD_271_ULBERT_ANGRY_Info_07_01"); //Ehi, tu! Non c'era nessun barbecue!
	AI_Output			(other, self,"GRD_271_ULBERT_ANGRY_Info_15_02"); //Oh... Uh... Devo essermi sbagliato! Ti auguro una buona giornata!

	B_GiveXP			(XP_LureUlbertAway);
	
	B_LogEntry		(CH2_StorageShed,"Ho incontrato nuovamente Ulbert. Santo cielo, non si è neppure accorto che l'ho preso in giro! Quel ragazzo è talmente ingenuo!");
	Log_SetTopicStatus	(CH2_StorageShed,	LOG_SUCCESS);

	Npc_ExchangeRoutine	(self,	"start");
	AI_StopProcessInfos	(self);
}; 
