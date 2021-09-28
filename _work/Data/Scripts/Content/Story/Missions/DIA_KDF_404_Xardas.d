//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_Xardas_EXIT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	nr			= 999;
	condition	= Info_Xardas_EXIT_Condition;
	information	= Info_Xardas_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Xardas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Xardas_EXIT_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneFireball))
	{
		CreateInvItem (self, ItArRuneFireball);
	};
	if (Npc_HasItems (self,ItArScrollSummonDemon)<1)
	{
		CreateInvItems (self, ItArScrollSummonDemon,2);
	};

};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DISTURB
//---------------------------------------------------------------------
instance  Info_Xardas_DISTURB (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DISTURB_Condition;
	information	= Info_Xardas_DISTURB_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_Xardas_DISTURB_Condition()
{	
	if	/*(FindGolemHearts == 4)
	&&	*/!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_DISTURB_Info()
{
	B_WhirlAround	(self, hero);
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_01"); //CHI OSA DISTURBARE I MIEI STUDI?
	AI_Output 		(hero, self,"Info_Xardas_DISTURB_15_02"); //Mi chiamo...
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_03"); //Non m'interessa il tuo nome. È insignificante.
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_04"); //L'unica cosa importante è che sei la prima persona in tanti anni a risolvere gli enigmi del Golem.
}; 

//---------------------------------------------------------------------
//	Info OTHERS
//---------------------------------------------------------------------
instance  Info_Xardas_OTHERS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_OTHERS_Condition;
	information	= Info_Xardas_OTHERS_Info;
	important	= 0;
	permanent	= 0;
	description = "Ci sono stati altri visitatori?";
};

FUNC int  Info_Xardas_OTHERS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_OTHERS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_01"); //Ci sono stati altri visitatori?
	AI_Output 		(self, hero,"Info_Xardas_OTHERS_14_02"); //Non molti e, quando hanno iniziato a disturbarmi, li ho presentati a una delle mie creature sovrannaturali.
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_03"); //Ti piace startene per conto tuo, vero?
}; 

//---------------------------------------------------------------------
//	Info SATURAS
//---------------------------------------------------------------------
instance  Info_Xardas_SATURAS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SATURAS_Condition;
	information	= Info_Xardas_SATURAS_Info;
	important	= 0;
	permanent	= 0;
	description = "Mi manda Saturas. Abbiamo bisogno del tuo aiuto!";
};

FUNC int  Info_Xardas_SATURAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SATURAS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_01"); //Mi manda Saturas. Abbiamo bisogno del tuo aiuto!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_02"); //I Maghi dell'Acqua vogliono usare il cumulo di metallo...
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_03"); //Il cumulo di metallo NON è la soluzione!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_04"); //No?
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_05"); //NO!
}; 

//---------------------------------------------------------------------
//	Info KDW
//---------------------------------------------------------------------
instance  Info_Xardas_KDW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_KDW_Condition;
	information	= Info_Xardas_KDW_Info;
	important	= 0;
	permanent	= 0;
	description = "Tutti i Maghi del Fuoco sono morti!";
};

FUNC int  Info_Xardas_KDW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_KDW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_01"); //Tutti i Maghi del Fuoco sono morti!
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_02"); //Gomez li ha fatti uccidere.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_03"); //Non mi sorprende. Non avrebbero mai dovuto fidarsi di quei barbari macellai del castello, Gomez per primo.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_04"); //Corristo e gli altri maghi hanno scelto il proprio boia, quando hanno aiutato Gomez a usurpare il potere.
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_Xardas_SLEEPER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SLEEPER_Condition;
	information	= Info_Xardas_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "Il cosiddetto 'Dormiente' è un demone malvagio.";
};

FUNC int  Info_Xardas_SLEEPER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_01"); //Il cosiddetto 'Dormiente' è un demone malvagio.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_02"); //Questo è quanto ha scoperto la Fratellanza della palude.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_03"); //Ora i Maghi dell'Acqua ritengono che chiunque nella colonia sia in grave pericolo.
	AI_Output 		(self, hero,"Info_Xardas_SLEEPER_14_04"); //Il pericolo è molto più grande di quanto chiunque, all'interno della Barriera, possa mai immaginare. 
}; 

//---------------------------------------------------------------------
//	Info DANGER
//---------------------------------------------------------------------
instance  Info_Xardas_DANGER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DANGER_Condition;
	information	= Info_Xardas_DANGER_Info;
	important	= 0;
	permanent	= 0;
	description = "Se l'esplosione del cumulo di metallo non riesce ad allontanare il pericolo...";
};

FUNC int  Info_Xardas_DANGER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_SLEEPER)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SATURAS)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_DANGER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_01"); //Se l'esplosione del cumulo di metallo non riesce ad allontanare il pericolo...
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_02"); //...Dimentica il cumulo di metallo! Il suo potere non riuscirà ad aprire la Barriera!
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_03"); //Se, in tutti questi anni, Corristo e Saturas non avessero perso tempo in stupidi e vani combattimenti, ora saprebbero ciò che so io.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_04"); //Cioè?
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_05"); //Nessuno dei dodici maghi ha mai capito perché la formazione della Barriera fosse sfuggita al loro controllo, assumendo tali gigantesche proporzioni.
};

//---------------------------------------------------------------------
//	Info BARRIER
//---------------------------------------------------------------------
instance  Info_Xardas_BARRIER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_BARRIER_Condition;
	information	= Info_Xardas_BARRIER_Info;
	important	= 0;
	permanent	= 0;
	description = "Tu hai scoperto cosa è successo?";
};

FUNC int  Info_Xardas_BARRIER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DANGER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_BARRIER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_01"); //Tu hai scoperto cosa è successo? 
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_02"); //Beh, una cosa è certa: la risposta giace sepolta all'interno della città degli orchi.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_03"); //La città degli orchi?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_04"); //Gli orchi non sono animali, come molti ritengono. La loro cultura è tanto antica quanto quella umana.
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_05"); //Alcuni secoli fa, cinque orchi sciamani evocarono un antico demone, sperando che avrebbe conferito al loro clan il potere di sconfiggere i nemici.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_06"); //Questo demone era il Dormiente?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_07"); //Gli orchi gli hanno dato questo nome molto tempo dopo. Ma non ti dirò perché, né il motivo per cui ora sono terrorizzati da questa creatura sovrannaturale!
}; 

//---------------------------------------------------------------------
//	Info EVENT
//---------------------------------------------------------------------
instance  Info_Xardas_EVENT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENT_Condition;
	information	= Info_Xardas_EVENT_Info;
	important	= 0;
	permanent	= 0;
	description = "Perché?";
};

FUNC int  Info_Xardas_EVENT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_BARRIER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_01"); //Perché no?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_02"); //Penso che tu sia... NO. Per esserne certo, dovrai completare ancora una missione!
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_03"); //Quale missione?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_04"); //Ascolta attentamente: gli orchi hanno esiliato uno dei loro sciamani.
}; 

//---------------------------------------------------------------------
//	Info EVENTWHY
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHY (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHY_Condition;
	information	= Info_Xardas_EVENTWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Per quale motivo?";
};

FUNC int  Info_Xardas_EVENTWHY_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHY_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHY_15_01"); //Per quale motivo?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHY_14_02"); //L'orco guerriero non ha fatto in tempo a rispondere a questa domanda, quando è stato interrogato da uno dei miei demoni: è morto prima.
}; 

//---------------------------------------------------------------------
//	Info EVENTHOW
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTHOW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTHOW_Condition;
	information	= Info_Xardas_EVENTHOW_Info;
	important	= 0;
	permanent	= 0;
	description = "Cosa c'entra quest'orco sciamano con la mia missione?";
};

FUNC int  Info_Xardas_EVENTHOW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTHOW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_01"); //Cosa c'entra quest'orco sciamano con la mia missione.
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_02"); //Lui ti racconterà il resto della storia del Dormiente.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_03"); //Un orco sciamano non parlerà volentieri con me!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_04"); //Vuoi il mio aiuto o no?
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_05"); //Beh, sì. Ma...
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_06"); //Allora non mettere più in dubbio le mie parole!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_07"); //Trova lo sciamano. Egli non è in buoni rapporti coi suoi fratelli di città, quindi potrebbe ascoltarti... prima di trasformarti in una torcia umana!
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_08"); //Davvero rassicurante!
}; 

//---------------------------------------------------------------------
//	Info EVENTWHERE
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHERE (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHERE_Condition;
	information	= Info_Xardas_EVENTWHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "Dove si trova questo sciamano esiliato?";
};

FUNC int  Info_Xardas_EVENTWHERE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHERE_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_01"); //Dove si trova questo sciamano esiliato?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_02"); //Vai alla vecchia cittadella a est. Non puoi sbagliare: è in cima a un'alta montagna, visibile da molto lontano.
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_03"); //Si può entrare facilmente?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_04"); //La chiamano la vecchia cittadella, ma sono rimasti solo i muri portanti delle case. Da molti decenni non ospita che rovine.
}; 

//---------------------------------------------------------------------
//	Info ACCEPT
//---------------------------------------------------------------------
instance  Info_Xardas_ACCEPT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_ACCEPT_Condition;
	information	= Info_Xardas_ACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description = "Avrò le risposte dallo sciamano!";
};

FUNC int  Info_Xardas_ACCEPT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHY)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTHOW)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHERE)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_ACCEPT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_ACCEPT_15_01"); //Avrò le risposte dallo sciamano!
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_02"); //Il mio servitore ti ha consegnato una runa di teletrasporto per il pentacolo al piano di sotto.
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_03"); //In questo modo potrai tornare più facilmente qui.

	B_Story_CordsPost();		// Falls Spieler Gorn am Wassermagier-Pentragramm nicht angesprochen hat!
	B_Story_FindOrcShaman();
	
	AI_StopProcessInfos(self);
}; 
/*------------------------------------------------------------------------
						SCROLLS UND RUNEN VERKAUFEN							
------------------------------------------------------------------------*/

instance  Kdf_404_Xardas_SELLMAGICSTUFF (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information		= Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important		= 0;
	permanent		= 1;
	trade			= 1;
	description		= "Sono alla ricerca della conoscenza magica."; 
	
};

FUNC int  Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{	
	if ( Npc_KnowsInfo(hero, Info_Xardas_ACCEPT))
	{
		return TRUE;
	};

};
FUNC void  Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Sono alla ricerca della conoscenza magica.
};

//---------------------------------------------------------------------
//	Info RETURN
//---------------------------------------------------------------------
instance  Info_Xardas_RETURN (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_RETURN_Condition;
	information	= Info_Xardas_RETURN_Info;
	important	= 0;
	permanent	= 0;
	description = "Ho le risposte dell'orco sciamano!";
};

FUNC int  Info_Xardas_RETURN_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredTemple
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_RETURN_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_01"); //Ho le risposte dell'orco sciamano!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_02"); //Ottimo, dimmi tutto!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_03"); //I cinque orchi sciamani che hanno evocato il Dormiente hanno eretto un tempio sotterraneo in suo onore. L'entrata si trova nella città degli orchi.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_04"); //Bene!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_05"); //A dimostrazione delle propria ingratitudine, il demone ha strappato loro il cuore, condannandoli insieme ai lavoratori a un'esistenza da morti viventi.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_06"); //Molto bene, molto bene!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_07"); //Gli orchi hanno sigillato il tempio e iniziato a compiere sacrifici per placare il demone.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_08"); //Hai trovato il modo di entrare nel tempio?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_09"); //Sì, c'è un orco che...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_10"); //Non m'interessa! Recati subito al tempio sotterraneo! Lì risiede l'unico modo per distruggere la Barriera!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_11"); //Non capisco!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_12"); //Non hai chiesto il mio aiuto per distruggere la Barriera?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_13"); //Certo, ma...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_14"); //ALLORA VAI! Abbiamo sprecato fin troppo tempo! Troverai la risposta nel tempio sotterraneo!

	B_Story_ReturnedFromUrShak();
}; 

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info FOUNDTEMPLE
//---------------------------------------------------------------------
instance  Info_Xardas_FOUNDTEMPLE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FOUNDTEMPLE_Condition;
	information		= Info_Xardas_FOUNDTEMPLE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ho trovato l'entrata per il tempio sotterraneo!"; 
};

FUNC int  Info_Xardas_FOUNDTEMPLE_Condition()
{	
	if (EnteredTemple)
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_FOUNDTEMPLE_Info()
{
	AI_Output (other, self,"Info_Xardas_FOUNDTEMPLE_15_01"); //Ho trovato l'entrata per il tempio sotterraneo!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_02"); //TU HAI... Incredibile!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_03"); //Sei diventato davvero potente! Più di chiunque altro, all'interno della Barriera.
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_04"); //Forse sei davvero colui di cui parlano le profezie degli orchi!
};

//---------------------------------------------------------------------
//	Info PROPHECY
//---------------------------------------------------------------------
instance  Info_Xardas_PROPHECY (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_PROPHECY_Condition;
	information		= Info_Xardas_PROPHECY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Profezie? Quali profezie?"; 
};

FUNC int  Info_Xardas_PROPHECY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Xardas_FOUNDTEMPLE))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_PROPHECY_Info()
{
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_01"); //Profezie? Quali profezie?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_02"); //Alcuni antichi documenti degli orchi, redatti immediatamente dopo la chiusura del tempio sotterraneo, parlano di un 'nemico sacro'.
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_03"); //Un nemico sacro?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_04"); //Colui che sarebbe giunto per spazzare via definitivamente il Dormiente dal nostro mondo.
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_05"); //E io dovrei essere il tizio di cui parlano queste profezie? Sei fuori strada!
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_06"); //Forse... E forse no!
};

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD_Condition;
	information		= Info_Xardas_LOADSWORD_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ho trovato una spada strana."; 
};

FUNC int  Info_Xardas_LOADSWORD_Condition()
{	
	if ( Npc_HasItems ( hero, Mythrilklinge ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD_Info()
{
	AI_Output				(other, self,"Info_Xardas_LOADSWORD_15_01"); //Ho trovato una spada strana.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_02"); //Mostramela.

	CreateInvItem 			(self, Mythrilklinge01);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);

	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_03"); //Interessante... Sopra c'è incisa la parola 'URIZIEL'.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_04"); //Ho sentito parlare di questa spada. Si tratta di un'arma antica, risalente al periodo in cui la razza umana era ancora molto giovane.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_05"); //È stata forgiata con un materiale sconosciuto e non si sa chi l'abbia creata!
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_06"); //SI dice che la sua lama possieda poteri inimmaginabili, ma non vedo alcuna aura magica! 
	
	Npc_RemoveInvItem 		(hero, Mythrilklinge);	
	CreateInvItem 			(hero, Mythrilklinge01);
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD01 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD01_Condition;
	information		= Info_Xardas_LOADSWORD01_Info;
	important		= 0;
	permanent		= 0;
	description		= "URIZIEL possiede poteri inimmaginabili?"; 
};

FUNC int  Info_Xardas_LOADSWORD01_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD ))
	{			
		return TRUE;
	};	
};


FUNC void  Info_Xardas_LOADSWORD01_Info()
{
	Npc_RemoveInvItem 	(self, Mythrilklinge01);

	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_01"); //URIZIEL possiede poteri inimmaginabili?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_02"); //È scritto che il possessore di quest'arma potrà perforare l'armatura più potente e annullare qualsiasi incantesimo di protezione.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_03"); //Come hanno fatto gli orchi a mettere le mani su un'arma così potente?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_04"); //Si narra che l'abbiano strappata a un potente guerriero. Non sapevano come usarla, quindi l'hanno nascosta!
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_05"); //Non abbastanza!
};

//---------------------------------------------------------------------
//	Info LOADSWORD02
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD02 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD02_Condition;
	information		= Info_Xardas_LOADSWORD02_Info;
	important		= 0;
	permanent		= 0;
	description		= "È possibile ripristinare gli antichi poteri della spada?"; 
};

FUNC int  Info_Xardas_LOADSWORD02_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD01 ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD02_Info()
{
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_01"); //È possibile ripristinare gli antichi poteri della spada?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_02"); //Ti serve una sorgente magica molto potente.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_03"); //Abbastanza potente da distruggere la Barriera magica?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_04"); //All'incirca...
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_05"); //Inoltre, hai bisogno di una formula speciale per trasferire il potere.
	AI_Output			(self, other,"Info_Xardas_LOADSWORD02_14_06"); //Dammi un po' di tempo e creerò la formula.

	B_Story_ShowedUrizielToXardas();
};


//---------------------------------------------------------------------
//	Info BETTERARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_BETTERARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_BETTERARMOR_Condition;
	information		= Info_Xardas_BETTERARMOR_Info;
	important		= 0;
	permanent		= 0;
	description		= "Nel frattempo, io andrò in cerca di un'armatura migliore!"; 
};

FUNC int  Info_Xardas_BETTERARMOR_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD02))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_BETTERARMOR_Info()
{
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_01"); //Nel frattempo, io andrò in cerca di un'armatura migliore!

	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if (armorInstance == CRW_ARMOR_H)
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_02"); //Queste corazze dei pidocchi di miniera si sono riempite di buchi nel tempio sotterraneo!
	}
	else if (armorInstance == KDW_ARMOR_H) || (armorInstance == KDW_ARMOR_L)		
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_03"); //Questi stracci blu non mi hanno protetto sufficientemente nel tempio sotterraneo!
	}
	else
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_04"); //I morti viventi hanno inferto troppi colpi su quest'armatura.
	};
	
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_05"); //Dovresti andare alla mia vecchia torre.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_06"); //La tua vecchia torre?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_07"); //È sprofondata in uno dei laghi orientali, durante un terremoto. Le sue guglie sono ancora visibili sulla superficie.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_08"); //All'interno ci sono ancora alcuni manufatti che non ho mai tentato di recuperare.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_09"); //Come faccio a entrare?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_10"); //Non ci sono più tornato dopo il terremoto. Dovrai trovare da solo il modo di accedervi.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_11"); //Prendi questa chiave. Essa apre uno scrigno in cui ero solito conservare alcuni manufatti estremamente rari.

	B_Story_ExploreSunkenTower();
};


//---------------------------------------------------------------------
//	Info OREARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_OREARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_OREARMOR_Condition;
	information		= Info_Xardas_OREARMOR_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Info_Xardas_OREARMOR_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OREARMOR_Info()
{
	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if	(armorInstance == ORE_ARMOR_M)
	||	(armorInstance == ORE_ARMOR_H)
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_01"); //Vedo che indossi l'armatura di metallo.
	}
	else
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_02"); //Da quanto vedo, hai trovato l'armatura di metallo.
	};
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_03"); //Era in uno di quei vecchi scrigni all'interno della torre affondata.
	AI_Output		(self, other,"Info_Xardas_OREARMOR_14_04"); //Apparteneva al generale che impugnò URIZIEL nella battaglia contro gli orchi.
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_05"); //Spero che mi porti più fortuna di quanto non abbia fatto con lui!
};

//---------------------------------------------------------------------
//	Info FORMULA 
//---------------------------------------------------------------------
instance  Info_Xardas_FORMULA (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FORMULA_Condition;
	information		= Info_Xardas_FORMULA_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hai completato la formula magica per riattivare URIZIEL?";
};

FUNC int  Info_Xardas_FORMULA_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	||	Npc_HasItems(hero, ItArRuneTeleport1)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_FORMULA_Info()
{
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_01"); //Hai completato la formula magica per riattivare URIZIEL?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_02"); //È pronta, ma non riuscirai a usarla.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_03"); //Perché no?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_04"); //Deve essere pronunciata da un mago, mentre tocchi la sorgente magica con la lama.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_05"); //Allora dovrò andare in cerca d'aiuto!
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_06"); //Prendi la formula e ripristina il suo antico potere. Ti servirà!

	B_Story_LoadSword();
};

//---------------------------------------------------------------------
//	Info ALTRUNE 
//---------------------------------------------------------------------
instance  Info_Xardas_ALTRUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_ALTRUNE_Condition;
	information		= Info_Xardas_ALTRUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Io sono un mago, non riuscirò a maneggiare URIZIEL!";
};

FUNC int  Info_Xardas_ALTRUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_FORMULA)
	&&	((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB))
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_ALTRUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_ALTRUNE_15_01"); //Io sono un mago, non riuscirò a maneggiare URIZIEL!
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_02"); //Esiste una soluzione...
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_03"); //Ma prima devi ripristinare l'antico potere della lama. Torna quando ci sarai riuscito!
};


//---------------------------------------------------------------------
//	Info SWORDLOADED
//---------------------------------------------------------------------
instance  Info_Xardas_SWORDLOADED (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_SWORDLOADED_Condition;
	information		= Info_Xardas_SWORDLOADED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ho riattivato URIZIEL!"; 
};

FUNC int  Info_Xardas_SWORDLOADED_Condition()
{	
	if  Npc_HasItems(hero,Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_SWORDLOADED_Info()
{
	AI_Output		(other, self,"Info_Xardas_SWORDLOADED_15_01"); //Ho riattivato URIZIEL!
	AI_Output		(self, other,"Info_Xardas_SWORDLOADED_14_02"); //Incredibile: la lama ha recuperato tutti i suoi antichi poteri. Ora hai un'arma davvero potente!

	Wld_InsertItem			(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");	//Unblutige Lösung für´s Ich-brauch-Orc-Statue-Massaker ***Björn***

};

//---------------------------------------------------------------------
//	Info MAKERUNE
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNE_Condition;
	information		= Info_Xardas_MAKERUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hai detto che potrei riuscire a maneggiare URIZIEL pur essendo un mago!"; 
};

FUNC int  Info_Xardas_MAKERUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_ALTRUNE)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SWORDLOADED)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_01"); //Hai detto che potrei riuscire a maneggiare URIZIEL pur essendo un mago?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_02"); //Guarda attentamente la spada e noterai la grande pietra blu sulla lama.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_03"); //Contiene i poteri magici della spada.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_04"); //Rimuovendo la pietra, potrò creare una runa in grado di contenere i poteri di URIZIEL.
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_05"); //Una runa magica da URIZIEL?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_06"); //In battaglia la runa sarà potente quanto la spada!
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_07"); //Ma non dimenticare che essa potrà essere controllata solo da un mago del Sesto Cerchio!
};

//---------------------------------------------------------------------
//	Info MAKERUNEDOIT
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNEDOIT (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNEDOIT_Condition;
	information		= Info_Xardas_MAKERUNEDOIT_Info;
	important		= 0;
	permanent		= 1;
	description		= "Rimuovi la pietra da URIZIEL!"; 
};

FUNC int  Info_Xardas_MAKERUNEDOIT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_MAKERUNE)
	&&	Npc_HasItems (hero,	Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNEDOIT_Info()
{
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_01"); //Rimuovi la pietra da URIZIEL!
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
		AI_Output		(self, other,"Info_Xardas_MAKERUNEDOIT_14_02"); //Ma non sei ancora un mago del Sesto Cerchio!
	};
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_03"); //Vuoi davvero che la rimuova? Dopo non potrai più cambiare idea.

	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"Sì, fallo!",	Info_Xardas_MAKERUNE_YES);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"NO, non farlo!",	Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_04"); //Sì, fallo!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Se è questo che desideri... Ecco! Prendi la spada vuota e la runa!

	Npc_RemoveInvItem 	(hero, Mythrilklinge02);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items übergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, Mythrilklinge03);
	B_LogEntry			(CH5_Uriziel,"Xardas ha rimosso la pietra magica da URIZIEL. Ora, l'incomparabile potere della spada risiede in una runa.");
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_SUCCESS);
};	

func void Info_Xardas_MAKERUNE_NO ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_06"); //NO, non farlo!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_07"); //Come desideri. La spada manterrà i suoi poteri magici!
};	
	

//---------------------------------------------------------------------
//	Info LOADSWORD9 --> SC kann DMB werden
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD09 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD09_Condition;
	information		= Info_Xardas_LOADSWORD09_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,0); 
};

FUNC int  Info_Xardas_LOADSWORD09_Condition()
{	
	if (EnteredTemple)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{			
		return TRUE;
	};	
};
func void  Info_Xardas_LOADSWORD09_Info()
{
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//Puoi addestrarmi?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //TI farò salire fino al Sesto Cerchio magico.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //Ricorda che solo i maghi più potenti possono accedere al Sesto Cerchio: esso è riservato a coloro la cui vita è un simbolo.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //Il tuo è l'unione degli elementi.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //Il Sesto Cerchio ti permetterà di usare qualsiasi runa.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //Non dimenticare: non sfruttare il potere, ma servilo!
			
			CreateInvItem 		(hero, DMB_ARMOR_M);		// SN: kann nicht mit B_GiveInvItem() übergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor	(hero);

			//Fakeitem für Bildschirmausgabe
			CreateInvItem		(self,			ItAmArrow);
			B_GiveInvItems		(self, hero,	ItAmArrow, 1);
			Npc_RemoveInvItem	(hero,			ItAmArrow);

			hero.guild 	= GIL_DMB;	
			Npc_SetTrueGuild	( hero, GIL_DMB );	
			Info_Xardas_LOADSWORD09.permanent = 0;
			AI_StopProcessInfos	( self );
		};
	}
	else 
	{
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//Non ancora. Sei abile, ma non possiedi sufficiente esperienza. Prima fatti addestrare da Saturas, quindi torna da me.
		
		AI_StopProcessInfos	( self );
	};
};

	
