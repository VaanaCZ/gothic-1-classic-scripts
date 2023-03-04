
// ************************ EXIT **************************

instance  STT_301_IAN_Exit (C_INFO)
{
	npc			=  STT_301_IAN;
	nr			= 999;
	condition	=  STT_301_IAN_Exit_Condition;
	information	=  STT_301_IAN_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_301_IAN_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_301_IAN_Exit_Info()
{
	AI_Output			(other, self,"STT_301_IAN_Exit_Info_15_01"); //Je vais faire un tour dans le coin.
	AI_Output			(self, other,"STT_301_IAN_Exit_Info_13_02"); //Ne crée pas d'ennuis.
	
	AI_StopProcessInfos	( self );
};
// ***************** Erstes Treffen *****************************

instance  STT_301_IAN_HI (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_HI_Condition;
	information		= STT_301_IAN_HI_Info;
	important		= 0;
	permanent		= 0;
	description		= "Es-tu Ian, le patron de la mine ?"; 
};

FUNC int  STT_301_IAN_HI_Condition()
{	
	if ( ! Npc_KnowsInfo (hero,STT_301_IAN_NEST))
	{	
		return TRUE;
	};
};
FUNC void  STT_301_IAN_HI_Info()
{
	AI_Output			(other, self,"STT_301_IAN_HI_Info_15_01"); //Es-tu Ian, le patron de la mine ?
	AI_Output			(self, other,"STT_301_IAN_HI_Info_13_02"); //Oui, je suis Ian. et c'est à moi. Alors ne touche ni ne casse quoi que ce soit
}; 
// ***************** Infos *****************************
instance STT_301_IAN_GOMEZ  (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GOMEZ_Condition;
	information		= STT_301_IAN_GOMEZ_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ce n'est pas la mine de Gomez ?"; 
};

FUNC int  STT_301_IAN_GOMEZ_Condition()
{	
	if Npc_KnowsInfo (hero,STT_301_IAN_HI)
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GOMEZ_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOMEZ_Info_15_01"); //Ce n'est pas la mine de Gomez ?
	AI_Output			(self, other,"STT_301_IAN_GOMEZ_Info_13_02"); //Oui, bien sûr c'est la mine du Vieux camp. Mais ici il y a un seul patron - et c'est moi.
}; 
// ***************** Infos *****************************
instance  STT_301_IAN_ORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_ORE_Condition;
	information		= STT_301_IAN_ORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Peux-tu me dire quelque chose sur la production du minerai ici ? "; 
};

FUNC int  STT_301_IAN_ORE_Condition()
{
	if Npc_KnowsInfo (hero,STT_301_IAN_GOMEZ)
	{
		return TRUE ;
	};

};
FUNC void  STT_301_IAN_ORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_ORE_Info_15_01"); //Peux-tu me dire quelque chose au sujet de la production de minerai ici ?
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_02"); //Nous creusons jour et nuit pour extraire le minerai. Ceci signifie un stockage de 200 sacs par mois plus 20 sacs qui seront fondus.
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_03"); //Des centaines de lames peuvent être forgées avec le minerai que nous fournissons au roi.
	
}; 
// ***************** Infos *****************************   
instance  STT_301_IAN_MORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MORE_Condition;
	information		= STT_301_IAN_MORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "J'ai entendu dire que le minerai a des qualités magiques. Parle-moi de cela."; 
};

FUNC int  STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_ORE) ;
};


FUNC void  STT_301_IAN_MORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MORE_Info_15_01"); //J'ai entendu dire que le minerai a des qualités magiques. Parle-moi de cela.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_02"); //Le minerai magique a des qualités spéciales. Les armes forgé avec ne se cassent pas et sont plus pointues que l'habituel.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_03"); //Une armée équipée de ces armes a un avantage décisif dans la bataille.
	
};   
// ***************** Infos *****************************  
instance  STT_301_IAN_MAGIC (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MAGIC_Condition;
	information		= STT_301_IAN_MAGIC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Dit-moi en plus sur le minerai."; 
};

FUNC int  STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_MORE) ;
};


FUNC void  STT_301_IAN_MAGIC_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MAGIC_Info_15_01"); //Dit-moi en plus sur le minerai.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_02"); //Malheureusement les puissances magiques du minerai disparaissent pendant le processus de fonte. Ils connaissent les bonnes techniques de fonte dans les hauts fourneaux de Nordmar.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_03"); //Mais même sans puissances magiques, les armes faites à partir de ce minerai sont extrêmement résistantes et font plus de dommages que les armes normales.
	
};   
// ***************** Infos *****************************   
instance  STT_301_IAN_MINE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MINE_Condition;
	information		= STT_301_IAN_MINE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Raconte-moi sur la mine."; 
};

FUNC int  STT_301_IAN_MINE_Condition()
{	
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (hero, STT_301_IAN_HI))
	{
		return TRUE;
	};

};
func void  STT_301_IAN_MINE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_01"); //Raconte-moi sur la mine.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_02"); //Si tu veux regarder autour d'ici tu dois faire attention. Il y a des Chenilles de mine dans les cavernes. Tu as intérêt à rester dans la galerie principale.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_03"); //Et laisser les templiers. Même s'ils traînent seuls la majeure partie du temps, ce sont les meilleurs combattants que tu puisses avoir à tes côtés quand on rencontre des Chenilles.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_04"); //Je garderai cela à l'esprit.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_05"); //J'ai du travail. Et ne prends pas mes hommes pour faire leur travail.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_06"); //Je jetterai juste un oeil par là.
};
/*------------------------------------------------------------------------
					BRING LIST									
------------------------------------------------------------------------*/

instance  STT_301_IAN_WANTLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_WANTLIST_Condition;
	information		= STT_301_IAN_WANTLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je suis ici pour prendre la liste pour le Camp."; 
};

FUNC int  STT_301_IAN_WANTLIST_Condition()
{
	if (Diego_BringList == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero,Info_Diego_IanPassword)) 
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_WANTLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_WANTLIST_Info_15_01"); //Je suis ici pour prendre la liste pour le Camp.
	AI_Output			(self, other,"STT_301_IAN_WANTLIST_Info_13_02"); //N'importe qui pourrait dire ça. Fous le camp.
	 
};  
/*------------------------------------------------------------------------
							LISTE ABHOLEN									
------------------------------------------------------------------------*/

instance  STT_301_IAN_GETLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GETLIST_Condition;
	information		= STT_301_IAN_GETLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Diego m'a envoyé. Je dois prendre la liste."; 
};

FUNC int  STT_301_IAN_GETLIST_Condition()
{	
	if (Diego_BringList == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GETLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_01"); //Diego m'a envoyé. Je dois prendre la liste.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_02"); //Bon, voici la liste. Dites-leur de se dépêcher avec les livraisons.
	B_LogEntry  (CH1_BringList,"Ian m'a donné la liste sans problème.");
	B_GiveInvItems	(self,hero,TheList,1);
};  
// **************************************************************************
// 							MISSION BRING MCQ EIER RUNNING , 
//							oder: Ohne Zahnrad keine Eier
// **************************************************************************  
instance  STT_301_IAN_NEST (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NEST_Condition;
	information	=  STT_301_IAN_NEST_Info;
	important	= 0;	
	permanent	= 0;
	description = "Il doit y avoir un nid de Chenilles des mines quelque part ici.";
};                       

FUNC int  STT_301_IAN_NEST_Condition()
{
	if (CorKalom_BringMCQBalls == LOG_RUNNING)
	&& ( Npc_KnowsInfo (hero,STT_301_IAN_HI) )
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_NEST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_01"); //Il doit y avoir un nid de Chenilles des mines quelque part ici.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_02"); //Il y a probablement des douzaines de nids ici.
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_03"); //Écoute, je dois aller à ce nid maintenant...
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_04"); //Je n'ai pas le temps pour le voir maintenant. Notre broyeur ne fonctionne plus. La roue dentée s'est cassée il y a quelques heures.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_05"); //Je ne sais pas où en avoir une neuve.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_06"); //Trouve-moi une roue dentée, et j'examinerais ton problème.

	B_LogEntry		(CH2_MCEggs,"Ian, le patron de la mine, ne m'aidera pas à trouver le nid. Je dois obtenir un nouvel engrenage de broyeur de minerai. Il a mentionné une galerie du côté abandonné où je pourrais trouver un vieux broyeur.");

	Ian_gearwheel = LOG_RUNNING;
};
// ******************************MISSION RUNNING********************************************  
instance  STT_301_IAN_GEAR_RUN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_RUN_Condition;
	information	=  STT_301_IAN_GEAR_RUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Un engrenage ? Où suis-je supposais le trouver ?";
};                       

FUNC int  STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt	(PD_MISSION, "Ian_gearwheel: ", Ian_gearwheel);
	
	if ((Ian_gearwheel == LOG_RUNNING)
	&&	!Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //Un engrenage ? Où suis-je supposais le trouver ?
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //Aucune idée. Je suis aussi perdu que toi !
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //Mais il y a un vieux broyeur cassé dans une galerie latérale. Peut-être que tu auras de la chance là.
};

// ******************************MISSION SUCCESS********************************************  
instance  STT_301_IAN_GEAR_SUC (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_SUC_Condition;
	information	=  STT_301_IAN_GEAR_SUC_Info;
	important	= 0;	
	permanent	= 0;
	description = "J'ai l'engrenage.";
};                       

FUNC int  STT_301_IAN_GEAR_SUC_Condition()
{
	if (Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	&& (Ian_gearwheel == LOG_RUNNING)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_SUC_Info()
{
	B_GiveInvItems (hero,self, ItMi_Stuff_Gearwheel_01 ,1);
	Npc_RemoveInvItem (self,ItMi_Stuff_Gearwheel_01);
	
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP	(XP_BringGearWheel);
	
	var C_Npc Sklave; 				
	Sklave = Hlp_GetNpc	(ORC_2001_SKLAVE);
	Npc_ExchangeRoutine (Sklave,"Stomper");

	AI_Output			(other, self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //J'ai l'engrenage.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //Hé, bien jouer. Je pense que ça fera l'affaire. A toi maintenant, alors comme ça tu cherches un nid de Chenilles de mines....hmmm..
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //Va voir Asghan et dis-lui d'ouvrir la porte, et alors tu pourras explorer les galeries sombres.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //"Dis-lui juste ""tout va bien"". Alors il saura que je t'ai donné la permission."

	B_LogEntry		(CH2_MCEggs,"J'ai apporté l'engrenage du broyeur de minerai abandonné à Ian. Il a dit que je dois dire TOUT VA TRES BIEN à Asghan. Apparemment, il fera ouvrir la porte des cavernes obscures.");
};

// ******************************GOTO ASGHAN********************************************  
instance  STT_301_IAN_GOTOASGHAN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GOTOASGHAN_Condition;
	information	=  STT_301_IAN_GOTOASGHAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Je cherche toujours le nid des Chenilles des mines.";
};                       

FUNC int  STT_301_IAN_GOTOASGHAN_Condition()
{
	if ((Ian_gearwheel == LOG_SUCCESS)
	&&  (!Npc_KnowsInfo (hero,Grd_263_Asghan_NEST)))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //Je cherche toujours le nid de Chenilles.
	AI_Output			(self, other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //Je t'ai déjà dit d'aller voir Asghan. C'est le chef des gardes. Tu le trouveras quelque part au niveau le plus bas.

	B_LogEntry		(CH2_MCEggs,"Si je veux trouver le nid des Chenilles des mines, je dois parler à Asghan.");
};

//--SPIELER HAT DIE EIER AM START-------------------------
instance  STT_301_IAN_AFTERALL (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_AFTERALL_Condition;
	information	=  STT_301_IAN_AFTERALL_Info;
	important	= 0;	
	permanent	= 0;
	description = "J'ai trouvé le nid !";
};                       

FUNC int  STT_301_IAN_AFTERALL_Condition()
{
	if (Npc_HasItems (hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_AFTERALL_Info()
{
	AI_Output			(other, self,"STT_301_IAN_AFTERALL_Info_15_01"); //J'ai trouvé le nid !
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_02"); //Alors nous aurons finalement retrouvé la paix et le silence ici. Hahaha !
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_03"); //Il n'y a pas d'offense. Bon travail, mon garçon !
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_04"); //Voilà, prends cette caisse de bière pour tes efforts.
	CreateInvItems		(self, ItFo_OM_Beer_01,6);
	B_GiveInvItems      (self, hero, ItFo_OM_Beer_01,6);
};

//-------NOT ENOUGH EGGS---------------
instance  STT_301_IAN_NOTENOUGH (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NOTENOUGH_Condition;
	information	=  STT_301_IAN_NOTENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "J'ai trouvé le nid ! Et les oeufs de la reine des Chenilles des mines !";
};                       

FUNC int  STT_301_IAN_NOTENOUGH_Condition()
{
	if ( Npc_HasItems (hero,ItAt_Crawlerqueen) > 1 )
	&& ( Npc_HasItems (hero,ItAt_Crawlerqueen) < 3 )
	{
		return TRUE;
	};
};
FUNC VOID  STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //J'ai trouvé le nid ! Et les oeufs de la reine des Chenilles des mines !
	AI_Output			(self, other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //Quoi ? Est-ce là tous les oeufs que tu as trouvés ? Bon, alors tu as prouvé que tu peux combattre.
};
