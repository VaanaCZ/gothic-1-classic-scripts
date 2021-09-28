/*------------------------------------------------------------------------
//							EXIT									//
------------------------------------------------------------------------*/

instance  Org_873_Cipher_Exit (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  999;
	condition	=  Org_873_Cipher_Exit_Condition;
	information	=  Org_873_Cipher_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  Org_873_Cipher_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Org_873_Cipher_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ******************************
// 			Hallo
// ******************************

instance  Org_873_Cipher_Hello (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_Hello_Condition;
	information	=  Org_873_Cipher_Hello_Info;
	permanent	=  0;
	description = "Jak to jde?";
};                       

FUNC int  Org_873_Cipher_Hello_Condition()
{
	if (Balor_TellsNCDealer == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_Hello_Info()
{
	AI_Output (other, self,"DIA_Cipher_Hello_15_00"); //Jak to vypad�?
	AI_Output (self, other,"DIA_Cipher_Hello_12_01"); //Vsadili jsme dal�� p���el do Gomezova kola.
	AI_Output (self, other,"DIA_Cipher_Hello_12_02"); //T�i mrtv� str�ci a spousta zbo�� na prodej. P�ip�j�m na to!
	AI_Output (other, self,"DIA_Cipher_Hello_15_03"); //Ty pat�� k t�m chlap�m, co neust�le napadali Star� t�bor?
	AI_Output (self, other,"DIA_Cipher_Hello_12_04"); //Ne. Jen kdy� to stoj� za to.
};

// ******************************
// 			Fisk
// ******************************

instance  Org_873_Cipher_Fisk (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_Fisk_Condition;
	information	=  Org_873_Cipher_Fisk_Info;
	permanent	=  1;
	description = "Fisk ze Star�ho t�bora hled� obchodn�ho partnera.";
};                       

FUNC int  Org_873_Cipher_Fisk_Condition()
{
	if (Fisk_GetNewHehler==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_Fisk_Info()
{
	AI_Output (other, self,"DIA_Cipher_Fisk_15_00"); //Fisk ze Star�ho t�bora hled� obchodn�ho partnera.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_01"); //Nem�m z�jem.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_02"); //Ale Sharky by mohl m�t z�jem. Jestli ho uvid�, �ekni mu.
};

// ******************************
// 			Balor sent Me
// ******************************
	var int Cipher_Trade;
// ******************************

instance  Org_873_Cipher_FromBalor (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_FromBalor_Condition;
	information	=  Org_873_Cipher_FromBalor_Info;
	permanent	=  1;
	description = "Co m��e� nab�dnout?";
};                       

FUNC int  Org_873_Cipher_FromBalor_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_873_Cipher_Hello))
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_FromBalor_Info()
{
	AI_Output (other, self,"DIA_Cipher_FromBalor_15_00"); //Co m��e� nab�dnout?
	AI_Output (self, other,"DIA_Cipher_FromBalor_12_01"); //Opakuji ot�zku: co MَE� nab�dnout? Zaj�maj� m� jen velk� dod�vky.
	if (Balor_TellsNCDealer == TRUE)
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_02"); //Balor ��kal, �e by t� zaj�mala droga z ba�in.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_03"); //Mhmmm. Chce� teda obchodovat?
		Cipher_Trade = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_04"); //S t�m ti nem��u pomoci.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_05"); //A� mi bude� schopen pomoci, p�ij� zp�tky.
	};
};

// ******************************
// 			TRADE
// ******************************

instance  Org_873_Cipher_TRADE (C_INFO)
{
	npc			=  Org_873_Cipher;
	nr			=  1;
	condition	=  Org_873_Cipher_TRADE_Condition;
	information	=  Org_873_Cipher_TRADE_Info;
	permanent	=  1;
	description = "Uzav�eme obchod.";
	trade		= 1;
};                       

FUNC int  Org_873_Cipher_TRADE_Condition()
{
	if ( Cipher_Trade == TRUE)
	{
		return 1;
	};
};

FUNC VOID  Org_873_Cipher_TRADE_Info()
{
	AI_Output (other, self,"DIA_Cipher_TRADE_15_00"); //Uzav�eme obchod.
	AI_Output (self, other,"DIA_Cipher_TRADE_12_01"); //Co chce�?
};
