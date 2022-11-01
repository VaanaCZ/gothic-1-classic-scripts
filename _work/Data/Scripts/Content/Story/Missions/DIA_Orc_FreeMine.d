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
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_01"); //Muszę już iść!
		AI_Output			(self, hero,"Info_FreemineOrc_EXIT_17_02"); //Obcy wrócić znowu!
	}                                                              
	else                                                           
	{
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_03"); //Dziękuję. Muszę już ruszać w dalszą drogę.
		AI_Output			(self, hero,"Info_FreemineOrc_EXIT_17_04"); //Obcy mieć dobra podróż!
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
	AI_Output			(self, hero,"Info_FreemineOrc_INTRO_17_01"); //Tarrok chcieć pomocy! Tarrok ranny!
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
	description = "Co się tu stało?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_WASPASSIERT_15_01"); //Co się tu stało?
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_02"); //Tarrok tu złapany przez niebieski żołnierze. Nagle czerwony żołnierze wszędzie.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_03"); //Czerwony żołnierze zabijać... wszystko.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_04"); //Tarrok uciec tu. Czerwony żołnierze nie tu. Oni boją GACH LUG.
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
	description = "Co mogę dla ciebie zrobić?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_WASTUN_15_01"); //Co mogę dla ciebie zrobić?
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_02"); //Tarrok chcieć mocny lek, albo Tarrok umrzeć.
	AI_Output			(hero, self,"Info_FreemineOrc_WASTUN_15_03"); //O jakim lekarstwie mówisz?
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_04"); //GACH LUG otruć Tarrok. Tarrok chcieć lek!
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_05"); //Głupi, głupi Tarrok. Zgubić lek! Nie znaleźć!
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
	AI_Output			(self, hero,"Info_FreemineOrc_OFFER_17_02"); //Tarrok słaby. Obcy wrócić szybko, albo Tarrok umrzeć!
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
	AI_Output			(self, hero,"Info_FreemineOrc_CRAWLER_17_02"); //Duży zwierz, dużo nóg ma.
	AI_Output			(self, hero,"Info_FreemineOrc_CRAWLER_17_03"); //GACH LUG groźny! Zjadać Ork - zjadać człowiek!
	AI_Output			(hero, self,"Info_FreemineOrc_CRAWLER_15_04"); //Ach, masz na myśli pełzacze!
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
	description = "Potrafisz porozumiewać się w naszym języku?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_TONGUE_15_01"); //Potrafisz porozumiewać się w naszym języku?
	AI_Output			(self, hero,"Info_FreemineOrc_TONGUE_17_02"); //Tarrok u ludzi długi czas. Tarrok dobrze słuchać.
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
	description	= "Nie mogę znaleźć twojego lekarstwa!";
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
	AI_Output			(hero, self,"Info_FreemineOrc_SEARCHPOTION_15_01"); //Nie mogę znaleźć twojego lekarstwa!
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_02"); //Obcy szukać więcej! Lek gdzieś tu!
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_03"); //Tarrok uciekać od GACH LUG! Tarrok chować się i uciekać!
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_04"); //Obcy przeszukać nisze też!
	 
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
	description = "Jesteś przyjacielem Ur-Shaka, tego szamana?";
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
	AI_Output		(hero, self,"Info_FreemineOrc_SUCHEULUMULU_15_01"); //Jesteś przyjacielem Ur-Shaka, tego szamana?
	AI_Output		(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_02"); //Ur-Shak niewolnik, jak Tarrok. Ur-Shak uciec! Dawno, dawno temu!
	AI_Output		(hero, self,"Info_FreemineOrc_SUCHEULUMULU_15_03"); //Twój przyjaciel powiedział mi, że mógłbyś dla mnie zrobić Ulu-Mulu.
	if (FreemineOrc_SuchePotion == LOG_SUCCESS)
	{
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_04"); //Ty pomóc mi, ja pomóc ty!
	}
	else
	{
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_05"); //Tarrok bardzo słaby. Nie ma lek, Tarrok umierać.
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_06"); //Obcy przynieść lek, wtedy Tarrok pomóc!
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
	description = "Proszę, znalazłem twoje lekarstwo!";
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
	AI_Output			(hero, self,"Info_FreemineOrc_GIVEPOTION_15_01"); //Proszę, znalazłem twoje lekarstwo!

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
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_03"); //Tarrok dziękować!
	AI_Output			(hero, self,"Info_FreemineOrc_GIVEPOTION_15_04"); //Możesz już zrobić dla mnie Ulu-Mulu?
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_05"); //Obcy pomóc Tarrok, teraz Tarrok pomóc Obcy!
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_06"); //Obcy potrzebować KROTAHK, KHAZ-TAK, DWACHKARR i ORTH-ANTAK.
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_07"); //Obcy przynieść, Tarrok zrobić Ulu-Mulu!
	
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
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN_17_02"); //Być język ognia. Język smoka!
	
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
	description = "Gdzie mogę znaleźć smoka?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_FIREWARAN2_15_01"); //Gdzie mogę znaleźć takiego smoka?
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN2_17_02"); //Smok mieszka w domu Tarroka. Obcy musi szukać!
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN2_17_03"); //Smok mieszka też na piasku, przy morzu.

	B_LogEntry			(CH4_UluMulu,"Aby sporządzić Ulu-Mulu, Tarrok potrzebuje smoczego języka. Smoki żyją w krainie orków i na piaszczystych plażach. Parę z nich kręciło się chyba w pobliżu wraku okrętu?");
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
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02"); //Być róg cieniostwór. Róg ostry jak nóż, twardy jak kamień.
	
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
	description = "Gdzie mogę znaleźć tego cieniostwora?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01"); //Gdzie mogę znaleźć tego cieniostwora?
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02"); //On w lesie albo w jaskini. Nie lubi słońce.
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03"); //Bardzo zły. Obcy uważać!

	B_LogEntry			(CH4_UluMulu,"Aby sporządzić Ulu-Mulu, Tarrok potrzebuje rogu cieniostwora. Istoty te zamieszkują mroczne lasy i jaskinie. O ile pamiętam, największy obszar leśny w kolonii rozciąga się pomiędzy Starym Obozem a bagnem.");
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
	description = "DWACHKARR? A cóż to takiego?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_SWAMPSHARK_15_01"); //DWACHKARR? A cóż to takiego?
	AI_Output			(self, hero,"Info_FreemineOrc_SWAMPSHARK_17_02"); //Ząb błotnego węża. Jak wąż ugryźć, nikt nie móc uciec.
	
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
	description = "Gdzie mogę znaleźć te błotne węże?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_SWAMPSHARK2_15_01"); //Gdzie mogę znaleźć te błotne węże?
	AI_Output			(self, hero,"Info_FreemineOrc_SWAMPSHARK2_17_02"); //Dużo wąż błotny w obóz ludzi. Obóz na bagnie to jest!

	B_LogEntry			(CH4_UluMulu,"Aby sporządzić Ulu-Mulu, Tarrok potrzebuje zębów błotnego węża. Bagna w pobliżu obozu Bractwa aż roją się od tych stworzeń."); 
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
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL_17_02"); //Być ząb wielki Troll! Robić duża dziura w ofiara!
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
	description = "Gdzie mogę znaleźć Trolle?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_TROLL2_15_01"); //Gdzie mogę znaleźć Trolle?
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_02"); //Troll siedzieć w góry. Troll lubi dużo miejsca!
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_03"); //Obcy szukać w górach na północ. Ale uważać na Trolla łapy!
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_04"); //Troll walnąć - Obcy spaść w dół!

	B_LogEntry			(CH4_UluMulu,"Aby sporządzić Ulu-Mulu, Tarrok potrzebuje kłów trolla. Te potężne stworzy zamieszkują górzyste tereny w północnej części kolonii.");
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
	AI_Output 			(self, hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02"); //Obcy szukać dalej! Tarrok tu czekać!

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
	description = "Mam już przedmioty potrzebne do sporządzenia Ulu-Mulu!";
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
	AI_Output			(hero, self,"Info_FreemineOrc_EVERYULUMULU_15_01"); //Mam już wszystkie przedmioty potrzebne do sporządzenia Ulu-Mulu!
	AI_Output			(self, hero,"Info_FreemineOrc_EVERYULUMULU_17_02"); //Obcy być silny wojownik! Dać rzeczy! Tarrok zrobić ULU-MULU!
	AI_Output 			(self, hero,"Info_FreemineOrc_EVERYULUMULU_17_03"); //Gotowe! Obcy nosić ULU-MULU, być dumny! Tarrok teraz spać!
    
    CreateInvItems      (hero,  ItAt_Waran_01, 3);
	B_GiveInvItems	    (hero, self, ItAt_Waran_01, 4); //Notwendig für Ausschrift "4 Gegenstände übergegen", wird sofort ausgeglichen
	Npc_RemoveInvItem	(hero, ItAt_Shadow_02		);
	Npc_RemoveInvItem	(hero, ItAt_Swampshark_02	);
	Npc_RemoveInvItem	(hero, ItAt_Troll_02		);
	
	Npc_RemoveInvItems	(self, ItAt_Waran_01, 4);    
	 

	B_Story_GotUluMulu	();
	
	AI_StopProcessInfos	(self);
};





