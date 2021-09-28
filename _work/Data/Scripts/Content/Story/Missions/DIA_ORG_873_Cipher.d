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
	description = "Как жизнь?";
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
	AI_Output (self, other,"DIA_Cipher_Hello_12_01"); //Мы еще раз крепко насолили Гомезу.
	AI_Output (self, other,"DIA_Cipher_Hello_12_02"); //Три убитых стражника и куча добра на продажу. За это я выпью!
	AI_Output (other, self,"DIA_Cipher_Hello_15_03"); //ВЫ постоянно совершаете набеги на Старый Лагерь?
	AI_Output (self, other,"DIA_Cipher_Hello_12_04"); //Нет, только когда дело того стоит.
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
	description = "Фиску из Старого Лагеря нужен компаньон.";
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
	AI_Output (other, self,"DIA_Cipher_Fisk_15_00"); //Фиску из Старого Лагеря нужен компаньон.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_01"); //Меня это не интересует.
	AI_Output (self, other,"DIA_Cipher_Fisk_12_02"); //Но это вполне может заинтересовать Шарки. Спроси его при встрече.
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
	description = "Что у вас есть?";
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
	AI_Output (other, self,"DIA_Cipher_FromBalor_15_00"); //Что у вас есть?
	AI_Output (self, other,"DIA_Cipher_FromBalor_12_01"); //Давай изменим вопрос. Что есть у ТЕБЯ? Я занимаюсь только крупными сделками.
	if (Balor_TellsNCDealer == TRUE)
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_02"); //Бэлор говорил,  тебе нужен болотник.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_03"); //Ммммм. Хочешь обменять его?
		Cipher_Trade = TRUE;
	}
	else
	{
		AI_Output (other, self,"DIA_Cipher_FromBalor_15_04"); //В этом я тебе не помощник.
		AI_Output (self, other,"DIA_Cipher_FromBalor_12_05"); //Тогда возвращайся, когда ты сможешь мне помочь.
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
	AI_Output (self, other,"DIA_Cipher_TRADE_12_01"); //Что тебе нужно?
};
