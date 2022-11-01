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
	AI_Output 		(self, other,"Info_BaalLukor_MEET_13_01"); //Dzięki za pomoc. Zjawiłeś się w ostatniej chwili.
	
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
	description = "Po drodze znalazłem ciała Świątynnych Strażników! Co się stało?";
};

FUNC INT Info_BaalLukor_DEAD_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_DEAD_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_01"); //Po drodze znalazłem ciała Świątynnych Strażników! Co się stało?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_02"); //Mistrz Cor Angar przysłał nas tutaj, byśmy przeszukali jaskinie.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_03"); //Spodziewaliśmy się znaleźć tu tylko stare groby i rozpadające się mumie.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_04"); //Nagle coś poruszyło się w ciemnościach i dookoła pojawili się Orkowie. Nie wiem, czego tam szukali, ale ich obecność tutaj jest bardzo niepokojąca!
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_05"); //Gdzie są pozostali Strażnicy?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_06"); //Nie żyją! Nieświadomie doprowadziłem do ich zagłady! Niech Śniący zlituje się nad moją duszą!

	B_LogEntry		(CH3_OrcGraveyard,"Ocaliłem Guru Baal Lukora od pewnej śmierci z rąk orków. Niestety, towarzyszący mu Strażnicy Świątynni polegli...");
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
	description = "Przysyła mnie Cor Angar.";
};

FUNC INT Info_BaalLukor_SUMMONING_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_SUMMONING_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_01"); //Przysyła mnie Cor Angar. Odnaleźliście jakieś ślady Śniącego?
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_02"); //Jeszcze nie. A co z Y'Berionem? Doszedł już do siebie?
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_03"); //Nie, nadal jest nieprzytomny.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_04"); //Musimy zbadać ten kompleks jaskiń. Po tych wszystkich straszliwych wydarzeniach nie mogę wrócić do Obozu z pustymi rękami.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_05"); //Ale moje zdolności bojowe są dość ograniczone, a Orkowie nie reagują na moją magię jak ci głupcy ze Starego Obozu.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_06"); //Skoro przysyła cię Bractwo, może pomożesz mi w badaniu tego cmentarzyska.
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
	description = "Pomogę ci.";
};

FUNC INT Info_BaalLukor_HELP_Condition()
{
	return Npc_KnowsInfo(hero, Info_BaalLukor_SUMMONING);
};

FUNC VOID Info_BaalLukor_HELP_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_HELP_15_01"); //Pomogę ci.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_02"); //To wspaniale. Z tego pomieszczenia wychodzą trzy korytarze. Powinniśmy przeszukać każdy z nich.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //Prowadź. Pójdę za tobą!

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor i ja połączyliśmy siły. Wspólnie wyjaśnimy tajemnicę tego miejsca!");

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
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDNONE_13_02"); //Musimy przeszukać wszystkie trzy tunele.
	
	
	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2
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
	description = "Najwyraźniej druga połowa pergaminu uległa zniszczeniu!";
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
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDONE_15_01"); //Najwyraźniej druga połowa pergaminu uległa zniszczeniu!
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDONE_13_02"); //Druga połowa musi być gdzieś w pobliżu! Musimy przeszukać pozostałe tunele!
	
	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2
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

	AI_Output 		(self, other,"Info_BaalLukor_FIRSTWAIT_13_01"); //Dalej już nie pójdziemy. Może w tych niszach znajdziemy jakąś wskazówkę.

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
	description = "Znalazłem fragment pergaminu!";
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
	AI_Output 		(other, self,"Info_BaalLukor_FIRSTSCROLL_15_01"); //Znalazłem fragment pergaminu!
	B_GiveInvItems 	(hero, self, OrkParchmentOne,1); //Pergament1 übergeben
	if (BaalLukor_BringParchment == 2)
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_02"); //Wspaniale! To druga połowa zwoju z zaklęciem Orków!
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_03"); //To mi wygląda na zwój z zaklęciem Orków. Niestety, został przerwany na pół.
		AI_Output 	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_04"); //Gdzieś musi być druga połowa tego pergaminu!
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

	AI_Output 		(self, other,"Info_BaalLukor_SECONDWAIT_13_01"); //Hmmm... Ten tunel okazał się ślepą uliczką. Może znajdziemy tutaj jakieś wskazówki, które pomogą nam w naszych poszukiwaniach.

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
	description = "Znalazłem fragment pergaminu!";
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

	AI_Output 		(other, self,"Info_BaalLukor_SECONDSCROLL_15_01"); //Znalazłem fragment pergaminu!
	B_GiveInvItems 	(hero, self, OrkParchmentTwo,1); //Pergament2 übergeben
	if (BaalLukor_BringParchment == 1)
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_02"); //Wspaniale! To druga połowa zwoju z zaklęciem Orków!
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_03"); //To mi wygląda na zwój z zaklęciem Orków. Niestety, został przerwany na pół.
		AI_Output 	(self, other,"Info_BaalLukor_SECONDSCROLL_13_04"); //Gdzieś musi być druga połowa tego pergaminu!
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
	AI_Output			(self, other,"Info_BaalLukor_BOTHSCROLLS_13_02"); //To dwie połowy tego samego manuskryptu. Ale nie potrafię odcyfrować tego pisma.

	B_LogEntry		(CH3_OrcGraveyard,"Znaleźliśmy dwie połówki orkowego manuskryptu, ale Baal Lukor nie jest w stanie go przetłumaczyć. Musimy szukać dalej.");

	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2
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

	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_01"); //Czekaj! To interesujące...
	AI_Output 		(other, self,"Info_BaalLukor_RUNES_15_02"); //Cóż, nie widzę tu nic interesującego.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_03"); //Cicho! Przyjrzyj się uważnie ornamentom zdobiącym tę jaskinię.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_04"); //Tak, to mi powinno wystarczyć do przetłumaczenia znalezionego przez nas pergaminu.
	B_UseFakeScroll ();
	//AI_Output		(self, other,"Info_BaalLukor_RUNES_13_05"); //...(murmel)...(murmel)...(murmel)... 
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_06"); //Już wiem! To zaklęcie teleportacji! Wygląda na to, że można go użyć tylko w konkretnym miejscu!
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_07"); //Dziwne!

	Npc_RemoveInvItems	(self,			OrkParchmentOne, 1); //Pergament 1 entfernen
	Npc_RemoveInvItems	(self,			OrkParchmentTwo, 1); //Pergament 2 entfernen
	//Hier Teleport-Übergabe entfernt --> erst wenn vor wand!

	B_LogEntry			(CH3_OrcGraveyard,"Przy pomocy inskrypcji na ścianach, Baal Lukorowi udało się przetłumaczyć manuskrypt. Jest to chyba zaklęcie krótkodystansowej teleportacji."); 


	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2

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
	AI_Output 		(self, other,"Info_BaalLukor_WHATNOW_13_02"); //Ta wielka komora, przez którą przechodziliśmy wcześniej wydała mi się dość... niezwykła. Powinniśmy tam czym prędzej wrócić!

	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2

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

	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_01"); //To miejsce... Nie potrafię tego wyjaśnić, ale to miejsce...
	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_02"); //Och, nieważne. Pewnie mi się tylko wydaje.

	B_LogEntry	(CH3_OrcGraveyard,"Guru wyczuł coś dziwnego, gdy weszliśmy do dużej komory, jednak nie był pewien, co to było.");

	Npc_ExchangeRoutine	(self, "Follow"); //Björn: Patch2
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

	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_01"); //To miejsce posiada szczególną aurę. Aurę tajemnicy.
	AI_Output			(other, self,"Info_BaalLukor_HALLWITH_15_02"); //To pomieszczenie przypomina mi obraz z naszej wizji.
	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_03"); //Wizja... Jesteśmy już bardzo blisko celu...

	B_LogEntry		(CH3_OrcGraveyard,"Prowadzony przez niewidzialną siłę, Baal Lukor wskazał jedną ze ścian komory.");

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

	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_01"); //Za tą ścianą... To musi być tutaj!
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_02"); //Moje moce magiczne są wciąż bardzo osłabione.
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_03"); //Użyj orkowego zaklęcia teleportacji! Właśnie tutaj, przed tą ścianą.
	
	CreateInvItem		(self,			ItArScrollTeleport4); //Teleport erschaffen
	B_GiveInvItems  	(self, hero,	ItArScrollTeleport4, 1); //Teleport übergeben
	
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

	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_01"); //Znalazłeś ukrytą komorę! Mój instynkt mnie nie zawiódł.
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_02"); //Naprawdę znajdziemy tu odpowiedź na tajemnicze wydarzenia związane z przyzwaniem Śniącego?
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_03"); //To mi raczej wygląda na kolejną komorę grobowcową.
	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_04"); //Musimy iść dalej.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //Prowadź. Pójdę za tobą!

	B_LogEntry		(CH3_OrcGraveyard,"Przy użyciu orkowego zaklęcia teleportacji odkryłem tajemne przejście odchodzące od komory.");

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
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_01"); //NIE! To nie może być prawda! To nic nie ma... Tylko kurz i... i kości.

	AI_SetWalkmode		(self, NPC_RUN);
	AI_GotoWP			(self, "GRYD_082");

	AI_PlayAniBS		(self, "T_STAND_2_PRAY", BS_SIT);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_02"); //NIE!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_03"); //PANIE, PRZEMÓW DO MNIE!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_04"); //ŚNIĄCY, UKAŻ SIĘ SWOJEMU SŁUDZE!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_05"); //NIEEE!!!

	AI_Output			(hero, self,"Info_BaalLukor_ALTAR_15_06"); //No to koniec. Teraz całkiem mu odbiło.

	AI_StandUp			(self);
	B_WhirlAround		(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_07"); //To wszystko twoja wina. Twoja bluźniercza obecność rozgniewała wszechmocnego Śniącego!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_08"); //Teraz ja będę musiał ponieść karę za twoje grzeszne czyny!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_09"); //Muszę złożyć ofiarę, aby przebłagać mego pana. OFIARĘ Z CZŁOWIEKA!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_10"); //Wtedy Śniący znów spojrzy na mnie przychylnym okiem i uczyni mnie swoim sługą.
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_11"); //GIŃ, NIEWIERNY PSIE!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_12"); //AIIIEEEEHHHHHH!!!!!!

	self.flags = 0;
	self.npctype = NPCTYPE_MAIN;
	BaalLukor_BringParchment = 4;
	Npc_SetTempAttitude	(self,	ATT_HOSTILE);
	Npc_SetPermAttitude	(self,	ATT_HOSTILE);
	//CreateInvItems		(self,	ItArScrollPyrokinesis,	3);

	B_LogEntry		(CH3_OrcGraveyard,"Gdy Baal Lukor zrozumiał, że nie ma tu absolutnie nic, puściły mu nerwy. Szaleniec nawet rzucił się na mnie miotając bezpodstawne oskarżenia. Cor Angar nie będzie zadowolony, gdy dowie się o tych wydarzeniach.");

	AI_StopProcessInfos	(self);

	AI_StartState		(self,	ZS_Attack,	1,	"");
};





