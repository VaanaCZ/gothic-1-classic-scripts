// ************************ EXIT **************************

instance  Info_Saturas_EXIT (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	999;
	condition	=	Info_Saturas_EXIT_Condition;
	information	=	Info_Saturas_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Saturas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Saturas_EXIT_Info()
{
	AI_Output			(self, other,"Info_Saturas_EXIT_14_01"); //Torna tutto intero!

	AI_StopProcessInfos	(self);
};


// ************************ Intruder **************************

instance  Info_Saturas_Intruder (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	1;
	condition	=	Info_Saturas_Intruder_Condition;
	information	=	Info_Saturas_Intruder_Info;
	permanent	=	1;
	important	=	1;	
};                       

FUNC int  Info_Saturas_Intruder_Condition()
{
	if ( Npc_IsInState(self,ZS_Talk) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_Intruder_Info()
{
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Cosa ci fai qui? Questo non è posto per te! Sparisci!

	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Saturas_NEWS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NEWS_Condition;
	information	= Info_Saturas_NEWS_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "Porto delle notizie importanti dal campo della Fratellanza!";
};

FUNC INT Info_Saturas_NEWS_Condition()
{	
	if ((CorAngar_SendToNC==TRUE) && Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_NEWS_Info()
{
	AI_Output			(other, self,"Info_Saturas_NEWS_15_01"); //Porto delle notizie importanti dal campo della Fratellanza!
	AI_Output			(self, other,"Info_Saturas_NEWS_14_02"); //Se Cronos ti da dato il permesso di venire da me, devono essere notizie davvero importanti!
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Saturas_YBERION (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_YBERION_Condition;
	information	= Info_Saturas_YBERION_Info;
	permanent	= 0;
	IMPORTANT = 0;
	description = "Y'Berion è morto!";
};

FUNC INT Info_Saturas_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_YBERION_Info()
{
	AI_Output			(other, self,"Info_Saturas_YBERION_15_01"); //Y'Berion è morto durante il rito d'evocazione del Dormiente.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_02"); //Y'Berion, morto? Queste sono pessime notizie. Davvero pessime!
	AI_Output			(self, other,"Info_Saturas_YBERION_14_03"); //Ora chi guida la Fratellanza? Quell'avido e disonesto Cor Kalom?
	AI_Output			(other, self,"Info_Saturas_YBERION_15_04"); //No! Kalom ha voltato le spalle alla Fratellanza, portando con sé alcuni templari. Nessuno sa dove siano andati.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_05"); //Perché mai? Era il vice di Y'Berion!
	AI_Output			(other, self,"Info_Saturas_YBERION_15_06"); //Grazie ad alcuni eventi i guru hanno capito di essere sulla strada sbagliata. Il loro dio non era altro che un demone.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_07"); //Uno di loro, posseduto dal Dormiente, mi ha quasi ucciso, sebbene gli avessi appena salvato la vita.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_08"); //Cor Kalom è stato l'unico guru a non voler accettare la vera natura dell'essere diabolico: ecco perché ha lasciato Campo Palude.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_09"); //Capisco! Bene, almeno questo torna a nostro vantaggio. Cor Angar è un brav'uomo: duro, ma onesto.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_10"); //Se qualcuno può impedire la rovina della Fratellanza, dopo tale catastrofe spirituale, questo è lui.

	B_LogEntry		(CH3_EscapePlanNC,"Ho raccontato a Saturas gli incidenti di Campo Palude. Sembrava felice che Cor Angar avesse assunto il comando della Fratellanza.");
};

//***************************************************************************
//	Info BOOK
//***************************************************************************
instance Info_Saturas_BOOK (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BOOK_Condition;
	information	= Info_Saturas_BOOK_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "Ho questo almanacco...";
};

FUNC INT Info_Saturas_BOOK_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, ItWrFokusbuch))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BOOK_Info()
{
	AI_Output			(other, self,"Info_Saturas_BOOK_15_01"); //Ho questo almanacco...
	AI_Output			(other, self,"Info_Saturas_BOOK_15_02"); //Y'Berion lo usava per caricare la pietra focalizzatrice.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_03"); //Molto bene. Abbiamo bisogno della conoscenza contenuta in questo libro, per caricare le cinque pietre focalizzatrici originali.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_04"); //Prenderò io l'almanacco!

	B_GiveInvItems		(hero,self,ItWrFokusbuch,1);
	Npc_RemoveInvItem	(self,ItWrFokusbuch);
	B_GiveXP  			(XP_DeliverBookToSaturas);
};

//***************************************************************************
//	Info FOCUS
//***************************************************************************
instance Info_Saturas_FOCUS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FOCUS_Condition;
	information	= Info_Saturas_FOCUS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ho questa pietra focalizzatrice...";
};

FUNC INT Info_Saturas_FOCUS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, Focus_1))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FOCUS_Info()
{
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_01"); //Ho questa pietra focalizzatrice...
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_02"); //Possiedi la chiave che può liberarci da ogni catena.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_03"); //Si tratta di una delle cinque pietre usate per creare la Barriera magica.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_04"); //Grazie al potere di queste stesse pietre abbatteremo il muro d'energia.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_05"); //Non servirà una quantità immensa di potere?
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_06"); //È vero. Per questo, in tutti questi anni, abbiamo accumulato il metallo, invece di scambiarlo coi nostri carcerieri.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_07"); //Come saprai, ogni pezzo contiene una certa quantità di potere magico. Grazie all'energia sprigionata dal cumulo potremo distruggere la Barriera magica.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_08"); //Sembra pericoloso.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_09"); //L'esplosione sarà di natura esclusivamente magica e distruggerà solo ciò che è stato modificato dalla magia. Non c'è alcun pericolo per gli esseri umani.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_10"); //Ecco, prendi la pietra focalizzatrice. Spero proprio che ti torni utile nel tuo piano!

	B_GiveInvItems		(hero, self, Focus_1, 1);
	Npc_RemoveInvItem	(self, Focus_1);
	B_GiveXP  			(XP_DeliverFocusToSaturas);
};

//***************************************************************************
//	Info WHATNOW
//***************************************************************************
instance Info_Saturas_WHATNOW (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_WHATNOW_Condition;
	information	= Info_Saturas_WHATNOW_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ora cosa hai intenzione di fare con la pietra e l'almanacco?";
};

FUNC INT Info_Saturas_WHATNOW_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_FOCUS) && Npc_KnowsInfo(hero, Info_Saturas_BOOK))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_WHATNOW_Info()
{
	AI_Output			(other, self,"Info_Saturas_WHATNOW_15_01"); //Ora cosa hai intenzione di fare con la pietra e l'almanacco?
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_03"); //Niente. Prima abbiamo bisogno delle altre quattro pietre focalizzatrici!
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_04"); //Sfortunatamente non le abbiamo.
};

//***************************************************************************
//	Info OFFER
//***************************************************************************
instance Info_Saturas_OFFER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_OFFER_Condition;
	information	= Info_Saturas_OFFER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Le troverò io per te!";
};

FUNC INT Info_Saturas_OFFER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_WHATNOW))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_OFFER_Info()
{
	AI_Output			(other, self,"Info_Saturas_OFFER_15_01"); //Le troverò io per te!
	AI_Output			(other, self,"Info_Saturas_OFFER_15_02"); //Dopo tutto, anch'io ho intenzione di andarmene da qui.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_03"); //Devo avvisarti: la ricerca sarà tanto difficile quanto pericolosa.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_04"); //La guerra con Campo Vecchio peggiora giorno dopo giorno, quindi non posso darti alcun mercenario.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_05"); //Dovrai cavartela da solo.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_06"); //Beh... non è la prima volta! Troverò il modo di sistemare le cose.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_07"); //La fiducia che riponi in te stesso è lodevole, ma avrai bisogno di alcuni oggetti.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_08"); //Prendi questa mappa. È vecchia, ma riporta le posizioni originali delle quattro pietre focalizzatrici, nel momento in cui fu creata la Barriera.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_09"); //Inoltre, questo incantesimo ti permetterà di tornare velocemente al nostro campo.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_10"); //Infine, vai a parlare con Riordian. È lui che crea le pozioni per il campo.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_11"); //Lo troverai nella sua capanna, al livello superiore.

	B_Story_BringFoci	();
};

//***************************************************************************
//	B_DeliverFocus
//***************************************************************************
func void B_DeliverFocus()
{
	//-------- 2. Fokus abliefern --------
	if 		(Saturas_BringFoci == 1)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_01"); //Uhm... È già qualcosa. Te la stai cavando bene.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_02"); //Mancano ancora tre pietre focalizzatrici.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_03"); //Ora vai a cercare le altre pietre focalizzatrici.
		Saturas_BringFoci = 2;	
		B_GiveXP  		(XP_DeliverSecondFocus);
	}

	//-------- 3. Fokus abliefern --------
	else if	(Saturas_BringFoci == 2)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_04"); //Bene, questa è la seconda pietra focalizzatrice che ci porti.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_05"); //Ci avviciniamo sempre più alla nostra meta.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_06"); //Sii forte e trova le due pietre rimanenti.
		Saturas_BringFoci = 3;	
		B_GiveXP  		(XP_DeliverThirdFocus);
	}
	
	//-------- 4. Fokus abliefern --------
	else if	(Saturas_BringFoci == 3)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_07"); //Incredibile: ora possediamo quattro pietre focalizzatrici!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_08"); //Ne manca solo una per averle tutte.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_09"); //Hai già reso un enorme servizio alla nostra comunità. Trova l'ultima pietra e presto saremo tutti liberi.
		Saturas_BringFoci = 4;	
		B_GiveXP  		(XP_DeliverFourthFocus);
	}
	
	//-------- 5. Fokus abliefern --------
	else if	(Saturas_BringFoci == 4)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_10"); //Eccellente: ora abbiamo tutte le cinque pietre focalizzatrici.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_11"); //Le tue azioni sono state inestimabili: hai la mia eterna gratitudine.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_12"); //Ora vai da Riordian e fatti ricompensare per i tuoi immensi sforzi.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_13"); //Parla anche con Cronos, il custode del metallo. TI consegnerà un altro dono, da parte della nostra comunità.

		Saturas_BringFoci = 5;	
		B_GiveXP  			(XP_DeliverFifthFocus);

		B_LogEntry		(CH3_BringFoci,"Sono riuscito a trovare tutte le quattro pietre focalizzatrici. Saturas è fuori di sé dalla gioia. Penso mi debba un grosso favore.");
		B_LogEntry		(CH3_BringFoci,"Entrambi i Maghi dell'Acqua Cronos e Riordian mi hanno promesso una ricompensa, se avessi recuperato tutte le pietre focalizzatrici. Andrò a cercarli.");

		
		// Aufhebung des Log_running_Status, wenn die Foki schon vorher abgegeben wurden, bevor SC die einzelnen Aufträge bekam.    ***Björn***
		
		Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	};
		
	//-------- Neuer Teleportzauber ? --------
	if ( !Npc_HasItems(hero, ItArScrollTeleport2) && (Saturas_BringFoci < 5) )	
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_14"); //Vedo che hai utilizzato l'incantesimo di teletrasporto. Ecco, prendine un altro.
		CreateInvItem	(self,	ItArScrollTeleport2);
		B_GiveInvItems	(self, other, ItArScrollTeleport2, 1);
	};
};

//***************************************************************************
//	Info BRINGFOCUS2
//***************************************************************************
instance Info_Saturas_BRINGFOCUS2 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS2_Condition;
	information	= Info_Saturas_BRINGFOCUS2_Info;
	permanent	= 0;
	important	= 0;
	description = "Ho trovato una pietra focalizzatrice nel canyon dei troll!";
};

FUNC INT Info_Saturas_BRINGFOCUS2_Condition()
{	
	if ( Npc_HasItems(hero,focus_2) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS2_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS2_15_01"); //Ho trovato una pietra focalizzatrice nel canyon dei troll!

	B_LogEntry		(CH3_TrollCanyon,"La pietra focalizzatrice del canyon ora è al sicuro da Saturas.");
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_2, 1);
	Npc_RemoveInvItem	(self,	focus_2);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS3
//***************************************************************************
instance Info_Saturas_BRINGFOCUS3 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS3_Condition;
	information	= Info_Saturas_BRINGFOCUS3_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ho trovato una pietra focalizzatrice nel forte sulla montagna!";
};

FUNC INT Info_Saturas_BRINGFOCUS3_Condition()
{	
	if ( Npc_HasItems(hero,focus_3) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS3_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS3_15_01"); //Ho trovato una pietra focalizzatrice nel forte sulla montagna!

	B_LogEntry		(CH3_Fortress,"Ho consegnato a Saturas la pietra focalizzatrice del forte sulla montagna.");
	Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_3, 1);
	Npc_RemoveInvItem	(hero,	focus_3);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS4
//***************************************************************************
instance Info_Saturas_BRINGFOCUS4 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS4_Condition;
	information	= Info_Saturas_BRINGFOCUS4_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ho trovato una pietra focalizzatrice nel monastero in rovina!";
};

FUNC INT Info_Saturas_BRINGFOCUS4_Condition()
{	
	if ( Npc_HasItems(hero,focus_4) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS4_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_01"); //Ho trovato una pietra focalizzatrice nel monastero in rovina!
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_02"); //Gorn il mercenario mi ha dato una mano nella ricerca.

	B_LogEntry		(CH3_MonasteryRuin,"Finalmente ho potuto consegnare a Saturas la pietra focalizzatrice del monastero in rovina.");
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_4, 1);
	Npc_RemoveInvItem	(hero,	focus_4);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS5
//***************************************************************************
instance Info_Saturas_BRINGFOCUS5 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS5_Condition;
	information	= Info_Saturas_BRINGFOCUS5_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ho trovato una pietra focalizzatrice sotto l'anello!";
};

FUNC INT Info_Saturas_BRINGFOCUS5_Condition()
{	
	if ( Npc_HasItems(hero,focus_5) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS5_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS5_15_01"); //Ho trovato una pietra focalizzatrice sotto il Cerchio di pietre!

	B_LogEntry		(CH3_Stonehenge,"Ho consegnato a Saturas la pietra focalizzatrice che ho trovato nella cripta sotto l'anello di pietra.");
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_5, 1);
	Npc_RemoveInvItem	(hero,	focus_5);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info ALLFOCI
//***************************************************************************
instance Info_Saturas_ALLFOCI (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ALLFOCI_Condition;
	information	= Info_Saturas_ALLFOCI_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ora puoi fare esplodere il cumulo di metallo?";
};

FUNC INT Info_Saturas_ALLFOCI_Condition()
{	
	if	(Saturas_BringFoci == 5)
	&&	(Kapitel < 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ALLFOCI_Info()
{
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_01"); //Ora puoi fare esplodere il cumulo di metallo?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_02"); //Abbiamo tutti i manufatti che ci servono a mettere in atto il nostro piano.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_03"); //Ma la Barriera fu creata da dodici maghi.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_04"); //Il Circolo dell'Acqua non comprende abbastanza maghi per controllare le potenti energie e incanalarle sulla giusta via.
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_05"); //Cosa possiamo fare?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_06"); //So che hai fatto già tantissimo per la nostra comunità e ti dobbiamo molto...
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_07"); //...ma, nell'interesse di tutti gli abitanti della colonia, devo chiederti un altro favore.
};

//***************************************************************************
//	Info FAVOR
//***************************************************************************
instance Info_Saturas_FAVOR (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FAVOR_Condition;
	information	= Info_Saturas_FAVOR_Info;
	permanent	= 0;
	important 	= 0;
	description = "Un altro?";
};

FUNC INT Info_Saturas_FAVOR_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_ALLFOCI))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FAVOR_Info()
{
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_01"); //Un altro?
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_02"); //Sì. Vai a Campo Vecchio e cerca di convertire alla nostra causa alcuni maghi del Circolo del Fuoco.
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_03"); //I MAGHI DEL FUOCO??? Non rinunceranno mai alla propria esistenza tranquilla!
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_04"); //La distruzione della Barriera li priverebbe della loro posizione privilegiata!
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_05"); //Questo è esattamente il motivo per cui devi essere TU a completare questa missione. Conosci persone in tutti i campi della colonia.
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_06"); //Ricorda loro i vecchi tempi, quando studiavamo insieme le arti magiche.
};	

//***************************************************************************
//	Info ACCEPT
//***************************************************************************
instance Info_Saturas_ACCEPT (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ACCEPT_Condition;
	information	= Info_Saturas_ACCEPT_Info;
	permanent	= 0;
	important 	= 0;
	description = "Va bene: cercherò di convincere i Maghi del Fuoco!";
};

FUNC INT Info_Saturas_ACCEPT_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_FAVOR))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ACCEPT_Info()
{
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_01"); //Va bene: cercherò di convincere i Maghi del Fuoco!
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_02"); //Ma non prometto nulla! Mi sembra una missione quasi impossibile.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_03"); //Devi tentare. Se non ci riuscirai, c'è solo un altro...
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_04"); //Solo uno...
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_05"); //...uno COSA?
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_06"); //Lascia stare! DEVI farcela!
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_07"); //Ecco, prendi questa runa magica. Portala a Corristo, il Gran Mago del Circolo del Fuoco, in segno della nostra fiducia.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_08"); //Con questa egli potrà teletrasportarsi qui in qualsiasi momento, senza dover passare per le guardie.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_09"); //Spero basterà a convincere i nostri vecchi amici che siamo sinceri.

	B_KapitelWechsel	(4);
};	







//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info AMBUSH
//---------------------------------------------------------------------
instance Info_Saturas_AMBUSH (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_AMBUSH_Condition;
	information	= Info_Saturas_AMBUSH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Saturas_AMBUSH_Condition()
{	
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_AMBUSH_Info()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(PC_FIGHTER);
	AI_TurnToNpc		(gorn,hero);
	
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_01"); //Sono contento che tu sia tornato. È successa una cosa terribile!
	AI_Output			(hero,self,"Info_Saturas_AMBUSH_15_02"); //Fammi indovinare: la miniera libera è stata assaltata dalle guardie di Campo Vecchio. Nessuno le ha viste arrivare?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_03"); //Aspetta un momento... come hai... ma certo... L'hai saputo a Campo Vecchio!
	AI_Output	 		(self,hero,"Info_Saturas_AMBUSH_14_04"); //Gorn è arrivato qui appena prima di te.
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_05"); //Cosa può aver spinto Gomez a compiere un gesto così aggressivo?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_06"); //Dovrebbe sapere che un atto talmente vile può significare solo la guerra.
};	

//---------------------------------------------------------------------
//	Info COLLAPSE
//---------------------------------------------------------------------
instance Info_Saturas_COLLAPSE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_COLLAPSE_Condition;
	information	= Info_Saturas_COLLAPSE_Info;
	permanent	= 0;
	important 	= 0;
	description = "La vecchia miniera è crollata a causa delle infiltrazioni d'acqua!";
};

FUNC INT Info_Saturas_COLLAPSE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_COLLAPSE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_COLLAPSE_15_01"); //La vecchia miniera è crollata a causa delle infiltrazioni d'acqua!
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_02"); //...Già... Crollata... Ora si spiega tutto.
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_03"); //Gomez si trova con le spalle al muro. Ora che non ha più nulla da perdere, è più pericoloso che mai: può fare qualsiasi cosa!
};

//---------------------------------------------------------------------
//	Info MURDER
//---------------------------------------------------------------------
instance Info_Saturas_MURDER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_MURDER_Condition;
	information	= Info_Saturas_MURDER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Gomez ha fatto uccidere tutti i Maghi del Fuoco!";
};

FUNC INT Info_Saturas_MURDER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_MURDER_Info()
{
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_01"); //Gomez ha ucciso tutti i Maghi del Fuoco!
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_02"); //UCCISI??? Per la gloria di Beliar, perché ha fatto una cosa del genere?
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_03"); //Erano contrari ad attaccare la miniera libera e si sono opposti a lui.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_04"); //Allora siamo tutti condannati. Senza gli altri sei maghi non riusciremo mai a tenere sotto controllo il potere concentrato del cumulo di metallo.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_05"); //Comunque, ti ringrazio per avermi portato questa pericolosa notizia.

	B_GiveXP			(XP_ReportToSaturas);
	
	B_LogEntry			(CH4_Firemages,"Saturas non è stato molto felice, quando gli ho raccontato gli incidenti di Campo Vecchio. Qualsiasi cosa abbia in mente, riguardo al piano di fuga, dovrà fare a meno dei Maghi del Fuoco.");
	Log_SetTopicStatus	(CH4_Firemages,	LOG_SUCCESS);
};



/*------------------------------------------------------------------------
							GILDENWECHSEL									
------------------------------------------------------------------------*/
instance  KDW_600_Saturas_NOMOREOC (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_NOMOREOC_Condition;
	information		= KDW_600_Saturas_NOMOREOC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Sono stato bandito da Campo Vecchio perché ti ho aiutato!"; 
};

FUNC int  KDW_600_Saturas_NOMOREOC_Condition()
{	
	if	Npc_KnowsInfo (hero,Info_Saturas_MURDER)
	&&	((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		return TRUE;
	};
};

FUNC void  KDW_600_Saturas_NOMOREOC_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_NOMOREOC_Info_15_01"); //Sono stato bandito da Campo Vecchio perché ti ho aiutato!
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_02"); //Non appartieni più a Campo Vecchio?
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Allora sii il benvenuto nella nostra comunità!

	Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
	B_LogEntry			(CH4_BannedFromOC,"Sono stato bandito da Campo Vecchio e Saturas mi ha dato il benvenuto a Campo Nuovo.");
}; 

/*------------------------------------------------------------------------
							VOM GRD ZUM SLD									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_GOTOLEE (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_GOTOLEE_Condition;
	information		= KDW_600_Saturas_GOTOLEE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Questo significa che i mercenari mi prenderanno con loro?"; 
};

FUNC int  KDW_600_Saturas_GOTOLEE_Condition()
{	
	if (oldHeroGuild == GIL_GRD)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_GOTOLEE_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_GOTOLEE_Info_15_01"); //Questo significa che i mercenari mi prenderanno con loro?
	AI_Output			(self, other,"KDW_600_Saturas_GOTOLEE_Info_14_02"); //Parlane a Lee, se ne occuperà lui. Poi torna da me.

	B_LogEntry			(CH4_BannedFromOC,"Lee, il capo dei mercenari, vuole parlarmi. Devo andare da lui e tornare subito da Saturas."); 
};  
 
/*------------------------------------------------------------------------
							VON KDF ZU KDW									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_OATH (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_OATH_Condition;
	information		= KDW_600_Saturas_OATH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Questo significa che ora appartengo alla gilda dei Maghi dell'Acqua?"; 
};

FUNC int  KDW_600_Saturas_OATH_Condition()
{	
	if (oldHeroGuild == GIL_KDF)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_OATH_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Questo significa che ora appartengo alla gilda dei Maghi dell'Acqua?
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Non ancora. Prima devi recitare il giuramento dell'Acqua.
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_03"); //Ma ho già prestato quello del Fuoco!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_04"); //Uhmm...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_05"); //Questo non significa che tu debba infrangere il tuo voto!
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_06"); //Uh... Non capisco...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_07"); //Stai semplicemente estendendo il voto, diventando un mago di entrambi gli elementi!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_08"); //In questo modo unirai la potenza del Fuoco alla saggezza dell'Acqua!

	B_LogEntry			(CH4_BannedFromOC,"Saturas mi permetterà di unirmi al Circolo dell'Acqua, senza che io debba rompere il giuramento del Fuoco."); 
};  

/*------------------------------------------------------------------------
//							KDWAUFNAHME									//
------------------------------------------------------------------------*/
instance KDW_600_Saturas_KDWAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_KDWAUFNAHME_Condition;
	information		= KDW_600_Saturas_KDWAUFNAHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Sono pronto a giurare."; 
};

FUNC int  KDW_600_Saturas_KDWAUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_OATH))
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_KDWAUFNAHME_Info()
{
	
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Sono pronto a giurare.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02"); //Servo del Fuoco, ora riceverai la benedizione dell'Acqua!
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Ora recita le parole del giuramento:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Giuro davanti agli dèi onnipotenti...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Giuro davanti agli dèi onnipotenti...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //Giuro davanti alla potenza dell'Acqua sacra...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //Giuro davanti alla potenza dell'Acqua sacra...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...che, da questo istante e per sempre, la mia conoscenza e le mie azioni saranno tutt'uno con l'Acqua...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...che, da questo istante e per sempre, la mia conoscenza e le mie azioni saranno tutt'uno con l'Acqua...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...finché il mio corpo non farà ritorno al regno di Beliar e la mia fonte vitale non si prosciugherà.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...finché il mio corpo non farà ritorno al regno di Beliar e la mia fonte vitale non si prosciugherà.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12"); //Pronunciando il giuramento, hai riunito in te il potere del Fuoco e la benedizione dell'Acqua.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13"); //Ora hai riunificato ciò che era separato. Che la tua vita sia il simbolo dell'unione degli elementi!
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Indossa questa veste, come segno del tuo legame con l'Acqua sacra e con Adanos.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	B_LogEntry			(CH4_BannedFromOC,"Adesso faccio parte del Circolo dell'Acqua. D'ora in poi, avrò accesso a entrambe le scuole di magia."); 
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);

	AI_StopProcessInfos	(self);
};
/*------------------------------------------------------------------------
						DIE MAGISCHEN KREISE							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_LESSON (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_LESSON_Condition;
	information		= KDW_600_Saturas_LESSON_Info;
	important		= 0;
	permanent		= 0;
	description		= "Puoi istruirmi?"; 
};

FUNC int  KDW_600_Saturas_LESSON_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW) 
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_LESSON_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_LESSON_Info_15_01"); //Puoi istruirmi?
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) <= 3)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_02"); //Devi imparare così tante cose... Te le insegnerò non appena sarai pronto.
	}
	else if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_03"); //C'è ancora un Cerchio che non conosci. Te lo insegnerò non appena sarai pronto.
	}
	else
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_04"); //Hai già superato il Quinto Cerchio magico! Hai appreso tutto ciò che so.
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_05"); //Non posso insegnarti altro!
	};

	Log_CreateTopic		(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Saturas, il capo dei Maghi dell'Acqua, mi spiegherà i CERCHI magici. Posso trovarlo al pentacolo del livello superiore.");
};  
//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS1 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS1_Condition;
	information		= KDW_600_Saturas_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0); 
};

FUNC int  KDW_600_Saturas_KREIS1_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS1_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS1_Info_15_01"); //Sono pronto per accedere al Primo Cerchio.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_02"); //Accedere al Primo Cerchio magico significa imparare a usare le rune.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_03"); //Ogni runa contiene un particolare incantesimo.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_04"); //Per lanciarlo usa i tuoi poteri magici.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_05"); //A differenza delle pergamene, che sono formule magiche, il potere delle rune assicura la persistenza dell'incantesimo.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_06"); //Ogni runa è una specie di potere magico che puoi richiamare quando vuoi.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_07"); //Quando usi una runa, sfrutti il tuo potere magico, esattamente come con le pergamene.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_08"); //Ogni volta che accedi a un nuovo Cerchio, impari a usare altre rune.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_09"); //Usa il potere delle rune per imparare a conoscere te stesso.
		KDW_600_Saturas_KREIS1.permanent = 0;
	};
};  
//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS2_Condition;
	information		= KDW_600_Saturas_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0); 
};

FUNC int  KDW_600_Saturas_KREIS2_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS2_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS2_Info_15_01"); //Sono pronto per accedere al Secondo Cerchio.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_02"); //Hai imparato a conoscere le rune. Ora è tempo di approfondire l'argomento.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_03"); //Entrando nel Secondo Cerchio, imparerai le basi degli incantesimi da battaglia più potenti, soprattutto il segreto della guarigione.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_04"); //Ma dovrai studiare molto, se vorrai conoscere i veri segreti della magia.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_05"); //Sai che puoi utilizzare le rune quando vuoi, sfruttando il tuo potere magico.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_06"); //Prima di agire, pensa allo scopo delle tue azioni. Hai acquisito un potere immenso, che potresti facilmente utilizzare per causare morte e distruzione.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_07"); //Ma un vero mago usa i suoi poteri solo se strettamente necessario.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_08"); //Impara a riconoscere le situazioni e capirai il potere delle rune.
		KDW_600_Saturas_KREIS2.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS3 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS3_Condition;
	information		= KDW_600_Saturas_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0); 
};

FUNC int  KDW_600_Saturas_KREIS3_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 2)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS3_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS3_Info_15_01"); //Puoi spiegarmi il Terzo Cerchio?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_02"); //Il Terzo Cerchio magico è uno dei passi più importanti nella vita di un mago. Una volta raggiunto, avrai terminato la tua ricerca.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_03"); //Sei già molto avanti sulla strada della magia. Hai imparato a usare le rune.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_04"); //Tale conoscenza è la base per il tuo cammino futuro. Usa le rune con discrezione.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_05"); //Puoi usare una runa o no, ma devi prendere una decisione.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_06"); //Non esitare a utilizzare i tuoi poteri, una volta effettuata la scelta.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_07"); //Scopri la tua via e comprenderai il potere della decisione.
		KDW_600_Saturas_KREIS3.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER VIERTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS4 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS4_Condition;
	information		= KDW_600_Saturas_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0); 
};

FUNC int  KDW_600_Saturas_KREIS4_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS4_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS4_Info_15_01"); //Sono pronto per accedere al Quarto Cerchio.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_02"); //Hai completato i primi tre Cerchi. Ora è tempo che tu conosca i segreti della magia.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_03"); //La magia delle rune è basata sulla pietra. Esistono alcune pietre, forgiate nel metallo magico.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_04"); //Si tratta dello stesso metallo estratto nelle miniere, sul quale vengono applicate delle formule magiche nei templi. Lì le rune sono convertite in strumenti del nostro potere.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_05"); //Con le rune che puoi controllare ora, hai fra le mani l'intera conoscenza di tutti i templi del reame.
		//AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_07"); //Comprendi la magia e scoprirai il segreto del potere.
		KDW_600_Saturas_KREIS4.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							DER FÜNFTE KREIS							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_KREIS5 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS5_Condition;
	information		= KDW_600_Saturas_KREIS5_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,0); 
};

FUNC int  KDW_600_Saturas_KREIS5_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS5_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS5_Info_15_01"); //Sono pronto per accedere al Quinto Cerchio.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 5, LPCOST_TALENT_MAGE_5))
	{
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_02"); //Così sia. Ti svelerò il potere del Quinto Cerchio.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_03"); //Ora puoi usare le rune che contengono gli incantesimi 'Tempesta di fuoco', 'Onda di gelo' e il potere di distruggere i morti viventi.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_04"); //Ma l'incantesimo più potente del Quinto Cerchio è il 'Vortice Mortale'. Se mai dovessi possedere questa runa, ne controlleresti il pericolosissimo potere.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_05"); //Usa questo tipo di magia il meno possibile. Essa è un dono del Dio dell'Oscurità.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Ora hai appreso tutto ciò che so.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_06"); //Impara i tuoi limiti e capirai quanto tu sia davvero potente.
		KDW_600_Saturas_KREIS5.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							SCHWERE ROBE								
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_HEAVYARMOR (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_HEAVYARMOR_Condition;
	information		= KDW_600_Saturas_HEAVYARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_SaturasHighRobe,VALUE_KDW_ARMOR_H); 
};

FUNC int  KDW_600_Saturas_HEAVYARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_HEAVYARMOR_Info()
{
	AI_Output				(other, self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01"); //Maestro, vorrei indossare l'alta veste d'Acqua.
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) < 4)
	&& (Kapitel < 5)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02"); //Non sei ancora pronto. Torna quando sarai più istruito.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03"); //Non possiedi abbastanza metallo.
	}
	else
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04"); //Il momento è giunto: sei degno d'indossare l'alta veste d'Acqua.
		KDW_600_Saturas_HEAVYARMOR.permanent = 0;

		B_GiveInvItems		(hero,self,	ItMinugget,VALUE_KDW_ARMOR_H);
		CreateInvItem		(hero,		KDW_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
	};
}; 

//---------------------------------------------------------------------
//	Info NOWSLD
//---------------------------------------------------------------------
instance Info_Saturas_NOWSLD (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NOWSLD_Condition;
	information	= Info_Saturas_NOWSLD_Info;
	permanent	= 0;
	important	= 0;
	description = "Lee mi ha accettato fra i mercenari.";
};

FUNC INT Info_Saturas_NOWSLD_Condition()
{	
	if	Npc_KnowsInfo(hero, Sld_700_Lee_CHANGESIDE)
	{
		return TRUE;
	}; 
};

FUNC VOID Info_Saturas_NOWSLD_Info()
{
	AI_Output			(hero,self,"Info_Saturas_NOWSLD_15_01"); //Lee mi ha accettato fra i mercenari.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_02"); //Bene, molto bene. Ora fai ufficialmente parte della nostra comunità.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_03"); //Benvenuto!

	B_LogEntry			(CH4_BannedFromOC,"Saturas mi ha ufficialmente dato il benvenuto fra i mercenari.");
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);	
};

//---------------------------------------------------------------------
//	Info XARDAS
//---------------------------------------------------------------------
instance Info_Saturas_XARDAS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDAS_Condition;
	information	= Info_Saturas_XARDAS_Info;
	permanent	= 0;
	important	= 0;
	description = "Quando mi hai inviato dai Maghi del Fuoco, hai detto che c'era... QUALCUNO.";
};

FUNC INT Info_Saturas_XARDAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_COLLAPSE)
	&&	Npc_KnowsInfo(hero, Info_Saturas_MURDER)
	{		 										//***Björn***>

		if( (Npc_GetTrueGuild(hero)!=GIL_GRD)  &&  (Npc_GetTrueGuild(hero)!=GIL_KDF)  )
		{
			return TRUE;
		};

/*												
		if 		(oldHeroGuild==GIL_GRD)
		{
			if (Npc_GetTrueGuild(hero)==GIL_SLD)
			{
				return TRUE;
			};
		}
		else if (oldHeroGuild==GIL_KDF)
		{
			if (Npc_GetTrueGuild(hero)==GIL_KDW)
			{
				return TRUE;
			};
		}
		else
		{
			return TRUE;
		}; 											<***Björn***
*/												

	};	
};

FUNC VOID Info_Saturas_XARDAS_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_01"); //Quando mi hai mandato dai Maghi del Fuoco, hai detto che c'era... QUALCUNO.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_02"); //Speravo che ce l'avremmo fatta anche senza il suo aiuto. Comunque, visti gli ultimi sviluppi...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_03"); //Chi è?
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_04"); //Calma, calma!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_05"); //Molti, molti anni fa...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_06"); //Fammi un riassunto, per favore!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_07"); //Abbi pazienza! Dicevo: quando noi, i dodici maghi, creammo la Barriera, i nostri poteri erano diretti e controllati da un tredicesimo mago.
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_08"); //Un tredicesimo mago? Pensavo ce ne fossero solo dodici!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_09"); //Molti fra quelli che non sono qui dall'inizio la pensano come te.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_10"); //Questo tredicesimo mago era il nostro capo. Tutto questo avvenne prima che ci dividessimo nei due Circoli del Fuoco e dell'Acqua.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_11"); //Egli abbandonò Campo Vecchio che, al tempo, era l'unico campo nella colonia.
};

//---------------------------------------------------------------------
//	Info XARDASWHO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHO_Condition;
	information	= Info_Saturas_XARDASWHO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Come si chiama il tredicesimo mago?";
};

FUNC INT Info_Saturas_XARDASWHO_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHO_15_01"); //Come si chiama il tredicesimo mago?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_02"); //Il suo nome è Xardas. Quasi nessuno ricorda più le storie sul suo conto.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_03"); //I pochi che ancora lo ricordano lo chiamano il NEGROMANTE!
};

//---------------------------------------------------------------------
//	Info XARDASWHY
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHY (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHY_Condition;
	information	= Info_Saturas_XARDASWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Perché ha abbandonato Campo Vecchio?";
};

FUNC INT Info_Saturas_XARDASWHY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHY_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_01"); //Perché ha abbandonato Campo Vecchio?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_02"); //Iniziò a studiare l'evocazione dei morti viventi e delle creature magiche.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_03"); //Gomez non fu l'unico a preoccuparsene. La maggior parte degli altri maghi si oppose a lui e alle sue azioni sacrileghe.
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_04"); //E cosa accadde, allora?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_05"); //A differenza di Gomez, egli non era un macellaio. Quindi evitò lo scontro e se ne andò.
};

//---------------------------------------------------------------------
//	Info XARDASWHERE
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHERE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHERE_Condition;
	information	= Info_Saturas_XARDASWHERE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Dove si trova, ora?";
};

FUNC INT Info_Saturas_XARDASWHERE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHERE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHERE_15_01"); //Dove si trova, ora?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_02"); //Vive isolato nella sua torre, al centro della terra degli orchi.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_03"); //Nel punto più a sud dell'intera colonia.
};

//---------------------------------------------------------------------
//	Info XARDASHELP
//---------------------------------------------------------------------
instance Info_Saturas_XARDASHELP (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASHELP_Condition;
	information	= Info_Saturas_XARDASHELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "Raggiungerò Xardas e gli chiederò d'aiutarci!";
};

FUNC INT Info_Saturas_XARDASHELP_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHO)
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHY) 
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHERE) 
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASHELP_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_01"); //Raggiungerò Xardas e gli chiederò di aiutarci!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_02"); //È l'unico che può farlo, ormai.
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_03"); //Se non vedesse vie d'uscita o non volesse aiutarci...
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_04"); //LO FARÀ!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_05"); //C'è un altro problema...
	
	B_Story_FindXardas	();
};

//---------------------------------------------------------------------
//	Info XARDASPROBLEM
//---------------------------------------------------------------------
instance Info_Saturas_XARDASPROBLEM (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASPROBLEM_Condition;
	information	= Info_Saturas_XARDASPROBLEM_Info;
	permanent	= 0;
	important 	= 0;
	description = "Un problema?";
};

FUNC INT Info_Saturas_XARDASPROBLEM_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASHELP)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_01"); //Un problema?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_02"); //Sì. Nel corso degli anni abbiamo cercato di contattarlo numerose volte.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_03"); //Ma sembra che non voglia essere disturbato.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_04"); //Che significa?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_05"); //Nessun messaggero ha mai fatto ritorno dalla sua torre.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_06"); //Dovrai riuscire a superare le sue creature.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_07"); //La cosa si fa interessante.
	
	B_LogEntry			(CH4_FindXardas,"Saturas mi ha messo in guardia dalle creature magiche di Xardas il Negromante. Nella biblioteca dei Maghi dell'Acqua, posso trovare degli scritti sui pericoli e i punti deboli di queste creature. Mi prenderò del tempo per leggerli.");	
};

//---------------------------------------------------------------------
//	Info XARDASGO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASGO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASGO_Condition;
	information	= Info_Saturas_XARDASGO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Come farò a superare le creature?";
};

FUNC INT Info_Saturas_XARDASGO_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASPROBLEM)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASGO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_01"); //Come farò a superare le creature?
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_02"); //Se l'avessi saputo, te l'avrei detto!
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_03"); //Ti consiglio di fare qualche ricerca nella nostra biblioteca.
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_04"); //Forse, in qualche vecchio libro, troverai alcune informazioni sui punti deboli delle creature evocate magicamente.
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_05"); //Metterò sottosopra l'intera biblioteca. E non preoccuparti...
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_06"); //Tornerò!

	B_LogEntry			(CH4_FindXardas,"Nella biblioteca dei Maghi dell'Acqua, posso trovare degli scritti sui pericoli e i punti deboli di queste creature. Mi prenderò del tempo per leggerli.");
	
};

/*------------------------------------------------------------------------
//	TIMESUP- Xardas ist die Schlüsselperson, Saturas ist nicht mehr wichtig									
------------------------------------------------------------------------*/
instance KDW_600_Saturas_TIMESUP (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_TIMESUP_Condition;
	information		= KDW_600_Saturas_TIMESUP_Info;
	important	    = 1;
	permanent		= 0;
};

FUNC int  KDW_600_Saturas_TIMESUP_Condition()
{	
	if FindOrcShaman == LOG_RUNNING
	|| FindOrcShaman == LOG_SUCCESS
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_TIMESUP_Info()
{
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_00"); //Hai parlato con Xardas?
	Info_ClearChoices	(KDW_600_Saturas_TIMESUP);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Beh...",KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"No...",KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Le cose non stanno come pensi...",KDW_600_Saturas_TIMESUP_JA3);

};
func void KDW_600_Saturas_TIMESUP_JA1()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_01"); //Beh...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_02"); //Beh?... Beh cosa?
	//AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_03"); //Äh ... noch nicht ... ich bin aber schon unterwegs ...
	//AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_04"); //Beeile dich, wir dürfen keine Zeit mehr verlieren!
	//B_Story_CancelFindXardas();
	//AI_StopProcessInfos(self);
};
func void KDW_600_Saturas_TIMESUP_JA2()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_05"); //No...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_06"); //Perché?
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_07"); //Non sono ancora riuscito a raggiungere la zona...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_08"); //Devi trovarlo e chiedergli aiuto!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};
func void KDW_600_Saturas_TIMESUP_JA3()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_09"); //Le cose non stanno come pensi...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_10"); //Che vuoi dire? Deve trovare il modo di far esplodere il cumulo di metallo!
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_11"); //Il cumulo di metallo... ecco... insomma... è molto cresciuto!
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_12"); //Trova Xardas! Deve aiutarci!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};




//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////// SLD zu Magier		//////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

// ****************************************
// 			Aufnahme eines Sld 
// ****************************************

instance KDW_600_Saturas_HogeAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHME_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHME_Info;
	permanent		= 0;
	description		= "Nefarius ha detto che sono pronto a indossare la veste dei Maghi dell'Acqua."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHME_Condition()
{	
	if ( Npc_KnowsInfo(hero,Info_Saturas_MURDER) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHME_Info()
{
	AI_Output(other, self,"KDW_600_Saturas_HogeAUFNAHME_15_00"); //Nefarius ha detto che sono pronto a indossare la veste dei Maghi dell'Acqua.
	
	/* AB HIER IST ALLES DOPPELT - geklaut aus der KdF-KdW-Aufnahme */
	
	AI_Output(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Allora sii il benvenuto nella nostra comunità!
	AI_Output(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Questo significa che ora appartengo alla gilda dei Maghi dell'Acqua?
	AI_Output(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Non ancora. Prima devi recitare il giuramento dell'Acqua.
};
	
// ****************************************
// 			Aufnahme eines Sld - Teil 2
// ****************************************
instance KDW_600_Saturas_HogeAUFNAHMETeil2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHMETeil2_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHMETeil2_Info;
	permanent		= 0;
	description		= "Sono pronto a giurare."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHMETeil2_Condition()
{	
	if ( (Npc_KnowsInfo(hero,KDW_600_Saturas_HogeAUFNAHME)) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHMETeil2_Info()
{
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Sono pronto a giurare.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Ora recita le parole del giuramento:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Giuro davanti agli dèi onnipotenti...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Giuro davanti agli dèi onnipotenti...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //Giuro davanti alla potenza dell'Acqua sacra...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //Giuro davanti alla potenza dell'Acqua sacra...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...che, da questo istante e per sempre, la mia conoscenza e le mie azioni saranno tutt'uno con l'Acqua...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...che, da questo istante e per sempre, la mia conoscenza e le mie azioni saranno tutt'uno con l'Acqua...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...finché il mio corpo non farà ritorno al regno di Beliar e la mia fonte vitale non si prosciugherà.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...finché il mio corpo non farà ritorno al regno di Beliar e la mia fonte vitale non si prosciugherà.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Indossa questa veste, come segno del tuo legame con l'Acqua sacra e con Adanos.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	Log_CreateTopic		(CH4_SldToKdW,	LOG_NOTE);
	B_LogEntry			(CH4_SldToKdW,"Saturas mi ha ammesso all'interno del Circolo dell'Acqua.");

	AI_StopProcessInfos	(self);
};

