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
	description = "Я новенький. Кто ты?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Я новенький. А ты кто?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Я Идол Тэран, один из верных Спящему. Я пришел из лагеря Братства.
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
	description = "Что такое братство Спящего?";
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
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Что такое братство Спящего?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //Мы так называем Братство последователей новой веры.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //Наш лагерь находится к востоку отсюда, среди болот. В Старом лагере я несу людям слово Спящего.
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
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //Спящий - наш спаситель. Он раскрыл себя в видениях нашему Учителю Юбериону пять лет назад.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //С тех пор мы отвернулись от трех богов. Тебе тоже предстоит это сделать.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //Эти боги не смогли нам помочь, они покинули нас, допустили проведение этого нелепого эксперимента с Барьером. Но Спящий освободит нас отсюда!
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
	description = "Что ты можешь рассказать мне о Спящем?";
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
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Что ты можешь рассказать мне о Спящем?
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //Спящий обладает огромной силой. Я думаю, что даже Иннос, бог света, не сравнится с ним.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //Его дух пребывает с нами. Но сам он не может явить нам всю свою мощь. Его сон продолжается тысячу лет, но скоро, скоро наступит миг пробуждения.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //Он избрал нас, чтобы нести неверным его учение, чтобы засвидетельствовать его пробуждение и рассказать об этом чуде.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //Знай же, что все, кто уверует в Спящего, сохранят свои души незапятнанными, а неверные будут стерты с лица земли.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //Но Спящий милостив, и потому посылает доказательства своей силы всем, кто сомневается в нем.
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
	description = "А как будет выглядеть путь к свободе?";
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
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //А как будет выглядеть путь к свободе?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //Мы готовим великую Церемонию, в которой объединим все духовные силы и призовем Спящего.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //Во время Церемонии наш господин укажет нам путь к свободе.
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
	description = "Есть ли у тебя доказательства его силы?";
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
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //Есть ли у тебя доказательства его силы?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //Свою волю он раскрывает нам в видениях. Те, кто хоть раз слышал его голос, больше никогда не сомневаются в его силе.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //На болотах мы собираем траву, которая помогает последователям приблизиться к тайне Спящего и услышать его. Некоторым из нас выпадает честь созерцать видения, которые он посылает.
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_03"); //Понятно.
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
	description = "Как я могу найти лагерь Братства?";
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
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //Как я могу найти лагерь Братства?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //Сейчас у меня много дел. Ты можешь обратиться к Идолу Парвезу, который тоже пришел в этот лагерь.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //Его можно найти недалеко от рынка, по другую сторону замка. По-моему, у него там есть своя хижина.

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi, "Послушник по имени Идол Парвез может отвести меня в Болотный лагерь. Я смогу найти его на рыночной площади за замком в Старом лагере.");
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
	description = "Мне нужно попасть в замок. Ты можешь мне помочь?";
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
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //Мне нужно попасть в замок. Ты можешь мне помочь?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //Боюсь, это невозможно. В замок могут попасть только те из нас, кто поставляет Гомезу болотник из нашего лагеря.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //Мы собираем его и часть продаем в других лагерях, а часть меняем на товары из внешнего мира.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //Если бы ты был одним из курьеров, работающих на Кор Галома, тебя бы пропустили в замок. Но для этого ты должен вступить в наше Братство.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //А что тебе нужно в замке?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Мне нужно поговорить там с одним человеком."						,DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"У меня есть послание к Верховному Магу Круга Огня."	,DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Мне нужно поговорить там с одним человеком.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //Да? А почему бы тебе не подождать, пока он сам выйдет из замка?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Тебе это знать не обязательно."	,DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Это один из магов."	,DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //У меня есть послание к Верховному Магу Круга Огня.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Письмо? А откуда оно у тебя? Его дали тебе маги, до того как ты попал в эту тюрьму, да?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Тебе не следует рассказывать об этом. Но не волнуйся - сам я никому ничего не скажу.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Но ради собственной безопасности не говори о нем никому, хорошо? Из-за него тебя могут убить на месте.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //Каждому захочется получить награду, положенную гонцу, доставившему письмо из внешнего мира.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //Это один из магов.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //О! Маги никогда не выходят из замка. Тебе самому придется найти способ попасть к ним.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //Зачем же он тебе нужен? Неужели, чтобы купить магические руны или зелья?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Тебе это знать не обязательно."	,DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Верно, ты угадал."				,DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //Тебе это знать не обязательно.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Как знаешь, брат. Я же просто хотел помочь...
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //Верно, ты угадал.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //Я так и подумал! Что же еще нужно от магов такому человеку как ты.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Мой тебе совет: забудь об этих магах. Их товары тебе не по карману.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //В нашем лагере все эти руны и зелья стоят гораздо дешевле.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};
