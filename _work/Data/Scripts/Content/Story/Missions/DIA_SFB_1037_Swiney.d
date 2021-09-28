// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Swiney_EXIT(C_INFO)
{
	npc			= SfB_1037_Swiney ;
	nr			= 999;
	condition	= Info_Swiney_EXIT_Condition;
	information	= Info_Swiney_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Swiney_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_Swiney_Hello(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Hello_Condition;
	information	= Info_Swiney_Hello_Info;
	permanent	= 0;
	description = "Как тебя зовут?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //Кто ты?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Я лучший специалист-проходчик в этой чертовой колонии, мой мальчик.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Только благодаря мне половина парней там, в шахте, не погибла под завалами. Они слишком глупы, чтобы знать, где не стоит размахивать киркой.
};

// ************************************************************
// 						Schьrfer
// ************************************************************

INSTANCE Info_Swiney_Schuerfer(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Schuerfer_Condition;
	information	= Info_Swiney_Schuerfer_Info;
	permanent	= 0;
	description = "Я хочу стать рудокопом!";
};                       

FUNC INT Info_Swiney_Schuerfer_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_Schuerfer_Info()
{	
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //Я хочу стать рудокопом!
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //В самом деле? Только не думай, что это такое уж теплое местечко. Три порции риса в день, остальные плюсы тебе придется искать самому.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //Ты вообще знаешь, почему мы этим занимаемся? Мы делаем эту работу для того, чтобы однажды выйти на свободу.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //Вся добытая руда собирается в одну большую железную гору. Раз в месяц каждый из рабочих получает по 50 кусков, чтобы оттянуться по полной.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //Это основное, что тебе нужно знать.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //У тебя есть хоть какой-нибудь опыт в такого рода делах?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer,"Нет.",Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer,"Да.",Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Да.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //Хорошо. Тогда ты сам знаешь, чего нужно остерегаться. Вот твоя рабочая одежда. Кирку тебе придется найти самому. Приятного отдыха!
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //Нет.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //Разумеется, нет! Ну почему всегда я? Ладно. Слушай внимательно. Ты берешь рабочую одежду и надеваешь ее - прямо здесь.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Без этого ты останешься калекой на всю жизнь, если кусок породы свалится тебе, к примеру, на ногу. И пользы от тебя будет куда как меньше.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //Здесь где-то неподалеку валялась кирка.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Правда, с ней ты много не наработаешь, так что...
	
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE Info_Swiney_PERM(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_PERM_Condition;
	information	= Info_Swiney_PERM_Info;
	permanent	= 1;
	description = "Сколько руды вы уже собрали?";
};                       

FUNC INT Info_Swiney_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Schuerfer)) 
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_PERM_Info()
{	
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //Сколько руды вы уже собрали?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //Маги говорят, что нужно еще совсем немного. Сходи в Новый Лагерь и посмотри на железную гору.
	AI_StopProcessInfos	(self);
};


