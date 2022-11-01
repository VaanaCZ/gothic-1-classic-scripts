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
	description		= "Dlaczego siedzisz tutaj, a nie w Obozie?";
};

FUNC INT DIA_Vlk_534_LeaveMe_Condition()
{	
	return 1;
};

FUNC VOID DIA_Vlk_534_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Vlk_534_LeaveMe_15_00"); //Dlaczego siedzisz tutaj, a nie w Obozie?
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_01"); //Czekam, aż mój przyjaciel wróci z kopalni. Jest mi winien parę bryłek rudy.
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_02"); //Nie mogę się pokazać w Obozie bez rudy - nie stać mnie na zapłacenie za ochronę, a wolę nie ryzykować życiem.

	AI_StopProcessInfos	(self);
};
