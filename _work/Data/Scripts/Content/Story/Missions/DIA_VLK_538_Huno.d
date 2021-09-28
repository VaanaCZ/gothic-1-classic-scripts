// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Huno_Exit (C_INFO)
{
	npc			= Vlk_538_Huno;
	nr			= 999;
	condition	= DIA_Huno_Exit_Condition;
	information	= DIA_Huno_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Huno_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//	Info YouKnowYourJob
// **************************************************
INSTANCE DIA_Huno_YouKnowYourJob (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_YouKnowYourJob_Condition;
	information		= DIA_Huno_YouKnowYourJob_Info;
	permanent		= 0;
	important		= 0;
	description		= "Похоже, ты хорошо знаешь свое дело.";
};

FUNC INT DIA_Huno_YouKnowYourJob_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output (other,self,"DIA_Huno_YouKnowYourJob_15_00"); //Похоже, ты хорошо знаешь свое дело.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Пока еще никто не жаловался.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_02"); //Да и что толку жаловаться? Здесь каждому идиоту нужен свой меч, а хорошие мечи делаю только я.
};


// **************************************************
//	Info HowLong
// **************************************************
INSTANCE DIA_Huno_HowLong (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowLong_Condition;
	information		= DIA_Huno_HowLong_Info;
	permanent		= 0;
	important		= 0;
	description		= "Сколько времени уходит на изготовление одного меча?";
};

FUNC INT DIA_Huno_HowLong_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowLong_Info()
{
	AI_Output (other,self,"DIA_Huno_HowLong_15_00"); //Сколько времени уходит на изготовление одного меча?
	AI_Output (self,other,"DIA_Huno_HowLong_09_01"); //Смотря какой нужен меч. Обычные я делаю практически моментально.
	AI_Output (self,other,"DIA_Huno_HowLong_09_02"); //Ну, разумеется, если цена меня устраивает.
	AI_Output (self,other,"DIA_Huno_HowLong_09_03"); //Ну а уродам, вроде Уистлера, приходится ждать дольше, чем всем остальным.
	AI_Output (other,self,"DIA_Huno_HowLong_15_04"); //Почему? Он мало платит?
	AI_Output (self,other,"DIA_Huno_HowLong_09_05"); //Как раз наоборот. За последний меч он заплатил мне 150 кусков руды.
	AI_Output (self,other,"DIA_Huno_HowLong_09_06"); //Парню нравятся украшения и прочьи бабьи штучки, а это стоит недешево.
	AI_Output (self,other,"DIA_Huno_HowLong_09_07"); //Эй, да ты меня совсем не слушаешь!
};

// **************************************************
//	Info HowsYourBusiness
// **************************************************
INSTANCE DIA_Huno_HowsYourBusiness (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowsYourBusiness_Condition;
	information		= DIA_Huno_HowsYourBusiness_Info;
	permanent		= 1;
	important		= 0;
	description		= "Как дела, кузнец?";
};

FUNC INT DIA_Huno_HowsYourBusiness_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Как дела, кузнец?
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_01"); //Интересно, почему ты спрашиваешь...
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_02"); //Может, у меня есть для тебя работа.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_03"); //В самом деле? И какая же?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_04"); //Я еще подумаю.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Возвращайся, когда тебе на самом деле что-то понадобится, и перестань действовать мне на нервы.
};

// **************************************************
//	Info LEARNSMITH
// **************************************************
var int	Huno_LearnSmith;
// **************************************************

INSTANCE DIA_Huno_LEARNSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_LEARNSMITH_Condition;
	information		= DIA_Huno_LEARNSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "Я бы тоже хотел здесь поработать.";
};

FUNC INT DIA_Huno_LEARNSMITH_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_LEARNSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_00"); //Я бы тоже хотел здесь поработать.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_01"); //Уж не думаешь ли ты, что способен делать хорошие клинки?
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_02"); //Что я должен делать?
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_03"); //Вот, бери заготовку и суй ее в огонь.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_04"); //Когда металл раскалится докрасна, клади его на наковальню.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_05"); //Готовый меч нужно опустить в ведро с водой, чтобы охладить металл.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_06"); //Ну а потом ты затачиваешь его на точильном камне.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_07"); //Понятно.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_08"); //Для всего этого понадобятся инструменты - и я могу продать их тебе.

	Huno_LearnSmith = TRUE;
};

// **************************************************
//	Info BUYSMITH
// **************************************************
INSTANCE DIA_Huno_BUYSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_BUYSMITH_Condition;
	information		= DIA_Huno_BUYSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "Мне нужны инструменты!";
	trade			= 1;
};

FUNC INT DIA_Huno_BUYSMITH_Condition()
{	
	if	(Huno_LearnSmith == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_BUYSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_BUYSMITH_15_00"); //Мне нужны инструменты!

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};


