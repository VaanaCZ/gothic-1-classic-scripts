/*
-------------------------------- Die Mission ----------------------------

Die Freemine Mission. 
Der SC metzelt sich durch die FM und findet dort einen Orc, welcher schwer
verletzt ist und einen Orcischen Heiltrank braucht. 
Alls Gegenleistung f¸r den Heiltrank sagt er dir was man alles f¸r Items
f¸r das Ulu-Mulu braucht.
Wenn man ihm die drei Teile bringt bastelt er dir das Ulumulu.

--------------------------------- Die Items -----------------------------
OrcHeiltrank:			Orcmedicine			-> OrcGegengift	
	
Teil vom Ulu-Mulu (1)	ItAt_Waran_01		-> 	Flammenzunge
Teil vom Ulu-Mulu (2)	ItAt_Shadow_02		->	Horn eines Shadowbeast
Teil vom Ulu-Mulu (3)	ItAt_Swampshark_02	->	Z‰hne des Sumpfhais
Teil vom Ulu-Mulu (4)   ItAt_Troll_02		->	Hauer eines Trolls

Ulu-Mulu				Ulumulu				-> Das Ulumulu

----------------------------------- ToDo ---------------------------------
-> Monsterhinweise m¸ssen noch rein
-> Missionlogs basteln
-> Sprache ¸berarbeiten
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
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_01"); //MusÌm pokraËovat!
		AI_Output			(self, hero,"Info_FreemineOrc_EXIT_17_02"); //PojÔ d·l, cizinËe!
	}                                                              
	else                                                           
	{
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_03"); //DÏkuju. P˘jdu si svou cestou.
		AI_Output			(self, hero,"Info_FreemineOrc_EXIT_17_04"); //äùastnou cestu, cizinËe!
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
	AI_Output			(self, hero,"Info_FreemineOrc_INTRO_17_01"); //Tarrok pot¯ebovat pomoc! Tarrok b˝t ranÏn.
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
	description = "Co se tu stalo?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_WASPASSIERT_15_01"); //Co se tu stalo?
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_02"); //Tarrok b˝t tady zajat modr˝mi voj·ky. RudÌ voj·ci najednou vöude.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_03"); //RudÌ voj·ci zabÌjet kaûdÈho.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_04"); //Tarrok utekl. RudÌ voj·ci sem nejÌt. RudÌ voj·ci se b·t GACH LUGA.
	AI_Output			(self, hero,"Info_FreemineOrc_WASPASSIERT_17_05"); //ProsÌm pomoc, Tarrok b˝t ranÏn.
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
	description = "Co pro tebe m˘ûu udÏlat?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_WASTUN_15_01"); //Co pro tebe m˘ûu udÏlat?
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_02"); //Tarrok pot¯ebovat siln˝ lÈk. Tarrok jinak brzy zem¯Ìt.
	AI_Output			(hero, self,"Info_FreemineOrc_WASTUN_15_03"); //Jak˝ druh lÈku?
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_04"); //GACH LUGŸV lektvar. Tarrok pot¯ebovat lÈk.
	AI_Output			(self, hero,"Info_FreemineOrc_WASTUN_17_05"); //Tarrok mÌt lÈk, ale Tarrok ztratit. Tarrok ho nenajÌt!
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
	description = "P¯inesu ti ten lÈk zp·tky!";
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
	AI_Output			(hero, self,"Info_FreemineOrc_OFFER_15_01"); //P¯inesu ti ten lÈk zp·tky!
	AI_Output			(self, hero,"Info_FreemineOrc_OFFER_17_02"); //Tarrok b˝t velmi slab˝. Cizinec pospÌchat, jinak Tarrok zem¯Ìt!
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
	description = "Co to znamen· GACH LUG?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_CRAWLER_15_01"); //Co to znamen· GACH LUG?
	AI_Output			(self, hero,"Info_FreemineOrc_CRAWLER_17_02"); //B˝t velkÈ zvÌ¯e, kr·Ëet na mnoha noh·ch.
	AI_Output			(self, hero,"Info_FreemineOrc_CRAWLER_17_03"); //GACH LUG b˝t nebezpeËn˝! JÌst sk¯ety a lidi!
	AI_Output			(hero, self,"Info_FreemineOrc_CRAWLER_15_04"); //M·ö urËitÏ na mysli d˘lnÌ Ëervy tady zezdola!
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
	description = "Ty mluvÌö naöÌm jazykem?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_TONGUE_15_01"); //Ty mluvÌö naöÌm jazykem?
	AI_Output			(self, hero,"Info_FreemineOrc_TONGUE_17_02"); //Tarrok b˝t dlouho otrokem u lidÌ. Tarrok dob¯e poslouchat.
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
	description	= "Nem˘ûu ten lÈk najÌt!";
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
	AI_Output			(hero, self,"Info_FreemineOrc_SEARCHPOTION_15_01"); //Nem˘ûu ten lÈk najÌt!
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_02"); //Cizinec jeötÏ hledat! LÈk b˝t tady.
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_03"); //Tarrok utekl GACH LUGOVI! Tarrok se schovat na ˙tÏku.
	AI_Output			(self, hero,"Info_FreemineOrc_SEARCHPOTION_17_04"); //Cizinec takÈ hledat ve v˝klenku.
	 
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
	description = "Jsi p¯Ìtel Ur-Shaka, toho öamana?";
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
	AI_Output		(hero, self,"Info_FreemineOrc_SUCHEULUMULU_15_01"); //Jsi p¯Ìtel Ur-Shaka, toho öamana?
	AI_Output		(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_02"); //Ur-Shak b˝t otrok, jako Tarrok. Ur-Shak utÈct! B˝t pryË uû mnoho zim.
	AI_Output		(hero, self,"Info_FreemineOrc_SUCHEULUMULU_15_03"); //Tv˘j p¯Ìtel ¯Ìkal, ûe bys mnÏ mohl udÏlat Ulu-Mulu!
	if (FreemineOrc_SuchePotion == LOG_SUCCESS)
	{
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_04"); //Ty pomoc mnÏ, j· pomoc tobÏ!
	}
	else
	{
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_05"); //Tarrok b˝t velmi slab˝. Kdyû neb˝t lÈk, Tarrok zem¯Ìt.
		AI_Output	(self, hero,"Info_FreemineOrc_SUCHEULUMULU_17_06"); //Cizinec p¯inÈst lÈk, pak Tarrok pomoc!
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
	description = "Tady, naöel jsem tv˘j lÈk!";
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
	AI_Output			(hero, self,"Info_FreemineOrc_GIVEPOTION_15_01"); //Tady, naöel jsem tv˘j lÈk!

	B_GiveInvItems      (hero, self, Orcmedicine, 1); 	
	EquipItem			(self, Orcmedicine);
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		AI_TurnToNpc	(self, hero);
	};
	AI_UseItemToState	(self, Orcmedicine, 1);
	AI_UseItemToState	(self, Orcmedicine, -1);

	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_02"); //Cizinec neb˝t öpatn˝ jako ostatnÌ lidÈ! Cizinec b˝t dobr˝!
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_03"); //Tarrok dluûit dÌky!
	AI_Output			(hero, self,"Info_FreemineOrc_GIVEPOTION_15_04"); //M˘ûeö mi teÔ d·t ten Ulu-Mulu?
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_05"); //Cizinec pomoc Tarrokovi, Tarrok pomoc cizincovi takÈ.
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_06"); //Cizinec pot¯ebovat KROTAHK, KHAZ-TAK, DWACHKARR a ORTH-ANTAK.
	AI_Output			(self, hero,"Info_FreemineOrc_GIVEPOTION_17_07"); //Cizinec to p¯inÈst, Tarrok pak udÏlat Ulu-Mulu!
	
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
	description = "Co je to KROTAHK?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_FIREWARAN_15_01"); //Co je to KROTAHK?
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN_17_02"); //B˝t ohniv˝ jazyk. B˝t jazyk ohnivÈ jeötÏrky!
	
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
	description = "Kde najdu ohnivou jeötÏrku?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_FIREWARAN2_15_01"); //Kde najdu ohnivou jeötÏrku?
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN2_17_02"); //Ohniv· jeötÏrka ûÌt doma. Doma u Tarroka. Cizinec muset hledat!
	AI_Output			(self, hero,"Info_FreemineOrc_FIREWARAN2_17_03"); //TakÈ najÌt ohnivou jeötÏrku na pÌsku u mo¯e.

	B_LogEntry			(CH4_UluMulu,"Tarok pot¯ebuje k v˝robÏ ULU-MULU jazyk ohnivÈ jeötÏrky. Tyto jeötÏrky ûijÌ hlavnÏ v sk¯etÌch oblastech a na pÌsËitÈm pob¯eûÌ. Nebyl tam lodnÌ vrak pln˝ jeötÏrek?");
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
	description = "Co je to KHAZ-TAK?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_SHADOWBEAST_Info_15_01"); //Co je to KHAZ-TAK?
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST_Info_17_02"); //B˝t roh stÌnovÈ obludy. Roh ostr˝ jako n˘û a tvrd˝ jako k·men.
	
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
	description = "Kde najdu stÌnovou obludu?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_SHADOWBEAST2_Info_15_01"); //Kde najdu stÌnovou obludu?
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_02"); //éÌt v lese nebo v jeskyni. Ne na svÏtle.
	AI_Output			(self, hero,"Info_FreemineOrc_SHADOWBEAST2_Info_17_03"); //B˝t moc nebezpeËn·. Cizinec b˝t opatrn˝!

	B_LogEntry			(CH4_UluMulu,"Tarok pot¯ebuje k v˝robÏ ULU-MULU roh stÌnovÈ öelmy. Tyto öelmy ûijÌ hlavnÏ v tmav˝ch lesÌch a jeskynÌch. Pokud vÌm, tak nejvÏtöÌ les kolonie je mezi Star˝m t·borem a T·borem v baûin·ch.");
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
	description = "DWACHKARR? Co to je?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_SWAMPSHARK_15_01"); //DWACHKARR? Co to je?
	AI_Output			(self, hero,"Info_FreemineOrc_SWAMPSHARK_17_02"); //B˝t zub moË·lovÈho ûraloka. Kdyû zub zakousnout, obÏù uû nikdy ne utÈct.
	
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
	description = "Kde najdu moË·lovÈho ûraloka?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_SWAMPSHARK2_15_01"); //Kde najdu moË·lovÈho ûraloka?
	AI_Output			(self, hero,"Info_FreemineOrc_SWAMPSHARK2_17_02"); //Mnoho moË·lov˝ch ûralok˘ b˝t v t·bo¯e lidÌ. V t·bo¯e v baûin·ch, tak!

	B_LogEntry			(CH4_UluMulu,"Tarok pot¯ebuje k v˝robÏ ULU-MULU zuby moË·lovÈho ûraloka. Spousty tÏchto bestiÌ ûijÌ za t·borem Bratrstva."); 
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
	description = "Co je to ORTH-ANTAK?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_TROLL_15_01"); //Co je to ORTH-ANTAK?
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL_17_02"); //B˝t zub velkÈho trola! UdÏlat velkou dÌru do ko¯isti!
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
	description = "Kde najdu trola?";
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
	AI_Output			(hero, self,"Info_FreemineOrc_TROLL2_15_01"); //Kde najdu nÏjakÈho trola?
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_02"); //Trol ûÌt v hor·ch. Trol milovat hodnÏ prostoru!
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_03"); //Cizinec muset jÌt hledat v severnÌch hor·ch! Ale d·vat pozor na pÏst trola!
	AI_Output			(self, hero,"Info_FreemineOrc_TROLL2_17_04"); //Kdyû pÏst ude¯it, cizinec spadnout z hory!

	B_LogEntry			(CH4_UluMulu,"Tarok pot¯ebuje k v˝robÏ ULU-MULU trolÌ tes·ky. Tyto bestie ûijÌ v hor·ch na severu kolonie. MÏl bych prohledat tamÏjöÌ rokliny.");
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
	description = "JeötÏ nem·m vöechny Ëty¯i sloûky!";
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
	AI_Output 			(hero, self,"Info_FreemineOrc_LOOKINGULUMULU_15_01"); //JeötÏ nem·m vöechny Ëty¯i sloûky!
	AI_Output 			(self, hero,"Info_FreemineOrc_LOOKINGULUMULU_17_02"); //Cizinec pokraËovat hledat. Tarrok poËkat tady!

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
	description = "Uû m·m vöechny Ëty¯i sloûky pro Ulu-Mulu!";
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
	AI_Output			(hero, self,"Info_FreemineOrc_EVERYULUMULU_15_01"); //Uû m·m vöechny Ëty¯i sloûky pro Ulu-Mulu!
	AI_Output			(self, hero,"Info_FreemineOrc_EVERYULUMULU_17_02"); //Cizinec b˝t siln˝ bojovnÌk! D·t mi ty sloûky! Tarrok udÏlat Ulu-Mulu!
	AI_Output 			(self, hero,"Info_FreemineOrc_EVERYULUMULU_17_03"); //Tady! Cizinec nosit ULU-MULU s hrdostÌ! Tarrok teÔ sp·t!
    
    CreateInvItems      (hero,  ItAt_Waran_01, 3);
	B_GiveInvItems	    (hero, self, ItAt_Waran_01, 4); //Notwendig f¸r Ausschrift "4 Gegenst‰nde ¸bergegen", wird sofort ausgeglichen
	Npc_RemoveInvItem	(hero, ItAt_Shadow_02		);
	Npc_RemoveInvItem	(hero, ItAt_Swampshark_02	);
	Npc_RemoveInvItem	(hero, ItAt_Troll_02		);
	
	Npc_RemoveInvItems	(self, ItAt_Waran_01, 4);    
	 

	B_Story_GotUluMulu	();
	
	AI_StopProcessInfos	(self);
};





