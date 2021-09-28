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
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_01"); //Podziêkowaæ, Obcy!
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_02"); //Z³y Orkowie chcieli mnie zabiæ.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_03"); //Kiedyœ brat - dzisiaj wróg.
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
	description = "Kim jesteœ?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_WHO_15_01"); //Kim jesteœ?
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_02"); //Jestem Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_03"); //Jestem syn-ducha. Ludzie mówi¹ - Szaman.
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
	description = "Sk¹d nauczy³eœ siê naszego jêzyka?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_TONGUE_15_01"); //Sk¹d nauczy³eœ siê naszego jêzyka?
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
	description = "By³eœ niewolnikiem w kopalni? A w której?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_MINE_15_01"); //By³eœ niewolnikiem w kopalni? A w której?
	AI_Output 		(self, hero,"Info_OrcShaman_MINE_17_02"); //Kopalnia pod wiosk¹ w Kotle.
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
	description = "Dlaczego twoi bracia walcz¹ z tob¹?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_WHY_15_01"); //Dlaczego twoi bracia walcz¹ z tob¹?
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_02"); //Ur-Shak w nie³asce.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_03"); //Nie wierzyæ w KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_04"); //KRUSHAK jest z³y demon.
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
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_02"); //Ludzie mówi¹ - SPAÆ.
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_03"); //Masz na myœli Œni¹cego?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_04"); //Tak, ludzie mówi¹ ŒNI¥CY!
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
	description = "Co wiesz o Œni¹cym?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_01"); //Co wiesz o Œni¹cym?
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_02"); //By³o piêciu braci, du¿o zim temu.
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_03"); //Oni syn-ducha, jak Ur-Shak!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_04"); //Masz na myœli piêciu szamanów!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_05"); //Wezwali KRUSHAK!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_06"); //Chcieli pokonaæ z³y klan!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_07"); //Piêciu braci zbudowa³o œwi¹tynia dla KRUSHAK. Pod ziemi¹.
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_08"); //Podziemna œwi¹tynia Œni¹cego! Zapewne to mia³ na myœli Xardas mówi¹c, ¿e wejœcie znajduje siê w mieœcie Orków.
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
	description = "Co siê sta³o w podziemnej œwi¹tyni?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_01"); //Co siê sta³o w podziemnej œwi¹tyni?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_02"); //Bracia dali serca dla KRUSHAK!
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_03"); //Ale KRUSHAK z³y, rzuci³ kl¹twê na wszystkich co budowali mu dom.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_04"); //Bracia bez serc - i ¿yj¹ i nie. Tak i tak!
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_05"); //KRUSHAK ma serca braci. Serce da mu moc!
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_06"); //Co sta³o siê z budowniczymi, którzy wznieœli œwi¹tyniê Œni¹cego?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_07"); //Wszyscy przeklêci. Wszyscy. ¯ywi i martwi, tak i tak. Wszyscy.
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
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_02"); //Oni zamkn¹æ œwi¹tyniê. Dziœ bracia modl¹ siê do KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_03"); //KRUSHAK dostaje ofiary, ¿eby nie by³ z³y.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_04"); //Ur-Shak myœli, ¿e ofiary nie dobre. Powiedzia³, ¿e KRUSHAK z³y!
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_05"); //Bracia nie chc¹ s³uchaæ. Mówi¹ Ur-Shak iœæ. Biæ Ur-Shak.
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
	description = "Muszê siê dostaæ do tej podziemnej œwi¹tyni. Mo¿esz mnie tam zaprowadziæ?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_01"); //Muszê siê dostaæ do tej podziemnej œwi¹tyni. Mo¿esz mnie tam zaprowadziæ?
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_02"); //Ur-Shak dziêkuje Obcy. Obcy uratowa³ Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_03"); //Ale wejœcie do œwi¹tyni jest w domu. Ur-Shak nie mo¿e tam iœæ.
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_04"); //Rozumiem. Obawiasz siê, ¿e twoi pobratymcy nie wpuszcz¹ ciê do miasta.
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
	description = "Mo¿esz zaznaczyæ na mojej mapie po³o¿enie waszego miasta?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_01"); //Mo¿esz zaznaczyæ na mojej mapie po³o¿enie waszego miasta?
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_02"); //Dom Ur-Shaka tam, gdzie mapa pusta.
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_03"); //Obcy da mapê, Ur-Shak skoñczy mapê!
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_04"); //(Rysuje mapê)
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_05"); //Niesamowite! Nie lada z ciebie kartograf! Dziêki!

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
	description = "Trudno, spróbujê siê jakoœ przebiæ do wejœcia.";
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
	AI_Output 		(hero, self,"Info_OrcShaman_FIGHT_15_01"); //Trudno, spróbujê siê jakoœ przebiæ do wejœcia.
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_02"); //Bracia w domu bardzo silni! Bracia baaardzo wielu!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_03"); //Obcy nie iœæ! Du¿o wojowników! Obcy zabity!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_04"); //Inni syn-ducha w domu. Spaliæ Obcy! Zabiæ Obcy!
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
	description = "Dobrze ju¿, dobrze! Ale muszê siê jakoœ dostaæ do tej œwi¹tyni!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_01"); //Dobrze ju¿, dobrze! Ale muszê siê jakoœ dostaæ do tej œwi¹tyni!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_02"); //Ur-Shak wie jak! Obcy weŸmie ULU-MULU!
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_03"); //ULU-MULU? A co to takiego?
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_04"); //Znak przyjaŸni! ULU-MULU! Bracia uszanuj¹!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_05"); //Obcy weŸmie ULU-MULU, to Obcy nie zginie!
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
	description = "Gdzie mogê znaleŸæ to... Ulu-Mulu?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_01"); //Gdzie mogê znaleŸæ to... Ulu-Mulu?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_02"); //Obcy znajdzie przyjaciel Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_03"); //Przyjaciel Ur-Shak da ULU-MULU! Obcy weŸmie ULU-MULU i nie zginie!
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_04"); //W porz¹dku, rozumiem o co ci chodzi, tylko gdzie ja znajdê tego twojego przyjaciela?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_05"); //Przyjaciel Ur-Shak w kopalni! On zosta³. Chory. Nie uciek³.

	B_Story_FoundUrShak	();
	
	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"By³eœ wiêŸniem w Wolnej Kopalni?",										Info_OrcShaman_ULUMULU_FM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"By³eœ niewolnikiem w opuszczonej kopalni?",									Info_OrcShaman_ULUMULU_VM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"By³eœ przetrzymywany w Starej Kopalni?",										Info_OrcShaman_ULUMULU_AM);
}; 

func void Info_OrcShaman_ULUMULU_VM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_08"); //By³eœ niewolnikiem w opuszczonej kopalni?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_09"); //Ur-Shak nie zna s³owo.
};

func void Info_OrcShaman_ULUMULU_AM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_10"); //By³eœ przetrzymywany w Starej Kopalni?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_11"); //Ur-Shak nie rozumie!
};

func void Info_OrcShaman_ULUMULU_FM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_12"); //By³eœ wiêŸniem w Wolnej Kopalni?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_13"); //Ur-Shak niewolnik w kopalni w Kocio³.
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_14"); //Ur-Shak s³ysza³, jak ludzie mówili!

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
	description = "Dziêkujê za pomoc!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_01"); //Dziêkujê za pomoc!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_02"); //Ur-Shak dziêkuje Obcy! Obcy uratowa³ Ur-Shak. Obcy teraz przyjaciel Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_03"); //Przyjaciel weŸmie talizman Ur-Shak. Talizman ochroni przed oddechem smoka!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_04"); //Ur-Shak nie mo¿e iœæ do domu. Ur-Shak zostanie tu! Przyjaciel przyjdzie jak pomoc potrzebna!
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_05"); //Kto wie, mo¿e kiedyœ skorzystam z twojej oferty!

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
	description = "Jak siê masz, przyjacielu!";
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
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_01"); //Jak siê masz, przyjacielu!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_02"); //Ur-Shak zdrowy!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_03"); //Ur-Shak potrzebuje ULU-MULU dla siebie!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_04"); //Mo¿e z ULU-MULU Ur-Shak pójdzie do domu!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_05"); //Przyjaciel przyjdzie, jak pomoc potrzebna!
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_06"); //Trzymaj siê!
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
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_05"); //Przyjaciel nie pójdzie przez most! Tam œmieræ!
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
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_03"); //Ur-Shak boi, ¿e KRUSHAK nied³ugo obudzi!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_04"); //Ur-Shak zaczeka. Jak KRUSHAK obudzi, Ur-Shak zaatakuje.
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_05"); //Œni¹cy ma siê wkrótce przebudziæ? Obyœ siê myli³.
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_06"); //Zwa¿ywszy wszystko, czego dowiedzia³em siê o tym demonie, wola³bym, ¿eby siê zbyt szybko nie budzi³!
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
	description = "Mówi³eœ, ¿e twoi bracia zamknêli wejœcie do œwi¹tyni!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SEAL_15_01"); //Podczas naszego ostatniego spotkania powiedzia³eœ, ¿e twoi bracia zamknêli wejœcie do œwi¹tyni!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_02"); //Bracia Ur-Shak zamknêli œwi¹tyniê bardzo mocno!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_03"); //Przyjaciel tam nie wejdzie!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_04"); //Przyjaciel musi u¿yæ magii braci, co s¹ syn-ducha jak Ur-Shak!
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
	description = "Gdzie mogê znaleŸæ tak¹ magiê?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SCROLL_15_01"); //Gdzie mogê znaleŸæ tak¹ magiê?
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_02"); //Musi iœæ do jaskini braci, którzy s¹ syn-ducha jak Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_03"); //Ale trzeba uwa¿aæ z magi¹!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_04"); //Bracia Ur-Shak nie lubi¹! ULU-MULU nie pomo¿e, jak Przyjaciel u¿yje magii!

	B_LogEntry		(CH4_EnterTemple,"Przed miastem orków wpad³em ponownie na Ur-Shaka. Powiedzia³ mi, ¿e jedynym sposobem na dostanie siê do podziemnej œwi¹tyni jest u¿ycie orkowej magii. Pozostali szamani powinni posiadaæ odpowiednie zaklêcia.");
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
	description = "Czy istnieje inna droga do œwi¹tyni?";
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
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_03"); //Przyjaciel znalaz³ figurkê na kolumnie!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_04"); //Przyjaciel mo¿e teraz otworzyæ bramê do œwi¹tyni!

		B_LogEntry	(CH4_EnterTemple,"Jest jeszcze inny sposób na wejœcie do œwi¹tyni. Muszê tylko zdobyæ figurkê Œni¹cego z uœwiêconej kolumny orkowych szamanów. Ona otworzy mi drzwi.");
	}
	else
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_05"); //Przyjaciel musi zabraæ figurkê!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_06"); //Figurka otworzy wejœcie do œwi¹tyni!

		B_LogEntry	(CH4_EnterTemple,"Jest jeszcze inny sposób na wejœcie do œrodka. Na uœwiêconej kolumnie orkowych kap³anów spoczywa figurka Œni¹cego, która jest kluczem do œwi¹tyni. Bracia Ur-Shaka nie bêd¹ zachwyceni, gdy odkryj¹, ¿e u¿ywam ich œwiêtej relikwii.");
	};
}; 

