// ************************************************************
// 							EXIT 
// ************************************************************
INSTANCE Info_BaalLukor_EXIT(C_INFO)
{
	npc				= GUR_1211_BaalLukor;
	nr				= 999;
	condition		= Info_BaalLukor_EXIT_Condition;
	information		= Info_BaalLukor_EXIT_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_BaalLukor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_BaalLukor_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//**************************************************************************
//	Info MEET: Erstes Zusammentreffen mit Baal Lukor
//**************************************************************************
INSTANCE Info_BaalLukor_MEET (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_MEET_Condition;
	information	= Info_BaalLukor_MEET_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_MEET_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_MEET_Info()
{
	AI_Output 		(self, other,"Info_BaalLukor_MEET_13_01"); //Merci pour ton aide. Tu es vraiment arrivé au bon moment.
	
	B_GiveXP		(XP_SaveBaalLukor);
};

//**************************************************************************
//	Info DEAD
//**************************************************************************
INSTANCE Info_BaalLukor_DEAD (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_DEAD_Condition;
	information	= Info_BaalLukor_DEAD_Info;
	nr			= 20;
	permanent	= 0;
	important 	= 0;
	description = "J'ai rencontré quelque templiers mort sur la route !";
};

FUNC INT Info_BaalLukor_DEAD_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_DEAD_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_01"); //J'ai découvert quelques templiers morts sur le chemin ! Que s'est-il passé ?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_02"); //Maître Cor Angar nous a envoyés ici pour étudier les cavernes.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_03"); //Nous pensions ne rien trouver,  seulement des tombes poussiéreuses et des momies à moitié décomposées.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_04"); //Soudain l'obscurité s'est altérée et des Orcs sont sortis de partout. Je ne sais pas ce qu'ils cherchaient, mais le fait de les voir ici est plus qu'inhabituel !
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_05"); //Où sont les autres templiers ?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_06"); //Morts ! Sans le savoir,  je les ai conduits jusqu'à l'endroit de leur massacre. J'espère que le Dormeur me le pardonnera.

	B_LogEntry		(CH3_OrcGraveyard,"J'ai sauvé la vie du Sage Baal Lukor dans le cimetière Orc pendant une attaque Orcs. Tout ses templiers sont morts dans la bataille contre ces affreuses créatures.");
};

//**************************************************************************
//	Info SUMMONING
//**************************************************************************
INSTANCE Info_BaalLukor_SUMMONING (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SUMMONING_Condition;
	information	= Info_BaalLukor_SUMMONING_Info;
	nr			= 10;
	permanent	= 0;
	important 	= 0;
	description = "Cor Angar m'envoie !";
};

FUNC INT Info_BaalLukor_SUMMONING_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_SUMMONING_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_01"); //C'est Cor Angar qui m'envoie ! As-tu trouvé une trace du Dormeur ?
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_02"); //Pas si vite. Parle-moi d'Y'Bérion ? Est-il revenu à lui ?
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_03"); //Non, il est toujours inconscient.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_04"); //Nous devons résoudre l'énigme de ces cavernes. Après toutes ces pertes terribles je ne peux plus revenir les mains vides à la communauté.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_05"); //Mais mes aptitudes de combat sont limitées et de plus les Orcs résistent à mes sorts contrairement aux personnes crédules du Vieux camp.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_06"); //Si notre Confrérie t'a envoyé, peut-être pourrais-tu m'aider à fouiller de nouveau ce tombeau.
};

//**************************************************************************
//	Info HELP
//**************************************************************************
INSTANCE Info_BaalLukor_HELP (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HELP_Condition;
	information	= Info_BaalLukor_HELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "Je vais t'aider.";
};

FUNC INT Info_BaalLukor_HELP_Condition()
{
	return Npc_KnowsInfo(hero, Info_BaalLukor_SUMMONING);
};

FUNC VOID Info_BaalLukor_HELP_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_HELP_15_01"); //Je vais t'aider.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_02"); //Bon, je dirais même plus, c'est excellent. Il y a trois galeries qui partent de cette salle. Nous devrions toutes les explorer.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //En avant. Je te suis !

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor m'a rejoint, ensemble nous résoudrons le secret de ce vieil endroit !");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info FOUNDNONE
//**************************************************************************
INSTANCE Info_BaalLukor_FOUNDNONE (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FOUNDNONE_Condition;
	information	= Info_BaalLukor_FOUNDNONE_Info;
	permanent	= 1;
	important 	= 0;
	description = "Je n'ai pu rien découvrir !";
};

FUNC INT Info_BaalLukor_FOUNDNONE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(BaalLukor_BringParchment == 0)
	&&		!Npc_HasItems(hero, OrkParchmentOne)
	&&		!Npc_HasItems(hero, OrkParchmentTwo)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FOUNDNONE_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDNONE_15_01"); //Je n'ai pu rien découvrir !
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDNONE_13_02"); //Nous devons fouiller les trois galeries.
	
	
	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2
};

//**************************************************************************
//	Info FOUNDONE
//**************************************************************************
INSTANCE Info_BaalLukor_FOUNDONE (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FOUNDONE_Condition;
	information	= Info_BaalLukor_FOUNDONE_Info;
	permanent	= 1;
	important 	= 0;
	description = "Apparemment il manque la moitié du parchemin !";
};

FUNC INT Info_BaalLukor_FOUNDONE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(((BaalLukor_BringParchment==1) && !Npc_HasItems(hero, OrkParchmentTwo)) || ((BaalLukor_BringParchment==2) && !Npc_HasItems(hero, OrkParchmentOne)))	)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FOUNDONE_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDONE_15_01"); //Apparemment il manque la moitié du parchemin !
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDONE_13_02"); //Il doit y a une deuxième partie. Chacun de nous doit chercher les trois galeries !
	
	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2
};

//**************************************************************************
//	Info FIRSTWAIT
//**************************************************************************
INSTANCE Info_BaalLukor_FIRSTWAIT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FIRSTWAIT_Condition;
	information	= Info_BaalLukor_FIRSTWAIT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_FIRSTWAIT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		(Npc_GetDistToWP(self, "GRYD_040")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FIRSTWAIT_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output 		(self, other,"Info_BaalLukor_FIRSTWAIT_13_01"); //Nous ne pouvons pas passer par ici ! Peut-être trouvera-t-on des indices dans les endroits que l'on cherche.

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "WaitInSideTunnelOne");
};

//**************************************************************************
//	Info FIRSTSCROLL
//**************************************************************************
INSTANCE Info_BaalLukor_FIRSTSCROLL (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FIRSTSCROLL_Condition;
	information	= Info_BaalLukor_FIRSTSCROLL_Info;
	permanent	= 0;
	important 	= 0;
	description = "J'ai trouvé un morceau de parchemin !";
};

FUNC INT Info_BaalLukor_FIRSTSCROLL_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		Npc_HasItems	(hero, OrkParchmentOne)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FIRSTSCROLL_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FIRSTSCROLL_15_01"); //J'ai trouvé un morceau de parchemin !
	B_GiveInvItems 	(hero, self, OrkParchmentOne,1); //Pergament1 übergeben
	if (BaalLukor_BringParchment == 2)
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_02"); //Très bien ! C'est l'autre moitié du parchemin des Orcs.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_03"); //ça ressemble à un parchemin d'Orc, mais il est coupé en deux.
		AI_Output 	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_04"); //Il doit y avoir l'autre moitié quelque part.
		AI_StopProcessInfos	(self);
		BaalLukor_BringParchment = 1;
	};
	
	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info SECONDWAIT
//**************************************************************************
INSTANCE Info_BaalLukor_SECONDWAIT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SECONDWAIT_Condition;
	information	= Info_BaalLukor_SECONDWAIT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_SECONDWAIT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		(Npc_GetDistToWP(self, "GRYD_047")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_SECONDWAIT_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output 		(self, other,"Info_BaalLukor_SECONDWAIT_13_01"); //Hmmm... ce tunnel se termine en cul-de-sac ! Tu pourras peut-être y trouver des indices qui nous aideront plus tard.

	if (!Npc_HasItems	(hero, OrkParchmentTwo)	) 
	{	
		AI_StopProcessInfos	(self);
		Npc_ExchangeRoutine	(self, "WaitInSideTunnelTwo");
	};
};

//**************************************************************************
//	Info SECONDSCROLL
//**************************************************************************
INSTANCE Info_BaalLukor_SECONDSCROLL (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SECONDSCROLL_Condition;
	information	= Info_BaalLukor_SECONDSCROLL_Info;
	permanent	= 0;
	description = "Il y a un morceau de parchemin ici !";
};

FUNC INT Info_BaalLukor_SECONDSCROLL_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		Npc_HasItems	(hero, OrkParchmentTwo)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_SECONDSCROLL_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self,	hero);

	AI_Output 		(other, self,"Info_BaalLukor_SECONDSCROLL_15_01"); //Il y a un morceau de parchemin ici !
	B_GiveInvItems 	(hero, self, OrkParchmentTwo,1); //Pergament2 übergeben
	if (BaalLukor_BringParchment == 1)
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_02"); //Très bien ! C'est l'autre moitié du parchemin des Orcs.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_03"); //ça ressemble à un parchemin d'Orc, mais il est coupé en deux.
		AI_Output 	(self, other,"Info_BaalLukor_SECONDSCROLL_13_04"); //Il doit y avoir l'autre moitié quelque part.
		AI_StopProcessInfos	(self);
		BaalLukor_BringParchment = 2;
	};

	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info BOTHSCROLLS
//**************************************************************************
INSTANCE Info_BaalLukor_BOTHSCROLLS (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_BOTHSCROLLS_Condition;
	information	= Info_BaalLukor_BOTHSCROLLS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Que faisons-nous avec ces deux morceaux maintenant ?";
};

FUNC INT Info_BaalLukor_BOTHSCROLLS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(BaalLukor_BringParchment == 3)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_BOTHSCROLLS_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_BOTHSCROLLS_15_01"); //Que faisons-nous avec ces deux morceaux maintenant ?
	AI_Output			(self, other,"Info_BaalLukor_BOTHSCROLLS_13_02"); //Les deux moitiés correspondent. Mais je ne comprends pas l'écriture des Orcs.

	B_LogEntry		(CH3_OrcGraveyard,"Nous avons trouvé deux moitiés d'un parchemin magique Orcish, mais Baal Lukor ne peut pas le traduire. Nous continuerons à chercher.");

	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2
};

//**************************************************************************
//	Info RUNES
//**************************************************************************
INSTANCE Info_BaalLukor_RUNES (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_RUNES_Condition;
	information	= Info_BaalLukor_RUNES_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_RUNES_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_BOTHSCROLLS)
	&&		((Npc_GetDistToWP	(hero, "GRYD_025")<600)	|| (Npc_GetDistToWP(hero, "GRYD_048")<600))	)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_RUNES_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_01"); //Attends! Voilà qui est intéressant...
	AI_Output 		(other, self,"Info_BaalLukor_RUNES_15_02"); //Et bien, je ne trouve rien d'intéressant ici.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_03"); //Ne fais pas de bruit et jete plutôt un coup d'oeil aux runes ornementales de cette caverne.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_04"); //Ouiii, ça devrait être suffisant pour traduire les deux moitiés du parchemin.
	B_UseFakeScroll ();
	//AI_Output		(self, other,"Info_BaalLukor_RUNES_13_05"); //...(murmel)...(murmel)...(murmel)... 
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_06"); //J'ai compris ! C'est un sort de téléportation. Il semble qu'il ne peut seulement être utilisé que dans un certain endroit.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_07"); //Étrange!

	Npc_RemoveInvItems	(self,			OrkParchmentOne, 1); //Pergament 1 entfernen
	Npc_RemoveInvItems	(self,			OrkParchmentTwo, 1); //Pergament 2 entfernen
	//Hier Teleport-Übergabe entfernt --> erst wenn vor wand!

	B_LogEntry			(CH3_OrcGraveyard,"À l'aide des inscriptions murales dans une des salles, Baal Lukor est capable de traduire le parchemin. Il semblerai que ce soit un charme de téléportation pour une distance très courte."); 


	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2

};

//**************************************************************************
//	Info WHATNOW
//**************************************************************************
INSTANCE Info_BaalLukor_WHATNOW (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_WHATNOW_Condition;
	information	= Info_BaalLukor_WHATNOW_Info;
	permanent	= 1;
	important 	= 0;
	description = "Quel endroit 'certain' ?";
};

FUNC INT Info_BaalLukor_WHATNOW_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_RUNES)
	&&		Npc_KnowsInfo(hero, Info_BaalLukor_HALLWITHOUT)
	&&		!Npc_KnowsInfo(hero, Info_BaalLukor_HALLWITH)		)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_WHATNOW_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_WHATNOW_15_01"); //Quel endroit 'certain' ?
	AI_Output 		(self, other,"Info_BaalLukor_WHATNOW_13_02"); //La grande salle que nous avons traversé plus tôt semblait très...... étrange. Retournons-y !

	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2

};


//**************************************************************************
//	Info HALLWITHOUT
//**************************************************************************
INSTANCE Info_BaalLukor_HALLWITHOUT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HALLWITHOUT_Condition;
	information	= Info_BaalLukor_HALLWITHOUT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_HALLWITHOUT_Condition()
{
	if (	!Npc_KnowsInfo	(hero, Info_BaalLukor_RUNES)
	&&		(Npc_GetDistToWP(hero, "GRYD_055")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_HALLWITHOUT_Info()
{
	B_FullStop		(hero);
	AI_SetWalkmode	(self,	NPC_WALK);
	AI_GotoNpc		(self, hero);

	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_01"); //Cet endroit... Je ne peux pas l'expliquer, mais cet endroit, ici...
	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_02"); //Bah, oublie ça. ça doit être mon imagination qui me joue des tours.

	B_LogEntry	(CH3_OrcGraveyard,"Quand nous sommes entrés dans la grande salle de colonne rectangulaire, le Sage a senti quelque chose. Cependant il n'était pas confiant.");

	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2
};

//**************************************************************************
//	Info HALLWITH
//**************************************************************************
INSTANCE Info_BaalLukor_HALLWITH (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HALLWITH_Condition;
	information	= Info_BaalLukor_HALLWITH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_HALLWITH_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_RUNES)
	&&		Npc_GetDistToWP	(hero, "GRYD_055")<500			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_HALLWITH_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_01"); //Cet endroit a une atmosphère particulière... Une impression de secret.
	AI_Output			(other, self,"Info_BaalLukor_HALLWITH_15_02"); //Cette salle me rappelle une image de ma vision.
	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_03"); //La vision... Nous sommes tout près du but...

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor a été investi par une puissance invisible, il est allé directement à un des murs de la grande salle.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "DOOR");
};

//**************************************************************************
//	Info DOOR
//**************************************************************************
INSTANCE Info_BaalLukor_DOOR (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_DOOR_Condition;
	information	= Info_BaalLukor_DOOR_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_DOOR_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HALLWITH)
	&&		Npc_GetDistToWP	(hero, "GRYD_060")<500				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_DOOR_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_01"); //Derrière le mur… ça doit être là !
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_02"); //Mes pouvoirs magiques sont toujours très faibles.
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_03"); //Utilise le sort de téléportation des Orcs ici, devant ce mur.
	
	CreateInvItem		(self,			ItArScrollTeleport4); //Teleport erschaffen
	B_GiveInvItems  	(self, hero,	ItArScrollTeleport4, 1); //Teleport übergeben
	
	AI_StopProcessInfos	(self);
};

//**************************************************************************
//	Info TELEPORT
//**************************************************************************
INSTANCE Info_BaalLukor_TELEPORT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_TELEPORT_Condition;
	information	= Info_BaalLukor_TELEPORT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_TELEPORT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_DOOR)
	&&		Npc_CanSeeNpcFreeLOS(self,	hero)	
	&&		Npc_GetDistToWP	(hero, "GRYD_072")<550				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_TELEPORT_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_01"); //Tu as trouvé l'endroit secret. Mon flair ne m'a pas trompé.
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_02"); //Et est-ce que la réponse à l'invocation étrange du Dormeur se trouve réellement ici ? ?
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_03"); //Pour moi, cela ressemble plus à une autre chambre mortuaire.
	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_04"); //Nous devons continuer.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //En avant. Je te suis !

	B_LogEntry		(CH3_OrcGraveyard,"À l'aide du charme de téléportation Orcish ,j'ai découvert une galerie secrète débouchant directement dans la grande salle.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"TELEPORT");
};

//**************************************************************************
//	Info ALTAR
//**************************************************************************
INSTANCE Info_BaalLukor_ALTAR (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_ALTAR_Condition;
	information	= Info_BaalLukor_ALTAR_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_ALTAR_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_TELEPORT)
	&&		Npc_GetDistToWP	(hero, "GRYD_082")<400
	&&		Npc_CanSeeNpcFreeLOS(self,hero)						)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_ALTAR_Info()
{
	B_FullStop			(hero);
	AI_GotoWP			(hero, "GRYD_081");
	AI_AlignToWP		(hero);

	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_01"); //NON ! Ce n'est pas vrai ! Il n'y a rien ici à part... de la poussière et... et des os.

	AI_SetWalkmode		(self, NPC_RUN);
	AI_GotoWP			(self, "GRYD_082");

	AI_PlayAniBS		(self, "T_STAND_2_PRAY", BS_SIT);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_02"); //NON!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_03"); //MAÎTRE, REPONDS MOI !!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_04"); //Dormeur, MONTRE TOI !!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_05"); //NOOONNN!!!

	AI_Output			(hero, self,"Info_BaalLukor_ALTAR_15_06"); //ça y est. Maintenant il est complètement fou !

	AI_StandUp			(self);
	B_WhirlAround		(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_07"); //Tout ça est de ta faute. Ta présence profane a exaspéré le Dormeur tout-puissant !
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_08"); //Maintenant je vais devoir supporter ton attitude sacrilège !
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_09"); //Je dois faire un sacrifice pour le maître. Un SACRIFICE HUMAIN ! ! !
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_10"); //Alors il va sûrement m'éclairer et faire de moi son serviteur.
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_11"); //MEURT, INFIDÈLE !!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_12"); //AIIIEEEE!!!!!!

	self.flags = 0;
	self.npctype = NPCTYPE_MAIN;
	BaalLukor_BringParchment = 4;
	Npc_SetTempAttitude	(self,	ATT_HOSTILE);
	Npc_SetPermAttitude	(self,	ATT_HOSTILE);
	//CreateInvItems		(self,	ItArScrollPyrokinesis,	3);

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor est devenu fou quand il a compris qu'il n'y a ABSOLUMENT RIEN ici. Finalement il m'a même attaqué. Cor Angar va nécessairement s'inquiéter quand il entendra cette histoire.");

	AI_StopProcessInfos	(self);

	AI_StartState		(self,	ZS_Attack,	1,	"");
};





