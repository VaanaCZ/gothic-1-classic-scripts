// ************************ EXIT **************************
instance  KDW_604_Cronos_Exit (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  999;	
	condition	=  KDW_604_Cronos_Exit_Condition;
	information	=  KDW_604_Cronos_Exit_Info;
	permanent	=  1;
	important	=  0;
	description = DIALOG_ENDE;
};                       

FUNC int  KDW_604_Cronos_Exit_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Exit_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneIceCube))
	{
	CreateInvItem (self, ItArRuneIceCube);
	};
	if (!Npc_HasItems (self,ItArRuneThunderbolt))
	{
	CreateInvItem (self, ItArRuneThunderbolt);
	};
};

/*
// *****************************************
//					Greet
// *****************************************

instance  KDW_604_Cronos_Greet (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  1;	
	condition	=  KDW_604_Cronos_Greet_Condition;
	information	=  KDW_604_Cronos_Greet_Info;
	permanent	=  0;
	description = "Ich grüße dich, Magier.";
};                       

FUNC int  KDW_604_Cronos_Greet_Condition()
{
	return 1;
};

FUNC VOID  KDW_604_Cronos_Greet_Info()
{
	AI_Output (other, self,"DIA_Cronos_Greet_15_00"); //Ich grüße dich, Magier.
	AI_Output (self, other,"DIA_Cronos_Greet_08_01"); //Warum störst du den Hüter des Erzes?
};
*/

// *****************************************
//					Brief
// *****************************************

instance  KDW_604_Cronos_Brief (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  1;	
	condition	=  KDW_604_Cronos_Brief_Condition;
	information	=  KDW_604_Cronos_Brief_Info;
	permanent	=  0;
	description = "J'ai une lettre pour le Grand Magicien du Cercle du Feu.";
};                       

FUNC int  KDW_604_Cronos_Brief_Condition()
{
	if	Npc_KnowsInfo(hero, KDW_604_Cronos_Greet)
	&&	(Npc_GetTrueGuild(hero) != GIL_STT)
	&&	(Npc_GetTrueGuild(hero) != GIL_KDF)
	&&	(hero.level < 10)
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Brief_Info()
{
	AI_Output (other, self,"DIA_Cronos_Brief_15_00"); //J'ai une lettre pour le Grand Magicien du Cercle du Feu.
	AI_Output (self, other,"DIA_Cronos_Brief_08_01"); //Nous sommes les magiciens du Cercle de l'Eau. Les magiciens du Cercle du Feu vivent dans le Vieux camp.
	AI_Output (other, self,"DIA_Cronos_Brief_15_02"); //Mais je ne peux pas entrer dans le château. Peux-tu m'aider ?
	AI_Output (self, other,"DIA_Cronos_Brief_08_03"); //Et bien, nous envoyons parfois des messagers à nos frères au le Vieux camp...
	AI_Output (self, other,"DIA_Cronos_Brief_08_04"); //Mais nous confions seulement ces messages aux hommes de Lares. Nous faisons ça depuis des années et les messagers arrivent toujours sains et saufs.
};

// *****************************************
//					Barrier
// *****************************************

instance  KDW_604_Cronos_Barrier (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  2;	
	condition	=  KDW_604_Cronos_Barrier_Condition;
	information	=  KDW_604_Cronos_Barrier_Info;
	permanent	=  0;
	description = "Tu veux détruire la Barrière - comment projettes-tu de le faire ?";
};                       

FUNC int  KDW_604_Cronos_Barrier_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Barrier_Info()
{
	AI_Output (other, self,"DIA_Cronos_Barrier_15_00"); //Tu veux détruire la Barrière - comment projettes-tu de le faire ?
	AI_Output (self, other,"DIA_Cronos_Barrier_08_01"); //Nous avons besoin de grandes quantités de minerai magique.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_02"); //Nous libérerons toute la puissance magique dans un grand rituel qui fera sauter la Barrière.
	AI_Output (self, other,"DIA_Cronos_Barrier_08_03"); //Naturellement une si grande quantité de minerai attire beaucoup de bandits et d'escrocs !
	AI_Output (self, other,"DIA_Cronos_Barrier_08_04"); //C'est pourquoi nous avons besoin d'un homme pour défendre notre plan.
};

// *****************************************
//					WannaJoin
// *****************************************

instance  KDW_604_Cronos_WannaJoin (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_WannaJoin_Condition;
	information	=  KDW_604_Cronos_WannaJoin_Info;
	permanent	=  0;
	description = "Je voudrais vous rejoindre !";
};                       

FUNC int  KDW_604_Cronos_WannaJoin_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_Greet))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Cronos_WannaJoin_15_00"); //Je voudrais vous rejoindre !
	AI_Output (self, other,"DIA_Cronos_WannaJoin_08_01"); //Si tu veux nous rejoindre, tu devrais voir Lee ou Lares.
};

// *****************************************
//					WannaMage
// *****************************************

instance  KDW_604_Cronos_WannaMage (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_WannaMage_Condition;
	information	=  KDW_604_Cronos_WannaMage_Info;
	permanent	=  0;
	description = "Je voudrais devenir un magicien !";
};                       

FUNC int  KDW_604_Cronos_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero, KDW_604_Cronos_WannaJoin))
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_WannaMage_Info()
{
	AI_Output (other, self,"DIA_Cronos_WannaMage_15_00"); //Je voudrais devenir un magicien !
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_01"); //Nous ne pouvons pas nous permettre de répandre notre savoir parmi nos ennemis.
	AI_Output (self, other,"DIA_Cronos_WannaMage_08_02"); //Nous ne pouvons même pas envisager de te former, à moins que tu ne nous prouves ta fidélité.
};

///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 2        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////

// *****************************************
//					Bandit --> Messenger
// *****************************************

instance  KDW_604_Cronos_Bandit (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  4;	
	condition	=  KDW_604_Cronos_Bandit_Condition;
	information	=  KDW_604_Cronos_Bandit_Info;
	permanent	=  0;
	description = "Je suis maintenant un des hommes de Lares. As-tu obtenu un message pour les Mages du Feu ?";
};                       

FUNC int  KDW_604_Cronos_Bandit_Condition()
{
	if ( (Npc_GetTrueGuild(hero)==GIL_ORG) || (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_Bandit_Info()
{
	AI_Output (other, self,"DIA_Cronos_Bandit_15_00"); //Je suis maintenant un des hommes de Lares. As-tu reçu un message pour moi me permettant de prendre la relève des Magiciens du Feu ?
	AI_Output (self, other,"DIA_Cronos_Bandit_08_01"); //Moi en effet. Mais tu devras porter le signe d'un de nos messagers, sinon les hommes de Gomez ne te laisseraient pas entrer dans le château.
	AI_Output (self, other,"DIA_Cronos_Bandit_08_02"); //Là, prends la lettre et le signe. Et maintenant fonce !
	
	CreateInvItem (other,KdW_Amulett);
	CreateInvItem (other,Cronos_Brief);
	
	Cronos_Messenger = LOG_RUNNING;
};

// *****************************************
//					BriefBack
// *****************************************

instance  KDW_604_Cronos_BriefBack (C_INFO)
{
	npc			=  KDW_604_Cronos;
	nr			=  3;	
	condition	=  KDW_604_Cronos_BriefBack_Condition;
	information	=  KDW_604_Cronos_BriefBack_Info;
	permanent	=  0;
	description = "J'ai transmis le message !";
};                       

FUNC int  KDW_604_Cronos_BriefBack_Condition()
{
	if (Cronos_Messenger == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  KDW_604_Cronos_BriefBack_Info()
{
	AI_Output (other, self,"DIA_Cronos_BriefBack_15_00"); //J'ai transmis le message !
	AI_Output (self, other,"DIA_Cronos_BriefBack_08_01"); //Ah, bien ! Voilà une petite récompense pour tes efforts...
	
	CreateInvItems (self,itminugget, 200);
	B_GiveInvItems (self, other, itminugget, 200);
	
	B_GiveXP(XP_CronosLetter);
};

///////////////////////////////////////////////////
///////////////////////////////////////////////////
////////////////   Kapitel 3        ///////////////
///////////////////////////////////////////////////
///////////////////////////////////////////////////


//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Cronos_NEWS (C_INFO)
{
	npc			= KDW_604_Cronos;
	condition	= Info_Cronos_NEWS_Condition;
	information	= Info_Cronos_NEWS_Info;
	permanent	= 0;
	important 	= 0;
	description = "J'ai un message important pour Saturas !";
};

FUNC INT Info_Cronos_NEWS_Condition()
{	
	if	(CorAngar_SendToNC==TRUE)
	&&	!Npc_KnowsInfo(hero, Info_Cronos_SLEEPER)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_NEWS_Info()
{
	AI_Output			(other, self,"Info_Cronos_NEWS_15_01"); //J'ai un message important pour Saturas !
	AI_Output			(self, other,"Info_Cronos_NEWS_08_02"); //Qu'est-ce qui pourrait être si important que notre chef spirituel devrait interrompre ses études pour en prendre connaissance ?
};

//***************************************************************************
//	Info KALOM
//***************************************************************************
instance Info_Cronos_KALOM (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 10;
	condition	= Info_Cronos_KALOM_Condition;
	information	= Info_Cronos_KALOM_Info;
	permanent	= 0;
	important 	= 0;
	description = "Cor Kalom a quitté la Confrérie !";
};

FUNC INT Info_Cronos_KALOM_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS) && !Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_KALOM_Info()
{
	AI_Output			(other, self,"Info_Cronos_KALOM_15_01"); //Cor Kalom a quitté la Confrérie emmenant avec lui quelques templiers fanatiques !
	AI_Output			(other, self,"Info_Cronos_KALOM_15_02"); //Il veut trouver le Dormeur par ses propres moyens et le réveiller à tout prix.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_03"); //Je ne lui ai jamais fait confiance.  Deuxième Sage ou pas, il est sournois, fourbe et capable de n'importe quoi.
	AI_Output			(self, other,"Info_Cronos_KALOM_08_04"); //La Confrérie est plus à l'aise sans lui !
	AI_Output			(self, other,"Info_Cronos_KALOM_08_05"); //Je parlerais de lui à Saturas dès que j'en aurais la chance. Part maintenant !

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Cronos_YBERION (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 20;
	condition	= Info_Cronos_YBERION_Condition;
	information	= Info_Cronos_YBERION_Info;
	permanent	= 0;
	important 	= 0;
	description = "Y'Bérion, le chef du camp de la Secte, est mort !";
};

FUNC INT Info_Cronos_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS) && !Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_YBERION_Info()
{
	AI_Output			(other, self,"Info_Cronos_YBERION_15_01"); //Y'Bérion, le chef du camp de la Secte, est mort !
	AI_Output			(self, other,"Info_Cronos_YBERION_08_02"); //HEIN ? ? ? Comment cela a t'il pu se produire ?
	AI_Output			(other, self,"Info_Cronos_YBERION_15_03"); //La Confrérie a exécuté un rituel, appelant leur dieu.
	AI_Output			(other, self,"Info_Cronos_YBERION_15_04"); //Il semble que Y'Bérion n'a pas supporté cet effort mental.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_05"); //C'est très triste. Y'Bérion était un allié digne de confiance.
	AI_Output			(self, other,"Info_Cronos_YBERION_08_06"); //Mais cela ne justifie pas l'interruption des études de Saturas.

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info SLEEPER
//***************************************************************************
instance Info_Cronos_SLEEPER (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_SLEEPER_Condition;
	information	= Info_Cronos_SLEEPER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Les Sages ont reconnu qu'ils prient un démon de l'Archimonde !";
};

FUNC INT Info_Cronos_SLEEPER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_SLEEPER_Info()
{
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_01"); //Les Sages ont reconnu qu'ils prient un démon de l'Archimonde !
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_02"); //Tout d'un coup ils se mettent à penser que leur Dormeur est un démon ?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_03"); //Cela ressemble à une autre idée folle de la Confrérie, mais...
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_04"); //... s'ils ont raison... nous pourrions tous ici dans la colonie courir un grave danger.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_05"); //Tu dois rapporter immédiatement cela à Saturas. Lui seul doit décider de ce qui doit être fait.
	AI_Output			(other, self,"Info_Cronos_SLEEPER_15_06"); //Où puis-je trouver Saturas ?
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_07"); //Va au niveau supérieur. Là, dis aux gardes que tu as mon autorisation pour passer.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_08"); //Le mot de passe est TETRIANDOCH.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_09"); //Saturas est au pentacle.
	AI_Output			(self, other,"Info_Cronos_SLEEPER_08_10"); //Il passe presque toute la journée là, étudiant la façon de faire sauter le grand tas de minerai.

	B_LogEntry			(CH3_EscapePlanNC,"Cronos m'a donné la permission de rendre visite à Saturas au niveau supérieur. D'habitude on peut trouver le Grand Magicien du Cercle de l'Eau au pentacle. Le mot de passe pour les gardes est... Damnation, qu'est-ce que c'est déjà ?");

	B_GiveXP			(XP_GetCronosPermission);

	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info PAROLE
//***************************************************************************
instance Info_Cronos_PAROLE (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_PAROLE_Condition;
	information	= Info_Cronos_PAROLE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Quel était le mot de passe déjà ?";
};

FUNC INT Info_Cronos_PAROLE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Cronos_SLEEPER) && !Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_PAROLE_Info()
{
	AI_Output			(other, self,"Info_Cronos_PAROLE_15_01"); //Quel était le mot de passe déjà ?
	AI_Output			(self, other,"Info_Cronos_PAROLE_08_02"); //Tu es plus écervelé que ma grand-mère. C'est """"TETRIANDOCH"""""
};

//***************************************************************************
//	Info REWARD
//***************************************************************************
instance Info_Cronos_REWARD (C_INFO)
{
	npc			= KDW_604_Cronos;
	nr			= 30;
	condition	= Info_Cronos_REWARD_Condition;
	information	= Info_Cronos_REWARD_Info;
	permanent	= 0;
	important 	= 0;
	description = "Saturas a dit que vous aviez une récompense pour moi.";
};

FUNC INT Info_Cronos_REWARD_Condition()
{	
	if (Saturas_BringFoci == 5)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Cronos_REWARD_Info()
{
	AI_Output			(other, self,"Info_Cronos_REWARD_15_01"); //Saturas a dit que vous aviez une récompense pour moi.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_02"); //En tant que gardien du minerai, j'aimerai t'offrir une petite partie de notre minerai pour te remercier de tes grandes actions au nom du camp.
	AI_Output			(self, other,"Info_Cronos_REWARD_08_03"); //J'espère que tu en feras un aussi bon usage que nous !

	B_LogEntry		(CH3_BringFoci,"Cronos m'a donné une quantité énorme de minerai, qui diminuera à peine le tas géant de minerai.");
	if	Npc_KnowsInfo(hero, Info_Riordian_REWARD)
	{
		Log_SetTopicStatus	(CH3_BringFoci,	LOG_SUCCESS);
	};
	
	CreateInvItems		(self, ItMiNugget,	1000);
	B_GiveInvItems (self, hero, ItMiNugget,	1000);
};
/*------------------------------------------------------------------------
//						NACH DER WEIHE							//
------------------------------------------------------------------------*/
instance KDW_604_Cronos_WELCOME (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_WELCOME_Condition;
	information		= KDW_604_Cronos_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_604_Cronos_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};
};
func void  KDW_604_Cronos_WELCOME_Info()
{
	AI_Output			(self, other,"KDW_604_Cronos_WELCOME_Info_08_01"); //Ta décision de rejoindre les Magiciens de l'Eau était bonne. Sois le bienvenu, mon frère !
	AI_StopProcessInfos	( self );  
};
//--------------------------------------------------------------------------
// 							MANA KAUFEN
//--------------------------------------------------------------------------
// ***************************** INFOS ****************************************//

instance  KDW_604_Cronos_MANA (C_INFO)
{
	npc				= KDW_604_Cronos;
	nr				= 800;
	condition		= KDW_604_Cronos_MANA_Condition;
	information		= KDW_604_Cronos_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "J'ai besoin de plus de pouvoir magique."; 
};

FUNC int  KDW_604_Cronos_MANA_Condition()
{	
	if	(Npc_KnowsInfo (hero,KDW_604_Cronos_GREET))
	&&	((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Cronos_MANA_Info()
{
	AI_Output			(other, self,"KDW_604_Cronos_MANA_Info_15_01"); //J'ai besoin de plus de pouvoir magique.
	AI_Output			(self, other,"KDW_604_Cronos_MANA_Info_08_02"); //Je peux t'aider à augmenter ton pouvoir. Utilise-le avec sagesse.
	
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);
};  
func void KDW_604_Cronos_MANA_BACK()
{
	Info_ClearChoices	(KDW_604_Cronos_MANA);
};

func void KDW_604_Cronos_MANA_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);

};

func void KDW_604_Cronos_MANA_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(KDW_604_Cronos_MANA);
	Info_AddChoice		(KDW_604_Cronos_MANA,DIALOG_BACK									,KDW_604_Cronos_MANA_BACK);
	Info_AddChoice		(KDW_604_Cronos_MANA, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)			,KDW_604_Cronos_MANA_MAN_5);
	Info_AddChoice		(KDW_604_Cronos_MANA,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)		,KDW_604_Cronos_MANA_MAN_1);

};
//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  KDW_604_Cronos_SELLSTUFF (C_INFO)
{
	npc				= KDW_604_Cronos;
	nr				= 900;
	condition		= KDW_604_Cronos_SELLSTUFF_Condition;
	information		= KDW_604_Cronos_SELLSTUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  KDW_604_Cronos_SELLSTUFF_Condition()
{	
	if	(Npc_KnowsInfo (hero,KDW_604_Cronos_GREET))
	&&	((CorAngar_SendToNC == FALSE) || Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};

};
FUNC void  KDW_604_Cronos_SELLSTUFF_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_SELLSTUFF_Info_15_01"); //Je veux acquérir des écrits magiques.
	
};  
/*------------------------------------------------------------------------
						BEGRÜSSUNG						
------------------------------------------------------------------------*/

instance  KDW_604_Cronos_GREET (C_INFO)
{
	npc				= KDW_604_Cronos;
	condition		= KDW_604_Cronos_GREET_Condition;
	information		= KDW_604_Cronos_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Salutations, Magicien."; 
};

FUNC int  KDW_604_Cronos_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_604_Cronos_GREET_Info()
{
	AI_Output (other, self,"KDW_604_Cronos_GREET_Info_15_01"); //Salutations, Magicien.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_02"); //Puisse la bénédiction d'Adanos soit sur toi. Je peux t'aider à augmenter tes pouvoirs magiques ou te donner quelques objets utiles.
	AI_Output (self, other,"KDW_604_Cronos_GREET_Info_08_03"); //Qu'est-ce que je peux faire pour toi ?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry (GE_TraderNC,"Cronos vend des articles de magie comme des RUNES, DES PARCHEMINS et des ANNEAUX. Je peux le trouver à la grille au-dessus du grand tas de minerai jour et nuit."); 
	Log_CreateTopic (GE_TeacherNC,LOG_NOTE);
	B_LogEntry (GE_TeacherNC,"Cronos peut m'aider à augmenter mon MANA. Je peux le trouver à la grille au-dessus du grand tas de minerai jour et nuit.");
};
