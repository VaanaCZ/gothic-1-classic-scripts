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
	AI_Output (self, other,"DIA_ORG_833_Buster_02_01"); //ѕохоже, ты не слишком проворен. я могу помочь тебе.
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
	description		= "„ем ты можешь мне помочь?"; 
};

FUNC INT DIA_ORG_833_Buster3_Condition()
{	
	return Npc_KnowsInfo(hero,DIA_ORG_833_Buster);
};

func VOID DIA_ORG_833_Buster3_Info()
{
	AI_Output (self, other,"DIA_ORG_833_Buster3_02_01"); //я могу обучить теб€ контролю над телом. Ёто искусство называетс€ акробатика.

	Info_ClearChoices	( DIA_ORG_833_Buster3 );
	Info_AddChoice		( DIA_ORG_833_Buster3, DIALOG_BACK													, DIA_ORG_833_Buster_Back );
	Info_AddChoice		( DIA_ORG_833_Buster3, B_BuildLearnString(NAME_LearnAcrobat, LPCOST_TALENT_ACROBAT,0)	, DIA_ORG_833_Buster_Train1 );

	Log_CreateTopic   	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,	"¬ор Ѕустер может научить мен€ акробатике.");
};


// ************* Talent lernen **********************
FUNC void DIA_ORG_833_Buster_Train1()
{
	Info_ClearChoices	( DIA_ORG_833_Buster3 );
	
	if (B_GiveSkill(other,NPC_TALENT_ACROBAT , 1, LPCOST_TALENT_ACROBAT))
	{
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_02"); // огда ты контролируешь свое тело, ты можешь прыгать гораздо дальше. 
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_03"); //я научу теб€ откатыватьс€ в сторону, покажу, как приземл€тьс€ после падени€. Ќо не стоит забывать, что ты все-таки не бессмертный!
		AI_Output (self, other,"DIA_ORG_833_Buster3_02_04"); //јкробатика также очень полезна в бою. “ы сможешь быстро мен€ть дистанцию между собой и противником. Ќу, с богом! 
	};		
};  


// **************** Back ************************
FUNC VOID DIA_ORG_833_Buster_Back()
{
	Info_ClearChoices	( DIA_ORG_833_Buster3 );
};


