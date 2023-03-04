// **************************************************
//						 EXIT 
// **************************************************

instance  Org_818_Ratford_Exit (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 999;
	condition	= Org_818_Ratford_Exit_Condition;
	information	= Org_818_Ratford_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_818_Ratford_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					Wrong Way
// **************************************************

instance  Org_818_Ratford_WrongWay (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WrongWay_Condition;
	information	= Org_818_Ratford_WrongWay_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_818_Ratford_WrongWay_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WrongWay_Info()
{
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_00"); //Hé, toi !
	AI_Output (other, self,"Org_818_Ratford_WrongWay_15_01"); //Qu'est-ce que tu veux ?
	AI_Output (self, other,"Org_818_Ratford_WrongWay_07_02"); //Je t'averti. Si tu continues comme ça, tu seras sur notre terrain de chasse.
};

// **************************************************
//					Was jagt ihr
// **************************************************

instance  Org_818_Ratford_WhatGame (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhatGame_Condition;
	information	= Org_818_Ratford_WhatGame_Info;
	permanent	= 0;
	description = "Que chasses-tu ?";
};                       

FUNC int  Org_818_Ratford_WhatGame_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhatGame_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_00"); //Que chasses-tu ?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_01"); //Charognards pour la plupart. Ils ont beaucoup de viande sur eux. En outre, il n'est pas trop difficile de les avoir... Une fois que tu sais comment faire.
	AI_Output (other, self,"Org_818_Ratford_WhatGame_15_02"); //Vraiment ? Comment cela ?
	AI_Output (self, other,"Org_818_Ratford_WhatGame_07_03"); //Demande ici à  mon ami Drax - il en sait plus au sujet de ces choses que n'importe qui.
};

// **************************************************
//					Warum gefährlich
// **************************************************

instance  Org_818_Ratford_WhyDangerous (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WhyDangerous_Condition;
	information	= Org_818_Ratford_WhyDangerous_Info;
	permanent	= 0;
	description = "Pourquoi ce secteur est si dangereux ?";
};                       

FUNC int  Org_818_Ratford_WhyDangerous_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_WhyDangerous_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WhyDangerous_15_00"); //Pourquoi ce secteur est si dangereux ?
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_01"); //Tu viens juste d'arriver, n'est-ce pas ? Il y a différents endroits dans la colonie tous plus ou moins dangereux.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_02"); //Les chemins entre les camps sont tout à fait sûrs. Mais tu pourrais tomber sur quelques loups qui te regarderont comme une proie facile.
	AI_Output (self, other,"Org_818_Ratford_WhyDangerous_07_03"); //Et c'est exactement ce que tu es jusqu'à ce que tu possèdes une arme et une armure appropriées.
};

// **************************************************
//					Wo Ausrüstung
// **************************************************

instance  Org_818_Ratford_WoEquipment (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoEquipment_Condition;
	information	= Org_818_Ratford_WoEquipment_Info;
	permanent	= 0;
	description = "Où puis-je trouver un meilleur équipement ?";
};                       

FUNC int  Org_818_Ratford_WoEquipment_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_WoEquipment_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoEquipment_15_00"); //Où puis-je trouver un meilleur équipement ?
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_01"); //L'endroit le plus proche est le Vieux camp. Suis juste le chemin qui t'a amené ici.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_02"); //Mais tu peux avoir de la marchandise meilleur marché dans notre Nouveau camp - si tu connais les bonnes personnes.
	AI_Output (self, other,"Org_818_Ratford_WoEquipment_07_03"); //Si tu vas au Vieux camp, demande Mordrag. C'est l'un des nôtres. Pour un peu de minerai, il te vendra les bonnes marchandises.
	
	Log_CreateTopic	(GE_TraderOC, LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Le brigand Mordrag vend toutes les marchandises pour des prix raisonnables dans le Vieux Camp.");
};

// **************************************************
//					More Locations
// **************************************************

instance  Org_818_Ratford_MoreLocations (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_MoreLocations_Condition;
	information	= Org_818_Ratford_MoreLocations_Info;
	permanent	= 0;
	description = "Dit-m'en plus sur les secteurs de la colonie.";
};                       

FUNC int  Org_818_Ratford_MoreLocations_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC VOID  Org_818_Ratford_MoreLocations_Info()
{
	AI_Output (other, self,"Org_818_Ratford_MoreLocations_15_00"); //Dit-m'en plus sur les secteurs de la colonie.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_01"); //Si tu voyages entre les camps, tu auras besoin d'une carte pour distinguer les chemins et les culs-de-sac.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_02"); //Les culs-de-sac te mènent souvent aux gorges dangereuses où se trouvent des créatures qu'il vaut mieux éviter.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_03"); //N'entre pas dans les vieilles ruines. Il y en a beaucoup par ici. La plupart d'entre elles sont de vieilles fortifications remontant à la période de la première guerre des Orcs. Certaines sont les logements abandonnés par les Orcs.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_04"); //Il y a souvent des Orcs dans ces ruines - ou même de plus dangereuses créatures. J'évite ces endroits, particulièrement la nuit.
	AI_Output (self, other,"Org_818_Ratford_MoreLocations_07_05"); //Et un dernier conseil - n'entre pas dans la forêt !
};

// **************************************************
//					Wo Karte?
// **************************************************

instance Org_818_Ratford_WoKarte (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 1;
	condition	= Org_818_Ratford_WoKarte_Condition;
	information	= Org_818_Ratford_WoKarte_Info;
	permanent	= 0;
	description = "Où obtenir une carte ?";
};                       

FUNC int Org_818_Ratford_WoKarte_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_818_Ratford_WhyDangerous) )
	{
		return 1;
	};
};

FUNC void Org_818_Ratford_WoKarte_Info()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_15_00"); //Où obtenir une carte ?
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_01"); //Demande aux gens du Vieux camp. Il y a un cartographe vivant là.
	AI_Output (self, other,"Org_818_Ratford_WoKarte_07_02"); //Peut-être tu pourras lui voler une de ses cartes ! Si tu parviens à le faire, prends en une pour moi aussi !
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
	Info_AddChoice   (Org_818_Ratford_WoKarte,"Si je les obtiens sans paiement, je prendrai autant que je peux porter !",Org_818_Ratford_WoKarte_Stehlen);
	Info_AddChoice	 (Org_818_Ratford_WoKarte,"Pourquoi ? Il ne vend pas les cartes ? ",Org_818_Ratford_WoKarte_Kaufen);
};

func void Org_818_Ratford_WoKarte_Stehlen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Stehlen_15_00"); //Si je parviens à les avoir sans bourse délier, j'en prendrai autant que je puisse en porter !
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Stehlen_07_01"); //Tu es brave ! Tu devrais venir au Nouveau camp ! Si c'est le cas, demande après Lares. Il prend soin des nouveaux. Je suis sûr qu'il aura un travail pour toi !
	
	VAR C_NPC Lares; Lares = Hlp_GetNpc(ORG_801_LARES);
	Lares.aivar[AIV_FINDABLE]=TRUE;
	
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

func void Org_818_Ratford_WoKarte_Kaufen()
{
	AI_Output (other, self,"Org_818_Ratford_WoKarte_Kaufen_15_00"); //Pourquoi ? Ne vend-il pas les cartes ? 
	AI_Output (self, other,"Org_818_Ratford_WoKarte_Kaufen_07_01"); //Si tu as assez de minerai pour les payer...
	Info_ClearChoices(Org_818_Ratford_WoKarte);
};

// **************************************************
//						Danke
// **************************************************

instance  Org_818_Ratford_Thanks (C_INFO)
{
	npc			= Org_818_Ratford;
	nr			= 888;
	condition	= Org_818_Ratford_Thanks_Condition;
	information	= Org_818_Ratford_Thanks_Info;
	permanent	= 0;
	description = "Merci pour ton aide.";
};                       

FUNC int  Org_818_Ratford_Thanks_Condition()
{
	return 1;
};

FUNC VOID  Org_818_Ratford_Thanks_Info()
{
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_00"); //Merci pour ton aide.
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_01"); //Ne va pas penser que tout le monde va être aussi gentil, gamin !
	AI_Output (self, other,"Org_818_Ratford_Thanks_07_02"); //Il ne peut pas y avoir grand-chose dans les poches d'un nouveau, mais tu pourrais te faire attaquer pour une simple pioche.
	AI_Output (other, self,"Org_818_Ratford_Thanks_15_04"); //Je m'en souviendrais.
};











