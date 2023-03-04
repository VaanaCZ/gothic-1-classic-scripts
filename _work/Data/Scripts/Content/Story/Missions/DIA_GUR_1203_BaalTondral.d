// **************************************************
// 					Pre - EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_MuteExit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_MuteExit_Condition;
	information	= DIA_BaalTondral_MuteExit_Info;
	permanent	= 0;
	description = "Ne rien dire";
};                       

FUNC INT DIA_BaalTondral_MuteExit_Condition()
{
	if (!Npc_KnowsInfo (hero,DIA_BaalTondral_YouTalked))
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_MuteExit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_Exit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_Exit_Condition;
	information	= DIA_BaalTondral_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalTondral_Exit_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_BaalTondral_MuteExit) || Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked) )
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Fanatic Teacher
// **************************************************

INSTANCE DIA_BaalTondral_FanaticTeacher (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_FanaticTeacher_Condition;
	information	= DIA_BaalTondral_FanaticTeacher_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_BaalTondral_FanaticTeacher_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_FanaticTeacher_Info()
{
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Tu ne ressembles pas à un esclave des Barons du minerai.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //Tu ressemble plus à un chercheur - quelqu'un qui est à la recherche de la vrai foi. Tu ne sens pas comme un feu en toi qui t'empêche de dormir la nuit ?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Je comprends, tu ne crois pas que les esclaves des Barons du minerai puissent te montrer ce qui est vrai et ce qui est juste. Sais-tu pourquoi tu ne les crois pas? Parce que ce sont des menteurs !
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //Avec ces mensonges ils essayent de contrôler des esprits faibles. Mais ton esprit est plus fort que leurs mensonges !
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Ne sens-tu pas tous les jours pousser en toi un impérieux besoin de liberté ? Ne le sens-tu pas grandir de plus en plus ? Il guide ton esprit. Laisse-le faire !
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Sais-tu ce que tu fais quand tu tentes de le supprimer ? Tu renies ton âme, en te reniant toi-même ! Ne laisse pas tes peurs dominer ta vie.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Libère-toi. Tu dois comprendre ! Le Dormeur va se réveiller. Il te libérera et chassera tous ces infidèles renégats.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Comme la souillure lavée par la pluie, ils disparaîtront de ce monde. Ils auront beau gémir, se lamenter, se repentir, il sera trop tard.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Alors ils payeront le prix. Ils payeront de leur sang, et avec leurs vies.
};

// **************************************************
// 				Du hast mich angesprochen
// **************************************************

INSTANCE DIA_BaalTondral_YouTalked (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_YouTalked_Condition;
	information	= DIA_BaalTondral_YouTalked_Info;
	permanent	= 0;
	description = "Hé ! Tu m'as parlé. Est-ce que ça signifie que l'on peut discuter maintenant ?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //Hé ! Tu m'as parlé. Est-ce que ça signifie que l'on peut discuter maintenant ?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //Je vois que tu te familiarises avec nos règles. Bien.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //Je peux sentir ta grande force intérieure ! Bientôt tu auras la permission de rejoindre notre communauté.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //Je t'ai parlé pour te donner une chance de prouver ta fidélité.
};

// **************************************************
// 				Loyalität beweisen
// **************************************************
	var int BaalTondral_GetNewGuy;
// **************************************************

INSTANCE DIA_BaalTondral_Loyality (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_Loyality_Condition;
	information	= DIA_BaalTondral_Loyality_Info;
	permanent	= 0;
	description = "Comment puis-je prouver ma loyauté ?";
};                       

FUNC INT DIA_BaalTondral_Loyality_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Loyality_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //Comment puis-je prouver ma loyauté ?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //De plus, nous avons besoin de nouvelles âmes dans notre communauté.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //En recrutant un homme de plus dans notre camp, tu montreras que tu veux te rendre utile à notre communauté.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Baal Tondral m'a envoyé dans le Vieux Camp recruter un nouvel homme pour la Confrérie. Je suppose que c'est une bonne chance de gagner ses faveurs !");

	BaalTondral_GetNewGuy = LOG_RUNNING;
};

// **************************************************
// 				Wo finde ich neuen Mann
// **************************************************

INSTANCE DIA_BaalTondral_NewMember (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember_Condition;
	information	= DIA_BaalTondral_NewMember_Info;
	permanent	= 1;
	description = "Où puis-je recruter de nouveaux membres pour la Confrérie ?";
};                       

FUNC INT DIA_BaalTondral_NewMember_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //Où puis-je recruter de nouveaux membres pour la Confrérie ?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //Le Vieux camp est un bon endroit pour commencer, puisque bon nombre de gens ont en marre de la peur et des mensonges. Ils ont juste besoin d'un peu de soutien.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //Je devine que tu n'as pas eu beaucoup de réussite dans le Nouveau camp. Les hommes qui vivent là bas sont des barbares.
};

// **************************************************
// 			Wieso braucht ihr so dringend Neue
// **************************************************

INSTANCE DIA_BaalTondral_NewMember2 (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember2_Condition;
	information	= DIA_BaalTondral_NewMember2_Info;
	permanent	= 0;
	description = "Pourquoi es-tu si désespéré avec les nouveaux membres ?";
};                       

FUNC INT DIA_BaalTondral_NewMember2_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember2_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //Pourquoi es-tu si désespéré avec les nouveaux membres ?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //Le Dormeur a parlé à notre maître, révélant qu'il a un message important pour nous.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //Cependant, il n'a pas récupéré encore toute sa force. C'est pourquoi il a besoin de la NOTRE pour nous contacter.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //C'est pourquoi nous préparons une grande invocation, et plus il y aura d'hommes qui participeront, plus nous aurons de chances de réussite.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //Si tu veux en savoir plus, va à la grande cour devant la colline de temple. Mais ne dérange pas notre maître dans ses méditations !
};

// **************************************************
// 					DUSTY SUCCESS
// **************************************************

INSTANCE DIA_BaalTondral_DustySuccess (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_DustySuccess_Condition;
	information	= DIA_BaalTondral_DustySuccess_Info;
	permanent	= 0;
	description = "Il y a quelqu'un ici qui aimerai faire ta connaissance, Maître !";
};                       

FUNC INT DIA_BaalTondral_DustySuccess_Condition()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	if ( (BaalTondral_GetNewGuy == LOG_RUNNING) && (Npc_GetDistToNpc(self,dusty)<1000) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_DustySuccess_Info()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //Il y a quelqu'un ici qui aimerai faire ta connaissance, Maître !
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //Qui m'as-tu amené ? Est-il digne ?
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //Il aura certainement besoin de vos conseils spirituels, maître.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //Très bien. Dorénavant, il fera partie de mes disciples.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Tu viendras chez moi tous les jours pour écouter ma parole. Ton âme peut encore être sauvée.

	//AI_Output			(dusty,other,"DIA_BaalTondral_DustySuccess_03_05"); //Heißt das, ich bin dabei - einfach so?
	//AI_TurnToNpc		(other,dusty);
	//AI_Output			(other,NULL,"DIA_BaalTondral_DustySuccess_15_06"); //Sieht so aus. Tu einfach, was der Meister dir sagt.

	//---- Dusty vom SC lösen ----
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal löschen
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild	(dusty, GIL_NOV);
	B_ExchangeRoutine	(Vlk_524_Dusty,"PREPARERITUAL");
	
	BaalTondral_GetNewGuy = LOG_SUCCESS;
	B_LogEntry			(CH1_RecruitDusty,"Dusty est maintenant le disciple de Baal Tondral. J'ai accompli ma tache.");
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_SUCCESS);
	B_GiveXP			(XP_DeliveredDusty);
};

// **************************************************
// 					zu Kalom
// **************************************************

INSTANCE DIA_BaalTondral_SendToKalom (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_SendToKalom_Condition;
	information	= DIA_BaalTondral_SendToKalom_Info;
	permanent	= 0;
	description = "Maître ! J'aimerai joindre la Confrérie.";
};                       

FUNC INT DIA_BaalTondral_SendToKalom_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_SendToKalom_Info()
{
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //Maître ! Je voudrais rejoindre la Confrérie. J'ai besoin de vous pour parler en ma faveur.
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //Tu as prouvé ta valeur. Va chez Cor Kalom et revêt la longue robe.

	B_LogEntry(CH1_JoinPsi,"Baal Tondral me considère assez digne de porter la robe de novice !");
};








