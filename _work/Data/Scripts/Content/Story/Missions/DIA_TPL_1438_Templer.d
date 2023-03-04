instance  Tpl_1438_Templer_Exit (C_INFO)
{
	npc			=  Tpl_1438_Templer;
	nr			=  999;
	condition	=  Tpl_1438_Templer_Exit_Condition;
	information	=  Tpl_1438_Templer_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1438_Templer_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1438_Templer_Exit_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_Exit_Info_15_01"); //Je te verrais plus tard.
	AI_Output			(self, other,"Tpl_1438_Templer_Exit_Info_13_02"); //Puisse le Dormeur se réveiller !
	
	AI_StopProcessInfos	( self );
};
// ***************** GELABER *****************************

instance  Tpl_1438_Templer_INFO (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_INFO_Condition;
	information		= Tpl_1438_Templer_INFO_Info;
	important		= 0;
	permanent		= 0;
	description		= "Que font les templiers dans la mine ?"; 
};

FUNC int  Tpl_1438_Templer_INFO_Condition()
{	
	if (  CorKalom_BringMCQBalls != LOG_RUNNING ) 
	{
		return TRUE;
	};

};

FUNC void  Tpl_1438_Templer_INFO_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_INFO_Info_15_01"); //Que font les templiers dans la mine ?
	AI_Output			(self, other,"Tpl_1438_Templer_INFO_Info_13_02"); //Nous chassons des Chenilles de mine. Retourne au camp, tu seras en sûreté là bas.
}; 

// ***************** SEKRET *****************************

instance  Tpl_1438_Templer_WHY (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_WHY_Condition;
	information		= Tpl_1438_Templer_WHY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Pourquoi chasses-tu les Chenilles ?"; 
};

FUNC int  Tpl_1438_Templer_WHY_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_INFO )) 
	{
		return 1;
	};

};
FUNC void  Tpl_1438_Templer_WHY_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_01"); //Pourquoi chasses-tu les Chenilles ?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_02"); //Pour leurs mandibules inférieures. Elles contiennent une sécrétion intéressante.
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_03"); //Quel genre de sécrétion ?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_04"); //Un poison. Seulement notre Sage Cor Kalom sait brasser des potions avec.
};
// ***************** KALOM *****************************

instance  Tpl_1438_Templer_KALOM (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_KALOM_Condition;
	information		= Tpl_1438_Templer_KALOM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Qui est Cor Kalom ?"; 
};

FUNC int  Tpl_1438_Templer_KALOM_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_WHY )) 
	{
		return 1;
	};

};

FUNC void  Tpl_1438_Templer_KALOM_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_01"); //Qui est Cor Kalom ?
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_02"); //Un des hommes les plus puissants de toute la Confrérie. Il connaît beaucoup de secrets, il peut contrôler les autres par la pensée !
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_03"); //A part ça, c'est un alchimiste. Il brasse des potions ainsi nous pouvons entrer en contact spirituel avec le Dormeur. Descend au camp. Nous cherchons toujours des gens !
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_04"); //J'y réfléchirai.
};  
//---------------------WENN DIE EIERSUCHE LÄUFT-------------------------------  
instance  Tpl_1438_Templer_EGGSEARCH (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_EGGSEARCH_Condition;
	information		= Tpl_1438_Templer_EGGSEARCH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je cherche le nid des Chenilles."; 
};

FUNC int  Tpl_1438_Templer_EGGSEARCH_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING )
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_EGGSEARCH_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01"); //Je cherche le nid des Chenilles.
	AI_Output			(self, other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //Va voir Gor Na Vid, Gor Na Kosh ou Gor Na Bar. Ils en savent plus que moi sur les Chenilles .

	B_LogEntry		(CH2_MCEggs,"À l'entrée de la vielle mine, j'ai demandé à un templier le nid des Chenilles des mines. Il m'a attribué trois autre templiers - Gor Na Vid, Gor Na Kosh et Gor Na. Ces noms de la Confrérie me rendent fous.");  
};  
/*------------------------------------------------------------------------
//							ZANGEN FREISCHALTEN						    //
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_ZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_ZANGEN_Condition;
	information		= Tpl_1438_Templer_ZANGEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Comment puis-je extraire les mandibules des Chenilles des mines ?"; 
};

FUNC int  Tpl_1438_Templer_ZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_WHY) || (CorKalom_BringMCQBalls == LOG_RUNNING))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_ZANGEN_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //Comment puis-je extraire les mandibules des Chenilles des mines ?
	AI_Output			(self, other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //Ce n'est pas celle facile de faire cela. Je peux t'apprendre.
}; 
/*------------------------------------------------------------------------
//							LERNEN ZANGEN ZU ENTFERNEN					//
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_TEACHZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_TEACHZANGEN_Condition;
	information		= Tpl_1438_Templer_TEACHZANGEN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Apprendre à extraire des mandibules (1 point de compétence)"; 
};

FUNC int  Tpl_1438_Templer_TEACHZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_ZANGEN))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_TEACHZANGEN_Info()
{
	
	AI_Output			(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //Peux-tu m'apprendre comment on enlève les mandibules inférieures ?
	
	if (hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //D'abord tu dois couper profondément dans la chair. Fait attention à ne pas couper la glande de la mandibule inférieure. Si tu le fais, la sécrétion s'échappera dehors.
		AI_Output		(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //ça doit être très douloureux.
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //Gagné ! As-tu jamais rencontré Korgur les Trois-Doigts, le chasseur de Chenille ? Oh non, cela c'était avant que tu ne sois arrivé. Bon, allons-y...
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //Coupe autour des glandes, en laissant un espace large, et puis enlève la chair ainsi que la mandibule inférieure. Si tu fais comme ça, tu n'auras aucun problème pour enlever les mandibules inférieures.
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry		(GE_AnimalTrophies,"Comment extraire des mandibules - Chenilles des mines");
		Tpl_1438_Templer_TEACHZANGEN.permanent		= 0;
		PrintScreen		("Apprendre : Extraire les mandibules de Chenilles des mines", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else 
	{
		PrintScreen		("Pas assez de points de compétence !", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say			(self, other, "$NOLEARNNOPOINTS");
	};
};   
