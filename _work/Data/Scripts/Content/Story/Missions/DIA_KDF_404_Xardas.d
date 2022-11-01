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
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_01"); //KTO ŚMIE PRZESZKADZAĆ MI W MOICH STUDIACH?
	AI_Output 		(hero, self,"Info_Xardas_DISTURB_15_02"); //Nazywam się...
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_03"); //Nie interesuje mnie twoje imię. To nieistotne.
	AI_Output 		(self, hero,"Info_Xardas_DISTURB_14_04"); //Liczy się tylko to, że jesteś pierwszą osobą od wielu lat, której udało się rozwiązać zagadkę Golemów.
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
	description = "Czy ktoś jeszcze tu zaglądał?";
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
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_01"); //Czy ktoś jeszcze tu zaglądał?
	AI_Output 		(self, hero,"Info_Xardas_OTHERS_14_02"); //Bardzo rzadko. Zwykle szybko zaczynali mnie irytować i nasyłałem na nich którąś z moich magicznych istot.
	AI_Output 		(hero, self,"Info_Xardas_OTHERS_15_03"); //Wolisz wieść żywot samotnika, czyż nie?
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
	description = "Przysyła mnie Saturas. Potrzebujemy twojej pomocy!";
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
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_01"); //Przysyła mnie Saturas. Potrzebujemy twojej pomocy!
	AI_Output 		(hero, self,"Info_Xardas_SATURAS_15_02"); //Magowie Wody zamierzają zrobić użytek ze swojego kopca rudy.
	AI_Output 		(self, hero,"Info_Xardas_SATURAS_14_03"); //Detonacja wielkiej góry nie jest żadnym rozwiązaniem!
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
	description = "Wszyscy Magowie Ognia zginęli!";
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
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_01"); //Wszyscy Magowie Ognia zginęli!
	AI_Output 		(hero, self,"Info_Xardas_KDW_15_02"); //Gomez kazał ich zamordować.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_03"); //Nie powiem, żebym był szczególnie zaskoczony. Tym durnym barbarzyńcom z zamku - z Gomezem na czele - nigdy nie można było ufać.
	AI_Output 		(self, hero,"Info_Xardas_KDW_14_04"); //Pomagając Gomezowi w objęciu władzy, Corristo i inni sami kopali sobie grób.
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
	description = "Tak zwany 'Śniący' okazał się ponoć potężnym demonem zagłady.";
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
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_01"); //Tak zwany "Śniący" okazał się ponoć potężnym demonem zagłady.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_02"); //Przekonało się o tym Bractwo z obozu na bagnie.
	AI_Output 		(hero, self,"Info_Xardas_SLEEPER_15_03"); //Magowie Wody uważają teraz, że cała kolonia znalazła się w śmiertelnym niebezpieczeństwie.
	AI_Output 		(self, hero,"Info_Xardas_SLEEPER_14_04"); //Stoimy przed poważniejszym zagrożeniem niż ktokolwiek wewnątrz Bariery jest w stanie sobie wyobrazić... 
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
	description = "Jeśli detonacja kopca rudy nie wystarczy, by zażegnać niebezpieczeństwo...";
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
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_01"); //Jeśli detonacja kopca rudy nie wystarczy, by zażegnać niebezpieczeństwo...
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_02"); //...Zapomnij o tym całym kopcu! Jego potęga nie wystarczy, by przełamać Barierę.
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_03"); //Gdyby Corristo i Saturas nie tracili cennego czasu na te swoje dziecinne spory, wiedzieliby teraz co należy zrobić.
	AI_Output 		(hero, self,"Info_Xardas_DANGER_15_04"); //A co twoim zdaniem należy zrobić?
	AI_Output 		(self, hero,"Info_Xardas_DANGER_14_05"); //Żaden z dwunastu magów nie zadał sobie trudu, by zbadać z jakich przyczyn Bariera wymknęła się spod kontroli, ani dlaczego przybrała tak ogromne rozmiary.
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
	description = "A ty wiesz, co się stało, tak?";
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
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_01"); //A ty wiesz, co się stało, tak? 
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_02"); //Cóż, jedno jest pewne: odpowiedź spoczywa ukryta głęboko pod miastem Orków.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_03"); //Miastem Orków?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_04"); //Orkowie to nie zwierzęta, choć wielu ludzi tak właśnie myśli. Ich kultura dorównuje wiekiem naszej.
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_05"); //Wiele stuleci temu, pięciu orkowych szamanów przywołało do tego świata potężnego demona, który miał im pomóc zdominować pozostałe klany.
	AI_Output 		(hero, self,"Info_Xardas_BARRIER_15_06"); //Ten demon... To Śniący, prawda?
	AI_Output 		(self, hero,"Info_Xardas_BARRIER_14_07"); //Orkowie nadali mu to imię dużo później. Ale nie powiem ci dlaczego wybrali tę nazwę, ani dlaczego tak bardzo się go teraz boją!
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
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_02"); //Myślę, że możesz być... NIE, aby mnie przekonać, musisz wykonać jeszcze jedno zadanie!
	AI_Output 		(hero, self,"Info_Xardas_EVENT_15_03"); //Jakie zadanie?
	AI_Output 		(self, hero,"Info_Xardas_EVENT_14_04"); //Słuchaj uważnie: Orkowie wygnali z miasta jednego ze swoich szamanów.
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
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHY_14_02"); //Umierający Ork, którego kazałem przesłuchać moim demonom, nie był w stanie odpowiedzieć mi na to pytanie.
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
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_02"); //On opowie ci resztę historii związanej ze Śniącym.
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_03"); //Obawiam się, że Ork nie będzie zbyt chętny do zwierzeń w mojej obecności!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_04"); //Chcesz żebym ci pomógł, czy nie?
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_05"); //Tak, ale...
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_06"); //Więc nigdy więcej nie kwestionuj tego, co mówię!
	AI_Output 		(self, hero,"Info_Xardas_EVENTHOW_14_07"); //Znajdź tego szamana. Nie pała miłością do swych braci z miasta Orków, więc może zgodzi się ciebie wysłuchać zanim zamieni cię w żywą pochodnię!
	AI_Output 		(hero, self,"Info_Xardas_EVENTHOW_15_08"); //Bardzo pocieszające!
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
	description = "Gdzie znajdę tego wygnanego szamana?";
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
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_01"); //Gdzie znajdę tego wygnanego szamana?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_02"); //Idź do starej cytadeli na wschodzie. Na pewno trafisz - znajduje się na szczycie wysokiej góry. Widać ją już z daleka.
	AI_Output 		(hero, self,"Info_Xardas_EVENTWHERE_15_03"); //I mogę tak po prostu do niej wejść?
	AI_Output 		(self, hero,"Info_Xardas_EVENTWHERE_14_04"); //Mówią na nią stara cytadela, choć tak naprawdę to tylko sterta kamieni. Od wielu dziesięcioleci nikt tam nie zagląda.
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
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_02"); //Mój sługa dał ci już magiczną runę uaktywniającą pentagram piętro niżej.
	AI_Output 		(self, hero,"Info_Xardas_ACCEPT_14_03"); //W ten sposób będziesz mógł wrócić do mnie natychmiast po wykonaniu zadania.

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
	description		= "Poszukuję wiedzy magicznej."; 
	
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
	AI_Output (other, self,"Kdf_404_Xardas_SELLMAGICSTUFF_Info_15_01"); //Poszukuję wiedzy magicznej.
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
	description = "Rozmawiałem z szamanem Orków.";
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
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_01"); //Rozmawiałem z szamanem Orków.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_02"); //Świetnie! Czego się dowiedziałeś?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_03"); //Pięciu szamanów, którzy przywołali Śniącego, wybudowało dla niego podziemną świątynię. Wejście do niej znajduje się w mieście Orków.
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_04"); //Zgadza się!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_05"); //Miast okazać wdzięczność, Śniący wyrwał ich serca i skazał ich, oraz wszystkich, którzy pracowali przy budowie na wieczne potępienie, zamieniając ich w Ożywieńców!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_06"); //Doskonale, doskonale!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_07"); //Orkowie zapieczętowali wejście do świątyni i próbowali przebłagać demona składając mu ofiary!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_08"); //Znalazłeś sposób na dostanie się do świątyni?
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_09"); //Tak, jest pewien Ork, który...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_10"); //Żadnych szczegółów! Udaj się do podziemnej świątyni. Tam znajdziesz jedyny sposób na zniszczenie Bariery!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_11"); //Nic nie rozumiem!
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_12"); //Poprosiłeś mnie o pomoc w zniszczeniu Bariery, tak czy nie?!
	AI_Output 		(hero, self,"Info_Xardas_RETURN_15_13"); //Tak, ale...
	AI_Output 		(self, hero,"Info_Xardas_RETURN_14_14"); //WIĘC IDŹ! Zmarnowano już dość czasu! Idź do podziemnej świątyni! Tam znajdziesz odpowiedź!

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
	description		= "Znalazłem drogę do podziemnej świątyni!"; 
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
	AI_Output (other, self,"Info_Xardas_FOUNDTEMPLE_15_01"); //Znalazłem drogę do podziemnej świątyni!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_02"); //ZNALAZŁEŚ... To niesamowite!
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_03"); //Stałeś się niezwykle potężny! Potężniejszy niż ktokolwiek wewnątrz Bariery.
	AI_Output (self, other,"Info_Xardas_FOUNDTEMPLE_14_04"); //Może rzeczywiście jesteś człowiekiem, o którym wspomina proroctwo Orków!
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
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_02"); //Prastare manuskrypty Orków, spisane tuż po zamknięciu świątyni, wspominają o "Świętym Nieprzyjacielu".
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_03"); //Świętym Nieprzyjacielu?
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_04"); //Kogoś, kto raz na zawsze wypędzi Śniącego z naszego świata!
	AI_Output (other, self,"Info_Xardas_PROPHECY_15_05"); //I to ja mam być tą osobą z przepowiedni?! Mylisz się! Na pewno się mylisz!
	AI_Output (self, other,"Info_Xardas_PROPHECY_14_06"); //Może tak... Może nie!
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
	description		= "Znalazłem dziwny miecz."; 
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
	AI_Output				(other, self,"Info_Xardas_LOADSWORD_15_01"); //Znalazłem dziwny miecz.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_02"); //Pokaż mi go.

	CreateInvItem 			(self, Mythrilklinge01);
	AI_EquipBestMeleeWeapon	(self);
	AI_ReadyMeleeWeapon		(self);
	AI_PlayAni				(self, "T_1HSINSPECT");
	AI_RemoveWeapon			(self);
	AI_UnequipWeapons		(self);

	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_03"); //Hmm... To ciekawe. Wyryto na nim słowo "URIZIEL".
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_04"); //Słyszałem o tym mieczu. To oręż z dawnych lat, kiedy rasa ludzka była jeszcze bardzo młoda.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_05"); //Nie wiem z jakiego materiału go wykuto, ani nawet KTO go wykuł.
	AI_Output				(self, other,"Info_Xardas_LOADSWORD_14_06"); //Według legendy, miecz ma posiadać niezwykłe moce, ale nie wyczuwam wokół niego magicznej aury! 
	
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
	description		= "URIZIEL posiadał niezwykłe moce?"; 
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

	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_01"); //URIZIEL posiadał niezwykłe moce?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_02"); //Napisano, że posiadacz tej broni był w stanie przebić najgrubszy pancerz i przezwyciężyć najsilniejsze zaklęcia.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_03"); //W jaki sposób tak potężny oręż trafił w ręce Orków?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD01_14_04"); //Ponoć Orkowie odebrali go potężnemu rycerzowi. Nie wiedzieli jak go wykorzystać, więc postanowili go ukryć!
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD01_15_05"); //Jak widać - nie dość dobrze!
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
	description		= "Czy jest jakiś sposób na przywrócenie tej broni dawnej świetności?"; 
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
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_01"); //Czy jest jakiś sposób na przywrócenie tej broni dawnej świetności?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_02"); //Nie obejdzie się bez odpowiednio silnego źródła magii.
	AI_Output 			(other, self,"Info_Xardas_LOADSWORD02_15_03"); //Masz na myśli źródło wystarczająco potężne, by wysadzić w powietrze Magiczną Barierę?
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_04"); //Coś w tym rodzaju...
	AI_Output 			(self, other,"Info_Xardas_LOADSWORD02_14_05"); //Oprócz tego potrzebna będzie specjalna magiczna formuła, która przekaże całą wyzwoloną energię na miecz.
	AI_Output			(self, other,"Info_Xardas_LOADSWORD02_14_06"); //Daj mi trochę czasu na przygotowanie formuły!

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
	description		= "W międzyczasie, ja poszukam sobie lepszej zbroi!"; 
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
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_01"); //W międzyczasie, jak poszukam sobie lepszej zbroi!

	var C_ITEM	armor;			armor 			= Npc_GetEquippedArmor	(hero);
	var int		armorInstance;	armorInstance	= Hlp_GetInstanceID		(armor);
	if (armorInstance == CRW_ARMOR_H)
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_02"); //Te posklecane w naprędce pancerze pełzaczy są zbyt gęsto podziurawione po wyprawie do podziemnej świątyni!
	}
	else if (armorInstance == KDW_ARMOR_H) || (armorInstance == KDW_ARMOR_L)		
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_03"); //Te niebieskie szmatki nie zapewniły mi zbyt wielkiej ochrony w podziemnej świątyni!
	}
	else
	{
		AI_Output	(other, self,"Info_Xardas_BETTERARMOR_15_04"); //Ożywieńcy porządnie podziurawili mój stary pancerz.
	};
	
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_05"); //Powinieneś zajrzeć do mojej starej wieży?
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_06"); //Twojej starej wieży?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_07"); //Podczas trzęsienia ziemi pochłonęło ją jedno ze wschodnich jezior. Jej szczyt powinien nadal wystawać nad poziom wody.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_08"); //Wewnątrz zostało kilka cennych artefaktów. Nigdy nie zadałem sobie trudu, by je odzyskać.
	AI_Output		(other, self,"Info_Xardas_BETTERARMOR_15_09"); //Jak się tam dostanę?
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_10"); //Nie zaglądałem tam od trzęsienia ziemi, więc sam będziesz musiał poszukać drogi do środka.
	AI_Output		(self, other,"Info_Xardas_BETTERARMOR_14_11"); //Weź ten klucz. Otwiera skrzynię, w której przechowywałem szczególnie cenne artefakty.

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
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_01"); //Ach, jak widzę nosisz zbroję runiczną, wykonaną z magicznej rudy!
	}
	else
	{
		AI_Output	(self, other,"Info_Xardas_OREARMOR_14_02"); //Jak widzę, znalazłeś zbroję runiczną, wykonaną z magicznej rudy!
	};
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_03"); //Znalazłem ją w zatopionej wieży, w jednej z tych starych skrzyń.
	AI_Output		(self, other,"Info_Xardas_OREARMOR_14_04"); //Należała kiedyś do tego samego generała, który dzierżył URIZIEL w bitwie z Orkami.
	AI_Output		(other, self,"Info_Xardas_OREARMOR_15_05"); //Mam tylko nadzieję, że przyniesie mi trochę więcej szczęścia niż jemu!
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
	description		= "Przygotowałeś już formułę, która przywróci URIZIELOWI jego dawną moc?";
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
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_01"); //Przygotowałeś już formułę, która przywróci URIZIELOWI jego dawną moc?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_02"); //Tak, wszystko gotowe. Ale sam nie dasz rady jej użyć.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_03"); //Dlaczego nie?
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_04"); //Będziesz musiał dotknąć mieczem źródła mocy magicznej. Dokładnie w tej samej chwili jakiś mag musi wypowiedzieć formułę.
	AI_Output		(other, self,"Info_Xardas_FORMULA_15_05"); //Zatem muszę sobie poszukać kogoś do pomocy!
	AI_Output		(self, other,"Info_Xardas_FORMULA_14_06"); //Weź formułę i przywróć URIZIEL do jego dawnej świetności. Będzie ci wkrótce potrzebny!

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
	description		= "Jestem magiem. Nie wiem, czy potrafię posługiwać się URIZIELEM!";
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
	AI_Output		(other, self,"Info_Xardas_ALTRUNE_15_01"); //Jestem magiem. Nie wiem, czy potrafię posługiwać się mieczem takim jak URIZIEL!
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_02"); //Jest na to sposób...
	AI_Output		(self, other,"Info_Xardas_ALTRUNE_14_03"); //Ale najpierw naładuj miecz magiczną energią. Wróć jak najszybciej!
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
	description		= "Udało mi się! URIZIEL znów posiada magiczną aurę!"; 
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
	AI_Output		(other, self,"Info_Xardas_SWORDLOADED_15_01"); //Udało mi się! URIZIEL znów posiada magiczną aurę!
	AI_Output		(self, other,"Info_Xardas_SWORDLOADED_14_02"); //Niesamowite! Miecz odzyskał swą dawną moc! Dysponujesz teraz nie lada orężem!

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
	description		= "Będę mógł posługiwać się tym mieczem mimo, iż jestem magiem?"; 
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
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_01"); //Powiedziałeś, że będę mógł posługiwać się tym mieczem mimo, iż jestem magiem?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_02"); //Przyjrzyj się mu uważnie. Zauważyłeś zapewne ten duży, błękitny klejnot zatopiony w ostrzu.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_03"); //Cała energia magiczna miecza skumulowana jest właśnie tutaj.
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_04"); //Jeśli usunę klejnot, będę mógł stworzyć magiczną runę posiadającą wszystkie te cechy, które czynią URIZIEL tak szczególnym orężem.
	AI_Output		(other, self,"Info_Xardas_MAKERUNE_15_05"); //Magiczna runa stworzona z URIZIEL?
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_06"); //W bitwie ta runa będzie równie niebezpieczna co sam miecz!
	AI_Output		(self, other,"Info_Xardas_MAKERUNE_14_07"); //Ale nie zapominaj, że jedynie mag Szóstego Kręgu może zapanować nad tak potężną magią!
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
	description		= "Chcę, żebyś usunął klejnot z URIZIELA!"; 
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
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_01"); //Chcę, żebyś usunął klejnot z URIZIEL!
	if (Npc_GetTalentSkill(hero, NPC_TALENT_MAGE) < 6)
	{
		AI_Output		(self, other,"Info_Xardas_MAKERUNEDOIT_14_02"); //Ale nie opanowałeś jeszcze magii Szóstego Kręgu!
	};
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_03"); //Od tej decyzji nie ma odwrotu. Jesteś pewien, że chcesz abym usunął klejnot?

	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"TAK, zrób to.",	Info_Xardas_MAKERUNE_YES);
	Info_AddChoice		(Info_Xardas_MAKERUNEDOIT,"Nie, nie chcę.",	Info_Xardas_MAKERUNE_NO);
};

func void Info_Xardas_MAKERUNE_YES ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_04"); //TAK, zrób to.
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_05"); //Jeśli tego właśnie chcesz... Proszę, oto miecz i runa!

	Npc_RemoveInvItem 	(hero, Mythrilklinge02);
	CreateInvItems 		(self, UrizielRune, 2);	
	B_GiveInvItems      (self, hero, UrizielRune, 2);// Wegen Ausgabe "2 Items übergeben", wird direkt angeglichen
	Npc_RemoveInvItem	(hero, UrizielRune);
	CreateInvItem		(hero, Mythrilklinge03);
	B_LogEntry			(CH5_Uriziel,"Xardas usunął magiczny kryształ z Uriziela. Magiczna moc tego miecza spoczywa teraz w magicznej runie.");
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_SUCCESS);
};	

func void Info_Xardas_MAKERUNE_NO ()
{
	Info_ClearChoices	(Info_Xardas_MAKERUNEDOIT);
	AI_Output			(other, self,"Info_Xardas_MAKERUNEDOIT_15_06"); //Nie, nie chcę.
	AI_Output			(self, other,"Info_Xardas_MAKERUNEDOIT_14_07"); //Jak sobie życzysz. Ostrze zachowa swą magiczną moc!
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
	AI_Output (other, self,"Info_Xardas_LOADSWORD09_15_01");		//Możesz mnie czegoś nauczyć?
	
	if ( Npc_GetTalentSkill	( hero,	NPC_TALENT_MAGE ) == 5) 
	{
		
		if (B_GiveSkill(other, NPC_TALENT_MAGE, 6, LPCOST_TALENT_MAGE_6))
		{
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_02"); //Wprowadzę cię w Szósty Krąg Magii.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_03"); //Pamiętaj, że to przywilej zarezerwowany wyłącznie dla najbieglejszych magów. Mogą do niego przystąpić ci, których całe życie jest znakiem.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_04"); //Twoim znakiem jest zjednoczenie elementów.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_05"); //Szósty Krąg pozwala ci wykorzystywać magię dowolnej runy.
			AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_06"); //I nie zapomnij: twoim zadaniem jest służyć potędze magii, a nie ją wykorzystywać.
			
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
		AI_Output (self, other,"Info_Xardas_LOADSWORD09_14_07"); 	//Jeszcze nie. Jesteś zdolny, ale brak ci niezbędnego doświadczenia. Niech Saturas popracuje nad tobą przez jakiś czas. Wtedy zobaczymy.
		
		AI_StopProcessInfos	( self );
	};
};

	
