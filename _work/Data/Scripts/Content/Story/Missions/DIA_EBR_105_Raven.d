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
	AI_Output (self, other,"DIA_Raven_FirstIn_10_00"); //Co pro tebe m��u ud�lat?
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
	AI_Output (self, other,"DIA_Raven_Who_10_01"); //Jsem Raven. Gomezova prav� ruka. Ka�d�, kdo chce nav�t�vit Gomeze, to mus� ��ci nejd��v MN�.
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
	description	= "M�m pro Gomeze trochu drogy z ba�in od Cora Kaloma.";
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
	AI_Output			(other, self,"DIA_Raven_Krautbote_15_00"); //M�m pro Gomeze trochu drogy z ba�in od Cora Kaloma.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_01"); //Tyhle v�ci domlouv� Bartholo. Gomez se s posl��ky nebav�.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_02"); //Najde� ho v m�stnosti hned vpravo za vchodem. Nebo v kuchyni ve velk� v�i.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_03"); //V noci samoz�ejm� sp�. B�t tebou, tak bych ho nevyru�oval.

	B_LogEntry			(CH1_KrautBote,"Dod�vka drogy pro Gomeze se mus� odevzdat u Barthola. Najdu ho v dom� Rudobaron�.");
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
	description	= "Chci vid�t Gomeze. Thorus ��k�, �e pat��m ke St�n�m.";
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
	AI_Output (other, self,"DIA_Raven_Aufnahme_15_00"); //Chci vid�t Gomeze. Thorus ��k�, �e pat��m ke St�n�m.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_01"); //V�dycky rozpozn�me poctiv� mu�e. Vypad�, �e takov� jse�. Jsi v pohod�.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_02"); //Zavedu t� ke Gomezovi. A na nic nesahej!
	
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
	AI_Output (self, other,"DIA_Raven_There_10_01"); //Gomez t� o�ek�v�. Jestli k n�mu se k n�mu nebude� chovat uctiv�, bude mi pot�en�m t� to nau�it, je ti to jasn�?
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
	AI_Output (self, other,"DIA_Raven_PERM_10_01"); //Ve Star�m dolu to jde dob�e. Posledn� dod�vka z�sob z vn�j��ho sv�ta byla obrovsk�.
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
	description	= "Gomez ��k�, �e jsem v po��dku.";
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
	
	AI_Output			(other, self,"DIA_Raven_BinDabei_15_00"); //Gomez ��k�, �e jsem v po��dku.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_01"); //V�born�! V tom p��pad� to m��e� dok�zat sv�m prvn�m �kolem.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_02"); //Kdy� ��k�, �e jsou tv� kontakty tak dobr�, nem�lo by to pro tebe b�t t�k�.

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
	description	= "Co m�m pro tebe ud�lat?";
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
	AI_Output (other, self,"DIA_Raven_SpySect_15_00"); //Co m�m pro tebe ud�lat?
	AI_Output (self, other,"DIA_Raven_SpySect_10_01"); //D�l�me hodn� obchod� s Bratrstvem. To ale neznamen�, �e jsme s nimi ve svazku.
	AI_Output (self, other,"DIA_Raven_SpySect_10_02"); //Jdi do mo��l�.
	AI_Output (self, other,"DIA_Raven_SpySect_10_03"); //A� doraz� do t�bora, m�j u�i nastra�en�. V�e, co se dozv�, se n�m m��e hodit.
	AI_Output (self, other,"DIA_Raven_SpySect_10_04"); //��m v�c toho zjist�, t�m l�p. M�l bys b�t opatrn�, jestli ch�pe�, co t�m mysl�m.
	AI_Output (other, self,"DIA_Raven_SpySect_15_05"); //Bu� v klidu, nem�m v �myslu je na�tvat.
	AI_Output (self, other,"DIA_Raven_SpySect_10_06"); //V�d�l jsem, �e mi bude� rozum�t.
	
	Raven_SpySect = LOG_RUNNING;
	
	Log_CreateTopic	(CH1_GoToPsi,	LOG_MISSION);
	Log_SetTopicStatus (CH1_GoToPsi,	LOG_RUNNING);
	B_LogEntry (CH1_GoToPsi,"Raven m� vyslal jako z�stupce Star�ho t�bora k Bratrstvu do ba�in. Mus�m se tam porozhl�dnout a m�t nastra�en� u�i. Mo�n� se mi tu poda�� z�skat n�jak� u�ite�n� informace pro Rudobarony.");
};

// *********************************************
// 				Ausr�stung
// *********************************************

INSTANCE DIA_Raven_Equipment (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Equipment_Condition;
	information	= DIA_Raven_Equipment_Info;
	permanent	= 0;
	description	= "Kde dostanu lep�� v�bavu?";
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
	AI_Output	(other, self,"DIA_Raven_Equipment_15_00"); //Kde dostanu lep�� v�bavu?
	AI_Output	(self, other,"DIA_Raven_Equipment_10_01"); //Jdi za Diegem, d� ti n�jakou v�zbroj. S n� nebude� tak rychle mrtv� a z�rove� ti poslou�� jako pr�kaz.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_02"); //Tvoje v�zbroj ti umo�n� p��stup do v�ech m�st, kam se bude� pot�ebovat dostat.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_03"); //Jestli bude� pot�ebovat jak�koliv zbran�, zajdi za Skipem. Najde� ho v t� velk� d�ln� p��mo vzadu, nalevo od hradn�ho n�dvo��.

	Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Diego m� lep�� ZBROJ pro Gomezovy St�ny. Je u hradn� br�ny.");
	if	!Npc_KnowsInfo(hero, DIA_Skip_First)
	{
		B_LogEntry	(GE_TraderOC,"Str�ce Skip prod�v� v zadn� ��sti n�dvo�� ZBRAN�. Av�ak jen Gomezov�m mu��m.");
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
	description	= "Chci ti podat hl�en�.";
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
	AI_Output (other, self,"DIA_Raven_SpyBericht_15_00"); //Chci podat hl�en�.
	AI_Output (self, other,"DIA_Raven_SpyBericht_10_01"); //Dob�e. R�d dost�v�m ty nejnov�j�� informace.
	if (Npc_HasItems (other, itat_Crawlerqueen)>=1)
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output (other, self,"Org_826_Mordrag_RUNNING_15_04"); //Nade�lo velk� vz�v�n�.
			AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Dobr� pr�ce.
			Raven_SpySect=LOG_SUCCESS;
			B_GiveXP (XP_ReportToRaven);
			Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
			B_LogEntry (CH1_GoToPsi,"Raven m� nakrmil lacin�mi �e�i�kami. Takov�hle zp�soby jsem neo�ek�val. Od te�ka si p�jdu svoj� vlastn� cestou.");
		}
		else
		{
			AI_Output (other, self,"DIA_Raven_SpyBericht_15_02"); //Cht�j� vaj��ka kr�lovny d�ln�ch �erv�. Va�� z nich lektvar, kter�m jim umo�n� spojit se se Sp��em. M�m ta vaj��ka sebou.
			if (CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_03"); //Zaj�mav�. Jsem zv�dav�, jestli to bude fungovat. Dones ta vaj��ka do chr�mu.
			}
			else
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //Dobr� pr�ce.
				Raven_SpySect=LOG_SUCCESS;
				B_GiveXP (XP_ReportToRaven);
				Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
				B_LogEntry (CH1_GoToPsi,"Raven m� nakrmil lacin�mi �e�i�kami. Takov�hle zp�soby jsem neo�ek�val. Od te�ka si p�jdu svoj� vlastn� cestou.");
			};
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Raven_SpyBericht_15_05"); //Vlastn� ve skute�nosti nev�m, co pl�nuj�.
		AI_Output (self, other,"DIA_Raven_SpyBericht_10_06"); //Tak pro� m� obt�uje�?
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////


