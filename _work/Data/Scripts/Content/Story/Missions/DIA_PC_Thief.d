var int Diego_After_Gamestart;

// ************************************************************
// 							GAMESTART
// ************************************************************

INSTANCE Info_Diego_Gamestart (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Gamestart_Condition;
	information	= Info_Diego_Gamestart_Info;
	permanent	= 0;
	important	= 1;
	//description = "(Startsatz: zum Goldmaster wieder zu Important-Info machen !!!)";
};                       

FUNC INT Info_Diego_Gamestart_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Gamestart_Info()
{
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //Nazywam się Diego.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //Jestem...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //Nie interesuje mnie kim jesteś. Jesteś tu nowy - a do mnie należy dbanie o nowych. Na razie to tyle...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //Jeśli chcesz jeszcze trochę pożyć, słuchaj się mnie, ale oczywiście nie będę ci przeszkadzał w ewentualnej próbie samobójstwa. To jak będzie?
	
	B_Kapitelwechsel(1); //WICHTIG!!!
};

// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Diego_EXIT_Gamestart(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Gamestart_Condition;
	information	= Info_Diego_EXIT_Gamestart_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Gamestart_Condition()
{
	return 1;
};

FUNC VOID Info_Diego_EXIT_Gamestart_Info()
{
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00"); //Dzięki za pomoc.
	
	if (!Npc_KnowsInfo (hero, Info_Diego_Kolonie)) 
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //Jak sobie chcesz. Miło było cię poznać.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02"); //Spotkamy się w Starym Obozie.
	};

	AI_StopProcessInfos	(self);
	
	if (Kapitel < 2)
	{
		Npc_ExchangeRoutine	(self, "Start");
		Diego_After_Gamestart = TRUE;
	};
};

// -------------------------------------------------------------

INSTANCE Info_Diego_EXIT_Later(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Later_Condition;
	information	= Info_Diego_EXIT_Later_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Later_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_EXIT_Gamestart)) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_EXIT_Later_Info()
{	
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Diego_EXIT_11_01"); //Chodźmy.
	}
	else
	{
	 	AI_Output	(hero,self,"Info_Diego_EXIT_15_00"); //Trzymaj się.
	};
	
	AI_StopProcessInfos	(self);
};

// *************************************************************
// 							 BRIEF 
// *************************************************************

INSTANCE Info_Diego_Brief (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Brief_Condition;
	information	= Info_Diego_Brief_Info;
	permanent	= 0;
	description = "Mam list do przywódcy Magów Ognia.";
};                       

FUNC INT Info_Diego_Brief_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Brief_Info()
{
	AI_Output(hero,self,"Info_Diego_Brief_15_00"); //Mam list do Arcymistrza Magów Ognia.
	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //Czyżby...?
	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //Jakiś mag dał mi go zanim mnie tu wrzucono.
	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //Twoje szczęście, że nie mogę się więcej pokazywać u magów. Ktoś inny mógłby ci poderżnąć gardło za taki list.
	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //A to dlatego, że magowie hojnie opłacają swoich kurierów, a większość z tutejszych ludzi nic nie posiada.
	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //Na twoim miejscu trzymałbym język za zębami aż do chwili, gdy spotkasz któregoś z magów. Chociaż wątpię, żeby ci się udało.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//Dlaczego?
	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //Magowie mieszkają w zamku, w Starym Obozie. Tylko ludzie Gomeza mają tam wstęp.
};

// **********************************************************
// 					SCHUTZ UND LAGER
// **********************************************************
 
INSTANCE Info_Diego_WarumGeholfen (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_WarumGeholfen_Condition;
	information	= Info_Diego_WarumGeholfen_Info;
	permanent	= 0;
	description = "Dlaczego mi pomogłeś?";
};                       

FUNC INT Info_Diego_WarumGeholfen_Condition()
{
	if	(!Diego_After_Gamestart)
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WarumGeholfen_Info()
{
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //Dlaczego mi pomogłeś?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //Bo potrzebowałeś pomocy. Gdyby nie ja, Bullit i jego chłopcy mogliby cię wykończyć.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //A ja jestem zbyt miły, żeby się temu spokojnie przyglądać. W końcu przebyłem całą tę drogę po to, by złożyć ci propozycję.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //Propozycję...
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //Tak. Po tym zajściu z Bullitem i jego ludźmi powinieneś się domyślić, że przyda ci się ochrona.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //Każdy, kto tu trafia ma wybór. W kolonii są trzy obozy i w końcu będziesz musiał do któregoś dołączyć. 
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //Jestem tu, by udowodnić wszystkim nowym, że najlepszym miejscem dla nich będzie Stary Obóz.
};

// -------------------------------------------------------------

INSTANCE Info_Diego_Bullit (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_Bullit_Condition;
	information	= Info_Diego_Bullit_Info;
	permanent	= 0;
	description = "A gdzie jest teraz Bullit?";
};                       

FUNC INT Info_Diego_Bullit_Condition()
{
	if ( Npc_KnowsInfo (hero, Info_Diego_WarumGeholfen) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Bullit_Info()
{
	AI_Output(hero,self,"Info_Diego_Bullit_15_02"); //A gdzie jest teraz Bullit?
	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //On i pozostali przenoszą towary z zewnątrz do Obozu. Tam go znajdziesz.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //Ale jeśli chcesz z nim walczyć, radzę ci uważać. To doświadczony wojownik.
};


// ************************************************************
// 							Kolonie
// ************************************************************

INSTANCE Info_Diego_Kolonie (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Kolonie_Condition;
	information	= Info_Diego_Kolonie_Info;
	permanent	= 0;
	description = "Dobra, co powinienem wiedzieć o tym miejscu?";
};                       

FUNC INT Info_Diego_Kolonie_Condition()
{
	if	(Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Kolonie_Info()
{
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //Dobra, co powinienem wiedzieć o tym miejscu?
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //Nazywamy je kolonią. Wiesz już, że wydobywamy rudę dla króla. 
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //Cóż, w każdym razie tak robią ludzie ze Starego Obozu.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //Wewnątrz Bariery powstały trzy obozy. Największy i najstarszy jest tak zwany Stary Obóz.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_Barriere (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_Barriere_Condition;
	information	= Info_Diego_Barriere_Info;
	permanent	= 0;
	description = "Opowiedz mi jeszcze o Barierze.";
};                       

FUNC INT Info_Diego_Barriere_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Barriere_Info()
{
	AI_Output(hero,self,"Info_Diego_Barriere_15_00"); //Opowiedz mi jeszcze o Barierze.
	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //Nie ma za bardzo o czym mówić. Jest nie do sforsowania.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //A co się stanie, jeśli po prostu spróbuję stąd wyjść?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //Ostatni, który tego spróbował dotarł na drugą stronę jako trup. Przez to przeklęte magiczne pole można wejść, ale już nigdy się stąd nie wydostaniesz.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //Jeśli jest stąd jakieś wyjście - znajdę je.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //Tak ci spieszno, żeby się stąd wyrwać? Dopiero co tu trafiłeś!
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OtherCamps (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 2;
	condition	= Info_Diego_OtherCamps_Condition;
	information	= Info_Diego_OtherCamps_Info;
	permanent	= 0;
	description = "A co z pozostałymi obozami?";
};                       

FUNC INT Info_Diego_OtherCamps_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OtherCamps_Info()
{
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //A co z pozostałymi obozami?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //Te dwa obozy zamieszkują szaleńcy, którzy próbują się stąd wydostać za wszelką cenę.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //W zachodniej części kolonii znajduje się Nowy Obóz. Rezydują tam magowie, którzy myślą, że uda się im wysadzić Barierę, jak tylko zbiorą dostatecznie dużo rudy.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //No i są jeszcze świry z Sekty, na wschodzie. Ich obóz znajduje się na środku bagna. Oni z kolei czekają aż ich bóstwo pomoże im się stąd wydostać.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //Wygląda na to, że jeszcze trochę poczekają.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //Na twoim miejscu nie traciłbym czasu na zadawanie się z szaleńcami.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OldCamp (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_OldCamp_Condition;
	information	= Info_Diego_OldCamp_Info;
	permanent	= 0;
	description = "Opowiedz mi o Starym Obozie.";
};                       

FUNC INT Info_Diego_OldCamp_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OldCamp_Info()
{
	AI_Output(hero,self,"Info_Diego_OldCamp_15_00"); //Opowiedz mi o Starym Obozie.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //To największy i najpotężniejszy z trzech obozów. Gomez i jego ludzie kontrolują kopalnię, a tym samym - cały handel ze światem zewnętrznym.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //Raz w miesiącu król przysyła nam wszystko, czego potrzebujemy. Mamy staruszka w garści, kapujesz?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //Przysyła nam broń, chleb, mięso... wszystko.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{ 
	AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //Ty też możesz mieć w tym udział. Musisz tylko dołączyć do ludzi Gomeza.
	};
};

// ************************************************************
// 							Gomez Leute
// ************************************************************

INSTANCE Info_Diego_WhosGomez (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_WhosGomez_Condition;
	information	= Info_Diego_WhosGomez_Info;
	permanent	= 0;
	description = "Kim jest Gomez?";
};                       

FUNC INT Info_Diego_WhosGomez_Condition()
{
	if ( Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhosGomez_Info()
{
	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00"); //Kim jest Gomez?
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //Gomez jest najpotężniejszym z Magnatów kierujących handlem rudą. To on rządzi w Starym Obozie i ma najwięcej do powiedzenia w całej kolonii.
};	

// ************************************************************
// 							JOIN OC
// ************************************************************

INSTANCE Info_Diego_JoinOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_JoinOldcamp_Condition;
	information	= Info_Diego_JoinOldcamp_Info;
	permanent	= 0;
	description = "Załóżmy, że chciałbym dołączyć do jego ludzi. Co powinienem zrobić?";
};                       

FUNC INT Info_Diego_JoinOldcamp_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief))
	&&	!C_NpcBelongsToOldCamp(hero)
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_JoinOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //Załóżmy, że chciałbym dołączyć do jego ludzi. Co powinienem zrobić?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //Przy bramie do zamku znajdziesz człowieka imieniem Thorus. Powiedz mu, że Diego cię przysłał.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
	
	Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC, LOG_RUNNING);
	B_LogEntry( CH1_JoinOC,"Aby zostać przyjętym w poczet ludzi Gomeza, muszę najpierw porozmawiać z Thorusem.");
};	

// ************************************************************
// 						Weg zum Alten Lager
// ************************************************************

INSTANCE Info_Diego_WayToOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WayToOldcamp_Condition;
	information	= Info_Diego_WayToOldcamp_Info;
	permanent	= 0;
	description = "Jak dostanę się do Starego Obozu?";
};                       

FUNC INT Info_Diego_WayToOldcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Kolonie) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WayToOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //Jak dostanę się do Starego Obozu?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //Podążaj tą ścieżką. Stary Obóz to najbliższe, mniej więcej bezpieczne miejsce jakie napotkasz po drodze.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //Pomiędzy obozami kręci się wiele groźnych zwierząt. Radziłbym ci postarać się o jakąś broń.
};
	
// ************************************************************
// 							Wo Waffe
// ************************************************************

INSTANCE Info_Diego_WoWaffe (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WoWaffe_Condition;
	information	= Info_Diego_WoWaffe_Info;
	permanent	= 0;
	description = "Gdzie mogę znaleźć oręż?";
};                       

FUNC INT Info_Diego_WoWaffe_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_WayToOldcamp) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WoWaffe_Info()
{
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //Gdzie mogę znaleźć oręż?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //Rozejrzyj się trochę w pobliżu Opuszczonej Kopalni. Na pewno znajdziesz tam coś przydatnego.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //Kopalnię nie trudno znaleźć. Leży parę metrów w dół kanionu. 
};

// ************************************************************
// 						Mit Thorus geredet
// ************************************************************

INSTANCE Info_Diego_ThorusSays(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_ThorusSays_Condition;
	information	= Info_Diego_ThorusSays_Info;
	permanent	= 0;
	description = "Rozmawiałem z Thorusem.";
};                       

FUNC INT Info_Diego_ThorusSays_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Thorus_DiegoSentMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_ThorusSays_Info()
{
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00"); //Rozmawiałem z Thorusem.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //I co ci powiedział?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //Mówi, że będę mógł dołączyć do Starego Obozu, jeśli TY uznasz, że się nadaję.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //Widzę, że czeka mnie dodatkowa robota.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //Zaczynamy od razu?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05"); //Najpierw powinieneś dowiedzieć się kilku rzeczy.
};

// ************************************************************
// 						Aufnahme - Regeln
// ************************************************************

INSTANCE Info_Diego_Rules(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Rules_Condition;
	information	= Info_Diego_Rules_Info;
	permanent	= 0;
	description = "Co powinienem wiedzieć, żeby mnie przyjęto do Starego Obozu?";
};                       

FUNC INT Info_Diego_Rules_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_ThorusSays) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Rules_Info()
{
	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //Co powinienem wiedzieć, zanim zostanę przyjęty do Starego Obozu?
	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //Jeśli chcesz do nas należeć, musisz najpierw zaplusować u kilku ludzi.
	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //W Zewnętrznym Pierścieniu możesz spotkać paru wpływowych ludzi, głównie Cieni. Jeśli uda ci się ich do siebie przekonać, twoje szanse wzrosną.
	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //Później czeka cię test zaufania.
	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //Oprócz tego musisz się jeszcze wiele nauczyć. Im więcej nowych umiejętności zdobędziesz, tym cenniejszy będziesz dla nas.
	
	B_LogEntry( CH1_JoinOC,"Zanim zostanę przyjęty, muszę zjednać sobie kilku wpływowych ludzi z Zewnętrznego Pierścienia i przejść test zaufania.");
};

// ************************************************************
// 						Wo wichtige Leute
// ************************************************************

INSTANCE Info_Diego_Celebs(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Celebs_Condition;
	information	= Info_Diego_Celebs_Info;
	permanent	= 0;
	description = "Gdzie znajdę te ważne osoby?";
};                       

FUNC INT Info_Diego_Celebs_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Celebs_Info()
{
	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //Gdzie znajdę te ważne osoby?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //Cóż, na jednego z nich właśnie patrzysz. Poza tym, jest jeszcze Thorus, jego już znasz.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //Co do pozostałych... sam musisz ich rozpoznać. Jeśli nie jesteś w stanie tego zrobić, to i tak nie masz tu czego szukać.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //Najlepiej przejdź się po Zewnętrznym Pierścieniu i porozmawiaj z ludźmi.
};

// ************************************************************
// 							Wo Lehrer
// ************************************************************

INSTANCE Info_Diego_Teachers(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Teachers_Condition;
	information	= Info_Diego_Teachers_Info;
	permanent	= 0;
	description = "Kto może mnie czegoś nauczyć?";
};                       

FUNC INT Info_Diego_Teachers_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teachers_Info()
{
	AI_Output		(hero,self,"Info_Diego_Teachers_15_00"); //Kto może mnie czegoś nauczyć?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_01"); //Zacznij od Rączki. To najzręczniejszy człowiek w Obozie.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_02"); //Miej oczy szeroko otwarte, a na pewno znajdziesz wielu ludzi, którzy zechcą cię czegoś nauczyć.
	AI_Output		(hero,self,"Info_Diego_Teachers_15_03"); //Gdzie znajdę Rączkę?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_04"); //Jego chata stoi nieco na uboczu, zaraz przy murach zamku. Idąc stąd udaj się w stronę areny.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_05"); //Przy zamkowej bramie pójdź w lewo. To właśnie droga do areny.

	if	(Fingers_CanTeach == FALSE)
	{
		Log_CreateTopic (GE_TeacherOC,	LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Rączka może mnie nauczyć otwierania zamków i kradzieży kieszonkowej. Jego chata znajduje się nieco na uboczu, niedaleko areny.");
	};
};

// ************************************************************
// 							DIEGO = Lehrer
// ************************************************************
	var int Diego_Merke_STR;
	var int Diego_Merke_DEX;
// ************************************************************

INSTANCE Info_Diego_Teach(C_INFO)
{
	npc			= PC_Thief;
	nr			= 100;
	condition	= Info_Diego_Teach_Condition;
	information	= Info_Diego_Teach_Info;
	permanent	= 1;
	description = "Możesz mnie czegoś nauczyć?";
};                       

FUNC INT Info_Diego_Teach_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Teachers) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teach_Info()
{	
	if	(log_diegotrain == FALSE)
	{	
		Log_CreateTopic (GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Diego może mi pomóc w zwiększeniu mojej zwinności i siły.");
		log_diegotrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //Możesz mnie czegoś nauczyć?
	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //Tak. Mogę ci pokazać, jak zwiększyć swoją siłę lub zręczność.
	
	Diego_Merke_STR = hero.attribute[ATR_STRENGTH];
	Diego_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
	
	
};

func void Info_Diego_Teach_BACK()
{
	if (Diego_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //Jesteś teraz o wiele silniejszy.
	};
	if (Diego_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //Umiesz teraz sprawniej posługiwać się łukiem i kuszą.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Wróć niedługo. Musisz się jeszcze wiele nauczyć.
	Info_ClearChoices	(Info_Diego_Teach);
};

func void Info_Diego_Teach_STR_1()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_STR_5()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_1()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_5()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

// ************************************************************
// 							BRING LIST
// ************************************************************

VAR INT Diego_BringList; //MISSIONSVARIABLE

// ----------------------------- OFFER -------------------------------------

INSTANCE Info_Diego_BringList_Offer (C_INFO)
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_BringList_Offer_Condition;
	information	= Info_Diego_BringList_Offer_Info;
	permanent	= 0;
	description = "Na czym polega test zaufania?";
};                       

FUNC INT Info_Diego_BringList_Offer_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Offer_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_00"); //Na czym polega test zaufania?
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_01"); //Będziesz się musiał wybrać do Starej Kopalni. Tam znajdziesz faceta imieniem Ian. Od niego dostaniesz listę.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_02"); //To bardzo ważny dokument. Zawiera spis wszystkich rzeczy, których potrzebują od nas ludzie z kopalni.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_03"); //Postaramy się, żeby dostarczono je z następnym konwojem.
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_04"); //Żaden problem!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_05"); //Właśnie że jest problem. Ta lista nie może wpaść w ręce ludzi z Nowego Obozu!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_06"); //Jak już powiedziałem: to bardzo ważna lista. Jeśli nie zawalisz - daleko tu zajdziesz.
	
	Diego_BringList = LOG_RUNNING;
    
    Log_CreateTopic (CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus(CH1_BringList,LOG_RUNNING);
    B_LogEntry    (CH1_BringList,"Diego wysłał mnie do Starej Kopalni. Tam, od człowieka imieniem Ian, dostanę bardzo ważną listę, która pod żadnym pozorem nie może wpaść w łapy ludzi z Nowego Obozu.");
    
	VAR C_NPC Ian; Ian = Hlp_GetNpc (STT_301_IAN);	
	CreateInvItem (STT_301_IAN, TheList);
};
	
// -------------------------------------------------------------------------------

INSTANCE Info_Diego_IanPassword (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_IanPassword_Condition;
	information	= Info_Diego_IanPassword_Info;
	permanent	= 0;
	description = "Skoro ta lista jest taka ważna, myślisz, że Ian wyda ją komuś takiemu jak JA?";
};                       

FUNC INT Info_Diego_IanPassword_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_IanPassword_Info()
{
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_01"); //Skoro ta lista jest taka ważna, skąd pewność, że Ian wyda ją komuś takiemu jak JA?
	AI_Output (self, hero,"Info_Diego_IanPassword_Info_11_02"); //Bo powiesz mu, że przysłał cię Diego.
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_03"); //Tak zrobię.
	
	B_LogEntry    (CH1_BringList,"Ian da mi listę, jeśli powiem mu, że przysyła mnie Diego.");
};

// ----------------------------------------------------------------------------------

INSTANCE Info_Diego_MapToOldMine (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_MapToOldMine_Condition;
	information	= Info_Diego_MapToOldMine_Info;
	permanent	= 0;
	description = "Gdzie znajdę Starą Kopalnię?";
};                       

FUNC INT Info_Diego_MapToOldMine_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_MapToOldMine_Info()
{
	AI_Output (hero, self,"Info_Diego_MapToOldMine_Info_15_00"); //Gdzie znajdę Starą Kopalnię?
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_01"); //Porozmawiaj z Grahamem, to nasz kartograf. Powiedz mu, że ja cię przysyłam, i że potrzebujesz mapy. Z niej dowiesz się, gdzie leży kopalnia.
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_02"); //Graham mieszka na lewo od północnej bramy.
	
	B_LogEntry    (CH1_BringList,"Od Grahama dostanę mapę. Znajdę go na lewo od północnej bramy.");
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_Diego_BringList_Success (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_BringList_Success_Condition;
	information	= Info_Diego_BringList_Success_Info;
	permanent	= 0;
	description = "Mam listę od Iana.";
};                       

FUNC INT Info_Diego_BringList_Success_Condition()
{
	if ( (Diego_BringList == LOG_RUNNING) && (Npc_HasItems(hero,TheList) || Npc_HasItems(hero,TheListNC)))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Success_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Success_15_00"); //Mam listę od Iana.
		
	if	Npc_HasItems(hero,TheList)
	{
		B_GiveInvItems	(hero, self, TheList, 1);
		B_LogEntry    	(CH1_BringList,"Diego bardzo się ucieszył, gdy wręczyłem mu listę Iana.");
	}
	else if	Npc_HasItems(hero,TheListNC)
	{
		B_GiveInvItems	(hero, self, TheListNC, 1);
		B_LogEntry    	(CH1_BringList,"Diego ucieszył się, gdy wręczyłem mu listę od Iana. Chyba nie zauważył, że Lares dodał kilka rzeczy od siebie. A może rzeczywiście widziałem dziwny błysk w jego oku?");
	};
	B_UseFakeScroll();
	
	AI_Output (self, hero,"Info_Diego_BringList_Success_11_01"); //Dobra robota! Zaczynasz mi się naprawdę podobać!

	Diego_BringList = LOG_SUCCESS;
	B_GiveXP(XP_DiegoBringlist);
	
	Log_SetTopicStatus 		(CH1_BringList,LOG_SUCCESS);
	
	Points_OC = Points_OC + 5;
};

// ************************************************************
// 						Punktewertung
// ************************************************************
	var int Diego_GomezAudience;
// ************************************************************

INSTANCE Info_Diego_JoinAnalyze(C_INFO) 
{
	npc			= PC_Thief;
	nr			= 800;
	condition	= Info_Diego_JoinAnalyze_Condition;
	information	= Info_Diego_JoinAnalyze_Info;
	permanent	= 1;
	description = "Jak tam z moją opinią w Obozie?";
};                       

FUNC INT Info_Diego_JoinAnalyze_Condition()
{
	if	Npc_KnowsInfo(hero,Info_Diego_Rules)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_JoinAnalyze_Info()
{	
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_00"); //Jak tam z moją opinią w Obozie?
	AI_Output(self, hero,"Info_Diego_JoinAnalyze_11_01"); //Rozmawiałem z kilkoma ludźmi...
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_02"); //I?
	// -----------------------------------------------------------
	Points_OC = 0;
	// -----------------------------------------------------------
	if (Scatty_ChargeKirgo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01"); //Scatty powiedział mi, że pokonałeś Kirgo.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKirgo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //Scatty powiedział mi, że pozwoliłeś Kirgo spuścić sobie baty. Chyba nie jest tobą zachwycony.
		Points_OC = Points_OC - 1;
	}
	else if (Scatty_ChargeKirgo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //Scatty powiedział mi, że nie może się doczekać na twoją walkę z Kirgo.
	};
	
	if (Scatty_ChargeKharim == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //Ale był pod wrażeniem twojej śmiałości. Nie każdy miałby odwagę, żeby wyzwać Kharima. Choćby nawet z nim przegrał.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKharim == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //Ale był pod wielkim wrażeniem twojej walki z Kharimem. Bez przerwy opowiada jaki to z ciebie wojownik. 
		Points_OC = Points_OC + 5;
	}
	else if (Scatty_ChargeKharim == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //I nie może się doczekać, kiedy staniesz do walki z Kharimem.
	};
	// -----------------------------------------------------------
	if (Whistler_BuyMySword == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //Świstak opowiedział mi o tej historii z Fiskiem... Cóż, na twoim miejscu wziąłbym tę rudę i dał nogę, ale tak, czy inaczej - Świstak chyba bardzo cię polubił.
		Points_OC = Points_OC + 3;
	}
	else if ( (Whistler_BuyMySword == LOG_FAILED) || ( (Whistler_BuyMySword==LOG_RUNNING)&&(Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) ) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //Rozmawiałem ze Świstakiem. Zwiałeś z jego rudą, cwaniaku! Muszę przyznać, że śmiałości ci nie brakuje!
		Points_OC = Points_OC + 2;
	}
	else if (Whistler_BuyMySword == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //Świstak czeka na swój miecz. Zdecyduj się wreszcie czy zamierzasz mu go dać, czy nie. W przeciwnym wypadku może pomyśleć, że zwiałeś z jego rudą!
		
	};
	// -----------------------------------------------------------
	if (Sly_LostNek == LOG_SUCCESS)			
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //Zły powiedział mi, że znalazłeś Neka. Wydawał się być bardzo zadowolony.
		Points_OC = Points_OC + 4;
	}
	else if (Sly_LostNek == LOG_RUNNING)					
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //Moim zdaniem Zły myli się co do Neka. Był uciążliwy, to fakt, ale nie wierzę, żeby zdezerterował do Nowego Obozu.
	};
	// -----------------------------------------------------------
	if (Fingers_Learnt == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //Mówiłem ci już o Rączce! On może cię wiele nauczyć!
	}
	else if (Fingers_Learnt == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //Rączka powiedział mi, że trochę się już nauczyłeś, ale uważa, że mógłbyś być jeszcze lepszy.
		Points_OC = Points_OC + 3;
	};
	// -----------------------------------------------------------
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //Muszę poważnie porozmawiać z Dexterem. Wykorzystuje cię do załatwiania własnych porachunków.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //Ale jeśli chodzi o nasz test - nie ma żadnych przepisów. Jeśli uda ci się dokonać czegoś TAKIEGO, to będzie wielki krok do przodu.
		
	}
	else if (Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //Naprawdę udało ci się zdobyć przepis Kaloma. Dexter jest pod wrażeniem. Ja zresztą też!
		Points_OC = Points_OC + 5;
	};
	// -----------------------------------------------------------
	if (Thorus_MordragKo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //Ta sprawa z Mordragiem to nie lada wyzwanie. Niezły z niego wojownik. Musisz porządnie poćwiczyć, jeśli chcesz go pokonać.
	}
	else if (Thorus_MordragKo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //Thorus uważa, że przyda się nam ktoś taki jak ty - to dla ciebie niezwykle korzystne.
		Points_OC = Points_OC + 5;
	}
	else if (Thorus_MordragKo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //Thorus dostał ataku apopleksji. Zresztą wcale mu się nie dziwię. Jak można AŻ TAK schrzanić robotę?
		Points_OC = Points_OC - 5;						
	}
	// ----WEITER-------------------------------------------------------
	if (Fisk_GetNewHehler == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //Fisk powiedział mi, ze go zaskoczyłeś. W każdym razie będzie po twojej stronie.
		Points_OC = Points_OC + 5;
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //Fisk bardzo się na ciebie wkurzył. Na twoim miejscu znalazłbym kogoś na miejsce Mordraga.
	};
	// -----------------------------------------------------------
	if (points_oc > 15)// runtergesetzt!! // Bei 20 + BringList = Aufnahme
	{
		AI_Output (self, hero,"Info_Diego_Points_11_00"); //Udało ci się zjednać wystarczająco wiele osób.
		
		if hero.level >= 5
		{
			if (Diego_BringList == LOG_SUCCESS)
			{
				AI_Output (self, hero,"Info_Diego_Points_11_01"); //Przeszedłeś również test zaufania. Idź do Thorusa. Już go o wszystkim powiadomiłem. Pozwoli ci się spotkać z Gomezem.
				Diego_GomezAudience = TRUE;
				
				Log_SetTopicStatus(CH1_JoinOC, LOG_SUCCESS);
				B_LogEntry(CH1_JoinOC,"Diego załatwił mi audiencję u Gomeza. Teraz muszę jeszcze zamienić słowo z Thorusem. Wkrótce będę jednym z ludzi Gomeza!");
			}
			else
			{
				AI_Output (self, hero,"Info_Diego_Points_11_02"); //Ale musisz jeszcze przejść test zaufania.
			};
		}
		else
		{
			B_PrintGuildCondition(5);
		};
	}
	else if (points_oc > 10)
	{
		AI_Output (self, hero,"Info_Diego_Points_11_10"); //W sumie - całkiem nieźle jak na żółtodzioba.
	}
	else if points_oc >= 0
	{
		AI_Output (self, hero,"Info_Diego_Points_11_20"); //Bierz się do roboty. Przed tobą jeszcze daleka droga, jeśli chcesz do czegoś dojść w tym obozie.
	};
	/*else
	{
		AI_Output (self, hero,"Info_Diego_Points_11_30"); //Machst du Witze, Kleiner? Kein Schwein kennt dich hier!
	};*/
};

/*
	Scatty: 	Scatty_ChargeKirgo == LOG_SUCCESS 	+2
				Scatty_ChargeKirgo == LOG_FAILED 	-1
				Scatty_ChargeKharim == LOG_SUCCESS 	+5
				Scatty_ChargeKharim == LOG_FAILED 	+2
			
	Whistler: 	Whistler_BuyMySword = LOG_SUCCESS;	+3
				Whistler_BuyMySword = LOG_FAILED;	+2
				
	Sly: 		Sly_LostNek = LOG_SUCCESS;			+4
	
	Fingers: 	Fingers_Learnt = LOG_SUCCESS; 		+3
	
	Dexter: 	Dexter_GetKalomsRecipe = LOG_SUCCESS; +5
	
	Thorus: 	Thorus_MordragKo = LOG_SUCCESS;		+5
				Thorus_MordragKo = LOG_FAILED;		-5
	
				VAR INT MordragKO_PlayerChoseOreBarons;
				VAR INT MordragKO_PlayerChoseThorus;
				VAR INT MordragKO_HauAb;
				var int MordragKO_StayAtNC;
	
	Fisk: 		Fisk_GetNewHehler = LOG_SUCCESS; // else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	
	//--- EXTRA Bedingung ------
	
	Diego: 		Diego_BringList = LOG_SUCCESS;		
*/


INSTANCE Info_Diego_WhatToSayToGomez (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_WhatToSayToGomez_Condition;
	information	= Info_Diego_WhatToSayToGomez_Info;
	permanent	= 0;
	description = "Co mam zrobić, kiedy stanę przed Gomezem?";
};                       

FUNC INT Info_Diego_WhatToSayToGomez_Condition()
{
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhatToSayToGomez_Info()
{
	AI_Output (hero, self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //Co mam zrobić, kiedy stanę przed Gomezem?
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //Gomez podejmuje decyzje na podstawie instynktu. Jeśli spodoba mu się twoja gęba - pozwoli ci zostać.
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //Od tej pory musisz sobie radzić sam - postaraj się! Powodzenia!
};





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################
//***************************************************************************
//	Info ARMOR
//***************************************************************************
instance  PC_Thief_ARMOR (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_ARMOR_Condition;
	information		= PC_Thief_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_DiegoHeavyShadows,VALUE_STT_ARMOR_H); 
};

FUNC int  PC_Thief_ARMOR_Condition()
{	
	if  ( Npc_GetTrueGuild (hero) == GIL_STT)
	&&  (! Npc_HasItems(hero,STT_ARMOR_H))
	{
		return TRUE;
	};

};
FUNC void  PC_Thief_ARMOR_Info()
{
	
	if (Npc_HasItems (hero,ItMinugget) >= VALUE_STT_ARMOR_H)
	{
		AI_Output			(hero, self,"PC_Thief_ARMOR_Info_15_01"); //Mogę dostać taką zbroję jak twoja?
		AI_Output			(self, hero,"PC_Thief_ARMOR_Info_11_02"); //A masz dość rudy?

		CreateInvItem 		(hero,			STT_ARMOR_H);
		B_GiveInvItems		(hero, self,	ItMinugget,	VALUE_STT_ARMOR_H);
		
		//hier nur ein Text für die Bildschirmausgabe
		CreateInvItem		(self, 			ItAmArrow);
		B_GiveInvItems		(self, hero,	ItAmArrow,	1);
		Npc_RemoveInvItem	(hero,			ItAmArrow);
	}
	else
	{
		AI_Output (self, hero,"PC_Thief_ARMOR_Info_11_03"); //Zdobądź rudę, to dostaniesz zbroję.
	};
};  





//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//----------------------------------------------------------------
// Die Troll Situation
//----------------------------------------------------------------
instance PC_Thief_MEETAGAIN (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_MEETAGAIN_Condition;
	information		= PC_Thief_MEETAGAIN_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_MEETAGAIN_Condition()
{	
	if (Kapitel == 3)
	&& (Npc_GetDistToWP (self,"OW_PATH_190") < 700 )
	{
		return TRUE;
	};
};
func void  PC_Thief_MEETAGAIN_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_00"); //Hej! Myślałem, że już nie żyjesz!
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_01"); //Parę razy też mi się tak wydawało.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_02"); //Wiele się wydarzyło od naszego ostatniego spotkania. Słyszałem, że miałeś swój wkład w wielkie przywołanie!
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_03"); //Widzę, że jesteś świetnie poinformowany.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_04"); //Lepiej niż myślisz... Teraz szukasz kamienia ogniskującego?
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_05"); //Tak. Powinien być gdzieś w pobliżu.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_06"); //Wiem, gdzie go można znaleźć. Jest tylko jeden problem.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_07"); //Rozumiem. Czego chcesz?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_08"); //Widzę, że szybko się uczysz, ale nie o to mi chodziło.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_09"); //Nie? Więc cóż to za problem?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_10"); //O, to całe trzy tony problemów!
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_11"); //Chodźmy. Za chwilę sam zobaczysz.

 	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"GuideTroll");

	Log_CreateTopic		(CH3_TrollCanyon,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_RUNNING);
	B_LogEntry		(CH3_TrollCanyon,"W pobliżu północnego kamienia ogniskującego, niespodziewanie natknąłem się na Diego. Ostrzegł mnie, że coś 'wielkiego' czeka na mnie na końcu tego kanionu.");
	B_LogEntry		(CH3_TrollCanyon,"Jakimś cudem dowiedział się o moich działaniach w obozie Bractwa oraz o poszukiwaniach kamienia. Dalej pójdziemy razem.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info SHOWFOCUS
//---------------------------------------------------------------------
instance PC_Thief_SHOWFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_SHOWFOCUS_Condition;
	information		= PC_Thief_SHOWFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_SHOWFOCUS_Condition()
{	
	if (Npc_KnowsInfo   (hero,PC_Thief_MEETAGAIN))
	&& (Npc_GetDistToWP (self,"LOCATION_12_01") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_SHOWFOCUS_Info()
{	
	AI_GotoNpc(self,hero);
	//AI_PointAt (self, );
	//AI_StopPointAt (self);
	
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //Po lewej stronie tego kanionu znajdziesz wejście do jaskini, która prowadzi do kamienia.
	AI_Output (hero, self,"PC_Thief_SHOWFOCUS_Info_15_02"); //Wszystko jasne. Jednak najpierw musimy się jakoś pozbyć tamtego bydlaka.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //Spróbuj znaleźć jakiś jego słaby punkt albo inny sposób na pokonanie tego Trolla.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //Ściągnę na siebie jego uwagę.

	B_LogEntry		(CH3_TrollCanyon,"Na naszej drodze stanął ogromny troll. Diego zamierza ściągnąć na siebie jego uwagę a ja mam znaleźć jakiś słaby punkt.");

	Npc_ExchangeRoutine	(self,	"WaitAtWheel");

	AI_DrawWeapon		(self);
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERTROLL
//---------------------------------------------------------------------
instance PC_Thief_AFTERTROLL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_AFTERTROLL_Condition;
	information		= PC_Thief_AFTERTROLL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_AFTERTROLL_Condition()
{	
	var int trollFound;
	Npc_PerceiveAll(self);
	trollFound = Wld_DetectNpc(self, Troll, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,PC_Thief_SHOWFOCUS)
	&&	(	(trollFound && (Npc_IsDead(other) || Npc_IsInState(other,ZS_MagicShrink)))				// Troll besiegt...
		||	(Npc_GetDistToWP(hero, "LOCATION_12_14_WHEEL") < 1000)							)		// ...oder Spieler an der Winde angekommen
	{
		return TRUE;
	};
};
func void  PC_Thief_AFTERTROLL_Info()
{
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_01"); //To było niesamowite. Niezły jesteś. Teraz możesz iść po kamień ogniskujący.
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_02"); //Ja dopilnuję, żebyśmy nie mieli już więcej niemiłych niespodzianek.

	B_LogEntry		(CH3_TrollCanyon,"Pokonaliśmy trolla! Teraz mogę zająć się kołowrotem podnoszącym kratę przed platformą z kamieniem ogniskującym.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WHEEL
//---------------------------------------------------------------------
instance  PC_Thief_WHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WHEEL_Condition;
	information		= PC_Thief_WHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_AFTERTROLL)) 
	&& (Troll_Wheel == 1) 
	{
		return TRUE;
	};
};
FUNC void  PC_Thief_WHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_01"); //Kołowrót chyba się zaciął!
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_02"); //Czekaj, może uda mi się go naprawić!

	AI_StopProcessInfos	(self);
	AI_GotoWP 			(self,	"LOCATION_12_14_WHEEL");
	AI_AlignToWP		(self);
	AI_PlayAni			(self,	"T_PLUNDER");
};

//---------------------------------------------------------------------
//	Info FIXWHEEL
//---------------------------------------------------------------------
instance PC_Thief_FIXWHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_FIXWHEEL_Condition;
	information		= PC_Thief_FIXWHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_FIXWHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_WHEEL))
	{
		return TRUE;
	};
};
func void  PC_Thief_FIXWHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_FIXWHEEL_Info_11_01"); //No, teraz powinno działać!
	Troll_Wheel = 2;	// Winde repariert!

	B_LogEntry		(CH3_TrollCanyon,"Diego naprawił kołowrót. Teraz nic już nie stanie mi na drodze.");

	Npc_ExchangeRoutine (self, "WaitAtFocus");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WAITATFOCUS
//---------------------------------------------------------------------
instance PC_Thief_WAITATFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WAITATFOCUS_Condition;
	information		= PC_Thief_WAITATFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WAITATFOCUS_Condition()
{	
	if	Npc_KnowsInfo(hero,PC_Thief_FIXWHEEL)
	&&	(Npc_GetDistToWP(hero,"LOCATION_12_03") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_WAITATFOCUS_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //Idź po kamień. Zaczekam na ciebie tutaj!

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GOTIT
//---------------------------------------------------------------------
//-----SPIELER HAT DEN FOKUS GEFUNDEN---------------------
instance  PC_Thief_GOTIT (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_GOTIT_Condition;
	information		= PC_Thief_GOTIT_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_GOTIT_Condition()
{	
	if (Npc_HasItems (hero,Focus_2))
	{
		return TRUE;
	};
};

FUNC void  PC_Thief_GOTIT_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_01"); //Widzę, że znalazłeś kamień! Świetnie.
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_02"); //Chyba powinienem znowu zajrzeć do Starego Obozu. Powodzenia!
	AI_Output			(hero, self,"PC_Thief_GOTIT_Info_15_03"); //Nie daj się zabić!
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_04"); //Jeszcze się zobaczymy.

	B_LogEntry		(CH3_TrollCanyon,"Mam już kamień ogniskujący. Teraz pozostało tylko przekonać parę harpii, że nie zamierzam go prędko oddawać.");
	B_LogEntry		(CH3_TrollCanyon,"Diego wraca do Starego Obozu. Pewnie się jeszcze spotkamy...");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;

	Npc_ExchangeRoutine	(self, "start");	
};  











//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info OCWARN
//***************************************************************************
instance Info_Diego_OCWARN (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARN_Condition;
	information	= Info_Diego_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Diego_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Diego_OCWARN_11_01"); //Hej... Ciii... Bądź cicho!
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN))
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_02"); //Cześć, Diego. Rozmawiałem już z Miltenem po przeciwnej stronie obozu.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_03"); //Dobrze, zatem wiesz już, co się stało.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_04"); //A słyszałeś o planowanym ataku na Wolną Kopalnię?
	}
	else
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_05"); //Cześć, Diego. Co ma znaczyć ta cała zabawa w chowanego?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_06"); //Nic nie słyszałeś?
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_07"); //O czym?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_08"); //O zawaleniu się Starej Kopalni, zamordowaniu Magów Ognia i planach ataku na Wolną Kopalnię.
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_09"); //CO?! O czym ty mówisz?!
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Diego_OCMINE (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMINE_Condition;
	information	= Info_Diego_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "Jak mogło dojść do zawalenia się Starej Kopalni?";
};

FUNC int Info_Diego_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMINE_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMINE_15_01"); //Jak mogło dojść do zawalenia się kopalni?
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_02"); //Jeden z Kopaczy, któremu udało się uratować, powiedział, że kopiąc na najniższym poziomie trafili na podziemną rzekę.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_03"); //Kiedy woda wdarła się do szybów, popękały podpory i runęła cała górna część.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_04"); //Tylko garstce ludzi udało się wydostać na powierzchnię.
};

//***************************************************************************
//	Info OCKDF
//***************************************************************************
instance Info_Diego_OCKDF (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCKDF_Condition;
	information	= Info_Diego_OCKDF_Info;
	important	= 0;
	permanent	= 0;
	description = "Co się stało z Magami Ognia?";
};

FUNC int Info_Diego_OCKDF_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCFM))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCKDF_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCKDF_15_01"); //Co się stało z Magami Ognia?
	AI_Output		(self,hero,"Info_Diego_OCKDF_11_02"); //To długa historia.
};

//***************************************************************************
//	Info OCFM
//***************************************************************************
instance Info_Diego_OCFM (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFM_Condition;
	information	= Info_Diego_OCFM_Info;
	important	= 0;
	permanent	= 0;
	description = "Napad na Wolną Kopalnię?";
};

FUNC int Info_Diego_OCFM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFM_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFM_15_01"); //Napad na Wolną Kopalnię?
	AI_Output		(self,hero,"Info_Diego_OCFM_11_02"); //To długa historia.
};

//***************************************************************************
//	Info OCSTORY
//***************************************************************************
instance Info_Diego_OCSTORY (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCSTORY_Condition;
	information	= Info_Diego_OCSTORY_Info;
	important	= 0;
	permanent	= 0;
	description = "Opowiadaj.";
};

FUNC int Info_Diego_OCSTORY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCFM) || Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCSTORY_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_01"); //Opowiadaj, to nie pierwsza długa historia, której musiałem wysłuchać.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_02"); //No dobra. Na szczęście byłem właśnie w siedzibie Magnatów, kiedy dotarły do nich wieści o zawaleniu się kopalni.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_03"); //Kiedy Gomez dowiedział się o wypadku, oszalał z wściekłości. Wcale mu się nie dziwię - jego autorytet mógł runąć w każdej chwili, razem z kopalnią.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_04"); //Jasne. Kto kontroluje rudę, kontroluje całą kolonię!
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_05"); //No właśnie. Przecież bez stałego napływu rudy, handel ze światem zewnętrznym padnie raz - dwa.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_06"); //Jeśli Gomez nie znajdzie szybko nowego źródła dochodu, ludzie przestaną go słuchać.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_07"); //I dlatego postanowił najechać Wolną Kopalnię?
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_08"); //Cóż, obiektywnie rzecz biorąc, to jedyna szansa Gomeza na zachowanie władzy.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_09"); //Dwie godziny temu dwa tuziny strażników wyruszyły w kierunku Wolnej Kopalni.

	B_Story_FMTaken	();
};

//***************************************************************************
//	Info OCWARNNC
//***************************************************************************
instance Info_Diego_OCWARNNC (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARNNC_Condition;
	information	= Info_Diego_OCWARNNC_Info;
	important	= 0;
	permanent	= 0;
	description = "To szaleństwo! Muszę uprzedzić Nowy Obóz.";
};

FUNC int Info_Diego_OCWARNNC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARNNC_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_01"); //To szaleństwo! Muszę uprzedzić Nowy Obóz.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_02"); //W takim razie lepiej się pospiesz! Strażnicy są już pewnie niedaleko Wolnej Kopalni.
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_03"); //Ale przecież nie przedrą się tak łatwo przez obronne fortyfikacje Nowego Obozu!
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_04"); //Wcale nie muszą się przez nie przedzierać. Kilka miesięcy temu znaleźliśmy ścieżkę, która prowadzi przez góry wprost do Wolnej Kopalni. Nikt inny nie wie o jej istnieniu.
};

//***************************************************************************
//	Info OCGUARDS
//***************************************************************************
instance Info_Diego_OCGUARDS (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCGUARDS_Condition;
	information	= Info_Diego_OCGUARDS_Info;
	important	= 0;
	permanent	= 0;
	description = "Widziałem Strażników pilnujących zamkniętych bram.";
};

FUNC int Info_Diego_OCGUARDS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCGUARDS_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCGUARDS_15_01"); //Widziałem Strażników pilnujących zamkniętych bram.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_02"); //Trzymaj się z dala od nich. Zaatakują każdego, kto spróbuje dostać się do Obozu.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_03"); //Obawiają się odwetu za napad na Wolną Kopalnię.
};

//***************************************************************************
//	Info OCMURDER
//***************************************************************************
instance Info_Diego_OCMURDER (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMURDER_Condition;
	information	= Info_Diego_OCMURDER_Info;
	important	= 0;
	permanent	= 0;
	description = "Ale co stało się z Magami Ognia?";
};

FUNC int Info_Diego_OCMURDER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMURDER_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_01"); //Ale co stało się z Magami Ognia?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_02"); //Corristo i jego towarzysze byli jedynymi ludźmi w obozie, którzy zachowali zimną krew.
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_03"); //Zabronili przeprowadzenia ataku i domagali się pertraktacji z pozostałymi obozami.
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_04"); //ZABRONILI Gomezowi przeprowadzenia ataku na Wolną Kopalnię?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_05"); //No właśnie. Corristo i jego ludzie byli zbyt zadufani w sobie. Gomez przestał im ufać i kazał ich zdradziecko zamordować.
};

//***************************************************************************
//	Info OCRETREAT
//***************************************************************************
instance Info_Diego_OCRETREAT (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCRETREAT_Condition;
	information	= Info_Diego_OCRETREAT_Info;
	important	= 0;
	permanent	= 0;
	description = "I co teraz zamierzacie zrobić? To znaczy - ty i Milten?";
};

FUNC int Info_Diego_OCRETREAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCMURDER))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCRETREAT_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCRETREAT_15_01"); //I co teraz zamierzacie zrobić? To znaczy - ty i Milten?
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_02"); //Zostaniemy tu jeszcze przez jakiś czas. Będziemy ostrzegali innych przyjaciół, żeby nie wpadli w łapy Strażników.
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_03"); //Ale mógłbyś coś dla nas zrobić.
};

//***************************************************************************
//	Info OCFAVOR
//***************************************************************************
instance Info_Diego_OCFAVOR (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFAVOR_Condition;
	information	= Info_Diego_OCFAVOR_Info;
	important	= 0;
	permanent	= 0;
	description = "Nie ma sprawy. O co chodzi?";
};

FUNC int Info_Diego_OCFAVOR_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFAVOR_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_01"); //Nie ma sprawy. O co chodzi?
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_02"); //Znajdź Lestera i Gorna. Muszą się dowiedzieć o tym, co się tutaj wydarzyło.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_03"); //Powiedz im, że spotkamy się we czwórkę tam gdzie zwykle.
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_04"); //Jeśli znajdę ich przed tobą, przekażę im ostrzeżenie i wezwanie na spotkanie.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_05"); //Dzięki, przyjacielu. Widzę, że równy z ciebie gość. Idź już. Jeszcze się kiedyś spotkamy.
				
	Log_CreateTopic		(CH4_4Friends,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_4Friends,		LOG_RUNNING);
	B_LogEntry			(CH4_4Friends,		"Wszyscy Magowie Ognia zginęli. Sytuacja wymyka się spod kontroli. Diego kazał mi powiadomić Lestera i Gorna, że mają się spotkać z nim i z Miltenem w tajemnym miejscu. Chyba nie robią tego pierwszy raz!"); 
};











































/*

// *******************************************************************

	AI_Output(self,hero,"Info_Diego_Gamestart_11_01"); //Warum haben sie dich hier reingeworfen?
	
	Info_ClearChoices(Info_Diego_Gamestart );
	Info_AddChoice	 (Info_Diego_Gamestart, "Gewitzter Überfall            (+3 Geschicklichkeit)"	,Info_Diego_Gamestart_Choice_Dex);
	Info_AddChoice	 (Info_Diego_Gamestart, "Schlägerei mit Folgen         (+3 Stärke)"				,Info_Diego_Gamestart_Choice_Str);
	Info_AddChoice	 (Info_Diego_Gamestart, "Wahre Worte zum falschen Mann (+3 Mana)"				,Info_Diego_Gamestart_Choice_Man);
	Info_AddChoice	 (Info_Diego_Gamestart, "Unschuldig                    (+1 auf alle Attribute)"	,Info_Diego_Gamestart_Choice_All);
};
// -------------------------------------------- CHOICES ----------------------------------------------------
FUNC VOID Info_Diego_Gamestart_Choice_Dex()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_00"); //Ich habe ne Ladung Erz verschwinden lassen.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_01"); //Dummerweise hat der Typ bei dem ich sie versteckt habe, lieber die Belohnung für mich kassiert, anstatt mit mir das Erz zu teilen.
	PrintScreen	("Geschicklichkeit +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Str()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_00"); //Eine Herausforderung konnte ich noch nie abschlagen. Auch nicht von des Königs Gardisten. dummerweise hat der König viele Gardisten.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_01"); //Zu viele.	
	PrintScreen	("Stärke +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Man()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_00"); //Ich saß in der Kneipe und habe meine Meinung über König, Krieg und Steuern gesagt. 
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_01"); //Ich hab' mich nur zu spät daran erinnert, dass der, der die Wahrheit spricht, ein schnelles Pferd braucht.
	PrintScreen	("Mana +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]+3;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_All()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_All_15_00"); //Ich bin unschuldig!
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_01"); //Du solltest eins wissen: Hier drin ist niemand unschuldig. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_02"); //Hier findest du Männer die so ziemlich jedes mögliche Verbrechen begangen haben. Und einen unschuldigen nehmen die nur zu gerne auseinander. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_03"); //Ich gebe dir nen Tipp, und der ist ganz umsonst. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_04"); //Wenn dich jemand fragt, warum du hier bist, sag ihm, du hast einen Typen gekillt, der dich gefragt hat, warum du hier bist. 
	PrintScreen	("Stärke, Geschick und Mana +1", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] 	= hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] 	= hero.attribute[ATR_STRENGTH]	+1;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]		+1;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]	+1;
	Info_ClearChoices(Info_Diego_Gamestart );


*/
