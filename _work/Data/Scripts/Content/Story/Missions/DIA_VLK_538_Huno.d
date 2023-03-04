// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Huno_Exit (C_INFO)
{
	npc			= Vlk_538_Huno;
	nr			= 999;
	condition	= DIA_Huno_Exit_Condition;
	information	= DIA_Huno_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Huno_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//	Info YouKnowYourJob
// **************************************************
INSTANCE DIA_Huno_YouKnowYourJob (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_YouKnowYourJob_Condition;
	information		= DIA_Huno_YouKnowYourJob_Info;
	permanent		= 0;
	important		= 0;
	description		= "Il semble que tu sais ce que tu fais.";
};

FUNC INT DIA_Huno_YouKnowYourJob_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output (other,self,"DIA_Huno_YouKnowYourJob_15_00"); //Il semble que tu sais ce que tu fais.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Personne n'est venu se plaindre.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_02"); //Mais ce serait une mauvaise idée de toute façon. Tous les idiots ici ont besoin d'une épée, et ils l'obtiennent grâce à moi.
};


// **************************************************
//	Info HowLong
// **************************************************
INSTANCE DIA_Huno_HowLong (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowLong_Condition;
	information		= DIA_Huno_HowLong_Info;
	permanent		= 0;
	important		= 0;
	description		= "Combien de temps te faut-il pour faire une lame ?";
};

FUNC INT DIA_Huno_HowLong_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowLong_Info()
{
	AI_Output (other,self,"DIA_Huno_HowLong_15_00"); //Combien de temps te faut-il pour faire une lame ?
	AI_Output (self,other,"DIA_Huno_HowLong_09_01"); //Cela dépend. Je suis aussi rapide que l'éclair avec une simple épée.
	AI_Output (self,other,"DIA_Huno_HowLong_09_02"); //Naturellement, à la seule condition que le prix me motive.
	AI_Output (self,other,"DIA_Huno_HowLong_09_03"); //Une créature comme Whistler doit d'habitude attendre plus longtemps son jouet que les autres.
	AI_Output (other,self,"DIA_Huno_HowLong_15_04"); //Pourquoi ? Il ne paye pas assez ?
	AI_Output (self,other,"DIA_Huno_HowLong_09_05"); //Non, au contraire. Il m'a donné 150 minerais pour sa dernière épée.
	AI_Output (self,other,"DIA_Huno_HowLong_09_06"); //Le type veut des ornements et de la marchandise de fillette comme ça, c'est naturellement pas bon marché.
	AI_Output (self,other,"DIA_Huno_HowLong_09_07"); //Hé, tu n'es pas curieux du tout, toi.
};

// **************************************************
//	Info HowsYourBusiness
// **************************************************
INSTANCE DIA_Huno_HowsYourBusiness (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowsYourBusiness_Condition;
	information		= DIA_Huno_HowsYourBusiness_Info;
	permanent		= 1;
	important		= 0;
	description		= "Hé bien, forgeron, comment vont les affaires?";
};

FUNC INT DIA_Huno_HowsYourBusiness_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Alors le forgeron, comment vont les affaires ?
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_01"); //Pourquoi voudrais-tu le savoir ?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_02"); //Je peux te passer une commande.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_03"); //Oh vraiment ? Et de quoi ?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_04"); //J'y réfléchirai.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Reviens quand tu auras vraiment besoin de quelque chose et ne me tape pas sur les nerfs.
};

// **************************************************
//	Info LEARNSMITH
// **************************************************
var int	Huno_LearnSmith;
// **************************************************

INSTANCE DIA_Huno_LEARNSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_LEARNSMITH_Condition;
	information		= DIA_Huno_LEARNSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "Je voudrais essayer de travailler ici aussi.";
};

FUNC INT DIA_Huno_LEARNSMITH_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_LEARNSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_00"); //Je voudrais essayer de travailler ici aussi.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_01"); //Ah, mais tu ne penses pas que tu pourrais faire de grandes lames !
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_02"); //Qu'est-ce que je dois faire ?
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_03"); //D'accord, mets l'acier dans le feu et laisse-le.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_04"); //Ensuite tu dois étirer l'acier chauffé au rouge sur l'enclume.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_05"); //Quand tu as fini, tu mets la lame encore brûlante dans le seau là-bas afin de la tremper.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_06"); //Un fois la lame refroidie, tu dois l'affûter sur la meule.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_07"); //Je vois.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_08"); //Néanmoins, tu auras besoin de quelques petites choses pour ça. Je pourrais te les vendre.

	Huno_LearnSmith = TRUE;
};

// **************************************************
//	Info BUYSMITH
// **************************************************
INSTANCE DIA_Huno_BUYSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_BUYSMITH_Condition;
	information		= DIA_Huno_BUYSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "Je voudrais acheter un équipement de forgeron !";
	trade			= 1;
};

FUNC INT DIA_Huno_BUYSMITH_Condition()
{	
	if	(Huno_LearnSmith == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_BUYSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_BUYSMITH_15_00"); //J'aimerai acheter un équipement de forgeron !

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};


