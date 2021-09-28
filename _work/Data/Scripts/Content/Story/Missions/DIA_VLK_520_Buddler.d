// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Vlk_520_Exit (C_INFO)
{
	npc			= Vlk_520_Buddler;
	nr			= 999;
	condition	= DIA_Vlk_520_Exit_Condition;
	information	= DIA_Vlk_520_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Vlk_520_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Vlk_520_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_Vlk_520_LeaveMe (C_INFO)
{
	npc				= Vlk_520_Buddler;
	nr				= 2;
	condition		= DIA_Vlk_520_LeaveMe_Condition;
	information		= DIA_Vlk_520_LeaveMe_Info;
	permanent		= 1;
	description		= "Co dÏl·ö tady venku?";
};

FUNC int DIA_Vlk_520_LeaveMe_Condition()
{	
	return 1;
};

FUNC VOID DIA_Vlk_520_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Vlk_520_LeaveMe_15_00"); //Co dÏl·ö tady venku?
	AI_Output (self, other,"DIA_Vlk_520_LeaveMe_01_01"); //Chci mÌt klid - tak se ztraù!

	AI_StopProcessInfos	(self);
};
