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
	description = "Tu es de la camp de la Secte, n'est-ce pas ?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello_15_00"); //Tu es de la camp de la Secte, n'est-ce pas ?
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_01"); //Nous l'appelons la Confrérie.
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_02"); //Je m'appelle Baal Kagan. Le Dormeur soit avec toi.
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
	description = "Que fais-tu ici ?";
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
	AI_Output			(other, self,"DIA_BaalKagan_WhyHere_15_00"); //Que fais-tu ici ?
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //Au départ, j'ai été envoyé ici pour convaincre des personnes de rejoindre notre Confrérie.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //Mais ces barbares ne sont pas intéressés par l'épanouissement spirituel. Ce qui fait que je me suis limité au commerce d'Herbe de marais.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //Et c'est un métier apprécié ici. Très apprécié. J'ai de la peine à satisfaire à la demande.

	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Baal Kagan vend des tiges d'Herbe aux bandits et aux mercenaires du Nouveau Camp.");
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
	description = "Montre moi tes marchandises.";
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
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //Montre moi tes marchandises.
	AI_Output			(self, other,"DIA_BaalKagan_TRADE_13_01"); //Comme tu veux.
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
	description = "Pourquoi ils n'envoient pas à un homme supplémentaire ?";
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
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp_15_00"); //Pourquoi ils n'envoient pas à un homme supplémentaire ?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_01"); //Baal Isidro est censé m'aider, mais il ne fait que passer son temps à la taverne du lac et échanger son Herbe contre de l'alcool de riz.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_02"); //Il est alcoolique. Je crains qu'il ne puisse plus ne m'être d'aucun secours
	
	if (Lares_Get400Ore == LOG_RUNNING)
	{
		Log_CreateTopic		(CH1_DealerJob,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_DealerJob,	LOG_RUNNING);
	    B_LogEntry			(CH1_DealerJob,"Baal Isidro est assis à la taverne du lac et boit toute la journée.");	
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
	description = "Je peux t'aider à vendre ton Herbe aux gens .";
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
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_00"); //Je peux t'aider à vendre ton Herbe aux gens .
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_01"); //Je ne peux confier une si grande quantité d'Herbe qu'aux seuls membres de la Confrérie.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_02"); //Mais tu pourrais m'aider à distribuer les cadeaux.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_03"); //Tout le monde n'a pas encore goûté ma marchandise. Dès qu'ils essayeront l'Herbe, ils en voudront plus, ce qui signifie pour moi en vendre plus.
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_04"); //Je pensais que tu pouvais à peine accomplir ta tâche maintenant.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_05"); //On prendra soin de Baal Isidro bientôt. J'ai déjà envoyé un message à Cor Kalom.
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
	description = "Qu'est-ce que j'obtiens si je vends de l'Herbe pour toi ?";
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
	AI_Output			(other, self,"DIA_BaalKagan_WasDrin_15_00"); //Qu'est-ce que j'obtiens si je vends de l'Herbe pour toi ?
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_01"); //J'ai beaucoup de solutions pour te récompenser.
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_02"); //Je peux t'offrir des parchemins, renforçant la puissante magie du Dormeur.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_03"); //Ou je peux t'aider à rejoindre notre communauté, si c'est ce que tu veux. J'ai de très bons contacts avec Cor Kalom et Baal Tyon.
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_04"); //Tous les deux sont très proches d'Y'Bérion, notre maître.
	};
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_05"); //Si tu préfères je peux te payer aussi avec du simple minerai . Dans ce cas, 100 pépites devraient être suffisantes pour tes efforts.
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
	description = "Bien, donne-moi l'Herbe. A qui veux-tu que je la redonne ?";
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
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_00"); //Bien, donne-moi l'Herbe. A qui veux-tu que je la redonne ?
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_01"); //Tu es sûr de trouver quelqu'un qui te le prendra. Parle aux gens. Mais donne seulement UNE tige par personne.
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_02"); //Encore une chose : si tu laisses quelqu'un prendre ton Herbe ou si tu la fumes toi-même, notre affaire s'arrête.
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_03"); //D'accord
	BaalKagan_VerteilKraut = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_SpreadJoints, LOG_MISSION);
	Log_SetTopicStatus	(CH1_SpreadJoints, LOG_RUNNING);
	B_LogEntry			(CH1_SpreadJoints,"Le novice Baal Kagan m'a donné 10 tiges d'Herbe de Novice Vert, que je dois distribuer dans le Nouveau Camp.");		
	
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
	description = "J'ai partagé l'Herbe.";
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
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_15_00"); //J'ai partagé l'Herbe.
	if (NC_Joints_verteilt >= 8)
	{
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_01"); //Les premiers nouveaux clients sont déjà venus me voir. Tu as bien travaillé.
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_02"); //Que m'offres-tu comme récompense ?
		
		Info_ClearChoices(DIA_BaalKagan_SUCCESS);
		Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Je prend le minerai.",DIA_BaalKagan_SUCCESS_Erz);
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Info_AddChoice(DIA_BaalKagan_SUCCESS,"Aide-moi à rejoindre la Confrérie.",DIA_BaalKagan_SUCCESS_Join);
		};
		Info_AddChoice	 (DIA_BaalKagan_SUCCESS,"Ces parchemins de sortilège sont tout à fait intéressants - quel genre de sort est-ce ?",DIA_BaalKagan_SUCCESS_WhatSpells);
		
		BaalKagan_VerteilKraut = LOG_SUCCESS;
		Log_SetTopicStatus	(CH1_SpreadJoints, LOG_SUCCESS);
    	B_LogEntry			(CH1_SpreadJoints,"Baal Kagan a de nouveaux clients et j'ai ma récompense.");
		B_GiveXP			(XP_DistributedWeedForKagan);
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //Je n'ai vu encore aucun nouveau client. Distribue encore plus.
	};
};

func void DIA_BaalKagan_SUCCESS_WhatSpells()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //Ces parchemins de sortilège sont tout à fait intéressants - quel genre de sort est-ce ?
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //Poing de Vent, Charme, Télékinésie, Pyrokinésie, Sommeil. Parmi ces sorts, choisis en 3.
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Je prendrai les trois parchemins de sortilège.",DIA_BaalKagan_SUCCESS_TakeScrolls);
};

func void DIA_BaalKagan_SUCCESS_Join()
{
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Aide-moi à rejoindre la Confrérie.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Ton souhait est modeste. Je t'aiderai, alors écoute-moi. Baal Tyon est l'un des Sages inférieurs - juste comme moi.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Y'Bérion lui a fait un de ses conseillers. Cela ne l'a pas fait de bien.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //Il pense maintenant qu'il est si important qu'il parle plus à personne sauf à ses disciples.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //Si tu lui donnes ceci, ça va lui délier la langue.
	CreateInvItem       (self, SpecialJoint);
	B_GiveInvItems		(self, other, SpecialJoint, 1);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"'''Baal Kagan m'a donné un ''''appel de rêve'''' spécial pour Baal Tyon. Cela m'aidera à rejoindre la Confrérie de la secte.'''");
};

func void DIA_BaalKagan_SUCCESS_Erz()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //Je prendrai les 100 minerais.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //Très bien. Ici.
	
	CreateInvItems		(self, itminugget, 100);
	B_GiveInvItems      (self, other, itminugget, 100);
	Info_ClearChoices	(DIA_BaalKagan_SUCCESS);
};

//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //Je prendrai les parchemins.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //Une bonne décision. Choisis-en 3.
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Poing du Vent",DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Télékinésie",DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Pyrokinésie",DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Torpeur",DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Charme",DIA_BaalKagan_SUCCESS_TakeScrolls_Charme);
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //C'était les trois. Utilise-les avec sagesse.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //C'était les trois. Utilise-les avec sagesse.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //C'était les trois. Utilise-les avec sagesse.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //C'était les trois. Utilise-les avec sagesse.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //C'était les trois. Utilise-les avec sagesse.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};







	
	
	
	
	




