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
//				Hallo und tsch��
//***********************************************

instance  DIA_Rodriguez_Hello (C_INFO)
{
	npc			=  KDF_400_Rodriguez;
	nr			=  1;
	condition	=  DIA_Rodriguez_Hello_Condition;
	information	=  DIA_Rodriguez_Hello_Info;
	permanent	=  1;
	description =  "Hled�m Nejvy���ho m�ga Ohniv�ho kruhu.";
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
	AI_Output (other, self,"DIA_Rodriguez_Hello_15_00"); //Hled�m Nejvy���ho m�ga Ohniv�ho kruhu.
	AI_Output (self, other,"DIA_Rodriguez_Hello_12_01"); //Jdi k Miltenovi. Ten se zab�v� posl��ky, jako jsi ty.
	AI_StopProcessInfos	( self );
};
