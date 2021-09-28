//---------------------------------------------------------------------
//	Info EXIT
//---------------------------------------------------------------------
instance  Info_Xardas_EXIT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	nr			= 999;
	condition	= Info_Xardas_EXIT_Condition;
	information	= Info_Xardas_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Info_Xardas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Xardas_EXIT_Info()
{
	AI_StopProcessInfos	( self );
	if (!Npc_HasItems (self,ItArRuneFireball))
	{
		CreateInvItem (self, ItArRuneFireball);
	};
	if (Npc_HasItems (self,ItArScrollSummonDemon)<1)
	{
		CreateInvItems (self, ItArScrollSummonDemon,2);
	};

};



//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DISTURB
//---------------------------------------------------------------------
instance  Info_Xardas_DISTURB (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DISTURB_Condition;
	information	= Info_Xardas_DISTURB_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int  Info_Xardas_DISTURB_Condition()
{	
	if	/*(FindGolemHearts == 4)
	&&	*/!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_DISTURB_Info()
{
	B_WhirlAround	(self, hero);
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_01"); //KDO SI DOVOLUJE MÃ RUäIT PÿI STUDIÕCH?
	AI_Output 		(hero, self,"Info_Xardas_DISTURB_15_02"); //Jmenuju se...
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_03"); //NezajÌm· mÏ, jak se jmenujeö. Je to ned˘leûitÈ.
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_04"); //D˘leûitÈ je jen to, ûe jsi za ta lÈta prvnÌ ËlovÏk, kter˝ roz¯eöil h·danku m˝ch Golem˘.
}; 

//---------------------------------------------------------------------
//	Info OTHERS
//---------------------------------------------------------------------
instance  Info_Xardas_OTHERS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_OTHERS_Condition;
	information	= Info_Xardas_OTHERS_Info;
	important	= 0;
	permanent	= 0;
	description = "Byli tu jeötÏ jinÌ n·vötÏvnÌci?";
};

FUNC int  Info_Xardas_OTHERS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_OTHERS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_01"); //Byli tu jeötÏ jinÌ n·vötÏvnÌci?
	AI_Output 		(self, hero,"Info_Xardas_OTHERS_14_02"); //Ne moc, ale jakmile mÏ zaËali obtÏûovat, nechal jsem je konfrontovat s jednou z m˝ch nadp¯irozen˝ch p¯Ìöer.
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_03"); //Ty jsi nerad vyruöov·n, viÔ?
}; 

//---------------------------------------------------------------------
//	Info SATURAS
//---------------------------------------------------------------------
instance  Info_Xardas_SATURAS (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SATURAS_Condition;
	information	= Info_Xardas_SATURAS_Info;
	important	= 0;
	permanent	= 0;
	description = "Poslal mÏ Saturas. Pot¯ebujeme tvoji pomoc!";
};

FUNC int  Info_Xardas_SATURAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SATURAS_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_01"); //Poslal mÏ Saturas. Pot¯ebujeme tvojÌ pomoc!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_02"); //M·govÈ Vody se chystajÌ pouûÌt svojÌ velkou rudnou haldu...
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_03"); //Rudn· halda NENÕ spr·vnÈ ¯eöenÌ!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_04"); //NenÌ?
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_05"); //NE!
}; 

//---------------------------------------------------------------------
//	Info KDW
//---------------------------------------------------------------------
instance  Info_Xardas_KDW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_KDW_Condition;
	information	= Info_Xardas_KDW_Info;
	important	= 0;
	permanent	= 0;
	description = "Vöichni m·govÈ OhnÏ jsou mrtvÌ!";
};

FUNC int  Info_Xardas_KDW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};
};

FUNC void  Info_Xardas_KDW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_01"); //Vöichni m·govÈ OhnÏ jsou mrtvÌ!
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_02"); //Gomez je povraûdil.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_03"); //To mÏ nep¯ekvapuje. TÏm bl·zniv˝m barbar˘m na hradÏ, hlavnÏ Gomezovi, nikdy nenÌ co vÏ¯it.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_04"); //Corristo a dalöÌ m·govÈ si sami zvolili öibenici, kdyû pom·hali Gomezovi p¯evzÌt moc.
}; 

//---------------------------------------------------------------------
//	Info SLEEPER
//---------------------------------------------------------------------
instance  Info_Xardas_SLEEPER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_SLEEPER_Condition;
	information	= Info_Xardas_SLEEPER_Info;
	important	= 0;
	permanent	= 0;
	description = "O tom takzvanÈm 'Sp·Ëovi' se ¯Ìk·, ûe je to zl˝ arcidÈmon.";
};

FUNC int  Info_Xardas_SLEEPER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DISTURB)
	{
		return TRUE;
	};

};
FUNC void  Info_Xardas_SLEEPER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_01"); //O tom takzvanÈm 'Sp·Ëovi' se ¯Ìk·, ûe je to zl˝ arcidÈmon.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_02"); //Toho si vytvo¯ilo Bratrstvo z baûin.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_03"); //TeÔ m·govÈ Vody vÏ¯Ì tomu, ûe jsou vöichni v kolonii ve velkÈm nebezpeËÌ.
	AI_Output 		(self, hero,"Info_Xardas_SLEEPER_14_04"); //Je to vÏtöÌ nebezpeËÌ, neû si kdokoliv uvnit¯ BariÈry dok·ûe p¯edstavit. 
}; 

//---------------------------------------------------------------------
//	Info DANGER
//---------------------------------------------------------------------
instance  Info_Xardas_DANGER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_DANGER_Condition;
	information	= Info_Xardas_DANGER_Info;
	important	= 0;
	permanent	= 0;
	description = "Pokud exploze rudnÈ haldy toto velkÈ nebezpeËÌ neodvr·tÌ...";
};

FUNC int  Info_Xardas_DANGER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_SLEEPER)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SATURAS)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_DANGER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_01"); //Pokud exploze rudnÈ haldy toto velkÈ nebezpeËÌ neodvr·tÌ...
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_02"); //...ZapomeÚ na rudnou haldu! JejÌ sÌla BariÈru neotev¯e.
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_03"); //Kdyby Corristo a Saturas nepl˝tvali v minul˝ch letech Ëasem na bl·znivÈ a zbyteËnÈ z·leûitosti, pak by vöichni vÏdÏli, co j· vÌm.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_04"); //A co?
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_05"); //é·dn˝ z dvan·cti m·g˘ se od tÈ doby nep¯estal pt·t, proË se jim vytvo¯enÌ BariÈry vymklo z rukou a proË nabyla tak obrovsk˝ch rozmÏr˘.
};

//---------------------------------------------------------------------
//	Info BARRIER
//---------------------------------------------------------------------
instance  Info_Xardas_BARRIER (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_BARRIER_Condition;
	information	= Info_Xardas_BARRIER_Info;
	important	= 0;
	permanent	= 0;
	description = "P¯iöel jsi na to, proË se to stalo?";
};

FUNC int  Info_Xardas_BARRIER_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_DANGER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_BARRIER_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_01"); //P¯iöel jsi na to, proË se to stalo? 
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_02"); //Dobr·, jedno je jistÈ: odpovÏÔ leûÌ hluboko pod mÏstem sk¯et˘.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_03"); //Pod mÏstem sk¯et˘?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_04"); //Sk¯eti nejsou zvÌ¯ata, jak si mnozÌ myslÌ. Jejich kultura je tak star· jako lidsk·.
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_05"); //P¯ed nÏkolika stoletÌmi vyvolalo pÏt sk¯etÌch öaman˘ velmi starÈho arcidÈmona, protoûe doufali, ûe d· jejich klanu sÌlu, se kterou by porazili svÈ nep¯·tele.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_06"); //Ten arcidÈmon, to byl Sp·Ë?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_07"); //Sk¯eti mu tohle jmÈno dali aû mnohem pozdÏji. Nem˘ûu ale ¯Ìci, proË mu ho dali, ani proË se teÔ tÈ nadp¯irozenÈ bytosti dÏsÌ!
}; 

//---------------------------------------------------------------------
//	Info EVENT
//---------------------------------------------------------------------
instance  Info_Xardas_EVENT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENT_Condition;
	information	= Info_Xardas_EVENT_Info;
	important	= 0;
	permanent	= 0;
	description = "ProË ne?";
};

FUNC int  Info_Xardas_EVENT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_BARRIER)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_01"); //ProË ne?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_02"); //VÏ¯Ìm, ûe ty bys mohl... NE, jsem si jist, ty budeö muset vykonat jin˝ ˙kol!
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_03"); //Jak˝?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_04"); //PozornÏ poslouchej: Sk¯eti vyhostili z toho mÏsta jednoho öamana.
}; 

//---------------------------------------------------------------------
//	Info EVENTWHY
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHY (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHY_Condition;
	information	= Info_Xardas_EVENTWHY_Info;
	important	= 0;
	permanent	= 0;
	description = "ProË ho vyhostili?";
};

FUNC int  Info_Xardas_EVENTWHY_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHY_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHY_15_01"); //ProË ho vyhostili?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHY_14_02"); //UmÌrajÌcÌ sk¯etÌ bojovnÌk p¯i v˝slechu jednÌm m˝m dÈmonem nebyl schopen dlouho odpovÌdat na ot·zky.
}; 

//---------------------------------------------------------------------
//	Info EVENTHOW
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTHOW (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTHOW_Condition;
	information	= Info_Xardas_EVENTHOW_Info;
	important	= 0;
	permanent	= 0;
	description = "Co m· ten sk¯etÌ öaman spoleËnÈho s m˝m ˙kolem?";
};

FUNC int  Info_Xardas_EVENTHOW_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTHOW_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_01"); //Co m· ten sk¯etÌ öaman spoleËnÈho s m˝m ˙kolem?
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_02"); //ÿekne ti zbytek toho p¯ÌbÏhu o Sp·Ëovi.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_03"); //NÏjak˝ sk¯etÌ öaman bude asi sotva ochotn˝ se mnou mluvit!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_04"); //Chceö, abych ti pomohl nebo ne?
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_05"); //Ano, chci, ale...
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_06"); //Pak uû û·dnÈ ot·zky!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_07"); //Najdi toho öamana. NenÌ uû dlouhou dobu se sv˝mi bratry ve sk¯etÌm mÏstÏ zadob¯e, takûe tÏ moûn· vyslechne jeötÏ p¯edtÌm, neû tÏ promÏnÌ v ûivou pochodeÚ!
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_08"); //PÏkn· p¯edstava!
}; 

//---------------------------------------------------------------------
//	Info EVENTWHERE
//---------------------------------------------------------------------
instance  Info_Xardas_EVENTWHERE (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_EVENTWHERE_Condition;
	information	= Info_Xardas_EVENTWHERE_Info;
	important	= 0;
	permanent	= 0;
	description = "Kde je ten vyhoötÏn˝ öaman?";
};

FUNC int  Info_Xardas_EVENTWHERE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENT)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_EVENTWHERE_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_01"); //Kde je ten vyhoötÏn˝ öaman?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_02"); //Jdi na v˝chod ke starÈ citadele. Nem˘ûeö ji minout, je na vrcholu hory, kterou uvidÌö uû z d·lky.
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_03"); //Jak se dostanu dovnit¯?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_04"); //ÿÌkajÌ jÌ star· citadela, ale zbylo z nÌ sotva vÌc neû z·kladovÈ zdi. Je to uû po mnoho desetiletÌ z¯Ìcenina.
}; 

//---------------------------------------------------------------------
//	Info ACCEPT
//---------------------------------------------------------------------
instance  Info_Xardas_ACCEPT (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_ACCEPT_Condition;
	information	= Info_Xardas_ACCEPT_Info;
	important	= 0;
	permanent	= 0;
	description = "Dostanu od toho öamana odpovÏdi!";
};

FUNC int  Info_Xardas_ACCEPT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHY)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTHOW)
	&&	Npc_KnowsInfo(hero, Info_Xardas_EVENTWHERE)
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_ACCEPT_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_ACCEPT_15_01"); //Dostanu od toho öamana odpovÏdi!
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_02"); //M˘j sluûebnÌk ti uû p¯ipravil teleportaËnÌ runu na pentagram na podlaze.
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_03"); //To ti usnadnÌ pozdÏjöÌ n·vrat zpÏt.

	B_Story_CordsPost();		// Falls Spieler Gorn am Wassermagier-Pentragramm nicht angesprochen hat!
	B_Story_FindOrcShaman();
	
	AI_StopProcessInfos(self);
}; 
/*------------------------------------------------------------------------
						SCROLLS UND RUNEN VERKAUFEN							
------------------------------------------------------------------------*/

instance  Kdf_404_Xardas_SELLMAGICSTUFF (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Kdf_404_Xardas_SELLMAGICSTUFF_Condition;
	information		= Kdf_404_Xardas_SELLMAGICSTUFF_Info;
	important		= 0;
	permanent		= 1;
	trade			= 1;
	description		= "Hled·m magickÈ vÏdÏnÌ."; 
	
};

FUNC int  Kdf_404_Xardas_SELLMAGICSTUFF_Condition()
{	
	if ( Npc_KnowsInfo(hero, Info_Xardas_ACCEPT))
	{
		return TRUE;
	};

};
FUNC void  Kdf_404_Xardas_SELLMAGICSTUFF_Info()
{
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Hled·m magickÈ vÏdÏnÌ.
};

//---------------------------------------------------------------------
//	Info RETURN
//---------------------------------------------------------------------
instance  Info_Xardas_RETURN (C_INFO)
{
	npc			= Kdf_404_Xardas;
	condition	= Info_Xardas_RETURN_Condition;
	information	= Info_Xardas_RETURN_Info;
	important	= 0;
	permanent	= 0;
	description = "M·m odpovÏdi od sk¯etÌho öamana!";
};

FUNC int  Info_Xardas_RETURN_Condition()
{	
	if	UrShak_SpokeOfUluMulu
	&&	!EnteredTemple
	{
		return TRUE;
	};
};
FUNC void  Info_Xardas_RETURN_Info()
{
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_01"); //M·m odpovÏdi od sk¯etÌho öamana!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_02"); //V˝bornÏ, tak povÌdej!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_03"); //PÏt sk¯etÌch öaman˘ vyvolalo Sp·Ëe, kterÈho vytvo¯ili v podzemnÌm chr·mu, do kterÈho je vstup v sk¯etÌm mÏstÏ.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_04"); //To je pravda!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_05"); //Protoûe byl nevdÏËn˝, zaklel jejich srdce a odsoudil je k vÏËnÈmu bytÌ jako nesmrtelnÈ stv˘ry!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_06"); //Velmi dob¯e, velmi dob¯e!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_07"); //Sk¯eti zav¯eli chr·m a zaËali p¯in·öet obÏti, aby toho dÈmona usmÌ¯ili!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_08"); //Naöel jsi cestu ke vchodu do toho chr·mu?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_09"); //Ano, je jeden sk¯et, kter˝...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_10"); //Bez tÏch podrobnostÌ! Jdi do podzemnÌho chr·mu! Tam najdeö zp˘sob jak zniËit BariÈru!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_11"); //NerozumÌm!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_12"); //NechtÏl jsi snad po mnÏ, abych ti pom·hal s odstranÏnÌm BariÈry?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_13"); //To je pravda, ale...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_14"); //PAK TEDY BÃé. Uû se promrhalo spoustu Ëasu! Jdi do podzemnÌho chr·mu a najdi tam odpovÏÔ!

	B_Story_ReturnedFromUrShak();
}; 

//#####################################################################
//##
//##
//##							KAPITEL 5
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info FOUNDTEMPLE
//---------------------------------------------------------------------
instance  Info_Xardas_FOUNDTEMPLE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FOUNDTEMPLE_Condition;
	information		= Info_Xardas_FOUNDTEMPLE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Naöel jsem cestu do podzemnÌho chr·mu!"; 
};

FUNC int  Info_Xardas_FOUNDTEMPLE_Condition()
{	
	if (EnteredTemple)
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_FOUNDTEMPLE_Info()
{
	AI_Output (other, self,"Info_Xardas_FOUNDTEMPLE_15_01"); //Naöel jsem cestu do podzemnÌho chr·mu!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_02"); //NAäEL... To je pozoruhodnÈ!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_03"); //Stal ses velmi mocn˝! SilnÏjöÌ neû kdokoliv jin˝ uvnit¯ BariÈry.
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_04"); //Moûn· jsi doopravdy ten muû ze sk¯etÌho proroctvÌ!
};

//---------------------------------------------------------------------
//	Info PROPHECY
//---------------------------------------------------------------------
instance  Info_Xardas_PROPHECY (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_PROPHECY_Condition;
	information		= Info_Xardas_PROPHECY_Info;
	important		= 0;
	permanent		= 0;
	description		= "ProroctvÌ? JakÈ proroctvÌ?"; 
};

FUNC int  Info_Xardas_PROPHECY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Xardas_FOUNDTEMPLE))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_PROPHECY_Info()
{
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_01"); //ProroctvÌ? JakÈ proroctvÌ?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_02"); //PrastarÈ sk¯etÌ dokumenty napsanÈ kr·tce p¯ed uzav¯enÌm podzemnÌho chr·mu se zmiÚovaly o 'SvatÈm nep¯Ìteli'.
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_03"); //O SvatÈm nep¯Ìteli?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_04"); //NÏkdo, kdo provûdy odstranÌ SP¡»E z naöeho svÏta!
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_05"); //A j· m·m b˝t tÌm, kdo byl v tom starÈm proroctvÌ zmÌnÏn??? MusÌö se m˝lit, urËitÏ!
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_06"); //Moûn·... Moûn· ne!
};

//---------------------------------------------------------------------
//	Info LOADSWORD
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD_Condition;
	information		= Info_Xardas_LOADSWORD_Info;
	important		= 0;
	permanent		= 0;
	description		= "Naöel jsem zvl·ötnÌ meË."; 
};

FUNC int  Info_Xardas_LOADSWORD_Condition()
{	
	if ( Npc_HasItems ( hero, Mythrilklinge ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD_Info()
{
	AI_Output				(other, self,"Info_Xardas_LOADSWORD_15_01"); //Naöel jsem zvl·ötnÌ meË.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_02"); //Ukaû mi ho.

	CreateInvItem 			(self, Mythrilklinge01);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);

	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_03"); //To je zajÌmavÈ... Je na nÏm naps·no 'URIZIEL'.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_04"); //Slyöel jsem o tom meËi. Je to zbraÚ z d·vn˝ch dob, kdy lidskÈ plemeno bylo jeötÏ mladÈ.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_05"); //Ta zbraÚ je ukov·na z nezn·mÈho materi·lu. A nikde nenÌ naps·no, kdo ji vytvo¯il!
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_06"); //Jeho ost¯Ì je obda¯eno neuvÏ¯itelnou mocÌ, ale nevidÌm û·dnou kouzelnou auru! 
	
	Npc_RemoveInvItem 		(hero, Mythrilklinge);	
	CreateInvItem 			(hero, Mythrilklinge01);
};

//---------------------------------------------------------------------
//	Info LOADSWORD1
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD01 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD01_Condition;
	information		= Info_Xardas_LOADSWORD01_Info;
	important		= 0;
	permanent		= 0;
	description		= "URIZIEL je obda¯en neuvÏ¯itelnou mocÌ?"; 
};

FUNC int  Info_Xardas_LOADSWORD01_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD ))
	{			
		return TRUE;
	};	
};


FUNC void  Info_Xardas_LOADSWORD01_Info()
{
	Npc_RemoveInvItem 	(self, Mythrilklinge01);

	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_01"); //URIZIEL je obda¯en neuvÏ¯itelnou mocÌ?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_02"); //StojÌ ps·no, ûe majitel tÈ zbranÏ dok·zal protnout i to nejsilnÏjöÌ brnÏnÌ a p¯ekonat i to nejmocnÏjöÌ ochrannÈ kouzlo.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_03"); //Jak se mohla sk¯et˘m tahle mocn· zbraÚ dostat do rukou?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_04"); //TvrdÌ se, ûe ji sk¯eti vzali jednomu mocnÈmu v·leËnÌkovi. NevÏdÏli, jak ji pouûÌvat, ale ukryli ji!
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_05"); //Neukryli ji ale dob¯e!
};

//---------------------------------------------------------------------
//	Info LOADSWORD02
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD02 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD02_Condition;
	information		= Info_Xardas_LOADSWORD02_Info;
	important		= 0;
	permanent		= 0;
	description		= "Je moûnÈ obnovit b˝valou moc tÈto zbranÏ?"; 
};

FUNC int  Info_Xardas_LOADSWORD02_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD01 ))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_LOADSWORD02_Info()
{
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_01"); //Je moûnÈ obnovit b˝valou moc tÈto zbranÏ?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_02"); //Pot¯eboval bys k tomu velmi siln˝ zdroj magickÈ sÌly.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_03"); //MyslÌö natolik siln˝, aby prorazil magickou BariÈru?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_04"); //Asi tak siln˝...
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_05"); //A kromÏ toho bys pot¯eboval zvl·ötnÌ magickou formuli, kter· by tu sÌlu p¯etransformovala.
	AI_Output			(self, other,"Info_Xardas_LOADSWORD02_14_06"); //Dej mi trochu Ëasu a j· tu magickou formuli vytvo¯Ìm.

	B_Story_ShowedUrizielToXardas();
};


//---------------------------------------------------------------------
//	Info BETTERARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_BETTERARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_BETTERARMOR_Condition;
	information		= Info_Xardas_BETTERARMOR_Info;
	important		= 0;
	permanent		= 0;
	description		= "J· se zatÌm podÌv·m po nÏjakÈ lepöÌ zbroji!"; 
};

FUNC int  Info_Xardas_BETTERARMOR_Condition()
{	
	if ( Npc_KnowsInfo ( hero, Info_Xardas_LOADSWORD02))
	{			
		return TRUE;
	};	
};

FUNC void  Info_Xardas_BETTERARMOR_Info()
{
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_01"); //J· se zatÌm podÌv·m po nÏjakÈ lepöÌ zbroji!

	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if (armorInstance == CRW_ARMOR_H)
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_02"); //Tahle zal·tan· protiËervÌ zbroj byla v podzemnÌm chr·mu mockr·t proraûena!
	}
	else if (armorInstance == KDW_ARMOR_H) || (armorInstance == KDW_ARMOR_L)		
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_03"); //Tyhle modrÈ hadry by mÏ v podzemnÌm chr·mu sotva ochr·nily!
	}
	else
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_04"); //Ten nemrtv˝ zanechal v mÈ zbroji po¯·dnÈ dÌry!
	};
	
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_05"); //MÏl bys jÌt do mojÌ starÈ vÏûe.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_06"); //TvojÌ starÈ vÏûe?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_07"); //Potopila se v jednom z v˝chodnÌch jezer p¯i jednom zemÏt¯esenÌ. Vrcholy jsou nad povrchem st·le viditelnÈ.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_08"); //Z˘stalo v nÌ nÏkolik artefakt˘. Nikdy jsem se nesnaûil je dostat zp·tky.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_09"); //Jak se tam dostanu?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_10"); //Od toho zemÏt¯esenÌ jsem tam nebyl, takûe si k nÌ budeö muset najÌt cestu s·m.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_11"); //Tady je klÌË. Je od truhly, ve kterÈ jsem obvykle ukl·dal obzvl·öù vz·cnÈ artefakty.

	B_Story_ExploreSunkenTower();
};


//---------------------------------------------------------------------
//	Info OREARMOR
//---------------------------------------------------------------------
instance  Info_Xardas_OREARMOR (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_OREARMOR_Condition;
	information		= Info_Xardas_OREARMOR_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Info_Xardas_OREARMOR_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OREARMOR_Info()
{
	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if	(armorInstance == ORE_ARMOR_M)
	||	(armorInstance == ORE_ARMOR_H)
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_01"); //Aha! VidÌm, ûe nosÌö rudnou zbroj.
	}
	else
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_02"); //Jak vidÌm, naöel jsi rudnou zbroj.
	};
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_03"); //Naöel jsem ji v jednÈ z tÏch truhel v potopenÈ vÏûi.
	AI_Output		(self, other,"Info_Xardas_OREARMOR_14_04"); //Pat¯ila gener·lovi, kter˝ v bitvÏ proti sk¯et˘m pouûÌval URIZIEL.
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_05"); //Douf·m, ûe mi p¯inese vÌc ötÏstÌ neû jemu!
};

//---------------------------------------------------------------------
//	Info FORMULA 
//---------------------------------------------------------------------
instance  Info_Xardas_FORMULA (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_FORMULA_Condition;
	information		= Info_Xardas_FORMULA_Info;
	important		= 0;
	permanent		= 0;
	description		= "M·ö hotovou tu formuli na obnovenÌ sÌly URIZIELA?";
};

FUNC int  Info_Xardas_FORMULA_Condition()
{	
	if	Npc_HasItems(hero, ORE_ARMOR_M)
	||	Npc_HasItems(hero, ORE_ARMOR_H)
	||	Npc_HasItems(hero, ItArRuneTeleport1)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_FORMULA_Info()
{
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_01"); //M·ö hotovou tu formuli na obnovenÌ sÌly URIZIELA?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_02"); //Je hotov·. Nebudeö ji moci ale pouûÌt s·m.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_03"); //ProË ne?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_04"); //MusÌ b˝t vyslovena nÏjak˝m m·gem, zatÌmco ty se budeö dot˝kat meËem zdroje sÌly.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_05"); //Pak se budu muset porozhlÈdnout po nÏjakÈ pomoci!
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_06"); //Vyslov tu formuli a obnov d¯ÌvÏjöÌ sÌlu meËe. Budeö ji pot¯ebovat!

	B_Story_LoadSword();
};

//---------------------------------------------------------------------
//	Info ALTRUNE 
//---------------------------------------------------------------------
instance  Info_Xardas_ALTRUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_ALTRUNE_Condition;
	information		= Info_Xardas_ALTRUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Protoûe jsem m·g, bude pro mÏ tÏûkÈ vl·dnout URIZIELEM!";
};

FUNC int  Info_Xardas_ALTRUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_FORMULA)
	&&	((Npc_GetTrueGuild(hero) == GIL_KDW) || (Npc_GetTrueGuild(hero) == GIL_DMB))
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_ALTRUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_ALTRUNE_15_01"); //Protoûe jsem m·g, bude pro mÏ tÏûkÈ vl·dnout URIZIELEM!
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_02"); //Je tu jedno ¯eöenÌ...
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_03"); //Nejd¯Ìv ale musÌö obnovit d¯ÌvÏjöÌ sÌlu ost¯Ì! Pak se vraù!
};


//---------------------------------------------------------------------
//	Info SWORDLOADED
//---------------------------------------------------------------------
instance  Info_Xardas_SWORDLOADED (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_SWORDLOADED_Condition;
	information		= Info_Xardas_SWORDLOADED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Obnovil jsem sÌlu URIZIELA!"; 
};

FUNC int  Info_Xardas_SWORDLOADED_Condition()
{	
	if  Npc_HasItems(hero,Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_SWORDLOADED_Info()
{
	AI_Output		(other, self,"Info_Xardas_SWORDLOADED_15_01"); //Obnovil jsem sÌlu URIZIELA!
	AI_Output		(self, other,"Info_Xardas_SWORDLOADED_14_02"); //To je neuvÏ¯itelnÈ, meË znovu zÌskal svou p˘vodnÌ sÌlu. TeÔ m·ö opravdu mocnou zbraÚ!

	Wld_InsertItem			(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");	//Unblutige Lˆsung f¸r¥s Ich-brauch-Orc-Statue-Massaker ***Bjˆrn***

};

//---------------------------------------------------------------------
//	Info MAKERUNE
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNE (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNE_Condition;
	information		= Info_Xardas_MAKERUNE_Info;
	important		= 0;
	permanent		= 0;
	description		= "ÿÌkal jsi, ûe existuje nÏjak˝ zp˘sob, jak bych mohl URIZIEL ovl·dat, p¯estoûe jsem m·g?"; 
};

FUNC int  Info_Xardas_MAKERUNE_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_ALTRUNE)
	&&	Npc_KnowsInfo(hero, Info_Xardas_SWORDLOADED)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNE_Info()
{
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_01"); //ÿÌkal jsi, ûe existuje nÏjak˝ zp˘sob, jak bych mohl URIZIEL ovl·dat, p¯estoûe jsem m·g?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_02"); //PodÌvej se na URIZIEL zblÌzka. Vöimneö si modrÈho drahokamu v Ëepeli.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_03"); //V nÏm je obsaûena magick· sÌla ost¯Ì.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_04"); //Kdyû ten drahokam odstranÌm, budu moci vytvo¯it kouzelnou runu, kter· bude obsahovat atributy samotnÈho URIZIELA.
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_05"); //Magick· runa vytvo¯en· z URIZIELA?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_06"); //V boji bude ta runa stejnÏ siln· jako meË!
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_07"); //NezapomeÚ ale, ûe jedinÏ nÏkter˝ m·g äestÈho kruhu je schopen ovl·dat takhle mocnou runu!
};

//---------------------------------------------------------------------
//	Info MAKERUNEDOIT
//---------------------------------------------------------------------
instance  Info_Xardas_MAKERUNEDOIT (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_MAKERUNEDOIT_Condition;
	information		= Info_Xardas_MAKERUNEDOIT_Info;
	important		= 0;
	permanent		= 1;
	description		= "OdstraÚ z URIZIELA ten drahokam!"; 
};

FUNC int  Info_Xardas_MAKERUNEDOIT_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Xardas_MAKERUNE)
	&&	Npc_HasItems (hero,	Mythrilklinge02)
	{			
		return TRUE;	
	}; 
};

FUNC void  Info_Xardas_MAKERUNEDOIT_Info()
{
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_01"); //OdstraÚ z URIZIELA ten drahokam!
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
		AI_Output		(self, other,"Info_Xardas_MAKERUNEDOIT_14_02"); //Nejsi ale jeötÏ pod velenÌm äestÈho magickÈho kruhu!
	};
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_03"); //Tohle rozhodnutÌ je koneËnÈ. Opravdu chceö, abych ten drahokam odstranil?

	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"ANO, udÏlej to!",	Info_Xardas_MAKERUNE_YES);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"NE, nedÏlej to!",	Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_04"); //ANO, udÏlej to!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Jestli to opravdu chceö... Tady je pr·zdn˝ meË a runa!

	Npc_RemoveInvItem 	(hero, Mythrilklinge02);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items ¸bergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, Mythrilklinge03);
	B_LogEntry			(CH5_Uriziel,"Xardas odstranil z URIZIELU kouzeln˝ k·men. SÌla tÈto Ëepele spoËÌv· v kouzelnÈ runÏ nevÌdanÈ moci.");
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_SUCCESS);
};	

func void Info_Xardas_MAKERUNE_NO ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_06"); //NE, nedÏlej to!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_07"); //Jak si p¯ejeö. Ost¯Ì si zachov· magickou moc!
};	
	

//---------------------------------------------------------------------
//	Info LOADSWORD9 --> SC kann DMB werden
//---------------------------------------------------------------------
instance  Info_Xardas_LOADSWORD09 (C_INFO)
{
	npc				= Kdf_404_Xardas;
	condition		= Info_Xardas_LOADSWORD09_Condition;
	information		= Info_Xardas_LOADSWORD09_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_6, LPCOST_TALENT_MAGE_6,0); 
};

FUNC int  Info_Xardas_LOADSWORD09_Condition()
{	
	if (EnteredTemple)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{			
		return TRUE;
	};	
};
func void  Info_Xardas_LOADSWORD09_Info()
{
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//M˘ûeö mÏ uËit?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //P¯ivedu tÏ k äestÈmu kruhu magie.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //UvÏdom si, ûe jen ti nejmocnÏjöÌ m·govÈ se mohou p¯idat k äestÈmu kruhu. Je vyhrazen pro ty, jejichû ûivoty jsou znamenÌmi.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //TvÈ znamenÌ je sjednocenÌ ûivl˘.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //äest˝ kruh ti umoûnÌ vyuûÌt jakoukoliv runu.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //A nezapomeÚ: neuplatÚuj moc, ale sluû jÌ.
			
			CreateInvItem 		(hero, DMB_ARMOR_M);		// SN: kann nicht mit B_GiveInvItem() ¸bergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor	(hero);

			//Fakeitem f¸r Bildschirmausgabe
			CreateInvItem		(self,			ItAmArrow);
			B_GiveInvItems		(self, hero,	ItAmArrow, 1);
			Npc_RemoveInvItem	(hero,			ItAmArrow);

			hero.guild 	= GIL_DMB;	
			Npc_SetTrueGuild	( hero, GIL_DMB );	
			Info_Xardas_LOADSWORD09.permanent = 0;
			AI_StopProcessInfos	( self );
		};
	}
	else 
	{
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//JeötÏ ne. Uû jsi zbÏhl˝, ale nem·ö jeötÏ dost vÏdomostÌ. Aù tÏ nejd¯Ìve cviËÌ Saturas, j· ti d·m pokyny pozdÏji.
		
		AI_StopProcessInfos	( self );
	};
};

	
