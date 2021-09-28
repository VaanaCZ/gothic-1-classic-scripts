// **************************************************
VAR INT MordragKO_PlayerChoseOreBarons;
VAR INT MordragKO_PlayerChoseThorus;
VAR INT MordragKO_HauAb;
var int MordragKO_StayAtNC;
// **************************************************

// **************************************************
//						 EXIT 
// **************************************************

instance  Org_826_Mordrag_Exit (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 999;
	condition	= Org_826_Mordrag_Exit_Condition;
	information	= Org_826_Mordrag_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_826_Mordrag_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  Org_826_Mordrag_Greet (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 1;
	condition	= Org_826_Mordrag_Greet_Condition;
	information	= Org_826_Mordrag_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Greet_Info()
{
	AI_Output (self, other,"Org_826_Mordrag_Greet_11_00"); //Ehi, nuovo arrivato! Sono Mordrag. Dovresti ricordare il mio nome: puoi comprare qualsiasi cosa da me a buon prezzo!
};

// **************************************************
//					Handeln
// **************************************************
var int Mordrag_Traded;
// **************************************************

instance  Org_826_Mordrag_Trade (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 800;
	condition	= Org_826_Mordrag_Trade_Condition;
	information	= Org_826_Mordrag_Trade_Info;
	permanent	= 1;
	description = "Mostrami la merce.";
	trade		= 1;
};                       

func int  Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Trade_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Trade_15_00"); //Mostrami la merce.
	AI_Output (self, other,"Org_826_Mordrag_Trade_11_01"); //Scegli qualcosa...
	if	(Mordrag_Traded==0)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"Mordrag il ladro vende merce rubata al mercato.");
		Mordrag_Traded=1;
	};
};

// **************************************************
//					KURIER FÜR MAGIER
// **************************************************

instance  Org_826_Mordrag_Courier (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Courier_Condition;
	information	= Org_826_Mordrag_Courier_Info;
	permanent	= 1;
	description = "Sei davvero il corriere del mago?";
};                       

FUNC int  Org_826_Mordrag_Courier_Condition()
{
	if	Thorus_MordragMageMessenger 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Courier_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_00"); //Sei davvero il corriere del mago?
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_01"); //Se così fosse?
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_02"); //Vorrei parlare con lui. Devo entrare nel castello.
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_03"); //Tutti i corrieri del mago possiedono un sigillo, che permette loro di entrare nel castello. Se fossi uno di noi, potresti averne uno...
};

// **************************************************
//					DU HAST EIN PROBLEM
// **************************************************

instance  Org_826_Mordrag_Problem (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Problem_Condition;
	information	= Org_826_Mordrag_Problem_Info;
	permanent	= 0;
	description = "Hai un problema.";
};                       

FUNC int  Org_826_Mordrag_Problem_Condition()
{
	if Thorus_MordragKo == LOG_RUNNING 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Problem_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_00"); //Hai un problema.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_01"); //Davvero? Quale?
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_02"); //Ci sono delle persone che vogliono sbarazzarsi di te.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_03"); //Davvero? Dì loro che mandino qualcuno a realizzare questo sogno.
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_04"); //Come sai che non sono proprio io?
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_05"); //Perché credo tu sia un ragazzo intelligente. Capirai presto che esistono lavori migliori di quelli che offre Gomez.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_06"); //Anche noi di Campo Nuovo abbiamo bisogno di gente valorosa. Inoltre, nessuno ti dice cosa devi fare.
};

// **************************************************
//					  NCInfo
// **************************************************

instance  Org_826_Mordrag_NCInfo(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_NCInfo_Condition;
	information	= Org_826_Mordrag_NCInfo_Info;
	permanent	= 0;
	description = "Parlami ancora di Campo Nuovo.";
};                       

FUNC int  Org_826_Mordrag_NCInfo_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_NCInfo_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_00"); //Parlami ancora di Campo Nuovo.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_01"); //È la parte di colonia in cui c'è più libertà. Nessun barone delle miniere o guru che ci comandi.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_02"); //Abbiamo la nostra miniera, ma il metallo non finisce nelle tasche del maledetto sovrano!
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_03"); //E come lo usate?
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_04"); //I nostri maghi stanno lavorando a un piano per scappare da qui. Tutto il metallo viene raccolto a questo scopo.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_05"); //Mentre Gomez e la sua gente stanno con le mani in mano, noi lavoriamo per la libertà: ecco come vanno le cose.
};

// **************************************************
//					JoinNewcamp
// **************************************************

instance  Org_826_Mordrag_JoinNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_JoinNewcamp_Condition;
	information	= Org_826_Mordrag_JoinNewcamp_Info;
	permanent	= 0;
	description = "E se volessi unirmi a Campo Nuovo...";//könntest du mir dabei helfen... ZU LANG
};                       

FUNC int  Org_826_Mordrag_JoinNewcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_JoinNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_JoinNewcamp_15_00"); //E se volessi entrare a far parte di Campo Nuovo... potresti aiutarmi?
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_01"); //Se hai intenzioni serie, possiamo partire anche subito! Ti condurrò da Lares, il nostro capo.
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_02"); //Se invece preferisci cacciarmi da questo campo... Beh, provaci pure!
};


instance  Org_826_Mordrag_GotoNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_GotoNewcamp_Condition;
	information	= Org_826_Mordrag_GotoNewcamp_Info;
	permanent	= 0;
	description = "Andiamo a Campo Nuovo!";
};                       

FUNC int  Org_826_Mordrag_GotoNewcamp_Condition()
{
	if (Npc_KnowsInfo(hero,Org_826_Mordrag_JoinNewcamp))
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoNewcamp_15_00"); //Andiamo a Campo Nuovo!
	AI_Output (self, other,"Org_826_Mordrag_GotoNewcamp_11_01"); //Bene! Seguimi.
	
	Mordrag_GotoNC_Day = Wld_GetDay();
	
	AI_StopProcessInfos	(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);	// damit hat der Spieler einen Freischlag. Nach dem zweiten wehrt sich Mordrag!
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Mordrag ha acconsentito a mostrarmi la strada per Campo Nuovo. Spero non sia una trappola!");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine		(self,"GUIDE");
};

// **************************************************
//				AM NEWCMAP ANGEKOMMEN
// **************************************************

instance  Org_826_Mordrag_AtNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_AtNewcamp_Condition;
	information	= Org_826_Mordrag_AtNewcamp_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_AtNewcamp_Condition()
{
	if 	( Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_07_21") ) 
	{
		self.flags	= 0;
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_AtNewcamp_Info()
{
	if (Mordrag_GotoNC_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_00"); //Eccoci, finalmente.
	}
	else
	{
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //Pensavo non saresti mai arrivato! Lascia stare, ormai ci siamo!
	};
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_01"); //Attraversa il cancello e arriverai a Campo Nuovo. Parla con Lares, ti aiuterà. Dagli questo: è un anello prezioso.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_02"); //È il tuo biglietto per parlare con Lares. TI serve una buona ragione, per avere il permesso d'incontrarlo.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_03"); //Pensandoci bene, credo che resterò qui per un po'. Ho guadagnato abbastanza e la situazione a Campo Vecchio inizia a scottare.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_04"); //Se vuoi, puoi trovarmi alla taverna sul lago. Abbi cura di te!
	AI_Output (other, self,"Org_826_Mordrag_AtNewcamp_15_05"); //Ci vediamo.
	
	CreateInvItems  (self, MordragsRing, 1);
	B_GiveInvItems	(self, other, MordragsRing, 1);

	B_GiveXP		(XP_ArrivedWithMordrag);	
	B_LogEntry		(CH1_JoinNC,"Siamo di fronte all'ingresso di Campo Nuovo. Mordrag mi ha dato un anello da consegnare a Lares, capo dei ladri, se voglio davvero entrare a far parte del campo. Lui, invece, ha deciso di passare un po' di tempo nel bar sul lago.");
	var C_NPC lares; lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar [AIV_FINDABLE]=TRUE;
	
	MordragKO_StayAtNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
//					AUFS MAUL
// **************************************************

instance  Org_826_Mordrag_Fight (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Fight_Condition;
	information	= Org_826_Mordrag_Fight_Info;
	permanent	= 0;
	description = "In questo campo non c'è abbastanza spazio per tutti e due!";
};                       

FUNC int  Org_826_Mordrag_Fight_Condition()
{
	if ( (Thorus_MordragKo == LOG_RUNNING) && (!Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp)) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Fight_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Fight_15_00"); //Questo campo non è abbastanza grande per tutti e due!
	AI_Output (self, other,"Org_826_Mordrag_Fight_11_01"); //Prego?
	
	Info_ClearChoices(Org_826_Mordrag_Fight);
	Info_AddChoice   (Org_826_Mordrag_Fight,"Sparisci da questo campo!",Info_Mordrag_Fight_GetAway);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Qui non c'è posto per chi deruba i baroni delle miniere!",Info_Mordrag_Fight_OreBarons);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Mi manda Thorus. Vuole che mi sbarazzi di te una volta per tutte.",Info_Mordrag_Fight_Thorus);
};

FUNC VOID Info_Mordrag_Fight_GetAway()
{
	AI_Output (other, self,"Info_Mordrag_Fight_GetAway_15_00"); //Sparisci da questo campo!
	AI_Output (self, other,"Info_Mordrag_Fight_GetAway_11_01"); //Che parole grosse da una bocca così piccola...
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_OreBarons()
{
	AI_Output (other, self,"Info_Mordrag_Fight_OreBarons_15_00"); //Qui non c'è posto per chi deruba i baroni delle miniere!
	AI_Output (self, other,"Info_Mordrag_Fight_OreBarons_11_01"); //Ah, è questo che intendi! Perché non l'hai detto e basta...
	
	MordragKO_PlayerChoseOreBarons = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_Thorus()
{
	AI_Output (other, self,"Info_Mordrag_Fight_Thorus_15_00"); //Mi manda Thorus. Vuole che mi sbarazzi di te una volta per tutte.
	AI_Output (self, other,"Info_Mordrag_Fight_Thorus_11_01"); //Thorus? Davvero? Era proprio quello che volevo sapere...
	
	MordragKO_PlayerChoseThorus = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

// **************************************************
//					HauAb
// **************************************************

instance  Org_826_Mordrag_HauAb(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_HauAb_Condition;
	information	= Org_826_Mordrag_HauAb_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_HauAb_Condition()
{
	VAR C_NPC Mordrag;
	Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	
	if (Mordrag.aivar[AIV_WASDEFEATEDBYSC] >= 1)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_HauAb_Info()
{
	AI_Output (other, self,"Org_826_HauAb_GotoNewcamp_15_00"); //Vattene di qui...
	
	AI_StopProcessInfos	(self);
	
	MordragKO_HauAb = TRUE;
	
	B_LogEntry    (CH1_MordragKO,"Ho sconfitto Mordrag e gli ho ordinato di non farsi più vedere a Campo Vecchio.");

	Npc_ExchangeRoutine	(self, "Start");
};
		
// **************************************************
//					GotoKalom
// **************************************************

instance  Org_826_Mordrag_GotoKalom(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalom_Condition;
	information	= Org_826_Mordrag_GotoKalom_Info;
	permanent	= 0;
	description = "Ho un messaggio di Lares per te.";
};                       

FUNC int  Org_826_Mordrag_GotoKalom_Condition()
{
	if 	(Npc_GetTrueGuild(other)!=GIL_ORG)
	&&	(Lares_InformMordrag == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalom_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_00"); //Ho un messaggio di Lares per te.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_01"); //Dimmi tutto.
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_02"); //Vuole che tu scopra cosa sta accadendo nella Setta.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_03"); //Ho il presentimento che questo problema si risolverà da solo...

	B_LogEntry	(CH1_JoinNC,"Ho riferito a Mordrag il messaggio di Lares: ha borbottato qualcosa sugli oggetti che hanno cura di se stessi. Non ho capito assolutamente nulla!");
};

// **************************************************
//					GotoKalom - NOW
// **************************************************
	var int Mordrag_GotoKalom;
// **************************************************

instance  Org_826_Mordrag_GotoKalomNOW(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalomNOW_Condition;
	information	= Org_826_Mordrag_GotoKalomNOW_Info;
	permanent	= 0;
	description = "Lares mi ha detto di aiutarti con la storia della Setta.";
};                       

FUNC int  Org_826_Mordrag_GotoKalomNOW_Condition()
{
	if 	(Npc_GetTrueGuild(other)==GIL_ORG)
	&&	Npc_KnowsInfo(hero,ORG_801_Lares_GotoKalom)
	{
		return TRUE;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalomNOW_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //Lares mi ha detto di aiutarti con la storia della Setta.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //Lo vedi... Sapevo che non sarebbe toccata a me.
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //Vuoi che mi occupi io di tutta la faccenda?
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //Sono sicuro che ce la farai. Ascolta: è importante scoprire la verità su questa storia dell'evocazione.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //So che quei pazzi della Setta stanno organizzando una grande cerimonia. Personalmente, non credo nel Dormiente, ma una cosa è certa:
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //I guru possiedono una magia molto potente, quindi è meglio scoprire cosa sta succedendo. Hai capito tutto, finora?

	B_LogEntry			(CH1_GotoPsiCamp,"Mordrag mi ha passato il compito di spiare Campo Palude. Sembra che i guru stiano preparando una grande evocazione, ma devo scoprire di più.");
	B_GiveXP			(XP_AssistMordrag);	
	
	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;
	
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Puoi darmi istruzioni più specifiche?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Vedrò cosa posso fare.",Org_826_Mordrag_GotoKalomNOW_DoIt);

};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //Puoi darmi istruzioni più specifiche?
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //Parla con Lester. Tempo addietro ho passato un lungo periodo nella Setta e lui mi ha aiutato. È un bravo ragazzo.
	B_LogEntry(CH1_GotoPsiCamp,"Devo parlare a un novizio di nome Lester, nel campo della Fratellanza. Pare sia un tipo fidato, che ha già aiutato Mordrag in precedenza.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //Vedrò cosa posso fare.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //Appena scopri i loro piani, torna a fare rapporto.
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	AI_StopProcessInfos	(self);
};

// **************************************************
//					RUNNING
// **************************************************

instance  Org_826_Mordrag_RUNNING (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_RUNNING_Condition;
	information	= Org_826_Mordrag_RUNNING_Info;
	permanent	= 1;
	description = "A proposito della Setta...";
};                       

FUNC int  Org_826_Mordrag_RUNNING_Condition()
{
	if (Mordrag_GotoKalom == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_RUNNING_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_RUNNING_15_00"); //A proposito della Setta...
	AI_Output			(self, other,"Org_826_Mordrag_RUNNING_11_01"); //Allora?

	if	(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_04"); //La grande evocazione ha avuto luogo.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_09"); //No! Vuoi dire che ti sei lasciato contagiare dalla loro follia?
		}
		else
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_06"); //Vogliono rafforzarsi e contattare il Dormiente, grazie a una pozione ottenuta dalle uova di pidocchio di miniera.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_07"); //Che stronzata! E quegli idioti ci credono davvero?
		};
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_10"); //Sono curioso di vedere il risultato.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_11"); //Anch'io. Fammi sapere quando i guru avranno terminato di rendersi ridicoli.

		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP			(XP_ReportToMordrag);
		Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_SUCCESS);
		B_LogEntry			(CH1_GotoPsiCamp,"Mordrag quasi moriva dalle risate, quando gli ho parlato delle uova di pidocchio di miniera. Non sembra più molto interessato a spiare i guru. Deve pensare che il problema sia risolto!");
	}
	else
	{
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_02"); //Non ho ancora scoperto nulla.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_03"); //Allora continua a investigare...
	};

/*	
	//SN: Werde nicht gebraucht, da sie nicht zur Kapitel 2-6-Story passen!!!
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_08"); //Ich hab' die Eier bei mir.
		
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_05"); //(sarkastisch) Hab' ich auch gemerkt. Diese verdammten Sektenspinner haben Gomez die alte Mine gekostet. Wird nicht mehr lange dauern, dann stehen seine Gardisten bei UNS vor der Tür, um sich ihr Erz abzuholen...
*/
};
	
	













	




	
