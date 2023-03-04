// ************************	EXIT **************************

instance  Grd_260_Drake_Exit (C_INFO) //E1
{
	npc			=  Grd_260_Drake;
	nr			=  999;
	condition	=  Grd_260_Drake_Exit_Condition;
	information	=  Grd_260_Drake_Exit_Info;
	important	=  0;
	permanent	=  1;
	description	= DIALOG_ENDE;
};

FUNC int  Grd_260_Drake_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_260_Drake_Exit_Info()
{
	AI_Output			(other,	self,"Info_Exit_Info_15_01"); //A bientôt.
	AI_StopProcessInfos	( self );
};
/**************** GEFAHREN *********************/

INSTANCE  Grd_260_Drake_Gefahr (C_INFO)	//E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Gefahr_Condition;
	information		= Grd_260_Drake_Gefahr_Info;
	important		= 0;
	permanent		= 0;
	description		= "Qu'ai-je besoin de rechercher dans la mine ?";
};

FUNC INT  Grd_260_Drake_Gefahr_Condition()
{
		return (Npc_KnowsInfo (hero,Grd_260_Drake_Mine));
};

func VOID  Grd_260_Drake_Gefahr_Info()
{

	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//Qu'ai-je besoin de rechercher dans la mine ?
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//Chenille de mine, principalement. Des bêtes dangereuses.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//Nous avons dû renoncer à quelques cavernes à cause d'elles. Elles ont aussi dévoré quelques mineurs,
	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//Raconte-moi pour les Chenilles.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//Oh, j'ai la bouche sèche...
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//Apporte-moi une bière, et je t'en dirai plus sur les Chenilles.


};
/**************** CRAWLER, MEHR	GEFAHREN INFOS *********************/

INSTANCE  Grd_260_Drake_Crawler_Okay (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Crawler_Okay_Condition;
	information		= Grd_260_Drake_Crawler_Okay_Info;
	important		= 0;
	permanent		= 0;
	description		= "(donner bière)";
};

FUNC INT  Grd_260_Drake_Crawler_Okay_Condition()
{
	if (Npc_KnowsInfo (hero,Grd_260_Drake_Gefahr))
	{
			return 1;
	};
};
FUNC void Grd_260_Drake_Crawler_Okay_Info()
{
	if	( Npc_HasItems (hero,ItFobeer) )
	{
		AI_Output			(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//Voilà, bois à ma santé!!

		B_GiveInvItems		(hero, self, ItFoBeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,ItFobeer);

		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//Merci. Bien, les Chenilles vivent entassées, généralement dans les cavernes latérales.
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//Elles ne nous ont jamais attaqués ici, dans la galerie principale. Si jamais tu en rencontres une, sauve-toi !
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//Ou colle-toi le dos à la paroi. Comme ça, tu peux avoir une chance de leur échapper !

		//Grd_260_Drake_Crawler_Okay.permanent = 0;
	}
	else
	{
		AI_Output			(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//Tu te moques de moi ? Reviens quand tu auras de la bière.
   		Grd_260_Drake_Crawler_Okay.permanent = 1;
   };
};
// ***************** DIE MINE *****************************

instance  Grd_260_Drake_Mine (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Condition;
	information		= Grd_260_Drake_Mine_Info;
	important		= 0;
	permanent		= 0;
	description		= "Peux-tu me parler de la mine ?";
};

FUNC int  Grd_260_Drake_Mine_Condition()
{
	return 1;
};
func void Grd_260_Drake_Mine_Info ()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Info_15_01");//Peux-tu me parler de la mine ?
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_02");//Bien, l'endroit où nous sommes maintenant est la galerie principale. Un ensemble de passerelles conduit vers le fond.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_03");//Et ils creusent partout pour extraire du minerai. Mais il faut rester sur ses gardes, là aussi il y a beaucoup de Chenilles de mine.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_04");//Juste en bas se trouve la fonderie. Nous fondons un partie du minerai pour l'utiliser sur place.


};
// ***************** MEHR MINE *****************************
instance  Grd_260_Drake_Mine_Mehr (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Mehr_Condition;
	information		= Grd_260_Drake_Mine_Mehr_Info;
	important		= 0;
	permanent		= 0;
	description		= "Dis m'en plus sur la mine !";
};

FUNC int  Grd_260_Drake_Mine_Mehr_Condition()
{
	if ( Npc_KnowsInfo (hero, Grd_260_Drake_Mine) )
	{
		return 1;
	};
};
func void  Grd_260_Drake_Mine_Mehr_Info	()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//Dis m'en plus à ce sujet.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//Si tu veux en savoir davantage, va voir Viper, c'est un fondeur.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//Ou parle à Ian. C'est lui le chef. C'est lui qui dirige tout dans la mine.
	
};

// ***************** IAN *****************************
instance  Grd_260_Drake_Ian	(C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Ian_Condition;
	information		= Grd_260_Drake_Ian_Info;
	important		= 0;
	permanent		= 0;
	description		= "Où puis-je trouver Ian ?";
};

FUNC int  Grd_260_Drake_Ian_Condition()
{
	if !(Npc_KnowsInfo (hero,STT_301_IAN_HI)) && ( Npc_KnowsInfo (hero,	Grd_260_Drake_Mine_Mehr))
	{
		return TRUE;
	};

};
FUNC void  Grd_260_Drake_Ian_Info()
{
	AI_Output			(other,self,"Grd_260_Drake_Ian_Info_15_01");//Où puis-je trouver Ian ?
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_02");//Il est juste au milieu de la galerie principale, à côté de la réserve.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_03");//Oh, encore une chose - tu connais Thorus, n'est-ce pas? Et bien oublie-le !
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_04");//Il n'y a qu'une seule personne qui a la parole ici, et c'est Ian. C'est lui le chef.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_05");//Si tu as des ennuis avec lui, tu en auras aussi avec nous. Compris ?
};	 

/*------------------------------------------------------------------------
//						GARDEAUFNAHME								//
------------------------------------------------------------------------*/
instance Grd_260_Drake_GARDEAUFNAHME (C_INFO)
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_GARDEAUFNAHME_Condition;
	information		= Grd_260_Drake_GARDEAUFNAHME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_260_Drake_GARDEAUFNAHME_Condition()
{	
	if (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) 
	&& ( Npc_GetTrueGuild  (hero) == GIL_STT)
	&& (! Npc_KnowsInfo   (hero,Grd_264_Gardist_GARDEAUFNAHME))
	{
		return TRUE;
	};
};
func void  Grd_260_Drake_GARDEAUFNAHME_Info()
{
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //Hé, tu as fait du bon travail avec les Chenilles ! Tu mérites d'être admis au sein des gardes à présent !
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //Fais un saut jusqu'au Vieux camp et raconte ça à Thorus !

	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"Aussitôt avoir rapporté les oeufs, je devrais avoir un mot avec Thorus. Peut-être qu'il me laissera rejoindre les gardes.");
};

