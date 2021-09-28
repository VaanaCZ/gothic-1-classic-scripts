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
	description		= "Pro� jsi tady a ne v t�bo�e?";
};

FUNC INT DIA_Vlk_534_LeaveMe_Condition()
{	
	return 1;
};

FUNC VOID DIA_Vlk_534_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Vlk_534_LeaveMe_15_00"); //Pro� jsi tady a ne v t�bo�e?
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_01"); //�ek�m na p��tele, a� se vr�t� z dolu. Dlu�� mi n�jakou rudu.
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_02"); //Nem��u p�ij�t do t�bora bez rudy - nemohl bych str��m zaplatit pen�ze za ochranu a to by mi dost v�c� zkomplikovalo.

	AI_StopProcessInfos	(self);
};
