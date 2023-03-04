instance DIA_ORG_833_Buster (C_INFO)
{
	npc				= ORG_833_Buster;
	condition		= DIA_ORG_833_Buster_Condition;
	information		= DIA_ORG_833_Buster_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_ORG_833_Buster_Condition()
{
	if (Npc_GetTalentSkill(hero, NPC_TALENT_ACROBAT) == 0)
	{
		return TRUE;
	};
};

func void DIA_ORG_833_Buster_Info()
{
	AI_Output (self, other,"DIA_ORG_833_Buster_02_01"); //Tu ne m'as pas l'air très leste. Je pourrais t'aider.
};


// ************************ EXIT **************************

INSTANCE DIA_ORG_833_Buster_Exit (C_INFO)
{
	npc			= ORG_833_Buster;
	nr			= 999;
	condition	= DIA_ORG_833_Buster_Exit_Condition;
	information	= DIA_ORG_833_Buster_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ORG_833_Buster_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_ORG_833_Buster_Exit_Info()
{
	
	AI_StopProcessInfos	( self );
};


// *********** Talent lernen *******************
INSTANCE DIA_ORG_833_Buster3 (C_INFO)
{
	npc				= ORG_833_Buster;
	condition		= DIA_ORG_833_Buster3_Condition;
	information		= DIA_ORG_833_Buster3_Info;
	important		= 0;
	permanent		= 1;
	description		= "Comment peux-tu m'aider ?"; 
};

FUNC INT DIA_ORG_833_Buster3_Condition()
{	
	return Npc_KnowsInfo(hero,DIA_ORG_833_Buster);
};

func VOID DIA_ORG_833_Buster3_Info()
{
	AI_Output (self, other,"DIA_ORG_833_Buster3_02_01"); //Je peux te montrer comment contrôler ton corps. C'est l'art des ACROBATIES.

	Info_ClearChoices	( DIA_ORG_833_Buster3 );
	Info_AddChoice		( DIA_ORG_833_Buster3, DIALOG_BACK													, DIA_ORG_833_Buster_Back );
	Info_AddChoice		( DIA_ORG_833_Buster3, B_BuildLearnString(NAME_LearnAcrobat, LPCOST_TALENT_ACROBAT,0)	, DIA_ORG_833_Buster_Train1 );

	Log_CreateTopic   	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Buster, le brigand, apprend la compétence de l'ACROBATIE.");
};


// ************* Talent lernen **********************
FUNC void DIA_ORG_833_Buster_Train1()
{
	Info_ClearChoices	( DIA_ORG_833_Buster3 );
	
	if (B_GiveSkill(other,NPC_TALENT_ACROBAT , 1, LPCOST_TALENT_ACROBAT))
	{
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_02"); //Dès que tu sauras contrôler ton corps, tu pourras sauter beaucoup plus loin.
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_03"); //Tu apprendras comment tomber et qu'elle est la meilleure manière de te recevoir en tombant. Mais n'oublie pas, tu n'es pas immortel !
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_04"); //Les acrobaties peuvent également être très utiles pendant un combat. Tu pourras changer la distance entre toi et ton ennemi très rapidement. Bonne chance !
	};		
};  


// **************** Back ************************
FUNC VOID DIA_ORG_833_Buster_Back()
{
	Info_ClearChoices	( DIA_ORG_833_Buster3 );
};


