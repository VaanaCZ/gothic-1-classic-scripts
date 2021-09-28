// **************************************************
//						EXIT 
// **************************************************
instance  PC_Psionic_Exit (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  999;
	condition	=  PC_Psionic_Exit_Condition;
	information	=  PC_Psionic_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =	DIALOG_ENDE;
};                       

FUNC int  PC_Psionic_Exit_Condition()
{
	return 1;
};

FUNC VOID  PC_Psionic_Exit_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_01"); //Andiamo!
	}
	else
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); //Che il Dormiente vegli su te!
	};
	
	AI_StopProcessInfos	( self );
};

// **************************************************
//			SAKRILEG! Meister angesprochen
// **************************************************
instance  DIA_Lester_Sakrileg (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Sakrileg_Condition;
	information	= DIA_Lester_Sakrileg_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_Sakrileg_Condition()
{
	if (BaalNamib_Sakrileg == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Sakrileg_Info()
{
	AI_Output (self, other,"DIA_Lester_Sakrileg_05_00"); //Hai rivolto la parola a un guru! Non farlo mai più, è un sacrilegio! Se un maestro lo desidera, sarà LUI a chiamare TE.
};

// **************************************************
//						Hallo
// **************************************************

instance  DIA_Lester_Hallo (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  1;
	condition	=  DIA_Lester_Hallo_Condition;
	information	=  DIA_Lester_Hallo_Info;
	permanent	=  0;
	description = "Chi sei?";
};                       

FUNC int  DIA_Lester_Hallo_Condition()
{
	if	(Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Lester_Hallo_Info()
{
	AI_Output (other, self,"DIA_Lester_Hallo_15_00"); //Chi sei?
	AI_Output (self, other,"DIA_Lester_Hallo_05_01"); //Sono Lester. Mi occupo degli stranieri.
	if (BaalNamib_Sakrileg == FALSE)
	{
		AI_Output (self, other,"DIA_Lester_Hallo_05_02"); //Sei stato fortunato a non parlare con Baal Namib. Agli stranieri non è permesso rivolgere la parola ai guru.
	};
};

// **************************************************
//				Will mit Meister reden
// **************************************************

instance  DIA_Lester_WannaTalkToMaster (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaTalkToMaster_Condition;
	information	= DIA_Lester_WannaTalkToMaster_Info;
	permanent	= 0;
	description	= "Ma io voglio parlare col tuo maestro!";
};                       

FUNC int  DIA_Lester_WannaTalkToMaster_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) || Npc_KnowsInfo(hero,DIA_Lester_Sakrileg) )
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&  (!Npc_KnowsInfo(hero,DIA_Lester_ShowHallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaTalkToMaster_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaTalkToMaster_15_00"); //Ma io voglio parlare col tuo maestro!
	AI_Output (self, other,"DIA_Lester_WannaTalkToMaster_05_01"); //Scordatelo! Sono sicuro di poterti aiutare io con qualsiasi problema.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_CampInfo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_CampInfo_Condition;
	information	= DIA_Lester_CampInfo_Info;
	permanent	= 1;
	description	= "Parlami del campo.";
};                       

FUNC int  DIA_Lester_CampInfo_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) )
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_CampInfo_Info()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_15_00"); //Parlami del campo.
	AI_Output (self, other,"DIA_Lester_CampInfo_05_01"); //Cosa vuoi sapere?
	Info_Clearchoices (DIA_Lester_CampInfo);
	Info_Addchoice (DIA_Lester_CampInfo,DIALOG_BACK,DIA_Lester_CampInfo_BACK); 
	Info_Addchoice (DIA_Lester_CampInfo,"Parlami delle gilde.",DIA_Lester_CampInfo_GIL);
	Info_Addchoice (DIA_Lester_CampInfo,"Che mi dici del Dormiente?",DIA_Lester_CampInfo_SLEEPER);
	Info_Addchoice (DIA_Lester_CampInfo,"Cosa mi dici dell'erba?",DIA_Lester_CampInfo_HERB);
};
func void DIA_Lester_CampInfo_BACK()
{
	Info_Clearchoices (DIA_Lester_CampInfo);
};

func void DIA_Lester_CampInfo_GIL()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_GIL_15_00"); //Parlami delle gilde.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_01"); //I guru costituiscono la gilda più elevata. Grazie ai loro immensi poteri, sono lo spirito del campo. I templari usano il proprio potere spirituale in battaglia.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_02"); //Possiedono una volontà indomabile: non devi MAI metterti nei guai con loro. Per quanto riguarda me, sono un novizio. Preghiamo il Dormiente e svolgiamo tutto il lavoro.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_03"); //Alcuni novizi possono diventare guru, ma devono studiare per moltissimi anni.
};
func void DIA_Lester_CampInfo_SLEEPER()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //Che mi dici del Dormiente?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //Il Dormiente è una creatura divina. Egli provoca le visioni, perlomeno ai guru.
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //Noi lo preghiamo affinché ci liberi.
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //E tu ci credi?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //Ehi! Mi trovo all'interno della Barriera da due anni. Hai idea di quanto possano essere LUNGHI?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //Non hai idea di cosa sia disposto a fare e a credere, pur di andarmene da qui!
};
func void DIA_Lester_CampInfo_HERB()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_HERB_15_00"); //Cosa mi dici dell'erba?
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_01"); //Cresce nella palude. Ovviamente deve essere lavorata, prima che la si possa fumare. Questo è compito dei novizi.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_02"); //L'erba ha un effetto tranquillizzante e rilassante. Ti aiuta a concentrarti sulle cose essenziali e amplia il tuo stato di coscienza.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_03"); //La utilizziamo come merce di scambio con Campo Vecchio e per reclutare nuovi adepti.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_04"); //Come risultato, ovviamente molta gente si unisce a noi solo per l'erba. Beh, perlomeno danno una mano col lavoro!
};

// **************************************************
//					Wanna Join
// **************************************************

instance  DIA_Lester_WannaJoin (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaJoin_Condition;
	information	= DIA_Lester_WannaJoin_Info;
	permanent	= 0;
	description	= "Voglio diventare un membro della Fratellanza!";
};                       

FUNC int  DIA_Lester_WannaJoin_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaJoin_15_00"); //Voglio diventare un membro della Fratellanza!
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_01"); //La decisione spetta a Cor Kalom.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_02"); //Comunque, lui si fida molto dell'opinione degli altri guru. Baal Namib, laggiù, è uno di questi.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_03"); //Come prima cosa, devi dimostrare di essere un tipo valoroso, allora un guru ti manderà da Cor Kalom.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_HowProofWorthy (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_HowProofWorthy_Condition;
	information	= DIA_Lester_HowProofWorthy_Info;
	permanent	= 0;
	description	= "Come faccio, visto che nessun guru mi rivolge la parola?";
};                       

FUNC int  DIA_Lester_HowProofWorthy_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_WannaJoin))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_HowProofWorthy_Info()
{
	AI_Output (other, self,"DIA_Lester_HowProofWorthy_15_00"); //Come faccio, visto che nessun guru mi rivolge la parola?
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_01"); //Non sembra, ma i guru controllano tutto ciò che fai nel campo.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_02"); //Se riterranno che meriti di diventare un membro della comunità, ti parleranno.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_03"); //Nel campo avrai molte occasioni di dimostrare il tuo valore.

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Se voglio far parte della Fratellanza di Campo Palude, devo fare buona impressione sui guru. Sfortunatamente, non rivolgono la parola alla gente nuova. Ciononostante, Lester il novizio mi ha rivelato che mi osservano costantemente. Devo dimostrare loro il mio valore, ma non ho la più pallida idea su cosa fare! Meglio dare un'occhiata in giro per Campo Palude.");

};

// **************************************************
//				WEIT WEG von BaalNamib
// **************************************************
	var int Lester_Show;
// **************************************************

instance  DIA_Lester_WeitWeg (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WeitWeg_Condition;
	information	= DIA_Lester_WeitWeg_Info;
	permanent	= 0;
	description	= "Come faccio a farmi parlare dal tuo maestro?";
};                       

FUNC int  DIA_Lester_WeitWeg_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) > 1000)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WeitWeg_Info()
{
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_00"); //Come faccio a farmi parlare dal tuo maestro?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_01"); //Devi sapere cosa vuole ascoltare.
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_02"); //E sarebbe?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_03"); //Ascolta: la prossima volta che ci vedremo qui con lui, rivolgimi la parola.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_04"); //Baal Namib è preoccupato perché molti novizi pregano anche le proprie divinità precedenti, oltre al Dormiente.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_05"); //Tu mi dirai che hai rinunciato ai vecchi dèi e che, in futuro, pregherai solo il Dormiente.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_06"); //Allora ti chiederò il motivo della tua scelta e mi risponderai che hai avuto una visione, in cui il Dormiente ti chiamava a sé.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_07"); //Così catturerai la sua intenzione. Pensi di farcela?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_08"); //Non c'è problema.
	
	B_LogEntry	(CH1_JoinPsi,"Per fare colpo su Baal Namib, devo rivolgere la parola a Lester quando il guru è vicino e parlare dei vecchi dèi e del Dormiente.");

	Lester_Show = TRUE;
};

// **************************************************
//					SHOW - Hallo
// **************************************************

instance  DIA_Lester_ShowHallo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_ShowHallo_Condition;
	information	= DIA_Lester_ShowHallo_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_ShowHallo_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) < 500)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Lester_Show == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_ShowHallo_Info()
{
	AI_Output (self, other,"DIA_Lester_ShowHallo_05_00"); //AH! SONO FELICE DI VEDERTI DI NUOVO. COME TI VANNO LE COSE?
};

// **************************************************
//						SHOW
// **************************************************

instance  DIA_Lester_Show (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Show_Condition;
	information	= DIA_Lester_Show_Info;
	permanent	= 0;
	description	= "Ho rinunciato ai vecchi dèi.";
};                       

FUNC int  DIA_Lester_Show_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if ( (Npc_GetDistToNpc(other,namib) < 500) && (BaalNamib_Ansprechbar==FALSE) && (Lester_Show == TRUE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Show_Info()
{
	AI_Output (other, self,"DIA_Lester_Show_15_00"); //HO RINUNCIATO AI VECCHI DÈI.
	AI_Output (self, other,"DIA_Lester_Show_05_01"); //DAVVERO? E PERCHÉ?
	AI_Output (other, self,"DIA_Lester_Show_15_02"); //HO AVUTO UNA VISIONE: IL DORMIENTE MI HA PARLATO.
	AI_Output (self, other,"DIA_Lester_Show_05_03"); //E COSA TI HA DETTO?
	AI_Output (other, self,"DIA_Lester_Show_15_04"); //HA DETTO: VAI AL CAMPO NELLA PALUDE ED ENTRA NELLA FRATELLANZA.
	AI_Output (self, other,"DIA_Lester_Show_05_05"); //POSSIEDI UNA GRAN RICCHEZZA, STRANIERO: IL DORMIENTE NON OFFRE A TUTTI TALI RICOMPENSE.

	BaalNamib_Ansprechbar = TRUE;

	AI_StopProcessInfos(self);
};

// **************************************************
//				GUIDE	Offer
// **************************************************

instance  DIA_Lester_GuideOffer (C_INFO) //E3
{
	npc			= PC_Psionic;
	nr			= 5;
	condition	= DIA_Lester_GuideOffer_Condition;
	information	= DIA_Lester_GuideOffer_Info;
	permanent	= 0;
	description	= "Come faccio a orientarmi nel campo?";
};

FUNC int  DIA_Lester_GuideOffer_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_GuideOffer_Info()
{
	AI_Output (other, self,"DIA_Lester_GuideOffer_15_00"); //Come faccio a orientarmi nel campo?
	AI_Output (self, other,"DIA_Lester_GuideOffer_05_01"); //Posso mostrarti i luoghi principali.
};

// **************************************************
//				FÜHRUNG DURCHS PSI-CAMP
// **************************************************


// -----------UNTERWEGS--------------------  
instance  PC_Psionic_SOON (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_SOON_Condition;
	information	=  PC_Psionic_SOON_Info;
	important	=  0;	
	permanent	=  1;
	description = "Siamo arrivati?";
};                       

FUNC int  PC_Psionic_SOON_Condition()
{	
	if  (Npc_KnowsInfo (hero,DIA_Lester_GuideOffer))
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_SOON_Info()
{
	AI_Output (other, self,"PC_Psionic_SOON_Info_15_01"); //Siamo arrivati?
	AI_Output (self, other,"PC_Psionic_SOON_Info_05_02"); //Se la smettessi di chiedermelo, faremmo molto più in fretta.
	AI_StopProcessInfos	( self );
};
//------ UNTERWEGS IM SUMPFLAGER UND ROUTE ÄNDERN ----------------
instance  PC_Psionic_CHANGE (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_CHANGE_Condition;
	information	=  PC_Psionic_CHANGE_Info;
	important	=  0;	
	permanent	=  1;
	description = "Ho cambiato idea.";
};                       

FUNC int  PC_Psionic_CHANGE_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_Lester_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_CHANGE_Info()
{
	AI_Output (other, self,"PC_Psionic_CHANGE_Info_15_01"); //Ho cambiato idea.
	AI_Output (self, other,"PC_Psionic_CHANGE_Info_05_02"); //Sai dove trovarmi.
	AI_StopProcessInfos	( self );
	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");

};

//------------------FÜHRUNG DURCH DAS LAGER
instance  PC_Psionic_GUIDEFIRST (C_INFO)
{
	npc				= PC_Psionic;
	nr				= 5;
	condition		= PC_Psionic_GUIDEFIRST_Condition;
	information		= PC_Psionic_GUIDEFIRST_Info;
	important		= 0;
	permanent		= 1;
	description		= "Mostrami la strada..."; 
};

FUNC int  PC_Psionic_GUIDEFIRST_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_LESTER_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide == 0)
	{
		return TRUE;
	};
		

};
FUNC void  PC_Psionic_GUIDEFIRST_Info()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Mostrami la via...
//	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_Info_05_02"); //Klar, wohin willst du?
	
	Info_ClearChoices (PC_Psionic_GUIDEFIRST);
	
	Info_Addchoice (PC_Psionic_GUIDEFIRST, DIALOG_BACK, PC_Psionic_GUIDEFIRST_BACK);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"per tornare all'ingresso principale",PC_Psionic_GUIDEFIRST_MAINGATE);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"per il fabbro",PC_Psionic_GUIDEFIRST_SMITH);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"per il tempio",PC_Psionic_GUIDEFIRST_TEMPEL);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"per i tutori",PC_Psionic_GUIDEFIRST_TRAIN);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"per il laboratorio alchemico",PC_Psionic_GUIDEFIRST_HERB);

};  

func void PC_Psionic_GUIDEFIRST_MAINGATE()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
	LesterGuide = 0;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"START");
};

func void PC_Psionic_GUIDEFIRST_SMITH()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //...per la bottega del fabbro.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //Seguimi!
	LesterGuide = 1;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void PC_Psionic_GUIDEFIRST_TEMPEL()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //...per il tempio.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //Seguimi!
	LesterGuide = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void PC_Psionic_GUIDEFIRST_TRAIN()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //...per i tutori.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //Seguimi!
	LesterGuide = 3;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void PC_Psionic_GUIDEFIRST_HERB()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //...per il laboratorio alchemico!
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //Seguimi!
	LesterGuide = 4;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOHERB");
};

func void PC_Psionic_GUIDEFIRST_BACK()
{
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
};

// ***************************** Am Platz der Lehrer ****************************************//
instance  PC_Psionic_TRAIN (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TRAIN_Condition; 
	information		= PC_Psionic_TRAIN_Info;      
	important		= 1;
	permanent		= 1;
	 
};
FUNC int  PC_Psionic_TRAIN_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_PATH_9_4") < 500 )
	&& (LesterGuide == 3)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TRAIN_Info()
{
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_01"); //Laggiù troverai Baal Cadar, l'insegnante dei novizi.
	AI_PointAt(self,"PSI_PATH_9_14");
	AI_StopPointAt (self);
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_02"); //Salendo su questa scala, arriverai al campo d'addestramento dei templari. Io ti aspetterò qui. Se ci metterai molto, mi troverai all'entrata del campo con Baal Namib.

	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");
	AI_StopProcessInfos (self);
	TA_BeginOverlay		(self);
	TA_Stay			    (00,00,00,55,"PSI_PATH_9_4");
	TA_EndOverlay		(self);	
};  
// ***************************** Am Tempelplatz ****************************************//
instance  PC_Psionic_TEMPEL (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TEMPEL_Condition; 
	information		= PC_Psionic_TEMPEL_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_TEMPEL_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_TEMPLE_NOVIZE_PR") < 600 )
	&& (LesterGuide == 2)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TEMPEL_Info()
{
	AI_Output (self, other,"PC_Psionic_TEMPEL_Info_05_01"); //Ecco il tempio! Ti aspetterò, se non ci metterai molto. Altrimenti tornerò da Baal Namib.

	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_TEMPLE_NOVIZE_PR");  
	TA_EndOverlay (self);

};  
// ***************************** An der Schmiede ****************************************//
instance  PC_Psionic_SMITH (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_SMITH_Condition; 
	information		= PC_Psionic_SMITH_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_SMITH_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_SMITH_IN") < 900 )
	&& (LesterGuide == 1)
	{
		return 1;
	};

};

FUNC void  PC_Psionic_SMITH_Info()
{
	AI_Output (self, other,"PC_Psionic_SMITH_Info_05_01"); //Ecco il fabbro! Dai un'occhiata intorno. Io aspetterò per circa un'ora, poi me ne andrò.
	LesterGuide = 0;
	
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_SMITH_IN");  
	TA_EndOverlay (self);
	
	
};   
// ***************************** Beim Krauthändler ****************************************// 
instance  PC_Psionic_HERB (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_HERB_Condition; 
	information		= PC_Psionic_HERB_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_HERB_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_WALK_06") < 800 )
	&& (LesterGuide == 4)
	{
		return TRUE;
	};
};
FUNC void  PC_Psionic_HERB_Info()
{
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_01"); //Salendo su questa scala, incontrerai Kalom l'alchimista. Quaggiù c'è Fortuno, il mercante d'erba.
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_02"); //Io ti aspetto qui, ma fai in fretta, o me ne tornerò indietro.
	
	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");

	AI_StopProcessInfos(self);

	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_32_HUT_EX");  
	TA_EndOverlay (self);
};    





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info SEND
//---------------------------------------------------------------------
instance  PC_Psionic_SEND (C_INFO)// PC muss im ersten Kapitel schon mal mit Lester geredet haben 
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_SEND_Condition;
	information		= PC_Psionic_SEND_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_SEND_Condition()
{
	//SN: NICHT auf Kapitel 2 abfragen, Kapitelwechel geschieht erst unten zentral für alle SC-Gilden!!!
	if	(Npc_GetTrueGuild(hero) != GIL_NONE)
	&&	(YBerion_BringFocus != LOG_RUNNING)
	&&	(YBerion_BringFocus != LOG_SUCCESS)
	{
		return 1;
	};
};

func void  PC_Psionic_SEND_Info()
{
	AI_GotoNpc			(self,hero);
	if (Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	{
		AI_Output		(self, other,"PC_Psionic_SEND_Info_05_00"); //Sono felice di vederti. Ho delle notizie per te.
		AI_Output		(other, self,"PC_Psionic_SEND_Info_15_01"); //Buone, spero.
	};
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_02"); //La Fratellanza sta progettando qualcosa di grosso.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_03"); //Cosa avete intenzione di fare? Scappare?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_04"); //I guru stanno cercando di contattare il Dormiente, ma hanno bisogno di qualcosa che unisca i loro poteri.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_05"); //E sarebbe?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_06"); //Un oggetto magico: una pietra focalizzatrice.

	B_Kapitelwechsel	(2);
};  

//---------------------------------------------------------------------
//	Info BROTHERHOOD_TODO
//---------------------------------------------------------------------
instance  PC_Psionic_BROTHERHOOD_TODO (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BROTHERHOOD_TODO_Condition;
	information		= PC_Psionic_BROTHERHOOD_TODO_Info;
	important		= 0;
	permanent		= 0;
	description		= "Io che c'entro, con questa storia?"; 
};

FUNC int  PC_Psionic_BROTHERHOOD_TODO_Condition()
{	
	if Npc_KnowsInfo (hero, PC_Psionic_SEND)
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_BROTHERHOOD_TODO_Info()
{
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //Io che c'entro con questa storia?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //Parla con Y'Berion. Questa è la tua occasione per conquistare il favore dell'uomo più potente della zona.
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //Dove si trova?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //Raramente s'allontana dal tempio. Probabilmente, in quelle fredde rovine, si sente più vicino al Dormiente.

	Log_CreateTopic		(CH2_Focus,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Focus,	LOG_RUNNING);
	B_LogEntry			(CH2_Focus,"Lester il novizio mi ha rivelato che Y'Berion sta cercando una magica pietra focalizzatrice. Il guru si trova all'interno della montagna del tempio.");

	var C_NPC YBerion;
	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
};

//--------------------------------------- 

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##				
//#####################################################################

//	Suche Nach Dem Fokus In Der Bergfestung

//---------------------------------------------------------------------
//	Info FOLLOWME
//---------------------------------------------------------------------
instance PC_Psionic_FOLLOWME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOLLOWME_Condition;
	information		= PC_Psionic_FOLLOWME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOLLOWME_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_01") < 400 ) 
	&& ( Npc_GetDistToNpc (hero,PC_PSIONIC) <400)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOLLOWME_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_01"); //Cosa stai facendo?
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_02"); //Vengo per ordine dei Maghi dell'Acqua. Sono in cerca di alcuni manufatti magici, chiamati pietre focalizzatrici.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_03"); //Cerchi le pietre focalizzatrici? Hai molto coraggio!
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_04"); //Saturas e gli altri maghi di Campo Nuovo vogliono usarle per far esplodere la Barriera, così saremo liberi da questa prigione.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_05"); //Ci crederò quando lo vedrò con i miei occhi.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_06"); //Anch'io. Dimmi: perché sei qui?
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_07"); //Sto valutando se valga la pena fare una visita al forte sulla montagna.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_08"); //Sai... lì c'è un documento che vorrei avere. D'altro canto, è molto pericoloso tentare d'arrivarci.
};

// ***************************** INFOS ****************************************//
instance  PC_Psionic_GOLEM (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_GOLEM_Condition;
	information		= PC_Psionic_GOLEM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Come pensi di superare la montagna vivente?"; 
};

FUNC int  PC_Psionic_GOLEM_Condition()
{	
	if (Npc_KnowsInfo  (hero, PC_Psionic_FOLLOWME))
	&& (!Npc_KnowsInfo  (hero, PC_Psionic_FINISH ))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_GOLEM_Info()
{
	AI_Output (other, self,"PC_Psionic_NORMAL_Info_15_01"); //Come pensi di superare la montagna vivente?
	AI_Output (self, other,"PC_Psionic_NORMAL_Info_05_02"); //Ho imparato molto dai guru. La loro magia potrebbe risultare davvero utile.
};  

//------------GESCHICHTE WARUM LESTER ZUR BERGFESTUNG GEHT--------------------
instance  PC_Psionic_STORY (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_STORY_Condition;
	information		= PC_Psionic_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Il documento che cerchi... cos'è?"; 
};

FUNC int  PC_Psionic_STORY_Condition()
{	
	if	Npc_KnowsInfo (hero, PC_Psionic_FOLLOWME)  
	 
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_STORY_Info()
{
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_01"); //Il documento che cerchi... cos'è?
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_02"); //Molti anni fa, il signore di questa zona viveva nel forte. Egli controllava la terra e le miniere.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_03"); //Come ogni aristocratico, sicuramente teneva un attestato dei suoi possedimenti. Ecco cosa cerco.
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_04"); //Ma finché saremo rinchiusi all'interno della Barriera, non ti servirà a nulla.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_05"); //Hai ragione. Se però i Maghi dell'Acqua riusciranno a distruggerla, l'attestato tornerà a valere molto.
};  

// ***************************** INFOS ****************************************//
instance  PC_Psionic_COMEWITHME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEWITHME_Condition;
	information		= PC_Psionic_COMEWITHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Potremmo dare un'occhiata al forte insieme!"; 
};

FUNC int  PC_Psionic_COMEWITHME_Condition()
{	
	if	Npc_KnowsInfo(hero, PC_Psionic_STORY)
	&&	Npc_KnowsInfo(hero, PC_Psionic_GOLEM)
	{
		return TRUE;
	};
};

FUNC void  PC_Psionic_COMEWITHME_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEWITHME_Info_15_01"); //Potremmo dare un'occhiata al forte insieme!
	AI_Output (self, other,"PC_Psionic_COMEWITHME_Info_05_02"); //Ottima idea. Vai avanti, io ti seguo da vicino.

	Log_CreateTopic		(CH3_Fortress,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Fortress,	LOG_RUNNING);
	B_LogEntry		(CH3_Fortress,"Ho incontrato Lester, il novizio di Campo Palude, di fronte a una grande fortezza costruita nella montagna. È a caccia di un documento e ha deciso di accompagnarmi nella mia ricerca della pietra focalizzatrice.");

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");
	AI_StopProcessInfos	(self);
};  

//--------------------SPIELER KOMMT MIT LESTER ZUM FOKUSPLATZ-------------------
instance PC_Psionic_FOKUSPLACE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOKUSPLACE_Condition;
	information		= PC_Psionic_FOKUSPLACE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOKUSPLACE_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_03_PATH_RUIN7") < 400 ) 
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOKUSPLACE_Info()
{
	AI_GotoNpc(self,hero);
	//AI_PointAt(FOKUSWP)
	AI_Output (self, other,"PC_Psionic_FOKUSPLACE_Info_05_01"); //Guarda! Sembra che la pietra focalizzatrice che cerchi sia lassù.
	AI_Output (other, self,"PC_Psionic_FOKUSPLACE_Info_15_02"); //Già! Sembra una piattaforma focalizzatrice. Uhm... Non è facile da raggiungere...
	AI_StopProcessInfos(self);

	B_LogEntry		(CH3_Fortress,"La pietra che cerco si trova su un piedistallo troppo alto per essere raggiunta. Devo trovare un altro modo per prenderla.");	
	
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE2");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE3");
};

// ---------SPIELER WILL ÜBER DIE BRÜCKE OHNE DEN AUFTRAG ERFÜLLT ZU HABEN--------
instance PC_Psionic_COMEBACK (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEBACK_Condition;
	information		= PC_Psionic_COMEBACK_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_COMEBACK_Condition()
{	
	if ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2" ) < 600 )
	&& ( Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	&& (! Npc_HasItems (hero,Focus_3))
	{
		return TRUE;
	};
};
func void  PC_Psionic_COMEBACK_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_COMEBACK_Info_05_01"); //Dove vai? Non abbiamo ancora finito!
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine (self,"FORTRESSWAIT");
	AI_StopProcessInfos(self);
};

// -----SPIELER IST VERLETZT UND FRAGT NACH HILFE-------------------
instance  PC_Psionic_IAMHURT (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_IAMHURT_Condition;
	information		= PC_Psionic_IAMHURT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Sono ferito! Puoi aiutarmi?"; 
};

FUNC int  PC_Psionic_IAMHURT_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]/2))
	&& (Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_IAMHURT_Info()
{
	AI_Output (other, self,"PC_Psionic_IAMHURT_Info_15_01"); //Sono ferito! Puoi aiutarmi?
	AI_Output (self, other,"PC_Psionic_IAMHURT_Info_05_02"); //Prendi questa pozione guaritrice.
	
	CreateInvItem (self,ItFo_Potion_Health_02);
	B_GiveInvItems 	(self, hero,ItFo_Potion_Health_02, 1);
};  

//------------- SPIELER HAT DIE URKUNDE FÜR LESTER GEFUNDEN-----------------------
instance  PC_Psionic_URKUNDE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_URKUNDE_Condition;
	information		= PC_Psionic_URKUNDE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ho trovato l'attestato."; 
};

FUNC int  PC_Psionic_URKUNDE_Condition()
{	
	if(( Npc_HasItems (hero,ItWr_Urkunde_01 ))
	&&( Npc_KnowsInfo(hero,PC_Psionic_STORY)))  
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_URKUNDE_Info()
{
	AI_Output			(other, self,"PC_Psionic_URKUNDE_Info_15_01"); //Ho trovato l'attestato.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_02"); //Ehi, ben fatto! Prendi questi incantesimi come ricompensa. Grazie a essi, ora potrai raggiungere la pietra focalizzatrice.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_03"); //Io ti aspetterò vicino alla piattaforma.

	B_LogEntry		(CH3_Fortress,"L'attestato nobiliare, che Lester stava cercando, era in uno scrigno. In cambio, egli mi ha donato quattro incantesimi di telecinesi, che mi permetteranno di prendere la pietra focalizzatrice.");
	
	CreateInvItems		(self,ItArScrollTelekinesis,4);
	B_GiveInvItems 	(self, hero, ItArScrollTelekinesis,4);
	B_GiveInvItems	(hero, self, ItWr_Urkunde_01, 1);

	Npc_ExchangeRoutine	(self,	"WaitAtFocus");
	AI_StopProcessInfos	(self);
};

//-------------
instance  PC_Psionic_TIP (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_TIP_Condition;
	information		= PC_Psionic_TIP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Come faccio a raggiungere la pietra?"; 
};

FUNC int  PC_Psionic_TIP_Condition()
{	
	if (Npc_KnowsInfo (hero, PC_Psionic_URKUNDE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_TIP_Info()
{
	AI_Output (other, self,"PC_Psionic_TIP_Info_15_01"); //Come faccio a raggiungere la pietra?
	AI_Output (self, other,"PC_Psionic_TIP_Info_05_02"); //Y'Berion era solito dire: lo studente muove gli oggetti con gli arti, il maestro usa lo spirito.
// 	AI_Output (self, other,"PC_Psionic_TIP_Info_05_03"); //Hier ist ein guter Ort, um die Kraft des Geistes zu nutzen!
};  

// ---ALLES IN DER BERGFESTUNG ERLEDIGT ABER LESTER DIE URKUNDE NICHT GEGEBEN
instance PC_Psionic_LEAVE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_LEAVE_Condition;
	information		= PC_Psionic_LEAVE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_LEAVE_Condition()
{	
	if ( ! Npc_HasItems (hero, Focus_3) )
	&& ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&& ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2") < 900 )
	{
		return TRUE;
	};
};
func void  PC_Psionic_LEAVE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_LEAVE_Info_05_01"); //Resterò qui per cercare l'attestato.
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos(self);
};

// --- Lester geht nach oben!-------------------------------
instance PC_Psionic_BALKON (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BALKON_Condition;
	information		= PC_Psionic_BALKON_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_BALKON_Condition()
{	
	if  ( ! Npc_HasItems  (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp (hero, "LOCATION_19_03_PEMTAGRAM2") < 1000 )

	{
		return TRUE;
	};
};
func void  PC_Psionic_BALKON_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_BALKON_Info_05_01"); //Io andrò a dare un'occhiata lassù.
	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine (self,"BALKON");

};
//---------------------------------------------------------------
instance PC_Psionic_FINISH (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FINISH_Condition;
	information		= PC_Psionic_FINISH_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FINISH_Condition()
{	
	if Npc_HasItems (hero,Focus_3)
	&& Npc_KnowsInfo(hero,PC_Psionic_URKUNDE)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FINISH_Info()
{
	AI_Output (self, other,"PC_Psionic_FINISH_Info_05_01"); //Ora abbiamo entrambi ciò che cercavamo. Resterò qui a leggere questi antichi volumi.
	AI_Output (other, self,"PC_Psionic_FINISH_Info_15_02"); //Ci rivedremo.

	B_LogEntry		(CH3_Fortress,"Ho recuperato la pietra. Lester ha deciso di restare, per dare un'occhiata alla biblioteca della fortezza. Mi chiedo se lo rivedrò ancora.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos	(self);
}; 
/*---------------------------------BALKON DER BERGFESTUNG									
------------------------------------------------------------------------*/

instance  PC_Psionic_CHESTCLOSED (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_CHESTCLOSED_Condition;
	information		= PC_Psionic_CHESTCLOSED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hai trovato qualcosa?"; 
};

FUNC int  PC_Psionic_CHESTCLOSED_Condition()
{	
	if  ( ! Npc_HasItems (hero, Focus_3) )
	&&  ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp(hero,"LOCATION_19_03_SECOND_ETAGE_BALCON") < 500)
	{ 
		return TRUE;
	};

};
FUNC void  PC_Psionic_CHESTCLOSED_Info()
{
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //Hai trovato qualcosa?
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //Quello scrigno è chiuso. Forse possiamo trovare la chiave, da qualche parte.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //Hai già trovato l'attestato?
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //No, non ancora...
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //Hai cercato nella biblioteca?
	AI_StopProcessInfos(self);
};  
/*------------------------------------------------------------------------
							COME WITH ME AGAIN							
------------------------------------------------------------------------*/

instance  PC_Psionic_COMEAGAIN (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEAGAIN_Condition;
	information		= PC_Psionic_COMEAGAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Esaminiamo il forte assieme."; 
};

FUNC int  PC_Psionic_COMEAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Psionic_LEAVE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_COMEAGAIN_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEAGAIN_Info_15_01"); //Esaminiamo il forte assieme.
	AI_Output (self, other,"PC_Psionic_COMEAGAIN_Info_05_02"); //Va bene, vai avanti tu!
 
 	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");

	AI_StopProcessInfos(self);
};  

//---------------------------------------------------------------------
//	Info DIEGOMILTEN      ******Björn****** Patch2
//---------------------------------------------------------------------
INSTANCE Info_Lester_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Psionic;
	condition	= Info_Lester_DIEGOMILTEN_Condition;
	information	= Info_Lester_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ho incontrato Diego e Milten di fronte a Campo Vecchio!";
};                       

FUNC INT Info_Lester_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Lester_DIEGOMILTEN_Info()
{
	
	AI_Output	(hero,self,"Info_SFB_1_DieLage_15_00"); 				//Come va?
	AI_Output 	(self, hero,"PC_Psionic_FOLLOWME_Info_05_01"); 			//Cosa stai facendo?
	AI_Output	(hero,self,"Info_Saturas_COLLAPSE_15_01"); 				//La vecchia miniera è crollata a causa delle infiltrazioni d'acqua!
	AI_Output 	(self, hero,"DIA_Fingers_BecomeShadow_05_01"); 			//E allora?
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_01"); 					//Tutti i Maghi del Fuoco sono morti!
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_02"); 					//Gomez li ha fatti uccidere.
	AI_Output 	(self, hero,"SVM_5_GetThingsRight"); 					//Non sarà facile rimettere a posto le cose!
	AI_Output 	(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); 				//Ho incontrato Diego e Milten di fronte a Campo Vecchio!
	AI_Output 	(hero, self,"Info_lester_DIEGOMILTEN_15_01"); 			//Vogliono incontrarti al solito posto.
	AI_Output 	(self, hero,"SVM_5_YeahWellDone"); 						//Era ora!
	AI_Output 	(other, self,"Info_Gorn_RUINWALLWHAT_15_01"); 			//E ora che facciamo?
	AI_Output 	(self, hero,"Info_lester_DIEGOMILTEN_05_02"); 			//Io resto qui a leggere questi antichi volumi.
	AI_Output	(hero, self,"KDW_600_Saturas_OATH_Info_15_06"); 		//Uh... Non capisco...
	AI_Output 	(self, hero,"PC_Psionic_TIP_Info_05_02"); 				//Y'Berion era solito dire: lo studente muove gli oggetti con gli arti, il maestro usa lo spirito.
	AI_Output	(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); 	//Va bene, va bene: ho capito.
	AI_Output 	(self, hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); 	//Stai attento.
	AI_Output	(hero, self,"Info_FreemineOrc_EXIT_15_03"); 			//Grazie. Ora riprendo la mia strada.
	AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); 					//Che il Dormiente vegli su te!
		
	B_GiveXP			(XP_MessageForGorn);

	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else
	{
		B_LogEntry			(CH4_4Friends,		"Ho informato Lester e Gorn della riunione coi loro amici. Questa faccenda non è più affare mio: loro sanno cosa fare..."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};


	AI_StopProcessInfos(self);

};
