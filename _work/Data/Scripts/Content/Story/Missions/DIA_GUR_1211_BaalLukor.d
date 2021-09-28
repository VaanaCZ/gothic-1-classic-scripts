// ************************************************************
// 							EXIT 
// ************************************************************
INSTANCE Info_BaalLukor_EXIT(C_INFO)
{
	npc				= GUR_1211_BaalLukor;
	nr				= 999;
	condition		= Info_BaalLukor_EXIT_Condition;
	information		= Info_BaalLukor_EXIT_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_BaalLukor_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_BaalLukor_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};


//**************************************************************************
//	Info MEET: Erstes Zusammentreffen mit Baal Lukor
//**************************************************************************
INSTANCE Info_BaalLukor_MEET (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_MEET_Condition;
	information	= Info_BaalLukor_MEET_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_MEET_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_MEET_Info()
{
	AI_Output 		(self, other,"Info_BaalLukor_MEET_13_01"); //Dzi�ki za pomoc. Zjawi�e� si� w ostatniej chwili.
	
	B_GiveXP		(XP_SaveBaalLukor);
};

//**************************************************************************
//	Info DEAD
//**************************************************************************
INSTANCE Info_BaalLukor_DEAD (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_DEAD_Condition;
	information	= Info_BaalLukor_DEAD_Info;
	nr			= 20;
	permanent	= 0;
	important 	= 0;
	description = "Po drodze znalaz�em cia�a �wi�tynnych Stra�nik�w! Co si� sta�o?";
};

FUNC INT Info_BaalLukor_DEAD_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_DEAD_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_01"); //Po drodze znalaz�em cia�a �wi�tynnych Stra�nik�w! Co si� sta�o?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_02"); //Mistrz Cor Angar przys�a� nas tutaj, by�my przeszukali jaskinie.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_03"); //Spodziewali�my si� znale�� tu tylko stare groby i rozpadaj�ce si� mumie.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_04"); //Nagle co� poruszy�o si� w ciemno�ciach i dooko�a pojawili si� Orkowie. Nie wiem, czego tam szukali, ale ich obecno�� tutaj jest bardzo niepokoj�ca!
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_05"); //Gdzie s� pozostali Stra�nicy?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_06"); //Nie �yj�! Nie�wiadomie doprowadzi�em do ich zag�ady! Niech �ni�cy zlituje si� nad moj� dusz�!

	B_LogEntry		(CH3_OrcGraveyard,"Ocali�em Guru Baal Lukora od pewnej �mierci z r�k ork�w. Niestety, towarzysz�cy mu Stra�nicy �wi�tynni polegli...");
};

//**************************************************************************
//	Info SUMMONING
//**************************************************************************
INSTANCE Info_BaalLukor_SUMMONING (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SUMMONING_Condition;
	information	= Info_BaalLukor_SUMMONING_Info;
	nr			= 10;
	permanent	= 0;
	important 	= 0;
	description = "Przysy�a mnie Cor Angar.";
};

FUNC INT Info_BaalLukor_SUMMONING_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_SUMMONING_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_01"); //Przysy�a mnie Cor Angar. Odnale�li�cie jakie� �lady �ni�cego?
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_02"); //Jeszcze nie. A co z Y'Berionem? Doszed� ju� do siebie?
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_03"); //Nie, nadal jest nieprzytomny.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_04"); //Musimy zbada� ten kompleks jaski�. Po tych wszystkich straszliwych wydarzeniach nie mog� wr�ci� do Obozu z pustymi r�kami.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_05"); //Ale moje zdolno�ci bojowe s� do�� ograniczone, a Orkowie nie reaguj� na moj� magi� jak ci g�upcy ze Starego Obozu.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_06"); //Skoro przysy�a ci� Bractwo, mo�e pomo�esz mi w badaniu tego cmentarzyska.
};

//**************************************************************************
//	Info HELP
//**************************************************************************
INSTANCE Info_BaalLukor_HELP (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HELP_Condition;
	information	= Info_BaalLukor_HELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "Pomog� ci.";
};

FUNC INT Info_BaalLukor_HELP_Condition()
{
	return Npc_KnowsInfo(hero, Info_BaalLukor_SUMMONING);
};

FUNC VOID Info_BaalLukor_HELP_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_HELP_15_01"); //Pomog� ci.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_02"); //To wspaniale. Z tego pomieszczenia wychodz� trzy korytarze. Powinni�my przeszuka� ka�dy z nich.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //Prowad�. P�jd� za tob�!

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor i ja po��czyli�my si�y. Wsp�lnie wyja�nimy tajemnic� tego miejsca!");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info FOUNDNONE
//**************************************************************************
INSTANCE Info_BaalLukor_FOUNDNONE (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FOUNDNONE_Condition;
	information	= Info_BaalLukor_FOUNDNONE_Info;
	permanent	= 1;
	important 	= 0;
	description = "Nic tu nie ma.";
};

FUNC INT Info_BaalLukor_FOUNDNONE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(BaalLukor_BringParchment == 0)
	&&		!Npc_HasItems(hero, OrkParchmentOne)
	&&		!Npc_HasItems(hero, OrkParchmentTwo)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FOUNDNONE_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDNONE_15_01"); //Nic tu nie ma.
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDNONE_13_02"); //Musimy przeszuka� wszystkie trzy tunele.
	
	
	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info FOUNDONE
//**************************************************************************
INSTANCE Info_BaalLukor_FOUNDONE (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FOUNDONE_Condition;
	information	= Info_BaalLukor_FOUNDONE_Info;
	permanent	= 1;
	important 	= 0;
	description = "Najwyra�niej druga po�owa pergaminu uleg�a zniszczeniu!";
};

FUNC INT Info_BaalLukor_FOUNDONE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(((BaalLukor_BringParchment==1) && !Npc_HasItems(hero, OrkParchmentTwo)) || ((BaalLukor_BringParchment==2) && !Npc_HasItems(hero, OrkParchmentOne)))	)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FOUNDONE_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDONE_15_01"); //Najwyra�niej druga po�owa pergaminu uleg�a zniszczeniu!
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDONE_13_02"); //Druga po�owa musi by� gdzie� w pobli�u! Musimy przeszuka� pozosta�e tunele!
	
	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info FIRSTWAIT
//**************************************************************************
INSTANCE Info_BaalLukor_FIRSTWAIT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FIRSTWAIT_Condition;
	information	= Info_BaalLukor_FIRSTWAIT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_FIRSTWAIT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		(Npc_GetDistToWP(self, "GRYD_040")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FIRSTWAIT_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output 		(self, other,"Info_BaalLukor_FIRSTWAIT_13_01"); //Dalej ju� nie p�jdziemy. Mo�e w tych niszach znajdziemy jak�� wskaz�wk�.

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "WaitInSideTunnelOne");
};

//**************************************************************************
//	Info FIRSTSCROLL
//**************************************************************************
INSTANCE Info_BaalLukor_FIRSTSCROLL (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_FIRSTSCROLL_Condition;
	information	= Info_BaalLukor_FIRSTSCROLL_Info;
	permanent	= 0;
	important 	= 0;
	description = "Znalaz�em fragment pergaminu!";
};

FUNC INT Info_BaalLukor_FIRSTSCROLL_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		Npc_HasItems	(hero, OrkParchmentOne)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_FIRSTSCROLL_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_FIRSTSCROLL_15_01"); //Znalaz�em fragment pergaminu!
	B_GiveInvItems 	(hero, self, OrkParchmentOne,1); //Pergament1 �bergeben
	if (BaalLukor_BringParchment == 2)
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_02"); //Wspaniale! To druga po�owa zwoju z zakl�ciem Ork�w!
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_03"); //To mi wygl�da na zw�j z zakl�ciem Ork�w. Niestety, zosta� przerwany na p�.
		AI_Output 	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_04"); //Gdzie� musi by� druga po�owa tego pergaminu!
		AI_StopProcessInfos	(self);
		BaalLukor_BringParchment = 1;
	};
	
	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info SECONDWAIT
//**************************************************************************
INSTANCE Info_BaalLukor_SECONDWAIT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SECONDWAIT_Condition;
	information	= Info_BaalLukor_SECONDWAIT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_SECONDWAIT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		(Npc_GetDistToWP(self, "GRYD_047")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_SECONDWAIT_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output 		(self, other,"Info_BaalLukor_SECONDWAIT_13_01"); //Hmmm... Ten tunel okaza� si� �lep� uliczk�. Mo�e znajdziemy tutaj jakie� wskaz�wki, kt�re pomog� nam w naszych poszukiwaniach.

	if (!Npc_HasItems	(hero, OrkParchmentTwo)	) 
	{	
		AI_StopProcessInfos	(self);
		Npc_ExchangeRoutine	(self, "WaitInSideTunnelTwo");
	};
};

//**************************************************************************
//	Info SECONDSCROLL
//**************************************************************************
INSTANCE Info_BaalLukor_SECONDSCROLL (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_SECONDSCROLL_Condition;
	information	= Info_BaalLukor_SECONDSCROLL_Info;
	permanent	= 0;
	description = "Znalaz�em fragment pergaminu!";
};

FUNC INT Info_BaalLukor_SECONDSCROLL_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HELP)
	&&		Npc_HasItems	(hero, OrkParchmentTwo)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_SECONDSCROLL_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self,	hero);

	AI_Output 		(other, self,"Info_BaalLukor_SECONDSCROLL_15_01"); //Znalaz�em fragment pergaminu!
	B_GiveInvItems 	(hero, self, OrkParchmentTwo,1); //Pergament2 �bergeben
	if (BaalLukor_BringParchment == 1)
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_02"); //Wspaniale! To druga po�owa zwoju z zakl�ciem Ork�w!
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_03"); //To mi wygl�da na zw�j z zakl�ciem Ork�w. Niestety, zosta� przerwany na p�.
		AI_Output 	(self, other,"Info_BaalLukor_SECONDSCROLL_13_04"); //Gdzie� musi by� druga po�owa tego pergaminu!
		AI_StopProcessInfos	(self);
		BaalLukor_BringParchment = 2;
	};

	Npc_ExchangeRoutine	(self, "Follow");
};

//**************************************************************************
//	Info BOTHSCROLLS
//**************************************************************************
INSTANCE Info_BaalLukor_BOTHSCROLLS (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_BOTHSCROLLS_Condition;
	information	= Info_BaalLukor_BOTHSCROLLS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Co teraz zrobimy z tymi dwoma fragmentami?";
};

FUNC INT Info_BaalLukor_BOTHSCROLLS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_HELP)
	&&		(BaalLukor_BringParchment == 3)				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_BOTHSCROLLS_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_BOTHSCROLLS_15_01"); //Co teraz zrobimy z tymi dwoma fragmentami?
	AI_Output			(self, other,"Info_BaalLukor_BOTHSCROLLS_13_02"); //To dwie po�owy tego samego manuskryptu. Ale nie potrafi� odcyfrowa� tego pisma.

	B_LogEntry		(CH3_OrcGraveyard,"Znale�li�my dwie po��wki orkowego manuskryptu, ale Baal Lukor nie jest w stanie go przet�umaczy�. Musimy szuka� dalej.");

	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info RUNES
//**************************************************************************
INSTANCE Info_BaalLukor_RUNES (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_RUNES_Condition;
	information	= Info_BaalLukor_RUNES_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_RUNES_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_BOTHSCROLLS)
	&&		((Npc_GetDistToWP	(hero, "GRYD_025")<600)	|| (Npc_GetDistToWP(hero, "GRYD_048")<600))	)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_RUNES_Info()
{
	B_FullStop		(hero);
	AI_GotoNpc		(self, hero);

	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_01"); //Czekaj! To interesuj�ce...
	AI_Output 		(other, self,"Info_BaalLukor_RUNES_15_02"); //C�, nie widz� tu nic interesuj�cego.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_03"); //Cicho! Przyjrzyj si� uwa�nie ornamentom zdobi�cym t� jaskini�.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_04"); //Tak, to mi powinno wystarczy� do przet�umaczenia znalezionego przez nas pergaminu.
	B_UseFakeScroll ();
	//AI_Output		(self, other,"Info_BaalLukor_RUNES_13_05"); //...(murmel)...(murmel)...(murmel)... 
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_06"); //Ju� wiem! To zakl�cie teleportacji! Wygl�da na to, �e mo�na go u�y� tylko w konkretnym miejscu!
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_07"); //Dziwne!

	Npc_RemoveInvItems	(self,			OrkParchmentOne, 1); //Pergament 1 entfernen
	Npc_RemoveInvItems	(self,			OrkParchmentTwo, 1); //Pergament 2 entfernen
	//Hier Teleport-�bergabe entfernt --> erst wenn vor wand!

	B_LogEntry			(CH3_OrcGraveyard,"Przy pomocy inskrypcji na �cianach, Baal Lukorowi uda�o si� przet�umaczy� manuskrypt. Jest to chyba zakl�cie kr�tkodystansowej teleportacji."); 


	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2

};

//**************************************************************************
//	Info WHATNOW
//**************************************************************************
INSTANCE Info_BaalLukor_WHATNOW (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_WHATNOW_Condition;
	information	= Info_BaalLukor_WHATNOW_Info;
	permanent	= 1;
	important 	= 0;
	description = "Jakim 'konkretnym' miejscu?";
};

FUNC INT Info_BaalLukor_WHATNOW_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_BaalLukor_RUNES)
	&&		Npc_KnowsInfo(hero, Info_BaalLukor_HALLWITHOUT)
	&&		!Npc_KnowsInfo(hero, Info_BaalLukor_HALLWITH)		)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_WHATNOW_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_WHATNOW_15_01"); //Jakim "konkretnym" miejscu?
	AI_Output 		(self, other,"Info_BaalLukor_WHATNOW_13_02"); //Ta wielka komora, przez kt�r� przechodzili�my wcze�niej wyda�a mi si� do��... niezwyk�a. Powinni�my tam czym pr�dzej wr�ci�!

	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2

};


//**************************************************************************
//	Info HALLWITHOUT
//**************************************************************************
INSTANCE Info_BaalLukor_HALLWITHOUT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HALLWITHOUT_Condition;
	information	= Info_BaalLukor_HALLWITHOUT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_HALLWITHOUT_Condition()
{
	if (	!Npc_KnowsInfo	(hero, Info_BaalLukor_RUNES)
	&&		(Npc_GetDistToWP(hero, "GRYD_055")<500)			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_HALLWITHOUT_Info()
{
	B_FullStop		(hero);
	AI_SetWalkmode	(self,	NPC_WALK);
	AI_GotoNpc		(self, hero);

	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_01"); //To miejsce... Nie potrafi� tego wyja�ni�, ale to miejsce...
	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_02"); //Och, niewa�ne. Pewnie mi si� tylko wydaje.

	B_LogEntry	(CH3_OrcGraveyard,"Guru wyczu� co� dziwnego, gdy weszli�my do du�ej komory, jednak nie by� pewien, co to by�o.");

	Npc_ExchangeRoutine	(self, "Follow"); //Bj�rn: Patch2
};

//**************************************************************************
//	Info HALLWITH
//**************************************************************************
INSTANCE Info_BaalLukor_HALLWITH (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_HALLWITH_Condition;
	information	= Info_BaalLukor_HALLWITH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_HALLWITH_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_RUNES)
	&&		Npc_GetDistToWP	(hero, "GRYD_055")<500			)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_HALLWITH_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_01"); //To miejsce posiada szczeg�ln� aur�. Aur� tajemnicy.
	AI_Output			(other, self,"Info_BaalLukor_HALLWITH_15_02"); //To pomieszczenie przypomina mi obraz z naszej wizji.
	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_03"); //Wizja... Jeste�my ju� bardzo blisko celu...

	B_LogEntry		(CH3_OrcGraveyard,"Prowadzony przez niewidzialn� si��, Baal Lukor wskaza� jedn� ze �cian komory.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self, "DOOR");
};

//**************************************************************************
//	Info DOOR
//**************************************************************************
INSTANCE Info_BaalLukor_DOOR (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_DOOR_Condition;
	information	= Info_BaalLukor_DOOR_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_DOOR_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_HALLWITH)
	&&		Npc_GetDistToWP	(hero, "GRYD_060")<500				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_DOOR_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_01"); //Za t� �cian�... To musi by� tutaj!
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_02"); //Moje moce magiczne s� wci�� bardzo os�abione.
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_03"); //U�yj orkowego zakl�cia teleportacji! W�a�nie tutaj, przed t� �cian�.
	
	CreateInvItem		(self,			ItArScrollTeleport4); //Teleport erschaffen
	B_GiveInvItems  	(self, hero,	ItArScrollTeleport4, 1); //Teleport �bergeben
	
	AI_StopProcessInfos	(self);
};

//**************************************************************************
//	Info TELEPORT
//**************************************************************************
INSTANCE Info_BaalLukor_TELEPORT (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_TELEPORT_Condition;
	information	= Info_BaalLukor_TELEPORT_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_TELEPORT_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_DOOR)
	&&		Npc_CanSeeNpcFreeLOS(self,	hero)	
	&&		Npc_GetDistToWP	(hero, "GRYD_072")<550				)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_TELEPORT_Info()
{
	B_FullStop			(hero);
	AI_SetWalkmode		(self,	NPC_WALK);
	AI_GotoNpc			(self, hero);

	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_01"); //Znalaz�e� ukryt� komor�! M�j instynkt mnie nie zawi�d�.
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_02"); //Naprawd� znajdziemy tu odpowied� na tajemnicze wydarzenia zwi�zane z przyzwaniem �ni�cego?
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_03"); //To mi raczej wygl�da na kolejn� komor� grobowcow�.
	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_04"); //Musimy i�� dalej.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //Prowad�. P�jd� za tob�!

	B_LogEntry		(CH3_OrcGraveyard,"Przy u�yciu orkowego zakl�cia teleportacji odkry�em tajemne przej�cie odchodz�ce od komory.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"TELEPORT");
};

//**************************************************************************
//	Info ALTAR
//**************************************************************************
INSTANCE Info_BaalLukor_ALTAR (C_INFO)
{
	npc			= GUR_1211_BaalLukor;
	condition	= Info_BaalLukor_ALTAR_Condition;
	information	= Info_BaalLukor_ALTAR_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_BaalLukor_ALTAR_Condition()
{
	if (	Npc_KnowsInfo	(hero, Info_BaalLukor_TELEPORT)
	&&		Npc_GetDistToWP	(hero, "GRYD_082")<400
	&&		Npc_CanSeeNpcFreeLOS(self,hero)						)
	{
		return TRUE;
	};
};

FUNC VOID Info_BaalLukor_ALTAR_Info()
{
	B_FullStop			(hero);
	AI_GotoWP			(hero, "GRYD_081");
	AI_AlignToWP		(hero);

	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_01"); //NIE! To nie mo�e by� prawda! To nic nie ma... Tylko kurz i... i ko�ci.

	AI_SetWalkmode		(self, NPC_RUN);
	AI_GotoWP			(self, "GRYD_082");

	AI_PlayAniBS		(self, "T_STAND_2_PRAY", BS_SIT);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_02"); //NIE!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_03"); //PANIE, PRZEM�W DO MNIE!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_04"); //�NI�CY, UKA� SI� SWOJEMU S�UDZE!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_05"); //NIEEE!!!

	AI_Output			(hero, self,"Info_BaalLukor_ALTAR_15_06"); //No to koniec. Teraz ca�kiem mu odbi�o.

	AI_StandUp			(self);
	B_WhirlAround		(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_07"); //To wszystko twoja wina. Twoja blu�niercza obecno�� rozgniewa�a wszechmocnego �ni�cego!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_08"); //Teraz ja b�d� musia� ponie�� kar� za twoje grzeszne czyny!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_09"); //Musz� z�o�y� ofiar�, aby przeb�aga� mego pana. OFIAR� Z CZ�OWIEKA!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_10"); //Wtedy �ni�cy zn�w spojrzy na mnie przychylnym okiem i uczyni mnie swoim s�ug�.
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_11"); //GI�, NIEWIERNY PSIE!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_12"); //AIIIEEEEHHHHHH!!!!!!

	self.flags = 0;
	self.npctype = NPCTYPE_MAIN;
	BaalLukor_BringParchment = 4;
	Npc_SetTempAttitude	(self,	ATT_HOSTILE);
	Npc_SetPermAttitude	(self,	ATT_HOSTILE);
	//CreateInvItems		(self,	ItArScrollPyrokinesis,	3);

	B_LogEntry		(CH3_OrcGraveyard,"Gdy Baal Lukor zrozumia�, �e nie ma tu absolutnie nic, pu�ci�y mu nerwy. Szaleniec nawet rzuci� si� na mnie miotaj�c bezpodstawne oskar�enia. Cor Angar nie b�dzie zadowolony, gdy dowie si� o tych wydarzeniach.");

	AI_StopProcessInfos	(self);

	AI_StartState		(self,	ZS_Attack,	1,	"");
};





