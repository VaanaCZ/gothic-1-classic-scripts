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
	AI_Output (other, self,"DIA_Cipher_Hello_15_00"); //Jak to vypadá?
	AI_Output (self, other,"DIA_Cipher_Hello_12_01"); //Vsadili jsme další pøíèel do Gomezova kola.
	AI_Output (self, other,"DIA_Cipher_Hello_12_02"); //Tøi mrtví strážci a spousta zboží na prodej. Pøipíjím na to!
	AI_Output (other, self,"DIA_Cipher_Hello_15_03"); //Ty patøíš k tìm chlapùm, co neustále napadali Starý tábor?
	AI_Output (self, other,"DIA_Cipher_Hello_12_04"); //Ne. Jen když to stojí za to.
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
	description = "Fisk ze Starého tábora hledá obchodního partnera.";
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
	AI_Output (other, self,"DIA_Cipher_Fisk_15_00"); //Fisk ze Starého tábora hledá obchodního partnera.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_01"); //Nemám zájem.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_02"); //Ale Sharky by mohl mít zájem. Jestli ho uvidíš, øekni mu.
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
	description = "Co mùžeš nabídnout?";
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
	AI_Output (other, self,"DIA_Cipher_FromBalor_15_00"); //Co mùžeš nabídnout?
	AI_Output (self, other,"DIA_Cipher_FromBalor_12_01"); //Opakuji otázku: co MÙŽEŠ nabídnout? Zajímají mì jen velké dodávky.
	if (Balor_TellsNCDealer == TRUE)
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_02"); //Balor øíkal, že by tì zajímala droga z bažin.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_03"); //Mhmmm. Chceš teda obchodovat?
		Cipher_Trade = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_04"); //S tím ti nemùžu pomoci.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_05"); //Až mi budeš schopen pomoci, pøijï zpátky.
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
	description = "Uzavøeme obchod.";
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
	AI_Output (other, self,"DIA_Cipher_TRADE_15_00"); //Uzavøeme obchod.
	AI_Output (self, other,"DIA_Cipher_TRADE_12_01"); //Co chceš?
};
