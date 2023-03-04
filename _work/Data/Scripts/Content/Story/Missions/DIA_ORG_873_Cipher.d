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
	description = "Comment vont les choses ?";
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
	AI_Output (other, self,"DIA_Cipher_Hello_15_00"); //Comment vont les choses ?
	AI_Output (self, other,"DIA_Cipher_Hello_12_01"); //Nous avons mis un autre bâton dans la roue de Gomez.
	AI_Output (self, other,"DIA_Cipher_Hello_12_02"); //Trois gardes et un bon paquet de marchandise à vendre. Je boirai à ça !
	AI_Output (other, self,"DIA_Cipher_Hello_15_03"); //Tu es l'un des types qui continuent à piller le Vieux camp ?
	AI_Output (self, other,"DIA_Cipher_Hello_12_04"); //Non. Seulement quand ça en le vaut la peine.
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
	description = "Fisk du Vieux Camp cherche un associé commercial. ";
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
	AI_Output (other, self,"DIA_Cipher_Fisk_15_00"); //Fisk du Vieux Camp cherche un associé commercial. 
	AI_Output (self, other,"DIA_Cipher_Fisk_12_01"); //Je ne suis pas intéressé.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_02"); //Mais Sharky pourrait être intéressé. Si tu le trouves, demande lui.
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
	description = "Qu'as-tu à m'offrir ? ";
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
	AI_Output (other, self,"DIA_Cipher_FromBalor_15_00"); //Qu'as-tu à m'offrir ? 
	AI_Output (self, other,"DIA_Cipher_FromBalor_12_01"); //Laisse moi reformuler cette question : Qu'as-tu a offrir ? Seuls les gros arrivages m'intéressent.
	if (Balor_TellsNCDealer == TRUE)
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_02"); //Balor a dit que tu étais intéressé par l'Herbe.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_03"); //Mhmmm. tu veux commercer ?
		Cipher_Trade = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_04"); //Je ne peux pas t'aider là.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_05"); //Alors reviens quand tu pourras m'aider.
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
	description = "Faisons affaire.";
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
	AI_Output (other, self,"DIA_Cipher_TRADE_15_00"); //Faisons affaire.
	AI_Output (self, other,"DIA_Cipher_TRADE_12_01"); //Qu'est-ce que tu veux ?
};
