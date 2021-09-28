
// ************************ EXIT **************************

instance  STT_301_IAN_Exit (C_INFO)
{
	npc			=  STT_301_IAN;
	nr			= 999;
	condition	=  STT_301_IAN_Exit_Condition;
	information	=  STT_301_IAN_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_301_IAN_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_301_IAN_Exit_Info()
{
	AI_Output			(other, self,"STT_301_IAN_Exit_Info_15_01"); //Darò solo un'occhiata.
	AI_Output			(self, other,"STT_301_IAN_Exit_Info_13_02"); //Non creare problemi.
	
	AI_StopProcessInfos	( self );
};
// ***************** Erstes Treffen *****************************

instance  STT_301_IAN_HI (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_HI_Condition;
	information		= STT_301_IAN_HI_Info;
	important		= 0;
	permanent		= 0;
	description		= "Sei Ian, il capo della miniera?"; 
};

FUNC int  STT_301_IAN_HI_Condition()
{	
	if ( ! Npc_KnowsInfo (hero,STT_301_IAN_NEST))
	{	
		return TRUE;
	};
};
FUNC void  STT_301_IAN_HI_Info()
{
	AI_Output			(other, self,"STT_301_IAN_HI_Info_15_01"); //Sei Ian, il capo della miniera?
	AI_Output			(self, other,"STT_301_IAN_HI_Info_13_02"); //Sì, sono Ian e questa è la mia miniera. Quindi non toccare o rompere nulla.
}; 
// ***************** Infos *****************************
instance STT_301_IAN_GOMEZ  (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GOMEZ_Condition;
	information		= STT_301_IAN_GOMEZ_Info;
	important		= 0;
	permanent		= 0;
	description		= "Non è la miniera di Gomez?"; 
};

FUNC int  STT_301_IAN_GOMEZ_Condition()
{	
	if Npc_KnowsInfo (hero,STT_301_IAN_HI)
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GOMEZ_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOMEZ_Info_15_01"); //Non è la miniera di Gomez?
	AI_Output			(self, other,"STT_301_IAN_GOMEZ_Info_13_02"); //Certo. Ovviamente è la miniera di Campo Vecchio. Ma qui c'è un solo capo, e sono io.
}; 
// ***************** Infos *****************************
instance  STT_301_IAN_ORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_ORE_Condition;
	information		= STT_301_IAN_ORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Puoi descrivermi la produzione di metallo?"; 
};

FUNC int  STT_301_IAN_ORE_Condition()
{
	if Npc_KnowsInfo (hero,STT_301_IAN_GOMEZ)
	{
		return TRUE ;
	};

};
FUNC void  STT_301_IAN_ORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_ORE_Info_15_01"); //Puoi descrivermi la produzione di metallo?
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_02"); //Scaviamo giorno e notte, producendo 200 sacchi al mese e altri 20 destinati alla fonderia.
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_03"); //Con il metallo che consegniamo al Re si possono forgiare centinaia di spade.
	
}; 
// ***************** Infos *****************************   
instance  STT_301_IAN_MORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MORE_Condition;
	information		= STT_301_IAN_MORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ho sentito dire che il metallo ha proprietà magiche. Tu che mi dici?"; 
};

FUNC int  STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_ORE) ;
};


FUNC void  STT_301_IAN_MORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MORE_Info_15_01"); //Ho sentito dire che il metallo ha proprietà magiche. Tu che mi dici?
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_02"); //Il metallo magico ha delle caratteristiche speciali. Le armi forgiate con esso non si rompono e le lame sono più affilate delle altre.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_03"); //In battaglia, un esercito equipaggiato con queste armi ha un decisivo vantaggio.
	
};   
// ***************** Infos *****************************  
instance  STT_301_IAN_MAGIC (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MAGIC_Condition;
	information		= STT_301_IAN_MAGIC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Parlami ancora del metallo."; 
};

FUNC int  STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_MORE) ;
};


FUNC void  STT_301_IAN_MAGIC_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MAGIC_Info_15_01"); //Parlami ancora del metallo.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_02"); //Sfortunatamente, i poteri magici del metallo svaniscono durante la fusione. Solo nelle fornaci di Nordmar conoscono la tecnica giusta.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_03"); //Ma, anche senza poteri magici, le armi create con questo metallo sono estremamente resistenti e causano più danni di quelle normali.
	
};   
// ***************** Infos *****************************   
instance  STT_301_IAN_MINE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MINE_Condition;
	information		= STT_301_IAN_MINE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Parlami della miniera."; 
};

FUNC int  STT_301_IAN_MINE_Condition()
{	
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (hero, STT_301_IAN_HI))
	{
		return TRUE;
	};

};
func void  STT_301_IAN_MINE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_01"); //Parlami della miniera.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_02"); //Se vuoi dare un'occhiata intorno, devi stare attento. Le caverne sono piene di pidocchi di miniera. Farai meglio a restare nel condotto principale.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_03"); //E lascia in pace i templari. Anche se passano la maggior parte del tempo a passeggiare, sono i migliori combattenti che tu possa trovare per aiutarti a sconfiggere i pidocchi di miniera!
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_04"); //Lo terrò a mente.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_05"); //Ho del lavoro da sbrigare. Ah! Non distrarre i miei ragazzi dalla loro occupazione!
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_06"); //Darò solo un'occhiata qua attorno.
};
/*------------------------------------------------------------------------
					BRING LIST									
------------------------------------------------------------------------*/

instance  STT_301_IAN_WANTLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_WANTLIST_Condition;
	information		= STT_301_IAN_WANTLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Sono venuto a prendere la lista per il campo."; 
};

FUNC int  STT_301_IAN_WANTLIST_Condition()
{
	if (Diego_BringList == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero,Info_Diego_IanPassword)) 
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_WANTLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_WANTLIST_Info_15_01"); //Sono venuto a prendere la lista per il campo.
	AI_Output			(self, other,"STT_301_IAN_WANTLIST_Info_13_02"); //Questo può dirlo chiunque. Sparisci!
	 
};  
/*------------------------------------------------------------------------
							LISTE ABHOLEN									
------------------------------------------------------------------------*/

instance  STT_301_IAN_GETLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GETLIST_Condition;
	information		= STT_301_IAN_GETLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Diego mi ha mandato a prendere la lista."; 
};

FUNC int  STT_301_IAN_GETLIST_Condition()
{	
	if (Diego_BringList == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GETLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_01"); //Diego mi ha mandato a prendere la lista.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_02"); //D'accordo, eccola. Dì loro di sbrigarsi con le consegne.
	B_LogEntry  (CH1_BringList,"Ian mi ha consegnato la lista senza fare storie.");
	B_GiveInvItems	(self,hero,TheList,1);
};  
// **************************************************************************
// 							MISSION BRING MCQ EIER RUNNING , 
//							oder: Ohne Zahnrad keine Eier
// **************************************************************************  
instance  STT_301_IAN_NEST (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NEST_Condition;
	information	=  STT_301_IAN_NEST_Info;
	important	= 0;	
	permanent	= 0;
	description = "Deve esserci un nido di pidocchi di miniera, da queste parti.";
};                       

FUNC int  STT_301_IAN_NEST_Condition()
{
	if (CorKalom_BringMCQBalls == LOG_RUNNING)
	&& ( Npc_KnowsInfo (hero,STT_301_IAN_HI) )
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_NEST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_01"); //Deve esserci un nido di pidocchi di miniera, da queste parti.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_02"); //Probabilmente ce ne sono a decine!
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_03"); //Ascolta, devo subito trovare questo nido...
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_04"); //Ora non ho tempo. La nostra schiacciatrice non funziona più. La ruota dentata si è rotta alcune ore fa.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_05"); //Non ho idea di dove trovarne un'altra.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_06"); //Portami una ruota dentata e vedrò di aiutarti.

	B_LogEntry		(CH2_MCEggs,"Ian, il capo della miniera, non mi aiuterà a trovare il nido. Devo portargli una nuova ruota dentata per la schiacciatrice. Mi ha parlato di un tunnel laterale, in cui potrei trovare uno di questi macchinari in disuso.");

	Ian_gearwheel = LOG_RUNNING;
};
// ******************************MISSION RUNNING********************************************  
instance  STT_301_IAN_GEAR_RUN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_RUN_Condition;
	information	=  STT_301_IAN_GEAR_RUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Una ruota dentata? E dove la trovo?";
};                       

FUNC int  STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt	(PD_MISSION, "Ian_gearwheel: ", Ian_gearwheel);
	
	if ((Ian_gearwheel == LOG_RUNNING)
	&&	!Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //Una ruota dentata? E dove la trovo?
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //Non ne ho idea! Siamo sulla stessa barca!
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //Però so che c'è una vecchia schiacciatrice in un condotto laterale. Forse sarai fortunato.
};

// ******************************MISSION SUCCESS********************************************  
instance  STT_301_IAN_GEAR_SUC (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_SUC_Condition;
	information	=  STT_301_IAN_GEAR_SUC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ho la ruota dentata!";
};                       

FUNC int  STT_301_IAN_GEAR_SUC_Condition()
{
	if (Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	&& (Ian_gearwheel == LOG_RUNNING)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_SUC_Info()
{
	B_GiveInvItems (hero,self, ItMi_Stuff_Gearwheel_01 ,1);
	Npc_RemoveInvItem (self,ItMi_Stuff_Gearwheel_01);
	
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP	(XP_BringGearWheel);
	
	var C_Npc Sklave; 				
	Sklave = Hlp_GetNpc	(ORC_2001_SKLAVE);
	Npc_ExchangeRoutine (Sklave,"Stomper");

	AI_Output			(other, self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //Ho la ruota dentata!
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //Ehi, ottimo lavoro. Penso che funzionerà. Per quanto riguarda te... Sei in cerca del nido dei pidocchi di miniera... Hmm...
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //Vai da Asghan e digli di aprirti il cancello, così potrai cercare nei condotti bui.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //Digli solo 'Andrà tutto bene', così saprà che hai il mio permesso.

	B_LogEntry		(CH2_MCEggs,"Ho consegnato a Ian la ruota dentata della schiacciatrice abbandonata. Mi ha detto di ripetere ad Asghan la frase ANDRÀ TUTTO BENE. In questo modo, dovrei riuscire a farmi aprire il cancello per i condotti oscuri.");
};

// ******************************GOTO ASGHAN********************************************  
instance  STT_301_IAN_GOTOASGHAN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GOTOASGHAN_Condition;
	information	=  STT_301_IAN_GOTOASGHAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Sto ancora cercando il nido dei pidocchi di miniera.";
};                       

FUNC int  STT_301_IAN_GOTOASGHAN_Condition()
{
	if ((Ian_gearwheel == LOG_SUCCESS)
	&&  (!Npc_KnowsInfo (hero,Grd_263_Asghan_NEST)))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //Sto ancora cercando il nido dei pidocchi di miniera.
	AI_Output			(self, other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //Te l'ho già detto: vai da Asghan, il capo delle guardie. Lo troverai da qualche parte al livello inferiore.

	B_LogEntry		(CH2_MCEggs,"Devo parlare con Asghan, se voglio trovare il nido dei pidocchi di miniera.");
};

//--SPIELER HAT DIE EIER AM START-------------------------
instance  STT_301_IAN_AFTERALL (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_AFTERALL_Condition;
	information	=  STT_301_IAN_AFTERALL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ho trovato il nido!";
};                       

FUNC int  STT_301_IAN_AFTERALL_Condition()
{
	if (Npc_HasItems (hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_AFTERALL_Info()
{
	AI_Output			(other, self,"STT_301_IAN_AFTERALL_Info_15_01"); //Ho trovato il nido!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_02"); //Finalmente ci lascerai in pace! Ha ha ha!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_03"); //Non ti offendere. Ottimo lavoro, ragazzo!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_04"); //Ecco, prendi questo boccale di birra come ricompensa.
	CreateInvItems		(self, ItFo_OM_Beer_01,6);
	B_GiveInvItems      (self, hero, ItFo_OM_Beer_01,6);
};

//-------NOT ENOUGH EGGS---------------
instance  STT_301_IAN_NOTENOUGH (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NOTENOUGH_Condition;
	information	=  STT_301_IAN_NOTENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ho trovato il nido e le uova della regina dei pidocchi di miniera!";
};                       

FUNC int  STT_301_IAN_NOTENOUGH_Condition()
{
	if ( Npc_HasItems (hero,ItAt_Crawlerqueen) > 1 )
	&& ( Npc_HasItems (hero,ItAt_Crawlerqueen) < 3 )
	{
		return TRUE;
	};
};
FUNC VOID  STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //Ho trovato il nido e le uova della regina dei pidocchi di miniera!
	AI_Output			(self, other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //Cosa? Tutte qui, le uova che hai trovato? Non fa nulla, almeno hai dimostrato di saper combattere.
};
