//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_OrcShaman_EXIT (C_INFO)
{
	npc			= ORC_2200_Shaman;
	nr			= 999;
	condition	= Info_OrcShaman_EXIT_Condition;
	information	= Info_OrcShaman_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_OrcShaman_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_OrcShaman_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info THX
//---------------------------------------------------------------------
instance  Info_OrcShaman_THX (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_THX_Condition;
	information	= Info_OrcShaman_THX_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_OrcShaman_THX_Condition()
{	
	if	(Kapitel == 4)
	{
		return TRUE;
	};
};
FUNC void  Info_OrcShaman_THX_Info()
{
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_01"); //Ti devo favore, straniero.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_02"); //Orchi cattivi voleva uccidere me.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_03"); //Vecchi fratelli ora nemici.
}; 

//---------------------------------------------------------------------
//	Info WHO
//---------------------------------------------------------------------
instance  Info_OrcShaman_WHO (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_WHO_Condition;
	information	= Info_OrcShaman_WHO_Info;
	important	= 0;
	permanent	= 0;
	description = "Chi sei?";
};

FUNC int  Info_OrcShaman_WHO_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_WHO_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_WHO_15_01"); //Chi sei?
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_02"); //Nome Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_03"); //Essere figlio di spirito. Gente chiama sciamano.
}; 

//---------------------------------------------------------------------
//	Info TONGUE
//---------------------------------------------------------------------
instance  Info_OrcShaman_TONGUE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_TONGUE_Condition;
	information	= Info_OrcShaman_TONGUE_Info;
	important	= 0;
	permanent	= 0;
	description = "Come fai a conoscere la mia lingua?";
};

FUNC int  Info_OrcShaman_TONGUE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_TONGUE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_TONGUE_15_01"); //Come fai a conoscere la mia lingua?
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_02"); //Ur-Shak era schiavo di umani in miniera.
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_03"); //Lui scappato. Successo molti inverni fa.
}; 

//---------------------------------------------------------------------
//	Info MINE
//---------------------------------------------------------------------
instance  Info_OrcShaman_MINE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_MINE_Condition;
	information	= Info_OrcShaman_MINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Eri schiavo in miniera? Quale miniera?";
};

FUNC int  Info_OrcShaman_MINE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_TONGUE))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_MINE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_MINE_15_01"); //Eri schiavo in miniera? Quale miniera?
	AI_Output 		(self, hero,"Info_OrcShaman_MINE_17_02"); //Miniera sotto villaggio in Buca.
}; 

//---------------------------------------------------------------------
//	Info WHY
//---------------------------------------------------------------------
instance  Info_OrcShaman_WHY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_WHY_Condition;
	information	= Info_OrcShaman_WHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Perché i tuoi fratelli ti attaccano?";
};

FUNC int  Info_OrcShaman_WHY_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_WHY_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_WHY_15_01"); //Perché i tuoi fratelli ti attaccano?
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_02"); //Ur-Shak malvoluto.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_03"); //Infangato nome di KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_04"); //Crede KRUSHAK demone cattivo.
}; 

//---------------------------------------------------------------------
//	Info KRUSHAK
//---------------------------------------------------------------------
instance  Info_OrcShaman_KRUSHAK (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_KRUSHAK_Condition;
	information	= Info_OrcShaman_KRUSHAK_Info;
	important	= 0;
	permanent	= 0;
	description = "Cosa significa KRUSHAK?";
};

FUNC int  Info_OrcShaman_KRUSHAK_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_WHY))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_KRUSHAK_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_01"); //Cosa significa KRUSHAK?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_02"); //Umani chiama DORME.
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_03"); //Vuoi dire 'Dormiente'?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_04"); //Sì! Umani dice DORMIENTE!
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_OrcShaman_SLEEPER (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SLEEPER_Condition;
	information	= Info_OrcShaman_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "Cosa sai del Dormiente?";
};

FUNC int  Info_OrcShaman_SLEEPER_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_KRUSHAK))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_01"); //Cosa sai del Dormiente?
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_02"); //C'era cinque fratelli, molti inverni fa!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_03"); //Era figli di spirito, come Ur-Shak!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_04"); //Vuoi dire cinque sciamani!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_05"); //Chiamato KRUSHAK!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_06"); //Voleva sconfiggere clan di nemici!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_07"); //Allora cinque fratelli costruisce tempio sottoterra per KRUSHAK!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_08"); //Un tempio sotterraneo per il Dormiente! Ecco cosa intendeva Xardas, affermando che l'ingresso si trova 'nella città degli orchi'!
}; 

//---------------------------------------------------------------------
//	Info CURSE
//---------------------------------------------------------------------
instance  Info_OrcShaman_CURSE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_CURSE_Condition;
	information	= Info_OrcShaman_CURSE_Info;
	important	= 0;
	permanent	= 0;
	description = "Cosa è successo nel tempio sotterraneo?";
};

FUNC int  Info_OrcShaman_CURSE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_SLEEPER))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_CURSE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_01"); //Cosa è successo nel tempio sotterraneo?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_02"); //Fratelli dato cuore a KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_03"); //Ma KRUSHAK cattivo. Maledetto tutti costruttori di tempio.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_04"); //Fratelli non avere cuore, essere morti e vivi. Insieme.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_05"); //KRUSHAK ora avere cuore di fratelli. Cuore è potere per KRUSHAK.
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_06"); //Cosa è successo ai lavoratori che hanno costruito il tempio?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_07"); //KRUSHAK maledetto tutti. Anche lavoratori. Tutti morti e vivi allo stesso tempo.
}; 

//---------------------------------------------------------------------
//	Info OUTSIDE
//---------------------------------------------------------------------
instance  Info_OrcShaman_OUTSIDE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_OUTSIDE_Condition;
	information	= Info_OrcShaman_OUTSIDE_Info;
	important	= 0;
	permanent	= 0;
	description = "E gli orchi in superficie non hanno fatto nulla?";
};

FUNC int  Info_OrcShaman_OUTSIDE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_CURSE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_OUTSIDE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_OUTSIDE_15_01"); //E gli orchi in superficie non hanno fatto nulla?
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_02"); //Loro sigillato tempio. Oggi fratelli adorare KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_03"); //KRUSHAK vuole sacrificio, così no diventa cattivo.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_04"); //Ur-Shak crede che sacrificio è cosa cattiva. Detto che KRUSHAK cattivo.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_05"); //Fratelli no vuole ascoltare. Fratelli dice Ur-Shak andare via. Fratelli colpisce Ur-Shak.
}; 

//---------------------------------------------------------------------
//	Info INTEMPLE
//---------------------------------------------------------------------
instance  Info_OrcShaman_INTEMPLE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_INTEMPLE_Condition;
	information	= Info_OrcShaman_INTEMPLE_Info;
	important	= 0;
	permanent	= 0;
	description = "Devo entrare nel tempio sotterraneo. Puoi condurmi là?";
};

FUNC int  Info_OrcShaman_INTEMPLE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_OUTSIDE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_INTEMPLE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_01"); //Devo entrare nel tempio sotterraneo. Puoi condurmi là?
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_02"); //Ur-Shak dice grazie a straniero. Straniero salvato Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_03"); //Ma entrata di tempio essere patria. Ur-Shak non può andare patria.
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_04"); //Capisco. Vuoi dire che non ti lasciano rientrare nella città degli orchi.
};

//---------------------------------------------------------------------
//	Info MAP
//---------------------------------------------------------------------
instance  Info_OrcShaman_MAP (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_MAP_Condition;
	information	= Info_OrcShaman_MAP_Info;
	important	= 0;
	permanent	= 0;
	description = "Puoi mostrarmi la città sulla mia mappa?";
};

FUNC int  Info_OrcShaman_MAP_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_OrcShaman_INTEMPLE)
	&&	Npc_HasItems (hero, ItWrWorldmap)
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_MAP_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_01"); //Puoi mostrarmi la città sulla mia mappa?
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_02"); //Patria di Ur-Shak essere dove mappa vuota.
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_03"); //Straniero dare mappa, Ur-Shak completare!
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_04"); //(disegna sulla mappa)
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_05"); //Incredibile! Sei un ottimo cartografo, grazie!

	B_GiveInvItems  (hero, self, ItWrWorldmap, 1);
	Npc_RemoveInvItem(self, ItWrWorldmap);
	CreateInvItem	 (self, ItWrWorldmap_Orc);
	B_GiveInvItems  (self, hero, ItWrWorldmap_Orc, 1);
}; 

//---------------------------------------------------------------------
//	Info FIGHT
//---------------------------------------------------------------------
instance  Info_OrcShaman_FIGHT (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_FIGHT_Condition;
	information	= Info_OrcShaman_FIGHT_Info;
	important	= 0;
	permanent	= 0;
	description = "Sembra che dovrò farmi strada combattendo!";
};

FUNC int  Info_OrcShaman_FIGHT_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_INTEMPLE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_FIGHT_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_FIGHT_15_01"); //Sembra che dovrò farmi strada combattendo!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_02"); //Patria di fratelli molto forte! Fratelli essere molto tantiiissimi!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_03"); //Straniero no va. Molti guerrieri! Straniero muore!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_04"); //Altri figli di spirito in patria. Straniero fa fuoco, allora straniero muore!
}; 

//---------------------------------------------------------------------
//	Info OTHERWAY
//---------------------------------------------------------------------
instance  Info_OrcShaman_OTHERWAY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_OTHERWAY_Condition;
	information	= Info_OrcShaman_OTHERWAY_Info;
	important	= 0;
	permanent	= 0;
	description = "Va bene, va bene... Ma devo trovare il modo di entrare nel tempio!";
};

FUNC int  Info_OrcShaman_OTHERWAY_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_FIGHT))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_OTHERWAY_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_01"); //Va bene, va bene... Ma devo trovare il modo di entrare nel tempio!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_02"); //Ur-Shak conosce strada! Straniero indossa ULU-MULU!
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_03"); //ULU-MULU? Cosa sarebbe un ULU-MULU?
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_04"); //Essere segno di amicizia! Fratelli rispettare ULU-MULU!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_05"); //Straniero indossa ULU-MULU, straniero no muore!
};

//---------------------------------------------------------------------
//	Info ULUMULU
//---------------------------------------------------------------------
instance  Info_OrcShaman_ULUMULU (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_ULUMULU_Condition;
	information	= Info_OrcShaman_ULUMULU_Info;
	important	= 0;
	permanent	= 0;
	description = "Dove trovo questo ULU-MULU?";
};

FUNC int  Info_OrcShaman_ULUMULU_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_OTHERWAY))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_ULUMULU_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_01"); //Dove trovo questo ULU-MULU?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_02"); //Straniero va e trova amico di Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_03"); //Amico di Ur-Shak dare ULU-MULU! Straniero indossa ULU-MULU, straniero no muore!
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_04"); //Sì, sì, ho capito che 'no muore', ma dove trovo il tuo amico?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_05"); //Amico di Ur-Shak in miniera di umani. Amico no scappato via con Ur-Shak. Amico ammalato.

	B_Story_FoundUrShak	();
	
	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Eravate tenuti nella miniera libera?",										Info_OrcShaman_ULUMULU_FM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Eravate prigionieri nella miniera abbandonata?",									Info_OrcShaman_ULUMULU_VM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Eravate chiusi dentro la vecchia miniera?",										Info_OrcShaman_ULUMULU_AM);
}; 

func void Info_OrcShaman_ULUMULU_VM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_08"); //Eravate prigionieri nella miniera abbandonata?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_09"); //Ur-Shak no capito.
};

func void Info_OrcShaman_ULUMULU_AM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_10"); //Eravate chiusi dentro la vecchia miniera?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_11"); //Ur-Shak no capisce!
};

func void Info_OrcShaman_ULUMULU_FM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_12"); //Eravate tenuti nella miniera libera?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_13"); //Ur-Shak prigioniero sotto villaggio in Buca.
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_14"); //Ur-Shak crede che gente chiama così!

	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
};

//---------------------------------------------------------------------
//	Info BYEBYE
//---------------------------------------------------------------------
instance  Info_OrcShaman_BYEBYE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_BYEBYE_Condition;
	information	= Info_OrcShaman_BYEBYE_Info;
	important	= 0;
	permanent	= 0;
	description = "Grazie per l'aiuto!";
};

FUNC int  Info_OrcShaman_BYEBYE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_ULUMULU))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_BYEBYE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_01"); //Grazie per l'aiuto!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_02"); //Ur-Shak dice grazie a straniero. Straniero salvato Ur-Shak. Ora straniero amico di Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_03"); //Amico prende regalo. Talismano di Ur-Shak! Talismano protegge da fiato di lucertola di fuoco!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_04"); //Ur-Shak no tornare patria. Ur-Shak ora vive qui! Amico torna se serve aiuto!
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_05"); //Potrei averne bisogno!

	B_Story_FriendOfUrShak	();

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info FRIENDLYHELLO
//---------------------------------------------------------------------
instance  Info_OrcShaman_FRIENDLYHELLO (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_FRIENDLYHELLO_Condition;
	information	= Info_OrcShaman_FRIENDLYHELLO_Info;
	important	= 0;
	permanent	= 0;
	description = "Come va, amico mio?";
};

FUNC int  Info_OrcShaman_FRIENDLYHELLO_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_OrcShaman_BYEBYE)
	&&	FriendOfUrShak
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_FRIENDLYHELLO_Info()
{
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_01"); //Come va, amico mio?
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_02"); //Ur-Shak in salute!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_03"); //Ur-Shak ora cerca suo ULU-MULU!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_04"); //Forse Ur-Shak tornare patria, se trova suo ULU-MULU!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_05"); //Amico torna se serve aiuto!
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_06"); //Stai attento!
	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info ORCCITY
//---------------------------------------------------------------------
instance  Info_OrcShaman_ORCCITY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_ORCCITY_Condition;
	information	= Info_OrcShaman_ORCCITY_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_OrcShaman_ORCCITY_Condition()
{	
	if	(Npc_GetDistToWP(hero, "SPAWN_OW_WARAN_ORC_01")<1000)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_ORCCITY_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(hero, self);

	AI_Output 		(self, hero,"Info_OrcShaman_ORCCITY_17_01"); //Ur-Shak saluta amico!

	if (Npc_HasItems(hero, UluMulu))
	{
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_02"); //Amico ha ULU-MULU! Bene!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_03"); //Amico no dimentica tenere ULU-MULU in mano, quando va su ponte!
	}
	else
	{	
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_04"); //Amico no ha ULU-MULU! No bene!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_05"); //Amico no va su ponte, sennò muore!
	};
}; 

//---------------------------------------------------------------------
//	Info YOUHERE
//---------------------------------------------------------------------
instance  Info_OrcShaman_YOUHERE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_YOUHERE_Condition;
	information	= Info_OrcShaman_YOUHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "Cosa ci fai così vicino alla città?";
};

FUNC int  Info_OrcShaman_YOUHERE_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_ORCCITY)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_YOUHERE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_01"); //Cosa ci fai così vicino alla città?
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_02"); //Ur-Shak guarda fratelli in patria!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_03"); //Ur-Shak crede KRUSHAK svegliare presto!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_04"); //Ur-Shak aspetta qui e combatte KRUSHAK quando sveglia!
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_05"); //Il Dormiente si sveglierà presto? Spero che ti sbagli!
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_06"); //Considerando tutto ciò che ho sentito su di lui, preferirei che continuasse a dormire!
}; 

//---------------------------------------------------------------------
//	Info SEAL
//---------------------------------------------------------------------
instance  Info_OrcShaman_SEAL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SEAL_Condition;
	information	= Info_OrcShaman_SEAL_Info;
	important	= 0;
	permanent	= 0;
	description = "Mi hai detto che i tuoi fratelli hanno sigillato il tempio!";
};

FUNC int  Info_OrcShaman_SEAL_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_ORCCITY)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_SEAL_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SEAL_15_01"); //Nel nostro ultimo incontro, mi hai detto che i tuoi fratelli hanno sigillato il tempio!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_02"); //Fratelli di Ur-Shak sigillato tempio in terra molto bene!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_03"); //Amico no entra!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_04"); //Amico usa magia da fratelli figli di spirito come Ur-Shak!
}; 

//---------------------------------------------------------------------
//	Info SCROLL
//---------------------------------------------------------------------
instance  Info_OrcShaman_SCROLL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SCROLL_Condition;
	information	= Info_OrcShaman_SCROLL_Info;
	important	= 0;
	permanent	= 0;
	description = "Dove trovo questa magia?";
};

FUNC int  Info_OrcShaman_SCROLL_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_SEAL)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_SCROLL_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SCROLL_15_01"); //Dove trovo questa magia?
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_02"); //Andare in caverna di fratelli figli di spirito come Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_03"); //Ma amico stare attento quando usa magia!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_04"); //Fratelli di Ur-Shak no piace! ULU-MULU no aiuta se amico usa magia!

	B_LogEntry		(CH4_EnterTemple,"Ho incontrato nuovamente lo sciamano Ur-Shak, davanti alla città degli orchi, e mi ha detto che solo un incantesimo degli orchi mi permetterà di accedere al vestibolo del tempio sotterraneo. Gli altri orchi sciamani conservano questo tipo d'incantesimi nelle loro caverne.");
}; 

//---------------------------------------------------------------------
//	Info IDOL
//---------------------------------------------------------------------
instance  Info_OrcShaman_IDOL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_IDOL_Condition;
	information	= Info_OrcShaman_IDOL_Info;
	important	= 0;
	permanent	= 0;
	description = "C'è un altro modo per entrare nel tempio?";
};

FUNC int  Info_OrcShaman_IDOL_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_SCROLL)
	&&	!OrcCity_Sanctum_OuterGateOpen
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_IDOL_Info()
{
	//SN: fliegt raus, da der Hinweis jetzt sofort nach dem Hinweis mit der Scroll gegeben wird.
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_01"); //Ich habe den Teleportzauber verbraucht und das Gitter zur Tempelvorhalle lässt sich nicht öffnen!
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_02"); //Wie komme ich jetzt wieder in den Tempel?

	if	Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01) 
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_03"); //Amico trovato figura su colonna!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_04"); //Amico ora può apre cancello per sala di tempio!

		B_LogEntry	(CH4_EnterTemple,"C'è un altro modo per accedere al tempio. Devo usare la statuina del Dormiente, che si trova sulla sacra colonna degli orchi sciamani. Essa apre la porta del tempio.");
	}
	else
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_05"); //Amico ora deve prendere figura da colonna!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_06"); //Figura apre porta per sala di tempio!

		B_LogEntry	(CH4_EnterTemple,"C'è un altro modo per accedere al tempio. Sulla sacra colonna degli orchi sciamani, c'è una statuina del Dormiente che può aprire la porta del tempio. I fratelli di Ur-Shak non saranno contenti, quando scopriranno che sto usando la loro icona sacra.");
	};
}; 

