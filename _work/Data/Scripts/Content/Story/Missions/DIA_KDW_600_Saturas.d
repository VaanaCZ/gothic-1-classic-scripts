// ************************ EXIT **************************

instance  Info_Saturas_EXIT (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	999;
	condition	=	Info_Saturas_EXIT_Condition;
	information	=	Info_Saturas_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Saturas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Saturas_EXIT_Info()
{
	AI_Output			(self, other,"Info_Saturas_EXIT_14_01"); //Kéž by ses vrátil celý!

	AI_StopProcessInfos	(self);
};


// ************************ Intruder **************************

instance  Info_Saturas_Intruder (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	1;
	condition	=	Info_Saturas_Intruder_Condition;
	information	=	Info_Saturas_Intruder_Info;
	permanent	=	1;
	important	=	1;	
};                       

FUNC int  Info_Saturas_Intruder_Condition()
{
	if ( Npc_IsInState(self,ZS_Talk) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_Intruder_Info()
{
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Co tady dìláš? Tady nemáš co pohledávat! Zmiz!

	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Saturas_NEWS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NEWS_Condition;
	information	= Info_Saturas_NEWS_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "Mám dùležité zprávy z tábora Bratrstva!";
};

FUNC INT Info_Saturas_NEWS_Condition()
{	
	if ((CorAngar_SendToNC==TRUE) && Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_NEWS_Info()
{
	AI_Output			(other, self,"Info_Saturas_NEWS_15_01"); //Mám dùležité zprávy z tábora Bratrstva!
	AI_Output			(self, other,"Info_Saturas_NEWS_14_02"); //Musí být opravdu dùležitá zpráva, jestliže ti Cronos povolil mì navštívit!
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Saturas_YBERION (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_YBERION_Condition;
	information	= Info_Saturas_YBERION_Info;
	permanent	= 0;
	IMPORTANT = 0;
	description = "Y´Berion je mrtev!";
};

FUNC INT Info_Saturas_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_YBERION_Info()
{
	AI_Output			(other, self,"Info_Saturas_YBERION_15_01"); //Y´Berion je mrtev! Zemøel bìhem rituálního vzývání Spáèe.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_02"); //Y´Berion je mrtev´? To je špatná zpráva, vskutku špatná!
	AI_Output			(self, other,"Info_Saturas_YBERION_14_03"); //Kdo teï vede Bratrstvo? Ten mocichtivý a zabednìný Cor Kalom?
	AI_Output			(other, self,"Info_Saturas_YBERION_15_04"); //Ne! Kalom se od Bratrstva odvrátil. Vzal sebou pár templáøù. Nikdo neví, kam odešli.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_05"); //Proè to všechno? Byl na druhém místì za Y´Berionem!
	AI_Output			(other, self,"Info_Saturas_YBERION_15_06"); //Jisté události pøesvìdèily Guru, že jsou na špatné cestì. Z jejich boha se vyklubal zlý arcidémon.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_07"); //Jeden z Guru mì pod vlivem Spáèe málem zabil, pøestože jsem mu krátce pøedtím zachránil život.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_08"); //Cor Kalom je jediný Guru, který nechce uznat pravou podstatu té pekelné stvùry, a proto opustil tábor v bažinách.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_09"); //Aha! Dobøe, aspoò v tomto smìru máme štìstí. Cor Angar je dobrý muž. Je drsný, ale pøesto poctivý.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_10"); //Jestliže nìkdo mùže Bratrstvo ochránit od úpadku po té duchovní katastrofì, pak je to právì on.

	B_LogEntry		(CH3_EscapePlanNC,"Øekl jsem Saturasovi o incidentech v táboøe v bažinách. Byl rád, že Cor Angar pøevzal v Bratrstvu velení.");
};

//***************************************************************************
//	Info BOOK
//***************************************************************************
instance Info_Saturas_BOOK (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BOOK_Condition;
	information	= Info_Saturas_BOOK_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "Mám tento almanach...";
};

FUNC INT Info_Saturas_BOOK_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, ItWrFokusbuch))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BOOK_Info()
{
	AI_Output			(other, self,"Info_Saturas_BOOK_15_01"); //Mám tento almanach...
	AI_Output			(other, self,"Info_Saturas_BOOK_15_02"); //Y´Berion ho používal k práci s tím ohniskem.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_03"); //Velmi dobøe. Potøebujeme vìdomosti uložené v té knize, abysme umìli zacházet s pìti pùvodními ohniskovými kameny.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_04"); //Vezmu si ten almanach!

	B_GiveInvItems		(hero,self,ItWrFokusbuch,1);
	Npc_RemoveInvItem	(self,ItWrFokusbuch);
	B_GiveXP  			(XP_DeliverBookToSaturas);
};

//***************************************************************************
//	Info FOCUS
//***************************************************************************
instance Info_Saturas_FOCUS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FOCUS_Condition;
	information	= Info_Saturas_FOCUS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mám toto ohnisko...";
};

FUNC INT Info_Saturas_FOCUS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, Focus_1))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FOCUS_Info()
{
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_01"); //Mám toto ohnisko...
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_02"); //Držíš klíè, který uvolní všechna pouta.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_03"); //To je jeden z tìch kamenù, které byly použity k vytvoøení magické Bariéry.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_04"); //A pomocí ohniskové síly tìchto kamenù strhneme tu obrovskou energetickou stìnu.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_05"); //Nespotøebuje to ale obrovské množství síly?
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_06"); //To jistì, ale po celé ty roky jsme neúnavnì shromažïovali rudu, namísto toho, abychom ji vymìòovali za luxusní zboží s našimi vìzniteli.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_07"); //Jak jistì víš, každý nuget obsahuje urèité množství magické síly. S pomocí energie, která je nahromadìná v rudné haldì, budeme schopni znièit magickou Bariéru.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_08"); //Vypadá to nebezpeènì.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_09"); //Exploze bude spíše magické povahy a znièí pouze to, co bylo pomocí kouzel upraveno uvnitø Bariéry. Lidským bytostem nehrozí žádné nebezpeèí.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_10"); //Tady je to ohnisko. Doufejme, že vám doopravdy pomùže ve vašich plánech s rudnou hromadou.

	B_GiveInvItems		(hero, self, Focus_1, 1);
	Npc_RemoveInvItem	(self, Focus_1);
	B_GiveXP  			(XP_DeliverFocusToSaturas);
};

//***************************************************************************
//	Info WHATNOW
//***************************************************************************
instance Info_Saturas_WHATNOW (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_WHATNOW_Condition;
	information	= Info_Saturas_WHATNOW_Info;
	permanent	= 0;
	important 	= 0;
	description = "Co teï budeš dìlat s tím ohniskem a almanachem?";
};

FUNC INT Info_Saturas_WHATNOW_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_FOCUS) && Npc_KnowsInfo(hero, Info_Saturas_BOOK))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_WHATNOW_Info()
{
	AI_Output			(other, self,"Info_Saturas_WHATNOW_15_01"); //Co teï budeš dìlat s tím ohniskem a almanachem?
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_03"); //Nic. Nejprve potøebujeme zbývající ètyøi ohniskové kameny!
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_04"); //Bohužel ale nemáme ani jeden z tìch ètyø magických kamenù.
};

//***************************************************************************
//	Info OFFER
//***************************************************************************
instance Info_Saturas_OFFER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_OFFER_Condition;
	information	= Info_Saturas_OFFER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Jsem ochoten pro vás ty zbývající ètyøi ohniskové kameny najít!";
};

FUNC INT Info_Saturas_OFFER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_WHATNOW))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_OFFER_Info()
{
	AI_Output			(other, self,"Info_Saturas_OFFER_15_01"); //Jsem ochoten pro vás ty zbývající ètyøi ohniskové kameny najít!
	AI_Output			(other, self,"Info_Saturas_OFFER_15_02"); //Pøedevším mám sám docela zájem se odtud dostat.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_03"); //Musím tì varovat. Jejich hledání bude stejnì obtížné, jako nebezpeèné.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_04"); //Protože se konflikt se Starým táborem den ze dne horší, nemùžu ti sebou dát žádné žoldáky.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_05"); //Budeš si muset vystaèit úplnì sám.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_06"); //Dobrá... To pro mì není nic nezvyklého! Najdu zpùsob, jak ty vìci zaøídit.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_07"); //Tvá víra je ti ke cti, budeš ale potøebovat pár vìcí, které ti pomùžou!
	AI_Output			(self, other,"Info_Saturas_OFFER_14_08"); //Vezmi si tuhle mapu. Je stará, ale jsou na ní vyznaèeny všechny pùvodní pozice ohniskových kamenù z doby, kdy se vytváøela Bariéra.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_09"); //Tyhle kouzelné svitky ti umožní rychlejší návrat do tábora.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_10"); //A koneènì si budeš také muset promluvit s Riordianem. Vaøí pro tábor lektvary.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_11"); //Najdeš ho v jeho chatrèi, tady v horní vrstvì.

	B_Story_BringFoci	();
};

//***************************************************************************
//	B_DeliverFocus
//***************************************************************************
func void B_DeliverFocus()
{
	//-------- 2. Fokus abliefern --------
	if 		(Saturas_BringFoci == 1)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_01"); //Hm, tak to je zaèátek. Dìláš to dobøe.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_02"); //K uskuteènìní našeho plánu ještì chybí tøi ohniskové kameny.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_03"); //Teï jdi a porozhlédni se po zbývajících ohniskových kamenech.
		Saturas_BringFoci = 2;	
		B_GiveXP  		(XP_DeliverSecondFocus);
	}

	//-------- 3. Fokus abliefern --------
	else if	(Saturas_BringFoci == 2)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_04"); //Výbornì, to je druhý ohniskový kámen, který jsi nám donesl.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_05"); //Blížíme se krok po kroku k našemu cíli.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_06"); //Seber odvahu a pøines ty dva zbývající ohniskové kameny.
		Saturas_BringFoci = 3;	
		B_GiveXP  		(XP_DeliverThirdFocus);
	}
	
	//-------- 4. Fokus abliefern --------
	else if	(Saturas_BringFoci == 3)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_07"); //Neuvìøitelné, už mám pohromadì ètyøi ohniskové kameny.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_08"); //Už nám chybí jen jediný, pak je budeme mít všechny.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_09"); //Udìlal jsi pro naší komunitu opìt obrovskou službu. Najdi nám poslední ohniskový kámen a brzy budeme všichni volní.
		Saturas_BringFoci = 4;	
		B_GiveXP  		(XP_DeliverFourthFocus);
	}
	
	//-------- 5. Fokus abliefern --------
	else if	(Saturas_BringFoci == 4)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_10"); //Výbornì, teï máme všech pìt ohniskových kamenù.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_11"); //Tvé èiny jsou pro náš tábor nedocenitelné. Máš mou vìènou úctu.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_12"); //Jdi teï k Riordianovi. Dá ti odmìnu za tvé nesmírné úsilí.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_13"); //Øekni si také Cronosovi, strážci rudy. Dá ti od naší komunity další dar.

		Saturas_BringFoci = 5;	
		B_GiveXP  			(XP_DeliverFifthFocus);

		B_LogEntry		(CH3_BringFoci,"Podaøilo se mi najít všechny ètyøi ohniskové kameny. Doufám, že mi to v Novém táboøe zajistí uznání.");
		B_LogEntry		(CH3_BringFoci,"Mágové Vody, Cronos a Riordian, mi slíbili za ohniskové kameny odmìnu. Mìl bych se po nich jít podívat.");

		
		// Aufhebung des Log_running_Status, wenn die Foki schon vorher abgegeben wurden, bevor SC die einzelnen Aufträge bekam.    ***Björn***
		
		Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	};
		
	//-------- Neuer Teleportzauber ? --------
	if ( !Npc_HasItems(hero, ItArScrollTeleport2) && (Saturas_BringFoci < 5) )	
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_14"); //Vidím, že už jsi vyèerpal teleportaèní svitek. Tady máš nový.
		CreateInvItem	(self,	ItArScrollTeleport2);
		B_GiveInvItems	(self, other, ItArScrollTeleport2, 1);
	};
};

//***************************************************************************
//	Info BRINGFOCUS2
//***************************************************************************
instance Info_Saturas_BRINGFOCUS2 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS2_Condition;
	information	= Info_Saturas_BRINGFOCUS2_Info;
	permanent	= 0;
	important	= 0;
	description = "Našel jsem ohnisko v Kaòonu trolù!";
};

FUNC INT Info_Saturas_BRINGFOCUS2_Condition()
{	
	if ( Npc_HasItems(hero,focus_2) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS2_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS2_15_01"); //Našel jsem ohnisko v Trolím kaòonu!

	B_LogEntry		(CH3_TrollCanyon,"Ohnisko z Trolího kaòonu je teï v bezpeèí u Saturase.");
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_2, 1);
	Npc_RemoveInvItem	(self,	focus_2);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS3
//***************************************************************************
instance Info_Saturas_BRINGFOCUS3 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS3_Condition;
	information	= Info_Saturas_BRINGFOCUS3_Info;
	permanent	= 0;
	important 	= 0;
	description = "Našel jsem ohnisko v horské pevnosti!";
};

FUNC INT Info_Saturas_BRINGFOCUS3_Condition()
{	
	if ( Npc_HasItems(hero,focus_3) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS3_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS3_15_01"); //Našel jsem ohnisko v horské pevnosti!

	B_LogEntry		(CH3_Fortress,"Saturas ode mì dostal ohnisko z horské pevnosti.");
	Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_3, 1);
	Npc_RemoveInvItem	(hero,	focus_3);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS4
//***************************************************************************
instance Info_Saturas_BRINGFOCUS4 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS4_Condition;
	information	= Info_Saturas_BRINGFOCUS4_Info;
	permanent	= 0;
	important 	= 0;
	description = "Našel jsem ohnisko ve zboøeném klášteøe!";
};

FUNC INT Info_Saturas_BRINGFOCUS4_Condition()
{	
	if ( Npc_HasItems(hero,focus_4) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS4_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_01"); //Našel jsem ohnisko ve zboøeném klášteøe!
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_02"); //Byl tam žoldák Gorn a pomohl mi s hledáním.

	B_LogEntry		(CH3_MonasteryRuin,"Koneènì jsem mohl Saturasovi dát ohnisko ze zboøeného kláštera.");
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_4, 1);
	Npc_RemoveInvItem	(hero,	focus_4);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS5
//***************************************************************************
instance Info_Saturas_BRINGFOCUS5 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS5_Condition;
	information	= Info_Saturas_BRINGFOCUS5_Info;
	permanent	= 0;
	important 	= 0;
	description = "Našel jsem ohnisko pod kamenným kruhem!";
};

FUNC INT Info_Saturas_BRINGFOCUS5_Condition()
{	
	if ( Npc_HasItems(hero,focus_5) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS5_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS5_15_01"); //Našel jsem ohnisko pod kamenným kruhem!

	B_LogEntry		(CH3_Stonehenge,"Dal jsem Saturasovi ohnisko z krypty pod kamenným kruhem.");
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_5, 1);
	Npc_RemoveInvItem	(hero,	focus_5);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info ALLFOCI
//***************************************************************************
instance Info_Saturas_ALLFOCI (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ALLFOCI_Condition;
	information	= Info_Saturas_ALLFOCI_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mùžeš už tu rudnou haldu odpálit?";
};

FUNC INT Info_Saturas_ALLFOCI_Condition()
{	
	if	(Saturas_BringFoci == 5)
	&&	(Kapitel < 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ALLFOCI_Info()
{
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_01"); //Mùžeš už tu rudnou haldu odpálit?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_02"); //Teï už máme všechny artefakty, které potøebujeme k provedení našeho plánu.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_03"); //Bariéru ale vytvoøilo dvanáct mágù.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_04"); //V Kruhu vody není dost mágù, kteøí by øídili silovou energii a vedli ji správným smìrem.
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_05"); //Co mùžeme udìlat?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_06"); //Oceòuji, že jsi toho pro naši komunitu už tolik udìlal, jsme ti nesmírnì zavázaní...
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_07"); //...ale v zájmu všech obyvatel kolonie tì musím požádat ještì o jednu službu.
};

//***************************************************************************
//	Info FAVOR
//***************************************************************************
instance Info_Saturas_FAVOR (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FAVOR_Condition;
	information	= Info_Saturas_FAVOR_Info;
	permanent	= 0;
	important 	= 0;
	description = "Ještì jednu službu?";
};

FUNC INT Info_Saturas_FAVOR_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_ALLFOCI))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FAVOR_Info()
{
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_01"); //Ještì jednu službu?
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_02"); //Ano. Jdi do Starého tábora a pokus se získat nìjaké mágy Kruhu ohnì pro naši vìc.
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_03"); //MÁGY OHNÌ??? Proè by se mìli vzdát svého pohodlného života?
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_04"); //Znièení Bariéry ukonèí jejich mocenské postavení!
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_05"); //To je ten dùvod, proè se musíš o tento úkol pokusit PRÁVÌ TY. Znáš lidi ze všech táborù kolonie.
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_06"); //Pøipomeò mágùm Ohnì staré èasy, kdy jsme spoleènì studovali umìní magie.
};	

//***************************************************************************
//	Info ACCEPT
//***************************************************************************
instance Info_Saturas_ACCEPT (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ACCEPT_Condition;
	information	= Info_Saturas_ACCEPT_Info;
	permanent	= 0;
	important 	= 0;
	description = "Dobrá tedy, pokusím se pøesvìdèit mágy Ohnì!";
};

FUNC INT Info_Saturas_ACCEPT_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_FAVOR))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ACCEPT_Info()
{
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_01"); //Dobrá tedy, pokusím se pøesvìdèit mágy Ohnì!
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_02"); //Nemùžu ale slíbit nic! Zdá se mi to bezmála nemožné!
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_03"); //Musíš to zkusit. Když se ti to nepodaøí, pak už zbude jen jeden...
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_04"); //Právì jeden...
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_05"); //... jeden CO?
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_06"); //Zapomeò na to! MUSÍ se ti to povést!
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_07"); //Tady je kouzelná runa. Dej ji Corristovi, Velkému mágovi Kruhu ohnì jako dùkaz naší dùvìry.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_08"); //S ní se mùže kdykoliv teleportovat do této místnosti, aniž by se setkal se strážemi.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_09"); //Doufám, že to naše staré pøátele pøesvìdèí o našem dobrém zámìru.

	B_KapitelWechsel	(4);
};	







//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info AMBUSH
//---------------------------------------------------------------------
instance Info_Saturas_AMBUSH (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_AMBUSH_Condition;
	information	= Info_Saturas_AMBUSH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Saturas_AMBUSH_Condition()
{	
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_AMBUSH_Info()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(PC_FIGHTER);
	AI_TurnToNpc		(gorn,hero);
	
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_01"); //Jsem rád, že ses vrátil. Stalo se nìco špatného!
	AI_Output			(hero,self,"Info_Saturas_AMBUSH_15_02"); //Nech mì hádat, Svobodný dùl byl napaden strážemi Starého tábora. Nikdo je nevidìl pøicházet...?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_03"); //Pokraèuj... jak... ale samozøejmì... Ty víš o tom, co se stalo ve Starém táboøe!
	AI_Output	 		(self,hero,"Info_Saturas_AMBUSH_14_04"); //Chvilku pøed tebou pøišel Gorn.
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_05"); //Co pøimìlo Gomeze, že si troufl k tak agresivnímu èinu?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_06"); //Musí mu být jasné, že takový hanebný èin jenom vyprovokuje válku.
};	

//---------------------------------------------------------------------
//	Info COLLAPSE
//---------------------------------------------------------------------
instance Info_Saturas_COLLAPSE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_COLLAPSE_Condition;
	information	= Info_Saturas_COLLAPSE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Starý dùl se zhroutil potom, co ho zatopila voda!";
};

FUNC INT Info_Saturas_COLLAPSE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_COLLAPSE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_COLLAPSE_15_01"); //Starý dùl se zhroutil potom, co ho zatopila voda!
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_02"); //...Zhroutil... jistì... pak celá ta vìc dává smysl.
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_03"); //Gomez stojí zády ke zdi. Je nebezpeènìjší než kdy jindy. Nemá už co ztratit, je schopný èehokoliv!
};

//---------------------------------------------------------------------
//	Info MURDER
//---------------------------------------------------------------------
instance Info_Saturas_MURDER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_MURDER_Condition;
	information	= Info_Saturas_MURDER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Gomez zabil všechny mágy Ohnì!";
};

FUNC INT Info_Saturas_MURDER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_MURDER_Info()
{
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_01"); //Gomez zabil všechny mágy Ohnì!
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_02"); //ZABIL JE??? Jak mohl, pøi jménu Beliarovu, tohle udìlat?
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_03"); //Postavili se proti útoku na Svobodný dùl a protivili se Gomezovi.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_04"); //Pak jsme všichni ztraceni. Bez ostatních šesti mágù nebudeme nikdy schopni usmìrnit sílu masivu rudné haldy.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_05"); //Ale pøesto ti dìkuju za to, že jsi mi tu hroznou zprávu sdìlil.

	B_GiveXP			(XP_ReportToSaturas);
	
	B_LogEntry			(CH4_Firemages,"Saturas nemìl pøíliš radost, když jsem mu povìdìl o incidentech ve Starém táboøe. To, co se pøihodilo znamená, že svùj plán na únik... budou muset provést BEZ mágù Ohnì.");
	Log_SetTopicStatus	(CH4_Firemages,	LOG_SUCCESS);
};



/*------------------------------------------------------------------------
							GILDENWECHSEL									
------------------------------------------------------------------------*/
instance  KDW_600_Saturas_NOMOREOC (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_NOMOREOC_Condition;
	information		= KDW_600_Saturas_NOMOREOC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Byl jsem vyhoštìn ze Starého tábora, protože jsem vám pomáhal!"; 
};

FUNC int  KDW_600_Saturas_NOMOREOC_Condition()
{	
	if	Npc_KnowsInfo (hero,Info_Saturas_MURDER)
	&&	((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		return TRUE;
	};
};

FUNC void  KDW_600_Saturas_NOMOREOC_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_NOMOREOC_Info_15_01"); //Byl jsem vyhoštìn ze Starého tábora, protože jsem vám pomáhal!
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_02"); //Už teda nepatøíš ke Starému táboru?
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Pak vítej do naší komunity!

	Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
	B_LogEntry			(CH4_BannedFromOC,"Když jsem byl vykázán ze Starého tábora, Saturas mì pøivítal v Novém táboøe.");
}; 

/*------------------------------------------------------------------------
							VOM GRD ZUM SLD									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_GOTOLEE (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_GOTOLEE_Condition;
	information		= KDW_600_Saturas_GOTOLEE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znamená to, že mì pøijmou žoldáci?"; 
};

FUNC int  KDW_600_Saturas_GOTOLEE_Condition()
{	
	if (oldHeroGuild == GIL_GRD)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_GOTOLEE_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_GOTOLEE_Info_15_01"); //Znamená to, že mì pøijmou žoldáci?
	AI_Output			(self, other,"KDW_600_Saturas_GOTOLEE_Info_14_02"); //Øekni Leeovi, dohlédne na to. Pak se ke mnì vra.

	B_LogEntry			(CH4_BannedFromOC,"Lee, velitel žoldákù, se mnou chce mluvit. Mám se k nìmu dostavit a pak se vrátit k Saturasovi."); 
};  
 
/*------------------------------------------------------------------------
							VON KDF ZU KDW									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_OATH (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_OATH_Condition;
	information		= KDW_600_Saturas_OATH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Znamená to, že teï patøím do spolku mágù Vody?"; 
};

FUNC int  KDW_600_Saturas_OATH_Condition()
{	
	if (oldHeroGuild == GIL_KDF)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_OATH_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Znamená to, že teï patøím do spolku mágù Vody?
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Ještì ne. Nejdøíve musíš složit pøísahu Vody.
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_03"); //Já už jsem ale složil pøísahu Ohnì!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_04"); //Hmmm...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_05"); //To neznamená, že tím svùj slib porušíš!
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_06"); //Uch... Nerozumím...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_07"); //Rozšíøíš svoji pøísahu. Tak se staneš mágem obou živlù!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_08"); //Pak budeš mít sílu Ohnì, zrovna tak jako moudrost Vody!

	B_LogEntry			(CH4_BannedFromOC,"Saturas mì nechá pøidat se ke Kruhu vody, aniž bych musel zrušit pøísahu Ohni."); 
};  

/*------------------------------------------------------------------------
//							KDWAUFNAHME									//
------------------------------------------------------------------------*/
instance KDW_600_Saturas_KDWAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_KDWAUFNAHME_Condition;
	information		= KDW_600_Saturas_KDWAUFNAHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jsem pøipraven složit pøísahu."; 
};

FUNC int  KDW_600_Saturas_KDWAUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_OATH))
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_KDWAUFNAHME_Info()
{
	
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Jsem pøipraven složit pøísahu.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02"); //Služebníku Ohnì, teï dostaneš požehnání Vody!
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Nyní prones slova pøísahy:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Pøísahám pøi boží moci...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Pøísahám pøi boží moci...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...a na sílu svaté Vody...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...a na sílu svaté Vody...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...že mé vìdìní a skutky budu od tohoto okamžiku a provždy v jednotì s Vodou...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...že mé vìdìní a skutky budu od tohoto okamžiku a provždy v jednotì s Vodou...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...dokud mé tìlo nebude navráceno øíši Beliarovì a voda mého života nevyschne
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...dokud mé tìlo nebude navráceno øíši Beliarovì a voda mého života nevyschne
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12"); //Touto pøísahou jsi v sobì sjednotil sílu Ohnì a požehnání Vody.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13"); //Máš nyní ve svazku to, co døíve bylo rozdìleno. Kéž jde tvùj život ve znamení jednoty tìchto živlù.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Oblékni si toto roucho na znamení svazku se svatou Vodou a Adanosem.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	B_LogEntry			(CH4_BannedFromOC,"Teï jsem spojencem Kruhu vody. Nyní mám pøístup k obìma školám magie."); 
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);

	AI_StopProcessInfos	(self);
};
/*------------------------------------------------------------------------
						DIE MAGISCHEN KREISE							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_LESSON (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_LESSON_Condition;
	information		= KDW_600_Saturas_LESSON_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mùžeš mì cvièit?"; 
};

FUNC int  KDW_600_Saturas_LESSON_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW) 
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_LESSON_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_LESSON_Info_15_01"); //Mùžeš mì cvièit?
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) <= 3)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_02"); //Je toho hodnì, co se musíš nauèit. Budu tì cvièit, až na to budeš pøipraven.
	}
	else if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_03"); //Existuje ještì jeden Kruh, který neznáš. Budu tì o nìm uèit, jakmile budeš na to pøipraven.
	}
	else
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_04"); //Už jsi zvládl Pátý kouzelný kruh! Víš už to, co já.
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_05"); //Už tì víc uèit nedokážu!
	};

	Log_CreateTopic		(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Saturas, vùdce mágù Vody, uèí magickým KRUHÙM. Stále pøebývá u pentagramu v horní rovinì.");
};  
//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS1 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS1_Condition;
	information		= KDW_600_Saturas_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0); 
};

FUNC int  KDW_600_Saturas_KREIS1_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS1_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS1_Info_15_01"); //Jsem pøipraven vstoupit do Pátého kruhu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_02"); //Vstoupit do prvního z kouzelných kruhù znamená nauèit se používat kouzelné runy.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_03"); //Každá runa obsahuje strukturu zvláštního kouzelného zaøíkávadla.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_04"); //Spolu se svými vlastními kouzelnými silami budeš schopen využívat kouzlo run.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_05"); //Ale narozdíl od kouzelných svitkù, které jsou také kouzelnými formulemi, magická síla run zajišuje, že struktura zaøíkávadla pøetrvává.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_06"); //Každá runa je zdrojem magické síly, kterou mùžeš kdykoliv zase zrušit.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_07"); //Svoji vlastní kouzelnou moc využiješ tehdy, když použiješ runu, podobnì jako je tomu s kouzelným svitkem.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_08"); //Se vstupem do každého dalšího Kruhu se nauèíš využívat také další kouzelné runy.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_09"); //Využij moc run k poznání sebe sama.
		KDW_600_Saturas_KREIS1.permanent = 0;
	};
};  
//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS2_Condition;
	information		= KDW_600_Saturas_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0); 
};

FUNC int  KDW_600_Saturas_KREIS2_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS2_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS2_Info_15_01"); //Jsem pøipraven vstoupit do Druhého kruhu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_02"); //Nauèil ses rozumìt kouzelným znakùm. Nadešel èas prohloubit toto porozumìní.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_03"); //Jakmile se pøidáš ke Druhému kruhu, nauèíš se základùm mocnìjších bojových zaøíkávadel a všem tajùm ranhojièství.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_04"); //Budeš se ale muset nauèit ještì víc, jestli chceš poznat opravdová tajemství magie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_05"); //Víš, že každou runu mùžeš používat jak èasto chceš, dokud nevyèerpáš své vlastní síly.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_06"); //Než budeš jednat, rozmysli si cíl svého jednání. Nabyl jsi síly, která tì snadno mùže dovést k záhubì a znièení.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_07"); //Opravdový mág ale užívá kouzla jen tehdy, když je to nezbytné.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_08"); //Pokud porozumíš situaci, pak poznáš moc run.
		KDW_600_Saturas_KREIS2.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS3 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS3_Condition;
	information		= KDW_600_Saturas_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0); 
};

FUNC int  KDW_600_Saturas_KREIS3_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 2)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS3_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS3_Info_15_01"); //Mùžeš mì pøipravit do Tøetího kruhu?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_02"); //Tøetí kouzelný kruh je jedním z nejdùležitìjších krokù v životì mága. Jakmile ho dosáhneš, pøestáváš být hledaèem.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_03"); //Došel jsi už po cestì magie opravdu daleko. Nauèil ses používat kouzelné runy.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_04"); //Tato znalost je východisko pro tvojí další cestu. Používej tyto runy s uvážením.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_05"); //Runy mùžeš nebo nemusíš používat. Ale musíš se rozhodnout pro jednu z tìchto možností.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_06"); //Jakmile se rozhodneš, neostýchej se využít svých sil.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_07"); //Jakmile porozumíš své cestì, pak poznáš sílu rozhodnutí.
		KDW_600_Saturas_KREIS3.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER VIERTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS4 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS4_Condition;
	information		= KDW_600_Saturas_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0); 
};

FUNC int  KDW_600_Saturas_KREIS4_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS4_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS4_Info_15_01"); //Jsem pøipraven vstoupit do Pátého kruhu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_02"); //Dokonèil jsi první tøi Kruhy. Nyní nadešel èas nauèit se tajemství magie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_03"); //Kouzlo run je založeno na kamenech. Existují kouzelné kameny, vytvoøené z kouzelné rudy.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_04"); //Z té samé rudy, která se tìží tady v dolech. Tato ruda je obdaøena magickými formulemi templáøù. Tyto runy jsou upraveny jako nástroje naší moci.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_05"); //S tìmito runami, které už ovládáš, máš celé vìdìní chrámové sféry v malíèku.
		//AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_07"); //Jakmile porozumíš magii, objevíš tajemství moci.
		KDW_600_Saturas_KREIS4.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							DER FÜNFTE KREIS							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_KREIS5 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS5_Condition;
	information		= KDW_600_Saturas_KREIS5_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,0); 
};

FUNC int  KDW_600_Saturas_KREIS5_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS5_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS5_Info_15_01"); //Jsem pøipraven vstoupit do Pátého kruhu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 5, LPCOST_TALENT_MAGE_5))
	{
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_02"); //Správnì. Budu tì uèit o síle Pátého kruhu.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_03"); //Bouøe Ohnì a Vody a Síla, která nièí nemrtvé, jsou kouzla, která mùžeš tìmito runami vyvolávat.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_04"); //Nejmocnìjší zaøíkávadlo Pátého kruhu je ale Smrtelné vlnìní. Pokud vlastníš jeho runu, pak máš nebezpeènou moc.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_05"); //Tento druh kouzla ale používej co nejménì. Je to dar boha temnot.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Teï znáš všechno, co jsem tì mohl nauèit.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_06"); //Poznej své možnosti, pak budeš znát svoji opravdovou moc.
		KDW_600_Saturas_KREIS5.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							SCHWERE ROBE								
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_HEAVYARMOR (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_HEAVYARMOR_Condition;
	information		= KDW_600_Saturas_HEAVYARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_SaturasHighRobe,VALUE_KDW_ARMOR_H); 
};

FUNC int  KDW_600_Saturas_HEAVYARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_HEAVYARMOR_Info()
{
	AI_Output				(other, self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01"); //Chtìl bych nosit vznešené roucho Vody.
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) < 4)
	&& (Kapitel < 5)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02"); //Ještì nenadešel èas, abys nosil vznešené roucho.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03"); //S tímhle množstvím rudy nezaplatíš ani výrobní náklady.
	}
	else
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04"); //Nadešel tvùj èas. Jsi hoden nosit vznešené roucho Vody.
		KDW_600_Saturas_HEAVYARMOR.permanent = 0;

		B_GiveInvItems		(hero,self,	ItMinugget,VALUE_KDW_ARMOR_H);
		CreateInvItem		(hero,		KDW_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
	};
}; 

//---------------------------------------------------------------------
//	Info NOWSLD
//---------------------------------------------------------------------
instance Info_Saturas_NOWSLD (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NOWSLD_Condition;
	information	= Info_Saturas_NOWSLD_Info;
	permanent	= 0;
	important	= 0;
	description = "Lee mì pøijmul k žoldákùm.";
};

FUNC INT Info_Saturas_NOWSLD_Condition()
{	
	if	Npc_KnowsInfo(hero, Sld_700_Lee_CHANGESIDE)
	{
		return TRUE;
	}; 
};

FUNC VOID Info_Saturas_NOWSLD_Info()
{
	AI_Output			(hero,self,"Info_Saturas_NOWSLD_15_01"); //Lee mì pøijmul k žoldákùm.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_02"); //Dobøe. Výbornì. Teï patøíš oficiálnì k naší komunitì.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_03"); //Buï vítán!

	B_LogEntry			(CH4_BannedFromOC,"Saturas mì oficiálnì uvedl jako žoldáka. ");
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);	
};

//---------------------------------------------------------------------
//	Info XARDAS
//---------------------------------------------------------------------
instance Info_Saturas_XARDAS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDAS_Condition;
	information	= Info_Saturas_XARDAS_Info;
	permanent	= 0;
	important	= 0;
	description = "Když jsi mì posílal k mágùm Ohnì, øíkal jsi, že byl... NÌKDO.";
};

FUNC INT Info_Saturas_XARDAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_COLLAPSE)
	&&	Npc_KnowsInfo(hero, Info_Saturas_MURDER)
	{		 										//***Björn***>

		if( (Npc_GetTrueGuild(hero)!=GIL_GRD)  &&  (Npc_GetTrueGuild(hero)!=GIL_KDF)  )
		{
			return TRUE;
		};

/*												
		if 		(oldHeroGuild==GIL_GRD)
		{
			if (Npc_GetTrueGuild(hero)==GIL_SLD)
			{
				return TRUE;
			};
		}
		else if (oldHeroGuild==GIL_KDF)
		{
			if (Npc_GetTrueGuild(hero)==GIL_KDW)
			{
				return TRUE;
			};
		}
		else
		{
			return TRUE;
		}; 											<***Björn***
*/												

	};	
};

FUNC VOID Info_Saturas_XARDAS_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_01"); //Když jsi mì posílal k mágùm Ohnì, øíkal jsi, že byl... NÌKDO.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_02"); //Dobrá, doufal jsem, že to dokážu bez tvojí pomoci, vìci se mìní...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_03"); //Kdo je ten ON?
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_04"); //Dobøe, dobøe!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_05"); //Pøed mnoha mnoha lety...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_06"); //Zkra to, prosím!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_07"); //Buï trpìlivý! Dobrá, když jsme - nás dvanáct mágù - tvoøili tehdy Bariéru, naše magické síly byly smìrovány a øízeny tøináctým mágem.
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_08"); //Tøináctým mágem? Myslel jsem, že jich bylo jen dvanáct!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_09"); //Vìtšina lidí, která nezažila nejstarší období kolonie, tomu vìøí.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_10"); //Ten tøináctý mág byl náš vùdce. To všechno se stalo pøedtím, než jsme byli rozdìleni do Kruhù Ohnì a Vody.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_11"); //Opustil ale Starý tábor, který byl tehdy jediným v kolonii.
};

//---------------------------------------------------------------------
//	Info XARDASWHO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHO_Condition;
	information	= Info_Saturas_XARDASWHO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Jak se ten tøináctý mág jmenoval?";
};

FUNC INT Info_Saturas_XARDASWHO_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHO_15_01"); //Jak se ten tøináctý mág jmenoval?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_02"); //Jmenoval se Xardas. Sotva si nìkdo vzpomene na tu starou historii!
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_03"); //Ti kteøí si vzpomenou, ho teï nazývají NEKROMANT!
};

//---------------------------------------------------------------------
//	Info XARDASWHY
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHY (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHY_Condition;
	information	= Info_Saturas_XARDASWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Proè opustil Starý tábor?";
};

FUNC INT Info_Saturas_XARDASWHY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHY_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_01"); //Proè opustil Starý tábor?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_02"); //Zaèal zkoumat vyvolávání mrtvých a magických stvùr.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_03"); //Gomez nebyl jediný, kdo ho varoval. Vìtšina mágù se postavila proti nìmu i proti jeho bezbožným praktikám.
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_04"); //Co se stalo pak?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_05"); //Narozdíl od Gomeze to nebyl vrahoun, a tak se mu podaøilo vyhnout konfliktu a odejít.
};

//---------------------------------------------------------------------
//	Info XARDASWHERE
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHERE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHERE_Condition;
	information	= Info_Saturas_XARDASWHERE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Kde je ten mág dneska?";
};

FUNC INT Info_Saturas_XARDASWHERE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHERE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHERE_15_01"); //Kde je ten mág dneska?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_02"); //Žije v odlouèení ve vìži uprostøed zemì skøetù.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_03"); //To je pøibližnì u nejjižnìjšího cípu kolonie.
};

//---------------------------------------------------------------------
//	Info XARDASHELP
//---------------------------------------------------------------------
instance Info_Saturas_XARDASHELP (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASHELP_Condition;
	information	= Info_Saturas_XARDASHELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "Pùjdu za Xardasem a požádám ho o pomoc!";
};

FUNC INT Info_Saturas_XARDASHELP_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHO)
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHY) 
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHERE) 
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASHELP_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_01"); //Pùjdu za Xardasem a požádám ho o pomoc!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_02"); //Je jediný, kdo nám mùže pomoci.
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_03"); //Pokud si ale nebude vìdìt rady nebo nám nepomùže...
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_04"); //BUDE!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_05"); //Je tu ještì jeden problém...
	
	B_Story_FindXardas	();
};

//---------------------------------------------------------------------
//	Info XARDASPROBLEM
//---------------------------------------------------------------------
instance Info_Saturas_XARDASPROBLEM (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASPROBLEM_Condition;
	information	= Info_Saturas_XARDASPROBLEM_Info;
	permanent	= 0;
	important 	= 0;
	description = "Problém?";
};

FUNC INT Info_Saturas_XARDASPROBLEM_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASHELP)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_01"); //Problém?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_02"); //Ano. Bìhem let jsme se nìkolikrát pokoušeli s Xardasem spojit.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_03"); //Zøejmì však nechtìl být vyrušován.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_04"); //Co to znamená?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_05"); //Žádný z kurýrù se od nìj z vìže nevrátil.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_06"); //Budeš muset vymyslet zpùsob, jak projít pøes ty stvùry.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_07"); //Zaèíná to být zajímavé!
	
	B_LogEntry			(CH4_FindXardas,"Saturas mì varoval pøed stvùrami nekromanta Xardase. V knihovnì mágù Vody jsou spisy o síle i slabinách tìchto netvorù. Mìl bych si udìlat èas a proèíst si je.");	
};

//---------------------------------------------------------------------
//	Info XARDASGO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASGO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASGO_Condition;
	information	= Info_Saturas_XARDASGO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Jak se dostanu pøes ty stvùry?";
};

FUNC INT Info_Saturas_XARDASGO_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASPROBLEM)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASGO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_01"); //Jak se dostanu pøes ty stvùry?
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_02"); //Kdybych vìdìl, øekl bych ti to!
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_03"); //Poradil bych ti, aby ses porozhlédl v naší knihovnì.
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_04"); //Možná ve starých knihách najdeš nìco o síle i slabinách magií vytvoøených stvùr.
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_05"); //Prohledám knihovnu. A nemìj obavy...
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_06"); //Vrátím se!

	B_LogEntry			(CH4_FindXardas,"V knihovnì mágù Vody jsou spisy o síle i slabinách tìchto netvorù. Mìl bych si udìlat èas a proèíst si je.");
	
};

/*------------------------------------------------------------------------
//	TIMESUP- Xardas ist die Schlüsselperson, Saturas ist nicht mehr wichtig									
------------------------------------------------------------------------*/
instance KDW_600_Saturas_TIMESUP (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_TIMESUP_Condition;
	information		= KDW_600_Saturas_TIMESUP_Info;
	important	    = 1;
	permanent		= 0;
};

FUNC int  KDW_600_Saturas_TIMESUP_Condition()
{	
	if FindOrcShaman == LOG_RUNNING
	|| FindOrcShaman == LOG_SUCCESS
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_TIMESUP_Info()
{
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_00"); //Mluvil jsi s Xardasem?
	Info_ClearChoices	(KDW_600_Saturas_TIMESUP);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Tedy...",KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Ne...",KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Celá ta záležitost není taková, jak si myslíš...",KDW_600_Saturas_TIMESUP_JA3);

};
func void KDW_600_Saturas_TIMESUP_JA1()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_01"); //Tedy...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_02"); //Tedy...? Co, teda?
	//AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_03"); //Äh ... noch nicht ... ich bin aber schon unterwegs ...
	//AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_04"); //Beeile dich, wir dürfen keine Zeit mehr verlieren!
	//B_Story_CancelFindXardas();
	//AI_StopProcessInfos(self);
};
func void KDW_600_Saturas_TIMESUP_JA2()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_05"); //Ne...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_06"); //Proè ne?
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_07"); //Nedokázal jsem se dostat do té oblasti...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_08"); //Musíš ho najít a požádat ho o radu!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};
func void KDW_600_Saturas_TIMESUP_JA3()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_09"); //Celá ta záležitost není taková, jak si myslíš...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_10"); //Co to má znamenat? Musí najít zpùsob, jak odpálit tu rudnou haldu!
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_11"); //Ta rudná halda... uch... ehm... Vyrostla poøádnì vysoko!
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_12"); //Najdi Xardase, musí pomoci!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};




//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////// SLD zu Magier		//////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

// ****************************************
// 			Aufnahme eines Sld 
// ****************************************

instance KDW_600_Saturas_HogeAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHME_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHME_Info;
	permanent		= 0;
	description		= "Nefarius øekl, že už jsem hoden nosit roucho mága Vody."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHME_Condition()
{	
	if ( Npc_KnowsInfo(hero,Info_Saturas_MURDER) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHME_Info()
{
	AI_Output(other, self,"KDW_600_Saturas_HogeAUFNAHME_15_00"); //Nefarius øekl, že už jsem hoden nosit roucho mága Vody.
	
	/* AB HIER IST ALLES DOPPELT - geklaut aus der KdF-KdW-Aufnahme */
	
	AI_Output(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Pak vítej do naší komunity!
	AI_Output(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Znamená to, že teï patøím do spolku mágù Vody?
	AI_Output(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Ještì ne. Nejdøíve musíš složit pøísahu Vody.
};
	
// ****************************************
// 			Aufnahme eines Sld - Teil 2
// ****************************************
instance KDW_600_Saturas_HogeAUFNAHMETeil2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHMETeil2_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHMETeil2_Info;
	permanent		= 0;
	description		= "Jsem pøipraven složit pøísahu."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHMETeil2_Condition()
{	
	if ( (Npc_KnowsInfo(hero,KDW_600_Saturas_HogeAUFNAHME)) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHMETeil2_Info()
{
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Jsem pøipraven složit pøísahu.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Nyní prones slova pøísahy:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Pøísahám pøi boží moci...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Pøísahám pøi boží moci...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...a na sílu svaté Vody...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...a na sílu svaté Vody...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...že mé vìdìní a skutky budu od tohoto okamžiku a provždy v jednotì s Vodou...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...že mé vìdìní a skutky budu od tohoto okamžiku a provždy v jednotì s Vodou...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...dokud mé tìlo nebude navráceno øíši Beliarovì a voda mého života nevyschne
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...dokud mé tìlo nebude navráceno øíši Beliarovì a voda mého života nevyschne
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Oblékni si toto roucho na znamení svazku se svatou Vodou a Adanosem.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	Log_CreateTopic		(CH4_SldToKdW,	LOG_NOTE);
	B_LogEntry			(CH4_SldToKdW,"Saturas mì pøijal do Kruhu vody.");

	AI_StopProcessInfos	(self);
};

