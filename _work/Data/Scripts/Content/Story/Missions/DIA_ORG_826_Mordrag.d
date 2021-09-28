// **************************************************
VAR INT MordragKO_PlayerChoseOreBarons;
VAR INT MordragKO_PlayerChoseThorus;
VAR INT MordragKO_HauAb;
var int MordragKO_StayAtNC;
// **************************************************

// **************************************************
//						 EXIT 
// **************************************************

instance  Org_826_Mordrag_Exit (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 999;
	condition	= Org_826_Mordrag_Exit_Condition;
	information	= Org_826_Mordrag_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_826_Mordrag_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrьssung
// **************************************************

instance  Org_826_Mordrag_Greet (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 1;
	condition	= Org_826_Mordrag_Greet_Condition;
	information	= Org_826_Mordrag_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Greet_Info()
{
	AI_Output (self, other,"Org_826_Mordrag_Greet_11_00"); //Эй, новенький! Меня зовут Мордраг. Запомни это имя - у меня ты можешь купить все, что тебе нужно, и по хорошей цене!
};

// **************************************************
//					Handeln
// **************************************************
var int Mordrag_Traded;
// **************************************************

instance  Org_826_Mordrag_Trade (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 800;
	condition	= Org_826_Mordrag_Trade_Condition;
	information	= Org_826_Mordrag_Trade_Info;
	permanent	= 1;
	description = "Покажи мне, что у тебя есть.";
	trade		= 1;
};                       

func int  Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Trade_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Trade_15_00"); //Покажи мне, что у тебя есть.
	AI_Output (self, other,"Org_826_Mordrag_Trade_11_01"); //Выбирай...
	if	(Mordrag_Traded==0)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"Вор Мордраг продает краденное на рынке.");
		Mordrag_Traded=1;
	};
};

// **************************************************
//					KURIER FЬR MAGIER
// **************************************************

instance  Org_826_Mordrag_Courier (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Courier_Condition;
	information	= Org_826_Mordrag_Courier_Info;
	permanent	= 1;
	description = "Ты действительно один из гонцов магов?";
};                       

FUNC int  Org_826_Mordrag_Courier_Condition()
{
	if	Thorus_MordragMageMessenger 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Courier_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_00"); //Ты действительно один из гонцов магов?
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_01"); //А что если так?
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_02"); //Я должен поговорить с магами. Мне необходимо пробраться в замок.
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_03"); //Курьеры носят печать, которая служит пропуском в замок. Если ты станешь одним из нас, ты тоже получишь ее.
};

// **************************************************
//					DU HAST EIN PROBLEM
// **************************************************

instance  Org_826_Mordrag_Problem (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Problem_Condition;
	information	= Org_826_Mordrag_Problem_Info;
	permanent	= 0;
	description = "У тебя есть проблема.";
};                       

FUNC int  Org_826_Mordrag_Problem_Condition()
{
	if Thorus_MordragKo == LOG_RUNNING 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Problem_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_00"); //У тебя есть проблема.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_01"); //Да? А у кого их нет?
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_02"); //Есть люди, которые хотят избавиться от тебя.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_03"); //В самом деле? Тогда скажи им, что само по себе их желание не исполнится.
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_04"); //А почему ты уверен, что они не прислали для этого меня?
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_05"); //Потому что ты мне кажешься умным парнем. Ты должен понимать, что есть в колонии более выгодные дела, чем работа на Гомеза.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_06"); //Нам, в Новом Лагере, нужны разумные люди, и там никто не будет тебе приказывать.
};

// **************************************************
//					  NCInfo
// **************************************************

instance  Org_826_Mordrag_NCInfo(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_NCInfo_Condition;
	information	= Org_826_Mordrag_NCInfo_Info;
	permanent	= 0;
	description = "Расскажи мне о Новом Лагере.";
};                       

FUNC int  Org_826_Mordrag_NCInfo_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_NCInfo_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_00"); //Расскажи мне о Новом Лагере.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_01"); //Это самый свободный Лагерь во всей колонии. Никаких Баронов или Гуру - там ты делаешь то, что хочешь.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_02"); //И у нас есть своя шахта. Правда, добытую в ней руду мы не отдаем этому проклятому королю!
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_03"); //И как вы ее используете?
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_04"); //Наши маги разработали план, как можно выбраться отсюда. Мы собираем руду для его осуществления.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_05"); //Вот что я тебе скажу, парень: пока Гомез и его люди бездельничают, мы трудимся во имя свободы!
};

// **************************************************
//					JoinNewcamp
// **************************************************

instance  Org_826_Mordrag_JoinNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_JoinNewcamp_Condition;
	information	= Org_826_Mordrag_JoinNewcamp_Info;
	permanent	= 0;
	description = "А если я захочу присоединиться к Новому Лагерю...";//kцnntest du mir dabei helfen... ZU LANG
};                       

FUNC int  Org_826_Mordrag_JoinNewcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_JoinNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_JoinNewcamp_15_00"); //А если я захочу присоединиться к Новому Лагерю... ты поможешь мне?
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_01"); //Если ты это серьезно, мы можем отправиться туда прямо сейчас. Я отведу тебя к Ларсу - он у нас за главного.
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_02"); //Но если ты по-прежнему хочешь вышвырнуть меня из Лагеря... что ж, давай, действуй!
};


instance  Org_826_Mordrag_GotoNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_GotoNewcamp_Condition;
	information	= Org_826_Mordrag_GotoNewcamp_Info;
	permanent	= 0;
	description = "Мы пойдем в Новый Лагерь.";
};                       

FUNC int  Org_826_Mordrag_GotoNewcamp_Condition()
{
	if (Npc_KnowsInfo(hero,Org_826_Mordrag_JoinNewcamp))
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoNewcamp_15_00"); //Мы пойдем в Новый Лагерь.
	AI_Output (self, other,"Org_826_Mordrag_GotoNewcamp_11_01"); //Хорошо! Иди за мной.
	
	Mordrag_GotoNC_Day = Wld_GetDay();
	
	AI_StopProcessInfos	(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);	// damit hat der Spieler einen Freischlag. Nach dem zweiten wehrt sich Mordrag!
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Мордраг согласился показать мне дорогу в Новый Лагерь. Надеюсь, это не ловушка.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine		(self,"GUIDE");
};

// **************************************************
//				AM NEWCMAP ANGEKOMMEN
// **************************************************

instance  Org_826_Mordrag_AtNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_AtNewcamp_Condition;
	information	= Org_826_Mordrag_AtNewcamp_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_AtNewcamp_Condition()
{
	if 	( Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_07_21") ) 
	{
		self.flags	= 0;
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_AtNewcamp_Info()
{
	if (Mordrag_GotoNC_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_00"); //Ну, вот мы и пришли.
	}
	else
	{
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //Я уж думал, что не дождусь тебя. Неважно - наконец-то мы здесь!
	};
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_01"); //За этими воротами находится Новый Лагерь. Поговори с Ларсом - он поможет тебе. Отдашь ему это кольцо.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_02"); //Понадобится серьезный довод, чтобы Ларс принял тебя. Эта дорогая безделушка будет для тебя пропуском.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_03"); //Подумав, я решил остаться здесь на некоторое время. Я уже заработал достаточно, а в Старом Лагере сейчас становится жарковато.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_04"); //Если понадоблюсь, ты сможешь найти меня в баре - это дом на берегу озера. Береги себя!
	AI_Output (other, self,"Org_826_Mordrag_AtNewcamp_15_05"); //Увидимся!
	
	CreateInvItems  (self, MordragsRing, 1);
	B_GiveInvItems	(self, other, MordragsRing, 1);

	B_GiveXP		(XP_ArrivedWithMordrag);	
	B_LogEntry		(CH1_JoinNC,"Вот мы и стоим перед воротами Нового Лагеря. Мордраг дал мне кольцо, которое я должен передать Ларсу, лидеру воров, если решу присоединиться к этому Лагерю. Сам же Мордраг останется в баре.");
	var C_NPC lares; lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar [AIV_FINDABLE]=TRUE;
	
	MordragKO_StayAtNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
//					AUFS MAUL
// **************************************************

instance  Org_826_Mordrag_Fight (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Fight_Condition;
	information	= Org_826_Mordrag_Fight_Info;
	permanent	= 0;
	description = "В этом Лагере есть место только для одного из нас!";
};                       

FUNC int  Org_826_Mordrag_Fight_Condition()
{
	if ( (Thorus_MordragKo == LOG_RUNNING) && (!Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp)) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Fight_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Fight_15_00"); //В этом Лагере останется только один из нас!
	AI_Output (self, other,"Org_826_Mordrag_Fight_11_01"); //Прошу прощения?
	
	Info_ClearChoices(Org_826_Mordrag_Fight);
	Info_AddChoice   (Org_826_Mordrag_Fight,"Я сказал, выметайся отсюда!",Info_Mordrag_Fight_GetAway);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Здесь нет места тем, кто крадет у Баронов!",Info_Mordrag_Fight_OreBarons);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Меня послал Торус. Он хочет избавиться от тебя раз и навсегда.",Info_Mordrag_Fight_Thorus);
};

FUNC VOID Info_Mordrag_Fight_GetAway()
{
	AI_Output (other, self,"Info_Mordrag_Fight_GetAway_15_00"); //Я сказал, выметайся отсюда!
	AI_Output (self, other,"Info_Mordrag_Fight_GetAway_11_01"); //Большие слова маленького человека...
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_OreBarons()
{
	AI_Output (other, self,"Info_Mordrag_Fight_OreBarons_15_00"); //Здесь нет места тем, кто крадет у Баронов!
	AI_Output (self, other,"Info_Mordrag_Fight_OreBarons_11_01"); //А, так ты об этом! Что же ты сразу не сказал?..
	
	MordragKO_PlayerChoseOreBarons = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_Thorus()
{
	AI_Output (other, self,"Info_Mordrag_Fight_Thorus_15_00"); //Меня послал Торус. Он хочет избавиться от тебя раз и навсегда.
	AI_Output (self, other,"Info_Mordrag_Fight_Thorus_11_01"); //В самом деле? Торус? Х-м, это все, что я хотел знать...
	
	MordragKO_PlayerChoseThorus = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

// **************************************************
//					HauAb
// **************************************************

instance  Org_826_Mordrag_HauAb(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_HauAb_Condition;
	information	= Org_826_Mordrag_HauAb_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_HauAb_Condition()
{
	VAR C_NPC Mordrag;
	Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	
	if (Mordrag.aivar[AIV_WASDEFEATEDBYSC] >= 1)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_HauAb_Info()
{
	AI_Output (other, self,"Org_826_HauAb_GotoNewcamp_15_00"); //Убирайся!..
	
	AI_StopProcessInfos	(self);
	
	MordragKO_HauAb = TRUE;
	
	B_LogEntry    (CH1_MordragKO,"Я хорошенько объяснил Мордрагу, что в Старом Лагере ему появляться не следует.");

	Npc_ExchangeRoutine	(self, "Start");
};
		
// **************************************************
//					GotoKalom
// **************************************************

instance  Org_826_Mordrag_GotoKalom(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalom_Condition;
	information	= Org_826_Mordrag_GotoKalom_Info;
	permanent	= 0;
	description = "У меня послание от Ларса.";
};                       

FUNC int  Org_826_Mordrag_GotoKalom_Condition()
{
	if 	(Npc_GetTrueGuild(other)!=GIL_ORG)
	&&	(Lares_InformMordrag == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalom_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_00"); //У меня послание от Ларса.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_01"); //Говори.
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_02"); //Ларс хочет знать, что происходит в Лагере Сектантов. Он поручил это задание тебе.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_03"); //Мне кажется, все это как-то разрешится само собой...

	B_LogEntry	(CH1_JoinNC,"Я передал Мордрагу слова Ларса. Он что-то пробормотал в ответ. Что-то о том, что все само собой улаживается. Понятия не имею, о чем это он!");
};

// **************************************************
//					GotoKalom - NOW
// **************************************************
	var int Mordrag_GotoKalom;
// **************************************************

instance  Org_826_Mordrag_GotoKalomNOW(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalomNOW_Condition;
	information	= Org_826_Mordrag_GotoKalomNOW_Info;
	permanent	= 0;
	description = "Ларс велел мне помочь тебе в деле сектантов.";
};                       

FUNC int  Org_826_Mordrag_GotoKalomNOW_Condition()
{
	if 	(Npc_GetTrueGuild(other)==GIL_ORG)
	&&	Npc_KnowsInfo(hero,ORG_801_Lares_GotoKalom)
	{
		return TRUE;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalomNOW_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //Ларс велел мне помочь тебе в деле сектантов.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //Видишь... Я знал, что мне не придется заниматься этим самому.
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //Ты хочешь, чтобы я сделал все от начала до конца?
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //Я уверен, ты справишься. Слушай: очень важно выяснить правду в этой истории с Церемонией.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //Я знаю, что  придурки собираются призывать духа. Лично я не верю во все эти россказни о Спящем, но ясно одно:
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //Гуру обладают большой силой. Мы должны знать о том, что происходит. Ты следишь за моей мыслью?

	B_LogEntry			(CH1_GotoPsiCamp,"Мордраг решил предоставить мне возможность заняться разведкой в Болотном Лагере. Гуру готовятся к большой церемонии, но мне нужно узнать больше деталей.");
	B_GiveXP			(XP_AssistMordrag);	
	
	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;
	
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Ты можешь говорить более конкретно?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Посмотрим, что мне удастся сделать.",Org_826_Mordrag_GotoKalomNOW_DoIt);

};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //Ты можешь говорить более конкретно?
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //Пообщайся с Лестером. Однажды я довольно долго жил в Лагере Сектантов, и  тогда он помогал мне. Лестер - наш человек.
	B_LogEntry(CH1_GotoPsiCamp,"Я должен поговорить с Лестером в Лагере Братства. Похоже, ему можно доверять, к тому же он и раньше помогал Мордрагу.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //Посмотрим, что мне удастся сделать.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //Как только ты узнаешь об их планах, немедленно возвращайся.
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	AI_StopProcessInfos	(self);
};

// **************************************************
//					RUNNING
// **************************************************

instance  Org_826_Mordrag_RUNNING (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_RUNNING_Condition;
	information	= Org_826_Mordrag_RUNNING_Info;
	permanent	= 1;
	description = "По поводу сектантов...";
};                       

FUNC int  Org_826_Mordrag_RUNNING_Condition()
{
	if (Mordrag_GotoKalom == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_RUNNING_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_RUNNING_15_00"); //По поводу сектантов...
	AI_Output			(self, other,"Org_826_Mordrag_RUNNING_11_01"); //Что?

	if	(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_04"); //Состоялась Великая Церемония.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_09"); //Да ну?! Ты хочешь сказать, что побывал на этом сборище?
		}
		else
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_06"); //Они попытались укрепить свой дух и призвать Спящего с помощью эликсира, полученного из яиц ползунов.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_07"); //Что за бред! Эти придурки действительно верят во все это, так ведь?
		};
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_10"); //Посмотрим на результат.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_11"); //Верно. Дай знать, когда Гуру закончат выставлять себя идиотами.

		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP			(XP_ReportToMordrag);
		Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_SUCCESS);
		B_LogEntry			(CH1_GotoPsiCamp,"Мордраг чуть от смеха не лопнул, когда я ему рассказал о яйцах ползунов. Похоже, что теперь он окончательно потерял интерес к подглядыванию за Гуру. Будем считать, что дело улажено!");
	}
	else
	{
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_02"); //Пока ничего нового.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_03"); //Займись делом.
	};

/*	
	//SN: Werde nicht gebraucht, da sie nicht zur Kapitel 2-6-Story passen!!!
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_08"); //Ich hab' die Eier bei mir.
		
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_05"); //(sarkastisch) Hab' ich auch gemerkt. Diese verdammten Sektenspinner haben Gomez die alte Mine gekostet. Wird nicht mehr lange dauern, dann stehen seine Gardisten bei UNS vor der Tьr, um sich ihr Erz abzuholen...
*/
};
	
	













	




	
