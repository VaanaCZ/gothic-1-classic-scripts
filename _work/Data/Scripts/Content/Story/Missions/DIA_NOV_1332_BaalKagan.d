// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_BaalKagan_EXIT(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 999;
	condition	= DIA_BaalKagan_EXIT_Condition;
	information	= DIA_BaalKagan_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalKagan_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_BaalKagan_Hello(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_Hello_Condition;
	information	= DIA_BaalKagan_Hello_Info;
	permanent	= 0;
	description = "Ты из Лагеря Сектантов, верно?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello_15_00"); //Ты из Лагеря Сектантов, верно?
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_01"); //Мы называем его Братством.
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_02"); //Я - Идол Каган. Да пребудет с тобой Спящий!
};

// ************************************************************
// 						Warum hier
// ************************************************************

INSTANCE DIA_BaalKagan_WhyHere(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 1;
	condition	= DIA_BaalKagan_WhyHere_Condition;
	information	= DIA_BaalKagan_WhyHere_Info;
	permanent	= 0;
	description = "Чем ты занимаешься?";
};                       

FUNC INT DIA_BaalKagan_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WhyHere_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WhyHere_15_00"); //Что ты здесь делаешь?
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //Изначально меня послали сюда убеждать людей присоединиться к нашему Братству.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //Но варваров не интересует духовное просвещение. В итоге я просто продаю болотник.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //И он пользуется здесь большим спросом. Слишком большим. Мне с трудом удается обеспечивать их потребности.

	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,"Идол Каган продает болотник ворам и наемникам в Новом Лагере.");
};

// ************************************************************
// 						TRADE
// ************************************************************

INSTANCE DIA_BaalKagan_TRADE (C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 800;
	condition	= DIA_BaalKagan_TRADE_Condition;
	information	= DIA_BaalKagan_TRADE_Info;
	permanent	= 1;
	description = "Покажи мне, что у тебя есть.";
	trade		= 1;
};                       

FUNC INT DIA_BaalKagan_TRADE_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_TRADE_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //Покажи мне, что у тебя есть.
	AI_Output			(self, other,"DIA_BaalKagan_TRADE_13_01"); //Как пожелаешь.
};

// ************************************************************
// 						Hilfe anfordern
// ************************************************************

INSTANCE DIA_BaalKagan_OrderHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 2;
	condition	= DIA_BaalKagan_OrderHelp_Condition;
	information	= DIA_BaalKagan_OrderHelp_Info;
	permanent	= 0;
	description = "Почему они не пошлют сюда еще одного человека?";
};                       

FUNC INT DIA_BaalKagan_OrderHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WhyHere))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_OrderHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp_15_00"); //Почему они не пошлют сюда еще одного человека?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_01"); //Идол Исидро должен помогать мне, но он проводит все дни в баре на озере, где выменивает болотник на рисовый шнапс.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_02"); //Он слишком подвержен пьянству, и боюсь, что помощи от него ждать не стоит.
	
	if (Lares_Get400Ore == LOG_RUNNING)
	{
		Log_CreateTopic		(CH1_DealerJob,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_DealerJob,	LOG_RUNNING);
	    B_LogEntry			(CH1_DealerJob,"Идол Исидро целыми днями сидит в баре у озера и пьет.");	
	};
};

// ************************************************************
// 					Ich kцnnte dir helfen
// ************************************************************

INSTANCE DIA_BaalKagan_WannaHelp(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WannaHelp_Condition;
	information	= DIA_BaalKagan_WannaHelp_Info;
	permanent	= 0;
	description = "Я могу помочь тебе продавать болотник.";
};                       

FUNC INT DIA_BaalKagan_WannaHelp_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_OrderHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WannaHelp_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_00"); //Я могу помочь тебе продавать болотник.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_01"); //Столь большой груз этой травы я могу доверить лишь члену Братства.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_02"); //Но ты можешь помочь мне с дарами. 
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_03"); //Не все еще знают об этой траве. Попробовав ее раз, они хотят все больше и больше, а значит, у меня хорошо идет торговля.
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_04"); //Пожалуй, теперь тебе не справиться с этой задачей..
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_05"); //Об Идоле Исидро вскоре позаботятся наши братья. Я уже отправил письмо Кор Галому.
};

// ************************************************************
// 						Was ist drin?
// ************************************************************

INSTANCE DIA_BaalKagan_WasDrin(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_WasDrin_Condition;
	information	= DIA_BaalKagan_WasDrin_Info;
	permanent	= 0;
	description = "Скажи, что я получу, если помогу тебе с болотником?";
};                       

FUNC INT DIA_BaalKagan_WasDrin_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WannaHelp))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_WasDrin_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_WasDrin_15_00"); //Скажи, что я получу, если помогу тебе с болотником?
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_01"); //Я щедро награжу тебя, как ты сам того пожелаешь.
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_02"); //У меня есть свитки, в которых заключена могущественная магия Спящего.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_03"); //Или, если захочешь, я могу помочь тебе стать одним из членов нашего Братства. У меня хорошие связи с Кор Галомом и Идолом Тионом.
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_04"); //Оба они - приближенные нашего наставника, Ю`Бериона.
	};
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_05"); //Если ты предпочитаешь деньги, я могу заплатить тебе рудой. 100 самородков - хорошая плата за твою работу.
};

// ************************************************************
// 						Gib mir Kraut
// ************************************************************
	var int BaalKAgan_VerteilKraut;
// ************************************************************

INSTANCE DIA_BaalKagan_GimmeKraut(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_GimmeKraut_Condition;
	information	= DIA_BaalKagan_GimmeKraut_Info;
	permanent	= 0;
	description = "Ладно, давай мне болотник. Кому я должен его раздавать?";
};                       

FUNC INT DIA_BaalKagan_GimmeKraut_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalKagan_WasDrin))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_GimmeKraut_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_00"); //Ладно, давай мне болотник. Кому я должен его раздавать?
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_01"); //Уверен, ты без труда найдешь желающих. Просто говори с людьми. Но помни - по ОДНОМУ стеблю каждому, не больше.
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_02"); //И вот еще что: если кто-нибудь отберет у тебя болотник, или ты выкуришь его сам, наша сделка не состоится.
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_03"); //Разумеется.
	BaalKagan_VerteilKraut = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_SpreadJoints, LOG_MISSION);
	Log_SetTopicStatus	(CH1_SpreadJoints, LOG_RUNNING);
	B_LogEntry			(CH1_SpreadJoints,"Идол Каган дал мне 10 штук Зеленого новичка, которые мне надо распространить в Новом Лагере.");		
	
	CreateInvItems		(self, itmijoint_1, 10);
	B_GiveInvItems      (self, hero, itmijoint_1, 10);
};

// ************************************************************
// 						SUCCESS
// ************************************************************

INSTANCE DIA_BaalKagan_SUCCESS(C_INFO)
{
	npc			= Nov_1332_BaalKagan;
	nr			= 3;
	condition	= DIA_BaalKagan_SUCCESS_Condition;
	information	= DIA_BaalKagan_SUCCESS_Info;
	permanent	= 1;
	description = "Я раздал болотник, как ты и просил.";
};                       

FUNC INT DIA_BaalKagan_SUCCESS_Condition()
{
	if (BaalKagan_VerteilKraut==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalKagan_SUCCESS_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_15_00"); //Я раздал болотник, как ты и просил.
	if (NC_Joints_verteilt >= 8)
	{
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_01"); //А у меня уже побывали новые покупатели. Ты проделал хорошую работу.
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_02"); //Что ты хочешь получить в награду?
		
		Info_ClearChoices(DIA_BaalKagan_SUCCESS);
		Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Я возьму руду.",DIA_BaalKagan_SUCCESS_Erz);
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Info_AddChoice(DIA_BaalKagan_SUCCESS,"Помоги мне стать членом Братства.",DIA_BaalKagan_SUCCESS_Join);
		};
		Info_AddChoice	 (DIA_BaalKagan_SUCCESS,"Какие интересные магические свитки. Что это за заклинания?",DIA_BaalKagan_SUCCESS_WhatSpells);
		
		BaalKagan_VerteilKraut = LOG_SUCCESS;
		Log_SetTopicStatus	(CH1_SpreadJoints, LOG_SUCCESS);
    	B_LogEntry			(CH1_SpreadJoints,"Идол Каган получил новых покупателей, а я - свое вознаграждение.");
		B_GiveXP			(XP_DistributedWeedForKagan);
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //Я пока что не вижу новых покупателей. Раздавай еще.
	};
};

func void DIA_BaalKagan_SUCCESS_WhatSpells()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //Какие интересные магические свитки. Что это за заклинания?
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //Кулак Ветра, Чары, Телекинез, Пирокинез и Сон. Ты можешь выбрать любые три.
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Я возьму магические свитки.",DIA_BaalKagan_SUCCESS_TakeScrolls);
};

func void DIA_BaalKagan_SUCCESS_Join()
{
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Помоги мне стать членом Братства.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Твою просьбу легко выполнить. Я помогу тебе. Идол Тион - один из низших Гуру Братства, как и я.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Ю`Берион сделал его своим советником, но характер Тиона от этого ничуть не улучшился.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //Теперь он считает себя настолько важной персоной, что говорит лишь со своими учениками.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //Если ты отдашь ему это, он сделает для тебя исключение.
	CreateInvItem       (self, SpecialJoint);
	B_GiveInvItems		(self, other, SpecialJoint, 1);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Идол Каган дал мне Зов сна, чтобы я доставил его Идолу Тиону. Это поможет мне присоединиться к Братству.");
};

func void DIA_BaalKagan_SUCCESS_Erz()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //Я возьму 100 кусков руды.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //Очень хорошо. Вот они.
	
	CreateInvItems		(self, itminugget, 100);
	B_GiveInvItems      (self, other, itminugget, 100);
	Info_ClearChoices	(DIA_BaalKagan_SUCCESS);
};

//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //Я возьму магические свитки.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //Хорошее решение. Выбирай три любых.
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Кулак ветра",DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Телекинез",DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Пирокинез",DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Сон",DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS,"Чары",DIA_BaalKagan_SUCCESS_TakeScrolls_Charme);
};
//-----------------------------------------------------------------------
	var int BaalKagan_drei;
//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust()
{
	CreateInvItem(self, ItArScrollWindfist);
	B_GiveInvItems(self, hero, ItArScrollWindfist, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Это был последний свиток. Используй их с умом!
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese()
{
	CreateInvItem(self, ItArScrollTelekinesis);
	B_GiveInvItems(self, hero, ItArScrollTelekinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Это был последний свиток. Используй их с умом!
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese()
{
	CreateInvItem(self, ItArScrollPyrokinesis);
	B_GiveInvItems(self, hero, ItArScrollPyrokinesis, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Это был последний свиток. Используй их с умом!
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf()
{
	CreateInvItem(self, ItArScrollSleep);
	B_GiveInvItems(self, hero, ItArScrollSleep, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Это был последний свиток. Используй их с умом!
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};

func void DIA_BaalKagan_SUCCESS_TakeScrolls_Charme()
{
	CreateInvItem(self, ItArScrollCharm);
	B_GiveInvItems(self, hero, ItArScrollCharm, 1);
	
	BaalKagan_drei = BaalKagan_drei+1;
	if (BaalKagan_drei >= 3)	 
	{	
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Это был последний свиток. Используй их с умом!
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};







	
	
	
	
	




