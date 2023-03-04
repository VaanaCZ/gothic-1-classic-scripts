// **************************************************
//						EXIT 
// **************************************************
instance  PC_Psionic_Exit (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  999;
	condition	=  PC_Psionic_Exit_Condition;
	information	=  PC_Psionic_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =	DIALOG_ENDE;
};                       

FUNC int  PC_Psionic_Exit_Condition()
{
	return 1;
};

FUNC VOID  PC_Psionic_Exit_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_01"); //Allons-y !
	}
	else
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); //Puisse le Dormeur te protéger !
	};
	
	AI_StopProcessInfos	( self );
};

// **************************************************
//			SAKRILEG! Meister angesprochen
// **************************************************
instance  DIA_Lester_Sakrileg (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Sakrileg_Condition;
	information	= DIA_Lester_Sakrileg_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_Sakrileg_Condition()
{
	if (BaalNamib_Sakrileg == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Sakrileg_Info()
{
	AI_Output (self, other,"DIA_Lester_Sakrileg_05_00"); //Tu t'es adressé à un Sage ! Ne fait plus jamais cela ! C'est un sacrilège ! Si un maître veut te parler, IL s'adressera à TOI.
};

// **************************************************
//						Hallo
// **************************************************

instance  DIA_Lester_Hallo (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  1;
	condition	=  DIA_Lester_Hallo_Condition;
	information	=  DIA_Lester_Hallo_Info;
	permanent	=  0;
	description = "Qui es-tu ?";
};                       

FUNC int  DIA_Lester_Hallo_Condition()
{
	if	(Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Lester_Hallo_Info()
{
	AI_Output (other, self,"DIA_Lester_Hallo_15_00"); //Qui es-tu ?
	AI_Output (self, other,"DIA_Lester_Hallo_05_01"); //Je suis Lester. Je m'occupe des étrangers qui arrivent ici.
	if (BaalNamib_Sakrileg == FALSE)
	{
		AI_Output (self, other,"DIA_Lester_Hallo_05_02"); //Tu as de la chance de ne pas avoir parlé à Baal Namib. On ne permet à aucun étranger de parler aux Sages.
	};
};

// **************************************************
//				Will mit Meister reden
// **************************************************

instance  DIA_Lester_WannaTalkToMaster (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaTalkToMaster_Condition;
	information	= DIA_Lester_WannaTalkToMaster_Info;
	permanent	= 0;
	description	= "Mais je veux parler à ton maître.";
};                       

FUNC int  DIA_Lester_WannaTalkToMaster_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) || Npc_KnowsInfo(hero,DIA_Lester_Sakrileg) )
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&  (!Npc_KnowsInfo(hero,DIA_Lester_ShowHallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaTalkToMaster_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaTalkToMaster_15_00"); //Mais je veux parler à ton maître.
	AI_Output (self, other,"DIA_Lester_WannaTalkToMaster_05_01"); //N'y pense pas ! Je suis sûr que je peux t'aider pour n'importe lequel de tes problèmes.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_CampInfo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_CampInfo_Condition;
	information	= DIA_Lester_CampInfo_Info;
	permanent	= 1;
	description	= "Dit-moi quelque chose à propos du Camp.";
};                       

FUNC int  DIA_Lester_CampInfo_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) )
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_CampInfo_Info()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_15_00"); //Dit-moi quelque chose à propos du Camp.
	AI_Output (self, other,"DIA_Lester_CampInfo_05_01"); //Que veux-tu savoir ?
	Info_Clearchoices (DIA_Lester_CampInfo);
	Info_Addchoice (DIA_Lester_CampInfo,DIALOG_BACK,DIA_Lester_CampInfo_BACK); 
	Info_Addchoice (DIA_Lester_CampInfo,"Parle-moi des guildes.",DIA_Lester_CampInfo_GIL);
	Info_Addchoice (DIA_Lester_CampInfo,"Que peux-tu me dire à propos du Dormeur ?",DIA_Lester_CampInfo_SLEEPER);
	Info_Addchoice (DIA_Lester_CampInfo,"Que sais-tu de l'Herbe ?",DIA_Lester_CampInfo_HERB);
};
func void DIA_Lester_CampInfo_BACK()
{
	Info_Clearchoices (DIA_Lester_CampInfo);
};

func void DIA_Lester_CampInfo_GIL()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_GIL_15_00"); //Parle-moi des guildes.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_01"); //Les Sages forment la guilde la plus élevée. Ils sont l'esprit de ce camp, parce que ils possèdent une grande puissance. Les templiers emploient leur puissance spirituelle dans la bataille.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_02"); //Ils ont un pouvoir invincible. Tu ferais mieux de ne jamais avoir d'ennuis avec eux. Quant à moi, je suis un novice. Nous prions le Dormeur et effectuons tout les travaux du camp.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_03"); //Certains des novices ont la permission de rejoindre les Sages, mais pour cela il leurs faut étudier pendant de longues d'années.
};
func void DIA_Lester_CampInfo_SLEEPER()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //Que peux-tu me dire à propos du Dormeur ?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //Le Dormeur est une créature divine. Il donne des visions - du moins il en donne aux Sages.
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //Nous le prions, parce qu'il nous donnera la liberté.
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //Et tu crois cela ?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //Hé, j'ai été à l'intérieur de la Barrière pendant deux ans. Sais-tu combien de temps ça représente DEUX ANS ?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //Tu ne peux pas imaginer ce que je suis disposé à croire et à faire juste pour sortir encore d'ici !
};
func void DIA_Lester_CampInfo_HERB()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_HERB_15_00"); //Que sais-tu de l'Herbe ?
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_01"); //Et Bien, l'Herbe pousse dans le marais. Naturellement elle doit être traitée pour qu'elle puisse être fumée. C'est le travail des novices.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_02"); //L'Herbe a un effet tranquillisant et favorise la détente. Elle t'aide à te concentrer sur l'essentiel et à augmenter ton niveau de conscience.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_03"); //Nous les échangeons avec des marchandises du Vieux camp et nous les employons aussi pour recruter de nouvelles personnes.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_04"); //Évidement, le résultat est que certains nous rejoignent seulement pour l'Herbe. Et bien, au moins ils nous aident dans les travaux du camp.
};

// **************************************************
//					Wanna Join
// **************************************************

instance  DIA_Lester_WannaJoin (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaJoin_Condition;
	information	= DIA_Lester_WannaJoin_Info;
	permanent	= 0;
	description	= "Je veux devenir un membre de la Confrérie !";
};                       

FUNC int  DIA_Lester_WannaJoin_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaJoin_15_00"); //Je veux devenir un membre de la Confrérie !
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_01"); //Cor Kalom décide si tu es prêt à rejoindre la Confrérie.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_02"); //Mais il tiens compte de l'avis d'autres Sages. Baal Namib, là-bas, est l'un d'entre eux.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_03"); //D'abord tu devras montrer que tu es digne, et c'est seulement qu'un des Sages t'enverra à Cor Kalom.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_HowProofWorthy (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_HowProofWorthy_Condition;
	information	= DIA_Lester_HowProofWorthy_Info;
	permanent	= 0;
	description	= "Comment veux-tu que je travaille si aucun des Sages ne me parle ?";
};                       

FUNC int  DIA_Lester_HowProofWorthy_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_WannaJoin))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_HowProofWorthy_Info()
{
	AI_Output (other, self,"DIA_Lester_HowProofWorthy_15_00"); //Comment veux-tu que je travaille si aucun des Sages ne me parle ?
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_01"); //Les Sages observent tout ce que tu fais ici dans le camp.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_02"); //S'ils pensent que tu mérites de devenir un membre de la communauté, ils te parleront.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_03"); //Tu es obligé de trouver dans le camp des occasions de montrer que tu es digne.

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Si je veux rejoindre la Confrérie dans le Camp Marécageux, je dois impressionner les Sages. Malheureusement, ils ne parlent pas aux nouveaux venus. Lester, le novice, m'a dit qu'ils m'observent néanmoins et que je dois leur prouver ma dignité. Je n'ai pas le moindre indice de comment le faire ! Je devrais faire le tour du Camp.");

};

// **************************************************
//				WEIT WEG von BaalNamib
// **************************************************
	var int Lester_Show;
// **************************************************

instance  DIA_Lester_WeitWeg (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WeitWeg_Condition;
	information	= DIA_Lester_WeitWeg_Info;
	permanent	= 0;
	description	= "Comment puis-je faire pour que ton maître me parle ?";
};                       

FUNC int  DIA_Lester_WeitWeg_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) > 1000)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WeitWeg_Info()
{
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_00"); //Comment puis-je faire pour que ton maître me parle ?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_01"); //Tu dois savoir ce qu'il veut entendre.
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_02"); //Et c'est ?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_03"); //Écoute : Quand nous serons avec lui la prochaine fois, tu t'adresseras à moi et nous aurons un entretien.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_04"); //Baal Namib est inquiet parce que plusieurs des novices prient non seulement le Dormeur, mais également leurs anciens dieux.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_05"); //Tu me diras que tu as renoncé aux anciens dieux et que, à l'avenir, tu prieras seulement le Dormeur.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_06"); //Alors je te demanderai pourquoi tu as pris cette décision et tu diras que tu as eu une vision dans laquelle le Dormeur t'a appelé.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_07"); //Il sera alors intéressé. Tu penses pouvoir faire ça ?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_08"); //Aucun problème.
	
	B_LogEntry	(CH1_JoinPsi,"Pour impressionner Baal Namib, je dois m'adresser à Lester près du Sage et parler des vieux dieux et du Dormeur.");

	Lester_Show = TRUE;
};

// **************************************************
//					SHOW - Hallo
// **************************************************

instance  DIA_Lester_ShowHallo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_ShowHallo_Condition;
	information	= DIA_Lester_ShowHallo_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_ShowHallo_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) < 500)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Lester_Show == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_ShowHallo_Info()
{
	AI_Output (self, other,"DIA_Lester_ShowHallo_05_00"); //OH ! C'EST BON DE TE REVOIR. COMMENT VAS-TU ?
};

// **************************************************
//						SHOW
// **************************************************

instance  DIA_Lester_Show (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Show_Condition;
	information	= DIA_Lester_Show_Info;
	permanent	= 0;
	description	= "J'ai renoncé aux vieux dieux.";
};                       

FUNC int  DIA_Lester_Show_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if ( (Npc_GetDistToNpc(other,namib) < 500) && (BaalNamib_Ansprechbar==FALSE) && (Lester_Show == TRUE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Show_Info()
{
	AI_Output (other, self,"DIA_Lester_Show_15_00"); //J'AI RENONCÉ AUX ANCIENS DIEUX.
	AI_Output (self, other,"DIA_Lester_Show_05_01"); //VRAIMENT ? POURQUOI AVOIR FAIT CELA ?
	AI_Output (other, self,"DIA_Lester_Show_15_02"); //J'AI EU UNE VISION : LE DORMEUR M'A PARLÉ.
	AI_Output (self, other,"DIA_Lester_Show_05_03"); //QU'A-T-IL DIT ?
	AI_Output (other, self,"DIA_Lester_Show_15_04"); //IL A DIT : VA AU CAMP DANS LE MARAIS ET REJOINS LA CONFRÉRIE.
	AI_Output (self, other,"DIA_Lester_Show_05_05"); //TU ES TRES CHANCEUX, ÉTRANGER : LE DORMEUR NE RÉCOMPENSE PAS BEAUCOUP DE GENS COMME TOI.

	BaalNamib_Ansprechbar = TRUE;

	AI_StopProcessInfos(self);
};

// **************************************************
//				GUIDE	Offer
// **************************************************

instance  DIA_Lester_GuideOffer (C_INFO) //E3
{
	npc			= PC_Psionic;
	nr			= 5;
	condition	= DIA_Lester_GuideOffer_Condition;
	information	= DIA_Lester_GuideOffer_Info;
	permanent	= 0;
	description	= "Comment puis-je trouver mon chemin par ici, dans le Camp ?";
};

FUNC int  DIA_Lester_GuideOffer_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_GuideOffer_Info()
{
	AI_Output (other, self,"DIA_Lester_GuideOffer_15_00"); //Comment puis-je trouver mon chemin par ici, dans le Camp ?
	AI_Output (self, other,"DIA_Lester_GuideOffer_05_01"); //Je peux te montrer les endroits les plus importants.
};

// **************************************************
//				FÜHRUNG DURCHS PSI-CAMP
// **************************************************


// -----------UNTERWEGS--------------------  
instance  PC_Psionic_SOON (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_SOON_Condition;
	information	=  PC_Psionic_SOON_Info;
	important	=  0;	
	permanent	=  1;
	description = "Nous y sommes presque ?";
};                       

FUNC int  PC_Psionic_SOON_Condition()
{	
	if  (Npc_KnowsInfo (hero,DIA_Lester_GuideOffer))
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_SOON_Info()
{
	AI_Output (other, self,"PC_Psionic_SOON_Info_15_01"); //Nous y sommes presque ?
	AI_Output (self, other,"PC_Psionic_SOON_Info_05_02"); //Si tu cessais de me questionner, nous serions beaucoup plus rapide.
	AI_StopProcessInfos	( self );
};
//------ UNTERWEGS IM SUMPFLAGER UND ROUTE ÄNDERN ----------------
instance  PC_Psionic_CHANGE (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_CHANGE_Condition;
	information	=  PC_Psionic_CHANGE_Info;
	important	=  0;	
	permanent	=  1;
	description = "J'ai changé d'avis.";
};                       

FUNC int  PC_Psionic_CHANGE_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_Lester_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_CHANGE_Info()
{
	AI_Output (other, self,"PC_Psionic_CHANGE_Info_15_01"); //J'ai changé d'avis.
	AI_Output (self, other,"PC_Psionic_CHANGE_Info_05_02"); //Je suppose que tu sais où me trouver.
	AI_StopProcessInfos	( self );
	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");

};

//------------------FÜHRUNG DURCH DAS LAGER
instance  PC_Psionic_GUIDEFIRST (C_INFO)
{
	npc				= PC_Psionic;
	nr				= 5;
	condition		= PC_Psionic_GUIDEFIRST_Condition;
	information		= PC_Psionic_GUIDEFIRST_Info;
	important		= 0;
	permanent		= 1;
	description		= "Montre-moi le chemin..."; 
};

FUNC int  PC_Psionic_GUIDEFIRST_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_LESTER_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide == 0)
	{
		return TRUE;
	};
		

};
FUNC void  PC_Psionic_GUIDEFIRST_Info()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Montre-moi le chemin...
//	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_Info_05_02"); //Klar, wohin willst du?
	
	Info_ClearChoices (PC_Psionic_GUIDEFIRST);
	
	Info_Addchoice (PC_Psionic_GUIDEFIRST, DIALOG_BACK, PC_Psionic_GUIDEFIRST_BACK);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"retour à la porte principale",PC_Psionic_GUIDEFIRST_MAINGATE);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"Vers la forge",PC_Psionic_GUIDEFIRST_SMITH);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"Vers le temple",PC_Psionic_GUIDEFIRST_TEMPEL);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"Vers les professeurs privés",PC_Psionic_GUIDEFIRST_TRAIN);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"Vers l'alchimie des Magiciens de l'Eau.",PC_Psionic_GUIDEFIRST_HERB);

};  

func void PC_Psionic_GUIDEFIRST_MAINGATE()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
	LesterGuide = 0;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"START");
};

func void PC_Psionic_GUIDEFIRST_SMITH()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //... au magasin de forgeron.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //Suis moi!
	LesterGuide = 1;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void PC_Psionic_GUIDEFIRST_TEMPEL()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //... au temple.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //Suis moi!
	LesterGuide = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void PC_Psionic_GUIDEFIRST_TRAIN()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //... aux précepteurs.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //Suis moi!
	LesterGuide = 3;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void PC_Psionic_GUIDEFIRST_HERB()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //... au laboratoire d'alchimie !
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //Suis moi!
	LesterGuide = 4;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOHERB");
};

func void PC_Psionic_GUIDEFIRST_BACK()
{
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
};

// ***************************** Am Platz der Lehrer ****************************************//
instance  PC_Psionic_TRAIN (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TRAIN_Condition; 
	information		= PC_Psionic_TRAIN_Info;      
	important		= 1;
	permanent		= 1;
	 
};
FUNC int  PC_Psionic_TRAIN_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_PATH_9_4") < 500 )
	&& (LesterGuide == 3)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TRAIN_Info()
{
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_01"); //En bas tu trouveras Baal Cadar. Il enseigne les novices.
	AI_PointAt(self,"PSI_PATH_9_14");
	AI_StopPointAt (self);
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_02"); //Grimper à cette échelle te portera au au niveau de la formation des templiers. Je t'attendrai juste ici. Si tu tombes derrière, je serai encore avec Baal Namib à l'entrée au camp.

	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");
	AI_StopProcessInfos (self);
	TA_BeginOverlay		(self);
	TA_Stay			    (00,00,00,55,"PSI_PATH_9_4");
	TA_EndOverlay		(self);	
};  
// ***************************** Am Tempelplatz ****************************************//
instance  PC_Psionic_TEMPEL (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TEMPEL_Condition; 
	information		= PC_Psionic_TEMPEL_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_TEMPEL_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_TEMPLE_NOVIZE_PR") < 600 )
	&& (LesterGuide == 2)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TEMPEL_Info()
{
	AI_Output (self, other,"PC_Psionic_TEMPEL_Info_05_01"); //C'est le temple ! Je t'attendrai, mais si tu es trop long, je serais de nouveau avec Baal Namib.

	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_TEMPLE_NOVIZE_PR");  
	TA_EndOverlay (self);

};  
// ***************************** An der Schmiede ****************************************//
instance  PC_Psionic_SMITH (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_SMITH_Condition; 
	information		= PC_Psionic_SMITH_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_SMITH_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_SMITH_IN") < 900 )
	&& (LesterGuide == 1)
	{
		return 1;
	};

};

FUNC void  PC_Psionic_SMITH_Info()
{
	AI_Output (self, other,"PC_Psionic_SMITH_Info_05_01"); //"Voilà la forge ! Va faire un tour ; j'attendrai ici environ une heure, puis je partirai."
	LesterGuide = 0;
	
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_SMITH_IN");  
	TA_EndOverlay (self);
	
	
};   
// ***************************** Beim Krauthändler ****************************************// 
instance  PC_Psionic_HERB (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_HERB_Condition; 
	information		= PC_Psionic_HERB_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_HERB_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_WALK_06") < 800 )
	&& (LesterGuide == 4)
	{
		return TRUE;
	};
};
FUNC void  PC_Psionic_HERB_Info()
{
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_01"); //Si tu grimpe à cette échelle tu rencontreras Kalom, l'alchimiste. En bas se trouve Fortuno, le négociant d'Herbe.
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_02"); //Je t'attendrai juste ici. Mais ne sois pas trop long, autrement je m'en retournerai.
	
	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");

	AI_StopProcessInfos(self);

	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_32_HUT_EX");  
	TA_EndOverlay (self);
};    





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info SEND
//---------------------------------------------------------------------
instance  PC_Psionic_SEND (C_INFO)// PC muss im ersten Kapitel schon mal mit Lester geredet haben 
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_SEND_Condition;
	information		= PC_Psionic_SEND_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_SEND_Condition()
{
	//SN: NICHT auf Kapitel 2 abfragen, Kapitelwechel geschieht erst unten zentral für alle SC-Gilden!!!
	if	(Npc_GetTrueGuild(hero) != GIL_NONE)
	&&	(YBerion_BringFocus != LOG_RUNNING)
	&&	(YBerion_BringFocus != LOG_SUCCESS)
	{
		return 1;
	};
};

func void  PC_Psionic_SEND_Info()
{
	AI_GotoNpc			(self,hero);
	if (Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	{
		AI_Output		(self, other,"PC_Psionic_SEND_Info_05_00"); //Je suis heureux de te voir ici. J'ai des nouvelles pour toi.
		AI_Output		(other, self,"PC_Psionic_SEND_Info_15_01"); //De bonnes nouvelles, j'espère.
	};
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_02"); //Notre Confrérie projette quelque chose de vraiment important.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_03"); //Quel est ce plan ? Pour tout éclater ?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_04"); //Les Sages essayent d'entrer en contact avec le Dormeur. Mais ils ont besoin de quelque chose pour unir leurs puissances.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_05"); //Ah, et ?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_06"); //Ils ont besoin d'un objet magique, une pierre focale.

	B_Kapitelwechsel	(2);
};  

//---------------------------------------------------------------------
//	Info BROTHERHOOD_TODO
//---------------------------------------------------------------------
instance  PC_Psionic_BROTHERHOOD_TODO (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BROTHERHOOD_TODO_Condition;
	information		= PC_Psionic_BROTHERHOOD_TODO_Info;
	important		= 0;
	permanent		= 0;
	description		= "Que vas-tu obtenir de moi ?"; 
};

FUNC int  PC_Psionic_BROTHERHOOD_TODO_Condition()
{	
	if Npc_KnowsInfo (hero, PC_Psionic_SEND)
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_BROTHERHOOD_TODO_Info()
{
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //Que vas-tu obtenir de moi ?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //Parle à Y'Bérion. Il est l'homme le plus puissant dans le coin. C'est l'occasion d'avoir sa faveur.
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //Où est-il ?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //Va au temple. Il le quitte rarement. Il se sent probablement plus près du Dormeur dans ces ruines froides.

	Log_CreateTopic		(CH2_Focus,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Focus,	LOG_RUNNING);
	B_LogEntry			(CH2_Focus,"Lester, le novice, m'a dit qu' Y'Bérion cherche une pierre focale magique. Le Sage est à l'intérieur de la montagne du temple.");

	var C_NPC YBerion;
	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
};

//--------------------------------------- 

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##				
//#####################################################################

//	Suche Nach Dem Fokus In Der Bergfestung

//---------------------------------------------------------------------
//	Info FOLLOWME
//---------------------------------------------------------------------
instance PC_Psionic_FOLLOWME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOLLOWME_Condition;
	information		= PC_Psionic_FOLLOWME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOLLOWME_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_01") < 400 ) 
	&& ( Npc_GetDistToNpc (hero,PC_PSIONIC) <400)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOLLOWME_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_01"); //Hé, que fais-tu ici ?
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_02"); //Je suis envoyé ici sur l'ordre des Magiciens de l'Eau. Je suis à la recherche d'artefacts magiques, appelés pierres focales.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_03"); //tu recherches les pierres focales ? tu es vraiment courageux.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_04"); //Saturas et les autres magiciens du Nouveau camp veulent l'utiliser pour exploser la barrière afin de nous libérer de cet emprisonnement.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_05"); //Je croirais cela quand je le verrais de mes propres yeux.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_06"); //Je suis de ton avis. Mais dis-moi, pourquoi es-tu venu ici ?
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_07"); //Je me demande si ça vaut la peine de visiter le fort de la montagne.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_08"); //Tu sais... il y a un document que j'ai eu comme ça. D'autre part c'est risqué d'entrer là- bas.
};

// ***************************** INFOS ****************************************//
instance  PC_Psionic_GOLEM (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_GOLEM_Condition;
	information		= PC_Psionic_GOLEM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Comment as-tu réussi passer cette montagne vivante ?"; 
};

FUNC int  PC_Psionic_GOLEM_Condition()
{	
	if (Npc_KnowsInfo  (hero, PC_Psionic_FOLLOWME))
	&& (!Npc_KnowsInfo  (hero, PC_Psionic_FINISH ))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_GOLEM_Info()
{
	AI_Output (other, self,"PC_Psionic_NORMAL_Info_15_01"); //Comment as-tu réussi passer cette montagne vivante ?
	AI_Output (self, other,"PC_Psionic_NORMAL_Info_05_02"); //J'ai appris beaucoup des Sages. Leur magie peut être vraiment utile.
};  

//------------GESCHICHTE WARUM LESTER ZUR BERGFESTUNG GEHT--------------------
instance  PC_Psionic_STORY (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_STORY_Condition;
	information		= PC_Psionic_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ce document que tu recherches... Qu'est-ce que c'est ?"; 
};

FUNC int  PC_Psionic_STORY_Condition()
{	
	if	Npc_KnowsInfo (hero, PC_Psionic_FOLLOWME)  
	 
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_STORY_Info()
{
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_01"); //Ce document que tu recherches... Qu'est-ce que c'est ?
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_02"); //Il y a longtemps, le seigneur de ce secteur a vécu dans ce fort de montagne. Il contrôlait la terre et les mines.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_03"); //Comme n'importe quel autre aristocrate, il a eu, naturellement, un document pour authentifier son bail. Et j'aurais ce document.
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_04"); //Mais aussi longtemps que nous sommes prisonniers de la Barrière, il ne vaudra rien.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_05"); //C'est exact. Mais si les Mages de l'Eau parviennent à détruire la barrière, le document pourrait devenir alors tout à fait valable.
};  

// ***************************** INFOS ****************************************//
instance  PC_Psionic_COMEWITHME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEWITHME_Condition;
	information		= PC_Psionic_COMEWITHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Nous pouvons jeter un oeil autour du fort ensemble !"; 
};

FUNC int  PC_Psionic_COMEWITHME_Condition()
{	
	if	Npc_KnowsInfo(hero, PC_Psionic_STORY)
	&&	Npc_KnowsInfo(hero, PC_Psionic_GOLEM)
	{
		return TRUE;
	};
};

FUNC void  PC_Psionic_COMEWITHME_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEWITHME_Info_15_01"); //Nous pouvons jeter un oeil autour du fort ensemble !
	AI_Output (self, other,"PC_Psionic_COMEWITHME_Info_05_02"); //C'est une bonne idée. Vas-y en premier, je resterais près de toi.

	Log_CreateTopic		(CH3_Fortress,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Fortress,	LOG_RUNNING);
	B_LogEntry		(CH3_Fortress,"J'ai rencontré le novice Lester du Camp Marécageux devant une grande forteresse, qui est encastrée dans la montagne. Il cherche un document , et m'a rejoint dans ma recherche des pierres focales.");

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");
	AI_StopProcessInfos	(self);
};  

//--------------------SPIELER KOMMT MIT LESTER ZUM FOKUSPLATZ-------------------
instance PC_Psionic_FOKUSPLACE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOKUSPLACE_Condition;
	information		= PC_Psionic_FOKUSPLACE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOKUSPLACE_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_03_PATH_RUIN7") < 400 ) 
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOKUSPLACE_Info()
{
	AI_GotoNpc(self,hero);
	//AI_PointAt(FOKUSWP)
	AI_Output (self, other,"PC_Psionic_FOKUSPLACE_Info_05_01"); //Regarde là haut, ça ressemble à la pierre que tu recherches.
	AI_Output (other, self,"PC_Psionic_FOKUSPLACE_Info_15_02"); //Exact, ça ressemble à une plateforme de pierre focale, hmm... Pas facile à atteindre...
	AI_StopProcessInfos(self);

	B_LogEntry		(CH3_Fortress,"La pierre focale que je cherche est sur un piédestal. C'est trop haut à escalader, Je dois trouver une autre voie afin d'obtenir l'artefact.");	
	
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE2");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE3");
};

// ---------SPIELER WILL ÜBER DIE BRÜCKE OHNE DEN AUFTRAG ERFÜLLT ZU HABEN--------
instance PC_Psionic_COMEBACK (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEBACK_Condition;
	information		= PC_Psionic_COMEBACK_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_COMEBACK_Condition()
{	
	if ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2" ) < 600 )
	&& ( Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	&& (! Npc_HasItems (hero,Focus_3))
	{
		return TRUE;
	};
};
func void  PC_Psionic_COMEBACK_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_COMEBACK_Info_05_01"); //Où vas-tu ? Nous n'avons pas encore fini ici !
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine (self,"FORTRESSWAIT");
	AI_StopProcessInfos(self);
};

// -----SPIELER IST VERLETZT UND FRAGT NACH HILFE-------------------
instance  PC_Psionic_IAMHURT (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_IAMHURT_Condition;
	information		= PC_Psionic_IAMHURT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je suis blessé. Peux-tu m'aider ?"; 
};

FUNC int  PC_Psionic_IAMHURT_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]/2))
	&& (Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_IAMHURT_Info()
{
	AI_Output (other, self,"PC_Psionic_IAMHURT_Info_15_01"); //Je suis blessé. Peux-tu m'aider ?
	AI_Output (self, other,"PC_Psionic_IAMHURT_Info_05_02"); //Prendre cette potion de guérison.
	
	CreateInvItem (self,ItFo_Potion_Health_02);
	B_GiveInvItems 	(self, hero,ItFo_Potion_Health_02, 1);
};  

//------------- SPIELER HAT DIE URKUNDE FÜR LESTER GEFUNDEN-----------------------
instance  PC_Psionic_URKUNDE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_URKUNDE_Condition;
	information		= PC_Psionic_URKUNDE_Info;
	important		= 0;
	permanent		= 0;
	description		= "J'ai trouvé le document."; 
};

FUNC int  PC_Psionic_URKUNDE_Condition()
{	
	if(( Npc_HasItems (hero,ItWr_Urkunde_01 ))
	&&( Npc_KnowsInfo(hero,PC_Psionic_STORY)))  
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_URKUNDE_Info()
{
	AI_Output			(other, self,"PC_Psionic_URKUNDE_Info_15_01"); //J'ai trouvé le document.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_02"); //Hé, beau travail. Prend ces parchemins comme récompense. Avec eux tu pourras atteindre la pierre.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_03"); //Je t'attendrai en bas de la plateforme de la pierre focale.

	B_LogEntry		(CH3_Fortress,"L'acte du titre que Lester cherchait était dans un coffre. En échange il m'a donné quatre parchemins de sortilège de Psychokinésie, que je peux utiliser pour atteindre la pierre focale.");
	
	CreateInvItems		(self,ItArScrollTelekinesis,4);
	B_GiveInvItems 	(self, hero, ItArScrollTelekinesis,4);
	B_GiveInvItems	(hero, self, ItWr_Urkunde_01, 1);

	Npc_ExchangeRoutine	(self,	"WaitAtFocus");
	AI_StopProcessInfos	(self);
};

//-------------
instance  PC_Psionic_TIP (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_TIP_Condition;
	information		= PC_Psionic_TIP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Comment puis-je atteindre la pierre focale ?"; 
};

FUNC int  PC_Psionic_TIP_Condition()
{	
	if (Npc_KnowsInfo (hero, PC_Psionic_URKUNDE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_TIP_Info()
{
	AI_Output (other, self,"PC_Psionic_TIP_Info_15_01"); //Comment puis-je atteindre la pierre focale ?
	AI_Output (self, other,"PC_Psionic_TIP_Info_05_02"); //Maître Y'Bérion disait : Un étudiant essaye de déplacer des choses avec ses mains et les pieds, tandis que le maître les déplace avec ses puissances spirituelles.
// 	AI_Output (self, other,"PC_Psionic_TIP_Info_05_03"); //Hier ist ein guter Ort, um die Kraft des Geistes zu nutzen!
};  

// ---ALLES IN DER BERGFESTUNG ERLEDIGT ABER LESTER DIE URKUNDE NICHT GEGEBEN
instance PC_Psionic_LEAVE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_LEAVE_Condition;
	information		= PC_Psionic_LEAVE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_LEAVE_Condition()
{	
	if ( ! Npc_HasItems (hero, Focus_3) )
	&& ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&& ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2") < 900 )
	{
		return TRUE;
	};
};
func void  PC_Psionic_LEAVE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_LEAVE_Info_05_01"); //Je resterai ici pour trouver le document.
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos(self);
};

// --- Lester geht nach oben!-------------------------------
instance PC_Psionic_BALKON (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BALKON_Condition;
	information		= PC_Psionic_BALKON_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_BALKON_Condition()
{	
	if  ( ! Npc_HasItems  (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp (hero, "LOCATION_19_03_PEMTAGRAM2") < 1000 )

	{
		return TRUE;
	};
};
func void  PC_Psionic_BALKON_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_BALKON_Info_05_01"); //Je vais monter jeter un coup d'oeil.
	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine (self,"BALKON");

};
//---------------------------------------------------------------
instance PC_Psionic_FINISH (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FINISH_Condition;
	information		= PC_Psionic_FINISH_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FINISH_Condition()
{	
	if Npc_HasItems (hero,Focus_3)
	&& Npc_KnowsInfo(hero,PC_Psionic_URKUNDE)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FINISH_Info()
{
	AI_Output (self, other,"PC_Psionic_FINISH_Info_05_01"); //Maintenant nous avons tous les deux ce que nous avons voulu. Je resterai ici pour lire les anciens livres.
	AI_Output (other, self,"PC_Psionic_FINISH_Info_15_02"); //Nous nous reverrons.

	B_LogEntry		(CH3_Fortress,"J'ai récupéré la pierre focale. Lester veut toujours regarder aux alentours de la bibliothèque de la forteresse. Je me demande quand je le verrai de nouveau.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos	(self);
}; 
/*---------------------------------BALKON DER BERGFESTUNG									
------------------------------------------------------------------------*/

instance  PC_Psionic_CHESTCLOSED (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_CHESTCLOSED_Condition;
	information		= PC_Psionic_CHESTCLOSED_Info;
	important		= 0;
	permanent		= 0;
	description		= "As-tu trouvé quelque chose ?"; 
};

FUNC int  PC_Psionic_CHESTCLOSED_Condition()
{	
	if  ( ! Npc_HasItems (hero, Focus_3) )
	&&  ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp(hero,"LOCATION_19_03_SECOND_ETAGE_BALCON") < 500)
	{ 
		return TRUE;
	};

};
FUNC void  PC_Psionic_CHESTCLOSED_Info()
{
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //As-tu trouvé quelque chose ?
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //Le coffre est là-bas verrouillé. Peut-être pouvons-nous trouver la clef quelque part dans ce fort.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //As-tu trouvé le document ?
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //Non, pas encore...
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //Vas-tu chercher autour de la bibliothèque ?
	AI_StopProcessInfos(self);
};  
/*------------------------------------------------------------------------
							COME WITH ME AGAIN							
------------------------------------------------------------------------*/

instance  PC_Psionic_COMEAGAIN (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEAGAIN_Condition;
	information		= PC_Psionic_COMEAGAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Fouillons le fort ensemble."; 
};

FUNC int  PC_Psionic_COMEAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Psionic_LEAVE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_COMEAGAIN_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEAGAIN_Info_15_01"); //Fouillons le fort ensemble.
	AI_Output (self, other,"PC_Psionic_COMEAGAIN_Info_05_02"); //Bien, vas d'abord !
 
 	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");

	AI_StopProcessInfos(self);
};  

//---------------------------------------------------------------------
//	Info DIEGOMILTEN      ******Björn****** Patch2
//---------------------------------------------------------------------
INSTANCE Info_Lester_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Psionic;
	condition	= Info_Lester_DIEGOMILTEN_Condition;
	information	= Info_Lester_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "J'ai rencontré Diego et Milten devant le Vieux Camp !";
};                       

FUNC INT Info_Lester_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Lester_DIEGOMILTEN_Info()
{
	
	AI_Output	(hero,self,"Info_SFB_1_DieLage_15_00"); 				//Comment ça va ?
	AI_Output 	(self, hero,"PC_Psionic_FOLLOWME_Info_05_01"); 			//Hé, que fais-tu ici ?
	AI_Output	(hero,self,"Info_Saturas_COLLAPSE_15_01"); 				//La Vielle Mine s'est effondrée après que l'eau est suintée à l'intérieur !
	AI_Output 	(self, hero,"DIA_Fingers_BecomeShadow_05_01"); 			//Alors  ?
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_01"); 					//Tous les Magiciens du Feu sont morts !
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_02"); 					//Gomez les a assassinés.
	AI_Output 	(self, hero,"SVM_5_GetThingsRight"); 					//ça ne fut pas facile de sortir de là !
	AI_Output 	(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); 				//J'ai rencontré Diego et Milten devant le Vieux Camp !
	AI_Output 	(hero, self,"Info_lester_DIEGOMILTEN_15_01"); 			//Ils veulent te rencontrer. Au rendez-vous habituel.
	AI_Output 	(self, hero,"SVM_5_YeahWellDone"); 						//C'était juste !
	AI_Output 	(other, self,"Info_Gorn_RUINWALLWHAT_15_01"); 			//Que se passe t'il maintenant ?
	AI_Output 	(self, hero,"Info_lester_DIEGOMILTEN_05_02"); 			//Je resterai ici pour lire les anciens livres.
	AI_Output	(hero, self,"KDW_600_Saturas_OATH_Info_15_06"); 		//Heuu... Je ne comprends pas...
	AI_Output 	(self, hero,"PC_Psionic_TIP_Info_05_02"); 				//Maître Y'Bérion disait : Un étudiant essaye de déplacer des choses avec ses mains et les pieds, tandis que le maître les déplace avec ses puissances spirituelles.
	AI_Output	(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); 	//D'accord, D'accord, j'ai compris.
	AI_Output 	(self, hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); 	//Salut.
	AI_Output	(hero, self,"Info_FreemineOrc_EXIT_15_03"); 			//Merci. Je suis sur le départ maintenant.
	AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); 					//Puisse le Dormeur te protéger !
		
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


	AI_StopProcessInfos(self);

};
