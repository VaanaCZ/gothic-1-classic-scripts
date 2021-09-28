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
	AI_Output (self, other,"DIA_Joru_Greet_07_01"); //Я несу ученикам слово Спящего.
	AI_Output (self, other,"DIA_Joru_Greet_07_02"); //Я сам пока еще учусь, но скоро я буду Идолом - одним из Гуру.
	AI_Output (self, other,"DIA_Joru_Greet_07_03"); //Я даже говорил с самим Ю`Берионом. Он - Избранный. Он сказал мне, что если я буду много трудиться, я вскоре сам стану господином.
	AI_Output (self, other,"DIA_Joru_Greet_07_04"); //Но я не тороплюсь с этим. Господином я могу стать в любой момент, понимаешь?
	AI_Output (self, other,"DIA_Joru_Greet_07_05"); //А пока мне нравится то дело, которым я занимаюсь сейчас.
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
	description = "Чем ты занимаешься?";
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
	AI_Output (other, self,"DIA_Joru_Tester_15_00"); //Чем ты занимаешься?
	AI_Output (self, other,"DIA_Joru_Tester_07_01"); //Вместе с моими друзьями я испытываю новые эликсиры, которые Кор Галом создает в своей лаборатории.
	AI_Output (self, other,"DIA_Joru_Tester_07_02"); //Раз в несколько дней его помощник выдает нам новые образцы. И мы испытываем их.
	AI_Output (self, other,"DIA_Joru_Tester_07_03"); //Эта трава раскрывает твое сознание. Приняв правильную дозу, ты можешь говорить со Спящим.
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
	description = "И ты когда-нибудь говорил со Спящим?";
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
	AI_Output (other, self,"DIA_Joru_SleeperContact_15_00"); //И ты когда-нибудь говорил со Спящим?
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_01"); //Нет. Еще нет. И все потому, что нам не хватает этого снадобья.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_02"); //Кор Галома интересует только результат, а мое мнение, как мне кажется, его не занимает вовсе.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_03"); //Если состав оказывает должное действие, он сразу передает его Гуру...
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_04"); //Но скоро я и сам стану Гуру, и тогда, расширив сознание до предела, я тоже смогу услышать голос Спящего.
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
	description = "Я хотел бы присоединиться к вашему Лагерю. Ты мог бы мне помочь?";
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
	AI_Output (other, self,"DIA_Joru_JoinPsi_15_00"); //Я хотел бы присоединиться к вашему Лагерю. Ты мог бы мне помочь?
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_01"); //Ты хочешь присоединиться к нам? Хорошо! Постой-ка... да, думаю, что я смогу тебе помочь.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_02"); //Я пока что не Гуру, но обладаю определенным влиянием в Братстве.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_03"); //Сделай мне одолжение. Ты ведь уже говорил с Фортуно?
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
	Info_AddChoice		(DIA_Joru_JoinPsi,"Нет.",DIA_Joru_JoinPsi_Nein);
	Info_AddChoice		(DIA_Joru_JoinPsi,"Да.",DIA_Joru_JoinPsi_Ja);
};

func void DIA_Joru_JoinPsi_Ja()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Ja_07_00"); //Тогда ты должен был получить свою дневную дозу. Если ты отдашь ее мне, я постараюсь тебе помочь.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Ja_15_01"); //Я подумаю об этом.
	Joru_BringJoints = LOG_RUNNING; 
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

func void DIA_Joru_JoinPsi_Nein()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Nein_07_00"); //Так иди к нему и забери свою дневную дозу. Если ты отдашь мне свой болотник, я постараюсь помочь тебе.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Nein_15_01"); //Я подумаю об этом.
	Joru_BringJoints = LOG_RUNNING; 

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Йору хотел бы получить мою порцию болотника, которую я взял у Фортуно.");
	
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
	description = "Болотник у меня. Можешь забирать.";
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
	AI_Output				(other, self,"DIA_Joru_JointsRunning_15_00"); //Болотник у меня. Можешь забирать.
		
	if (Npc_HasItems(other,itmijoint_2)>=3)
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_01"); //Хорошо! Ты, должно быть, заметил, что никто из Гуру не хочет с тобой разговаривать.
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_02"); //Чтобы добиться своего, нужно произвести на них впечатление. Я расскажу тебе, как это сделать.
		
		B_GiveInvItems		(other, self, itmijoint_2, 3);
		
		Joru_BringJoints = 	LOG_SUCCESS; 
		B_GiveXP			(XP_WeedForJoru);
	}
	else
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00"); //Кажется, мы сошлись на трех стеблях 'северного темного'?! Отдай мне болотник, и ТОГДА я помогу тебе!
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
	description = "Как произвести впечатление на Гуру?";
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
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_00"); //Как произвести впечатление на Гуру?
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_01"); //Идол Кадар наставляет учеников в магии Спящего.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_02"); //Если хочешь, чтобы он обратил на тебя внимание, используй магию.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_03"); //Только не вздумай опробовать на нем Кулак Ветра! Погрузи кого-нибудь из учеников в сон или сделай еще что-нибудь вроде этого.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_04"); //Сложнее всего будет с Идолом Намибом - это тот тип у главных ворот. Думаю, здесь тебе сможет помочь Лестер. Поговори с ним, когда его господина не будет поблизости.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_05"); //Зато с остальными Гуру проблем быть не должно - просто постарайся быть полезным.
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_06"); //Благодарю за совет.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_07"); //Хей - сделка есть сделка!
	
	if ( Joru_JoinPsi == FALSE)
	{
		B_LogEntry	(CH1_JoinPsi,"Идол Кадар будет удивлен, если я смогу произнести заклинание сна на его слушателя.");
		B_LogEntry	(CH1_JoinPsi,"Надо спросить у Лестера, как мне удивить Идола Намиба. Его можно найти у главных ворот. Надо убедиться, что рядом нет ни одного Гуру.");
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
	description = "Как научиться магии Спящего?";
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
		B_LogEntry		(GE_TraderPSI,"Идол Кадар продает руны и свитки.");
		Joru_Tips_Mage	=TRUE;
	};
	AI_Output (other, self,"DIA_Joru_GetMagic_15_00"); //Как научиться магии Спящего?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_01"); //Идол Кадар продает руны и магические свитки. Правда, если он не желает с тобой разговаривать, толку от этого не много.
	AI_Output (self, other,"DIA_Joru_GetMagic_07_02"); //Возможно, тебе сможет помочь другой Гуру.
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


	










