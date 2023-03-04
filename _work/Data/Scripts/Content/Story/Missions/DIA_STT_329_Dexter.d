// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dexter_Exit (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 999;
	condition	= DIA_Dexter_Exit_Condition;
	information	= DIA_Dexter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dexter_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begrüssung
// **************************************************

INSTANCE DIA_Dexter_First (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_First_Condition;
	information	= DIA_Dexter_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Dexter_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_First_Info()
{
	AI_Output (self,other,"DIA_Dexter_IAmNew_10_00"); //Hé, toi ! Je vends de l'Herbe et des potions de la camp de la Secte. Veux-tu quelque chose ?
};

// **************************************************
// 					Kraut
// **************************************************

INSTANCE DIA_Dexter_Kraut (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_Kraut_Condition;
	information	= DIA_Dexter_Kraut_Info;
	permanent	= 0;
	description	= "Qu'est-ce que de l'Herbe ?";
};                       

FUNC INT DIA_Dexter_Kraut_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Kraut_Info()
{
	AI_Output (other,self,"DIA_Dexter_Kraut_15_00"); //Qu'est-ce que de l'Herbe ?
	AI_Output (self,other,"DIA_Dexter_Kraut_10_01"); //Nouveau, n'est-ce pas ? Tu peux la fumer. Très relaxant pour la plupart d'entre nous.
};

// **************************************************
// 					TRADE
// **************************************************

// **************************************************

INSTANCE DIA_Dexter_Trade (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_Trade_Condition;
	information	= DIA_Dexter_Trade_Info;
	permanent	= 1;
	description	= "Montre moi tes marchandises.";
	Trade		= 1;
};                       

FUNC INT DIA_Dexter_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Trade_Info()
{
	AI_Output (other,self,"DIA_Dexter_Trade_15_00"); //Montre moi tes marchandises.
	AI_Output (self,other,"DIA_Dexter_Trade_10_01"); //J'ai la meilleure marchandise ici...
	
	if	(Dexter_Traded == FALSE)
	{
		Log_CreateTopic(GE_TraderOC, LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Dexter, l'Ombre, fait du commerce d'Herbe et de POTION du camp de la Secte.");
	
		Dexter_Traded = TRUE;
	};
};

// **************************************************
// 					JOIN OC
// **************************************************
	var int Dexter_GetKalomsRecipe;
// **************************************************

INSTANCE DIA_Dexter_JoinOC (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_JoinOC_Condition;
	information	= DIA_Dexter_JoinOC_Info;
	permanent	= 0;
	description	= "Je veux rejoindre le Camp - je veux devenir une Ombre.";
};                       

FUNC INT DIA_Dexter_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Dexter_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_00"); //Je veux rejoindre le Camp - je veux devenir une Ombre.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_01"); //Oh ? tu cherches à prouver ta valeur ?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_02"); //Bon - tu peux me rendre un service. Si tu le fais bien, je parlerai en ta faveur à Diego.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_03"); //Qu'est-ce que c'est ?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_04"); //Dans le camp de la Secte il y a un dénommé Kalom. Un gros bonnet - un des Sages de la section.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_05"); //Kalom est un alchimiste. Il connaît la recette d'une potion de guérison efficace.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_06"); //J'aurai voulu lui acheter cette recette, comme ça je pourrais la fabriquer moi-même.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_07"); //Mais personne ne peut approcher Kalom.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_08"); //Et qu'attends-tu de moi ?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_09"); //La secte des farfelus cherchent tout le temps des nouveaux. Tu es nouveau. Fais semblant de vouloir être recruté.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_10"); //Kalom est l'un des Sages, ce qui signifie qu'il examine les nouveaux candidats. Si tu le contactes, essaye de te procurer la recette.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_11"); //Que tu  l'achètes ou pas, ça m'est égal.

	Info_ClearChoices(DIA_Dexter_JoinOC);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Bien - je verrai si je peux obtenir la chose.",DIA_Dexter_JoinOC_Ok);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Ca à l'air d'être une affaires difficiles - combien pour moi ?",DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Ok_15_00"); //Bien - je verrai si je peux obtenir la chose.
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, the Shadow at the market, told me to go to the Guru Kalom in the Sect Camp to get a recipe for him.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter dit que je dois entrer et feindre d'être un partisan du camp de la Secte.");
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch()	
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_HowMuch_15_00"); //Ca à l'air d'être une affaires difficiles - combien pour moi ?
	AI_Output (self,other,"DIA_Dexter_JoinOC_HowMuch_10_01"); //À un moment Diego me demandera si tu conviens. Devine de quoi ma réponse dépendra.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Maybe I'll have to pay for the recipe - give me 50 ore in advance.",DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Advance_15_00"); //Peut-être que je devrai acheter la recette - donne-moi 50 minerais comme paiement anticipé.
	AI_Output (self,other,"DIA_Dexter_JoinOC_Advance_10_01"); //Laisse tomber.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Pas de minerai - pas de recette !",DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Threat_15_00"); //Pas de minerai - pas de recette !
	AI_Output (self,other,"DIA_Dexter_JoinOC_Threat_10_01"); //Bien ! Nous pourrons parler du minerai dès que tu auras la recette.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Non ! Je veux voir le minerai tout de suite ou tu peux obtenir ta recette toi-même.",DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00"); //Non ! Je veux voir le minerai tout de suite ou tu peux obtenir ta recette toi-même.
	AI_Output (self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01"); //Il y a suffisamment de nouveaux, je pense que je devrais donner le travail à l'un d'entre eux...
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Bien ! Oublions tout cela.",DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00"); //Bien ! Oublions tout cela.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01"); //Pas si vite ! J'ai juste voulu savoir jusqu'où tu irais... 50 minerais c'est énorme pour un nouveau venu, non ?
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02"); //ça semble mieux.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03"); //D'accord, j'ai juste 50 pépites de minerai ici. Ne me laisse pas tomber, gamin !
	
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, l'Ombre au marché, m'a dit d'aller voir le Sage Kalom au camp de la Secte et d'obtenir une recette pour lui.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter dit que je dois entrer et feindre d'être un partisan du camp de la Secte.");
	
	CreateInvItems(self, itminugget, 50);
	B_GiveInvItems(self, other, itminugget, 50);
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

// **************************************************
// 					Where ST
// **************************************************
var int Dexter_PsiCamp;
// **************************************************

INSTANCE DIA_Dexter_WhereST (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_WhereST_Condition;
	information	= DIA_Dexter_WhereST_Info;
	permanent	= 1;
	description	= "Where is the Sect Camp?";
};                       

FUNC INT DIA_Dexter_WhereST_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_WhereST_Info()
{
	AI_Output (other,self,"DIA_Dexter_WhereST_15_00"); //Où est le camp de la Secte ?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_01"); //Quitte le camp par la sortie sud, puis dirige-toi vers l'est. Ce serait mieux si tu avais une carte -
	
	if (Npc_HasItems(self,ItWrWorldmap) >0)														//Björn
		{																						//Björn
			AI_Output (self,other,"DIA_Dexter_WhereST_10_02"); //J'en ai une ici pour 50 minerais...
		};																						//Björn
	
	AI_Output (other,self,"DIA_Dexter_WhereST_15_02"); //La sortie sud c'est la tour effondrée, n'est-ce pas ?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_03"); //Exactement.
	
	if	!Dexter_PsiCamp
	{
		B_LogEntry    (CH1_KalomsRecipe,"le camp de la Secte est à l'est du Vieux Camp ");
		Dexter_PsiCamp = TRUE;
	};
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Dexter_KalomsRecipeSuccess (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_KalomsRecipeSuccess_Condition;
	information	= DIA_Dexter_KalomsRecipeSuccess_Info;
	permanent	= 1;
	description	= "J'ai la recette que tu as demandé !";
};                       

FUNC INT DIA_Dexter_KalomsRecipeSuccess_Condition()
{
	if ( (Dexter_GetKalomsRecipe == LOG_RUNNING) && (Npc_HasItems (other, KalomsRecipe) > 0) )
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_KalomsRecipeSuccess_Info()
{
	AI_Output (other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00"); //J'ai la recette que tu as demandé !
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01"); //Très bien ! Montre-la moi !
	
	B_UseFakeScroll();
	
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02"); //Bon ! Maintenant je peux fabriquer des potions moi-même.
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03"); //T'es un bon gars ! Je le dirai à Diego !
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //Voici - prend ça - pour tes efforts...
	
	CreateInvItems (other,itminugget,50);
	
	B_GiveInvItems (other, self, KalomsRecipe, 1);
	
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter a été impressionné. Je suis sûr qu'il parlera à Diego en ma faveur.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter a été impressionné. Mais c'est inutile - je ne peux plus devenir une Ombre désormais");
	};
	B_GiveXP (XP_DexterKalom);
};

