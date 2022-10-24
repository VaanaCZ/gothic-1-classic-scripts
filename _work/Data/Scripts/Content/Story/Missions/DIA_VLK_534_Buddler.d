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
	description		= "ѕочему ты не в лагере?";
};

FUNC INT DIA_Vlk_534_LeaveMe_Condition()
{	
	return 1;
};

FUNC VOID DIA_Vlk_534_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Vlk_534_LeaveMe_15_00"); //ѕочему ты не в лагере?
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_01"); //я жду одного друга из шахты. ќн задолжал мне руду.
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_02"); //ј без руды мне нельз€ по€вл€тьс€ в лагере, потому что € не смогу заплатить стражникам за защиту, и тогда у мен€ начнутс€ большие непри€тности.

	AI_StopProcessInfos	(self);
};
