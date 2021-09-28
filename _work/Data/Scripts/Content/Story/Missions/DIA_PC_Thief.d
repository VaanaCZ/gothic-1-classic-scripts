var int Diego_After_Gamestart;

// ************************************************************
// 							GAMESTART
// ************************************************************

INSTANCE Info_Diego_Gamestart (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Gamestart_Condition;
	information	= Info_Diego_Gamestart_Info;
	permanent	= 0;
	important	= 1;
	//description = "(Startsatz: zum Goldmaster wieder zu Important-Info machen !!!)";
};                       

FUNC INT Info_Diego_Gamestart_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Gamestart_Info()
{
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //Sono Diego.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //Io sono...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //Non m'interessa il tuo nome. Tu sei appena arrivato, io mi occupo dei nuovi arrivati: questo è tutto, per ora.
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //Se desideri restare vivo, farai meglio a parlare con me. Ovviamente, non t'impedirò di scegliere in che modo farti ammazzare. Allora, cosa ne dici?
	
	B_Kapitelwechsel(1); //WICHTIG!!!
};

// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Diego_EXIT_Gamestart(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Gamestart_Condition;
	information	= Info_Diego_EXIT_Gamestart_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Gamestart_Condition()
{
	return 1;
};

FUNC VOID Info_Diego_EXIT_Gamestart_Info()
{
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00"); //Grazie per l'aiuto.
	
	if (!Npc_KnowsInfo (hero, Info_Diego_Kolonie)) 
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //La decisione spetta a te. È stato un piacere.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02"); //Ci rivedremo a Campo Vecchio.
	};

	AI_StopProcessInfos	(self);
	
	if (Kapitel < 2)
	{
		Npc_ExchangeRoutine	(self, "Start");
		Diego_After_Gamestart = TRUE;
	};
};

// -------------------------------------------------------------

INSTANCE Info_Diego_EXIT_Later(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Later_Condition;
	information	= Info_Diego_EXIT_Later_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Later_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_EXIT_Gamestart)) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_EXIT_Later_Info()
{	
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Diego_EXIT_11_01"); //Andiamo.
	}
	else
	{
	 	AI_Output	(hero,self,"Info_Diego_EXIT_15_00"); //Abbi cura di te.
	};
	
	AI_StopProcessInfos	(self);
};

// *************************************************************
// 							 BRIEF 
// *************************************************************

INSTANCE Info_Diego_Brief (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Brief_Condition;
	information	= Info_Diego_Brief_Info;
	permanent	= 0;
	description = "Ho una lettera per il Gran Mago del Circolo di Fuoco.";
};                       

FUNC INT Info_Diego_Brief_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Brief_Info()
{
	AI_Output(hero,self,"Info_Diego_Brief_15_00"); //Ho una lettera per il Gran Mago del Circolo di Fuoco.
	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //Davvero?
	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //Me l'ha consegnata un mago, poco prima di gettarmi quaggiù.
	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //Sei fortunato che io non possa permettermi di farmi vedere dai maghi. Chiunque altro ti taglierebbe la gola per quella lettera.
	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //I maghi pagano bene i corrieri e molta gente qui non ha nulla.
	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //Se fossi in te, terrei la bocca chiusa finché non incontri uno dei maghi. Anche se, nelle tue condizioni, sarà difficile che accada.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//Perché?
	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //I maghi si trovano nel castello di Campo Vecchio, dove solo la gente di Gomez è autorizzata a entrare.
};

// **********************************************************
// 					SCHUTZ UND LAGER
// **********************************************************
 
INSTANCE Info_Diego_WarumGeholfen (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_WarumGeholfen_Condition;
	information	= Info_Diego_WarumGeholfen_Info;
	permanent	= 0;
	description = "Perché mi hai aiutato?";
};                       

FUNC INT Info_Diego_WarumGeholfen_Condition()
{
	if	(!Diego_After_Gamestart)
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WarumGeholfen_Info()
{
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //Perché mi hai aiutato?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //Perché ne avevi bisogno, altrimenti Bullit e i suoi ragazzi ti avrebbero ucciso.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //E non potevo restare a guardare, visto che ho fatto tanta strada per darti un suggerimento.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //Un suggerimento...
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //Esatto. Dopo il tuo piccolo incidente con Bullit, avrai capito che hai bisogno di protezione.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //Tutti i nuovi arrivati devono scegliere a quale dei tre campi della colonia desiderano appartenere. 
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //Io sono qui per dimostrare loro che il migliore è Campo Vecchio.
};

// -------------------------------------------------------------

INSTANCE Info_Diego_Bullit (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_Bullit_Condition;
	information	= Info_Diego_Bullit_Info;
	permanent	= 0;
	description = "Bullit dove si trova, adesso?";
};                       

FUNC INT Info_Diego_Bullit_Condition()
{
	if ( Npc_KnowsInfo (hero, Info_Diego_WarumGeholfen) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Bullit_Info()
{
	AI_Output(hero,self,"Info_Diego_Bullit_15_02"); //Bullit dove si trova adesso?
	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //Lui e gli altri portano le merci dal mondo esterno al campo. Lo troverai lì.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //Ma se hai intenzione di sfidarlo, ti consiglio di stare molto attento. È un combattente esperto.
};


// ************************************************************
// 							Kolonie
// ************************************************************

INSTANCE Info_Diego_Kolonie (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Kolonie_Condition;
	information	= Info_Diego_Kolonie_Info;
	permanent	= 0;
	description = "Va bene. Cosa devo sapere di questo posto?";
};                       

FUNC INT Info_Diego_Kolonie_Condition()
{
	if	(Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Kolonie_Info()
{
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //Va bene. Cosa devo sapere di questo posto?
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //Noi lo chiamiamo la colonia. Sai già che produciamo metallo per il Re. 
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //Beh, perlomeno noi di Campo Vecchio.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //All'interno della Barriera ci sono tre campi. Il più grande è Campo Vecchio.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_Barriere (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_Barriere_Condition;
	information	= Info_Diego_Barriere_Info;
	permanent	= 0;
	description = "Parlami ancora della Barriera.";
};                       

FUNC INT Info_Diego_Barriere_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Barriere_Info()
{
	AI_Output(hero,self,"Info_Diego_Barriere_15_00"); //Parlami ancora della Barriera.
	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //Non c'è molto da dire. È impenetrabile.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //Che succede se cerco di andarmene da qui?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //L'ultimo che ci ha provato è arrivato morto dall'altra parte. Questa maledetta Barriera ti permette di entrare, ma non di uscire.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //Se c'è una via d'uscita, la troverò.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //Già hai tanta fretta d'andartene? Ma se sei appena arrivato!
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OtherCamps (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 2;
	condition	= Info_Diego_OtherCamps_Condition;
	information	= Info_Diego_OtherCamps_Info;
	permanent	= 0;
	description = "Che mi dici degli altri due campi?";
};                       

FUNC INT Info_Diego_OtherCamps_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OtherCamps_Info()
{
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //Che mi dici degli altri due campi?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //Si sono divisi per perseguire i propri folli piani di fuga.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //A ovest trovi Campo Nuovo, dove i maghi credono di poter far esplodere la Barriera, non appena avranno accumulato abbastanza metallo.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //In mezzo alla palude a est, trovi il campo dei pazzi della Setta, tutti intenti a pregare il proprio dio che li liberi.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //Finora non ha risposto.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //Se fossi in te, non perderei tempo con quegli svitati.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OldCamp (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_OldCamp_Condition;
	information	= Info_Diego_OldCamp_Info;
	permanent	= 0;
	description = "Parlami di Campo Vecchio.";
};                       

FUNC INT Info_Diego_OldCamp_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OldCamp_Info()
{
	AI_Output(hero,self,"Info_Diego_OldCamp_15_00"); //Parlami di Campo Vecchio.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //È il più grande e potente dei tre campi. Gomez e i suoi lo controllano, assieme al commercio di metallo.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //Una volta al mese, il Re ci manda ciò di cui abbiamo bisogno. Teniamo il vecchio in pugno, capisci?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //Ci manda vino, pane, carne, armi... tutto!
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{ 
	AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //Anche tu puoi avere la tua parte, basta che ti unisca alla gente di Gomez.
	};
};

// ************************************************************
// 							Gomez Leute
// ************************************************************

INSTANCE Info_Diego_WhosGomez (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_WhosGomez_Condition;
	information	= Info_Diego_WhosGomez_Info;
	permanent	= 0;
	description = "Chi è Gomez?";
};                       

FUNC INT Info_Diego_WhosGomez_Condition()
{
	if ( Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhosGomez_Info()
{
	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00"); //Chi è Gomez?
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //È il più potente fra i baroni delle miniere e il capo di Campo Vecchio. In poche parole, è l'uomo più potente di tutta la colonia.
};	

// ************************************************************
// 							JOIN OC
// ************************************************************

INSTANCE Info_Diego_JoinOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_JoinOldcamp_Condition;
	information	= Info_Diego_JoinOldcamp_Info;
	permanent	= 0;
	description = "Cosa dovrei fare, se volessi unirmi alla sua gente?";
};                       

FUNC INT Info_Diego_JoinOldcamp_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief))
	&&	!C_NpcBelongsToOldCamp(hero)
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_JoinOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //Cosa dovrei fare, se volessi unirmi alla sua gente?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //All'entrata del castello c'è un uomo di nome Thorus. Digli che ti manda Diego.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
	
	Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC, LOG_RUNNING);
	B_LogEntry( CH1_JoinOC,"Per essere accettato a Campo Vecchio, fra la gente di Gomez, devo parlare con Thorus.");
};	

// ************************************************************
// 						Weg zum Alten Lager
// ************************************************************

INSTANCE Info_Diego_WayToOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WayToOldcamp_Condition;
	information	= Info_Diego_WayToOldcamp_Info;
	permanent	= 0;
	description = "Come si arriva a Campo Vecchio?";
};                       

FUNC INT Info_Diego_WayToOldcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Kolonie) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WayToOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //Come si arriva a Campo Vecchio?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //Segui questa strada. Campo Vecchio sarà il primo luogo che incontrerai che ti sembrerà sicuro.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //Fra un campo e l'altro, vivono un mucchio di bestie selvagge. Saresti pazzo ad andartene in giro senza un'arma.
};
	
// ************************************************************
// 							Wo Waffe
// ************************************************************

INSTANCE Info_Diego_WoWaffe (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WoWaffe_Condition;
	information	= Info_Diego_WoWaffe_Info;
	permanent	= 0;
	description = "Dove posso trovare un'arma?";
};                       

FUNC INT Info_Diego_WoWaffe_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_WayToOldcamp) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WoWaffe_Info()
{
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //Dove posso trovare un'arma?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //Quando raggiungerai la vecchia miniera, dai un'occhiata intorno. Sono certo che troverai qualcosa di utile.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //La miniera è facile da trovare. Si trova a pochi metri da qui, lungo il canyon. 
};

// ************************************************************
// 						Mit Thorus geredet
// ************************************************************

INSTANCE Info_Diego_ThorusSays(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_ThorusSays_Condition;
	information	= Info_Diego_ThorusSays_Info;
	permanent	= 0;
	description = "Ho parlato con Thorus.";
};                       

FUNC INT Info_Diego_ThorusSays_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Thorus_DiegoSentMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_ThorusSays_Info()
{
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00"); //Ho parlato con Thorus.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //Che ti ha detto?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //Che posso unirmi a Campo Vecchio, se TU pensi che sia abbastanza in gamba.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //A quanto pare, ho un nuovo lavoro.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //Iniziamo subito?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05"); //Prima devi sapere alcune cose.
};

// ************************************************************
// 						Aufnahme - Regeln
// ************************************************************

INSTANCE Info_Diego_Rules(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Rules_Condition;
	information	= Info_Diego_Rules_Info;
	permanent	= 0;
	description = "Cosa devo sapere, per essere accettato a Campo Vecchio?";
};                       

FUNC INT Info_Diego_Rules_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_ThorusSays) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Rules_Info()
{
	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //Cosa devo sapere per essere accettato a Campo Vecchio?
	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //Se vuoi unirti al campo, devi guadagnare alcuni punti-stima.
	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //A Campo Vecchio ci sono alcune persone influenti, soprattutto fra le Ombre. Se riuscirai a impressionarle favorevolmente, guadagnerai dei punti-stima.
	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //Poi devi superare il test della fiducia.
	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //Per finire, ci sono molte abilità che ogni nuovo arrivato deve sviluppare. Più imparerai, più potrai esserci utile.
	
	B_LogEntry( CH1_JoinOC,"Per essere ammesso, devo fare buona impressione sulle persone importanti dell'anello esterno e superare il test della fiducia di Diego.");
};

// ************************************************************
// 						Wo wichtige Leute
// ************************************************************

INSTANCE Info_Diego_Celebs(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Celebs_Condition;
	information	= Info_Diego_Celebs_Info;
	permanent	= 0;
	description = "Dove si trova la gente importante?";
};                       

FUNC INT Info_Diego_Celebs_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Celebs_Info()
{
	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //Dove si trova la gente importante?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //Beh, stai parlando con una di queste. Poi c'è Thorus... già lo conosci.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //E poi... dovrai scoprilo da solo. Se non ce la fai, non sei pronto a far parte del nostro campo.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //Vai all'anello esterno e parla con la gente, così scoprirai chi è importante.
};

// ************************************************************
// 							Wo Lehrer
// ************************************************************

INSTANCE Info_Diego_Teachers(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Teachers_Condition;
	information	= Info_Diego_Teachers_Info;
	permanent	= 0;
	description = "Chi può insegnarmi?";
};                       

FUNC INT Info_Diego_Teachers_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teachers_Info()
{
	AI_Output		(hero,self,"Info_Diego_Teachers_15_00"); //Chi può insegnarmi?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_01"); //Inizia con Fingers, è il più abile fra noi.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_02"); //Tieni gli occhi aperti e troverai altri potenziali insegnanti.
	AI_Output		(hero,self,"Info_Diego_Teachers_15_03"); //Dove si trova Fingers?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_04"); //La sua capanna è nascosta vicino alle mura del castello. Parti da qui e dirigiti verso l'arena.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_05"); //Arrivato all'entrata del castello, scendi verso sinistra e ti ritroverai in direzione dell'arena.

	if	(Fingers_CanTeach == FALSE)
	{
		Log_CreateTopic (GE_TeacherOC,	LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Fingers può insegnarmi a BORSEGGIARE e FORZARE SERRATURE. Vive isolato nella capanna vicino all'arena, dalle parti delle mura del castello.");
	};
};

// ************************************************************
// 							DIEGO = Lehrer
// ************************************************************
	var int Diego_Merke_STR;
	var int Diego_Merke_DEX;
// ************************************************************

INSTANCE Info_Diego_Teach(C_INFO)
{
	npc			= PC_Thief;
	nr			= 100;
	condition	= Info_Diego_Teach_Condition;
	information	= Info_Diego_Teach_Info;
	permanent	= 1;
	description = "Puoi insegnarmi qualcosa?";
};                       

FUNC INT Info_Diego_Teach_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Teachers) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teach_Info()
{	
	if	(log_diegotrain == FALSE)
	{	
		Log_CreateTopic (GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Diego può aiutarmi ad aumentare FORZA e DESTREZZA.");
		log_diegotrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //Puoi insegnarmi qualcosa?
	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //Sì. Posso aiutarti a migliorare forza o destrezza.
	
	Diego_Merke_STR = hero.attribute[ATR_STRENGTH];
	Diego_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
	
	
};

func void Info_Diego_Teach_BACK()
{
	if (Diego_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //La tua forza è molto aumentata.
	};
	if (Diego_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //La tua abilità con arco e balestra è aumentata.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Torna presto: ci sono molte cose che devi imparare!
	Info_ClearChoices	(Info_Diego_Teach);
};

func void Info_Diego_Teach_STR_1()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_STR_5()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_1()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_5()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

// ************************************************************
// 							BRING LIST
// ************************************************************

VAR INT Diego_BringList; //MISSIONSVARIABLE

// ----------------------------- OFFER -------------------------------------

INSTANCE Info_Diego_BringList_Offer (C_INFO)
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_BringList_Offer_Condition;
	information	= Info_Diego_BringList_Offer_Info;
	permanent	= 0;
	description = "Cos'è la prova della fiducia?";
};                       

FUNC INT Info_Diego_BringList_Offer_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Offer_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_00"); //Cos'è il test della fiducia?
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_01"); //Devi recarti alla vecchia miniera e incontrare un tizio di nome Ian, che ti consegnerà una lista molto importante.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_02"); //Essa contiene tutti gli oggetti di cui ha bisogno la gente della miniera.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_03"); //Tutte le richieste saranno soddisfatte con la prossima spedizione!
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_04"); //Non c'è problema!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_05"); //Invece sì! Campo Nuovo non deve entrarne in possesso!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_06"); //Come dicevo: la lista è importante. Se ti comporterai bene, avrai fatto un grosso passo in avanti.
	
	Diego_BringList = LOG_RUNNING;
    
    Log_CreateTopic (CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus(CH1_BringList,LOG_RUNNING);
    B_LogEntry    (CH1_BringList,"Diego mi ha inviato alla vecchia miniera, per prendere una lista da un tizio di nome Ian. Per nulla al mondo, questo elenco deve finire nelle mani di Campo Nuovo.");
    
	VAR C_NPC Ian; Ian = Hlp_GetNpc (STT_301_IAN);	
	CreateInvItem (STT_301_IAN, TheList);
};
	
// -------------------------------------------------------------------------------

INSTANCE Info_Diego_IanPassword (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_IanPassword_Condition;
	information	= Info_Diego_IanPassword_Info;
	permanent	= 0;
	description = "Se è tanto importante, perché Ian dovrebbe darla a me?";
};                       

FUNC INT Info_Diego_IanPassword_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_IanPassword_Info()
{
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_01"); //Se è tanto importante, perché Ian dovrebbe darla a ME?
	AI_Output (self, hero,"Info_Diego_IanPassword_Info_11_02"); //Perché gli dirai che ti manda Diego.
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_03"); //Lo farò.
	
	B_LogEntry    (CH1_BringList,"Ian mi consegnerà la lista, se gli riferirò che vengo da parte di Diego.");
};

// ----------------------------------------------------------------------------------

INSTANCE Info_Diego_MapToOldMine (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_MapToOldMine_Condition;
	information	= Info_Diego_MapToOldMine_Info;
	permanent	= 0;
	description = "Dove si trova la vecchia miniera?";
};                       

FUNC INT Info_Diego_MapToOldMine_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_MapToOldMine_Info()
{
	AI_Output (hero, self,"Info_Diego_MapToOldMine_Info_15_00"); //Dove si trova la vecchia miniera?
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_01"); //Vai da Graham il cartografo. Digli che ti mando io e che hai bisogno di una mappa per arrivare alla miniera.
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_02"); //Vive a sinistra dell'ingresso nord.
	
	B_LogEntry    (CH1_BringList,"Graham mi darà una mappa. Posso trovarlo sulla sinistra del cancello nord.");
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_Diego_BringList_Success (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_BringList_Success_Condition;
	information	= Info_Diego_BringList_Success_Info;
	permanent	= 0;
	description = "Ho preso la lista da Ian.";
};                       

FUNC INT Info_Diego_BringList_Success_Condition()
{
	if ( (Diego_BringList == LOG_RUNNING) && (Npc_HasItems(hero,TheList) || Npc_HasItems(hero,TheListNC)))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Success_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Success_15_00"); //Ho preso la lista da Ian.
		
	if	Npc_HasItems(hero,TheList)
	{
		B_GiveInvItems	(hero, self, TheList, 1);
		B_LogEntry    	(CH1_BringList,"Diego è stato molto felice, quando gli ho consegnato la lista.");
	}
	else if	Npc_HasItems(hero,TheListNC)
	{
		B_GiveInvItems	(hero, self, TheListNC, 1);
		B_LogEntry    	(CH1_BringList,"Diego è stato molto felice, quando gli ho consegnato la lista. Non sembra essersi accorto delle aggiunte fatte da Lares. Eppure mi è sembrato d'intravedere una strana luce nei suoi occhi...");
	};
	B_UseFakeScroll();
	
	AI_Output (self, hero,"Info_Diego_BringList_Success_11_01"); //Ben fatto! Hai guadagnato alcuni punti-stima!

	Diego_BringList = LOG_SUCCESS;
	B_GiveXP(XP_DiegoBringlist);
	
	Log_SetTopicStatus 		(CH1_BringList,LOG_SUCCESS);
	
	Points_OC = Points_OC + 5;
};

// ************************************************************
// 						Punktewertung
// ************************************************************
	var int Diego_GomezAudience;
// ************************************************************

INSTANCE Info_Diego_JoinAnalyze(C_INFO) 
{
	npc			= PC_Thief;
	nr			= 800;
	condition	= Info_Diego_JoinAnalyze_Condition;
	information	= Info_Diego_JoinAnalyze_Info;
	permanent	= 1;
	description = "Com'è la mia reputazione all'interno del campo?";
};                       

FUNC INT Info_Diego_JoinAnalyze_Condition()
{
	if	Npc_KnowsInfo(hero,Info_Diego_Rules)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_JoinAnalyze_Info()
{	
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_00"); //Com'è la mia reputazione all'interno del campo?
	AI_Output(self, hero,"Info_Diego_JoinAnalyze_11_01"); //Ho parlato con un po' di gente...
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_02"); //E..?
	// -----------------------------------------------------------
	Points_OC = 0;
	// -----------------------------------------------------------
	if (Scatty_ChargeKirgo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01"); //Scatty mi ha detto che hai sconfitto Kirgo.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKirgo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //Scatty mi ha detto che ti sei fatto battere da Kirgo. Non era molto contento.
		Points_OC = Points_OC - 1;
	}
	else if (Scatty_ChargeKirgo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //Scatty mi ha detto che è ansioso di vedere come te la cavi contro Kirgo.
	};
	
	if (Scatty_ChargeKharim == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //Ma è rimasto colpito perché hai avuto il coraggio di sfidare Kharim, anche se sei stato sconfitto.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKharim == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //Ma è rimasto molto colpito perché sei riuscito a sconfiggere Kharim. Non la smetteva più di parlarne! 
		Points_OC = Points_OC + 5;
	}
	else if (Scatty_ChargeKharim == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //Ed è ansioso di vedere come te la caverai contro Kharim.
	};
	// -----------------------------------------------------------
	if (Whistler_BuyMySword == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //Whistler mi ha raccontato la storia di Fisk... Beh! Fossi stato in te, avrei preso il metallo e sarei sparito. In ogni caso, hai fatto un'ottima impressione.
		Points_OC = Points_OC + 3;
	}
	else if ( (Whistler_BuyMySword == LOG_FAILED) || ( (Whistler_BuyMySword==LOG_RUNNING)&&(Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) ) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //Ho parlato con Whistler. Hai preso il suo metallo, brutto bastardo! Devo ammetterlo, hai fegato!
		Points_OC = Points_OC + 2;
	}
	else if (Whistler_BuyMySword == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //Whistler aspetta la sua spada. Dovresti decidere se riportargliela o no, altrimenti penserà che te la sei svignata col suo metallo!
		
	};
	// -----------------------------------------------------------
	if (Sly_LostNek == LOG_SUCCESS)			
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //Sly mi ha detto che hai trovato Nek. Sembrava molto contento.
		Points_OC = Points_OC + 4;
	}
	else if (Sly_LostNek == LOG_RUNNING)					
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //Penso che Sly si sbagli su Nek. Era un piantagrane, questo è vero, ma non credo sia passato a Campo Nuovo.
	};
	// -----------------------------------------------------------
	if (Fingers_Learnt == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //Ti ho già mandato da Fingers. Lui potrebbe insegnarti qualcosa!
	}
	else if (Fingers_Learnt == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //Fingers mi ha detto che hai già imparato qualcosa, ma puoi ancora migliorare.
		Points_OC = Points_OC + 3;
	};
	// -----------------------------------------------------------
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //Devo parlare con Dexter. Ti sta usando per i suoi affari.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //Il test non ha regole. Se lo passi, hai fatto un grosso passo avanti.
		
	}
	else if (Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //Sei riuscito a ottenere la ricetta da Kalom. Dexter è davvero colpito, e anch'io.
		Points_OC = Points_OC + 5;
	};
	// -----------------------------------------------------------
	if (Thorus_MordragKo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //La questione di Mordrag è davvero impegnativa. È un guerriero in gamba: dovrai esercitarti molto, se vuoi sconfiggerlo.
	}
	else if (Thorus_MordragKo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //Thorus pensa che uno come te potrebbe tornarci utile, devi esserne contento.
		Points_OC = Points_OC + 5;
	}
	else if (Thorus_MordragKo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //A Thorus quasi scoppiava la testa dalla rabbia: come hai potuto rovinare tutto IN QUEL MODO?
		Points_OC = Points_OC - 5;						
	}
	// ----WEITER-------------------------------------------------------
	if (Fisk_GetNewHehler == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //Fisk mi ha detto che l'hai sorpreso. In ogni caso, è dalla tua parte.
		Points_OC = Points_OC + 5;
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //Fisk è davvero incazzato con te. Se fossi in te, cercherei qualcuno per rimpiazzare Mordrag.
	};
	// -----------------------------------------------------------
	if (points_oc > 15)// runtergesetzt!! // Bei 20 + BringList = Aufnahme
	{
		AI_Output (self, hero,"Info_Diego_Points_11_00"); //Hai ottenuto il favore di parecchia gente.
		
		if hero.level >= 5
		{
			if (Diego_BringList == LOG_SUCCESS)
			{
				AI_Output (self, hero,"Info_Diego_Points_11_01"); //Hai anche superato il test della fiducia. Vai da Thorus. Gli ho già detto tutto: ti permetterà d'incontrare Gomez.
				Diego_GomezAudience = TRUE;
				
				Log_SetTopicStatus(CH1_JoinOC, LOG_SUCCESS);
				B_LogEntry(CH1_JoinOC,"Diego mi ha combinato un incontro con Gomez. Ora posso diventare uno dei suoi uomini ed entrare nel castello, basta solo che parli con Thorus.");
			}
			else
			{
				AI_Output (self, hero,"Info_Diego_Points_11_02"); //Ma devi ancora superare il test della fiducia.
			};
		}
		else
		{
			B_PrintGuildCondition(5);
		};
	}
	else if (points_oc > 10)
	{
		AI_Output (self, hero,"Info_Diego_Points_11_10"); //Tutto sommato, non te la sei cavata male, per essere un nuovo arrivato.
	}
	else if points_oc >= 0
	{
		AI_Output (self, hero,"Info_Diego_Points_11_20"); //Dacci dentro! Hai ancora molta strada da fare, se vuoi entrare a far parte del campo.
	};
	/*else
	{
		AI_Output (self, hero,"Info_Diego_Points_11_30"); //Machst du Witze, Kleiner? Kein Schwein kennt dich hier!
	};*/
};

/*
	Scatty: 	Scatty_ChargeKirgo == LOG_SUCCESS 	+2
				Scatty_ChargeKirgo == LOG_FAILED 	-1
				Scatty_ChargeKharim == LOG_SUCCESS 	+5
				Scatty_ChargeKharim == LOG_FAILED 	+2
			
	Whistler: 	Whistler_BuyMySword = LOG_SUCCESS;	+3
				Whistler_BuyMySword = LOG_FAILED;	+2
				
	Sly: 		Sly_LostNek = LOG_SUCCESS;			+4
	
	Fingers: 	Fingers_Learnt = LOG_SUCCESS; 		+3
	
	Dexter: 	Dexter_GetKalomsRecipe = LOG_SUCCESS; +5
	
	Thorus: 	Thorus_MordragKo = LOG_SUCCESS;		+5
				Thorus_MordragKo = LOG_FAILED;		-5
	
				VAR INT MordragKO_PlayerChoseOreBarons;
				VAR INT MordragKO_PlayerChoseThorus;
				VAR INT MordragKO_HauAb;
				var int MordragKO_StayAtNC;
	
	Fisk: 		Fisk_GetNewHehler = LOG_SUCCESS; // else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	
	//--- EXTRA Bedingung ------
	
	Diego: 		Diego_BringList = LOG_SUCCESS;		
*/


INSTANCE Info_Diego_WhatToSayToGomez (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_WhatToSayToGomez_Condition;
	information	= Info_Diego_WhatToSayToGomez_Info;
	permanent	= 0;
	description = "Cosa dovrò fare, quando incontrerò Gomez?";
};                       

FUNC INT Info_Diego_WhatToSayToGomez_Condition()
{
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhatToSayToGomez_Info()
{
	AI_Output (hero, self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //Cosa dovrò fare, quando incontrerò Gomez?
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //Le decisioni di Gomez si basano sull'istinto. Guarderà il tuo brutto muso e ti dirà se puoi far parte del campo.
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //D'ora in poi dovrai cavartela da solo. Buona fortuna!
};





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################
//***************************************************************************
//	Info ARMOR
//***************************************************************************
instance  PC_Thief_ARMOR (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_ARMOR_Condition;
	information		= PC_Thief_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_DiegoHeavyShadows,VALUE_STT_ARMOR_H); 
};

FUNC int  PC_Thief_ARMOR_Condition()
{	
	if  ( Npc_GetTrueGuild (hero) == GIL_STT)
	&&  (! Npc_HasItems(hero,STT_ARMOR_H))
	{
		return TRUE;
	};

};
FUNC void  PC_Thief_ARMOR_Info()
{
	
	if (Npc_HasItems (hero,ItMinugget) >= VALUE_STT_ARMOR_H)
	{
		AI_Output			(hero, self,"PC_Thief_ARMOR_Info_15_01"); //Posso avere un'armatura come la tua?
		AI_Output			(self, hero,"PC_Thief_ARMOR_Info_11_02"); //Hai abbastanza metallo?

		CreateInvItem 		(hero,			STT_ARMOR_H);
		B_GiveInvItems		(hero, self,	ItMinugget,	VALUE_STT_ARMOR_H);
		
		//hier nur ein Text für die Bildschirmausgabe
		CreateInvItem		(self, 			ItAmArrow);
		B_GiveInvItems		(self, hero,	ItAmArrow,	1);
		Npc_RemoveInvItem	(hero,			ItAmArrow);
	}
	else
	{
		AI_Output (self, hero,"PC_Thief_ARMOR_Info_11_03"); //Quando avrai abbastanza metallo, riceverai l'armatura.
	};
};  





//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//----------------------------------------------------------------
// Die Troll Situation
//----------------------------------------------------------------
instance PC_Thief_MEETAGAIN (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_MEETAGAIN_Condition;
	information		= PC_Thief_MEETAGAIN_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_MEETAGAIN_Condition()
{	
	if (Kapitel == 3)
	&& (Npc_GetDistToWP (self,"OW_PATH_190") < 700 )
	{
		return TRUE;
	};
};
func void  PC_Thief_MEETAGAIN_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_00"); //Ehi, pensavo fossi morto!
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_01"); //A volte lo penso anch'io.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_02"); //Dall'ultima volta che ci siamo visti, sono successe un sacco di cose! So che hai dato un grosso aiuto per l'evocazione.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_03"); //Ovviamente sei molto ben informato.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_04"); //Più di quanto pensi... Stai cercando la pietra focalizzatrice?
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_05"); //Sì. Deve essercene una da queste parti.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_06"); //Io so dove si trova. C'è solo un problema.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_07"); //Ho capito. Cosa vuoi in cambio?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_08"); //Hai davvero imparato la lezione, ma non è questo che intendevo.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_09"); //No? Allora qual è il problema?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_10"); //È un problema da trecento tonnellate.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_11"); //Andiamo. Lo capirai appena lo vedrai.

 	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"GuideTroll");

	Log_CreateTopic		(CH3_TrollCanyon,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_RUNNING);
	B_LogEntry		(CH3_TrollCanyon,"Avvicinandomi alla posizione della pietra focalizzatrice a nord, mi sono imbattuto in Diego: mi ha avvisato che qualcosa di 'grosso' mi attende alla fine del canyon.");
	B_LogEntry		(CH3_TrollCanyon,"In qualche modo, sapeva delle mie attività a Campo Palude e della ricerca della pietra. Ora proseguiremo assieme.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info SHOWFOCUS
//---------------------------------------------------------------------
instance PC_Thief_SHOWFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_SHOWFOCUS_Condition;
	information		= PC_Thief_SHOWFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_SHOWFOCUS_Condition()
{	
	if (Npc_KnowsInfo   (hero,PC_Thief_MEETAGAIN))
	&& (Npc_GetDistToWP (self,"LOCATION_12_01") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_SHOWFOCUS_Info()
{	
	AI_GotoNpc(self,hero);
	//AI_PointAt (self, );
	//AI_StopPointAt (self);
	
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //Sul lato sinistro del canyon, c'è l'entrata di una caverna che conduce alla pietra focalizzatrice.
	AI_Output (hero, self,"PC_Thief_SHOWFOCUS_Info_15_02"); //Ho capito. Prima dobbiamo sbarazzarci di quel mostro laggiù.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //Devi trovare il suo punto debole, o qualcosa per batterlo.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //Io lo distrarrò.

	B_LogEntry		(CH3_TrollCanyon,"Abbiamo incontrato un grosso troll, che ci sbarrava la strada. Diego intende distrarlo, mentre io cerco un modo per toglierlo di mezzo.");

	Npc_ExchangeRoutine	(self,	"WaitAtWheel");

	AI_DrawWeapon		(self);
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERTROLL
//---------------------------------------------------------------------
instance PC_Thief_AFTERTROLL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_AFTERTROLL_Condition;
	information		= PC_Thief_AFTERTROLL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_AFTERTROLL_Condition()
{	
	var int trollFound;
	Npc_PerceiveAll(self);
	trollFound = Wld_DetectNpc(self, Troll, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,PC_Thief_SHOWFOCUS)
	&&	(	(trollFound && (Npc_IsDead(other) || Npc_IsInState(other,ZS_MagicShrink)))				// Troll besiegt...
		||	(Npc_GetDistToWP(hero, "LOCATION_12_14_WHEEL") < 1000)							)		// ...oder Spieler an der Winde angekommen
	{
		return TRUE;
	};
};
func void  PC_Thief_AFTERTROLL_Info()
{
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_01"); //Fantastico! Sei stato davvero in gamba! Ora vai a prendere la pietra.
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_02"); //Io mi assicurerò che non ci siano altre sorprese sgradite.

	B_LogEntry		(CH3_TrollCanyon,"Il troll è stato sconfitto. Ora posso occuparmi dell'ingranaggio, che muove la griglia su cui è posata la pietra focalizzatrice.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WHEEL
//---------------------------------------------------------------------
instance  PC_Thief_WHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WHEEL_Condition;
	information		= PC_Thief_WHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_AFTERTROLL)) 
	&& (Troll_Wheel == 1) 
	{
		return TRUE;
	};
};
FUNC void  PC_Thief_WHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_01"); //L'argano sembra bloccato.
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_02"); //Fammi vedere, forse posso ripararlo!

	AI_StopProcessInfos	(self);
	AI_GotoWP 			(self,	"LOCATION_12_14_WHEEL");
	AI_AlignToWP		(self);
	AI_PlayAni			(self,	"T_PLUNDER");
};

//---------------------------------------------------------------------
//	Info FIXWHEEL
//---------------------------------------------------------------------
instance PC_Thief_FIXWHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_FIXWHEEL_Condition;
	information		= PC_Thief_FIXWHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_FIXWHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_WHEEL))
	{
		return TRUE;
	};
};
func void  PC_Thief_FIXWHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_FIXWHEEL_Info_11_01"); //Bene, ora dovrebbe funzionare.
	Troll_Wheel = 2;	// Winde repariert!

	B_LogEntry		(CH3_TrollCanyon,"Diego ha riparato l'ingranaggio. Ora non c'è più nulla che m'intralci.");

	Npc_ExchangeRoutine (self, "WaitAtFocus");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WAITATFOCUS
//---------------------------------------------------------------------
instance PC_Thief_WAITATFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WAITATFOCUS_Condition;
	information		= PC_Thief_WAITATFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WAITATFOCUS_Condition()
{	
	if	Npc_KnowsInfo(hero,PC_Thief_FIXWHEEL)
	&&	(Npc_GetDistToWP(hero,"LOCATION_12_03") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_WAITATFOCUS_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //Vai a prendere la pietra. Io aspetto qui.

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GOTIT
//---------------------------------------------------------------------
//-----SPIELER HAT DEN FOKUS GEFUNDEN---------------------
instance  PC_Thief_GOTIT (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_GOTIT_Condition;
	information		= PC_Thief_GOTIT_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_GOTIT_Condition()
{	
	if (Npc_HasItems (hero,Focus_2))
	{
		return TRUE;
	};
};

FUNC void  PC_Thief_GOTIT_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_01"); //Ehi, hai trovato la pietra. Molto bene.
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_02"); //Penso sia meglio che me ne torni a Campo Vecchio, ora. Buona fortuna!
	AI_Output			(hero, self,"PC_Thief_GOTIT_Info_15_03"); //Vedi di non farti ammazzare!
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_04"); //Ci rivedremo.

	B_LogEntry		(CH3_TrollCanyon,"La pietra focalizzatrice è mia. Devo solo convincere alcune arpie a lasciarmela tenere.");
	B_LogEntry		(CH3_TrollCanyon,"Diego è tornato a Campo Vecchio. Sono certo che ci incontreremo ancora.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;

	Npc_ExchangeRoutine	(self, "start");	
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
instance Info_Diego_OCWARN (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARN_Condition;
	information	= Info_Diego_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Diego_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Diego_OCWARN_11_01"); //Ehi! Shhh... zitto!
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN))
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_02"); //Ciao, Diego! Ho parlato con Milten, dall'altra parte del campo.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_03"); //Allora sai già cos'è successo.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_04"); //Hai sentito anche del piano per occupare la miniera libera?
	}
	else
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_05"); //Ciao, Diego! Perché giochi a nascondino?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_06"); //Non hai sentito?
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_07"); //Sentito cosa?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_08"); //La vecchia miniera è crollata, i Maghi del Fuoco sono stati uccisi e c'è un piano in corso per occupare la miniera libera.
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_09"); //COSAAA??? Ma di che parli?
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Diego_OCMINE (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMINE_Condition;
	information	= Info_Diego_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Come ha fatto a crollare la vecchia miniera?";
};

FUNC int Info_Diego_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMINE_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMINE_15_01"); //Come ha fatto a crollare la vecchia miniera?
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_02"); //Uno dei minatori sopravvissuti ha detto che, scavando al livello più basso, hanno incontrato un fiume sotterraneo.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_03"); //Quando l'acqua si è riversata nella miniera, uno dei supporti si è spezzato e l'intera sezione superiore è crollata.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_04"); //Solo un pugno di uomini è riuscito a fuggire.
};

//***************************************************************************
//	Info OCKDF
//***************************************************************************
instance Info_Diego_OCKDF (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCKDF_Condition;
	information	= Info_Diego_OCKDF_Info;
	important	= 0;
	permanent	= 0;
	description = "Come sono morti i Maghi del Fuoco?";
};

FUNC int Info_Diego_OCKDF_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCFM))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCKDF_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCKDF_15_01"); //Come sono morti i Maghi del Fuoco?
	AI_Output		(self,hero,"Info_Diego_OCKDF_11_02"); //È una lunga storia.
};

//***************************************************************************
//	Info OCFM
//***************************************************************************
instance Info_Diego_OCFM (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFM_Condition;
	information	= Info_Diego_OCFM_Info;
	important	= 0;
	permanent	= 0;
	description = "Occupare la miniera libera?";
};

FUNC int Info_Diego_OCFM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFM_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFM_15_01"); //Occupare la miniera libera?
	AI_Output		(self,hero,"Info_Diego_OCFM_11_02"); //È una lunga storia.
};

//***************************************************************************
//	Info OCSTORY
//***************************************************************************
instance Info_Diego_OCSTORY (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCSTORY_Condition;
	information	= Info_Diego_OCSTORY_Info;
	important	= 0;
	permanent	= 0;
	description = "Dimmi tutto!";
};

FUNC int Info_Diego_OCSTORY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCFM) || Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCSTORY_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_01"); //Raccontamela! Non è la prima che ho dovuto ascoltare!
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_02"); //Va bene. Fortunatamente mi trovavo nella casa dei baroni delle miniere, quando è arrivata la notizia del crollo.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_03"); //Gomez era fuori di sé per l'incidente e temeva che la sua posizione fosse in pericolo.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_04"); //Certo! Chi controlla il metallo, controlla la colonia!
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_05"); //Esatto. Venuta a mancare la sua fonte d'entrate, non avrebbe più ottenuto neppure le merci dal mondo esterno.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_06"); //Nessuno avrebbe lavorato per lui, se non avesse trovato subito un'alternativa.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_07"); //Per questo motivo vuole occupare la miniera libera?
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_08"); //A dire il vero, è l'unica possibilità che ha di mantenere il potere.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_09"); //Due ore fa, una ventina di guardie è partita alla volta della miniera libera.

	B_Story_FMTaken	();
};

//***************************************************************************
//	Info OCWARNNC
//***************************************************************************
instance Info_Diego_OCWARNNC (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARNNC_Condition;
	information	= Info_Diego_OCWARNNC_Info;
	important	= 0;
	permanent	= 0;
	description = "È una pazzia! Devo avvertire Campo Nuovo.";
};

FUNC int Info_Diego_OCWARNNC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARNNC_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_01"); //È una pazzia! Devo avvertire Campo Nuovo.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_02"); //Allora devi sbrigarti! Oramai saranno quasi arrivati.
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_03"); //Non riusciranno mai a superare le fortificazioni di Campo Nuovo.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_04"); //Non ne hanno bisogno. Alcuni mesi fa, hanno scoperto una via che passa sopra le montagne e arriva dritta alla miniera libera. Nessun altro la conosce.
};

//***************************************************************************
//	Info OCGUARDS
//***************************************************************************
instance Info_Diego_OCGUARDS (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCGUARDS_Condition;
	information	= Info_Diego_OCGUARDS_Info;
	important	= 0;
	permanent	= 0;
	description = "Ho visto le guardie di fronte ai cancelli chiusi.";
};

FUNC int Info_Diego_OCGUARDS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCGUARDS_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCGUARDS_15_01"); //Ho visto le guardie di fronte ai cancelli chiusi.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_02"); //Stanne alla larga. Attaccheranno chiunque si avvicini al campo.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_03"); //Hanno paura che qualcuno voglia impedire il raid alla miniera libera.
};

//***************************************************************************
//	Info OCMURDER
//***************************************************************************
instance Info_Diego_OCMURDER (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMURDER_Condition;
	information	= Info_Diego_OCMURDER_Info;
	important	= 0;
	permanent	= 0;
	description = "Cos'è successo ai Maghi del Fuoco?";
};

FUNC int Info_Diego_OCMURDER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMURDER_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_01"); //Cos'è successo ai Maghi del Fuoco?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_02"); //Corristo e gli altri maghi sono stati gli unici a mantenere la calma.
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_03"); //Hanno proibito il raid e hanno proposto un accordo con gli altri due campi.
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_04"); //Loro hanno PROIBITO a Gomez di occupare la miniera libera?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_05"); //Beh, sì... In effetti Corristo e gli altri non avrebbero dovuto fidarsi a tal punto di se stessi. Gomez ha smesso di credere in loro e li ha fatti uccidere.
};

//***************************************************************************
//	Info OCRETREAT
//***************************************************************************
instance Info_Diego_OCRETREAT (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCRETREAT_Condition;
	information	= Info_Diego_OCRETREAT_Info;
	important	= 0;
	permanent	= 0;
	description = "Ora tu e Milten che farete?";
};

FUNC int Info_Diego_OCRETREAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCMURDER))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCRETREAT_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCRETREAT_15_01"); //Ora tu e Milten che farete?
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_02"); //Resteremo qui ancora un po', per avvisare altri amici che è meglio non s'avvicinino troppo alle guardie.
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_03"); //Potresti farci un favore.
};

//***************************************************************************
//	Info OCFAVOR
//***************************************************************************
instance Info_Diego_OCFAVOR (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFAVOR_Condition;
	information	= Info_Diego_OCFAVOR_Info;
	important	= 0;
	permanent	= 0;
	description = "Consideralo già fatto. Dimmi cosa vuoi!";
};

FUNC int Info_Diego_OCFAVOR_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFAVOR_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_01"); //Consideralo già fatto. Dimmi cosa vuoi!
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_02"); //Cerca Lester e Gorn e informali sugli ultimi avvenimenti.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_03"); //Dì loro che c'incontreremo tutti e quattro al solito posto.
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_04"); //Se li vedrò prima di te, dirò loro di recarsi al vostro punto d'incontro.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_05"); //Grazie, amico mio. Sei davvero un ragazzo a posto. Ora vai, ci vedremo più tardi.
				
	Log_CreateTopic		(CH4_4Friends,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_4Friends,		LOG_RUNNING);
	B_LogEntry			(CH4_4Friends,		"Tutti i Maghi del Fuoco sono morti e la situazione non è più sotto controllo. Diego mi ha chiesto d'avvertire Lester e Gorn riguardo l'incontro che devono avere con lui e Milten in un luogo segreto. Sembra non sia la prima volta, che avviene una di queste 'riunioni'!"); 
};











































/*

// *******************************************************************

	AI_Output(self,hero,"Info_Diego_Gamestart_11_01"); //Warum haben sie dich hier reingeworfen?
	
	Info_ClearChoices(Info_Diego_Gamestart );
	Info_AddChoice	 (Info_Diego_Gamestart, "Gewitzter Überfall            (+3 Geschicklichkeit)"	,Info_Diego_Gamestart_Choice_Dex);
	Info_AddChoice	 (Info_Diego_Gamestart, "Schlägerei mit Folgen         (+3 Stärke)"				,Info_Diego_Gamestart_Choice_Str);
	Info_AddChoice	 (Info_Diego_Gamestart, "Wahre Worte zum falschen Mann (+3 Mana)"				,Info_Diego_Gamestart_Choice_Man);
	Info_AddChoice	 (Info_Diego_Gamestart, "Unschuldig                    (+1 auf alle Attribute)"	,Info_Diego_Gamestart_Choice_All);
};
// -------------------------------------------- CHOICES ----------------------------------------------------
FUNC VOID Info_Diego_Gamestart_Choice_Dex()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_00"); //Ich habe ne Ladung Erz verschwinden lassen.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_01"); //Dummerweise hat der Typ bei dem ich sie versteckt habe, lieber die Belohnung für mich kassiert, anstatt mit mir das Erz zu teilen.
	PrintScreen	("Geschicklichkeit +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Str()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_00"); //Eine Herausforderung konnte ich noch nie abschlagen. Auch nicht von des Königs Gardisten. dummerweise hat der König viele Gardisten.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_01"); //Zu viele.	
	PrintScreen	("Stärke +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Man()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_00"); //Ich saß in der Kneipe und habe meine Meinung über König, Krieg und Steuern gesagt. 
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_01"); //Ich hab' mich nur zu spät daran erinnert, dass der, der die Wahrheit spricht, ein schnelles Pferd braucht.
	PrintScreen	("Mana +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]+3;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_All()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_All_15_00"); //Ich bin unschuldig!
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_01"); //Du solltest eins wissen: Hier drin ist niemand unschuldig. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_02"); //Hier findest du Männer die so ziemlich jedes mögliche Verbrechen begangen haben. Und einen unschuldigen nehmen die nur zu gerne auseinander. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_03"); //Ich gebe dir nen Tipp, und der ist ganz umsonst. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_04"); //Wenn dich jemand fragt, warum du hier bist, sag ihm, du hast einen Typen gekillt, der dich gefragt hat, warum du hier bist. 
	PrintScreen	("Stärke, Geschick und Mana +1", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] 	= hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] 	= hero.attribute[ATR_STRENGTH]	+1;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]		+1;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]	+1;
	Info_ClearChoices(Info_Diego_Gamestart );


*/
