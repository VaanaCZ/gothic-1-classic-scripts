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
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //Постарайся добраться до Старого лагеря живым!
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
	description		= "Что ты здесь делаешь?"; 
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
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Контролирую, чтобы никто не подошел к месту обмена. В особенности эти головорезы из Нового лагеря.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Ты новенький, не так ли? Тебя ведь только сегодня забросили к нам?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //Да, все так и есть.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //Держись подальше от парней из Нового лагеря!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Я, да и все остальные, кого ты видел в месте обмена, работаем на Старый лагерь.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //С Диего... ты уже говорил с ним?
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"Еще нет."	,DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Да, поговорил."	,DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //Еще нет.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //Тогда сделай это! Он у нас единственный, кто занимается новичками.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //Много знает о колонии, а это полезные знания для такого новичка, как ты.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Да, поговорил.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //Хорошо. Тогда ты уже знаешь, что здесь к чему.
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
	description		= "Почему ты советуешь держаться подальше от людей из Нового лагеря?"; 
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
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //Почему ты советуешь мне держаться подальше от людей из Нового лагеря?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //Новый лагерь - это тебе не Старый, где тихо и безопасно.
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //Новый лагерь не получает товары из внешнего мира, поэтому все что им нужно, они просто крадут.
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
	description		= "А Старый лагерь?"; 
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
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //А Старый лагерь?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //Здесь всем заправляют Бароны. Следом за ними идет Стража и Призраки. Ну, а рудокопы в самом низу этой цепочки.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Каждый, кто прибывает сюда, сначала работает рудокопом. Если хочет чего-то больше, то ему придется потрудиться, чтобы потом стать Призраком.
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
	description		= "Когда я вышел на берег, один из типов встретил меня кулаком..."; 
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
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Когда я вышел на берег, один из типов встретил меня кулаком...
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //Так со всеми новенькими, своего рода 'боевое крещение'.
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //А в Старом лагере много еще таких людей?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //Конечно, всегда можно встретить какого-нибудь негодяя, но если ты платишь за свою защиту, тебя не тронут.
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
	description		= "Я видел, как сюда вместе с товарами отправили какую-то женщину."; 
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
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //Я видел, как сюда вместе с товарами отправили какую-то женщину.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //Да, Бароны получают все, что хотят.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //Ты хочешь сказать, что за руду король присылает сюда женщин?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Они такие же преступницы, как и все мы здесь. Они нужны Гомезу, а потому не сидят в тюремных стенах там.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //Хотя, не знаю, что хуже...
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
	description		= "Где здесь можно найти оружие?"; 
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
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //Где здесь можно найти оружие?
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //Возле Заброшенной шахты, может, что-нибудь найдешь, это немного дальше вниз по тропе.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Но лучше в драку не лезть с какой-нибудь ржавой киркой в руках. Такие вещи тяжелые и неудобные, да и оружием не назовешь.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Неопытному бойцу лучше таким оружием не драться, ну разве что в крайней необходимости.
	
};



