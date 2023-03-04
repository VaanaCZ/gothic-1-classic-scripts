// ************************ EXIT **************************

instance  Info_Saturas_EXIT (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	999;
	condition	=	Info_Saturas_EXIT_Condition;
	information	=	Info_Saturas_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Saturas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Saturas_EXIT_Info()
{
	AI_Output			(self, other,"Info_Saturas_EXIT_14_01"); //Puisses-tu revenir entier !

	AI_StopProcessInfos	(self);
};


// ************************ Intruder **************************

instance  Info_Saturas_Intruder (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	1;
	condition	=	Info_Saturas_Intruder_Condition;
	information	=	Info_Saturas_Intruder_Info;
	permanent	=	1;
	important	=	1;	
};                       

FUNC int  Info_Saturas_Intruder_Condition()
{
	if ( Npc_IsInState(self,ZS_Talk) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_Intruder_Info()
{
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Que fais-tu ici ? Tu n'a rien à faire ici ! Fiche le camp !

	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Saturas_NEWS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NEWS_Condition;
	information	= Info_Saturas_NEWS_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "J'ai des nouvelles importantes du camp de la Confrérie !";
};

FUNC INT Info_Saturas_NEWS_Condition()
{	
	if ((CorAngar_SendToNC==TRUE) && Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_NEWS_Info()
{
	AI_Output			(other, self,"Info_Saturas_NEWS_15_01"); //J'ai des nouvelles importantes du camp de la Confrérie !
	AI_Output			(self, other,"Info_Saturas_NEWS_14_02"); //Si Cronos t'as donné la permission de me rendre visite, il doit s'agir de nouvelles importantes en effet !
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Saturas_YBERION (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_YBERION_Condition;
	information	= Info_Saturas_YBERION_Info;
	permanent	= 0;
	IMPORTANT = 0;
	description = "Y'Bérion est mort !";
};

FUNC INT Info_Saturas_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_YBERION_Info()
{
	AI_Output			(other, self,"Info_Saturas_YBERION_15_01"); //Y'Bérion est mort ! Il est mort pendant l'invocation rituelle du Dormeur.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_02"); //Y'Bérion mort ? Ce sont des mauvaises nouvelles, de très mauvaises nouvelles en effet !
	AI_Output			(self, other,"Info_Saturas_YBERION_14_03"); //Qui est à la tête de la Confrérie maintenant ? Ce fourbe de Cor Kalom aux dents longues ?
	AI_Output			(other, self,"Info_Saturas_YBERION_15_04"); //Non ! Kalom a tourné le dos à la Confrérie. Il a pris quelques templiers avec lui et s'en est allé. Personne ne sait où !
	AI_Output			(self, other,"Info_Saturas_YBERION_14_05"); //Pourquoi ça ? Il venait en second après Y'Bérion !
	AI_Output			(other, self,"Info_Saturas_YBERION_15_06"); //Certains événements ont convaincu les Sages que leur méthode était fausse. Leur dieu semble être un démon de l'Archimonde.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_07"); //Un des Sages a failli me tuer sous l'influence du Dormeur, alors que je venais de lui sauver la vie.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_08"); //Cor Kalom était le seul Sage qui n'a pas voulu admettre la véritable nature de l'atroce créature, c'est pourquoi il a quitté le camp du marais.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_09"); //Je vois ! Et bien, au moins nous sommes chanceux à cet égard. Cor Angar est un homme bon. Il est rude, mais honnête.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_10"); //Si quelqu'un peut empêcher la Confrérie de tomber en morceaux après cette catastrophe spirituelle, c'est bien lui.

	B_LogEntry		(CH3_EscapePlanNC,"J'ai parlé des incidents à Saturas dans le Camp Marécageux. Il était heureux que Cor Angar ai repris la direction de la Confrérie.");
};

//***************************************************************************
//	Info BOOK
//***************************************************************************
instance Info_Saturas_BOOK (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BOOK_Condition;
	information	= Info_Saturas_BOOK_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "J'ai cet almanach...";
};

FUNC INT Info_Saturas_BOOK_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, ItWrFokusbuch))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BOOK_Info()
{
	AI_Output			(other, self,"Info_Saturas_BOOK_15_01"); //J'ai cet almanach...
	AI_Output			(other, self,"Info_Saturas_BOOK_15_02"); //Y'Bérion l'a employé pour charger la pierre focale.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_03"); //Très bien. Nous avons besoin du savoir contenu dans ce livre pour charger les cinq pierres focales originales.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_04"); //Je prends l'almanach !

	B_GiveInvItems		(hero,self,ItWrFokusbuch,1);
	Npc_RemoveInvItem	(self,ItWrFokusbuch);
	B_GiveXP  			(XP_DeliverBookToSaturas);
};

//***************************************************************************
//	Info FOCUS
//***************************************************************************
instance Info_Saturas_FOCUS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FOCUS_Condition;
	information	= Info_Saturas_FOCUS_Info;
	permanent	= 0;
	important 	= 0;
	description = "J'ai cette pierre focale...";
};

FUNC INT Info_Saturas_FOCUS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, Focus_1))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FOCUS_Info()
{
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_01"); //J'ai cette pierre focale...
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_02"); //Tu as en main la clef qui peut briser toutes nos chaînes.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_03"); //C'est une des cinq pierres focales qui a été utilisée pour créer la Barrière magique.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_04"); //Et avec l'aide de la très semblable puissance convergente de ces pierres, nous abattrons le grand mur d'énergie.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_05"); //Mais de cette utilisation n'émergerait-il pas un terrible pouvoir ?
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_06"); //c'est vrai, mais toutes ces années nous avons extrait le minerai sans réfléchir au lieu de l'échanger avec nos geôliers contre des richesses.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_07"); //Comme tu dois le savoir, il y a dans chaque pépite de minerai une certaine quantité de puissance magique. À l'aide de l'énergie ainsi amassée dans le tas de minerai, on pourra détruire la Barrière Magique.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_08"); //ça me semble dangereux.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_09"); //L'explosion aura simplement un caractère magique, elle détruira seulement tout qui est modifié par la magie à l'intérieur de la Barrière, donc sans danger pour nous les êtres humains
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_10"); //Tiens, prends la pierre focale. J'espère qu'il sera vraiment utile à ton plan avec le tas de minerai !

	B_GiveInvItems		(hero, self, Focus_1, 1);
	Npc_RemoveInvItem	(self, Focus_1);
	B_GiveXP  			(XP_DeliverFocusToSaturas);
};

//***************************************************************************
//	Info WHATNOW
//***************************************************************************
instance Info_Saturas_WHATNOW (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_WHATNOW_Condition;
	information	= Info_Saturas_WHATNOW_Info;
	permanent	= 0;
	important 	= 0;
	description = "Que vas-tu faire avec la pierre et l'almanach maintenant ?";
};

FUNC INT Info_Saturas_WHATNOW_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_FOCUS) && Npc_KnowsInfo(hero, Info_Saturas_BOOK))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_WHATNOW_Info()
{
	AI_Output			(other, self,"Info_Saturas_WHATNOW_15_01"); //Que vas-tu faire avec la pierre et l'almanach maintenant ?
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_03"); //Rien. Nous avons besoin d'abord des quatre dernières pierres focales !
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_04"); //Malheureusement nous n'avons aucune de ces quatre pierres magiques.
};

//***************************************************************************
//	Info OFFER
//***************************************************************************
instance Info_Saturas_OFFER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_OFFER_Condition;
	information	= Info_Saturas_OFFER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Je désire trouver les quatre pierres focales restantes pour toi !";
};

FUNC INT Info_Saturas_OFFER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_WHATNOW))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_OFFER_Info()
{
	AI_Output			(other, self,"Info_Saturas_OFFER_15_01"); //Je désire trouver les quatre pierres focales restantes pour toi !
	AI_Output			(other, self,"Info_Saturas_OFFER_15_02"); //Après tout, j'étais autrefois tout à fait décidé de sortir d'ici.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_03"); //Je dois t'avertir. Leur recherche montrera que c'était aussi difficile que dangereux.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_04"); //Mais comme le conflit avec le Vieux camp empire un peu plus chaque jour, je ne peux te donner aucun mercenaire.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_05"); //Tu seras absolument seul.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_06"); //Bon... Je suis habitué ! Je trouverai une solution pour m'organiser.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_07"); //Ta confiance t'honore, mais tu auras besoin quand même de quelques objets qui t'aideront.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_08"); //Prends cette carte. Elle est ancienne, là-dessus sont marqués les endroits où se trouvaient les pierres focales à l'origine, quand la Barrière a été érigée.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_09"); //En outre, ce parchemin te permettra de revenir à notre camp plus rapidement.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_10"); //En dernier lieu, tu devrais parler à Riordian. C'est lui qui élabore les potions du camp.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_11"); //Tu le trouveras dans sa cabane, ici, au niveau supérieur

	B_Story_BringFoci	();
};

//***************************************************************************
//	B_DeliverFocus
//***************************************************************************
func void B_DeliverFocus()
{
	//-------- 2. Fokus abliefern --------
	if 		(Saturas_BringFoci == 1)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_01"); //Hmmm, c'est un début, tu peux mieux faire.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_02"); //Il manque encore trois pierres focales pour accomplir notre plan.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_03"); //A présent part à la recherche des pierres focales manquantes.
		Saturas_BringFoci = 2;	
		B_GiveXP  		(XP_DeliverSecondFocus);
	}

	//-------- 3. Fokus abliefern --------
	else if	(Saturas_BringFoci == 2)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_04"); //Bien, c'est la deuxième pierre focale que tu nous as apporté.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_05"); //On se rapproche de notre objectif.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_06"); //Allez, courage, rapporte les deux pierres focales restantes.
		Saturas_BringFoci = 3;	
		B_GiveXP  		(XP_DeliverThirdFocus);
	}
	
	//-------- 4. Fokus abliefern --------
	else if	(Saturas_BringFoci == 3)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_07"); //Incroyable, nous avons maintenant quatre pierres focales en tout.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_08"); //Plus qu'une et nous les aurons toutes.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_09"); //Tu as déjà rendu un grand service à notre communauté. Trouve la dernière pierre, et nous pourrons bientôt nous libérer.
		Saturas_BringFoci = 4;	
		B_GiveXP  		(XP_DeliverFourthFocus);
	}
	
	//-------- 5. Fokus abliefern --------
	else if	(Saturas_BringFoci == 4)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_10"); //Magnifique, nous avons enfin les cinq pierres focales.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_11"); //Tes actions ont une valeur inestimable pour notre camp. Sois assuré de mon éternelle reconnaissance.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_12"); //Va voir Riordian maintenant. Il te donnera quelque chose pour te remercier de tes remarquables efforts.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_13"); //Parle aussi à Cronos, le gardien du minerai. Il te donnera un autre cadeau de la part de notre communauté.

		Saturas_BringFoci = 5;	
		B_GiveXP  			(XP_DeliverFifthFocus);

		B_LogEntry		(CH3_BringFoci,"J'ai réussi à trouver les quatre pierres focales. Saturas est incroyablement heureux. Je crois qu'il doit me rendre un service dans le Nouveau le Camp.");
		B_LogEntry		(CH3_BringFoci,"Les Magiciens de l'Eau, Cronos et Riordian, m'ont promis une récompense pour le recouvrement de toutes les pierres focales. Je dois aller les voir.");

		
		// Aufhebung des Log_running_Status, wenn die Foki schon vorher abgegeben wurden, bevor SC die einzelnen Aufträge bekam.    ***Björn***
		
		Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	};
		
	//-------- Neuer Teleportzauber ? --------
	if ( !Npc_HasItems(hero, ItArScrollTeleport2) && (Saturas_BringFoci < 5) )	
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_14"); //Je m'aperçois que tu as utilisé ton parchemin de téléportation. Prends en un autre ici.
		CreateInvItem	(self,	ItArScrollTeleport2);
		B_GiveInvItems	(self, other, ItArScrollTeleport2, 1);
	};
};

//***************************************************************************
//	Info BRINGFOCUS2
//***************************************************************************
instance Info_Saturas_BRINGFOCUS2 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS2_Condition;
	information	= Info_Saturas_BRINGFOCUS2_Info;
	permanent	= 0;
	important	= 0;
	description = "J'ai trouvé une pierre focale dans le canyon des Trolls !";
};

FUNC INT Info_Saturas_BRINGFOCUS2_Condition()
{	
	if ( Npc_HasItems(hero,focus_2) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS2_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS2_15_01"); //J'ai trouvé une pierre focale dans le canyon des Trolls !

	B_LogEntry		(CH3_TrollCanyon,"La pierre du canyon des Trolls est maintenant en sécurité avec Saturas.");
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_2, 1);
	Npc_RemoveInvItem	(self,	focus_2);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS3
//***************************************************************************
instance Info_Saturas_BRINGFOCUS3 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS3_Condition;
	information	= Info_Saturas_BRINGFOCUS3_Info;
	permanent	= 0;
	important 	= 0;
	description = "J'ai trouvé une pierre focale dans le fort de la montagne !";
};

FUNC INT Info_Saturas_BRINGFOCUS3_Condition()
{	
	if ( Npc_HasItems(hero,focus_3) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS3_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS3_15_01"); //J'ai trouvé une pierre focale dans le fort de la montagne !

	B_LogEntry		(CH3_Fortress,"Saturas a reçu, de ma part, la pierre du fort de la montagne.");
	Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_3, 1);
	Npc_RemoveInvItem	(hero,	focus_3);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS4
//***************************************************************************
instance Info_Saturas_BRINGFOCUS4 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS4_Condition;
	information	= Info_Saturas_BRINGFOCUS4_Info;
	permanent	= 0;
	important 	= 0;
	description = "J'ai trouvé la pierre focale du monastère en ruine !";
};

FUNC INT Info_Saturas_BRINGFOCUS4_Condition()
{	
	if ( Npc_HasItems(hero,focus_4) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS4_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_01"); //J'ai trouvé la pierre focale du monastère en ruine !
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_02"); //Gorn le mercenaire était là, il m'a donné un coup de main dans ma quête.

	B_LogEntry		(CH3_MonasteryRuin,"Enfin je peux donner la pierre du monastère en ruine à Saturas.");
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_4, 1);
	Npc_RemoveInvItem	(hero,	focus_4);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS5
//***************************************************************************
instance Info_Saturas_BRINGFOCUS5 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS5_Condition;
	information	= Info_Saturas_BRINGFOCUS5_Info;
	permanent	= 0;
	important 	= 0;
	description = "J'ai trouvé une pierre focale sous l'anneau de pierre !";
};

FUNC INT Info_Saturas_BRINGFOCUS5_Condition()
{	
	if ( Npc_HasItems(hero,focus_5) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS5_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS5_15_01"); //J'ai trouvé une pierre focale sous l'anneau de pierre !

	B_LogEntry		(CH3_Stonehenge,"J'ai donné la pierre de la crypte au-dessous de l'anneau de pierre à Saturas.");
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_5, 1);
	Npc_RemoveInvItem	(hero,	focus_5);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info ALLFOCI
//***************************************************************************
instance Info_Saturas_ALLFOCI (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ALLFOCI_Condition;
	information	= Info_Saturas_ALLFOCI_Info;
	permanent	= 0;
	important 	= 0;
	description = "Peux-tu détruire le tas de minerai maintenant ?";
};

FUNC INT Info_Saturas_ALLFOCI_Condition()
{	
	if	(Saturas_BringFoci == 5)
	&&	(Kapitel < 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ALLFOCI_Info()
{
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_01"); //Peux-tu détruire le tas de minerai maintenant ?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_02"); //Nous avons maintenant tous les artefacts indispensables pour mener à bien notre plan.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_03"); //Mais la Barrière a été créée par douze magiciens.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_04"); //Il n'y a pas assez de magiciens dans le Cercle de l'Eau pour contrôler les énergies puissantes et les guider correctement.
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_05"); //Que peut-on faire ?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_06"); //Je me rends compte que tu as déjà fait beaucoup pour notre communauté, nous te devons beaucoup...
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_07"); //... mais dans l'intérêt des habitants de la colonie, je dois te demander un service de plus.
};

//***************************************************************************
//	Info FAVOR
//***************************************************************************
instance Info_Saturas_FAVOR (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FAVOR_Condition;
	information	= Info_Saturas_FAVOR_Info;
	permanent	= 0;
	important 	= 0;
	description = "un service de plus ?";
};

FUNC INT Info_Saturas_FAVOR_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_ALLFOCI))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FAVOR_Info()
{
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_01"); //un service de plus ?
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_02"); //Bon. Rends toi au Vieux camp et essaye de gagner à notre cause quelques magiciens du Cercle de Feu.
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_03"); //MAGICIENS DU FEU ? ? ? Pourquoi voudraient-ils renoncer à leur vie facile ?
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_04"); //La destruction de la Barrière mettrait fin à leur position dominante !
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_05"); //C'est la raison exacte pour laquelle TU dois accomplir cette mission. Tu connais des personnes dans tous les camps de la colonie.
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_06"); //Rappelle le passé aux Magiciens du Feu, quand nous étions ensemble à l'étude des arts de la magie.
};	

//***************************************************************************
//	Info ACCEPT
//***************************************************************************
instance Info_Saturas_ACCEPT (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ACCEPT_Condition;
	information	= Info_Saturas_ACCEPT_Info;
	permanent	= 0;
	important 	= 0;
	description = "D'accord, alors, j'essayerai de convaincre les Magiciens du Feu !";
};

FUNC INT Info_Saturas_ACCEPT_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_FAVOR))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ACCEPT_Info()
{
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_01"); //D'accord, alors, j'essayerai de convaincre les Magiciens du Feu !
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_02"); //Mais je ne peux rien promettre ! ça me semble presque impossible.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_03"); //Tu dois tout tenter. Si tu échoues là, il y a seulement un autre...
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_04"); //Un seul...
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_05"); //... un QUOI ?
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_06"); //Oublie ça ! Tu DOIS réussir !
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_07"); //Là, prends cette rune. Remets-la à Corristo, le grand Magicien du Cercle de Feu, en gage de notre confiance.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_08"); //Avec ça il peut, chaque fois qu'il le désire, se déplacer par télépathie dans cette salle en évitant les gardes.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_09"); //J'espère que ça convaincra nos anciens amis de nos bonnes intentions.

	B_KapitelWechsel	(4);
};	







//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info AMBUSH
//---------------------------------------------------------------------
instance Info_Saturas_AMBUSH (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_AMBUSH_Condition;
	information	= Info_Saturas_AMBUSH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Saturas_AMBUSH_Condition()
{	
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_AMBUSH_Info()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(PC_FIGHTER);
	AI_TurnToNpc		(gorn,hero);
	
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_01"); //Je suis heureux de te voir de retour. Quelque chose de terrible est arrivé !
	AI_Output			(hero,self,"Info_Saturas_AMBUSH_15_02"); //Laisse-moi deviner...la mine Libre a été assailli par les gardes du Vieux camp. Personne ne les a vues venir... ?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_03"); //Attends... comment... mais bien sûr... Tu l'as appris au Vieux camp !
	AI_Output	 		(self,hero,"Info_Saturas_AMBUSH_14_04"); //Gorn est arrivé ici juste avant toi .
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_05"); //Qu'est-ce qu'il s'est passé pour que Gomez prendre une mesure si agressive ?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_06"); //Il devrait bien se rendre compte qu'un acte aussi honteux puisse seulement provoquer la guerre.
};	

//---------------------------------------------------------------------
//	Info COLLAPSE
//---------------------------------------------------------------------
instance Info_Saturas_COLLAPSE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_COLLAPSE_Condition;
	information	= Info_Saturas_COLLAPSE_Info;
	permanent	= 0;
	important 	= 0;
	description = "La Vielle Mine s'est effondrée après que l'eau est suintée à l'intérieur !";
};

FUNC INT Info_Saturas_COLLAPSE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_COLLAPSE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_COLLAPSE_15_01"); //La Vielle Mine s'est effondrée après que l'eau est suintée à l'intérieur !
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_02"); //... Effondré... naturellement... Puis tout deviens logique.
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_03"); //Gomez est de nouveau le dos au mur. Il est plus dangereux que jamais. Maintenant qu'il n'a plus rien perdre, il fera n'importe quoi !
};

//---------------------------------------------------------------------
//	Info MURDER
//---------------------------------------------------------------------
instance Info_Saturas_MURDER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_MURDER_Condition;
	information	= Info_Saturas_MURDER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Gomez a fait tué tous les Magiciens du Feu !";
};

FUNC INT Info_Saturas_MURDER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_MURDER_Info()
{
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_01"); //Gomez a fait tué tous les Magiciens du Feu !
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_02"); //IL LES A TUÉ ??? Pourquoi  ferait-il ça au nom de Beliar ?
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_03"); //Ils étaient contre l'attaque de la mine Libre, et Gomez pour.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_04"); //Alors nous tous sommes maudits. Sans les six autres magiciens, nous ne pourrons jamais contrôler la puissance concentrée du tas de minerai.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_05"); //En dépit de cela, je te remercie de m'avoir transmis ce dangereux message.

	B_GiveXP			(XP_ReportToSaturas);
	
	B_LogEntry			(CH4_Firemages,"Saturas n'était pas du tout heureux quand je lui ai parlé des incidents dans le Vieux Camp. Quelque soi leur plan d'évasion... Ils devront se débrouiller SANS les Magiciens du Feu.");
	Log_SetTopicStatus	(CH4_Firemages,	LOG_SUCCESS);
};



/*------------------------------------------------------------------------
							GILDENWECHSEL									
------------------------------------------------------------------------*/
instance  KDW_600_Saturas_NOMOREOC (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_NOMOREOC_Condition;
	information		= KDW_600_Saturas_NOMOREOC_Info;
	important		= 0;
	permanent		= 0;
	description		= "J'ai été banni du Vieux Camp parce que je t'ai aidé !"; 
};

FUNC int  KDW_600_Saturas_NOMOREOC_Condition()
{	
	if	Npc_KnowsInfo (hero,Info_Saturas_MURDER)
	&&	((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		return TRUE;
	};
};

FUNC void  KDW_600_Saturas_NOMOREOC_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_NOMOREOC_Info_15_01"); //J'ai été banni du Vieux Camp parce que je t'ai aidé !
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_02"); //Tu ne veux pas faire partie du Vieux camp plus longtemps ?
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Alors je te souhaite la bienvenue au nom de notre communauté.

	Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
	B_LogEntry			(CH4_BannedFromOC,"Après que j'ai été banni du Vieux Camp, Saturas m'a accueilli au Nouveau Camp.");
}; 

/*------------------------------------------------------------------------
							VOM GRD ZUM SLD									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_GOTOLEE (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_GOTOLEE_Condition;
	information		= KDW_600_Saturas_GOTOLEE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Cela signifie-t-il que les mercenaires me prendront ?"; 
};

FUNC int  KDW_600_Saturas_GOTOLEE_Condition()
{	
	if (oldHeroGuild == GIL_GRD)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_GOTOLEE_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_GOTOLEE_Info_15_01"); //Cela signifie-t-il que les mercenaires me prendront ?
	AI_Output			(self, other,"KDW_600_Saturas_GOTOLEE_Info_14_02"); //Parle à Lee. Il doit savoir. Puis reviens me voir.

	B_LogEntry			(CH4_BannedFromOC,"Lee, le chef des mercenaires, veut me parler. Je suppose qu'après l'avoir vu, je retourne auprès de Saturas."); 
};  
 
/*------------------------------------------------------------------------
							VON KDF ZU KDW									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_OATH (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_OATH_Condition;
	information		= KDW_600_Saturas_OATH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Cela signifie-t-il que j'appartiens maintenant aux Magiciens de l'Eau ?"; 
};

FUNC int  KDW_600_Saturas_OATH_Condition()
{	
	if (oldHeroGuild == GIL_KDF)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_OATH_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Est-ce que ça signifie que j'appartiens maintenant à la guilde des Magiciens de l'Eau ?
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Pas encore. D'abord tu dois prononcer le serment de l'Eau.
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_03"); //Mais j'ai déjà prononcé le serment de Feu !
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_04"); //Hmmm....
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_05"); //Cela ne veut pas dire que tu romps ton voeu !
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_06"); //Heuu... Je ne comprends pas...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_07"); //Tu prolonges ton voeu. De cette façon tu deviendras un magicien des deux éléments !
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_08"); //Alors tu auras la force de Feu aussi bien que la sagesse de l'Eau !

	B_LogEntry			(CH4_BannedFromOC,"Saturas me laissera rejoindre le Cercle de l'Eau et je n'ai pas besoin de rompre le serment du Feu."); 
};  

/*------------------------------------------------------------------------
//							KDWAUFNAHME									//
------------------------------------------------------------------------*/
instance KDW_600_Saturas_KDWAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_KDWAUFNAHME_Condition;
	information		= KDW_600_Saturas_KDWAUFNAHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je suis prêt à faire le serment."; 
};

FUNC int  KDW_600_Saturas_KDWAUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_OATH))
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_KDWAUFNAHME_Info()
{
	
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Je suis prêt à faire le serment.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02"); //Serviteur du Feu, reçois maintenant la bénédiction de l'Eau !
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //A présent prononce ces paroles :
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Je jure par la force des dieux...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Je jure par la force des dieux...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //... Et par le pouvoir de l'Eau Sacrée...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //... Et par le pouvoir de l'Eau Sacrée...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //... que mon savoir et mes actions dorénavant et pour toujours ne feront qu'un avec l'Eau...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //... que mon savoir et mes actions dorénavant et pour toujours ne feront qu'un avec l'Eau...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //... jusqu'à ce que mon corps revienne au royaume de Beliar et que la source de ma vie se soit tarie.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //... jusqu'à ce que mon corps revienne au royaume de Beliar et que la source de ma vie se soit tarie.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12"); //Par ce serment tu fusionnes en toi la puissance du Feu et la bénédiction de l'Eau.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13"); //Tu as maintenant lié ensemble ce qui était distant avant. Puisse ta vie être un signe de la fusion des éléments.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Revêts cette longue robe comme signe de ton lien avec l'Eau sacrée et avec Adanos.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	B_LogEntry			(CH4_BannedFromOC,"Maintenant j'ai rejoint le Cercle de l'Eau. Dorénavant j'ai accès aux deux écoles de magie."); 
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);

	AI_StopProcessInfos	(self);
};
/*------------------------------------------------------------------------
						DIE MAGISCHEN KREISE							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_LESSON (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_LESSON_Condition;
	information		= KDW_600_Saturas_LESSON_Info;
	important		= 0;
	permanent		= 0;
	description		= "Peux-tu me former ?"; 
};

FUNC int  KDW_600_Saturas_LESSON_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW) 
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_LESSON_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_LESSON_Info_15_01"); //Peux-tu me former ?
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) <= 3)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_02"); //Il y a beaucoup à apprendre. Je te formerais dès que tu seras prêt.
	}
	else if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_03"); //Il y a un cercle que tu ne connais pas encore. Je te l'enseignerai dès que tu seras prêt.
	}
	else
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_04"); //Tu as déjà maîtrisé le Cinquième Cercle de la magie ! Tu en sais maintenant autant que moi.
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_05"); //Je ne peux rien t'apprendre de plus !
	};

	Log_CreateTopic		(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Saturas, le chef des Magiciens de l'Eau, enseigne les CERCLES magiques. Il reste toujours au pentacle au niveau supérieur.");
};  
//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS1 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS1_Condition;
	information		= KDW_600_Saturas_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0); 
};

FUNC int  KDW_600_Saturas_KREIS1_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS1_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS1_Info_15_01"); //Je suis prêt à entrer dans le Premier Cercle.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_02"); //Pour entrer dans le premier des Cercles tu dois savoir utiliser les runes.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_03"); //Chaque rune contient la structure d'un sort spécial.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_04"); //En utilisant tes propres pouvoirs magiques, tu pourras jeter le sort correspondant à la rune.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_05"); //Mais contrairement aux parchemins, qui sont aussi des formules magiques, le pouvoir magique de la rune ne garantie que ce que la structure du sort autorise.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_06"); //Chaque rune est une source de pouvoir magique qui est toujours disponible.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_07"); //Ton pouvoir magique s'épuise un peu plus chaque fois que tu utilises une rune, comme avec un parchemin.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_08"); //Chaque fois que tu entres dans un nouveau Cercle, tu apprends à te servir d'autres runes.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_09"); //Sers toi de la puissance des runes pour te connaître..
		KDW_600_Saturas_KREIS1.permanent = 0;
	};
};  
//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS2_Condition;
	information		= KDW_600_Saturas_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0); 
};

FUNC int  KDW_600_Saturas_KREIS2_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS2_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS2_Info_15_01"); //Je suis prêt à entrer dans le Second Cercle.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_02"); //Tu as appris le fonctionnement des runes. Maintenant il est temps d'approfondir ce savoir.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_03"); //Quand tu arrives dans le deuxième Cercle, tu n'apprends que les sorts basiques de combats, et surtout le secret de la guérison.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_04"); //Mais tu dois beaucoup apprendre pour découvrir les vrais secrets de la magie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_05"); //Tu sais que tu peux utiliser chaque rune aussi souvent que tu le désires jusqu'à épuisement de toutes tes propres puissances.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_06"); //Mais avant de passer aux actes, pense à ce que tu vas faire. Tu possèdes à présent les pouvoirs permettant de semer facilement la mort et la destruction.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_07"); //Mais un vrai magicien n'utilise la magie qu'en cas de nécessité.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_08"); //Analyse la situation, alors tu comprendras le pouvoir des runes.
		KDW_600_Saturas_KREIS2.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS3 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS3_Condition;
	information		= KDW_600_Saturas_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0); 
};

FUNC int  KDW_600_Saturas_KREIS3_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 2)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS3_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS3_Info_15_01"); //Peux-tu m'enseigner le troisième Cercle ?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_02"); //Le troisième Cercle est l'une des étapes les plus importantes dans la vie d'un magicien. Une fois atteint, tu n'as plus besoin de chercher.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_03"); //Tu as bien progressé sur le chemin de la magie. Tu sais utiliser les runes.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_04"); //Ce savoir est la base pour une autre voie. Utilise les runes avec prudence.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_05"); //Tu as le choix de te servir ou pas d'une rune. C'est à toi de décider.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_06"); //Une fois ce choix fait, il ne faut plus hésiter à te servir de ton pouvoir magique.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_07"); //Comprends ta voie, alors tu connaîtras le pouvoir de décider.
		KDW_600_Saturas_KREIS3.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER VIERTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS4 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS4_Condition;
	information		= KDW_600_Saturas_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0); 
};

FUNC int  KDW_600_Saturas_KREIS4_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS4_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS4_Info_15_01"); //Je suis prêt à entrer dans le Quatrième Cercle.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_02"); //Tu as gravi les trois premiers Cercles. Le temps est venu de t'enseigner les secrets de la magie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_03"); //La magie des runes est basée sur la pierre. Ce sont des pierres magiques, créées à partir de minerai magique.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_04"); //C'est le même minerai que celui que l'on extrait des mines. Il est enrichi dans les temples de formules magiques . Là les runes sont converties en instruments de notre pouvoir.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_05"); //Avec les runes que tu contrôles maintenant, tu connais sur le bout des doigts tout le savoir contenu dans les temples du royaume .
		//AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_07"); //Comprends la magie, tu découvriras le secret du pouvoir.
		KDW_600_Saturas_KREIS4.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							DER FÜNFTE KREIS							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_KREIS5 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS5_Condition;
	information		= KDW_600_Saturas_KREIS5_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,0); 
};

FUNC int  KDW_600_Saturas_KREIS5_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS5_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS5_Info_15_01"); //Je suis prêt à rentrer dans le Cinquième Cercle.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 5, LPCOST_TALENT_MAGE_5))
	{
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_02"); //Que cela soit. Je t'enseignerai les pouvoirs du Cinquième Cercle.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_03"); //La Tempête de Feu, la Vague de Glace et la destruction des morts-vivants, tout cela est écrit maintenant sur les runes que tu peux utiliser.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_04"); //"Mais le sort le plus puissant du Cinquième Cercle est l'Onde de la Mort. Si un jour cette rune est entre tes mains; tu posséderas des pouvoir dangereux."
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_05"); //Fais attention à utiliser le moins possible ce genre de magie. C'est un cadeau du dieu des ténèbres.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Tu en sais a présent autant que moi, je n'ai plus rien à t'apprendre.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_06"); //Teste tes possibilités, alors tu connaîtras ton vrai pouvoir.
		KDW_600_Saturas_KREIS5.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							SCHWERE ROBE								
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_HEAVYARMOR (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_HEAVYARMOR_Condition;
	information		= KDW_600_Saturas_HEAVYARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_SaturasHighRobe,VALUE_KDW_ARMOR_H); 
};

FUNC int  KDW_600_Saturas_HEAVYARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_HEAVYARMOR_Info()
{
	AI_Output				(other, self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01"); //J'ai aimé revêtir la Grande Robe de l'Eau.
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) < 4)
	&& (Kapitel < 5)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02"); //Le temps n'est pas venu pour toi de porter la Grande Robe longue.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03"); //Le peu de minerai que tu possèdes ne couvrirait même pas les coûts de fabrication.
	}
	else
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04"); //Le moment est venu. Tu es digne de porter la Grande Robe de l'Eau.
		KDW_600_Saturas_HEAVYARMOR.permanent = 0;

		B_GiveInvItems		(hero,self,	ItMinugget,VALUE_KDW_ARMOR_H);
		CreateInvItem		(hero,		KDW_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
	};
}; 

//---------------------------------------------------------------------
//	Info NOWSLD
//---------------------------------------------------------------------
instance Info_Saturas_NOWSLD (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NOWSLD_Condition;
	information	= Info_Saturas_NOWSLD_Info;
	permanent	= 0;
	important	= 0;
	description = "Lee m'a admis parmi les mercenaires.";
};

FUNC INT Info_Saturas_NOWSLD_Condition()
{	
	if	Npc_KnowsInfo(hero, Sld_700_Lee_CHANGESIDE)
	{
		return TRUE;
	}; 
};

FUNC VOID Info_Saturas_NOWSLD_Info()
{
	AI_Output			(hero,self,"Info_Saturas_NOWSLD_15_01"); //Lee m'a admis parmi les mercenaires.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_02"); //Bien. Très bien. Alors tu fais dès à présent partie de notre communauté.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_03"); //Sois le bienvenu !

	B_LogEntry			(CH4_BannedFromOC,"Saturas m'a maintenant officiellement accueilli comme mercenaire.");
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);	
};

//---------------------------------------------------------------------
//	Info XARDAS
//---------------------------------------------------------------------
instance Info_Saturas_XARDAS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDAS_Condition;
	information	= Info_Saturas_XARDAS_Info;
	permanent	= 0;
	important	= 0;
	description = "Quand vous m'avez envoyé aux Magiciens du Feu, vous avez mentionné QUELQU'UN...";
};

FUNC INT Info_Saturas_XARDAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_COLLAPSE)
	&&	Npc_KnowsInfo(hero, Info_Saturas_MURDER)
	{		 										//***Björn***>

		if( (Npc_GetTrueGuild(hero)!=GIL_GRD)  &&  (Npc_GetTrueGuild(hero)!=GIL_KDF)  )
		{
			return TRUE;
		};

/*												
		if 		(oldHeroGuild==GIL_GRD)
		{
			if (Npc_GetTrueGuild(hero)==GIL_SLD)
			{
				return TRUE;
			};
		}
		else if (oldHeroGuild==GIL_KDF)
		{
			if (Npc_GetTrueGuild(hero)==GIL_KDW)
			{
				return TRUE;
			};
		}
		else
		{
			return TRUE;
		}; 											<***Björn***
*/												

	};	
};

FUNC VOID Info_Saturas_XARDAS_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_01"); //Quand tu m'as envoyé chez les Magiciens du Feu, tu as mentionné que c'était... QUELQU'UN.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_02"); //Et bien, j'avais espéré que nous pourrions le faire sans son aide, mais les choses se déroulent....
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_03"); //Qui est-IL ?
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_04"); //Très bien, très bien!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_05"); //Il y a très, très longtemps
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_06"); //Va à l'essentiel, s'il te plait!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_07"); //Un peu de patience ! Bon, quand nous - les douze magiciens - avons créé la Barrière, nos puissances magiques ont été dirigées et commandées par un treizième magicien.
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_08"); //Un treizième magicien ? J'ai toujours pensé qu'il y en avait seulement douze !
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_09"); //La plupart des personnes qui n'était pas là pendant les premiers jours de la colonie pensent ça.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_10"); //Ce treizième magicien était notre chef. Tout ceci a eu lieu avant que nous soyons divisés en cercles du Feu et de l'Eau.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_11"); //Mais il a quitté le Vieux camp, qui était par le passé l'unique camp de la colonie.
};

//---------------------------------------------------------------------
//	Info XARDASWHO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHO_Condition;
	information	= Info_Saturas_XARDASWHO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Comment s'appelle ce treizième magicien ?";
};

FUNC INT Info_Saturas_XARDASWHO_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHO_15_01"); //Comment s'appelle ce treizième magicien ?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_02"); //Il s'appelle Xardas. Presque personne ne se souvient des vieilles histoires qui couraient à son sujet !
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_03"); //Ce sont ceux là qui l'appellent simplement le NECROMANCER !
};

//---------------------------------------------------------------------
//	Info XARDASWHY
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHY (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHY_Condition;
	information	= Info_Saturas_XARDASWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Pourquoi a-t-il laissé le Vieux Camp ?";
};

FUNC INT Info_Saturas_XARDASWHY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHY_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_01"); //Pourquoi a-t-il laissé le Vieux Camp ?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_02"); //Il a commencé par étudier l'invocation des morts-vivants et des créatures magiques.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_03"); //Gomez n'était pas le seul qui a commencé à s'inquiéter. La plupart des autres magiciens se sont opposés aussi bien à lui qu'à ses actes impies.
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_04"); //Qu'est-il arrivé alors ?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_05"); //À la différence de Gomez, ce n'était pas un égorgeur, c'est pourquoi il a évité le conflit et s'en est allé.
};

//---------------------------------------------------------------------
//	Info XARDASWHERE
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHERE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHERE_Condition;
	information	= Info_Saturas_XARDASWHERE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Où est ce magicien aujourd'hui ?";
};

FUNC INT Info_Saturas_XARDASWHERE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHERE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHERE_15_01"); //Où est ce magicien aujourd'hui ?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_02"); //Il vit en solitaire dans sa tour, au milieu de la terre des Orcs.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_03"); //C'est à l'endroit le plus au sud de la colonie.
};

//---------------------------------------------------------------------
//	Info XARDASHELP
//---------------------------------------------------------------------
instance Info_Saturas_XARDASHELP (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASHELP_Condition;
	information	= Info_Saturas_XARDASHELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "Je trouverai mon chemin jusqu'à Xardas et lui demanderai de l'aide !";
};

FUNC INT Info_Saturas_XARDASHELP_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHO)
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHY) 
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHERE) 
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASHELP_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_01"); //Je trouverai mon chemin jusqu'à Xardas et lui demanderai de l'aide !
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_02"); //C'est le seul qui peut nous aider maintenant.
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_03"); //S'il sait que c'est sans issue ou qu'il ne veut pas nous aider...
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_04"); //IL VOUDRA !
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_05"); //Il y a un autre problème...
	
	B_Story_FindXardas	();
};

//---------------------------------------------------------------------
//	Info XARDASPROBLEM
//---------------------------------------------------------------------
instance Info_Saturas_XARDASPROBLEM (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASPROBLEM_Condition;
	information	= Info_Saturas_XARDASPROBLEM_Info;
	permanent	= 0;
	important 	= 0;
	description = "Un problème ?";
};

FUNC INT Info_Saturas_XARDASPROBLEM_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASHELP)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_01"); //Un problème ?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_02"); //Oui. Tout au long de ces dernières années nous avons essayé de contacter Xardas à maintes reprises.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_03"); //Mais il il semble qu'il ne veut pas être dérangé.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_04"); //Qu'est-ce que ça signifie ?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_05"); //Aucun des messagers n'est jamais revenu de sa tour.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_06"); //Tu devras trouver une solution pour passer ses créatures.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_07"); //Ressembler à ça, va être intéressant !
	
	B_LogEntry			(CH4_FindXardas,"Saturas m'a averti des créatures magiques de Xardas, le Nécromancien. Il a décrit les dangers et les faiblesses de ces créatures dans la bibliothèque des Magiciens de l'Eau. Je dois prendre quelque instants pour y jeter un oeil.");	
};

//---------------------------------------------------------------------
//	Info XARDASGO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASGO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASGO_Condition;
	information	= Info_Saturas_XARDASGO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Comment arriverai-je devant ces créatures ?";
};

FUNC INT Info_Saturas_XARDASGO_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASPROBLEM)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASGO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_01"); //Comment arriverai-je devant ces créatures ?
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_02"); //Si je le savais, je te le dirais !
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_03"); //Je t'ai conseillé de faire quelques recherches dans notre bibliothèque.
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_04"); //Peut-être trouveras-tu quelque chose dans les vieux livres concernant les forces et les faiblesses des créatures appelées par magie.
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_05"); //Je vais fouiller toute la bibliothèque. Et ne t'inquiéte pas...
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_06"); //Je reviendrais !

	B_LogEntry			(CH4_FindXardas,"Il y a des écritures sur les dangers et les faiblesses de ces créatures dans la bibliothèque des Magiciens de l'Eau. Je dois prendre quelque instants pour jeter un oeil.");
	
};

/*------------------------------------------------------------------------
//	TIMESUP- Xardas ist die Schlüsselperson, Saturas ist nicht mehr wichtig									
------------------------------------------------------------------------*/
instance KDW_600_Saturas_TIMESUP (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_TIMESUP_Condition;
	information		= KDW_600_Saturas_TIMESUP_Info;
	important	    = 1;
	permanent		= 0;
};

FUNC int  KDW_600_Saturas_TIMESUP_Condition()
{	
	if FindOrcShaman == LOG_RUNNING
	|| FindOrcShaman == LOG_SUCCESS
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_TIMESUP_Info()
{
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_00"); //As-tu parlé à Xardas ?
	Info_ClearChoices	(KDW_600_Saturas_TIMESUP);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Hé bien...",KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Non..",KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Cela ne correspond pas à ce que tu penses...",KDW_600_Saturas_TIMESUP_JA3);

};
func void KDW_600_Saturas_TIMESUP_JA1()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_01"); //Hé bien...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_02"); //Bon… Bon quoi…?
	//AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_03"); //Äh ... noch nicht ... ich bin aber schon unterwegs ...
	//AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_04"); //Beeile dich, wir dürfen keine Zeit mehr verlieren!
	//B_Story_CancelFindXardas();
	//AI_StopProcessInfos(self);
};
func void KDW_600_Saturas_TIMESUP_JA2()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_05"); //Non..
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_06"); //Pourquoi pas ?
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_07"); //Je ne pourrais pas aller dans ce coin pourtant...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_08"); //Tu devais le trouver et lui demander conseil !
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};
func void KDW_600_Saturas_TIMESUP_JA3()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_09"); //Cela ne correspond pas à ce que tu penses...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_10"); //Que veux-tu dire ? Il doit trouver la solution pour faire sauter le tas de minerai !
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_11"); //Le tas de minerai…ahem...... Il est devenu énorme !
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_12"); //Trouve Xardas, il à besoin d'aide !
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};




//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////// SLD zu Magier		//////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

// ****************************************
// 			Aufnahme eines Sld 
// ****************************************

instance KDW_600_Saturas_HogeAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHME_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHME_Info;
	permanent		= 0;
	description		= "Nefarius a dit que j'étais prêt à porter la robe d'un Magicien de l'Eau."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHME_Condition()
{	
	if ( Npc_KnowsInfo(hero,Info_Saturas_MURDER) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHME_Info()
{
	AI_Output(other, self,"KDW_600_Saturas_HogeAUFNAHME_15_00"); //Nefarius a dit que j'étais prêt à porter la robe d'un Magicien de l'Eau.
	
	/* AB HIER IST ALLES DOPPELT - geklaut aus der KdF-KdW-Aufnahme */
	
	AI_Output(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Alors je te souhaite la bienvenue au nom de notre communauté.
	AI_Output(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Est-ce que ça signifie que j'appartiens maintenant à la guilde des Magiciens de l'Eau ?
	AI_Output(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Pas encore. D'abord tu dois prononcer le serment de l'Eau.
};
	
// ****************************************
// 			Aufnahme eines Sld - Teil 2
// ****************************************
instance KDW_600_Saturas_HogeAUFNAHMETeil2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHMETeil2_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHMETeil2_Info;
	permanent		= 0;
	description		= "Je suis prêt à faire le serment."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHMETeil2_Condition()
{	
	if ( (Npc_KnowsInfo(hero,KDW_600_Saturas_HogeAUFNAHME)) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHMETeil2_Info()
{
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Je suis prêt à faire le serment.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //A présent prononce ces paroles :
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Je jure par la force des dieux...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Je jure par la force des dieux...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //... Et par le pouvoir de l'Eau Sacrée...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //... Et par le pouvoir de l'Eau Sacrée...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //... que mon savoir et mes actions dorénavant et pour toujours ne feront qu'un avec l'Eau...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //... que mon savoir et mes actions dorénavant et pour toujours ne feront qu'un avec l'Eau...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //... jusqu'à ce que mon corps revienne au royaume de Beliar et que la source de ma vie se soit tarie.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //... jusqu'à ce que mon corps revienne au royaume de Beliar et que la source de ma vie se soit tarie.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Revêts cette longue robe comme signe de ton lien avec l'Eau sacrée et avec Adanos.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	Log_CreateTopic		(CH4_SldToKdW,	LOG_NOTE);
	B_LogEntry			(CH4_SldToKdW,"Saturas m'a maintenant admis dans le Cercle de l'Eau.");

	AI_StopProcessInfos	(self);
};

