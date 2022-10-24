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
	description	= "Меня прислал Идол Оран за урожаем болотника.";
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
	AI_Output (other, self,"DIA_Balor_FetchWeed_15_00"); //Меня прислал Идол Оран за урожаем болотника.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_01"); //Хорошо. Мне не придется относить его самому. Вот, возьми его.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_02"); //Не забудь заглянуть к Вайрану, на другую сторону болота, если ты у него еще не был.
	AI_Output (self, other,"DIA_Balor_FetchWeed_01_03"); //Иначе наш дневной урожай кое-кому покажется слишком маленьким. Могут подумать, что ты половину присвоил.
	
	B_GiveInvItems 		(self, other, ItMi_Plants_Swampherb_01, 50);

	B_LogEntry			(CH1_DeliverWeed,	"Балор передал мне дневной урожай болотника для Кор Галома.");
	B_GiveXP			(XP_WeedFromBalor);

	if	!Npc_KnowsInfo(hero, DIA_Viran_What)
	&&	!Npc_KnowsInfo(hero, DIA_Viran_FetchWeed)
	{
		 B_LogEntry		(CH1_DeliverWeed,	"По словам Балора на другой стороне болота есть еще одна группа сборщиков болотника. Я не расспросил как следует Идола Орана. Теперь мне придется разыскивать эту группу и постараться не попасться на глаза болотожорам."); 
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
	description	= "Да как я могу? И потом... куда мне его девать? Продать кому-то?";
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
	AI_Output (other, self,"DIA_Balor_SellUnder_15_00"); //Да как я могу? И потом: куда мне его девать? Продать кому-то?
	AI_Output (self, other,"DIA_Balor_SellUnder_01_01"); //А, я подсказал тебе хорошую идею, да?
	
	Info_ClearChoices 	(DIA_Balor_SellUnder);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Забудь, это была просто шутка."									,DIA_Balor_SellUnder_ForgetIt);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Если бы ты знал того, кто мог его купить, мы поделили бы прибыль."	,DIA_Balor_SellUnder_HalfHalf);
	Info_AddChoice 		(DIA_Balor_SellUnder,"Нет, просто скажи, кто он."											,DIA_Balor_SellUnder_ComeOn);
};

func void DIA_Balor_SellUnder_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ForgetIt_15_00"); //Забудь, это была просто шутка.
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_HalfHalf()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_HalfHalf_15_00"); //Если бы ты знал того, кто мог бы его купить, мы могли бы поделить прибыль пополам.
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_01"); //Ну, есть в Новом лагере человек, которого мог бы заинтересовать груз болотника...
	AI_Output (self, other,"DIA_Balor_SellUnder_HalfHalf_01_02"); //Но если Гуру узнают об этом, они скормят тебя болотожорам! Так что я ничего не знаю, ясно?!
	Balor_PlayerCheating = TRUE;
	Info_ClearChoices 	(DIA_Balor_SellUnder);
};

func void DIA_Balor_SellUnder_ComeOn()
{
	AI_Output (other, self,"DIA_Balor_SellUnder_ComeOn_15_00"); //Нет, просто скажи, кто он.
	AI_Output (self, other,"DIA_Balor_SellUnder_ComeOn_01_01"); //Ишь, чего захотел! Ну, вот что я тебе скажу: если Кор Галом не получит траву, достанется нам обоим! С ним лучше не шутить.
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
	description	= "Я учту. Так кому в Новом лагере можно продать болотник?";
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
	AI_Output (other, self,"DIA_Balor_TellDealer_15_00"); //Я учту. Так кому в Новом лагере можно продать болотник?
	AI_Output (self, other,"DIA_Balor_TellDealer_01_01"); //Конечно, я назову тебе этого человека, а ты сбежишь с нашей травой. Даже не надейся!
	AI_Output (self, other,"DIA_Balor_TellDealer_01_02"); //Мне нужен задаток пятьдесят кусков руды. Тогда и поговорим.
	
	Info_ClearChoices 	(DIA_Balor_TellDealer);
	Info_Addchoice 		(DIA_Balor_TellDealer,"Забудь об этом."	,DIA_Balor_TellDealer_ForgetIt);
	Info_Addchoice 		(DIA_Balor_TellDealer,"Пятьдесят кусков? Хорошо, держи."	,DIA_Balor_TellDealer_Pay);
};

func void DIA_Balor_TellDealer_Pay()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_Pay_15_00"); //Пятьдесят кусков? Хорошо, держи.
	if (Npc_HasItems(other, itminugget) >= 50)
	{
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_01"); //Что ж... Слушай. Его зовут Сайфер. Он почти все время сидит в баре на озере.
		AI_Output			(self, other,"DIA_Balor_TellDealer_Pay_01_02"); //Но будь с ним осторожен. Смотри, чтобы он тебя не обманул.
		Info_ClearChoices 	(DIA_Balor_TellDealer);

		B_GiveInvItems		(other, self,itminugget,50);
		Balor_TellsNCDealer = TRUE;

		B_LogEntry			(CH1_DeliverWeed,	"Балор назвал мне человека из Нового лагеря. Его зовут Сайфер. Я смогу найти его в баре на озере. Гуру будут очень недовольны, если я продам болотник на сторону.");
		B_GiveXP			(XP_BalorNamedCipher);

		Log_CreateTopic		(GE_TraderNC, LOG_NOTE);
		B_LogEntry			(GE_TraderNC,	"Сайфер продает и покупает разные товары. Он интересуется крупными партиями болотника. Его можно найти в баре на озере.");
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_TellDealer_Pay_NoOre_01_00"); //Я не вижу руду. Пятьдесят кусков и ни куском меньше, понял?
		Info_ClearChoices 	(DIA_Balor_TellDealer);
	};
};

func void DIA_Balor_TellDealer_ForgetIt()
{
	AI_Output (other, self,"DIA_Balor_TellDealer_ForgetIt_15_00"); //Забудь об этом.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_01"); //Не думай, что можно вот так просто заявиться в Новый лагерь и продать весь болотник первому встречному! Если не знаешь нужного человека, у тебя ничего не выйдет.
	AI_Output (self, other,"DIA_Balor_TellDealer_ForgetIt_01_02"); //Ты можешь рассказать все не тому человеку, и у тебя все отберут.
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
	description	= "Это снова я. Мне нужно забрать следующую партию.";
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
	AI_Output (other, self,"DIA_Balor_RipOff_15_00"); //Это снова я. Мне нужно забрать следующую партию.
	if (Balor_PlayerCheating == TRUE)
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_01"); //Еще бы! Чтобы снова отнести его в Новый лагерь.
		AI_Output (self, other,"DIA_Balor_RipOff_01_02"); //Дай мне задаток пятьдесят кусков руды.
	}
	else
	{
		AI_Output (self, other,"DIA_Balor_RipOff_01_03"); //А, это снова ты? Ладно, бери, но только не вздумай нас обмануть!
		AI_Output (other, self,"DIA_Balor_RipOff_15_04"); //Да что ты, я и не собирался.
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
	description	= "Что ж, работай хорошо.";
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
	AI_Output (other, self,"DIA_Balor_Perm_15_00"); //Что ж, работай хорошо.
	AI_Output (self, other,"DIA_Balor_Perm_01_01"); //Конечно, а что еще, по-твоему, здесь делаю? Валяюсь в болоте?
};
