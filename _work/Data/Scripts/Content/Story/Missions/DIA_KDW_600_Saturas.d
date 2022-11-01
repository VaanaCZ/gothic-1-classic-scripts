// ************************ EXIT **************************

instance  Info_Saturas_EXIT (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	999;
	condition	=	Info_Saturas_EXIT_Condition;
	information	=	Info_Saturas_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Saturas_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Saturas_EXIT_Info()
{
	AI_Output			(self, other,"Info_Saturas_EXIT_14_01"); //Obyś wrócił cały i zdrowy!

	AI_StopProcessInfos	(self);
};


// ************************ Intruder **************************

instance  Info_Saturas_Intruder (C_INFO)
{
	npc			=	KDW_600_Saturas;
	nr			=	1;
	condition	=	Info_Saturas_Intruder_Condition;
	information	=	Info_Saturas_Intruder_Info;
	permanent	=	1;
	important	=	1;	
};                       

FUNC int  Info_Saturas_Intruder_Condition()
{
	if ( Npc_IsInState(self,ZS_Talk) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  Info_Saturas_Intruder_Info()
{
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Co ty tu robisz? Nie masz tu czego szukać! Precz!

	AI_StopProcessInfos	(self);
};



//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NEWS
//***************************************************************************
instance Info_Saturas_NEWS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NEWS_Condition;
	information	= Info_Saturas_NEWS_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "Mam ważne wieści z obozu Bractwa!";
};

FUNC INT Info_Saturas_NEWS_Condition()
{	
	if ((CorAngar_SendToNC==TRUE) && Npc_KnowsInfo(hero, Info_Cronos_SLEEPER))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_NEWS_Info()
{
	AI_Output			(other, self,"Info_Saturas_NEWS_15_01"); //Mam ważne wieści z obozu Bractwa!
	AI_Output			(self, other,"Info_Saturas_NEWS_14_02"); //Jeśli Cronos pozwolił ci mnie odwiedzić, musiało się stać coś naprawdę ważnego!
};

//***************************************************************************
//	Info YBERION
//***************************************************************************
instance Info_Saturas_YBERION (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_YBERION_Condition;
	information	= Info_Saturas_YBERION_Info;
	permanent	= 0;
	IMPORTANT = 0;
	description = "Y'Berion nie żyje!";
};

FUNC INT Info_Saturas_YBERION_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_NEWS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_YBERION_Info()
{
	AI_Output			(other, self,"Info_Saturas_YBERION_15_01"); //Y'Berion nie żyje! Zginął podczas rytuału przyzwania Śniącego.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_02"); //Y'Berion martwy? To złe wieści... Bardzo złe.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_03"); //Kto teraz przewodzi Bractwu? Czyżby ten zbyt ambitny, jadowity wąż - Cor Kalom?
	AI_Output			(other, self,"Info_Saturas_YBERION_15_04"); //Nie! Kalom wyrzekł się Bractwa. Zabrał ze sobą kilku Strażników Świątynnych. Nikt nie wie dokąd się udali.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_05"); //Jak to możliwe? Był najważniejszym członkiem Bractwa, zaraz po Y'Berionie!
	AI_Output			(other, self,"Info_Saturas_YBERION_15_06"); //Pewne wydarzenia uświadomiły wszystkim Guru, że droga, którą podążali była błędna. Ich rzekomy bóg okazał się niszczycielskim demonem.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_07"); //Pod wpływem Śniącego, jeden z Guru próbował mnie zgładzić, mimo, iż kilka chwil wcześniej ocaliłem jego życie.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_08"); //Cor Kalom był jedynym Guru, który nie chciał uznać prawdziwej natury Śniącego. Właśnie dlatego opuścił obóz na bagnie.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_09"); //Rozumiem! Cóż, przynajmniej tutaj mamy trochę szczęścia. Cor Angar to dobry człowiek. Twardy, ale uczciwy.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_10"); //Jeśli ktoś może zapobiec całkowitemu rozpadowi Bractwa po tej katastrofie, to właśnie on.

	B_LogEntry		(CH3_EscapePlanNC,"Opowiedziałem Saturasowi o wydarzeniach z obozu na bagnie. Wyraził zadowolenie z faktu, że Cor Angar został przywódcą Bractwa.");
};

//***************************************************************************
//	Info BOOK
//***************************************************************************
instance Info_Saturas_BOOK (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BOOK_Condition;
	information	= Info_Saturas_BOOK_Info;
	permanent	= 0;
	IMPORTANT 	= 0;
	description = "Mam ten almanach...";
};

FUNC INT Info_Saturas_BOOK_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, ItWrFokusbuch))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BOOK_Info()
{
	AI_Output			(other, self,"Info_Saturas_BOOK_15_01"); //Mam ten almanach...
	AI_Output			(other, self,"Info_Saturas_BOOK_15_02"); //Y'Berion wykorzystał go do naładowania kamienia ogniskującego.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_03"); //Świetnie. Wiedza zawarta w tej księdze pozwoli nam naładować pięć pierwotnych kamieni ogniskujących.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_04"); //Wezmę ten almanach!

	B_GiveInvItems		(hero,self,ItWrFokusbuch,1);
	Npc_RemoveInvItem	(self,ItWrFokusbuch);
	B_GiveXP  			(XP_DeliverBookToSaturas);
};

//***************************************************************************
//	Info FOCUS
//***************************************************************************
instance Info_Saturas_FOCUS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FOCUS_Condition;
	information	= Info_Saturas_FOCUS_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mam tu ten kamień ogniskujący...";
};

FUNC INT Info_Saturas_FOCUS_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_YBERION) && Npc_HasItems(hero, Focus_1))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FOCUS_Info()
{
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_01"); //Mam tu ten kamień ogniskujący...
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_02"); //Trzymasz w ręku klucz, który może nas wyzwolić z kajdan niewolnictwa.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_03"); //To jeden z pięciu kamieni ogniskujących, które wykorzystywano podczas tworzenia Magicznej Bariery.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_04"); //A my z pomocą tej samej siły ogniskującej zniszczymy wielką magiczną Barierę.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_05"); //Ale czy do tego nie będzie potrzeba potężnego źródła magicznej energii?
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_06"); //To prawda. Dlatego przez te wszystkie lata gromadziliśmy rudę, zamiast wymieniać ją na towary z zewnętrznego świata.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_07"); //Jak zapewne wiesz, każdy kawałek rudy zawiera niewielki ładunek energii magicznej. Mamy nadzieję, że wyzwalając jednocześnie cały potencjał zgromadzonego przez nas kopca, będziemy w stanie zniszczyć Barierę.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_08"); //To chyba dość ryzykowne?
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_09"); //Eksplozja energii magicznej może zniszczyć wyłącznie twory utworzone lub zmodyfikowane przy użyciu magii. Nie istnieje żadne zagrożenie dla istot ludzkich.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_10"); //Proszę, oto kamień ogniskujący. Mam nadzieję, że wasze plany związane z detonacją kopca powiodą się.

	B_GiveInvItems		(hero, self, Focus_1, 1);
	Npc_RemoveInvItem	(self, Focus_1);
	B_GiveXP  			(XP_DeliverFocusToSaturas);
};

//***************************************************************************
//	Info WHATNOW
//***************************************************************************
instance Info_Saturas_WHATNOW (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_WHATNOW_Condition;
	information	= Info_Saturas_WHATNOW_Info;
	permanent	= 0;
	important 	= 0;
	description = "Co teraz zrobicie z tym kamieniem i almanachem?";
};

FUNC INT Info_Saturas_WHATNOW_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_FOCUS) && Npc_KnowsInfo(hero, Info_Saturas_BOOK))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_WHATNOW_Info()
{
	AI_Output			(other, self,"Info_Saturas_WHATNOW_15_01"); //Co teraz zrobicie z tym kamieniem i almanachem?
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_03"); //Nic. Najpierw musimy odnaleźć pozostałe cztery kamienie ogniskujące!
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_04"); //Niestety, nie trafiliśmy jeszcze na ślad żadnego z kamieni.
};

//***************************************************************************
//	Info OFFER
//***************************************************************************
instance Info_Saturas_OFFER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_OFFER_Condition;
	information	= Info_Saturas_OFFER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mógłbym spróbować odnaleźć brakujące kamienie.";
};

FUNC INT Info_Saturas_OFFER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_WHATNOW))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_OFFER_Info()
{
	AI_Output			(other, self,"Info_Saturas_OFFER_15_01"); //Mógłbym spróbować odnaleźć brakujące kamienie.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_02"); //Koniec końców - mi też zależy na wydostaniu się z tej kolonii.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_03"); //Muszę cię ostrzec: te poszukiwania mogą się okazać równie trudne co i niebezpieczne.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_04"); //Konflikt ze Starym Obozem zaostrza się z dnia na dzień. Nie mogę ci nawet przydzielić eskorty Najemników.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_05"); //Będziesz zdany wyłącznie na siebie.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_06"); //Cóż... To mi nie pierwszyzna! Jakoś sobie poradzę.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_07"); //Twoja pewność siebie dobrze o tobie świadczy, ale przyda ci się kilka przedmiotów...
	AI_Output			(self, other,"Info_Saturas_OFFER_14_08"); //Weź tę mapę. Jest dość stara, ale zaznaczono na niej oryginalne rozmieszczenie kamieni ogniskujących w chwili tworzenia Bariery.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_09"); //Ten zwój magiczny pozwoli ci błyskawicznie przenieść się do naszego obozu.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_10"); //Na koniec powinieneś jeszcze porozmawiać z Riordianem. To człowiek, który przygotowuje magiczne wywary dla naszego obozu.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_11"); //Znajdziesz go w jego chacie, tutaj, na najwyższym poziomie.

	B_Story_BringFoci	();
};

//***************************************************************************
//	B_DeliverFocus
//***************************************************************************
func void B_DeliverFocus()
{
	//-------- 2. Fokus abliefern --------
	if 		(Saturas_BringFoci == 1)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_01"); //Hmmm, na dobry początek wystarczy. Nieźle sobie radzisz.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_02"); //Musisz jeszcze odnaleźć trzy pozostałe kamienie.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_03"); //Ruszaj w drogę! Nie zostało nam zbyt wiele czasu.
		Saturas_BringFoci = 2;	
		B_GiveXP  		(XP_DeliverSecondFocus);
	}

	//-------- 3. Fokus abliefern --------
	else if	(Saturas_BringFoci == 2)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_04"); //Świetnie. To już drugi kamień, który nam przynosisz!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_05"); //Jesteśmy już znacznie bliżej naszego celu.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_06"); //Nie ustawaj w wysiłkach. Potrzebujemy jeszcze dwóch kamieni ogniskujących.
		Saturas_BringFoci = 3;	
		B_GiveXP  		(XP_DeliverThirdFocus);
	}
	
	//-------- 4. Fokus abliefern --------
	else if	(Saturas_BringFoci == 3)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_07"); //Niesamowite! Mamy już cztery kamienie ogniskujące!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_08"); //Brakuje jeszcze tylko jednego!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_09"); //Oddałeś naszej społeczności nieocenione usługi. Jeśli uda ci się odnaleźć ostatni z kamieni, wkrótce będziemy znów na wolności!
		Saturas_BringFoci = 4;	
		B_GiveXP  		(XP_DeliverFourthFocus);
	}
	
	//-------- 5. Fokus abliefern --------
	else if	(Saturas_BringFoci == 4)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_10"); //Wspaniale! Mamy już wszystkie pięć kamieni!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_11"); //Nie wiem jak będziemy ci się mogli odwdzięczyć! Jestem twoim dozgonnym dłużnikiem.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_12"); //Pójdź teraz do Riordiana. On da ci chociaż skromną namiastkę nagrody za twoje wysiłki!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_13"); //Porozmawiaj również z Cronosem, strażnikiem rudy. Od niego dostaniesz kolejny wyraz naszej wdzięczności.

		Saturas_BringFoci = 5;	
		B_GiveXP  			(XP_DeliverFifthFocus);

		B_LogEntry		(CH3_BringFoci,"Udało mi się odnaleźć wszystkie cztery kamienie ogniskujące. Saturas jest niezwykle szczęśliwy. Nowy Obóz ma u mnie chyba dług wdzięczności.");
		B_LogEntry		(CH3_BringFoci,"Cronos i Riordian obiecali mi nagrodę za odnalezienie wszystkich kamieni ogniskujących. Powinienem ich odwiedzić.");

		
		// Aufhebung des Log_running_Status, wenn die Foki schon vorher abgegeben wurden, bevor SC die einzelnen Aufträge bekam.    ***Björn***
		
		Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	};
		
	//-------- Neuer Teleportzauber ? --------
	if ( !Npc_HasItems(hero, ItArScrollTeleport2) && (Saturas_BringFoci < 5) )	
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_14"); //Widzę, że wykorzystałeś zwój teleportacyjny. Proszę, weź następny.
		CreateInvItem	(self,	ItArScrollTeleport2);
		B_GiveInvItems	(self, other, ItArScrollTeleport2, 1);
	};
};

//***************************************************************************
//	Info BRINGFOCUS2
//***************************************************************************
instance Info_Saturas_BRINGFOCUS2 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS2_Condition;
	information	= Info_Saturas_BRINGFOCUS2_Info;
	permanent	= 0;
	important	= 0;
	description = "Znalazłem kamień ogniskujący w kanionie Trolli!";
};

FUNC INT Info_Saturas_BRINGFOCUS2_Condition()
{	
	if ( Npc_HasItems(hero,focus_2) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS2_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS2_15_01"); //Znalazłem kamień ogniskujący w kanionie Trolli!

	B_LogEntry		(CH3_TrollCanyon,"Kamień z kanionu trolli jest już bezpieczny u Saturasa.");
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_2, 1);
	Npc_RemoveInvItem	(self,	focus_2);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS3
//***************************************************************************
instance Info_Saturas_BRINGFOCUS3 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS3_Condition;
	information	= Info_Saturas_BRINGFOCUS3_Info;
	permanent	= 0;
	important 	= 0;
	description = "Znalazłem kamień ogniskujący w górskiej fortecy!";
};

FUNC INT Info_Saturas_BRINGFOCUS3_Condition()
{	
	if ( Npc_HasItems(hero,focus_3) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS3_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS3_15_01"); //Znalazłem kamień ogniskujący w górskiej fortecy!

	B_LogEntry		(CH3_Fortress,"Wręczyłem Saturasowi kamień z górskiej fortecy.");
	Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_3, 1);
	Npc_RemoveInvItem	(hero,	focus_3);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS4
//***************************************************************************
instance Info_Saturas_BRINGFOCUS4 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS4_Condition;
	information	= Info_Saturas_BRINGFOCUS4_Info;
	permanent	= 0;
	important 	= 0;
	description = "Znalazłem kamień ogniskujący w ruinach starego klasztoru!";
};

FUNC INT Info_Saturas_BRINGFOCUS4_Condition()
{	
	if ( Npc_HasItems(hero,focus_4) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS4_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_01"); //Znalazłem kamień ogniskujący w ruinach starego klasztoru!
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_02"); //Spotkałem tam Gorna, tego Najemnika. Pomógł mi w poszukiwaniach.

	B_LogEntry		(CH3_MonasteryRuin,"Wreszcie mogłem oddać Saturasowi kamień ze starego klasztoru.");
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_4, 1);
	Npc_RemoveInvItem	(hero,	focus_4);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info BRINGFOCUS5
//***************************************************************************
instance Info_Saturas_BRINGFOCUS5 (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_BRINGFOCUS5_Condition;
	information	= Info_Saturas_BRINGFOCUS5_Info;
	permanent	= 0;
	important 	= 0;
	description = "Znalazłem kamień ogniskujący pod kamiennym kręgiem!";
};

FUNC INT Info_Saturas_BRINGFOCUS5_Condition()
{	
	if ( Npc_HasItems(hero,focus_5) && (Saturas_BringFoci > 0) )
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_BRINGFOCUS5_Info()
{
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS5_15_01"); //Znalazłem kamień ogniskujący pod kamiennym kręgiem!

	B_LogEntry		(CH3_Stonehenge,"Przekazałem Saturasowi kamień z krypty pod kamiennym kręgiem.");
	Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);

	//-------- Fokus abliefern ! --------
	B_GiveInvItems		(hero, self, focus_5, 1);
	Npc_RemoveInvItem	(hero,	focus_5);
	B_DeliverFocus		(); 
};	

//***************************************************************************
//	Info ALLFOCI
//***************************************************************************
instance Info_Saturas_ALLFOCI (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ALLFOCI_Condition;
	information	= Info_Saturas_ALLFOCI_Info;
	permanent	= 0;
	important 	= 0;
	description = "Czy możecie teraz przystąpić do detonacji kopca rudy?";
};

FUNC INT Info_Saturas_ALLFOCI_Condition()
{	
	if	(Saturas_BringFoci == 5)
	&&	(Kapitel < 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ALLFOCI_Info()
{
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_01"); //Czy możecie teraz przystąpić do detonacji kopca rudy?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_02"); //Mamy już wszystkie artefakty niezbędne do wprowadzenia naszego planu w życie.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_03"); //Ale Barierę utworzyło dwunastu magów.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_04"); //W całym Kręgu Wody nie ma dość mistrzów magii, by zapanować nad tak ogromną ilością energii. Nie mówiąc już o jej odpowiednim ukierunkowaniu!
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_05"); //I co teraz zrobimy?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_06"); //Wiem ile już zrobiłeś dla naszej społeczności. Wszyscy jesteśmy twoimi dłużnikami...
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_07"); //...Ale w interesie wszystkich mieszkańców kolonii muszę cię poprosić o jeszcze jedną przysługę.
};

//***************************************************************************
//	Info FAVOR
//***************************************************************************
instance Info_Saturas_FAVOR (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_FAVOR_Condition;
	information	= Info_Saturas_FAVOR_Info;
	permanent	= 0;
	important 	= 0;
	description = "Jeszcze jedną przysługę?";
};

FUNC INT Info_Saturas_FAVOR_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_ALLFOCI))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_FAVOR_Info()
{
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_01"); //Jeszcze jedną przysługę?
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_02"); //Tak. Musisz iść do Starego Obozu i przekonać do naszej sprawy kilku Magów Ognia.
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_03"); //MAGÓW OGNIA?? Myślisz, że zechcą przyłączyć się do was i zrezygnować ze swego wygodnego życia?
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_04"); //Przecież upadek Bariery pozbawi ich uprzywilejowanej pozycji!
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_05"); //Właśnie dlatego to TY musisz podjąć się tego zadania. Znasz ludzi ze wszystkich obozów w całej kolonii.
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_06"); //Przypomnij Magom Ognia stare czasy, kiedy wspólnie studiowaliśmy sztuki magiczne.
};	

//***************************************************************************
//	Info ACCEPT
//***************************************************************************
instance Info_Saturas_ACCEPT (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_ACCEPT_Condition;
	information	= Info_Saturas_ACCEPT_Info;
	permanent	= 0;
	important 	= 0;
	description = "No dobrze. Spróbuję jakoś przekonać Magów Ognia!";
};

FUNC INT Info_Saturas_ACCEPT_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Saturas_FAVOR))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_ACCEPT_Info()
{
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_01"); //No dobrze. Spróbuję jakoś przekonać Magów Ognia!
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_02"); //Ale nic nie obiecuję! Obawiam się, że to zadanie jest z góry skazane na niepowodzenie!
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_03"); //Musisz chociaż spróbować. Jeśli ci się nie powiedzie, jest już tylko jeden...
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_04"); //Tylko jeden...
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_05"); //...jeden CO?
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_06"); //Nieważne! MUSI ci się udać!
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_07"); //Weź tę magiczną runę jako znak naszego zaufania. Pokażesz ją Corristo, Arcymistrzowi Magów Ognia.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_08"); //Dzięki jej pomocy będzie mógł przeteleportować się do tej komnaty, nie przechodząc przez posterunki straży.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_09"); //Mam nadzieję, że to przekona naszych dawnych przyjaciół o szczerości naszych intencji.

	B_KapitelWechsel	(4);
};	







//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info AMBUSH
//---------------------------------------------------------------------
instance Info_Saturas_AMBUSH (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_AMBUSH_Condition;
	information	= Info_Saturas_AMBUSH_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Saturas_AMBUSH_Condition()
{	
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_AMBUSH_Info()
{
	var C_NPC gorn;
	gorn = Hlp_GetNpc(PC_FIGHTER);
	AI_TurnToNpc		(gorn,hero);
	
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_01"); //Cieszę się, że wróciłeś. Stało się coś strasznego!
	AI_Output			(hero,self,"Info_Saturas_AMBUSH_15_02"); //Niech zgadnę: Wolna Kopalnia została zaatakowana przez Strażników ze Starego Obozu, którzy niespodziewanie wyrośli jak spod ziemi?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_03"); //Zaraz... Jak... Ależ oczywiście! Dowiedziałeś się o tym w Starym Obozie!
	AI_Output	 		(self,hero,"Info_Saturas_AMBUSH_14_04"); //Gorn zjawił się tutaj tuż przed tobą.
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_05"); //Co mogło skłonić Gomeza do podjęcia tak drastycznych działań?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_06"); //Przecież musiał zdawać sobie sprawę, że ten napad stanowi wypowiedzenie wojny.
};	

//---------------------------------------------------------------------
//	Info COLLAPSE
//---------------------------------------------------------------------
instance Info_Saturas_COLLAPSE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_COLLAPSE_Condition;
	information	= Info_Saturas_COLLAPSE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Stara Kopalnia została zalana przez podziemną rzekę!";
};

FUNC INT Info_Saturas_COLLAPSE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_COLLAPSE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_COLLAPSE_15_01"); //Stara Kopalnia została zalana przez podziemną rzekę!
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_02"); //...Zalana... Naturalnie... Teraz zaczynam rozumieć...
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_03"); //Gomez został przyparty do muru. Jest teraz jeszcze groźniejszy niż kiedyś. Nie ma nic do stracenia, więc stał się całkowicie nieobliczalny!
};

//---------------------------------------------------------------------
//	Info MURDER
//---------------------------------------------------------------------
instance Info_Saturas_MURDER (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_MURDER_Condition;
	information	= Info_Saturas_MURDER_Info;
	permanent	= 0;
	important 	= 0;
	description = "Gomez wymordował wszystkich Magów Ognia!";
};

FUNC INT Info_Saturas_MURDER_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_AMBUSH))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_MURDER_Info()
{
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_01"); //Gomez wymordował wszystkich Magów Ognia!
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_02"); //WYMORDOWAŁ?!? Na Beliara, czemu miałby zrobić coś takiego?!
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_03"); //Magowie sprzeciwili się atakowi na Wolną Kopalnię, a tym samym stanęli Gomezowi na drodze.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_04"); //Zatem jesteśmy zgubieni. Bez pomocy pozostałych sześciu magów nie uda się nam zapanować nad energią wyzwoloną podczas detonacji kopca.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_05"); //Mimo wszystko, dziękuję ci za dostarczenie tych przykrych wieści. Wróg już nas nie zaskoczy.

	B_GiveXP			(XP_ReportToSaturas);
	
	B_LogEntry			(CH4_Firemages,"Saturas zasmucił się na wieść o wydarzeniach w Starym Obozie. Cokolwiek zamierzają zrobić w sprawie ucieczki... będą musieli obyć się bez pomocy Magów Ognia.");
	Log_SetTopicStatus	(CH4_Firemages,	LOG_SUCCESS);
};



/*------------------------------------------------------------------------
							GILDENWECHSEL									
------------------------------------------------------------------------*/
instance  KDW_600_Saturas_NOMOREOC (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_NOMOREOC_Condition;
	information		= KDW_600_Saturas_NOMOREOC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wygnano mnie ze Starego Obozu za to, że wam pomogłem!"; 
};

FUNC int  KDW_600_Saturas_NOMOREOC_Condition()
{	
	if	Npc_KnowsInfo (hero,Info_Saturas_MURDER)
	&&	((oldHeroGuild == GIL_GRD) || (oldHeroGuild == GIL_KDF))
	{
		return TRUE;
	};
};

FUNC void  KDW_600_Saturas_NOMOREOC_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_NOMOREOC_Info_15_01"); //Wygnano mnie ze Starego Obozu za to, że wam pomogłem!
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_02"); //Nie należysz już do Starego Obozu?
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Zatem witaj w naszej społeczności!

	Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
	B_LogEntry			(CH4_BannedFromOC,"Po tym, jak zostałem przepędzony przez ludzi Gomeza, Saturas z otwartymi ramionami przyjął mnie do Nowego Obozu!");
}; 

/*------------------------------------------------------------------------
							VOM GRD ZUM SLD									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_GOTOLEE (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_GOTOLEE_Condition;
	information		= KDW_600_Saturas_GOTOLEE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Czy to oznacza, że zostanę przyjęty w poczet Najemników?"; 
};

FUNC int  KDW_600_Saturas_GOTOLEE_Condition()
{	
	if (oldHeroGuild == GIL_GRD)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_GOTOLEE_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_GOTOLEE_Info_15_01"); //Czy to oznacza, że zostanę przyjęty w poczet Najemników?
	AI_Output			(self, other,"KDW_600_Saturas_GOTOLEE_Info_14_02"); //Porozmawiaj z Lee. On się tobą zajmie. Ale potem zajrzyj koniecznie do mnie!

	B_LogEntry			(CH4_BannedFromOC,"Lee, przywódca Najemników, chce się ze mną widzieć. Po rozmowie z nim mam wrócić do Saturasa."); 
};  
 
/*------------------------------------------------------------------------
							VON KDF ZU KDW									
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_OATH (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_OATH_Condition;
	information		= KDW_600_Saturas_OATH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Czy to oznacza, że należę teraz do kręgu Magów Wody?"; 
};

FUNC int  KDW_600_Saturas_OATH_Condition()
{	
	if (oldHeroGuild == GIL_KDF)
	&& (Npc_KnowsInfo (hero,KDW_600_Saturas_NOMOREOC))
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_OATH_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Czy to oznacza, że należę teraz do kręgu Magów Wody?
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Jeszcze nie. Najpierw musisz złożyć śluby Wody.
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_03"); //Ale składałem już przysięgę Ognia!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_04"); //Hmmm...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_05"); //Przecież nie musisz jednocześnie łamać złożonej przysięgi!
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_06"); //Eee... Nie rozumiem...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_07"); //Ty ją tylko rozszerzysz. Od tej pory będziesz magiem w służbie obydwu żywiołów!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_08"); //Posiądziesz siłę Ognia oraz mądrość Wody jednocześnie!

	B_LogEntry			(CH4_BannedFromOC,"Saturas pozwoli mi dołączyć do Kręgu Wody. Nie będę przy tym musiał łamać mojej przysięgi Ognia!"); 
};  

/*------------------------------------------------------------------------
//							KDWAUFNAHME									//
------------------------------------------------------------------------*/
instance KDW_600_Saturas_KDWAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_KDWAUFNAHME_Condition;
	information		= KDW_600_Saturas_KDWAUFNAHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jestem gotów do złożenia ślubów."; 
};

FUNC int  KDW_600_Saturas_KDWAUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_OATH))
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_KDWAUFNAHME_Info()
{
	
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Jestem gotów do złożenia ślubów.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02"); //Sługo Ognia, otrzymasz teraz błogosławieństwo Wody!
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Powtarzaj za mną słowa przysięgi:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Przysięgam, na wszechmocnych bogów...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Przysięgam, na wszechmocnych bogów...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...Przysięgam, na potęgę świętej Wody...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...Przysięgam, na potęgę świętej Wody...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...Że ma wiedza i me czyny teraz i na wieki stanowić będą jedność z Wodą...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...Że ma wiedza i me czyny teraz i na wieki stanowić będą jedność z Wodą...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...Dopóki me ciało nie powróci do królestwa Beliara, gdy źródło mego życia wyschnie.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...Dopóki me ciało nie powróci do królestwa Beliara, gdy źródło mego życia wyschnie.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12"); //Składając tę przysięgę zjednoczyłeś w sobie potęgę Ognia i błogosławieństwo Wody.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13"); //Połączyłeś teraz to, co niegdyś rozdzielono. Niech twe życie i czyny będą znakiem zjednoczenia potęgi żywiołów.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Noś tę szatę, jako symbol twojego przymierza ze świętą Wodą i wszechmocnym Adanosem.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	B_LogEntry			(CH4_BannedFromOC,"Dołączyłem do Magów Wody. Od tej chwili uzyskałem dostęp do obydwu szkół magii."); 
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);

	AI_StopProcessInfos	(self);
};
/*------------------------------------------------------------------------
						DIE MAGISCHEN KREISE							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_LESSON (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_LESSON_Condition;
	information		= KDW_600_Saturas_LESSON_Info;
	important		= 0;
	permanent		= 0;
	description		= "Możesz mnie czegoś nauczyć?"; 
};

FUNC int  KDW_600_Saturas_LESSON_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW) 
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_LESSON_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_LESSON_Info_15_01"); //Możesz mnie czegoś nauczyć?
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) <= 3)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_02"); //Przed tobą jeszcze wiele nauki. Rozpoczniemy zajęcia, gdy będziesz gotów.
	}
	else if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_03"); //Jest jeszcze jeden Krąg, o którym nie wiesz. Opowiem ci o nim, gdy będziesz gotów.
	}
	else
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_04"); //Opanowałeś już umiejętności z Piątego Kręgu magii. Nauczyłem cię wszystkiego co sam wiem.
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_05"); //Więcej nie jestem w stanie cię nauczyć!
	};

	Log_CreateTopic		(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Saturas, przywódca Magów Wody, może mnie wprowadzić w kolejne kręgi magii. Przebywa zwykle przy pentagramie, na górnym poziomie.");
};  
//--------------------------------------------------------------------------
// 							DER ERSTE KREIS
//--------------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS1 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS1_Condition;
	information		= KDW_600_Saturas_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_1, LPCOST_TALENT_MAGE_1,0); 
};

FUNC int  KDW_600_Saturas_KREIS1_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS1_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS1_Info_15_01"); //Jestem gotów, by przystąpić do Pierwszego Kręgu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_02"); //Przystąpienie do Pierwszego Kręgu wiąże się z poznaniem tajników magii runicznej.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_03"); //Każda runa zawiera esencję szczególnego zaklęcia magicznego.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_04"); //Wykorzystując swoje zdolności magiczne, będziesz w stanie ją uwolnić.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_05"); //W odróżnieniu od magicznych zwojów zawierających formuły zaklęć, magia zawarta w runach jest trwała.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_06"); //Runy są źródłem czarodziejskiej mocy, na którym możesz polegać w każdej sytuacji.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_07"); //Twoja własna magia potrzebna jest podczas korzystania z run tak samo, jak gdy korzystasz z magicznych zwojów.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_08"); //W miarę awansowania do kolejnych Kręgów, będziesz poznawał nowe runy.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_09"); //Wykorzystaj drzemiącą w runach moc do poznania samego siebie.
		KDW_600_Saturas_KREIS1.permanent = 0;
	};
};  
//---------------------------------------------------------------------
//						DER ZWEITE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS2_Condition;
	information		= KDW_600_Saturas_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_2, LPCOST_TALENT_MAGE_2,0); 
};

FUNC int  KDW_600_Saturas_KREIS2_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS2_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS2_Info_15_01"); //Jestem gotowy do przystąpienia do Drugiego Kręgu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_02"); //Poznałeś już magiczną naturę języka runicznego. Teraz zgłębisz jego tajniki.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_03"); //Po przystąpieniu do Drugiego Kręgu poznasz silniejsze zaklęcia ofensywne oraz tajemnicę magii uzdrawiającej.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_04"); //Musisz się jeszcze wiele nauczyć, zanim dane ci będzie poznać prawdziwe oblicze magii.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_05"); //Wiesz już, że runy mogą być wykorzystywane do chwili wyczerpania twoich własnych pokładów siły magicznej.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_06"); //Jednak zanim przystąpisz do działania, zastanów się nad celem, jaki ci przyświeca. Moce, którymi będziesz dysponował mogą nieść śmierć i zniszczenie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_07"); //Ale prawdziwy mag wykorzystuje swoje zdolności tylko wtedy, gdy jest to absolutnie niezbędne.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_08"); //Kiedy w pełni uświadomisz sobie ten fakt, zrozumiesz prawdę kryjącą się za magią runiczną.
		KDW_600_Saturas_KREIS2.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER DRITTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS3 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS3_Condition;
	information		= KDW_600_Saturas_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_3, LPCOST_TALENT_MAGE_3,0); 
};

FUNC int  KDW_600_Saturas_KREIS3_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 2)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)

	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS3_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS3_Info_15_01"); //Możesz mnie wprowadzić w arkana Trzeciego Kręgu?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_02"); //Trzeci Krąg to jeden z najważniejszych etapów w życiu każdego maga. Przystępując do niego przestajesz być uczniem.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_03"); //Zaszedłeś już bardzo daleko na ścieżce magii. Potrafisz posługiwać się runami.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_04"); //Ta wiedza posłuży za fundament twojej dalszej nauki. Używaj magii runicznej świadomie i z rozwagą.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_05"); //To, czy z niej skorzystasz, czy nie, powinno zależeć wyłącznie od ciebie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_06"); //Wybór, którego dokonasz, musi być ostateczny. W magii nie ma miejsca na wahanie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_07"); //Wyobraź sobie wyraźnie ścieżkę, którą chcesz kroczyć i ponieś wszelkie konsekwencje swojego wyboru.
		KDW_600_Saturas_KREIS3.permanent = 0;
	};

};  
//---------------------------------------------------------------------
//						DER VIERTE KREIS
//---------------------------------------------------------------------
instance  KDW_600_Saturas_KREIS4 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS4_Condition;
	information		= KDW_600_Saturas_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_4, LPCOST_TALENT_MAGE_4,0); 
};

FUNC int  KDW_600_Saturas_KREIS4_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 3)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS4_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS4_Info_15_01"); //Jestem gotowy do przystąpienia do Czwartego Kręgu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_02"); //Ukończyłeś już pierwsze trzy Kręgi. Nadeszła pora, byś zgłębił prawdziwą naturę magii.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_03"); //Magia runiczna jest zaklęta w kamieniu. W końcu runy to fragmenty magicznej rudy.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_04"); //Tej samej rudy, która wydobywana jest w kopalniach. Z pomocą bogów runy nasycane są magią w naszych świątyniach stając się narzędziem naszej potęgi.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_05"); //Z twoją znajomością magii runicznej, cała wiedza zgromadzona przez wszystkie świątynie w tym królestwie stoi przed tobą otworem.
		//AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_07"); //Pamiętaj: poznanie natury magii jest kluczem do poznania natury potęgi i władzy.
		KDW_600_Saturas_KREIS4.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							DER FÜNFTE KREIS							
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_KREIS5 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_KREIS5_Condition;
	information		= KDW_600_Saturas_KREIS5_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_LearnMage_5, LPCOST_TALENT_MAGE_5,0); 
};

FUNC int  KDW_600_Saturas_KREIS5_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_LESSON))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	&& (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_KREIS5_Info()
{
	AI_Output			(other, self,"KDW_600_Saturas_KREIS5_Info_15_01"); //Jestem gotów do przystąpienia do Piątego Kręgu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 5, LPCOST_TALENT_MAGE_5))
	{
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_02"); //Dobrze. Wprowadzę cię w arkana Piątego Kręgu Magii.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_03"); //Od tej pory będziesz mógł wykorzystywać magiczne runy zaklęć Ognistej Burzy i Lodowej Fali oraz posiądziesz moc niszczenia Ożywieńców.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_04"); //Jednak najpotężniejszym zaklęciem Piątego Kręgu Magii jest Tchnienie Śmierci. Gdyby udało ci się kiedyś odnaleźć tę runę, dysponowałbyś niewyobrażalną mocą.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_05"); //Staraj się nie wykorzystywać magii tego rodzaju bez potrzeby. Jest ona darem od boga ciemności!
		AI_Output		(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Nauczyłem cię wszystkiego, co sam potrafię.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_06"); //Poznaj granice swoich możliwości, a poznasz samego siebie.
		KDW_600_Saturas_KREIS5.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							SCHWERE ROBE								
------------------------------------------------------------------------*/

instance  KDW_600_Saturas_HEAVYARMOR (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 100;
	condition		= KDW_600_Saturas_HEAVYARMOR_Condition;
	information		= KDW_600_Saturas_HEAVYARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_SaturasHighRobe,VALUE_KDW_ARMOR_H); 
};

FUNC int  KDW_600_Saturas_HEAVYARMOR_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_KDW)
	{
		return TRUE;
	};

};
FUNC void  KDW_600_Saturas_HEAVYARMOR_Info()
{
	AI_Output				(other, self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01"); //Chciałbym nosić szatę Arcymaga Wody.
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) < 4)
	&& (Kapitel < 5)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02"); //Nie jesteś jeszcze godzien nosić szatę Arcymaga.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03"); //Te kila bryłek rudy, które posiadasz, nie wystarczy nawet na pokrycie kosztów jej utkania!
	}
	else
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04"); //Twój czas nadszedł. Jesteś godzien, by od dziś nosić szatę Arcymaga Wody.
		KDW_600_Saturas_HEAVYARMOR.permanent = 0;

		B_GiveInvItems		(hero,self,	ItMinugget,VALUE_KDW_ARMOR_H);
		CreateInvItem		(hero,		KDW_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
		
		AI_EquipBestArmor	(hero);
	};
}; 

//---------------------------------------------------------------------
//	Info NOWSLD
//---------------------------------------------------------------------
instance Info_Saturas_NOWSLD (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_NOWSLD_Condition;
	information	= Info_Saturas_NOWSLD_Info;
	permanent	= 0;
	important	= 0;
	description = "Lee przyjął mnie w poczet Najemników.";
};

FUNC INT Info_Saturas_NOWSLD_Condition()
{	
	if	Npc_KnowsInfo(hero, Sld_700_Lee_CHANGESIDE)
	{
		return TRUE;
	}; 
};

FUNC VOID Info_Saturas_NOWSLD_Info()
{
	AI_Output			(hero,self,"Info_Saturas_NOWSLD_15_01"); //Lee przyjął mnie w poczet Najemników.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_02"); //Dobrze. Bardzo dobrze. Teraz jesteś oficjalnie członkiem naszej społeczności.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_03"); //Witaj wśród nas!

	B_LogEntry			(CH4_BannedFromOC,"Saturas oficjalnie przywitał mnie w gronie Najemników.");
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_SUCCESS);	
};

//---------------------------------------------------------------------
//	Info XARDAS
//---------------------------------------------------------------------
instance Info_Saturas_XARDAS (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDAS_Condition;
	information	= Info_Saturas_XARDAS_Info;
	permanent	= 0;
	important	= 0;
	description = "Kiedy wysyłałeś mnie do Magów Ognia, wspomniałeś coś o... jeszcze jednym?";
};

FUNC INT Info_Saturas_XARDAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_COLLAPSE)
	&&	Npc_KnowsInfo(hero, Info_Saturas_MURDER)
	{		 										//***Björn***>

		if( (Npc_GetTrueGuild(hero)!=GIL_GRD)  &&  (Npc_GetTrueGuild(hero)!=GIL_KDF)  )
		{
			return TRUE;
		};

/*												
		if 		(oldHeroGuild==GIL_GRD)
		{
			if (Npc_GetTrueGuild(hero)==GIL_SLD)
			{
				return TRUE;
			};
		}
		else if (oldHeroGuild==GIL_KDF)
		{
			if (Npc_GetTrueGuild(hero)==GIL_KDW)
			{
				return TRUE;
			};
		}
		else
		{
			return TRUE;
		}; 											<***Björn***
*/												

	};	
};

FUNC VOID Info_Saturas_XARDAS_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_01"); //Kiedy wysyłałeś mnie do Magów Ognia, wspomniałeś coś o... jeszcze jednym?
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_02"); //Cóż, miałem nadzieję, że obejdziemy się bez jego pomocy, ale w świetle ostatnich wydarzeń...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_03"); //O kim mówisz?
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_04"); //No dobrze już, dobrze.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_05"); //Wiele lat temu...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_06"); //Wolałbym wersję skróconą, jeśli łaska!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_07"); //Bądź cierpliwy. Cóż, kiedy tworzyliśmy magiczną Barierę, nadzorował nas jeszcze jeden, trzynasty mag. 
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_08"); //Trzynasty mag? Według legendy miało was być tylko dwunastu!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_09"); //Niewielu z żyjących pamięta dokładnie wydarzenia tamtych dni, a my - magowie - woleliśmy nie odświeżać im niepotrzebnie pamięci.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_10"); //Ten trzynasty mag był naszym przywódcą. Oczywiście działo się to jeszcze przed podziałem na Kręgi Wody i Ognia.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_11"); //Tuż po założeniu Starego Obozu - a wtedy był to jeszcze jedyny obóz w kolonii - ów mag postanowił wieść życie samotnika.
};

//---------------------------------------------------------------------
//	Info XARDASWHO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHO_Condition;
	information	= Info_Saturas_XARDASWHO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Jak ma na imię ten trzynasty mag?";
};

FUNC INT Info_Saturas_XARDASWHO_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHO_15_01"); //Jak ma na imię ten trzynasty mag?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_02"); //Nazywał się Xardas. Dzisiaj już tylko garstka ludzi pamięta o jego istnieniu.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_03"); //Ale ci, którzy go znali, nazywali go po prostu NEKROMANTĄ!
};

//---------------------------------------------------------------------
//	Info XARDASWHY
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHY (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHY_Condition;
	information	= Info_Saturas_XARDASWHY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Dlaczego opuścił Stary Obóz?";
};

FUNC INT Info_Saturas_XARDASWHY_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHY_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_01"); //Dlaczego opuścił Stary Obóz?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_02"); //Xardas chciał kontynuować swe badania nad przyzywaniem ożywieńców i istot z innych wymiarów.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_03"); //Nie tylko Gomez zaczął się tym niepokoić. Pozostali magowie również krzywo patrzyli na niego i jego plugawe badania.
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_04"); //I co się z nim stało?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_05"); //W odróżnieniu od Gomeza, Xardas nie był rzeźnikiem i wolał uniknąć otwartego konfliktu. Pewnego dnia opuścił Obóz.
};

//---------------------------------------------------------------------
//	Info XARDASWHERE
//---------------------------------------------------------------------
instance Info_Saturas_XARDASWHERE (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASWHERE_Condition;
	information	= Info_Saturas_XARDASWHERE_Info;
	permanent	= 0;
	important 	= 0;
	description = "Wiesz może gdzie podziewa się teraz ten trzynasty mag?";
};

FUNC INT Info_Saturas_XARDASWHERE_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_Saturas_XARDAS))
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASWHERE_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASWHERE_15_01"); //Wiesz może, gdzie podziewa się teraz ten trzynasty mag?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_02"); //Żyje w odosobnieniu, w swej wieży, gdzieś na terytoriach kontrolowanych przez Orków.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_03"); //To chyba najdalej wysunięty na południe punkt całej kolonii.
};

//---------------------------------------------------------------------
//	Info XARDASHELP
//---------------------------------------------------------------------
instance Info_Saturas_XARDASHELP (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASHELP_Condition;
	information	= Info_Saturas_XARDASHELP_Info;
	permanent	= 0;
	important 	= 0;
	description = "Spróbuję dotrzeć do tego Xardasa i poproszę go o pomoc!";
};

FUNC INT Info_Saturas_XARDASHELP_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHO)
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHY) 
	&&	Npc_KnowsInfo(hero, Info_Saturas_XARDASWHERE) 
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASHELP_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_01"); //Spróbuję dotrzeć do tego Xardasa i poproszę go o pomoc!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_02"); //Tylko on jeden może nas teraz uratować.
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_03"); //A gdyby nawet on nie wiedział, jak nas stąd wydostać, albo nie zechciał nam pomóc...
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_04"); //BĘDZIE... I ZECHCE!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_05"); //Jest jednak inny problem...
	
	B_Story_FindXardas	();
};

//---------------------------------------------------------------------
//	Info XARDASPROBLEM
//---------------------------------------------------------------------
instance Info_Saturas_XARDASPROBLEM (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASPROBLEM_Condition;
	information	= Info_Saturas_XARDASPROBLEM_Info;
	permanent	= 0;
	important 	= 0;
	description = "Mianowicie?";
};

FUNC INT Info_Saturas_XARDASPROBLEM_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASHELP)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASPROBLEM_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_01"); //Mianowicie?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_02"); //Cóż, przez te wszystkie lata kilkakrotnie próbowaliśmy nawiązać z Xardasem jakiś kontakt.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_03"); //Ale wygląda na to, że nie życzy sobie, żeby mu przeszkadzano.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_04"); //Co chcesz przez to powiedzieć?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_05"); //Żaden z wysłanych przez nas posłańców nie wrócił z jego wieży.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_06"); //Musisz znaleźć jakiś sposób, aby przedrzeć się przez strażników Xardasa.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_07"); //Widzę, że szykuje się nie lada wyprawa!
	
	B_LogEntry			(CH4_FindXardas,"Saturas uprzedził mnie o magicznych strażnikach Xardasa Nekromanty. W bibliotece Magów Wody znajdę informacje o silnych i słabych stronach tych istot. Powinienem poświęcić trochę czasu na przestudiowanie odpowiednich manuskryptów.");	
};

//---------------------------------------------------------------------
//	Info XARDASGO
//---------------------------------------------------------------------
instance Info_Saturas_XARDASGO (C_INFO)
{
	npc			= KDW_600_Saturas;
	condition	= Info_Saturas_XARDASGO_Condition;
	information	= Info_Saturas_XARDASGO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Jak mogę przedostać się do Xardasa?";
};

FUNC INT Info_Saturas_XARDASGO_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_XARDASPROBLEM)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Saturas_XARDASGO_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_01"); //Jak mogę przedostać się do Xardasa?
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_02"); //Niestety, nie mam żadnego pomysłu...
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_03"); //Radziłbym ci jednak rozejrzeć się trochę w naszej bibliotece.
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_04"); //Może w którejś ze starych ksiąg odnajdziesz jakieś wskazówki co do mocnych i słabych stron istot przywołanych magicznie.
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_05"); //W takim razie pójdę rozejrzeć się trochę po bibliotece. Nie obawiaj się...
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_06"); //Niedługo wrócę!

	B_LogEntry			(CH4_FindXardas,"W bibliotece Magów Wody znajdują się zapiski traktujące o sposobach walki z takimi istotami. Powinienem poświęcić trochę czasu na przestudiowanie tych manuskryptów.");
	
};

/*------------------------------------------------------------------------
//	TIMESUP- Xardas ist die Schlüsselperson, Saturas ist nicht mehr wichtig									
------------------------------------------------------------------------*/
instance KDW_600_Saturas_TIMESUP (C_INFO)
{
	npc				= KDW_600_Saturas;
	condition		= KDW_600_Saturas_TIMESUP_Condition;
	information		= KDW_600_Saturas_TIMESUP_Info;
	important	    = 1;
	permanent		= 0;
};

FUNC int  KDW_600_Saturas_TIMESUP_Condition()
{	
	if FindOrcShaman == LOG_RUNNING
	|| FindOrcShaman == LOG_SUCCESS
	{
		return TRUE;
	};
};
func void  KDW_600_Saturas_TIMESUP_Info()
{
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_00"); //Rozmawiałeś z Xardasem?
	Info_ClearChoices	(KDW_600_Saturas_TIMESUP);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"No wiesz...",KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Nie...",KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"To nie jest tak jak myślisz...",KDW_600_Saturas_TIMESUP_JA3);

};
func void KDW_600_Saturas_TIMESUP_JA1()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_01"); //No wiesz...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_02"); //Wiesz? CO WIESZ?
	//AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_03"); //Äh ... noch nicht ... ich bin aber schon unterwegs ...
	//AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_04"); //Beeile dich, wir dürfen keine Zeit mehr verlieren!
	//B_Story_CancelFindXardas();
	//AI_StopProcessInfos(self);
};
func void KDW_600_Saturas_TIMESUP_JA2()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_05"); //Nie...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_06"); //Dlaczego?
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_07"); //Nie udało mi się jeszcze do niego dotrzeć.
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_08"); //Musisz go odnaleźć i poprosić go o pomoc!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};
func void KDW_600_Saturas_TIMESUP_JA3()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_09"); //To nie jest tak jak myślisz...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_10"); //Jak to? Xardas musi nam pomóc w zdetonowaniu kopca rudy!
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_11"); //Kopiec... jest... Ehm... Jest już bardzo duży!
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_12"); //Znajdź Xardasa! On musi nam pomóc!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};




//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////// SLD zu Magier		//////////////////////////////////
//////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////

// ****************************************
// 			Aufnahme eines Sld 
// ****************************************

instance KDW_600_Saturas_HogeAUFNAHME (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHME_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHME_Info;
	permanent		= 0;
	description		= "Nefarius powiedział, że mogę już założyć szatę Maga Wody."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHME_Condition()
{	
	if ( Npc_KnowsInfo(hero,Info_Saturas_MURDER) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHME_Info()
{
	AI_Output(other, self,"KDW_600_Saturas_HogeAUFNAHME_15_00"); //Nefarius powiedział, że mogę już założyć szatę Maga Wody.
	
	/* AB HIER IST ALLES DOPPELT - geklaut aus der KdF-KdW-Aufnahme */
	
	AI_Output(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Zatem witaj w naszej społeczności!
	AI_Output(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Czy to oznacza, że należę teraz do kręgu Magów Wody?
	AI_Output(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Jeszcze nie. Najpierw musisz złożyć śluby Wody.
};
	
// ****************************************
// 			Aufnahme eines Sld - Teil 2
// ****************************************
instance KDW_600_Saturas_HogeAUFNAHMETeil2 (C_INFO)
{
	npc				= KDW_600_Saturas;
	nr				= 10;
	condition		= KDW_600_Saturas_HogeAUFNAHMETeil2_Condition;
	information		= KDW_600_Saturas_HogeAUFNAHMETeil2_Info;
	permanent		= 0;
	description		= "Jestem gotów do złożenia ślubów."; 
};

FUNC int  KDW_600_Saturas_HogeAUFNAHMETeil2_Condition()
{	
	if ( (Npc_KnowsInfo(hero,KDW_600_Saturas_HogeAUFNAHME)) && (Npc_GetTrueGuild(hero)==GIL_SLD) )
	{
		return 1;
	};
};

func void  KDW_600_Saturas_HogeAUFNAHMETeil2_Info()
{
	AI_GotoNpc 			(hero,self);
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Jestem gotów do złożenia ślubów.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Powtarzaj za mną słowa przysięgi:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Przysięgam, na wszechmocnych bogów...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Przysięgam, na wszechmocnych bogów...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...Przysięgam, na potęgę świętej Wody...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...Przysięgam, na potęgę świętej Wody...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...Że ma wiedza i me czyny teraz i na wieki stanowić będą jedność z Wodą...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...Że ma wiedza i me czyny teraz i na wieki stanowić będą jedność z Wodą...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...Dopóki me ciało nie powróci do królestwa Beliara, gdy źródło mego życia wyschnie.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...Dopóki me ciało nie powróci do królestwa Beliara, gdy źródło mego życia wyschnie.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Noś tę szatę, jako symbol twojego przymierza ze świętą Wodą i wszechmocnym Adanosem.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	Log_CreateTopic		(CH4_SldToKdW,	LOG_NOTE);
	B_LogEntry			(CH4_SldToKdW,"Saturas przyjął mnie w poczet Magów Wody.");

	AI_StopProcessInfos	(self);
};

