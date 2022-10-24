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
	description = "Как дела?";
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
	AI_Output (other, self,"DIA_Cipher_Hello_15_00"); //Как дела?
	AI_Output (self, other,"DIA_Cipher_Hello_12_01"); //Как всегда! Мешаем Гомезу жить.
	AI_Output (self, other,"DIA_Cipher_Hello_12_02"); //Три убитых стражника и несколько ценных вещей. За это стоит выпить!
	AI_Output (other, self,"DIA_Cipher_Hello_15_03"); //Так ты один из тех, кто постоянно совершает налеты на Старый лагерь?
	AI_Output (self, other,"DIA_Cipher_Hello_12_04"); //Нет. Только когда может подвернуться стоящее дело.
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
	description = "Фиск из Старого лагеря ищет того, кто мог бы ему помогать.";
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
	AI_Output (other, self,"DIA_Cipher_Fisk_15_00"); //Фиск из Старого лагеря ищет того, кто мог бы ему помогать.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_01"); //А мне это неинтересно.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_02"); //А вот Шарки эта идея, скорее всего, понравится.
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
	description = "Что ты можешь мне предложить?";
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
	AI_Output (other, self,"DIA_Cipher_FromBalor_15_00"); //Что ты можешь мне предложить?
	AI_Output (self, other,"DIA_Cipher_FromBalor_12_01"); //Может, лучше спросить так: что ты можешь предложить? Меня интересуют только крупные дела.
	if (Balor_TellsNCDealer == TRUE)
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_02"); //Бэлор сказал мне, что тебя интересует болотник.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_03"); //Хм. Так ты хочешь его продать, да?
		Cipher_Trade = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_04"); //Пока нет. Я не могу.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_05"); //Так возвращайся, когда сможешь. 
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
	description = "Предлагаю сделку.";
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
	AI_Output (other, self,"DIA_Cipher_TRADE_15_00"); //Предлагаю сделку.
	AI_Output (self, other,"DIA_Cipher_TRADE_12_01"); //Что ты хочешь?
};
