// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Thorus_EXIT(C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 999;
	condition	= Info_Thorus_EXIT_Condition;
	information	= Info_Thorus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Thorus_EXIT_Condition()
{
	return 1;
};
 
FUNC VOID Info_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					Nur Gomez Leute in Burg
// ************************************************************

INSTANCE Info_Thorus_EnterCastle(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_EnterCastle_Condition;
	information	= Info_Thorus_EnterCastle_Info;
	permanent	= 0;
	description = "Non sembri intenzionato a far entrare chiunque nel castello.";
};                       

FUNC INT Info_Thorus_EnterCastle_Condition()
{	
	if !C_NpcBelongsToOldCamp (other)
	&& (Diego_GomezAudience == FALSE)
	{
		return 1;
	};
};
FUNC VOID Info_Thorus_EnterCastle_Info()
{	
	AI_Output (other, self,"Info_EnterCastle_15_00"); //Non sembri intenzionato a far entrare chiunque nel castello.
	AI_Output (self, other,"Info_EnterCastle_09_01"); //Solo gli uomini di Gomez possono passare.
};

// ************************************************************
// 					Ich will für Gomez arbeiten
// ************************************************************

INSTANCE Info_Thorus_WorkForGomez(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_WorkForGomez_Condition;
	information	= Info_Thorus_WorkForGomez_Info;
	permanent	= 0;
	description = "Io voglio lavorare per Gomez.";
};                       

FUNC INT Info_Thorus_WorkForGomez_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) || Npc_KnowsInfo (hero,Info_Thorus_EnterCastle) )
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_WorkForGomez_Info()
{	
	AI_Output (other, self,"Info_WorkForGomez_15_00"); //Io voglio lavorare per Gomez.
	AI_Output (self, other,"Info_WorkForGomez_09_01"); //Ah, davvero? Cosa ti fa pensare che lui voglia darti lavoro?
};

// ************************************************************
// 						Diego schickt mich
// ************************************************************

INSTANCE Info_Thorus_DiegoSentMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_DiegoSentMe_Condition;
	information	= Info_Thorus_DiegoSentMe_Info;
	permanent	= 0;
	description = "Diego sostiene che sei TU a decidere a chi s'interessi Gomez.";
};                       

FUNC INT Info_Thorus_DiegoSentMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) && Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_DiegoSentMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_00"); //Diego sostiene che sei TU a decidere a chi s'interessi Gomez.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_01"); //Uh... Se Diego pensa che sei a posto, perché non si occupa LUI di te?
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_02"); //Ti spiego: Diego ti metterà alla prova. Se LUI ti riterrà abbastanza in gamba, ti farò entrare nel castello per parlare con Gomez.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_03"); //Tutto ciò che succederà dopo saranno affari tuoi, d'accordo?
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_04"); //Parlerò con Diego.
	
	B_LogEntry(CH1_JoinOC,"Thorus mi ha suggerito di farmi mettere alla prova da Diego, se voglio essere ammesso a Campo Vecchio.");
};

// ************************************************************
// 						Try Me
// ************************************************************

INSTANCE Info_Thorus_TryMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMe_Condition;
	information	= Info_Thorus_TryMe_Info;
	permanent	= 0;
	description = "Perché non mi metti alla prova?";
};                       

FUNC INT Info_Thorus_TryMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMe_15_00"); //Perché non mi metti tu alla prova?
	AI_Output (self, other,"Info_Thorus_TryMe_09_01"); //Non è così semplice, ragazzo! Ogni novellino ha bisogno di un padrino.
	AI_Output (self, other,"Info_Thorus_TryMe_09_02"); //E il padrino deve essere uno degli uomini di Gomez. Sarà lui a metterti alla prova.
	AI_Output (self, other,"Info_Thorus_TryMe_09_03"); //Se fallisci, la responsabilità è sua. Questa è la legge.
};

// ************************************************************
// 						TryMeAgain
// ************************************************************

INSTANCE Info_Thorus_TryMeAgain(C_INFO) //E4
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeAgain_Condition;
	information	= Info_Thorus_TryMeAgain_Info;
	permanent	= 0;
	description = "Deve esserci qualcosa che posso fare per te.";
};                       

FUNC INT Info_Thorus_TryMeAgain_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeAgain_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeAgain_15_00"); //Deve esserci qualcosa che posso fare per te.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_01"); //No. Gli affari che riguardano noi guardie sono troppo al di sopra delle tue possibilità, ragazzo.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_02"); //Pensa a completare le missioni che ti darà il tuo padrino.
};

// ************************************************************
// 						TryMeICanDoIt
// ************************************************************

INSTANCE Info_Thorus_TryMeICanDoIt(C_INFO) //E5
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeICanDoIt_Condition;
	information	= Info_Thorus_TryMeICanDoIt_Info;
	permanent	= 0;
	description = "Sono in grado di fare qualsiasi cosa mi chiederai.";
};                       

FUNC INT Info_Thorus_TryMeICanDoIt_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeAgain) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeICanDoIt_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeICanDoIt_15_00"); //Sono in grado di fare qualsiasi cosa mi chiederai.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_01"); //Davvero? Quindi sei determinato a fallire, eh? C'è una cosa che può fare solo un uomo che non appartenga a Gomez.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_02"); //Ma ti avverto: se sbaglierai, ti ritroverai in guai grossi.
};

// **************************************************************************
// 							MISSION MORDRAG KO
// **************************************************************************
VAR INT Thorus_MordragKo;
// **************************************************************************
// 							MISSION MORDRAG KO VERGABE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Offer (C_INFO) //E6
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Offer_Condition;
	information	= Info_Thorus_MordragKo_Offer_Info;
	permanent	= 0;
	description = "Sono pronto.";
};                       

FUNC INT Info_Thorus_MordragKo_Offer_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeICanDoIt) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Offer_Info()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_00"); //Sono pronto.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_01"); //Quello che ti dirò dovrà restare fra me, te e nessun altro. Chiaro?
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_02"); //Certo.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_03"); //Abbiamo un problema con un tizio a Campo Nuovo. Il suo nome è Mordrag e ha derubato i baroni delle miniere.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_04"); //Ovviamente, molti ladri di Campo Nuovo fanno lo stesso, ma questo tizio ha avuto la sfacciataggine di venire al NOSTRO campo e rubare le NOSTRE merci dalla NOSTRA gente!
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_05"); //Si è spinto troppo oltre, ma sa che non posso farci nulla.
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_06"); //Perché?
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_07"); //Perché è sotto la protezione dei maghi.

	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
	Info_AddChoice   (Info_Thorus_MordragKo_Offer,"Me ne occuperò io.",Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Vuoi che lo uccida?",Info_Thorus_MordragKo_KillHim);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Dove si trova Mordrag?",Info_Thorus_MordragKo_Where);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Perché i maghi proteggono Mordrag?",Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Sembra che i maghi siano un problema, per te...",Info_Thorus_MordragKo_MageProblem);
	
	Thorus_MordragKo = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_MordragKO, LOG_MISSION);
	B_LogEntry			(CH1_MordragKO,"Thorus mi ha chiesto di sbarazzarmi di un farabutto di nome Mordrag. Posso decidere io in che modo, ma nessuno deve scoprire che Thorus è coinvolto.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_RUNNING);

	var C_Npc Mordrag; 				
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
};

FUNC VOID Info_Thorus_MordragKo_OFFER_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //Me ne occuperò io.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

FUNC VOID Info_Thorus_MordragKo_KillHim()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_KillHim_15_00"); //Vuoi che lo uccida?
	AI_Output (self, other,"Info_Thorus_MordragKo_KillHim_09_01"); //Voglio che ti assicuri che non riveda mai più la sua faccia da queste parti, non m'importa come.
};

FUNC VOID Info_Thorus_MordragKo_Where()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Where_15_00"); //Dove si trova Mordrag?
	AI_Output (self, other,"Info_Thorus_MordragKo_Where_09_01"); //Al cancello sud, dall'altra parte del castello, subito dopo l'entrata. Il bastardo non oserà più avvicinarsi al campo.
	B_LogEntry(CH1_MordragKO,"Mordrag si trova al cancello sud, dietro al castello.");
};

FUNC VOID Info_Thorus_MordragKo_MagesProtect()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //Perché i maghi proteggono Mordrag?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Perché lo usano come fattorino. I nostri maghi sono in contatto con quelli di Campo Nuovo e spesso inviano queste persone avanti e indietro.
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //Sarebbero MOLTO dispiaciuti, se scacciassi uno dei loro uomini dal campo o lo facessi uccidere.
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //E IO? Che cosa faranno i maghi a ME?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //Tu sei nuovo di qui, non ti faranno nulla. Io, invece, sono responsabile delle azioni dei miei uomini. Ecco perché ti ho chiesto di tenere la bocca chiusa.
	Thorus_MordragMageMessenger = TRUE;
};

FUNC VOID Info_Thorus_MordragKo_MageProblem()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Sembra che i maghi siano un problema, per te...
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Già, ma un problema difficile da risolvere. Alcuni anni fa, una delle Ombre tentò di uccidere nel sonno il Gran Mago del Circolo di Fuoco.
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_02"); //Lo ritrovarono nell'Anello Esterno. In effetti, era sparso TUTTO INTORNO all'anello.
};

// **************************************************************************
// 									ANALYZE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Analyze (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Analyze_Condition;
	information	= Info_Thorus_MordragKo_Analyze_Info;
	permanent	= 1;
	description = "Per quanto riguarda Mordrag...";
};                       

FUNC INT Info_Thorus_MordragKo_Analyze_Condition()
{	
	if ( (Thorus_MordragKo == LOG_RUNNING) && (MordragKO_PlayerChoseThorus != TRUE) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Analyze_Info()
{
	Info_ClearChoices	(Info_Thorus_MordragKo_Analyze);
	Info_AddChoice   	(Info_Thorus_MordragKo_Analyze,"Me ne occuperò io.",Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice	 	(Info_Thorus_MordragKo_Analyze,"Dove si trova Mordrag?",Info_Thorus_MordragKo_Where);	//SIEHE OBEN
	var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	if (Npc_IsDead(Mordrag))
	{
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"Mordrag non deruberà più nessuno!",Info_Thorus_MordragKo_MordragDead);
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{ 
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"Non si farà più rivedere da queste parti!",Info_Thorus_MordragKo_MordragGone);
	};
    
};

FUNC VOID Info_Thorus_MordragKo_ANALYZE_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00"); //Me ne occuperò io.
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

FUNC VOID Info_Thorus_MordragKo_MordragDead()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragDead_15_00"); //Mordrag non deruberà più nessuno!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragDead_09_01"); //Vuoi dire che l'hai sconfitto? Niente male, ragazzo.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);	
	B_LogEntry (CH1_MordragKO,"Thorus è rimasto impressionato da come mi sono liberato di Mordrag. Un punto a mio favore.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);

};

FUNC VOID Info_Thorus_MordragKo_MordragGone()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragGone_15_00"); //Non si farà più rivedere da queste parti!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragGone_09_01"); //Sarei stato più felice se l'avessi ucciso.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);
	B_LogEntry (CH1_MordragKO,"Thorus è felice che Mordrag non si aggiri più per il campo.");
	B_GiveXP(XP_Thorusmordragko);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

// ************************************************************
// 						Mordrag verplappert					
// ************************************************************

INSTANCE Info_Thorus_MordragFailed (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragFailed_Condition;
	information	= Info_Thorus_MordragFailed_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Thorus_MordragFailed_Condition()
{	
	if (MordragKO_PlayerChoseThorus == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragFailed_Info()
{
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_00"); //Hai fallito! TI avevo detto di NON FARE IL MIO NOME!!!
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_01"); //Hai mandato tutto a monte! Dimentica tutta la storia! Non osare mai più occuparti di questa faccenda!
			
	Thorus_MordragKo = LOG_FAILED;
	
	Log_SetTopicStatus(CH1_MordragKO, LOG_FAILED);
	B_LogEntry (CH1_MordragKO,"Thorus non è stato contento che abbia fatto il suo nome a Mordrag. Sarà meglio che non mi faccia vedere da lui, per un po'.");
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Bribe Thorus					
// ************************************************************

INSTANCE Info_Thorus_BribeGuard (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_BribeGuard_Condition;
	information	= Info_Thorus_BribeGuard_Info;
	permanent	= 0;
	description = "Se ti regalassi un po' di metallo, mi faresti entrare nel castello?";
};                       

FUNC INT Info_Thorus_BribeGuard_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_EnterCastle) && (Npc_GetTrueGuild (other)!=GIL_STT) && (Npc_GetTrueGuild (other)!=GIL_GRD) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_BribeGuard_Info()
{
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_00"); //Se ti regalassi una certa quantità di metallo, mi faresti entrare nel castello?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_01"); //Dipende dalla quantità...
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_02"); //Quanto metallo vuoi?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_02"); //Beh... Dovrebbe essere abbastanza da costringere me e i miei ragazzi a passare un po' di tempo a contarlo, mentre tu strisci dentro.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_03"); //Allora? Quanto?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_03"); //1000 pezzi saranno sufficienti.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_04"); //1000 pezzi?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_04"); //Beh, se vuoi entrare gratis puoi unirti a Gomez.
};

// ************************************************************
// 						Give1000Ore					
// ************************************************************

INSTANCE Info_Thorus_Give1000Ore (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_Give1000Ore_Condition;
	information	= Info_Thorus_Give1000Ore_Info;
	permanent	= 1;
	description = "Ho i 1.000 pezzi di metallo. Ora fammi passare!";
};                       

FUNC INT Info_Thorus_Give1000Ore_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_BribeGuard))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Give1000Ore_Info()
{
	AI_Output (other, self,"Info_Thorus_Give1000Ore_15_00"); //Ho i 1000 pezzi di metallo. Ora fammi passare!
	
	if (Npc_HasItems(other, ItMiNugget)>=1000)
	{
		B_GiveInvItems 	(other,self,ItMiNugget,1000);		
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_01"); //Va bene, passa. Puoi entrare nel castello, ma non fare lo stupido, d'accordo?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_02"); //Non cercare d'ingannarmi, ragazzo. Non hai 1000 pezzi di metallo!
	};
};
		
// ************************************************************
// 					Brief für Magier
// ************************************************************

INSTANCE Info_Thorus_LetterForMages (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_LetterForMages_Condition;
	information	= Info_Thorus_LetterForMages_Info;
	permanent	= 1;
	description = "Devo entrare nel castello! Ho una lettera da parte del Gran Mago del Fuoco!";
};                       

FUNC INT Info_Thorus_LetterForMages_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Thorus_EnterCastle)
	&&	(Npc_HasItems (hero, ItWr_Fire_Letter_01) || Npc_HasItems (hero, ItWr_Fire_Letter_02))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_LetterForMages_Info()
{
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_00"); //Devo entrare nel castello! Ho una lettera da parte del Gran Mago del Fuoco!
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_01"); //E credi che ti faccia passare, per prenderti la tua ricompensa?
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_02"); //Sì.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_03"); //Va bene, mostrami la lettera.
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_04"); //Non posso permetterlo, dimentica tutto!
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_05"); //Va bene, l'ho dimenticato.
};

// ************************************************************
// 					Bereit für Gomez !!!
// ************************************************************

INSTANCE Info_Thorus_ReadyForGomez (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_ReadyForGomez_Condition;
	information	= Info_Thorus_ReadyForGomez_Info;
	permanent	= 0;//1
	description = "Diego dice che sono pronto a incontrare Gomez!";
};                       

FUNC INT Info_Thorus_ReadyForGomez_Condition()
{	
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_ReadyForGomez_Info()
{
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_00"); //Diego dice che sono pronto a incontrare Gomez!
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_01"); //Questa decisione spetta a me!
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_02"); //E tu cosa decidi?
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_03"); //Hmmm...
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_04"); //Devo ammettere che quasi tutto ciò che hai fatto era in buona fede.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_05"); //Va bene! Puoi vedere Gomez. Deciderà lui se potrai unirti a noi.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_06"); //D'ora in poi sei solo, ragazzo.
				
	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;
};

// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Thorus_Krautbote (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_Krautbote_Condition;
	information	= Info_Thorus_Krautbote_Info;
	permanent	= 0;
	description = "Devo consegnare una quantità d'erba per Gomez, da parte di Cor Kalom.";
};                       

FUNC INT Info_Thorus_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Krautbote_Info()
{
	AI_Output (other, self,"Info_Thorus_Krautbote_15_00"); //Devo consegnare una quantità d'erba per Gomez, da parte di Cor Kalom.
	AI_Output (self, other,"Info_Thorus_Krautbote_09_01"); //Mostramela!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_02"); //Hmmmmmmm...
		AI_Output (self, other,"Info_Thorus_Krautbote_09_03"); //Va bene, puoi passare. Vai diritto alla casa dei baroni della miniera e incontrerai Bartholo.
		
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_04"); //Non hai abbastanza erba, per essere un fattorino! Spero per te che tu non abbia rivenduto parte della merce! Torna quando avrai la quantità giusta.
	};
};

// ************************************************************
// 					SIEGEL der KdW
// ************************************************************
	var int thorus_Amulettgezeigt;
// ************************************************************

INSTANCE Info_Thorus_KdWSiegel (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_KdWSiegel_Condition;
	information	= Info_Thorus_KdWSiegel_Info;
	permanent	= 1;
	description = "Mi mandano i Maghi dell'Acqua. Devo entrare nel castello!";
};                       

FUNC INT Info_Thorus_KdWSiegel_Condition()
{	
	if 	(( (Npc_KnowsInfo(hero, Org_826_Mordrag_Courier))||(Npc_HasItems(other,KdW_Amulett)>=1) )
		&& (thorus_Amulettgezeigt == FALSE) 
		)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_KdWSiegel_Info()
{
	AI_Output (other, self,"Info_Thorus_KdWSiegel_15_00"); //Mi mandano i Maghi dell'Acqua. Devo entrare nel castello!
	if (Npc_HasItems(other,KdW_Amulett)>=1)
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_01"); //Hai con te un amuleto del messaggero. Grazie a quello potrai superare le guardie.
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_02"); //Non voglio avere nulla a che fare coi maghi, quindi smettila di disturbarmi.
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		
		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_03"); //Come no! Immagino che tu abbia indossato l'amuleto sbagliato, vero?
	};
};

// ************************************************************
// 					Habs GESCHAFFT
// ************************************************************

INSTANCE Info_Thorus_SttGeschafft (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_SttGeschafft_Condition;
	information	= Info_Thorus_SttGeschafft_Info;
	permanent	= 0;
	description = "Ce l'ho fatta! Almeno appartengo al campo!";
};                       

FUNC INT Info_Thorus_SttGeschafft_Condition()
{	
	if (Npc_GetTrueGuild(other) == GIL_STT)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_SttGeschafft_Info()
{
	AI_Output (other, self,"Info_Thorus_SttGeschafft_15_00"); //Ce l'ho fatta! Almeno appartengo al campo!
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_01"); //Congratulazioni, ragazzo! D'ora in poi farai meglio a stare molto vicino a Diego.
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_02"); //Vai da Gomez o Raven solo se hai qualcosa di MOLTO importante da riferire.
};	

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2 	   ///////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// ************************************************************
// 					PERM2
// ************************************************************

INSTANCE Info_Thorus_PERM2 (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_PERM2_Condition;
	information	= Info_Thorus_PERM2_Info;
	permanent	= 0;
	description = "Come va?";
};                       

FUNC INT Info_Thorus_PERM2_Condition()
{	
	if ( (Npc_GetTrueGuild(other) == GIL_STT) && (Kapitel < 4) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_PERM2_Info()
{
	AI_Output (other, self,"Info_Thorus_PERM2_15_00"); //Come va?
	AI_Output (self, other,"Info_Thorus_PERM2_09_01"); //Campo Nuovo non dà molti problemi. Quelli che mi preoccupano davvero sono quei pazzi della Setta.
};	

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

//-----------------------------------------------------
// GILDENAUFNAHME GARDIST
//-----------------------------------------------------

instance  GRD_200_Thorus_GARDIST (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_GARDIST_Condition;
	information		= GRD_200_Thorus_GARDIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hai qualcosa da riferirmi?"; 
};

FUNC int  GRD_200_Thorus_GARDIST_Condition()
{	
	if ( (CorKalom_BringMCQBalls == LOG_SUCCESS)
	|| Npc_KnowsInfo (hero,Grd_214_Torwache_SEETHORUS)
	|| Npc_KnowsInfo (hero,GRD_216_Torwache_SEETHORUS) )
	&& (Npc_GetTrueGuild (hero ) == GIL_STT)
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_WANNABEMAGE))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_GARDIST_Info()
{
	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = TRUE;
	AI_Output (other, self,"GRD_200_Thorus_GARDIST_Info_15_01"); //Hai qualcosa da riferirmi?
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Sì. Ciò che hai fatto nella miniera dimostra non solo una gran dose di coraggio, ma anche la tua forza e l'abilità nel combattere.
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_03"); //Sono pronto ad accettarti fra le fila delle guardie.
	if hero.level < 10
	{
		AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_04"); //Ma non sei ancora del tutto pronto per diventare una guardia. Devi prima guadagnare un altro po’ d'esperienza.
	    AI_StopProcessInfos	(self);
		B_PrintGuildCondition(10);
    }
    else if hero.level >= 10
    {
	    AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_05"); //Ti sto offrendo una possibilità. Cosa ne dici?
	};
};
//---------------------------------------------------------------
// GARDIST WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_AUFNAHME (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_AUFNAHME_Condition;
	information		= GRD_200_Thorus_AUFNAHME_Info;
	permanent		= 0;
	description		= "Voglio diventare una guardia."; 
};

FUNC int  GRD_200_Thorus_AUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,GRD_200_Thorus_GARDIST))
	&& (hero.level >=10)	
	&& (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_AUFNAHME_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_AUFNAHME_Info_15_01"); //Voglio diventare una guardia.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //Sono felice di sentirtelo dire, ma prima devi sapere una cosa che dico a tutte le nuove reclute. Ascolta attentamente, perché non la ripeterò.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //Finora hai cercato di farcela da solo. Quei giorni sono finiti. I miei ragazzi sono una sola persona. Noi guardie proteggiamo i baroni delle miniere, il metallo, il campo e la miniera.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //I minatori raccolgono il metallo, ma siamo noi che ci assicuriamo che non siano divorati dai pidocchi delle miniere. I baroni delle miniere commerciano col Re, ma siamo noi che li proteggiamo.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Giorno e notte, restiamo in miniera e all'entrata del campo, assicurandoci che tutti possano dormire tranquillamente.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //All'inizio, eravamo un gruppo selvaggio, ora siamo una forza con la quale fare i conti. Abbiamo lavorato duro per costruirci questo tipo di vita.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //Mi aspetto una cosa sola dai miei ragazzi: che siano uniti. Solo restando insieme, potremo mantenere ciò che possediamo.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //E sopravvivere.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //Lavorando imparerai tutto ciò che è importante che tu sappia. Sii pronto e aiuta ogni volta che ce n'è bisogno.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //Vai a chiedere a Stone un'armatura e una spada.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_11"); //Lo troverai nella bottega del fabbro, nell'Anello Interno.

	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = FALSE;

	Npc_SetTrueGuild (hero,GIL_GRD);
	hero.guild = GIL_GRD;
};  
//---------------------------------------------------------------
// GARDIST WERDEN TEIL 2
//---------------------------------------------------------------
instance GRD_200_Thorus_NOCHWAS (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_NOCHWAS_Condition;
	information		= GRD_200_Thorus_NOCHWAS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_200_Thorus_NOCHWAS_Condition()
{	
	if (Npc_KnowsInfo     (hero, GRD_200_Thorus_AUFNAHME))
	&& (Npc_GetTrueGuild  (hero) == GIL_GRD ) 
	{
		return TRUE;
	};
};
func void  GRD_200_Thorus_NOCHWAS_Info()
{
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_01"); //Ah, un'altra cosa...
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //Benvenuto fra le guardie!
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(GE_BecomeGuard,	LOG_NOTE);
	B_LogEntry			(GE_BecomeGuard,"Oggi Thorus mi ha accettato fra le guardie. Devo andare nel castello per prendere la mia nuova armatura da Stone il fabbro.");
	
};

//---------------------------------------------------------------
// ICH WILL MAGIER WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_WANNABEMAGE (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_WANNABEMAGE_Condition;
	information		= GRD_200_Thorus_WANNABEMAGE_Info;
	permanent		= 0;
	description		= "Sono interessato alla via della magia."; 
};
//
FUNC int  GRD_200_Thorus_WANNABEMAGE_Condition()
{	
	if (Npc_KnowsInfo (hero, GRD_200_Thorus_GARDIST))
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_AUFNAHME))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_WANNABEMAGE_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //Sono interessato alla via della magia.
	AI_Output (self, other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //Beh... In questo caso, devi parlare con Corristo. Lui ha insegnato a Milten. Sono certo che nulla potrà fermarti.

	var C_NPC Corristo;
	Corristo = Hlp_GetNpc		(KDF_402_Corristo);
	Npc_ExchangeRoutine			(Corristo,"WAITFORSC");
	AI_ContinueRoutine			(Corristo);
};  
//---------------------------------------------------------------
//     						STR + DEX
//---------------------------------------------------------------
INSTANCE GRD_200_Thorus_Teach(C_INFO)
{
	npc			= GRD_200_Thorus;
	nr			= 10;
	condition	= GRD_200_Thorus_Teach_Condition;
	information	= GRD_200_Thorus_Teach_Info;
	permanent	= 1;
	description = "Puoi addestrarmi?";
};                       

FUNC INT GRD_200_Thorus_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD)  
	{
		return TRUE;
	};
};

FUNC VOID GRD_200_Thorus_Teach_Info()
{
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //Tu puoi insegnarmi?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //Io posso mostrarti come migliorare le tue abilità e la forza.
	
	if (log_thorustrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Thorus mi aiuterà ad aumentare FORZA e DESTREZZA.");
		log_thorustrain = TRUE;
	};
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_BACK()
{
	
	Info_ClearChoices	(GRD_200_Thorus_Teach);
};

func void GRD_200_Thorus_Teach_STR_1()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_STR_5()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND1 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND1_Condition;
	information		= GRD_200_Thorus_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_GRD)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND1_Info()
{	
	if (log_thorusfight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry			(GE_TeacherOC,"Thorus può insegnarmi a maneggiare le ARMI A DUE MANI, ora che sono diventato esperto nell'uso di quelle a UNA MANO.");
		log_thorusfight = TRUE;
	};
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //Voglio imparare a usare una spada a due mani.
	
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //Va bene, partiamo dalle basi.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Tieni la spada in posizione orizzontale. Avrai bisogno di più forza per colpire un avversario con un'arma così pesante.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Alza il braccio e abbassalo davanti a te. Di solito, questo è sufficiente per colpire il nemico.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Riporta in alto l'arma, sfruttando la velocità acquisita.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Le spade a due mani sono particolarmente indicate per coordinare dei colpi laterali, che tengano a distanza gli avversari.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //Questo dovrebbe bastare, per iniziare. Fai un po' di pratica.
		GRD_200_Thorus_ZWEIHAND1.permanent = 0;
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND2 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND2_Condition;
	information		= GRD_200_Thorus_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_GRD)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND2_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //Voglio imparare di più sulle spade a due mani.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Prima di tutto, devi cambiare la posizione iniziale. Tieni la spada in posizione verticale lungo il fianco, impugnando saldamente l'elsa con entrambe le mani.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Abbassala velocemente e fai oscillare la lama sopra la spalla. Ora puoi sferrare un colpo rapido a destra.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Il tuo avversario non avrà il tempo d'i avvicinarsi.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Oppure abbassa la spada, partendo dall'angolo in alto a sinistra e spingendola in avanti, per far indietreggiare l'avversario.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Ruota su te stesso per imprimere la giusta velocità al prossimo colpo.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //Se non è sufficiente, usa l'oscillazione rimanente per brandire nuovamente la spada.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Quando avrai completato l'attacco, blocca il tuo avversario e attendi un'apertura nella sua difesa per colpire ancora.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //Il segreto per un attacco di successo è variare i colpi e cambiare posizione.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0 ;
	};
};  
