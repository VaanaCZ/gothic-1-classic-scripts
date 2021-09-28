/*
-------------------------------- Die Mission ----------------------------

Die Freemine Mission. 
Der SC metzelt sich durch die FM und findet dort einen Orc, welcher schwer
verletzt ist und einen Orcischen Heiltrank braucht. 
Alls Gegenleistung für den Heiltrank sagt er dir was man alles für Items
für das Ulu-Mulu braucht.
Wenn man ihm die drei Teile bringt bastelt er dir das Ulumulu.

--------------------------------- Die Items -----------------------------
OrcHeiltrank:			Orcmedicine			-> OrcGegengift	
	
Teil vom Ulu-Mulu (1)	ItAt_Waran_01		-> 	Flammenzunge
Teil vom Ulu-Mulu (2)	ItAt_Shadow_02		->	Horn eines Shadowbeast
Teil vom Ulu-Mulu (3)	ItAt_Swampshark_02	->	Zähne des Sumpfhais
Teil vom Ulu-Mulu (4)   ItAt_Troll_02		->	Hauer eines Trolls

Ulu-Mulu				Ulumulu				-> Das Ulumulu

----------------------------------- ToDo ---------------------------------
-> Monsterhinweise müssen noch rein
-> Missionlogs basteln
-> Sprache überarbeiten
*/


//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance Info_FreemineOrc_EXIT (C_INFO)
{
	npc			= FreemineOrc;
	nr			= 999;
	condition	= Info_FreemineOrc_EXIT_Condition;
	information	= Info_FreemineOrc_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
	
};                       

FUNC int Info_FreemineOrc_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_FreemineOrc_EXIT_Info()
{
	if (!Npc_KnowsInfo(hero,Info_FreemineOrc_EveryUlumulu))	
	{
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_01"); //Muszê ju¿ iœæ!
		AI_Output			(self, hero,"Info_FreemineOrc_EXIT_17_02"); //Obcy wróciæ znowu!
	}                                                              
	else                                                           
	{
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_03"); //Dziêkujê. Muszê ju¿ ruszaæ w dalsz¹ drogê.
		AI_Output			(self, hero,"Info_FreemineOrc_EXIT_17_04"); //Obcy mieæ dobra podró¿!
	};
	AI_StopProcessInfos	( self );
};

//---------------------------------------------------------------------
//	Info INTRO
//---------------------------------------------------------------------
instance Info_FreemineOrc_INTRO (C_INFO)
{
	npc				= FreemineOrc;
	condition		= Info_FreemineOrc_INTRO_Condition;
	information		= Info_FreemineOrc_INTRO_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_FreemineOrc_INTRO_Condition()
{
	return TRUE;
};

func void Info_FreemineOrc_INTRO_Info()
{
	AI_Output			(self, hero,"Info_FreemineOrc_INTRO_17_01"); //Tarrok chcieæ pomocy! Tarrok ranny!
};

//---------------------------------------------------------------------
//	Info WASPASSIERT
//---------------------------------------------------------------------
instance Info_FreemineOrc_WASPASSIERT (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_WASPASSIERT_Condition;
	information	= Info_FreemineOrc_WASPASSIERT_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co siê tu sta³o?";
};                       

FUNC int Info_FreemineOrc_WASPASSIERT_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_WASPASSIERT_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_WASPASSIERT_15_01"); //Co siê tu sta³o?
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_02"); //Tarrok tu z³apany przez niebieski ¿o³nierze. Nagle czerwony ¿o³nierze wszêdzie.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_03"); //Czerwony ¿o³nierze zabijaæ... wszystko.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_04"); //Tarrok uciec tu. Czerwony ¿o³nierze nie tu. Oni boj¹ GACH LUG.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_05"); //Ty pomóc, Tarrok boli.
};

//---------------------------------------------------------------------
//	Info WASTUN
//---------------------------------------------------------------------
instance Info_FreemineOrc_WASTUN (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_WASTUN_Condition;
	information	= Info_FreemineOrc_WASTUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co mogê dla ciebie zrobiæ?";
};                       

FUNC int Info_FreemineOrc_WASTUN_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT))
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_WASTUN_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_WASTUN_15_01"); //Co mogê dla ciebie zrobiæ?
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_02"); //Tarrok chcieæ mocny lek, albo Tarrok umrzeæ.
	AI_Output			(hero, self,"Info_FreemineOrc_WASTUN_15_03"); //O jakim lekarstwie mówisz?
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_04"); //GACH LUG otruæ Tarrok. Tarrok chcieæ lek!
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_05"); //G³upi, g³upi Tarrok. Zgubiæ lek! Nie znaleŸæ!
};

//---------------------------------------------------------------------
//	Info OFFER
//---------------------------------------------------------------------
instance Info_FreemineOrc_OFFER (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_OFFER_Condition;
	information	= Info_FreemineOrc_OFFER_Info;
	important	= 0;	
	permanent	= 0;
	description = "Odzyskam twoje lekarstwo!";
};                       

FUNC int Info_FreemineOrc_OFFER_Condition()
{
	if	Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION)
	&&	!Npc_HasItems (hero,Orcmedicine) 
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_OFFER_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_OFFER_15_01"); //Odzyskam twoje lekarstwo!
	AI_Output			(self, hero,"Info_FreemineOrc_OFFER_17_02"); //Tarrok s³aby. Obcy wróciæ szybko, albo Tarrok umrzeæ!
	AI_StopProcessInfos	(self);

	B_Story_FoundOrcSlave();
};

//---------------------------------------------------------------------
//	Info CRAWLER
//---------------------------------------------------------------------
instance Info_FreemineOrc_CRAWLER (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_CRAWLER_Condition;
	information	= Info_FreemineOrc_CRAWLER_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co to jest GACH LUG?";
};                       

FUNC int Info_FreemineOrc_CRAWLER_Condition()
{
	if	Npc_KnowsInfo(hero,Info_FreemineOrc_WASPASSIERT)
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_CRAWLER_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_CRAWLER_15_01"); //Co to jest GACH LUG?
	AI_Output			(self, hero,"Info_FreemineOrc_CRAWLER_17_02"); //Du¿y zwierz, du¿o nóg ma.
	AI_Output			(self, hero,"Info_FreemineOrc_CRAWLER_17_03"); //GACH LUG groŸny! Zjadaæ Ork - zjadaæ cz³owiek!
	AI_Output			(hero, self,"Info_FreemineOrc_CRAWLER_15_04"); //Ach, masz na myœli pe³zacze!
};

//---------------------------------------------------------------------
//	Info TONGUE
//---------------------------------------------------------------------
instance Info_FreemineOrc_TONGUE (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_TONGUE_Condition;
	information	= Info_FreemineOrc_TONGUE_Info;
	important	= 0;	
	permanent	= 0;
	description = "Potrafisz porozumiewaæ siê w naszym jêzyku?";
};                       

FUNC int Info_FreemineOrc_TONGUE_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_INTRO))
	{	
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_TONGUE_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_TONGUE_15_01"); //Potrafisz porozumiewaæ siê w naszym jêzyku?
	AI_Output			(self, hero,"Info_FreemineOrc_TONGUE_17_02"); //Tarrok u ludzi d³ugi czas. Tarrok dobrze s³uchaæ.
};

//---------------------------------------------------------------------
//	Info SEARCHPOTION - Medizin noch nicht gefunden
//---------------------------------------------------------------------
instance Info_FreemineOrc_SEARCHPOTION (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SEARCHPOTION_Condition;
	information	= Info_FreemineOrc_SEARCHPOTION_Info;
	important	= 0;	
	permanent	= 1;
	description	= "Nie mogê znaleŸæ twojego lekarstwa!";
};                       

FUNC int Info_FreemineOrc_SEARCHPOTION_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER)	
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION)
	&&	!Npc_HasItems (hero,Orcmedicine) 
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SearchPotion_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SEARCHPOTION_15_01"); //Nie mogê znaleŸæ twojego lekarstwa!
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_02"); //Obcy szukaæ wiêcej! Lek gdzieœ tu!
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_03"); //Tarrok uciekaæ od GACH LUG! Tarrok chowaæ siê i uciekaæ!
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_04"); //Obcy przeszukaæ nisze te¿!
	 
	AI_StopProcessInfos	( self );
};
  
//---------------------------------------------------------------------
//	Info SUCHEULUMULU
//---------------------------------------------------------------------
instance Info_FreemineOrc_SUCHEULUMULU (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SUCHEULUMULU_Condition;
	information	= Info_FreemineOrc_SUCHEULUMULU_Info;
	important	= 0;	
	permanent	= 0;
	description = "Jesteœ przyjacielem Ur-Shaka, tego szamana?";
};                       

FUNC int Info_FreemineOrc_SUCHEULUMULU_Condition()
{
	if	Npc_KnowsInfo(hero, Info_FreemineOrc_INTRO)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SUCHEULUMULU_Info()
{
	AI_Output		(hero, self,"Info_FreemineOrc_SUCHEULUMULU_15_01"); //Jesteœ przyjacielem Ur-Shaka, tego szamana?
	AI_Output		(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_02"); //Ur-Shak niewolnik, jak Tarrok. Ur-Shak uciec! Dawno, dawno temu!
	AI_Output		(hero, self,"Info_FreemineOrc_SUCHEULUMULU_15_03"); //Twój przyjaciel powiedzia³ mi, ¿e móg³byœ dla mnie zrobiæ Ulu-Mulu.
	if (FreemineOrc_SuchePotion == LOG_SUCCESS)
	{
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_04"); //Ty pomóc mi, ja pomóc ty!
	}
	else
	{
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_05"); //Tarrok bardzo s³aby. Nie ma lek, Tarrok umieraæ.
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_06"); //Obcy przynieœæ lek, wtedy Tarrok pomóc!
	};
};

//---------------------------------------------------------------------
//	Info GIVEPOTION
//---------------------------------------------------------------------
instance Info_FreemineOrc_GIVEPOTION (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_GIVEPOTION_Condition;
	information	= Info_FreemineOrc_GIVEPOTION_Info;
	important	= 0;	
	permanent	= 0;
	description = "Proszê, znalaz³em twoje lekarstwo!";
};                       

FUNC int Info_FreemineOrc_GIVEPOTION_Condition()
{
	if	Npc_KnowsInfo(hero,Info_FreemineOrc_WASTUN)	
	&&  Npc_HasItems(hero,Orcmedicine)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_GIVEPOTION_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_GIVEPOTION_15_01"); //Proszê, znalaz³em twoje lekarstwo!

	B_GiveInvItems      (hero, self, Orcmedicine, 1); 	
	EquipItem			(self, Orcmedicine);
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		AI_TurnToNpc	(self, hero);
	};
	AI_UseItemToState	(self, Orcmedicine, 1);
	AI_UseItemToState	(self, Orcmedicine, -1);

	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_02"); //Obcy nie jak inny ludzie! Obcy dobry!
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_03"); //Tarrok dziêkowaæ!
	AI_Output			(hero, self,"Info_FreemineOrc_GIVEPOTION_15_04"); //Mo¿esz ju¿ zrobiæ dla mnie Ulu-Mulu?
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_05"); //Obcy pomóc Tarrok, teraz Tarrok pomóc Obcy!
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_06"); //Obcy potrzebowaæ KROTAHK, KHAZ-TAK, DWACHKARR i ORTH-ANTAK.
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_07"); //Obcy przynieœæ, Tarrok zrobiæ Ulu-Mulu!
	
	if	!Npc_KnowsInfo(hero,Info_FreemineOrc_OFFER)
	{
		B_Story_FoundOrcSlave();
	};

	B_Story_CuredOrc	();
};


//---------------------------------------------------------------------
//	Info FIREWARAN
//---------------------------------------------------------------------
instance Info_FreemineOrc_FIREWARAN (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_FIREWARAN_Condition;
	information	= Info_FreemineOrc_FIREWARAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co to jest KROTAHK?";
};                       

FUNC int Info_FreemineOrc_FIREWARAN_Condition()
{
	if	(Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_FIREWARAN_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_FIREWARAN_15_01"); //Co to jest KROTAHK?
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN_17_02"); //Byæ jêzyk ognia. Jêzyk smoka!
	
};

//---------------------------------------------------------------------
//	Info FIREWARAN2
//---------------------------------------------------------------------
instance Info_FreemineOrc_FIREWARAN2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_FIREWARAN2_Condition;
	information	= Info_FreemineOrc_FIREWARAN2_Info;
	important	= 0;	
	permanent	= 0;
	description = "Gdzie mogê znaleŸæ smoka?";
};                       

FUNC int Info_FreemineOrc_FIREWARAN2_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN)
	&&	!Npc_HasItems (hero,ItAt_Waran_01)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_FIREWARAN2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_FIREWARAN2_15_01"); //Gdzie mogê znaleŸæ takiego smoka?
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN2_17_02"); //Smok mieszka w domu Tarroka. Obcy musi szukaæ!
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN2_17_03"); //Smok mieszka te¿ na piasku, przy morzu.

	B_LogEntry			(CH4_UluMulu,"Aby sporz¹dziæ Ulu-Mulu, Tarrok potrzebuje smoczego jêzyka. Smoki ¿yj¹ w krainie orków i na piaszczystych pla¿ach. Parê z nich krêci³o siê chyba w pobli¿u wraku okrêtu?");
};

//---------------------------------------------------------------------
//	Info SHADOWBEAST
//---------------------------------------------------------------------
instance Info_FreemineOrc_SHADOWBEAST (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SHADOWBEAST_Condition;
	information	= Info_FreemineOrc_SHADOWBEAST_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co to jest KHAZ-TAK?";
};                       

FUNC int Info_FreemineOrc_SHADOWBEAST_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SHADOWBEAST_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SHADOWBEAST_Info_15_01"); //Co to jest KHAZ-TAK?
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02"); //Byæ róg cieniostwór. Róg ostry jak nó¿, twardy jak kamieñ.
	
};

//---------------------------------------------------------------------
//	Info SHADOWBEAST2
//---------------------------------------------------------------------
instance Info_FreemineOrc_SHADOWBEAST2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SHADOWBEAST2_Condition;
	information	= Info_FreemineOrc_SHADOWBEAST2_Info;
	important	= 0;	
	permanent	= 0;
	description = "Gdzie mogê znaleŸæ tego cieniostwora?";
};                       

FUNC int Info_FreemineOrc_SHADOWBEAST2_Condition()
{
	if 	 Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST)
	&&	!Npc_HasItems (hero,ItAt_Shadow_02)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SHADOWBEAST2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01"); //Gdzie mogê znaleŸæ tego cieniostwora?
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02"); //On w lesie albo w jaskini. Nie lubi s³oñce.
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03"); //Bardzo z³y. Obcy uwa¿aæ!

	B_LogEntry			(CH4_UluMulu,"Aby sporz¹dziæ Ulu-Mulu, Tarrok potrzebuje rogu cieniostwora. Istoty te zamieszkuj¹ mroczne lasy i jaskinie. O ile pamiêtam, najwiêkszy obszar leœny w kolonii rozci¹ga siê pomiêdzy Starym Obozem a bagnem.");
};

//---------------------------------------------------------------------
//	Info SWAMPSHARK
//---------------------------------------------------------------------
instance Info_FreemineOrc_SWAMPSHARK (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SWAMPSHARK_Condition;
	information	= Info_FreemineOrc_SWAMPSHARK_Info;
	important	= 0;	
	permanent	= 0;
	description = "DWACHKARR? A có¿ to takiego?";
};                       

FUNC int Info_FreemineOrc_SWAMPSHARK_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SWAMPSHARK_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SWAMPSHARK_15_01"); //DWACHKARR? A có¿ to takiego?
	AI_Output			(self, hero,"Info_FreemineOrc_SWAMPSHARK_17_02"); //Z¹b b³otnego wê¿a. Jak w¹¿ ugryŸæ, nikt nie móc uciec.
	
};

//---------------------------------------------------------------------
//	Info SWAMPSHARK2
//---------------------------------------------------------------------
instance Info_FreemineOrc_SWAMPSHARK2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_SWAMPSHARK2_Condition;
	information	= Info_FreemineOrc_SWAMPSHARK2_Info;
	important	= 0;	
	permanent	= 0;
	description = "Gdzie mogê znaleŸæ te b³otne wê¿e?";
};                       

FUNC int Info_FreemineOrc_SWAMPSHARK2_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK)
	&&	!Npc_HasItems (hero,ItAt_Swampshark_02)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_SWAMPSHARK2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_SWAMPSHARK2_15_01"); //Gdzie mogê znaleŸæ te b³otne wê¿e?
	AI_Output			(self, hero,"Info_FreemineOrc_SWAMPSHARK2_17_02"); //Du¿o w¹¿ b³otny w obóz ludzi. Obóz na bagnie to jest!

	B_LogEntry			(CH4_UluMulu,"Aby sporz¹dziæ Ulu-Mulu, Tarrok potrzebuje zêbów b³otnego wê¿a. Bagna w pobli¿u obozu Bractwa a¿ roj¹ siê od tych stworzeñ."); 
};

//---------------------------------------------------------------------
//	Info TROLL
//---------------------------------------------------------------------
instance Info_FreemineOrc_TROLL (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_TROLL_Condition;
	information	= Info_FreemineOrc_TROLL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co to jest ORTH-ANTAK?";
};                       

FUNC int Info_FreemineOrc_TROLL_Condition()
{
	if (Npc_KnowsInfo(hero,Info_FreemineOrc_GIVEPOTION))
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_TROLL_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_TROLL_15_01"); //Co to jest ORTH-ANTAK?
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL_17_02"); //Byæ z¹b wielki Troll! Robiæ du¿a dziura w ofiara!
};

//---------------------------------------------------------------------
//	Info TROLL2
//---------------------------------------------------------------------
instance Info_FreemineOrc_TROLL2 (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_TROLL2_Condition;
	information	= Info_FreemineOrc_TROLL2_Info;
	important	= 0;	
	permanent	= 0;
	description = "Gdzie mogê znaleŸæ Trolle?";
};                       

FUNC int Info_FreemineOrc_TROLL2_Condition()
{
	if	 Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL)
	&&	!Npc_HasItems (hero,ItAt_Troll_02)
	&&	!Npc_KnowsInfo(hero,Info_FreemineOrc_EVERYULUMULU)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_TROLL2_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_TROLL2_15_01"); //Gdzie mogê znaleŸæ Trolle?
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_02"); //Troll siedzieæ w góry. Troll lubi du¿o miejsca!
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_03"); //Obcy szukaæ w górach na pó³noc. Ale uwa¿aæ na Trolla ³apy!
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_04"); //Troll waln¹æ - Obcy spaœæ w dó³!

	B_LogEntry			(CH4_UluMulu,"Aby sporz¹dziæ Ulu-Mulu, Tarrok potrzebuje k³ów trolla. Te potê¿ne stworzy zamieszkuj¹ górzyste tereny w pó³nocnej czêœci kolonii.");
};

//---------------------------------------------------------------------
//	Info LOOKINGULUMULU
//---------------------------------------------------------------------
instance Info_FreemineOrc_LOOKINGULUMULU (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_LOOKINGULUMULU_Condition;
	information	= Info_FreemineOrc_LOOKINGULUMULU_Info;
	important	= 0;	
	permanent	= 1;
	description = "Nie mam jeszcze wszystkich czterech przedmiotów.";
};                       

FUNC int Info_FreemineOrc_LOOKINGULUMULU_Condition()
{
	if	!Npc_HasItems(hero,ItAt_Waran_01)
	&&	Npc_HasItems (hero,ItAt_Shadow_02)
	&&	Npc_HasItems (hero,ItAt_Swampshark_02)
	&&	Npc_HasItems (hero,ItAt_Troll_02)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_FIREWARAN2)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_SHADOWBEAST2)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_SWAMPSHARK2)
	&&	Npc_KnowsInfo(hero,Info_FreemineOrc_TROLL2)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_LOOKINGULUMULU_Info()
{
	AI_Output 			(hero, self,"Info_FreemineOrc_LOOKINGULUMULU_15_01"); //Nie mam jeszcze wszystkich czterech przedmiotów.
	AI_Output 			(self, hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02"); //Obcy szukaæ dalej! Tarrok tu czekaæ!

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info EVERYULUMULU
//---------------------------------------------------------------------
instance Info_FreemineOrc_EVERYULUMULU (C_INFO)
{
	npc			= Freemineorc;
	condition	= Info_FreemineOrc_EVERYULUMULU_Condition;
	information	= Info_FreemineOrc_EVERYULUMULU_Info;
	important	= 0;	
	permanent	= 0;
	description = "Mam ju¿ przedmioty potrzebne do sporz¹dzenia Ulu-Mulu!";
};                       

FUNC int Info_FreemineOrc_EVERYULUMULU_Condition()
{
	if	(FreemineOrc_LookingUlumulu == LOG_RUNNING)
	&&	 Npc_HasItems(hero,ItAt_Waran_01		)
	&&	 Npc_HasItems(hero,ItAt_Shadow_02		)
	&&	 Npc_HasItems(hero,ItAt_Swampshark_02	)
	&&	 Npc_HasItems(hero,ItAt_Troll_02		)
	{
		return TRUE;
	};
};

FUNC VOID Info_FreemineOrc_EVERYULUMULU_Info()
{
	AI_Output			(hero, self,"Info_FreemineOrc_EVERYULUMULU_15_01"); //Mam ju¿ wszystkie przedmioty potrzebne do sporz¹dzenia Ulu-Mulu!
	AI_Output			(self, hero,"Info_FreemineOrc_EVERYULUMULU_17_02"); //Obcy byæ silny wojownik! Daæ rzeczy! Tarrok zrobiæ ULU-MULU!
	AI_Output 			(self, hero,"Info_FreemineOrc_EVERYULUMULU_17_03"); //Gotowe! Obcy nosiæ ULU-MULU, byæ dumny! Tarrok teraz spaæ!
    
    CreateInvItems      (hero,  ItAt_Waran_01, 3);
	B_GiveInvItems	    (hero, self, ItAt_Waran_01, 4); //Notwendig für Ausschrift "4 Gegenstände übergegen", wird sofort ausgeglichen
	Npc_RemoveInvItem	(hero, ItAt_Shadow_02		);
	Npc_RemoveInvItem	(hero, ItAt_Swampshark_02	);
	Npc_RemoveInvItem	(hero, ItAt_Troll_02		);
	
	Npc_RemoveInvItems	(self, ItAt_Waran_01, 4);    
	 

	B_Story_GotUluMulu	();
	
	AI_StopProcessInfos	(self);
};





