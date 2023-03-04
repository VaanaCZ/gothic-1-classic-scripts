
// ************************ EXIT **************************

instance  Nov_1300_Talas_Exit (C_INFO)
{
	npc			=  Nov_1300_Talas;
	nr			=  999;
	condition	=  Nov_1300_Talas_Exit_Condition;
	information	=  Nov_1300_Talas_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Nov_1300_Talas_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Nov_1300_Talas_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_UR (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_UR_Condition;
	information		= Nov_1300_Talas_UR_Info;
	important		= 0;
	permanent		= 0;
	description		= "Tu es Talas, celui qui a été volé ?"; 
};

FUNC int  Nov_1300_Talas_UR_Condition()
{
	if	Npc_KnowsInfo(hero, Info_CorKalom_BringBook)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Nov_1300_Talas_UR_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_UR_Info_15_01"); //Tu es Talas, celui qui a été volé ?
	AI_Output			(self, other,"Nov_1300_Talas_UR_Info_02_02"); //Laisse-moi seul, je ne veux pas parler de ça !
};  
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_HELP (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_HELP_Condition;
	information		= Nov_1300_Talas_HELP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je peux t'aider à reprendre l'almanach."; 
};

FUNC int  Nov_1300_Talas_HELP_Condition()
{
	if	Npc_KnowsInfo(hero, Nov_1300_Talas_UR)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return 1;
	};
};
FUNC void  Nov_1300_Talas_HELP_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_Info_15_01"); //Je peux t'aider à reprendre l'almanach.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_02"); //Vraiment ? J'ai été attaqué par des gobelins ! Et maintenant je suis censé aller là bas et récupérer le livre !
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_03"); //J'ai une suggestion à faire : Je te montrerai la manière d'utiliser l'almanach, ainsi tu pourras le récupérer.

	Info_ClearChoices	(Nov_1300_Talas_HELP);
	Info_AddChoice		(Nov_1300_Talas_HELP,"D'accord.",Nov_1300_Talas_HELP_OK);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Cela te coûtera 30 minerais.",Nov_1300_Talas_HELP_BRING);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Donne-moi 50 minerais et je suis de la partie.",Nov_1300_Talas_HELP_MORE);
	
};  

func void Nov_1300_Talas_HELP_OK ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_OK_15_01"); //D'accord.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_OK_02_02"); //D'accord, nous pouvons partir dès que tu seras prêt.
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_BRING ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_BRING_15_01"); //Cela te coûtera 30 minerais.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_BRING_02_02"); //D'accord, nous pouvons partir dès que tu seras prêt.
	CreateInvItems		(self,ItMiNugget,30);
	B_GiveInvItems      (self,hero,ItMiNugget,30);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_MORE ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_MORE_15_01"); //Donne-moi 50 minerais et je suis de la partie.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_MORE_02_02"); //Quoi ? C'est un vol ! Bon, d'accord, dis-moi quand tu seras prêt.
	CreateInvItems		(self,ItMiNugget,50);
	B_GiveInvItems      (self,hero,ItMiNugget,50);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};

// ***************************** INFOS ****************************************//
instance  Nov_1300_Talas_READY (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_READY_Condition;
	information		= Nov_1300_Talas_READY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je suis prêt, nous pouvons partir maintenant."; 
};

FUNC int  Nov_1300_Talas_READY_Condition()
{
	if	Npc_KnowsInfo(hero, Nov_1300_Talas_HELP)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_READY_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_READY_Info_15_01"); //Je suis prêt, nous pouvons partir maintenant.
	AI_Output			(self, other,"Nov_1300_Talas_READY_Info_02_02"); //D'accord, suis-moi.
	
	B_LogEntry		(CH2_Book,"J'ai promis à Talas de récupérer l'almanach. Il veut me mener où le livre se trouve."); 
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"GOBBOCAVE");
	AI_StopProcessInfos	(self);
	
};  

// ***************************** AN DER BRÜCKE ****************************************//
instance  Nov_1300_Talas_BRIDGE (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BRIDGE_Condition;
	information		= Nov_1300_Talas_BRIDGE_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BRIDGE_Condition()
{
	if 	(Npc_KnowsInfo (hero, Nov_1300_Talas_READY ))
	&&	(Npc_GetDistToWP(self, "LOCATION_29_02")<1000)
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_BRIDGE_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_01"); //Ces fichues petites bêtes vivent dans une grotte derrière ce pont ! Fais attention !
	AI_Output			(other, self,"Nov_1300_Talas_BRIDGE_Info_15_02"); //Tu ne viens pas avec moi ?
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_03"); //J'attends ici et... ahem... je couvre notre retraite.

	B_LogEntry		(CH2_Book,"Maintenant nous sommes debout devant une caverne de gobelins. Ce lâche de novice veut vraiment que j'entre là tout seul.");
};

// ***************************** ZURÜCK INS LAGER ****************************************//
instance  Nov_1300_Talas_BACK (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BACK_Condition;
	information		= Nov_1300_Talas_BACK_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BACK_Condition()
{
	if 	(Npc_KnowsInfo (hero, Nov_1300_Talas_BRIDGE ))
	&&	(Npc_HasItems (hero,ItWrFokusbuch))
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_BACK_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BACK_Info_02_01"); //Tu as l'almanach ! Bien joué. Retournons au camp.

	B_LogEntry		(CH2_Book,"J'ai trouvé l'almanach et je le ramènerai au Camp Marécageux avec Talas.");

	Npc_ExchangeRoutine	(self,"RETURNTOCAMP");
	AI_StopProcessInfos	(self);
};

// ***************************** Zurück im Lager ****************************************//
instance  Nov_1300_Talas_RETURNED (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_RETURNED_Condition;
	information		= Nov_1300_Talas_RETURNED_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_RETURNED_Condition()
{
	if	(Npc_KnowsInfo (hero, Nov_1300_Talas_BACK ))
	&&	Npc_HasItems (hero,ItWrFokusbuch)
	&&	(Npc_GetDistToWP  (self, "PSI_START")<1000)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Nov_1300_Talas_RETURNED_Info()
{
	AI_Output			(self, other,"Info_Talas_RETURNED_02_01"); //Nous sommes de retour. Tu ferais mieux de prendre tout de suite l'almanach à Cor Kalom.
	AI_Output			(other, self,"Info_Talas_RETURNED_15_02"); //Surveille les alentours et ne t'inquiète pas.
	AI_Output			(self, other,"Info_Talas_RETURNED_02_03"); //Ne te fais pas de soucis, je vais bien ! Il n'y a aucune raison de s'inquiéter pour moi.

	B_LogEntry		(CH2_Book,"Maintenant nous sommes de retour au Camp Marécageux. Talas est le lâche le plus grand que je n'ai jamais rencontré. Je prendrai le livre à Cor Kalom moi-même.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"BackInCamp");
	AI_StopProcessInfos	(self);
};


// ***************************** zum OGY ****************************************//
instance  Nov_1300_Talas_OGY (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_OGY_Condition;
	information		= Nov_1300_Talas_OGY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Cor Angar m'a envoyé."; 
};

FUNC int  Nov_1300_Talas_OGY_Condition()
{
	if ( Npc_KnowsInfo ( hero, GUR_1202_CorAngar_WHERE ))
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_OGY_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_OGY_15_01"); //Cor Angar m'a envoyé. Il a dit que tu dois m'emmener au cimetière des Orcs pour trouver Baal Lukor et ses templiers.
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_02"); //Ainsi je suis encore le coursier. Zut ! ! ! Je n'aurais jamais dû perdre cet almanach...
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_03"); //Alors viens avec moi.
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"OGY");
};  

// ***************************** am OGY ****************************************//
instance  Nov_1300_Talas_BACKAGAIN (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BACKAGAIN_Condition;
	information		= Nov_1300_Talas_BACKAGAIN_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BACKAGAIN_Condition()
{
	if ( Npc_GetDistToWP(self,"OW_PATH_011")<1000 )
	{
		return 1;
	};
};

FUNC void  Nov_1300_Talas_BACKAGAIN_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_01"); //Je ne t'emmène pas par ce pont, ce serait un suicide.
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_02"); //Tu  dois être fou pour entrer là, même Baal Lukor et ses templiers n'en sont pas encore re-sortis.
	AI_Output			(other, self,"Nov_1300_Talas_BACKAGAIN_Info_15_03"); //Nous verrons bien ce qu'il va se produire. Retourne au camp, je serais là plus tard.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"ReturnToCampAgain");
	
};

 
