// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalTaran_EXIT (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 999;
	condition	= DIA_BaalTaran_EXIT_Condition;
	information	= DIA_BaalTaran_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalTaran_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_BaalTaran_Greet (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Greet_Condition;
	information	= DIA_BaalTaran_Greet_Info;
	permanent	= 0;
	description = "Jestem tu nowy. Kim jesteś?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Jestem tu nowy. Kim jesteś?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Jestem Baal Taran z Bractwa Śniącego.
};

// **************************************************
//					Was ist Bruderschaft
// **************************************************

instance  DIA_BaalTaran_Bruderschaft (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Bruderschaft_Condition;
	information	= DIA_BaalTaran_Bruderschaft_Info;
	permanent	= 0;
	description = "Bractwo Śniącego? A cóż to takiego?";
};                       

FUNC int  DIA_BaalTaran_Bruderschaft_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Bruderschaft_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Bractwo Śniącego? A cóż to takiego?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //Jesteśmy wspólnotą wyznawców nowej wiary.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //Nasz obóz znajduje się na wschód stąd, na bagnie. Przyszedłem tutaj, by nauczać niewiernych takich jak ty słów Śniącego.
};

// **************************************************
//					Wer ist der Schläfer
// **************************************************

instance  DIA_BaalTaran_Sleeper (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Sleeper_Condition;
	information	= DIA_BaalTaran_Sleeper_Info;
	permanent	= 0;
	description = "Kim jest Śniący?";
};                       

FUNC int  DIA_BaalTaran_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Kim jest Śniący?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //Śniący będzie naszym wyzwolicielem. Pięć lat temu ujawnił się nam przez Y'Beriona, naszego wielkiego mistrza.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //Od tej chwili, wyrzekliśmy się trzech bogów, co i tobie radzę.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //Bogowie przyglądali się bezczynnie, gdy byliśmy skazywani na dożywotnią katorgę w tym więzieniu. Ale Śniący wskaże nam drogę do wolności.
};

// **************************************************
//					Lehre des Schläfers
// **************************************************

instance  DIA_BaalTaran_Lehre (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Lehre_Condition;
	information	= DIA_BaalTaran_Lehre_Info;
	permanent	= 0;
	description = "Opowiedz mi o naukach Śniącego.";
};                       

FUNC int  DIA_BaalTaran_Lehre_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Lehre_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Opowiedz mi o naukach Śniącego.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //Śniący jest niezwykle potężny, może nawet potężniejszy od Innosa, boga światła.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //Zjednoczył się z nami duchowo, ale jego moc jest wciąż ograniczona. Był uśpiony przez tysiące lat, ale moment jego wielkiego przebudzenia jest już bardzo bliski!
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //Wybrał nas na świadków swojego nadejścia i kazał nam szerzyć jego słowa w całej kolonii.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //Zatem słuchaj: każdy, kto stanie po jego stronie zostanie zbawiony, ale ci, którzy się mu sprzeciwią, poniosą surową karę.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //Ale Śniący jest miłosierny i wszystkim wątpiącym przysyła znak swojej potęgi.
};

// **************************************************
//						Freiheit
// **************************************************

instance  DIA_BaalTaran_Freiheit (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 4;
	condition	= DIA_BaalTaran_Freiheit_Condition;
	information	= DIA_BaalTaran_Freiheit_Info;
	permanent	= 0;
	description = "Jak będzie wyglądać ta droga do wolności?";
};                       

FUNC int  DIA_BaalTaran_Freiheit_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Freiheit_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //Jak będzie wyglądać ta droga do wolności?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //Przygotowujemy się do wielkiego przyzwania, w którym wszyscy Nowicjusze zjednoczą swoje duchowe siły.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //W trakcie rytuału Śniący ujawni nam świętą drogę do wolności.
};

// **************************************************
//						Beweis
// **************************************************

instance  DIA_BaalTaran_Beweis (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Beweis_Condition;
	information	= DIA_BaalTaran_Beweis_Info;
	permanent	= 0;
	description = "W jaki sposób wasz bóg udowodnił swoją potęgę?";
};                       

FUNC int  DIA_BaalTaran_Beweis_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Beweis_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //W jaki sposób wasz bóg udowodnił swoją potęgę?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //Przemawiając do nas za pośrednictwem wizji. Kto raz usłyszy jego głos, już nigdy nie zbłądzi na ścieżkę zła.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //Zażyj rosnące na bagnach ziele, a zbliżysz się do Śniącego i będziesz mógł usłyszeć jego słowa. Niektórym wybrańcom zdarzyło się go nawet zobaczyć!
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_03"); //Rozumiem.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance  DIA_BaalTaran_WayToST (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_WayToST_Condition;
	information	= DIA_BaalTaran_WayToST_Info;
	permanent	= 0;
	description = "Jak mogę dotrzeć do obozu Bractwa?";
};                       

FUNC int  DIA_BaalTaran_WayToST_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WayToST_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //Jak mogę dotrzeć do obozu Bractwa?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //Jestem teraz zajęty, ale Baal Parvez powinien przebywać jeszcze w tym obozie.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //Znajdziesz go gdzieś w pobliżu targowiska, po drugiej stronie zamku. Zdaję się, że ma tam nawet własną chatę!

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi,"Nowicjusz imieniem Baal Parvez może mnie zaprowadzić do obozu na bagnie. Znajdę go na targowisku, za zamkiem Starego Obozu.");
};


// **************************************************
//					Will in die BURG
// **************************************************

instance  DIA_BaalTaran_IntoCastle (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 10;
	condition	= DIA_BaalTaran_IntoCastle_Condition;
	information	= DIA_BaalTaran_IntoCastle_Info;
	permanent	= 1;
	description = "Muszę się dostać do zamku. Mógłbyś mi pomóc?";
};                       

FUNC int  DIA_BaalTaran_IntoCastle_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_IntoCastle_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //Muszę się dostać do zamku. Mógłbyś mi pomóc?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //Obawiam się, że nie. Tylko Bracia dostarczający Gomezowi ziele mają wstęp do zamku.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //Zbieramy bagienne ziele, i część zbiorów sprzedajemy do Starego Obozu w zamian za różne dobra z zewnętrznego świata.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //Gdybyś był jednym z kurierów pracujących dla Cor Kaloma, mógłbyś dostać się do zamku. Oczywiście musiałbyś najpierw przystąpić do Bractwa.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //A czego, jeśli wolno spytać, chcesz szukać w zamku?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Muszę się tam z kimś spotkać.",DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Mam list do Arcymistrza Magów Ognia.",DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Muszę się tam z kimś spotkać.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //Naprawdę? A z kim? Nie mógłbyś po prostu zaczekać, aż do ciebie wyjdzie?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"To nie twoja sprawa.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"To jeden z magów.",DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //Mam list do Arcymistrza Magów Ognia.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Czyżby? A skąd go masz? Może dostałeś go od jednego z magów zanim cię tu wrzucono?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Jesteś głupcem, rozpowiadając o tym na lewo i prawo, ale nie obawiaj się - nikomu o tym nie powiem.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Jednak na twoim miejscu trzymałbym język za zębami. Za coś takiego większość ludzi bez wahania poderżnęłaby ci gardło.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //Nagroda, jaką otrzymują posłańcy za dostarczenie wiadomości z zewnętrznego świata, jest niezwykle cenna.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //To jeden z magów.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //Cóż, obawiam się, że oni nigdy nie opuszczają zamku. Rzeczywiście, musiałbyś dostać się do środka.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //A czego od nich chcesz? Magicznych run? A może napojów?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"To nie twoja sprawa.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Właśnie tak!",DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //To nie twoja sprawa.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Dobrze, jak sobie życzysz.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //Właśnie tak!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //Wiedziałem! Czegóż innego ktoś taki jak ty mógłby chcieć od maga.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Dam ci dobrą radę: daruj sobie tych całych magów. Ceny, których żądają za swoje zabawki są niezwykle wygórowane.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Runy i napoje dostaniesz również w naszym obozie i to za połowę ceny!
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};
