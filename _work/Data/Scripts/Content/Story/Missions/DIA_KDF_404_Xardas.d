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
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_01"); //KTO ŒMIE PRZESZKADZAÆ MI W MOICH STUDIACH?
	AI_Output 		(hero, self,"Info_Xardas_DISTURB_15_02"); //Nazywam siê...
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_03"); //Nie interesuje mnie twoje imiê. To nieistotne.
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_04"); //Liczy siê tylko to, ¿e jesteœ pierwsz¹ osob¹ od wielu lat, której uda³o siê rozwi¹zaæ zagadkê Golemów.
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
	description = "Czy ktoœ jeszcze tu zagl¹da³?";
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
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_01"); //Czy ktoœ jeszcze tu zagl¹da³?
	AI_Output 		(self, hero,"Info_Xardas_OTHERS_14_02"); //Bardzo rzadko. Zwykle szybko zaczynali mnie irytowaæ i nasy³a³em na nich któr¹œ z moich magicznych istot.
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_03"); //Wolisz wieœæ ¿ywot samotnika, czy¿ nie?
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
	description = "Przysy³a mnie Saturas. Potrzebujemy twojej pomocy!";
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
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_01"); //Przysy³a mnie Saturas. Potrzebujemy twojej pomocy!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_02"); //Magowie Wody zamierzaj¹ zrobiæ u¿ytek ze swojego kopca rudy.
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_03"); //Detonacja wielkiej góry nie jest ¿adnym rozwi¹zaniem!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_04"); //Nie jest?
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_05"); //NIE!
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
	description = "Wszyscy Magowie Ognia zginêli!";
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
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_01"); //Wszyscy Magowie Ognia zginêli!
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_02"); //Gomez kaza³ ich zamordowaæ.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_03"); //Nie powiem, ¿ebym by³ szczególnie zaskoczony. Tym durnym barbarzyñcom z zamku - z Gomezem na czele - nigdy nie mo¿na by³o ufaæ.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_04"); //Pomagaj¹c Gomezowi w objêciu w³adzy, Corristo i inni sami kopali sobie grób.
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
	description = "Tak zwany 'Œni¹cy' okaza³ siê ponoæ potê¿nym demonem zag³ady.";
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
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_01"); //Tak zwany "Œni¹cy" okaza³ siê ponoæ potê¿nym demonem zag³ady.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_02"); //Przekona³o siê o tym Bractwo z obozu na bagnie.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_03"); //Magowie Wody uwa¿aj¹ teraz, ¿e ca³a kolonia znalaz³a siê w œmiertelnym niebezpieczeñstwie.
	AI_Output 		(self, hero,"Info_Xardas_SLEEPER_14_04"); //Stoimy przed powa¿niejszym zagro¿eniem ni¿ ktokolwiek wewn¹trz Bariery jest w stanie sobie wyobraziæ... 
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
	description = "Jeœli detonacja kopca rudy nie wystarczy, by za¿egnaæ niebezpieczeñstwo...";
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
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_01"); //Jeœli detonacja kopca rudy nie wystarczy, by za¿egnaæ niebezpieczeñstwo...
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_02"); //...Zapomnij o tym ca³ym kopcu! Jego potêga nie wystarczy, by prze³amaæ Barierê.
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_03"); //Gdyby Corristo i Saturas nie tracili cennego czasu na te swoje dziecinne spory, wiedzieliby teraz co nale¿y zrobiæ.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_04"); //A co twoim zdaniem nale¿y zrobiæ?
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_05"); //¯aden z dwunastu magów nie zada³ sobie trudu, by zbadaæ z jakich przyczyn Bariera wymknê³a siê spod kontroli, ani dlaczego przybra³a tak ogromne rozmiary.
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
	description = "A ty wiesz, co siê sta³o, tak?";
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
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_01"); //A ty wiesz, co siê sta³o, tak? 
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_02"); //Có¿, jedno jest pewne: odpowiedŸ spoczywa ukryta g³êboko pod miastem Orków.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_03"); //Miastem Orków?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_04"); //Orkowie to nie zwierzêta, choæ wielu ludzi tak w³aœnie myœli. Ich kultura dorównuje wiekiem naszej.
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_05"); //Wiele stuleci temu, piêciu orkowych szamanów przywo³a³o do tego œwiata potê¿nego demona, który mia³ im pomóc zdominowaæ pozosta³e klany.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_06"); //Ten demon... To Œni¹cy, prawda?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_07"); //Orkowie nadali mu to imiê du¿o póŸniej. Ale nie powiem ci dlaczego wybrali tê nazwê, ani dlaczego tak bardzo siê go teraz boj¹!
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
	description = "Dlaczego nie?";
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
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_01"); //Dlaczego nie?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_02"); //Myœlê, ¿e mo¿esz byæ... NIE, aby mnie przekonaæ, musisz wykonaæ jeszcze jedno zadanie!
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_03"); //Jakie zadanie?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_04"); //S³uchaj uwa¿nie: Orkowie wygnali z miasta jednego ze swoich szamanów.
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
	description = "Dlaczego?";
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
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHY_15_01"); //Dlaczego?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHY_14_02"); //Umieraj¹cy Ork, którego kaza³em przes³uchaæ moim demonom, nie by³ w stanie odpowiedzieæ mi na to pytanie.
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
	description = "Co ten szaman ma wspólnego z moim zadaniem?";
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
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_01"); //Co ten szaman ma wspólnego z moim zadaniem?
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_02"); //On opowie ci resztê historii zwi¹zanej ze Œni¹cym.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_03"); //Obawiam siê, ¿e Ork nie bêdzie zbyt chêtny do zwierzeñ w mojej obecnoœci!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_04"); //Chcesz ¿ebym ci pomóg³, czy nie?
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_05"); //Tak, ale...
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_06"); //Wiêc nigdy wiêcej nie kwestionuj tego, co mówiê!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_07"); //ZnajdŸ tego szamana. Nie pa³a mi³oœci¹ do swych braci z miasta Orków, wiêc mo¿e zgodzi siê ciebie wys³uchaæ zanim zamieni ciê w ¿yw¹ pochodniê!
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_08"); //Bardzo pocieszaj¹ce!
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
	description = "Gdzie znajdê tego wygnanego szamana?";
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
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_01"); //Gdzie znajdê tego wygnanego szamana?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_02"); //IdŸ do starej cytadeli na wschodzie. Na pewno trafisz - znajduje siê na szczycie wysokiej góry. Widaæ j¹ ju¿ z daleka.
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_03"); //I mogê tak po prostu do niej wejœæ?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_04"); //Mówi¹ na ni¹ stara cytadela, choæ tak naprawdê to tylko sterta kamieni. Od wielu dziesiêcioleci nikt tam nie zagl¹da.
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
	description = "Porozmawiam z tym szamanem!";
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
	AI_Output 		(hero, self,"Info_Xardas_ACCEPT_15_01"); //Porozmawiam z tym szamanem!
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_02"); //Mój s³uga da³ ci ju¿ magiczn¹ runê uaktywniaj¹c¹ pentagram piêtro ni¿ej.
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_03"); //W ten sposób bêdziesz móg³ wróciæ do mnie natychmiast po wykonaniu zadania.

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
	description		= "Poszukujê wiedzy magicznej."; 
	
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
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Poszukujê wiedzy magicznej.
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
	description = "Rozmawia³em z szamanem Orków.";
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
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_01"); //Rozmawia³em z szamanem Orków.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_02"); //Œwietnie! Czego siê dowiedzia³eœ?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_03"); //Piêciu szamanów, którzy przywo³ali Œni¹cego, wybudowa³o dla niego podziemn¹ œwi¹tyniê. Wejœcie do niej znajduje siê w mieœcie Orków.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_04"); //Zgadza siê!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_05"); //Miast okazaæ wdziêcznoœæ, Œni¹cy wyrwa³ ich serca i skaza³ ich, oraz wszystkich, którzy pracowali przy budowie na wieczne potêpienie, zamieniaj¹c ich w O¿ywieñców!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_06"); //Doskonale, doskonale!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_07"); //Orkowie zapieczêtowali wejœcie do œwi¹tyni i próbowali przeb³agaæ demona sk³adaj¹c mu ofiary!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_08"); //Znalaz³eœ sposób na dostanie siê do œwi¹tyni?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_09"); //Tak, jest pewien Ork, który...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_10"); //¯adnych szczegó³ów! Udaj siê do podziemnej œwi¹tyni. Tam znajdziesz jedyny sposób na zniszczenie Bariery!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_11"); //Nic nie rozumiem!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_12"); //Poprosi³eœ mnie o pomoc w zniszczeniu Bariery, tak czy nie?!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_13"); //Tak, ale...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_14"); //WIÊC ID! Zmarnowano ju¿ doœæ czasu! IdŸ do podziemnej œwi¹tyni! Tam znajdziesz odpowiedŸ!

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
	description		= "Znalaz³em drogê do podziemnej œwi¹tyni!"; 
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
	AI_Output (other, self,"Info_Xardas_FOUNDTEMPLE_15_01"); //Znalaz³em drogê do podziemnej œwi¹tyni!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_02"); //ZNALAZ£EŒ... To niesamowite!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_03"); //Sta³eœ siê niezwykle potê¿ny! Potê¿niejszy ni¿ ktokolwiek wewn¹trz Bariery.
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_04"); //Mo¿e rzeczywiœcie jesteœ cz³owiekiem, o którym wspomina proroctwo Orków!
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
	description		= "Proroctwo? Jakie proroctwo?"; 
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
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_01"); //Proroctwo? Jakie proroctwo?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_02"); //Prastare manuskrypty Orków, spisane tu¿ po zamkniêciu œwi¹tyni, wspominaj¹ o "Œwiêtym Nieprzyjacielu".
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_03"); //Œwiêtym Nieprzyjacielu?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_04"); //Kogoœ, kto raz na zawsze wypêdzi Œni¹cego z naszego œwiata!
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_05"); //I to ja mam byæ t¹ osob¹ z przepowiedni?! Mylisz siê! Na pewno siê mylisz!
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_06"); //Mo¿e tak... Mo¿e nie!
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
	description		= "Znalaz³em dziwny miecz."; 
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
	AI_Output				(other, self,"Info_Xardas_LOADSWORD_15_01"); //Znalaz³em dziwny miecz.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_02"); //Poka¿ mi go.

	CreateInvItem 			(self, Mythrilklinge01);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);

	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_03"); //Hmm... To ciekawe. Wyryto na nim s³owo "URIZIEL".
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_04"); //S³ysza³em o tym mieczu. To orê¿ z dawnych lat, kiedy rasa ludzka by³a jeszcze bardzo m³oda.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_05"); //Nie wiem z jakiego materia³u go wykuto, ani nawet KTO go wyku³.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_06"); //Wed³ug legendy, miecz ma posiadaæ niezwyk³e moce, ale nie wyczuwam wokó³ niego magicznej aury! 
	
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
	description		= "URIZIEL posiada³ niezwyk³e moce?"; 
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

	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_01"); //URIZIEL posiada³ niezwyk³e moce?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_02"); //Napisano, ¿e posiadacz tej broni by³ w stanie przebiæ najgrubszy pancerz i przezwyciê¿yæ najsilniejsze zaklêcia.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_03"); //W jaki sposób tak potê¿ny orê¿ trafi³ w rêce Orków?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_04"); //Ponoæ Orkowie odebrali go potê¿nemu rycerzowi. Nie wiedzieli jak go wykorzystaæ, wiêc postanowili go ukryæ!
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_05"); //Jak widaæ - nie doœæ dobrze!
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
	description		= "Czy jest jakiœ sposób na przywrócenie tej broni dawnej œwietnoœci?"; 
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
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_01"); //Czy jest jakiœ sposób na przywrócenie tej broni dawnej œwietnoœci?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_02"); //Nie obejdzie siê bez odpowiednio silnego Ÿród³a magii.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_03"); //Masz na myœli Ÿród³o wystarczaj¹co potê¿ne, by wysadziæ w powietrze Magiczn¹ Barierê?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_04"); //Coœ w tym rodzaju...
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_05"); //Oprócz tego potrzebna bêdzie specjalna magiczna formu³a, która przeka¿e ca³¹ wyzwolon¹ energiê na miecz.
	AI_Output			(self, other,"Info_Xardas_LOADSWORD02_14_06"); //Daj mi trochê czasu na przygotowanie formu³y!

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
	description		= "W miêdzyczasie, ja poszukam sobie lepszej zbroi!"; 
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
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_01"); //W miêdzyczasie, jak poszukam sobie lepszej zbroi!

	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if (armorInstance == CRW_ARMOR_H)
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_02"); //Te posklecane w naprêdce pancerze pe³zaczy s¹ zbyt gêsto podziurawione po wyprawie do podziemnej œwi¹tyni!
	}
	else if (armorInstance == KDW_ARMOR_H) || (armorInstance == KDW_ARMOR_L)		
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_03"); //Te niebieskie szmatki nie zapewni³y mi zbyt wielkiej ochrony w podziemnej œwi¹tyni!
	}
	else
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_04"); //O¿ywieñcy porz¹dnie podziurawili mój stary pancerz.
	};
	
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_05"); //Powinieneœ zajrzeæ do mojej starej wie¿y?
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_06"); //Twojej starej wie¿y?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_07"); //Podczas trzêsienia ziemi poch³onê³o j¹ jedno ze wschodnich jezior. Jej szczyt powinien nadal wystawaæ nad poziom wody.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_08"); //Wewn¹trz zosta³o kilka cennych artefaktów. Nigdy nie zada³em sobie trudu, by je odzyskaæ.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_09"); //Jak siê tam dostanê?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_10"); //Nie zagl¹da³em tam od trzêsienia ziemi, wiêc sam bêdziesz musia³ poszukaæ drogi do œrodka.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_11"); //WeŸ ten klucz. Otwiera skrzyniê, w której przechowywa³em szczególnie cenne artefakty.

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
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_01"); //Ach, jak widzê nosisz zbrojê runiczn¹, wykonan¹ z magicznej rudy!
	}
	else
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_02"); //Jak widzê, znalaz³eœ zbrojê runiczn¹, wykonan¹ z magicznej rudy!
	};
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_03"); //Znalaz³em j¹ w zatopionej wie¿y, w jednej z tych starych skrzyñ.
	AI_Output		(self, other,"Info_Xardas_OREARMOR_14_04"); //Nale¿a³a kiedyœ do tego samego genera³a, który dzier¿y³ URIZIEL w bitwie z Orkami.
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_05"); //Mam tylko nadziejê, ¿e przyniesie mi trochê wiêcej szczêœcia ni¿ jemu!
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
	description		= "Przygotowa³eœ ju¿ formu³ê, która przywróci URIZIELOWI jego dawn¹ moc?";
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
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_01"); //Przygotowa³eœ ju¿ formu³ê, która przywróci URIZIELOWI jego dawn¹ moc?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_02"); //Tak, wszystko gotowe. Ale sam nie dasz rady jej u¿yæ.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_03"); //Dlaczego nie?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_04"); //Bêdziesz musia³ dotkn¹æ mieczem Ÿród³a mocy magicznej. Dok³adnie w tej samej chwili jakiœ mag musi wypowiedzieæ formu³ê.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_05"); //Zatem muszê sobie poszukaæ kogoœ do pomocy!
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_06"); //WeŸ formu³ê i przywróæ URIZIEL do jego dawnej œwietnoœci. Bêdzie ci wkrótce potrzebny!

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
	description		= "Jestem magiem. Nie wiem, czy potrafiê pos³ugiwaæ siê URIZIELEM!";
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
	AI_Output		(other, self,"Info_Xardas_ALTRUNE_15_01"); //Jestem magiem. Nie wiem, czy potrafiê pos³ugiwaæ siê mieczem takim jak URIZIEL!
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_02"); //Jest na to sposób...
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_03"); //Ale najpierw na³aduj miecz magiczn¹ energi¹. Wróæ jak najszybciej!
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
	description		= "Uda³o mi siê! URIZIEL znów posiada magiczn¹ aurê!"; 
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
	AI_Output		(other, self,"Info_Xardas_SWORDLOADED_15_01"); //Uda³o mi siê! URIZIEL znów posiada magiczn¹ aurê!
	AI_Output		(self, other,"Info_Xardas_SWORDLOADED_14_02"); //Niesamowite! Miecz odzyska³ sw¹ dawn¹ moc! Dysponujesz teraz nie lada orê¿em!

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
	description		= "Bêdê móg³ pos³ugiwaæ siê tym mieczem mimo, i¿ jestem magiem?"; 
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
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_01"); //Powiedzia³eœ, ¿e bêdê móg³ pos³ugiwaæ siê tym mieczem mimo, i¿ jestem magiem?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_02"); //Przyjrzyj siê mu uwa¿nie. Zauwa¿y³eœ zapewne ten du¿y, b³êkitny klejnot zatopiony w ostrzu.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_03"); //Ca³a energia magiczna miecza skumulowana jest w³aœnie tutaj.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_04"); //Jeœli usunê klejnot, bêdê móg³ stworzyæ magiczn¹ runê posiadaj¹c¹ wszystkie te cechy, które czyni¹ URIZIEL tak szczególnym orê¿em.
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_05"); //Magiczna runa stworzona z URIZIEL?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_06"); //W bitwie ta runa bêdzie równie niebezpieczna co sam miecz!
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_07"); //Ale nie zapominaj, ¿e jedynie mag Szóstego Krêgu mo¿e zapanowaæ nad tak potê¿n¹ magi¹!
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
	description		= "Chcê, ¿ebyœ usun¹³ klejnot z URIZIELA!"; 
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
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_01"); //Chcê, ¿ebyœ usun¹³ klejnot z URIZIEL!
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
		AI_Output		(self, other,"Info_Xardas_MAKERUNEDOIT_14_02"); //Ale nie opanowa³eœ jeszcze magii Szóstego Krêgu!
	};
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_03"); //Od tej decyzji nie ma odwrotu. Jesteœ pewien, ¿e chcesz abym usun¹³ klejnot?

	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"TAK, zrób to.",	Info_Xardas_MAKERUNE_YES);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"Nie, nie chcê.",	Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_04"); //TAK, zrób to.
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Jeœli tego w³aœnie chcesz... Proszê, oto miecz i runa!

	Npc_RemoveInvItem 	(hero, Mythrilklinge02);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items übergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, Mythrilklinge03);
	B_LogEntry			(CH5_Uriziel,"Xardas usun¹³ magiczny kryszta³ z Uriziela. Magiczna moc tego miecza spoczywa teraz w magicznej runie.");
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_SUCCESS);
};	

func void Info_Xardas_MAKERUNE_NO ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_06"); //Nie, nie chcê.
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_07"); //Jak sobie ¿yczysz. Ostrze zachowa sw¹ magiczn¹ moc!
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
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//Mo¿esz mnie czegoœ nauczyæ?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //Wprowadzê ciê w Szósty Kr¹g Magii.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //Pamiêtaj, ¿e to przywilej zarezerwowany wy³¹cznie dla najbieglejszych magów. Mog¹ do niego przyst¹piæ ci, których ca³e ¿ycie jest znakiem.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //Twoim znakiem jest zjednoczenie elementów.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //Szósty Kr¹g pozwala ci wykorzystywaæ magiê dowolnej runy.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //I nie zapomnij: twoim zadaniem jest s³u¿yæ potêdze magii, a nie j¹ wykorzystywaæ.
			
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
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//Jeszcze nie. Jesteœ zdolny, ale brak ci niezbêdnego doœwiadczenia. Niech Saturas popracuje nad tob¹ przez jakiœ czas. Wtedy zobaczymy.
		
		AI_StopProcessInfos	( self );
	};
};

	
