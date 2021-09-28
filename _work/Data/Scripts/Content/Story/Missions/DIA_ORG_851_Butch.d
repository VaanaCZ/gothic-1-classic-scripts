// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Butch_Exit (C_INFO)
{
	npc			= ORG_851_Butch;
	nr			= 999;
	condition	= DIA_Butch_Exit_Condition;
	information	= DIA_Butch_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Butch_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Butch_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ****************************************
// 					Hallo
// ****************************************

instance DIA_Butch_Hello (C_INFO)
{
	npc				= Org_851_Butch;
	nr				= 1;
	condition		= DIA_Butch_Hello_Condition;
	information		= DIA_Butch_Hello_Info;
	important		= 0;
	description		= "Привет. Ты кто?";
};

FUNC int  DIA_Butch_Hello_Condition()
{	
	return 1;
};

func void  DIA_Butch_Hello_Info()
{
	AI_Output (other, self,"DIA_Butch_Hello_15_00"); //Привет. Ты кто?
	AI_Output (self, other,"DIA_Butch_Hello_13_01"); //Не твоего ума дело! Не нравится мне твоя рожа!
	AI_StopProcessInfos	( self );
};


