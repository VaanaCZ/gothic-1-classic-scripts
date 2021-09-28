// ************************ EXIT **************************

instance  Org_843_Sharky_Exit (C_INFO)
{
	npc			=  Org_843_Sharky;
	nr			=  999;
	condition	=  Org_843_Sharky_Exit_Condition;
	information	=  Org_843_Sharky_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_843_Sharky_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_843_Sharky_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

/*------------------------------------------------------------------------
						HANDEL								
------------------------------------------------------------------------*/

instance  Org_843_Sharky_Fisk (C_INFO)
{
	npc				= Org_843_Sharky;
	nr 				= 2;
	condition		= Org_843_Sharky_Fisk_Condition;
	information		= Org_843_Sharky_Fisk_Info;
	permanent		= 0;
	description		= "Фиску из Старого Лагеря нужен новый компаньон."; 
	trade 			= 1;
};

FUNC int  Org_843_Sharky_Fisk_Condition()
{	
	if (Fisk_GetNewHehler == LOG_RUNNING)
	{
		return TRUE;
	};

};
FUNC void  Org_843_Sharky_Fisk_Info()
{
	AI_Output (other, self,"Org_843_Sharky_Fisk_Info_15_00"); //Фиску из Старого Лагеря нужен новый компаньон.
	AI_Output (self, other,"Org_843_Sharky_Fisk_Info_10_01"); //А почему ты рассказываешь об этом мне?
	AI_Output (other, self,"Org_843_Sharky_Fisk_Info_15_02"); //Думал, что ты захочешь получить немного руды.
	AI_Output (self, other,"Org_843_Sharky_Fisk_Info_10_03"); //Почему бы и нет... Передай Фиску, что следующие несколько дней он может рассчитывать на меня.
};  


/*------------------------------------------------------------------------
						HANDEL								
------------------------------------------------------------------------*/

instance  Org_843_Sharky_TRADE (C_INFO)
{
	npc				= Org_843_Sharky;
	condition		= Org_843_Sharky_TRADE_Condition;
	information		= Org_843_Sharky_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Мне кое-что нужно..."; 
	trade 			= 1;
};

FUNC int  Org_843_Sharky_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero, Org_843_Sharky_GREET))
	{
		return TRUE;
	};

};
FUNC void  Org_843_Sharky_TRADE_Info()
{
	AI_Output (other, self,"Org_843_Sharky_TRADE_Info_15_01"); //Мне кое-что нужно...
};  

/*------------------------------------------------------------------------
							TRADE BEGRЬЯUNG 								
------------------------------------------------------------------------*/

instance  Org_843_Sharky_GREET (C_INFO) 
{
	npc				= Org_843_Sharky;
	condition		= Org_843_Sharky_GREET_Condition;
	information		= Org_843_Sharky_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "Эй, как дела?"; 
};

FUNC int  Org_843_Sharky_GREET_Condition()
{
	return TRUE;
};


FUNC void  Org_843_Sharky_GREET_Info()
{
	AI_Output		(other, self,"Org_843_Sharky_GREET_Info_15_01"); //Эй, как дела?
	AI_Output		(self, other,"Org_843_Sharky_GREET_Info_10_02"); //Хочешь купить что-нибудь?
	Log_CreateTopic (GE_TraderNC,LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Вор Шарки занимается оружием и другими товарами. Обычно он шатается по Новому Лагерю."); 
};





	



