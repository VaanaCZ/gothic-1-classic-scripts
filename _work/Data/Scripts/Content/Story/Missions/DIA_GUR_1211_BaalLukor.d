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
	AI_Output 		(self, other,"Info_BaalLukor_MEET_13_01"); //Dziêki za pomoc. Zjawi³eœ siê w ostatniej chwili.
	
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
	description = "Po drodze znalaz³em cia³a Œwi¹tynnych Stra¿ników! Co siê sta³o?";
};

FUNC INT Info_BaalLukor_DEAD_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_DEAD_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_01"); //Po drodze znalaz³em cia³a Œwi¹tynnych Stra¿ników! Co siê sta³o?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_02"); //Mistrz Cor Angar przys³a³ nas tutaj, byœmy przeszukali jaskinie.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_03"); //Spodziewaliœmy siê znaleŸæ tu tylko stare groby i rozpadaj¹ce siê mumie.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_04"); //Nagle coœ poruszy³o siê w ciemnoœciach i dooko³a pojawili siê Orkowie. Nie wiem, czego tam szukali, ale ich obecnoœæ tutaj jest bardzo niepokoj¹ca!
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_05"); //Gdzie s¹ pozostali Stra¿nicy?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_06"); //Nie ¿yj¹! Nieœwiadomie doprowadzi³em do ich zag³ady! Niech Œni¹cy zlituje siê nad moj¹ dusz¹!

	B_LogEntry		(CH3_OrcGraveyard,"Ocali³em Guru Baal Lukora od pewnej œmierci z r¹k orków. Niestety, towarzysz¹cy mu Stra¿nicy Œwi¹tynni polegli...");
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
	description = "Przysy³a mnie Cor Angar.";
};

FUNC INT Info_BaalLukor_SUMMONING_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_SUMMONING_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_01"); //Przysy³a mnie Cor Angar. OdnaleŸliœcie jakieœ œlady Œni¹cego?
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_02"); //Jeszcze nie. A co z Y'Berionem? Doszed³ ju¿ do siebie?
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_03"); //Nie, nadal jest nieprzytomny.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_04"); //Musimy zbadaæ ten kompleks jaskiñ. Po tych wszystkich straszliwych wydarzeniach nie mogê wróciæ do Obozu z pustymi rêkami.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_05"); //Ale moje zdolnoœci bojowe s¹ doœæ ograniczone, a Orkowie nie reaguj¹ na moj¹ magiê jak ci g³upcy ze Starego Obozu.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_06"); //Skoro przysy³a ciê Bractwo, mo¿e pomo¿esz mi w badaniu tego cmentarzyska.
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
	description = "Pomogê ci.";
};

FUNC INT Info_BaalLukor_HELP_Condition()
{
	return Npc_KnowsInfo(hero, Info_BaalLukor_SUMMONING);
};

FUNC VOID Info_BaalLukor_HELP_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_HELP_15_01"); //Pomogê ci.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_02"); //To wspaniale. Z tego pomieszczenia wychodz¹ trzy korytarze. Powinniœmy przeszukaæ ka¿dy z nich.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //ProwadŸ. Pójdê za tob¹!

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor i ja po³¹czyliœmy si³y. Wspólnie wyjaœnimy tajemnicê tego miejsca!");

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
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDNONE_13_02"); //Musimy przeszukaæ wszystkie trzy tunele.
	
	
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
	description = "NajwyraŸniej druga po³owa pergaminu uleg³a zniszczeniu!";
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
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDONE_15_01"); //NajwyraŸniej druga po³owa pergaminu uleg³a zniszczeniu!
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDONE_13_02"); //Druga po³owa musi byæ gdzieœ w pobli¿u! Musimy przeszukaæ pozosta³e tunele!
	
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

	AI_Output 		(self, other,"Info_BaalLukor_FIRSTWAIT_13_01"); //Dalej ju¿ nie pójdziemy. Mo¿e w tych niszach znajdziemy jak¹œ wskazówkê.

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
	description = "Znalaz³em fragment pergaminu!";
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
	AI_Output 		(other, self,"Info_BaalLukor_FIRSTSCROLL_15_01"); //Znalaz³em fragment pergaminu!
	B_GiveInvItems 	(hero, self, OrkParchmentOne,1); //Pergament1 übergeben
	if (BaalLukor_BringParchment == 2)
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_02"); //Wspaniale! To druga po³owa zwoju z zaklêciem Orków!
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_03"); //To mi wygl¹da na zwój z zaklêciem Orków. Niestety, zosta³ przerwany na pó³.
		AI_Output 	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_04"); //Gdzieœ musi byæ druga po³owa tego pergaminu!
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

	AI_Output 		(self, other,"Info_BaalLukor_SECONDWAIT_13_01"); //Hmmm... Ten tunel okaza³ siê œlep¹ uliczk¹. Mo¿e znajdziemy tutaj jakieœ wskazówki, które pomog¹ nam w naszych poszukiwaniach.

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
	description = "Znalaz³em fragment pergaminu!";
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

	AI_Output 		(other, self,"Info_BaalLukor_SECONDSCROLL_15_01"); //Znalaz³em fragment pergaminu!
	B_GiveInvItems 	(hero, self, OrkParchmentTwo,1); //Pergament2 übergeben
	if (BaalLukor_BringParchment == 1)
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_02"); //Wspaniale! To druga po³owa zwoju z zaklêciem Orków!
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_03"); //To mi wygl¹da na zwój z zaklêciem Orków. Niestety, zosta³ przerwany na pó³.
		AI_Output 	(self, other,"Info_BaalLukor_SECONDSCROLL_13_04"); //Gdzieœ musi byæ druga po³owa tego pergaminu!
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
	AI_Output			(self, other,"Info_BaalLukor_BOTHSCROLLS_13_02"); //To dwie po³owy tego samego manuskryptu. Ale nie potrafiê odcyfrowaæ tego pisma.

	B_LogEntry		(CH3_OrcGraveyard,"ZnaleŸliœmy dwie po³ówki orkowego manuskryptu, ale Baal Lukor nie jest w stanie go przet³umaczyæ. Musimy szukaæ dalej.");

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

	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_01"); //Czekaj! To interesuj¹ce...
	AI_Output 		(other, self,"Info_BaalLukor_RUNES_15_02"); //Có¿, nie widzê tu nic interesuj¹cego.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_03"); //Cicho! Przyjrzyj siê uwa¿nie ornamentom zdobi¹cym tê jaskiniê.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_04"); //Tak, to mi powinno wystarczyæ do przet³umaczenia znalezionego przez nas pergaminu.
	B_UseFakeScroll ();
	//AI_Output		(self, other,"Info_BaalLukor_RUNES_13_05"); //...(murmel)...(murmel)...(murmel)... 
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_06"); //Ju¿ wiem! To zaklêcie teleportacji! Wygl¹da na to, ¿e mo¿na go u¿yæ tylko w konkretnym miejscu!
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_07"); //Dziwne!

	Npc_RemoveInvItems	(self,			OrkParchmentOne, 1); //Pergament 1 entfernen
	Npc_RemoveInvItems	(self,			OrkParchmentTwo, 1); //Pergament 2 entfernen
	//Hier Teleport-Übergabe entfernt --> erst wenn vor wand!

	B_LogEntry			(CH3_OrcGraveyard,"Przy pomocy inskrypcji na œcianach, Baal Lukorowi uda³o siê przet³umaczyæ manuskrypt. Jest to chyba zaklêcie krótkodystansowej teleportacji."); 


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
	AI_Output 		(self, other,"Info_BaalLukor_WHATNOW_13_02"); //Ta wielka komora, przez któr¹ przechodziliœmy wczeœniej wyda³a mi siê doœæ... niezwyk³a. Powinniœmy tam czym prêdzej wróciæ!

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

	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_01"); //To miejsce... Nie potrafiê tego wyjaœniæ, ale to miejsce...
	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_02"); //Och, niewa¿ne. Pewnie mi siê tylko wydaje.

	B_LogEntry	(CH3_OrcGraveyard,"Guru wyczu³ coœ dziwnego, gdy weszliœmy do du¿ej komory, jednak nie by³ pewien, co to by³o.");

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

	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_01"); //To miejsce posiada szczególn¹ aurê. Aurê tajemnicy.
	AI_Output			(other, self,"Info_BaalLukor_HALLWITH_15_02"); //To pomieszczenie przypomina mi obraz z naszej wizji.
	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_03"); //Wizja... Jesteœmy ju¿ bardzo blisko celu...

	B_LogEntry		(CH3_OrcGraveyard,"Prowadzony przez niewidzialn¹ si³ê, Baal Lukor wskaza³ jedn¹ ze œcian komory.");

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

	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_01"); //Za t¹ œcian¹... To musi byæ tutaj!
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_02"); //Moje moce magiczne s¹ wci¹¿ bardzo os³abione.
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_03"); //U¿yj orkowego zaklêcia teleportacji! W³aœnie tutaj, przed t¹ œcian¹.
	
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

	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_01"); //Znalaz³eœ ukryt¹ komorê! Mój instynkt mnie nie zawiód³.
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_02"); //Naprawdê znajdziemy tu odpowiedŸ na tajemnicze wydarzenia zwi¹zane z przyzwaniem Œni¹cego?
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_03"); //To mi raczej wygl¹da na kolejn¹ komorê grobowcow¹.
	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_04"); //Musimy iœæ dalej.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //ProwadŸ. Pójdê za tob¹!

	B_LogEntry		(CH3_OrcGraveyard,"Przy u¿yciu orkowego zaklêcia teleportacji odkry³em tajemne przejœcie odchodz¹ce od komory.");

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
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_01"); //NIE! To nie mo¿e byæ prawda! To nic nie ma... Tylko kurz i... i koœci.

	AI_SetWalkmode		(self, NPC_RUN);
	AI_GotoWP			(self, "GRYD_082");

	AI_PlayAniBS		(self, "T_STAND_2_PRAY", BS_SIT);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_02"); //NIE!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_03"); //PANIE, PRZEMÓW DO MNIE!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_04"); //ŒNI¥CY, UKA¯ SIÊ SWOJEMU S£UDZE!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_05"); //NIEEE!!!

	AI_Output			(hero, self,"Info_BaalLukor_ALTAR_15_06"); //No to koniec. Teraz ca³kiem mu odbi³o.

	AI_StandUp			(self);
	B_WhirlAround		(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_07"); //To wszystko twoja wina. Twoja bluŸniercza obecnoœæ rozgniewa³a wszechmocnego Œni¹cego!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_08"); //Teraz ja bêdê musia³ ponieœæ karê za twoje grzeszne czyny!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_09"); //Muszê z³o¿yæ ofiarê, aby przeb³agaæ mego pana. OFIARÊ Z CZ£OWIEKA!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_10"); //Wtedy Œni¹cy znów spojrzy na mnie przychylnym okiem i uczyni mnie swoim s³ug¹.
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_11"); //GIÑ, NIEWIERNY PSIE!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_12"); //AIIIEEEEHHHHHH!!!!!!

	self.flags = 0;
	self.npctype = NPCTYPE_MAIN;
	BaalLukor_BringParchment = 4;
	Npc_SetTempAttitude	(self,	ATT_HOSTILE);
	Npc_SetPermAttitude	(self,	ATT_HOSTILE);
	//CreateInvItems		(self,	ItArScrollPyrokinesis,	3);

	B_LogEntry		(CH3_OrcGraveyard,"Gdy Baal Lukor zrozumia³, ¿e nie ma tu absolutnie nic, puœci³y mu nerwy. Szaleniec nawet rzuci³ siê na mnie miotaj¹c bezpodstawne oskar¿enia. Cor Angar nie bêdzie zadowolony, gdy dowie siê o tych wydarzeniach.");

	AI_StopProcessInfos	(self);

	AI_StartState		(self,	ZS_Attack,	1,	"");
};





