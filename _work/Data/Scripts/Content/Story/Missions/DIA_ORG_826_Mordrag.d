// **************************************************
VAR INT MordragKO_PlayerChoseOreBarons;
VAR INT MordragKO_PlayerChoseThorus;
VAR INT MordragKO_HauAb;
var int MordragKO_StayAtNC;
// **************************************************

// **************************************************
//						 EXIT 
// **************************************************

instance  Org_826_Mordrag_Exit (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 999;
	condition	= Org_826_Mordrag_Exit_Condition;
	information	= Org_826_Mordrag_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_826_Mordrag_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  Org_826_Mordrag_Greet (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 1;
	condition	= Org_826_Mordrag_Greet_Condition;
	information	= Org_826_Mordrag_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Greet_Info()
{
	AI_Output (self, other,"Org_826_Mordrag_Greet_11_00"); //Hej, nowa twarz! Jestem Mordrag. Zapamiętaj sobie to imię - u mnie kupisz wszystko, czego potrzebujesz za niewielką cenę!
};

// **************************************************
//					Handeln
// **************************************************
var int Mordrag_Traded;
// **************************************************

instance  Org_826_Mordrag_Trade (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 800;
	condition	= Org_826_Mordrag_Trade_Condition;
	information	= Org_826_Mordrag_Trade_Info;
	permanent	= 1;
	description = "Pokaż mi, co masz do zaoferowania.";
	trade		= 1;
};                       

func int  Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Trade_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Trade_15_00"); //Pokaż mi co masz do zaoferowania.
	AI_Output (self, other,"Org_826_Mordrag_Trade_11_01"); //Wybierz coś...
	if	(Mordrag_Traded==0)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"Mordrag handluje kradzionymi dobrami na targowisku.");
		Mordrag_Traded=1;
	};
};

// **************************************************
//					KURIER FÜR MAGIER
// **************************************************

instance  Org_826_Mordrag_Courier (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Courier_Condition;
	information	= Org_826_Mordrag_Courier_Info;
	permanent	= 1;
	description = "Naprawdę jesteś kurierem Magów?";
};                       

FUNC int  Org_826_Mordrag_Courier_Condition()
{
	if	Thorus_MordragMageMessenger 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Courier_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_00"); //Naprawdę jesteś kurierem Magów?
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_01"); //A jeśli jestem?
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_02"); //Chciałbym porozmawiać z którymś z magów. Muszę dostać się do zamku.
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_03"); //Każdy kurier magów ma przy sobie magiczną pieczęć, dzięki której może wejść do zamku. Gdybyś był jednym z nas, mógłbyś taką zdobyć.
};

// **************************************************
//					DU HAST EIN PROBLEM
// **************************************************

instance  Org_826_Mordrag_Problem (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Problem_Condition;
	information	= Org_826_Mordrag_Problem_Info;
	permanent	= 0;
	description = "Masz problem.";
};                       

FUNC int  Org_826_Mordrag_Problem_Condition()
{
	if Thorus_MordragKo == LOG_RUNNING 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Problem_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_00"); //Masz problem.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_01"); //Czyżby? A jaki?
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_02"); //Są w tym obozie osoby, które mają cię już serdecznie dosyć.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_03"); //Tak? To powiedz im, żeby przysłały tutaj kogoś, kto spróbuje mnie stąd przepędzić!
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_04"); //Skąd pewność, że nie przysłały właśnie mnie?
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_05"); //Bo myślę, że jesteś na to zbyt mądry. Wkrótce przekonasz się, że są w tej kolonii ciekawsze rzeczy do roboty niż usługiwanie Gomezowi.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_06"); //Nowy Obóz potrzebuje zdolnych ludzi. Tam przynajmniej nikt nam nie mówi co mamy robić.
};

// **************************************************
//					  NCInfo
// **************************************************

instance  Org_826_Mordrag_NCInfo(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_NCInfo_Condition;
	information	= Org_826_Mordrag_NCInfo_Info;
	permanent	= 0;
	description = "Opowiedz mi o Nowym Obozie.";
};                       

FUNC int  Org_826_Mordrag_NCInfo_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_NCInfo_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_00"); //Opowiedz mi o Nowym Obozie.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_01"); //Tylko tam znajdziesz prawdziwą wolność... jak na kolonię karną, oczywiście. Nie ma tam żadnych Magnatów ani Guru, którzy mogliby tobą pomiatać.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_02"); //Mamy własną kopalnię, ale nie sprzedajemy ani grama rudy temu zramolałemu królowi!
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_03"); //Więc do czego ją wykorzystujecie?
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_04"); //Nasi magowie opracowują plan ucieczki z kolonii. Zbieranie rudy jest częścią tego planu.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_05"); //Gomez i jego ludzie pławią się w luksusie, a my ciężko pracujemy, żeby się stąd wydostać. Tak to wygląda!
};

// **************************************************
//					JoinNewcamp
// **************************************************

instance  Org_826_Mordrag_JoinNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_JoinNewcamp_Condition;
	information	= Org_826_Mordrag_JoinNewcamp_Info;
	permanent	= 0;
	description = "A gdybym chciał dołączyć do Nowego Obozu... mógłbyś mi pomóc?";//könntest du mir dabei helfen... ZU LANG
};                       

FUNC int  Org_826_Mordrag_JoinNewcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_JoinNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_JoinNewcamp_15_00"); //A gdybym chciał dołączyć do Nowego Obozu... mógłbyś mi pomóc?
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_01"); //Jeśli myślisz o tym poważnie, możemy wyruszyć od razu. Zaprowadzę cię do Laresa. To szef naszej bandy.
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_02"); //Ale gdybyś chciał wyrzucić mnie z Obozu siłą - możesz spróbować.
};


instance  Org_826_Mordrag_GotoNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_GotoNewcamp_Condition;
	information	= Org_826_Mordrag_GotoNewcamp_Info;
	permanent	= 0;
	description = "Chodźmy do Nowego Obozu!";
};                       

FUNC int  Org_826_Mordrag_GotoNewcamp_Condition()
{
	if (Npc_KnowsInfo(hero,Org_826_Mordrag_JoinNewcamp))
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoNewcamp_15_00"); //Chodźmy do Nowego Obozu!
	AI_Output (self, other,"Org_826_Mordrag_GotoNewcamp_11_01"); //Dobra! Chodź za mną!
	
	Mordrag_GotoNC_Day = Wld_GetDay();
	
	AI_StopProcessInfos	(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);	// damit hat der Spieler einen Freischlag. Nach dem zweiten wehrt sich Mordrag!
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Mordrag zgodził się zaprowadzić mnie do Nowego Obozu. Mam tylko nadzieję, że to nie jakaś pułapka!");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine		(self,"GUIDE");
};

// **************************************************
//				AM NEWCMAP ANGEKOMMEN
// **************************************************

instance  Org_826_Mordrag_AtNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_AtNewcamp_Condition;
	information	= Org_826_Mordrag_AtNewcamp_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_AtNewcamp_Condition()
{
	if 	( Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_07_21") ) 
	{
		self.flags	= 0;
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_AtNewcamp_Info()
{
	if (Mordrag_GotoNC_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_00"); //No to jesteśmy.
	}
	else
	{
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //Myślałem, że już tu nie dotrzesz! Zresztą nieważne - jesteśmy na miejscu!
	};
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_01"); //Za tą bramą rozciąga się Nowy Obóz. Porozmawiaj z Laresem, on ci pomoże. Daj mu ten cenny pierścień.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_02"); //To twoja przepustka do Laresa. Trzeba mieć nie lada powód, żeby się z nim spotkać.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_03"); //Wiesz co? Po zastanowieniu - chyba posiedzę tu parę dni. Zarobiłem już niezłą sumkę, a w Starym Obozie zaczyna robić się trochę za gorąco.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_04"); //Jak byś czegoś potrzebował - znajdziesz mnie w karczmie na środku jeziora. Uważaj na siebie!
	AI_Output (other, self,"Org_826_Mordrag_AtNewcamp_15_05"); //Do zobaczenia.
	
	CreateInvItems  (self, MordragsRing, 1);
	B_GiveInvItems	(self, other, MordragsRing, 1);

	B_GiveXP		(XP_ArrivedWithMordrag);	
	B_LogEntry		(CH1_JoinNC,"Stoimy przed główną bramą Nowego Obozu. Mordrag dał mi pierścień, który mam przekazać Laresowi, przywódcy Szkodników. Ma mi to pomóc w zostaniu członkiem Nowego Obozu. Mordrag przez jakiś czas zostanie w karczmie na jeziorze.");
	var C_NPC lares; lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar [AIV_FINDABLE]=TRUE;
	
	MordragKO_StayAtNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
//					AUFS MAUL
// **************************************************

instance  Org_826_Mordrag_Fight (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Fight_Condition;
	information	= Org_826_Mordrag_Fight_Info;
	permanent	= 0;
	description = "W tym obozie nie ma miejsca dla ludzi takich jak ty!";
};                       

FUNC int  Org_826_Mordrag_Fight_Condition()
{
	if ( (Thorus_MordragKo == LOG_RUNNING) && (!Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp)) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Fight_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Fight_15_00"); //W tym obozie nie ma miejsca dla ludzi takich jak ty!
	AI_Output (self, other,"Org_826_Mordrag_Fight_11_01"); //Słucham?
	
	Info_ClearChoices(Org_826_Mordrag_Fight);
	Info_AddChoice   (Org_826_Mordrag_Fight,"Wynoś się stąd i nigdy nie wracaj!",Info_Mordrag_Fight_GetAway);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Nie tolerujemy tu ludzi, którzy okradają Magnatów!",Info_Mordrag_Fight_OreBarons);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Przysyła mnie Thorus. Mam się ciebie pozbyć raz na zawsze.",Info_Mordrag_Fight_Thorus);
};

FUNC VOID Info_Mordrag_Fight_GetAway()
{
	AI_Output (other, self,"Info_Mordrag_Fight_GetAway_15_00"); //Wynoś się stąd i nigdy nie wracaj!
	AI_Output (self, other,"Info_Mordrag_Fight_GetAway_11_01"); //Wielkie słowa małego człowieczka...
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_OreBarons()
{
	AI_Output (other, self,"Info_Mordrag_Fight_OreBarons_15_00"); //Nie tolerujemy tu ludzi, którzy okradają Magnatów!
	AI_Output (self, other,"Info_Mordrag_Fight_OreBarons_11_01"); //Ach, więc o to ci chodzi! Dlaczego nie powiedziałeś tak od razu...
	
	MordragKO_PlayerChoseOreBarons = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_Thorus()
{
	AI_Output (other, self,"Info_Mordrag_Fight_Thorus_15_00"); //Przysyła mnie Thorus. Mam się ciebie pozbyć raz na zawsze.
	AI_Output (self, other,"Info_Mordrag_Fight_Thorus_11_01"); //Thorus? Naprawdę? Cóż, to wszystko co chciałem wiedzieć...
	
	MordragKO_PlayerChoseThorus = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

// **************************************************
//					HauAb
// **************************************************

instance  Org_826_Mordrag_HauAb(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_HauAb_Condition;
	information	= Org_826_Mordrag_HauAb_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_HauAb_Condition()
{
	VAR C_NPC Mordrag;
	Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	
	if (Mordrag.aivar[AIV_WASDEFEATEDBYSC] >= 1)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_HauAb_Info()
{
	AI_Output (other, self,"Org_826_HauAb_GotoNewcamp_15_00"); //Wynoś się stąd...
	
	AI_StopProcessInfos	(self);
	
	MordragKO_HauAb = TRUE;
	
	B_LogEntry    (CH1_MordragKO,"Pokonałem Mordraga i kazałem mu nigdy więcej nie pokazywać się w Starym Obozie.");

	Npc_ExchangeRoutine	(self, "Start");
};
		
// **************************************************
//					GotoKalom
// **************************************************

instance  Org_826_Mordrag_GotoKalom(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalom_Condition;
	information	= Org_826_Mordrag_GotoKalom_Info;
	permanent	= 0;
	description = "Lares ma dla ciebie wiadomość.";
};                       

FUNC int  Org_826_Mordrag_GotoKalom_Condition()
{
	if 	(Npc_GetTrueGuild(other)!=GIL_ORG)
	&&	(Lares_InformMordrag == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalom_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_00"); //Lares ma dla ciebie wiadomość.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_01"); //Czego chce?
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_02"); //Interesują go ostatnie wydarzenia w obozie Sekty. Mam ci przekazać, że to twoje zadanie.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_03"); //Mam wrażenie, że ten problem sam się wkrótce rozwiąże...

	B_LogEntry	(CH1_JoinNC,"Przekazałem Mordragowi polecenie Laresa. Mamrotał trochę o sprawach, które same się wyjaśnią. Nie bardzo wiem, co miał na myśli!");
};

// **************************************************
//					GotoKalom - NOW
// **************************************************
	var int Mordrag_GotoKalom;
// **************************************************

instance  Org_826_Mordrag_GotoKalomNOW(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalomNOW_Condition;
	information	= Org_826_Mordrag_GotoKalomNOW_Info;
	permanent	= 0;
	description = "Lares powiedział, że mam ci pomóc w tej sprawie.";
};                       

FUNC int  Org_826_Mordrag_GotoKalomNOW_Condition()
{
	if 	(Npc_GetTrueGuild(other)==GIL_ORG)
	&&	Npc_KnowsInfo(hero,ORG_801_Lares_GotoKalom)
	{
		return TRUE;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalomNOW_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //Lares powiedział, że mam ci pomóc w tej sprawie.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //Widzisz! Wiedziałem, że nie będę musiał sam się z tym męczyć!
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //Chcesz żebym zajął się tym w pojedynkę?
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //Na pewno jakoś sobie poradzisz. Słuchaj: musisz koniecznie wywęszyć, co się kryje za tą całą historią z przywołaniem.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //Wiem, że te świry z sekty przygotowują się do wielkiego przywołania, i choć sam nie wierzę w Śniącego powiem ci jedno:
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //Guru dysponują potężną magią, dlatego tak uważnie musimy im patrzeć na palce. Nadążasz?

	B_LogEntry			(CH1_GotoPsiCamp,"Mordrag sprytnie zrzucił na mnie obowiązek szpiegowania w obozie Bractwa. Guru zdają się przygotowywać do wielkiego przyzwania Śniącego. Moim zadaniem jest poznanie szczegółów.");
	B_GiveXP			(XP_AssistMordrag);	
	
	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;
	
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Nie masz dla mnie żadnych dokładniejszych wskazówek?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Zobaczę co się da zrobić.",Org_826_Mordrag_GotoKalomNOW_DoIt);

};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //Nie masz dla mnie żadnych dokładniejszych wskazówek?
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //Porozmawiaj z Lesterem. Spędziłem kiedyś sporo czasu w obozie sekty, a on mi pomógł. Gość jest w porządku.
	B_LogEntry(CH1_GotoPsiCamp,"W obozie Bractwa mam porozmawiać z Nowicjuszem imieniem Lester. Ponoć można mu zaufać - już wcześniej pomagał Mordragowi.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //Zobaczę co się da zrobić.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //Jak tylko dowiesz się czegoś o ich zamiarach, zgłoś się do mnie.
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	AI_StopProcessInfos	(self);
};

// **************************************************
//					RUNNING
// **************************************************

instance  Org_826_Mordrag_RUNNING (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_RUNNING_Condition;
	information	= Org_826_Mordrag_RUNNING_Info;
	permanent	= 1;
	description = "Jeśli chodzi o tę sprawę z sektą...";
};                       

FUNC int  Org_826_Mordrag_RUNNING_Condition()
{
	if (Mordrag_GotoKalom == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_RUNNING_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_RUNNING_15_00"); //Jeśli chodzi o tę sprawę z sektą...
	AI_Output			(self, other,"Org_826_Mordrag_RUNNING_11_01"); //Tak?

	if	(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_04"); //Odbyło się wielkie przywołanie.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_09"); //Niemożliwe! Chcesz powiedzieć, że brałeś w tym udział?
		}
		else
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_06"); //Bractwo zamierza wzmocnić swoje siły duchowe przy pomocy potężnego eliksiru wytwarzanego z jaj pełzaczy. Dzięki temu mają nadzieję nawiązać kontakt ze Śniącym.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_07"); //Banda idiotów! Te świry naprawdę wierzą w te brednie, co?
		};
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_10"); //Jestem ciekaw co z tego wszystkiego wyjdzie.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_11"); //Ja też. Daj mi znać, gdy Guru zbłaźnią się już całkowicie.

		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP			(XP_ReportToMordrag);
		Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_SUCCESS);
		B_LogEntry			(CH1_GotoPsiCamp,"Mordrag prawie umarł ze śmiechu, gdy opowiedziałem mu o jajach pełzaczy. Jednak chyba stracił zainteresowanie dalszym szpiegowaniem Guru. To znaczy, że moja robota skończona.");
	}
	else
	{
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_02"); //Niczego się jeszcze nie dowiedziałem.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_03"); //Więc bierz się do roboty!
	};

/*	
	//SN: Werde nicht gebraucht, da sie nicht zur Kapitel 2-6-Story passen!!!
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_08"); //Ich hab' die Eier bei mir.
		
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_05"); //(sarkastisch) Hab' ich auch gemerkt. Diese verdammten Sektenspinner haben Gomez die alte Mine gekostet. Wird nicht mehr lange dauern, dann stehen seine Gardisten bei UNS vor der Tür, um sich ihr Erz abzuholen...
*/
};
	
	













	




	
