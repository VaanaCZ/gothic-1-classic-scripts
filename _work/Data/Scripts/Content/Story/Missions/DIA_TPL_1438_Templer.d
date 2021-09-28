instance  Tpl_1438_Templer_Exit (C_INFO)
{
	npc			=  Tpl_1438_Templer;
	nr			=  999;
	condition	=  Tpl_1438_Templer_Exit_Condition;
	information	=  Tpl_1438_Templer_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1438_Templer_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1438_Templer_Exit_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_Exit_Info_15_01"); //Ci vediamo!
	AI_Output			(self, other,"Tpl_1438_Templer_Exit_Info_13_02"); //Che il Dormiente si svegli!
	
	AI_StopProcessInfos	( self );
};
// ***************** GELABER *****************************

instance  Tpl_1438_Templer_INFO (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_INFO_Condition;
	information		= Tpl_1438_Templer_INFO_Info;
	important		= 0;
	permanent		= 0;
	description		= "Cosa ci fate voi templari nella miniera?"; 
};

FUNC int  Tpl_1438_Templer_INFO_Condition()
{	
	if (  CorKalom_BringMCQBalls != LOG_RUNNING ) 
	{
		return TRUE;
	};

};

FUNC void  Tpl_1438_Templer_INFO_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_INFO_Info_15_01"); //Cosa ci fate voi templari nella miniera?
	AI_Output			(self, other,"Tpl_1438_Templer_INFO_Info_13_02"); //Cacciamo i pidocchi di miniera. Torna al campo, lì sarai al sicuro.
}; 

// ***************** SEKRET *****************************

instance  Tpl_1438_Templer_WHY (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_WHY_Condition;
	information		= Tpl_1438_Templer_WHY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Perché cacciate i pidocchi di miniera?"; 
};

FUNC int  Tpl_1438_Templer_WHY_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_INFO )) 
	{
		return 1;
	};

};
FUNC void  Tpl_1438_Templer_WHY_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_01"); //Perché cacciate i pidocchi di miniera?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_02"); //Per le loro mascelle. Esse contengono un preziosa secrezione.
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_03"); //Che tipo di secrezione?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_04"); //Un veleno. Solo Cor Kalom, il nostro guru, sa come trasformarlo in pozione.
};
// ***************** KALOM *****************************

instance  Tpl_1438_Templer_KALOM (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_KALOM_Condition;
	information		= Tpl_1438_Templer_KALOM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chi è Cor Kalom?"; 
};

FUNC int  Tpl_1438_Templer_KALOM_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_WHY )) 
	{
		return 1;
	};

};

FUNC void  Tpl_1438_Templer_KALOM_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_01"); //Chi è Cor Kalom?
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_02"); //Uno degli uomini più potenti di tutta la Fratellanza. Conosce molti segreti e può controllare i pensieri della gente!
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_03"); //Inoltre, è un alchimista. Crea delle pozioni che ci permettono d'entrare in contatto col Dormiente. Vai al campo, siamo sempre in cerca di persone nuove!
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_04"); //Ci penserò.
};  
//---------------------WENN DIE EIERSUCHE LÄUFT-------------------------------  
instance  Tpl_1438_Templer_EGGSEARCH (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_EGGSEARCH_Condition;
	information		= Tpl_1438_Templer_EGGSEARCH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Sto cercando il nido dei pidocchi di miniera."; 
};

FUNC int  Tpl_1438_Templer_EGGSEARCH_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING )
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_EGGSEARCH_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01"); //Sto cercando il nido dei pidocchi di miniera.
	AI_Output			(self, other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //Vai da Gor Na Vid, Gor Na Kosh o Gor Na Bar. Ne sanno molto più di me sui pidocchi di miniera.

	B_LogEntry		(CH2_MCEggs,"Arrivato all'entrata della vecchia miniera, ho chiesto a un templare che mi accompagnasse al nido dei pidocchi di miniera. Egli mi ha detto di rivolgermi ad altri tre suoi compagni: Gor Na Vid, Gor Na Kosh e Gor Na Bar. Che razza di nomi hanno, gli appartenenti alla Fratellanza!");  
};  
/*------------------------------------------------------------------------
//							ZANGEN FREISCHALTEN						    //
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_ZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_ZANGEN_Condition;
	information		= Tpl_1438_Templer_ZANGEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Come faccio a rimuovere le mascelle dai pidocchi di miniera?"; 
};

FUNC int  Tpl_1438_Templer_ZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_WHY) || (CorKalom_BringMCQBalls == LOG_RUNNING))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_ZANGEN_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //Come faccio a rimuovere le mascelle dai pidocchi di miniera?
	AI_Output			(self, other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //Non è molto facile, ma posso insegnartelo.
}; 
/*------------------------------------------------------------------------
//							LERNEN ZANGEN ZU ENTFERNEN					//
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_TEACHZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_TEACHZANGEN_Condition;
	information		= Tpl_1438_Templer_TEACHZANGEN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Impara a rimuovere le mascelle (1 punto esperienza)"; 
};

FUNC int  Tpl_1438_Templer_TEACHZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_ZANGEN))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_TEACHZANGEN_Info()
{
	
	AI_Output			(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //Puoi insegnarmi a rimuovere le mascelle?
	
	if (hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //Come prima cosa devi incedere profondamente nella carne. Attento a non colpire la ghiandola, altrimenti la secrezione schizzerà fuori.
		AI_Output		(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //Sembra molto doloroso.
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //Puoi scommetterci! Hai mai incontrato Korgu Tre-dita, il cacciatore di pidocchi di miniera? Ah, no... È successo prima del tuo arrivo. Andiamo avanti...
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //Incidi intorno alla ghiandola, lasciando un bel po' di spazio, quindi rimuovi la carne assieme alla mascella. Se ce la farai, non avrai grossi problemi.
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry		(GE_AnimalTrophies,"Come rimuovere le mascelle: pidocchi di miniera");
		Tpl_1438_Templer_TEACHZANGEN.permanent		= 0;
		PrintScreen		("Impara: rimuovere le mascelle dei pidocchi", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else 
	{
		PrintScreen		("Punti abilità insufficienti!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say			(self, other, "$NOLEARNNOPOINTS");
	};
};   
