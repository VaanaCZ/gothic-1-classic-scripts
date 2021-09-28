// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalKagan_EXIT(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 999;
	condition	= DIA_BaalKagan_EXIT_Condition;
	information	= DIA_BaalKagan_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalKagan_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalKagan_Hello(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_Hello_Condition;
	information	= DIA_BaalKagan_Hello_Info;
	permanent	= 0;
	description = "Tu provieni dalla Setta, vero?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello_15_00"); //Tu provieni dalla Setta, vero?
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_01"); //Noi la chiamiamo Fratellanza.
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_02"); //Sono Baal Kagan. Che il Dormiente sia con te!
};

// ************************************************************
// 						Warum hier
// ************************************************************

INSTANCE DIA_BaalKagan_WhyHere(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_WhyHere_Condition;
	information	= DIA_BaalKagan_WhyHere_Info;
	permanent	= 0;
	description = "Cosa stai facendo?";
};                       

FUNC INT DIA_BaalKagan_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WhyHere_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WhyHere_15_00"); //Cosa stai facendo?
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //All'inizio ero venuto qui per convincere la gente a unirsi alla Fratellanza.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //Ma questi barbari non sono interessati alla salvezza dello spirito, quindi mi limito a vendere erba di palude.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //È un lavoro molto popolare da queste parti. Anche troppo. Riesco a malapena a soddisfare le richieste.

	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Baal Kagan vende erba ai ladri e ai mercenari di Campo Nuovo.");
};

// ************************************************************
// 						TRADE
// ************************************************************

INSTANCE DIA_BaalKagan_TRADE (C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 800;
	condition	= DIA_BaalKagan_TRADE_Condition;
	information	= DIA_BaalKagan_TRADE_Info;
	permanent	= 1;
	description = "Mostrami la merce.";
	trade		= 1;
};                       

FUNC INT DIA_BaalKagan_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_TRADE_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //Mostrami la merce.
	AI_Output			(self, other,"DIA_BaalKagan_TRADE_13_01"); //Come desideri.
};

// ************************************************************
// 						Hilfe anfordern
// ************************************************************

INSTANCE DIA_BaalKagan_OrderHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 2;
	condition	= DIA_BaalKagan_OrderHelp_Condition;
	information	= DIA_BaalKagan_OrderHelp_Info;
	permanent	= 0;
	description = "Perché non mandano qualcuno ad aiutarti?";
};                       

FUNC INT DIA_BaalKagan_OrderHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_OrderHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp_15_00"); //Perché non mandano qualcuno ad aiutarti?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_01"); //Doveva pensarci Baal Isidro, ma passa tutto il giorno alla taverna sul lago, scambiando la sua erba con grappa di riso.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_02"); //È un alcolizzato: non mi aspetto alcun aiuto da parte sua.
	
	if (Lares_Get400Ore == LOG_RUNNING)
	{
		Log_CreateTopic		(CH1_DealerJob,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_DealerJob,	LOG_RUNNING);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro passa tutto il giorno a bere nel bar sul lago.");	
	};
};

// ************************************************************
// 					Ich könnte dir helfen
// ************************************************************

INSTANCE DIA_BaalKagan_WannaHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WannaHelp_Condition;
	information	= DIA_BaalKagan_WannaHelp_Info;
	permanent	= 0;
	description = "Posso aiutarti a vendere l'erba alla gente.";
};                       

FUNC INT DIA_BaalKagan_WannaHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_OrderHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WannaHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_00"); //Posso aiutarti a vendere l'erba alla gente.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_01"); //Posso fidarmi solo degli appartenenti alla Fratellanza.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_02"); //Ma potresti aiutarmi a consegnare dei campioni omaggio.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_03"); //Non tutti hanno provato la mia merce e, quando l'avranno fatto, ne vorranno ancora. Questo significa che ne venderò di più.
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_04"); //Pensavo che riuscissi a malapena a gestire la clientela.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_05"); //Presto Baal Isidro sarà messo in riga. Ho già inviato un messaggio a Cor Kalom.
};

// ************************************************************
// 						Was ist drin?
// ************************************************************

INSTANCE DIA_BaalKagan_WasDrin(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WasDrin_Condition;
	information	= DIA_BaalKagan_WasDrin_Info;
	permanent	= 0;
	description = "Cosa otterrò, aiutandoti a smerciare l'erba?";
};                       

FUNC INT DIA_BaalKagan_WasDrin_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WasDrin_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WasDrin_15_00"); //Cosa otterrò aiutandoti a smerciare l'erba?
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_01"); //Posso ricompensarti in molti modi.
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_02"); //Puoi avere degli incantesimi nei quali è contenuta la potente magia del Dormiente.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_03"); //Oppure posso aiutarti a entrare a far parte della nostra comunità, se è ciò che desideri. Sono in ottimi rapporti con Cor Kalom e Baal Tyon.
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_04"); //Entrambi sono molto vicini a Y'Berion, il nostro capo.
	};
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_05"); //Se preferisci, posso pagarti in metallo. 100 pezzi saranno sufficienti come ricompensa per il tuo lavoro.
};

// ************************************************************
// 						Gib mir Kraut
// ************************************************************
	var int BaalKAgan_VerteilKraut;
// ************************************************************

INSTANCE DIA_BaalKagan_GimmeKraut(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_GimmeKraut_Condition;
	information	= DIA_BaalKagan_GimmeKraut_Info;
	permanent	= 0;
	description = "D'accordo, dammi l'erba. A chi devo consegnarla?";
};                       

FUNC INT DIA_BaalKagan_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WasDrin))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_00"); //D'accordo, dammi l'erba. A chi devo consegnarla?
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_01"); //Troverai di certo qualcuno che la vorrà. Parla con la gente. Ricorda: UNA SOLA pianta per ogni persona.
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_02"); //Ancora una cosa: se ti fai derubare o ne fai uso personale, il nostro accordo cesserà immediatamente.
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_03"); //Va bene.
	BaalKagan_VerteilKraut = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_SpreadJoints, LOG_MISSION);
	Log_SetTopicStatus	(CH1_SpreadJoints, LOG_RUNNING);
	B_LogEntry			(CH1_SpreadJoints,"Baal Kagan il novizio mi ha dato 10 piante di 'Verde del Novizio', da distribuire a Campo Nuovo.");		
	
	CreateInvItems		(self, itmijoint_1, 10);
	B_GiveInvItems      (self, hero, itmijoint_1, 10);
};

// ************************************************************
// 						SUCCESS
// ************************************************************

INSTANCE DIA_BaalKagan_SUCCESS(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_SUCCESS_Condition;
	information	= DIA_BaalKagan_SUCCESS_Info;
	permanent	= 1;
	description = "Ho distribuito l'erba.";
};                       

FUNC INT DIA_BaalKagan_SUCCESS_Condition()
{
	if (BaalKagan_VerteilKraut==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_SUCCESS_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_15_00"); //Ho distribuito l'erba.
	if (NC_Joints_verteilt >= 8)
	{
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_01"); //I primi clienti nuovi sono già venuti da me. Hai fatto un buon lavoro.
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_02"); //Cosa desideri come ricompensa?
		
		Info_ClearChoices(DIA_BaalKagan_SUCCESS);
		Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Prenderò il metallo.",DIA_BaalKagan_SUCCESS_Erz);
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Info_AddChoice(DIA_BaalKagan_SUCCESS,"Aiutami a entrare nella Fratellanza.",DIA_BaalKagan_SUCCESS_Join);
		};
		Info_AddChoice	 (DIA_BaalKagan_SUCCESS,"Questi incantesimi sono molto interessanti: di che tipo sono?",DIA_BaalKagan_SUCCESS_WhatSpells);
		
		BaalKagan_VerteilKraut = LOG_SUCCESS;
		Log_SetTopicStatus	(CH1_SpreadJoints, LOG_SUCCESS);
    	B_LogEntry			(CH1_SpreadJoints,"Baal Kagan ha nuovi clienti e io ho ottenuto la mia ricompensa.");
		B_GiveXP			(XP_DistributedWeedForKagan);
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //Ancora non ho visto nemmeno un cliente nuovo. Distribuiscine ancora.
	};
};

func void DIA_BaalKagan_SUCCESS_WhatSpells()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //Questi incantesimi sono molto interessanti: di che tipo sono?
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //Colpo di vento, Carisma, Telecinesi, Pirocinesi e Sonno. Puoi prenderne tre.
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Prenderò i tre incantesimi.",DIA_BaalKagan_SUCCESS_TakeScrolls);
};

func void DIA_BaalKagan_SUCCESS_Join()
{
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Aiutami a entrare nella Fratellanza.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Non chiedi molto, ti aiuterò. Ascolta: Baal Tyon è uno dei guru meno potenti, come me.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Y'Berion l'ha eletto suo consigliere, ma è stato un errore.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //Ora crede di essere così importante che parla solo coi suoi discepoli.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //Se gli darai questo, gli si scioglierà la lingua.
	CreateInvItem       (self, SpecialJoint);
	B_GiveInvItems		(self, other, SpecialJoint, 1);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Baal Kagan mi ha consegnato della speciale 'EVOCASOGNI' per Baal Tyon. Mi aiuterà a entrare nella Fratellanza.");
};

func void DIA_BaalKagan_SUCCESS_Erz()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //Prenderò i 100 pezzi di metallo.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //Molto bene. Eccoli...
	
	CreateInvItems		(self, itminugget, 100);
	B_GiveInvItems      (self, other, itminugget, 100);
	Info_ClearChoices	(DIA_BaalKagan_SUCCESS);
};

//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //Prenderò gli incantesimi.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //Saggia decisione. Scegline tre.
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Pugno di Vento",DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Telecinesi",DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Pirocinesi",DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Sonno",DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Carisma",DIA_BaalKagan_SUCCESS_TakeScrolls_Charme);
};
//-----------------------------------------------------------------------
	var int BaalKagan_drei;
//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust()
{
	CreateInvItem(self, ItArScrollWindfist);
	B_GiveInvItems(self, hero, ItArScrollWindfist, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //E sono tre. Usali con saggezza.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese()
{
	CreateInvItem(self, ItArScrollTelekinesis);
	B_GiveInvItems(self, hero, ItArScrollTelekinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //E sono tre. Usali con saggezza.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese()
{
	CreateInvItem(self, ItArScrollPyrokinesis);
	B_GiveInvItems(self, hero, ItArScrollPyrokinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //E sono tre. Usali con saggezza.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf()
{
	CreateInvItem(self, ItArScrollSleep);
	B_GiveInvItems(self, hero, ItArScrollSleep, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //E sono tre. Usali con saggezza.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Charme()
{
	CreateInvItem(self, ItArScrollCharm);
	B_GiveInvItems(self, hero, ItArScrollCharm, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //E sono tre. Usali con saggezza.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};







	
	
	
	
	




