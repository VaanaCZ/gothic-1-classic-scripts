// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Thorus_EXIT(C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 999;
	condition	= Info_Thorus_EXIT_Condition;
	information	= Info_Thorus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Thorus_EXIT_Condition()
{
	return 1;
};
 
FUNC VOID Info_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					Nur Gomez Leute in Burg
// ************************************************************

INSTANCE Info_Thorus_EnterCastle(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_EnterCastle_Condition;
	information	= Info_Thorus_EnterCastle_Info;
	permanent	= 0;
	description = "Похоже, ты не пропустишь в замок никого постороннего...";
};                       

FUNC INT Info_Thorus_EnterCastle_Condition()
{	
	if !C_NpcBelongsToOldCamp (other)
	&& (Diego_GomezAudience == FALSE)
	{
		return 1;
	};
};
FUNC VOID Info_Thorus_EnterCastle_Info()
{	
	AI_Output (other, self,"Info_EnterCastle_15_00"); //Похоже, ты не пропустишь в замок никого постороннего...
	AI_Output (self, other,"Info_EnterCastle_09_01"); //В замок могут заходить только люди Гомеза.
};

// ************************************************************
// 					Ich will fьr Gomez arbeiten
// ************************************************************

INSTANCE Info_Thorus_WorkForGomez(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_WorkForGomez_Condition;
	information	= Info_Thorus_WorkForGomez_Info;
	permanent	= 0;
	description = "Я хочу работать на Гомеза. ";
};                       

FUNC INT Info_Thorus_WorkForGomez_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) || Npc_KnowsInfo (hero,Info_Thorus_EnterCastle) )
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_WorkForGomez_Info()
{	
	AI_Output (other, self,"Info_WorkForGomez_15_00"); //Я хочу работать на Гомеза. 
	AI_Output (self, other,"Info_WorkForGomez_09_01"); //В самом деле? А почему ты думаешь, что Гомез заинтересуется тобой?
};

// ************************************************************
// 						Diego schickt mich
// ************************************************************

INSTANCE Info_Thorus_DiegoSentMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_DiegoSentMe_Condition;
	information	= Info_Thorus_DiegoSentMe_Info;
	permanent	= 0;
	description = "Диего сказал, что решать это будешь ты.";
};                       

FUNC INT Info_Thorus_DiegoSentMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) && Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_DiegoSentMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_00"); //Диего сказал, что решать это будешь ты.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_01"); //Х-мм... Если Диего считает, что ты нам подходишь, почему он САМ не занимается тобой?
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_02"); //Позволь объяснить: Диего должен испытать тебя. Если ОН решит, что ты нам подходишь, я позволю тебе войти в замок и встретиться с Гомезом.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_03"); //Ну а все остальное уже зависит от тебя, понял?
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_04"); //Я поговорю с Диего.
	
	B_LogEntry(CH1_JoinOC,"Торус объяснил, что для вступления в Старый Лагерь мне надо поговорить с Диего. Он даст мне пробное задание.");
};

// ************************************************************
// 						Try Me
// ************************************************************

INSTANCE Info_Thorus_TryMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMe_Condition;
	information	= Info_Thorus_TryMe_Info;
	permanent	= 0;
	description = "Почему бы тебе самому не испытать меня?";
};                       

FUNC INT Info_Thorus_TryMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMe_15_00"); //Почему бы тебе самому не испытать меня?
	AI_Output (self, other,"Info_Thorus_TryMe_09_01"); //Все не так просто, малыш! Каждому новичку, который хочет чего-то добиться здесь, нужен покровитель.
	AI_Output (self, other,"Info_Thorus_TryMe_09_02"); //Этот покровитель должен быть из людей Гомеза. Он сам испытает тебя.
	AI_Output (self, other,"Info_Thorus_TryMe_09_03"); //Покровитель будет в ответе, если ты провалишь дело. Таков закон.
};

// ************************************************************
// 						TryMeAgain
// ************************************************************

INSTANCE Info_Thorus_TryMeAgain(C_INFO) //E4
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeAgain_Condition;
	information	= Info_Thorus_TryMeAgain_Info;
	permanent	= 0;
	description = "Возможно, я смогу быть чем-то полезен тебе.";
};                       

FUNC INT Info_Thorus_TryMeAgain_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeAgain_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeAgain_15_00"); //Возможно, я смогу быть чем-то полезен тебе.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_01"); //Нет. То, чем занимаемся мы, стражники, тебе немного не по плечу, малыш.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_02"); //Ты лучше выполняй задания своего покровителя.
};

// ************************************************************
// 						TryMeICanDoIt
// ************************************************************

INSTANCE Info_Thorus_TryMeICanDoIt(C_INFO) //E5
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeICanDoIt_Condition;
	information	= Info_Thorus_TryMeICanDoIt_Info;
	permanent	= 0;
	description = "Я вполне могу делать и то, что ты мне прикажешь.";
};                       

FUNC INT Info_Thorus_TryMeICanDoIt_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeAgain) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeICanDoIt_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeICanDoIt_15_00"); //Я вполне могу делать и то, что ты мне прикажешь.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_01"); //Да ну? Вижу, не терпится стать героем, да? Есть одна задачка - как раз для того, кто не работает на Гомеза.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_02"); //Но предупреждаю тебя - если провалишь дело, то заработаешь чертову уйму неприятностей.
};

// **************************************************************************
// 							MISSION MORDRAG KO
// **************************************************************************
VAR INT Thorus_MordragKo;
// **************************************************************************
// 							MISSION MORDRAG KO VERGABE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Offer (C_INFO) //E6
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Offer_Condition;
	information	= Info_Thorus_MordragKo_Offer_Info;
	permanent	= 0;
	description = "Я готов выполнить твое задание.";
};                       

FUNC INT Info_Thorus_MordragKo_Offer_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeICanDoIt) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Offer_Info()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_00"); //Я готов выполнить твое задание.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_01"); //То, что я тебе сейчас скажу, должно остаться между нами, никто другой не должен знать об этом. Понял?
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_02"); //Конечно.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_03"); //У нас возникла проблема с одним типом из Нового Лагеря. Его зовут Мордраг. Он крадет у Баронов.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_04"); //Разумеется, то же можно сказать и о большинстве воров из Нового Лагеря, но у этого типа хватает наглости приходить к НАМ и продавать НАШИ же вещи НАШИМ же людям!
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_05"); //Это зашло слишком далеко. Но он знает, что я не могу ничего сделать.
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_06"); //Почему?
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_07"); //Его защищают сами маги.

	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
	Info_AddChoice   (Info_Thorus_MordragKo_Offer,"Я позабочусь об этом.",Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Ты хочешь, чтобы я прикончил этого типа?",Info_Thorus_MordragKo_KillHim);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Где я могу найти Мордрага?",Info_Thorus_MordragKo_Where);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Почему маги защищают этого Мордрага?",Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Похоже на то, что главной проблемой для тебя являются маги...",Info_Thorus_MordragKo_MageProblem);
	
	Thorus_MordragKo = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_MordragKO, LOG_MISSION);
	B_LogEntry			(CH1_MordragKO,"Торус поручил мне избавиться от Мордрага, вора из Лагеря. Способ я должен выбрать сам. Но никто не должен знать, что Торус замешан в этом.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_RUNNING);

	var C_Npc Mordrag; 				
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
};

FUNC VOID Info_Thorus_MordragKo_OFFER_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //Я позабочусь об этом.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

FUNC VOID Info_Thorus_MordragKo_KillHim()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_KillHim_15_00"); //Ты хочешь, чтобы я прикончил этого типа?
	AI_Output (self, other,"Info_Thorus_MordragKo_KillHim_09_01"); //Я просто не хочу больше видеть здесь его рожу. Как ты этого добьешься - мне все равно.
};

FUNC VOID Info_Thorus_MordragKo_Where()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Where_15_00"); //Где я могу найти Мордрага?
	AI_Output (self, other,"Info_Thorus_MordragKo_Where_09_01"); //Ты найдешь его возле южных ворот на другой стороне замка. Этот ублюдок не смеет заходить дальше в Лагерь.
	B_LogEntry(CH1_MordragKO,"Мордраг находится у южных ворот, позади замка.");
};

FUNC VOID Info_Thorus_MordragKo_MagesProtect()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //Почему маги защищают этого Мордрага?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Они используют его в роли посыльного. Наши маги поддерживают связь с магами из Нового Лагеря и часто отправляют друг другу гонцов.
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //Скорее всего, им ОЧЕНЬ не понравится, если я вышвырну одного из гонцов за ворота Лагеря или убью его.
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //А что насчет МЕНЯ? Что маги сделают со МНОЙ?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //Ты здесь новенький. Все будет нормально. Но я отвечаю за своих людей. Вот почему очень важно, чтобы ты держал свой рот на замке.
	Thorus_MordragMageMessenger = TRUE;
};

FUNC VOID Info_Thorus_MordragKo_MageProblem()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Похоже на то, что главной проблемой для тебя являются маги...
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Да, и эту проблему не так-то легко решить. Несколько лет назад один из Призраков попытался прирезать Верховного Мага Круга Огня, пока тот спал.
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_02"); //Этого бедолагу потом нашли во Внешнем Кольце... Точнее, то, что от него осталось, было разбросано по всему Внешнему Кольцу...
};

// **************************************************************************
// 									ANALYZE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Analyze (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Analyze_Condition;
	information	= Info_Thorus_MordragKo_Analyze_Info;
	permanent	= 1;
	description = "По поводу Мордрага...";
};                       

FUNC INT Info_Thorus_MordragKo_Analyze_Condition()
{	
	if ( (Thorus_MordragKo == LOG_RUNNING) && (MordragKO_PlayerChoseThorus != TRUE) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Analyze_Info()
{
	Info_ClearChoices	(Info_Thorus_MordragKo_Analyze);
	Info_AddChoice   	(Info_Thorus_MordragKo_Analyze,"Я позабочусь об этом.",Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice	 	(Info_Thorus_MordragKo_Analyze,"Где я могу найти Мордрага?",Info_Thorus_MordragKo_Where);	//SIEHE OBEN
	var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	if (Npc_IsDead(Mordrag))
	{
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"Считай, что Мордраг совершил свою последнюю кражу!",Info_Thorus_MordragKo_MordragDead);
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{ 
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"Больше он не осмелится появиться здесь!",Info_Thorus_MordragKo_MordragGone);
	};
    
};

FUNC VOID Info_Thorus_MordragKo_ANALYZE_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00"); //Я позабочусь об этом.
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

FUNC VOID Info_Thorus_MordragKo_MordragDead()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragDead_15_00"); //Считай, что Мордраг совершил свою последнюю кражу!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragDead_09_01"); //Хочешь сказать, ты победил его? Неплохо, малыш!
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);	
	B_LogEntry (CH1_MordragKO,"На Торуса произвело впечатление то, как я решил проблему с Мордрагом.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);

};

FUNC VOID Info_Thorus_MordragKo_MordragGone()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragGone_15_00"); //Больше он не осмелится появиться здесь!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragGone_09_01"); //Было бы лучше, если бы ты убил его.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);
	B_LogEntry (CH1_MordragKO,"Похоже, Торус рад, что Мордраг больше не шатается по Лагерю.");
	B_GiveXP(XP_Thorusmordragko);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

// ************************************************************
// 						Mordrag verplappert					
// ************************************************************

INSTANCE Info_Thorus_MordragFailed (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragFailed_Condition;
	information	= Info_Thorus_MordragFailed_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Thorus_MordragFailed_Condition()
{	
	if (MordragKO_PlayerChoseThorus == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragFailed_Info()
{
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_00"); //Ты провалил все дело! Я говорил тебе НЕ НАЗЫВАТЬ МОЕГО ИМЕНИ!!!
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_01"); //Ты провалил задание! Забудь обо всем, что я тебе говорил! Больше не смей совать нос в это дело!
			
	Thorus_MordragKo = LOG_FAILED;
	
	Log_SetTopicStatus(CH1_MordragKO, LOG_FAILED);
	B_LogEntry (CH1_MordragKO,"Торус недоволен тем, что я упомянул его имя в разговоре с Мордрагом. Похоже, мне лучше не показываться ему на глаза некоторое время.");
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Bribe Thorus					
// ************************************************************

INSTANCE Info_Thorus_BribeGuard (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_BribeGuard_Condition;
	information	= Info_Thorus_BribeGuard_Info;
	permanent	= 0;
	description = "Если я поделюсь рудой, ты позволишь войти в замок?";
};                       

FUNC INT Info_Thorus_BribeGuard_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_EnterCastle) && (Npc_GetTrueGuild (other)!=GIL_STT) && (Npc_GetTrueGuild (other)!=GIL_GRD) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_BribeGuard_Info()
{
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_00"); //Если бы я поделился с тобой своим запасом руды, ты бы позволил мне войти в замок?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_01"); //Своим запасом...
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_02"); //Сколько?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_02"); //Ну... Пересчет этой руды должен занять много времени. Мы с ребятами должны считать достаточно долго, чтобы ты успел проскочить незамеченным.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_03"); //А поконкретней?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_03"); //Тысячи кусков должно быть достаточно.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_04"); //Тысяча кусков?!
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_04"); //Ну, ты можешь стать одним из людей Гомеза и пройти в замок задаром.
};

// ************************************************************
// 						Give1000Ore					
// ************************************************************

INSTANCE Info_Thorus_Give1000Ore (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_Give1000Ore_Condition;
	information	= Info_Thorus_Give1000Ore_Info;
	permanent	= 1;
	description = "У меня есть тысяча кусков руды. Пропусти меня!";
};                       

FUNC INT Info_Thorus_Give1000Ore_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_BribeGuard))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Give1000Ore_Info()
{
	AI_Output (other, self,"Info_Thorus_Give1000Ore_15_00"); //У меня есть тысяча кусков руды. Пропусти меня!
	
	if (Npc_HasItems(other, ItMiNugget)>=1000)
	{
		B_GiveInvItems 	(other,self,ItMiNugget,1000);		
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_01"); //Хорошо, проходи. Пока ты в замке, постарайся не делать никаких глупостей, ладно?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_02"); //Не пытайся надуть меня, малыш! У тебя нет тысячи кусков!
	};
};
		
// ************************************************************
// 					Brief fьr Magier
// ************************************************************

INSTANCE Info_Thorus_LetterForMages (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_LetterForMages_Condition;
	information	= Info_Thorus_LetterForMages_Info;
	permanent	= 1;
	description = "Мне нужно попасть в замок. У меня есть письмо.";
};                       

FUNC INT Info_Thorus_LetterForMages_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Thorus_EnterCastle)
	&&	(Npc_HasItems (hero, ItWr_Fire_Letter_01) || Npc_HasItems (hero, ItWr_Fire_Letter_02))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_LetterForMages_Info()
{
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_00"); //Мне нужно попасть в замок. У меня есть письмо для Верховного Мага Круга Огня.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_01"); //И ты надеешься, что я просто пропущу тебя в замок, чтобы ты мог получить свою награду?
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_02"); //Да.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_03"); //Ладно, покажи мне письмо.
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_04"); //Забудь об этом - я не позволю ТЕБЕ прикарманить его!
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_05"); //Ладно, уже забыл.
};

// ************************************************************
// 					Bereit fьr Gomez !!!
// ************************************************************

INSTANCE Info_Thorus_ReadyForGomez (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_ReadyForGomez_Condition;
	information	= Info_Thorus_ReadyForGomez_Info;
	permanent	= 0;//1
	description = "Диего сказал, что я могу увидеть Гомеза!";
};                       

FUNC INT Info_Thorus_ReadyForGomez_Condition()
{	
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_ReadyForGomez_Info()
{
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_00"); //Диего сказал, что я могу увидеть Гомеза!
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_01"); //Это буду решать я!
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_02"); //И что ты решил?
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_03"); //Х-ммм...
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_04"); //Должен признать, что до сих пор ты справлялся неплохо.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_05"); //Хорошо! Я позволю тебе встретиться с Гомезом. Сможешь ты стать одним из нас или нет - решать ему. 
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_06"); //С этой минуты, парень, все зависит только от тебя.
				
	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;
};

// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Thorus_Krautbote (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_Krautbote_Condition;
	information	= Info_Thorus_Krautbote_Info;
	permanent	= 0;
	description = "Я должен доставить груз болотника Гомезу от Кор Галома.";
};                       

FUNC INT Info_Thorus_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Krautbote_Info()
{
	AI_Output (other, self,"Info_Thorus_Krautbote_15_00"); //Я должен доставить груз болотника Гомезу от Кор Галома.
	AI_Output (self, other,"Info_Thorus_Krautbote_09_01"); //Покажи!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_02"); //Х-ммммммм...
		AI_Output (self, other,"Info_Thorus_Krautbote_09_03"); //Хорошо! Ты можешь пройти. Отправляйся к дому Баронов - там тебя встретит Бартоло.
		
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_04"); //Для посыльного у тебя слишком мало болотника! Надеюсь, что ты не продал его на сторону. Возвращайся с нормальным запасом!
	};
};

// ************************************************************
// 					SIEGEL der KdW
// ************************************************************
	var int thorus_Amulettgezeigt;
// ************************************************************

INSTANCE Info_Thorus_KdWSiegel (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_KdWSiegel_Condition;
	information	= Info_Thorus_KdWSiegel_Info;
	permanent	= 1;
	description = "Я по поручению магов Воды. Мне нужно попасть в замок!";
};                       

FUNC INT Info_Thorus_KdWSiegel_Condition()
{	
	if 	(( (Npc_KnowsInfo(hero, Org_826_Mordrag_Courier))||(Npc_HasItems(other,KdW_Amulett)>=1) )
		&& (thorus_Amulettgezeigt == FALSE) 
		)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_KdWSiegel_Info()
{
	AI_Output (other, self,"Info_Thorus_KdWSiegel_15_00"); //Я по поручению магов Воды. Мне нужно попасть в замок!
	if (Npc_HasItems(other,KdW_Amulett)>=1)
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_01"); //У тебя есть амулет гонца. С ним ты можешь пройти мимо стражи.
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_02"); //Я не хочу иметь дела с магами, так что перестань доставать меня, понял?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		
		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_03"); //Поручение, как же! А амулет свой ты где-то забыл, так?
	};
};

// ************************************************************
// 					Habs GESCHAFFT
// ************************************************************

INSTANCE Info_Thorus_SttGeschafft (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_SttGeschafft_Condition;
	information	= Info_Thorus_SttGeschafft_Info;
	permanent	= 0;
	description = "Я сделал это! Теперь я принадлежу к этому Лагерю!";
};                       

FUNC INT Info_Thorus_SttGeschafft_Condition()
{	
	if (Npc_GetTrueGuild(other) == GIL_STT)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_SttGeschafft_Info()
{
	AI_Output (other, self,"Info_Thorus_SttGeschafft_15_00"); //Я сделал это! Теперь я принадлежу к этому Лагерю!
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_01"); //Поздравляю, парень! С этого момента старайся держаться поближе к Диего.
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_02"); //Гомеза и Равена можно беспокоить только по ОЧЕНЬ важному поводу.
};	

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2 	   ///////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// ************************************************************
// 					PERM2
// ************************************************************

INSTANCE Info_Thorus_PERM2 (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_PERM2_Condition;
	information	= Info_Thorus_PERM2_Info;
	permanent	= 0;
	description = "Как идут дела?";
};                       

FUNC INT Info_Thorus_PERM2_Condition()
{	
	if ( (Npc_GetTrueGuild(other) == GIL_STT) && (Kapitel < 4) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_PERM2_Info()
{
	AI_Output (other, self,"Info_Thorus_PERM2_15_00"); //Как идут дела?
	AI_Output (self, other,"Info_Thorus_PERM2_09_01"); //У нас не так много проблем с Новым Лагерем. Куда больше меня беспокоят эти болотные придурки.
};	

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

//-----------------------------------------------------
// GILDENAUFNAHME GARDIST
//-----------------------------------------------------

instance  GRD_200_Thorus_GARDIST (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_GARDIST_Condition;
	information		= GRD_200_Thorus_GARDIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ты хотел мне что-то сказать?"; 
};

FUNC int  GRD_200_Thorus_GARDIST_Condition()
{	
	if ( (CorKalom_BringMCQBalls == LOG_SUCCESS)
	|| Npc_KnowsInfo (hero,Grd_214_Torwache_SEETHORUS)
	|| Npc_KnowsInfo (hero,GRD_216_Torwache_SEETHORUS) )
	&& (Npc_GetTrueGuild (hero ) == GIL_STT)
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_WANNABEMAGE))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_GARDIST_Info()
{
	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = TRUE;
	AI_Output (other, self,"GRD_200_Thorus_GARDIST_Info_15_01"); //Ты хотел мне что-то сказать?
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Да. То, что ты сделал в шахте, доказывает не только твою смелость. Ты силен и умеешь хорошо драться.
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_03"); //Я готов принять тебя в ряды стражников.
	if hero.level < 10
	{
		AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_04"); //Но ты пока еще не совсем готов стать им. Прежде тебе нужно набраться опыта.
	    AI_StopProcessInfos	(self);
		B_PrintGuildCondition(10);
    }
    else if hero.level >= 10
    {
	    AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_05"); //Я даю тебе шанс. Что скажешь?
	};
};
//---------------------------------------------------------------
// GARDIST WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_AUFNAHME (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_AUFNAHME_Condition;
	information		= GRD_200_Thorus_AUFNAHME_Info;
	permanent		= 0;
	description		= "Я хочу стать стражником."; 
};

FUNC int  GRD_200_Thorus_AUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,GRD_200_Thorus_GARDIST))
	&& (hero.level >=10)	
	&& (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_AUFNAHME_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_AUFNAHME_Info_15_01"); //Я хочу стать стражником.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //Рад слышать это. Но прежде я должен сказать тебе то, что всегда говорю новичкам. Слушай внимательно, повторять я не буду.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //Было время, когда ты был сам по себе. Теперь это в прошлом. Мои люди держатся друг друга. Мы, стражники, охраняем покой Баронов, руду, шахту и Лагерь.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //Рудокопы добывают руду, но это мы следим за тем, чтобы их не сожрали ползуны. Переговоры с королем ведут Бароны, но это мы защищаем их.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Днем и ночью мы находимся в шахте. Днем и ночью мы стоим на страже у ворот Лагеря и следим за тем, чтобы его обитатели могли спать спокойно.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //Мы начинали как дикая шайка, но сейчас мы - сила, с которой нельзя не считаться. И мы много работаем, для того чтобы сделать нашу жизнь такой, какая она есть.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //От своих людей я жду только одного: чтобы они всегда держались вместе. Только вместе мы сможем справиться с любыми проблемами.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //И выжить.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //Ты научишься всему по ходу дела. Будь готов оказать помощь тому, кому она нужна, и делать то, что от тебя потребуется.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //Иди и попроси Стоуна дать тебе доспехи и меч.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_11"); //Ты найдешь его в оружейной лавке во Внутреннем Кольце.

	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = FALSE;

	Npc_SetTrueGuild (hero,GIL_GRD);
	hero.guild = GIL_GRD;
};  
//---------------------------------------------------------------
// GARDIST WERDEN TEIL 2
//---------------------------------------------------------------
instance GRD_200_Thorus_NOCHWAS (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_NOCHWAS_Condition;
	information		= GRD_200_Thorus_NOCHWAS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_200_Thorus_NOCHWAS_Condition()
{	
	if (Npc_KnowsInfo     (hero, GRD_200_Thorus_AUFNAHME))
	&& (Npc_GetTrueGuild  (hero) == GIL_GRD ) 
	{
		return TRUE;
	};
};
func void  GRD_200_Thorus_NOCHWAS_Info()
{
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_01"); //Да, и вот еще что...
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //Добро пожаловать в Стражу!
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(GE_BecomeGuard,	LOG_NOTE);
	B_LogEntry			(GE_BecomeGuard,"Сегодня Торус принял меня в стражники. Я могу пойти и забрать свои доспехи у кузнеца Стоуна, в замке.");
	
};

//---------------------------------------------------------------
// ICH WILL MAGIER WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_WANNABEMAGE (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_WANNABEMAGE_Condition;
	information		= GRD_200_Thorus_WANNABEMAGE_Info;
	permanent		= 0;
	description		= "Меня больше увлекает путь магии."; 
};
//
FUNC int  GRD_200_Thorus_WANNABEMAGE_Condition()
{	
	if (Npc_KnowsInfo (hero, GRD_200_Thorus_GARDIST))
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_AUFNAHME))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_WANNABEMAGE_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //Меня больше увлекает путь магии.
	AI_Output (self, other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //Тогда, наверное, тебе стоит поговорить с Корристо. Он учил Мильтена. Уверен, тебя ничто не остановит.

	var C_NPC Corristo;
	Corristo = Hlp_GetNpc		(KDF_402_Corristo);
	Npc_ExchangeRoutine			(Corristo,"WAITFORSC");
	AI_ContinueRoutine			(Corristo);
};  
//---------------------------------------------------------------
//     						STR + DEX
//---------------------------------------------------------------
INSTANCE GRD_200_Thorus_Teach(C_INFO)
{
	npc			= GRD_200_Thorus;
	nr			= 10;
	condition	= GRD_200_Thorus_Teach_Condition;
	information	= GRD_200_Thorus_Teach_Info;
	permanent	= 1;
	description = "Ты можешь чему-нибудь научить меня?";
};                       

FUNC INT GRD_200_Thorus_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD)  
	{
		return TRUE;
	};
};

FUNC VOID GRD_200_Thorus_Teach_Info()
{
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //Ты будешь учить меня?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //Я могу показать тебе, как улучшить свои навыки и стать сильнее.
	
	if (log_thorustrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Торус поможет мне в тренировке силы и ловкости.");
		log_thorustrain = TRUE;
	};
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_BACK()
{
	
	Info_ClearChoices	(GRD_200_Thorus_Teach);
};

func void GRD_200_Thorus_Teach_STR_1()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_STR_5()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND1 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND1_Condition;
	information		= GRD_200_Thorus_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_GRD)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND1_Info()
{	
	if (log_thorusfight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry			(GE_TeacherOC,"Торус может научить меня сражаться двуручным оружием, как только я освою одноручное.");
		log_thorusfight = TRUE;
	};
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //Я хочу научиться владеть двуручным мечом.
	
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //Ладно, начнем с самого простого.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Держи меч горизонтально. Тебе понадобится большой замах, чтобы атаковать противника тяжелым оружием.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Подними руку и бей вертикально вниз. Обычного этого достаточно, чтобы избавиться от любого врага.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Используй инерцию движения чтобы вернуться в исходную позицию.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Двуручный меч просто идеален для боковых ударов, чтобы держать противника на расстоянии.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //Пожалуй, начнем с этого. Тренируйся.
		GRD_200_Thorus_ZWEIHAND1.permanent = 0;
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND2 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND2_Condition;
	information		= GRD_200_Thorus_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_GRD)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND2_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //Я хочу больше узнать о двуручном мече.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Прежде всего, смени исходную стойку. Держи меч вертикально, возьмись за рукоять обеими руками и отведи его в сторону.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Теперь быстро веди его вниз, замах от плеча. А теперь - рубящий удар вправо!
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //У противника не будет ни единого шанса к тебе подобраться.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Из этого же положения можно нанести резкий колющий удар вперед, чтобы отогнать врага.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Развернись, чтобы придать мечу должный разгон, - и еще один рубящий удар!
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //Если этого окажется недостаточно, меч по инерции легко вернется в исходное положение.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Закончив серию, защищайся и жди момента, чтобы атаковать снова.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //Секрет успеха кроется в чередовании ударов и боевых стоек.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0 ;
	};
};  
