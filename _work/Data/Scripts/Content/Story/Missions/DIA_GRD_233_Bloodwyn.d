// ******************************************************************
// Zur Info: Bloodwyn: 244, 243; Bloodwyn: 229, 242; Fletcher: 241, 240

// ************************************************************
// 			  				   EXIT_Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_EXIT_Schutzgeld (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 999;
	condition	= Info_Bloodwyn_EXIT_Schutzgeld_Condition;
	information	= Info_Bloodwyn_EXIT_Schutzgeld_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Bloodwyn_EXIT_Schutzgeld_Condition()
{
	return 1;
};

FUNC VOID Info_Bloodwyn_EXIT_Schutzgeld_Info()
{	
	AI_Output (other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //A bientôt.
	if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //Fais attention à toi, gamin.
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //Et ne te fais pas de soucis pour le camp ! Nous monterons la garde à ta place.
	};
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
INSTANCE Info_Bloodwyn_Hello (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Hello_Condition;
	information	= Info_Bloodwyn_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Bloodwyn_Hello_Condition()
{	
	if (Kapitel <= 2) 
	{
		return 1;
	};
};
FUNC VOID Info_Bloodwyn_Hello_Info()
{	
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_00"); //Hé, toi !
	AI_Output (other, self,"Info_Bloodwyn_Hello_15_01"); //C'est à moi que tu parles?
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_02"); //Je te mets en garde ! Les gens comme toi peuvent vite tourner en rond et s'ennuyer ici !
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_03"); //Et la plupart des gars jetés ici sont des salauds
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_04"); //Ils pensent qu'ils peuvent te faire ce que bon leur semble. Mais nous empêcherons ça.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_05"); //Gomez veut faire régner la paix dans le camp, et nous autres gardes faisons en sorte qu'il l'obtienne. Mais c'est une mission qui revient cher.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_06"); //C'est pourquoi je te demande un peu de minerai. Considère ça comme une sorte de témoignage d'amitié. Tu nous aides, nous t'aiderons. Si tu as des ennuis, nous serons là.

	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Pourquoi pas ? A combien de minerai penses-tu ?",Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice		(Info_Bloodwyn_Hello,"Tu veux que je paies une protection ? Je peux prendre soin de moi !",Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice		(Info_Bloodwyn_Hello,"C'est une menace ?",Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output (other, self,"Info_Bloodwyn_ForgetIt_15_00"); //Tu es en train de me dire qu'il faut que je paye pour être en sécurité ? Non merci, je suis assez grand pour me garder tout seul !
	AI_Output (self, other,"Info_Bloodwyn_ForgetIt_08_01"); //Fais comme tu veux, gamin. Tu regretteras bientôt d'avoir dédaigné une offre amicale !
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output (other, self,"Info_Bloodwyn_SollDrohungSein_15_00"); //C'est une menace ?
	AI_Output (self, other,"Info_Bloodwyn_SollDrohungSein_08_01"); //Au contraire ! C'est une proposition amicale !
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //Pourquoi pas ? A combien de minerai penses-tu ?
	AI_Output (self, other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //Pas beaucoup. 10 minerais, c'est tout ce dont j'ai besoin.
	
	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"Je n'ai pas 10 minerais.",Info_Bloodwyn_Hello_NotNow);
	if (Npc_HasItems(other,itminugget)>=10)
	{
		Info_AddChoice	(Info_Bloodwyn_Hello,"Voilà ton minerai. Je peux avoir besoin d'un ami ou deux.",Info_Bloodwyn_Hello_OkTakeIt);
	};
};
// -------------------------------------------------------
func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //Voilà ton minerai. Je peux avoir besoin d'un ami ou deux.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //Tu as l'air d'être un jeune homme intelligent. Dorénavant, nous garderons un oeil sur toi.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //Mais cela ne signifie pas que tu peux faire ce que veux ici, d'accord ?
	
	B_GiveInvItems 	    (other, self, itminugget, 10);
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_NotNow()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_NotNow_15_00"); //Je n'ai pas 10 minerais.
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_01"); //Alors je prendrai ce que tu as - tu me donneras le reste la fois prochaine que je te verrais.
	AI_GotoNpc (self,other);
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_02"); //Fais voir...
		
	if (Npc_HasItems(other, itminugget) > 0)
	{
		if (Npc_HasItems(other, itminugget) > 9)
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //Hé, regarde ça ? On dirait quelqu'un qui ne sait pas compter jusqu'à 10, hein ?
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //Je vais juste prendre tout ce que tu as. Cela m'aidera à oublier que tu m'a menti.
		}
		else
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //Ah, je prends aussi les petits dons. C'est l'intention qui compte ! Merci pour le minerai, gamin !
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //A partir de maintenant, je ferais attention à toi à chaque fois que tu seras dans le camp.
		};
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //Hmmm, tu es vraiment fauché, n'est-ce pas ? Et bien, je devine qu'il y a toujours une prochaine fois...
	};
	
	B_GiveInvItems		(other, self, itminugget, Npc_HasItems(other, itminugget) );//Alle Nuggets entfernen
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

// ************************************************************
// 						Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_PayDay (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_PayDay_Condition;
	information	= Info_Bloodwyn_PayDay_Info;
	permanent	= 1;		
	important   = 1;				//*** NUR, WENN SC AUCH 10 ERZ HAT! ***
};                       

FUNC INT Info_Bloodwyn_PayDay_Condition()
{
	if ( (Kapitel <= 2) && (Bloodwyn_PayDay <= Wld_GetDay()-1) && (Npc_HasItems(other, itminugget)>=10) )
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayDay_Info()
{	
	if (Bloodwyn_ProtectionPaid == TRUE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_00"); //Ah, je suis content de te voir, mon ami!
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_01"); //Qu'en est-il de de ta contribution quotidienne ? Tu dois 10 minerais, tu sais.
		
		Info_ClearChoices	(Info_Bloodwyn_PayDay );
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Voilà, prend. 10 minerais ne sont pas grand chose entre amis.",Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice		(Info_Bloodwyn_PayDay,"Je ne paies pas - tu m'as assez prit.",Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_00"); //Hé, toi !
		AI_Output (other, self,"Info_Bloodwyn_PayDay_Den_15_01"); //Maintenant quoi?
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_02"); //C'est le moment pour toi de prouver que tu es un véritable ami.
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_03"); //Juste 10 minerais, et tu es dedans - qu'est-ce que tu en dis??
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //Voilà, prend. 10 minerais ne sont pas grand chose entre amis.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //C'est exactement ce que je pensais!
	
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //Je ne paies pas - tu m'as assez prit.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //Tu me déçois! Nous ne sommes plus amis. Méfie toi de ne pas te faire attaquer et voler tout seul maintenant !
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //Pas de soucis, je peux prendre soin de moi.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //Nous verrons...
	
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Npc_SetPermAttitude (self,ATT_ANGRY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

// ************************************************************
// 						DOCH zahlen
// ************************************************************

INSTANCE Info_Bloodwyn_Doch (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Doch_Condition;
	information	= Info_Bloodwyn_Doch_Info;
	permanent	= 1;
	description = "J'ai changé d'avis. Je vais te payer les 10 minerais après tout.";
};                       

FUNC INT Info_Bloodwyn_Doch_Condition()
{
	if (Bloodwyn_ProtectionPaid == FALSE)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_Doch_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_Doch_15_00"); //J'ai changé d'avis. Je vais te payer les 10 minerais après tout.
	if (Npc_HasItems(other, itminugget)>=10)
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_01"); //Là...! Tu vois que tu peux prendre les bonnes décisions!
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_02"); //Désormais, tu continueras à me payer ta contribution quotidienne, n'est-ce pas ?
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude (self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_NoOre_08_00"); //Alors reviens quand tu l'auras.
		AI_StopProcessInfos	(self);
	};
};


	

INSTANCE Info_Bloodwyn_PayForJesse (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 5;
	condition	= Info_Bloodwyn_PayForJesse_Condition;
	information	= Info_Bloodwyn_PayForJesse_Info;
	permanent	= 1;
	description = "Jesse m'a envoyé te payer ses 10 minerais pour lui.";
};                       

FUNC INT Info_Bloodwyn_PayForJesse_Condition()
{
	if (Jesse_PayForMe == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayForJesse_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_00"); //Jesse m'a envoyé te payer ses 10 minerais pour lui.
	if  (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_01"); //Ce que tu devrais faire, c'est payer TES 10 minerais.
	};
	AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_02"); //Ça ne fait rien pour Jesse. C'est un perdant, il n'est pas ici pour longtemps de toute façon.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_03"); //Non - j'ai payé pour lui. Alors prends ses 10 minerais et laisse-le !
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_04"); //D'accord, l'ami, si c'est ce que tu veux.
		Jesse_PayForMe = LOG_SUCCESS;
	}
	else
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_05"); //Oh! On dirait que je n'ai pas beaucoup de minerai sur moi.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_06"); //C'est un signe, l'ami! Réfléchis encore ! Payer pour ce clochard c'est gâcher du bon minerai !
	};
};
/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_233_Bloodwyn_WELCOME (C_INFO)
{
	npc				= GRD_233_Bloodwyn;
	condition		= GRD_233_Bloodwyn_WELCOME_Condition;
	information		= GRD_233_Bloodwyn_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_233_Bloodwyn_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_233_Bloodwyn_WELCOME_Info()
{
	AI_Output (self, other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //Tu es l'un de nous maintenant. Bien joué. Les gardes ont besoin de gens comme toi !
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
instance Info_Bloodwyn_DIE (C_INFO)
{
	npc			= Grd_233_Bloodwyn;
	condition	= Info_Bloodwyn_DIE_Condition;
	information	= Info_Bloodwyn_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Bloodwyn_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Bloodwyn_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_01"); //C'est un traître parmi nous ! Pouah ! Et dire qu'on t'as nommé garde !
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_02"); //Regarde comme nous avons fermé les yeux sur un des Mages du Feu rebelle !
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_03"); //C'est l'Ombre qui nous a trahis !
		};			

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_04"); //Attends. De quoi parles-tu, Bloodwyn ?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_05"); //Ainsi tu es de mèche avec le Nouveau camp, hein?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_06"); //Non, attends, je suis toujours...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_07"); //Je devine que tu pensais pouvoir toujours continuer comme ça.
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_08"); //Arrête ces idioties...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_09"); //Les traites comme toi ne méritent que la mort.
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_10"); //MEURS, TRAITE!!

		if	Npc_KnowsInfo(hero, Info_Fletcher_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"Fletcher, qui garde l'entrée principale maintenant, a réagi de la même manière que Bloodwyn à la porte arrière. Je ne sais pourquoi, mais cela doit avoir un lien avec ma recherche de la pierre focale dans le Nouveau Camp.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"Bloodwyn, qui garde la porte arrière du Vieux Camp avec un groupe de gardes, m'a traité de traître et de renégat. Il ne m'a pas écouté et m'a attaqué !");
			B_LogEntry			(CH4_BannedFromOC,"Il semble que j'ai été banni du Vieux Camp !");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_11"); //Ainsi tu as osé te risquer hors de ton Nouveau camp ? Voilà qui était vraiment stupide de ta part!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_12"); //Ainsi tu as osé te risquer hors de ton camp Marécageux? Voilà qui était vraiment stupide de ta part!
		};

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_13"); //Quoi? Qu'est-ce ça signifie?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_14"); //As-tu entendu dire que ta mine avait été attaquée ?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_15"); //Quoi...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_16"); //Désolé, mais on ne peut pas te laisser partir comme ça !
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_17"); //Hé, je ne veux pas d'ennuis...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_18"); //Tu aurais dû y penser avant!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_19"); //Écoute, j'en ai assez...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_20"); //Moi aussi ! TUE LE !
	};
	
	Npc_ExchangeRoutine	(self,				"FMTaken2");	// Verstärkung vor das Hinterem Tor (Anführer)
	B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor
	B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken2");	// Verstärkung vor das Hinterem Tor (Fernkämpfer)
	B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor
	B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken2");	// reguläre Wache am Hinteren Tor

	B_SetPermAttitude	(GRD_233_Bloodwyn,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_232_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_229_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_216_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_217_Torwache,	ATT_HOSTILE);

	
	if	!Npc_KnowsInfo(hero, Info_Fletcher_DIE)
	{
		B_LogEntry		(CH4_Firemages,"Les portes du Vieux Camp sont dorénavant fermées, elles sont protégées par des gardes. Ils attaquent tous ceux qui s'approchent du Camp.");
	};
	
	AI_StopProcessInfos	(self);
};

