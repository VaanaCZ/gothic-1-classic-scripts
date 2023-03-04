// ************************************************************
// 			  				   EXIT 
// ************************************************************

instance  DIA_Fletcher_EXIT (C_INFO)
{
	npc			=	Grd_255_Fletcher;
	nr			=	999;
	condition	=	DIA_Fletcher_EXIT_Condition;
	information	=	DIA_Fletcher_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  DIA_Fletcher_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fletcher_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
//						FIRST	NACHT				
// ************************************************************

instance DIA_Fletcher_First (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_First_Condition;
	information		= DIA_Fletcher_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_First_Condition()
{	
	if (Wld_IsTime(00,00,06,00))
	{
		return 1;
	};
};

func void  DIA_Fletcher_First_Info()
{
	AI_Output (self, other,"DIA_Fletcher_First_06_00"); //Hé, toi !
	AI_Output (other, self,"DIA_Fletcher_First_15_01"); //Qui ? Moi ?
	AI_Output (self, other,"DIA_Fletcher_First_06_02"); //Tu me comprends, fiston !
	AI_Output (self, other,"DIA_Fletcher_First_06_03"); //Laisse-moi te dire une bonne chose : C'est MON coin. Et je ne veux pas d'ennuis !
	AI_Output (self, other,"DIA_Fletcher_First_06_04"); //Mais les nouveaux comme toi ont toujours des problèmes. Particulièrement la nuit quand ils fouinent aux alentours.
	AI_Output (self, other,"DIA_Fletcher_First_06_05"); //Mais pourquoi tu ne retourne pas chez toi ? au moins je serais sûr de ne plus te revoir ici ! Il y a une cabane vide en face de l'arène, la seule avec un auvent. Va dormir un peu.
	AI_Output (self, other,"DIA_Fletcher_First_06_06"); //Et si je t'attrape dans une autre cabane, je ferais en sorte que tu le regrettes toute ta vie.
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
//							Hallo				
// ************************************************************
	var int fletcher_whytalk;
// ************************************************************

instance DIA_Fletcher_Hello (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 2;
	condition		= DIA_Fletcher_Hello_Condition;
	information		= DIA_Fletcher_Hello_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  DIA_Fletcher_Hello_Condition()
{	
	if (Npc_IsInState(self,ZS_Talk))
	{
		return 1;
	};
};

func void  DIA_Fletcher_Hello_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_15_00"); //Hé, toi !
	AI_Output (self, other,"DIA_Fletcher_Hello_06_01"); //Si tu veux te débarrasser de l'argent de ta protection - tu n'as pas choisi le bon jour.
	AI_Output (other, self,"DIA_Fletcher_Hello_15_02"); //Ouais ? Et pourquoi ?
	AI_Output (self, other,"DIA_Fletcher_Hello_06_03"); //Parce que je ne suis pas là.
	
	Info_ClearChoices	(DIA_Fletcher_Hello);
	Info_AddChoice		(DIA_Fletcher_Hello,"Je vois.",DIA_Fletcher_Hello_ISee);
	Info_AddChoice		(DIA_Fletcher_Hello,"Alors comment puis-je te parler ?",DIA_Fletcher_Hello_WhyTalk);
	Info_AddChoice		(DIA_Fletcher_Hello,"Oh, où es-tu alors ?",DIA_Fletcher_Hello_WhereElse);
};

func void DIA_Fletcher_Hello_WhereElse()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhereElse_15_00"); //Oh, où es-tu alors ?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhereElse_06_01"); //En réalité, je suis au château, assis devant un grand feu, une pinte de bière à la main.
};

func void DIA_Fletcher_Hello_WhyTalk()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_WhyTalk_15_00"); //Alors comment puis-je te parler ?
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_01"); //Nek a disparu. Ce coin est d'habitude sous sa responsabilité.
	AI_Output (self, other,"DIA_Fletcher_Hello_WhyTalk_06_02"); //Et jusqu'à son retour, Thorus m'a commandé de le garder.
	fletcher_whytalk = TRUE;
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

func void DIA_Fletcher_Hello_ISee()
{
	AI_Output (other, self,"DIA_Fletcher_Hello_ISee_15_00"); //Je vois.
	Info_ClearChoices	(DIA_Fletcher_Hello);
};

// ************************************************************
//						Wo Nek				
// ************************************************************

instance DIA_Fletcher_WoNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WoNek_Condition;
	information		= DIA_Fletcher_WoNek_Info;
	permanent		= 0;
	description		= "Sais-tu où Nek est allé ?";
};

func int DIA_Fletcher_WoNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_STT_315_LostNek) || (fletcher_whytalk==TRUE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WoNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WoNek_15_00"); //Sais-tu où Nek est allé ?
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_01"); //Non, et je suis incapable de le trouver.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_02"); //Quoiqu'il se passe, les mineurs du coin pourrait être au courant. Mais les mineurs ne parlent pas avec les gardes.
	AI_Output (self, other,"DIA_Fletcher_WoNek_06_03"); //Et encore moins maintenant qu'ils savent que je déteste ce travail dégoûtant. Je suis sûr qu'ils rient dès que j'ai le dos tourné !
	
	Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	B_LogEntry			(CH1_LostNek,"Peut-être que les mineurs dans le quartier de l'arène savent où Nek a disparu.");
};

// ************************************************************
//						Trotzdem Schutzgeld				
// ************************************************************

instance DIA_Fletcher_TroSchu (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_TroSchu_Condition;
	information		= DIA_Fletcher_TroSchu_Info;
	permanent		= 0;
	description		= "Pourquoi ne récoltes-tu pas plus d'argent de protection ?";
};

FUNC int  DIA_Fletcher_TroSchu_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_Hello) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_TroSchu_Info()
{
	AI_Output (other, self,"DIA_Fletcher_TroSchu_15_00"); //Pourquoi ne récoltes-tu pas plus d'argent de protection ?
	AI_Output (self, other,"DIA_Fletcher_TroSchu_06_01"); //Nek avait fait sa tournée avant de disparaître. Il n'y a plus grand-chose à récolter.
};

// ************************************************************
//						Wegen Nek			
// ************************************************************
	var int fletcher_foundNek;
// ************************************************************

instance DIA_Fletcher_WegenNek (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_WegenNek_Condition;
	information		= DIA_Fletcher_WegenNek_Info;
	permanent		= 1;
	description		= "A propos de Nek...";
};

FUNC int  DIA_Fletcher_WegenNek_Condition()
{	
	if ( Npc_KnowsInfo(hero,DIA_Fletcher_WoNek) && (fletcher_foundNek==FALSE) )
	{
		return 1;
	};
};

func void  DIA_Fletcher_WegenNek_Info()
{
	AI_Output (other, self,"DIA_Fletcher_WegenNek_15_00"); //A propos de Nek...
	AI_Output (self, other,"DIA_Fletcher_WegenNek_06_01"); //Ouais?
	
	var C_NPC Nek; Nek = Hlp_GetNpc(Grd_282_Nek);
	
	if ( (Sly_LostNek == LOG_SUCCESS) || (!Hlp_IsValidNpc(Nek)) )
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_02"); //Je crois que je l'ai trouvé.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_03"); //Quoi ? Ou est-il ?
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_04"); //Bouffé par les rats...
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_05"); //Oh non ! Bon Dieu ! Cela signifie que je vais être en première ligne maintenant. Et moi qui pensais qu'il allait revenir..
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_06"); //Maintenant j'ai un problème..
		fletcher_foundNek = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Fletcher_WegenNek_15_07"); //Aucune nouvelle.
		AI_Output (self, other,"DIA_Fletcher_WegenNek_06_08"); //Tiens moi au courant..
	};
};

// ************************************************************
//						Problem
// ************************************************************

instance DIA_Fletcher_Problem (C_INFO)
{
	npc				= Grd_255_Fletcher;
	nr 				= 1;
	condition		= DIA_Fletcher_Problem_Condition;
	information		= DIA_Fletcher_Problem_Info;
	permanent		= 0;
	description		= "Quel est le problème ?";
};

FUNC int  DIA_Fletcher_Problem_Condition()
{	
	if ( fletcher_foundNek == TRUE )
	{
		return 1;
	};
};

func void  DIA_Fletcher_Problem_Info()
{
	AI_Output (other, self,"DIA_Fletcher_Problem_15_00"); //Quel est le problème ?
	AI_Output (self, other,"DIA_Fletcher_Problem_06_01"); //Je me suis endetté jusqu'au cou auprès de Scatty. Et maintenant qu'il sait que je remplace Nek, il va venir me tourner autour tous les jours...
};	












//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

// ************************************************************
//						GARDIST GEWORDEN					
// ************************************************************
instance Grd_255_Fletcher_WELCOME (C_INFO)
{
	npc				= Grd_255_Fletcher;
	condition		= Grd_255_Fletcher_WELCOME_Condition;
	information		= Grd_255_Fletcher_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_255_Fletcher_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  Grd_255_Fletcher_WELCOME_Info()
{
	AI_Output (self, other,"Grd_255_Fletcher_WELCOME_Info_06_01"); //Tu nous a rejoins assez vite. Bienvenue chez les gardes !
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Fletcher_DIE (C_INFO)
{
	npc			= Grd_255_Fletcher;
	condition	= Info_Fletcher_DIE_Condition;
	information	= Info_Fletcher_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Fletcher_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Fletcher_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_01"); //Traître ! Quand je pense qu'on a laissé quelqu'un comme toi entrer chez les gardes. Pfff !
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_02"); //C'est l'un de ces Mages du Feu renégats ! Pouah !
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_03"); //Salut, espèce de traître ! Comme tu as fait partie de la bande à Gomez, maintenant il ne faudra plus compter sur les Ombres pour nous donner un coup de main !
		};			

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_04"); //Hé, Fletcher, de quoi tu parles ?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_05"); //Tu es dedans avec ce déchet du Nouveau camp, n'est-ce pas ? 
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_06"); //Attends...
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_07"); //Je devine ce que tu penses: tu as supposé que nous n'arriverions pas à comprendre ça, hein ?
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_08"); //Houlà... Tenez vos chevaux!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_09"); //Non, TOI tu gardes les mains…sur ta tête parce que sinon que tu vas vite manquer à l'appel.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_10"); //MEURS, TRAITE!!

		if	Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn s'est retranché à la porte arrière. Il a réagi de la même manière que Fletcher à l'entrée principale. Je ne sais pourquoi, mais cela doit avoir un lien avec ma recherche de la pierre focale dans le Nouveau Camp.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, qui garde l'entrée principale du Vieux Camp avec un groupe de gardes, m'a traité de traître et de renégat. Il ne m'a pas écouté et m'a attaqué !");
			B_LogEntry			(CH4_BannedFromOC,"Il semble que j'ai été banni du Vieux Camp !");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_11"); //Regarde-moi ça. C'est un gars du Nouveau camp !
		}
		else
		{
			AI_Output	(self,hero,"Info_Fletcher_DIE_06_12"); //Regarde-moi ça. C'est un gars du camp Marécageux!
		};

		AI_Output		(hero,self,"Info_Fletcher_DIE_15_13"); //Et alors ? C'est quoi ton travail?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_14"); //On aura ta mine bientôt. 
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_15"); //Ah ouais? Tu rêves!
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_16"); //Désolé, mais je ne peux pas prendre le risque que tu racontes ça à n'importe qui !
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_17"); //Attends, je ne veux pas d'ennuis.
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_18"); //Tu aurais dû y penser avant de te montrer ici !
		AI_Output		(hero,self,"Info_Fletcher_DIE_15_19"); //Hé, qu'est-ce qui ?
		AI_Output		(self,hero,"Info_Fletcher_DIE_06_20"); //Allez-y les enfants, arrêtez-le !
	};

	Npc_ExchangeRoutine	(self,	"FMTaken2");				// Verstärkung vor das Haupttor (Anführer)
	B_ExchangeRoutine	(GRD_252_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_253_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor
	B_ExchangeRoutine	(GRD_244_Gardist,	"FMTaken2");	// Verstärkung vor das Haupttor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_214_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor
	B_ExchangeRoutine	(GRD_215_Torwache,	"FMTaken2");	// reguläre Wache am Haupttor

	B_SetPermAttitude	(GRD_255_Fletcher,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_252_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_253_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_244_Gardist,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_214_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_215_Torwache,	ATT_HOSTILE);
	
	if	!Npc_KnowsInfo(hero, Info_Bloodwyn_DIE)
	{
		B_LogEntry		(CH4_Firemages,"Les portes du Vieux Camp sont dorénavant fermées, elles sont protégées par des gardes. Ils attaquent tous ceux qui s'approchent du Camp.");
	};
	
	AI_StopProcessInfos	(self);
};

