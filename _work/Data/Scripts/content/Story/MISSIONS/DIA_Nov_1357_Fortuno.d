// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_Fortuno_EXIT (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 999;
	condition	= DIA_Fortuno_EXIT_Condition;
	information	= DIA_Fortuno_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Fortuno_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrьssung
// **************************************************

instance  DIA_Fortuno_Greet (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 1;
	condition	= DIA_Fortuno_Greet_Condition;
	information	= DIA_Fortuno_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Fortuno_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Fortuno_Greet_Info()
{
	AI_Output (self, other,"DIA_Fortuno_Greet_05_00"); //Иди-ка сюда. Я ни одного новичка не отпускаю без подарка.
};

// **************************************************
//				Was ist das Geschenk?
// **************************************************
	var int Fortuno_RationDay;
// **************************************************

instance  DIA_Fortuno_GetGeschenk (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 1;
	condition	= DIA_Fortuno_GetGeschenk_Condition;
	information	= DIA_Fortuno_GetGeschenk_Info;
	permanent	= 0;
	description = "Что это за подарок?";
};                       

FUNC int  DIA_Fortuno_GetGeschenk_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fortuno_GetGeschenk_Info()
{
	AI_Output (other, self,"DIA_Fortuno_GetGeschenk_15_00"); //Что это за подарок?
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_01"); //Вот, возьми этот болотник. Это 'Северный темный'. Отличная вещь!
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_02"); //Каждый день я буду давать тебе немного болотника, но если тебе нужно больше, чем три сигареты, ты должен будешь заплатить.
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_03"); //Если найдешь какие-нибудь травы или ягоды, заходи ко мне. Я с удовольствием куплю их у тебя.

	CreateInvItems(self, itmijoint_2, 3);
	B_GiveInvItems(self, other, itmijoint_2, 3);
	Fortuno_RationDay = Wld_GetDay();
	
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,	"Фортуно торгует травами. Его дом находится под лабораторией Кор Галома.");
};

// **************************************************
//				Tдgliche Ration
// **************************************************

instance  DIA_Fortuno_DailyRation (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 3;
	condition	= DIA_Fortuno_DailyRation_Condition;
	information	= DIA_Fortuno_DailyRation_Info;
	permanent	= 1;
	description = "Я хочу взять дневную порцию болотника.";
};                       

FUNC int  DIA_Fortuno_DailyRation_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk))
	{
		return 1;
	};
};

FUNC VOID  DIA_Fortuno_DailyRation_Info()
{
	AI_Output (other, self,"DIA_Fortuno_DailyRation_15_00"); //Я хочу взять дневную порцию болотника.
	if (Fortuno_RationDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Fortuno_DailyRation_05_01"); //Вот, возьми. Три 'Северных темных'. Только не стоит курить их все сразу!
		CreateInvItems(self, itmijoint_2, 3);
		B_GiveInvItems(self, other, itmijoint_2, 3);
		Fortuno_RationDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Fortuno_DailyRation_05_02"); //Свою дневную порцию ты уже получил. Если тебе нужно больше, приходи утром, или купи сейчас.
	};
};

// **************************************************
//						TRADE
// **************************************************

instance  DIA_Fortuno_BuyJoints (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 4;
	condition	= DIA_Fortuno_BuyJoints_Condition;
	information	= DIA_Fortuno_BuyJoints_Info;
	permanent	= 1;
	description = "Давай меняться.";
	Trade		= 1;
};                       

FUNC int  DIA_Fortuno_BuyJoints_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk))
	{
		return 1;
	};
};

FUNC VOID  DIA_Fortuno_BuyJoints_Info()
{
	AI_Output (other, self,"DIA_Fortuno_BuyJoints_15_00"); //Давай меняться.
	AI_Output (self, other,"DIA_Fortuno_BuyJoints_05_01"); //Что ты от меня хочешь? Быть может, что-нибудь купить?
};




