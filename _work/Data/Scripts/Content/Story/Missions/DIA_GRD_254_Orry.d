// **************************************************
// 						 PRE EXIT 
// **************************************************

INSTANCE DIA_Orry_PreExit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_PreExit_Condition;
	information	= DIA_Orry_PreExit_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_PreExit_Condition()
	
	{
		return 1;
	};

FUNC VOID DIA_Orry_PreExit_Info()
{
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //Постарайся добраться до Старого Лагеря целым и невредимым!
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Orry_Exit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_Exit_Condition;
	information	= DIA_Orry_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_Exit_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orry_PreExit))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Wache
// **************************************************

INSTANCE DIA_Orry_GuardGate (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_GuardGate_Condition;
	information		= DIA_Orry_GuardGate_Info;
	permanent		= 0;
	description		= "Чем ты занимаешься?"; 
};

FUNC INT DIA_Orry_GuardGate_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_GuardGate_Info()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //Что ты здесь делаешь?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Слежу за тем, чтобы никто не подобрался к месту обмена - особенно эти головорезы из Нового Лагеря.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Ты новенький, которого зашвырнули только сегодня, верно?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //Да, это я. 
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //Остерегайся типов из Нового Лагеря!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Я работаю на Старый Лагерь - также как и все, кого ты видел у скалы, где происходит обмен.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //Ты уже поговорил с Диего?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"Нет.",DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Да.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //Нет.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //И чего же ты ждешь? Он у нас занимается новичками.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //Он много знает о колонии и знания эти пригодятся тому, кто здесь недавно.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Да, поговорил.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //Хорошо. Значит, ты в курсе всего происходящего.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

// **************************************************
// 					New Camp
// **************************************************

INSTANCE DIA_Orry_NewCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 1;
	condition		= DIA_Orry_NewCamp_Condition;
	information		= DIA_Orry_NewCamp_Info;
	permanent		= 0;
	description		= "Почему мне следует опасаться людей из Нового Лагеря?"; 
};

FUNC INT DIA_Orry_NewCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_NewCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //Почему мне следует опасаться людей из Нового Лагеря?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //По сравнению с Новым Лагерем, Старый - это тихое и безопасное место.
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //Новый Лагерь не получает товаров из внешнего мира. Их воры просто крадут все, что им нужно.
};

// **************************************************
// 					Old Camp
// **************************************************

INSTANCE DIA_Orry_OldCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_OldCamp_Condition;
	information		= DIA_Orry_OldCamp_Info;
	permanent		= 0;
	description		= "А Старый Лагерь?"; 
};

FUNC INT DIA_Orry_OldCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_OldCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //А Старый Лагерь?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //Во главе всего здесь стоят Бароны. Следом за ними идет Стража и Призраки. Ну а в самом низу находятся рудокопы.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Каждый, кто прибывает сюда, сперва становится рудокопом. Если хочешь достигнуть большего, для начала тебе придется стать одним из Призраков.
};

// **************************************************
// 					Shore
// **************************************************

INSTANCE DIA_Orry_Shore (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Shore_Condition;
	information		= DIA_Orry_Shore_Info;
	permanent		= 0;
	description		= "Когда я выплыл на берег, один из этих типов ударил меня..."; 
};

FUNC INT DIA_Orry_Shore_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Shore_Info()
{
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Когда я выплыл на берег, один из этих типов ударил меня...
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //Так поступают со всеми новичками. Они называют это 'боевым крещением'.
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //А-а. И в Старом Лагере все такие?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //В любом месте найдется парочка негодяев. Но они не тронут тебя, если ты платишь деньги за свою защиту.
};

// **************************************************
// 					Frau
// **************************************************

INSTANCE DIA_Orry_Woman (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Woman_Condition;
	information		= DIA_Orry_Woman_Info;
	permanent		= 0;
	description		= "Я видел, что вместе с товарами сюда отправили какую-то женщину."; 
};

FUNC INT DIA_Orry_Woman_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Woman_Info()
{
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //Я видел, что вместе с товарами сюда отправили какую-то женщину.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //Да, Бароны получают все, что хотят.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Ты хочешь сказать, что король выменивает руду на женщин?!
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Они такие же преступники, как и все здесь. Если бы Гомезу не понадобилась эта женщина, она бы сидела в тюрьме или еще где-нибудь.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //Не знаю, что хуже...
};

// **************************************************
// 					Waffe
// **************************************************

INSTANCE DIA_Orry_Waffe (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Waffe_Condition;
	information		= DIA_Orry_Waffe_Info;
	permanent		= 0;
	description		= "Мне нужно какое-нибудь оружие..."; 
};

FUNC INT DIA_Orry_Waffe_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Waffe_Info()
{
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //Мне нужно какое-нибудь оружие...
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //Возле брошенной шахты, дальше по этой тропе, наверняка можно найти что-нибудь.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Но не стоит лезть в драку с чем-то вроде ржавой кирки - эти штуковины слишком тяжелы и неудобны, чтобы быть хорошим оружием.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Неопытный боец должен использовать их лишь в случае крайней необходимости.
	
};



