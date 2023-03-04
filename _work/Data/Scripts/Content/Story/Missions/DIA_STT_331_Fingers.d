// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_331_Fingers_Exit (C_INFO)
{
	npc			= STT_331_Fingers;
	nr			= 999;
	condition	= DIA_STT_331_Fingers_Exit_Condition;
	information	= DIA_STT_331_Fingers_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				 Schatten werden
// **************************************************
	var int Fingers_CanTeach;
// **************************************************

INSTANCE DIA_Fingers_BecomeShadow (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_BecomeShadow_Condition;
	information		= DIA_Fingers_BecomeShadow_Info;
	permanent		= 1;
	description		= "Je veux devenir une Ombre !"; 
};

FUNC INT DIA_Fingers_BecomeShadow_Condition()
{	
	if ( (Fingers_CanTeach == FALSE) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_BecomeShadow_Info()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_15_00"); //Je veux devenir une Ombre !
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_05_01"); //Alors  ?
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
	Info_AddChoice		(DIA_Fingers_BecomeShadow,DIALOG_BACK										,DIA_Fingers_BecomeShadow_BACK);
	if (Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice		(DIA_Fingers_BecomeShadow,"Je cherche quelqu'un pour m'apprendre quelque chose.",DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice		(DIA_Fingers_BecomeShadow,"Pouvez-vous m'aider ?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //Pouvez-vous m'aider ?
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //Je ne saurais pas comment...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //Je cherche quelqu'un pour m'apprendre quelque chose.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //Pourquoi es-tu venu chez moi ?
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Diego m'a envoyé.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //Tu aurais dû me le dire avant.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //Si tu veux rejoindre le camp, c'est un avantage d'être un bon combattant ou un voleur.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //Si les Ombres influentes dans ce camp t'examinent, elles te donneront des tâches que tu ferais mieux de faire en anonyme.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //C'est pourquoi la voie du voleur serait un bon début pour toi.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //Par ailleurs, je suis le meilleur voleur dans tout le Vieux camp.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry			(GE_TeacherOC,"Finger peut m'apprendre les compétences de VOL À LA TIRE et comment OUVRIR DES SERRURES");
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

// **************************************************
// 						 Lehrer
// **************************************************
	var int Fingers_Wherecavalorn;

INSTANCE DIA_Fingers_Lehrer (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Lehrer_Condition;
	information		= DIA_Fingers_Lehrer_Info;
	permanent		= 1;
	description		= "Que peux-tu m'enseigner ?"; 
};

FUNC INT DIA_Fingers_Lehrer_Condition()
{	
	if (Fingers_CanTeach == TRUE)
	{
		return 1;	
	};
};

FUNC VOID DIA_Fingers_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_15_00"); //Que peux-tu m'enseigner ?
	AI_Output (self, other,"DIA_Fingers_Lehrer_05_02"); //Cela dépend de ce que tu veux savoir.



	Info_ClearChoices	(DIA_Fingers_Lehrer);
	Info_AddChoice		(DIA_Fingers_Lehrer,DIALOG_BACK																	,DIA_Fingers_Lehrer_BACK);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2	,	LPCOST_TALENT_PICKPOCKET_2,0)	,DIA_Fingers_Lehrer_Pickpocket2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1	,	LPCOST_TALENT_PICKPOCKET_1,0)	,DIA_Fingers_Lehrer_Pickpocket);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2		,	LPCOST_TALENT_PICKLOCK_2,0)	,DIA_Fingers_Lehrer_Lockpick2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1		,	LPCOST_TALENT_PICKLOCK_1,0)	,DIA_Fingers_Lehrer_Lockpick);
	Info_AddChoice		(DIA_Fingers_Lehrer,"Je veux apprendre à me faufiler.",DIA_Fingers_Lehrer_Schleichen);
};


func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //Je veux apprendre à être discret.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //Je crois - sans fausse modestie - que je suis l'un des meilleurs voleurs qu'ils n'ont jamais jetés dans cette colonie.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //Mais quand le temps est venu d'apprendre à se faufiler discrètement, la meilleure chose à faire est d'aller voir Cavalorn !
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //Comment est-ce que je peux améliorer ma compétence de crochetage ?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //Tu en sais assez ! Ce ne sera pas trop difficile de commencer.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //Surtout, tu dois t'assurer que ton crochet ne se casse pas.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //Si tu es un peu plus patient à l'avenir, tu verras que tu n'auras pas besoin de beaucoup de passe-partouts !
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //Comment est-ce que je peux devenir un expert en crochetage de serrures ?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //Seulement quand tu auras gagné une certaine expérience tu sauras à quel moment un crochet va se casser. Il fait un bruit différent !
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //Je pense que tu l'as. Apprend à détecter à l'oreille le doux cliquetis de la serrure et tu ne perdras pas tant de crochets à l'avenir.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //Un expert dans ce domaine a une bonne chance d'ouvrir un tronc sans casser son crochet.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //Je veux devenir un voleur à la tire habile !
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //Ainsi tu veux soulager certaines personnes de leurs affaires ? Alors d'accord.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //Je t'enseignerai comment augmenter ta compétence, mais il est très probable que tu te fasses attraper.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //Tu dois courir le risque seulement si ta victime est isolée.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Seul un expert peut dérober des choses dans les poches de quelqu'un sans qu'il s'en aperçoive !
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //N'y pense pas ! Tu ne feras jamais un voleur habile tant que tu ne peux partir tourner autour de ta victime sans te faire remarquer.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //Je veux devenir un voleur à la tire expert !
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //Je pense que tu as progressé assez pour t'apprendre les derniers tours du métier.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //Mais tu devrais savoir que même les meilleurs se font parfois attraper.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Salut.
	};
};

func VOID DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Fingers_Lehrer );
};

// **************************************************
// 					Wo Cavalorn
// **************************************************

INSTANCE DIA_Fingers_WhereCavalorn (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_WhereCavalorn_Condition;
	information		= DIA_Fingers_WhereCavalorn_Info;
	permanent		= 1;
	description		= "Where can I find Cavalorn?"; 
};

FUNC INT DIA_Fingers_WhereCavalorn_Condition()
{	
	if (Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_WhereCavalorn_Info()
{
	AI_Output (other, self,"DIA_Fingers_WhereCavalorn_15_00"); //Où puis-je trouver Cavalorn ?
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_01"); //Il chasse dans la nature. Tu le trouveras au chemin du Nouveau camp. À l'ouest du Vieux camp il y a une large gorge.
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_02"); //Dans cette gorge il y a une cabane de vieux bûcherons. Tu le trouveras là.
	
	B_LogEntry( GE_TeacherOW,"Cavalorn can teach me to sneak. His hut is in a canyon to the west of the Old Camp, in the direction of the New Camp.");
};

// **************************************************
// 					Gutes Wort
// **************************************************
	var int Fingers_Learnt;
// **************************************************

INSTANCE DIA_Fingers_Learnt (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Learnt_Condition;
	information		= DIA_Fingers_Learnt_Info;
	permanent		= 1;
	description		= "Tu ne parlera pas pour moi devant Diego, n'est-ce pas ?"; 
};

FUNC INT DIA_Fingers_Learnt_Condition()
{	
	if ( (Fingers_Learnt != LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Learnt_Info()
{
	AI_Output (other, self,"DIA_Fingers_Learnt_15_00"); //Tu ne parlera pas pour moi devant Diego, n'est-ce pas ?

	if ( Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK)+Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET)+Npc_GetTalentSkill(other, NPC_TALENT_SNEAK)	> 0)
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_01"); //Oui. Tu as appris quelque chose qui fait de toi quelqu'un qui pourrait nous être très utile.
		AI_Output (self, other,"DIA_Fingers_Learnt_05_02"); //Nous avons besoin de voleurs habiles dans ce camp. Tu auras ma voix.
		Fingers_Learnt = LOG_SUCCESS;
		
		B_GiveXP (XP_Fingerstrain);
		B_LogEntry( CH1_JoinOC,"Finger est vraiment satisfait de mon progrès.");
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_03"); //ça dépend...
		AI_Output (self, other,"DIA_Fingers_Learnt_05_04"); //Si tu apporte la preuve que tu as appris quelque chose comme voleur, nous pourrions nous servir de toi !
		AI_Output (other, self,"DIA_Fingers_Learnt_15_05"); //Comment est-ce que je suis censé faire ça ?
		AI_Output (self, other,"DIA_Fingers_Learnt_05_06"); //En apprenant une compétence de voleur !! Tu dois devenir plus habile en étant discret, faire les poches ou ouvrir des serrures. Alors tu auras ma voix.
		Fingers_Learnt = LOG_RUNNING;
		
		B_LogEntry( CH1_JoinOC,"Finger parlera en ma faveur quand j'aurai appris une des compétences de vol.");
	};
};




























