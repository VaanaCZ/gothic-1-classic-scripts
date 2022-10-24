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
	description = "Какой-то у тебя слишком грустный вид.";
};                       

FUNC INT DIA_BaalIsidro_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalIsidro_Hello_Info()
{	
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_00"); //Какой-то у тебя слишком грустный вид.
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_01"); //Какой проницательный! 
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_02"); //Мне срочно нужно избавиться от целой горы болотника.
	AI_Output (other, self,"DIA_BaalIsidro_Hello_15_03"); //Ты продаешь товары из Лагеря сектантов?
	AI_Output (self, other,"DIA_BaalIsidro_Hello_03_04"); //Да. 
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
	description = "Покажи, что ты там продаешь.";
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
	AI_Output (other, self,"DIA_BaalIsidro_TRADE_15_00"); //Покажи, что ты там продаешь.
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
	description = "Я могу помочь продавать болотник. Но тебе придется поделиться.";
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
	AI_Output			(other, self,"DIA_BaalIsidro_GimmeKraut_15_00"); //Я могу помочь тебе продавать болотник. Но тебе придется поделиться.
	AI_Output			(self, other,"DIA_BaalIsidro_GimmeKraut_03_01"); //Даже не думай меня обмануть, я еще не слишком пьян, чтобы отдать весь мой болотник первому встречному.

	Log_CreateTopic		(CH1_DealerJob, LOG_MISSION);
    Log_SetTopicStatus	(CH1_DealerJob, LOG_RUNNING);
    B_LogEntry			(CH1_DealerJob, "Послушник Идол Исидро целыми днями пьянствует в баре на озере. Ему нужно продать свой болотник, но он ничего не может с собой поделать. Может быть, я смогу уговорить его поручить это дело мне..."); 
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
	description = "Идол Каган хочет найти себе другого помощника...";
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
	AI_Output			(other, self,"DIA_BaalIsidro_Problem_15_00"); //Послушай меня: Идол Каган хочет найти себе другого помощника. Кажется, скоро тебе придется несладко.
	AI_Output			(self, other,"DIA_BaalIsidro_Problem_03_01"); //Что? О великий Спящий! Как же мне избавиться от этой травы...
	
	if (BaalIsidro_GotDrink == FALSE)
	{
	    B_LogEntry		(CH1_DealerJob, "Идол Исидро был сильно напуган, когда я рассказал ему о планах Идола Кагана найти ему замену. Но этого было недостаточно, чтобы уговорить его.");
	}
	else
	{
	    B_LogEntry		(CH1_DealerJob, "Идол Исидро был сильно напуган, когда я рассказал ему о планах Идола Кагана найти ему замену. Но этого было недостаточно, чтобы уговорить его.");
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
	description = "Я тоже так думаю. Вот, выпей.";
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
	AI_Output (other, self,"DIA_BaalIsidro_Drink_15_00"); //Я тоже так думаю. Вот, выпей.
	
	if ( (Npc_HasItems(other,ItFoBooze)>0) || (Npc_HasItems(other,ItFoBeer)>0) || (Npc_HasItems(other,ItFoWine)>0) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_Drink_03_01"); //Спасибо тебе! Я выпью за твое здоровье!

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
		    B_LogEntry	(CH1_DealerJob, "Мое угощение подействовало как нужно. Думаю, теперь Идол Исидро примет мое предложение.");
		}
		else
		{
		    B_LogEntry	(CH1_DealerJob, "Идол Исидро с радостью выпил за мое здоровье. Но, кажется, он все еще не согласен отдать мне свой болотник.");
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
	description = "Подумай, я продам твой болотник, а прибыль мы поделим пополам!";
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
	AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_00"); //Подумай, я продам твой болотник, а прибыль мы поделим пополам!
	
	if ( (BaalIsidro_GotDrink == TRUE) && Npc_KnowsInfo(hero,DIA_BaalIsidro_Problem) )
	{
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_01"); //О Спящий! Как же я замучился с этим болотником. Ты же не хочешь обвести меня вокруг пальца, да?
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_02"); //Честное слово.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_03"); //Хорошо, вот тебе весь болотник... Ты должен получить за него не меньше 400 кусков руды. Мы поделим их пополам. Как справишься со всем, приходи ко мне. Я все время буду здесь.
		AI_Output (other, self,"DIA_BaalIsidro_ThinkAgain_15_04"); //Не знаешь, кто здесь может купить большую партию болотника?
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_05"); //Если бы я знал, я бы и сам сходил к нему.
		AI_Output (self, other,"DIA_BaalIsidro_ThinkAgain_03_06"); //Да, без этой проклятой травы я чувствую себя гораздо лучше.
		
		BaalIsidro_DealerJob = LOG_RUNNING;
	    B_LogEntry			(CH1_DealerJob, "Идол Исидро передал мне свой болотник. Я должен его продать и половину выручки принести ему.");	
	
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
		AI_Output (self, other,"DIA_BaalIsidro_REFUSE_ThinkAgain_03_00"); //Нет, ни за что. Я и сам смогу с этим справиться...
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
	description = "Я продал весь болотник.";
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
	AI_Output				(other, self,"DIA_BaalIsidro_RUNNING_15_00"); //Я продал весь болотник.
	AI_Output				(self, other,"DIA_BaalIsidro_RUNNING_03_01"); //А где мои 200 кусков?
	
	if (Npc_HasItems(other,itminugget)>=200)
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_15_02"); //Вот они.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_03"); //Хорошо... А этот Идол Каган пусть делает что хочет! 
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_03_04"); //Приятно иметь с тобой дело, брат.

		B_GiveInvItems		(hero, self, ItMiNugget, 200);
		BaalIsidro_DealerJob = LOG_SUCCESS;
		
		Log_SetTopicStatus	(CH1_DealerJob, LOG_SUCCESS);
	    B_LogEntry			(CH1_DealerJob, "Идол Исидро был очень рад, что я избавил его от горы болотника и принес 200 кусков руды.");	
	    B_GiveXP			(XP_BaalIsidroPayShare);
	}
	else
	{
		AI_Output			(other, self,"DIA_BaalIsidro_RUNNING_NoOre_15_05"); //Я забыл взять твою долю.
		AI_Output			(self, other,"DIA_BaalIsidro_RUNNING_NoOre_03_06"); //Так принеси их!
		AI_StopProcessInfos	(self);
	};
};

