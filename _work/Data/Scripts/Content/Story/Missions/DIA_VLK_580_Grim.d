// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grim_Exit (C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 999;
	condition	= DIA_Grim_Exit_Condition;
	information	= DIA_Grim_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grim_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				FALLE (Schutzgeld)
// **************************************************

INSTANCE DIA_Grim_Falle (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Falle_Condition;
	information		= DIA_Grim_Falle_Info;
	permanent		= 0;
	important 		= 1;
};

FUNC INT DIA_Grim_Falle_Condition()
{	
	if	(Grim_ProtectionBully == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_Falle_Info()
{
	AI_Output (self, other,"DIA_Grim_Falle_06_00"); //Hé, toi ! Tu n'es pas le gars qui veut rejoindre le Camp ?
	AI_Output (other, self,"DIA_Grim_Falle_15_01"); //Quoi si je suis ?
	AI_Output (self, other,"DIA_Grim_Falle_06_02"); //Je peux t'aider...
	AI_Output (other, self,"DIA_Grim_Falle_15_03"); //Et comment ?
	AI_Output (self, other,"DIA_Grim_Falle_06_04"); //Il y a deux gars assis devant le Camp, et un d'entre eux à volé quelque chose aux Barons du minerai. C'est une précieuse amulette, qui a dû arriver par le dernier convoie.
	AI_Output (self, other,"DIA_Grim_Falle_06_05"); //L'un d'entre eux doit encore être en possession de l'amulette. Si nous les attaquons ensembles, on peut les avoir - je ne pourrai pas le faire tout seul. Qu'est-ce que t'en dit ?
		
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"Pas intéressé - tu devras chercher quelqu'un d'autre.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"Que va-t-il arriver quand nous aurons l'amulette ?",DIA_Grim_Falle_HowShare);
	Info_AddChoice		(DIA_Grim_Falle,"Compte sur moi !",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output (other, self,"DIA_Grim_Falle_Deny_15_00"); //Pas intéressé - tu devras chercher quelqu'un d'autre.
	AI_Output (self, other,"DIA_Grim_Falle_Deny_06_01"); //Avec cette attitude tu ne feras pas de vieux os - Dit-le moi si tu changes d'avis !
	Info_ClearChoices	(DIA_Grim_Falle );
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output (other, self,"DIA_Grim_Falle_HowShare_15_00"); //Que va-t-il arriver quand nous aurons l'amulette ?
	AI_Output (self, other,"DIA_Grim_Falle_HowShare_06_01"); //C'est très simple ! Je le ramène et empoche la récompense. Je leurs dis que tu m'a aidé. Ainsi tu sera dans les petits papier de Gomez sans aucun doute... 
	
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"Pas intéressé - tu devras chercher quelqu'un d'autre.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"Non ! C'est 50-50 ou bien tu peux le faire seul !",DIA_Grim_Falle_HalfHalf);
	Info_AddChoice		(DIA_Grim_Falle,"Compte sur moi !",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output (other, self,"DIA_Grim_Falle_HalfHalf_15_00"); //Non ! C'est 50-50 ou bien tu peux le faire seul !
	AI_Output (self, other,"DIA_Grim_Falle_HalfHalf_06_01"); //D'accord, d'accord, moitié-moitié. Je suppose qu'il y en a assez pour nous deux de toute façon. Alors - je peux compter sur toi ?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output (other, self,"DIA_Grim_Falle_Accepr_15_00"); //Compte sur moi !
	AI_Output (self, other,"DIA_Grim_Falle_Accepr_06_01"); //très bien, dis-moi quand on peux commencer !
	Info_ClearChoices	(DIA_Grim_Falle );
};

// **************************************************
// 				Bereit für Falle
// **************************************************

INSTANCE DIA_Grim_ReadyToGo (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_ReadyToGo_Condition;
	information		= DIA_Grim_ReadyToGo_Info;
	permanent		= 0;
	description		= "Je suis prêt à aller avec toi - allons prendre l'amulette !";
};

FUNC INT DIA_Grim_ReadyToGo_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Falle))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_ReadyToGo_Info()
{
	AI_Output (other, self,"DIA_Grim_ReadyToGo_15_00"); //Je suis prêt à aller avec toi - allons prendre l'amulette !
	AI_Output (self, other,"DIA_Grim_ReadyToGo_06_01"); //D'accord, faisons le alors ...
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"GUIDE");
};	

// **************************************************
//				OC DRAUSSEN ANGEKOMMEN
// **************************************************

instance  DIA_Grim_AtOCdraussen(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 3;
	condition	= DIA_Grim_AtOCdraussen_Condition;
	information	= DIA_Grim_AtOCdraussen_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Grim_AtOCdraussen_Condition()
{
	if 	( Npc_KnowsInfo(hero,DIA_Grim_ReadyToGo)) && (Npc_GetDistToWp (hero,"OC_ROUND_22_CF_2_MOVEMENT") < 500 ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_Grim_AtOCdraussen_Info()
{
	AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_00"); //Alors nous voici - très loin de ton ami Diego.
	if ( ((Npc_GetDistToNpc(self,Bu520)<1000)&&(!Npc_IsDead(Bu520))) || ((Npc_GetDistToNpc(self,Bu534)<1000)&&(!Npc_IsDead(Bu534))) )
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_01"); //Nous t'envoyons les meilleurs voeux de Bloodwyn !
	}
	else
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_02"); //Je t'envoie les meilleurs voeux de Bloodwyn !
	};

	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
	
	var C_NPC Bu520; Bu520 = Hlp_GetNpc(Vlk_520_Buddler);
	var C_NPC Bu534; Bu534 = Hlp_GetNpc(Vlk_534_Buddler);
	
	if ( (Npc_GetDistToNpc(self,Bu520)<1000) && (!Npc_IsDead(Bu520)) )
	{
		Npc_SetTarget(Bu520,other);
		AI_StartState(Bu520,ZS_ATTACK,1,"");
	};
	
	if ( (Npc_GetDistToNpc(self,Bu534)<1000) && (!Npc_IsDead(Bu534)) )
	{
		Npc_SetTarget(Bu534,other);
		AI_StartState(Bu534,ZS_ATTACK,1,"");
	};
};

// **************************************************
// 				NACH Falle
// **************************************************

INSTANCE DIA_Grim_NACHFalle (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_NACHFalle_Condition;
	information		= DIA_Grim_NACHFalle_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Grim_NACHFalle_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Grim_AtOCdraussen)) && (Npc_GetDistToNpc(self,other)<ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_NACHFalle_Info()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_15_01"); //Idiot, tu voulais juste me piéger...
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_02"); //Hé, mec ! Nous sommes dans le même bateau ! Je ne creuses plus dans les mines.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_03"); //Alors j'accepterai ce que les gardes me diront, et je serai bientôt accepté.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_04"); //Que j'ai dû TE mettre une raclée devant tout le monde est ta propre faute. Pourquoi avoir commencé un combat sanglant avec les gardes ?
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_05"); //Personnellement, je n'ai rien contre toi. Alors que choisis-tu - la paix ou continuer le combat ?
	
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	Info_AddChoice		(DIA_Grim_NACHFalle,"Bat toi.",DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice		(DIA_Grim_NACHFalle,"Du calme.",DIA_Grim_NACHFalle_Frieden);
};


func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00"); //J'ai envie de combattre !
	AI_Output (self, other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01"); //Oh mec, tu m'as battu...
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	AI_StopProcessInfos	(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Frieden_15_00"); //La paix me parait acceptable.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_01"); //Je suis heureux que nous soyons quitte. Oublions ça. A partir de maintenant, je suis de ton côté.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_02"); //Si jamais tu as encore des ennuis, tu peux compter sur moi - Je te dois bien ça, après tout.
	Info_ClearChoices	(DIA_Grim_NACHFalle );

	Npc_SetPermAttitude(self,ATT_FRIENDLY);
};

// **************************************************
// 				Hallo
// **************************************************
	var int FirstOver;				
// **************************************************

INSTANCE DIA_Grim_Hallo (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 1;
	condition		= DIA_Grim_Hallo_Condition;
	information		= DIA_Grim_Hallo_Info;
	permanent		= 0;
	description		= "Je suis nouveau ici.";
};

FUNC INT DIA_Grim_Hallo_Condition()
{	
	if (Grim_ProtectionBully==TRUE)
	{
		FirstOver = TRUE;
	};
	
	if (FirstOver == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_Hallo_Info()
{
	AI_Output (other, self,"DIA_Grim_Hallo_15_00"); //Je suis nouveau ici.
	AI_Output (self, other,"DIA_Grim_Hallo_06_01"); //Juste arrivé, n'est-ce pas ? Je suis Grim - Je ne suis pas ici depuis longtemps non plus. J'ai été envoyé ici par les marchandises juste avant toi.
};

// **************************************************
// 						Leben
// **************************************************

INSTANCE DIA_Grim_Leben (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Leben_Condition;
	information		= DIA_Grim_Leben_Info;
	permanent		= 0;
	description		= "Quelle est la vie ici ?";
};

FUNC INT DIA_Grim_Leben_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Leben_Info()
{
	AI_Output (other, self,"DIA_Grim_Leben_15_00"); //Quelle est la vie ici ?
	AI_Output (self, other,"DIA_Grim_Leben_06_01"); //Tout va bien, aussi longtemps que tu payes ta protection aux gardes.
};

// **************************************************
// 						Aufnahme
// **************************************************

INSTANCE DIA_Grim_Aufnahme (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 3;
	condition		= DIA_Grim_Aufnahme_Condition;
	information		= DIA_Grim_Aufnahme_Info;
	permanent		= 0;
	description		= "Que dois-je faire si je veux devenir connu dans ce camp ?";
};

FUNC INT DIA_Grim_Aufnahme_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Grim_Aufnahme_15_00"); //Que dois-je faire si je veux devenir connu dans ce camp ?
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_01"); //Hé bien, avant tout tu dois devenir une Ombre. Par conséquent, tu dois trouver quelqu'un qui te parraine. Quelqu'un qui t'explique tout et prennent les responsabilités à ta place.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_02"); //Si j'étais toi j'essaierai de me rapprocher de Diego, il est vraiment correct.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_03"); //Il te fera passer l'épreuve de la Foi - c'est différent pour tout le monde. Ainsi il y aura d'autre petites taches pour les autres Ombres.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_04"); //Si tu leurs plait, tu sera des notres.
};

// **************************************************
// 						Wie weit bist DU?
// **************************************************
var int Grim_Tests;
// **************************************************

INSTANCE DIA_Grim_HowFarAreYou (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 4;
	condition		= DIA_Grim_HowFarAreYou_Condition;
	information		= DIA_Grim_HowFarAreYou_Info;
	permanent		= 1;
	description		= "Et - Où en es-tu de tes épreuves ?";
};

FUNC INT DIA_Grim_HowFarAreYou_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme) && Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_HowFarAreYou_Info()
{
	AI_Output (other, self,"DIA_Grim_HowFarAreYou_15_00"); //Et - Où en es-tu de tes épreuves ?
	AI_Output (self, other,"DIA_Grim_HowFarAreYou_06_01"); //J'ai déjà parlé à Dexter, Sly et Fingers. Ceux sont les Ombres les plus influentes ici dans le Camp.
	
	if	!Grim_Tests
	{
		B_LogEntry( CH1_JoinOC,"Dexter, Sly et Finger sont des Ombres influentes.");
		Grim_Tests = TRUE;
	};
};

// **************************************************
// 						Leben
// **************************************************

INSTANCE DIA_Grim_YourPDV (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 5;
	condition		= DIA_Grim_YourPDV_Condition;
	information		= DIA_Grim_YourPDV_Info;
	permanent		= 0;
	description		= "Quel était TON épreuve de foi ?";
};

FUNC INT DIA_Grim_YourPDV_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_YourPDV_Info()
{
	AI_Output (other, self,"DIA_Grim_YourPDV_15_00"); //Quel était TON épreuve de foi ?
	AI_Output (self, other,"DIA_Grim_YourPDV_06_01"); //Je ne peux pas te le dire, mec. Tu dois être muet pour des choses comme ça ici !
};



//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMO
//---------------------------------------------------------------------
instance  DIA_Grim_INEXTREMO(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 1;
	condition	= DIA_Grim_INEXTREMO_Condition;
	information	= DIA_Grim_INEXTREMO_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Grim_INEXTREMO_Condition()
{
	if	((Kapitel == 2) && (InExtremoPlaying == true))
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Grim_INEXTREMO_Info()
{
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_01"); //Hé, as-tu entendu les nouvelles ?
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_02"); //Les In Extremo sont ici. Ils sont sur la scène par là.
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_03"); //Vite, sinon, tu ratera le canot !

	Npc_ExchangeRoutine	(self,	"InExtremo");

	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMOAWAY
//---------------------------------------------------------------------
instance  DIA_Grim_INEXTREMOAWAY(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 1;
	condition	= DIA_Grim_INEXTREMOAWAY_Condition;
	information	= DIA_Grim_INEXTREMOAWAY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Où est In Extremo ?";
};                       

FUNC int  DIA_Grim_INEXTREMOAWAY_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Grim_INEXTREMO)
	&&	(Kapitel == 3) 
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Grim_INEXTREMOAWAY_Info()
{
	AI_Output			(hero, self,"DIA_Grim_INEXTREMOAWAY_15_01"); //Où est In Extremo ?
	AI_Output			(self, hero,"DIA_Grim_INEXTREMOAWAY_06_02"); //Ils sont partis. C'est une honte, j'étais vraiment déprimé le soir devant la scène.

	AI_StopProcessInfos	(self);
};

