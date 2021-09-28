// ************************************************************
// 							EXIT 
// ************************************************************
INSTANCE Info_BaalLukor_EXIT(C_INFO)
{
	npc				= GUR_1211_BaalLukor;
	nr				= 999;
	condition		= Info_BaalLukor_EXIT_Condition;
	information		= Info_BaalLukor_EXIT_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_BaalLukor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_BaalLukor_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//**************************************************************************
//	Info MEET: Erstes Zusammentreffen mit Baal Lukor
//**************************************************************************
INSTANCE Info_BaalLukor_MEET (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_MEET_Condition;
	information	= Info_BaalLukor_MEET_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_MEET_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_MEET_Info()
{
	AI_Output 		(self, other,"Info_BaalLukor_MEET_13_01"); //Grazie per il tuo aiuto. Sei arrivato appena in tempo.
	
	B_GiveXP		(XP_SaveBaalLukor);
};

//**************************************************************************
//	Info DEAD
//**************************************************************************
INSTANCE Info_BaalLukor_DEAD (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_DEAD_Condition;
	information	= Info_BaalLukor_DEAD_Info;
	nr			= 20;
	permanent	= 0;
	important 	= 0;
	description = "Venendo qui, ho incontrato alcuni cadaveri di templari!";
};

FUNC INT Info_BaalLukor_DEAD_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_DEAD_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_01"); //Venendo qui, ho incontrato alcuni cadaveri di templari, Cosa è successo?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_02"); //Il maestro Cor Angar ci ha inviati a ispezionare le caverne.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_03"); //Pensavamo che avremmo trovato solo tombe piene di cadaveri semidecomposti.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_04"); //Improvvisamente si è fatto buio e c'erano orchi dappertutto. Non so cosa stessero cercando, ma la loro apparizione in questo luogo è più che insolita.
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_05"); //Dove sono tutti gli altri templari?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_06"); //Sono morti! Li ho involontariamente condotti alla distruzione. Spero che il Dormiente mi perdoni.

	B_LogEntry		(CH3_OrcGraveyard,"Ho salvato la vita del guru Baal Lukor, nel cimitero degli orchi. Tutti i suoi templari sono morti, combattendo contro queste orribili creature.");
};

//**************************************************************************
//	Info SUMMONING
//**************************************************************************
INSTANCE Info_BaalLukor_SUMMONING (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SUMMONING_Condition;
	information	= Info_BaalLukor_SUMMONING_Info;
	nr			= 10;
	permanent	= 0;
	important 	= 0;
	description = "Mi manda Cor Angar!";
};

FUNC INT Info_BaalLukor_SUMMONING_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_SUMMONING_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_01"); //Mi manda Cor Angar! Hai trovato qualche traccia del Dormiente?
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_02"); //Non ancora. Ma che mi dici di Y'Berion? Si è risvegliato?
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_03"); //No, è ancora svenuto.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_04"); //Dobbiamo risolvere l'enigma di queste caverne. Dopo tutte queste orribili perdite, non posso tornare alla comunità a mani vuote.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_05"); //Ma le mie arti belliche sono limitate e gli orchi non reagiscono agli incantesimi come gli abitanti di Campo Vecchio.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_06"); //Visto che la Fratellanza ti ha mandato da me, forse puoi aiutarmi a perlustrare questa tomba.
};

//**************************************************************************
//	Info HELP
//**************************************************************************
INSTANCE Info_BaalLukor_HELP (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HELP_Condition;
	information	= Info_BaalLukor_HELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ti aiuterò.";
};

FUNC INT Info_BaalLukor_HELP_Condition()
{
	return Npc_KnowsInfo(hero, Info_BaalLukor_SUMMONING);
};

FUNC VOID Info_BaalLukor_HELP_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_HELP_15_01"); //Ti aiuterò.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_02"); //Bene. Eccellente. Ci sono tre tunnel che portano fuori da questa sala. Dobbiamo perlustrarli tutti.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //Vai avanti, io ti seguo.

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor si è unito a me. Insieme, scopriremo il segreto di questo antico luogo!");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info FOUNDNONE
//**************************************************************************
INSTANCE Info_BaalLukor_FOUNDNONE (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FOUNDNONE_Condition;
	information	= Info_BaalLukor_FOUNDNONE_Info;
	permanent	= 1;
	important 	= 0;
	description = "Non trovo nulla!";
};

FUNC INT Info_BaalLukor_FOUNDNONE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(BaalLukor_BringParchment == 0)
	&&		!Npc_HasItems(hero, OrkParchmentOne)
	&&		!Npc_HasItems(hero, OrkParchmentTwo)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FOUNDNONE_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDNONE_15_01"); //Non trovo nulla!
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDNONE_13_02"); //Dobbiamo perlustrare tutti e tre i tunnel.
	
	
	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2
};

//**************************************************************************
//	Info FOUNDONE
//**************************************************************************
INSTANCE Info_BaalLukor_FOUNDONE (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FOUNDONE_Condition;
	information	= Info_BaalLukor_FOUNDONE_Info;
	permanent	= 1;
	important 	= 0;
	description = "Sembra che l'altra metà della pergamena non esista.";
};

FUNC INT Info_BaalLukor_FOUNDONE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(((BaalLukor_BringParchment==1) && !Npc_HasItems(hero, OrkParchmentTwo)) || ((BaalLukor_BringParchment==2) && !Npc_HasItems(hero, OrkParchmentOne)))	)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FOUNDONE_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDONE_15_01"); //Sembra che l'altra metà della pergamena non esista.
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDONE_13_02"); //DEVE esserci. Cerchiamo in tutti e tre i tunnel!
	
	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2
};

//**************************************************************************
//	Info FIRSTWAIT
//**************************************************************************
INSTANCE Info_BaalLukor_FIRSTWAIT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FIRSTWAIT_Condition;
	information	= Info_BaalLukor_FIRSTWAIT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_FIRSTWAIT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		(Npc_GetDistToWP(self, "GRYD_040")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FIRSTWAIT_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output 		(self, other,"Info_BaalLukor_FIRSTWAIT_13_01"); //Non possiamo proseguire! Forse queste cavità possono aiutarci.

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "WaitInSideTunnelOne");
};

//**************************************************************************
//	Info FIRSTSCROLL
//**************************************************************************
INSTANCE Info_BaalLukor_FIRSTSCROLL (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FIRSTSCROLL_Condition;
	information	= Info_BaalLukor_FIRSTSCROLL_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ho trovato un pezzo di pergamena!";
};

FUNC INT Info_BaalLukor_FIRSTSCROLL_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		Npc_HasItems	(hero, OrkParchmentOne)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FIRSTSCROLL_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FIRSTSCROLL_15_01"); //Ho trovato un pezzo di pergamena!
	B_GiveInvItems 	(hero, self, OrkParchmentOne,1); //Pergament1 übergeben
	if (BaalLukor_BringParchment == 2)
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_02"); //Molto bene! È la parte mancante dell'incantesimo degli orchi.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_03"); //Sembra un antico incantesimo degli orchi, ma è stato strappato a metà.
		AI_Output 	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_04"); //Dev’esserci l'altra metà, da qualche parte.
		AI_StopProcessInfos	(self);
		BaalLukor_BringParchment = 1;
	};
	
	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info SECONDWAIT
//**************************************************************************
INSTANCE Info_BaalLukor_SECONDWAIT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SECONDWAIT_Condition;
	information	= Info_BaalLukor_SECONDWAIT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_SECONDWAIT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		(Npc_GetDistToWP(self, "GRYD_047")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_SECONDWAIT_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output 		(self, other,"Info_BaalLukor_SECONDWAIT_13_01"); //Uhmm... Questo tunnel è senza uscita! Forse contiene degli indizi che ci aiuteranno in seguito.

	if (!Npc_HasItems	(hero, OrkParchmentTwo)	) 
	{	
		AI_StopProcessInfos	(self);
		Npc_ExchangeRoutine	(self, "WaitInSideTunnelTwo");
	};
};

//**************************************************************************
//	Info SECONDSCROLL
//**************************************************************************
INSTANCE Info_BaalLukor_SECONDSCROLL (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SECONDSCROLL_Condition;
	information	= Info_BaalLukor_SECONDSCROLL_Info;
	permanent	= 0;
	description = "Qui c'è un pezzo di pergamena!";
};

FUNC INT Info_BaalLukor_SECONDSCROLL_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		Npc_HasItems	(hero, OrkParchmentTwo)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_SECONDSCROLL_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self,	hero);

	AI_Output 		(other, self,"Info_BaalLukor_SECONDSCROLL_15_01"); //Qui c'è un pezzo di pergamena!
	B_GiveInvItems 	(hero, self, OrkParchmentTwo,1); //Pergament2 übergeben
	if (BaalLukor_BringParchment == 1)
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_02"); //Molto bene! È la parte mancante dell'incantesimo degli orchi.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_03"); //Sembra un antico incantesimo degli orchi, ma è stato strappato a metà.
		AI_Output 	(self, other,"Info_BaalLukor_SECONDSCROLL_13_04"); //Dev’esserci l'altra metà, da qualche parte.
		AI_StopProcessInfos	(self);
		BaalLukor_BringParchment = 2;
	};

	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info BOTHSCROLLS
//**************************************************************************
INSTANCE Info_BaalLukor_BOTHSCROLLS (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_BOTHSCROLLS_Condition;
	information	= Info_BaalLukor_BOTHSCROLLS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Cosa facciamo con queste due metà?";
};

FUNC INT Info_BaalLukor_BOTHSCROLLS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(BaalLukor_BringParchment == 3)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_BOTHSCROLLS_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_BOTHSCROLLS_15_01"); //Cosa facciamo con queste due metà?
	AI_Output			(self, other,"Info_BaalLukor_BOTHSCROLLS_13_02"); //Combaciano, ma non riesco a tradurre questi simboli.

	B_LogEntry		(CH3_OrcGraveyard,"Abbiamo trovato le due metà di un antico incantesimo degli orchi, ma Baal Lukor non riesce a tradurlo. Continueremo a cercare.");

	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2
};

//**************************************************************************
//	Info RUNES
//**************************************************************************
INSTANCE Info_BaalLukor_RUNES (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_RUNES_Condition;
	information	= Info_BaalLukor_RUNES_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_RUNES_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_BOTHSCROLLS)
	&&		((Npc_GetDistToWP	(hero, "GRYD_025")<600)	|| (Npc_GetDistToWP(hero, "GRYD_048")<600))	)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_RUNES_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_01"); //Aspetta! Interessante...
	AI_Output 		(other, self,"Info_BaalLukor_RUNES_15_02"); //Non trovo nulla d'interessante in questo posto.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_03"); //Fai silenzio e osserva le rune ornamentali di questa caverna.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_04"); //Sì, dovrebbero essere sufficienti a tradurre le due metà della pergamena.
	B_UseFakeScroll ();
	//AI_Output		(self, other,"Info_BaalLukor_RUNES_13_05"); //...(murmel)...(murmel)...(murmel)... 
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_06"); //Fatto! Si tratta di un incantesimo di teletrasporto. Pare che possa funzionare solo in un luogo specifico.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_07"); //Strano!

	Npc_RemoveInvItems	(self,			OrkParchmentOne, 1); //Pergament 1 entfernen
	Npc_RemoveInvItems	(self,			OrkParchmentTwo, 1); //Pergament 2 entfernen
	//Hier Teleport-Übergabe entfernt --> erst wenn vor wand!

	B_LogEntry			(CH3_OrcGraveyard,"Con l'aiuto delle iscrizioni presenti sui muri di una sala, Baal Lukor è riuscito a tradurre la pergamena. Sembra un incantesimo di teletrasporto per un luogo molto vicino."); 


	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2

};

//**************************************************************************
//	Info WHATNOW
//**************************************************************************
INSTANCE Info_BaalLukor_WHATNOW (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_WHATNOW_Condition;
	information	= Info_BaalLukor_WHATNOW_Info;
	permanent	= 1;
	important 	= 0;
	description = "Quale “posto specifico”?";
};

FUNC INT Info_BaalLukor_WHATNOW_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_RUNES)
	&&		Npc_KnowsInfo(hero, Info_BaalLukor_HALLWITHOUT)
	&&		!Npc_KnowsInfo(hero, Info_BaalLukor_HALLWITH)		)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_WHATNOW_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_WHATNOW_15_01"); //Quale “posto specifico”?
	AI_Output 		(self, other,"Info_BaalLukor_WHATNOW_13_02"); //La sala grande che abbiamo attraversato prima sembrava un luogo molto... strano. Torniamo lì!

	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2

};


//**************************************************************************
//	Info HALLWITHOUT
//**************************************************************************
INSTANCE Info_BaalLukor_HALLWITHOUT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HALLWITHOUT_Condition;
	information	= Info_BaalLukor_HALLWITHOUT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_HALLWITHOUT_Condition()
{
	if (	!Npc_KnowsInfo	(hero, Info_BaalLukor_RUNES)
	&&		(Npc_GetDistToWP(hero, "GRYD_055")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_HALLWITHOUT_Info()
{
	B_FullStop		(hero);
	AI_SetWalkmode	(self,	NPC_WALK);
	AI_GotoNpc		(self, hero);

	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_01"); //Questo posto... Non riesco a spiegarlo, ma qui...
	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_02"); //Oh, lascia stare. Deve essere stata la mia immaginazione.

	B_LogEntry	(CH3_OrcGraveyard,"Non appena siamo entrati nella grande sala rettangolare del colonnato, il guru ha sentito qualcosa, anche se non ha saputo spiegare di cosa si trattasse.");

	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2
};

//**************************************************************************
//	Info HALLWITH
//**************************************************************************
INSTANCE Info_BaalLukor_HALLWITH (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HALLWITH_Condition;
	information	= Info_BaalLukor_HALLWITH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_HALLWITH_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_RUNES)
	&&		Npc_GetDistToWP	(hero, "GRYD_055")<500			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_HALLWITH_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_01"); //Questo posto possiede un'aura speciale... L'aura del segreto.
	AI_Output			(other, self,"Info_BaalLukor_HALLWITH_15_02"); //Questa sala mi ricorda l'immagine nella visione.
	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_03"); //La visione... Siamo molto vicini alla nostra meta.

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor, guidato da una forza invisibile, è andato diritto verso uno dei muri della grande sala del colonnato.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "DOOR");
};

//**************************************************************************
//	Info DOOR
//**************************************************************************
INSTANCE Info_BaalLukor_DOOR (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_DOOR_Condition;
	information	= Info_BaalLukor_DOOR_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_DOOR_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HALLWITH)
	&&		Npc_GetDistToWP	(hero, "GRYD_060")<500				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_DOOR_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_01"); //Dietro questo muro... ci siamo!
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_02"); //I miei poteri magici sono ancora molto deboli.
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_03"); //Usa l'incantesimo di teletrasporto degli orchi di fronte a questo muro.
	
	CreateInvItem		(self,			ItArScrollTeleport4); //Teleport erschaffen
	B_GiveInvItems  	(self, hero,	ItArScrollTeleport4, 1); //Teleport übergeben
	
	AI_StopProcessInfos	(self);
};

//**************************************************************************
//	Info TELEPORT
//**************************************************************************
INSTANCE Info_BaalLukor_TELEPORT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_TELEPORT_Condition;
	information	= Info_BaalLukor_TELEPORT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_TELEPORT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_DOOR)
	&&		Npc_CanSeeNpcFreeLOS(self,	hero)	
	&&		Npc_GetDistToWP	(hero, "GRYD_072")<550				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_TELEPORT_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_01"); //Hai trovato il luogo segreto. Il mio istinto non mentiva.
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_02"); //La risposta alla strana invocazione del Dormiente giace davvero qui???
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_03"); //A me sembra solo un'altra sala funeraria.
	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_04"); //Dobbiamo procedere.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //Vai avanti, io ti seguo.

	B_LogEntry		(CH3_OrcGraveyard,"Grazie all'incantesimo di teletrasporto degli orchi, ho scoperto un tunnel segreto che ci permetterà di abbandonare la grande sala del colonnato.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"TELEPORT");
};

//**************************************************************************
//	Info ALTAR
//**************************************************************************
INSTANCE Info_BaalLukor_ALTAR (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_ALTAR_Condition;
	information	= Info_BaalLukor_ALTAR_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_ALTAR_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_TELEPORT)
	&&		Npc_GetDistToWP	(hero, "GRYD_082")<400
	&&		Npc_CanSeeNpcFreeLOS(self,hero)						)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_ALTAR_Info()
{
	B_FullStop			(hero);
	AI_GotoWP			(hero, "GRYD_081");
	AI_AlignToWP		(hero);

	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_01"); //NO! Non può essere! Non c'è altro che ossa... e polvere.

	AI_SetWalkmode		(self, NPC_RUN);
	AI_GotoWP			(self, "GRYD_082");

	AI_PlayAniBS		(self, "T_STAND_2_PRAY", BS_SIT);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_02"); //NO!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_03"); //MAESTRO, PARLAMI!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_04"); //DORMIENTE, RIVELATI!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_05"); //NOOOOO!!!

	AI_Output			(hero, self,"Info_BaalLukor_ALTAR_15_06"); //Ci siamo. È impazzito del tutto!

	AI_StandUp			(self);
	B_WhirlAround		(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_07"); //È tutta colpa tua! La tua presenza sacrilega ha fatto infuriare il Dormiente!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_08"); //Ora dovrò soffrire io, per il tuo comportamento blasfemo!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_09"); //Devo compiere un sacrificio per il maestro! Un SACRIFICIO UMANO!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_10"); //Allora m'illuminerà e farà di me il suo servo.
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_11"); //MUORI, INFEDELE!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_12"); //AIIIEEEEHHHHHH!!!!!!

	self.flags = 0;
	self.npctype = NPCTYPE_MAIN;
	BaalLukor_BringParchment = 4;
	Npc_SetTempAttitude	(self,	ATT_HOSTILE);
	Npc_SetPermAttitude	(self,	ATT_HOSTILE);
	//CreateInvItems		(self,	ItArScrollPyrokinesis,	3);

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor è impazzito, quando ha capito che quaggiù non c'è ASSOLUTAMENTE NULLA, e mi ha attaccato. Cor Angar non sarà felice di apprendere questa storia.");

	AI_StopProcessInfos	(self);

	AI_StartState		(self,	ZS_Attack,	1,	"");
};





