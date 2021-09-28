// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Balor_Exit (C_INFO)
{
	npc			=  Nov_1304_Balor;
	nr			=  999;
	condition	=  DIA_Viran_Exit_Condition;
	information	=  DIA_Viran_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Balor_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Balor_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Kraut abholen
// **************************************************
	var int Balor_BotenDay;
// **************************************************

instance  DIA_Balor_FetchWeed (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_FetchWeed_Condition;
	information	= DIA_Balor_FetchWeed_Info;
	permanent	= 0;
	description	= "Меня прислал Идол Оран. Я должен забрать весь болотник.";
};                       

FUNC int  DIA_Balor_FetchWeed_Condition()
{
	if (BaalOrun_FetchWeed == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_FetchWeed_Info()
{
	AI_Output (other, self,"DIA_Balor_FetchWeed_15_00"); //Меня прислал Идол Оран. Я должен забрать весь болотник.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_01"); //Хорошо, так мне не придется идти самому. Вот, возьми.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_02"); //Не забудь заглянуть на другую сторону болота, к Вайрану, если ты у него еще не был.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_03"); //В противном случае кое-кому дневной сбор может показаться слишком маленьким, и кое-кто может даже подумать, что ты продал половину, хе-хе.
	
	B_GiveInvItems 		(self, other, ItMi_Plants_Swampherb_01, 50);

	B_LogEntry			(CH1_DeliverWeed,"Бэлор отдал мне сегодняшний сбор болотника для Кор Галома.");
	B_GiveXP			(XP_WeedFromBalor);

	if	!Npc_KnowsInfo(hero, DIA_Viran_What)
	&&	!Npc_KnowsInfo(hero, DIA_Viran_FetchWeed)
	{
		 B_LogEntry		(CH1_DeliverWeed,"По словам Бэлора, вторая группа сборщиков работает на другой стороне болота. Поскольку мне не позволено задавать Идолу Орану вопросы, придется самому обыскивать болото."); 
	};
	
	Balor_BotenDay = Wld_GetDay(); 
};

// **************************************************
//				Wem verhцkern?
// **************************************************
	var int Balor_PlayerCheating;
// **************************************************

instance  DIA_Balor_SellUnder (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_SellUnder_Condition;
	information	= DIA_Balor_SellUnder_Info;
	permanent	= 0;
	description	= "Да кому я могу продать этот болотник?";
};                       

FUNC int  DIA_Balor_SellUnder_Condition()
{
	if	Npc_KnowsInfo(hero,DIA_Balor_FetchWeed)
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_SellUnder_Info()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_15_00"); //Да кому я могу продать этот болотник?
	AI_Output (self, other,"DIA_Balor_SellUnder_01_01"); //О-о! Идея задела за живое, да?
	
	Info_ClearChoices 	(DIA_Balor_SellUnder);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Забудь об этом, я просто так спросил.",DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Знаешь нужного человека? Мы могли бы поделить деньги поровну.",DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Просто скажи мне, кто этот человек.",DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ForgetIt_15_00"); //Забудь об этом, я просто так спросил.
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_HalfHalf_15_00"); //Если ты знаешь нужного человека, мы могли бы поделить деньги поровну.
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_01"); //Ну, я знаю в Новом Лагере кое-кого, кому нужен болотник...
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_02"); //Но если Гуру поймают тебя на этом, то скормят болотожорам! Нет, я тебе ничего не говорил!
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ComeOn_15_00"); //Просто скажи мне, кто этот человек.
	AI_Output (self, other,"DIA_Balor_SellUnder_ComeOn_01_01"); //Вот вбил себе в голову! Говорю же тебе: если дневной сбор не будет доставлен Кор Галому, нас обоих ждут большие неприятности!
};

// **************************************************
//				Name des Dealers
// **************************************************
	var int Balor_TellsNCDealer;
// **************************************************

instance  DIA_Balor_TellDealer (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_TellDealer_Condition;
	information	= DIA_Balor_TellDealer_Info;
	permanent	= 1;
	description	= "Да ладно тебе. Кому в Новом Лагере нужен болотник?";
};                       

FUNC int  DIA_Balor_TellDealer_Condition()
{
	if ( (Balor_PlayerCheating==TRUE) && (Balor_TellsNCDealer==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_TellDealer_Info()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_15_00"); //Да ладно тебе. Кому в Новом Лагере нужен болотник?
	AI_Output (self, other,"DIA_Balor_TellDealer_01_01"); //Ты думаешь, я просто так назову тебе имя, и ты убежишь с травой? Даже и не надейся, приятель!
	AI_Output (self, other,"DIA_Balor_TellDealer_01_02"); //Гони 50 кусков руды в качестве задатка - тогда и поговорим.
	
	Info_ClearChoices 	(DIA_Balor_TellDealer);
	Info_Addchoice 		(DIA_Balor_TellDealer,"Забудь об этом.",DIA_Balor_TellDealer_ForgetIt);
	Info_Addchoice 		(DIA_Balor_TellDealer,"Это справедливо. Вот, держи.",DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_Pay_15_00"); //Это справедливо. Вот, держи.
	if (Npc_HasItems(other, itminugget) >= 50)
	{
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_01"); //Хорошо... Слушай. Его зовут Сайфер. Ты найдешь его в баре на озере.
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_02"); //Но будь осторожен. Смотри, чтобы тебя кто-нибудь не надул!
		Info_ClearChoices 	(DIA_Balor_TellDealer);

		B_GiveInvItems		(other, self,itminugget,50);
		Balor_TellsNCDealer = TRUE;

		B_LogEntry			(CH1_DeliverWeed,"Бэлор упомянул человека по имени Сайфер, который хотел бы купить сбор болотника. Его можно найти в баре у озера, рядом с Новым Лагерем. Но в этом случае меня ожидают серьезные неприятности с Гуру.");
		B_GiveXP			(XP_BalorNamedCipher);

		Log_CreateTopic		(GE_TraderNC, LOG_NOTE);
		B_LogEntry			(GE_TraderNC,"Сайфер продает и покупает самые разные вещи в баре у озера. Особенно он заинтересован в крупных партиях болотника.");
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_TellDealer_Pay_NoOre_01_00"); //Не вижу денег. 50 кусков руды и ни штукой меньше, или я буду нем, как рыба.
		Info_ClearChoices 	(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_ForgetIt_15_00"); //Забудь об этом.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_01"); //Неужели ты думаешь, что можно просто прийти в Новый Лагерь и толкнуть груз болотника первому встречному? Ты ни за что не сможешь сбыть его с рук.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_02"); //Разве что кто-нибудь из воров проломит тебе голову и сам заберет товар.
	Info_ClearChoices 	(DIA_Balor_TellDealer);
};

// **************************************************
//					Verarschen
// **************************************************

instance  DIA_Balor_RipOff (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 5;
	condition	= DIA_Balor_RipOff_Condition;
	information	= DIA_Balor_RipOff_Info;
	permanent	= 0;
	description	= "Я вернулся за следующей партией для Кор Галома.";
};                       

FUNC int  DIA_Balor_RipOff_Condition()
{
	if ( (Balor_BotenDay<=(Wld_GetDay()-2)) && Npc_KnowsInfo(hero,DIA_Balor_FetchWeed) ) //Dann hat der SC auch das erste Kraut bekommen
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_RipOff_Info()
{
	AI_Output (other, self,"DIA_Balor_RipOff_15_00"); //Это снова я. Я вернулся за следующей партией.
	if (Balor_PlayerCheating == TRUE)
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_01"); //Конечно! Снова собираешься продать ее Новому Лагерю!
		AI_Output (self, other,"DIA_Balor_RipOff_01_02"); //Я требую 50 кусков руды - мой обычный аванс!
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_03"); //Снова ты? Хорошо, вот, возьми, но не делай никаких глупостей, понял?
		AI_Output (other, self,"DIA_Balor_RipOff_15_04"); //И в мыслях не было.
		CreateInvItems (self, ItMi_Plants_Swampherb_01, 50);
		B_GiveInvItems (self, hero, ItMi_Plants_Swampherb_01, 50);
	};
};

// **************************************************
//					PERMANENT
// **************************************************

instance  DIA_Balor_Perm (C_INFO)
{
	npc			= Nov_1304_Balor;
	nr			= 1;
	condition	= DIA_Balor_Perm_Condition;
	information	= DIA_Balor_Perm_Info;
	permanent	= 1;
	description	= "Продолжай собирать!";
};                       

FUNC int  DIA_Balor_Perm_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Balor_FetchWeed))
	{
		return 1;
	};
};

FUNC VOID  DIA_Balor_Perm_Info()
{
	AI_Output (other, self,"DIA_Balor_Perm_15_00"); //Продолжай собирать!
	AI_Output (self, other,"DIA_Balor_Perm_01_01"); //А чем, по-твоему, я занимаюь? Просиживаю задницу?
};
