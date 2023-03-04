// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Wedge_Exit (C_INFO)
{
	npc			= ORG_850_Wedge;
	nr			= 999;
	condition	= DIA_Wedge_Exit_Condition;
	information	= DIA_Wedge_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Wedge_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wedge_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ****************************************
// 					Psst
// ****************************************

instance DIA_Wedge_Psst (C_INFO)
{
	npc				= Org_850_Wedge;
	nr				= 1;
	condition		= DIA_Wedge_Psst_Condition;
	information		= DIA_Wedge_Psst_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_Wedge_Psst_Condition()
{	
	if ( (Npc_GetDistToNpc (hero,self) < 900) && (Wld_IsTime(08,00,23,30)) )
	{
		return TRUE;
	};
};
func void  DIA_Wedge_Psst_Info()
{
	AI_Output (self, other,"DIA_Wedge_Psst_05_00"); //Sshh... hé, toi !
	AI_Output (other, self,"DIA_Wedge_Psst_15_01"); //Qui ?... Moi ?
	AI_Output (self, other,"DIA_Wedge_Psst_05_02"); //Oui... Viens ici !
	AI_StopProcessInfos	(self);
};

// ****************************************
// 					Hallo
// ****************************************

instance  DIA_Wedge_Hello (C_INFO)
{
	npc				= Org_850_Wedge;
	condition		= DIA_Wedge_Hello_Condition;
	information		= DIA_Wedge_Hello_Info;
	important		= 0;
	permanent		= 0;
	description		= "Qu'est-ce que tu veux ?"; 
};

FUNC int  DIA_Wedge_Hello_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Psst))
	{
		return TRUE;
	};

};
FUNC void  DIA_Wedge_Hello_Info()
{
	AI_Output (other, self,"DIA_Wedge_Hello_15_00"); //Qu'est-ce que tu veux ?
	AI_Output (self, other,"DIA_Wedge_Hello_05_01"); //Tu viens juste d'arriver, n'est-ce pas ? Je l'ai remarqué tout de suite.
	AI_Output (self, other,"DIA_Wedge_Hello_05_02"); //Il y a beaucoup de choses que tu dois savoir. Je peux t'enseigner certaines de ces choses.
	AI_Output (self, other,"DIA_Wedge_Hello_05_03"); //En outre, tu dois savoir à qui tu parles. Butch, par exemple c'est le type là-bas, à côté du Feu de camp... Méfies-toi de lui !
};  

// ****************************************
// 				Was ist mit Butch
// ****************************************

instance  DIA_Wedge_WarnsOfButch (C_INFO)
{
	npc				= Org_850_Wedge;
	condition		= DIA_Wedge_WarnsOfButch_Condition;
	information		= DIA_Wedge_WarnsOfButch_Info;
	important		= 0;
	permanent		= 0;
	description		= "Qu'est-ce qu'il y a avec Butch ?"; 
};

FUNC int  DIA_Wedge_WarnsOfButch_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};

};
FUNC void  DIA_Wedge_WarnsOfButch_Info()
{
	AI_Output (other, self,"DIA_Wedge_WarnsOfButch_15_00"); //Qu'est-ce qu'il y a avec Butch ?
	AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_01"); //Il a la sale manie de provoquer les nouveaux. Tu ferais mieux de l'éviter.
	//AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_02"); //Also, geh ihm am besten aus dem Weg.//***Doppelt***
};  

// ****************************************
// 					Lehrer
// ****************************************

INSTANCE DIA_Wedge_Lehrer (C_INFO)
{
	npc				= Org_850_Wedge;
	nr				= 700;
	condition		= DIA_Wedge_Lehrer_Condition;
	information		= DIA_Wedge_Lehrer_Info;
	permanent		= 1;
	description		= "Que peux-tu m'enseigner ?"; 
};

FUNC INT DIA_Wedge_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Hello))
	{	
		return TRUE;	
	};
};

FUNC VOID DIA_Wedge_Lehrer_Info()
{
	if (log_wedgelearn == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
		B_LogEntry			(GE_TeacherNC,"Wedge, le brigand, peut m'apprendre comment me FAUFILER, LE VOL À LA TIRE.");
		log_wedgelearn = TRUE ;
	};
	AI_Output (other, self,"DIA_Wedge_Lehrer_15_00"); //Que peux-tu m'enseigner ?
	AI_Output (self, other,"DIA_Wedge_Lehrer_05_01"); //ça dépend... Que veux-tu savoir ?
	

	Info_ClearChoices	(DIA_Wedge_Lehrer );
	Info_AddChoice		(DIA_Wedge_Lehrer,DIALOG_BACK																,DIA_Wedge_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0)		,DIA_Wedge_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0)		,DIA_Wedge_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,0)		,DIA_Wedge_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,0)		,DIA_Wedge_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)			,DIA_Wedge_Lehrer_Schleichen);
	};
};


func void DIA_Wedge_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Schleichen_15_00"); //Je veux apprendre à me faufiler.
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_01"); //Tout est question d'équilibre. Tu dois également apprendre à contrôler ta respiration.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_02"); //Fais attention à tes gestes et personne ne t'entendra te déplacer.
	};
};

func void DIA_Wedge_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick_15_00"); //Comment est-ce que je peux améliorer ma compétence de crochetage ?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_01"); //Tu en sais assez ! Ce ne sera pas trop difficile de commencer.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_02"); //Surtout, tu dois t'assurer que ton crochet ne se casse pas.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_03"); //Si tu es un peu plus patient à l'avenir, tu verras en plus que tu n'as pas besoin de beaucoup de crochets !
	};
};

func void DIA_Wedge_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick2_15_00"); //Comment est-ce que je peux devenir un expert en crochetage ?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_01"); //Seulement quand tu auras gagné une certaine expérience tu sauras à quel moment un crochet va se casser. Il fait un bruit différent !
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_02"); //Je pense que tu l'as. Apprend à détecter à l'oreille le doux cliquetis de la serrure et tu ne perdras pas tant de crochets à l'avenir.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_03"); //Un expert dans ce domaine a une bonne chance d'ouvrir un tronc sans casser son crochet.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00"); //Je veux devenir un bon voleur à la tire !
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01"); //Ainsi tu veux soulager certaines personnes de leurs affaires ? Alors d'accord.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02"); //Je t'enseignerai comment augmenter ta compétence, mais il est très probable que tu te fasses attraper.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03"); //Tu dois courir le risque seulement si ta victime est isolée.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04"); //Seul un expert peut dérober des choses dans les poches de quelqu'un sans qu'il s'en aperçoive !
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Wedge_lehrer_Pickpocket_05_05"); //N'y pense pas ! Tu ne feras jamais un voleur habile tant que tu ne peux partir tourner autour de ta victime sans te faire remarquer.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Pickpocket2_15_00"); //Je veux devenir un voleur à la tire expert !
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_01"); //Je pense que tu as progressé assez pour t'apprendre les derniers tours du métier.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_02"); //Mais tu devrais savoir que même les meilleurs se font parfois attraper.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_03"); //Salut.
	};
};

func VOID DIA_Wedge_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Wedge_Lehrer );
};

