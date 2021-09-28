// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalParvez_EXIT (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 999;
	condition	= DIA_BaalParvez_EXIT_Condition;
	information	= DIA_BaalParvez_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalParvez_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalParvez_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_BaalParvez_Greet (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_Greet_Condition;
	information	= DIA_BaalParvez_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Greet_Info()
{
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_00"); //Che il Dormiente sia con te, straniero!
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_01"); //Sono qui per guidarti sulla retta via.
};

// **************************************************
//					Rechter Weg
// **************************************************

instance  DIA_BaalParvez_RightWay (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_RightWay_Condition;
	information	= DIA_BaalParvez_RightWay_Info;
	permanent	= 0;
	description = "E qual è la retta via?";
};                       

FUNC int  DIA_BaalParvez_RightWay_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_RightWay_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_RightWay_15_00"); //E qual è la retta via?
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_01"); //La via del Dormiente. Solo lui ha il potere di liberarci.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_02"); //I guru stanno preparando una grande evocazione nel nostro campo. Vogliono entrare in contatto col Dormiente.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_03"); //Finora ci ha parlato solo durante le visioni, ma è arrivato il momento di entrare in contatto con lui.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_04"); //Abbiamo bisogno di più aiuto possibile. Concentrando il nostro potere spirituale, arriveremo fino a lui.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_05"); //Il nostro campo è abbastanza lontano, nella palude. Posso condurti là, se lo desideri.
};

// **************************************************
//					Vorteile für mich
// **************************************************

instance  DIA_BaalParvez_MyAdvantage (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_MyAdvantage_Condition;
	information	= DIA_BaalParvez_MyAdvantage_Info;
	permanent	= 0;
	description = "Cosa ci guadagno, seguendoti?";
};                       

FUNC int  DIA_BaalParvez_MyAdvantage_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_MyAdvantage_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_MyAdvantage_15_00"); //Cosa ci guadagno, seguendoti?
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_01"); //Potresti essere uno dei prescelti che riceveranno il dono della magia dal Dormiente.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_02"); //Oppure potresti assurgere ai più alti onori e diventare un templare. Solo i migliori combattenti raggiungono tale posizione.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_03"); //Se il Dormiente è con te, puoi combinare le cose: i migliori templari possono ricevere anche il dono della magia.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_04"); //Come vedi, la Fratellanza ti offre molte opportunità.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_05"); //Fari meglio a pensarci, prima di decidere di unirti a un altro campo!
};

// **************************************************
//					Schläfer
// **************************************************

instance  DIA_BaalParvez_Sleeper (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_Sleeper_Condition;
	information	= DIA_BaalParvez_Sleeper_Info;
	permanent	= 0;
	description = "Chi è il Dormiente?";
};                       

FUNC int  DIA_BaalParvez_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_00"); //Chi è il Dormiente?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_01"); //Il Dormiente ci parla attraverso i sogni e le visioni.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_02"); //Ci guida da quando ha preso contatto con Y'Berion la prima volta, cinque anni fa.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_03"); //Tutti i seguaci delle Fratellanza hanno rinnegato le tre divinità. Pregano solo il Dormiente, affinché li salvi.
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_04"); //Li salvi da cosa?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_05"); //Da questo maledetto posto, ovviamente! Il Dormiente ci mostrerà la strada per la libertà!
};

// **************************************************
//			Was hat Schläfer zu euch gesagt?
// **************************************************

instance  DIA_BaalParvez_SleeperSaid (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_SleeperSaid_Condition;
	information	= DIA_BaalParvez_SleeperSaid_Info;
	permanent	= 0;
	description = "Cosa vi ha detto il Dormiente?";
};                       

FUNC int  DIA_BaalParvez_SleeperSaid_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_SleeperSaid_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_SleeperSaid_15_00"); //Cosa vi ha detto il Dormiente?
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_01"); //Ci ha guidati alla palude, alle rovine del vecchio tempio, dove abbiamo costruito il nostro campo.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_02"); //Ci ha donato l'indipendenza: nessuno di noi è costretto a lavorare nelle miniere.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_03"); //Inoltre ci ha mostrato l'utilizzo dell'erba di palude. La vendiamo agli altri campi e, in cambio, possiamo chiedere ciò che vogliamo.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_04"); //Per finire, ci ha concesso l'uso della magia. Una magia antica e potente, diversa da quella utilizzata da qualsiasi altro mago del regno.
};

// **************************************************
//		Erzähl mir von der MAgie des Schläfers
// **************************************************

instance  DIA_BaalParvez_PSIMagic (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_PSIMagic_Condition;
	information	= DIA_BaalParvez_PSIMagic_Info;
	permanent	= 0;
	description = "Parlami della magia del Dormiente.";
};                       

FUNC int  DIA_BaalParvez_PSIMagic_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_SleeperSaid))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_PSIMagic_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_PSIMagic_15_00"); //Parlami della magia del Dormiente.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_01"); //Questo dono ti permette di controllare le cose col solo potere della mente.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_02"); //Solo i guru della nostra Fratellanza vengono iniziati ai segreti della magia.
};

// **************************************************
//					GotoNewcamp
// **************************************************
	var int BaalParvez_GotoPSI_Day;
// **************************************************

instance  DIA_BaalParvez_GotoPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 800;
	condition	= DIA_BaalParvez_GotoPSI_Condition;
	information	= DIA_BaalParvez_GotoPSI_Info;
	permanent	= 1;
	description = "Portami al tuo campo: voglio dargli un'occhiata!";
};                       

FUNC int  DIA_BaalParvez_GotoPSI_Condition()
{
	if	(Npc_RefuseTalk(self)==FALSE)
	&&	(Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	&&	(Npc_GetDistToWP(self,"PATH_OC_PSI_18")>5000)
	&&	!Npc_KnowsInfo(hero, DIA_BaalParvez_AtPSI)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_GotoPSI_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_GotoPSI_15_00"); //Portami al tuo campo: voglio dargli un'occhiata!
	if (Psi_Walk == 0)
	{
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
		};
		B_LogEntry				(CH1_JoinPsi,"Baal Parvez è un missionario della Fratellanza. Risiede a Campo Vecchio e cerca nuovi adepti per il DORMIENTE! Si è offerto di accompagnarmi a Campo Palude, casa della Fratellanza.");
		Psi_Walk	= 1;
	};
	AI_Output (self, other,"DIA_BaalParvez_GotoPSI_10_01"); //Molto bene! Seguimi!
	
	BaalParvez_GotoPSI_Day = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_SetRefuseTalk (self, 300);
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************************
//				AM PSICAMP ANGEKOMMEN
// **************************************************

instance DIA_BaalParvez_AtPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_AtPSI_Condition;
	information	= DIA_BaalParvez_AtPSI_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_AtPSI_Condition()
{
	if 	( Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_PSI_18") ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_AtPSI_Info()
{
	if (BaalParvez_GotoPSI_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_10_00"); //Eccoci! Laggiù si trova il campo della Fratellanza.
	}
	else
	{
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //Te la sei presa comoda, fratello! Laggiù c'è il campo.
	};
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_01"); //Attraversa il cancello e parla coi miei fratelli. Sono sicuro che non hai percorso tanta strada per nulla.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_02"); //Chiedi di Cor Kalom. È lui che si occupa di novizi e tutori.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_03"); //Io tornerò a Campo Vecchio: ci sono ancora molti infedeli da guidare sulla retta via.
	AI_Output 	(other, self,"DIA_BaalParvez_AtPSI_15_04"); //Buona fortuna.

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_LogEntry	(CH1_JoinPsi,"Campo Palude è sotto di me. Il mio accompagnatore mi ha suggerito di parlare con Cor Kalom, il capo di novizi e tutori.");
	B_GiveXP	(XP_ArrivedAtPsiCamp);

	var C_NPC Kalom; Kalom = Hlp_GetNpc(Gur_1201_CorKalom);
	Kalom.aivar[AIV_FINDABLE]=TRUE;
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};


