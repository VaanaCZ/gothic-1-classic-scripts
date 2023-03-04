//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_Xardas_EXIT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	nr			= 999;
	condition	= Info_Xardas_EXIT_Condition;
	information	= Info_Xardas_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Xardas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Xardas_EXIT_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneFireball))
	{
		CreateInvItem (self, ItArRuneFireball);
	};
	if (Npc_HasItems (self,ItArScrollSummonDemon)<1)
	{
		CreateInvItems (self, ItArScrollSummonDemon,2);
	};

};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DISTURB
//---------------------------------------------------------------------
instance  Info_Xardas_DISTURB (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DISTURB_Condition;
	information	= Info_Xardas_DISTURB_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_Xardas_DISTURB_Condition()
{	
	if	/*(FindGolemHearts == 4)
	&&	*/!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_DISTURB_Info()
{
	B_WhirlAround	(self, hero);
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_01"); //QUI OSE ME DÉRANGER PENDANT MES ÉTUDES ?
	AI_Output 		(hero, self,"Info_Xardas_DISTURB_15_02"); //Je m'appelle...
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_03"); //Je ne souhaite pas connaître ton nom. Il n'a aucune importance.
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_04"); //Tout ce qui m'importe c'est que tu es la première personne depuis des années à avoir résolu mes énigmes du Golem.
}; 

//---------------------------------------------------------------------
//	Info OTHERS
//---------------------------------------------------------------------
instance  Info_Xardas_OTHERS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_OTHERS_Condition;
	information	= Info_Xardas_OTHERS_Info;
	important	= 0;
	permanent	= 0;
	description = "Y a-t-il eu d'autres visiteurs ?";
};

FUNC int  Info_Xardas_OTHERS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_OTHERS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_01"); //Y a-t-il eu d'autres visiteurs ?
	AI_Output 		(self, hero,"Info_Xardas_OTHERS_14_02"); //Pas beaucoup, et quand ils ont commencé à me contrarier je leurs ai opposé une de mes créatures surnaturelles.
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_03"); //Tu aimes être tout seul, n'est-ce pas ?
}; 

//---------------------------------------------------------------------
//	Info SATURAS
//---------------------------------------------------------------------
instance  Info_Xardas_SATURAS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SATURAS_Condition;
	information	= Info_Xardas_SATURAS_Info;
	important	= 0;
	permanent	= 0;
	description = "J'ai été envoyé par Saturas. Nous avons besoin de ton aide !";
};

FUNC int  Info_Xardas_SATURAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SATURAS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_01"); //J'ai été envoyé par Saturas. Nous avons besoin de ton aide !
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_02"); //Les Magiciens de l'Eau pensent utiliser leur grand tas de minerai...
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_03"); //Le tas de minerai n'est pas la solution !
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_04"); //Non ?
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_05"); //NON!
}; 

//---------------------------------------------------------------------
//	Info KDW
//---------------------------------------------------------------------
instance  Info_Xardas_KDW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_KDW_Condition;
	information	= Info_Xardas_KDW_Info;
	important	= 0;
	permanent	= 0;
	description = "Tous les Magiciens du Feu sont morts !";
};

FUNC int  Info_Xardas_KDW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_KDW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_01"); //Tous les Magiciens du Feu sont morts !
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_02"); //Gomez les a assassinés.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_03"); //Cela ne m'étonne pas. On n'aurait jamais dû faire confiance à ces bouchers barbares et idiots du château, et en particulier à Gomez.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_04"); //Corristo et les autres magiciens ont élu leur propre bourreau quand ils ont aidé Gomez à usurper le pouvoir.
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_Xardas_SLEEPER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SLEEPER_Condition;
	information	= Info_Xardas_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "On dit que le prétendu Dormeur est un démon de l'archimonde.";
};

FUNC int  Info_Xardas_SLEEPER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_01"); //" Le prétendu ""Dormeur"" ne serait qu'un sale démon de l'Archimonde"
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_02"); //C'est ce que la Confrérie du marais a découvert.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_03"); //Maintenant les Magiciens de l'Eau croient que toute la colonie est en péril.
	AI_Output 		(self, hero,"Info_Xardas_SLEEPER_14_04"); //Il y a un danger tellement grand que personne dans la Barrière ne peut probablement l'imaginer. 
}; 

//---------------------------------------------------------------------
//	Info DANGER
//---------------------------------------------------------------------
instance  Info_Xardas_DANGER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DANGER_Condition;
	information	= Info_Xardas_DANGER_Info;
	important	= 0;
	permanent	= 0;
	description = "Si l'explosion du tas de minerai ne repousse pas le danger...";
};

FUNC int  Info_Xardas_DANGER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_SLEEPER)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SATURAS)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_DANGER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_01"); //Si l'explosion du tas de minerai ne repousse pas le danger...
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_02"); //... Oublie le tas de minerai ! Sa puissance ne pourrait pas ouvrir pas la Barrière.
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_03"); //Si Corristo et Saturas n'avaient pas perdu leur temps en s'attaquant aux faux problèmes pendant ces dernières années, ils sauraient tout ce que je sais maintenant.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_04"); //Et qui est ?
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_05"); //Aucun des douze magiciens n'a jamais cessé de se demander pourquoi la formation de la barrière a échappée à leur contrôle, ou pourquoi elle a pris des proportions gigantesques.
};

//---------------------------------------------------------------------
//	Info BARRIER
//---------------------------------------------------------------------
instance  Info_Xardas_BARRIER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_BARRIER_Condition;
	information	= Info_Xardas_BARRIER_Info;
	important	= 0;
	permanent	= 0;
	description = "Avez-vous découvert pourquoi c'est arrivé ? ";
};

FUNC int  Info_Xardas_BARRIER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DANGER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_BARRIER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_01"); //Et tu as découvert pourquoi cela s'est produit ? 
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_02"); //Et bien, une chose est sûre : la réponse se trouve enfouie sous la ville des Orcs.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_03"); //La ville des Orcs ?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_04"); //Les Orcs ne sont pas des animaux, comme beaucoup de personnes le pensent. Leur culture est aussi ancienne que la culture humaine.
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_05"); //Il y a quelques siècles, cinq orcs shamans ont appelé un vieux démon de l'Archimonde qui donneraient à leur clan, espéraient-ils, la possibilité de se défaire de leurs ennemis.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_06"); //Ce démon de l'Archimonde, était-ce le Dormeur ?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_07"); //Les Orcs ne l'on appelé ainsi que beaucoup plus tard. Mais je ne peux pas te dire pourquoi ils l'ont fait, ou pourquoi ils sont terrifiés maintenant par cette créature surnaturelle !
}; 

//---------------------------------------------------------------------
//	Info EVENT
//---------------------------------------------------------------------
instance  Info_Xardas_EVENT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENT_Condition;
	information	= Info_Xardas_EVENT_Info;
	important	= 0;
	permanent	= 0;
	description = "Pourquoi pas ?";
};

FUNC int  Info_Xardas_EVENT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_BARRIER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_01"); //Pourquoi pas ?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_02"); //Je pense que tu pourrais être... NON, pour être vraiment sûr, tu dois accomplir une autre mission !
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_03"); //Quelle mission ?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_04"); //Écoute bien : Les Orcs ont chassé de la ville un de leur shaman.
}; 

//---------------------------------------------------------------------
//	Info EVENTWHY
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHY (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHY_Condition;
	information	= Info_Xardas_EVENTWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Pourquoi l'ont-ils banni ?";
};

FUNC int  Info_Xardas_EVENTWHY_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHY_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHY_15_01"); //Pourquoi l'ont-ils banni ?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHY_14_02"); //Le guerrier Orc mort ne pouvait lui non plus répondre à cette question quand il a été interrogé par un de mes démons
}; 

//---------------------------------------------------------------------
//	Info EVENTHOW
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTHOW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTHOW_Condition;
	information	= Info_Xardas_EVENTHOW_Info;
	important	= 0;
	permanent	= 0;
	description = "Quel rapport ce chaman Orc a-t-il avec ma mission ?";
};

FUNC int  Info_Xardas_EVENTHOW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTHOW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_01"); //Quel rapport ce chaman Orc a-t-il avec ma mission ?
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_02"); //Il te racontera le reste de l'histoire sur le Dormeur.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_03"); //Il est fort probable qu'un Orc shaman désire me parler !
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_04"); //Tu veux que je t'aide ou pas ?
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_05"); //Oui, mais...
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_06"); //Alors ne remets plus en cause ce que je dis !
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_07"); //Trouve le shaman. Il n'est pas en très bon terme avec ses frères dans la ville des Orcs, il peut ainsi t'écouter avant de te transformer en torche vivante !
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_08"); //Très réconfortant !
}; 

//---------------------------------------------------------------------
//	Info EVENTWHERE
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHERE (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHERE_Condition;
	information	= Info_Xardas_EVENTWHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "Où le chaman est-il banni?";
};

FUNC int  Info_Xardas_EVENTWHERE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHERE_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_01"); //Où le chaman est-il banni?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_02"); //Rends toi à la vieille citadelle qui se trouve à l'est. Tu ne peux pas la manquer, elle est sur une grande montagne qui se voit de loin.
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_03"); //Peux-tu simplement y entrer ?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_04"); //Ils l'appellent la vieille citadelle mais à part les fondations il ne reste pas grand-chose d'elle. Elle est restée en ruine pendant des décennies.
}; 

//---------------------------------------------------------------------
//	Info ACCEPT
//---------------------------------------------------------------------
instance  Info_Xardas_ACCEPT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_ACCEPT_Condition;
	information	= Info_Xardas_ACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description = "J'obtiendrai les réponses de ce chaman !";
};

FUNC int  Info_Xardas_ACCEPT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHY)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTHOW)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHERE)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_ACCEPT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_ACCEPT_15_01"); //J'obtiendrai les réponses de ce chaman !
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_02"); //Mon serviteur t'a déjà donné une rune de téléportation pour le pentacle au niveau inférieur.
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_03"); //Cela te permettra de revenir ici plus tard.

	B_Story_CordsPost();		// Falls Spieler Gorn am Wassermagier-Pentragramm nicht angesprochen hat!
	B_Story_FindOrcShaman();
	
	AI_StopProcessInfos(self);
}; 
/*------------------------------------------------------------------------
						SCROLLS UND RUNEN VERKAUFEN							
------------------------------------------------------------------------*/

instance  Kdf_404_Xardas_SELLMAGICSTUFF (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information		= Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important		= 0;
	permanent		= 1;
	trade			= 1;
	description		= "Je recherche la connaissance magique."; 
	
};

FUNC int  Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{	
	if ( Npc_KnowsInfo(hero, Info_Xardas_ACCEPT))
	{
		return TRUE;
	};

};
FUNC void  Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Je recherche la connaissance magique.
};

//---------------------------------------------------------------------
//	Info RETURN
//---------------------------------------------------------------------
instance  Info_Xardas_RETURN (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_RETURN_Condition;
	information	= Info_Xardas_RETURN_Info;
	important	= 0;
	permanent	= 0;
	description = "J'ai les réponses du chaman Orc !";
};

FUNC int  Info_Xardas_RETURN_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredTemple
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_RETURN_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_01"); //J'ai les réponses du chaman Orc !
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_02"); //Bien, au rapport !
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_03"); //Les cinq Orcs shamans qui ont appelé le Dormeur ont bâti un temple souterrain, son entrée se trouve dans la ville des Orcs.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_04"); //C'est exact!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_05"); //Par ingratitude, il a arraché leurs coeurs et les a condamné ainsi que les ouvriers à être des morts-vivants pour l'éternité  !
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_06"); //Bien, très bien !
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_07"); //Les Orcs ont verrouillé le temple et ont commencé à faire des sacrifices pour apaiser le démon !
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_08"); //As-tu trouvé le moyen de pénétrer dans le temple?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_09"); //Oui, il y a un Orc qui...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_10"); //Pas de détails ! Va dans le temple souterrain! Là tu trouveras la seule façon de détruire la Barrière !
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_11"); //Je ne saisis pas!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_12"); //Ne m'as-tu pas invité à t'aider à détruire la Barrière ?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_13"); //C'est vrai, mais...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_14"); //ALORS VAS-Y ! On a déjà perdu beaucoup trop de temps ! Entre dans le temple souterrain et  trouve la réponse !

	B_Story_ReturnedFromUrShak();
}; 

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info FOUNDTEMPLE
//---------------------------------------------------------------------
instance  Info_Xardas_FOUNDTEMPLE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FOUNDTEMPLE_Condition;
	information		= Info_Xardas_FOUNDTEMPLE_Info;
	important		= 0;
	permanent		= 0;
	description		= "J'ai trouvé une voie dans le temple souterrain !"; 
};

FUNC int  Info_Xardas_FOUNDTEMPLE_Condition()
{	
	if (EnteredTemple)
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_FOUNDTEMPLE_Info()
{
	AI_Output (other, self,"Info_Xardas_FOUNDTEMPLE_15_01"); //J'ai trouvé une voie dans le temple souterrain !
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_02"); //TU L'AS.. C'est remarquable !
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_03"); //Tu es devenu très puissant ! Plus que n'importe qui à l'intérieur de la Barrière
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_04"); //Peut-être que tu es vraiment l'homme annoncé dans les prophéties des Orcs !
};

//---------------------------------------------------------------------
//	Info PROPHECY
//---------------------------------------------------------------------
instance  Info_Xardas_PROPHECY (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_PROPHECY_Condition;
	information		= Info_Xardas_PROPHECY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Prophéties ? Quelles prophéties ?"; 
};

FUNC int  Info_Xardas_PROPHECY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Xardas_FOUNDTEMPLE))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_PROPHECY_Info()
{
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_01"); //Prophéties ? Quelles prophéties ?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_02"); //D'anciens documents Orc ont été écrits peu de temps après avoir apposé le cachet  'Ennemi Sacré' sur le temple souterrain.
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_03"); //ennemi sacré ?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_04"); //Quiconque viendra conduire le Dormeur de notre monde pour toujours !
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_05"); //Je suis censé être celui mentionné dans les prophéties ancestrales ? ? ? Tu dois sûrement te tromper !
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_06"); //Peut-être... peut-être pas!
};

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD_Condition;
	information		= Info_Xardas_LOADSWORD_Info;
	important		= 0;
	permanent		= 0;
	description		= "J'ai trouvé cette étrange épée."; 
};

FUNC int  Info_Xardas_LOADSWORD_Condition()
{	
	if ( Npc_HasItems ( hero, Mythrilklinge ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD_Info()
{
	AI_Output				(other, self,"Info_Xardas_LOADSWORD_15_01"); //J'ai trouvé cette étrange épée.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_02"); //Montre-le moi.

	CreateInvItem 			(self, Mythrilklinge01);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);

	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_03"); //Voilà qui est intéressant... Je vois écrit 'URIZIEL'  là-dessus.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_04"); //J'ai entendu parler de cette épée. C'est une arme des temps passés, au début de la race humaine.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_05"); //L'arme a été forgée dans un métal inconnu. Et il n'y a rien d'écrit en ce qui concerne son créateur !
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_06"); //On a dit que cette lame possède des pouvoirs incroyables, mais je ne vois aucune aura magique ! 
	
	Npc_RemoveInvItem 		(hero, Mythrilklinge);	
	CreateInvItem 			(hero, Mythrilklinge01);
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD01 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD01_Condition;
	information		= Info_Xardas_LOADSWORD01_Info;
	important		= 0;
	permanent		= 0;
	description		= "URIZIEL possède des pouvoirs incroyables ?"; 
};

FUNC int  Info_Xardas_LOADSWORD01_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD ))
	{			
		return TRUE;
	};	
};


FUNC void  Info_Xardas_LOADSWORD01_Info()
{
	Npc_RemoveInvItem 	(self, Mythrilklinge01);

	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_01"); //URIZIEL possède des pouvoirs incroyables ?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_02"); //Il est écrit que le propriétaire de cette arme pouvait percer l'armure la plus résistante et supporter les sorts les plus puissants.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_03"); //Comment une arme aussi puissante a-t'elle pu se retrouver aux mains des Orcs ?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_04"); //La légende raconte que les Orcs l'ont pris d'un puissant seigneur de guerre. Ils n'ont pas su s'en servir, alors ils l'ont caché !
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_05"); //Mais ils ne l'ont pas assez bien caché !
};

//---------------------------------------------------------------------
//	Info LOADSWORD02
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD02 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD02_Condition;
	information		= Info_Xardas_LOADSWORD02_Info;
	important		= 0;
	permanent		= 0;
	description		= "Est-ce qu'il est possible de rétablir les anciens pouvoirs de l'arme ?"; 
};

FUNC int  Info_Xardas_LOADSWORD02_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD01 ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD02_Info()
{
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_01"); //Est-ce qu'il est possible de rétablir les anciens pouvoirs de l'arme ?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_02"); //Tu as eu besoin d'une source magique très puissante pour ça.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_03"); //Tu veux dire assez forte pour pulvériser la Barrière Magique avec ?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_04"); //A propos de cette force...
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_05"); //En outre, tu auras besoin d'une formule magique très particulière pour transférer ce pouvoir.
	AI_Output			(self, other,"Info_Xardas_LOADSWORD02_14_06"); //Laisse-moi un peu de temps et je créerai cette formule magique.

	B_Story_ShowedUrizielToXardas();
};


//---------------------------------------------------------------------
//	Info BETTERARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_BETTERARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_BETTERARMOR_Condition;
	information		= Info_Xardas_BETTERARMOR_Info;
	important		= 0;
	permanent		= 0;
	description		= "En attendant, je fouinerai dans les parages pour une meilleure arme !"; 
};

FUNC int  Info_Xardas_BETTERARMOR_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD02))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_BETTERARMOR_Info()
{
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_01"); //En attendant, je vais essayer de trouver une meilleure armure dans le secteur !

	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if (armorInstance == CRW_ARMOR_H)
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_02"); //Ces armures de Chenille de mine ont été trop souvent transpercées dans le temple souterrain !
	}
	else if (armorInstance == KDW_ARMOR_H) || (armorInstance == KDW_ARMOR_L)		
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_03"); //Ces haillons bleus ne m'ont pas beaucoup protégé dans le temple souterrain !
	}
	else
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_04"); //Les morts-vivants m'ont abîmé toute mon armure !
	};
	
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_05"); //Tu devrais te rendre à ma vieille tour.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_06"); //Ta vieille tour ?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_07"); //Elle s'est enfoncée dans l'un des lacs orientaux pendant un tremblement de terre. On peut encore apercevoir les flèches au-dessus du lac.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_08"); //Il reste quelques artefacts à l'intérieur. Je n'ai jamais fait l'effort de les récupérer.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_09"); //Comment fait-on pour s'y rendre ?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_10"); //N'étant pas revenu là depuis le tremblement de terre, tu devras trouver toi-même le moyen d'y accéder.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_11"); //Mais prends cette clef. Elle ouvre un coffre dans lequel j'avais pris l'habitude de garder quelques artefacts particulièrement recherchés.

	B_Story_ExploreSunkenTower();
};


//---------------------------------------------------------------------
//	Info OREARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_OREARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_OREARMOR_Condition;
	information		= Info_Xardas_OREARMOR_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Info_Xardas_OREARMOR_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OREARMOR_Info()
{
	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if	(armorInstance == ORE_ARMOR_M)
	||	(armorInstance == ORE_ARMOR_H)
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_01"); //Je comprends ! Tu portes l'armure de minerai.
	}
	else
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_02"); //Je vois que tu as trouvé l'armure de minerai
	};
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_03"); //Je l'ai trouvé dans un de ces vieux coffres de la tour engloutie.
	AI_Output		(self, other,"Info_Xardas_OREARMOR_14_04"); //Elle était la propriété du général qui s'est servi d'URIZIEL pendant la bataille contre les Orcs.
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_05"); //J'espère que cela me portera plus de chance qu'à lui !
};

//---------------------------------------------------------------------
//	Info FORMULA 
//---------------------------------------------------------------------
instance  Info_Xardas_FORMULA (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FORMULA_Condition;
	information		= Info_Xardas_FORMULA_Info;
	important		= 0;
	permanent		= 0;
	description		= "As-tu achevé la formule magique pour restaurer URIZIEL ?";
};

FUNC int  Info_Xardas_FORMULA_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	||	Npc_HasItems(hero, ItArRuneTeleport1)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_FORMULA_Info()
{
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_01"); //As-tu achevé la formule magique pour restaurer URIZIEL ?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_02"); //C'est fait. Mais tu ne pourras pas l'utiliser toi-même.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_03"); //Pourquoi pas ?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_04"); //Elle doit être prononcée par un magicien pendant que tu touches la source d'énergie avec l'épée.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_05"); //Alors il me faut trouver de l'aide !
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_06"); //Prends la formule et redonne à l'épée ses anciens pouvoirs. Tu auras besoin d'elle !

	B_Story_LoadSword();
};

//---------------------------------------------------------------------
//	Info ALTRUNE 
//---------------------------------------------------------------------
instance  Info_Xardas_ALTRUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_ALTRUNE_Condition;
	information		= Info_Xardas_ALTRUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Puisque je suis un magicien, ce sera dur pour moi de manipuler URIZIEL !";
};

FUNC int  Info_Xardas_ALTRUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_FORMULA)
	&&	((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB))
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_ALTRUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_ALTRUNE_15_01"); //Puisque je suis un magicien, ce sera dur pour moi de manipuler URIZIEL !
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_02"); //Voilà la solution...
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_03"); //Mais d'abord tu dois redonner à la lame ses anciens pouvoirs ! Alors reviens !
};


//---------------------------------------------------------------------
//	Info SWORDLOADED
//---------------------------------------------------------------------
instance  Info_Xardas_SWORDLOADED (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_SWORDLOADED_Condition;
	information		= Info_Xardas_SWORDLOADED_Info;
	important		= 0;
	permanent		= 0;
	description		= "J'ai restaurer URIZIEL !"; 
};

FUNC int  Info_Xardas_SWORDLOADED_Condition()
{	
	if  Npc_HasItems(hero,Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_SWORDLOADED_Info()
{
	AI_Output		(other, self,"Info_Xardas_SWORDLOADED_15_01"); //J'ai restaurer URIZIEL !
	AI_Output		(self, other,"Info_Xardas_SWORDLOADED_14_02"); //Incroyable, l'épée a retrouvé tout ses anciens pouvoirs. Te voilà à présent en possession d'une arme terrifiante !

	Wld_InsertItem			(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");	//Unblutige Lösung für´s Ich-brauch-Orc-Statue-Massaker ***Björn***

};

//---------------------------------------------------------------------
//	Info MAKERUNE
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNE_Condition;
	information		= Info_Xardas_MAKERUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Tu as dit qu'il pourrait y avoir une façon de manipuler URIZIEL bien que je sois un magicien !"; 
};

FUNC int  Info_Xardas_MAKERUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_ALTRUNE)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SWORDLOADED)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_01"); //Tu m'as bien dit qu'il pourrait y avoir une façon d'utiliser URIZIEL bien que je sois magicien ?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_02"); //Examine attentivement URIZIEL. Tu remarqueras un magnifique saphir bleu enchâssé dans la lame.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_03"); //Il renferme tous les pouvoirs de l'épée.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_04"); //Si j'enlève le saphir, je pourrai créer une rune qui contiendra les mêmes caractéristiques qu'URIZIEL.
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_05"); //Une rune magique fait à partir d'URIZIEL ?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_06"); //Dans la bataille, cette rune sera aussi puissante que l'épée !
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_07"); //Mais n'oublie pas que seul un magicien du Sixième Cercle pourra contrôler une rune magique aussi puissante !
};

//---------------------------------------------------------------------
//	Info MAKERUNEDOIT
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNEDOIT (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNEDOIT_Condition;
	information		= Info_Xardas_MAKERUNEDOIT_Info;
	important		= 0;
	permanent		= 1;
	description		= "Supprime le bijou d'URIZIEL !"; 
};

FUNC int  Info_Xardas_MAKERUNEDOIT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_MAKERUNE)
	&&	Npc_HasItems (hero,	Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNEDOIT_Info()
{
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_01"); //Supprime le bijou d'URIZIEL !
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
		AI_Output		(self, other,"Info_Xardas_MAKERUNEDOIT_14_02"); //Mais tu n'as pas encore maîtrisé ce Sixième Cercle !
	};
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_03"); //Il faut prendre une dernière décision. Est-ce que tu veux vraiment que j'enlève le saphir ?

	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"OUI, fait-le !",	Info_Xardas_MAKERUNE_YES);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"NON, ne le fait pas !",	Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_04"); //OUI, fait-le !
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Puisque c'est ta volonté... Voilà, prends l'épée nue et la rune !

	Npc_RemoveInvItem 	(hero, Mythrilklinge02);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items übergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, Mythrilklinge03);
	B_LogEntry			(CH5_Uriziel,"Xardas a supprimé la gemme magique de l'épée URIZIEL. La puissance de cette lame repose maintenant dans une rune magique de pouvoirs incomparables.");
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_SUCCESS);
};	

func void Info_Xardas_MAKERUNE_NO ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_06"); //NON, ne le fait pas !
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_07"); //Comme tu veux. La lame conservera ses pouvoirs magiques !
};	
	

//---------------------------------------------------------------------
//	Info LOADSWORD9 --> SC kann DMB werden
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD09 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD09_Condition;
	information		= Info_Xardas_LOADSWORD09_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,0); 
};

FUNC int  Info_Xardas_LOADSWORD09_Condition()
{	
	if (EnteredTemple)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{			
		return TRUE;
	};	
};
func void  Info_Xardas_LOADSWORD09_Info()
{
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//Peux-tu m'enseigner ?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //Je peux t'élever jusqu'au Sixième Cercle de la magie.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //Remarque que seuls les magiciens les plus puissants peuvent rejoindre le Sixième Cercle. Il est réservé à ceux dont la vie est un signe.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //Ton signe est la combinaison des éléments.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //Le Sixième Cercle te permet d'utiliser la magie de n'importe quelle rune.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //Et n'oublie pas : ne revendique pas le pouvoir, sers-le.
			
			CreateInvItem 		(hero, DMB_ARMOR_M);		// SN: kann nicht mit B_GiveInvItem() übergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor	(hero);

			//Fakeitem für Bildschirmausgabe
			CreateInvItem		(self,			ItAmArrow);
			B_GiveInvItems		(self, hero,	ItAmArrow, 1);
			Npc_RemoveInvItem	(hero,			ItAmArrow);

			hero.guild 	= GIL_DMB;	
			Npc_SetTrueGuild	( hero, GIL_DMB );	
			Info_Xardas_LOADSWORD09.permanent = 0;
			AI_StopProcessInfos	( self );
		};
	}
	else 
	{
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//Pas encore. Tu as la compétence, mais tu n'es pas assez expérimenté. Entraîne-toi avec Saturas en premier, je te formerai après.
		
		AI_StopProcessInfos	( self );
	};
};

	
