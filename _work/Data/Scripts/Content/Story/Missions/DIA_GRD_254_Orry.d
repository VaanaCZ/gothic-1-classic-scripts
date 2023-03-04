// **************************************************
// 						 PRE EXIT 
// **************************************************

INSTANCE DIA_Orry_PreExit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_PreExit_Condition;
	information	= DIA_Orry_PreExit_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_PreExit_Condition()
	
	{
		return 1;
	};

FUNC VOID DIA_Orry_PreExit_Info()
{
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //Tu avais mieux à faire pour être sûr de te faire connaître de tout le Vieux camp d'un seul coup !
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Orry_Exit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_Exit_Condition;
	information	= DIA_Orry_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_Exit_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orry_PreExit))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Wache
// **************************************************

INSTANCE DIA_Orry_GuardGate (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_GuardGate_Condition;
	information		= DIA_Orry_GuardGate_Info;
	permanent		= 0;
	description		= "Que fais-tu ici ?"; 
};

FUNC INT DIA_Orry_GuardGate_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_GuardGate_Info()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //Que fais-tu ici ?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Je m'assure que personne ne s'approche de l'endroit de l'échange. Et spécialement ces coupeurs de gorges du Nouveau Camp.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Tu es le nouveau gars qu'ils ont jeté aujourd'hui, non ?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //C'est moi, en effet.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //Alors tu ferais bien de prêter attention aux gars du Nouveau camp !
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Je travaille pour le Vieux camp, comme les autres qui t'ont aperçu à l'endroit de l'échange.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //Je suppose que tu as parlé avec Diego…?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"Non.",DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Oui.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //Non.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //Alors ça ira ! C'est lui qui traite avec les nouveaux venus.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //Il connaît beaucoup de choses sur la colonie - celles qui sont importantes pour les nouveaux comme toi.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Oui, en effet.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //Bien. Alors tu dois être mis au courant de ce qui se passe par ici.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

// **************************************************
// 					New Camp
// **************************************************

INSTANCE DIA_Orry_NewCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 1;
	condition		= DIA_Orry_NewCamp_Condition;
	information		= DIA_Orry_NewCamp_Info;
	permanent		= 0;
	description		= "Pourquoi surveilles-tu les personnes du Nouveau Camp ?"; 
};

FUNC INT DIA_Orry_NewCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_NewCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //Pourquoi surveilles-tu les personnes du Nouveau Camp ?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //Comparé au Nouveau camp, le Vieux camp est un endroit calme et paisible.
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //Le Nouveau camp n'est pas ravitaillé par le monde extérieur. ici, la plupart des bandits volent juste ce dont ils ont besoin.
};

// **************************************************
// 					Old Camp
// **************************************************

INSTANCE DIA_Orry_OldCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_OldCamp_Condition;
	information		= DIA_Orry_OldCamp_Info;
	permanent		= 0;
	description		= "Et le Vieux Camp ?"; 
};

FUNC INT DIA_Orry_OldCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_OldCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //Et le Vieux Camp ?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //Les Barons du minerai contrôlent tout. Ensuite viennent les gardes, suivies des Ombres. Les mineurs arrivent en dernier.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Tous ceux qui arrivent ici commencent comme mineurs. Si tu veux évoluer, tu dois rapidement faire partie des Ombres.
};

// **************************************************
// 					Shore
// **************************************************

INSTANCE DIA_Orry_Shore (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Shore_Condition;
	information		= DIA_Orry_Shore_Info;
	permanent		= 0;
	description		= "Quand je suis sorti de l'eau, un des gars m'a frappé au visage."; 
};

FUNC INT DIA_Orry_Shore_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Shore_Info()
{
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Quand je suis sorti de l'eau, un des gars m'a frappé au visage.
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //"Ils font ça à tous les nouveaux. ça s'appelle 'La Mise au ""Poing""'."
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //Oh. Tous les gars sont comme ça dans le Vieux camp ?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //Nous avons aussi quelques crétins. Mais tu n'as rien à craindre d'eux aussi longtemps que tu les payeras pour te protéger.
};

// **************************************************
// 					Frau
// **************************************************

INSTANCE DIA_Orry_Woman (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Woman_Condition;
	information		= DIA_Orry_Woman_Info;
	permanent		= 0;
	description		= "J'ai vu une femme descendre avec les marchandises."; 
};

FUNC INT DIA_Orry_Woman_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Woman_Info()
{
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //J'ai vu une femme descendre avec les marchandises.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //Ouais, les Barons du minerai ont tout ce qu'ils veulent.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Irais-tu jusqu'à dire que le Roi échange des femmes contre du minerai ?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //elles sont aussi coupables de crimes, c'est sûr. Mais si Gomez ne les avait pas demandé, elles seraient au mieux en train de pourrir au fond d'un cachot.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //Je ne suis pas certain que ça soit pire...
};

// **************************************************
// 					Waffe
// **************************************************

INSTANCE DIA_Orry_Waffe (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Waffe_Condition;
	information		= DIA_Orry_Waffe_Info;
	permanent		= 0;
	description		= "Je cherche une arme..."; 
};

FUNC INT DIA_Orry_Waffe_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Waffe_Info()
{
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //Je cherche une arme...
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //Il devrait y avoir quelques vieilles armes dans la mine abandonnée, celle qui se trouve un peu plus loin dans le ravin.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Mais tu ne va pas faire la guerre avec seulement une pioche pour seule arme - ce genre d'attirail est lourd et inefficace
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Un guerrier inexpérimenté ne devrait jamais se servir de ça, sauf en cas d'urgence.
	
};



