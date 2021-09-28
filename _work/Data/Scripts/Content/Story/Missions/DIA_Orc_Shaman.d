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
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_01"); //Podzi�kowa�, Obcy!
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_02"); //Z�y Orkowie chcieli mnie zabi�.
	AI_Output 		(self, hero,"Info_OrcShaman_THX_17_03"); //Kiedy� brat - dzisiaj wr�g.
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
	description = "Kim jeste�?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_WHO_15_01"); //Kim jeste�?
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_02"); //Jestem Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_WHO_17_03"); //Jestem syn-ducha. Ludzie m�wi� - Szaman.
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
	description = "Sk�d nauczy�e� si� naszego j�zyka?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_TONGUE_15_01"); //Sk�d nauczy�e� si� naszego j�zyka?
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
	description = "By�e� niewolnikiem w kopalni? A w kt�rej?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_MINE_15_01"); //By�e� niewolnikiem w kopalni? A w kt�rej?
	AI_Output 		(self, hero,"Info_OrcShaman_MINE_17_02"); //Kopalnia pod wiosk� w Kotle.
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
	description = "Dlaczego twoi bracia walcz� z tob�?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_WHY_15_01"); //Dlaczego twoi bracia walcz� z tob�?
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_02"); //Ur-Shak w nie�asce.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_03"); //Nie wierzy� w KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_WHY_17_04"); //KRUSHAK jest z�y demon.
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
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_02"); //Ludzie m�wi� - SPA�.
	AI_Output 		(hero, self,"Info_OrcShaman_KRUSHAK_15_03"); //Masz na my�li �ni�cego?
	AI_Output 		(self, hero,"Info_OrcShaman_KRUSHAK_17_04"); //Tak, ludzie m�wi� �NI�CY!
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
	description = "Co wiesz o �ni�cym?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_01"); //Co wiesz o �ni�cym?
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_02"); //By�o pi�ciu braci, du�o zim temu.
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_03"); //Oni syn-ducha, jak Ur-Shak!
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_04"); //Masz na my�li pi�ciu szaman�w!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_05"); //Wezwali KRUSHAK!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_06"); //Chcieli pokona� z�y klan!
	AI_Output 		(self, hero,"Info_OrcShaman_SLEEPER_17_07"); //Pi�ciu braci zbudowa�o �wi�tynia dla KRUSHAK. Pod ziemi�.
	AI_Output 		(hero, self,"Info_OrcShaman_SLEEPER_15_08"); //Podziemna �wi�tynia �ni�cego! Zapewne to mia� na my�li Xardas m�wi�c, �e wej�cie znajduje si� w mie�cie Ork�w.
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
	description = "Co si� sta�o w podziemnej �wi�tyni?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_01"); //Co si� sta�o w podziemnej �wi�tyni?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_02"); //Bracia dali serca dla KRUSHAK!
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_03"); //Ale KRUSHAK z�y, rzuci� kl�tw� na wszystkich co budowali mu dom.
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_04"); //Bracia bez serc - i �yj� i nie. Tak i tak!
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_05"); //KRUSHAK ma serca braci. Serce da mu moc!
	AI_Output 		(hero, self,"Info_OrcShaman_CURSE_15_06"); //Co sta�o si� z budowniczymi, kt�rzy wznie�li �wi�tyni� �ni�cego?
	AI_Output 		(self, hero,"Info_OrcShaman_CURSE_17_07"); //Wszyscy przekl�ci. Wszyscy. �ywi i martwi, tak i tak. Wszyscy.
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
	description = "A Orkowie na powierzchni nie pr�bowali temu zapobiec?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_OUTSIDE_15_01"); //A Orkowie na powierzchni nie pr�bowali temu zapobiec?
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_02"); //Oni zamkn�� �wi�tyni�. Dzi� bracia modl� si� do KRUSHAK.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_03"); //KRUSHAK dostaje ofiary, �eby nie by� z�y.
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_04"); //Ur-Shak my�li, �e ofiary nie dobre. Powiedzia�, �e KRUSHAK z�y!
	AI_Output 		(self, hero,"Info_OrcShaman_OUTSIDE_17_05"); //Bracia nie chc� s�ucha�. M�wi� Ur-Shak i��. Bi� Ur-Shak.
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
	description = "Musz� si� dosta� do tej podziemnej �wi�tyni. Mo�esz mnie tam zaprowadzi�?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_01"); //Musz� si� dosta� do tej podziemnej �wi�tyni. Mo�esz mnie tam zaprowadzi�?
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_02"); //Ur-Shak dzi�kuje Obcy. Obcy uratowa� Ur-Shak.
	AI_Output 		(self, hero,"Info_OrcShaman_INTEMPLE_17_03"); //Ale wej�cie do �wi�tyni jest w domu. Ur-Shak nie mo�e tam i��.
	AI_Output 		(hero, self,"Info_OrcShaman_INTEMPLE_15_04"); //Rozumiem. Obawiasz si�, �e twoi pobratymcy nie wpuszcz� ci� do miasta.
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
	description = "Mo�esz zaznaczy� na mojej mapie po�o�enie waszego miasta?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_01"); //Mo�esz zaznaczy� na mojej mapie po�o�enie waszego miasta?
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_02"); //Dom Ur-Shaka tam, gdzie mapa pusta.
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_03"); //Obcy da map�, Ur-Shak sko�czy map�!
	AI_Output 		(self, hero,"Info_OrcShaman_MAP_17_04"); //(Rysuje map�)
	AI_Output 		(hero, self,"Info_OrcShaman_MAP_15_05"); //Niesamowite! Nie lada z ciebie kartograf! Dzi�ki!

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
	description = "Trudno, spr�buj� si� jako� przebi� do wej�cia.";
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
	AI_Output 		(hero, self,"Info_OrcShaman_FIGHT_15_01"); //Trudno, spr�buj� si� jako� przebi� do wej�cia.
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_02"); //Bracia w domu bardzo silni! Bracia baaardzo wielu!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_03"); //Obcy nie i��! Du�o wojownik�w! Obcy zabity!
	AI_Output 		(self, hero,"Info_OrcShaman_FIGHT_17_04"); //Inni syn-ducha w domu. Spali� Obcy! Zabi� Obcy!
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
	description = "Dobrze ju�, dobrze! Ale musz� si� jako� dosta� do tej �wi�tyni!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_01"); //Dobrze ju�, dobrze! Ale musz� si� jako� dosta� do tej �wi�tyni!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_02"); //Ur-Shak wie jak! Obcy we�mie ULU-MULU!
	AI_Output 		(hero, self,"Info_OrcShaman_OTHERWAY_15_03"); //ULU-MULU? A co to takiego?
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_04"); //Znak przyja�ni! ULU-MULU! Bracia uszanuj�!
	AI_Output 		(self, hero,"Info_OrcShaman_OTHERWAY_17_05"); //Obcy we�mie ULU-MULU, to Obcy nie zginie!
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
	description = "Gdzie mog� znale�� to... Ulu-Mulu?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_01"); //Gdzie mog� znale�� to... Ulu-Mulu?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_02"); //Obcy znajdzie przyjaciel Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_03"); //Przyjaciel Ur-Shak da ULU-MULU! Obcy we�mie ULU-MULU i nie zginie!
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_04"); //W porz�dku, rozumiem o co ci chodzi, tylko gdzie ja znajd� tego twojego przyjaciela?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_05"); //Przyjaciel Ur-Shak w kopalni! On zosta�. Chory. Nie uciek�.

	B_Story_FoundUrShak	();
	
	Info_ClearChoices	(Info_OrcShaman_ULUMULU);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"By�e� wi�niem w Wolnej Kopalni?",										Info_OrcShaman_ULUMULU_FM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"By�e� niewolnikiem w opuszczonej kopalni?",									Info_OrcShaman_ULUMULU_VM);
	Info_AddChoice		(Info_OrcShaman_ULUMULU,"By�e� przetrzymywany w Starej Kopalni?",										Info_OrcShaman_ULUMULU_AM);
}; 

func void Info_OrcShaman_ULUMULU_VM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_08"); //By�e� niewolnikiem w opuszczonej kopalni?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_09"); //Ur-Shak nie zna s�owo.
};

func void Info_OrcShaman_ULUMULU_AM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_10"); //By�e� przetrzymywany w Starej Kopalni?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_11"); //Ur-Shak nie rozumie!
};

func void Info_OrcShaman_ULUMULU_FM ()
{
	AI_Output 		(hero, self,"Info_OrcShaman_ULUMULU_15_12"); //By�e� wi�niem w Wolnej Kopalni?
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_13"); //Ur-Shak niewolnik w kopalni w Kocio�.
	AI_Output 		(self, hero,"Info_OrcShaman_ULUMULU_17_14"); //Ur-Shak s�ysza�, jak ludzie m�wili!

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
	description = "Dzi�kuj� za pomoc!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_01"); //Dzi�kuj� za pomoc!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_02"); //Ur-Shak dzi�kuje Obcy! Obcy uratowa� Ur-Shak. Obcy teraz przyjaciel Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_03"); //Przyjaciel we�mie talizman Ur-Shak. Talizman ochroni przed oddechem smoka!
	AI_Output 		(self, hero,"Info_OrcShaman_BYEBYE_17_04"); //Ur-Shak nie mo�e i�� do domu. Ur-Shak zostanie tu! Przyjaciel przyjdzie jak pomoc potrzebna!
	AI_Output 		(hero, self,"Info_OrcShaman_BYEBYE_15_05"); //Kto wie, mo�e kiedy� skorzystam z twojej oferty!

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
	description = "Jak si� masz, przyjacielu!";
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
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_01"); //Jak si� masz, przyjacielu!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_02"); //Ur-Shak zdrowy!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_03"); //Ur-Shak potrzebuje ULU-MULU dla siebie!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_04"); //Mo�e z ULU-MULU Ur-Shak p�jdzie do domu!
	AI_Output 			(self, hero,"Info_OrcShaman_FRIENDLYHELLO_17_05"); //Przyjaciel przyjdzie, jak pomoc potrzebna!
	AI_Output 			(hero, self,"Info_OrcShaman_FRIENDLYHELLO_15_06"); //Trzymaj si�!
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
		AI_Output 	(self, hero,"Info_OrcShaman_ORCCITY_17_05"); //Przyjaciel nie p�jdzie przez most! Tam �mier�!
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
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_03"); //Ur-Shak boi, �e KRUSHAK nied�ugo obudzi!
	AI_Output 		(self, hero,"Info_OrcShaman_YOUHERE_17_04"); //Ur-Shak zaczeka. Jak KRUSHAK obudzi, Ur-Shak zaatakuje.
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_05"); //�ni�cy ma si� wkr�tce przebudzi�? Oby� si� myli�.
	AI_Output 		(hero, self,"Info_OrcShaman_YOUHERE_15_06"); //Zwa�ywszy wszystko, czego dowiedzia�em si� o tym demonie, wola�bym, �eby si� zbyt szybko nie budzi�!
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
	description = "M�wi�e�, �e twoi bracia zamkn�li wej�cie do �wi�tyni!";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SEAL_15_01"); //Podczas naszego ostatniego spotkania powiedzia�e�, �e twoi bracia zamkn�li wej�cie do �wi�tyni!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_02"); //Bracia Ur-Shak zamkn�li �wi�tyni� bardzo mocno!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_03"); //Przyjaciel tam nie wejdzie!
	AI_Output 		(self, hero,"Info_OrcShaman_SEAL_17_04"); //Przyjaciel musi u�y� magii braci, co s� syn-ducha jak Ur-Shak!
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
	description = "Gdzie mog� znale�� tak� magi�?";
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
	AI_Output 		(hero, self,"Info_OrcShaman_SCROLL_15_01"); //Gdzie mog� znale�� tak� magi�?
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_02"); //Musi i�� do jaskini braci, kt�rzy s� syn-ducha jak Ur-Shak!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_03"); //Ale trzeba uwa�a� z magi�!
	AI_Output 		(self, hero,"Info_OrcShaman_SCROLL_17_04"); //Bracia Ur-Shak nie lubi�! ULU-MULU nie pomo�e, jak Przyjaciel u�yje magii!

	B_LogEntry		(CH4_EnterTemple,"Przed miastem ork�w wpad�em ponownie na Ur-Shaka. Powiedzia� mi, �e jedynym sposobem na dostanie si� do podziemnej �wi�tyni jest u�ycie orkowej magii. Pozostali szamani powinni posiada� odpowiednie zakl�cia.");
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
	description = "Czy istnieje inna droga do �wi�tyni?";
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
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_01"); //Ich habe den Teleportzauber verbraucht und das Gitter zur Tempelvorhalle l�sst sich nicht �ffnen!
	//AI_Output 	(hero, self,"Info_OrcShaman_IDOL_15_02"); //Wie komme ich jetzt wieder in den Tempel?

	if	Npc_HasItems(hero,ItMi_Stuff_Idol_Sleeper_01) 
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_03"); //Przyjaciel znalaz� figurk� na kolumnie!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_04"); //Przyjaciel mo�e teraz otworzy� bram� do �wi�tyni!

		B_LogEntry	(CH4_EnterTemple,"Jest jeszcze inny spos�b na wej�cie do �wi�tyni. Musz� tylko zdoby� figurk� �ni�cego z u�wi�conej kolumny orkowych szaman�w. Ona otworzy mi drzwi.");
	}
	else
	{
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_05"); //Przyjaciel musi zabra� figurk�!
		AI_Output 	(self, hero,"Info_OrcShaman_IDOL_17_06"); //Figurka otworzy wej�cie do �wi�tyni!

		B_LogEntry	(CH4_EnterTemple,"Jest jeszcze inny spos�b na wej�cie do �rodka. Na u�wi�conej kolumnie orkowych kap�an�w spoczywa figurka �ni�cego, kt�ra jest kluczem do �wi�tyni. Bracia Ur-Shaka nie b�d� zachwyceni, gdy odkryj�, �e u�ywam ich �wi�tej relikwii.");
	};
}; 

