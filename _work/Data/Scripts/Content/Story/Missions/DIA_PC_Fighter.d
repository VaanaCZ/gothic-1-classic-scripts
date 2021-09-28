//***************************************************************************
//	Info EXIT
//***************************************************************************

INSTANCE Info_Gorn_EXIT (C_INFO)
{
	npc			= PC_Fighter;
	nr   		= 999;
	condition	= Info_Gorn_EXIT_Condition;
	information	= Info_Gorn_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Gorn_EXIT_Condition()
{
	return 1;
};

func VOID Info_Gorn_EXIT_Info()
{
	if	self.aivar[AIV_PARTYMEMBER]
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_01"); //In guardia!
	}
	else
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_02"); //A più tardi.
	};
	
	AI_StopProcessInfos	( self );
};

//*************************************
//			1. Begrüßung
//*************************************

instance DIA_Gorn_First (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_First_Condition;
	information		= Dia_Gorn_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int DIA_Gorn_First_Condition()
{
	if	(Kapitel < 3)
	{
		return 1;
	};
};

func void DIA_Gorn_First_Info()
{
	AI_Output (self, other,"DIA_Gorn_First_09_00"); //Ehi! Una faccia nuova!
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //Chi sei?
	AI_Output (self, other,"DIA_Gorn_First_09_02"); //Sono Gorn, mercenario dei maghi.
};

//*************************************
//				Leben
//*************************************

instance DIA_Gorn_Leben (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 2;
	condition		= Dia_Gorn_Leben_Condition;
	information		= Dia_Gorn_Leben_Info;
	permanent		= 0;
	description		= "In cosa consiste il tuo lavoro?";
};

FUNC int DIA_Gorn_Leben_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Leben_Info()
{
	AI_Output (other, self,"DIA_Gorn_Leben_15_00"); //In cosa consiste il tuo lavoro?
	AI_Output (self, other,"DIA_Gorn_Leben_09_01"); //Lee ha fatto un patto coi maghi. Ingaggia i migliori combattenti della colonia, cioè noi.
	AI_Output (self, other,"DIA_Gorn_Leben_09_02"); //Ci assicuriamo che i tritarocce possano estrarre il metallo senza essere disturbati e risolviamo i problemi dei maghi.
	AI_Output (self, other,"DIA_Gorn_Leben_09_03"); //I maghi si occupano di farci uscire da qui e noi riceviamo una piccola parte di metallo in pagamento.
};

//*************************************
//			Hütte (Shrike)
//*************************************
	var int Gorn_ShrikesHut;
//*************************************

instance DIA_Gorn_Hut (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_Hut_Condition;
	information		= Dia_Gorn_Hut_Info;
	permanent		= 0;
	description		= "Posso restare qui, da qualche parte?";
};

FUNC int DIA_Gorn_Hut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Hut_Info()
{
	AI_Output (other, self,"DIA_Gorn_Hut_15_00"); //Posso restare da qualche parte, senza dover cacciare qualcuno dalla propria capanna?
	AI_Output (self, other,"DIA_Gorn_Hut_09_01"); //Non credo. Ma se è proprio questo che desideri, vai da Shrike.
	AI_Output (self, other,"DIA_Gorn_Hut_09_02"); //Si è preso la capanna di fronte, all'entrata della caverna. Era vuota, ma apparteneva a noi.
	AI_Output (other, self,"DIA_Gorn_Hut_15_03"); //Noi?
	AI_Output (self, other,"DIA_Gorn_Hut_09_04"); //Sì, noi mercenari. Qui mercenari e ladri vivono separati. Nessuno della banda di Lares dovrebbe trovarsi da questa parte del grande buco.
	AI_Output (self, other,"DIA_Gorn_Hut_09_05"); //A dire il vero, non fa alcuna differenza. Però lui non ci ha chiesto nulla. Non puoi permettere ai ladri di averla vinta, altrimenti diventano molto arroganti.

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,"Gorn il mercenario mi ha detto che Shrike ha occupato una capanna senza permesso. Nessun altro mercenario interferirà, se 'convincerò' Shrike a trovarsi un altro alloggio.");
	Gorn_ShrikesHut = LOG_RUNNING;
};

//*************************************
//			Hütte LEER (Shrike)
//*************************************

instance DIA_Gorn_HutFree (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_HutFree_Condition;
	information		= Dia_Gorn_HutFree_Info;
	permanent		= 0;
	description		= "Shrike è andato in un'altra capanna.";
};

FUNC int DIA_Gorn_HutFree_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Shrike_GetLost))
	{
		return 1;
	};
};

func void DIA_Gorn_HutFree_Info()
{
	AI_Output			(other, self,"DIA_Gorn_HutFree_15_00"); //Shrike è andato in un'altra capanna.
	AI_Output			(self, other,"DIA_Gorn_HutFree_09_01"); //Bene. Torlof mi ha appena detto che vuole scambiare due parole col tipo.

	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_SUCCESS);
	B_LogEntry			(CH1_ShrikesHut,"Gorn era molto divertito, quando gli ho raccontato che ho scacciato Shrike dalla capanna. Mi sembra un tipo onesto: duro, ma leale. In futuro potrò far affidamento su di lui.");
	B_GiveXP			(XP_ReportedKickedShrike);
};

//*************************************
//			Söldner werden
//*************************************

instance DIA_Gorn_BecomeSLD (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 5;
	condition		= Dia_Gorn_BecomeSLD_Condition;
	information		= Dia_Gorn_BecomeSLD_Info;
	permanent		= 0;
	description		= "Cosa devo fare per entrare a far parte di Campo Nuovo?";
};

FUNC int DIA_Gorn_BecomeSLD_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Gorn_First)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_Gorn_BecomeSLD_Info()
{
	AI_Output (other, self,"DIA_Gorn_BecomeSLD_15_00"); //Cosa devo fare per entrare a far parte di Campo Nuovo?
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_01"); //Prima che Lee ti accetti, devi migliorare le tue abilità in combattimento. Non importa quale arma usi, ma devi farlo bene.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_02"); //Inoltre, devi essere esperto della vita qui e di tutto il resto.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_03"); //Se non desideri andare negli altri campi, prova a unirti ai ladri prima d'iniziare come mercenario.
};

/*
//*************************************
//				PERM
//*************************************

instance DIA_Gorn_PERM (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_PERM_Condition;
	information		= Dia_Gorn_PERM_Info;
	permanent		= 1;
	description		= "";
};

FUNC int DIA_Gorn_PERM_Condition()
{
	return 1;
};

func void DIA_Gorn_PERM_Info()
{
	AI_Output (other, self,"DIA_Gorn_PERM_15_00"); //
	AI_Output (self, other,"DIA_Gorn_PERM_09_01"); //
};
*/

//*************************************
//				TRADE
//*************************************
	var int Gorn_Trade;
//*************************************

instance DIA_Gorn_TRADE (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 800;
	condition		= Dia_Gorn_TRADE_Condition;
	information		= Dia_Gorn_TRADE_Info;
	permanent		= 1;
	description		= DIALOG_TRADE;
	trade 			= 1;
};

FUNC int DIA_Gorn_TRADE_Condition()
{
	//if (Npc_KnowsInfo(hero,DIA_Gorn_DuHehler))
	//{
		//return 1; //***Man darf NICHT seine Waffe weggkaufen oder so...
	//};
};

func void DIA_Gorn_TRADE_Info()
{
	AI_Output (other, self,"DIA_Gorn_TRADE_15_00"); //Hai altra di quella roba?
	AI_Output (self, other,"DIA_Gorn_TRADE_09_01"); //Moltissima. Vuoi fare affari?
};

//*************************************
//			DU Hehler?
//*************************************

instance DIA_Gorn_DuHehler (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_DuHehler_Condition;
	information		= Dia_Gorn_DuHehler_Info;
	permanent		= 0;
	description		= "Perché hai preso parte a una delle razzie della banda?";
};

FUNC int DIA_Gorn_DuHehler_Condition()
{
	if (Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil))
	{
		return 1;
	};
};

func void DIA_Gorn_DuHehler_Info()
{
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_00"); //Perché hai preso parte a una delle razzie della banda?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_01"); //Chi te l'ha detto?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_02"); //Altrimenti come faresti ad avere così tanta roba?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_03"); //Non pensare che questo provenga tutto da UN bottino.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_04"); //Prendi parte regolarmente alle razzie?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_05"); //Se così fosse, non potrei dirtelo. A Lee non farebbe piacere.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_06"); //Capisco.
	
	CreateInvItems(self, ItFoApple, 21);
	B_GiveInvItems	(self,other, ItFoApple,21); //Notwendig für Screenausgabe
	Npc_RemoveInvItems (other, ItFoApple,21);
	
	CreateInvItems(other, ItMw_1H_LightGuardsSword_03, 1);
	CreateInvItems(other, ItFoApple, 5);
	CreateInvItems(other, ItFoLoaf, 5);
	CreateInvItems(other, ItFoCheese, 5);
	CreateInvItems(other, ItFoBeer, 5);
};







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NCWAIT
//***************************************************************************
INSTANCE Info_Gorn_NCWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 1;
	condition	= Info_Gorn_NCWAIT_Condition;
	information	= Info_Gorn_NCWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_NCWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"NC_PATH52")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_NCWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_NCWAIT_09_01"); //Ah, sei tu! Il mio amico Lester di Campo Palude mi ha raccontato tutto ciò che hai fatto.
	AI_Output (self, other,"Info_Gorn_NCWAIT_09_02"); //Per essere uno nuovo, hai fatto molta strada.
	AI_Output (other, self,"Info_Gorn_NCWAIT_15_03"); //E sono quasi diventato cibo per vermi, un paio di volte.
};

//***************************************************************************
//	Info MAGES
//***************************************************************************
INSTANCE Info_Gorn_MAGES (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MAGES_Condition;
	information	= Info_Gorn_MAGES_Info;
	important	= 0;	
	permanent	= 0;
	description	= "Ho un messaggio importante per i Maghi dell'Acqua!";
};                       

FUNC INT Info_Gorn_MAGES_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_NCWAIT))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MAGES_Info()
{
	AI_Output (other, self,"Info_Gorn_MAGES_15_01"); //Ho un messaggio importante per i Maghi dell'Acqua!
	AI_Output (self, other,"Info_Gorn_MAGES_09_02"); //Allora dovresti parlare con Saturas. È il mago più importante e passa tutto il tempo a studiare sui libri.
	AI_Output (self, other,"Info_Gorn_MAGES_09_03"); //Purtroppo le guardie del livello superiore non ti lasceranno passare, non importa quanto sia importante il tuo messaggio.
	AI_Output (other, self,"Info_Gorn_MAGES_15_04"); //Puoi mettere una buona parola per me?
	AI_Output (self, other,"Info_Gorn_MAGES_09_05"); //Purtroppo no. Però Cronos, il custode del metallo, potrebbe autorizzarti.
};

//***************************************************************************
//	Info CRONOS
//***************************************************************************
INSTANCE Info_Gorn_CRONOS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_CRONOS_Condition;
	information	= Info_Gorn_CRONOS_Info;
	important	= 0;	
	permanent	= 0;
	description	= "Dove si trova questo 'custode del metallo'?";
};                       

FUNC INT Info_Gorn_CRONOS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_MAGES))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_CRONOS_Info()
{
	AI_Output			(other, self,"Info_Gorn_CRONOS_15_01"); //Dove si trova questo 'custode del metallo'?
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_01a");//Prosegui dritto e vedrai una grande caverna, dietro la diga.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_02"); //Di solito, Cronos si trova alla griglia sopra il cumulo di metallo.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_03"); //Ma è un po' arrogante. Dovrai convincerlo che il messaggio è importante.

	VAR C_NPC Cronos;
	Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	
	B_LogEntry		(CH3_EscapePlanNC,"Gorn mi ha raccomandato di andare subito da Saturas, il Gran Mago del Circolo dell'Acqua. Cronos, il custode del metallo, può combinarmi un incontro. Lo troverò al centro del campo, su una griglia sopra il cumulo di metallo."); 

	Npc_ExchangeRoutine	(self, "start");
};

//***************************************************************************
//	Info RUINWAIT
//***************************************************************************
INSTANCE Info_Gorn_RUINWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 2;
	condition	= Info_Gorn_RUINWAIT_Condition;
	information	= Info_Gorn_RUINWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"OW_PATH_ABYSS_4")<1000)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_01"); //Ciao, pivello! Come vedi, la colonia è piccola.
	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_02"); //Non puoi fare a meno d'incontrare sempre le stesse persone.
};

//***************************************************************************
//	Info RUINWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWHAT_Condition;
	information	= Info_Gorn_RUINWHAT_Info;
	important	= 0;	
	permanent	= 0;
	description = "Cosa stai facendo?";
};                       

FUNC INT Info_Gorn_RUINWHAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWHAT_Info()
{
	AI_Output 		(other, self,"Info_Gorn_RUINWHAT_15_01"); //Cosa stai facendo?
	AI_Output		(self, other,"Info_Gorn_RUINWHAT_09_02"); //Cerco di rintracciare i segni di un'antica leggenda.
	AI_Output		(other, self,"Info_Gorn_RUINWHAT_15_03"); //Una leggenda?
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_04"); //Sì. Il mio amico Milten di Campo Vecchio mi ha rivelato che qui vivevano i monaci.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_05"); //Ovviamente, molto prima che la Barriera fosse creata.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_06"); //Sembra adorassero un dio che avrebbe conferito loro la possibilità di trasformarsi in animali.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_07"); //Sono certo che qui si trovino ancora dei tesori risalenti a quel tempo.

	if (!Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS))
	{	
		AI_Output	(self, other,"Info_Gorn_RUINWHAT_09_08"); //Cosa ti porta fin qui?
	};
};

//***************************************************************************
//	Info RUINFOCUS
//***************************************************************************
INSTANCE Info_Gorn_RUINFOCUS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINFOCUS_Condition;
	information	= Info_Gorn_RUINFOCUS_Info;
	important	= 0;	
	permanent	= 0;
	description = "Sto cercando una pietra focalizzatrice.";
};                       

FUNC INT Info_Gorn_RUINFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINFOCUS_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_01"); //Sto cercando una pietra focalizzatrice.
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_02"); //Deve trovarsi da queste parti.
	AI_Output (self, other,"Info_Gorn_RUINFOCUS_09_03"); //L'oggetto che cerchi potrebbe essere fra le rovine del vecchio monastero, dall'altra parte del canyon.
};

//***************************************************************************
//	Info RUINJOIN
//***************************************************************************
INSTANCE Info_Gorn_RUINJOIN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINJOIN_Condition;
	information	= Info_Gorn_RUINJOIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Potremmo andarci assieme.";
};                       

FUNC INT Info_Gorn_RUINJOIN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS) && Npc_KnowsInfo(hero, Info_Gorn_RUINWHAT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINJOIN_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_01"); //Potremmo andarci assieme.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_02"); //Buona idea. Questa zona è piena di laceratori.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_03"); //Se sono da soli, non costituiscono un problema per un cacciatore esperto. Ma la maggior parte delle volte si spostano in branchi.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_04"); //E un branco può fare a pezzi anche il miglior spadaccino.
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_05"); //Allora verrai con me?
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_06"); //D'accordo. Però, prima di passare su questo tronco, voglio esaminare il canyon. Mi piace sapere cosa ho alle spalle.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_07"); //Seguimi! Ho scoperto una via che ci condurrà alla meta.

	Log_CreateTopic		(CH3_MonasteryRuin,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_RUNNING);
	B_LogEntry			(CH3_MonasteryRuin,"Quando mi sono avvicinato alle rovine del monastero, ho incontrato Gorn in cerca di antichi tesori.");
	B_LogEntry			(CH3_MonasteryRuin,"Continueremo a cercare insieme. Gorn mi ha avvisato: nella zona ci sono grossi branchi di laceratori.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,	"RuinAbyss");
};

//***************************************************************************
//	Info RUINABYSS
//***************************************************************************
INSTANCE Info_Gorn_RUINABYSS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINABYSS_Condition;
	information	= Info_Gorn_RUINABYSS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINABYSS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) && (Npc_GetDistToWP(self,"OW_ABYSS_TO_CAVE_MOVE6")<1000) )
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINABYSS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_01"); //Questa sì che è fortuna! Sembra che questa caverna fosse usata come magazzino.
	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_02"); //Vai avanti tu, ora. Voglio essere sicuro che non troveremo sorprese sulla via del ritorno.

	B_LogEntry		(CH3_MonasteryRuin,"Abbiamo scoperto una caverna segreta. La nostra attenzione è stata catturata soprattutto da una chiave e due incantesimi.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinFollow");
};

//***************************************************************************
//	Info RUINLEAVE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVE_Condition;
	information	= Info_Gorn_RUINLEAVE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_175_MEATBUG")>15000)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEAVE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_01"); //Non sembri più tanto interessato alle rovine del monastero.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_02"); //Andrò avanti da solo.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_03"); //Seguimi, se cambi idea.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinWall");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINWALL
//***************************************************************************
INSTANCE Info_Gorn_RUINWALL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALL_Condition;
	information	= Info_Gorn_RUINWALL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWALL_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		(Npc_GetDistToWP(hero,"OW_PATH_175_GATE1")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWALL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_01"); //Dannato cancello! Dicono che nessuno sia mai riuscito ad aprirlo.
	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_02"); //Quelle bestioline sembrano le uniche che siano riuscite a entrare nel cortile interno.

	B_LogEntry		(CH3_MonasteryRuin,"Siamo di fronte a un cancello chiuso. Sembra impossibile aprirlo dall'esterno.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinWall");
};

//***************************************************************************
//	Info RUINWALLWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWALLWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALLWHAT_Condition;
	information	= Info_Gorn_RUINWALLWHAT_Info;
	important	= 0;	
	permanent	= 1;
	description = "E ora che facciamo?";
};                       

FUNC INT Info_Gorn_RUINWALLWHAT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINWALL)
	&& 		!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINWALLWHAT_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINWALLWHAT_15_01"); //E ora che facciamo?
	AI_Output (self, other,"Info_Gorn_RUINWALLWHAT_09_02"); //Devi trovare il modo di superare il cancello.
};

//***************************************************************************
//	Info RUINLEDGE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEDGE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEDGE_Condition;
	information	= Info_Gorn_RUINLEDGE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEDGE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_MONSTER_NAVIGATE_02")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEDGE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_01"); //C'è una specie di piattaforma, da quelle parti, ma sembra troppo alta per salirci sopra.
	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_02"); //Dovremo trovare un altro modo.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINPLATFORM
//***************************************************************************
INSTANCE Info_Gorn_RUINPLATFORM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINPLATFORM_Condition;
	information	= Info_Gorn_RUINPLATFORM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINPLATFORM_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_176_TEMPELFOCUS4")<300)	)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINPLATFORM_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_01"); //Sembra un qualche tipo di piedistallo.
	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_02"); //Forse il manufatto che stai cercando era tenuto qui sopra.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINGATE
//***************************************************************************
INSTANCE Info_Gorn_RUINGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINGATE_Condition;
	information	= Info_Gorn_RUINGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINGATE_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		MonasteryRuin_GateOpen																	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINGATE_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINGATE_09_01"); //Sei riuscito ad aprire il cancello! Quell'incantesimo era davvero potente.
	AI_Output			(other, self,"Info_Gorn_RUINGATE_15_02"); //Andiamo avanti.

	B_LogEntry		(CH3_MonasteryRuin,"Grazie agli incantesimi della caverna segreta, mi sono trasformato in uno scarafaggio. In questo modo, potrò passare attraverso una crepa nel muro.");
	B_LogEntry		(CH3_MonasteryRuin,"Il cancello è aperto.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"RuinFollowInside");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info RUINLEAVEINSIDE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVEINSIDE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVEINSIDE_Condition;
	information	= Info_Gorn_RUINLEAVEINSIDE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVEINSIDE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_ABYSS_CROSS_6")<1000)
	&&	!Npc_HasItems(hero, Focus_4)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINLEAVEINSIDE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //Non sembri più tanto interessato alle rovine del monastero.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //Andrò avanti da solo.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Seguimi, se cambi idea.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinStay");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINSUCCESS
//***************************************************************************
INSTANCE Info_Gorn_RUINSUCCESS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINSUCCESS_Condition;
	information	= Info_Gorn_RUINSUCCESS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINSUCCESS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		Npc_HasItems (hero, Focus_4)			)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINSUCCESS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_01"); //Hai trovato il manufatto magico!
	AI_Output 			(other, self,"Info_Gorn_RUINSUCCESS_15_02"); //Già. Devo portare questa pietra ai Maghi dell'Acqua, ora.
	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_03"); //Ti accompagnerò per un tratto.

	B_LogEntry		(CH3_MonasteryRuin,"Ho trovato la pietra focalizzatrice, in una specie di studio. Gorn mi accompagnerà ancora per un po'.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinYard");

	Wld_InsertNpc		(YoungTroll,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINTROLL
//***************************************************************************
INSTANCE Info_Gorn_RUINTROLL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINTROLL_Condition;
	information	= Info_Gorn_RUINTROLL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINTROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_SNAPPER04_SPAWN01")<1000)		)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINTROLL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_01"); //OH MERDA!!! Che razza di mostro è quello?
	AI_Output 			(other, self,"Info_Gorn_RUINTROLL_15_02"); //E da DOVE salta fuori?
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_03"); //Sembra uno di quegli invincibili troll. Solo più piccolo!
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_04"); //Comunque, se vogliamo uscire da qui, dobbiamo affrontarlo.

	AI_StopProcessInfos	(self);

	AI_DrawWeapon		(self);
	AI_SetWalkmode		(self,	NPC_RUN);
	//AI_GotoWP			(self,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINVICTORY
//***************************************************************************
INSTANCE Info_Gorn_RUINVICTORY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINVICTORY_Condition;
	information	= Info_Gorn_RUINVICTORY_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINVICTORY_Condition()
{
	var C_NPC	yTroll;
	yTroll = Hlp_GetNpc(YoungTroll);

	if	Npc_KnowsInfo(hero, Info_Gorn_RUINTROLL) 
	&&	Npc_IsDead(yTroll)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINVICTORY_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_01"); //È stata dura!
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_02"); //Già! Lo abbiamo sconfitto, ma se quello era solo un GIOVANE troll...
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_03"); //...allora sarà meglio non incontrare i suoi genitori, giusto?
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_04"); //Qualcosa del genere.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_05"); //Le nostre strade si dividono. Voglio restare qui per un po' e dare un'occhiata attorno.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_06"); //Ma sono certo che c'incontreremo ancora. Alla prossima, amico mio!

	B_LogEntry		(CH3_MonasteryRuin,"Sulla strada per il cortile del monastero, abbiamo incontrato un giovane troll. Lo scontro è stato duro, ma ce l'abbiamo fatta.");
	B_LogEntry		(CH3_MonasteryRuin,"La mia strada e quella di Gorn si separano. Sento che c'incontreremo presto.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"RuinStay");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DIEGOMILTEN
//---------------------------------------------------------------------
INSTANCE Info_Gorn_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_DIEGOMILTEN_Condition;
	information	= Info_Gorn_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ho incontrato Diego e Milten di fronte a Campo Vecchio!";
};                       

FUNC INT Info_Gorn_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_DIEGOMILTEN_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //Ho incontrato Diego e Milten di fronte a Campo Vecchio!
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //Ottimo!
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //Vogliono incontrare te e Lester al solito posto.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Grazie. In periodi difficili come questo, non c'è nulla di più prezioso degli amici.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //Oramai sei quasi uno di noi. Sei un tipo affidabile!

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

};

//---------------------------------------------------------------------
//	Info FREEMINE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FREEMINE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FREEMINE_Condition;
	information	= Info_Gorn_FREEMINE_Info;
	important	= 0;	
	permanent	= 0;
	description = "Cosa hai visto nella miniera libera?";
};                       

FUNC INT Info_Gorn_FREEMINE_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	&& !FindXardas
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FREEMINE_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_01"); //Cosa hai visto nella miniera libera?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_02"); //Al ritorno dalle rovine del monastero, volevo passare da Okyl, il capo della miniera.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_03"); //Ma quando sono arrivato c'erano cadaveri ovunque.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_04"); //Ho intravisto alcune guardie che si trinceravano all'entrata della miniera.
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_05"); //Come è possibile che così tanti mercenari si siano fatti battere da una ventina di guardie?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_06"); //A me è sembrata un'imboscata. Nessuno si sarebbe aspettato un attacco dalle montagne.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_07"); //Il fattore sorpresa aumenta la forza di un plotone.
};

//---------------------------------------------------------------------
//	Info GUARDNC
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNC (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNC_Condition;
	information	= Info_Gorn_GUARDNC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Hai un piano?";
};                       

FUNC INT Info_Gorn_GUARDNC_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNC_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_01"); //Hai un piano?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_02"); //La nostra intera strategia difensiva deve essere rivista. Ci vorrà del tempo.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_03"); //Finché Lee e i suoi uomini non saranno pronti, mi unirò alle guardie provvisorie di Cord.
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_04"); //Hai in mente di contrattaccare?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_05"); //Non ora, ma verrà il momento.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_06"); //Se dovessi aver bisogno di me, torna in questo luogo e dirigiti verso la miniera. Io sarò lì di guardia.

	B_Story_CordsPost	();

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GUARDNCRUNNING
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNCRUNNING (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNCRUNNING_Condition;
	information	= Info_Gorn_GUARDNCRUNNING_Info;
	important	= 0;	
	permanent	= 1;
	description = "Come vanno le cose?";
};                       

FUNC INT Info_Gorn_GUARDNCRUNNING_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_GUARDNC)
	&&	!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNCRUNNING_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01"); //Come va?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Tutto tranquillo. Nella miniera libera non si muove nulla.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //Lee è occupato a organizzare la difesa!
};

//---------------------------------------------------------------------
//	Info POST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_POST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_POST_Condition;
	information	= Info_Gorn_POST_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_POST_Condition()
{
	if (UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_POST_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_POST_09_01"); //Sei arrivato appena in tempo! Ci stiamo preparando al contrattacco.
	AI_Output 			(self, hero,"Info_Gorn_POST_09_02"); //Riprenderci la miniera libera non è che il primo passo.
};

//---------------------------------------------------------------------
//	Info TAKEBACK
//---------------------------------------------------------------------
INSTANCE Info_Gorn_TAKEBACK (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_TAKEBACK_Condition;
	information	= Info_Gorn_TAKEBACK_Info;
	important	= 0;	
	permanent	= 0;
	description = "Vuoi partire con soli quattro uomini? Dove sono tutti i mercenari?";
};                       

FUNC INT Info_Gorn_TAKEBACK_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_TAKEBACK_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_TAKEBACK_15_01"); //Hai intenzione di partire con soli quattro uomini? Dove sono tutti i mercenari?
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_02"); //Non possiamo attaccare frontalmente! Gli uomini di Gomez sarebbero troppo avvantaggiati!
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_03"); //Quindi dobbiamo infiltrarci di nascosto, eliminando un uomo alla volta. Così potrebbe funzionare.
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_04"); //Lee mi ha chiesto di riferirti un messaggio.

	var int guild;
	guild = Npc_GetTrueGuild(hero);
	if 		(guild == GIL_SLD)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_05"); //Essendo uno dei nostri migliori mercenari, sei stato scelto per portare a termine questa missione.
	}
	else if	(guild == GIL_KDW)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_06"); //Come mago del Circolo dell'Acqua, e combattente esperto, sei stato scelto per portare a termine questa missione.
	}
	else if (guild == GIL_ORG)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_07"); //Essendo uno dei nostri ladri migliori, sei stato scelto per portare a termine questa missione.
	}
	else
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_08"); //Sebbene tu non sia uno di noi, ci hai reso un grande servizio e hai dimostrato il tuo valore più di una volta.
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_09"); //TI offriamo la possibilità di portare a termine questa missione.
	};
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_10"); //Verrò con te. Insieme possiamo farcela!
};

//---------------------------------------------------------------------
//	Info SECOND
//---------------------------------------------------------------------
INSTANCE Info_Gorn_SECOND (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_SECOND_Condition;
	information	= Info_Gorn_SECOND_Info;
	important	= 0;	
	permanent	= 0;
	description = "Il primo passo? E quale sarà il secondo?";
};                       

FUNC INT Info_Gorn_SECOND_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_SECOND_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_01"); //Il primo passo? E quale sarà il secondo?
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_02"); //Appena la miniera sarà di nuovo nostra, ci metteremo in cerca del passaggio utilizzato dagli uomini di Gomez per attaccare!
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_03"); //Quando l'avremo chiuso, la situazione sarà di nuovo sotto controllo.
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_04"); //Capisco.
};

//---------------------------------------------------------------------
//	Info WHYME
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WHYME (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WHYME_Condition;
	information	= Info_Gorn_WHYME_Info;
	important	= 0;	
	permanent	= 0;
	description = "Perché proprio io?";
};                       

FUNC INT Info_Gorn_WHYME_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_TAKEBACK))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WHYME_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_WHYME_15_01"); //Perché proprio io?
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_02"); //Hai dimostrato più di una volta d'essere coraggioso e intelligente allo stesso tempo!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_03"); //Inoltre, conosci Campo Vecchio e le guardie meglio di tutti noi.
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_04"); //Sei l'uomo giusto per questa difficile missione!
};

//---------------------------------------------------------------------
//	Info KICKBUTT
//---------------------------------------------------------------------
INSTANCE Info_Gorn_KICKBUTT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_KICKBUTT_Condition;
	information	= Info_Gorn_KICKBUTT_Info;
	important	= 0;	
	permanent	= 0;
	description = "Va bene, andiamo a dare una lezione agli ospiti indesiderati della miniera!";
};                       

FUNC INT Info_Gorn_KICKBUTT_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_MYWAY)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_KICKBUTT_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_KICKBUTT_15_01"); //D'accordo, andiamo a dare una lezione agli ospiti indesiderati della miniera!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_02"); //Era quello che volevo sentirti dire!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_03"); //Prendi questa chiave. Apre la portineria di fronte all'ingresso della miniera.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info MYWAY
//---------------------------------------------------------------------
INSTANCE Info_Gorn_MYWAY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MYWAY_Condition;
	information	= Info_Gorn_MYWAY_Info;
	important	= 0;	
	permanent	= 0;
	description = "Perché no? Devo comunque entrare nella miniera!";
};                       

FUNC INT Info_Gorn_MYWAY_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MYWAY_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_MYWAY_15_01"); //Perché no? Devo comunque entrare nella miniera!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_02"); //Qualsiasi siano i TUOI motivi, sono felice di affrontare questa cosa insieme a te!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_03"); //Prendi questa chiave. Apre la portineria di fronte all'ingresso della miniera.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info WOLF
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WOLF (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WOLF_Condition;
	information	= Info_Gorn_WOLF_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_WOLF_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_076")<500)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WOLF_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_01"); //Oh, quasi dimenticavo!
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_02"); //Wolf il ladro vuole parlarti urgentemente, prima che partiamo per la miniera.

	Info_ClearChoices	(Info_Gorn_WOLF);
	Info_AddChoice		(Info_Gorn_WOLF,"Può attendere. Abbiamo cose più importanti da fare.",	Info_Gorn_WOLF_FM);	
	Info_AddChoice		(Info_Gorn_WOLF,"Allora farò meglio ad andare.",		Info_Gorn_WOLF_WOLF);	

	B_LogEntry			(CH4_UluMulu,"Wolf il ladro vuole parlarmi di nuovo, prima che ci rechiamo alla miniera. Devo andare a fargli visita.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_04"); //Può attendere, abbiamo cose più importanti da fare.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_05"); //Come desideri!
	AI_StopProcessInfos	(self);
};

func void Info_Gorn_WOLF_WOLF ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_06"); //Allora farò meglio ad andare.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_07"); //Fai pure, io ti aspetto qui.

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LEAVEFORPOST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_LEAVEFORPOST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_LEAVEFORPOST_Condition;
	information	= Info_Gorn_LEAVEFORPOST_Info;
	important	= 1;	
	permanent	= 1;
};                       

FUNC INT Info_Gorn_LEAVEFORPOST_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_074")<2000)
	&& (FreemineOrc_LookingUlumulu != LOG_RUNNING)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_LEAVEFORPOST_Info()
{
	AI_GotoNpc			(self, hero);

	if (Npc_KnowsInfo(hero,Info_Gorn_WOLF))
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_01"); //Sembra che tu voglia andare da Wolf!
	}
	else
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_02"); //Stai andando nella direzione sbagliata! La miniera è dall'altra parte!
	};
	AI_Output 			(self, hero,"Info_Gorn_LEAVEFORPOST_09_03"); //Ti aspetterò al posto di guardia provvisorio!

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info REJOINFORFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_REJOINFORFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_REJOINFORFM_Condition;
	information	= Info_Gorn_REJOINFORFM_Info;
	important	= 0;	
	permanent	= 1;
	description = "Andiamo alla miniera!";
};                       

FUNC INT Info_Gorn_REJOINFORFM_Condition()
{
	if 	(Npc_KnowsInfo  (hero, Info_Gorn_MYWAY) || Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT))
	&&	(Npc_GetDistToWP(hero, "OW_PATH_075_GUARD4")<1000)
	&&	(!Gorn_JoinedForFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_REJOINFORFM_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_REJOINFORFM_15_01"); //Andiamo alla miniera!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_02"); //È il momento di cacciare via le guardie!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_03"); //Vai avanti, io ti seguo!

	Gorn_JoinedForFM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"FollowToFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info RAZOR
//---------------------------------------------------------------------
INSTANCE Info_Gorn_RAZOR (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RAZOR_Condition;
	information	= Info_Gorn_RAZOR_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RAZOR_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_3000")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RAZOR_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_01"); //ATTENTO, DEGLI SQUARTATORI!!!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_02"); //Cacciano in branchi come i laceratori, ma fanno molto più male!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_03"); //Dobbiamo sbarazzarcene. Lo sai: voglio sapere cosa mi lascio alle spalle.

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMCENTRANCE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMCENTRANCE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMCENTRANCE_Condition;
	information	= Info_Gorn_FMCENTRANCE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMCENTRANCE_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "FMC_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMCENTRANCE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_01"); //Aspetta! Vedi tutti quei cadaveri?
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_02"); //Vai all'entrata della miniera. Io resto qui e mi assicuro che non ci arrivi una sorpresa da dietro.
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_03"); //Quando sarai arrivato, ti raggiungerò.

	Npc_ExchangeRoutine	(self,	"WaitFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMGATE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMGATE_Condition;
	information	= Info_Gorn_FMGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMGATE_Condition()
{
	if Gorn_JoinedForFM
	&& !FM_GateOpen
	&& (Npc_GetDistToWP(hero, "FMC_FM_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMGATE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_01"); //Ti ho sentito combattere e sono corso subito.
	AI_Output 			(hero, self,"Info_Gorn_FMGATE_15_02"); //Una vecchia questione... Ora ho saldato il conto.
	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_03"); //Bene. Apri il cancello, io ti guardo le spalle.

	Npc_ExchangeRoutine	(self,	"WaitFM");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_AFTERFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_AFTERFM_Condition;
	information	= Info_Gorn_AFTERFM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_AFTERFM_Condition()
{
	if	FreemineOrc_LookingUlumulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_AFTERFM_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_01"); //Amico, è stata una battaglia davvero dura.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_02"); //Non avrei mai pensato che le guardie di Gomez potessero essere così resistenti.
	AI_Output 			(hero, self,"Info_Gorn_AFTERFM_15_03"); //Ciò che conta è che le abbiamo cacciate dalla miniera.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_04"); //Io resterò qui e farò in modo che la situazione non cambi!

	B_Story_LeftFM		();
	
	Lee_freeminereport = 1;  //jetzt kann der SC Lee über die befreite Mine informieren.     ***Björn***

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMWATCH
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMWATCH (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMWATCH_Condition;
	information	= Info_Gorn_FMWATCH_Info;
	important	= 0;	
	permanent	= 1;
	description = "Come vanno le cose?";
};                       

FUNC INT Info_Gorn_FMWATCH_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_AFTERFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMWATCH_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FMWATCH_15_01"); //Come vanno le cose?
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_02"); //Tutto tranquillo. Nella miniera libera non si muove nulla.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_03"); //Presto arriveranno i rinforzi inviati da Lee.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_04"); //Fino ad allora, cercherò di mettermi comodo.
};


//---------------------------------------------------------------------
//	Info FOUNDULUMULU
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FOUNDULUMULU (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FOUNDULUMULU_Condition;
	information	= Info_Gorn_FOUNDULUMULU_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FOUNDULUMULU_Condition()
{
	if	(FreemineOrc_LookingUlumulu == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FOUNDULUMULU_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_01"); //Questo stendardo degli orchi è molto interessante.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_02"); //È dell'orco che era schiavo nella miniera?
	AI_Output 			(hero, self,"Info_Gorn_FOUNDULUMULU_15_03"); //È un simbolo d'amicizia degli orchi. Con questo posso entrare nella loro città.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_04"); //Spero per te che rispettino questa... COSA!

	B_Kapitelwechsel	(5);

	AI_StopProcessInfos	(self);
};








