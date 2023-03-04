//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_OrcShaman_EXIT (C_INFO)
{
	npc			= ORC_2200_Shaman;
	nr			= 999;
	condition	= Info_OrcShaman_EXIT_Condition;
	information	= Info_OrcShaman_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_OrcShaman_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_OrcShaman_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info THX
//---------------------------------------------------------------------
instance  Info_OrcShaman_THX (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_THX_Condition;
	information	= Info_OrcShaman_THX_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_OrcShaman_THX_Condition()
{	
	if	(Kapitel == 4)
	{
		return TRUE;
	};
};
FUNC void  Info_OrcShaman_THX_Info()
{
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_01"); //Te remercie, étranger.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_02"); //Mauvais Orcs veulent me tuer.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_03"); //Vieux frères ennemis aujourd'hui.
}; 

//---------------------------------------------------------------------
//	Info WHO
//---------------------------------------------------------------------
instance  Info_OrcShaman_WHO (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_WHO_Condition;
	information	= Info_OrcShaman_WHO_Info;
	important	= 0;
	permanent	= 0;
	description = "Qui es-tu ?";
};

FUNC int  Info_OrcShaman_WHO_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_WHO_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_WHO_15_01"); //Qui es-tu ?
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_02"); //Moi Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_03"); //Être fils de l'esprit. Peuple appelle shaman.
}; 

//---------------------------------------------------------------------
//	Info TONGUE
//---------------------------------------------------------------------
instance  Info_OrcShaman_TONGUE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_TONGUE_Condition;
	information	= Info_OrcShaman_TONGUE_Info;
	important	= 0;
	permanent	= 0;
	description = "Comment connais-tu notre langue ?";
};

FUNC int  Info_OrcShaman_TONGUE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_TONGUE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_TONGUE_15_01"); //Comment sais-tu notre langue ?
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_02"); //Ur-Shak être esclave humains dans mine.
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_03"); //Moi enfuir. Depuis beaucoup d'hivers passer.
}; 

//---------------------------------------------------------------------
//	Info MINE
//---------------------------------------------------------------------
instance  Info_OrcShaman_MINE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_MINE_Condition;
	information	= Info_OrcShaman_MINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Tu es un esclave des mines ? Quelle mine ?";
};

FUNC int  Info_OrcShaman_MINE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_TONGUE))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_MINE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_MINE_15_01"); //Tu es un esclave des mines ? Quelle mine ?
	AI_Output 		(self, hero,"Info_OrcShaman_MINE_17_02"); //Mine être sous village Éboulis.
}; 

//---------------------------------------------------------------------
//	Info WHY
//---------------------------------------------------------------------
instance  Info_OrcShaman_WHY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_WHY_Condition;
	information	= Info_OrcShaman_WHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Pourquoi tes frères se battent-ils contre toi ?";
};

FUNC int  Info_OrcShaman_WHY_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_WHY_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_WHY_15_01"); //Pourquoi tes frères se battent-ils contre toi ?
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_02"); //Ur-Shak en disgrâce.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_03"); //Besmirch avoir foi dans KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_04"); //Croire KRUSHAK mauvais démon
}; 

//---------------------------------------------------------------------
//	Info KRUSHAK
//---------------------------------------------------------------------
instance  Info_OrcShaman_KRUSHAK (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_KRUSHAK_Condition;
	information	= Info_OrcShaman_KRUSHAK_Info;
	important	= 0;
	permanent	= 0;
	description = "Qu'est-ce que KRUSHAK veut dire?";
};

FUNC int  Info_OrcShaman_KRUSHAK_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_WHY))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_KRUSHAK_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_01"); //Qu'est-ce que KRUSHAK veut dire?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_02"); //Humains appellent le SOMMEIL.
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_03"); //Tu veux dire le DORMEUR ?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_04"); //Oui, humains dire le Dormeur !
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_OrcShaman_SLEEPER (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SLEEPER_Condition;
	information	= Info_OrcShaman_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "Que sais-tu du Dormeur ?";
};

FUNC int  Info_OrcShaman_SLEEPER_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_KRUSHAK))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_01"); //Que sais-tu du Dormeur ?
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_02"); //Être cinq frères. Il y a beaucoup d'hivers !
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_03"); //Être des fils de l'esprit, comme Ur-Shak !
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_04"); //Tu veux dire cinq shamans !
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_05"); //Dire KRUSHAK !
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_06"); //Vouloir défaite clan ennemi !
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_07"); //Cinq frères construisent alors temple sous la terre pour KRUSHAK !
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_08"); //Un temple souterrain pour le Dormeur ? C'est ça que Xardas voulait dire quand il m'a parlé de l'entrée qui est dans la ville des Orcs !
}; 

//---------------------------------------------------------------------
//	Info CURSE
//---------------------------------------------------------------------
instance  Info_OrcShaman_CURSE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_CURSE_Condition;
	information	= Info_OrcShaman_CURSE_Info;
	important	= 0;
	permanent	= 0;
	description = "Qu'est ce qui?est arrivé au temple souterrain ?";
};

FUNC int  Info_OrcShaman_CURSE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_SLEEPER))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_CURSE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_01"); //Qu'est ce qui?est arrivé au temple souterrain ?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_02"); //Les frères donnent alors le coeur à KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_03"); //Mais KRUSHAK mauvais. KRUSHAK maudit tout ceux construire temple.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_04"); //Frères plus de coeur, morts et vivants. Être les deux.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_05"); //KRUSHAK a maintenant le coeur des frères. Le coeur est maintenant puissance pour KRUSHAK.
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_06"); //Qu'est arrivé aux ouvriers qui ont construit le temple ?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_07"); //Tous maudits par KRUSHAK. Ouvriers aussi. Être tous morts et vivants, les deux en même temps.
}; 

//---------------------------------------------------------------------
//	Info OUTSIDE
//---------------------------------------------------------------------
instance  Info_OrcShaman_OUTSIDE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_OUTSIDE_Condition;
	information	= Info_OrcShaman_OUTSIDE_Info;
	important	= 0;
	permanent	= 0;
	description = "auprès à la surface a fait quelque chose ?";
};

FUNC int  Info_OrcShaman_OUTSIDE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_CURSE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_OUTSIDE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_OUTSIDE_15_01"); //auprès à la surface a fait quelque chose ?
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_02"); //Ils scellent le temple. Frères adorent aujourd'hui KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_03"); //KRUSHAK a le sacrifice, mais pas devenir mauvais.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_04"); //Ur-Shak pense sacrifice mauvais. A dit KRUSHAK mauvais.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_05"); //Frères veulent pas entendre. Frères disent Ur-Shak disparaître. Frères tuent Ur-Shak.
}; 

//---------------------------------------------------------------------
//	Info INTEMPLE
//---------------------------------------------------------------------
instance  Info_OrcShaman_INTEMPLE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_INTEMPLE_Condition;
	information	= Info_OrcShaman_INTEMPLE_Info;
	important	= 0;
	permanent	= 0;
	description = "Je dois entrer dans le temple souterrain ! Peux-tu me mener là-bas ?";
};

FUNC int  Info_OrcShaman_INTEMPLE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_OUTSIDE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_INTEMPLE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_01"); //Je dois entrer dans le temple souterrain ! Peux-tu me mener là-bas ?
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_02"); //Ur-Shak remercie étranger. Étranger sauver Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_03"); //Mais entrée du temple est dans maison. Ur-Shak peut pas aller maison.
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_04"); //Je vois, cela signifie qu'ils ne te laisseraient pas retourner dans la ville d'Orc ?
};

//---------------------------------------------------------------------
//	Info MAP
//---------------------------------------------------------------------
instance  Info_OrcShaman_MAP (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_MAP_Condition;
	information	= Info_OrcShaman_MAP_Info;
	important	= 0;
	permanent	= 0;
	description = "Peux-tu me montrer où se trouve la ville auprès sur ma carte ?";
};

FUNC int  Info_OrcShaman_MAP_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_OrcShaman_INTEMPLE)
	&&	Npc_HasItems (hero, ItWrWorldmap)
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_MAP_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_01"); //Peux-tu me montrer où se trouve la ville auprès sur ma carte ?
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_02"); //Maison d'Ur-Shak est où carte vide.
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_03"); //Étranger donne carte, Ur-Shak compléter carte !
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_04"); //(carte griffonnée)
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_05"); //C'est étonnant, tu es un bon cartographe. Merci !

	B_GiveInvItems  (hero, self, ItWrWorldmap, 1);
	Npc_RemoveInvItem(self, ItWrWorldmap);
	CreateInvItem	 (self, ItWrWorldmap_Orc);
	B_GiveInvItems  (self, hero, ItWrWorldmap_Orc, 1);
}; 

//---------------------------------------------------------------------
//	Info FIGHT
//---------------------------------------------------------------------
instance  Info_OrcShaman_FIGHT (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_FIGHT_Condition;
	information	= Info_OrcShaman_FIGHT_Info;
	important	= 0;
	permanent	= 0;
	description = "Bien, je devrai me battre sur mon chemin !";
};

FUNC int  Info_OrcShaman_FIGHT_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_INTEMPLE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_FIGHT_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_FIGHT_15_01"); //Bien, je devrai me battre sur mon chemin !
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_02"); //Frères de la maison très forts ! Frères être beaucoup !
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_03"); //Étranger rester. Beaucoup de guerriers ! Étranger mourir !
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_04"); //D'autres fils de l'esprit à la maison. L'étranger fait le feu, alors étranger mourir !
}; 

//---------------------------------------------------------------------
//	Info OTHERWAY
//---------------------------------------------------------------------
instance  Info_OrcShaman_OTHERWAY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_OTHERWAY_Condition;
	information	= Info_OrcShaman_OTHERWAY_Info;
	important	= 0;
	permanent	= 0;
	description = "Bien, bien, mais je dois trouver une voie dans le temple !";
};

FUNC int  Info_OrcShaman_OTHERWAY_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_FIGHT))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_OTHERWAY_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_01"); //Bien, bien, mais je dois trouver une voie dans le temple !
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_02"); //Ur-Shak connaît la façon ! Étranger doit porter Ulu-mulu !
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_03"); //Ulu-mulu ? ? ? C'est quoi un Ulu-Mulu ?
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_04"); //Être signe de l'amitié ! Frères respectent Ulu-mulu !
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_05"); //Étranger porter Ulu-mulu, alors étranger pas mourir !
};

//---------------------------------------------------------------------
//	Info ULUMULU
//---------------------------------------------------------------------
instance  Info_OrcShaman_ULUMULU (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_ULUMULU_Condition;
	information	= Info_OrcShaman_ULUMULU_Info;
	important	= 0;
	permanent	= 0;
	description = "Où puis-je obtenir cet Ulu-Mulu ?";
};

FUNC int  Info_OrcShaman_ULUMULU_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_OTHERWAY))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_ULUMULU_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_01"); //Où puis-je obtenir cet Ulu-Mulu ?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_02"); //Étranger va voir ami d'Ur-Shak !
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_03"); //L'ami d'Ur-Shak donnent Ulu-mulu ! Étranger porter Ulu-mulu, alors étranger pas mourir !
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_04"); //"Ouais, ouais, j'ai le ""pas mourir"" , mais où je peux trouver ton ami ?"
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_05"); //Ami d'Ur-Shak dans mine des humains. Ami enfuir avec Ur-Shak. Ami malade alors.

	B_Story_FoundUrShak	();
	
	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"As-tu été détenu dans la mine libérée ?",										Info_OrcShaman_ULUMULU_FM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Est-ce que tu étais un prisonnier de la mine abandonnée ?",									Info_OrcShaman_ULUMULU_VM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"As-tu été détenu captif dans la vieille mine ?",										Info_OrcShaman_ULUMULU_AM);
}; 

func void Info_OrcShaman_ULUMULU_VM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_08"); //Est-ce que tu étais un prisonnier de la mine abandonnée ?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_09"); //Ur-Shak pas savoir les mots.
};

func void Info_OrcShaman_ULUMULU_AM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_10"); //As-tu été détenu captif dans la vieille mine ?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_11"); //Ur-Shak comprend pas !
};

func void Info_OrcShaman_ULUMULU_FM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_12"); //As-tu été détenu dans la mine libérée ?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_13"); //Ur-Shak prisonnier dans mine sous le village dans Éboulis.
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_14"); //Ur-Shak pensent que les gens appellent comme ça !

	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
};

//---------------------------------------------------------------------
//	Info BYEBYE
//---------------------------------------------------------------------
instance  Info_OrcShaman_BYEBYE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_BYEBYE_Condition;
	information	= Info_OrcShaman_BYEBYE_Info;
	important	= 0;
	permanent	= 0;
	description = "Merci pour ton aide !";
};

FUNC int  Info_OrcShaman_BYEBYE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_ULUMULU))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_BYEBYE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_01"); //Merci pour ton aide !
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_02"); //Ur-Shak dire merci étranger. Étranger sauver Ur-Shak. Étranger ami maintenant avec Ur-Shak !
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_03"); //Ami fait cadeau. Prendre talisman d'Ur-Shak ! Talisman protéger toi contre souffle du lézard du Feu !
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_04"); //Ur-Shak retourne pas maison. Ur-Shak maintenant vivre ici ! Ami vient quand besoin aide !
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_05"); //J'accepte ton offre !

	B_Story_FriendOfUrShak	();

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info FRIENDLYHELLO
//---------------------------------------------------------------------
instance  Info_OrcShaman_FRIENDLYHELLO (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_FRIENDLYHELLO_Condition;
	information	= Info_OrcShaman_FRIENDLYHELLO_Info;
	important	= 0;
	permanent	= 0;
	description = "Que vas-tu faire, mon ami ?";
};

FUNC int  Info_OrcShaman_FRIENDLYHELLO_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_OrcShaman_BYEBYE)
	&&	FriendOfUrShak
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_FRIENDLYHELLO_Info()
{
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_01"); //Que vas-tu faire, mon ami ?
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_02"); //Ur-Shak bonne santé !
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_03"); //Ur-Shak cherche maintenant son Ulu-mulu !
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_04"); //Peut-être Ur-Shak retourner maison avec propre Ulu-mulu !
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_05"); //Ami venir quand besoin aide !
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_06"); //Prend soin de toi !
	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info ORCCITY
//---------------------------------------------------------------------
instance  Info_OrcShaman_ORCCITY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_ORCCITY_Condition;
	information	= Info_OrcShaman_ORCCITY_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_OrcShaman_ORCCITY_Condition()
{	
	if	(Npc_GetDistToWP(hero, "SPAWN_OW_WARAN_ORC_01")<1000)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_ORCCITY_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(hero, self);

	AI_Output 		(self, hero,"Info_OrcShaman_ORCCITY_17_01"); //Ur-Shak saluer ami !

	if (Npc_HasItems(hero, UluMulu))
	{
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_02"); //Ami a Ulu-mulu ! Être bon !
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_03"); //Ami pas oublier porter Ulu-mulu dans main pour traverser le pont !
	}
	else
	{	
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_04"); //Ami pas Ulu-mulu ! Pas bon !
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_05"); //Ami pas traverser le pont, sinon mourir !
	};
}; 

//---------------------------------------------------------------------
//	Info YOUHERE
//---------------------------------------------------------------------
instance  Info_OrcShaman_YOUHERE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_YOUHERE_Condition;
	information	= Info_OrcShaman_YOUHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "Que fait-tu tout près la ville ?";
};

FUNC int  Info_OrcShaman_YOUHERE_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_ORCCITY)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_YOUHERE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_01"); //Que fait-tu tout près la ville ?
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_02"); //Ur-Shak surveille frères dans la maison !
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_03"); //Ur-Shak croire KRUSHAK réveiller bientôt !
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_04"); //Ur-Shak attendre, combattre KRUSHAK quand lui se réveiller !
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_05"); //Le Dormeur se réveillera bientôt ? ? ? J'espère que tu as tort !
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_06"); //Vu tout ce que j'ai entendu au sujet du démon de l'Archimonde jusque là, je préfère qu'il soit endormi !
}; 

//---------------------------------------------------------------------
//	Info SEAL
//---------------------------------------------------------------------
instance  Info_OrcShaman_SEAL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SEAL_Condition;
	information	= Info_OrcShaman_SEAL_Info;
	important	= 0;
	permanent	= 0;
	description = "Tu m'as dit que tes frères avaient scellé le temple !";
};

FUNC int  Info_OrcShaman_SEAL_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_ORCCITY)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_SEAL_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SEAL_15_01"); //Lors de notre dernière réunion tu m'as dit que vos frères avaient scellé le temple !
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_02"); //Frères d'Ur-Shak sceller temple en terre très bien !
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_03"); //Ami peut pas entrer !
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_04"); //Ami utiliser magie des frères qui sont des fils de l'esprit comme Ur-Shak !
}; 

//---------------------------------------------------------------------
//	Info SCROLL
//---------------------------------------------------------------------
instance  Info_OrcShaman_SCROLL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SCROLL_Condition;
	information	= Info_OrcShaman_SCROLL_Info;
	important	= 0;
	permanent	= 0;
	description = "Où puis-je trouver cette magie ?";
};

FUNC int  Info_OrcShaman_SCROLL_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_SEAL)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_SCROLL_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SCROLL_15_01"); //Où puis-je trouver cette magie ?
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_02"); //Doit entrer en caverne des frères qui sont des fils de l'esprit comme Ur-Shak !
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_03"); //Mais ami faire attention quand magie utiliser !
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_04"); //Frères d'Ur-Shak pas aimer! Ulu-mulu pas aider quand ami utiliser magie !

	B_LogEntry		(CH4_EnterTemple,"J'ai rencontré le chaman Ur-Shak devant la ville auprès. Il m'a dit que je peux seulement entrer dans le vestibule du temple souterrain avec un sortilège auprès. Les autres chamans auprès gardent des sortilèges comme ça dans leurs cavernes.");
}; 

//---------------------------------------------------------------------
//	Info IDOL
//---------------------------------------------------------------------
instance  Info_OrcShaman_IDOL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_IDOL_Condition;
	information	= Info_OrcShaman_IDOL_Info;
	important	= 0;
	permanent	= 0;
	description = "Y a-t-il un autre chemin pour le temple ?";
};

FUNC int  Info_OrcShaman_IDOL_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_SCROLL)
	&&	!OrcCity_Sanctum_OuterGateOpen
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_IDOL_Info()
{
	//SN: fliegt raus, da der Hinweis jetzt sofort nach dem Hinweis mit der Scroll gegeben wird.
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_01"); //Ich habe den Teleportzauber verbraucht und das Gitter zur Tempelvorhalle lässt sich nicht öffnen!
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_02"); //Wie komme ich jetzt wieder in den Tempel?

	if	Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01) 
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_03"); //Ami trouver figure sur colonne !
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_04"); //Ami pouvoir maintenant ouvrir porte grande salle du temple !

		B_LogEntry	(CH4_EnterTemple,"Une autre voie mène au temple aussi. Je dois utiliser la figurine du Dormeur de la colonne sacrée des chamans auprès Il ouvre la porte du temple.");
	}
	else
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_05"); //Ami prendre maintenant figure de la colonne !
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_06"); //Figure maintenant ouvrir porte grande salle de temple !

		B_LogEntry	(CH4_EnterTemple,"Il y a une autre voie pour le temple. Il y a une figure du Dormeur sur la colonne sacrée des chamans auprès qui ouvre la porte sur le temple. Les frères d'Ur-Shak ne seront pas enchanté quand ils découvriront que j'utilise leur icône sainte.");
	};
}; 

