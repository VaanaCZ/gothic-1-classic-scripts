// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Cavalorn_Exit (C_INFO)
{
	npc			= STT_336_Cavalorn;
	nr			= 999;
	condition	= DIA_Cavalorn_Exit_Condition;
	information	= DIA_Cavalorn_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cavalorn_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Cavalorn_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Jäger
// **************************************************

INSTANCE DIA_cavalorn_Hunter (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Hunter_Condition;
	information		= DIA_cavalorn_Hunter_Info;
	permanent		= 0;
	description		= "Que fais-tu ici ?"; 
};

FUNC INT DIA_cavalorn_Hunter_Condition()
{	
	return 1;	
};

FUNC VOID DIA_cavalorn_Hunter_Info()
{
	AI_Output (other, self,"DIA_cavalorn_Hunter_15_00"); //Que fais-tu ici ?
	AI_Output (self, other,"DIA_cavalorn_Hunter_12_01"); //Je suis un chasseur - je chasse surtout des charognards.
	
};

// **************************************************
// 						Lehrer
// **************************************************

INSTANCE DIA_cavalorn_Lehrer (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Lehrer_Condition;
	information		= DIA_cavalorn_Lehrer_Info;
	permanent		= 1;
	description		= "Can you teach me something about hunting?"; 
};

FUNC INT DIA_cavalorn_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return 1;	
	};
};

FUNC VOID DIA_cavalorn_Lehrer_Info()
{
	if (log_cavalorntrain == FALSE)
	{
		Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
		B_LogEntry		(GE_TeacherOW,"Cavalorn est un chasseur. Il peut m'apprendre à ME FAUFILER et TIRER A L'ARC aussi. Il vit dans une cabane entre le Vieux et le Nouveau Camp.");
		log_cavalorntrain = TRUE;
	};
	AI_Output (other, self,"DIA_cavalorn_Lehrer_15_00"); //Peux-tu m'apprendre quelque chose au sujet de la chasse ?
	AI_Output (self, other,"DIA_cavalorn_Lehrer_12_01"); //Cela dépend - que veux-tu savoir ?
	
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
	Info_AddChoice		(DIA_cavalorn_Lehrer,DIALOG_BACK															,DIA_cavalorn_Lehrer_BACK);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_2,		LPCOST_TALENT_BOW_2,0)	,DIA_cavalorn_Lehrer_Bow_2);
	};

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_1,		LPCOST_TALENT_BOW_1,0)	,DIA_cavalorn_Lehrer_Bow);
	};
	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)	,DIA_cavalorn_Lehrer_Schleichen);
	};
};

func void DIA_cavalorn_Lehrer_BACK()
{
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
};

func void DIA_Cavalorn_Lehrer_Bow()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Bow_15_00"); //Peux-tu m'apprendre à mieux utiliser mon arc ?
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_01"); //Pour un novice il n'est pas difficile de faire mieux. C'est une question d'attitude.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Place tes pieds bien à part, tiens tes deux bras au même niveau, retiens ta respiration et - tire !
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_03"); //Si tu vises certaines parties du corps, tu n'as besoin seulement d'une flèche. Étant débutant, tu n'as seulement qu'une très petite chance de toucher ces endroits.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_04"); //Mais si tu écoutes bien ce que je t'ai dit, tu tireras mieux la prochaine fois.
	};
};

func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Je veux apprendre à être discret.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //Bonne idée. C'est le plus important si tu veux entrer dans des cabanes pour avoir quelqu'un par derrière.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //Si tu plies tes genoux en marchant, tu peux mieux voir le plancher et tu as un meilleur contrôle de ton corps.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //Mais tout le monde remarquera cette attitude, aussi assure-toi que personne ne te voit quand tu te faufiles discrètement !
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Garde toujours à l'esprit ce que je t'ai dit, et surtout : ne jamais se faire attraper !
	};
};
func void DIA_Cavalorn_Lehrer_Bow_2()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //Tu es déjà un bon chasseur. A présent tu dois acquérir ce que tu ne connais pas encore.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //Pour devenir un tireur d'élite, tu dois cesser d'essayer d'en être un.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Découvre les lois de l'oeil, de la tension, de la trajectoire et de la cible. Dehors, sois toujours attentif et prêt à tout moment.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //Tu maîtrise très bien la technique maintenant. A présent va mettre en pratique ta connaissance et ta compétence.
	};
};
/*------------------------------------------------------------------------
						BOGEN KAUFEN						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_SELLBOW (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_SELLBOW_Condition;
	information		= STT_336_cavalorn_SELLBOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Où obtiendrai-je un arc ?"; 
};

FUNC int  STT_336_cavalorn_SELLBOW_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_SELLBOW_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //Où obtiendrai-je un arc ?
	AI_Output (self, other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //Voici. Je vends les meilleurs arcs de tout le Vieux camp.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Cavalorn fait du commerce d'ARC et de FLÈCHES. Je le trouverai sur le chemin du Nouveau Camp, dans le canyon à l'ouest du Vieux Camp.");
};  

/*------------------------------------------------------------------------
						TRADE						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_TRADE (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_TRADE_Condition;
	information		= STT_336_cavalorn_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Montre moi tes marchandises."; 
	trade 			= 1;
};

FUNC int  STT_336_cavalorn_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero,STT_336_cavalorn_SELLBOW))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_TRADE_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_TRADE_Info_15_01"); //Montre moi tes marchandises.
	
};  








