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
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_01"); //Czekam, a� m�j przyjaciel wr�ci z kopalni. Jest mi winien par� bry�ek rudy.
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_02"); //Nie mog� si� pokaza� w Obozie bez rudy - nie sta� mnie na zap�acenie za ochron�, a wol� nie ryzykowa� �yciem.

	AI_StopProcessInfos	(self);
};
