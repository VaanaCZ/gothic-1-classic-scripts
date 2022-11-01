// **************************************
//					EXIT 
// **************************************

instance DIA_Raven_Exit (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 999;
	condition	= DIA_Raven_Exit_Condition;
	information	= DIA_Raven_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Raven_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Erstes Mal rein
// **************************************

instance DIA_Raven_FirstIn (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_FirstIn_Condition;
	information	= DIA_Raven_FirstIn_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Raven_FirstIn_Condition()
{
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if (wache218.aivar[AIV_PASSGATE]==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_FirstIn_Info()
{
	AI_Output (self, other,"DIA_Raven_FirstIn_10_00"); //Co pro tebe můžu udělat?
};

// **************************************
//			Wer bist du?
// **************************************

instance DIA_Raven_Who (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Who_Condition;
	information	= DIA_Raven_Who_Info;
	permanent	= 0;
	description	= "Kdo jsi?";
};                       

FUNC int DIA_Raven_Who_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Who_Info()
{
	AI_Output (other, self,"DIA_Raven_Who_15_00"); //Kdo jsi?
	AI_Output (self, other,"DIA_Raven_Who_10_01"); //Jsem Raven. Gomezova pravá ruka. Každý, kdo chce navštívit Gomeze, to musí říci nejdřív MNĚ.
};

// **************************************
//			Krautbote
// **************************************

instance DIA_Raven_Krautbote (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Krautbote_Condition;
	information	= DIA_Raven_Krautbote_Info;
	permanent	= 0;
	description	= "Mám pro Gomeze trochu drogy z bažin od Cora Kaloma.";
};                       

FUNC int DIA_Raven_Krautbote_Condition()
{
	if	(KALOM_KRAUTBOTE == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID DIA_Raven_Krautbote_Info()
{
	AI_Output			(other, self,"DIA_Raven_Krautbote_15_00"); //Mám pro Gomeze trochu drogy z bažin od Cora Kaloma.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_01"); //Tyhle věci domlouvá Bartholo. Gomez se s poslíčky nebaví.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_02"); //Najdeš ho v místnosti hned vpravo za vchodem. Nebo v kuchyni ve velké věži.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_03"); //V noci samozřejmě spí. Být tebou, tak bych ho nevyrušoval.

	B_LogEntry			(CH1_KrautBote,"Dodávka drogy pro Gomeze se musí odevzdat u Barthola. Najdu ho v domě Rudobaronů.");
};

// **************************************
//		Gomez sehen (Stt-Aufnahme)
// **************************************

instance DIA_Raven_Aufnahme (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Aufnahme_Condition;
	information	= DIA_Raven_Aufnahme_Info;
	permanent	= 0;
	description	= "Chci vidět Gomeze. Thorus říká, že patřím ke Stínům.";
};                       

FUNC int DIA_Raven_Aufnahme_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	&& (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Raven_Aufnahme_15_00"); //Chci vidět Gomeze. Thorus říká, že patřím ke Stínům.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_01"); //Vždycky rozpoznáme poctivé muže. Vypadáš, že takový jseš. Jsi v pohodě.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_02"); //Zavedu tě ke Gomezovi. A na nic nesahej!
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self, "GUIDE");
};

// **************************************
//		In Halle angekommen
// **************************************

instance DIA_Raven_There (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_There_Condition;
	information	= DIA_Raven_There_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int DIA_Raven_There_Condition()
{
	if 	( Npc_KnowsInfo(hero,DIA_Raven_Aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT") ) 
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_There_Info()
{
	AI_Output (self, other,"DIA_Raven_There_10_01"); //Gomez tě očekává. Jestli k němu se k němu nebudeš chovat uctivě, bude mi potěšením tě to naučit, je ti to jasné?
	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self, "START");
};


// **************************************
//				PERM
// **************************************

instance DIA_Raven_PERM (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_PERM_Condition;
	information	= DIA_Raven_PERM_Info;
	permanent	= 1;
	description	= "Jak jde obchod s rudou?";
};                       

FUNC int DIA_Raven_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_PERM_Info()
{
	AI_Output (other, self,"DIA_Raven_PERM_15_00"); //Jak jde obchod s rudou?
	AI_Output (self, other,"DIA_Raven_PERM_10_01"); //Ve Starém dolu to jde dobře. Poslední dodávka zásob z vnějšího světa byla obrovská.
};

// **************************************
//			Bin dabei
// **************************************

instance DIA_Raven_BinDabei (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_BinDabei_Condition;
	information	= DIA_Raven_BinDabei_Info;
	permanent	= 0;
	description	= "Gomez říká, že jsem v pořádku.";
};                       

FUNC int DIA_Raven_BinDabei_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gomez_Dabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_BinDabei_Info()
{
	CreateInvItem		(hero, STT_ARMOR_M);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	AI_Output			(other, self,"DIA_Raven_BinDabei_15_00"); //Gomez říká, že jsem v pořádku.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_01"); //Výborně! V tom případě to můžeš dokázat svým prvním úkolem.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_02"); //Když říkáš, že jsou tvé kontakty tak dobré, nemělo by to pro tebe být těžké.

	AI_EquipBestArmor	(hero); 
};

// *********************************************
// 				Sekten-Auftrag
// *********************************************
	var int Raven_SpySect;
// *********************************************

INSTANCE DIA_Raven_SpySect (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpySect_Condition;
	information	= DIA_Raven_SpySect_Info;
	permanent	= 0;
	description	= "Co mám pro tebe udělat?";
};

FUNC INT DIA_Raven_SpySect_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_BinDabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpySect_Info()
{
	AI_Output (other, self,"DIA_Raven_SpySect_15_00"); //Co mám pro tebe udělat?
	AI_Output (self, other,"DIA_Raven_SpySect_10_01"); //Děláme hodně obchodů s Bratrstvem. To ale neznamená, že jsme s nimi ve svazku.
	AI_Output (self, other,"DIA_Raven_SpySect_10_02"); //Jdi do močálů.
	AI_Output (self, other,"DIA_Raven_SpySect_10_03"); //Až dorazíš do tábora, měj uši nastražené. Vše, co se dozvíš, se nám může hodit.
	AI_Output (self, other,"DIA_Raven_SpySect_10_04"); //Čím víc toho zjistíš, tím líp. Měl bys být opatrný, jestli chápeš, co tím myslím.
	AI_Output (other, self,"DIA_Raven_SpySect_15_05"); //Buď v klidu, nemám v úmyslu je naštvat.
	AI_Output (self, other,"DIA_Raven_SpySect_10_06"); //Věděl jsem, že mi budeš rozumět.
	
	Raven_SpySect = LOG_RUNNING;
	
	Log_CreateTopic	(CH1_GoToPsi,	LOG_MISSION);
	Log_SetTopicStatus (CH1_GoToPsi,	LOG_RUNNING);
	B_LogEntry (CH1_GoToPsi,"Raven mě vyslal jako zástupce Starého tábora k Bratrstvu do bažin. Musím se tam porozhlédnout a mít nastražené uši. Možná se mi tu podaří získat nějaké užitečné informace pro Rudobarony.");
};

// *********************************************
// 				Ausrüstung
// *********************************************

INSTANCE DIA_Raven_Equipment (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Equipment_Condition;
	information	= DIA_Raven_Equipment_Info;
	permanent	= 0;
	description	= "Kde dostanu lepší výbavu?";
};

FUNC INT DIA_Raven_Equipment_Condition()
{
	if (Raven_SpySect==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Equipment_Info()
{
	AI_Output	(other, self,"DIA_Raven_Equipment_15_00"); //Kde dostanu lepší výbavu?
	AI_Output	(self, other,"DIA_Raven_Equipment_10_01"); //Jdi za Diegem, dá ti nějakou výzbroj. S ní nebudeš tak rychle mrtvý a zároveň ti poslouží jako průkaz.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_02"); //Tvoje výzbroj ti umožní přístup do všech míst, kam se budeš potřebovat dostat.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_03"); //Jestli budeš potřebovat jakékoliv zbraně, zajdi za Skipem. Najdeš ho v té velké dílně přímo vzadu, nalevo od hradního nádvoří.

	Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Diego má lepší ZBROJ pro Gomezovy Stíny. Je u hradní brány.");
	if	!Npc_KnowsInfo(hero, DIA_Skip_First)
	{
		B_LogEntry	(GE_TraderOC,"Strážce Skip prodává v zadní části nádvoří ZBRANĚ. Avšak jen Gomezovým mužům.");
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// *********************************************
// 				Spy Zwischenbericht
// *********************************************

INSTANCE DIA_Raven_SpyBericht (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpyBericht_Condition;
	information	= DIA_Raven_SpyBericht_Info;
	permanent	= 1;
	description	= "Chci ti podat hlášení.";
};

FUNC INT DIA_Raven_SpyBericht_Condition()
{
	if ( Raven_SpySect==LOG_RUNNING )
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpyBericht_Info()
{
	AI_Output (other, self,"DIA_Raven_SpyBericht_15_00"); //Chci podat hlášení.
	AI_Output (self, other,"DIA_Raven_SpyBericht_10_01"); //Dobře. Rád dostávám ty nejnovější informace.
	if (Npc_HasItems (other, itat_Crawlerqueen)>=1)
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output (other, self,"Org_826_Mordrag_RUNNING_15_04"); //Nadešlo velké vzývání.
			AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Dobrá práce.
			Raven_SpySect=LOG_SUCCESS;
			B_GiveXP (XP_ReportToRaven);
			Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
			B_LogEntry (CH1_GoToPsi,"Raven mě nakrmil lacinými řečičkami. Takovéhle způsoby jsem neočekával. Od teďka si půjdu svojí vlastní cestou.");
		}
		else
		{
			AI_Output (other, self,"DIA_Raven_SpyBericht_15_02"); //Chtějí vajíčka královny důlních červů. Vaří z nich lektvar, kterým jim umožní spojit se se Spáčem. Mám ta vajíčka sebou.
			if (CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_03"); //Zajímavé. Jsem zvědavý, jestli to bude fungovat. Dones ta vajíčka do chrámu.
			}
			else
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Dobrá práce.
				Raven_SpySect=LOG_SUCCESS;
				B_GiveXP (XP_ReportToRaven);
				Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
				B_LogEntry (CH1_GoToPsi,"Raven mě nakrmil lacinými řečičkami. Takovéhle způsoby jsem neočekával. Od teďka si půjdu svojí vlastní cestou.");
			};
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Raven_SpyBericht_15_05"); //Vlastně ve skutečnosti nevím, co plánují.
		AI_Output (self, other,"DIA_Raven_SpyBericht_10_06"); //Tak proč mě obtěžuješ?
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////


