// **************************************
//					EXIT 
// **************************************

instance  DIA_Skip_Exit (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  999;
	condition	=  DIA_Skip_Exit_Condition;
	information	=  DIA_Skip_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Skip_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Skip_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				First
// **************************************
	var int Skip_TradeFree;
// **************************************

instance  DIA_Skip_First (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  1;
	condition	=  DIA_Skip_First_Condition;
	information	=  DIA_Skip_First_Info;
	permanent	=  0;
	description = "Чем ты занимаешься?";
};                       

FUNC int  DIA_Skip_First_Condition()
{
	if ( !( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) ) )
	{	
		return 1;
	};
};

FUNC VOID  DIA_Skip_First_Info()
{
	AI_Output (other, self,"DIA_Skip_First_15_00"); //Чем ты занимаешься?
	AI_Output (self, other,"DIA_Skip_First_12_01"); //Я занимаюсь оружием для стражников.
	AI_Output (other, self,"DIA_Skip_First_15_02"); //Ты продаешь оружие?
	AI_Output (self, other,"DIA_Skip_First_12_03"); //Только Гомезу и его людям.

	if	!Npc_KnowsInfo(hero, DIA_Raven_Equipment)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"Стражник Скип приторговывает оружием на заднем дворе. Но только для людей Гомеза.");
	};
	
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Все ясно. Увидимся!",DIA_Skip_First_BACK);
	Info_Addchoice 		(DIA_Skip_First,"Меня прислал Торус. Он велел мне подобрать оружие.",DIA_Skip_First_Thorus);
	Info_Addchoice 		(DIA_Skip_First,"Меня прислал Гомез.",DIA_Skip_First_Gomez);
		
};

func void DIA_Skip_First_Gomez()
{
	AI_Output (other, self,"DIA_Skip_First_Gomez_15_00"); //Меня прислал Гомез. Он сказал, что ты должен подобрать для меня снаряжение.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_01"); //Как обычно, да? Новые доспехи и лучшее оружие из того, что у меня есть.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_02"); //Убирайся отсюда, пока я не разозлился!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_15_00"); //Меня прислал Торус. Он велел мне подобрать оружие.
	AI_Output (self, other,"DIA_Skip_First_Thorus_12_01"); //Да?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Почему бы тебе самому не спросить его? ",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"Выдай оружие!",DIA_Skip_First_Thorus_KickAss);
	Info_Addchoice 		(DIA_Skip_First,"Он хочет, чтобы я кое-что сделал для него...",DIA_Skip_First_Thorus_Stranger);
};

func void DIA_Skip_First_BACK()
{
	AI_Output (other, self,"DIA_Skip_First_BACK_15_00"); //Все ясно. Увидимся!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};
//------------------------------------------------------
func void DIA_Skip_First_Thorus_Stranger()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_Stranger_15_00"); //Он хочет, чтобы я кое-что сделал для него... небольшое задание, которое не по зубам ни одному из вас.
	AI_Output (self, other,"DIA_Skip_First_Thorus_Stranger_12_01"); //Да? И он не придумал ничего лучше, как послать тебя ко мне, верно?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Почему бы тебе самому не спросить его? ",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"Выдай оружие!",DIA_Skip_First_Thorus_KickAssAGAIN);
};

func void DIA_Skip_First_Thorus_KickAss()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAss_15_00"); //Он велел пинать твою тощую задницу до тех пор, пока ты не выдашь мне оружие.
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAss_12_01"); //В самом деле? Мне кажется, если ты не уберешься отсюда достаточно быстро, это Я буду пинать ТВОЮ задницу.
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_AskHim()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_AskHim_15_00"); //Почему бы тебе самому не спросить его? 
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_01"); //Можешь не сомневаться, именно это я и сделаю. Но не сейчас. Уверен, он захочет услышать, что ты говорил о нем.
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_02"); //Не знаю, кто тебя впустил, но на твоем месте я бы поскорее убрался отсюда!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_KickAssAGAIN()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00"); //Он велел пинать твою тощую задницу до тех пор, пока ты не выдашь мне оружие.
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAssAGAIN_12_01"); //Ладно, парень, что тебе нужно?
	Info_ClearChoices 	(DIA_Skip_First);
	Skip_TradeFree = TRUE;
};

// **************************************
//			VERPATZT
// **************************************

instance  DIA_Skip_VERPATZT (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  1;
	condition	=  DIA_Skip_VERPATZT_Condition;
	information	=  DIA_Skip_VERPATZT_Info;
	permanent	=  1;
	description = "Я думаю, мне стоит посоветоваться по поводу снаряжения...";
};                       

FUNC int  DIA_Skip_VERPATZT_Condition()
{
	if 	( 
		( !( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) ) )
		&& ( (Npc_KnowsInfo(hero,DIA_Skip_First)) && (Skip_TradeFree == FALSE) ) 
		)
	{	
		return 1;
	};
};

FUNC VOID  DIA_Skip_VERPATZT_Info()
{
	AI_Output (other, self,"DIA_Skip_VERPATZT_15_00"); //Я думаю, мне стоит вернуться и посоветоваться по поводу снаряжения...
	AI_Output (self, other,"DIA_Skip_VERPATZT_12_01"); //Проваливай!
};

/*------------------------------------------------------------------------
							Waffenhandel								
------------------------------------------------------------------------*/

instance  GRD_211_Skip_TRADE (C_INFO)
{
	npc				= GRD_211_Skip;
	condition		= GRD_211_Skip_TRADE_Condition;
	information		= GRD_211_Skip_TRADE_Info;
	permanent		= 1;
	description		= "Мне нужно всего несколько вещей."; 
	trade 			= 1;
};

FUNC int  GRD_211_Skip_TRADE_Condition()
{
	if ( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) 
			||	(Skip_TradeFree == TRUE) )
	{
		return TRUE;
	};
};


FUNC void  GRD_211_Skip_TRADE_Info()
{
	AI_Output (other, self,"GRD_211_Skip_TRADE_Info_15_01"); //Мне нужно всего несколько вещей.
	AI_Output (self, other,"GRD_211_Skip_TRADE_Info_12_02"); //Я могу продать тебе кое что.
};  

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_211_Skip_WELCOME (C_INFO)
{
	npc				= GRD_211_Skip;
	condition		= GRD_211_Skip_WELCOME_Condition;
	information		= GRD_211_Skip_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_211_Skip_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_211_Skip_WELCOME_Info()
{
	AI_Output (self, other,"GRD_211_Skip_WELCOME_Info_12_01"); //Эй, а ты неплохо успел обустроиться для новичка!
};
