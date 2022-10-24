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
	description = "Кажется, ты не пропускаешь в замок посторонних...";
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
	AI_Output (other, self,"Info_EnterCastle_15_00"); //Кажется, ты не пропускаешь в замок посторонних...
	AI_Output (self, other,"Info_EnterCastle_09_01"); //Только люди Гомеза могут заходить в замок.
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
	description = "Я хочу стать одним из людей Гомеза.";
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
	AI_Output (other, self,"Info_WorkForGomez_15_00"); //Я хочу стать одним из людей Гомеза.
	AI_Output (self, other,"Info_WorkForGomez_09_01"); //Да, что ты говоришь? И почему это ты думаешь, что можешь быть полезен Гомезу.
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
	description = "Диего, сказал, что это от тебя зависит.";
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
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_00"); //Диего сказал, что это от тебя зависит.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_01"); //Хм... Если Диего думает, что ты можешь быть полезен, почему он сам не занимается тобой?
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_02"); //Послушай, Диего должен проверить, испытать тебя. И если он решит, что ты подходишь, я пропущу тебя в замок, и ты сможешь встретиться с Гомезом.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_03"); //А там уже все зависит только от тебя, ясно?
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_04"); //Я поговорю с Диего.
	
	B_LogEntry(CH1_JoinOC,"Торус сказал мне, что я должен поговорить с Диего, если я хочу, чтобы меня приняли в Старый лагерь. Диего даст мне задание.");
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
	description = "А почему ты сам не можешь меня испытать?";
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
	AI_Output (other, self,"Info_Thorus_TryMe_15_00"); //А почему ты сам не можешь меня испытать?
	AI_Output (self, other,"Info_Thorus_TryMe_09_01"); //Малыш, не все так просто! У каждого новичка, который хочет чего-то здесь добиться, должен быть покровитель.
	AI_Output (self, other,"Info_Thorus_TryMe_09_02"); //Покровитель из людей Гомеза. И он сам тебя испытает.
	AI_Output (self, other,"Info_Thorus_TryMe_09_03"); //Ведь он будет в ответе за тебя и за все, что ты натворишь. Таков закон.
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
	description = "И я ничем не могу тебе помочь?";
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
	AI_Output (other, self,"Info_Thorus_TryMeAgain_15_00"); //И я ничем не могу тебе помочь?
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_01"); //Нет. Ты, так сказать, немного маловат, чтобы быть нам чем-то полезен.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_02"); //Лучше делай то, что твой покровитель тебе доверит.
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
	description = "Но я смогу делать и то, что скажешь мне ты.";
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
	AI_Output (other, self,"Info_Thorus_TryMeICanDoIt_15_00"); //Но я смогу делать и то, что скажешь мне ты.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_01"); //Да ну? Вижу, не терпится стать героем, да? Вообще-то есть одно дело - как раз для того, кто не засветился с Гомезом.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_02"); //Но смотри, провалишь дело - получишь море неприятностей.
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
	description = "Я выполню твое задание.";
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
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_00"); //Я выполню твое задание.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_01"); //Все, что я тебе скажу, должно остаться между нами, ни слова другому. Понял?
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_02"); //Да.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_03"); //У нас здесь есть один проблемный парень из Нового лагеря - Мордраг. Он крадет у Баронов.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_04"); //Конечно, они почти все такие в Новом лагере. Но этот ворюга совсем обнаглел: крадет у нас и нам же продает!
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_05"); //Он слишком много себе позволяет, потому что знает, что я ему ничего сделать не могу.
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_06"); //Почему?
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_07"); //Да потому что сами Маги его защищают.

	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
	Info_AddChoice   (Info_Thorus_MordragKo_Offer, "Я займусь им." 							,Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "Хочешь, чтобы я убил его?" 						,Info_Thorus_MordragKo_KillHim);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "Где я могу найти Мордрага?" 								,Info_Thorus_MordragKo_Where);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "А почему маги защищают Мордрага?"		,Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer, "Кажется, что маги тоже доставляют тебе хлопот..."	,Info_Thorus_MordragKo_MageProblem);
	
	Thorus_MordragKo = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_MordragKO, LOG_MISSION);
	B_LogEntry			(CH1_MordragKO,"Торус хочет, чтобы я выгнал из лагеря вора Мордрага. Ему неважно, как я смогу это сделать. Никто не должен знать, что Торус поручил мне это дело.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_RUNNING);

	var C_Npc Mordrag; 				
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
};

FUNC VOID Info_Thorus_MordragKo_OFFER_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //Я займусь им.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

FUNC VOID Info_Thorus_MordragKo_KillHim()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_KillHim_15_00"); //Хочешь, чтобы я убил его?
	AI_Output (self, other,"Info_Thorus_MordragKo_KillHim_09_01"); //Мне все равно. Главное сделай так, чтобы я его больше не видел.
};

FUNC VOID Info_Thorus_MordragKo_Where()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Where_15_00"); //Где я могу найти Мордрага?
	AI_Output (self, other,"Info_Thorus_MordragKo_Where_09_01"); //На другой стороне замка, возле южных ворот. Не осмеливается совсем заходить в лагерь.  
	B_LogEntry(CH1_MordragKO, "Мордрага я смогу найти у южных ворот, с противоположной стороны замка.");
};

FUNC VOID Info_Thorus_MordragKo_MagesProtect()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //А почему маги защищают Мордрага?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Наши маги общаются с магами из Нового лагеря, и он их посыльный.
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //Думаю, если я убью или вышвырну из лагеря одного из их гонцов, они рады не будут.
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //А как же я? Что маги могут сделать со мной?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //Ты новенький, и тебя они не тронут. А вот я отвечаю головой за действия своих парней, а потому важно, чтобы ты держал свой рот на замке.
	Thorus_MordragMageMessenger = TRUE;
};

FUNC VOID Info_Thorus_MordragKo_MageProblem()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Кажется, что маги тоже доставляют тебе хлопот...
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Да, и с ними не так просто сладить. Пару лет назад один из Призраков попытался убить Верховного Мага Круга Огня, пока тот спал.
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_02"); //Потом его нашли во Внешнем Кольце... вернее, его останки, разбросанные по всему Кольцу...
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
	description = "Я по поводу Мордрага...";
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
	Info_AddChoice   	(Info_Thorus_MordragKo_Analyze, "Я позабочусь об этом." 	,Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice	 	(Info_Thorus_MordragKo_Analyze, "Где я могу найти Мордрага?" 	,Info_Thorus_MordragKo_Where);	//SIEHE OBEN
	var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	if (Npc_IsDead(Mordrag))
	{
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze, "Считай, что Мордраг совершил свою последнюю кражу!" ,Info_Thorus_MordragKo_MordragDead);
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{ 
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze, "Больше он не сунет сюда свой нос!" ,Info_Thorus_MordragKo_MordragGone);
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
	B_LogEntry (CH1_MordragKO, "Торус остался доволен тем, что Мордрага больше нет в Старом лагере.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);

};

FUNC VOID Info_Thorus_MordragKo_MordragGone()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragGone_15_00"); //Больше он не сунет сюда свой нос!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragGone_09_01"); //Было бы лучше, если бы ты убил его.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);
	B_LogEntry (CH1_MordragKO, "Торус остался доволен тем, что Мордрага больше нет в Старом лагере.");
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
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_00"); //Ты все испортил! Я же предупреждал тебя: не называть моего имени!
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_01"); //Ты провалил все! Забудь все, что я тебе говорил и больше не смей лезть в это дело!
			
	Thorus_MordragKo = LOG_FAILED;
	
	Log_SetTopicStatus(CH1_MordragKO, LOG_FAILED);
	B_LogEntry (CH1_MordragKO, "Я сказал Мордрагу, кто захотел выгнать его. Торусу это совсем не понравилось. Теперь мне лучше не попадаться у него на пути.");
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
	description = "Ты сможешь впустить в замок, если я поделюсь своим запасом руды?";
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
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_00"); //А ты сможешь впустить меня в замок, если я поделюсь с тобой своим запасом руды?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_01"); //Своим запасом... 
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_02"); //Сколько?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_02"); //Ну... Пересчет этой руды должен занять много времени. Мы с парнями должны считать достаточно долго, чтобы ты успел проскочить.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_03"); //Ну, скажи сколько именно?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_03"); //Думаю, тысячи кусков будет в самый раз.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_04"); //Тысяча кусков?!
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_04"); //Ну, можешь пройти бесплатно, когда будешь одним из людей Гомеза.
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
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_01"); //Ладно, проходи. Но не натвори там глупостей, понял?
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
	description = "Мне нужно попасть в замок. У меня есть письмо...";
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
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_03"); //Хорошо, покажи мне это письмо.
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_04"); //Думаешь, я позволю тебе прикарманить его! Забудь про него!
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_05"); //Хорошо, уже забыл.
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
	description = "Диего сказал, что мне можно увидеть Гомеза!";
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
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_00"); //Диего сказал, что мне можно увидеть Гомеза!
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_01"); //Мне решать, что тебе можно!
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_02"); //И что ты решил?
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_03"); //Хм...
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_04"); //Должен согласиться, до сих пор ты делал все как надо.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_05"); //Хорошо! Можешь встретиться с Гомезом. Ему одному решать - будешь ли ты один из нас или нет.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_06"); //Теперь все зависит только от тебя самого.
				
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
	description = "Кор Галом передал Гомезу болотник.";
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
	AI_Output (other, self,"Info_Thorus_Krautbote_15_00"); //Кор Галом передал Гомезу болотник.
	AI_Output (self, other,"Info_Thorus_Krautbote_09_01"); //Покажи!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_02"); //Хм...
		AI_Output (self, other,"Info_Thorus_Krautbote_09_03"); //Хорошо! Проходи. Отправляйся к дому Баронов. Бартоло встретит тебя там.
		
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_04"); //У тебя слишком мало болотника! Надеюсь, ты не продал его на сторону. Будет нормальный запас, тогда и приходи.
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
	description = "Меня прислали маги Воды. Мне нужно попасть в замок.";
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
	AI_Output (other, self,"Info_Thorus_KdWSiegel_15_00"); //Меня прислали маги Воды. Мне нужно попасть в замок.
	if (Npc_HasItems(other,KdW_Amulett)>=1)
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_01"); //Ты можешь пройти мимо стражи, только если у тебя есть амулет.
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_02"); //Мне ничего от магов не надо, так что перестань надоедать мне, хорошо?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		
		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_03"); //Конечно, конечно! А амулет у тебя для этого есть, а?
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
	description = "У меня все получилось. Наконец-то меня приняли в этот лагерь!";
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
	AI_Output (other, self,"Info_Thorus_SttGeschafft_15_00"); //У меня все получилось. Наконец-то меня приняли в этот лагерь!
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_01"); //Мои поздравления, малыш! Совет на будущее - держись поближе к Диего.
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_02"); //Ты можешь обращаться к Гомезу и Равену только по очень важным делам.
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
	description = "Как дела?";
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
	AI_Output (other, self,"Info_Thorus_PERM2_15_00"); //Как дела?
	AI_Output (self, other,"Info_Thorus_PERM2_09_01"); //Неплохо. Новый лагерь нам не сильно мешает. А вот болотные придурки немного достают.
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
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Да. То, что ты сделал в шахте, еще раз доказывает твою смелость, а также твою силу и умение драться.
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_03"); //Я готов принять тебя в стражники.
	if hero.level < 10
	{
		AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_04"); //Но у тебя еще маловато для этого опыта. Подучись еще немного и приходи.
	    AI_StopProcessInfos	(self);
		B_PrintGuildCondition(10);
    }
    else if hero.level >= 10
    {
	    AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_05"); //Это твой шанс. Что скажешь?
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
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //Приятно слышать это. Но сначала послушай, что должен знать любой новичок. Слушай внимательно, второй раз повторять не буду.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //Раньше ты был сам по себе, теперь пришло время забыть об этом. Мои люди горой стоят за своего товарища. Мы, стражники, охраняем жизнь Баронов, руду, шахту и лагерь.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //Рудокопы добывают руду, а наша задача следить, чтобы их не сожрали ползуны. И хотя с королем переговоры ведут Бароны, многое тоже зависит от нас.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Днем и ночью мы находимся в шахте. Днем и ночью мы стоим на страже у ворот лагеря и следим за тем, чтобы его обитатели могли спать спокойно.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //Раньше мы были неорганизованной шайкой бандитов, но сейчас мы - сила, и с нами нужно считаться. Ради этого нам приходится много работать.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //От своих парней мне нужно одно - сплоченности. Только вместе мы сможем справиться с любыми проблемами.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //И остаться в живых.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //Потихоньку ты всему научишься. Будь готов, что кому-то может понадобиться твоя помощь и тебе надо будет сделать все, что для этого потребуется.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //Иди к Стоуну. Он даст тебе доспехи и меч.
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
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //Добро пожаловать в стражники!
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(GE_BecomeGuard,	LOG_NOTE);
	B_LogEntry			(GE_BecomeGuard,	"Сегодня Торус зачислил меня в ряды стражников. Я могу взять себе новый доспех у кузнеца Стоуна в замке.");
	
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
	description		= "Но мне по душе путь магии."; 
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
	AI_Output (other, self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //Но мне по душе путь магии.
	AI_Output (self, other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //Тогда тебе дорога к Корристо. Он учил Мильтена. Вижу, ты настроен серьезно.

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
	description = "Ты можешь научить меня чему-нибудь?";
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
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //Я могу помочь тебе улучшить свои умения и стать сильнее.
	
	if (log_thorustrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Торус может помочь мне увеличить силу и ловкость.");
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
		B_LogEntry			(GE_TeacherOC,"Торус может научить меня вести бой двуручным мечом, если я смогу обращаться с одноручным оружием.");
		log_thorusfight = TRUE;
	};
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //Научи меня владеть двуручным мечом.
	
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //Хорошо, тогда давай начнем с легкого.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Меч нужно держать горизонтально. Тебе придется хорошо замахнуться, чтобы атаковать противника тяжелым оружием.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Подними руку и бей вертикально вниз. Обычно этого достаточно, чтобы избавиться от врага.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Используй инерцию движения, чтобы вернуться в исходную позицию.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Двуручный меч - это идеальное оружие для боковых ударов, когда тебе надо держать врага на расстоянии.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //В общем, можешь начать тренироваться.
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
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //Я хочу научиться лучше владеть двуручным мечом.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //Для начала тебе надо правильно встать. Держи меч вертикально, возьмись за рукоятку обеими руками и отведи его в сторону.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Теперь руби вниз, вкладывай силу от самого плеча. И затем - резкий удар вправо!
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //У противника не будет ни единого шанса к тебе подобраться.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //Из этого же положения можно нанести резкий колющий удар вперед, чтобы отогнать врага.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Развернись, чтобы придать мечу должный разгон, - и еще один рубящий удар!
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //Если этого окажется недостаточно, по инерции возвращайся в прежнее положение. 
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Когда закончишь серию, защищайся и жди момента, чтобы атаковать снова.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //Секрет успеха кроется в чередовании ударов и своевременной защите.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0 ;
	};
};  
