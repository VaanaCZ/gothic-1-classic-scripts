//***********************************************
//					EXIT	
//***********************************************

instance  DIA_Rodriguez_Exit (C_INFO)
{
	npc			=  KDF_400_Rodriguez;
	nr			=  999;
	condition	=  DIA_Rodriguez_Exit_Condition;
	information	=  DIA_Rodriguez_Exit_Info;
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  DIA_Rodriguez_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Rodriguez_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//***********************************************
//				Hallo und tschüß
//***********************************************

instance  DIA_Rodriguez_Hello (C_INFO)
{
	npc			=  KDF_400_Rodriguez;
	nr			=  1;
	condition	=  DIA_Rodriguez_Hello_Condition;
	information	=  DIA_Rodriguez_Hello_Info;
	permanent	=  1;
	description =  "Hledám Nejvyššího mága Ohnivého kruhu.";
};                       

FUNC int  DIA_Rodriguez_Hello_Condition()
{
	if	(Npc_GetTrueGuild(hero) != GIL_KDF)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Rodriguez_Hello_Info()
{
	AI_Output (other, self,"DIA_Rodriguez_Hello_15_00"); //Hledám Nejvyššího mága Ohnivého kruhu.
	AI_Output (self, other,"DIA_Rodriguez_Hello_12_01"); //Jdi k Miltenovi. Ten se zabývá poslíèky, jako jsi ty.
	AI_StopProcessInfos	( self );
};
