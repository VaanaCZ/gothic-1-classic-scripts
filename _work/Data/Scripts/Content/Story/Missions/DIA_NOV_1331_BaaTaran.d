// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalTaran_EXIT (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 999;
	condition	= DIA_BaalTaran_EXIT_Condition;
	information	= DIA_BaalTaran_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalTaran_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrьssung
// **************************************************

instance  DIA_BaalTaran_Greet (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Greet_Condition;
	information	= DIA_BaalTaran_Greet_Info;
	permanent	= 0;
	description = "Я здесь новенький. Кто ты?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Я здесь новенький. Кто ты?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Я Идол Братства Спящего, и зовут меня Тэран.
};

// **************************************************
//					Was ist Bruderschaft
// **************************************************

instance  DIA_BaalTaran_Bruderschaft (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Bruderschaft_Condition;
	information	= DIA_BaalTaran_Bruderschaft_Info;
	permanent	= 0;
	description = "Что такое Братство Спящего?";
};                       

FUNC int  DIA_BaalTaran_Bruderschaft_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Bruderschaft_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Что такое Братство Спящего?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //Так мы называем братство последователей новой веры.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //Наш Лагерь находится среди болот на востоке. Я пришел сюда, чтобы нести слово Спящего иноверцам - таким, как ты.
};

// **************************************************
//					Wer ist der Schlдfer
// **************************************************

instance  DIA_BaalTaran_Sleeper (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Sleeper_Condition;
	information	= DIA_BaalTaran_Sleeper_Info;
	permanent	= 0;
	description = "Кто такой Спящий?";
};                       

FUNC int  DIA_BaalTaran_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Кто такой Спящий?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //Спящий - это наш спаситель. Пять лет назад он явил себя нашему наставнику Ю`Бериону.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //С тех мы отреклись от трех богов. И тебе тоже стоит отвергнуть их.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //Из своей небесной обители они лишь наблюдают за тем, как мы томимся в этой темнице. Но Спящий приведет нас к свободе!
};

// **************************************************
//					Lehre des Schlдfers
// **************************************************

instance  DIA_BaalTaran_Lehre (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Lehre_Condition;
	information	= DIA_BaalTaran_Lehre_Info;
	permanent	= 0;
	description = "Расскажи мне об учении Спящего.";
};                       

FUNC int  DIA_BaalTaran_Lehre_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Lehre_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Расскажи мне об учении Спящего.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //Мощь Спящего неизмерима. Возможно, он даже сильнее Инноса, бога Света.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //Дух его с нами, но сам Спящий еще не набрал полную силу. Тысячу лет он провел во сне, но момент его пробуждения близок.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //Мы были избраны нести людям слово его, мы же станем свидителями его пробуждения.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //Знай, что те, кто присоединится к Спящему, обретут бессмертную душу, неверных же ждет беспощадная кара.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //Но в бесконечной милости своей Спящий посылает доказательство своей силы всем, кого терзают сомнения.
};

// **************************************************
//						Freiheit
// **************************************************

instance  DIA_BaalTaran_Freiheit (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 4;
	condition	= DIA_BaalTaran_Freiheit_Condition;
	information	= DIA_BaalTaran_Freiheit_Info;
	permanent	= 0;
	description = "Каким же он будет, этот путь к свободе?";
};                       

FUNC int  DIA_BaalTaran_Freiheit_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Freiheit_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //Каким же он будет, этот путь к свободе?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //Все мы готовимся к Великой Церемонии, в ходе которой наши братья объединят свои силы и призовут Спящего.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //И тогда Всемогущий откроет нам путь к свободе!
};

// **************************************************
//						Beweis
// **************************************************

instance  DIA_BaalTaran_Beweis (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Beweis_Condition;
	information	= DIA_BaalTaran_Beweis_Info;
	permanent	= 0;
	description = "Какие доказательства своей силы посылает твой бог?";
};                       

FUNC int  DIA_BaalTaran_Beweis_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Beweis_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //Какие доказательства своей силы посылает твой бог?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //Он говорит с нами в видениях. Те, кому хоть раз довелось услышать его голос, больше не сомневаются в силе Спящего.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //На болоте растет трава, которая поможет тебе стать ближе к Спящему и услышать его голос. Некоторые из нас даже видят посылаемые им образы.
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_03"); //Ясно.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance  DIA_BaalTaran_WayToST (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_WayToST_Condition;
	information	= DIA_BaalTaran_WayToST_Info;
	permanent	= 0;
	description = "Как добраться до Лагеря Братства?";
};                       

FUNC int  DIA_BaalTaran_WayToST_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WayToST_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //Как добраться до Лагеря Братства?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //Я не могу оторваться от дел, но сейчас в этом Лагере находится Идол Парвез.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //Ты найдешь его у рынка, по другую сторону замка. Кажется, у него даже есть там своя хижина.

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi,"Парень по имени Идол Парвез может отвести в Болотный Лагерь Братства. Его можно найти на торговой площади за замком, в Старом Лагере.");
};


// **************************************************
//					Will in die BURG
// **************************************************

instance  DIA_BaalTaran_IntoCastle (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 10;
	condition	= DIA_BaalTaran_IntoCastle_Condition;
	information	= DIA_BaalTaran_IntoCastle_Info;
	permanent	= 1;
	description = "Я должен попасть в замок. Ты можешь помочь мне?";
};                       

FUNC int  DIA_BaalTaran_IntoCastle_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_IntoCastle_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //Я должен попасть в замок. Ты можешь помочь мне?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //Боюсь, что нет, брат мой. Ворота замка открыты лишь для тех членов Братства, кто доставляет Гомезу болотник.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //Часть собранной на болотах травы мы продаем Старому Лагерю, и получаем взамен вещи из внешнего мира.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //Если бы ты был одним из гонцов Кор Галома, до без труда проник бы в замок. Но прежде ты должен стать одним из членов Братства.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //Но что за дела у тебя в замке?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Я должен встретиться там с одним человеком.",DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"У меня есть письмо Верховному Магу Круга Огня.",DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Я должен встретиться там с одним человеком.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //В самом деле? И с кем же? Почему ты просто не подождешь, пока он выйдет из замка?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Тебя это не касается.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Это один из магов.",DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //У меня есть письмо для Верховного Мага Круга Огня.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //О? Откуда оно у тебя? Тебе его дали маги, прежде чем забросить сюда, верно?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Не стоит болтать об этом письме. Не волнуйся - я никому не расскажу о нем.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Но ради своего же собственного блага больше никому не говори об этом. За это письмо здешний народ не задумываясь перережет тебе глотку.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //Каждому захочется получить награду, положенную гонцу, доставившему письмо из внешнего мира.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //Это один из магов.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //О! Знаешь, они никогда не покидают замок. Тебе действительно придется как-то попасть внутрь.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //Но что тебе от него нужно? Магические руны? Или эликсир?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Тебя это не касается.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Верно.",DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //Тебя это не касается.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Хорошо, друг. Я просто хотел помочь...
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //Угадал.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //Я так и знал! Что еще парень, вроде тебя, может хотеть от магов?!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Вот тебе хороший совет: забудь о них. За свои магические фокусы они просят слишком много руды.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //В нашем Лагере и руны, и эликсиры стоят куда дешевле.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};
