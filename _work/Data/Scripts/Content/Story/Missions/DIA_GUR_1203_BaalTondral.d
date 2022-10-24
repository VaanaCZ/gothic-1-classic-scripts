// **************************************************
// 					Pre - EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_MuteExit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_MuteExit_Condition;
	information	= DIA_BaalTondral_MuteExit_Info;
	permanent	= 0;
	description = "Ничего не говорить.";
};                       

FUNC INT DIA_BaalTondral_MuteExit_Condition()
{
	if (!Npc_KnowsInfo (hero,DIA_BaalTondral_YouTalked))
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_MuteExit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_Exit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_Exit_Condition;
	information	= DIA_BaalTondral_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalTondral_Exit_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_BaalTondral_MuteExit) || Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked) )
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Fanatic Teacher
// **************************************************

INSTANCE DIA_BaalTondral_FanaticTeacher (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_FanaticTeacher_Condition;
	information	= DIA_BaalTondral_FanaticTeacher_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_BaalTondral_FanaticTeacher_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_FanaticTeacher_Info()
{
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Ты не похож на тех, кто служит Баронам.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //Ты больше похож на того, кто ищет что-то. Я думаю, ты ищешь истинную веру. Разве ты не чувствуешь в себе огромное желание познать смысл твоего бытия?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Я вижу в тебе сомнение, посеянное словами прислужников Баронов. Они выдают их за истинную монету, но ты-то чувствуешь, что все это ложь!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //Они лгут, чтобы получить власть над теми, кто слаб духом. Но они не смогут одолеть твой дух своей ложью.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Ты же чувствуешь это стремление к свободе? Чувствуешь, как крепнет оно в тебе? Оно направляет твой дух. Не мешай ему.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Ты знаешь, что произойдет, если ты попытаешься его подавить? Ты будешь лгать самому себе! Перестань жить в тени собственных страхов. 
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Отбрось сомнения. Ты должен меня понять! Близится время пробуждения Спящего, и он освободит нас, а неверных жестоко покарает.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Будут они смыты с лица земли гневом его, и души их будут истреблены. Не помогут им тогда ни раскаяние, ни горькие мольбы о прощении. Будет слишком поздно.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //За свои сомнения они заплатят ему жизнью.
};

// **************************************************
// 				Du hast mich angesprochen
// **************************************************

INSTANCE DIA_BaalTondral_YouTalked (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_YouTalked_Condition;
	information	= DIA_BaalTondral_YouTalked_Info;
	permanent	= 0;
	description = "Ты заговорил со мной. Значит, теперь я смогу обращаться к тебе?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //Эй! Ты заговорил со мной. Значит, теперь я смогу обращаться к тебе?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //Я вижу, ты уже ознакомился с нашими правилами. Это похвально.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //В тебе сокрыта великая духовная сила! Я чувствую это. Возможно, ты очень скоро будешь принят в наше Братство.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //Я заговорил с тобой, дабы дать тебе шанс доказать нам свою преданность.
};

// **************************************************
// 				Loyalitдt beweisen
// **************************************************
	var int BaalTondral_GetNewGuy;
// **************************************************

INSTANCE DIA_BaalTondral_Loyality (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_Loyality_Condition;
	information	= DIA_BaalTondral_Loyality_Info;
	permanent	= 0;
	description = "Как я смогу доказать свою преданность?";
};                       

FUNC INT DIA_BaalTondral_Loyality_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Loyality_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //Как я смогу доказать свою преданность?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //Наше Братство нуждается в новых последователях, принявших учение Спящего.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //Если ты убедишь одного из неверных присоединиться к нам, ты покажешь, что твои намерения стать нашим братом в истинной вере, достаточно серьезны.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,	"Идол Тондрал послал меня в Старый лагерь, чтобы найти человека, который согласится присоединиться к Братству. Это отличная возможность завоевать его расположение!");

	BaalTondral_GetNewGuy = LOG_RUNNING;
};

// **************************************************
// 				Wo finde ich neuen Mann
// **************************************************

INSTANCE DIA_BaalTondral_NewMember (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember_Condition;
	information	= DIA_BaalTondral_NewMember_Info;
	permanent	= 1;
	description = "А где я смогу найти такого человека?";
};                       

FUNC INT DIA_BaalTondral_NewMember_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //А где я смогу найти такого человека?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //В Старом лагере ты сможешь найти тех, кто согласится принять нашу веру. Те, кто там живет, устали ото лжи и страха. Они не откажутся от дружеской поддержки.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //В Новом лагере люди не смогут воспринять наше духовное учение. Я думаю, там ты не сможешь никого убедить.
};

// **************************************************
// 			Wieso braucht ihr so dringend Neue
// **************************************************

INSTANCE DIA_BaalTondral_NewMember2 (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember2_Condition;
	information	= DIA_BaalTondral_NewMember2_Info;
	permanent	= 0;
	description = "Зачем Братству новые люди?";
};                       

FUNC INT DIA_BaalTondral_NewMember2_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember2_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //Зачем Братству новые люди?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //В одном из видений Спящий передал нашему Учителю послание.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //Чтобы он пробудился и указал нам истинный путь, ему нужна наша помощь, наша духовная сила.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //Поэтому мы готовим великую Церемонию, во время которой мы объединим наши мысли. Для этого нам потребуется очень много людей.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //Если ты желаешь узнать больше, иди на площадь перед Храмом. Только не нарушай покой нашего Учителя.
};

// **************************************************
// 					DUSTY SUCCESS
// **************************************************

INSTANCE DIA_BaalTondral_DustySuccess (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_DustySuccess_Condition;
	information	= DIA_BaalTondral_DustySuccess_Info;
	permanent	= 0;
	description = "Cо мной пришел человек, который хочет познакомиться с тобой.";
};                       

FUNC INT DIA_BaalTondral_DustySuccess_Condition()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	if ( (BaalTondral_GetNewGuy == LOG_RUNNING) && (Npc_GetDistToNpc(self,dusty)<1000) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_DustySuccess_Info()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //Учитель, со мной пришел человек, который хочет познакомиться с тобой.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //Кто это с тобой? Он достоин? 
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //Ему нужно духовное наставление, Учитель.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //Хорошо. С этого дня он будет моим учеником.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Ты должен будешь приходить ко мне каждый день и внимать моим словам. Я еще могу спасти твою душу.

	//AI_Output			(dusty,other,"DIA_BaalTondral_DustySuccess_03_05"); //HeiЯt das, ich bin dabei - einfach so?
	//AI_TurnToNpc		(other,dusty);
	//AI_Output			(other,NULL,"DIA_BaalTondral_DustySuccess_15_06"); //Sieht so aus. Tu einfach, was der Meister dir sagt.

	//---- Dusty vom SC lцsen ----
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal lцschen
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild	(dusty, GIL_NOV);
	B_ExchangeRoutine	(Vlk_524_Dusty,"PREPARERITUAL");
	
	BaalTondral_GetNewGuy = LOG_SUCCESS;
	B_LogEntry			(CH1_RecruitDusty,	"Дасти стал учеником Идола Тондрала. Я выполнил свое задание.");
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_SUCCESS);
	B_GiveXP			(XP_DeliveredDusty);
};

// **************************************************
// 					zu Kalom
// **************************************************

INSTANCE DIA_BaalTondral_SendToKalom (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_SendToKalom_Condition;
	information	= DIA_BaalTondral_SendToKalom_Info;
	permanent	= 0;
	description = "Учитель! Я хочу вступить в Братство. Помоги мне.";
};                       

FUNC INT DIA_BaalTondral_SendToKalom_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_SendToKalom_Info()
{
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //Учитель! Я хочу вступить в Братство. Помоги мне.
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //Ты доказал нам свою преданность. Иди к Кор Галому. Он даст тебе одеяние послушника.

	B_LogEntry(CH1_JoinPsi,	"Идол Тондрал считает меня достойным носить одежду послушника!");
};








