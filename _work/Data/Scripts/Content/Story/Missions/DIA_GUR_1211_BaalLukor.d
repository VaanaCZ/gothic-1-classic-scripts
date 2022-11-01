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
	AI_Output 		(self, other,"Info_BaalLukor_MEET_13_01"); //Díky za tvojí pomoc. Přišel jsi opravdu v poslední chvíli.
	
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
	description = "Na cestě sem jsem viděl několik mrtvých templářů. Co se přihodilo?";
};

FUNC INT Info_BaalLukor_DEAD_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_DEAD_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_01"); //Na cestě sem jsem viděl několik mrtvých templářů. Co se přihodilo?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_02"); //Mistr Cor Angar nás sem vyslal na prohlídku jeskyní.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_03"); //Očekávali jsme, že najdeme pár zatuchlých hrobů a polorozpadlé mumie.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_04"); //Najednou se setmělo a všude byli skřeti. Nevím co tady hledali, ale jejich přítomnost v těchto místech je víc než neobvyklá!
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_05"); //Kde jsou ostatní templáři?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_06"); //Mrtví! Nevědomky jsem je přivedl do záhuby. Snad mi to Spáč promine.

	B_LogEntry		(CH3_OrcGraveyard,"Při útoku skřetů  na skřetím hřbitově jsem zachránil guru Baalu Lukorovi život. Všichni templáři v boji s hroznými netvory zahynuli.");
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
	description = "Cor Angar mě vyslal!";
};

FUNC INT Info_BaalLukor_SUMMONING_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_SUMMONING_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_01"); //Cor Angar mě vyslal! Našli jste nějaké Spáčovo znamení?
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_02"); //Zatím ne. Ale co Y´Berion? Už procitnul?
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_03"); //Ne, je pořád v bezvědomí.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_04"); //Potřebujeme vyřešit hádanku těch jeskyní. Po všech těch hrozných ztrátách se nemůžu do komunity vrátit s prázdnýma rukama.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_05"); //Moje bojové umění je omezené a skřeti nejsou vnímaví na moje magická zaříkávadla jako ti lehkověrní lidé ze Starého tábora.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_06"); //Jestliže tě vyslalo naše Bratrstvo, snad bys mi mohl pomoci s dalším pátráním v téhle hrobce.
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
	description = "Pomůžu ti.";
};

FUNC INT Info_BaalLukor_HELP_Condition()
{
	return Npc_KnowsInfo(hero, Info_BaalLukor_SUMMONING);
};

FUNC VOID Info_BaalLukor_HELP_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_HELP_15_01"); //Pomůžu ti.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_02"); //Dobře. Skvěle. Z tohoto sálu vedou tři tunely. Měli bysme je všechny prozkoumat.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //Jdi napřed. Půjdu za tebou!

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor mě vzal s sebou, abychom společně vyřešili tajemství tohoto starého místa!");

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
	description = "Nedokážu se tu orientovat!";
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
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDNONE_15_01"); //Nedokážu se tu orientovat!
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDNONE_13_02"); //Musíme prozkoumat ty tři tunely.
	
	
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
	description = "Zřejmě už neexistuje druhá polovina pergamenu!";
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
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDONE_15_01"); //Zřejmě už neexistuje druhá polovina pergamenu!
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDONE_13_02"); //Musí být druhá polovina. Měli bysme prohledat všechny tři tunely!
	
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

	AI_Output 		(self, other,"Info_BaalLukor_FIRSTWAIT_13_01"); //Tudy nemůžeme pokračovat! Možná tyhle výklenky značí cestu.

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
	description = "Našel jsem kus pergamenu!";
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
	AI_Output 		(other, self,"Info_BaalLukor_FIRSTSCROLL_15_01"); //Našel jsem kus pergamenu!
	B_GiveInvItems 	(hero, self, OrkParchmentOne,1); //Pergament1 übergeben
	if (BaalLukor_BringParchment == 2)
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_02"); //Výborně! To je druhá polovina Skřetího kouzelného zaříkávadla.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_03"); //Vypadá to jako Skřetí kouzelné zaříkávadlo, ale je to roztržené vejpůl.
		AI_Output 	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_04"); //Někde tu musí být druhá polovina.
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

	AI_Output 		(self, other,"Info_BaalLukor_SECONDWAIT_13_01"); //Hmmm... tenhle tunel je slepý! Ale možná tu najdeme nějaké znamení, které nám pomůže dál.

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
	description = "Tady je roztržený kus pergamenu!";
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

	AI_Output 		(other, self,"Info_BaalLukor_SECONDSCROLL_15_01"); //Tady je roztržený kus pergamenu!
	B_GiveInvItems 	(hero, self, OrkParchmentTwo,1); //Pergament2 übergeben
	if (BaalLukor_BringParchment == 1)
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_02"); //Výborně! To je druhá polovina Skřetího kouzelného zaříkávadla.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_03"); //Vypadá to jako Skřetí kouzelné zaříkávadlo, ale je to roztržené vejpůl.
		AI_Output 	(self, other,"Info_BaalLukor_SECONDSCROLL_13_04"); //Někde tu musí být druhá polovina.
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
	description = "Co teď s těma dvěma kusy uděláme?";
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
	AI_Output 			(other, self,"Info_BaalLukor_BOTHSCROLLS_15_01"); //Co teď s těmi dvěma kusy uděláme?
	AI_Output			(self, other,"Info_BaalLukor_BOTHSCROLLS_13_02"); //Obě půlky k sobě sedí. Neumím ale přeložit ty skřetí znaky.

	B_LogEntry		(CH3_OrcGraveyard,"Našli jsme dvě poloviny skřetího svitku, ale Baal Lukor je nedokázal rozluštit. Budeme pokračovat v pátrání.");

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

	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_01"); //Počkej! To je zajímavé...
	AI_Output 		(other, self,"Info_BaalLukor_RUNES_15_02"); //Dobrá, nic zajímavého tady nevidím.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_03"); //Buď ticho a dívej se na ty ozdobné runy v jeskyni.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_04"); //To by mělo postačit k překladu těch dvou půlek pergamenu.
	B_UseFakeScroll ();
	//AI_Output		(self, other,"Info_BaalLukor_RUNES_13_05"); //...(murmel)...(murmel)...(murmel)... 
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_06"); //Mám to! Je to zaříkávadlo pro přenos. Zdá se, že jeho sílu jde využít pouze na určitém místě!
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_07"); //Divné!

	Npc_RemoveInvItems	(self,			OrkParchmentOne, 1); //Pergament 1 entfernen
	Npc_RemoveInvItems	(self,			OrkParchmentTwo, 1); //Pergament 2 entfernen
	//Hier Teleport-Übergabe entfernt --> erst wenn vor wand!

	B_LogEntry			(CH3_OrcGraveyard,"S pomocí nástěnných nápisů v jednom ze sálů se Baalovi Lukorovi podařilo rozluštit ten svitek. Vypadá jako teleportační kouzlo pro malé vzdálenosti."); 


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
	description = "Na jakém 'určitém' místě?";
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
	AI_Output 		(other, self,"Info_BaalLukor_WHATNOW_15_01"); //Na jakém 'určitém' místě?
	AI_Output 		(self, other,"Info_BaalLukor_WHATNOW_13_02"); //Velký sál, kterým jsme před chvíli prošli, se zdál jako velmi... zvláštní... místo. Pojďme se tam vrátit!

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

	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_01"); //Tohle místo... Nedokážu to vysvětlit, ale tohle místo...
	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_02"); //Och, zapomeň na to. To jen ta moje představivost.

	B_LogEntry	(CH3_OrcGraveyard,"Když jsme vstoupili do velkého obdélníkového sálu se sloupovím, guru cosi pocítil. Nebyl si však jistý, co to bylo.");

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

	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_01"); //Tohle místo má zvláštní auru... auru zmizení.
	AI_Output			(other, self,"Info_BaalLukor_HALLWITH_15_02"); //Tenhle sál mi připomíná obraz z té vidiny.
	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_03"); //Ta vidina... Jsme velmi blízko u cíle...

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor byl veden neviditelnou silou, která mířila přímo k jedné ze stěn velkého sloupového sálu.");

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

	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_01"); //Za tou stěnou... to musí být!
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_02"); //Má kouzelná síla je pořád velmi slabá.
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_03"); //Použij to skřetí zaříkávadlo pro přenos tady, naproti té stěně.
	
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

	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_01"); //Našli jsme skryté místo. Mé instinkty mě nezradily.
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_02"); //A ta odpověď na to záhadné vzývání Spáče leží skutečně tady???
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_03"); //Připadá mi to spíše jako zakopaná komora.
	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_04"); //Musíme pokračovat.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //Jdi napřed. Půjdu za tebou!

	B_LogEntry		(CH3_OrcGraveyard,"S pomocí skřetího teleportačního kouzla jsem objevil tajnou chodbu vedoucí ven ze sloupového sálu.");

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
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_01"); //NE! To není možné! Není tu nic než... než prach a... kosti.

	AI_SetWalkmode		(self, NPC_RUN);
	AI_GotoWP			(self, "GRYD_082");

	AI_PlayAniBS		(self, "T_STAND_2_PRAY", BS_SIT);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_02"); //NE!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_03"); //PANE, PROMLUV KE MNĚ!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_04"); //SPÁČI, ZJEV SE!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_05"); //NEEEEE!!!

	AI_Output			(hero, self,"Info_BaalLukor_ALTAR_15_06"); //A je to. Musel se úplně pominout!

	AI_StandUp			(self);
	B_WhirlAround		(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_07"); //To všechno je tvoje chyba. Tvoje bezbožná přítomnost rozrušila všemocného Spáče!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_08"); //Teď budu muset trpět za tvoje svatokrádežné chování!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_09"); //Musím velkému pánovi vzdát oběť. LIDSKOU OBĚŤ!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_10"); //Pak budu určitě osvícen a stanu se jeho služebníkem.
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_11"); //ZEMŘI, NEVĚRČE!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_12"); //AAJEEEEÉÉÉHHH!!!!!

	self.flags = 0;
	self.npctype = NPCTYPE_MAIN;
	BaalLukor_BringParchment = 4;
	Npc_SetTempAttitude	(self,	ATT_HOSTILE);
	Npc_SetPermAttitude	(self,	ATT_HOSTILE);
	//CreateInvItems		(self,	ItArScrollPyrokinesis,	3);

	B_LogEntry		(CH3_OrcGraveyard,"Baala Lukora mohla trefit mrtvice, když pochopil, že tady dole není ABSOLUTNĚ NIC. Nakonec si na mně dokonce vylil zlost. Když Cor Angar uslyšel tento příběh, pojal obavy.");

	AI_StopProcessInfos	(self);

	AI_StartState		(self,	ZS_Attack,	1,	"");
};





