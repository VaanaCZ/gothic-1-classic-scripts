var int Diego_After_Gamestart;

// ************************************************************
// 							GAMESTART
// ************************************************************

INSTANCE Info_Diego_Gamestart (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Gamestart_Condition;
	information	= Info_Diego_Gamestart_Info;
	permanent	= 0;
	important	= 1;
	//description = "(Startsatz: zum Goldmaster wieder zu Important-Info machen !!!)";
};                       

FUNC INT Info_Diego_Gamestart_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Gamestart_Info()
{
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //Меня зовут Диего.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //Я...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //Я не хочу знать, кто ты такой. Ты только что появился здесь. Я присматриваю за новичками. Это все.
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //Если ты хочешь пожить еще немного, тебе придется поговорить со мной. Но конечно, я не собираюсь мешать тебе покончить с собой. Так что ты думаешь?
	
	B_Kapitelwechsel(1); //WICHTIG!!!
};

// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Diego_EXIT_Gamestart(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Gamestart_Condition;
	information	= Info_Diego_EXIT_Gamestart_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Gamestart_Condition()
{
	return 1;
};

FUNC VOID Info_Diego_EXIT_Gamestart_Info()
{
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00"); //Я благодарю тебя за помощь.
	
	if (!Npc_KnowsInfo (hero, Info_Diego_Kolonie)) 
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //Это твое решение. Рад был познакомиться.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02"); //Мы встретимся в Старом Лагере.
	};

	AI_StopProcessInfos	(self);
	
	if (Kapitel < 2)
	{
		Npc_ExchangeRoutine	(self, "Start");
		Diego_After_Gamestart = TRUE;
	};
};

// -------------------------------------------------------------

INSTANCE Info_Diego_EXIT_Later(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Later_Condition;
	information	= Info_Diego_EXIT_Later_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Later_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_EXIT_Gamestart)) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_EXIT_Later_Info()
{	
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Diego_EXIT_11_01"); //Идем.
	}
	else
	{
	 	AI_Output	(hero,self,"Info_Diego_EXIT_15_00"); //Береги себя.
	};
	
	AI_StopProcessInfos	(self);
};

// *************************************************************
// 							 BRIEF 
// *************************************************************

INSTANCE Info_Diego_Brief (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Brief_Condition;
	information	= Info_Diego_Brief_Info;
	permanent	= 0;
	description = "У меня есть письмо Верховному Магу Круга Огня.";
};                       

FUNC INT Info_Diego_Brief_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Brief_Info()
{
	AI_Output(hero,self,"Info_Diego_Brief_15_00"); //У меня есть письмо Верховному Магу Круга Огня.
	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //Правда...?
	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //Его отдал мне какой-то маг, перед тем как стражники сбросили меня со скалы.
	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //Тебе повезло, что больше я не могу показываться на глаза магам. Любой другой с радостью перерезал бы тебе глотку за это письмо.
	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //Маги хорошо платят своим гонцам, а большинство людей здесь не имеет за душой и гроша.
	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //На твоем месте я бы держал рот на замке до тех пор, пока не встретил бы кого-нибудь из магов. Правда, тебе на это не стоит надеяться.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//Почему?
	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //Маги живут в Старом Лагере, но только людям Гомеза дозволено входить в их замок.
};

// **********************************************************
// 					SCHUTZ UND LAGER
// **********************************************************
 
INSTANCE Info_Diego_WarumGeholfen (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_WarumGeholfen_Condition;
	information	= Info_Diego_WarumGeholfen_Info;
	permanent	= 0;
	description = "Почему ты помогаешь мне?";
};                       

FUNC INT Info_Diego_WarumGeholfen_Condition()
{
	if	(!Diego_After_Gamestart)
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WarumGeholfen_Info()
{
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //Почему ты помогаешь мне?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //Потому что тебе нужна была моя помощь. Буллит со своими парнями мог запросто убить тебя.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //А я не мог просто стоять в стороне и смотреть. Я проделал этот долгий путь для того, чтобы сделать тебе одно предложение.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //Предложение?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //Да. Я думаю, после знакомства с шайкой Буллита ты понял, что тебе нужна защита.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //Каждый, кто попадает сюда, имеет выбор. В колонии есть три Лагеря, и ты должен будешь присоединиться к одному из них. 
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //Я здесь для того, чтобы показать новичкам, что Старый Лагерь - лучшее место для них.
};

// -------------------------------------------------------------

INSTANCE Info_Diego_Bullit (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_Bullit_Condition;
	information	= Info_Diego_Bullit_Info;
	permanent	= 0;
	description = "А где сейчас Буллит?";
};                       

FUNC INT Info_Diego_Bullit_Condition()
{
	if ( Npc_KnowsInfo (hero, Info_Diego_WarumGeholfen) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Bullit_Info()
{
	AI_Output(hero,self,"Info_Diego_Bullit_15_02"); //А где сейчас Буллит?
	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //Вместе с остальными тащит припасы из внешнего мира в Лагерь. Ты встретишь его там.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //Но если ты хочешь сразиться с ним, будь осторожен. Буллит - неплохой боец.
};


// ************************************************************
// 							Kolonie
// ************************************************************

INSTANCE Info_Diego_Kolonie (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Kolonie_Condition;
	information	= Info_Diego_Kolonie_Info;
	permanent	= 0;
	description = "Хорошо, что я должен узнать об этом месте?";
};                       

FUNC INT Info_Diego_Kolonie_Condition()
{
	if	(Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Kolonie_Info()
{
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //Хорошо, что я должен узнать об этом месте?
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //Мы называем его колонией. Ты уже знаешь, что мы добываем руду для короля. 
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //По крайней мере, в Старом Лагере...
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //Внутри Барьера есть три Лагеря. Старый Лагерь - самый большой. Он был первым.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_Barriere (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_Barriere_Condition;
	information	= Info_Diego_Barriere_Info;
	permanent	= 0;
	description = "Расскажи мне про Барьер.";
};                       

FUNC INT Info_Diego_Barriere_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Barriere_Info()
{
	AI_Output(hero,self,"Info_Diego_Barriere_15_00"); //Расскажи мне про Барьер.
	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //Тут нечего рассказывать. Для людей он непроницаем.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //И что будет, если я просто попробую уйти отсюда?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //Последний, кто пытался выбраться наружу, очень быстро превратился в покойника. Эта чертова штуковина легко впускает тебя внутрь и держит тебя здесь до конца твоих дней.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //Если есть способ выбраться наружу, я найду его.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //Ты уже торопишься убраться отсюда, а? А ведь ты только что прибыл!
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OtherCamps (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 2;
	condition	= Info_Diego_OtherCamps_Condition;
	information	= Info_Diego_OtherCamps_Info;
	permanent	= 0;
	description = "А другие два Лагеря?";
};                       

FUNC INT Info_Diego_OtherCamps_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OtherCamps_Info()
{
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //А другие два Лагеря?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //Они разделились, пытаясь осуществить свои безумные планы побега.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //Новый Лагерь находится в западной части колонии. Они думают, что смогут просто взорвать Барьер, если соберут достаточно много руды.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //Есть еще секта безумцев на востоке. Они выстроили Лагерь посреди болота и молятся своему идолу, чтобы он освободил их.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //Пока он им ничем не помог.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //На твоем месте я бы не стал тратить время на этих сумасбродов.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OldCamp (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_OldCamp_Condition;
	information	= Info_Diego_OldCamp_Info;
	permanent	= 0;
	description = "Расскажи мне о Старом Лагере.";
};                       

FUNC INT Info_Diego_OldCamp_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OldCamp_Info()
{
	AI_Output(hero,self,"Info_Diego_OldCamp_15_00"); //Расскажи мне о Старом Лагере.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //Это самый большой и сильный из трех Лагерей. Гомез и его люди контролируют Старый Лагерь - а значит и все поставки руды.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //Раз в месяц король присылает нам все, что мы ни попросим. Мы держим старика в кулаке, понятно?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //Он присылает нам вино, хлеб, мясо, оружие... все.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{ 
	AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //Ты тоже можешь рассчитывать на часть добычи. Все что тебе нужно - это присоединиться к людям Гомеза.
	};
};

// ************************************************************
// 							Gomez Leute
// ************************************************************

INSTANCE Info_Diego_WhosGomez (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_WhosGomez_Condition;
	information	= Info_Diego_WhosGomez_Info;
	permanent	= 0;
	description = "Кто такой Гомез?";
};                       

FUNC INT Info_Diego_WhosGomez_Condition()
{
	if ( Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhosGomez_Info()
{
	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00"); //Кто такой Гомез?
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //Гомез - самый влиятельный из Баронов. Он правит Старым Лагерем на правах самого сильного человека в колонии.
};	

// ************************************************************
// 							JOIN OC
// ************************************************************

INSTANCE Info_Diego_JoinOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_JoinOldcamp_Condition;
	information	= Info_Diego_JoinOldcamp_Info;
	permanent	= 0;
	description = "Предположим, я хочу стать одним из его людей.";
};                       

FUNC INT Info_Diego_JoinOldcamp_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief))
	&&	!C_NpcBelongsToOldCamp(hero)
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_JoinOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //Предположим, я хочу стать одним из его людей. Что мне нужно делать?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //Возле ворот замка ты найдешь человека по имени Торус. Скажи ему, что тебя послал Диего.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
	
	Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC, LOG_RUNNING);
	B_LogEntry( CH1_JoinOC,"Чтобы присоединиться к людям Гомеза в Старом Лагере, мне нужно увидеться с Торусом.");
};	

// ************************************************************
// 						Weg zum Alten Lager
// ************************************************************

INSTANCE Info_Diego_WayToOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WayToOldcamp_Condition;
	information	= Info_Diego_WayToOldcamp_Info;
	permanent	= 0;
	description = "Как добраться до Старого Лагеря?";
};                       

FUNC INT Info_Diego_WayToOldcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Kolonie) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WayToOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //Как добраться до Старого Лагеря?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //Дорога выведет тебя сама. Старый Лагерь - ближайшее поселение, которое встретится тебе на пути.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //На подступах к Лагерю бродит немало диких тварей. Нужно быть безумцем, чтобы разгуливать окрест без оружия.
};
	
// ************************************************************
// 							Wo Waffe
// ************************************************************

INSTANCE Info_Diego_WoWaffe (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WoWaffe_Condition;
	information	= Info_Diego_WoWaffe_Info;
	permanent	= 0;
	description = "А где мне взять оружие?";
};                       

FUNC INT Info_Diego_WoWaffe_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_WayToOldcamp) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WoWaffe_Info()
{
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //А где мне взять оружие?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //Когда доберешься до Старой Шахты, внимательно посмотри вокруг. Уверен, ты найдешь что-нибудь полезное.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //Шахту легко найти - она находится в двух десятках шагов отсюда. 
};

// ************************************************************
// 						Mit Thorus geredet
// ************************************************************

INSTANCE Info_Diego_ThorusSays(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_ThorusSays_Condition;
	information	= Info_Diego_ThorusSays_Info;
	permanent	= 0;
	description = "Я поговорил с Торусом.";
};                       

FUNC INT Info_Diego_ThorusSays_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Thorus_DiegoSentMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_ThorusSays_Info()
{
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00"); //Я поговорил с Торусом.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //И что он сказал?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //Он сказал, что если ТЫ дашь свое согласие, я смогу присоединиться к Старому Лагерю.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //Похоже, я нашел себе новую работенку.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //Мы можем начать прямо сейчас?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05"); //Прежде всего тебе нужно кое-что понять.
};

// ************************************************************
// 						Aufnahme - Regeln
// ************************************************************

INSTANCE Info_Diego_Rules(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Rules_Condition;
	information	= Info_Diego_Rules_Info;
	permanent	= 0;
	description = "Что нужно знать, для того чтобы присоединиться в вашему Лагерю?";
};                       

FUNC INT Info_Diego_Rules_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_ThorusSays) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Rules_Info()
{
	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //Что нужно знать, для того чтобы присоединиться в вашему Лагерю?
	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //Если хочешь стать одним из нас, прежде всего ты должен показать себя полезным.
	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //Во Внешнем Кольце есть несколько очень влиятельных людей - в основном, Призраки. Если сумеешь произвести на них впечатление - считай, полдела сделано.
	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //Затем тебя ждет испытание веры: ты должен будешь доказать, что искренне предан этому Лагерю.
	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //Помимо этого, новичкам приходится многому учиться. Чем больше ты будешь знать, тем ценнее ты будешь для нашего Лагеря.
	
	B_LogEntry( CH1_JoinOC,"Чтобы мне позволили присоединиться, мне нужно произвести впечатление на людей из внешнего круга и пройти испытание на верность Диего.");
};

// ************************************************************
// 						Wo wichtige Leute
// ************************************************************

INSTANCE Info_Diego_Celebs(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Celebs_Condition;
	information	= Info_Diego_Celebs_Info;
	permanent	= 0;
	description = "Где искать этих влиятельных людей?";
};                       

FUNC INT Info_Diego_Celebs_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Celebs_Info()
{
	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //Где искать этих влиятельных людей?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //Ну, одного из них ты видишь перед собой. Есть еще Торус... Ты его уже знаешь.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //Что до остальных... Их тебе придется поискать самому. Если ты не сможешь справиться с этим, то тебе нечего делать среди нас.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //Погуляй по Внешнему Кольцу, поговори с людьми, и ты поймешь, кто есть кто.
};

// ************************************************************
// 							Wo Lehrer
// ************************************************************

INSTANCE Info_Diego_Teachers(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Teachers_Condition;
	information	= Info_Diego_Teachers_Info;
	permanent	= 0;
	description = "Кто может стать моим наставником?";
};                       

FUNC INT Info_Diego_Teachers_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teachers_Info()
{
	AI_Output		(hero,self,"Info_Diego_Teachers_15_00"); //Кто может стать моим наставником?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_01"); //Начни с Фингерса. Он у нас самый опытный.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_02"); //А потом, если посмотришь по сторонам, увидишь, что многие могут тебя чему-нибудь научить.
	AI_Output		(hero,self,"Info_Diego_Teachers_15_03"); //Где живет Фингерс?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_04"); //О, его дом надежно укрыт от посторонних глаз. Дом Фингерса находится у стены замка. Начни отсюда и иди по направлению к арене.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_05"); //Когда окажешься у ворот, поверни налево и спускайся вниз по направлению к арене.

	if	(Fingers_CanTeach == FALSE)
	{
		Log_CreateTopic (GE_TeacherOC,	LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Фингерс может обучить карманным кражам и вскрыванию замков. Он живет в доме у арены, слегка на отшибе, у стены замка.");
	};
};

// ************************************************************
// 							DIEGO = Lehrer
// ************************************************************
	var int Diego_Merke_STR;
	var int Diego_Merke_DEX;
// ************************************************************

INSTANCE Info_Diego_Teach(C_INFO)
{
	npc			= PC_Thief;
	nr			= 100;
	condition	= Info_Diego_Teach_Condition;
	information	= Info_Diego_Teach_Info;
	permanent	= 1;
	description = "Ты можешь чему-нибудь научить меня?";
};                       

FUNC INT Info_Diego_Teach_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Teachers) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teach_Info()
{	
	if	(log_diegotrain == FALSE)
	{	
		Log_CreateTopic (GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Диего может помочь мне стать сильнее и гораздо более ловким.");
		log_diegotrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //А ты можешь меня чему-нибудь научить?
	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //Да. Я могу показать тебе, как увеличить силу или повысить ловкость.
	
	Diego_Merke_STR = hero.attribute[ATR_STRENGTH];
	Diego_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
	
	
};

func void Info_Diego_Teach_BACK()
{
	if (Diego_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //Видишь - ты стал намного сильнее.
	};
	if (Diego_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //Теперь ты будешь точнее стрелять из лука и арбалета.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Возвращайся скорее - тебе еще многому предстоит научиться!
	Info_ClearChoices	(Info_Diego_Teach);
};

func void Info_Diego_Teach_STR_1()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_STR_5()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_1()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_5()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

// ************************************************************
// 							BRING LIST
// ************************************************************

VAR INT Diego_BringList; //MISSIONSVARIABLE

// ----------------------------- OFFER -------------------------------------

INSTANCE Info_Diego_BringList_Offer (C_INFO)
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_BringList_Offer_Condition;
	information	= Info_Diego_BringList_Offer_Info;
	permanent	= 0;
	description = "Что такое испытание веры?";
};                       

FUNC INT Info_Diego_BringList_Offer_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Offer_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_00"); //Что такое испытание веры?
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_01"); //Ты должен отправиться в Старую Шахту. Там ты встретишь одного парня, его зовут Ян. Он даст тебе список.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_02"); //Это очень важная бумага - список всех припасов, которые нужны для нормальной работы шахты.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_03"); //Рудокопы получат их со следующим караваном.
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_04"); //Без проблем!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_05"); //Нет, проблема все-таки есть. Этот список не должен попасть в руки бандитов из Нового Лагеря!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_06"); //Как я уже говорил, это очень важно. Если ты хорошо справишься, тогда мы пойдем дальше.
	
	Diego_BringList = LOG_RUNNING;
    
    Log_CreateTopic (CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus(CH1_BringList,LOG_RUNNING);
    B_LogEntry    (CH1_BringList,"Диего послал меня в Старую Шахту. Я должен забрать список у парня по имени Ян. Эта бумага не должна попасть в руки Нового Лагеря.");
    
	VAR C_NPC Ian; Ian = Hlp_GetNpc (STT_301_IAN);	
	CreateInvItem (STT_301_IAN, TheList);
};
	
// -------------------------------------------------------------------------------

INSTANCE Info_Diego_IanPassword (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_IanPassword_Condition;
	information	= Info_Diego_IanPassword_Info;
	permanent	= 0;
	description = "Если этот список настолько важен, почему Ян отдаст его МНЕ?";
};                       

FUNC INT Info_Diego_IanPassword_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_IanPassword_Info()
{
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_01"); //Если этот список настолько важен, почему ты думаешь, что Ян отдаст его МНЕ?
	AI_Output (self, hero,"Info_Diego_IanPassword_Info_11_02"); //Потому что ты скажешь ему, что тебя прислал Диего.
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_03"); //Я скажу.
	
	B_LogEntry    (CH1_BringList,"Ян отдаст мне список, если я скажу ему, что меня послал Диего.");
};

// ----------------------------------------------------------------------------------

INSTANCE Info_Diego_MapToOldMine (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_MapToOldMine_Condition;
	information	= Info_Diego_MapToOldMine_Info;
	permanent	= 0;
	description = "Где находится Старая Шахта? ";
};                       

FUNC INT Info_Diego_MapToOldMine_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_MapToOldMine_Info()
{
	AI_Output (hero, self,"Info_Diego_MapToOldMine_Info_15_00"); //Где находится Старая Шахта? 
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_01"); //Зайди к Грехэму. Он у нас занимается картами. Скажи, что я послал тебя и что тебе нужна карта. На ней ты найдешь путь к шахте.
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_02"); //Он живет слева от северных ворот.
	
	B_LogEntry    (CH1_BringList,"Грехэм даст мне карту. Я могу найти его слева от северных ворот.");
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_Diego_BringList_Success (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_BringList_Success_Condition;
	information	= Info_Diego_BringList_Success_Info;
	permanent	= 0;
	description = "Я получил список от Яна.";
};                       

FUNC INT Info_Diego_BringList_Success_Condition()
{
	if ( (Diego_BringList == LOG_RUNNING) && (Npc_HasItems(hero,TheList) || Npc_HasItems(hero,TheListNC)))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Success_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Success_15_00"); //Я получил список от Яна.
		
	if	Npc_HasItems(hero,TheList)
	{
		B_GiveInvItems	(hero, self, TheList, 1);
		B_LogEntry    	(CH1_BringList,"Диего был просто счастлив, когда я дал ему список Яна.");
	}
	else if	Npc_HasItems(hero,TheListNC)
	{
		B_GiveInvItems	(hero, self, TheListNC, 1);
		B_LogEntry    	(CH1_BringList,"Диего был очень доволен, когда я дал ему список Яна. Похоже, он не заметил подделки Ларса… Хотя… Что это за странный блеск был в его глазах?");
	};
	B_UseFakeScroll();
	
	AI_Output (self, hero,"Info_Diego_BringList_Success_11_01"); //Отлично! Ты хорошо начал, парень!

	Diego_BringList = LOG_SUCCESS;
	B_GiveXP(XP_DiegoBringlist);
	
	Log_SetTopicStatus 		(CH1_BringList,LOG_SUCCESS);
	
	Points_OC = Points_OC + 5;
};

// ************************************************************
// 						Punktewertung
// ************************************************************
	var int Diego_GomezAudience;
// ************************************************************

INSTANCE Info_Diego_JoinAnalyze(C_INFO) 
{
	npc			= PC_Thief;
	nr			= 800;
	condition	= Info_Diego_JoinAnalyze_Condition;
	information	= Info_Diego_JoinAnalyze_Info;
	permanent	= 1;
	description = "Что говорят обо мне в Лагере?";
};                       

FUNC INT Info_Diego_JoinAnalyze_Condition()
{
	if	Npc_KnowsInfo(hero,Info_Diego_Rules)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_JoinAnalyze_Info()
{	
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_00"); //Что говорят обо мне в Лагере?
	AI_Output(self, hero,"Info_Diego_JoinAnalyze_11_01"); //Ну, я поговорил с несколькими людьми...
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_02"); //И?
	// -----------------------------------------------------------
	Points_OC = 0;
	// -----------------------------------------------------------
	if (Scatty_ChargeKirgo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01"); //Скатти сказал, что ты победил Кирго.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKirgo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //Скатти сказал, что Кирго побил тебя. Кажется, он был слегка разочарован.
		Points_OC = Points_OC - 1;
	}
	else if (Scatty_ChargeKirgo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //Скатти сказал, что он хочет посмотреть, сможешь ли ты потягаться с Кирго.
	};
	
	if (Scatty_ChargeKharim == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //Но ему понравилось то, что ты не побоялся драться с Харимом - пусть даже ты и проиграл.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKharim == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //Но он был в полном восторге от того, что тебе удалось победить Харима. Он только об этом и говорит. 
		Points_OC = Points_OC + 5;
	}
	else if (Scatty_ChargeKharim == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //И он очень хочет посмотреть, как ты будешь драться с Харимом.
	};
	// -----------------------------------------------------------
	if (Whistler_BuyMySword == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //Уистлер рассказал мне о Фиске... Знаешь, на твоем месте я бы забрал руду и смотался. Но как бы то ни было, теперь он о тебе очень высокого мнения.
		Points_OC = Points_OC + 3;
	}
	else if ( (Whistler_BuyMySword == LOG_FAILED) || ( (Whistler_BuyMySword==LOG_RUNNING)&&(Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) ) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //Я поговорил с Уистлером. Ты спер у него руду, наглец! Должен признать, что в храбрости тебе не откажешь!
		Points_OC = Points_OC + 2;
	}
	else if (Whistler_BuyMySword == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //Уистлер все еще ждет свой меч. Тебе стоит побыстрее решить, хочешь ты отдавать его или нет, в противном случае он наверняка подумает, что ты попросту смотался с его рудой!
		
	};
	// -----------------------------------------------------------
	if (Sly_LostNek == LOG_SUCCESS)			
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //Слай рассказал мне, что ты нашел Нека. Похоже, он тобой доволен.
		Points_OC = Points_OC + 4;
	}
	else if (Sly_LostNek == LOG_RUNNING)					
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //Мне кажется, Слай неправ насчет Нека. Конечно, этот парень был настоящей занозой в заднице, но все же я не думаю, что он перешел в Новый Лагерь.
	};
	// -----------------------------------------------------------
	if (Fingers_Learnt == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //Я уже посылал тебя к Фингерсу - он действительно может тебя чему-нибудь научить!
	}
	else if (Fingers_Learnt == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //Фингерс рассказал мне, что ты уже кое-чему научился, но он считает, что тебе еще нужно оттачивать свои навыки.
		Points_OC = Points_OC + 3;
	};
	// -----------------------------------------------------------
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //Я должен поговорить с Дексером. Он использует тебя для своих собственных нужд.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //С другой стороны, касательно испытания нет никаких правил. Если ты справишься с ЭТИМ заданием, это будет большим шагом вперед.
		
	}
	else if (Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //Ты действительно сумел добыть этот рецепт у Кор Галома! Декстер удивлен, да и я тоже. Молодец!
		Points_OC = Points_OC + 5;
	};
	// -----------------------------------------------------------
	if (Thorus_MordragKo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //По поводу Мордрага - то еще дельце. Он не такой уж плохой воин. Тебе нужно тренироваться, если ты действительно хочешь победить его.
	}
	else if (Thorus_MordragKo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //Торус сказал, что нам нужны такие, как ты. Это хороший знак.
		Points_OC = Points_OC + 5;
	}
	else if (Thorus_MordragKo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //Торус чуть не лопнул от ярости. Как ты умудрился провалить ТАКОЕ дело?!
		Points_OC = Points_OC - 5;						
	}
	// ----WEITER-------------------------------------------------------
	if (Fisk_GetNewHehler == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //Фиск сказал мне, что ты его удивил. В любом случае, он будет на твоей стороне.
		Points_OC = Points_OC + 5;
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //Сам понимаешь, Фиск теперь от тебя не в восторге. На твоем месте я бы быстренько подыскал кого-нибудь на замену Мордрагу.
	};
	// -----------------------------------------------------------
	if (points_oc > 15)// runtergesetzt!! // Bei 20 + BringList = Aufnahme
	{
		AI_Output (self, hero,"Info_Diego_Points_11_00"); //Многие в этом Лагере уже готовы поддержать тебя.
		
		if hero.level >= 5
		{
			if (Diego_BringList == LOG_SUCCESS)
			{
				AI_Output (self, hero,"Info_Diego_Points_11_01"); //И ты выдержал испытание. Иди к Торусу. Я уже все ему рассказал. Он пропустит тебя к Гомезу.
				Diego_GomezAudience = TRUE;
				
				Log_SetTopicStatus(CH1_JoinOC, LOG_SUCCESS);
				B_LogEntry(CH1_JoinOC,"Диего устроил мне аудиенцию у Гомеза. Теперь я могу стать человеком Гомеза и входить в замок. Надо только сначала поговорить с Торусом.");
			}
			else
			{
				AI_Output (self, hero,"Info_Diego_Points_11_02"); //Но тебе еще нужно пройти испытание.
			};
		}
		else
		{
			B_PrintGuildCondition(5);
		};
	}
	else if (points_oc > 10)
	{
		AI_Output (self, hero,"Info_Diego_Points_11_10"); //В итоге можно сказать, не так уж плохо для новичка.
	}
	else if points_oc >= 0
	{
		AI_Output (self, hero,"Info_Diego_Points_11_20"); //Займись делом! Тебе еще многое нужно успеть, если ты хочешь добиться чего-нибудь в этом Лагере.
	};
	/*else
	{
		AI_Output (self, hero,"Info_Diego_Points_11_30"); //Machst du Witze, Kleiner? Kein Schwein kennt dich hier!
	};*/
};

/*
	Scatty: 	Scatty_ChargeKirgo == LOG_SUCCESS 	+2
				Scatty_ChargeKirgo == LOG_FAILED 	-1
				Scatty_ChargeKharim == LOG_SUCCESS 	+5
				Scatty_ChargeKharim == LOG_FAILED 	+2
			
	Whistler: 	Whistler_BuyMySword = LOG_SUCCESS;	+3
				Whistler_BuyMySword = LOG_FAILED;	+2
				
	Sly: 		Sly_LostNek = LOG_SUCCESS;			+4
	
	Fingers: 	Fingers_Learnt = LOG_SUCCESS; 		+3
	
	Dexter: 	Dexter_GetKalomsRecipe = LOG_SUCCESS; +5
	
	Thorus: 	Thorus_MordragKo = LOG_SUCCESS;		+5
				Thorus_MordragKo = LOG_FAILED;		-5
	
				VAR INT MordragKO_PlayerChoseOreBarons;
				VAR INT MordragKO_PlayerChoseThorus;
				VAR INT MordragKO_HauAb;
				var int MordragKO_StayAtNC;
	
	Fisk: 		Fisk_GetNewHehler = LOG_SUCCESS; // else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	
	//--- EXTRA Bedingung ------
	
	Diego: 		Diego_BringList = LOG_SUCCESS;		
*/


INSTANCE Info_Diego_WhatToSayToGomez (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_WhatToSayToGomez_Condition;
	information	= Info_Diego_WhatToSayToGomez_Info;
	permanent	= 0;
	description = "Что мне говорить, когда я встречусь с Гомезом?";
};                       

FUNC INT Info_Diego_WhatToSayToGomez_Condition()
{
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhatToSayToGomez_Info()
{
	AI_Output (hero, self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //Что мне говорить, когда я встречусь с Гомезом?
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //В своих решениях Гомез руководствуется инстинктом. Он такие вещи чувствует. Посмотрит на твою физиономию и решит, принимать тебя или нет. 
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //Дальше ты будешь действовать сам, так что соберись. Удачи тебе!
};





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################
//***************************************************************************
//	Info ARMOR
//***************************************************************************
instance  PC_Thief_ARMOR (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_ARMOR_Condition;
	information		= PC_Thief_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_DiegoHeavyShadows,VALUE_STT_ARMOR_H); 
};

FUNC int  PC_Thief_ARMOR_Condition()
{	
	if  ( Npc_GetTrueGuild (hero) == GIL_STT)
	&&  (! Npc_HasItems(hero,STT_ARMOR_H))
	{
		return TRUE;
	};

};
FUNC void  PC_Thief_ARMOR_Info()
{
	
	if (Npc_HasItems (hero,ItMinugget) >= VALUE_STT_ARMOR_H)
	{
		AI_Output			(hero, self,"PC_Thief_ARMOR_Info_15_01"); //А я могу получить такие же доспехи, как у тебя?
		AI_Output			(self, hero,"PC_Thief_ARMOR_Info_11_02"); //А руды у тебя хватит?

		CreateInvItem 		(hero,			STT_ARMOR_H);
		B_GiveInvItems		(hero, self,	ItMinugget,	VALUE_STT_ARMOR_H);
		
		//hier nur ein Text fьr die Bildschirmausgabe
		CreateInvItem		(self, 			ItAmArrow);
		B_GiveInvItems		(self, hero,	ItAmArrow,	1);
		Npc_RemoveInvItem	(hero,			ItAmArrow);
	}
	else
	{
		AI_Output (self, hero,"PC_Thief_ARMOR_Info_11_03"); //Будет руда - будут и доспехи.
	};
};  





//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//----------------------------------------------------------------
// Die Troll Situation
//----------------------------------------------------------------
instance PC_Thief_MEETAGAIN (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_MEETAGAIN_Condition;
	information		= PC_Thief_MEETAGAIN_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_MEETAGAIN_Condition()
{	
	if (Kapitel == 3)
	&& (Npc_GetDistToWP (self,"OW_PATH_190") < 700 )
	{
		return TRUE;
	};
};
func void  PC_Thief_MEETAGAIN_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_00"); //Эй, я уж не надеялся увидеть тебя живым.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_01"); //Порой я и сам уже не надеялся.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_02"); //Много чего произошло с тех пор, как мы виделись в последний раз. Я слышал, ты внес большой вклад в последнюю Церемонию.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_03"); //Все-то ты знаешь.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_04"); //Даже больше, чем ты думаешь... Теперь ты ищешь юнитор?
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_05"); //Да. Один из них должен быть где-то здесь.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_06"); //Я знаю, где его искать. Но есть одна проблема.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_07"); //Понятно. Сколько ты хочешь?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_08"); //Не зря я тебя учил. Но сейчас дело не в этом.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_09"); //Не в этом? Так в чем же тогда проблема?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_10"); //Проблема тонны на три весом.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_11"); //Идем. Ты сам все увидишь.

 	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"GuideTroll");

	Log_CreateTopic		(CH3_TrollCanyon,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_RUNNING);
	B_LogEntry		(CH3_TrollCanyon,"Когда я подходил к месту юнитора на севере, то  неожиданно столкнулся с Диего. Он предупредил, что в конце каньона меня поджидает большой сюрприз.");
	B_LogEntry		(CH3_TrollCanyon,"Он как-то разузнал о моей деятельности в Болотном Лагере, а заодно и о поисках юнитора. Дальше мы пойдем вместе.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info SHOWFOCUS
//---------------------------------------------------------------------
instance PC_Thief_SHOWFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_SHOWFOCUS_Condition;
	information		= PC_Thief_SHOWFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_SHOWFOCUS_Condition()
{	
	if (Npc_KnowsInfo   (hero,PC_Thief_MEETAGAIN))
	&& (Npc_GetDistToWP (self,"LOCATION_12_01") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_SHOWFOCUS_Info()
{	
	AI_GotoNpc(self,hero);
	//AI_PointAt (self, );
	//AI_StopPointAt (self);
	
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //По левую сторону ущелья расположен вход в пещеру, где хранится юнитор.
	AI_Output (hero, self,"PC_Thief_SHOWFOCUS_Info_15_02"); //Понятно. Но прежде нам нужно избавиться от этой твари.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //Чтобы победить тролля, тебе придется отыскать у него слабое место... или придумать что-нибудь еще.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //Я отвлеку его.

	B_LogEntry		(CH3_TrollCanyon,"Мы вышли на огромного тролля, загораживающего дорогу. Диего хотел обойти его, а я предложил разобраться с ним.");

	Npc_ExchangeRoutine	(self,	"WaitAtWheel");

	AI_DrawWeapon		(self);
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERTROLL
//---------------------------------------------------------------------
instance PC_Thief_AFTERTROLL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_AFTERTROLL_Condition;
	information		= PC_Thief_AFTERTROLL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_AFTERTROLL_Condition()
{	
	var int trollFound;
	Npc_PerceiveAll(self);
	trollFound = Wld_DetectNpc(self, Troll, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,PC_Thief_SHOWFOCUS)
	&&	(	(trollFound && (Npc_IsDead(other) || Npc_IsInState(other,ZS_MagicShrink)))				// Troll besiegt...
		||	(Npc_GetDistToWP(hero, "LOCATION_12_14_WHEEL") < 1000)							)		// ...oder Spieler an der Winde angekommen
	{
		return TRUE;
	};
};
func void  PC_Thief_AFTERTROLL_Info()
{
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_01"); //Просто фантастика! Да, ты даром времени не терял! Что ж, идем за юнитором.
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_02"); //Я присмотрю за тем, чтобы больше не было никаких неприятных сюрпризов.

	B_LogEntry		(CH3_TrollCanyon,"Тролль повержен. Теперь я могу заняться лебедкой, которая двигает решетку к платформе с юнитором.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WHEEL
//---------------------------------------------------------------------
instance  PC_Thief_WHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WHEEL_Condition;
	information		= PC_Thief_WHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_AFTERTROLL)) 
	&& (Troll_Wheel == 1) 
	{
		return TRUE;
	};
};
FUNC void  PC_Thief_WHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_01"); //Похоже, заклинило.
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_02"); //Дай-ка посмотрю, может быть, удастся исправить.

	AI_StopProcessInfos	(self);
	AI_GotoWP 			(self,	"LOCATION_12_14_WHEEL");
	AI_AlignToWP		(self);
	AI_PlayAni			(self,	"T_PLUNDER");
};

//---------------------------------------------------------------------
//	Info FIXWHEEL
//---------------------------------------------------------------------
instance PC_Thief_FIXWHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_FIXWHEEL_Condition;
	information		= PC_Thief_FIXWHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_FIXWHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_WHEEL))
	{
		return TRUE;
	};
};
func void  PC_Thief_FIXWHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_FIXWHEEL_Info_11_01"); //Вот и заработала.
	Troll_Wheel = 2;	// Winde repariert!

	B_LogEntry		(CH3_TrollCanyon,"Диего починил заевшую лебедку. Теперь путь свободен.");

	Npc_ExchangeRoutine (self, "WaitAtFocus");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WAITATFOCUS
//---------------------------------------------------------------------
instance PC_Thief_WAITATFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WAITATFOCUS_Condition;
	information		= PC_Thief_WAITATFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WAITATFOCUS_Condition()
{	
	if	Npc_KnowsInfo(hero,PC_Thief_FIXWHEEL)
	&&	(Npc_GetDistToWP(hero,"LOCATION_12_03") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_WAITATFOCUS_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //Забери юнитор. Я буду ждать тебя здесь.

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GOTIT
//---------------------------------------------------------------------
//-----SPIELER HAT DEN FOKUS GEFUNDEN---------------------
instance  PC_Thief_GOTIT (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_GOTIT_Condition;
	information		= PC_Thief_GOTIT_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_GOTIT_Condition()
{	
	if (Npc_HasItems (hero,Focus_2))
	{
		return TRUE;
	};
};

FUNC void  PC_Thief_GOTIT_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_01"); //Нашел юнитор? Молодец.
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_02"); //Думаю, теперь мне пора возвращаться в Старый Лагерь. Удачи тебе!
	AI_Output			(hero, self,"PC_Thief_GOTIT_Info_15_03"); //Будь осторожен.
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_04"); //Мы еще встретимся.

	B_LogEntry		(CH3_TrollCanyon,"Юнитор у меня. Но мне еще надо убедить нескольких гарпий, что у меня есть право его у себя и оставить.");
	B_LogEntry		(CH3_TrollCanyon,"Диего возвращается в Старый Лагерь. Я почему-то уверен, что это не последняя наша встреча.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;

	Npc_ExchangeRoutine	(self, "start");	
};  











//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info OCWARN
//***************************************************************************
instance Info_Diego_OCWARN (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARN_Condition;
	information	= Info_Diego_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Diego_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Diego_OCWARN_11_01"); //Эй... Т-ссс... Тише!
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN))
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_02"); //Привет, Диего! Я встретил Мильтена на другом конце Лагеря.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_03"); //Тогда ты уже знаешь, что здесь произошло.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_04"); //А слышал ли ты о готовящемся нападении на Свободную Шахту?
	}
	else
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_05"); //Привет, Диего! Что это за игра в прятки?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_06"); //Ты разве еще не слышал?
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_07"); //Слышал что?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_08"); //Старая Шахта обрушилась, перебили всех магов Огня, и готовится нападение на Свободную Шахту.
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_09"); //ЧТООО??? О чем ты говоришь?
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Diego_OCMINE (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMINE_Condition;
	information	= Info_Diego_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Как могла обрушиться Старая Шахта?";
};

FUNC int Info_Diego_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMINE_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMINE_15_01"); //Как могла обрушиться Старая Шахта?
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_02"); //Один из уцелевших рудокопов говорит, что они наткнулись на подземную реку на нижнем уровне.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_03"); //Когда вода хлынула в шахту, сломалась одна из подпорок, и верхний уровень обрушился.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_04"); //Уцелела лишь горстка людей.
};

//***************************************************************************
//	Info OCKDF
//***************************************************************************
instance Info_Diego_OCKDF (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCKDF_Condition;
	information	= Info_Diego_OCKDF_Info;
	important	= 0;
	permanent	= 0;
	description = "Что случилось с магами Огня?";
};

FUNC int Info_Diego_OCKDF_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCFM))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCKDF_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCKDF_15_01"); //Что случилось с магами Огня?
	AI_Output		(self,hero,"Info_Diego_OCKDF_11_02"); //Это долгая история.
};

//***************************************************************************
//	Info OCFM
//***************************************************************************
instance Info_Diego_OCFM (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFM_Condition;
	information	= Info_Diego_OCFM_Info;
	important	= 0;
	permanent	= 0;
	description = "Нападение на Свободную Шахту?";
};

FUNC int Info_Diego_OCFM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFM_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFM_15_01"); //Нападение на Свободную Шахту?
	AI_Output		(self,hero,"Info_Diego_OCFM_11_02"); //Это долгая история.
};

//***************************************************************************
//	Info OCSTORY
//***************************************************************************
instance Info_Diego_OCSTORY (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCSTORY_Condition;
	information	= Info_Diego_OCSTORY_Info;
	important	= 0;
	permanent	= 0;
	description = "Просто скажи!";
};

FUNC int Info_Diego_OCSTORY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCFM) || Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCSTORY_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_01"); //Расскажи мне. Это уже не первая долгая история из тех, что мне приходилось слышать.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_02"); //Ну, хорошо. По счастью я оказался в особняке Баронов, когда пришло сообщение о том, что шахта обрушилась.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_03"); //Когда Гомез услышал это, он чуть с ума не сошел.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_04"); //Еще бы. Тот, кто контролирует добычу руды, по сути владеет всей колонией.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_05"); //Верно. Поскольку источник дохода иссяк, товары из внешнего мира тоже перестанут поступать.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_06"); //Если он быстро не найдет новый источник дохода,  на него никто не будет работать.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_07"); //И зачем понадобилось нападать на Свободную Шахту?
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_08"); //Если быть честным, это единственны шанс Гомеза удержать власть в своих руках.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_09"); //Пару часов назад к Свободной Шахте отправили два десятка стражников.

	B_Story_FMTaken	();
};

//***************************************************************************
//	Info OCWARNNC
//***************************************************************************
instance Info_Diego_OCWARNNC (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARNNC_Condition;
	information	= Info_Diego_OCWARNNC_Info;
	important	= 0;
	permanent	= 0;
	description = "Это какое-то безумие! Я должен предупредить Новый Лагерь!";
};

FUNC int Info_Diego_OCWARNNC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARNNC_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_01"); //Это какое-то безумие! Я должен предупредить Новый Лагерь!
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_02"); //Тогда тебе нужно торопиться! Они уже почти добрались до Свободной Шахты.
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_03"); //Но им не прорваться через укрепления Нового Лагеря!
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_04"); //А это им и не нужно. Несколько месяцев назад они нашли путь, который ведет через горы прямо к Свободной Шахте, - и никто о нем не знает.
};

//***************************************************************************
//	Info OCGUARDS
//***************************************************************************
instance Info_Diego_OCGUARDS (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCGUARDS_Condition;
	information	= Info_Diego_OCGUARDS_Info;
	important	= 0;
	permanent	= 0;
	description = "Ворота закрыты, и перед ними стоят стражники.";
};

FUNC int Info_Diego_OCGUARDS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCGUARDS_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCGUARDS_15_01"); //Ворота закрыты, и перед ними стоят стражники.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_02"); //Держись от них подальше. Они убьют всякого, кто подойдет к Лагерю.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_03"); //Они боятся, что кто-нибудь захочет отомстить за нападение на Свободную Шахту.
};

//***************************************************************************
//	Info OCMURDER
//***************************************************************************
instance Info_Diego_OCMURDER (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMURDER_Condition;
	information	= Info_Diego_OCMURDER_Info;
	important	= 0;
	permanent	= 0;
	description = "Но что случилось с магами Огня?";
};

FUNC int Info_Diego_OCMURDER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMURDER_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_01"); //Но что случилось с магами Огня?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_02"); //Корристо и остальные маги оставались единственными в Лагере, кто сохранил рассудок в подобной ситуации. 
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_03"); //Они запретили нападать на Свободную Шахту и потребовали связаться с двумя остальными Лагерями.
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_04"); //Они ЗАПРЕТИЛИ Гомезу нападать на Свободную Шахту?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_05"); //Ну да. Корристо не должен был быть настолько самоуверенным. Гомез перестал доверять магам и предательски убил их всех.
};

//***************************************************************************
//	Info OCRETREAT
//***************************************************************************
instance Info_Diego_OCRETREAT (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCRETREAT_Condition;
	information	= Info_Diego_OCRETREAT_Info;
	important	= 0;
	permanent	= 0;
	description = "Что вы с Мильтеном теперь собираетесь делать?";
};

FUNC int Info_Diego_OCRETREAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCMURDER))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCRETREAT_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCRETREAT_15_01"); //Что вы с Мильтеном теперь собираетесь делать?
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_02"); //Мы еще немного побудем здесь. Нужно предупредить наших друзей, чтобы они не наткнулись ненароком на стражу.
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_03"); //Ты бы мог оказать нам услугу.
};

//***************************************************************************
//	Info OCFAVOR
//***************************************************************************
instance Info_Diego_OCFAVOR (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFAVOR_Condition;
	information	= Info_Diego_OCFAVOR_Info;
	important	= 0;
	permanent	= 0;
	description = "Считай, что все уже сделано! Что тебе нужно?";
};

FUNC int Info_Diego_OCFAVOR_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFAVOR_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_01"); //Считай, что все уже сделано! Что тебе нужно?
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_02"); //Разыщи Лестера и Горна. Нужно рассказать им о том, что здесь происходит.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_03"); //Скажи им, что мы четверо встречаемся там же, где и всегда.
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_04"); //Если я найду их раньше, чем ты, я предупрежу их и отправлю вам навстречу.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_05"); //Спасибо, друг! Ты отличный парень! Надеюсь, мы еще встретимся.
				
	Log_CreateTopic		(CH4_4Friends,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_4Friends,		LOG_RUNNING);
	B_LogEntry			(CH4_4Friends,		"Все маги огня мертвы, а ситуация выходит из-под контроля. Диего хочет, чтобы я рассказал Лестеру и Горну о их секретном встрече с Мильтоном. Похоже на то, что они делают так уже далеко не в первый раз."); 
};











































/*

// *******************************************************************

	AI_Output(self,hero,"Info_Diego_Gamestart_11_01"); //Warum haben sie dich hier reingeworfen?
	
	Info_ClearChoices(Info_Diego_Gamestart );
	Info_AddChoice	 (Info_Diego_Gamestart, "Gewitzter Ьberfall            (+3 Geschicklichkeit)"	,Info_Diego_Gamestart_Choice_Dex);
	Info_AddChoice	 (Info_Diego_Gamestart, "Schlдgerei mit Folgen         (+3 Stдrke)"				,Info_Diego_Gamestart_Choice_Str);
	Info_AddChoice	 (Info_Diego_Gamestart, "Wahre Worte zum falschen Mann (+3 Mana)"				,Info_Diego_Gamestart_Choice_Man);
	Info_AddChoice	 (Info_Diego_Gamestart, "Unschuldig                    (+1 auf alle Attribute)"	,Info_Diego_Gamestart_Choice_All);
};
// -------------------------------------------- CHOICES ----------------------------------------------------
FUNC VOID Info_Diego_Gamestart_Choice_Dex()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_00"); //Ich habe ne Ladung Erz verschwinden lassen.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_01"); //Dummerweise hat der Typ bei dem ich sie versteckt habe, lieber die Belohnung fьr mich kassiert, anstatt mit mir das Erz zu teilen.
	PrintScreen	("Geschicklichkeit +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Str()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_00"); //Eine Herausforderung konnte ich noch nie abschlagen. Auch nicht von des Kцnigs Gardisten. dummerweise hat der Kцnig viele Gardisten.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_01"); //Zu viele.	
	PrintScreen	("Stдrke +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Man()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_00"); //Ich saЯ in der Kneipe und habe meine Meinung ьber Kцnig, Krieg und Steuern gesagt. 
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_01"); //Ich hab' mich nur zu spдt daran erinnert, dass der, der die Wahrheit spricht, ein schnelles Pferd braucht.
	PrintScreen	("Mana +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]+3;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_All()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_All_15_00"); //Ich bin unschuldig!
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_01"); //Du solltest eins wissen: Hier drin ist niemand unschuldig. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_02"); //Hier findest du Mдnner die so ziemlich jedes mцgliche Verbrechen begangen haben. Und einen unschuldigen nehmen die nur zu gerne auseinander. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_03"); //Ich gebe dir nen Tipp, und der ist ganz umsonst. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_04"); //Wenn dich jemand fragt, warum du hier bist, sag ihm, du hast einen Typen gekillt, der dich gefragt hat, warum du hier bist. 
	PrintScreen	("Stдrke, Geschick und Mana +1", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] 	= hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] 	= hero.attribute[ATR_STRENGTH]	+1;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]		+1;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]	+1;
	Info_ClearChoices(Info_Diego_Gamestart );


*/
