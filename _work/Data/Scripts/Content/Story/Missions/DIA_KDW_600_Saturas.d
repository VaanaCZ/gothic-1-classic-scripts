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
	AI_Output			(self, other,"Info_Saturas_EXIT_14_01"); //Oby� wr�ci� ca�y i zdrowy!

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
	AI_Output			(self, other,"Info_Saturas_Intruder_14_00"); //Co ty tu robisz? Nie masz tu czego szuka�! Precz!

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
	description = "Mam wa�ne wie�ci z obozu Bractwa!";
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
	AI_Output			(other, self,"Info_Saturas_NEWS_15_01"); //Mam wa�ne wie�ci z obozu Bractwa!
	AI_Output			(self, other,"Info_Saturas_NEWS_14_02"); //Je�li Cronos pozwoli� ci mnie odwiedzi�, musia�o si� sta� co� naprawd� wa�nego!
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
	description = "Y'Berion nie �yje!";
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
	AI_Output			(other, self,"Info_Saturas_YBERION_15_01"); //Y'Berion nie �yje! Zgin�� podczas rytua�u przyzwania �ni�cego.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_02"); //Y'Berion martwy? To z�e wie�ci... Bardzo z�e.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_03"); //Kto teraz przewodzi Bractwu? Czy�by ten zbyt ambitny, jadowity w�� - Cor Kalom?
	AI_Output			(other, self,"Info_Saturas_YBERION_15_04"); //Nie! Kalom wyrzek� si� Bractwa. Zabra� ze sob� kilku Stra�nik�w �wi�tynnych. Nikt nie wie dok�d si� udali.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_05"); //Jak to mo�liwe? By� najwa�niejszym cz�onkiem Bractwa, zaraz po Y'Berionie!
	AI_Output			(other, self,"Info_Saturas_YBERION_15_06"); //Pewne wydarzenia u�wiadomi�y wszystkim Guru, �e droga, kt�r� pod��ali by�a b��dna. Ich rzekomy b�g okaza� si� niszczycielskim demonem.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_07"); //Pod wp�ywem �ni�cego, jeden z Guru pr�bowa� mnie zg�adzi�, mimo, i� kilka chwil wcze�niej ocali�em jego �ycie.
	AI_Output			(other, self,"Info_Saturas_YBERION_15_08"); //Cor Kalom by� jedynym Guru, kt�ry nie chcia� uzna� prawdziwej natury �ni�cego. W�a�nie dlatego opu�ci� ob�z na bagnie.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_09"); //Rozumiem! C�, przynajmniej tutaj mamy troch� szcz�cia. Cor Angar to dobry cz�owiek. Twardy, ale uczciwy.
	AI_Output			(self, other,"Info_Saturas_YBERION_14_10"); //Je�li kto� mo�e zapobiec ca�kowitemu rozpadowi Bractwa po tej katastrofie, to w�a�nie on.

	B_LogEntry		(CH3_EscapePlanNC,"Opowiedzia�em Saturasowi o wydarzeniach z obozu na bagnie. Wyrazi� zadowolenie z faktu, �e Cor Angar zosta� przyw�dc� Bractwa.");
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
	AI_Output			(other, self,"Info_Saturas_BOOK_15_02"); //Y'Berion wykorzysta� go do na�adowania kamienia ogniskuj�cego.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_03"); //�wietnie. Wiedza zawarta w tej ksi�dze pozwoli nam na�adowa� pi�� pierwotnych kamieni ogniskuj�cych.
	AI_Output			(self, other,"Info_Saturas_BOOK_14_04"); //Wezm� ten almanach!

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
	description = "Mam tu ten kamie� ogniskuj�cy...";
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
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_01"); //Mam tu ten kamie� ogniskuj�cy...
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_02"); //Trzymasz w r�ku klucz, kt�ry mo�e nas wyzwoli� z kajdan niewolnictwa.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_03"); //To jeden z pi�ciu kamieni ogniskuj�cych, kt�re wykorzystywano podczas tworzenia Magicznej Bariery.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_04"); //A my z pomoc� tej samej si�y ogniskuj�cej zniszczymy wielk� magiczn� Barier�.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_05"); //Ale czy do tego nie b�dzie potrzeba pot�nego �r�d�a magicznej energii?
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_06"); //To prawda. Dlatego przez te wszystkie lata gromadzili�my rud�, zamiast wymienia� j� na towary z zewn�trznego �wiata.
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_07"); //Jak zapewne wiesz, ka�dy kawa�ek rudy zawiera niewielki �adunek energii magicznej. Mamy nadziej�, �e wyzwalaj�c jednocze�nie ca�y potencja� zgromadzonego przez nas kopca, b�dziemy w stanie zniszczy� Barier�.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_08"); //To chyba do�� ryzykowne?
	AI_Output			(self, other,"Info_Saturas_FOCUS_14_09"); //Eksplozja energii magicznej mo�e zniszczy� wy��cznie twory utworzone lub zmodyfikowane przy u�yciu magii. Nie istnieje �adne zagro�enie dla istot ludzkich.
	AI_Output			(other, self,"Info_Saturas_FOCUS_15_10"); //Prosz�, oto kamie� ogniskuj�cy. Mam nadziej�, �e wasze plany zwi�zane z detonacj� kopca powiod� si�.

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
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_03"); //Nic. Najpierw musimy odnale�� pozosta�e cztery kamienie ogniskuj�ce!
	AI_Output			(self, other,"Info_Saturas_WHATNOW_14_04"); //Niestety, nie trafili�my jeszcze na �lad �adnego z kamieni.
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
	description = "M�g�bym spr�bowa� odnale�� brakuj�ce kamienie.";
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
	AI_Output			(other, self,"Info_Saturas_OFFER_15_01"); //M�g�bym spr�bowa� odnale�� brakuj�ce kamienie.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_02"); //Koniec ko�c�w - mi te� zale�y na wydostaniu si� z tej kolonii.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_03"); //Musz� ci� ostrzec: te poszukiwania mog� si� okaza� r�wnie trudne co i niebezpieczne.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_04"); //Konflikt ze Starym Obozem zaostrza si� z dnia na dzie�. Nie mog� ci nawet przydzieli� eskorty Najemnik�w.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_05"); //B�dziesz zdany wy��cznie na siebie.
	AI_Output			(other, self,"Info_Saturas_OFFER_15_06"); //C�... To mi nie pierwszyzna! Jako� sobie poradz�.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_07"); //Twoja pewno�� siebie dobrze o tobie �wiadczy, ale przyda ci si� kilka przedmiot�w...
	AI_Output			(self, other,"Info_Saturas_OFFER_14_08"); //We� t� map�. Jest do�� stara, ale zaznaczono na niej oryginalne rozmieszczenie kamieni ogniskuj�cych w chwili tworzenia Bariery.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_09"); //Ten zw�j magiczny pozwoli ci b�yskawicznie przenie�� si� do naszego obozu.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_10"); //Na koniec powiniene� jeszcze porozmawia� z Riordianem. To cz�owiek, kt�ry przygotowuje magiczne wywary dla naszego obozu.
	AI_Output			(self, other,"Info_Saturas_OFFER_14_11"); //Znajdziesz go w jego chacie, tutaj, na najwy�szym poziomie.

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
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_01"); //Hmmm, na dobry pocz�tek wystarczy. Nie�le sobie radzisz.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_02"); //Musisz jeszcze odnale�� trzy pozosta�e kamienie.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_03"); //Ruszaj w drog�! Nie zosta�o nam zbyt wiele czasu.
		Saturas_BringFoci = 2;	
		B_GiveXP  		(XP_DeliverSecondFocus);
	}

	//-------- 3. Fokus abliefern --------
	else if	(Saturas_BringFoci == 2)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_04"); //�wietnie. To ju� drugi kamie�, kt�ry nam przynosisz!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_05"); //Jeste�my ju� znacznie bli�ej naszego celu.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_06"); //Nie ustawaj w wysi�kach. Potrzebujemy jeszcze dw�ch kamieni ogniskuj�cych.
		Saturas_BringFoci = 3;	
		B_GiveXP  		(XP_DeliverThirdFocus);
	}
	
	//-------- 4. Fokus abliefern --------
	else if	(Saturas_BringFoci == 3)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_07"); //Niesamowite! Mamy ju� cztery kamienie ogniskuj�ce!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_08"); //Brakuje jeszcze tylko jednego!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_09"); //Odda�e� naszej spo�eczno�ci nieocenione us�ugi. Je�li uda ci si� odnale�� ostatni z kamieni, wkr�tce b�dziemy zn�w na wolno�ci!
		Saturas_BringFoci = 4;	
		B_GiveXP  		(XP_DeliverFourthFocus);
	}
	
	//-------- 5. Fokus abliefern --------
	else if	(Saturas_BringFoci == 4)
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_10"); //Wspaniale! Mamy ju� wszystkie pi�� kamieni!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_11"); //Nie wiem jak b�dziemy ci si� mogli odwdzi�czy�! Jestem twoim dozgonnym d�u�nikiem.
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_12"); //P�jd� teraz do Riordiana. On da ci chocia� skromn� namiastk� nagrody za twoje wysi�ki!
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_13"); //Porozmawiaj r�wnie� z Cronosem, stra�nikiem rudy. Od niego dostaniesz kolejny wyraz naszej wdzi�czno�ci.

		Saturas_BringFoci = 5;	
		B_GiveXP  			(XP_DeliverFifthFocus);

		B_LogEntry		(CH3_BringFoci,"Uda�o mi si� odnale�� wszystkie cztery kamienie ogniskuj�ce. Saturas jest niezwykle szcz�liwy. Nowy Ob�z ma u mnie chyba d�ug wdzi�czno�ci.");
		B_LogEntry		(CH3_BringFoci,"Cronos i Riordian obiecali mi nagrod� za odnalezienie wszystkich kamieni ogniskuj�cych. Powinienem ich odwiedzi�.");

		
		// Aufhebung des Log_running_Status, wenn die Foki schon vorher abgegeben wurden, bevor SC die einzelnen Auftr�ge bekam.    ***Bj�rn***
		
		Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Stonehenge,	LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_Fortress,		LOG_SUCCESS);
		Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_SUCCESS);

	};
		
	//-------- Neuer Teleportzauber ? --------
	if ( !Npc_HasItems(hero, ItArScrollTeleport2) && (Saturas_BringFoci < 5) )	
	{
		AI_Output		(self, other,"Info_Saturas_BRINGFOCUS_14_14"); //Widz�, �e wykorzysta�e� zw�j teleportacyjny. Prosz�, we� nast�pny.
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
	description = "Znalaz�em kamie� ogniskuj�cy w kanionie Trolli!";
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
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS2_15_01"); //Znalaz�em kamie� ogniskuj�cy w kanionie Trolli!

	B_LogEntry		(CH3_TrollCanyon,"Kamie� z kanionu trolli jest ju� bezpieczny u Saturasa.");
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
	description = "Znalaz�em kamie� ogniskuj�cy w g�rskiej fortecy!";
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
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS3_15_01"); //Znalaz�em kamie� ogniskuj�cy w g�rskiej fortecy!

	B_LogEntry		(CH3_Fortress,"Wr�czy�em Saturasowi kamie� z g�rskiej fortecy.");
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
	description = "Znalaz�em kamie� ogniskuj�cy w ruinach starego klasztoru!";
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
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_01"); //Znalaz�em kamie� ogniskuj�cy w ruinach starego klasztoru!
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS4_15_02"); //Spotka�em tam Gorna, tego Najemnika. Pom�g� mi w poszukiwaniach.

	B_LogEntry		(CH3_MonasteryRuin,"Wreszcie mog�em odda� Saturasowi kamie� ze starego klasztoru.");
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
	description = "Znalaz�em kamie� ogniskuj�cy pod kamiennym kr�giem!";
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
	AI_Output			(other, self,"Info_Saturas_BRINGFOCUS5_15_01"); //Znalaz�em kamie� ogniskuj�cy pod kamiennym kr�giem!

	B_LogEntry		(CH3_Stonehenge,"Przekaza�em Saturasowi kamie� z krypty pod kamiennym kr�giem.");
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
	description = "Czy mo�ecie teraz przyst�pi� do detonacji kopca rudy?";
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
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_01"); //Czy mo�ecie teraz przyst�pi� do detonacji kopca rudy?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_02"); //Mamy ju� wszystkie artefakty niezb�dne do wprowadzenia naszego planu w �ycie.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_03"); //Ale Barier� utworzy�o dwunastu mag�w.
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_04"); //W ca�ym Kr�gu Wody nie ma do�� mistrz�w magii, by zapanowa� nad tak ogromn� ilo�ci� energii. Nie m�wi�c ju� o jej odpowiednim ukierunkowaniu!
	AI_Output			(other, self,"Info_Saturas_ALLFOCI_15_05"); //I co teraz zrobimy?
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_06"); //Wiem ile ju� zrobi�e� dla naszej spo�eczno�ci. Wszyscy jeste�my twoimi d�u�nikami...
	AI_Output			(self, other,"Info_Saturas_ALLFOCI_14_07"); //...Ale w interesie wszystkich mieszka�c�w kolonii musz� ci� poprosi� o jeszcze jedn� przys�ug�.
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
	description = "Jeszcze jedn� przys�ug�?";
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
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_01"); //Jeszcze jedn� przys�ug�?
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_02"); //Tak. Musisz i�� do Starego Obozu i przekona� do naszej sprawy kilku Mag�w Ognia.
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_03"); //MAG�W OGNIA?? My�lisz, �e zechc� przy��czy� si� do was i zrezygnowa� ze swego wygodnego �ycia?
	AI_Output			(other, self,"Info_Saturas_FAVOR_15_04"); //Przecie� upadek Bariery pozbawi ich uprzywilejowanej pozycji!
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_05"); //W�a�nie dlatego to TY musisz podj�� si� tego zadania. Znasz ludzi ze wszystkich oboz�w w ca�ej kolonii.
	AI_Output			(self, other,"Info_Saturas_FAVOR_14_06"); //Przypomnij Magom Ognia stare czasy, kiedy wsp�lnie studiowali�my sztuki magiczne.
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
	description = "No dobrze. Spr�buj� jako� przekona� Mag�w Ognia!";
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
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_01"); //No dobrze. Spr�buj� jako� przekona� Mag�w Ognia!
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_02"); //Ale nic nie obiecuj�! Obawiam si�, �e to zadanie jest z g�ry skazane na niepowodzenie!
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_03"); //Musisz chocia� spr�bowa�. Je�li ci si� nie powiedzie, jest ju� tylko jeden...
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_04"); //Tylko jeden...
	AI_Output			(other, self,"Info_Saturas_ACCEPT_15_05"); //...jeden CO?
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_06"); //Niewa�ne! MUSI ci si� uda�!
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_07"); //We� t� magiczn� run� jako znak naszego zaufania. Poka�esz j� Corristo, Arcymistrzowi Mag�w Ognia.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_08"); //Dzi�ki jej pomocy b�dzie m�g� przeteleportowa� si� do tej komnaty, nie przechodz�c przez posterunki stra�y.
	AI_Output			(self, other,"Info_Saturas_ACCEPT_14_09"); //Mam nadziej�, �e to przekona naszych dawnych przyjaci� o szczero�ci naszych intencji.

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
	
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_01"); //Ciesz� si�, �e wr�ci�e�. Sta�o si� co� strasznego!
	AI_Output			(hero,self,"Info_Saturas_AMBUSH_15_02"); //Niech zgadn�: Wolna Kopalnia zosta�a zaatakowana przez Stra�nik�w ze Starego Obozu, kt�rzy niespodziewanie wyro�li jak spod ziemi?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_03"); //Zaraz... Jak... Ale� oczywi�cie! Dowiedzia�e� si� o tym w Starym Obozie!
	AI_Output	 		(self,hero,"Info_Saturas_AMBUSH_14_04"); //Gorn zjawi� si� tutaj tu� przed tob�.
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_05"); //Co mog�o sk�oni� Gomeza do podj�cia tak drastycznych dzia�a�?
	AI_Output			(self,hero,"Info_Saturas_AMBUSH_14_06"); //Przecie� musia� zdawa� sobie spraw�, �e ten napad stanowi wypowiedzenie wojny.
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
	description = "Stara Kopalnia zosta�a zalana przez podziemn� rzek�!";
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
	AI_Output			(hero,self,"Info_Saturas_COLLAPSE_15_01"); //Stara Kopalnia zosta�a zalana przez podziemn� rzek�!
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_02"); //...Zalana... Naturalnie... Teraz zaczynam rozumie�...
	AI_Output			(self,hero,"Info_Saturas_COLLAPSE_14_03"); //Gomez zosta� przyparty do muru. Jest teraz jeszcze gro�niejszy ni� kiedy�. Nie ma nic do stracenia, wi�c sta� si� ca�kowicie nieobliczalny!
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
	description = "Gomez wymordowa� wszystkich Mag�w Ognia!";
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
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_01"); //Gomez wymordowa� wszystkich Mag�w Ognia!
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_02"); //WYMORDOWA�?!? Na Beliara, czemu mia�by zrobi� co� takiego?!
	AI_Output			(hero,self,"Info_Saturas_MURDER_15_03"); //Magowie sprzeciwili si� atakowi na Woln� Kopalni�, a tym samym stan�li Gomezowi na drodze.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_04"); //Zatem jeste�my zgubieni. Bez pomocy pozosta�ych sze�ciu mag�w nie uda si� nam zapanowa� nad energi� wyzwolon� podczas detonacji kopca.
	AI_Output			(self,hero,"Info_Saturas_MURDER_14_05"); //Mimo wszystko, dzi�kuj� ci za dostarczenie tych przykrych wie�ci. Wr�g ju� nas nie zaskoczy.

	B_GiveXP			(XP_ReportToSaturas);
	
	B_LogEntry			(CH4_Firemages,"Saturas zasmuci� si� na wie�� o wydarzeniach w Starym Obozie. Cokolwiek zamierzaj� zrobi� w sprawie ucieczki... b�d� musieli oby� si� bez pomocy Mag�w Ognia.");
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
	description		= "Wygnano mnie ze Starego Obozu za to, �e wam pomog�em!"; 
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
	AI_Output			(other, self,"KDW_600_Saturas_NOMOREOC_Info_15_01"); //Wygnano mnie ze Starego Obozu za to, �e wam pomog�em!
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_02"); //Nie nale�ysz ju� do Starego Obozu?
	AI_Output			(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Zatem witaj w naszej spo�eczno�ci!

	Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
	B_LogEntry			(CH4_BannedFromOC,"Po tym, jak zosta�em przep�dzony przez ludzi Gomeza, Saturas z otwartymi ramionami przyj�� mnie do Nowego Obozu!");
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
	description		= "Czy to oznacza, �e zostan� przyj�ty w poczet Najemnik�w?"; 
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
	AI_Output			(other, self,"KDW_600_Saturas_GOTOLEE_Info_15_01"); //Czy to oznacza, �e zostan� przyj�ty w poczet Najemnik�w?
	AI_Output			(self, other,"KDW_600_Saturas_GOTOLEE_Info_14_02"); //Porozmawiaj z Lee. On si� tob� zajmie. Ale potem zajrzyj koniecznie do mnie!

	B_LogEntry			(CH4_BannedFromOC,"Lee, przyw�dca Najemnik�w, chce si� ze mn� widzie�. Po rozmowie z nim mam wr�ci� do Saturasa."); 
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
	description		= "Czy to oznacza, �e nale�� teraz do kr�gu Mag�w Wody?"; 
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
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Czy to oznacza, �e nale�� teraz do kr�gu Mag�w Wody?
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Jeszcze nie. Najpierw musisz z�o�y� �luby Wody.
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_03"); //Ale sk�ada�em ju� przysi�g� Ognia!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_04"); //Hmmm...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_05"); //Przecie� nie musisz jednocze�nie �ama� z�o�onej przysi�gi!
	AI_Output			(other, self,"KDW_600_Saturas_OATH_Info_15_06"); //Eee... Nie rozumiem...
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_07"); //Ty j� tylko rozszerzysz. Od tej pory b�dziesz magiem w s�u�bie obydwu �ywio��w!
	AI_Output			(self, other,"KDW_600_Saturas_OATH_Info_14_08"); //Posi�dziesz si�� Ognia oraz m�dro�� Wody jednocze�nie!

	B_LogEntry			(CH4_BannedFromOC,"Saturas pozwoli mi do��czy� do Kr�gu Wody. Nie b�d� przy tym musia� �ama� mojej przysi�gi Ognia!"); 
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
	description		= "Jestem got�w do z�o�enia �lub�w."; 
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
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Jestem got�w do z�o�enia �lub�w.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_02"); //S�ugo Ognia, otrzymasz teraz b�ogos�awie�stwo Wody!
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Powtarzaj za mn� s�owa przysi�gi:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Przysi�gam, na wszechmocnych bog�w...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Przysi�gam, na wszechmocnych bog�w...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...Przysi�gam, na pot�g� �wi�tej Wody...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...Przysi�gam, na pot�g� �wi�tej Wody...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...�e ma wiedza i me czyny teraz i na wieki stanowi� b�d� jedno�� z Wod�...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...�e ma wiedza i me czyny teraz i na wieki stanowi� b�d� jedno�� z Wod�...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...Dop�ki me cia�o nie powr�ci do kr�lestwa Beliara, gdy �r�d�o mego �ycia wyschnie.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...Dop�ki me cia�o nie powr�ci do kr�lestwa Beliara, gdy �r�d�o mego �ycia wyschnie.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_12"); //Sk�adaj�c t� przysi�g� zjednoczy�e� w sobie pot�g� Ognia i b�ogos�awie�stwo Wody.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_13"); //Po��czy�e� teraz to, co niegdy� rozdzielono. Niech twe �ycie i czyny b�d� znakiem zjednoczenia pot�gi �ywio��w.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //No� t� szat�, jako symbol twojego przymierza ze �wi�t� Wod� i wszechmocnym Adanosem.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	B_LogEntry			(CH4_BannedFromOC,"Do��czy�em do Mag�w Wody. Od tej chwili uzyska�em dost�p do obydwu szk� magii."); 
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
	description		= "Mo�esz mnie czego� nauczy�?"; 
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
	AI_Output			(other, self,"KDW_600_Saturas_LESSON_Info_15_01"); //Mo�esz mnie czego� nauczy�?
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) <= 3)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_02"); //Przed tob� jeszcze wiele nauki. Rozpoczniemy zaj�cia, gdy b�dziesz got�w.
	}
	else if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) == 4)
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_03"); //Jest jeszcze jeden Kr�g, o kt�rym nie wiesz. Opowiem ci o nim, gdy b�dziesz got�w.
	}
	else
	{
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_04"); //Opanowa�e� ju� umiej�tno�ci z Pi�tego Kr�gu magii. Nauczy�em ci� wszystkiego co sam wiem.
		AI_Output		(self, other,"KDW_600_Saturas_LESSON_Info_14_05"); //Wi�cej nie jestem w stanie ci� nauczy�!
	};

	Log_CreateTopic		(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Saturas, przyw�dca Mag�w Wody, mo�e mnie wprowadzi� w kolejne kr�gi magii. Przebywa zwykle przy pentagramie, na g�rnym poziomie.");
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
	AI_Output			(other, self,"KDW_600_Saturas_KREIS1_Info_15_01"); //Jestem got�w, by przyst�pi� do Pierwszego Kr�gu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_02"); //Przyst�pienie do Pierwszego Kr�gu wi��e si� z poznaniem tajnik�w magii runicznej.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_03"); //Ka�da runa zawiera esencj� szczeg�lnego zakl�cia magicznego.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_04"); //Wykorzystuj�c swoje zdolno�ci magiczne, b�dziesz w stanie j� uwolni�.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_05"); //W odr�nieniu od magicznych zwoj�w zawieraj�cych formu�y zakl��, magia zawarta w runach jest trwa�a.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_06"); //Runy s� �r�d�em czarodziejskiej mocy, na kt�rym mo�esz polega� w ka�dej sytuacji.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_07"); //Twoja w�asna magia potrzebna jest podczas korzystania z run tak samo, jak gdy korzystasz z magicznych zwoj�w.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_08"); //W miar� awansowania do kolejnych Kr�g�w, b�dziesz poznawa� nowe runy.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS1_Info_14_09"); //Wykorzystaj drzemi�c� w runach moc do poznania samego siebie.
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
	AI_Output			(other, self,"KDW_600_Saturas_KREIS2_Info_15_01"); //Jestem gotowy do przyst�pienia do Drugiego Kr�gu.
	
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2, LPCOST_TALENT_MAGE_2))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_02"); //Pozna�e� ju� magiczn� natur� j�zyka runicznego. Teraz zg��bisz jego tajniki.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_03"); //Po przyst�pieniu do Drugiego Kr�gu poznasz silniejsze zakl�cia ofensywne oraz tajemnic� magii uzdrawiaj�cej.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_04"); //Musisz si� jeszcze wiele nauczy�, zanim dane ci b�dzie pozna� prawdziwe oblicze magii.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_05"); //Wiesz ju�, �e runy mog� by� wykorzystywane do chwili wyczerpania twoich w�asnych pok�ad�w si�y magicznej.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_06"); //Jednak zanim przyst�pisz do dzia�ania, zastan�w si� nad celem, jaki ci przy�wieca. Moce, kt�rymi b�dziesz dysponowa� mog� nie�� �mier� i zniszczenie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_07"); //Ale prawdziwy mag wykorzystuje swoje zdolno�ci tylko wtedy, gdy jest to absolutnie niezb�dne.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS2_Info_14_08"); //Kiedy w pe�ni u�wiadomisz sobie ten fakt, zrozumiesz prawd� kryj�c� si� za magi� runiczn�.
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
	AI_Output			(other, self,"KDW_600_Saturas_KREIS3_Info_15_01"); //Mo�esz mnie wprowadzi� w arkana Trzeciego Kr�gu?
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_02"); //Trzeci Kr�g to jeden z najwa�niejszych etap�w w �yciu ka�dego maga. Przyst�puj�c do niego przestajesz by� uczniem.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_03"); //Zaszed�e� ju� bardzo daleko na �cie�ce magii. Potrafisz pos�ugiwa� si� runami.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_04"); //Ta wiedza pos�u�y za fundament twojej dalszej nauki. U�ywaj magii runicznej �wiadomie i z rozwag�.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_05"); //To, czy z niej skorzystasz, czy nie, powinno zale�e� wy��cznie od ciebie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_06"); //Wyb�r, kt�rego dokonasz, musi by� ostateczny. W magii nie ma miejsca na wahanie.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS3_Info_14_07"); //Wyobra� sobie wyra�nie �cie�k�, kt�r� chcesz kroczy� i ponie� wszelkie konsekwencje swojego wyboru.
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
	AI_Output			(other, self,"KDW_600_Saturas_KREIS4_Info_15_01"); //Jestem gotowy do przyst�pienia do Czwartego Kr�gu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_02"); //Uko�czy�e� ju� pierwsze trzy Kr�gi. Nadesz�a pora, by� zg��bi� prawdziw� natur� magii.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_03"); //Magia runiczna jest zakl�ta w kamieniu. W ko�cu runy to fragmenty magicznej rudy.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_04"); //Tej samej rudy, kt�ra wydobywana jest w kopalniach. Z pomoc� bog�w runy nasycane s� magi� w naszych �wi�tyniach staj�c si� narz�dziem naszej pot�gi.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_05"); //Z twoj� znajomo�ci� magii runicznej, ca�a wiedza zgromadzona przez wszystkie �wi�tynie w tym kr�lestwie stoi przed tob� otworem.
		//AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Du hast jetzt alles gelernt, was ich dir beibringen kann.
		AI_Output			(self, other,"KDW_600_Saturas_KREIS4_Info_14_07"); //Pami�taj: poznanie natury magii jest kluczem do poznania natury pot�gi i w�adzy.
		KDW_600_Saturas_KREIS4.permanent = 0;
	};
};  
/*------------------------------------------------------------------------
							DER F�NFTE KREIS							
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
	AI_Output			(other, self,"KDW_600_Saturas_KREIS5_Info_15_01"); //Jestem got�w do przyst�pienia do Pi�tego Kr�gu.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 5, LPCOST_TALENT_MAGE_5))
	{
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_02"); //Dobrze. Wprowadz� ci� w arkana Pi�tego Kr�gu Magii.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_03"); //Od tej pory b�dziesz m�g� wykorzystywa� magiczne runy zakl�� Ognistej Burzy i Lodowej Fali oraz posi�dziesz moc niszczenia O�ywie�c�w.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_04"); //Jednak najpot�niejszym zakl�ciem Pi�tego Kr�gu Magii jest Tchnienie �mierci. Gdyby uda�o ci si� kiedy� odnale�� t� run�, dysponowa�by� niewyobra�aln� moc�.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_05"); //Staraj si� nie wykorzystywa� magii tego rodzaju bez potrzeby. Jest ona darem od boga ciemno�ci!
		AI_Output		(self, other,"KDW_600_Saturas_KREIS4_Info_14_06"); //Nauczy�em ci� wszystkiego, co sam potrafi�.
		AI_Output		(self, other,"KDW_600_Saturas_KREIS5_Info_14_06"); //Poznaj granice swoich mo�liwo�ci, a poznasz samego siebie.
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
	AI_Output				(other, self,"KDW_600_Saturas_HEAVYARMOR_Info_15_01"); //Chcia�bym nosi� szat� Arcymaga Wody.
	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE ) < 4)
	&& (Kapitel < 5)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_02"); //Nie jeste� jeszcze godzien nosi� szat� Arcymaga.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_KDW_ARMOR_H)
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_03"); //Te kila bry�ek rudy, kt�re posiadasz, nie wystarczy nawet na pokrycie koszt�w jej utkania!
	}
	else
	{
		AI_Output			(self, other,"KDW_600_Saturas_HEAVYARMOR_Info_14_04"); //Tw�j czas nadszed�. Jeste� godzien, by od dzi� nosi� szat� Arcymaga Wody.
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
	description = "Lee przyj�� mnie w poczet Najemnik�w.";
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
	AI_Output			(hero,self,"Info_Saturas_NOWSLD_15_01"); //Lee przyj�� mnie w poczet Najemnik�w.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_02"); //Dobrze. Bardzo dobrze. Teraz jeste� oficjalnie cz�onkiem naszej spo�eczno�ci.
	AI_Output			(self,hero,"Info_Saturas_NOWSLD_14_03"); //Witaj w�r�d nas!

	B_LogEntry			(CH4_BannedFromOC,"Saturas oficjalnie przywita� mnie w gronie Najemnik�w.");
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
	description = "Kiedy wysy�a�e� mnie do Mag�w Ognia, wspomnia�e� co� o... jeszcze jednym?";
};

FUNC INT Info_Saturas_XARDAS_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Saturas_COLLAPSE)
	&&	Npc_KnowsInfo(hero, Info_Saturas_MURDER)
	{		 										//***Bj�rn***>

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
		}; 											<***Bj�rn***
*/												

	};	
};

FUNC VOID Info_Saturas_XARDAS_Info()
{
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_01"); //Kiedy wysy�a�e� mnie do Mag�w Ognia, wspomnia�e� co� o... jeszcze jednym?
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_02"); //C�, mia�em nadziej�, �e obejdziemy si� bez jego pomocy, ale w �wietle ostatnich wydarze�...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_03"); //O kim m�wisz?
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_04"); //No dobrze ju�, dobrze.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_05"); //Wiele lat temu...
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_06"); //Wola�bym wersj� skr�con�, je�li �aska!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_07"); //B�d� cierpliwy. C�, kiedy tworzyli�my magiczn� Barier�, nadzorowa� nas jeszcze jeden, trzynasty mag. 
	AI_Output			(hero,self,"Info_Saturas_XARDAS_15_08"); //Trzynasty mag? Wed�ug legendy mia�o was by� tylko dwunastu!
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_09"); //Niewielu z �yj�cych pami�ta dok�adnie wydarzenia tamtych dni, a my - magowie - woleli�my nie od�wie�a� im niepotrzebnie pami�ci.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_10"); //Ten trzynasty mag by� naszym przyw�dc�. Oczywi�cie dzia�o si� to jeszcze przed podzia�em na Kr�gi Wody i Ognia.
	AI_Output			(self,hero,"Info_Saturas_XARDAS_14_11"); //Tu� po za�o�eniu Starego Obozu - a wtedy by� to jeszcze jedyny ob�z w kolonii - �w mag postanowi� wie�� �ycie samotnika.
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
	description = "Jak ma na imi� ten trzynasty mag?";
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
	AI_Output			(hero,self,"Info_Saturas_XARDASWHO_15_01"); //Jak ma na imi� ten trzynasty mag?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_02"); //Nazywa� si� Xardas. Dzisiaj ju� tylko garstka ludzi pami�ta o jego istnieniu.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHO_14_03"); //Ale ci, kt�rzy go znali, nazywali go po prostu NEKROMANT�!
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
	description = "Dlaczego opu�ci� Stary Ob�z?";
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
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_01"); //Dlaczego opu�ci� Stary Ob�z?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_02"); //Xardas chcia� kontynuowa� swe badania nad przyzywaniem o�ywie�c�w i istot z innych wymiar�w.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_03"); //Nie tylko Gomez zacz�� si� tym niepokoi�. Pozostali magowie r�wnie� krzywo patrzyli na niego i jego plugawe badania.
	AI_Output			(hero,self,"Info_Saturas_XARDASWHY_15_04"); //I co si� z nim sta�o?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHY_14_05"); //W odr�nieniu od Gomeza, Xardas nie by� rze�nikiem i wola� unikn�� otwartego konfliktu. Pewnego dnia opu�ci� Ob�z.
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
	description = "Wiesz mo�e gdzie podziewa si� teraz ten trzynasty mag?";
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
	AI_Output			(hero,self,"Info_Saturas_XARDASWHERE_15_01"); //Wiesz mo�e, gdzie podziewa si� teraz ten trzynasty mag?
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_02"); //�yje w odosobnieniu, w swej wie�y, gdzie� na terytoriach kontrolowanych przez Ork�w.
	AI_Output			(self,hero,"Info_Saturas_XARDASWHERE_14_03"); //To chyba najdalej wysuni�ty na po�udnie punkt ca�ej kolonii.
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
	description = "Spr�buj� dotrze� do tego Xardasa i poprosz� go o pomoc!";
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
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_01"); //Spr�buj� dotrze� do tego Xardasa i poprosz� go o pomoc!
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_02"); //Tylko on jeden mo�e nas teraz uratowa�.
	AI_Output			(self,hero,"Info_Saturas_XARDASHELP_14_03"); //A gdyby nawet on nie wiedzia�, jak nas st�d wydosta�, albo nie zechcia� nam pom�c...
	AI_Output			(hero,self,"Info_Saturas_XARDASHELP_15_04"); //B�DZIE... I ZECHCE!
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
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_02"); //C�, przez te wszystkie lata kilkakrotnie pr�bowali�my nawi�za� z Xardasem jaki� kontakt.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_03"); //Ale wygl�da na to, �e nie �yczy sobie, �eby mu przeszkadzano.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_04"); //Co chcesz przez to powiedzie�?
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_05"); //�aden z wys�anych przez nas pos�a�c�w nie wr�ci� z jego wie�y.
	AI_Output			(self,hero,"Info_Saturas_XARDASPROBLEM_14_06"); //Musisz znale�� jaki� spos�b, aby przedrze� si� przez stra�nik�w Xardasa.
	AI_Output			(hero,self,"Info_Saturas_XARDASPROBLEM_15_07"); //Widz�, �e szykuje si� nie lada wyprawa!
	
	B_LogEntry			(CH4_FindXardas,"Saturas uprzedzi� mnie o magicznych stra�nikach Xardasa Nekromanty. W bibliotece Mag�w Wody znajd� informacje o silnych i s�abych stronach tych istot. Powinienem po�wi�ci� troch� czasu na przestudiowanie odpowiednich manuskrypt�w.");	
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
	description = "Jak mog� przedosta� si� do Xardasa?";
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
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_01"); //Jak mog� przedosta� si� do Xardasa?
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_02"); //Niestety, nie mam �adnego pomys�u...
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_03"); //Radzi�bym ci jednak rozejrze� si� troch� w naszej bibliotece.
	AI_Output			(self,hero,"Info_Saturas_XARDASGO_14_04"); //Mo�e w kt�rej� ze starych ksi�g odnajdziesz jakie� wskaz�wki co do mocnych i s�abych stron istot przywo�anych magicznie.
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_05"); //W takim razie p�jd� rozejrze� si� troch� po bibliotece. Nie obawiaj si�...
	AI_Output			(hero,self,"Info_Saturas_XARDASGO_15_06"); //Nied�ugo wr�c�!

	B_LogEntry			(CH4_FindXardas,"W bibliotece Mag�w Wody znajduj� si� zapiski traktuj�ce o sposobach walki z takimi istotami. Powinienem po�wi�ci� troch� czasu na przestudiowanie tych manuskrypt�w.");
	
};

/*------------------------------------------------------------------------
//	TIMESUP- Xardas ist die Schl�sselperson, Saturas ist nicht mehr wichtig									
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
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_00"); //Rozmawia�e� z Xardasem?
	Info_ClearChoices	(KDW_600_Saturas_TIMESUP);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"No wiesz...",KDW_600_Saturas_TIMESUP_JA1);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"Nie...",KDW_600_Saturas_TIMESUP_JA2);
	Info_AddChoice		(KDW_600_Saturas_TIMESUP,"To nie jest tak jak my�lisz...",KDW_600_Saturas_TIMESUP_JA3);

};
func void KDW_600_Saturas_TIMESUP_JA1()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_01"); //No wiesz...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_02"); //Wiesz? CO WIESZ?
	//AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_03"); //�h ... noch nicht ... ich bin aber schon unterwegs ...
	//AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_04"); //Beeile dich, wir d�rfen keine Zeit mehr verlieren!
	//B_Story_CancelFindXardas();
	//AI_StopProcessInfos(self);
};
func void KDW_600_Saturas_TIMESUP_JA2()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_05"); //Nie...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_06"); //Dlaczego?
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_07"); //Nie uda�o mi si� jeszcze do niego dotrze�.
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_08"); //Musisz go odnale�� i poprosi� go o pomoc!
	B_Story_CancelFindXardas();
	AI_StopProcessInfos	(self);
};
func void KDW_600_Saturas_TIMESUP_JA3()
{
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_09"); //To nie jest tak jak my�lisz...
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_10"); //Jak to? Xardas musi nam pom�c w zdetonowaniu kopca rudy!
	AI_Output			(other, self,"KDW_600_Saturas_TIMESUP_Info_15_11"); //Kopiec... jest... Ehm... Jest ju� bardzo du�y!
	AI_Output			(self, other,"KDW_600_Saturas_TIMESUP_Info_14_12"); //Znajd� Xardasa! On musi nam pom�c!
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
	description		= "Nefarius powiedzia�, �e mog� ju� za�o�y� szat� Maga Wody."; 
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
	AI_Output(other, self,"KDW_600_Saturas_HogeAUFNAHME_15_00"); //Nefarius powiedzia�, �e mog� ju� za�o�y� szat� Maga Wody.
	
	/* AB HIER IST ALLES DOPPELT - geklaut aus der KdF-KdW-Aufnahme */
	
	AI_Output(self, other,"KDW_600_Saturas_NOMOREOC_Info_14_03"); //Zatem witaj w naszej spo�eczno�ci!
	AI_Output(other, self,"KDW_600_Saturas_OATH_Info_15_01"); //Czy to oznacza, �e nale�� teraz do kr�gu Mag�w Wody?
	AI_Output(self, other,"KDW_600_Saturas_OATH_Info_14_02"); //Jeszcze nie. Najpierw musisz z�o�y� �luby Wody.
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
	description		= "Jestem got�w do z�o�enia �lub�w."; 
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
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_01"); //Jestem got�w do z�o�enia �lub�w.
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_03"); //Powtarzaj za mn� s�owa przysi�gi:
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_04"); //Przysi�gam, na wszechmocnych bog�w...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_05"); //Przysi�gam, na wszechmocnych bog�w...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_06"); //...Przysi�gam, na pot�g� �wi�tej Wody...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_07"); //...Przysi�gam, na pot�g� �wi�tej Wody...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_08"); //...�e ma wiedza i me czyny teraz i na wieki stanowi� b�d� jedno�� z Wod�...
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_09"); //...�e ma wiedza i me czyny teraz i na wieki stanowi� b�d� jedno�� z Wod�...
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_10"); //...Dop�ki me cia�o nie powr�ci do kr�lestwa Beliara, gdy �r�d�o mego �ycia wyschnie.
	AI_Output			(other, self,"KDW_600_Saturas_KDWAUFNAHME_Info_15_11"); //...Dop�ki me cia�o nie powr�ci do kr�lestwa Beliara, gdy �r�d�o mego �ycia wyschnie.
	
	AI_Output			(self, other,"KDW_600_Saturas_KDWAUFNAHME_Info_14_14"); //No� t� szat�, jako symbol twojego przymierza ze �wi�t� Wod� i wszechmocnym Adanosem.

	CreateInvItem		(self,KDW_ARMOR_L);
	B_GiveInvItems		(self,other,KDW_ARMOR_L,1);
	AI_EquipBestArmor	(hero);
	Snd_Play  			("MFX_Heal_Cast"); 
	Npc_SetTrueGuild	(hero,GIL_KDW);
	hero.guild = GIL_KDW;

	Log_CreateTopic		(CH4_SldToKdW,	LOG_NOTE);
	B_LogEntry			(CH4_SldToKdW,"Saturas przyj�� mnie w poczet Mag�w Wody.");

	AI_StopProcessInfos	(self);
};

