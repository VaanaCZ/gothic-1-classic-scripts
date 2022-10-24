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
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_01"); //Спасибо чужак!
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_02"); //Плохой орки хотеть убить меня.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_03"); //Братья стать враги.
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
	description = "Кто ты?";
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
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_02"); //Имя Ур-Шак.
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_03"); //Быть сын духа. Люди звать нас шаман.
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
	description = "Откуда ты знаешь язык людей?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_TONGUE_15_01"); //Откуда ты знаешь язык людей?
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_02"); //Ур-Шак быть раб людей в шахта.
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_03"); //Убежать. Много зимы назад убежать.
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
	description = "Ты был рабом в шахте? А в какой?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_MINE_15_01"); //Ты был рабом в шахте? А в какой?
	AI_Output 		(self, hero,"Info_OrcShaman_MINE_17_02"); //Шахта возле деревня в долине.
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
	description = "Почему твои братья хотели убить тебя?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_WHY_15_01"); //Почему твои братья хотели убить тебя?
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_02"); //Они Ур-Шак не любить.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_03"); //Ур-Шак предать их вера в КРУШАК.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_04"); //Считать КРУШАК плохой демон.
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
	description = "А кто такой КРУШАК?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_01"); //А кто такой КРУШАК?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_02"); //Люди звать КРУШАК Спящ.
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_03"); //Ты хочешь сказать Спящий?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_04"); //Да, люди говорить СПЯЩИЙ!
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
	description = "Что ты знаешь о Спящем?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_01"); //Что ты знаешь о Спящем?
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_02"); //Много зим назад быть пять братов!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_03"); //Сыны духа как Ур-Шак.
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_04"); //Так шаманов было пять!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_05"); //Они позвать КРУШАК!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_06"); //Хотеть победить свой враги!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_07"); //Пять братов строить храм под землей для КРУШАК!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_08"); //Подземный храм Спящего! Должно быть, Ксардас говорил как раз о нем, ведь он находится под городом орков.
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
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_02"); //Браты отдать сердце КРУШАКУ.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_03"); //Но КРУШАК плохой. КРУШАК проклинать все, кто строить храм.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_04"); //Браты нет сердца. Не быть ни живой ни мертвый. Стать все вместе.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_05"); //КРУШАК взять сердце браты. В них сила КРУШАК.
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_06"); //А что случилось с теми, кто строил храм?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_07"); //КРУШАК всех проклинать. И строители. Все стали живой и мертвый, то и другое.
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
	description = "А орки, оставшиеся на поверхности, что-нибудь сделали?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_OUTSIDE_15_01"); //А орки, оставшиеся на поверхности, что-нибудь сделали?
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_02"); //Они закрыть храм. Браты сейчас служить КРУШАК.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_03"); //КРУШАК получать жертва и не злиться.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_04"); //Ур-Шак думать жертва плохо. Говорить браты КРУШАК плохой.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_05"); //Они не слушать. Они сказать Ур-Шак уходить. Они побить Ур-Шак.
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
	description = "Я должен попасть в подземный храм.";
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
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_01"); //Я должен попасть в подземный храм. Ты можешь отвести меня туда?
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_02"); //Ур-Шак говорить спасибо чужак. Чужак спасти Ур-Шак.
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_03"); //Только вход в храм в дом Ур-Шак. Ур-Шак не идти в дом.
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_04"); //Так они не пропустят тебя обратно в город, да? 
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
	description = "А ты можешь показать мне на карте, где этот город находится?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_01"); //А ты можешь показать мне на карте, где этот город находится?
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_02"); //Дом Ур-Шак там, на пустой белый карта.
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_03"); //Чужать давать карта, Ур-Шак рисовать дом.
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_04"); //
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_05"); //О! А ты неплохо рисуешь! Спасибо!

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
	description = "Да, похоже, мне там придется пробивать дорогу мечом!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_FIGHT_15_01"); //Да, похоже, мне там придется пробивать дорогу мечом!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_02"); //Дома браты очень сильный! Они очень много быть!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_03"); //Чужак не ходить! Много солдаты! Чужак умереть.
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_04"); //Дома быть другие сыны духа. Сделать чужак гореть и умереть.
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
	description = "Да, это понятно, но мне все равно придется туда попасть!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_01"); //Да, это понятно, но мне все равно придется туда попасть!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_02"); //Ур-Шак знать один способ! Чужак надеть Улу-Мулу.
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_03"); //Улу-Мулу? А что это такое?
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_04"); //Быть знак дружбы. Браты уважать Улу-Мулу.
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_05"); //Чужак одеть Улу-Мулу и не умереть!
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
	description = "А где мне достать эту самую Улу-Мулу?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_01"); //А где мне достать эту самую Улу-Мулу?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_02"); //Чужак ходить к друг Ур-Шак!
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_03"); //Друг Ур-Шак давать чужак Улу-Мулу. Чужак одеть Улу-Мулу и не умереть!
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_04"); //Да, да, то что с этой штукой я 'не умереть', я уже понял. Но где я найду твоего друга?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_05"); //Друг Ур-Шак в шахта жить, у людей. Друг не убежать с Ур-Шак. Друг сильно болеть.

	B_Story_FoundUrShak	();
	
	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
	Info_AddChoice		(Info_OrcShaman_ULUMULU, "Ты работал в Свободной шахте?",										Info_OrcShaman_ULUMULU_FM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU, "Ты работал в Заброшенной шахте?",									Info_OrcShaman_ULUMULU_VM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU, "Ты работал в Старой шахте?",										Info_OrcShaman_ULUMULU_AM);
}; 

func void Info_OrcShaman_ULUMULU_VM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_08"); //Ты работал в Заброшенной шахте?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_09"); //Ур-Шак не понимать.
};

func void Info_OrcShaman_ULUMULU_AM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_10"); //Ты работал в Старой шахте?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_11"); //Ур-Шак не понимать.
};

func void Info_OrcShaman_ULUMULU_FM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_12"); //Ты работал в Свободной шахте?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_13"); //Ур-Шак быть раб в шахте под деревня.
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_14"); //Ур-Шак думать люди называть шахта так.

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
	description = "Спасибо за помощь.";
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
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_01"); //Спасибо за помощь.
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_02"); //Ур-Шак говорить чужак спасибо. Чужак спасать Ур-Шак. Теперь чужак друг!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_03"); //Друг получать подарок. Знак Ур-Шак. Знак зищищать от огонь ящерица огня.
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_04"); //Ур-Шак не может домой. Ур-Шак теперь жить здесь. Друг приходить когда нужен помощь.
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_05"); //Возможно, я этим когда-нибудь воспользуюсь.

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
	description = "Как у тебя дела?";
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
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_01"); //Как у тебя дела?
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_02"); //Ур-Шак быть здоровый!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_03"); //Ур-Шак теперь искать свой Улу-Мулу!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_04"); //Может Ур-Шак вернуться домой с Улу-Мулу.
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_05"); //Друг приходить, когда нужен помощь!
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_06"); //Береги себя!
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

	AI_Output 		(self, hero,"Info_OrcShaman_ORCCITY_17_01"); //Ур-Шак говорить друг привет!

	if (Npc_HasItems(hero, UluMulu))
	{
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_02"); //Друг найти Улу-Мулу! Какой хороший!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_03"); //Друг не забыть нести Улу-Мулу в руке, когда идти на мост!
	}
	else
	{	
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_04"); //Друг не найти Улу-Мулу! Плохо!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_05"); //Друг не идти на мост, а то умереть!
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
	description = "Что ты делаешь так близко к городу орков?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_01"); //Что ты делаешь так близко к городу орков?
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_02"); //Ур-Шак смотреть на братья из дома!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_03"); //Ур-Шак думать КРУШАК хотеть просыпаться скоро!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_04"); //Ур-Шак здесь ждать и драться против КРУШАК, когда он проснуться!
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_05"); //Так Спящий действительно может проснуться? А ты не ошибаешься?
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_06"); //Я кое-что слышал об этом демоне. Судя по всему, всем будет лучше, если он так и останется спать.
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
	description = "В прошлый раз ты рассказывал, что твои братья запечатали храм.";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SEAL_15_01"); //В прошлый раз ты рассказывал, что твои братья запечатали храм.
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_02"); //Братья Ур-Шак закрыть храм в земле очень хорошо!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_03"); //Друг нельзя идти в храм!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_04"); //Друг использовать магия братья, сыны духа как Ур-Шак!
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
	description = "Где я найду это заклинание?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SCROLL_15_01"); //Где я найду это заклинание?
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_02"); //Друг идти в пещера где братья сыны духа как Ур-Шак!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_03"); //Но друг надо делать магия осторожно!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_04"); //Братья Ур-Шак не любить! Улу-Мулу не помочь, если друг использовать магия!

	B_LogEntry		(CH4_EnterTemple,	"Я снова встретил шамана Ур-Шака перед городом орков. Он сказал мне, что в подземный храм можно попасть только тогда, когда я прочту специальное орочье заклинание. Другие орки-шаманы хранят такие заклинания в своих норах.");
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
	description = "Есть ли другой путь в храм Спящего?";
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
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_03"); //Друг найти знак, что лежать на колонне!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_04"); //Друг теперь открыть ворота в храм!

		B_LogEntry	(CH4_EnterTemple,	"Есть и другой вход в храм Спящего. Нужно повернуть статую Спящего на священной колонне орков-шаманов. Она откроет путь в храм.");
	}
	else
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_05"); //Друг надо взять знак, что лежать на колонне!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_06"); //Теперь знак открыть врата в храм!

		B_LogEntry	(CH4_EnterTemple,	"В храм Спящего можно попасть и другим путем. На священной колонне стоит статуя Спящего, которая открывает ворота в храм. Но если шаманы заметят меня у своей святыни, они не обрадуются.");
	};
}; 

