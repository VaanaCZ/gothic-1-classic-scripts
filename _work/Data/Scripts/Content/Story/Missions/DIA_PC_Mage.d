//*********************************************
//					 EXIT
//*********************************************
instance DIA_Milten_EXIT (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 999;
	condition	= DIA_Milten_EXIT_Condition;
	information	= DIA_Milten_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Milten_EXIT_Condition()
{
	return 1;
};

func VOID DIA_Milten_EXIT_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_00"); //In marcia.
	}
	else
	{
		AI_Output 		(self, hero,"DIA_Milten_EXIT_02_01"); //Ci vediamo!
	};
	AI_StopProcessInfos	(self);
};

//*********************************************
//					First
//*********************************************

instance DIA_Milten_First (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_First_Condition;
	information	= DIA_Milten_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Milten_First_Condition()
{
	if ( (CorKalom_BringMCQBalls != LOG_SUCCESS) && (!Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE)) )
	&& (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

func VOID DIA_Milten_First_Info()
{
	AI_Output (self, other,"DIA_Milten_First_02_00"); //Non puoi entrare senza il permesso di Corristo.
};

//*********************************************
//					 hallo
//*********************************************

instance DIA_Milten_Hello (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Hello_Condition;
	information	= DIA_Milten_Hello_Info;
	permanent	= 0;
	description = "Non puoi entrare, senza il permesso di Corristo.";
};                       

FUNC INT DIA_Milten_Hello_Condition()
{
	if (Saturas_BringFoci == FALSE) && (!Npc_KnowsInfo(hero,DIA_Milten_GotoCorristo))
	{
		return 1;
	};
};

func VOID DIA_Milten_Hello_Info()
{
	AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Non puoi entrare senza il permesso di Corristo.
	AI_Output (self, other,"DIA_Milten_Hello_02_01"); //Sto cercando il Gran Mago del Circolo di Fuoco.
};

//*********************************************
//					GotoCorristo
//*********************************************
	
instance DIA_Milten_GotoCorristo (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_GotoCorristo_Condition;
	information	= DIA_Milten_GotoCorristo_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Milten_GotoCorristo_Condition()
{
	if  ( (CorKalom_BringMCQBalls == LOG_SUCCESS) || Npc_KnowsInfo(hero,GRD_200_Thorus_WANNABEMAGE) )
	&&  (Npc_GetTrueGuild (hero) == GIL_STT) 
	{
		return 1;
	};
};

func VOID DIA_Milten_GotoCorristo_Info()
{
	if ( (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) )
	{
		//***kopierte AI_outputs, falls SC Brief noch hat***
		AI_Output (other, self,"DIA_Milten_Hello_15_00"); //Non puoi entrare senza il permesso di Corristo.
		AI_Output (self, other,"DIA_Milten_Hello_02_01"); //Sto cercando il Gran Mago del Circolo di Fuoco.
		AI_Output (other, self,"DIA_Milten_Letter_15_00"); //Ho una lettera per il Gran Mago del Circolo di Fuoco.
		//AI_Output (self, other,"DIA_Milten_Letter_02_01"); //Bist du ein Bote aus der Außenwelt?
		//AI_Output (other, self,"DIA_Milten_Letter_15_02"); //Ja. Ein Magier gab mir den Brief, kurz bevor sie mich in die Kolonie geworfen haben.
		AI_Output (self, other,"DIA_Milten_Letter_02_03"); //Fammela vedere.
		AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Eccola.
		B_GiveXP(XP_XardasLetter);
		if		Npc_HasItems(other,ItWr_Fire_Letter_01)
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
		}
		else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
		{ 
			B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
		};
		AI_Output (other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //Cosa ne dici di una ricompensa?
		AI_Output (self,hero,"Info_Milten_SHSEAL_02_05"); //Non ce ne sarà bisogno.
		//***kopierte AI_outputs ENDE***
	};
	
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_01"); //Abbiamo saputo ciò che hai fatto nella vecchia miniera. Senza i pidocchi, il lavoro è molto più sicuro.
	AI_Output (self, other,"DIA_Milten_GotoCorristo_02_02"); //Anche Corristo conosce le tue imprese e vuole parlarti. Vai da lui.
};

//*********************************************
//				 Got Brief
//*********************************************
	var int milten_HasLetter;
//*********************************************

instance DIA_Milten_Letter (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_Letter_Condition;
	information	= DIA_Milten_Letter_Info;
	permanent	= 0;
	description = "Ho una lettera per il Gran Mago del Circolo di Fuoco.";
};                       

FUNC INT DIA_Milten_Letter_Condition()
{
	if	( (Npc_KnowsInfo(hero, DIA_Milten_Hello)) && ( (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) || (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) ) )
	&&	(Kapitel < 4) && (Saturas_BringFoci == FALSE)
	{
		return 1;
	};
};

func VOID DIA_Milten_Letter_Info()
{
	AI_Output			(other, self,"DIA_Milten_Letter_15_00"); //Ho una lettera per il Gran Mago del Circolo di Fuoco.
	AI_Output			(self, other,"DIA_Milten_Letter_02_01"); //Sei un messaggero del mondo esterno?
	AI_Output			(other, self,"DIA_Milten_Letter_15_02"); //Sì. Un mago mi ha consegnato questa lettera, poco prima di gettarmi nella colonia.
	AI_Output			(self, other,"DIA_Milten_Letter_02_03"); //Fammela vedere.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Prima voglio la mia ricompensa.",DIA_Milten_Letter_NO);
	Info_AddChoice		(DIA_Milten_Letter,"Eccola.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_Give()
{
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_00"); //Eccola.
	B_UseFakeScroll();
	
	B_GiveXP(XP_XardasLetter);
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_03"); //Questa lettera è indirizzata a Xardas!
	AI_Output (other, self,"DIA_Milten_Letter_Give_15_04"); //Cosa c'è di tanto strano?
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_05"); //Xardas non è più un seguace di Innos da molto tempo. Ci ha abbandonati e si è votato alla magia nera.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_06"); //Ora vive in una torre in mezzo alla città degli orchi, immerso nei suoi studi.
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_07"); //Ha detto che voleva starsene per conto suo, per scoprire cosa non aveva funzionato con la Barriera.
	
	AI_Output (self, other,"DIA_Milten_Letter_Give_02_08"); //Aspettami qui, torno subito.
	AI_StopProcessInfos	(self);
	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");

	if		Npc_HasItems(other,ItWr_Fire_Letter_01)
	{ 
		B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
	}
	else if	Npc_HasItems(other,ItWr_Fire_Letter_02) 
	{ 
		B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
	};
	milten_HasLetter = TRUE;
	Npc_SetRefuseTalk(self,10);
};

func void DIA_Milten_Letter_NO()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_15_00"); //Prima voglio la mia ricompensa.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_01"); //Corristo ordinerà a Torrez di consegnartela, non appena avrà in mano la lettera.
	AI_Output (self, other,"DIA_Milten_Letter_NO_02_02"); //Io sono un servo di Innos e non mento mai. Ora dammi la lettera.
	Info_ClearChoices	(DIA_Milten_Letter);
	Info_AddChoice		(DIA_Milten_Letter,"Preferirei consegnarla a Torrez di persona.",DIA_Milten_Letter_NO_AGAIN);
	Info_AddChoice		(DIA_Milten_Letter,"Eccola.",DIA_Milten_Letter_Give);
};

func void DIA_Milten_Letter_NO_AGAIN()
{
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_00"); //Preferirei consegnarla a Torrez di persona.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_01"); //Non riuscirò a convincerti, vero?
	AI_Output (other, self,"DIA_Milten_Letter_NO_AGAIN_15_02"); //No. Prima voglio vedere la mia ricompensa.
	AI_Output (self, other,"DIA_Milten_Letter_NO_AGAIN_02_03"); //Va bene. Se è questo ciò che vuoi, aspettami qui.

	Info_ClearChoices	(DIA_Milten_Letter);
	AI_StopProcessInfos	(self);

	AI_GotoWP (self, "OCC_CHAPEL_STAIRCASE_TOP");
	AI_GotoWP (self, "OCC_CHAPEL_ENTRANCE");
	milten_HasLetter = FALSE;
	Npc_SetRefuseTalk(self,10);
};

//*********************************************
//				 Got Brief
//*********************************************

instance DIA_Milten_ComesBack (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_ComesBack_Condition;
	information	= DIA_Milten_ComesBack_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Milten_ComesBack_Condition()
{
	if ( (Npc_KnowsInfo(hero, DIA_Milten_Letter)) && (Npc_RefuseTalk(self) == FALSE) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_ComesBack_Info()
{
	if (milten_HasLetter==FALSE)
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_00"); //Corristo non è stato felice di sapere che hai così poca fiducia nei servi di Innos.
		AI_Output (self, other,"DIA_Milten_ComesBack_02_01"); //Comunque ha detto che puoi andare da Torrez e farti consegnare la solita ricompensa.
	}
	else
	{
		AI_Output (self, other,"DIA_Milten_ComesBack_02_02"); //Corristo era fuori di sé dalla gioia. Ha detto che puoi andare da Torrez e scegliere la ricompensa che desideri.
	};
};

//*********************************************
//			Wo finde ich Torrez?
//*********************************************
	
instance DIA_Milten_WoTorrez (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_WoTorrez_Condition;
	information	= DIA_Milten_WoTorrez_Info;
	permanent	= 0;
	description	= "Dove si trova Torrez?";
};                       

FUNC INT DIA_Milten_WoTorrez_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Milten_ComesBack) && (Saturas_BringFoci == FALSE) )
	{
		return 1;
	};
};

func VOID DIA_Milten_WoTorrez_Info()
{
	AI_Output (other, self,"DIA_Milten_WoTorrez_15_00"); //Dove si trova Torrez?
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_01"); //Sta tutto il giorno di fronte al tempio.
	AI_Output (self, other,"DIA_Milten_WoTorrez_02_02"); //Di notte, invece, si trova all'interno come tutti gli altri. Solo i maghi possono accedere al tempio, quindi potrai parlargli solo di giorno.
};

//*********************************************
//				Noch ein Brief
//*********************************************
	
instance DIA_Milten_NochEinBrief (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_NochEinBrief_Condition;
	information	= DIA_Milten_NochEinBrief_Info;
	permanent	= 0;
	description = "Ho una lettera da parte dei Maghi dell'Acqua.";
};                       

FUNC INT DIA_Milten_NochEinBrief_Condition()
{
	if ( (Cronos_Messenger == LOG_RUNNING) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_NochEinBrief_Info()
{
	AI_Output (other, self,"DIA_Milten_NochEinBrief_15_00"); //Ho una lettera da parte dei Maghi dell'Acqua.
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_01"); //Ah! Molto bene! La darò a Corristo!
	AI_Output (self, other,"DIA_Milten_NochEinBrief_02_02"); //Quando tornerai a Campo Nuovo, i Maghi dell'Acqua ti ricompenseranno di sicuro.
	
	Cronos_Messenger = LOG_SUCCESS;
	B_GiveInvItems (other,self,Cronos_Brief,1);
};

//*********************************************
//					PERM
//*********************************************
	
instance DIA_Milten_PERM (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 1;
	condition	= DIA_Milten_PERM_Condition;
	information	= DIA_Milten_PERM_Info;
	permanent	= 0;
	description = "Parlami dei Maghi del Fuoco.";
};                       

FUNC INT DIA_Milten_PERM_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Milten_ComesBack) && (Kapitel <= 3) )
	{
		return 1;
	};
};

func VOID DIA_Milten_PERM_Info()
{
	AI_Output (other, self,"DIA_Milten_PERM_15_00"); //Parlami dei Maghi del Fuoco.
	AI_Output (self, other,"DIA_Milten_PERM_02_01"); //Il Circolo di Fuoco riceve il potere dalla grazia di Innos. Il dio della luce, verità e giustizia veglia su noi.
	AI_Output (self, other,"DIA_Milten_PERM_02_02"); //I maghi si considerano dei prescelti e trattano gli altri di conseguenza.
	AI_Output (self, other,"DIA_Milten_PERM_02_03"); //Io sono fortunato a essere stato ammesso. Corristo mi ha eletto suo apprendista. Probabilmente voleva divertirsi.
	AI_Output (self, other,"DIA_Milten_PERM_02_04"); //Da allora, ho provato a migliorarmi nelle arti magiche ogni singolo giorno per essere ammesso al Cerchio successivo.
};

//*********************************************
//					WannaMage
//*********************************************
	
instance DIA_Milten_WannaMage (C_INFO)
{
	npc			= PC_MAGE;
	nr			= 2;
	condition	= DIA_Milten_WannaMage_Condition;
	information	= DIA_Milten_WannaMage_Info;
	permanent	= 1;
	description = "Voglio diventare anch'io un apprendista mago come te!";
};                       

FUNC INT DIA_Milten_WannaMage_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Milten_PERM) && (CorKalom_BringMCQBalls != LOG_SUCCESS) )
	{
		return 1;
	};
};

func VOID DIA_Milten_WannaMage_Info()
{
	AI_Output (other, self,"DIA_Milten_WannaMage_15_00"); //Voglio diventare anch'io un apprendista mago come te!
	AI_Output (self, other,"DIA_Milten_WannaMage_02_01"); //Corristo mi ha scelto perché ho fatto un favore speciale ai baroni delle miniere.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_02"); //A meno che tu non compia un gesto davvero straordinario, non ti prenderà mai in considerazione.
	AI_Output (self, other,"DIA_Milten_WannaMage_02_03"); //Inoltre devi far parte di Campo Vecchio. Dubito che Corristo prenderebbe come apprendista una persona proveniente da un altro campo.
};





		
	







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info SHWAIT
//***************************************************************************
instance Info_Milten_SHWAIT (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHWAIT_Condition;
	information	= Info_Milten_SHWAIT_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHWAIT_Condition()
{
	if ( Npc_GetDistToWP ( hero, "OW_PATH_274")<1000)
	{
		return 1;
	};	
};

func void Info_Milten_SHWAIT_Info()
{
	AI_GotoNpc		(self,hero);
	
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_01"); //Salve! Il mio amico Lester di Campo Palude mi ha narrato le tue grandi imprese!
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_02"); //Sono colpito. Sei diventato molto forte.
	AI_Output		(hero,self,"Info_Milten_SHWAIT_15_03"); //Faccio del mio meglio.
	AI_Output		(self,hero,"Info_Milten_SHWAIT_02_04"); //Ah. Già. Sempre modesto, vero?
};

//***************************************************************************
//	Info SHGORN
//***************************************************************************
instance Info_Milten_SHGORN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHGORN_Condition;
	information	= Info_Milten_SHGORN_Info;
	important	= 0;
	permanent	= 0;
	description	= "Ho visto Gorn.";
};

FUNC int Info_Milten_SHGORN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT) && Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHGORN_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_01"); //Ho visto Gorn.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_02"); //Davvero? Dove?
	AI_Output		(hero,self,"Info_Milten_SHGORN_15_03"); //Presso le rovine del vecchio monastero, vicino al mare. Eravamo entrambi in cerca di tesori.
	AI_Output		(self,hero,"Info_Milten_SHGORN_02_04"); //Sono certo che mi dirà tutto, quando c'incontreremo di nuovo.
};

//***************************************************************************
//	Info SHLESTER
//***************************************************************************
instance Info_Milten_SHLESTER (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHLESTER_Condition;
	information	= Info_Milten_SHLESTER_Info;
	important	= 0;
	permanent	= 0;
	description	= "Io e Lester abbiamo conquistato il forte sulla montagna.";
};

FUNC int Info_Milten_SHLESTER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT) && Npc_KnowsInfo(hero, PC_Psionic_FINISH))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHLESTER_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_01"); //Io e Lester abbiamo conquistato il forte sulla montagna.
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_02"); //Me l'ha detto. Sembra ci si possa fidare di te.
	AI_Output		(hero,self,"Info_Milten_SHLESTER_15_03"); //Dove vi siete incontrati, voi quattro?
	AI_Output		(self,hero,"Info_Milten_SHLESTER_02_04"); //Oh, qua e là. Ci si vede in molti posti differenti.
};

//***************************************************************************
//	Info SHYOU
//***************************************************************************
instance Info_Milten_SHYOU (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHYOU_Condition;
	information	= Info_Milten_SHYOU_Info;
	important	= 0;
	permanent	= 0;
	description	= "Cosa stai facendo?";
};

FUNC int Info_Milten_SHYOU_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHWAIT))
	{
		return 1;
	};	
};

func void Info_Milten_SHYOU_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_01"); //Cosa stai facendo?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_02"); //Non lontano da qui, si trova un antico anello di pietra. Nel mezzo c'è l'entrata per una cripta.
	AI_Output		(hero,self,"Info_Milten_SHYOU_15_03"); //Una specie di tomba?
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_04"); //Sì, qualcosa del genere.
	AI_Output		(self,hero,"Info_Milten_SHYOU_02_05"); //In quella tomba c'è una cosa che desidero avere.
};

//***************************************************************************
//	Info SHME
//***************************************************************************
instance Info_Milten_SHME (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHME_Condition;
	information	= Info_Milten_SHME_Info;
	important	= 0;
	permanent	= 0;
	description	= "Sto cercando una pietra focalizzatrice.";
};

FUNC int Info_Milten_SHME_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_SHWAIT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	{
		return 1;
	};	
};

func void Info_Milten_SHME_Info()
{
	AI_Output		(hero,self,"Info_Milten_SHME_15_01"); //Sto cercando una pietra focalizzatrice. Dovrebbe trovarsi da queste parti.
	AI_Output		(self,hero,"Info_Milten_SHME_02_02"); //Sembra che entrambi cerchiamo qualcosa nello stesso posto.
};

//***************************************************************************
//	Info SHPROBLEM
//***************************************************************************
instance Info_Milten_SHPROBLEM (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHPROBLEM_Condition;
	information	= Info_Milten_SHPROBLEM_Info;
	important	= 0;
	permanent	= 0;
	description	= "Perché non entri nella tomba e prendi ciò che ti serve?";
};

FUNC int Info_Milten_SHPROBLEM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHYOU))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_01"); //Perché non entri nella tomba e prendi ciò che ti serve?
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_02"); //È una lunga storia. Dovrei tornare molto indietro per raccontartela tutta.
	AI_Output			(hero,self,"Info_Milten_SHPROBLEM_15_03"); //Fai pure, non ho alcuna fretta.
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_04"); //D'accordo! Dopo la creazione della Barriera che ci ha imprigionati...
	AI_Output			(self,hero,"Info_Milten_SHPROBLEM_02_05"); //...uno dei maghi nascose quaggiù un manufatto magico.
};

//***************************************************************************
//	Info SHFOCUS
//***************************************************************************
instance Info_Milten_SHFOCUS (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHFOCUS_Condition;
	information	= Info_Milten_SHFOCUS_Info;
	important	= 0;
	permanent	= 0;
	description	= "Si tratta di una delle cinque pietre focalizzatrici?";
};

FUNC int Info_Milten_SHFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHFOCUS_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_01"); //Si tratta di una delle cinque pietre focalizzatrici?
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_02"); //Esattamente! Allora sai già la storia delle cinque pietre?
	AI_Output			(hero,self,"Info_Milten_SHFOCUS_15_03"); //Non dirmi che anche tu cerchi la pietra!
	AI_Output			(self,hero,"Info_Milten_SHFOCUS_02_04"); //No, non m'interessa. Io cerco il talismano degli orchi.
};

//***************************************************************************
//	Info SHSEAL
//***************************************************************************
instance Info_Milten_SHSEAL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSEAL_Condition;
	information	= Info_Milten_SHSEAL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Il manufatto è stato sigillato?";
};

FUNC int Info_Milten_SHSEAL_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHPROBLEM))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSEAL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_01"); //Il manufatto è stato sigillato?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_02"); //Esatto. Un potente incantesimo lo protegge. La prima persona che tenterà di rubare la pietra focalizzatrice...
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_03"); //...sarà maledetta e costretta a un esistenza da morto vivente, proteggendo la tomba dagli altri ladri.
	AI_Output			(hero,self,"Info_Milten_SHSEAL_15_04"); //Come farai a superare la maledizione?
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_05"); //Non ce ne sarà bisogno.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_06"); //Alcuni anni or sono, un barone delle miniere a caccia di orchi è stato talmente incauto da entrare nella tomba.
	AI_Output			(self,hero,"Info_Milten_SHSEAL_02_07"); //Ora è LUI il guardiano dei tesori.
};

//***************************************************************************
//	Info SHTALISMAN
//***************************************************************************
instance Info_Milten_SHTALISMAN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHTALISMAN_Condition;
	information	= Info_Milten_SHTALISMAN_Info;
	important	= 0;
	permanent	= 0;
	description	= "Che mi dici del talismano?";
};

FUNC int Info_Milten_SHTALISMAN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHFOCUS))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHTALISMAN_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHTALISMAN_15_01"); //Che mi dici del talismano?
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_02"); //Credo che il precedente proprietario lo usasse per difendersi dagli orchi.
	AI_Output			(self,hero,"Info_Milten_SHTALISMAN_02_03"); //Se ho ragione, potrebbe rivelarsi molto utile.
};

//***************************************************************************
//	Info SHOFFER
//***************************************************************************
instance Info_Milten_SHOFFER (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHOFFER_Condition;
	information	= Info_Milten_SHOFFER_Info;
	important	= 0;
	permanent	= 0;
	description	= "Dovremmo ispezionare la tomba assieme!";
};

FUNC int Info_Milten_SHOFFER_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHSEAL)
	&&		Npc_KnowsInfo(hero, Info_Milten_SHTALISMAN)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHOFFER_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_01"); //Dovremmo ispezionare la tomba assieme! Tu prendi il talismano e io la pietra focalizzatrice.
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_02"); //Va bene, ma c'è un piccolo problema...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_03"); //Un problema?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_04"); //Già. Il guardiano nella tomba...
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_05"); //Non possiamo farlo a pezzettini?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_06"); //Non sarà così semplice. Sembra molto resistente contro le armi normali.
	AI_Output			(hero,self,"Info_Milten_SHOFFER_15_07"); //Fammi indovinare: hai un piano, giusto?
	AI_Output			(self,hero,"Info_Milten_SHOFFER_02_08"); //Uhm... Beh... Sì, ma non posso farcela da solo.
};

//***************************************************************************
//	Info SHOFFER2
//***************************************************************************
instance Info_Milten_SHOFFER2 (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHOFFER2_Condition;
	information	= Info_Milten_SHOFFER2_Info;
	important	= 0;
	permanent	= 0;
	description	= "Dimmi!";
};

FUNC int Info_Milten_SHOFFER2_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHOFFER)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHOFFER2_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_01"); //Dimmi!
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_02"); //Ho la pergamena di un potentissimo incantesimo.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_03"); //Può distruggere qualsiasi morto vivente.
	AI_Output			(hero,self,"Info_Milten_SHOFFER2_15_04"); //Allora conquistare la tomba sarà un gioco da ragazzi.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_05"); //Mhhh... Beh... Non proprio! Il guardiano non è più solo.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_06"); //Probabilmente si tratta di altri ladri, sfortunati quanto lui.
	AI_Output			(self,hero,"Info_Milten_SHOFFER2_02_07"); //Sono già sceso una volta e mi hanno quasi ucciso. Una persona sola non può fare molto, laggiù.
};

//***************************************************************************
//	Info SHACCEPT
//***************************************************************************
instance Info_Milten_SHACCEPT (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHACCEPT_Condition;
	information	= Info_Milten_SHACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description	= "Dammi l'incantesimo e lo lanceremo assieme!";
};

FUNC int Info_Milten_SHACCEPT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHOFFER2)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHACCEPT_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_01"); //Dammi l'incantesimo e lo faremo assieme!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_02"); //Molto bene! Speravo che l'avresti detto!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_03"); //Però abbiamo solo una pergamena. Usala con il guardiano!
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_04"); //Gli altri non-morti possono essere sconfitti in normali combattimenti.
	AI_Output			(hero,self,"Info_Milten_SHACCEPT_15_05"); //Ho capito. Bene, da che parte per l'anello di pietra?
	AI_Output			(self,hero,"Info_Milten_SHACCEPT_02_06"); //Seguimi.

	Log_CreateTopic		(CH3_Stonehenge,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_RUNNING);
	B_LogEntry		(CH3_Stonehenge,"Ho incontrato Milten, il Mago del Fuoco, vicino all'anello di pietra. Mi ha detto che una delle pietre focalizzatrici che sto cercando, si trova in una cripta sotto la formazione rocciosa.");
	B_LogEntry		(CH3_Stonehenge,"Milten mi ha dato un incantesimo per sconfiggere il guardiano non-morto. Entreremo insieme nella cripta.");
	
	CreateInvItem		(self,	ItArScrollDestroyUndead);
	B_GiveInvItems  (self, hero, ItArScrollDestroyUndead, 1);

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine	(self, "SHGuide");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHARRIVED
//***************************************************************************
instance Info_Milten_SHARRIVED (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHARRIVED_Condition;
	information	= Info_Milten_SHARRIVED_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHARRIVED_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHACCEPT) && (Npc_GetDistToWP(hero, "OW_PATH_3_STONES")<500) )
	{
		return TRUE;
	};	
};

func void Info_Milten_SHARRIVED_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHARRIVED_02_01"); //Eccoci. Questo tunnel conduce direttamente alla tomba. 
	AI_Output			(hero,self,"Info_Milten_SHARRIVED_15_02"); //Allora andiamo a fare visita al guardiano!

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine	(self,	"SHFollow");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHHEAL
//***************************************************************************
instance Info_Milten_SHHEAL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHHEAL_Condition;
	information	= Info_Milten_SHHEAL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Aiutami, ti prego! Sono ferito.";
};

FUNC int Info_Milten_SHHEAL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)
	&&		(hero.attribute[ATR_HITPOINTS] < ((hero.attribute[ATR_HITPOINTS_MAX]*7)/10))
	&&		(Npc_HasItems(hero,ItFo_Potion_Health_02) == 0)								)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHHEAL_Info()
{
	AI_Output				(hero,self,"Info_Milten_SHHEAL_15_01"); //Aiutami, ti prego! Sono ferito.

	if (	(Npc_HasItems(self,ItFo_Potion_Health_02) >  0)		)
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_02"); //Prendi questa pozione guaritrice.
		B_GiveInvItems	    (self, hero,	ItFo_Potion_Health_02,	1);
	}
	else
	{
		AI_Output			(self,hero,"Info_Milten_SHHEAL_02_03"); //Non ho pozioni guaritrici.
	};	

	AI_StopProcessInfos		(self);
};

//***************************************************************************
//	Info SHRUNNING
//***************************************************************************
instance Info_Milten_SHRUNNING (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHRUNNING_Condition;
	information	= Info_Milten_SHRUNNING_Info;
	important	= 0;
	permanent	= 1;
	description	= "Il guardiano è ancora vivo!";
};

FUNC int Info_Milten_SHRUNNING_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,Info_Milten_SHACCEPT)
	&&	(keeperFound && !Npc_IsDead(other))							// Wächter noch nicht besiegt...
	{
		return TRUE;
	};	
};

func void Info_Milten_SHRUNNING_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHRUNNING_15_01"); 	//Il guardiano è ancora vivo!
	AI_Output			(self,hero,"Info_Milten_SHRUNNING_02_02"); 	//Distruggilo con l'incantesimo.
};

//***************************************************************************
//	Info SHSCROLL
//***************************************************************************
instance Info_Milten_SHSCROLL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSCROLL_Condition;
	information	= Info_Milten_SHSCROLL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Ho usato l'incantesimo!";
};

FUNC int Info_Milten_SHSCROLL_Condition()
{
	var int keeperFound;
	Npc_PerceiveAll(self);
	keeperFound = Wld_DetectNpc(self, ZombieTheKeeper, NOFUNC, -1);
	if (	(keeperFound && !Npc_IsDead(other))							// Wächter noch nicht besiegt...
	&&		Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&		(Npc_HasItems(hero, ItArScrollDestroyUndead)==0)	
	&&		(Npc_HasItems(hero, ItArRuneDestroyUndead)==0)	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHSCROLL_15_01"); //L'ho già usato, ma non sul guardiano!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_02"); //Che catastrofe! Allora dovrai trovare un altro modo per farlo fuori!
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_03"); //Forse puoi comprare un altro incantesimo o una runa in un campo.
	AI_Output			(self,hero,"Info_Milten_SHSCROLL_02_04"); //Ti aspetterò laggiù.

  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"SHWait");
};

//***************************************************************************
//	Info SHNEWSCROLL
//***************************************************************************
instance Info_Milten_SHNEWSCROLL (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHNEWSCROLL_Condition;
	information	= Info_Milten_SHNEWSCROLL_Info;
	important	= 0;
	permanent	= 0;
	description	= "Ho un altro incantesimo 'Morte dei non-morti'!";
};

FUNC int Info_Milten_SHNEWSCROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Milten_SHSCROLL)
	&&		!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)	
	&&		((Npc_HasItems(hero, ItArScrollDestroyUndead)>0) ||	(Npc_HasItems(hero, ItArRuneDestroyUndead)>0))	)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHNEWSCROLL_Info()
{
	AI_Output			(hero,self,"Info_Milten_SHNEWSCROLL_15_01"); //Ho un altro incantesimo 'Morte dei non-morti'!
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_02"); //Molto bene. Ora possiamo tornare a far visita al guardiano.
	AI_Output			(self,hero,"Info_Milten_SHNEWSCROLL_02_03"); //Vai avanti, io ti seguo.

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"SHFollow");
};

//***************************************************************************
//	Info SHLEAVE
//***************************************************************************
instance Info_Milten_SHLEAVE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHLEAVE_Condition;
	information	= Info_Milten_SHLEAVE_Info;
	important	= 1;
	permanent	= 1;
};

FUNC int Info_Milten_SHLEAVE_Condition()
{
	if	 Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)		
	&&	(Npc_GetDistToWP(hero, "OW_PATH_3_STONES")>10000)
  	&&	(self.aivar[AIV_PARTYMEMBER] ==	TRUE)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHLEAVE_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_01"); 	//Non sembri più tanto interessato alla tomba.
	AI_Output			(self,hero,"Info_Milten_SHLEAVE_02_02"); 	//Se cambi idea, mi trovi dove ci siamo incontrati prima

  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine	(self,	"SHWait");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHCONTINUE
//***************************************************************************
instance Info_Milten_SHCONTINUE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHCONTINUE_Condition;
	information	= Info_Milten_SHCONTINUE_Info;
	important	= 0;
	permanent	= 1;
	description = "Possiamo tornare dal guardiano?";
};

FUNC int Info_Milten_SHCONTINUE_Condition()
{
	if	(self.aivar[AIV_PARTYMEMBER] == FALSE)
	&&	Npc_KnowsInfo(hero, Info_Milten_SHACCEPT)
	&&	!Npc_KnowsInfo(hero, Info_Milten_SHSUCCESS)
	&&	(Npc_GetDistToWP(hero, "OW_PATH_3_STONES")<9000)
	{
		return TRUE;
	};	
};

func void Info_Milten_SHCONTINUE_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(hero,self,"Info_Milten_SHCONTINUE_15_01"); //Possiamo tornare dal guardiano?
	AI_Output			(self,hero,"Info_Milten_SHCONTINUE_02_02"); //Sono pronto. Vai avanti, io ti seguo.

  	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"SHFollow");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SHSUCCESS
//***************************************************************************
instance Info_Milten_SHSUCCESS (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_SHSUCCESS_Condition;
	information	= Info_Milten_SHSUCCESS_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_SHSUCCESS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_SHACCEPT) && Npc_HasItems(hero, ItMi_OrcTalisman))
	{
		return TRUE;
	};	
};

func void Info_Milten_SHSUCCESS_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_01"); //Bene, hai il talismano.
	AI_Output			(hero,self,"Info_Milten_SHSUCCESS_15_02"); //Ecco, prendilo. Eravamo d'accordo!
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_03"); //Grazie, amico mio. Non dimentico mai chi mi aiuta.
	AI_Output			(self,hero,"Info_Milten_SHSUCCESS_02_04"); //Torno a Campo Vecchio. Forse c'incontreremo lì.
	
	B_GiveInvItems	(hero,self,	ItMi_OrcTalisman, 1);
	
	B_LogEntry		(CH3_Stonehenge,"Insieme, siamo riusciti a sconfiggere il GUARDIANO sotto l'anello di pietra. Milten ha preso la sua parte di bottino ed è tornato a Campo Vecchio.");
	B_LogEntry		(CH3_Stonehenge,"Saturas sarà felice: ho trovato una pietra focalizzatrice!");
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine	(self, "ReturnToOC");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info OCWARN
//***************************************************************************
instance Info_Milten_OCWARN (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCWARN_Condition;
	information	= Info_Milten_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Milten_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Milten_OCWARN_02_01"); //Sono... Sono tutti morti... MORTI. Non ho potuto aiutarli... Non ero... Non ero qui... Io...

	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_02"); //Calmati, Milten. Ho incontrato Diego dall'altra parte del campo.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_03"); //Allora sai già tutto. Cosa ha detto Diego?
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_04"); //Se riesco a trovare Gorn e Lester, li avviso e li mando da te.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_05"); //Buona fortuna e stai attento!
		B_LogEntry		(CH4_Firemages,"Milten si nasconde vicino a Campo Vecchio, proprio come Diego. A distanza di sicurezza dal cancello principale, il Mago del Fuoco avverte coloro che sopraggiungono, per non farli cadere nelle grinfie delle guardie.");
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_06"); //Calmati, Milten! Cosa è successo?
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_07"); //Hanno ucciso i Maghi del Fuoco. TUTTI tranne me! Anch'io ci sono andato vicino.
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_08"); //Riordina le idee e raccontami tutto dall'inizio,
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_09"); //D'accordo. Calmati, Milten, calmati...
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_10"); //Tutto è iniziato col crollo della vecchia miniera...
		AI_Output		(hero,self,"Info_Milten_OCWARN_15_11"); //La vecchia miniera è SPROFONDATA???
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_12"); //Sì. È successo in fretta. Tutti quelli che si trovavano all'interno sono morti.
		AI_Output		(self,hero,"Info_Milten_OCWARN_02_13"); //Le guardie hanno bloccato l'ingresso alla miniera.
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Milten_OCMINE (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCMINE_Condition;
	information	= Info_Milten_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Come ha fatto la miniera a sprofondare?";
};

FUNC int Info_Milten_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCMINE_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_01"); //Come ha fatto la miniera a sprofondare?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_02"); //Non ne ho idea. Alcuni minatori, che attendevano di fronte all'entrata, hanno parlato di un enorme terremoto e una grande nuvola di polvere proveniente dal tunnel.
	AI_Output			(hero,self,"Info_Milten_OCMINE_15_03"); //Tu eri lì?
	AI_Output			(self,hero,"Info_Milten_OCMINE_02_04"); //Sì. Così ho appreso del crollo.
};

//***************************************************************************
//	Info OCKDW
//***************************************************************************
instance Info_Milten_OCKDW (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCKDW_Condition;
	information	= Info_Milten_OCKDW_Info;
	important	= 0;
	permanent	= 0;
	description = "Cosa dicevi a proposito dei Maghi del Fuoco?";
};

FUNC int Info_Milten_OCKDW_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCKDW_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCKDW_15_01"); //Cosa dicevi a proposito dei Maghi del Fuoco?
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_02"); //So solo che, dopo il crollo, sono stati tutti uccisi dai baroni delle miniere.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_03"); //Quando sono tornato dalla nostra avventura all'anello di pietra, le guardie al cancello mi hanno attaccato.
	AI_Output			(self,hero,"Info_Milten_OCKDW_02_04"); //Urlavano parole come 'traditore' e 'collaborazionista'. Sono riuscito a scappare appena in tempo.
};

//***************************************************************************
//	Info OCWHY
//***************************************************************************
instance Info_Milten_OCWHY (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCWHY_Condition;
	information	= Info_Milten_OCWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Perché i baroni delle miniere hanno ucciso i maghi? Non ha senso...";
};

FUNC int Info_Milten_OCWHY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCKDW))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCWHY_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCWHY_15_01"); //Perché i baroni delle miniere hanno ucciso i maghi? Non ha senso...
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_02"); //Esatto. Le guardie non mi hanno permesso di fare domande: hanno subito impugnato le spade.
	AI_Output			(self,hero,"Info_Milten_OCWHY_02_03"); //Forse Diego ne sa di più. Era nel campo, quando la situazione è precipitata.
};

//***************************************************************************
//	Info OCYOU
//***************************************************************************
instance Info_Milten_OCYOU (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCYOU_Condition;
	information	= Info_Milten_OCYOU_Info;
	important	= 0;
	permanent	= 0;
	description = "Dovresti andarti a nascondere lontano da qui.";
};

FUNC int Info_Milten_OCYOU_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Milten_OCKDW))
	{
		return TRUE;
	};	
};

func void Info_Milten_OCYOU_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCYOU_15_01"); //Dovresti andarti a nascondere lontano da qui.
	AI_Output			(self,hero,"Info_Milten_OCYOU_02_02"); //No. Io e Diego siamo d'accordo di tenere d'occhio il cancello e avvisare gli amici ignari degli altri campi.

	if (!Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{	
		AI_Output		(self,hero,"Info_Milten_OCYOU_02_03"); //Parla con Diego!
	}
	else
	{
		B_LogEntry		(CH4_Firemages,"Dopo che Diego mi ha narrato gli incredibili eventi accaduti, ho incontrato Milten di fronte a Campo Vecchio. Spero che non si facciano catturare.");
	};
};

//***************************************************************************
//	Info OCDIEGO
//***************************************************************************
instance Info_Milten_OCDIEGO (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_OCDIEGO_Condition;
	information	= Info_Milten_OCDIEGO_Info;
	important	= 0;
	permanent	= 0;
	description = "Dove si trova Diego?";
};

FUNC int Info_Milten_OCDIEGO_Condition()
{
	if Npc_KnowsInfo(hero, Info_Milten_OCWHY)
	&& Npc_KnowsInfo(hero, Info_Milten_OCYOU)
	&& !Npc_KnowsInfo(hero, Info_Diego_OCSTORY)
	{
		return TRUE;
	};	
};

func void Info_Milten_OCDIEGO_Info()
{
	AI_Output			(hero,self,"Info_Milten_OCDIEGO_15_01"); //Dove si trova Diego?
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_02"); //Si nasconde dall'altra parte di Campo vecchio, vicino al cancello posteriore.
	AI_Output			(self,hero,"Info_Milten_OCDIEGO_02_03"); //Per favore, parlagli!

	B_LogEntry			(CH4_Firemages,"Milten mi ha sorpreso di fronte a Campo Vecchio e mi ha raccontato del crollo della miniera e dell'assassinio dei Maghi del Fuoco.");
	B_LogEntry			(CH4_Firemages,"Diego si trova dall'altra parte di Campo Vecchio, vicino al cancello posteriore. Devo parlare con lui: conosce i dettagli di ciò che è accaduto.");
};










//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD (C_INFO)
{
	npc			= PC_Mage;
	condition	= Info_Milten_LOADSWORD_Condition;
	information	= Info_Milten_LOADSWORD_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Milten_LOADSWORD_Condition()
{
	if (LoadSword)
	{
		return TRUE;
	};	
};

func void Info_Milten_LOADSWORD_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LOADSWORD_02_01"); //Salve, amico! Non ti si vede da una vita.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_02"); //Ciao, Milten. Sono successe un sacco di cose dal nostro ultimo incontro.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD_15_03"); //M piacerebbe raccontarti tutto, ma non ho tempo. Vado di fretta.
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD1 (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LOADSWORD1_Condition;
	information		= Info_Milten_LOADSWORD1_Info;
	important		= 0;
	permanent		= 0;
	description		= "Milten, ho bisogno del tuo aiuto!"; 
};

FUNC int Info_Milten_LOADSWORD1_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD)
	{
		return 1;
	};	
};

func void Info_Milten_LOADSWORD1_Info()
{
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_01"); //Milten, ho bisogno del tuo aiuto!
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_02"); //Cosa succede? Dimmi tutto!
	AI_Output			(hero, self,"Info_Milten_LOADSWORD1_15_03"); //Andiamo a parlare da un'altra parte.
	AI_Output			(self, hero,"Info_Milten_LOADSWORD1_02_04"); //D'accordo, seguimi.

	Npc_ExchangeRoutine	(self,	"LSAway");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info LSAWAY
//---------------------------------------------------------------------
instance Info_Milten_LSAWAY (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSAWAY_Condition;
	information		= Info_Milten_LSAWAY_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSAWAY_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD1)
	&&	(Npc_GetDistToWP(hero, "NC_KDW04_IN") < 500)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSAWAY_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_01"); //Dimmi tutto: che succede?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_02"); //Mi servono i poteri del cumulo di metallo, e non credo sia una buona idea chiedere agli altri Maghi dell'Acqua.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_03"); //Stai scherzando!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_04"); //Non ho tempo per gli scherzi. Sono serissimo.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_05"); //Ho visto Xardas, il Negromante!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_06"); //Lavoro per lui, ora!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_07"); //XARDAS??? Cominci a farmi paura!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_08"); //Nessuno gli ha parlato, da quando ha lasciato Campo Vecchio.
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_09"); //Io sì!
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_10"); //A cosa ti servono i poteri del cumulo di metallo?
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_11"); //Li voglio trasferire in questa spada.
	AI_Output			(self, hero,"Info_Milten_LSAWAY_02_12"); //Wow, che arma!
	AI_Output			(hero, self,"Info_Milten_LSAWAY_15_13"); //Si chiama URIZIEL!
};


//---------------------------------------------------------------------
//	Info LOADSWORD4
//---------------------------------------------------------------------
instance Info_Milten_LOADSWORD4 (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LOADSWORD4_Condition;
	information		= Info_Milten_LOADSWORD4_Info;
	important		= 0;
	permanent		= 0;
	description		= "Xardas mi ha dato quest'incantesimo!"; 
};

FUNC int Info_Milten_LOADSWORD4_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSAWAY)
	{
		return 1;
	};	
};

func void Info_Milten_LOADSWORD4_Info()
{
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_01"); //Xardas mi ha consegnato questo incantesimo per eseguire il trasferimento.
	AI_Output			(hero, self,"Info_Milten_LOADSWORD4_15_02"); //Lo dovrai recitare mentre unisco la spada e il metallo!
	B_UseFakeScroll		();
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_03"); //Mmmmm.... Mmmmm.... Sembra non debba fare altro che leggerlo....
	AI_Output			(self, hero,"Info_Milten_LOADSWORD4_02_04"); //Ma ci metteremo nei guai con Saturas e gli altri maghi!
};







//---------------------------------------------------------------------
//	Info LSRISK
//---------------------------------------------------------------------
instance Info_Milten_LSRISK (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSRISK_Condition;
	information		= Info_Milten_LSRISK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Dobbiamo correre il rischio!"; 
};

FUNC int Info_Milten_LSRISK_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LOADSWORD4)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSRISK_Info()
{
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_01"); //Dobbiamo correre il rischio!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_02"); //È davvero MOLTO, MOLTO importante!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_03"); //Per TUTTI gli abitanti della colonia.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_04"); //Non capisco...
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_05"); //Ci farà uscire da qui! Fidati di me!
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_06"); //D'accordo! Dopo tutto quello che hai fatto per noi, mi fido completamente di te.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_07"); //Inoltre, sembra che anche Xardas si fidi.
	AI_Output			(self, hero,"Info_Milten_LSRISK_02_08"); //Ci vediamo al cumulo di metallo e... Non parlarne con nessuno!
	AI_Output			(hero, self,"Info_Milten_LSRISK_15_09"); //Bene, al cumulo di metallo! Ci vediamo là!
	
	B_LogEntry			(CH5_Uriziel,"Potrei convincere il mio amico Milten ad aiutarmi a trasferire l'energia alla spada. Ci incontreremo alla base del cumulo di metallo dei Maghi dell'Acqua.");
	Npc_ExchangeRoutine	(self,	"LSOreHeap");
	B_ExchangeRoutine	(Sld_726_Soeldner,	"loadsword");

	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LSOREHEAP
//---------------------------------------------------------------------
instance Info_Milten_LSOREHEAP (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSOREHEAP_Condition;
	information		= Info_Milten_LSOREHEAP_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSOREHEAP_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSRISK )
	&&	(Npc_GetDistToWP(hero, "NC_PATH41") < 500)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSOREHEAP_Info()
{
	//AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"Info_Milten_LSOREHEAP_02_01"); //Hai la spada e l'incantesimo?
};
	
//***************************************************************************
//	Info LSNOW
//***************************************************************************
instance Info_Milten_LSNOW (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSNOW_Condition;
	information		= Info_Milten_LSNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ecco, prendi la pergamena!"; 
};

FUNC int Info_Milten_LSNOW_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSOREHEAP)
	&&	Npc_HasItems (hero, Mythrilklinge01)
	&&	Npc_HasItems (hero, Scroll4Milten)
	&&	(Npc_GetDistToWP(hero, "NC_PATH41") < 1000)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSNOW_Info()
{
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_01"); //Ecco, prendi la pergamena!
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_02"); //Sei pronto?
	AI_Output			(self, hero,"Info_Milten_LSNOW_02_03"); //Il più possibile per questo piano folle.
	AI_Output			(hero, self,"Info_Milten_LSNOW_15_04"); //Allora iniziamo!

	B_GiveInvItems 	(hero, self, Scroll4Milten, 1);	
	B_GiveInvItems 	(hero, self, Mythrilklinge01, 1);	

	StartChaptersSix = TRUE;

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info CHAPTERSIX
//---------------------------------------------------------------------
instance Info_Milten_CHAPTERSIX (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_CHAPTERSIX_Condition;
	information		= Info_Milten_CHAPTERSIX_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_CHAPTERSIX_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Milten_LSNOW)
	&&	StartChaptersSix
	{
		return TRUE;
	};	
};

func void Info_Milten_CHAPTERSIX_Info()
{
	AI_StopProcessInfos	(self);
	B_Kapitelwechsel	(6);
};
	
//---------------------------------------------------------------------
//	Info LSDONE
//---------------------------------------------------------------------
instance Info_Milten_LSDONE (C_INFO)
{
	npc				= PC_Mage;
	condition		= Info_Milten_LSDONE_Condition;
	information		= Info_Milten_LSDONE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_Milten_LSDONE_Condition()
{
	if	(Kapitel == 6)
	{
		return TRUE;
	};	
};

func void Info_Milten_LSDONE_Info()
{
	//AI_GotoNpc				(self, hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_01"); //Fatto!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_02"); //Incredibile! La gemma grigia ora risplende d'azzurro!

	AI_EquipBestMeleeWeapon	(hero);
	AI_ReadyMeleeWeapon		(hero);
	AI_PlayAni				(hero, "T_1HSINSPECT");
	AI_RemoveWeapon			(hero);

	AI_Output				(self, hero,"Info_Milten_LSDONE_02_03"); //Buon segno! I poteri magici del cumulo di metallo ora si trovano nella vecchia spada!
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_04"); //Ma il nostro giochetto sembra aver attirato l'attenzione di qualcuno.
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_05"); //Teletrasportati immediatamente via da qui!
	AI_Output				(hero, self,"Info_Milten_LSDONE_15_06"); //Tu cosa farai?
	AI_Output				(self, hero,"Info_Milten_LSDONE_02_07"); //Non preoccuparti per me, penserò a qualcosa! Ora vai!

	B_Story_UrizielLoaded	();
	
	AI_StopProcessInfos	(self);
};




//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################
