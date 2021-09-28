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
	AI_Output (self, other,"DIA_Raven_FirstIn_10_00"); //Co pro tebe mùžu udìlat?
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
	AI_Output (self, other,"DIA_Raven_Who_10_01"); //Jsem Raven. Gomezova pravá ruka. Každý, kdo chce navštívit Gomeze, to musí øíci nejdøív MNÌ.
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
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_01"); //Tyhle vìci domlouvá Bartholo. Gomez se s poslíèky nebaví.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_02"); //Najdeš ho v místnosti hned vpravo za vchodem. Nebo v kuchyni ve velké vìži.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_03"); //V noci samozøejmì spí. Být tebou, tak bych ho nevyrušoval.

	B_LogEntry			(CH1_KrautBote,"Dodávka drogy pro Gomeze se musí odevzdat u Barthola. Najdu ho v domì Rudobaronù.");
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
	description	= "Chci vidìt Gomeze. Thorus øíká, že patøím ke Stínùm.";
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
	AI_Output (other, self,"DIA_Raven_Aufnahme_15_00"); //Chci vidìt Gomeze. Thorus øíká, že patøím ke Stínùm.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_01"); //Vždycky rozpoznáme poctivé muže. Vypadáš, že takový jseš. Jsi v pohodì.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_02"); //Zavedu tì ke Gomezovi. A na nic nesahej!
	
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
	AI_Output (self, other,"DIA_Raven_There_10_01"); //Gomez tì oèekává. Jestli k nìmu se k nìmu nebudeš chovat uctivì, bude mi potìšením tì to nauèit, je ti to jasné?
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
	AI_Output (self, other,"DIA_Raven_PERM_10_01"); //Ve Starém dolu to jde dobøe. Poslední dodávka zásob z vnìjšího svìta byla obrovská.
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
	description	= "Gomez øíká, že jsem v poøádku.";
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
	
	AI_Output			(other, self,"DIA_Raven_BinDabei_15_00"); //Gomez øíká, že jsem v poøádku.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_01"); //Výbornì! V tom pøípadì to mùžeš dokázat svým prvním úkolem.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_02"); //Když øíkáš, že jsou tvé kontakty tak dobré, nemìlo by to pro tebe být tìžké.

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
	description	= "Co mám pro tebe udìlat?";
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
	AI_Output (other, self,"DIA_Raven_SpySect_15_00"); //Co mám pro tebe udìlat?
	AI_Output (self, other,"DIA_Raven_SpySect_10_01"); //Dìláme hodnì obchodù s Bratrstvem. To ale neznamená, že jsme s nimi ve svazku.
	AI_Output (self, other,"DIA_Raven_SpySect_10_02"); //Jdi do moèálù.
	AI_Output (self, other,"DIA_Raven_SpySect_10_03"); //Až dorazíš do tábora, mìj uši nastražené. Vše, co se dozvíš, se nám mùže hodit.
	AI_Output (self, other,"DIA_Raven_SpySect_10_04"); //Èím víc toho zjistíš, tím líp. Mìl bys být opatrný, jestli chápeš, co tím myslím.
	AI_Output (other, self,"DIA_Raven_SpySect_15_05"); //Buï v klidu, nemám v úmyslu je naštvat.
	AI_Output (self, other,"DIA_Raven_SpySect_10_06"); //Vìdìl jsem, že mi budeš rozumìt.
	
	Raven_SpySect = LOG_RUNNING;
	
	Log_CreateTopic	(CH1_GoToPsi,	LOG_MISSION);
	Log_SetTopicStatus (CH1_GoToPsi,	LOG_RUNNING);
	B_LogEntry (CH1_GoToPsi,"Raven mì vyslal jako zástupce Starého tábora k Bratrstvu do bažin. Musím se tam porozhlédnout a mít nastražené uši. Možná se mi tu podaøí získat nìjaké užiteèné informace pro Rudobarony.");
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
	AI_Output	(self, other,"DIA_Raven_Equipment_10_01"); //Jdi za Diegem, dá ti nìjakou výzbroj. S ní nebudeš tak rychle mrtvý a zároveò ti poslouží jako prùkaz.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_02"); //Tvoje výzbroj ti umožní pøístup do všech míst, kam se budeš potøebovat dostat.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_03"); //Jestli budeš potøebovat jakékoliv zbranì, zajdi za Skipem. Najdeš ho v té velké dílnì pøímo vzadu, nalevo od hradního nádvoøí.

	Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Diego má lepší ZBROJ pro Gomezovy Stíny. Je u hradní brány.");
	if	!Npc_KnowsInfo(hero, DIA_Skip_First)
	{
		B_LogEntry	(GE_TraderOC,"Strážce Skip prodává v zadní èásti nádvoøí ZBRANÌ. Avšak jen Gomezovým mužùm.");
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
	AI_Output (self, other,"DIA_Raven_SpyBericht_10_01"); //Dobøe. Rád dostávám ty nejnovìjší informace.
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
			B_LogEntry (CH1_GoToPsi,"Raven mì nakrmil lacinými øeèièkami. Takovéhle zpùsoby jsem neoèekával. Od teïka si pùjdu svojí vlastní cestou.");
		}
		else
		{
			AI_Output (other, self,"DIA_Raven_SpyBericht_15_02"); //Chtìjí vajíèka královny dùlních èervù. Vaøí z nich lektvar, kterým jim umožní spojit se se Spáèem. Mám ta vajíèka sebou.
			if (CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_03"); //Zajímavé. Jsem zvìdavý, jestli to bude fungovat. Dones ta vajíèka do chrámu.
			}
			else
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Dobrá práce.
				Raven_SpySect=LOG_SUCCESS;
				B_GiveXP (XP_ReportToRaven);
				Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
				B_LogEntry (CH1_GoToPsi,"Raven mì nakrmil lacinými øeèièkami. Takovéhle zpùsoby jsem neoèekával. Od teïka si pùjdu svojí vlastní cestou.");
			};
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Raven_SpyBericht_15_05"); //Vlastnì ve skuteènosti nevím, co plánují.
		AI_Output (self, other,"DIA_Raven_SpyBericht_10_06"); //Tak proè mì obtìžuješ?
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////


