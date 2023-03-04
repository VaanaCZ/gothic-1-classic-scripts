// **************************************
//					EXIT 
// **************************************

instance DIA_Lefty_Exit (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 999;
	condition	= DIA_Lefty_Exit_Condition;
	information	= DIA_Lefty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Lefty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Lefty_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				First At Night
// **************************************

instance DIA_Lefty_FirstAtNight (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_FirstAtNight_Condition;
	information	= DIA_Lefty_FirstAtNight_Info;
	permanent	= 0;
	description = "Que fais-tu ici ?";
};                       

FUNC int DIA_Lefty_FirstAtNight_Condition()
{
	if	(Wld_IsTime(19,00,08,00))
	&&	(!Npc_KnowsInfo(hero,DIA_Lefty_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_FirstAtNight_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Que fais-tu ici ?
	AI_Output (self, other,"DIA_846_Hello_07_01"); //Je travaille pour le Seigneur du Riz.
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //As-tu du travail pour moi ?
	AI_Output (self, other,"DIA_Shrike_GetLost_07_01"); //Je te parlerai plus tard !
	AI_StopProcessInfos	(self);
};

// **************************************
//				First
// **************************************

instance DIA_Lefty_First (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_First_Condition;
	information	= DIA_Lefty_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Lefty_First_Condition()
{
	if	(Wld_IsTime(08,00,19,00))
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_First_Info()
{
	AI_Output (self, other,"DIA_Lefty_First_07_00"); //Hé ! Tu viens d' arriver ? Nous avons besoin de quelqu'un pour porter un peu d'eau aux paysans dans les rizières.
	AI_Output (self, other,"DIA_Lefty_First_07_01"); //De cette façon tu peux te faire quelques amis. Qu'en penses-tu ?
	
	Log_CreateTopic		(CH1_CarryWater,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_RUNNING);
	B_LogEntry			(CH1_CarryWater,"Lefty, un brigand du Nouveau Camp qui est vraiment imbu de lui-même, veut que je j'apporte de l'eau aux paysans dans les rizières.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	Info_AddChoice		(DIA_Lefty_First,"Peut-être plus tard.",DIA_Lefty_First_Later);
	Info_AddChoice		(DIA_Lefty_First,"Amène l'eau aux paysans toi-même !",DIA_Lefty_First_Never);
	Info_AddChoice		(DIA_Lefty_First,"Pour sûr, je serai heureux d'aider.",DIA_Lefty_First_Yes);
};

func void DIA_Lefty_First_Yes()
{
	AI_Output (other, self,"DIA_Lefty_First_Yes_15_00"); //Pour sûr, je serai heureux d'aider.
	AI_Output (self, other,"DIA_Lefty_First_Yes_07_01"); //Magnifique ! Va au Seigneur du Riz. Il te donnera l'eau et te dira tout ce que tu dois savoir. 
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_RUNNING;
	An_Bauern_verteilt = 0;
	B_LogEntry			(CH1_CarryWater,"Bien que ce soit probablement une mission stupide, je suis d'accord, parce que peut-être que je pourrai me faire quelques amis. Je dois obtenir l'eau du Seigneur du Riz.");

	Info_ClearChoices	(DIA_Lefty_First);
};

func void DIA_Lefty_First_Never()
{
	AI_Output (other, self,"DIA_Lefty_First_Never_15_00"); //Amène l'eau aux paysans toi-même !
	AI_Output (self, other,"DIA_Lefty_First_Never_07_01"); //Ce ne sont pas là des manières de traiter des amis ! Je pense que je devrai t'apprendre un peu à vivre !
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_FAILED;
	B_LogEntry			(CH1_CarryWater,"Quand j'ai rejeté 'l'offre' de Lefty, il est devenu désagréable ! Et moi qui pensé que le Vieux Camp était une rude place !");
	
	Info_ClearChoices	(DIA_Lefty_First );
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_First_Later()
{
	AI_Output (other, self,"DIA_Lefty_First_Later_15_00"); //Peut-être plus tard.
	AI_Output (self, other,"DIA_Lefty_First_Later_07_01"); //Mais je n'aurais pas besoin de quelqu'un plus tard. J'ai besoin de ton aide MAINTENANT. Tu veux m'aider ou pas ?
};

// **************************************
//				Every Day
// **************************************
var int CarriedWaterForLefty;
// **************************************

instance DIA_Lefty_WorkDay (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_WorkDay_Condition;
	information	= DIA_Lefty_WorkDay_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC int DIA_Lefty_WorkDay_Condition()
{
	if	(Wld_IsTime(08,00,19,00) || (Lefty_Mission == LOG_SUCCESS))				// wenn Wasser verteilt, dann auch abends am Lagerfeuer!
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	&&	((Lefty_WorkDay <= Wld_GetDay()-1) || (Lefty_Mission == LOG_SUCCESS))	// wenn Wasser verteilt, dann auch noch am selben Tag! 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_WorkDay_Info()
{
	AI_Output (self, other,"DIA_Lefty_WorkDay_07_00"); //Hé, toi !
	
	if (Lefty_Mission == LOG_FAILED)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_00"); //Tu as de la chance ! Je ne t'en donnerai pas une deuxième.
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_01"); //Essayer de ne pas perdre de temps ! Bien, va au Seigneur du Riz et apporte l'eau à tous les paysans. D'accord ?
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		B_LogEntry			(CH1_CarryWater,"J'ai rencontré Lefty de nouveau ! Il veut que j'aille voir le Seigneur du Riz et obtenir l'eau pour les paysans dans la rizière.");
		
		AI_StopProcessInfos	(self);
	}
	else if (Lefty_Mission == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //Je t'ai dit d'apporter de l'eau aux paysans !
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //Je n'aime pas les gens qui font des promesses et puis ne les tiennent pas !
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_FAILED;
		B_LogEntry			(CH1_CarryWater,"Lefty était vraiment devenu fou parce que je n'avais pas encore distribué l'eau ! On pourrait s'amuser encore à ces dépends.");
		
		AI_StopProcessInfos	(self);
		Npc_SetTarget (self, other);
		AI_StartState (self, ZS_ATTACK, 1, "");
	}
	else if (Lefty_Mission == LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //Bien joué ! Finalement, tu as su te montrer utile à quelque chose.
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //Je pense que c'est une mission faite exactement pour toi. Dorénavant, tu la feras tous les jours. Continue comme ça maintenant.
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		if	!CarriedWaterForLefty
		{
			B_LogEntry		(CH1_CarryWater,"Je ne le crois pas. Après avoir distribué l'eau, Lefty veut vraiment que j'apporte l'eau chaque jour. Je pense que cet idiot à besoin d'une correction.");
			B_GiveXP		(XP_LeftyCarriedWater);
			CarriedWaterForLefty = TRUE;
		};
		
		AI_StopProcessInfos	(self);
	};
};

// **************************************
//				NICHT MEHR
// **************************************

instance DIA_Lefty_NeverAgain (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_NeverAgain_Condition;
	information	= DIA_Lefty_NeverAgain_Info;
	permanent	= 1;
	description	= "Dorénavant tu porteras l'eau toi-même.";
};                       

FUNC int DIA_Lefty_NeverAgain_Condition()
{
	if ( (Lefty_Mission == LOG_RUNNING) && (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_NeverAgain_Info()
{
	AI_Output (other, self,"DIA_Lefty_NeverAgain_15_00"); //Dorénavant tu porteras l'eau toi-même.
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_01"); //Oh ? As-tu de meilleurs plans ?
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_02"); //Je pense que je devrai te rappeler qui est le patron !
	
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};	

// **************************************
//				PERM
// **************************************
var int LeftyWasBeaten;
// **************************************
instance DIA_Lefty_PERM (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_PERM_Condition;
	information	= DIA_Lefty_PERM_Info;
	permanent	= 1;
	description	= "Comment vas-tu, mon ami ?";
};                       

FUNC int DIA_Lefty_PERM_Condition()
{
	if (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE) 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_PERM_Info()
{
	AI_Output (other, self,"DIA_Lefty_PERM_15_00"); //Comment vas-tu, mon ami ?
	AI_Output (self, other,"DIA_Lefty_PERM_07_01"); //Ah, l'ami ! Que veux-tu ?

	if	!LeftyWasBeaten
	{
		B_LogEntry			(CH1_CarryWater,"J'ai précisé à Lefty qu'il vaudrait mieux qu'il ne m'ennuie plus avec ses théories sur l'eau. Seules Certaines personnes apprennent la vrai douleur.");
		Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
		B_GiveXP			(XP_LeftyConfronted);
		LeftyWasBeaten = TRUE;
	};
	
	Info_ClearChoices	(DIA_Lefty_PERM );
	Info_AddChoice		(DIA_Lefty_PERM,"Je veux juste savoir comment tu vas.",DIA_Lefty_PERM_Nothing);
	Info_AddChoice		(DIA_Lefty_PERM,"Les paysans semblent assoiffés.",DIA_Lefty_PERM_Durstig);
	Info_AddChoice		(DIA_Lefty_PERM,"J'ai vraiment eu un mauvais jour. Je veux me détendre - toujours debout...",DIA_Lefty_PERM_AufsMaul);

};	

func void DIA_Lefty_PERM_AufsMaul()
{
	AI_Output (other, self,"DIA_Lefty_PERM_AufsMaul_15_00"); //J'ai eu une journée exécrable et je cherche une manière de soulager ma nervosité... reste comme ça une minute.
	B_Say (self,other,"$YOUWANNAFOOLME");
	Info_ClearChoices	(DIA_Lefty_PERM );
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_PERM_Durstig()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Durstig_15_00"); //Les paysans semblent assoiffés.
	AI_Output (self, other,"DIA_Lefty_PERM_Durstig_07_01"); //Je vais voir... ne t'inquiète pas.
	AI_StopProcessInfos	(self);
};

func void DIA_Lefty_PERM_Nothing()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Nothing_15_00"); //Je veux juste savoir comment tu vas.
	AI_StopProcessInfos	(self);
};




	
	
	
	
	
