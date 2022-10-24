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
	AI_Output (self, other,"Org_826_Mordrag_Greet_11_00"); //Эй, новенький! Я Мордраг. Запомни меня. Я продаю всевозможные товары по низкой цене.
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
	description = "Покажи мне свои товары.";
	trade		= 1;
};                       

func int  Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Trade_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Trade_15_00"); //Покажи мне твои товары.
	AI_Output (self, other,"Org_826_Mordrag_Trade_11_01"); //Смотри...
	if	(Mordrag_Traded==0)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,	"Вор Мордраг продает на рыночной площади ворованный товар.");
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
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_02"); //Я бы хотел поговорить с магами. Мне нужно попасть в замок.
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_03"); //Посланники магов носят печать, которая служит пропуском. Ты сможешь получить ее, если станешь одним из нас.
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
	description = "У тебя проблемы.";
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
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_00"); //У тебя проблемы.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_01"); //Правда? А у кого их нет?
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_02"); //Есть люди, которым не нравится твое присутствие здесь. Они хотят избавиться от тебя.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_03"); //Да ты что? Тогда они должны будут подослать ко мне кого-нибудь, иначе ничего не выйдет!
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_04"); //А почему ты уверен, что они никого не присылали? Например, они могли послать меня...
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_05"); //Потому что мне кажется, что ты не похож на убийцу. Ты скоро узнаешь, что в колонии есть более интересные дела, чем работа на Гомеза.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_06"); //У нас в Новом лагере тоже нужны способные люди. А еще там нет никого, кто будет указывать тебе, что можно, а что нельзя.
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
	description = "Расскажи мне что-нибудь о Новом лагере.";
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
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_00"); //Расскажи мне что-нибудь о Новом лагере.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_01"); //В нашем лагере живут свободные люди. Никаких Баронов или Гуру, никаких глупых приказов.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_02"); //У нас есть своя шахта. А еще мы не поставляем добытую руду королю!
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_03"); //А зачем она вам нужна?
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_04"); //Наши маги ищут способ разрушения Барьера. Вот для этого мы и собираем нашу руду.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_05"); //Пока Гомез и его люди слоняются без дела, мы стараемся изо всех сил, чтобы в конце концов получить свободу.
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
	description = "А если я захочу присоединиться к Новому лагерю... ты поможешь мне?";//kцnntest du mir dabei helfen... ZU LANG
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
	AI_Output (other, self,"Org_826_Mordrag_JoinNewcamp_15_00"); //А если я захочу присоединиться к Новому лагерю... ты поможешь мне?
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_01"); //Если ты этого действительно хочешь, мы можем пойти туда прямо сейчас. Я отведу тебя к Ларсу. Он глава нашей шайки.
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_02"); //Но если ты просто хочешь выкинуть меня из лагеря, пожалуйста, попробуй!
};


instance  Org_826_Mordrag_GotoNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_GotoNewcamp_Condition;
	information	= Org_826_Mordrag_GotoNewcamp_Info;
	permanent	= 0;
	description = "Давай пойдем в Новый лагерь!";
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
	AI_Output (other, self,"Org_826_Mordrag_GotoNewcamp_15_00"); //Давай пойдем в Новый лагерь!
	AI_Output (self, other,"Org_826_Mordrag_GotoNewcamp_11_01"); //Хорошо! Иди за мной.
	
	Mordrag_GotoNC_Day = Wld_GetDay();
	
	AI_StopProcessInfos	(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);	// damit hat der Spieler einen Freischlag. Nach dem zweiten wehrt sich Mordrag!
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC, "Мордраг согласился показать мне дорогу в Новый лагерь. Надеюсь, он не подстроит мне ловушку!");

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
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_00"); //Вот мы и на месте.
	}
	else
	{
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //Я думал, что ты уже никогда не придешь. Это уже неважно, мы пришли.
	};
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_01"); //Если пройдешь через эти ворота, то попадешь прямо в Новый лагерь. Поговори с Ларсом. Он поможет тебе. Вот тебе кольцо.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_02"); //Оно будет твоим пропуском к нему. Ларс не станет говорить с первым встречным.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_03"); //Я все обдумал и решил остаться здесь ненадолго. Я достаточно заработал. К тому же, обстановка в Старом лагере понемногу накаляется.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_04"); //Если захочешь меня найти, зайди в бар. Он находится на озере. Увидимся. До встречи!
	AI_Output (other, self,"Org_826_Mordrag_AtNewcamp_15_05"); //Еще увидимся!
	
	CreateInvItems  (self, MordragsRing, 1);
	B_GiveInvItems	(self, other, MordragsRing, 1);

	B_GiveXP		(XP_ArrivedWithMordrag);	
	B_LogEntry		(CH1_JoinNC, "Мы стоим перед воротами в Новый лагерь. Мордраг дал мне кольцо, которое нужно отнести Ларсу, главарю воров. Сам же он ненадолго останется здесь, в лагере.");
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
	description = "В этом лагере останется только один из нас!";
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
	AI_Output (other, self,"Org_826_Mordrag_Fight_15_00"); //В этом лагере останется только один из нас!
	AI_Output (self, other,"Org_826_Mordrag_Fight_11_01"); //Прости, но я не расслышал...
	
	Info_ClearChoices(Org_826_Mordrag_Fight);
	Info_AddChoice   (Org_826_Mordrag_Fight, "Уходи из этого лагеря!" 					,Info_Mordrag_Fight_GetAway);
	Info_AddChoice	 (Org_826_Mordrag_Fight, "Здесь не место для тех, кто ворует вещи Баронов!" 	,Info_Mordrag_Fight_OreBarons);
	Info_AddChoice	 (Org_826_Mordrag_Fight, "Меня прислал Торус. Он больше не хочет тебя здесь видеть." 		,Info_Mordrag_Fight_Thorus);
};

FUNC VOID Info_Mordrag_Fight_GetAway()
{
	AI_Output (other, self,"Info_Mordrag_Fight_GetAway_15_00"); //Уходи из этого лагеря!
	AI_Output (self, other,"Info_Mordrag_Fight_GetAway_11_01"); //Слишком большие слова для такого человечка, как ты...
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_OreBarons()
{
	AI_Output (other, self,"Info_Mordrag_Fight_OreBarons_15_00"); //Здесь не место для тех, кто ворует вещи Баронов!
	AI_Output (self, other,"Info_Mordrag_Fight_OreBarons_11_01"); //А, вот ты о чем! Так бы сразу и сказал...
	
	MordragKO_PlayerChoseOreBarons = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_Thorus()
{
	AI_Output (other, self,"Info_Mordrag_Fight_Thorus_15_00"); //Меня прислал Торус. Он больше не хочет тебя здесь видеть.
	AI_Output (self, other,"Info_Mordrag_Fight_Thorus_11_01"); //Да? Торус? Что ж, ты сказал все, что мне было нужно...
	
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
	AI_Output (other, self,"Org_826_HauAb_GotoNewcamp_15_00"); //Уходи...
	
	AI_StopProcessInfos	(self);
	
	MordragKO_HauAb = TRUE;
	
	B_LogEntry    (CH1_MordragKO,"Я избил Мордрага и сказал ему, что он не должен возвращаться в Старый лагерь.");

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
	description = "Ларс передал тебе послание.";
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
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_00"); //Ларс передал тебе послание.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_01"); //Ну-ка, послушаем.
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_02"); //Он хочет знать, что делается в Лагере сектантов. 
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_03"); //У меня такое чувство, что все это решится само собой...

	B_LogEntry	(CH1_JoinNC,	"Я передал Мордрагу то, что сказал мне Ларс. Он что-то говорил о том, что дело будет улажено само. Не знаю, что он имел в виду!");
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
	description = "Ларс сказал, чтобы я помог тебе с сектантами.";
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
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //Ларс сказал, чтобы я помог тебе с сектантами.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //Вот видишь... Я знал, что мне не придется идти туда самому.
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //Так я должен буду делать все сам?
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //Думаю, у тебя все получится. Слушай внимательно: тебе нужно узнать, кого они там хотят пробудить.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //Я знаю, что эти сектанты хотят провести какую-то церемонию. Лично я не верю ни в какого Спящего, но одно я знаю точно:
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //Гуру очень хорошие маги. И было бы лучше, если бы мы знали, что у них происходит. Тебе все понятно?

	B_LogEntry			(CH1_GotoPsiCamp,	"Мордраг послал меня в Болотный лагерь разбираться с заданием. Гуру готовят какую-то церемонию, но что это будет, придется выяснить на месте.");
	B_GiveXP			(XP_AssistMordrag);	
	
	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;
	
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Ты можешь говорить яснее?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Я посмотрю, что тут можно сделать.",Org_826_Mordrag_GotoKalomNOW_DoIt);

};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //Ты можешь говорить яснее?
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //Поговори с Лестером. Я некоторое время жил в Лагере сектантов, и он помогал мне тогда. Он хороший человек.
	B_LogEntry(CH1_GotoPsiCamp,	"В лагере Братства я должен поговорить с послушником по имени Лестер. По словам Мордрага он помогал ему, когда тот жил в Болотном лагере. Кажется, ему можно доверять.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //Я посмотрю, что тут можно сделать.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //Как только ты узнаешь что-нибудь ценное, возвращайся к нам.
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
	description = "Я узнал кое-что о сектантах...";
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
	AI_Output			(other, self,"Org_826_Mordrag_RUNNING_15_00"); //Я узнал кое-что о сектантах...
	AI_Output			(self, other,"Org_826_Mordrag_RUNNING_11_01"); //Ну, узнал что-нибудь?

	if	(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_04"); //Они провели Великую Церемонию.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_09"); //Не может быть! Ты был там вместе с этими помешанными?
		}
		else
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_06"); //Да. Они увеличили свою духовную силу с помощью одного зелья, приготовленного из яиц ползунов, и попытались призвать Спящего.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_07"); //Смешнее я еще ничего не слышал! Так они во все это верят, да?
		};
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_10"); //Хотелось бы посмотреть, что из этого выйдет.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_11"); //Мне тоже. Расскажешь, когда эти хваленые Гуру вконец опозорятся.

		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP			(XP_ReportToMordrag);
		Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_SUCCESS);
		B_LogEntry			(CH1_GotoPsiCamp,	"Мордраг смеялся как никогда, слушая мои приключения с ползунами из шахты. Кажется, его больше не интересуют дела Братства. Я сказал, что выполнил свое задание!");
	}
	else
	{
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_02"); //Я пока не смог ничего разузнать.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_03"); //Так займись делом...
	};

/*	
	//SN: Werde nicht gebraucht, da sie nicht zur Kapitel 2-6-Story passen!!!
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_08"); //Ich hab' die Eier bei mir.
		
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_05"); //(sarkastisch) Hab' ich auch gemerkt. Diese verdammten Sektenspinner haben Gomez die alte Mine gekostet. Wird nicht mehr lange dauern, dann stehen seine Gardisten bei UNS vor der Tьr, um sich ihr Erz abzuholen...
*/
};
	
	













	




	
