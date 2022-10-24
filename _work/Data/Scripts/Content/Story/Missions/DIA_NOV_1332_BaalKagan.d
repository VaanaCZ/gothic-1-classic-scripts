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
	description = "Ты пришел из Лагеря Сектантов?";
};                       

FUNC INT DIA_BaalKagan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalKagan_Hello_Info()
{	
	AI_Output			(other, self,"DIA_BaalKagan_Hello_15_00"); //Ты пришел из Лагеря сектантов?
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_01"); //Мы называем его лагерем Братства.
	AI_Output			(self, other,"DIA_BaalKagan_Hello_13_02"); //Меня зовут Идол Каган. Да пребудет с тобой Спящий!
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
	description = "А что ты здесь делаешь?";
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
	AI_Output			(other, self,"DIA_BaalKagan_WhyHere_15_00"); //А что ты здесь делаешь?
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_01"); //Гуру прислали меня проповедовать учение Спящего среди неверных.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_02"); //Но эти люди ничего не хотят знать о духовном просветлении. Поэтому сейчас я просто продаю болотник.
	AI_Output			(self, other,"DIA_BaalKagan_WhyHere_13_03"); //Уж его-то здесь раскупают быстро. Так быстро, что моего болотника здесь всегда не хватает.

	Log_CreateTopic	(GE_TraderNC,	LOG_NOTE);
	B_LogEntry		(GE_TraderNC,	"Идол Каган продает болотник ворам и наемникам из Нового лагеря.");
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
	description = "Покажи мне свои товары.";
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
	AI_Output			(other, self,"DIA_BaalKagan_TRADE_15_00"); //Покажи мне свои товары.
	AI_Output			(self, other,"DIA_BaalKagan_TRADE_13_01"); //Как пожелаешь!
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
	description = "Почему бы им не послать сюда кого-нибудь еще?";
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
	AI_Output			(other, self,"DIA_BaalKagan_OrderHelp_15_00"); //Почему бы им не послать сюда кого-нибудь еще?
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_01"); //У меня есть здесь помощник. Идол Исидро. Но он целыми днями пропадает в баре на озере, где пропивает весь свой болотник.
	AI_Output			(self, other,"DIA_BaalKagan_OrderHelp_13_02"); //Его больше привлекает шнапс, чем служение Спящему. От него мне никакой помощи.
	
	if (Lares_Get400Ore == LOG_RUNNING)
	{
		Log_CreateTopic		(CH1_DealerJob,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_DealerJob,	LOG_RUNNING);
	    B_LogEntry			(CH1_DealerJob,	"Идол Исидро весь день сидит в баре на озере и пьянствует.");	
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
	description = "Я могу помочь тебе продавать здесь болотник.";
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
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_00"); //Я могу помочь тебе продавать здесь болотник.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_01"); //Я не могу доверить это важное дело незнакомому человеку. Только одному из наших последователей могу позволить это.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_02"); //Но и твоя помощь может мне пригодиться.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_03"); //В этом лагере не все еще знают о болотнике. Попробовав его один раз, они будут приходить ко мне еще и еще. Спрос на него повысится.
	AI_Output			(other, self,"DIA_BaalKagan_WannaHelp_15_04"); //Думаю, теперь у тебя никак не получится справиться с этим.
	AI_Output			(self, other,"DIA_BaalKagan_WannaHelp_13_05"); //Наши братья позаботятся об Идоле Исидро. Я уже отправил сообщение Кор Галому.
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
	description = "А что я получу, если раздам твой болотник?";
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
	AI_Output			(other, self,"DIA_BaalKagan_WasDrin_15_00"); //А что я получу, если раздам твой болотник?
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_01"); //Я сумею щедро наградить тебя.
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_02"); //Ты можешь взять у меня свитки, хранящие тайную магию Спящего.
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_03"); //Еще я могу помочь тебе вступить в наше Братство, если ты этого пожелаешь. У меня хорошие отношения с Кор Галомом и Идолом Тионом, которые отвечают за прием послушников.
		AI_Output		(self, other,"DIA_BaalKagan_WasDrin_13_04"); //Юберион прислушивается к их советам.
	};
	AI_Output			(self, other,"DIA_BaalKagan_WasDrin_13_05"); //Если все это тебе не по нраву, ты можешь выбрать руду. Тогда я заплачу тебе 100 кусков за твои старания.
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
	description = "Хорошо. Давай болотник. Кому его нужно раздать?";
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
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_00"); //Хорошо. Давай болотник. Кому его нужно раздать?
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_01"); //Думаю, тебе легко удастся найти тех, кто возьмет у тебя болотник. Но каждый из них может получить только одну сигарету, не больше.
	AI_Output			(self, other,"DIA_BaalKagan_GimmeKraut_13_02"); //И еще: если кто-то заберет у тебя этот болотник или ты сам его используешь, то можешь считать, что мы ни о чем не договаривались.
	AI_Output			(other, self,"DIA_BaalKagan_GimmeKraut_15_03"); //Конечно.
	BaalKagan_VerteilKraut = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_SpreadJoints, LOG_MISSION);
	Log_SetTopicStatus	(CH1_SpreadJoints, LOG_RUNNING);
	B_LogEntry			(CH1_SpreadJoints, "Послушник Идол Каган дал мне десять порций болотника, чтобы я раздал его людям в лагере.");		
	
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
	description = "Я раздал весь болотник.";
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
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_15_00"); //Я раздал весь болотник.
	if (NC_Joints_verteilt >= 8)
	{
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_01"); //У меня уже побывали новые покупатели, ты хорошо справился со своей задачей.
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_13_02"); //Как я могу отблагодарить тебя?
		
		Info_ClearChoices(DIA_BaalKagan_SUCCESS);
		Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Дай мне сто кусков руды."	,DIA_BaalKagan_SUCCESS_Erz);
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Info_AddChoice(DIA_BaalKagan_SUCCESS, "Помоги мне присоединиться к Братству."	,DIA_BaalKagan_SUCCESS_Join);
		};
		Info_AddChoice	 (DIA_BaalKagan_SUCCESS, "Ты говорил что-то о магических свитках. Расскажи о них."	,DIA_BaalKagan_SUCCESS_WhatSpells);
		
		BaalKagan_VerteilKraut = LOG_SUCCESS;
		Log_SetTopicStatus	(CH1_SpreadJoints, LOG_SUCCESS);
    	B_LogEntry			(CH1_SpreadJoints, "У Идола Кагана появились новые покупатели, а я получил свою награду.");
		B_GiveXP			(XP_DistributedWeedForKagan);
	}
	else
	{
		AI_Output			(self, other,"DIA_BaalKagan_NO_SUCCESS_13_00"); //Я еще не видел новых покупателей. Кажется, ты раздал не все.
	};
};

func void DIA_BaalKagan_SUCCESS_WhatSpells()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_WhatSpells_15_00"); //Ты говорил что-то о магических свитках. Расскажи о них поподробнее.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_WhatSpells_13_01"); //Кулак ветра, Чары, Телекинез, Пирокинез и Сон. Ты можешь выбрать три свитка.
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Я возьму магические свитки."	,DIA_BaalKagan_SUCCESS_TakeScrolls);
};

func void DIA_BaalKagan_SUCCESS_Join()
{
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Join_15_00"); //Помоги мне присоединиться к Братству.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_01"); //Твоя скромность похвальна. Я помогу тебе, слушай же. Идол Тион является одним из младших Гуру нашего Братства.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_02"); //Недавно Юберион назначил его своим советником. Но от этого его поведение только ухудшилось.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_03"); //Теперь он гордится собой, как никогда, и поэтому не разговаривает ни с кем, кроме своих учеников.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Join_13_04"); //Если ты передашь ему эту вещь, он сделает для тебя исключение.
	CreateInvItem       (self, SpecialJoint);
	B_GiveInvItems		(self, other, SpecialJoint, 1);

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,	"Идол Каган дал мне для Идола Тиона улучшенный 'Зов мечты'. Это поможет мне вступить в Братство Спящего.");
};

func void DIA_BaalKagan_SUCCESS_Erz()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_Erz_15_00"); //Дай мне сто кусков руды.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_Erz_13_01"); //Ты сделал выбор. Бери.
	
	CreateInvItems		(self, itminugget, 100);
	B_GiveInvItems      (self, other, itminugget, 100);
	Info_ClearChoices	(DIA_BaalKagan_SUCCESS);
};

//-----------------------------------------------------------------------
func void DIA_BaalKagan_SUCCESS_TakeScrolls()
{
	AI_Output			(other, self,"DIA_BaalKagan_SUCCESS_TakeScrolls_15_00"); //Я возьму магические свитки.
	AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_13_01"); //Ты принял хорошее решение. Выбирай три свитка.
	Info_ClearChoices(DIA_BaalKagan_SUCCESS);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Кулак ветра"	,DIA_BaalKagan_SUCCESS_TakeScrolls_Windfaust);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Телекинез"	,DIA_BaalKagan_SUCCESS_TakeScrolls_Telekinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Пирокинез"	,DIA_BaalKagan_SUCCESS_TakeScrolls_Pyrokinese);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Сон"		,DIA_BaalKagan_SUCCESS_TakeScrolls_Schlaf);
	Info_AddChoice   (DIA_BaalKagan_SUCCESS, "Чары"		,DIA_BaalKagan_SUCCESS_TakeScrolls_Charme);
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Ты взял три свитка. Используй их с умом.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Ты взял три свитка. Используй их с умом.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Ты взял три свитка. Используй их с умом.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Ты взял три свитка. Используй их с умом.
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
		AI_Output			(self, other,"DIA_BaalKagan_SUCCESS_TakeScrolls_DREI_13_00"); //Ты взял три свитка. Используй их с умом.
		Info_ClearChoices	(DIA_BaalKagan_SUCCESS);	
	};
};







	
	
	
	
	




