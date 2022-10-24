// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Ghorim_Exit (C_INFO)
{
	npc			=  Nov_1310_Ghorim;
	nr			=  999;
	condition	=  DIA_Ghorim_Exit_Condition;
	information	=  DIA_Ghorim_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Ghorim_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

instance  DIA_Ghorim_MissingHarlok (C_INFO)
{
	npc			= Nov_1310_Ghorim;
	nr			= 1;
	condition	= DIA_Ghorim_MissingHarlok_Condition;
	information	= DIA_Ghorim_MissingHarlok_Info;
	permanent	= 0;
	description	= "Привет! Как дела?";
};                       

FUNC int  DIA_Ghorim_MissingHarlok_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_MissingHarlok_Info()
{
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_00"); //Привет! Как дела?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_01"); //Устал я, парень, прямо с ног валюсь. Работаю уже два дня - и ни минуты отдыха.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_02"); //Харлок давным-давно должен был заступить на смену. С этим парнем всегда так.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_03"); //Небось, дрыхнет сейчас у себя дома!
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_04"); //А почему ты сам не можешь сходить к нему и привести сюда?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_05"); //Я не могу уйти. Тут работа прежде всего.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_06"); //Может, ты сходишь вместо меня? Он живет под лабораторией Кор Галома, у Фортуно.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_07"); //Скажи ему, чтобы он немедленно тащил свою задницу сюда.
		
	Log_CreateTopic		(CH1_GhorimsRelief,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_RUNNING);
	B_LogEntry			(CH1_GhorimsRelief,	"Послушник Горим попросил меня позвать лентяя Харлока, который сможет его заменить. Я смогу найти его недалеко от дома Фортуно.");

	Ghorim_KickHarlok = LOG_RUNNING;
};

// **************************************************
//					SUCCESS
// **************************************************

instance  DIA_Ghorim_SUCCESS (C_INFO)
{
	npc			= Nov_1310_Ghorim;
	nr			= 1;
	condition	= DIA_Ghorim_SUCCESS_Condition;
	information	= DIA_Ghorim_SUCCESS_Info;
	permanent	= 1;
	description	= "Ну? Теперь ты свободен?";
};                       

FUNC int  DIA_Ghorim_SUCCESS_Condition()
{
	if (Ghorim_KickHarlok == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Ghorim_SUCCESS_Info()
{
	AI_Output (other, self,"DIA_Ghorim_SUCCESS_15_00"); //Ну? Теперь ты свободен?
	AI_Output (self, other,"DIA_Ghorim_SUCCESS_02_01"); //Да, наконец-то я могу поспать. Спасибо, дружище!
};


