//***********************************************
//					EXIT	
//***********************************************

instance  DIA_Torrez_Exit (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  999;
	condition	=  DIA_Torrez_Exit_Condition;
	information	=  DIA_Torrez_Exit_Info;
	permanent	=  1;
	description =  DIALOG_ENDE;
};                       

FUNC int  DIA_Torrez_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torrez_Exit_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneFirebolt))
	{
	CreateInvItem (self, ItArRuneFirebolt);
	};
};

//***********************************************
//					Hallo	
//***********************************************

instance  DIA_Torrez_Hello (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  1;
	condition	=  DIA_Torrez_Hello_Condition;
	information	=  DIA_Torrez_Hello_Info;
	permanent	=  0;
	description =  "Hled·m NejvyööÌho m·ga OhnivÈho kruhu.";
};                       

FUNC int  DIA_Torrez_Hello_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torrez_Hello_Info()
{
	AI_Output (other, self,"DIA_Torrez_Hello_15_00"); //Hled·m VelkÈho m·ga Kruhu ohnÏ!
	AI_Output (self, other,"DIA_Torrez_Hello_04_01"); //ÿekni Miltenovi! A teÔ uû jdi!
	
	AI_StopProcessInfos	( self );
};

//***********************************************
//					Belohnung WƒHLEN	
//***********************************************

instance  DIA_Torrez_Belohnung (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  5;
	condition	=  DIA_Torrez_Belohnung_Condition;
	information	=  DIA_Torrez_Belohnung_Info;
	permanent	=  0;
	description =  "Dopis jsem p¯edal a teÔ si chci vybrat svoji odmÏnu.";
};                       

FUNC int  DIA_Torrez_Belohnung_Condition()
{
	if ( (Npc_KnowsInfo(hero,DIA_Milten_ComesBack)) && (milten_HasLetter==TRUE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Torrez_Belohnung_Info()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_15_00"); //Poslal mÏ Corristo. P¯edal jsem mu zpr·vu a teÔ jsem tu, abych si vybral odmÏnu.
	AI_Output (self, other,"DIA_Torrez_Belohnung_04_01"); //UdÏlal jsi pro n·s velkou sluûbu a dostaneö za to odmÏnu. VybÌrej pozornÏ.
	
	Info_ClearChoices	(DIA_Torrez_Belohnung);
	Info_AddChoice		(DIA_Torrez_Belohnung,"Esence ducha (maximum many +5)",DIA_Torrez_Belohnung_ManaMax);
	Info_AddChoice		(DIA_Torrez_Belohnung,"3 kouzelnÈ svitky (ohniv· koule, blesk, promÏna v mrchoûrouta)",DIA_Torrez_Belohnung_Scrolls);
	Info_AddChoice		(DIA_Torrez_Belohnung,"Prsten obratnosti (+5)",DIA_Torrez_Belohnung_Dex);
	Info_AddChoice		(DIA_Torrez_Belohnung,"Prsten sÌly (+5)",DIA_Torrez_Belohnung_Str);
};

func void DIA_Torrez_Belohnung_Str()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_Str_15_00"); //Vezmu si Prsten sÌly.
	AI_Output (self, other,"DIA_Torrez_Belohnung_Str_04_01"); //Zkuöen· volba. Tady je ten prsten.
	CreateInvItem(self, Staerkering);
	B_GiveInvItems (self, hero, Staerkering, 1);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Dex()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_Dex_15_00"); //Vezmu si tenhle Prsten zruËnosti.
	AI_Output (self, other,"DIA_Torrez_Belohnung_Dex_04_01"); //ZruËnost vÌtÏzÌ nad silou. DobrÈ rozhodnutÌ.
	CreateInvItem(self, Ring_des_Geschicks);
	B_GiveInvItems (self, hero, Ring_des_Geschicks, 1);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_Scrolls()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_Scrolls_15_00"); //Dej mi kouzeln˝ svitek.
	AI_Output (self, other,"DIA_Torrez_Belohnung_Scrolls_04_01"); //Pouûij ho moud¯e. Kaûd˝ m˘ûeö pouûÌt jen jednou!
	CreateInvItems(self, ItArScrollFireball, 3);
	B_GiveInvItems (self, hero, ItArScrollFireball, 3);//Wegen Bildschirmausgabe, wird direkt angepasst
	Npc_RemoveInvItems(other, ItArScrollFireball, 2);
	CreateInvItem(other, ItArScrollTrfScavenger);
	CreateInvItem(other, ItArScrollChainLightning);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

func void DIA_Torrez_Belohnung_ManaMax()
{
	AI_Output (other, self,"DIA_Torrez_Belohnung_ManaMax_15_00"); //ChtÏl bych mÌt ten lektvar!
	AI_Output (self, other,"DIA_Torrez_Belohnung_ManaMax_04_01"); //Moudr· volba! Vybral sis nejlepöÌ z dar˘. Kdyû se toho lektvaru napijeö, tvoje sÌla se umocnÌ!
	CreateInvItem(self, ItFo_Potion_Mana_Perma_01);
	B_GiveInvItems (self, hero, ItFo_Potion_Mana_Perma_01, 1);
	Info_ClearChoices	(DIA_Torrez_Belohnung);
};

//***********************************************
//					Brief TAUSCH
//***********************************************

instance  DIA_Torrez_BriefTausch (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  5;
	condition	=  DIA_Torrez_BriefTausch_Condition;
	information	=  DIA_Torrez_BriefTausch_Info;
	permanent	=  0;
	description =  "M·m pro tebe dopis! Nejd¯Ìv chci ale odmÏnu!";
};                       

FUNC int  DIA_Torrez_BriefTausch_Condition()
{
	if ( (Npc_KnowsInfo(hero,DIA_Milten_ComesBack)) && (milten_HasLetter==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Torrez_BriefTausch_Info()
{
	AI_Output (other, self,"DIA_Torrez_BriefTausch_15_00"); //M·m pro tebe dopis! Nejd¯Ìv chci ale odmÏnu!
	AI_Output (self, other,"DIA_Torrez_BriefTausch_04_01"); //ProË si ne¯ekneö Miltenovi?
	AI_Output (other, self,"DIA_Torrez_BriefTausch_15_02"); //Uû jsem to udÏlal.
	AI_Output (self, other,"DIA_Torrez_BriefTausch_04_03"); //RozumÌm. Tvou odmÏnu m·m tady - ukaû mi ten dopis. TeÔ!
	AI_Output (other, self,"DIA_Torrez_BriefTausch_15_04"); //Tady je.
		
	if (Npc_HasItems(other,ItWr_Fire_Letter_01)>=1) 
	{
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_05"); //Tvoje odmÏna je Prsten sÌly. Je to vz·cn˝ artefakt a bude pro tebe velice uûiteËn˝.
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_06"); //A teÔ uû jdi!
		B_GiveInvItems(other, self, ItWr_Fire_Letter_01, 1);
		Npc_RemoveInvItems(self, ItWr_Fire_Letter_01, 1);
		CreateInvItems(self, Staerkering, 1);
		B_GiveInvItems(self,other, Staerkering, 1);
		B_GiveXP(XP_XardasLetter);
	}
	else if (Npc_HasItems(other,ItWr_Fire_Letter_02)>=1) 
	{
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_07"); //PeËeù je zlomen·.
		AI_Output (other, self,"DIA_Torrez_BriefTausch_15_08"); //Stala se nehoda.
		AI_Output (self, other,"DIA_Torrez_BriefTausch_04_09"); //Tvoje odmÏna je lÈËiv˝ lektvar. BuÔ r·d, ûe ho dostaneö. Kur˝¯i, kte¯Ì donesou dopis bez peËeti, obvykle nedostanou nic!
		B_GiveInvItems(other, self, ItWr_Fire_Letter_02, 1);
		Npc_RemoveInvItems(self, ItWr_Fire_Letter_02, 1);
		CreateInvItems(self, ItFo_Potion_Health_03, 1);
		B_GiveInvItems(self, other, ItFo_Potion_Health_03, 1);
		B_GiveXP(XP_XardasLetterOPEN);
	};
	var C_NPC corristo; corristo = Hlp_GetNpc(KdF_402_Corristo);
	
	CreateInvItems(corristo, ItWr_Fire_Letter_02, 1);
	
	AI_StopProcessInfos	( self );
};

//***********************************************
//					PERM
//***********************************************

instance  DIA_Torrez_PERM (C_INFO)
{
	npc			=  KDF_405_Torrez;
	nr			=  1;
	condition	=  DIA_Torrez_PERM_Condition;
	information	=  DIA_Torrez_PERM_Info;
	permanent	=  1;
	description =  "Co je v magick˝ch umÏnÌch nebezpeËnÈ?";
};                       

FUNC int  DIA_Torrez_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Torrez_PERM_Info()
{
	AI_Output (other, self,"DIA_Torrez_PERM_15_00"); //Co je v magick˝ch umÏnÌch nebezpeËnÈ?
	AI_Output (self, other,"DIA_Torrez_PERM_04_01"); //To nenÌ tvoje vÏc!
	AI_StopProcessInfos	( self );
};










///////////////////////////////////////////
///////////////////////////////////////////
/////////////   Kapitel 3   ///////////////
///////////////////////////////////////////
///////////////////////////////////////////

//---------------------------------------------------------
//					WƒHREND DER AUFNAHME	
//---------------------------------------------------------
instance KDF_405_Torrez_BOOK (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_BOOK_Condition;
	information		= KDF_405_Torrez_BOOK_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  KDF_405_Torrez_BOOK_Condition()
{	
	if    (Npc_KnowsInfo (hero,KDF_402_Corristo_ROBE))
	&&    (Npc_KnowsInfo (hero,KDF_403_Drago_RUNE))
	{
		return TRUE;
	};
};
func void  KDF_405_Torrez_BOOK_Info()
{
	
	AI_Output (self, other,"KDF_405_Torrez_BOOK_Info_04_01"); //Pro kaûd˝ Kruh existuje jedna kniha, kter· vysvÏtluje jeho kouzla. P¯eËti si ty knihy. VÏdomosti jsou sÌla!
	AI_Output (self, other,"KDF_405_Torrez_BOOK_Info_04_02"); //Vezmi si knihu PrvnÌho kruhu a nauË se rozumÏt Ohni.
	CreateInvItem (self,ItWr_Book_Circle_01);
	B_GiveInvItems(self,hero,ItWr_Book_Circle_01, 1);
	AI_StopProcessInfos	( self );
};
//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  KDF_405_Torrez_SELLBOOKS (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_SELLBOOKS_Condition;
	information		= KDF_405_Torrez_SELLBOOKS_Info;
	important		= 0;
	permanent		= 1;
	description		= "R·d bych zÌskal magickÈ spisy."; 
	trade 			= 1;
};

FUNC int  KDF_405_Torrez_SELLBOOKS_Condition()
	{	
		if (Npc_KnowsInfo (hero,KDF_405_Torrez_GREET))
		{
			return TRUE;
		};
	
	};
FUNC void  KDF_405_Torrez_SELLBOOKS_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_SELLBOOKS_Info_15_01"); //R·d bych zÌskal magickÈ spisy.
};  
/*------------------------------------------------------------------------
						BEGR‹SSUNG						
------------------------------------------------------------------------*/

instance  KDF_405_Torrez_GREET (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_GREET_Condition;
	information		= KDF_405_Torrez_GREET_Info;
	important		= 0;
	permanent		= 0;
	description		= "BuÔ zdr·v, m·gu."; 
};

FUNC int  KDF_405_Torrez_GREET_Condition()
	{
		return TRUE;
	};


FUNC void  KDF_405_Torrez_GREET_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_GREET_Info_15_01"); //BuÔ zdr·v, m·gu.
	AI_Output (self, other,"KDF_405_Torrez_GREET_Info_04_02"); //KÈû nad tebou bdÌ Innos! Obchoduji s magick˝mi vÏdomostmi a m˘ûu ti uk·zat, jak zvÏtöÌö svÈ kouzelnÈ sÌly!
	
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Torrez prod·v· KOUZELN… SVITKY a RUNY. P¯es den b˝v· na n·dvo¯Ì.");

	Log_CreateTopic (GE_TeacherOC,LOG_NOTE);
	B_LogEntry		(GE_TeacherOC,"Torres mi m˘ûe uk·zat, jak zv˝öit svoji MAGICKOU ENERGII. P¯es den b˝v· na n·dvo¯Ì.");
};
// 
instance  KDF_405_Torrez_MANA (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_MANA_Condition;
	information		= KDF_405_Torrez_MANA_Info;
	important		= 0;
	permanent		= 1;
	description		= "Pot¯ebuji vÌce magickÈ moci."; 
};

FUNC int  KDF_405_Torrez_MANA_Condition()
{	
	if (Npc_KnowsInfo (hero,KDF_405_Torrez_GREET))
	{
		return TRUE;
	};

};
FUNC void  KDF_405_Torrez_MANA_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_MANA_Info_15_01"); //Po¯ebuju vÌc kouzelnÈ sÌly.
	AI_Output (self, other,"KDF_405_Torrez_MANA_Info_04_02"); //M˘ûu ti pomoci zvÏtöit tvoji sÌlu. Jak ji pouûijeö, je uû tvoje vÏc.
	
	Info_ClearChoices	(KDF_405_Torrez_MANA);
	Info_AddChoice		(KDF_405_Torrez_MANA,DIALOG_BACK							,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zv˝öenÌ many o 5 (cena 5 dovednostnÌch bod˘)",KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zv˝öenÌ many o 1 (cena 1 dovednostnÌ bod)",KDF_405_Torrez_MANA_MAN_1);
};  
func void KDF_405_Torrez_MANA_BACK()
{
	Info_ClearChoices	(KDF_405_Torrez_MANA);
};

func void KDF_405_Torrez_MANA_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 1);
	Info_ClearChoices	(KDF_405_Torrez_MANA);
	Info_AddChoice		(KDF_405_Torrez_MANA,DIALOG_BACK								,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zv˝öenÌ many o 5 (cena 5 dovednostnÌch bod˘)",KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zv˝öenÌ many o 1 (cena 1 dovednostnÌ bod)",KDF_405_Torrez_MANA_MAN_1);

};

func void KDF_405_Torrez_MANA_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5);
	Info_ClearChoices	(KDF_405_Torrez_MANA);
	Info_AddChoice		(KDF_405_Torrez_MANA,DIALOG_BACK								,KDF_405_Torrez_MANA_BACK);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zv˝öenÌ many o 5 (cena 5 dovednostnÌch bod˘)",KDF_405_Torrez_MANA_MAN_5);
	Info_AddChoice		(KDF_405_Torrez_MANA,"Zv˝öenÌ many o 1 (cena 1 dovednostnÌ bod)",KDF_405_Torrez_MANA_MAN_1);

};
/*------------------------------------------------------------------------
							Magier Werden?									
------------------------------------------------------------------------*/

instance  KDF_405_Torrez_WANNABEMAGE (C_INFO)
{
	npc				= KDF_405_Torrez;
	condition		= KDF_405_Torrez_WANNABEMAGE_Condition;
	information		= KDF_405_Torrez_WANNABEMAGE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co musÌm udÏlat, abych se stal m·gem?"; 
};

FUNC int  KDF_405_Torrez_WANNABEMAGE_Condition()
{	
	if (Npc_KnowsInfo (hero, KDF_405_Torrez_GREET))
	&& (Npc_GetTrueGuild (hero) != GIL_KDF)
	&& (!Npc_KnowsInfo (hero, KDF_402_Corristo_WANNBEKDF))
	{
		return TRUE;
	};

};
FUNC void  KDF_405_Torrez_WANNABEMAGE_Info()
{
	AI_Output (other, self,"KDF_405_Torrez_WANNABEMAGE_Info_15_01"); //Co musÌm udÏlat, abych se stal m·gem?
	AI_Output (self, other,"KDF_405_Torrez_WANNABEMAGE_Info_04_02"); //ÿekni mistrovi Corristovi, pokud na tebe bude mÌt Ëas.
};  
