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
		AI_Output (self, other,"Info_Gorn_EXIT_09_01"); //En garde !
	}
	else
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_02"); //Je te verrais plus tard.
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
	AI_Output (self, other,"DIA_Gorn_First_09_00"); //Hé. Un nouveau visage.
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //Qui es-tu ?
	AI_Output (self, other,"DIA_Gorn_First_09_02"); //Je m'appelle Gorn, mercenaire des magiciens.
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
	description		= "Que dois-tu faire en tant que mercenaire des magiciens ?";
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
	AI_Output (other, self,"DIA_Gorn_Leben_15_00"); //Que dois-tu faire en tant que mercenaire des magiciens ?
	AI_Output (self, other,"DIA_Gorn_Leben_09_01"); //Lee a traité avec les magiciens. Il loue les meilleurs combattants de la colonie. 
	AI_Output (self, other,"DIA_Gorn_Leben_09_02"); //Nous faisons attention à ce que les gratteurs extraient le minerai sans faire d'ennuis et en restant loin des magiciens.
	AI_Output (self, other,"DIA_Gorn_Leben_09_03"); //Les magiciens s'assurent que nous sortirons de là. Et nous avons une petite part du minerai comme salaire.
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
	description		= "Puis-je rester quelque part ici ?";
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
	AI_Output (other, self,"DIA_Gorn_Hut_15_00"); //Est-ce que je peux rester quelque part ici sans être obligé de sortir quelqu'un de sa cabane en lui bottant les fesses ?
	AI_Output (self, other,"DIA_Gorn_Hut_09_01"); //Je ne pense pas comme ça. Mais si est vraiment ce que tu veux faire, va voir Shrike.
	AI_Output (self, other,"DIA_Gorn_Hut_09_02"); //Il a pris la cabane devant, à l'entrée à la caverne. Elle était vide - mais en réalité elle nous appartient.
	AI_Output (other, self,"DIA_Gorn_Hut_15_03"); //Nous ?
	AI_Output (self, other,"DIA_Gorn_Hut_09_04"); //Et bien, nous, les mercenaires. ici, les mercenaires et les bandits vivent séparément. Et personne appartenant à la troupe de Lares ne devrait être ici, de ce côté-ci du grand trou.
	AI_Output (self, other,"DIA_Gorn_Hut_09_05"); //Il ne fait pas vraiment beaucoup de différence. Mais il n'a pas demandé. Et tu ne peux pas laisser ces bandits partir avec tout, parce qu'alors ils deviennent trop sûr d'eux !

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,"Gorn, le mercenaire, m'a dit que Shrike avait pris une cabane des mercenaires sans demander. Puisque j'ai demandé à Gorn, aucun des mercenaires ne s'immiscera si je peux 'convaincre' Shrike d'obtenir une autre cabane.");
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
	description		= "Shrike s'est déplacé vers une autre cabane.";
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
	AI_Output			(other, self,"DIA_Gorn_HutFree_15_00"); //Shrike s'est déplacé vers une autre cabane.
	AI_Output			(self, other,"DIA_Gorn_HutFree_09_01"); //Bon. Torlof m'a juste indiqué qu'il voulait parler avec ce type.

	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_SUCCESS);
	B_LogEntry			(CH1_ShrikesHut,"Gorn a vraiment été amusé lorsque j'ai donné un coup de pied au cul à Shrike. Je pense qu'il est un type honnête. Dur, mais respectable. Je dois persévérer.");
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
	description		= "Que dois-je faire pour rejoindre le Nouveau Camp ? ";
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
	AI_Output (other, self,"DIA_Gorn_BecomeSLD_15_00"); //Que dois-je faire pour rejoindre le Nouveau Camp ? 
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_01"); //Avant que Lee ne t'admette, tu devras améliorer tes compétences de combat. Quelle que soit l'arme utilisée, tu dois être bon.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_02"); //En outre, tu devras acquérir beaucoup d'expérience de la vie ici,  et de tout le reste.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_03"); //Si tu ne veux pas aller dans les autres camps, tu devrais essayer de rejoindre les bandits avant de commencer en tant que mercenaire.
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
	AI_Output (other, self,"DIA_Gorn_TRADE_15_00"); //As-tu encore plus de cette marchandise ?
	AI_Output (self, other,"DIA_Gorn_TRADE_09_01"); //Plein. Tu veux échanger ?
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
	description		= "Pourquoi as-tu participé à un des raids du gang ? ";
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
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_00"); //Pourquoi as-tu participé à un des raids du gang ? 
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_01"); //Qui a dit que je le voulais ?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_02"); //Pourquoi aurais-tu tellement de marchandise si ce n'était pas vrai ?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_03"); //Tu ne penses pas que c'est la quantité d'UN seul transport.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_04"); //Tu participes aux raids régulièrement ?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_05"); //Si je le faisais, je ne te le dirais pas. Lee ne voudrait pas faire qu'un peu.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_06"); //Je vois.
	
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

	AI_Output (self, other,"Info_Gorn_NCWAIT_09_01"); //Ahh, c'est toi ! Mon ami Lester du camp Marécageux m'a raconté tout ce que tu as fait ici.
	AI_Output (self, other,"Info_Gorn_NCWAIT_09_02"); //Pour quelqu'un qui n'est pas là depuis longtemps, c'est remarquable.
	AI_Output (other, self,"Info_Gorn_NCWAIT_15_03"); //J'ai été plusieurs fois à deux doigts d'être bouffé par les vers, moi aussi.
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
	description	= "J'ai un message important pour les Magiciens de l'Eau !";
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
	AI_Output (other, self,"Info_Gorn_MAGES_15_01"); //J'ai un message important pour les Magiciens de l'Eau !
	AI_Output (self, other,"Info_Gorn_MAGES_09_02"); //Alors tu devrais parler à Saturas. Il est le plus grand des Mages de l'Eau et passe tout son temps à étudier certaines écritures ou quelque chose comme ça.
	AI_Output (self, other,"Info_Gorn_MAGES_09_03"); //Mais quel que soit l'importance de ton message, les gardes du niveau supérieur ne te laisserait pas t'approcher de lui.
	AI_Output (other, self,"Info_Gorn_MAGES_15_04"); //Ne peux-tu pas mettre un mot pour moi ?
	AI_Output (self, other,"Info_Gorn_MAGES_09_05"); //Je ne peux pas, mais Cronos, le gardien du minerai, pourrait te donner l'autorisation.
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
	description	= "Où puis-je trouver ce ' gardien du minerai' ? ";
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
	AI_Output			(other, self,"Info_Gorn_CRONOS_15_01"); //Où puis-je trouver ce ' gardien du minerai' ? 
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_01a");//Si tu part d'ici, tu trouveras la grande caverne derrière la digue.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_02"); //D'habitude, Cronos est à la grille au-dessus du grand tas de minerai.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_03"); //Mais il est un peu arrogant. Tu devras le convaincre que ton message est important.

	VAR C_NPC Cronos;
	Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	
	B_LogEntry		(CH3_EscapePlanNC,"Gorn m'a recommandé d'aller directement au Grand Magicien de l'Eau, qui s'appelle Saturas. Cronos, le gardien du minerai, peut m'obtenir une audience. Cronos doit être au centre du Camp, à la grille au-dessus du tas de minerai."); 

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

	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_01"); //Bonjour, blanc-bec. Comme tu peux le voir, la colonie est toute petite.
	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_02"); //Tu ne peux t' empêcher de te cogner tout le temps avec d'autres personnes.
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
	description = "Que fais-tu ici ?";
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
	AI_Output 		(other, self,"Info_Gorn_RUINWHAT_15_01"); //Que fais-tu ici ?
	AI_Output		(self, other,"Info_Gorn_RUINWHAT_09_02"); //Ah, j'essaye de dépister une vieille légende.
	AI_Output		(other, self,"Info_Gorn_RUINWHAT_15_03"); //Une légende ?
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_04"); //Oui, Milten, mon copain du Vieux camp, me dit que les moines avaient l'habitude de vivre ici.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_05"); //Naturellement, c'était longtemps avant que la barrière n'ait été créée.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_06"); //Il est dit qu'ils ont adoré un dieu qui leur a donné le pouvoir de se transformer en animaux.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_07"); //Je suis sûr qu'il y a des trésors des anciens temps qui dorment ici.

	if (!Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS))
	{	
		AI_Output	(self, other,"Info_Gorn_RUINWHAT_09_08"); //Que rapportes-tu ici ?
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
	description = "Je cherche une pierre focale magique.";
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
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_01"); //Je cherche une pierre focale magique.
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_02"); //Il doit être quelque part dans ce coin.
	AI_Output (self, other,"Info_Gorn_RUINFOCUS_09_03"); //La chose que tu cherches pourrait être dans le vieux monastère en ruine au delà de la gorge.
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
	description = "Nous pouvons continuer ensemble.";
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
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_01"); //Nous pouvons continuer ensemble.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_02"); //Bonne idée. Ce coin est gardé par des claque-machoîres.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_03"); //Quand ils sont tout seuls, ils ne posent pas de problème pour un chasseur expérimenté. La majeure partie du temps ils chassent en bande.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_04"); //Une bande peut déchiqueter un guerrier muni d'une épée, même le plus intelligent.
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_05"); //Alors nous irons ensemble ?
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_06"); //D'accord, mais avant que nous croisions cette bande, j'aimerais examiner cette gorge. J'aime savoir qui est dans mon dos.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_07"); //Viens avec moi, j'ai découvert un chemin qui nous y emmènera.

	Log_CreateTopic		(CH3_MonasteryRuin,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_RUNNING);
	B_LogEntry			(CH3_MonasteryRuin,"Quand je me suis approché du monastère en ruine, j'ai rencontré le mercenaire Gorn. Il doit fouiller dans les ruines pour de vieux trésors.");
	B_LogEntry			(CH3_MonasteryRuin,"Nous continuerons notre recherche ensemble. Gorn m'a averti des grands troupeaux de claque-machoires dans le secteur.");

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

	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_01"); //C'est ce que j'appelle la chance. Visiblement ceci était une caverne servant d'entrepôt.
	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_02"); //Pourquoi ne passes-tu pas en tête maintenant, j'ai juste voulu m'assurer que nous n'aurons pas de surprises lors de notre voyage de retour.

	B_LogEntry		(CH3_MonasteryRuin,"Nous avons découvert une caverne secrète de provision . En plus, une clef et deux parchemin de sortilège se sont avérés être tout à fait intéressants.");

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

	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_01"); //Tu sembles avoir perdu tout intérêt pour le monastère en ruine.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_02"); //Je continuerai tout seul.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_03"); //Suis-moi si tu changes d'avis.

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

	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_01"); //Cette fichue porte. Ils disent que personne dans la colonie n'a jamais pu l'ouvrir.
	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_02"); //Les petites bêtes là-bas semblent être les seules qui sont parvenues à entrer dans la cour intérieure.

	B_LogEntry		(CH3_MonasteryRuin,"Nous sommes devant une grille fermée. Il me semble qu'elle ne peut pas être ouverte de l'extérieur.");

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
	description = "Que se passe t'il maintenant ?";
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
	AI_Output (other, self,"Info_Gorn_RUINWALLWHAT_15_01"); //Que se passe t'il maintenant ?
	AI_Output (self, other,"Info_Gorn_RUINWALLWHAT_09_02"); //Tu dois trouver une solution pour passer de l'autre côté de la porte.
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

	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_01"); //Il y a une sorte de plateforme vers le haut. Mais elle semble être trop haute pour pouvoir y grimper.
	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_02"); //Nous devrons trouver une autre solution.

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

	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_01"); //Faire comme un piédestal en quelque sorte.
	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_02"); //Peut-être que l'artefact que tu recherches reposait ici.

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

	AI_Output			(self, other,"Info_Gorn_RUINGATE_09_01"); //Tu es parvenu quand même à ouvrir la porte. Ce sort était vraiment intelligent.
	AI_Output			(other, self,"Info_Gorn_RUINGATE_15_02"); //Allons-y, avançons dessus.

	B_LogEntry		(CH3_MonasteryRuin,"À l'aide du sortilège trouvé dans la caverne de provision, je me suis transformé en insecte. J'ai été alors capable, de ramper à l'intérieur par un trou dans le mur.");
	B_LogEntry		(CH3_MonasteryRuin,"La porte est maintenant ouverte.");

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

	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //Tu sembles avoir perdu tout intérêt pour le monastère en ruine.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //Je continuerai tout seul.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Suis-moi si tu changes d'avis.

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

	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_01"); //Ainsi tu as trouvé ton artefact magique !
	AI_Output 			(other, self,"Info_Gorn_RUINSUCCESS_15_02"); //Ouais. Je dois donner la pierre focale aux Magiciens de l'Eau. Ils en ont besoin.
	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_03"); //Je t'accompagnerai pendant un moment.

	B_LogEntry		(CH3_MonasteryRuin,"J'ai trouvé les pierres focales dans une sorte de pièce d'étude. Gorn m'accompagnera encore un peu.");

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

	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_01"); //ENFER ! ! ! Quel est ce monstre là-bas ?
	AI_Output 			(other, self,"Info_Gorn_RUINTROLL_15_02"); //D’où vient-il ?
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_03"); //ça ressemble à un de ces trolls pratiquement invincibles. En plus petit !
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_04"); //Si nous voulons sortir d'ici, nous devrons lui passer dessus.

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

	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_01"); //C'était difficile.
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_02"); //Ouais, nous avons défait ce monstre. Mais parce que c'était juste un jeune troll...
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_03"); //... alors il valait mieux ne pas rencontrer ses parents, hein ?
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_04"); //Quelque chose comme ça.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_05"); //C'est ici que nos chemins se séparent. Je vais rester ici un moment et explorer le coin.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_06"); //Mais je suis sûr que nous nous rencontrerons encore. A bientôt, mon ami.

	B_LogEntry		(CH3_MonasteryRuin,"A l'arrière de la cour du monastère, nous avons rencontré un jeune Troll. C'était un rude combat, mais nous avons gagné.");
	B_LogEntry		(CH3_MonasteryRuin,"Nos chemins se séparent avec Gorn. J'ai le sentiment que je le rencontrerai de nouveau.");

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
	description = "J'ai rencontré Diego et Milten devant le Vieux Camp !";
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
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //J'ai rencontré Diego et Milten devant le Vieux Camp !
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //Voilà de bonnes nouvelles !
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //Ils veulent te rencontrer ainsi que Lester. Au point de rendez-vous habituel.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Merci. Il n'y a rien de meilleur que d'avoir de bons amis dans de telles périodes troubles.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //Tu es presque l'un de nous maintenant. Tu es digne de confiance !

	B_GiveXP			(XP_MessageForGorn);
	
	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else 
	{
		B_LogEntry			(CH4_4Friends,		"J'ai informé Lester et Gorn de la réunion avec leurs amis. Maintenant, ce n'est plus mon affaire. Ils sauront quoi faire ensuite..."); 
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
	description = "Qu'as-tu vu dans la mine Libérée ?";
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
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_01"); //Qu'as-tu vu dans la mine Libérée ?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_02"); //Après que je sois retourné dans le monastère en ruine, j'ai voulu faire un saut chez Okyl, le patron de la mine Libre.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_03"); //Mais quand je suis arrivé, il y avait des cadavres partout.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_04"); //J'ai juste remarqué quelques gardes retranchés à l'entrée à la mine.
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_05"); //Comment se fait-il que tant de mercenaires soient battus par seulement deux douzaines de gardes ?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_06"); //Pour moi, ça ressemblait à une embuscade. Personne ne s'est attendu à ce que les attaquants traversent les montagnes.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_07"); //L'effet de surprise peut multiplier la force d'une troupe.
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
	description = "Qu'as-tu projeté maintenant ?";
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
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_01"); //Qu'as-tu projeté maintenant ?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_02"); //Toute notre stratégie de défense est à revoir. Cela prendra du temps.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_03"); //Avant que Lee et à sa bande soient prêts, je rejoindrai la garde provisoire de Cord.
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_04"); //As-tu envisagé une contre-attaque ?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_05"); //Pas encore, mais le jour viendra.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_06"); //Si jamais tu me cherches, commence ici et marche vers la mine. Je serai de garde.

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
	description = "Comment va ?";
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
	AI_Output 			(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01"); //Comment va ?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Tout est calme. Rien ne se bouge dans la mine Libre.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //Lee est encore occupé à organiser notre défense !
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

	AI_Output 			(self, hero,"Info_Gorn_POST_09_01"); //Tu arrives juste à temps ! Nous préparons notre contre-attaque.
	AI_Output 			(self, hero,"Info_Gorn_POST_09_02"); //Reprendre la mine Libre est la première étape.
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
	description = "Tu projettes de la reprendre avec juste quatre hommes ?";
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
	AI_Output 			(hero, self,"Info_Gorn_TAKEBACK_15_01"); //Tu envisages de la reprendre avec seulement quatre amis ? Où sont passés tous les mercenaires ?
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_02"); //Une attaque frontale n'est pas la bonne solution ! Les gens de Gomez sont trop bon pour être délogés de cette façon !
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_03"); //Mais nous pourrions faire des actions furtives, éliminant un homme après l'autre. ça pourrait marcher.
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_04"); //Lee m'a confié un message pour toi.

	var int guild;
	guild = Npc_GetTrueGuild(hero);
	if 		(guild == GIL_SLD)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_05"); //En tant que l'un de nos meilleurs mercenaires, tu as été choisi pour mener à bien cette mission.
	}
	else if	(guild == GIL_KDW)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_06"); //En tant que Magicien du Cercle de l'Eau et combattant expérimenté, tu as été choisi pour mener à bien cette mission.
	}
	else if (guild == GIL_ORG)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_07"); //En tant qu'un de nos meilleurs bandits, tu as été choisi pour mener à bien cette mission !
	}
	else
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_08"); //Bien que tu ne sois pas l'un de nous, tu as rendu à notre camp un grand service et tu as prouvé ta valeur plus d'une fois.
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_09"); //Nous t'offrons la chance de mener à bien cette mission !
	};
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_10"); //J'irai avec toi. Ensemble nous pouvons réussir !
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
	description = "La première étape ? Qu'elle sera la deuxième ?";
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
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_01"); //La première étape ? Qu'elle sera la deuxième ?
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_02"); //Dès que la mine sera reprise, nous chercherons le passage dans la montagne que les gens de Gomez ont utilisé pour leurs incursions !
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_03"); //Quand ce passage sera fermé, nous contrôlerons de nouveau la situation.
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_04"); //Je vois.
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
	description = "Pourquoi moi, parmi tous les gens ?";
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
	AI_Output 			(hero, self,"Info_Gorn_WHYME_15_01"); //Pourquoi moi, parmi tous les gens ?
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_02"); //Tu as déjà prouvé plus d'une fois que l'on peut être courageux et intelligent en même temps !
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_03"); //En outre, tu connais le Vieux camp et les gardes mieux que la plupart d'entre nous.
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_04"); //Tu es la meilleure personne pour ce travail difficile !
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
	description = "Bien, allons-y et donnons une leçon aux invités importuns de cette mine !";
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
	AI_Output 			(hero, self,"Info_Gorn_KICKBUTT_15_01"); //Bien, allons-y et donnons une leçon aux invités importuns de cette mine !
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_02"); //Je ne m'attendais pas à ce que tu dises autre chose !
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_03"); //Voilà, prends cette clef. Elle ouvre la loge en face de l'entrée de la mine.

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
	description = "Pourquoi pas. Je dois entrer dans la mine de toute façon !";
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
	AI_Output 			(hero, self,"Info_Gorn_MYWAY_15_01"); //Pourquoi pas. Je dois entrer dans la mine de toute façon !
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_02"); //Quelles que soient VOS raisons, je suis heureux que NOUS traitions cette chose ensemble !
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_03"); //Voilà, prends cette clef. Elle ouvre la loge en face de l'entrée de la mine.

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

	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_01"); //Ah, j'ai presque oublié !
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_02"); //Wolf le brigand veut te parler tout de suite avant que nous partions pour la mine.

	Info_ClearChoices	(Info_Gorn_WOLF);
	Info_AddChoice		(Info_Gorn_WOLF,"Il peut attendre, nous avons des choses plus importantes à faire.",	Info_Gorn_WOLF_FM);	
	Info_AddChoice		(Info_Gorn_WOLF,"Alors, ce serai mieux d'y aller maintenant.",		Info_Gorn_WOLF_WOLF);	

	B_LogEntry			(CH4_UluMulu,"Wolf, le brigand, veut me parler de nouveau avant que nous entamions notre chemin vers la mine. Je dois le voir.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_04"); //Il peut attendre, nous avons des choses plus importantes à faire.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_05"); //Quel que soit ce que tu dises !
	AI_StopProcessInfos	(self);
};

func void Info_Gorn_WOLF_WOLF ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_06"); //Alors, ce serai mieux d'y aller maintenant.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_07"); //Tu le fais, je t'attendrai ici même.

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
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_01"); //On dirait que tu veux parler à Wolf !
	}
	else
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_02"); //Ce n'est pas la bonne direction ! Nous devons aller à la mine !
	};
	AI_Output 			(self, hero,"Info_Gorn_LEAVEFORPOST_09_03"); //Je t'attendrai au poste de garde provisoire !

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
	description = "Partons pour la mine !";
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
	AI_Output 			(hero, self,"Info_Gorn_REJOINFORFM_15_01"); //Partons pour la mine !
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_02"); //Il est temps de conduire les gardes hors d'ici !
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_03"); //Tu continues d'avancer, je te suis !

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

	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_01"); //SORTEZ ! ! !
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_02"); //Ils chassent en bande comme des claque-machoîres, mais ils mordent beaucoup plus fort!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_03"); //Nous devrions les éliminer. Tu me connais, j'aime savoir qui est dans mon dos.

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

	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_01"); //Attends, tu vois tous ces cadavres ?
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_02"); //Tu descends à l'entrée à la mine, je resterai ici et m'assurerai que nous n'aurons pas une méchante surprise qui nous arriverait par derrière.
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_03"); //Quand tu seras arrivé en bas, je te suivrai.

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

	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_01"); //Je t'ai entendu combattre et suis allé vers toi immédiatement.
	AI_Output 			(hero, self,"Info_Gorn_FMGATE_15_02"); //Une vieille connaissance... Mais ce compte est arrangé.
	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_03"); //Bon, ouvre la porte, je surveille les alentours.

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

	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_01"); //Ah, l'ami. C'était un combat vraiment difficile
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_02"); //Je n'ai jamais pensé que les gardes de Gomez offriraient beaucoup de résistance.
	AI_Output 			(hero, self,"Info_Gorn_AFTERFM_15_03"); //Le principal est que nous les ayons encore reconduit hors de notre mine.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_04"); //Je resterai ici et veillerai à ce que ça reste comme ça !

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
	description = "Quelle est la situation ?";
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
	AI_Output 			(hero,self,"Info_Gorn_FMWATCH_15_01"); //Quelle est la situation ?
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_02"); //Tout est calme. Rien se bouge dans la mine Libre.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_03"); //ça ne sera plus long maintenant avant que Lee n'envoie des renforts ici.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_04"); //Je serai à la maison jusque-là.
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

	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_01"); //C'est un artefact Orc intéressant que tu as là.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_02"); //Est-ce que ça vient des esclaves Orcs dans la mine ?
	AI_Output 			(hero, self,"Info_Gorn_FOUNDULUMULU_15_03"); //C'est un symbole Orcish signifiant amitié. Je peux entrer dans la ville des Orcs avec ça.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_04"); //J'espère pour ta santé que les Orcs respecteront cette... CHOSE !

	B_Kapitelwechsel	(5);

	AI_StopProcessInfos	(self);
};








