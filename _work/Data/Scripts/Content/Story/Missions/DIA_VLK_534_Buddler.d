// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Vlk_534_Exit (C_INFO)
{
	npc			= Vlk_534_Buddler;
	nr			= 999;
	condition	= DIA_Vlk_534_Exit_Condition;
	information	= DIA_Vlk_534_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Vlk_534_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Vlk_534_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_Vlk_534_LeaveMe (C_INFO)
{
	npc				= Vlk_534_Buddler;
	nr				= 1;
	condition		= DIA_Vlk_534_LeaveMe_Condition;
	information		= DIA_Vlk_534_LeaveMe_Info;
	permanent		= 1;
	description		= "Proè jsi tady a ne v táboøe?";
};

FUNC INT DIA_Vlk_534_LeaveMe_Condition()
{	
	return 1;
};

FUNC VOID DIA_Vlk_534_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Vlk_534_LeaveMe_15_00"); //Proè jsi tady a ne v táboøe?
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_01"); //Èekám na pøítele, až se vrátí z dolu. Dluží mi nìjakou rudu.
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_02"); //Nemùžu pøijít do tábora bez rudy - nemohl bych strážím zaplatit peníze za ochranu a to by mi dost vìcí zkomplikovalo.

	AI_StopProcessInfos	(self);
};
