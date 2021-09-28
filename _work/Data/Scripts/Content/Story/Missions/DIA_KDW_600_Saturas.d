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
	AI_Output			(self, other,"Info_Saturas_EXIT_14_01"); //Obyœ wróci³ ca³y i zdrowy!

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
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Co ty tu robisz? Nie masz tu czego szukaæ! Precz!

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
	description = "Mam wa¿ne wieœci z obozu Bractwa!";
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
	AI_Output			(other, self,"Info_Saturas_NEWS_15_01"); //Mam wa¿ne wieœci z obozu Bractwa!
	AI_Output			(self, other,"Info_Saturas_NEWS_14_02"); //Jeœli Cronos pozwoli³ ci mnie odwiedziæ, musia³o siê staæ coœ naprawdê wa¿nego!
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
	description = "Y'Berion nie ¿yje!";
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
	AI_Output			(other, self,"Info_Saturas_YBERION_15_01"); //Y'Berion nie ¿yje! Zgin¹³ podczas rytua³u przyzwania Œni¹cego.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_02"); //Y'Berion martwy? To z³e wieœci... Bardzo z³e.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_03"); //Kto teraz przewodzi Bractwu? Czy¿by ten zbyt ambitny, jadowity w¹¿ - Cor Kalom?
	AI_Output			(other, self,"Info_Saturas_YBERION_15_04"); //Nie! Kalom wyrzek³ siê Bractwa. Zabra³ ze sob¹ kilku Stra¿ników Œwi¹tynnych. Nikt nie wie dok¹d siê udali.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_05"); //Jak to mo¿liwe? By³ najwa¿niejszym cz³onkiem Bractwa, zaraz po Y'Berionie!
	AI_Output			(other, self,"Info_Saturas_YBERION_15_06"); //Pewne wydarzenia uœwiadomi³y wszystkim Guru, ¿e droga, któr¹ pod¹¿ali by³a b³êdna. Ich rzekomy bóg okaza³ siê niszczycielskim demonem.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_07"); //Pod wp³ywem Œni¹cego, jeden z Guru próbowa³ mnie zg³adziæ, mimo, i¿ kilka chwil wczeœniej ocali³em jego ¿ycie.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_08"); //Cor Kalom by³ jedynym Guru, który nie chcia³ uznaæ prawdziwej natury Œni¹cego. W³aœnie dlatego opuœci³ obóz na bagnie.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_09"); //Rozumiem! Có¿, przynajmniej tutaj mamy trochê szczêœcia. Cor Angar to dobry cz³owiek. Twardy, ale uczciwy.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_10"); //Jeœli ktoœ mo¿e zapobiec ca³kowitemu rozpadowi Bractwa po tej katastrofie, to w³aœnie on.

	B_LogEntry		(CH3_EscapePlanNC,"Opowiedzia³em Saturasowi o wydarzeniach z obozu na bagnie. Wyrazi³ zadowolenie z faktu, ¿e Cor Angar zosta³ przywódc¹ Bractwa.");
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
	AI_Output			(other, self,"Info_Saturas_BOOK_15_02"); //Y'Berion wykorzysta³ go do na³adowania kamienia ogniskuj¹cego.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_03"); //Œwietnie. Wiedza zawarta w tej ksiêdze pozwoli nam na³adowaæ piêæ pierwotnych kamieni ogniskuj¹cych.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_04"); //Wezmê ten almanach!

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
	description = "Mam tu ten kamieñ ogniskuj¹cy...";
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
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_01"); //Mam tu ten kamieñ ogniskuj¹cy...
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_02"); //Trzymasz w rêku klucz, który mo¿e nas wyzwoliæ z kajdan niewolnictwa.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_03"); //To jeden z piêciu kamieni ogniskuj¹cych, które wykorzystywano podczas tworzenia Magicznej Bariery.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_04"); //A my z pomoc¹ tej samej si³y ogniskuj¹cej zniszczymy wielk¹ magiczn¹ Barierê.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_05"); //Ale czy do tego nie bêdzie potrzeba potê¿nego Ÿród³a magicznej energii?
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_06"); //To prawda. Dlatego przez te wszystkie lata gromadziliœmy rudê, zamiast wymieniaæ j¹ na towary z zewnêtrznego œwiata.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_07"); //Jak zapewne wiesz, ka¿dy kawa³ek rudy zawiera niewielki ³adunek energii magicznej. Mamy nadziejê, ¿e wyzwalaj¹c jednoczeœnie ca³y potencja³ zgromadzonego przez nas kopca, bêdziemy w stanie zniszczyæ Barierê.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_08"); //To chyba doœæ ryzykowne?
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_09"); //Eksplozja energii magicznej mo¿e zniszczyæ wy³¹cznie twory utworzone lub zmodyfikowane przy u¿yciu magii. Nie istnieje ¿adne zagro¿enie dla istot ludzkich.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_10"); //Proszê, oto kamieñ ogniskuj¹cy. Mam nadziejê, ¿e wasze plany zwi¹zane z detonacj¹ kopca powiod¹ siê.

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
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_03"); //Nic. Najpierw musimy odnaleŸæ pozosta³e cztery kamienie ogniskuj¹ce!
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_04"); //Niestety, nie trafiliœmy jeszcze na œlad ¿adnego z kamieni.
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
	description = "Móg³bym spróbowaæ odnaleŸæ brakuj¹ce kamienie.";
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
	AI_Output			(other, self,"Info_Saturas_OFFER_15_01"); //Móg³bym spróbowaæ odnaleŸæ brakuj¹ce kamienie.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_02"); //Koniec koñców - mi te¿ zale¿y na wydostaniu siê z tej kolonii.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_03"); //Muszê ciê ostrzec: te poszukiwania mog¹ siê okazaæ równie trudne co i niebezpieczne.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_04"); //Konflikt ze Starym Obozem zaostrza siê z dnia na dzieñ. Nie mogê ci nawet przydzieliæ eskorty Najemników.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_05"); //Bêdziesz zdany wy³¹cznie na siebie.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_06"); //Có¿... To mi nie pierwszyzna! Jakoœ sobie poradzê.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_07"); //Twoja pewnoœæ siebie dobrze o tobie œwiadczy, ale przyda ci siê kilka przedmiotów...
	AI_Output			(self, other,"Info_Saturas_OFFER_14_08"); //WeŸ tê mapê. Jest doœæ stara, ale zaznaczono na niej oryginalne rozmieszczenie kamieni ogniskuj¹cych w chwili tworzenia Bariery.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_09"); //Ten zwój magiczny pozwoli ci b³yskawicznie przenieœæ siê do naszego obozu.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_10"); //Na koniec powinieneœ jeszcze porozmawiaæ z Riordianem. To cz³owiek, który przygotowuje magiczne wywary dla naszego obozu.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_11"); //Znajdziesz go w jego chacie, tutaj, na najwy¿szym poziomie.

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
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_01"); //Hmmm, na dobry pocz¹tek wystarczy. NieŸle sobie radzisz.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_02"); //Musisz jeszcze odnaleŸæ trzy pozosta³e kamienie.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_03"); //Ruszaj w drogê! Nie zosta³o nam zbyt wiele czasu.
		Saturas_BringFoci = 2;	
		B_GiveXP  		(XP_DeliverSecondFocus);
	}

	//-------- 3. Fokus abliefern --------
	else if	(Saturas_BringFoci == 2)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_04"); //Œwietnie. To ju¿ drugi kamieñ, który nam przynosisz!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_05"); //Jesteœmy ju¿ znacznie bli¿ej naszego celu.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_06"); //Nie ustawaj w wysi³kach. Potrzebujemy jeszcze dwóch kamieni ogniskuj¹cych.
		Saturas_BringFoci = 3;	
		B_GiveXP  		(XP_DeliverThirdFocus);
	}
	
	//-------- 4. Fokus abliefern --------
	else if	(Saturas_BringFoci == 3)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_07"); //Niesamowite! Mamy ju¿ cztery kamienie ogniskuj¹ce!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_08"); //Brakuje jeszcze tylko jednego!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_09"); //Odda³eœ naszej spo³ecznoœci nieocenione us³ugi. Jeœli uda ci siê odnaleŸæ ostatni z kamieni, wkrótce bêdziemy znów na wolnoœci!
		Saturas_BringFoci = 4;	
		B_GiveXP  		(XP_DeliverFourthFocus);
	}
	
	//-------- 5. Fokus abliefern --------
	else if	(Saturas_BringFoci == 4)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_10"); //Wspaniale! Mamy ju¿ wszystkie piêæ kamieni!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_11"); //Nie wiem jak bêdziemy ci siê mogli odwdziêczyæ! Jestem twoim dozgonnym d³u¿nikiem.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_12"); //PójdŸ teraz do Riordiana. On da ci chocia¿ skromn¹ namiastkê nagrody za twoje wysi³ki!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_13"); //Porozmawiaj równie¿ z Cronosem, stra¿nikiem rudy. Od niego dostaniesz kolejny wyraz naszej wdziêcznoœci.

		Saturas_BringFoci = 5;	
		B_GiveXP  			(XP_DeliverFifthFocus);

		B_LogEntry		(CH3_BringFoci,"Uda³o mi siê odnaleŸæ wszystkie cztery kamienie ogniskuj¹ce. Saturas jest niezwykle szczêœliwy. Nowy Obóz ma u mnie chyba d³ug wdziêcznoœci.");
		B_LogEntry		(CH3_BringFoci,"Cronos i Riordian obiecali mi nagrodê za odnalezienie wszystkich kamieni ogniskuj¹cych. Powinienem ich odwiedziæ.");

		
		// Aufhebung des Log_running_Status, wenn die Foki schon vorher abgegeben wurden, bevor SC die einzelnen Aufträge bekam.    ***Björn***
		
		Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	};
		
	//-------- Neuer Teleportzauber ? --------
	if ( !Npc_HasItems(hero, ItArScrollTeleport2) && (Saturas_BringFoci < 5) )	
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_14"); //Widzê, ¿e wykorzysta³eœ zwój teleportacyjny. Proszê, weŸ nastêpny.
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
	description = "Znalaz³em kamieñ ogniskuj¹cy w kanionie Trolli!";
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
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS2_15_01"); //Znalaz³em kamieñ ogniskuj¹cy w kanionie Trolli!

	B_LogEntry		(CH3_TrollCanyon,"Kamieñ z kanionu trolli jest ju¿ bezpieczny u Saturasa.");
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
	description = "Znalaz³em kamieñ ogniskuj¹cy w górskiej fortecy!";
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
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS3_15_01"); //Znalaz³em kamieñ ogniskuj¹cy w górskiej fortecy!

	B_LogEntry		(CH3_Fortress,"Wrêczy³em Saturasowi kamieñ z górskiej fortecy.");
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
	description = "Znalaz³em kamieñ ogniskuj¹cy w ruinach starego klasztoru!";
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
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_01"); //Znalaz³em kamieñ ogniskuj¹cy w ruinach starego klasztoru!
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_02"); //Spotka³em tam Gorna, tego Najemnika. Pomóg³ mi w poszukiwaniach.

	B_LogEntry		(CH3_MonasteryRuin,"Wreszcie mog³em oddaæ Saturasowi kamieñ ze starego klasztoru.");
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
	description = "Znalaz³em kamieñ ogniskuj¹cy pod kamiennym krêgiem!";
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
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS5_15_01"); //Znalaz³em kamieñ ogniskuj¹cy pod kamiennym krêgiem!

	B_LogEntry		(CH3_Stonehenge,"Przekaza³em Saturasowi kamieñ z krypty pod kamiennym krêgiem.");
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
	description = "Czy mo¿ecie teraz przyst¹piæ do detonacji kopca rudy?";
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
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_01"); //Czy mo¿ecie teraz przyst¹piæ do detonacji kopca rudy?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_02"); //Mamy ju¿ wszystkie artefakty niezbêdne do wprowadzenia naszego planu w ¿ycie.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_03"); //Ale Barierê utworzy³o dwunastu magów.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_04"); //W ca³ym Krêgu Wody nie ma doœæ mistrzów magii, by zapanowaæ nad tak ogromn¹ iloœci¹ energii. Nie mówi¹c ju¿ o jej odpowiednim ukierunkowaniu!
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_05"); //I co teraz zrobimy?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_06"); //Wiem ile ju¿ zrobi³eœ dla naszej spo³ecznoœci. Wszyscy jesteœmy twoimi d³u¿nikami...
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_07"); //...Ale w interesie wszystkich mieszkañców kolonii muszê ciê poprosiæ o jeszcze jedn¹ przys³ugê.
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
	description = "Jeszcze jedn¹ przys³ugê?";
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
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_01"); //Jeszcze jedn¹ przys³ugê?
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_02"); //Tak. Musisz iœæ do Starego Obozu i przekonaæ do naszej sprawy kilku Magów Ognia.
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_03"); //MAGÓW OGNIA?? Myœlisz, ¿e zechc¹ przy³¹czyæ siê do was i zrezygnowaæ ze swego wygodnego ¿ycia?
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_04"); //Przecie¿ upadek Bariery pozbawi ich uprzywilejowanej pozycji!
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_05"); //W³aœnie dlatego to TY musisz podj¹æ siê tego zadania. Znasz ludzi ze wszystkich obozów w ca³ej kolonii.
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_06"); //Przypomnij Magom Ognia stare czasy, kiedy wspólnie studiowaliœmy sztuki magiczne.
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
	description = "No dobrze. Spróbujê jakoœ przekonaæ Magów Ognia!";
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
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_01"); //No dobrze. Spróbujê jakoœ przekonaæ Magów Ognia!
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_02"); //Ale nic nie obiecujê! Obawiam siê, ¿e to zadanie jest z góry skazane na niepowodzenie!
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_03"); //Musisz chocia¿ spróbowaæ. Jeœli ci siê nie powiedzie, jest ju¿ tylko jeden...
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_04"); //Tylko jeden...
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_05"); //...jeden CO?
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_06"); //Niewa¿ne! MUSI ci siê udaæ!
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_07"); //WeŸ tê magiczn¹ runê jako znak naszego zaufania. Poka¿esz j¹ Corristo, Arcymistrzowi Magów Ognia.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_08"); //Dziêki jej pomocy bêdzie móg³ przeteleportowaæ siê do tej komnaty, nie przechodz¹c przez posterunki stra¿y.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_09"); //Mam nadziejê, ¿e to przekona naszych dawnych przyjació³ o szczeroœci naszych intencji.

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
	
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_01"); //Cieszê siê, ¿e wróci³eœ. Sta³o siê coœ strasznego!
	AI_Output			(hero,self,"Info_Saturas_AMBUSH_15_02"); //Niech zgadnê: Wolna Kopalnia zosta³a zaatakowana przez Stra¿ników ze Starego Obozu, którzy niespodziewanie wyroœli jak spod ziemi?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_03"); //Zaraz... Jak... Ale¿ oczywiœcie! Dowiedzia³eœ siê o tym w Starym Obozie!
	AI_Output	 		(self,hero,"Info_Saturas_AMBUSH_14_04"); //Gorn zjawi³ siê tutaj tu¿ przed tob¹.
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_05"); //Co mog³o sk³oniæ Gomeza do podjêcia tak drastycznych dzia³añ?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_06"); //Przecie¿ musia³ zdawaæ sobie sprawê, ¿e ten napad stanowi wypowiedzenie wojny.
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
	description = "Stara Kopalnia zosta³a zalana przez podziemn¹ rzekê!";
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
	AI_Output			(hero,self,"Info_Saturas_COLLAPSE_15_01"); //Stara Kopalnia zosta³a zalana przez podziemn¹ rzekê!
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_02"); //...Zalana... Naturalnie... Teraz zaczynam rozumieæ...
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_03"); //Gomez zosta³ przyparty do muru. Jest teraz jeszcze groŸniejszy ni¿ kiedyœ. Nie ma nic do stracenia, wiêc sta³ siê ca³kowicie nieobliczalny!
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
	description = "Gomez wymordowa³ wszystkich Magów Ognia!";
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
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_01"); //Gomez wymordowa³ wszystkich Magów Ognia!
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_02"); //WYMORDOWA£?!? Na Beliara, czemu mia³by zrobiæ coœ takiego?!
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_03"); //Magowie sprzeciwili siê atakowi na Woln¹ Kopalniê, a tym samym stanêli Gomezowi na drodze.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_04"); //Zatem jesteœmy zgubieni. Bez pomocy pozosta³ych szeœciu magów nie uda siê nam zapanowaæ nad energi¹ wyzwolon¹ podczas detonacji kopca.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_05"); //Mimo wszystko, dziêkujê ci za dostarczenie tych przykrych wieœci. Wróg ju¿ nas nie zaskoczy.

	B_GiveXP			(XP_ReportToSaturas);
	
	B_LogEntry			(CH4_Firemages,"Saturas zasmuci³ siê na wieœæ o wydarzeniach w Starym Obozie. Cokolwiek zamierzaj¹ zrobiæ w sprawie ucieczki... bêd¹ musieli obyæ siê bez pomocy Magów Ognia.");
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
	description		= "Wygnano mnie ze Starego Obozu za to, ¿e wam pomog³em!"; 
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
	AI_Output			(other, self,"KDW_600_Saturas_NOMOREOC_Info_15_01"); //Wygnano mnie ze Starego Obozu za to, ¿e wam pomog³em!
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_02"); //Nie nale¿ysz ju¿ do Starego Obozu?
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Zatem witaj w naszej spo³ecznoœci!

	Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
	B_LogEntry			(CH4_BannedFromOC,"Po tym, jak zosta³em przepêdzony przez ludzi Gomeza, Saturas z otwartymi ramionami przyj¹³ mnie do Nowego Obozu!");
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
	description		= "Czy to oznacza, ¿e zostanê przyjêty w poczet Najemników?"; 
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
	AI_Output			(other, self,"KDW_600_Saturas_GOTOLEE_Info_15_01"); //Czy to oznacza, ¿e zostanê przyjêty w poczet Najemników?
	AI_Output			(self, other,"KDW_600_Saturas_GOTOLEE_Info_14_02"); //Porozmawiaj z Lee. On siê tob¹ zajmie. Ale potem zajrzyj koniecznie do mnie!

	B_LogEntry			(CH4_BannedFromOC,"Lee, przywódca Najemników, chce siê ze mn¹ widzieæ. Po rozmowie z nim mam wróciæ do Saturasa."); 
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
	description		= "Czy to oznacza, ¿e nale¿ê teraz do krêgu Magów Wody?"; 
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
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Czy to oznacza, ¿e nale¿ê teraz do krêgu Magów Wody?
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Jeszcze nie. Najpierw musisz z³o¿yæ œluby Wody.
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_03"); //Ale sk³ada³em ju¿ przysiêgê Ognia!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_04"); //Hmmm...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_05"); //Przecie¿ nie musisz jednoczeœnie ³amaæ z³o¿onej przysiêgi!
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_06"); //Eee... Nie rozumiem...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_07"); //Ty j¹ tylko rozszerzysz. Od tej pory bêdziesz magiem w s³u¿bie obydwu ¿ywio³ów!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_08"); //Posi¹dziesz si³ê Ognia oraz m¹droœæ Wody jednoczeœnie!

	B_LogEntry			(CH4_BannedFromOC,"Saturas pozwoli mi do³¹czyæ do Krêgu Wody. Nie bêdê przy tym musia³ ³amaæ mojej przysiêgi Ognia!"); 
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
	description		= "Jestem gotów do z³o¿enia œlubów."; 
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
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Jestem gotów do z³o¿enia œlubów.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02"); //S³ugo Ognia, otrzymasz teraz b³ogos³awieñstwo Wody!
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Powtarzaj za mn¹ s³owa przysiêgi:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Przysiêgam, na wszechmocnych bogów...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Przysiêgam, na wszechmocnych bogów...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...Przysiêgam, na potêgê œwiêtej Wody...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...Przysiêgam, na potêgê œwiêtej Wody...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...¯e ma wiedza i me czyny teraz i na wieki stanowiæ bêd¹ jednoœæ z Wod¹...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...¯e ma wiedza i me czyny teraz i na wieki stanowiæ bêd¹ jednoœæ z Wod¹...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...Dopóki me cia³o nie powróci do królestwa Beliara, gdy Ÿród³o mego ¿ycia wyschnie.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...Dopóki me cia³o nie powróci do królestwa Beliara, gdy Ÿród³o mego ¿ycia wyschnie.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12"); //Sk³adaj¹c tê przysiêgê zjednoczy³eœ w sobie potêgê Ognia i b³ogos³awieñstwo Wody.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13"); //Po³¹czy³eœ teraz to, co niegdyœ rozdzielono. Niech twe ¿ycie i czyny bêd¹ znakiem zjednoczenia potêgi ¿ywio³ów.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Noœ tê szatê, jako symbol twojego przymierza ze œwiêt¹ Wod¹ i wszechmocnym Adanosem.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	B_LogEntry			(CH4_BannedFromOC,"Do³¹czy³em do Magów Wody. Od tej chwili uzyska³em dostêp do obydwu szkó³ magii."); 
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
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
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
	AI_Output			(other, self,"KDW_600_Saturas_LESSON_Info_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) <= 3)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_02"); //Przed tob¹ jeszcze wiele nauki. Rozpoczniemy zajêcia, gdy bêdziesz gotów.
	}
	else if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_03"); //Jest jeszcze jeden Kr¹g, o którym nie wiesz. Opowiem ci o nim, gdy bêdziesz gotów.
	}
	else
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_04"); //Opanowa³eœ ju¿ umiejêtnoœci z Pi¹tego Krêgu magii. Nauczy³em ciê wszystkiego co sam wiem.
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_05"); //Wiêcej nie jestem w stanie ciê nauczyæ!
	};

	Log_CreateTopic		(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Saturas, przywódca Magów Wody, mo¿e mnie wprowadziæ w kolejne krêgi magii. Przebywa zwykle przy pentagramie, na górnym poziomie.");
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
	AI_Output			(other, self,"KDW_600_Saturas_KREIS1_Info_15_01"); //Jestem gotów, by przyst¹piæ do Pierwszego Krêgu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_02"); //Przyst¹pienie do Pierwszego Krêgu wi¹¿e siê z poznaniem tajników magii runicznej.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_03"); //Ka¿da runa zawiera esencjê szczególnego zaklêcia magicznego.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_04"); //Wykorzystuj¹c swoje zdolnoœci magiczne, bêdziesz w stanie j¹ uwolniæ.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_05"); //W odró¿nieniu od magicznych zwojów zawieraj¹cych formu³y zaklêæ, magia zawarta w runach jest trwa³a.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_06"); //Runy s¹ Ÿród³em czarodziejskiej mocy, na którym mo¿esz polegaæ w ka¿dej sytuacji.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_07"); //Twoja w³asna magia potrzebna jest podczas korzystania z run tak samo, jak gdy korzystasz z magicznych zwojów.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_08"); //W miarê awansowania do kolejnych Krêgów, bêdziesz poznawa³ nowe runy.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_09"); //Wykorzystaj drzemi¹c¹ w runach moc do poznania samego siebie.
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
	AI_Output			(other, self,"KDW_600_Saturas_KREIS2_Info_15_01"); //Jestem gotowy do przyst¹pienia do Drugiego Krêgu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_02"); //Pozna³eœ ju¿ magiczn¹ naturê jêzyka runicznego. Teraz zg³êbisz jego tajniki.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_03"); //Po przyst¹pieniu do Drugiego Krêgu poznasz silniejsze zaklêcia ofensywne oraz tajemnicê magii uzdrawiaj¹cej.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_04"); //Musisz siê jeszcze wiele nauczyæ, zanim dane ci bêdzie poznaæ prawdziwe oblicze magii.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_05"); //Wiesz ju¿, ¿e runy mog¹ byæ wykorzystywane do chwili wyczerpania twoich w³asnych pok³adów si³y magicznej.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_06"); //Jednak zanim przyst¹pisz do dzia³ania, zastanów siê nad celem, jaki ci przyœwieca. Moce, którymi bêdziesz dysponowa³ mog¹ nieœæ œmieræ i zniszczenie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_07"); //Ale prawdziwy mag wykorzystuje swoje zdolnoœci tylko wtedy, gdy jest to absolutnie niezbêdne.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_08"); //Kiedy w pe³ni uœwiadomisz sobie ten fakt, zrozumiesz prawdê kryj¹c¹ siê za magi¹ runiczn¹.
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
	AI_Output			(other, self,"KDW_600_Saturas_KREIS3_Info_15_01"); //Mo¿esz mnie wprowadziæ w arkana Trzeciego Krêgu?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_02"); //Trzeci Kr¹g to jeden z najwa¿niejszych etapów w ¿yciu ka¿dego maga. Przystêpuj¹c do niego przestajesz byæ uczniem.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_03"); //Zaszed³eœ ju¿ bardzo daleko na œcie¿ce magii. Potrafisz pos³ugiwaæ siê runami.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_04"); //Ta wiedza pos³u¿y za fundament twojej dalszej nauki. U¿ywaj magii runicznej œwiadomie i z rozwag¹.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_05"); //To, czy z niej skorzystasz, czy nie, powinno zale¿eæ wy³¹cznie od ciebie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_06"); //Wybór, którego dokonasz, musi byæ ostateczny. W magii nie ma miejsca na wahanie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_07"); //WyobraŸ sobie wyraŸnie œcie¿kê, któr¹ chcesz kroczyæ i ponieœ wszelkie konsekwencje swojego wyboru.
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
	AI_Output			(other, self,"KDW_600_Saturas_KREIS4_Info_15_01"); //Jestem gotowy do przyst¹pienia do Czwartego Krêgu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_02"); //Ukoñczy³eœ ju¿ pierwsze trzy Krêgi. Nadesz³a pora, byœ zg³êbi³ prawdziw¹ naturê magii.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_03"); //Magia runiczna jest zaklêta w kamieniu. W koñcu runy to fragmenty magicznej rudy.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_04"); //Tej samej rudy, która wydobywana jest w kopalniach. Z pomoc¹ bogów runy nasycane s¹ magi¹ w naszych œwi¹tyniach staj¹c siê narzêdziem naszej potêgi.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_05"); //Z twoj¹ znajomoœci¹ magii runicznej, ca³a wiedza zgromadzona przez wszystkie œwi¹tynie w tym królestwie stoi przed tob¹ otworem.
		//AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_07"); //Pamiêtaj: poznanie natury magii jest kluczem do poznania natury potêgi i w³adzy.
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
	AI_Output			(other, self,"KDW_600_Saturas_KREIS5_Info_15_01"); //Jestem gotów do przyst¹pienia do Pi¹tego Krêgu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 5, LPCOST_TALENT_MAGE_5))
	{
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_02"); //Dobrze. Wprowadzê ciê w arkana Pi¹tego Krêgu Magii.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_03"); //Od tej pory bêdziesz móg³ wykorzystywaæ magiczne runy zaklêæ Ognistej Burzy i Lodowej Fali oraz posi¹dziesz moc niszczenia O¿ywieñców.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_04"); //Jednak najpotê¿niejszym zaklêciem Pi¹tego Krêgu Magii jest Tchnienie Œmierci. Gdyby uda³o ci siê kiedyœ odnaleŸæ tê runê, dysponowa³byœ niewyobra¿aln¹ moc¹.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_05"); //Staraj siê nie wykorzystywaæ magii tego rodzaju bez potrzeby. Jest ona darem od boga ciemnoœci!
		AI_Output		(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Nauczy³em ciê wszystkiego, co sam potrafiê.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_06"); //Poznaj granice swoich mo¿liwoœci, a poznasz samego siebie.
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
	AI_Output				(other, self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01"); //Chcia³bym nosiæ szatê Arcymaga Wody.
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) < 4)
	&& (Kapitel < 5)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02"); //Nie jesteœ jeszcze godzien nosiæ szatê Arcymaga.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03"); //Te kila bry³ek rudy, które posiadasz, nie wystarczy nawet na pokrycie kosztów jej utkania!
	}
	else
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04"); //Twój czas nadszed³. Jesteœ godzien, by od dziœ nosiæ szatê Arcymaga Wody.
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
	description = "Lee przyj¹³ mnie w poczet Najemników.";
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
	AI_Output			(hero,self,"Info_Saturas_NOWSLD_15_01"); //Lee przyj¹³ mnie w poczet Najemników.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_02"); //Dobrze. Bardzo dobrze. Teraz jesteœ oficjalnie cz³onkiem naszej spo³ecznoœci.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_03"); //Witaj wœród nas!

	B_LogEntry			(CH4_BannedFromOC,"Saturas oficjalnie przywita³ mnie w gronie Najemników.");
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
	description = "Kiedy wysy³a³eœ mnie do Magów Ognia, wspomnia³eœ coœ o... jeszcze jednym?";
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
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_01"); //Kiedy wysy³a³eœ mnie do Magów Ognia, wspomnia³eœ coœ o... jeszcze jednym?
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_02"); //Có¿, mia³em nadziejê, ¿e obejdziemy siê bez jego pomocy, ale w œwietle ostatnich wydarzeñ...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_03"); //O kim mówisz?
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_04"); //No dobrze ju¿, dobrze.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_05"); //Wiele lat temu...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_06"); //Wola³bym wersjê skrócon¹, jeœli ³aska!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_07"); //B¹dŸ cierpliwy. Có¿, kiedy tworzyliœmy magiczn¹ Barierê, nadzorowa³ nas jeszcze jeden, trzynasty mag. 
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_08"); //Trzynasty mag? Wed³ug legendy mia³o was byæ tylko dwunastu!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_09"); //Niewielu z ¿yj¹cych pamiêta dok³adnie wydarzenia tamtych dni, a my - magowie - woleliœmy nie odœwie¿aæ im niepotrzebnie pamiêci.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_10"); //Ten trzynasty mag by³ naszym przywódc¹. Oczywiœcie dzia³o siê to jeszcze przed podzia³em na Krêgi Wody i Ognia.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_11"); //Tu¿ po za³o¿eniu Starego Obozu - a wtedy by³ to jeszcze jedyny obóz w kolonii - ów mag postanowi³ wieœæ ¿ycie samotnika.
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
	description = "Jak ma na imiê ten trzynasty mag?";
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
	AI_Output			(hero,self,"Info_Saturas_XARDASWHO_15_01"); //Jak ma na imiê ten trzynasty mag?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_02"); //Nazywa³ siê Xardas. Dzisiaj ju¿ tylko garstka ludzi pamiêta o jego istnieniu.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_03"); //Ale ci, którzy go znali, nazywali go po prostu NEKROMANT¥!
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
	description = "Dlaczego opuœci³ Stary Obóz?";
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
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_01"); //Dlaczego opuœci³ Stary Obóz?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_02"); //Xardas chcia³ kontynuowaæ swe badania nad przyzywaniem o¿ywieñców i istot z innych wymiarów.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_03"); //Nie tylko Gomez zacz¹³ siê tym niepokoiæ. Pozostali magowie równie¿ krzywo patrzyli na niego i jego plugawe badania.
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_04"); //I co siê z nim sta³o?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_05"); //W odró¿nieniu od Gomeza, Xardas nie by³ rzeŸnikiem i wola³ unikn¹æ otwartego konfliktu. Pewnego dnia opuœci³ Obóz.
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
	description = "Wiesz mo¿e gdzie podziewa siê teraz ten trzynasty mag?";
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
	AI_Output			(hero,self,"Info_Saturas_XARDASWHERE_15_01"); //Wiesz mo¿e, gdzie podziewa siê teraz ten trzynasty mag?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_02"); //¯yje w odosobnieniu, w swej wie¿y, gdzieœ na terytoriach kontrolowanych przez Orków.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_03"); //To chyba najdalej wysuniêty na po³udnie punkt ca³ej kolonii.
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
	description = "Spróbujê dotrzeæ do tego Xardasa i poproszê go o pomoc!";
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
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_01"); //Spróbujê dotrzeæ do tego Xardasa i poproszê go o pomoc!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_02"); //Tylko on jeden mo¿e nas teraz uratowaæ.
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_03"); //A gdyby nawet on nie wiedzia³, jak nas st¹d wydostaæ, albo nie zechcia³ nam pomóc...
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_04"); //BÊDZIE... I ZECHCE!
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
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_02"); //Có¿, przez te wszystkie lata kilkakrotnie próbowaliœmy nawi¹zaæ z Xardasem jakiœ kontakt.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_03"); //Ale wygl¹da na to, ¿e nie ¿yczy sobie, ¿eby mu przeszkadzano.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_04"); //Co chcesz przez to powiedzieæ?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_05"); //¯aden z wys³anych przez nas pos³añców nie wróci³ z jego wie¿y.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_06"); //Musisz znaleŸæ jakiœ sposób, aby przedrzeæ siê przez stra¿ników Xardasa.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_07"); //Widzê, ¿e szykuje siê nie lada wyprawa!
	
	B_LogEntry			(CH4_FindXardas,"Saturas uprzedzi³ mnie o magicznych stra¿nikach Xardasa Nekromanty. W bibliotece Magów Wody znajdê informacje o silnych i s³abych stronach tych istot. Powinienem poœwiêciæ trochê czasu na przestudiowanie odpowiednich manuskryptów.");	
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
	description = "Jak mogê przedostaæ siê do Xardasa?";
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
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_01"); //Jak mogê przedostaæ siê do Xardasa?
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_02"); //Niestety, nie mam ¿adnego pomys³u...
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_03"); //Radzi³bym ci jednak rozejrzeæ siê trochê w naszej bibliotece.
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_04"); //Mo¿e w którejœ ze starych ksi¹g odnajdziesz jakieœ wskazówki co do mocnych i s³abych stron istot przywo³anych magicznie.
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_05"); //W takim razie pójdê rozejrzeæ siê trochê po bibliotece. Nie obawiaj siê...
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_06"); //Nied³ugo wrócê!

	B_LogEntry			(CH4_FindXardas,"W bibliotece Magów Wody znajduj¹ siê zapiski traktuj¹ce o sposobach walki z takimi istotami. Powinienem poœwiêciæ trochê czasu na przestudiowanie tych manuskryptów.");
	
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
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_00"); //Rozmawia³eœ z Xardasem?
	Info_ClearChoices	(KDW_600_Saturas_TIMESUP);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"No wiesz...",KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Nie...",KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"To nie jest tak jak myœlisz...",KDW_600_Saturas_TIMESUP_JA3);

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
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_07"); //Nie uda³o mi siê jeszcze do niego dotrzeæ.
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_08"); //Musisz go odnaleŸæ i poprosiæ go o pomoc!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};
func void KDW_600_Saturas_TIMESUP_JA3()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_09"); //To nie jest tak jak myœlisz...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_10"); //Jak to? Xardas musi nam pomóc w zdetonowaniu kopca rudy!
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_11"); //Kopiec... jest... Ehm... Jest ju¿ bardzo du¿y!
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_12"); //ZnajdŸ Xardasa! On musi nam pomóc!
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
	description		= "Nefarius powiedzia³, ¿e mogê ju¿ za³o¿yæ szatê Maga Wody."; 
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
	AI_Output(other, self,"KDW_600_Saturas_HogeAUFNAHME_15_00"); //Nefarius powiedzia³, ¿e mogê ju¿ za³o¿yæ szatê Maga Wody.
	
	/* AB HIER IST ALLES DOPPELT - geklaut aus der KdF-KdW-Aufnahme */
	
	AI_Output(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Zatem witaj w naszej spo³ecznoœci!
	AI_Output(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Czy to oznacza, ¿e nale¿ê teraz do krêgu Magów Wody?
	AI_Output(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Jeszcze nie. Najpierw musisz z³o¿yæ œluby Wody.
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
	description		= "Jestem gotów do z³o¿enia œlubów."; 
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
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Jestem gotów do z³o¿enia œlubów.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Powtarzaj za mn¹ s³owa przysiêgi:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Przysiêgam, na wszechmocnych bogów...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Przysiêgam, na wszechmocnych bogów...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...Przysiêgam, na potêgê œwiêtej Wody...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...Przysiêgam, na potêgê œwiêtej Wody...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...¯e ma wiedza i me czyny teraz i na wieki stanowiæ bêd¹ jednoœæ z Wod¹...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...¯e ma wiedza i me czyny teraz i na wieki stanowiæ bêd¹ jednoœæ z Wod¹...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...Dopóki me cia³o nie powróci do królestwa Beliara, gdy Ÿród³o mego ¿ycia wyschnie.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...Dopóki me cia³o nie powróci do królestwa Beliara, gdy Ÿród³o mego ¿ycia wyschnie.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //Noœ tê szatê, jako symbol twojego przymierza ze œwiêt¹ Wod¹ i wszechmocnym Adanosem.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	Log_CreateTopic		(CH4_SldToKdW,	LOG_NOTE);
	B_LogEntry			(CH4_SldToKdW,"Saturas przyj¹³ mnie w poczet Magów Wody.");

	AI_StopProcessInfos	(self);
};

