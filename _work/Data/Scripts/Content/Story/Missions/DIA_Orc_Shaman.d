//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_OrcShaman_EXIT (C_INFO)
{
	npc			= ORC_2200_Shaman;
	nr			= 999;
	condition	= Info_OrcShaman_EXIT_Condition;
	information	= Info_OrcShaman_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_OrcShaman_EXIT_Condition()
{
	return TRUE;
};

FUNC VOID  Info_OrcShaman_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info THX
//---------------------------------------------------------------------
instance  Info_OrcShaman_THX (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_THX_Condition;
	information	= Info_OrcShaman_THX_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_OrcShaman_THX_Condition()
{	
	if	(Kapitel == 4)
	{
		return TRUE;
	};
};
FUNC void  Info_OrcShaman_THX_Info()
{
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_01"); //Должен благодарить незнакомца.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_02"); //Плохие орки хотели убивать меня.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_03"); //Старые братья - теперь враги.
}; 

//---------------------------------------------------------------------
//	Info WHO
//---------------------------------------------------------------------
instance  Info_OrcShaman_WHO (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_WHO_Condition;
	information	= Info_OrcShaman_WHO_Info;
	important	= 0;
	permanent	= 0;
	description = "Как тебя зовут?";
};

FUNC int  Info_OrcShaman_WHO_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_WHO_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_WHO_15_01"); //Кто ты?
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_02"); //Имя - Ур-Шак.
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_03"); //Быть сыном духов. Люди зовут шаманом.
}; 

//---------------------------------------------------------------------
//	Info TONGUE
//---------------------------------------------------------------------
instance  Info_OrcShaman_TONGUE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_TONGUE_Condition;
	information	= Info_OrcShaman_TONGUE_Info;
	important	= 0;
	permanent	= 0;
	description = "Откуда ты знаешь наш язык?";
};

FUNC int  Info_OrcShaman_TONGUE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_TONGUE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_TONGUE_15_01"); //Откуда ты знаешь наш язык?
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_02"); //Ур-Шак был раб людей в шахте.
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_03"); //Убежал. Много зим назад - убежал.
}; 

//---------------------------------------------------------------------
//	Info MINE
//---------------------------------------------------------------------
instance  Info_OrcShaman_MINE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_MINE_Condition;
	information	= Info_OrcShaman_MINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Ты был рабом в шахте? В какой шахте?";
};

FUNC int  Info_OrcShaman_MINE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_TONGUE))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_MINE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_MINE_15_01"); //Ты был рабом в шахте? В какой шахте?
	AI_Output 		(self, hero,"Info_OrcShaman_MINE_17_02"); //Шахта под деревней в Лощине.
}; 

//---------------------------------------------------------------------
//	Info WHY
//---------------------------------------------------------------------
instance  Info_OrcShaman_WHY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_WHY_Condition;
	information	= Info_OrcShaman_WHY_Info;
	important	= 0;
	permanent	= 0;
	description = "Почему твои братья напали на тебя?";
};

FUNC int  Info_OrcShaman_WHY_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_THX))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_WHY_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_WHY_15_01"); //Почему твои братья напали на тебя?
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_02"); //Ур-Шака не любят.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_03"); //Запятнал веру в КРУШАКА.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_04"); //Считаю КРУШАКА плохим демоном.
}; 

//---------------------------------------------------------------------
//	Info KRUSHAK
//---------------------------------------------------------------------
instance  Info_OrcShaman_KRUSHAK (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_KRUSHAK_Condition;
	information	= Info_OrcShaman_KRUSHAK_Info;
	important	= 0;
	permanent	= 0;
	description = "Кто это - КРУШАК?";
};

FUNC int  Info_OrcShaman_KRUSHAK_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_WHY))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_KRUSHAK_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_01"); //Кто это - КРУШАК?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_02"); //Люди зовут СПАТЬ.
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_03"); //Ты имеешь в виду 'Спящий'?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_04"); //Да, люди говорят СПЯЩИЙ!
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_OrcShaman_SLEEPER (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SLEEPER_Condition;
	information	= Info_OrcShaman_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "Что тебе известно про Спящего?";
};

FUNC int  Info_OrcShaman_SLEEPER_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_KRUSHAK))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_01"); //Что тебе известно про Спящего?
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_02"); //Быть пять братьев. Много зим назад!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_03"); //Быть сыновьями духов, как Ур-Шак!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_04"); //Ты хочешь сказать - пять шаманов!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_05"); //Позвали КРУШАКА!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_06"); //Хотели победить клан врагов!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_07"); //Пять братьев построили храм под землей для КРУШАКА!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_08"); //Подземный храм Спящего! Вот что имел в виду Ксардас, когда говорил, что вход в храм находится в городе орков!
}; 

//---------------------------------------------------------------------
//	Info CURSE
//---------------------------------------------------------------------
instance  Info_OrcShaman_CURSE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_CURSE_Condition;
	information	= Info_OrcShaman_CURSE_Info;
	important	= 0;
	permanent	= 0;
	description = "Что случилось в подземном храме?";
};

FUNC int  Info_OrcShaman_CURSE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_SLEEPER))
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_CURSE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_01"); //Что случилось в подземном храме?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_02"); //Братья отдали сердце КРУШАКУ.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_03"); //Но КРУШАК быть плохой. КРУШАК проклял всех, кто строил храм.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_04"); //У братьев нет сердца, чтобы быть мертвыми или живыми. Стали и тем, и другим.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_05"); //Теперь у КРУШАКА есть сердца братьев. В сердцах есть сила КРУШАКА.
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_06"); //Что стало со строителями храма?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_07"); //КРУШАК проклял всех. Строителей тоже. Все стали живые и мертвые, и то, и другое.
}; 

//---------------------------------------------------------------------
//	Info OUTSIDE
//---------------------------------------------------------------------
instance  Info_OrcShaman_OUTSIDE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_OUTSIDE_Condition;
	information	= Info_OrcShaman_OUTSIDE_Info;
	important	= 0;
	permanent	= 0;
	description = "Неужели оставшиеся на поверхности орки не предприняли ничего? ";
};

FUNC int  Info_OrcShaman_OUTSIDE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_CURSE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_OUTSIDE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_OUTSIDE_15_01"); //Неужели оставшиеся на поверхности орки не предприняли ничего? 
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_02"); //Они запечатали замок. Братья поклоняются КРУШАКУ.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_03"); //КРУШАК получает жертву и не становится плохой.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_04"); //Ур-Шак думал, что жертва - это плохо. Говорил братьям, что КРУШАК плохой.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_05"); //Братья не хотели слушать. Братья сказали Ур-Шаку: уходи. Братья ударили Ур-Шака.
}; 

//---------------------------------------------------------------------
//	Info INTEMPLE
//---------------------------------------------------------------------
instance  Info_OrcShaman_INTEMPLE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_INTEMPLE_Condition;
	information	= Info_OrcShaman_INTEMPLE_Info;
	important	= 0;
	permanent	= 0;
	description = "Мне нужно попасть в подземный храм!";
};

FUNC int  Info_OrcShaman_INTEMPLE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_OUTSIDE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_INTEMPLE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_01"); //Мне нужно попасть в подземный храм! Ты можешь провести меня туда?
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_02"); //Ур-Шак говорит спасибо незнакомцу. Незнакомец спас Ур-Шака.
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_03"); //Но вход в храм быть дома. Ур-Шак не может идти домой.
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_04"); //Понимаю: ты думаешь, что тебя не пропустят в город орков.
};

//---------------------------------------------------------------------
//	Info MAP
//---------------------------------------------------------------------
instance  Info_OrcShaman_MAP (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_MAP_Condition;
	information	= Info_OrcShaman_MAP_Info;
	important	= 0;
	permanent	= 0;
	description = "Ты можешь показать мне город орков на карте?";
};

FUNC int  Info_OrcShaman_MAP_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_OrcShaman_INTEMPLE)
	&&	Npc_HasItems (hero, ItWrWorldmap)
	{
		return TRUE;
	};

};

FUNC void  Info_OrcShaman_MAP_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_01"); //Ты можешь показать мне город орков на карте?
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_02"); //Дом Ур-Шака быть там, где карта пустая.
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_03"); //Незнакомец дает карту, Ур-Шак рисует карту!
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_04"); //(рисует на карте)
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_05"); //Здорово! Ты хорошо рисуешь! Спасибо!

	B_GiveInvItems  (hero, self, ItWrWorldmap, 1);
	Npc_RemoveInvItem(self, ItWrWorldmap);
	CreateInvItem	 (self, ItWrWorldmap_Orc);
	B_GiveInvItems  (self, hero, ItWrWorldmap_Orc, 1);
}; 

//---------------------------------------------------------------------
//	Info FIGHT
//---------------------------------------------------------------------
instance  Info_OrcShaman_FIGHT (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_FIGHT_Condition;
	information	= Info_OrcShaman_FIGHT_Info;
	important	= 0;
	permanent	= 0;
	description = "И похоже, прорываться туда придется с боем!";
};

FUNC int  Info_OrcShaman_FIGHT_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_INTEMPLE))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_FIGHT_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_FIGHT_15_01"); //И похоже, прорываться туда придется с боем!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_02"); //Дома братья очень сильные! Братьев быть оооочень много!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_03"); //Незнакомец, не ходи! Много воинов! Незнакомец умрет.
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_04"); //Дома быть другие сыновья духов. Незнакомец загорится и умрет!
}; 

//---------------------------------------------------------------------
//	Info OTHERWAY
//---------------------------------------------------------------------
instance  Info_OrcShaman_OTHERWAY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_OTHERWAY_Condition;
	information	= Info_OrcShaman_OTHERWAY_Info;
	important	= 0;
	permanent	= 0;
	description = "Ладно, ладно. Но мне действительно нужно попасть в храм!";
};

FUNC int  Info_OrcShaman_OTHERWAY_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_FIGHT))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_OTHERWAY_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_01"); //Ладно, ладно. Но мне действительно нужно попасть в храм!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_02"); //Ур-Шак знает путь! Незнакомец оденет УЛУ-МУЛУ. 
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_03"); //УЛУ-МУЛУ??? Что такое Улу-Мулу?
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_04"); //Быть знаком дружбы. Братья уважают УЛУ-МУЛУ!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_05"); //Незнакомец оденет УЛУ-МУЛУ и не умрет!
};

//---------------------------------------------------------------------
//	Info ULUMULU
//---------------------------------------------------------------------
instance  Info_OrcShaman_ULUMULU (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_ULUMULU_Condition;
	information	= Info_OrcShaman_ULUMULU_Info;
	important	= 0;
	permanent	= 0;
	description = "Где же я возьму эту Улу-Мулу?";
};

FUNC int  Info_OrcShaman_ULUMULU_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_OTHERWAY))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_ULUMULU_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_01"); //Где же я возьму эту Улу-Мулу?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_02"); //Незнакомец пойдет к другу Ур-Шака!
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_03"); //Друг Ур-Шака даст незнакомцу УЛУ-МУЛУ. Незнакомец оденет УЛУ-МУЛУ и не умрет!
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_04"); //Да-да, 'не умрет', я понял. Где искать твоего друга?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_05"); //Друг Ур-Шака у людей, в шахте. Друг не убежал с Ур-Шаком. Друг тогда был болен.

	B_Story_FoundUrShak	();
	
	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Тебя держали в Свободной Шахте?",										Info_OrcShaman_ULUMULU_FM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Ты был рабом в заброшенной шахте?",									Info_OrcShaman_ULUMULU_VM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Ты был в плену на Старой Шахте?",										Info_OrcShaman_ULUMULU_AM);
}; 

func void Info_OrcShaman_ULUMULU_VM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_08"); //Ты был рабом в заброшенной шахте?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_09"); //Ур-Шак не знает такого слова.
};

func void Info_OrcShaman_ULUMULU_AM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_10"); //Ты был в плену на Старой Шахте?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_11"); //Ур-Шак не понимает!
};

func void Info_OrcShaman_ULUMULU_FM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_12"); //Тебя держали в Свободной Шахте?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_13"); //Ур-Шак быть рабом в шахте под деревней, в Лощине.
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_14"); //Ур-Шак думает, что люди называли ее так!

	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
};

//---------------------------------------------------------------------
//	Info BYEBYE
//---------------------------------------------------------------------
instance  Info_OrcShaman_BYEBYE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_BYEBYE_Condition;
	information	= Info_OrcShaman_BYEBYE_Info;
	important	= 0;
	permanent	= 0;
	description = "Спасибо тебе за помощь!";
};

FUNC int  Info_OrcShaman_BYEBYE_Condition()
{	
	if	(Npc_KnowsInfo(hero, Info_OrcShaman_ULUMULU))
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_BYEBYE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_01"); //Спасибо тебе за помощь!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_02"); //Ур-Шак благодарит незнакомца. Незнакомец спас Ур-Шака. Незнакомец и Ур-Шак теперь друзья!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_03"); //Друг получит подарок. Возьмет талисман Ур-Шака. Талисман защитит его от дыхания огненных ящериц.
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_04"); //Ур-шак не может идти домой. Ур-Шак теперь живет здесь! Друг придет, когда нужна помощь!
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_05"); //Ловлю тебя на слове!

	B_Story_FriendOfUrShak	();

	AI_StopProcessInfos(self);
};

//---------------------------------------------------------------------
//	Info FRIENDLYHELLO
//---------------------------------------------------------------------
instance  Info_OrcShaman_FRIENDLYHELLO (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_FRIENDLYHELLO_Condition;
	information	= Info_OrcShaman_FRIENDLYHELLO_Info;
	important	= 0;
	permanent	= 0;
	description = "Как дела, дружище?";
};

FUNC int  Info_OrcShaman_FRIENDLYHELLO_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_OrcShaman_BYEBYE)
	&&	FriendOfUrShak
	{
		return TRUE;
	};
};

FUNC void  Info_OrcShaman_FRIENDLYHELLO_Info()
{
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_01"); //Как дела, дружище?
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_02"); //Ур-Шак быть здоров!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_03"); //Ур-Шак теперь ищет свой УЛУ-МУЛУ!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_04"); //Может быть Ур-Шак вернется со своим УЛУ-МУЛУ домой!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_05"); //Друг пришел, когда нужна помощь!
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_06"); //Всего хорошего!
	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info ORCCITY
//---------------------------------------------------------------------
instance  Info_OrcShaman_ORCCITY (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_ORCCITY_Condition;
	information	= Info_OrcShaman_ORCCITY_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_OrcShaman_ORCCITY_Condition()
{	
	if	(Npc_GetDistToWP(hero, "SPAWN_OW_WARAN_ORC_01")<1000)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_ORCCITY_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(hero, self);

	AI_Output 		(self, hero,"Info_OrcShaman_ORCCITY_17_01"); //Ур-Шак приветствует друга!

	if (Npc_HasItems(hero, UluMulu))
	{
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_02"); //У друга есть УЛУ-МУЛУ! Быть хороший!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_03"); //Друг не забудет нести УЛУ-МУЛУ в руке, когда пойдет по мосту!
	}
	else
	{	
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_04"); //У друга нет УЛУ-МУЛУ! Нехорошо!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_05"); //Друг не пойдет по мосту, иначе умрет!
	};
}; 

//---------------------------------------------------------------------
//	Info YOUHERE
//---------------------------------------------------------------------
instance  Info_OrcShaman_YOUHERE (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_YOUHERE_Condition;
	information	= Info_OrcShaman_YOUHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "Что ты делаешь так близко от города?";
};

FUNC int  Info_OrcShaman_YOUHERE_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_ORCCITY)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_YOUHERE_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_01"); //Что ты делаешь так близко от города?
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_02"); //Ур-Шак смотрит на братьев дома!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_03"); //Ур-Шак думает: КРУШАК скоро проснется!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_04"); //Ур-Шак ждет здесь. Будет сражаться, когда КРУШАК проснется! 
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_05"); //Спящий скоро проснется??? Надеюсь, ты ошибся!
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_06"); //Судя по тому, что я уже слышл об этом демоне, ему лучше оставаться спящим!
}; 

//---------------------------------------------------------------------
//	Info SEAL
//---------------------------------------------------------------------
instance  Info_OrcShaman_SEAL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SEAL_Condition;
	information	= Info_OrcShaman_SEAL_Info;
	important	= 0;
	permanent	= 0;
	description = "Ты сказал, что братья запечатали храм!";
};

FUNC int  Info_OrcShaman_SEAL_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_ORCCITY)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_SEAL_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SEAL_15_01"); //Когда мы встречались в прошлый раз, ты сказал, что братья запечатали храм!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_02"); //Братья Ур-Шака запечатали храм в земле очень хорошо!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_03"); //Друг не может идти туда!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_04"); //Друг использует магию братьев, которые сыновья духов, как Ур-Шак!
}; 

//---------------------------------------------------------------------
//	Info SCROLL
//---------------------------------------------------------------------
instance  Info_OrcShaman_SCROLL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_SCROLL_Condition;
	information	= Info_OrcShaman_SCROLL_Info;
	important	= 0;
	permanent	= 0;
	description = "Где мне искать эту магию?";
};

FUNC int  Info_OrcShaman_SCROLL_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_SEAL)
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_SCROLL_Info()
{
	AI_Output 		(hero, self,"Info_OrcShaman_SCROLL_15_01"); //Где мне искать эту магию?
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_02"); //Должен идти в пещеру братьев, которые сыновья духов, как Ур-Шак!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_03"); //Но друг должен использовать магию осторожно!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_04"); //Братьям Ур-Шака не понравится! УЛУ-МУЛУ не поможет, когда друг использует магию!

	B_LogEntry		(CH4_EnterTemple,"Я снова встретил шамана Ур-Шака перед поселением орков. Он рассказал мне, что попасть в подземный орочий храм я смогу при помощи специального заклинания. Шаманы орков обычно хранят такие заклинания в своих пещерах.");
}; 

//---------------------------------------------------------------------
//	Info IDOL
//---------------------------------------------------------------------
instance  Info_OrcShaman_IDOL (C_INFO)
{
	npc			= ORC_2200_Shaman;
	condition	= Info_OrcShaman_IDOL_Condition;
	information	= Info_OrcShaman_IDOL_Info;
	important	= 0;
	permanent	= 0;
	description = "Есть какой-нибудь другой путь в храм?";
};

FUNC int  Info_OrcShaman_IDOL_Condition()
{	
	if	Npc_KnowsInfo(hero,Info_OrcShaman_SCROLL)
	&&	!OrcCity_Sanctum_OuterGateOpen
	{
		return TRUE;
	};

};
FUNC void  Info_OrcShaman_IDOL_Info()
{
	//SN: fliegt raus, da der Hinweis jetzt sofort nach dem Hinweis mit der Scroll gegeben wird.
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_01"); //Ich habe den Teleportzauber verbraucht und das Gitter zur Tempelvorhalle lдsst sich nicht цffnen!
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_02"); //Wie komme ich jetzt wieder in den Tempel?

	if	Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01) 
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_03"); //Друг нашел символ на колонне!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_04"); //Теперь друг может открыть врата храма!

		B_LogEntry	(CH4_EnterTemple,"В храм ведет и другой путь. Нужно использовать символ Спящего со священного столба орочьих шаманов. Он откроет дверь в храм.");
	}
	else
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_05"); //Теперь друг должен взять символ у колонны!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_06"); //Теперь символ открывать врата храма!

		B_LogEntry	(CH4_EnterTemple,"Есть и другой путь в храм. На священном столбе орочьих шаманов имеется символ Спящего. Если я использую его, то это явно не добавит благодушия братьям Ур-Шака.");
	};
}; 

