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
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_01"); //Podziękować, Obcy!
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_02"); //Zły Orkowie chcieli mnie zabić.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_03"); //Kiedyś brat - dzisiaj wróg.
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
	description = "Kim jesteś?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_WHO_15_01"); //Kim jesteś?
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_02"); //Jestem Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_03"); //Jestem syn-ducha. Ludzie mówią - Szaman.
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
	description = "Skąd nauczyłeś się naszego języka?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_TONGUE_15_01"); //Skąd nauczyłeś się naszego języka?
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_02"); //Ur-Shak niewolnik ludzi z kopalni.
	AI_Output 		(self, hero,"Info_OrcShaman_TONGUE_17_03"); //Uciec. To wiele zim temu.
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
	description = "Byłeś niewolnikiem w kopalni? A w której?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_MINE_15_01"); //Byłeś niewolnikiem w kopalni? A w której?
	AI_Output 		(self, hero,"Info_OrcShaman_MINE_17_02"); //Kopalnia pod wioską w Kotle.
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
	description = "Dlaczego twoi bracia walczą z tobą?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_WHY_15_01"); //Dlaczego twoi bracia walczą z tobą?
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_02"); //Ur-Shak w niełasce.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_03"); //Nie wierzyć w KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_04"); //KRUSHAK jest zły demon.
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
	description = "KRUSHAK? Co to takiego?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_01"); //KRUSHAK? Co to takiego?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_02"); //Ludzie mówią - SPAĆ.
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_03"); //Masz na myśli Śniącego?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_04"); //Tak, ludzie mówią ŚNIĄCY!
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
	description = "Co wiesz o Śniącym?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_01"); //Co wiesz o Śniącym?
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_02"); //Było pięciu braci, dużo zim temu.
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_03"); //Oni syn-ducha, jak Ur-Shak!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_04"); //Masz na myśli pięciu szamanów!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_05"); //Wezwali KRUSHAK!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_06"); //Chcieli pokonać zły klan!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_07"); //Pięciu braci zbudowało świątynia dla KRUSHAK. Pod ziemią.
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_08"); //Podziemna świątynia Śniącego! Zapewne to miał na myśli Xardas mówiąc, że wejście znajduje się w mieście Orków.
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
	description = "Co się stało w podziemnej świątyni?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_01"); //Co się stało w podziemnej świątyni?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_02"); //Bracia dali serca dla KRUSHAK!
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_03"); //Ale KRUSHAK zły, rzucił klątwę na wszystkich co budowali mu dom.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_04"); //Bracia bez serc - i żyją i nie. Tak i tak!
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_05"); //KRUSHAK ma serca braci. Serce da mu moc!
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_06"); //Co stało się z budowniczymi, którzy wznieśli świątynię Śniącego?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_07"); //Wszyscy przeklęci. Wszyscy. Żywi i martwi, tak i tak. Wszyscy.
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
	description = "A Orkowie na powierzchni nie próbowali temu zapobiec?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_OUTSIDE_15_01"); //A Orkowie na powierzchni nie próbowali temu zapobiec?
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_02"); //Oni zamknąć świątynię. Dziś bracia modlą się do KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_03"); //KRUSHAK dostaje ofiary, żeby nie był zły.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_04"); //Ur-Shak myśli, że ofiary nie dobre. Powiedział, że KRUSHAK zły!
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_05"); //Bracia nie chcą słuchać. Mówią Ur-Shak iść. Bić Ur-Shak.
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
	description = "Muszę się dostać do tej podziemnej świątyni. Możesz mnie tam zaprowadzić?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_01"); //Muszę się dostać do tej podziemnej świątyni. Możesz mnie tam zaprowadzić?
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_02"); //Ur-Shak dziękuje Obcy. Obcy uratował Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_03"); //Ale wejście do świątyni jest w domu. Ur-Shak nie może tam iść.
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_04"); //Rozumiem. Obawiasz się, że twoi pobratymcy nie wpuszczą cię do miasta.
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
	description = "Możesz zaznaczyć na mojej mapie położenie waszego miasta?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_01"); //Możesz zaznaczyć na mojej mapie położenie waszego miasta?
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_02"); //Dom Ur-Shaka tam, gdzie mapa pusta.
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_03"); //Obcy da mapę, Ur-Shak skończy mapę!
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_04"); //(Rysuje mapę)
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_05"); //Niesamowite! Nie lada z ciebie kartograf! Dzięki!

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
	description = "Trudno, spróbuję się jakoś przebić do wejścia.";
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
	AI_Output 		(hero, self,"Info_OrcShaman_FIGHT_15_01"); //Trudno, spróbuję się jakoś przebić do wejścia.
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_02"); //Bracia w domu bardzo silni! Bracia baaardzo wielu!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_03"); //Obcy nie iść! Dużo wojowników! Obcy zabity!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_04"); //Inni syn-ducha w domu. Spalić Obcy! Zabić Obcy!
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
	description = "Dobrze już, dobrze! Ale muszę się jakoś dostać do tej świątyni!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_01"); //Dobrze już, dobrze! Ale muszę się jakoś dostać do tej świątyni!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_02"); //Ur-Shak wie jak! Obcy weźmie ULU-MULU!
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_03"); //ULU-MULU? A co to takiego?
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_04"); //Znak przyjaźni! ULU-MULU! Bracia uszanują!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_05"); //Obcy weźmie ULU-MULU, to Obcy nie zginie!
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
	description = "Gdzie mogę znaleźć to... Ulu-Mulu?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_01"); //Gdzie mogę znaleźć to... Ulu-Mulu?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_02"); //Obcy znajdzie przyjaciel Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_03"); //Przyjaciel Ur-Shak da ULU-MULU! Obcy weźmie ULU-MULU i nie zginie!
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_04"); //W porządku, rozumiem o co ci chodzi, tylko gdzie ja znajdę tego twojego przyjaciela?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_05"); //Przyjaciel Ur-Shak w kopalni! On został. Chory. Nie uciekł.

	B_Story_FoundUrShak	();
	
	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Byłeś więźniem w Wolnej Kopalni?",										Info_OrcShaman_ULUMULU_FM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Byłeś niewolnikiem w opuszczonej kopalni?",									Info_OrcShaman_ULUMULU_VM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"Byłeś przetrzymywany w Starej Kopalni?",										Info_OrcShaman_ULUMULU_AM);
}; 

func void Info_OrcShaman_ULUMULU_VM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_08"); //Byłeś niewolnikiem w opuszczonej kopalni?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_09"); //Ur-Shak nie zna słowo.
};

func void Info_OrcShaman_ULUMULU_AM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_10"); //Byłeś przetrzymywany w Starej Kopalni?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_11"); //Ur-Shak nie rozumie!
};

func void Info_OrcShaman_ULUMULU_FM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_12"); //Byłeś więźniem w Wolnej Kopalni?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_13"); //Ur-Shak niewolnik w kopalni w Kocioł.
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_14"); //Ur-Shak słyszał, jak ludzie mówili!

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
	description = "Dziękuję za pomoc!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_01"); //Dziękuję za pomoc!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_02"); //Ur-Shak dziękuje Obcy! Obcy uratował Ur-Shak. Obcy teraz przyjaciel Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_03"); //Przyjaciel weźmie talizman Ur-Shak. Talizman ochroni przed oddechem smoka!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_04"); //Ur-Shak nie może iść do domu. Ur-Shak zostanie tu! Przyjaciel przyjdzie jak pomoc potrzebna!
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_05"); //Kto wie, może kiedyś skorzystam z twojej oferty!

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
	description = "Jak się masz, przyjacielu!";
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
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_01"); //Jak się masz, przyjacielu!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_02"); //Ur-Shak zdrowy!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_03"); //Ur-Shak potrzebuje ULU-MULU dla siebie!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_04"); //Może z ULU-MULU Ur-Shak pójdzie do domu!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_05"); //Przyjaciel przyjdzie, jak pomoc potrzebna!
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_06"); //Trzymaj się!
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

	AI_Output 		(self, hero,"Info_OrcShaman_ORCCITY_17_01"); //Ur-Shak pozdrawia Przyjaciel!

	if (Npc_HasItems(hero, UluMulu))
	{
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_02"); //Przyjaciel ma ULU-MULU! Dobrze!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_03"); //Przyjaciel trzyma ULU-MULU, jak przechodzi przez most!
	}
	else
	{	
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_04"); //Przyjaciel nie ma ULU-MULU! Nie dobrze!
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_05"); //Przyjaciel nie pójdzie przez most! Tam śmierć!
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
	description = "Co robisz tak blisko miasta?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_01"); //Co robisz tak blisko miasta?
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_02"); //Ur-Shak obserwuje braci w domu.
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_03"); //Ur-Shak boi, że KRUSHAK niedługo obudzi!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_04"); //Ur-Shak zaczeka. Jak KRUSHAK obudzi, Ur-Shak zaatakuje.
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_05"); //Śniący ma się wkrótce przebudzić? Obyś się mylił.
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_06"); //Zważywszy wszystko, czego dowiedziałem się o tym demonie, wolałbym, żeby się zbyt szybko nie budził!
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
	description = "Mówiłeś, że twoi bracia zamknęli wejście do świątyni!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SEAL_15_01"); //Podczas naszego ostatniego spotkania powiedziałeś, że twoi bracia zamknęli wejście do świątyni!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_02"); //Bracia Ur-Shak zamknęli świątynię bardzo mocno!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_03"); //Przyjaciel tam nie wejdzie!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_04"); //Przyjaciel musi użyć magii braci, co są syn-ducha jak Ur-Shak!
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
	description = "Gdzie mogę znaleźć taką magię?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SCROLL_15_01"); //Gdzie mogę znaleźć taką magię?
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_02"); //Musi iść do jaskini braci, którzy są syn-ducha jak Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_03"); //Ale trzeba uważać z magią!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_04"); //Bracia Ur-Shak nie lubią! ULU-MULU nie pomoże, jak Przyjaciel użyje magii!

	B_LogEntry		(CH4_EnterTemple,"Przed miastem orków wpadłem ponownie na Ur-Shaka. Powiedział mi, że jedynym sposobem na dostanie się do podziemnej świątyni jest użycie orkowej magii. Pozostali szamani powinni posiadać odpowiednie zaklęcia.");
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
	description = "Czy istnieje inna droga do świątyni?";
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
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_01"); //Ich habe den Teleportzauber verbraucht und das Gitter zur Tempelvorhalle lässt sich nicht öffnen!
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_02"); //Wie komme ich jetzt wieder in den Tempel?

	if	Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01) 
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_03"); //Przyjaciel znalazł figurkę na kolumnie!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_04"); //Przyjaciel może teraz otworzyć bramę do świątyni!

		B_LogEntry	(CH4_EnterTemple,"Jest jeszcze inny sposób na wejście do świątyni. Muszę tylko zdobyć figurkę Śniącego z uświęconej kolumny orkowych szamanów. Ona otworzy mi drzwi.");
	}
	else
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_05"); //Przyjaciel musi zabrać figurkę!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_06"); //Figurka otworzy wejście do świątyni!

		B_LogEntry	(CH4_EnterTemple,"Jest jeszcze inny sposób na wejście do środka. Na uświęconej kolumnie orkowych kapłanów spoczywa figurka Śniącego, która jest kluczem do świątyni. Bracia Ur-Shaka nie będą zachwyceni, gdy odkryją, że używam ich świętej relikwii.");
	};
}; 

