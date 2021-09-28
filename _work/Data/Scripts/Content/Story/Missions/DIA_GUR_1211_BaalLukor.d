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
	AI_Output 		(self, other,"Info_BaalLukor_MEET_13_01"); //Díky za tvojí pomoc. Pøišel jsi opravdu v poslední chvíli.
	
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
	description = "Na cestì sem jsem vidìl nìkolik mrtvých templáøù. Co se pøihodilo?";
};

FUNC INT Info_BaalLukor_DEAD_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_DEAD_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_01"); //Na cestì sem jsem vidìl nìkolik mrtvých templáøù. Co se pøihodilo?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_02"); //Mistr Cor Angar nás sem vyslal na prohlídku jeskyní.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_03"); //Oèekávali jsme, že najdeme pár zatuchlých hrobù a polorozpadlé mumie.
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_04"); //Najednou se setmìlo a všude byli skøeti. Nevím co tady hledali, ale jejich pøítomnost v tìchto místech je víc než neobvyklá!
	AI_Output 			(other, self,"Info_BaalLukor_DEAD_15_05"); //Kde jsou ostatní templáøi?
	AI_Output 			(self, other,"Info_BaalLukor_DEAD_13_06"); //Mrtví! Nevìdomky jsem je pøivedl do záhuby. Snad mi to Spáè promine.

	B_LogEntry		(CH3_OrcGraveyard,"Pøi útoku skøetù  na skøetím høbitovì jsem zachránil guru Baalu Lukorovi život. Všichni templáøi v boji s hroznými netvory zahynuli.");
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
	description = "Cor Angar mì vyslal!";
};

FUNC INT Info_BaalLukor_SUMMONING_Condition()
{
	return TRUE;
};

FUNC VOID Info_BaalLukor_SUMMONING_Info()
{
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_01"); //Cor Angar mì vyslal! Našli jste nìjaké Spáèovo znamení?
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_02"); //Zatím ne. Ale co Y´Berion? Už procitnul?
	AI_Output 		(other, self,"Info_BaalLukor_SUMMONING_15_03"); //Ne, je poøád v bezvìdomí.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_04"); //Potøebujeme vyøešit hádanku tìch jeskyní. Po všech tìch hrozných ztrátách se nemùžu do komunity vrátit s prázdnýma rukama.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_05"); //Moje bojové umìní je omezené a skøeti nejsou vnímaví na moje magická zaøíkávadla jako ti lehkovìrní lidé ze Starého tábora.
	AI_Output 		(self, other,"Info_BaalLukor_SUMMONING_13_06"); //Jestliže tì vyslalo naše Bratrstvo, snad bys mi mohl pomoci s dalším pátráním v téhle hrobce.
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
	description = "Pomùžu ti.";
};

FUNC INT Info_BaalLukor_HELP_Condition()
{
	return Npc_KnowsInfo(hero, Info_BaalLukor_SUMMONING);
};

FUNC VOID Info_BaalLukor_HELP_Info()
{
	AI_Output 			(other, self,"Info_BaalLukor_HELP_15_01"); //Pomùžu ti.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_02"); //Dobøe. Skvìle. Z tohoto sálu vedou tøi tunely. Mìli bysme je všechny prozkoumat.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //Jdi napøed. Pùjdu za tebou!

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor mì vzal s sebou, abychom spoleènì vyøešili tajemství tohoto starého místa!");

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
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDNONE_13_02"); //Musíme prozkoumat ty tøi tunely.
	
	
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
	description = "Zøejmì už neexistuje druhá polovina pergamenu!";
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
	AI_Output 		(other, self,"Info_BaalLukor_FOUNDONE_15_01"); //Zøejmì už neexistuje druhá polovina pergamenu!
	AI_Output 		(self, other,"Info_BaalLukor_FOUNDONE_13_02"); //Musí být druhá polovina. Mìli bysme prohledat všechny tøi tunely!
	
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

	AI_Output 		(self, other,"Info_BaalLukor_FIRSTWAIT_13_01"); //Tudy nemùžeme pokraèovat! Možná tyhle výklenky znaèí cestu.

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
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_02"); //Výbornì! To je druhá polovina Skøetího kouzelného zaøíkávadla.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_03"); //Vypadá to jako Skøetí kouzelné zaøíkávadlo, ale je to roztržené vejpùl.
		AI_Output 	(self, other,"Info_BaalLukor_FIRSTSCROLL_13_04"); //Nìkde tu musí být druhá polovina.
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

	AI_Output 		(self, other,"Info_BaalLukor_SECONDWAIT_13_01"); //Hmmm... tenhle tunel je slepý! Ale možná tu najdeme nìjaké znamení, které nám pomùže dál.

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
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_02"); //Výbornì! To je druhá polovina Skøetího kouzelného zaøíkávadla.
		BaalLukor_BringParchment = 3;
	}
	else
	{
		AI_Output	(self, other,"Info_BaalLukor_SECONDSCROLL_13_03"); //Vypadá to jako Skøetí kouzelné zaøíkávadlo, ale je to roztržené vejpùl.
		AI_Output 	(self, other,"Info_BaalLukor_SECONDSCROLL_13_04"); //Nìkde tu musí být druhá polovina.
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
	description = "Co teï s tìma dvìma kusy udìláme?";
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
	AI_Output 			(other, self,"Info_BaalLukor_BOTHSCROLLS_15_01"); //Co teï s tìmi dvìma kusy udìláme?
	AI_Output			(self, other,"Info_BaalLukor_BOTHSCROLLS_13_02"); //Obì pùlky k sobì sedí. Neumím ale pøeložit ty skøetí znaky.

	B_LogEntry		(CH3_OrcGraveyard,"Našli jsme dvì poloviny skøetího svitku, ale Baal Lukor je nedokázal rozluštit. Budeme pokraèovat v pátrání.");

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

	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_01"); //Poèkej! To je zajímavé...
	AI_Output 		(other, self,"Info_BaalLukor_RUNES_15_02"); //Dobrá, nic zajímavého tady nevidím.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_03"); //Buï ticho a dívej se na ty ozdobné runy v jeskyni.
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_04"); //To by mìlo postaèit k pøekladu tìch dvou pùlek pergamenu.
	B_UseFakeScroll ();
	//AI_Output		(self, other,"Info_BaalLukor_RUNES_13_05"); //...(murmel)...(murmel)...(murmel)... 
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_06"); //Mám to! Je to zaøíkávadlo pro pøenos. Zdá se, že jeho sílu jde využít pouze na urèitém místì!
	AI_Output		(self, other,"Info_BaalLukor_RUNES_13_07"); //Divné!

	Npc_RemoveInvItems	(self,			OrkParchmentOne, 1); //Pergament 1 entfernen
	Npc_RemoveInvItems	(self,			OrkParchmentTwo, 1); //Pergament 2 entfernen
	//Hier Teleport-Übergabe entfernt --> erst wenn vor wand!

	B_LogEntry			(CH3_OrcGraveyard,"S pomocí nástìnných nápisù v jednom ze sálù se Baalovi Lukorovi podaøilo rozluštit ten svitek. Vypadá jako teleportaèní kouzlo pro malé vzdálenosti."); 


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
	description = "Na jakém 'urèitém' místì?";
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
	AI_Output 		(other, self,"Info_BaalLukor_WHATNOW_15_01"); //Na jakém 'urèitém' místì?
	AI_Output 		(self, other,"Info_BaalLukor_WHATNOW_13_02"); //Velký sál, kterým jsme pøed chvíli prošli, se zdál jako velmi... zvláštní... místo. Pojïme se tam vrátit!

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

	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_01"); //Tohle místo... Nedokážu to vysvìtlit, ale tohle místo...
	AI_Output		(self, other,"Info_BaalLukor_HALLWITHOUT_13_02"); //Och, zapomeò na to. To jen ta moje pøedstavivost.

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
	AI_Output			(other, self,"Info_BaalLukor_HALLWITH_15_02"); //Tenhle sál mi pøipomíná obraz z té vidiny.
	AI_Output			(self, other,"Info_BaalLukor_HALLWITH_13_03"); //Ta vidina... Jsme velmi blízko u cíle...

	B_LogEntry		(CH3_OrcGraveyard,"Baal Lukor byl veden neviditelnou silou, která míøila pøímo k jedné ze stìn velkého sloupového sálu.");

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

	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_01"); //Za tou stìnou... to musí být!
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_02"); //Má kouzelná síla je poøád velmi slabá.
	AI_Output			(self, other,"Info_BaalLukor_DOOR_13_03"); //Použij to skøetí zaøíkávadlo pro pøenos tady, naproti té stìnì.
	
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

	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_01"); //Našli jsme skryté místo. Mé instinkty mì nezradily.
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_02"); //A ta odpovìï na to záhadné vzývání Spáèe leží skuteènì tady???
	AI_Output			(other, self,"Info_BaalLukor_TELEPORT_15_03"); //Pøipadá mi to spíše jako zakopaná komora.
	AI_Output			(self, other,"Info_BaalLukor_TELEPORT_13_04"); //Musíme pokraèovat.
	AI_Output 			(self, other,"Info_BaalLukor_HELP_13_03"); //Jdi napøed. Pùjdu za tebou!

	B_LogEntry		(CH3_OrcGraveyard,"S pomocí skøetího teleportaèního kouzla jsem objevil tajnou chodbu vedoucí ven ze sloupového sálu.");

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
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_03"); //PANE, PROMLUV KE MNÌ!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_04"); //SPÁÈI, ZJEV SE!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_05"); //NEEEEE!!!

	AI_Output			(hero, self,"Info_BaalLukor_ALTAR_15_06"); //A je to. Musel se úplnì pominout!

	AI_StandUp			(self);
	B_WhirlAround		(self, hero);
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_07"); //To všechno je tvoje chyba. Tvoje bezbožná pøítomnost rozrušila všemocného Spáèe!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_08"); //Teï budu muset trpìt za tvoje svatokrádežné chování!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_09"); //Musím velkému pánovi vzdát obì. LIDSKOU OBÌ!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_10"); //Pak budu urèitì osvícen a stanu se jeho služebníkem.
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_11"); //ZEMØI, NEVÌRÈE!!!
	AI_Output			(self, hero,"Info_BaalLukor_ALTAR_13_12"); //AAJEEEEÉÉÉHHH!!!!!

	self.flags = 0;
	self.npctype = NPCTYPE_MAIN;
	BaalLukor_BringParchment = 4;
	Npc_SetTempAttitude	(self,	ATT_HOSTILE);
	Npc_SetPermAttitude	(self,	ATT_HOSTILE);
	//CreateInvItems		(self,	ItArScrollPyrokinesis,	3);

	B_LogEntry		(CH3_OrcGraveyard,"Baala Lukora mohla trefit mrtvice, když pochopil, že tady dole není ABSOLUTNÌ NIC. Nakonec si na mnì dokonce vylil zlost. Když Cor Angar uslyšel tento pøíbìh, pojal obavy.");

	AI_StopProcessInfos	(self);

	AI_StartState		(self,	ZS_Attack,	1,	"");
};





