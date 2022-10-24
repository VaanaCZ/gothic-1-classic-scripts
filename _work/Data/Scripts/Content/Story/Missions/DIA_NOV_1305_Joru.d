// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Joru_Exit (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 999;
	condition	= DIA_Joru_Exit_Condition;
	information	= DIA_Joru_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Joru_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Joru_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Was machst du?
// **************************************************

instance  DIA_Joru_Greet (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Greet_Condition;
	information	= DIA_Joru_Greet_Info;
	permanent	= 0;
	description = "Чем ты занимаешься?";
};                       

FUNC int  DIA_Joru_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_Joru_Greet_Info()
{
	AI_Output (other, self,"DIA_Joru_Greet_15_00"); //Чем ты занимаешься?
	AI_Output (self, other,"DIA_Joru_Greet_07_01"); //Я наставляю послушников и несу им учение Спящего.
	AI_Output (self, other,"DIA_Joru_Greet_07_02"); //Я и сам еще послушник, но скоро я стану Идолом - одним из Гуру.
	AI_Output (self, other,"DIA_Joru_Greet_07_03"); //Я даже говорил с Юберионом. Он избранный. Он сказал мне, что если я буду усерден в постижении нашего учения, я и сам смогу стать Учителем.
	AI_Output (self, other,"DIA_Joru_Greet_07_04"); //Но, знаешь, мне спешить некуда. Учителем я могу стать в любой момент.
	AI_Output (self, other,"DIA_Joru_Greet_07_05"); //Мне нравится то, чем я занимаюсь сейчас, поэтому я не тороплюсь.
};

// **************************************************
//					Tester
// **************************************************

instance  DIA_Joru_Tester (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Tester_Condition;
	information	= DIA_Joru_Tester_Info;
	permanent	= 0;
	description = "Что ты здесь делаешь?";
};                       

FUNC int  DIA_Joru_Tester_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_Tester_Info()
{
	AI_Output (other, self,"DIA_Joru_Tester_15_00"); //Что ты здесь делаешь?
	AI_Output (self, other,"DIA_Joru_Tester_07_01"); //С некоторыми другими послушниками мы испытываем зелья, приготовленные Кор Галомом.
	AI_Output (self, other,"DIA_Joru_Tester_07_02"); //Раз в несколько дней его помощник приносит нам новые зелья, а мы их проверяем.
	AI_Output (self, other,"DIA_Joru_Tester_07_03"); //Трава, растущая на болотах, освобождает твой дух. Если правильно ее рассчитать, она поможет услышать слова Спящего.
};

// **************************************************
//				Schonmal Kontakt?
// **************************************************

instance  DIA_Joru_SleeperContact (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_SleeperContact_Condition;
	information	= DIA_Joru_SleeperContact_Info;
	permanent	= 0;
	description = "Ты уже говорил со Спящим?";
};                       

FUNC int  DIA_Joru_SleeperContact_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Tester))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_SleeperContact_Info()
{
	AI_Output (other, self,"DIA_Joru_SleeperContact_15_00"); //Ты уже говорил со Спящим?
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_01"); //Нет, еще ни разу не слышал. Зелья постоянно оказывается недостаточно.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_02"); //После каждого испытания Кор Галом спрашивает меня о том, каков был результат, но мне кажется, что мое мнение его совсем не интересует.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_03"); //Если зелье обладает нужными свойствами, он отдает его Гуру...
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_04"); //Но скоро я сам стану Гуру, и тогда я смогу полностью освободить сознание и услышать слова Спящего.
};


// **************************************************
//					JOIN PSI
// **************************************************
	var int Joru_BringJoints;
// **************************************************

instance  DIA_Joru_JoinPsi (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JoinPsi_Condition;
	information	= DIA_Joru_JoinPsi_Info;
	permanent	= 0;
	description = "Я хочу присоединиться к этому лагерю. Ты можешь мне помочь?";
};                       

FUNC int  DIA_Joru_JoinPsi_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JoinPsi_Info()
{
	AI_Output (other, self,"DIA_Joru_JoinPsi_15_00"); //Я хочу присоединиться к этому лагерю. Ты можешь мне помочь?
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_01"); //Ты хочешь стать одним из нас? Хорошо! Подожди... да, думаю, я смогу тебе помочь.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_02"); //Хотя я и не Гуру, но все же мои слова имеют некоторый вес в Братстве.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_03"); //Окажи мне одну небольшую услугу. Ты уже говорил с Фортуно?
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
	Info_AddChoice		(DIA_Joru_JoinPsi,"Нет."	,DIA_Joru_JoinPsi_Nein);
	Info_AddChoice		(DIA_Joru_JoinPsi,"Да."		,DIA_Joru_JoinPsi_Ja);
};

func void DIA_Joru_JoinPsi_Ja()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Ja_07_00"); //Если так, то он уже дал тебе дневную дозу болотника. Дай ее мне, я смогу помочь тебе.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Ja_15_01"); //Я подумаю.
	Joru_BringJoints = LOG_RUNNING; 
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

func void DIA_Joru_JoinPsi_Nein()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Nein_07_00"); //Тогда пойди к нему и возьми свою дневную дозу. Если отдашь ее мне, я посмотрю, чем тебе можно помочь.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Nein_15_01"); //Я подумаю.
	Joru_BringJoints = LOG_RUNNING; 

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi, "Йору попросил меня отдать ему мою дневную порцию болотника, которую я смогу получить у Фортуно.");
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

// **************************************************
//					SUCCESS
// **************************************************

instance  DIA_Joru_JointsRunning (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JointsRunning_Condition;
	information	= DIA_Joru_JointsRunning_Info;
	permanent	= 1;
	description = "У меня есть болотник. Возьми его.";
};                       

FUNC int  DIA_Joru_JointsRunning_Condition()
{
	if (Joru_BringJoints == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JointsRunning_Info()
{
	AI_Output				(other, self,"DIA_Joru_JointsRunning_15_00"); //У меня есть болотник. Возьми его.
		
	if (Npc_HasItems(other,itmijoint_2)>=3)
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_01"); //Хорошо! Наверное, ты уже заметил, что ни один из Гуру не хочет с тобой разговаривать.
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_02"); //Они заговорят с тобой только тогда, когда ты сможешь произвести на них впечатление. Я могу рассказать тебе, как это сделать.
		
		B_GiveInvItems		(other, self, itmijoint_2, 3);
		
		Joru_BringJoints = 	LOG_SUCCESS; 
		B_GiveXP			(XP_WeedForJoru);
	}
	else
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00"); //Но только после того, как ты отдашь мне свою дневную дозу. Три 'Северных темных', и я расскажу тебе все, что знаю.
	}; 
};

// **************************************************
//			Wie kann ich Gurus beeindrucken?
// **************************************************
	var int Joru_Tips;
// **************************************************

instance  DIA_Joru_ImpressGurus (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_ImpressGurus_Condition;
	information	= DIA_Joru_ImpressGurus_Info;
	permanent	= 1;
	description = "Как мне произвести впечатление на Гуру?";
};                       

FUNC int  DIA_Joru_ImpressGurus_Condition()
{
	if (Joru_BringJoints == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_ImpressGurus_Info()
{
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_00"); //Как мне произвести впечатление на Гуру?
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_01"); //Идол Кадар обучает послушников использовать магию Спящего.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_02"); //Если ты хочешь привлечь его внимание, используй магию.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_03"); //Но даже не пытайся опробовать на нем Кулак Ветра! Лучше нашли сон на одного из послушников или прочитай другое подобное заклинание.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_04"); //Идол Намиб - Гуру, стоящий у ворот в лагерь, крепкий орешек. Думаю, Лестер сможет помочь тебе разговорить его. Поговори с ним, когда его учителя не будет поблизости.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_05"); //С другими Гуру будет легче поговорить. Просто постарайся показать себя с лучшей стороны.
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_06"); //Спасибо за твои советы.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_07"); //Ну, сделка есть сделка.
	
	if ( Joru_JoinPsi == FALSE)
	{
		B_LogEntry	(CH1_JoinPsi, "Чтобы произвести впечатление на Идола Кадара, я должен нагнать сон на одного из его учеников.");
		B_LogEntry	(CH1_JoinPsi, "Лестер может рассказать мне, как добиться расположения Идола Намиба, стоящего у главных ворот. Только не стоит расспрашивать его вблизи от Гуру!");
		Joru_JoinPsi = TRUE;
	};
	
	Joru_Tips = TRUE;
};

// **************************************************
//					Woher Magie?
// **************************************************

instance  DIA_Joru_GetMagic (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_GetMagic_Condition;
	information	= DIA_Joru_GetMagic_Info;
	permanent	= 1;
	description = "Где я могу найти магию Спящего?";
};                       

FUNC int  DIA_Joru_GetMagic_Condition()
{
	if (Joru_Tips == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_GetMagic_Info()
{
	if (Joru_Tips_Mage == FALSE)
	{
		Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
		B_LogEntry		(GE_TraderPSI,	"Идол Кадар продает руны и магические свитки.");
		Joru_Tips_Mage	=TRUE;
	};
	AI_Output (other, self,"DIA_Joru_GetMagic_15_00"); //Где я могу найти магию Спящего?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_01"); //Идол Кадар продает руны и свитки. Но у тебя все равно не получиться их купить, если он не захочет с тобой разговаривать, верно?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_02"); //Может быть, тебе с этим поможет какой-нибудь другой Гуру.
};







/*
Sit_1_PSI_Joru_SmokingTeacher

Joru: Du bist neu hier. Hast Du schon unser Kraut genossen?
Das solltest du unbedingt tun. WeiЯt du, es ist ziemlich gut. Es цffnet deinen Geist fьr die Worte des Schlдfers.
Komm, komm zu uns und lasse deinen Geist frei. Mach dich bereit fьr eine Reise.
Eine spirituelle Reise. Lerne die Macht des Geistes zu nutzen. Lerne sie zu kontrollieren.
Komm zu uns in die Gemeinschaft der Erwachten und gleichzeitig Erwecker. Teile mit uns deine Kraft, wie wir unsere Kraft mit dir teilen.
Mach dich frei von Suche und beginne zu finden. Entdecke die Wahrheit. Das alles kannst du erreichen, wenn du zu uns kommst.

*/ 


	










