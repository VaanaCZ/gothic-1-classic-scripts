// ************************ EXIT **************************

instance  Info_Riordian_EXIT (C_INFO)
{
	npc			= KDW_605_Riordian;
	nr			= 999;
	condition	= Info_Riordian_EXIT_Condition;
	information	= Info_Riordian_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Riordian_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_Riordian_EXIT_Info()
{
	AI_StopProcessInfos	(self);
	
	if (!Npc_HasItems (self,ItArRuneThunderball))
	{
		CreateInvItem (self,ItArRuneThunderball);
	};

};


//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************//Bist du der Wassermagier, der die Tränke braut?
instance Info_Riordian_NEWS (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_NEWS_Condition;
	information	= Info_Riordian_NEWS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Saturas m'a envoyé.";
};

FUNC INT Info_Riordian_NEWS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_OFFER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_NEWS_Info()
{
	AI_Output (other, self,"Info_Riordian_NEWS_15_01"); //Saturas m'a envoyé.
	AI_Output (self, other,"Info_Riordian_NEWS_14_02"); //Ahhh, viens ici. J'étais déjà au courant.
	AI_Output (self, other,"Info_Riordian_NEWS_14_03"); //Là, prends ces potions, il y en a de toutes sortes.
	AI_Output (self, other,"Info_Riordian_NEWS_14_04"); //Va maintenant, et rapporte-nous les pierres focales. Ces artefacts sont notre seul espoir.

	CreateInvItems (self, ItFo_Potion_Health_01,	20); 
	B_GiveInvItems (self,hero, ItFo_Potion_Health_01,	20); //Notwendig für die Ausschrift "20 Items übergeben", wird sofort ausgeglichen
	Npc_RemoveInvItems(hero, ItFo_Potion_Health_01,	15);

	CreateInvItems (hero, ItFo_Potion_Mana_01,		5);
	CreateInvItems (hero, ItFo_Potion_Health_02,	2);
	CreateInvItems (hero, ItFo_Potion_Mana_02,		2);
	CreateInvItems (hero, ItFo_Potion_Health_03,	1);
	CreateInvItems (hero, ItFo_Potion_Mana_03,		1);
	CreateInvItems (hero, ItFo_Potion_Haste_02,		2);
	CreateInvItems (hero, ItFo_Potion_Strength_01,	1);
	CreateInvItems (hero, ItFo_Potion_Dex_01,		1);
};

//***************************************************************************
//	Info REWARD
//***************************************************************************
instance Info_Riordian_REWARD (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_REWARD_Condition;
	information	= Info_Riordian_REWARD_Info;
	permanent	= 0;
	important 	= 0;
	description = "Saturas a dit que tu avais une récompense pour moi ?";
};

FUNC INT Info_Riordian_REWARD_Condition()
{	
	if (Saturas_BringFoci == 5)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_REWARD_Info()
{
	AI_Output			(other, self,"Info_Riordian_REWARD_15_01"); //Saturas a dit que tu avais une récompense pour moi ?
	AI_Output			(self, other,"Info_Riordian_REWARD_14_02"); //Ahhhh, viens ici, viens ici.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_03"); //Notre chef spirituel m'a parlé de tes actes héroïques.
	AI_Output			(self, other,"Info_Riordian_REWARD_14_04"); //Toutes les personnes dans le camp - non, toute la colonie - te doivent beaucoup..
	AI_Output			(self, other,"Info_Riordian_REWARD_14_05"); //Prends ceci en modeste récompense de tous tes efforts.

	CreateInvItems		(self, ItFo_Potion_Health_02,		20);
	B_GiveInvItems      (self, hero, ItFo_Potion_Health_02, 20);//Notwenidg für Ausschrift "20 Items übergeben", wird sofort ausgeglichen
	Npc_RemoveInvItems  (hero, ItFo_Potion_Health_02, 		15);

	CreateInvItems		(hero, ItFo_Potion_Mana_02,			5);
	CreateInvItems		(hero, ItFo_Potion_Health_03,		2);
	CreateInvItems		(hero, ItFo_Potion_Mana_03,			2);
	CreateInvItems		(hero, ItFo_Potion_Haste_02,		3);
	CreateInvItems		(hero, ItFo_Potion_Master_01,		1);
	CreateInvItems		(hero, ItFo_Potion_Health_Perma_02,	1);
	CreateInvItems		(hero, ItFo_Potion_Mana_Perma_02,	1);

	B_LogEntry			(CH3_BringFoci,"Riordian avait aussi l'esprit ouvert que d'habitude. Il m'a beaucoup de potions. Je suis sûr qu'elles seront bien utilisées.");
	if	Npc_KnowsInfo(hero, Info_Cronos_REWARD)
	{
		Log_SetTopicStatus(CH3_BringFoci,	LOG_SUCCESS);
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
//	Info MESSAGE
//---------------------------------------------------------------------
instance Info_Riordian_MESSAGE (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_MESSAGE_Condition;
	information	= Info_Riordian_MESSAGE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Riordian_MESSAGE_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredFreeMine
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_MESSAGE_Info()
{
	AI_Output (self, hero,"Info_Riordian_MESSAGE_14_01"); //Je suis heureux que tu sois venu ! Je t'attendais !
};

//---------------------------------------------------------------------
//	Info MESSAGEWHY
//---------------------------------------------------------------------
instance Info_Riordian_MESSAGEWHY (C_INFO)
{
	npc			= KDW_605_Riordian;
	condition	= Info_Riordian_MESSAGEWHY_Condition;
	information	= Info_Riordian_MESSAGEWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Tu m'as attendu ? Pourquoi ?";
};

FUNC INT Info_Riordian_MESSAGEWHY_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Riordian_MESSAGE))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Riordian_MESSAGEWHY_Info()
{
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_01"); //Tu m'as attendu ? Pourquoi ?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_02"); //Gorn m'a demandé de t'envoyer à lui dès ton arrivée !
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_03"); //Ca va ?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_04"); //Il a un plan pour libérer la mine occupée.
	AI_Output (hero, self,"Info_Riordian_MESSAGEWHY_15_05"); //Garde-t-il encore l'entrée de la mine ?
	AI_Output (self, hero,"Info_Riordian_MESSAGEWHY_14_06"); //Oui ! Va le voir le plus vite possible !
};
/*------------------------------------------------------------------------
//							WELCOME							//
------------------------------------------------------------------------*/
instance KDW_605_Riordian_WELCOME (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_WELCOME_Condition;
	information		= KDW_605_Riordian_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_605_Riordian_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW )
	
	{
		return TRUE;
	};
};
func void  KDW_605_Riordian_WELCOME_Info()
{
	AI_Output (self, other,"KDW_605_Riordian_WELCOME_Info_14_01"); //Je suis content de te voir que tu nous as rejoints.
};
//-----------------------------------------------------------
instance KDW_605_Riordian_HEAL (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_HEAL_Condition;
	information		= KDW_605_Riordian_HEAL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDW_605_Riordian_HEAL_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	&& (Npc_KnowsInfo(hero,KDW_605_Riordian_WELCOME))
	{
		return TRUE;
	};
};
func void  KDW_605_Riordian_HEAL_Info()
{
	AI_Output (self, other,"KDW_605_Riordian_HEAL_Info_14_01"); //Si tu es blessé, je te soignerai.
};
// ***************************** INFOS ****************************************//

instance  KDW_605_Riordian_HEALINFO (C_INFO)
{
	npc				= KDW_605_Riordian;
	nr				= 100;
	condition		= KDW_605_Riordian_HEALINFO_Condition;
	information		= KDW_605_Riordian_HEALINFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Je suis blessé. Pouvez-vous me guérir ?"; 
};

FUNC int  KDW_605_Riordian_HEALINFO_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]))
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_605_Riordian_HEALINFO_Info()
{
	AI_Output (other, self,"KDW_605_Riordian_HEALINFO_Info_15_01"); //Je suis blessé. Pouvez-vous me guérir ?
	AI_Output (self, other,"KDW_605_Riordian_HEALINFO_Info_14_02"); //Par mes mots,  j'appelle les puissances de guérison, ta corps et l'esprit vont aller mieux !
	 
	hero.attribute [ATR_HITPOINTS] = hero.attribute [ATR_HITPOINTS_MAX];
	Snd_Play  ("MFX_Heal_Cast");
};  
/*------------------------------------------------------------------------
							GREET									
------------------------------------------------------------------------*/

instance  KDW_605_Riordian_GREET (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_GREET_Condition;
	information		= KDW_605_Riordian_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Salutations, Magicien !"; 
};

FUNC int  KDW_605_Riordian_GREET_Condition()
{
	return TRUE;
};


FUNC void  KDW_605_Riordian_GREET_Info()
{
	AI_Output 		(other, self,"KDW_605_Riordian_GREET_Info_15_01"); //Salutations, Magicien !
	AI_Output 		(self, other,"KDW_605_Riordian_GREET_Info_14_02"); //Je suis Riordian, l'alchimiste. Je suppose que tu veux une potion ?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry 		(GE_TraderNC,"Riordian, le Magicien de l'Eau, fait du commerce avec des POTIONS. Il est dans le laboratoire d'alchimie au niveau supérieur.");
	
};  
/*------------------------------------------------------------------------
							TRADE								
------------------------------------------------------------------------*/

instance  KDW_605_Riordian_TRADE (C_INFO)
{
	npc				= KDW_605_Riordian;
	condition		= KDW_605_Riordian_TRADE_Condition;
	information		= KDW_605_Riordian_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Montre moi tes marchandises."; 
	trade			= 1;
};

FUNC int  KDW_605_Riordian_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_605_Riordian_GREET))
	{
		return TRUE;
	};

};
FUNC void  KDW_605_Riordian_TRADE_Info()
{
	AI_Output (other, self,"KDW_605_Riordian_TRADE_Info_15_01"); //Montre moi tes marchandises.
	
};  
