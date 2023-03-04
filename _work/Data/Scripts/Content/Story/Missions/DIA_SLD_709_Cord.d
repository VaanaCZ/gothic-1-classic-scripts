// ************************ EXIT **************************

INSTANCE DIA_SLD_709_Cord_Exit (C_INFO)
{
	npc			= SLD_709_Cord;
	nr			= 999;
	condition	= DIA_SLD_709_Cord_Exit_Condition;
	information	= DIA_SLD_709_Cord_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_709_Cord_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_709_Cord_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

/*------------------------------------------------------------------------
						TRAIN ANGEBOT								
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAINOFFER (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAINOFFER_Condition;
	information		= SLD_709_Cord_TRAINOFFER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je veux améliorer mon maniement d'armes à une main."; 
};

FUNC int  SLD_709_Cord_TRAINOFFER_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_1H) < 2)
	{
		return TRUE;
	};

};
FUNC void  SLD_709_Cord_TRAINOFFER_Info()
{
	AI_Output (other, self,"SLD_709_Cord_TRAINOFFER_Info_15_01"); //Je veux améliorer mon maniement d'armes à une main.
	AI_Output (self, other,"SLD_709_Cord_TRAINOFFER_Info_14_02"); //Naturellement. Elle te coûtera cependant 30 minerais.

	Log_CreateTopic	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,"Cord, le mercenaire, peut m'apprendre à me battre avec des ARMES A UNE MAIN. Dans la journée, il est peut-être sur le plateau rocheux vers le lac.");
};  
/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ERSTE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAIN (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAIN_Condition;
	information		= SLD_709_Cord_TRAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,30); 
};

FUNC int  SLD_709_Cord_TRAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,SLD_709_Cord_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_1H) == 0)
	{
		return TRUE;
	};
};
FUNC void  SLD_709_Cord_TRAIN_Info()
{
	AI_Output (other, self,"SLD_709_Cord_TRAIN_Info_15_00"); //Je veux améliorer mon maniement d'armes à une main.

	if (Npc_HasItems (hero,ItMiNugget) >= 30)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1)
		{
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_01"); //C'est une bonne décision ! Mais avant de pouvoir améliorer ta technique, tu dois apprendre à tenir correctement une arme.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_02"); //Les novices prennent souvent à deux mains les armes à une main. Ne prends pas cette habitude maintenant, ça va te désavantager.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_03"); //Tiens l'arme avec une seule main, lame vers le haut, et continue à la balancer.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_04"); //Tu devras apprendre à coordonner le balancement de ton arme avec tes propres mouvements. Cela rendra ton attaque plus rapide.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_05"); //Si tu gardes à l'esprit ce que je t'ai appris, tes combats seront plus élégants et beaucoup plus rapides à l'avenir.
			B_PracticeCombat	("NC_WATERFALL_TOP01");
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_06"); //Ah oui, encore une chose : Certains coups font plus de dégâts que d'autres ! En tant que débutant, tu n'auras pas beaucoup d'occasions de porter des coups critiques.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_07"); //Mais plus tu progresses, meilleur tu deviens.
			B_GiveInvItems (hero, self,ItMiNugget,30);
			SLD_709_Cord_TRAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Tu n'as pas suffisamment de minerai.
	};
};  
/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ZWEITE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAINAGAIN (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAINAGAIN_Condition;
	information		= SLD_709_Cord_TRAINAGAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,50); 
};

FUNC int  SLD_709_Cord_TRAINAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,SLD_709_Cord_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_1H) < 2)
	{
		return TRUE;
	};

};
FUNC void  SLD_709_Cord_TRAINAGAIN_Info()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Apprends-moi à être plus adroit avec des armes à une main.

	if (Npc_HasItems (hero,ItMiNugget) >= 50)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2)
		{
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_02"); //D'accord, tu connais les bases. Tenir ton arme vers le bas mettra plus de force dans ton premier coup.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_03"); //Sers toi du balancement, tu te souviens ? Maintenant tu dois plus utiliser ton corps. Quand tu as frappé deux fois, tourne autour. Cela surprendra ton adversaire et te mettra en excellente position.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_04"); //Passe ta lame de droite à gauche encore une fois.
			B_PracticeCombat("NC_WATERFALL_TOP01");
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_05"); //Et avance encore. N'oublie pas : seule la pratique permet d'atteindre la perfection. Ainsi, tu deviendras un vrai maître dans l'art du combat à une main.
			B_GiveInvItems	(hero, self, ItMiNugget, 50);
			SLD_709_Cord_TRAINAGAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Tu n'as pas suffisamment de minerai.
	};
}; 
