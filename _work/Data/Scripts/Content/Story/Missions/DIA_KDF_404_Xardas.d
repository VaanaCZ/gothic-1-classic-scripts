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
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_01"); //KDO SI DOVOLUJE MĚ RUŠIT PŘI STUDIÍCH?
	AI_Output 		(hero, self,"Info_Xardas_DISTURB_15_02"); //Jmenuju se...
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_03"); //Nezajímá mě, jak se jmenuješ. Je to nedůležité.
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_04"); //Důležité je jen to, že jsi za ta léta první člověk, který rozřešil hádanku mých Golemů.
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
	description = "Byli tu ještě jiní návštěvníci?";
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
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_01"); //Byli tu ještě jiní návštěvníci?
	AI_Output 		(self, hero,"Info_Xardas_OTHERS_14_02"); //Ne moc, ale jakmile mě začali obtěžovat, nechal jsem je konfrontovat s jednou z mých nadpřirozených příšer.
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_03"); //Ty jsi nerad vyrušován, viď?
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
	description = "Poslal mě Saturas. Potřebujeme tvoji pomoc!";
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
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_01"); //Poslal mě Saturas. Potřebujeme tvojí pomoc!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_02"); //Mágové Vody se chystají použít svojí velkou rudnou haldu...
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_03"); //Rudná halda NENÍ správné řešení!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_04"); //Není?
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
	description = "Všichni mágové Ohně jsou mrtví!";
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
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_01"); //Všichni mágové Ohně jsou mrtví!
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_02"); //Gomez je povraždil.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_03"); //To mě nepřekvapuje. Těm bláznivým barbarům na hradě, hlavně Gomezovi, nikdy není co věřit.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_04"); //Corristo a další mágové si sami zvolili šibenici, když pomáhali Gomezovi převzít moc.
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
	description = "O tom takzvaném 'Spáčovi' se říká, že je to zlý arcidémon.";
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
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_01"); //O tom takzvaném 'Spáčovi' se říká, že je to zlý arcidémon.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_02"); //Toho si vytvořilo Bratrstvo z bažin.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_03"); //Teď mágové Vody věří tomu, že jsou všichni v kolonii ve velkém nebezpečí.
	AI_Output 		(self, hero,"Info_Xardas_SLEEPER_14_04"); //Je to větší nebezpečí, než si kdokoliv uvnitř Bariéry dokáže představit. 
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
	description = "Pokud exploze rudné haldy toto velké nebezpečí neodvrátí...";
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
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_01"); //Pokud exploze rudné haldy toto velké nebezpečí neodvrátí...
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_02"); //...Zapomeň na rudnou haldu! Její síla Bariéru neotevře.
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_03"); //Kdyby Corristo a Saturas neplýtvali v minulých letech časem na bláznivé a zbytečné záležitosti, pak by všichni věděli, co já vím.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_04"); //A co?
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_05"); //Žádný z dvanácti mágů se od té doby nepřestal ptát, proč se jim vytvoření Bariéry vymklo z rukou a proč nabyla tak obrovských rozměrů.
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
	description = "Přišel jsi na to, proč se to stalo?";
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
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_01"); //Přišel jsi na to, proč se to stalo? 
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_02"); //Dobrá, jedno je jisté: odpověď leží hluboko pod městem skřetů.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_03"); //Pod městem skřetů?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_04"); //Skřeti nejsou zvířata, jak si mnozí myslí. Jejich kultura je tak stará jako lidská.
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_05"); //Před několika stoletími vyvolalo pět skřetích šamanů velmi starého arcidémona, protože doufali, že dá jejich klanu sílu, se kterou by porazili své nepřátele.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_06"); //Ten arcidémon, to byl Spáč?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_07"); //Skřeti mu tohle jméno dali až mnohem později. Nemůžu ale říci, proč mu ho dali, ani proč se teď té nadpřirozené bytosti děsí!
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
	description = "Proč ne?";
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
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_01"); //Proč ne?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_02"); //Věřím, že ty bys mohl... NE, jsem si jist, ty budeš muset vykonat jiný úkol!
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_03"); //Jaký?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_04"); //Pozorně poslouchej: Skřeti vyhostili z toho města jednoho šamana.
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
	description = "Proč ho vyhostili?";
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
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHY_15_01"); //Proč ho vyhostili?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHY_14_02"); //Umírající skřetí bojovník při výslechu jedním mým démonem nebyl schopen dlouho odpovídat na otázky.
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
	description = "Co má ten skřetí šaman společného s mým úkolem?";
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
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_01"); //Co má ten skřetí šaman společného s mým úkolem?
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_02"); //Řekne ti zbytek toho příběhu o Spáčovi.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_03"); //Nějaký skřetí šaman bude asi sotva ochotný se mnou mluvit!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_04"); //Chceš, abych ti pomohl nebo ne?
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_05"); //Ano, chci, ale...
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_06"); //Pak už žádné otázky!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_07"); //Najdi toho šamana. Není už dlouhou dobu se svými bratry ve skřetím městě zadobře, takže tě možná vyslechne ještě předtím, než tě promění v živou pochodeň!
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_08"); //Pěkná představa!
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
	description = "Kde je ten vyhoštěný šaman?";
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
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_01"); //Kde je ten vyhoštěný šaman?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_02"); //Jdi na východ ke staré citadele. Nemůžeš ji minout, je na vrcholu hory, kterou uvidíš už z dálky.
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_03"); //Jak se dostanu dovnitř?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_04"); //Říkají jí stará citadela, ale zbylo z ní sotva víc než základové zdi. Je to už po mnoho desetiletí zřícenina.
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
	description = "Dostanu od toho šamana odpovědi!";
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
	AI_Output 		(hero, self,"Info_Xardas_ACCEPT_15_01"); //Dostanu od toho šamana odpovědi!
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_02"); //Můj služebník ti už připravil teleportační runu na pentagram na podlaze.
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_03"); //To ti usnadní pozdější návrat zpět.

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
	description		= "Hledám magické vědění."; 
	
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
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Hledám magické vědění.
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
	description = "Mám odpovědi od skřetího šamana!";
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
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_01"); //Mám odpovědi od skřetího šamana!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_02"); //Výborně, tak povídej!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_03"); //Pět skřetích šamanů vyvolalo Spáče, kterého vytvořili v podzemním chrámu, do kterého je vstup v skřetím městě.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_04"); //To je pravda!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_05"); //Protože byl nevděčný, zaklel jejich srdce a odsoudil je k věčnému bytí jako nesmrtelné stvůry!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_06"); //Velmi dobře, velmi dobře!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_07"); //Skřeti zavřeli chrám a začali přinášet oběti, aby toho démona usmířili!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_08"); //Našel jsi cestu ke vchodu do toho chrámu?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_09"); //Ano, je jeden skřet, který...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_10"); //Bez těch podrobností! Jdi do podzemního chrámu! Tam najdeš způsob jak zničit Bariéru!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_11"); //Nerozumím!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_12"); //Nechtěl jsi snad po mně, abych ti pomáhal s odstraněním Bariéry?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_13"); //To je pravda, ale...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_14"); //PAK TEDY BĚŽ. Už se promrhalo spoustu času! Jdi do podzemního chrámu a najdi tam odpověď!

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
	description		= "Našel jsem cestu do podzemního chrámu!"; 
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
	AI_Output (other, self,"Info_Xardas_FOUNDTEMPLE_15_01"); //Našel jsem cestu do podzemního chrámu!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_02"); //NAŠEL... To je pozoruhodné!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_03"); //Stal ses velmi mocný! Silnější než kdokoliv jiný uvnitř Bariéry.
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_04"); //Možná jsi doopravdy ten muž ze skřetího proroctví!
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
	description		= "Proroctví? Jaké proroctví?"; 
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
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_01"); //Proroctví? Jaké proroctví?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_02"); //Prastaré skřetí dokumenty napsané krátce před uzavřením podzemního chrámu se zmiňovaly o 'Svatém nepříteli'.
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_03"); //O Svatém nepříteli?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_04"); //Někdo, kdo provždy odstraní SPÁČE z našeho světa!
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_05"); //A já mám být tím, kdo byl v tom starém proroctví zmíněn??? Musíš se mýlit, určitě!
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_06"); //Možná... Možná ne!
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
	description		= "Našel jsem zvláštní meč."; 
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
	AI_Output				(other, self,"Info_Xardas_LOADSWORD_15_01"); //Našel jsem zvláštní meč.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_02"); //Ukaž mi ho.

	CreateInvItem 			(self, Mythrilklinge01);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);

	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_03"); //To je zajímavé... Je na něm napsáno 'URIZIEL'.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_04"); //Slyšel jsem o tom meči. Je to zbraň z dávných dob, kdy lidské plemeno bylo ještě mladé.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_05"); //Ta zbraň je ukována z neznámého materiálu. A nikde není napsáno, kdo ji vytvořil!
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_06"); //Jeho ostří je obdařeno neuvěřitelnou mocí, ale nevidím žádnou kouzelnou auru! 
	
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
	description		= "URIZIEL je obdařen neuvěřitelnou mocí?"; 
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

	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_01"); //URIZIEL je obdařen neuvěřitelnou mocí?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_02"); //Stojí psáno, že majitel té zbraně dokázal protnout i to nejsilnější brnění a překonat i to nejmocnější ochranné kouzlo.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_03"); //Jak se mohla skřetům tahle mocná zbraň dostat do rukou?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_04"); //Tvrdí se, že ji skřeti vzali jednomu mocnému válečníkovi. Nevěděli, jak ji používat, ale ukryli ji!
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_05"); //Neukryli ji ale dobře!
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
	description		= "Je možné obnovit bývalou moc této zbraně?"; 
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
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_01"); //Je možné obnovit bývalou moc této zbraně?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_02"); //Potřeboval bys k tomu velmi silný zdroj magické síly.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_03"); //Myslíš natolik silný, aby prorazil magickou Bariéru?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_04"); //Asi tak silný...
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_05"); //A kromě toho bys potřeboval zvláštní magickou formuli, která by tu sílu přetransformovala.
	AI_Output			(self, other,"Info_Xardas_LOADSWORD02_14_06"); //Dej mi trochu času a já tu magickou formuli vytvořím.

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
	description		= "Já se zatím podívám po nějaké lepší zbroji!"; 
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
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_01"); //Já se zatím podívám po nějaké lepší zbroji!

	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if (armorInstance == CRW_ARMOR_H)
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_02"); //Tahle zalátaná protičerví zbroj byla v podzemním chrámu mockrát proražena!
	}
	else if (armorInstance == KDW_ARMOR_H) || (armorInstance == KDW_ARMOR_L)		
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_03"); //Tyhle modré hadry by mě v podzemním chrámu sotva ochránily!
	}
	else
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_04"); //Ten nemrtvý zanechal v mé zbroji pořádné díry!
	};
	
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_05"); //Měl bys jít do mojí staré věže.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_06"); //Tvojí staré věže?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_07"); //Potopila se v jednom z východních jezer při jednom zemětřesení. Vrcholy jsou nad povrchem stále viditelné.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_08"); //Zůstalo v ní několik artefaktů. Nikdy jsem se nesnažil je dostat zpátky.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_09"); //Jak se tam dostanu?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_10"); //Od toho zemětřesení jsem tam nebyl, takže si k ní budeš muset najít cestu sám.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_11"); //Tady je klíč. Je od truhly, ve které jsem obvykle ukládal obzvlášť vzácné artefakty.

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
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_01"); //Aha! Vidím, že nosíš rudnou zbroj.
	}
	else
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_02"); //Jak vidím, našel jsi rudnou zbroj.
	};
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_03"); //Našel jsem ji v jedné z těch truhel v potopené věži.
	AI_Output		(self, other,"Info_Xardas_OREARMOR_14_04"); //Patřila generálovi, který v bitvě proti skřetům používal URIZIEL.
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_05"); //Doufám, že mi přinese víc štěstí než jemu!
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
	description		= "Máš hotovou tu formuli na obnovení síly URIZIELA?";
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
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_01"); //Máš hotovou tu formuli na obnovení síly URIZIELA?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_02"); //Je hotová. Nebudeš ji moci ale použít sám.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_03"); //Proč ne?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_04"); //Musí být vyslovena nějakým mágem, zatímco ty se budeš dotýkat mečem zdroje síly.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_05"); //Pak se budu muset porozhlédnout po nějaké pomoci!
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_06"); //Vyslov tu formuli a obnov dřívější sílu meče. Budeš ji potřebovat!

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
	description		= "Protože jsem mág, bude pro mě těžké vládnout URIZIELEM!";
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
	AI_Output		(other, self,"Info_Xardas_ALTRUNE_15_01"); //Protože jsem mág, bude pro mě těžké vládnout URIZIELEM!
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_02"); //Je tu jedno řešení...
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_03"); //Nejdřív ale musíš obnovit dřívější sílu ostří! Pak se vrať!
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
	description		= "Obnovil jsem sílu URIZIELA!"; 
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
	AI_Output		(other, self,"Info_Xardas_SWORDLOADED_15_01"); //Obnovil jsem sílu URIZIELA!
	AI_Output		(self, other,"Info_Xardas_SWORDLOADED_14_02"); //To je neuvěřitelné, meč znovu získal svou původní sílu. Teď máš opravdu mocnou zbraň!

	Wld_InsertItem			(ItArScrollTeleport4,"OW_ORC_SHAMAN_ROOM2");	//Unblutige Lösung für´s Ich-brauch-Orc-Statue-Massaker ***Björn***

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
	description		= "Říkal jsi, že existuje nějaký způsob, jak bych mohl URIZIEL ovládat, přestože jsem mág?"; 
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
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_01"); //Říkal jsi, že existuje nějaký způsob, jak bych mohl URIZIEL ovládat, přestože jsem mág?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_02"); //Podívej se na URIZIEL zblízka. Všimneš si modrého drahokamu v čepeli.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_03"); //V něm je obsažena magická síla ostří.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_04"); //Když ten drahokam odstraním, budu moci vytvořit kouzelnou runu, která bude obsahovat atributy samotného URIZIELA.
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_05"); //Magická runa vytvořená z URIZIELA?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_06"); //V boji bude ta runa stejně silná jako meč!
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_07"); //Nezapomeň ale, že jedině některý mág Šestého kruhu je schopen ovládat takhle mocnou runu!
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
	description		= "Odstraň z URIZIELA ten drahokam!"; 
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
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_01"); //Odstraň z URIZIELA ten drahokam!
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
		AI_Output		(self, other,"Info_Xardas_MAKERUNEDOIT_14_02"); //Nejsi ale ještě pod velením Šestého magického kruhu!
	};
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_03"); //Tohle rozhodnutí je konečné. Opravdu chceš, abych ten drahokam odstranil?

	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"ANO, udělej to!",	Info_Xardas_MAKERUNE_YES);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"NE, nedělej to!",	Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_04"); //ANO, udělej to!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Jestli to opravdu chceš... Tady je prázdný meč a runa!

	Npc_RemoveInvItem 	(hero, Mythrilklinge02);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items übergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, Mythrilklinge03);
	B_LogEntry			(CH5_Uriziel,"Xardas odstranil z URIZIELU kouzelný kámen. Síla této čepele spočívá v kouzelné runě nevídané moci.");
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_SUCCESS);
};	

func void Info_Xardas_MAKERUNE_NO ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_06"); //NE, nedělej to!
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_07"); //Jak si přeješ. Ostří si zachová magickou moc!
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
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//Můžeš mě učit?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //Přivedu tě k Šestému kruhu magie.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //Uvědom si, že jen ti nejmocnější mágové se mohou přidat k Šestému kruhu. Je vyhrazen pro ty, jejichž životy jsou znameními.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //Tvé znamení je sjednocení živlů.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //Šestý kruh ti umožní využít jakoukoliv runu.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //A nezapomeň: neuplatňuj moc, ale služ jí.
			
			CreateInvItem 		(hero, DMB_ARMOR_M);		// SN: kann nicht mit B_GiveInvItem() übergeben werden, da Xardas sonst nackt dasteht!
			AI_EquipBestArmor	(hero);

			//Fakeitem für Bildschirmausgabe
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
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//Ještě ne. Už jsi zběhlý, ale nemáš ještě dost vědomostí. Ať tě nejdříve cvičí Saturas, já ti dám pokyny později.
		
		AI_StopProcessInfos	( self );
	};
};

	
