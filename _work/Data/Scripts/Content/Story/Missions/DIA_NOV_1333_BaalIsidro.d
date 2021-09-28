// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalIsidro_EXIT(C_INFO)
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 999;
	condition	= DIA_BaalIsidro_EXIT_Condition;
	information	= DIA_BaalIsidro_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalIsidro_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalIsidro_Hello(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Hello_Condition;
	information	= DIA_BaalIsidro_Hello_Info;
	permanent	= 0;
	description = "Ты выглядишь не слишком радостным.";
};                       

FUNC INT DIA_BaalIsidro_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_Hello_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_00"); //Ты выглядишь не слишком радостным.
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_01"); //Так и есть!
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_02"); //Мне нужно сбыть с рук целую гору болотника.
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_03"); //Тебя прислали сюда из Лагеря Сектантов?
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_04"); //Да. Но не мое это дело...
};

// ************************************************************
// 					 	TRADE
// ************************************************************

INSTANCE DIA_BaalIsidro_TRADE(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 800;
	condition	= DIA_BaalIsidro_TRADE_Condition;
	information	= DIA_BaalIsidro_TRADE_Info;
	permanent	= 1;
	description = "Покажи мне, что у тебя есть.";
	trade 		= 1;
};                       

FUNC INT DIA_BaalIsidro_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_TRADE_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_TRADE_15_00"); //Покажи мне, что у тебя есть.
	AI_Output (self, other,"DIA_BaalIsidro_TRADE_03_01"); //Вот...
};

// ************************************************************
// 					 Ich verkaufe fьr dich
// ************************************************************

INSTANCE DIA_BaalIsidro_GimmeKraut(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_GimmeKraut_Condition;
	information	= DIA_BaalIsidro_GimmeKraut_Info;
	permanent	= 0;
	description = "Я могу помочь тебе продавать болотник - но не задаром, конечно.";
};                       

FUNC INT DIA_BaalIsidro_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalIsidro_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalIsidro_GimmeKraut_15_00"); //Я могу помочь тебе продавать болотник - но не задаром, конечно.
	AI_Output			(self, other,"DIA_BaalIsidro_GimmeKraut_03_01"); //Забудь об этом - я еще не настолько пьян. Ты просто сбежишь с ним - вот и все.

	Log_CreateTopic		(CH1_DealerJob, LOG_MISSION);
    Log_SetTopicStatus	(CH1_DealerJob, LOG_RUNNING);
    B_LogEntry			(CH1_DealerJob,"Идол Исидро постоянно ошивается в баре у озера и напивается. Он должен распродать свою часть болотника, но это ему явно не удается. Возможно, удастся уговорить его поручить это мне... Вот только как?"); 
};

// ************************************************************
// 					Baal Kagan hat gepetzt
// ************************************************************

INSTANCE DIA_BaalIsidro_Problem(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Problem_Condition;
	information	= DIA_BaalIsidro_Problem_Info;
	permanent	= 0;
	description = "Идол Каган собирается подыскать тебе замену.";
};                       

FUNC INT DIA_BaalIsidro_Problem_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_Problem_Info()
{	
	AI_Output			(other, self,"DIA_BaalIsidro_Problem_15_00"); //Вот что я тебе скажу, дружище: у тебя большие неприятности. Идол Каган собирается подыскать тебе замену.
	AI_Output			(self, other,"DIA_BaalIsidro_Problem_03_01"); //Что? Милосердный Спящий, сжалься надо мной! Мне нужно избавиться от этой травы...
	
	if (BaalIsidro_GotDrink == FALSE)
	{
	    B_LogEntry		(CH1_DealerJob,"Идол Исидро сильно расстроился, когда я изложил план по его замене. Но этого все равно оказалось недостаточно для того, чтобы позволить мне сделать его работу.");
	}
	else
	{
	    B_LogEntry		(CH1_DealerJob,"План Идола Кагана по замене алкоголика Идола Исидро просто доконал его. Думаю, теперь он примет мое предложение.");
	};	
};

// ************************************************************
// 					 Trink noch einen
// ************************************************************
	var int BaalIsidro_GotDrink;
// ************************************************************

INSTANCE DIA_BaalIsidro_Drink(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_Drink_Condition;
	information	= DIA_BaalIsidro_Drink_Info;
	permanent	= 1;
	description = "О чем я и говорю. Выпей еще - за мой счет.";
};                       

FUNC INT DIA_BaalIsidro_Drink_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut) && (BaalIsidro_GotDrink == FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_Drink_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Drink_15_00"); //О чем я и говорю. Выпей еще - за мой счет.
	
	if ( (Npc_HasItems(other,ItFoBooze)>0) || (Npc_HasItems(other,ItFoBeer)>0) || (Npc_HasItems(other,ItFoWine)>0) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_Drink_03_01"); //Спасибо, дружище! Пью за твое здоровье!

		if 		(Npc_HasItems(other,ItFoBooze))
		{
			B_GiveInvItems	(other,self,ItFoBooze,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoBooze);		
		}
		else if (Npc_HasItems(other,ItFoBeer))
		{
			B_GiveInvItems	(other,self,ItFoBeer,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoBeer);		
		}
		else if (Npc_HasItems(other,ItFoWine))
		{
			B_GiveInvItems	(other,self,ItFoWine,1);
			if ( C_BodystateContains(self, BS_SIT) )
			{
				AI_StandUp		(self);
				AI_TurnToNpc	(self, hero);
			};
			AI_UseItem		(self,ItFoWine);		
		};
		
		BaalIsidro_GotDrink = TRUE;

		if	Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem)
		{
		    B_LogEntry	(CH1_DealerJob,"Мое щедрое предложение сняло последние опасения Идола Исидро. Уверен, теперь он его примет.");
		}
		else
		{
		    B_LogEntry	(CH1_DealerJob,"Идол Исидро с готовностью принял выпивку, но отдавать мне болотник для продажи отказался.");
		};
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_NO_Drink_03_00"); //Что? Где?
	};
};

// ************************************************************
// 					 Ьbrleg's dir!
// ************************************************************
	var int BaalIsidro_DealerJob;
// ************************************************************

INSTANCE DIA_BaalIsidro_ThinkAgain(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_ThinkAgain_Condition;
	information	= DIA_BaalIsidro_ThinkAgain_Info;
	permanent	= 1;
	description = "Подумай об этом: ты отдашь мне болотник, и мы поделим прибыль. ";
};                       

FUNC INT DIA_BaalIsidro_ThinkAgain_Condition()
{
	if	( Npc_KnowsInfo(hero, DIA_BaalIsidro_GimmeKraut) && ((BaalIsidro_DealerJob!=LOG_RUNNING)&&(BaalIsidro_DealerJob!=LOG_SUCCESS)) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_ThinkAgain_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_00"); //Подумай об этом: ты отдашь мне болотник, и мы поделим прибыль. 
	
	if ( (BaalIsidro_GotDrink == TRUE) && Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_01"); //Ох, парень, как же мне нужно сбыть с рук эту траву. Ты же не хочешь выставить меня идиотом, правда?
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_02"); //Даю тебе слово.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_03"); //Хорошо, забирай болотник... Ты должен выручить за него по меньшей мере 400 кусков руды. Получается по 200 на брата. Я буду ждать тебя здесь. Возвращайся, как только получишь руду.
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_04"); //Ты не знаешь, кто здесь покупает больше всего болотника?
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_05"); //Если бы я знал, то отправился бы к нему сам.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_06"); //Теперь, сбыв эту траву с рук, я чувствую себя намного лучше.
		
		BaalIsidro_DealerJob = LOG_RUNNING;
	    B_LogEntry			(CH1_DealerJob,"Идол Исидро отдал мне болотник. Если я продам его, то получу половину выручки, что составит 200 кусков руды.");	
	
		//Itemьbergabe
		CreateInvItems		(self,			itmijoint_1, 40);
		B_GiveInvItems  	(self, other,	itmijoint_1, 50);//Notwendig zur Textausgabe "50 Items ьbergeben", wird sofort ausgeglichen
		Npc_RemoveInvItems	(self,			itmijoint_2, 20);
		Npc_RemoveInvItems	(self,			itmijoint_3, 20);
		Npc_RemoveInvItems	(other,			itmijoint_1, 40);
		CreateInvItems		(other,			itmijoint_2, 20);
		CreateInvItems		(other,			itmijoint_3, 20);
					
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output (self, other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00"); //Нет, парень. Я справлюсь...
	};
};

// ************************************************************
// 					RUNNING / SUCCESS
// ************************************************************

INSTANCE DIA_BaalIsidro_RUNNING(C_INFO) 
{
	npc			= Nov_1333_BaalIsidro;
	nr			= 1;
	condition	= DIA_BaalIsidro_RUNNING_Condition;
	information	= DIA_BaalIsidro_RUNNING_Info;
	permanent	= 0;
	description = "Я продал твой болотник. Вот 200 кусков руды.";
};                       

FUNC INT DIA_BaalIsidro_RUNNING_Condition()
{
	if (BaalIsidro_DealerJob == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalIsidro_RUNNING_Info()
{	
	AI_Output				(other, self,"DIA_BaalIsidro_RUNNING_15_00"); //Я продал твой болотник.
	AI_Output				(self, other,"DIA_BaalIsidro_RUNNING_03_01"); //И где мои 200 кусков?
	
	if (Npc_HasItems(other,itminugget)>=200)
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_15_02"); //Вот они.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_03"); //Хорошо... И к черту Идола Кагана! (хихикает)
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_04"); //Рад был иметь с тобой дело.

		B_GiveInvItems		(hero, self, ItMiNugget, 200);
		BaalIsidro_DealerJob = LOG_SUCCESS;
		
		Log_SetTopicStatus	(CH1_DealerJob, LOG_SUCCESS);
	    B_LogEntry			(CH1_DealerJob,"Идол Исидро был рад получить свои 200 кусков руды.");	
	    B_GiveXP			(XP_BaalIsidroPayShare);
	}
	else
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_NoOre_15_05"); //Забыл взять с собой.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_NoOre_03_06"); //Так принеси их!
		AI_StopProcessInfos	(self);
	};
};

