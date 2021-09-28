// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grd_281_Exit (C_INFO)
{
	npc			= GRD_281_Gardist;
	nr			= 999;
	condition	= DIA_Grd_281_Exit_Condition;
	information	= DIA_Grd_281_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grd_281_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_281_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Wache
// **************************************************

INSTANCE DIA_Grd_281_GuardGate (C_INFO)
{
	npc				= GRD_281_Gardist;
	nr				= 1;
	condition		= DIA_Grd_281_GuardGate_Condition;
	information		= DIA_Grd_281_GuardGate_Info;
	permanent		= 1;
	description		= "Co s�ycha�?"; 
};

FUNC INT DIA_Grd_281_GuardGate_Condition()
{	
	if (!C_NpcBelongsToNewcamp (other))
	{	
		return 1;
	};
};
FUNC VOID DIA_Grd_281_GuardGate_Info()
{
	AI_Output (other, self,"DIA_Grd_281_GuardGate_15_00"); //Co s�ycha�?
	AI_Output (self, other,"DIA_Grd_281_GuardGate_07_01"); //Wszystko w porz�dku. Jak okiem si�gn�� - �adnego bandyty z Nowego Obozu!
	AI_StopProcessInfos	( self );
};
