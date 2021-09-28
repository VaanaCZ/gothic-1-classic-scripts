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
	description = "Ничего не говори.";
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
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //Ты не похож на тех рабов, что покорились воле Баронов.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //Ты больше похож на искателя - искателя истинной веры. Разве не ощущаешь ты внутри бушующее пламя - то, что не дает тебе спать по ночам?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Вижу, тебя терзают сомнения - есть ли правда в том, что пытаются навязать тебе прислужники Баронов? И ты знаешь, откуда берутся эти сомнения. Они все лгут!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //Ложь эта дает власть над теми, кто слаб духом. Но твой дух намного сильнее этой лжи!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //Разве не ощущаешь ты стремление к свободе - ежесекундно, ежечасно? Разве не чувствуешь ты, как день ото дня оно становится все сильнее, как направляет оно твой дух? Освободи его!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //Знаешь, что ты делаешь, когда пытаешься подавить его? Ты отвергаешь собственную душу, отвергаешь себя! Не позволяй страху властвовать над твоей жизнью!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Освободи себя. Ты должен понять! Спящий ПРОБУДИТСЯ! Он освободит тебя  и сметет всех язычников-неверных!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Как пыль, смытая дождем, исчезнут они из этого мира. Они будут рыдать и горько раскаиваться во всем, но будет уже слишком поздно.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Они заплатят цену. Заплатят своей кровью. И своими жизнями.
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
	description = "Эй! Ты заговорил со мной. Могу я обратиться к тебе?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //Эй! Ты заговорил со мной. Не значит ли это, что теперь и я могу обратиться к тебе?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //Ты постигаешь наши правила. Это похвально.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //Я ощущаю в тебе великую духовную силу! Скоро ты будешь допущен в круг избранных.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //Я заговорил с тобой, дабы дать тебе шанс проявить себя.
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
	description = "Как я могу доказать свою преданность?";
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
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //Как я могу доказать свою преданность?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //Больше всего мы нуждаемся в новых душах, постигших истину и вступивших в круг Братства.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //Если ты убедишь одного из неверных присоединиться к нашему Лагерю, этим ты докажешь свое стремление служить Братству.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Идол Тондрал послал меня в Старый Лагерь, чтобы нанять нового человека для Братства. Это хороший шанс заслужить его расположение.");

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
	description = "Где мне найти такого человека?";
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
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //Где мне найти такого человека?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //Лучше всего для этого подходит Старый Лагерь. Люди там устали от страха и лжи. Души их жаждут просветления и поддержки.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //Я думаю, что в Новом Лагере ты едва ли добьешься успеха. Там живут настоящие варвары.
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
	description = "Почему вам так нужны новые люди?";
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
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //Почему вам так нужны новые люди?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //Нашему Мастеру было видение - с ним говорил Спящий. У всемогущего есть для нас важное сообщение.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //Но он еще не вошел в полную силу. Вот почему ему нужна НАША помощь, для того чтобы говорить с нами.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //Все мы готовимся к Великой Церемонии, и чем больше людей примет в ней участие, тем больше наши шансы на успех.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //Если ты хочешь узнать больше, иди на площадь перед Холмом. Но не отвлекай Мастера от его размышлений!
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
	description = "Этот человек ищет твоего расположения, господин мой!";
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
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //Этот человек ищет твоего расположения, господин мой!
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //Кого ты привел ко мне? Достоин ли он?
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //Вне сомнений, он нуждается в духовном наставнике, господин.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //Очень хорошо. С этого момента он будет одним из моих учеников.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Ты будешь приходить ко мне каждый день и слушать то, что я скажу тебе. Твоя душа еще может быть спасена. 

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
	B_LogEntry			(CH1_RecruitDusty,"Дасти теперь является учеником Идола Тондрала. Я выполнил задание.");
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
	description = "Господин! Я хочу стать одним из членов Братства.";
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
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //Господин! Я хочу стать одним из членов Братства и молю тебя о поддержке. 
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //Ты заслужил ее. Иди к Кор Галому и проси у него робу послушника.

	B_LogEntry(CH1_JoinPsi,"Идол Тондрал считает, что я достоин носить робу послушника!");
};








