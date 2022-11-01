//***************************************************************************
//	Info EXIT
//***************************************************************************

INSTANCE Info_Gorn_EXIT (C_INFO)
{
	npc			= PC_Fighter;
	nr   		= 999;
	condition	= Info_Gorn_EXIT_Condition;
	information	= Info_Gorn_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Gorn_EXIT_Condition()
{
	return 1;
};

func VOID Info_Gorn_EXIT_Info()
{
	if	self.aivar[AIV_PARTYMEMBER]
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_01"); //Do boju!
	}
	else
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_02"); //Do zobaczenia.
	};
	
	AI_StopProcessInfos	( self );
};

//*************************************
//			1. Begrüßung
//*************************************

instance DIA_Gorn_First (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_First_Condition;
	information		= Dia_Gorn_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int DIA_Gorn_First_Condition()
{
	if	(Kapitel < 3)
	{
		return 1;
	};
};

func void DIA_Gorn_First_Info()
{
	AI_Output (self, other,"DIA_Gorn_First_09_00"); //Hej, Nowa twarz.
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //Kim jesteś?
	AI_Output (self, other,"DIA_Gorn_First_09_02"); //Nazywam się Gorn. Jestem najemnikiem w służbie magów.
};

//*************************************
//				Leben
//*************************************

instance DIA_Gorn_Leben (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 2;
	condition		= Dia_Gorn_Leben_Condition;
	information		= Dia_Gorn_Leben_Info;
	permanent		= 0;
	description		= "Czym się zajmują Najemnicy?";
};

FUNC int DIA_Gorn_Leben_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Leben_Info()
{
	AI_Output (other, self,"DIA_Gorn_Leben_15_00"); //Czym się zajmują Najemnicy?
	AI_Output (self, other,"DIA_Gorn_Leben_09_01"); //Lee zawarł z Magami umowę. Zatrudnia najlepszych wojowników z całej kolonii - czyli nas.
	AI_Output (self, other,"DIA_Gorn_Leben_09_02"); //Pilnujemy, żeby nikt nie przeszkadzał Kretom w pracy i dbamy o bezpieczeństwo Magów.
	AI_Output (self, other,"DIA_Gorn_Leben_09_03"); //Magowie natomiast przygotowują plan, który pozwoli się nam stąd wyrwać. Jako wynagrodzenie otrzymujemy trochę rudy.
};

//*************************************
//			Hütte (Shrike)
//*************************************
	var int Gorn_ShrikesHut;
//*************************************

instance DIA_Gorn_Hut (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_Hut_Condition;
	information		= Dia_Gorn_Hut_Info;
	permanent		= 0;
	description		= "Czy w Obozie są jeszcze wolne miejsca?";
};

FUNC int DIA_Gorn_Hut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Hut_Info()
{
	AI_Output (other, self,"DIA_Gorn_Hut_15_00"); //Czy w Obozie są jeszcze wolne miejsca, czy będę musiał wykopać kogoś z jego chaty?
	AI_Output (self, other,"DIA_Gorn_Hut_09_01"); //Chyba będziesz musiał. Jeśli naprawdę chcesz to zrobić, zacznij od Krzykacza.
	AI_Output (self, other,"DIA_Gorn_Hut_09_02"); //Złapał dla siebie chatę przy samym wejściu do jaskini. Była pusta, ale tak naprawdę należała do nas.
	AI_Output (other, self,"DIA_Gorn_Hut_15_03"); //Nas?
	AI_Output (self, other,"DIA_Gorn_Hut_09_04"); //No nas, Najemników. Najemnicy i Szkodniki starają się nie włazić sobie w drogę. Ludzie Laresa nie mają wstępu do tej części obozu.
	AI_Output (self, other,"DIA_Gorn_Hut_09_05"); //W sumie to drobiazg, ale sukinsyn nie zapytał nawet o pozwolenie. Tym Szkodnikom nie można pozwolić na zbyt wiele, bo zrobią się nie do wytrzymania.

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,"Najemnik imieniem Gorn opowiedział mi o niejakim Krzykaczu, który przywłaszczył sobie jedną z chat. Jako że mam pozwolenie Gorna, żaden Najemnik nie będzie mi przeszkadzał w 'przekonywaniu' Krzykacza, żeby zmienił lokal.");
	Gorn_ShrikesHut = LOG_RUNNING;
};

//*************************************
//			Hütte LEER (Shrike)
//*************************************

instance DIA_Gorn_HutFree (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_HutFree_Condition;
	information		= Dia_Gorn_HutFree_Info;
	permanent		= 0;
	description		= "Krzykacz przeniósł się już do innej chaty.";
};

FUNC int DIA_Gorn_HutFree_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Shrike_GetLost))
	{
		return 1;
	};
};

func void DIA_Gorn_HutFree_Info()
{
	AI_Output			(other, self,"DIA_Gorn_HutFree_15_00"); //Krzykacz przeniósł się już do innej chaty.
	AI_Output			(self, other,"DIA_Gorn_HutFree_09_01"); //Świetnie! Przed chwilą Torlof powiedział, że zamierza pokazać temu chłoptasiowi, gdzie jest jego miejsce.

	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_SUCCESS);
	B_LogEntry			(CH1_ShrikesHut,"Wykopując Krzykacza z jego chaty wprawiłem Gorna w dobry humor. To chyba porządny człowiek - twardy, ale uczciwy. W przyszłości będę się trzymał blisko niego.");
	B_GiveXP			(XP_ReportedKickedShrike);
};

//*************************************
//			Söldner werden
//*************************************

instance DIA_Gorn_BecomeSLD (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 5;
	condition		= Dia_Gorn_BecomeSLD_Condition;
	information		= Dia_Gorn_BecomeSLD_Info;
	permanent		= 0;
	description		= "Co mam zrobić, żeby zostać członkiem Nowego Obozu?";
};

FUNC int DIA_Gorn_BecomeSLD_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Gorn_First)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_Gorn_BecomeSLD_Info()
{
	AI_Output (other, self,"DIA_Gorn_BecomeSLD_15_00"); //Co mam zrobić, żeby zostać członkiem Nowego Obozu?
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_01"); //Musisz trochę popracować nad swoimi umiejętnościami bojowymi, zanim Lee zgodzi się cię przyjąć. Nieważne w jakiej broni się specjalizujesz, byleś był w tym dobry.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_02"); //Oprócz tego powinieneś mieć chociaż ogólne pojęcie o życiu w kolonii, układach między obozami, i takie tam...
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_03"); //Jeśli nie interesują cię inne obozy, spróbuj na początek dołączyć do Szkodników. Na zostanie Najemnikiem jeszcze przyjdzie czas.
};

/*
//*************************************
//				PERM
//*************************************

instance DIA_Gorn_PERM (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_PERM_Condition;
	information		= Dia_Gorn_PERM_Info;
	permanent		= 1;
	description		= "";
};

FUNC int DIA_Gorn_PERM_Condition()
{
	return 1;
};

func void DIA_Gorn_PERM_Info()
{
	AI_Output (other, self,"DIA_Gorn_PERM_15_00"); //
	AI_Output (self, other,"DIA_Gorn_PERM_09_01"); //
};
*/

//*************************************
//				TRADE
//*************************************
	var int Gorn_Trade;
//*************************************

instance DIA_Gorn_TRADE (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 800;
	condition		= Dia_Gorn_TRADE_Condition;
	information		= Dia_Gorn_TRADE_Info;
	permanent		= 1;
	description		= DIALOG_TRADE;
	trade 			= 1;
};

FUNC int DIA_Gorn_TRADE_Condition()
{
	//if (Npc_KnowsInfo(hero,DIA_Gorn_DuHehler))
	//{
		//return 1; //***Man darf NICHT seine Waffe weggkaufen oder so...
	//};
};

func void DIA_Gorn_TRADE_Info()
{
	AI_Output (other, self,"DIA_Gorn_TRADE_15_00"); //Masz więcej tego towaru?
	AI_Output (self, other,"DIA_Gorn_TRADE_09_01"); //Całe mnóstwo. Chcesz kupić?
};

//*************************************
//			DU Hehler?
//*************************************

instance DIA_Gorn_DuHehler (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_DuHehler_Condition;
	information		= Dia_Gorn_DuHehler_Info;
	permanent		= 0;
	description		= "Jak to możliwe, że wziąłeś udział w napadzie zorganizowanym przez tę bandę?";
};

FUNC int DIA_Gorn_DuHehler_Condition()
{
	if (Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil))
	{
		return 1;
	};
};

func void DIA_Gorn_DuHehler_Info()
{
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_00"); //Jak to możliwe, że wziąłeś udział w jednym z napadów zorganizowanych przez tę bandę?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_01"); //A kto twierdzi, że wziąłem?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_02"); //Skąd mógłbyś wziąć taką ilość towaru, gdybyś nie uczestniczył w napadzie.
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_03"); //Naprawdę myślisz, że taką ilość towaru można zebrać po JEDNYM głupim napadzie?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_04"); //To znaczy, że uczestniczysz w nich regularnie?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_05"); //Nawet gdyby tak było, nie mógł bym ci o tym powiedzieć. Lee dałby mi zdrowo popalić.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_06"); //Rozumiem.
	
	CreateInvItems(self, ItFoApple, 21);
	B_GiveInvItems	(self,other, ItFoApple,21); //Notwendig für Screenausgabe
	Npc_RemoveInvItems (other, ItFoApple,21);
	
	CreateInvItems(other, ItMw_1H_LightGuardsSword_03, 1);
	CreateInvItems(other, ItFoApple, 5);
	CreateInvItems(other, ItFoLoaf, 5);
	CreateInvItems(other, ItFoCheese, 5);
	CreateInvItems(other, ItFoBeer, 5);
};







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NCWAIT
//***************************************************************************
INSTANCE Info_Gorn_NCWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 1;
	condition	= Info_Gorn_NCWAIT_Condition;
	information	= Info_Gorn_NCWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_NCWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"NC_PATH52")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_NCWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_NCWAIT_09_01"); //Ach, to ty! Mój przyjaciel z obozu na bagnie, Lester, doniósł mi o twoich dokonaniach.
	AI_Output (self, other,"Info_Gorn_NCWAIT_09_02"); //Jak na kogoś, kto jest tu od niedawna, zaszedłeś całkiem daleko.
	AI_Output (other, self,"Info_Gorn_NCWAIT_15_03"); //Parę razy zaszedłem nawet na skraj własnego grobu.
};

//***************************************************************************
//	Info MAGES
//***************************************************************************
INSTANCE Info_Gorn_MAGES (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MAGES_Condition;
	information	= Info_Gorn_MAGES_Info;
	important	= 0;	
	permanent	= 0;
	description	= "Mam ważną wiadomość dla Magów Wody!";
};                       

FUNC INT Info_Gorn_MAGES_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_NCWAIT))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MAGES_Info()
{
	AI_Output (other, self,"Info_Gorn_MAGES_15_01"); //Mam ważną wiadomość dla Magów Wody!
	AI_Output (self, other,"Info_Gorn_MAGES_09_02"); //W takim razie powinieneś zgłosić się do Saturasa. To najwyższy z Magów Wody. Jak go znam, siedzi teraz nad jakąś magiczną księgą albo czymś w tym stylu.
	AI_Output (self, other,"Info_Gorn_MAGES_09_03"); //Ale niezależnie od tego jak ważne są wieści, które przynosisz, strażnicy z górnego poziomu nie pozwolą ci się z nim zobaczyć.
	AI_Output (other, self,"Info_Gorn_MAGES_15_04"); //A nie mógłbyś się za mną wstawić?
	AI_Output (self, other,"Info_Gorn_MAGES_09_05"); //Ja nie, ale Cronos, strażnik rudy może udzielić ci pozwolenia na spotkanie z Saturasem.
};

//***************************************************************************
//	Info CRONOS
//***************************************************************************
INSTANCE Info_Gorn_CRONOS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_CRONOS_Condition;
	information	= Info_Gorn_CRONOS_Info;
	important	= 0;	
	permanent	= 0;
	description	= "Gdzie znajdę tego 'strażnika rudy'?";
};                       

FUNC INT Info_Gorn_CRONOS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_MAGES))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_CRONOS_Info()
{
	AI_Output			(other, self,"Info_Gorn_CRONOS_15_01"); //Gdzie znajdę tego "strażnika rudy"?
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_01a");//Idąc stąd trafisz na wielką jaskinię mieszkalną, niedaleko tamy.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_02"); //Cronos przebywa zwykle obok kraty broniącej dostępu do kopca rudy.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_03"); //Ale to nieco arogancki człowiek. Będziesz musiał go jakoś przekonać, że twoja wiadomość jest naprawdę ważna.

	VAR C_NPC Cronos;
	Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	
	B_LogEntry		(CH3_EscapePlanNC,"Gorn radzi mi iść wprost do Arcymistrza Magów Wody, niejakiego Saturasa. Cronos, Strażnik Rudy, może mi załatwić audiencję. Znajdę go w centrum obozu, przy kracie nad kopcem rudy."); 

	Npc_ExchangeRoutine	(self, "start");
};

//***************************************************************************
//	Info RUINWAIT
//***************************************************************************
INSTANCE Info_Gorn_RUINWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 2;
	condition	= Info_Gorn_RUINWAIT_Condition;
	information	= Info_Gorn_RUINWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"OW_PATH_ABYSS_4")<1000)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_01"); //Cześć, żółtodziobie. Jak widzisz kolonia to bardzo małe miejsce.
	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_02"); //Cały czas wpada się na tych samych ludzi.
};

//***************************************************************************
//	Info RUINWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWHAT_Condition;
	information	= Info_Gorn_RUINWHAT_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co tu robisz?";
};                       

FUNC INT Info_Gorn_RUINWHAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWHAT_Info()
{
	AI_Output 		(other, self,"Info_Gorn_RUINWHAT_15_01"); //Co tu robisz?
	AI_Output		(self, other,"Info_Gorn_RUINWHAT_09_02"); //Och, podążam śladem pewnej prastarej legendy.
	AI_Output		(other, self,"Info_Gorn_RUINWHAT_15_03"); //Legendy?
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_04"); //Tak, Milten - mój kumpel ze Starego Obozu, powiedział mi, że kiedyś ten teren zamieszkiwali mnisi.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_05"); //Oczywiście to było na długo przed powstaniem Bariery.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_06"); //Ponoć czczono tutaj bóstwo, które pozwalało mnichom przybierać postać zwierząt.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_07"); //Założę się, że są tu jeszcze jakieś skarby pozostałe po dawnych czasach.

	if (!Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS))
	{	
		AI_Output	(self, other,"Info_Gorn_RUINWHAT_09_08"); //A co ciebie tu sprowadza?
	};
};

//***************************************************************************
//	Info RUINFOCUS
//***************************************************************************
INSTANCE Info_Gorn_RUINFOCUS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINFOCUS_Condition;
	information	= Info_Gorn_RUINFOCUS_Info;
	important	= 0;	
	permanent	= 0;
	description = "Szukam magicznego kamienia ogniskującego.";
};                       

FUNC INT Info_Gorn_RUINFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINFOCUS_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_01"); //Szukam magicznego kamienia ogniskującego.
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_02"); //Powinien być gdzieś w okolicy.
	AI_Output (self, other,"Info_Gorn_RUINFOCUS_09_03"); //Przedmiot, którego szukasz może znajdować się na terenie starego klasztoru, za tym kanionem.
};

//***************************************************************************
//	Info RUINJOIN
//***************************************************************************
INSTANCE Info_Gorn_RUINJOIN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINJOIN_Condition;
	information	= Info_Gorn_RUINJOIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Moglibyśmy wybrać się tam razem.";
};                       

FUNC INT Info_Gorn_RUINJOIN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS) && Npc_KnowsInfo(hero, Info_Gorn_RUINWHAT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINJOIN_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_01"); //Moglibyśmy wybrać się tam razem.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_02"); //Dobry pomysł. Cała okolica aż roi się od zębaczy.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_03"); //W pojedynkę nie powinny stwarzać kłopotu wytrawnemu myśliwemu, ale te bestie zwykle polują całymi stadami.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_04"); //A grupa zębaczy potrafi rozerwać na strzępy nawet bardzo doświadczonego wojownika.
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_05"); //Zatem pójdziemy tam razem?
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_06"); //Dobra, ale zanim przejdziemy po tym pniu, chciałbym przyjrzeć się uważniej temu kanionowi. Lubię wiedzieć, co mam za plecami.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_07"); //Chodź za mną. Odkryłem ścieżkę, która nas tam zaprowadzi.

	Log_CreateTopic		(CH3_MonasteryRuin,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_RUNNING);
	B_LogEntry			(CH3_MonasteryRuin,"W pobliżu ruin starego klasztoru spotkałem Najemnika Gorna. Zamierza rozejrzeć się po ruinach w poszukiwaniu starych skarbów.");
	B_LogEntry			(CH3_MonasteryRuin,"Od tej pory będziemy podróżować razem. Gorn uprzedził mnie o stadach zębaczy nawiedzających te tereny.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,	"RuinAbyss");
};

//***************************************************************************
//	Info RUINABYSS
//***************************************************************************
INSTANCE Info_Gorn_RUINABYSS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINABYSS_Condition;
	information	= Info_Gorn_RUINABYSS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINABYSS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) && (Npc_GetDistToWP(self,"OW_ABYSS_TO_CAVE_MOVE6")<1000) )
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINABYSS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_01"); //To się nazywa szczęście! Najwyraźniej ta jaskinia była wykorzystywana jako składowisko.
	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_02"); //Możesz teraz prowadzić do klasztoru. Chciałem mieć pewność, że nie spotkają nas jakieś paskudne niespodzianki w drodze powrotnej.

	B_LogEntry		(CH3_MonasteryRuin,"Odkryliśmy ukrytą jaskinię! Pośród innych rzeczy, znaleźliśmy również dwa zwoje z zaklęciami i klucz!");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinFollow");
};

//***************************************************************************
//	Info RUINLEAVE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVE_Condition;
	information	= Info_Gorn_RUINLEAVE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_175_MEATBUG")>15000)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEAVE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_01"); //Widzę, że ten stary klasztor przestał cię już interesować.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_02"); //Zatem dalej pójdę sam.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_03"); //Gdybyś zmienił zdanie, możesz mnie dogonić.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinWall");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINWALL
//***************************************************************************
INSTANCE Info_Gorn_RUINWALL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALL_Condition;
	information	= Info_Gorn_RUINWALL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWALL_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		(Npc_GetDistToWP(hero,"OW_PATH_175_GATE1")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWALL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_01"); //Cholerna brama. Ponoć nikomu jeszcze nie udało się jej otworzyć.
	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_02"); //Te bestyjki pod drugiej stronie są pewnie jedynymi istotami, którym udało się dostać do środka.

	B_LogEntry		(CH3_MonasteryRuin,"Stoimy przed zamkniętą bramą. Wygląda na to, że nie da się jej otworzyć od zewnątrz.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinWall");
};

//***************************************************************************
//	Info RUINWALLWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWALLWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALLWHAT_Condition;
	information	= Info_Gorn_RUINWALLWHAT_Info;
	important	= 0;	
	permanent	= 1;
	description = "I co teraz?";
};                       

FUNC INT Info_Gorn_RUINWALLWHAT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINWALL)
	&& 		!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINWALLWHAT_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINWALLWHAT_15_01"); //I co teraz?
	AI_Output (self, other,"Info_Gorn_RUINWALLWHAT_09_02"); //Musisz znaleźć jakiś sposób na przedostanie się na drugą stronę bramy.
};

//***************************************************************************
//	Info RUINLEDGE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEDGE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEDGE_Condition;
	information	= Info_Gorn_RUINLEDGE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEDGE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_MONSTER_NAVIGATE_02")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEDGE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_01"); //Na górze jest chyba jakaś platforma. Ale wątpię, żeby udało się nam wspiąć tak wysoko.
	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_02"); //Musimy znaleźć inną drogę.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINPLATFORM
//***************************************************************************
INSTANCE Info_Gorn_RUINPLATFORM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINPLATFORM_Condition;
	information	= Info_Gorn_RUINPLATFORM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINPLATFORM_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_176_TEMPELFOCUS4")<300)	)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINPLATFORM_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_01"); //To mi wygląda na jakiś piedestał.
	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_02"); //Może leżał tu kiedyś artefakt, którego szukasz.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINGATE
//***************************************************************************
INSTANCE Info_Gorn_RUINGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINGATE_Condition;
	information	= Info_Gorn_RUINGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINGATE_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		MonasteryRuin_GateOpen																	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINGATE_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINGATE_09_01"); //Widzę, że udało ci się otworzyć tę bramę. To zaklęcie, którego użyłeś było całkiem sprytne.
	AI_Output			(other, self,"Info_Gorn_RUINGATE_15_02"); //No, możemy iść dalej.

	B_LogEntry		(CH3_MonasteryRuin,"Przy pomocy jednego ze zwojów znalezionych w jaskini, zamieniłem się w chrząszcza. W ten sposób udało mi się dostać na teren klasztoru przez wyrwę w murze.");
	B_LogEntry		(CH3_MonasteryRuin,"Brama została otwarta.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"RuinFollowInside");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info RUINLEAVEINSIDE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVEINSIDE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVEINSIDE_Condition;
	information	= Info_Gorn_RUINLEAVEINSIDE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVEINSIDE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_ABYSS_CROSS_6")<1000)
	&&	!Npc_HasItems(hero, Focus_4)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINLEAVEINSIDE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //Widzę, że ten stary klasztor przestał cię już interesować.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //Dalej pójdę sam.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Gdybyś zmienił zdanie, możesz mnie dogonić.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinStay");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINSUCCESS
//***************************************************************************
INSTANCE Info_Gorn_RUINSUCCESS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINSUCCESS_Condition;
	information	= Info_Gorn_RUINSUCCESS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINSUCCESS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		Npc_HasItems (hero, Focus_4)			)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINSUCCESS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_01"); //A więc znalazłeś swój magiczny artefakt!
	AI_Output 			(other, self,"Info_Gorn_RUINSUCCESS_15_02"); //Tak. Muszę zanieść ten kamień ogniskujący do Magów Wody. 
	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_03"); //Pójdę kawałek z tobą.

	B_LogEntry		(CH3_MonasteryRuin,"Znalazłem kamień ogniskujący! Gorn będzie mi jeszcze trochę towarzyszył.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinYard");

	Wld_InsertNpc		(YoungTroll,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINTROLL
//***************************************************************************
INSTANCE Info_Gorn_RUINTROLL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINTROLL_Condition;
	information	= Info_Gorn_RUINTROLL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINTROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_SNAPPER04_SPAWN01")<1000)		)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINTROLL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_01"); //O JASNA CHOLERA! A co to za monstrum?
	AI_Output 			(other, self,"Info_Gorn_RUINTROLL_15_02"); //Skąd się tu wzięło coś takiego?
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_03"); //To mi wygląda na jednego z tych niezniszczalnych Trolli, ale jest trochę mniejsze.
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_04"); //Trudno, jeśli chcemy się stąd wydostać, musimy go jakoś minąć.

	AI_StopProcessInfos	(self);

	AI_DrawWeapon		(self);
	AI_SetWalkmode		(self,	NPC_RUN);
	//AI_GotoWP			(self,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINVICTORY
//***************************************************************************
INSTANCE Info_Gorn_RUINVICTORY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINVICTORY_Condition;
	information	= Info_Gorn_RUINVICTORY_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINVICTORY_Condition()
{
	var C_NPC	yTroll;
	yTroll = Hlp_GetNpc(YoungTroll);

	if	Npc_KnowsInfo(hero, Info_Gorn_RUINTROLL) 
	&&	Npc_IsDead(yTroll)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINVICTORY_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_01"); //Nie było łatwo!
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_02"); //Tak, ale w końcu się nam udało! To chyba był jakiś młody Troll.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_03"); //... Więc pewnie nie chciałbyś wpaść na jego rodziców, co?
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_04"); //Raczej nie!
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_05"); //Tutaj nasze drogi się rozchodzą. Chcę tu trochę zostać i rozejrzeć się po okolicy.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_06"); //Ale na pewno jeszcze się spotkamy. Do zobaczenia, przyjacielu.

	B_LogEntry		(CH3_MonasteryRuin,"W drodze powrotnej, na dziedzińcu klasztoru, spotkaliśmy młodego trolla. Stoczyliśmy z nim ciężką walkę, ale koniec końców - zwyciężyliśmy!");
	B_LogEntry		(CH3_MonasteryRuin,"Nasze drogi tutaj się rozchodzą. Mam przeczucie, że już niedługo spotkamy się znowu.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"RuinStay");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DIEGOMILTEN
//---------------------------------------------------------------------
INSTANCE Info_Gorn_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_DIEGOMILTEN_Condition;
	information	= Info_Gorn_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Spotkałem Diego i Miltena przed Starym Obozem!";
};                       

FUNC INT Info_Gorn_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_DIEGOMILTEN_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //Spotkałem Diego i Miltena przed Starym Obozem!
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //To dobra wiadomość!
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //Mają się spotkać z tobą i z Lesterem w zwykłym miejscu.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Dzięki. W dzisiejszych czasach nie ma nic cenniejszego niż kilku oddanych przyjaciół.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //Jesteś już prawie jednym z nas. Udowodniłeś, że można na tobie polegać!

	B_GiveXP			(XP_MessageForGorn);
	
	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else 
	{
		B_LogEntry			(CH4_4Friends,		"Poinformowałem Lestera i Gorna o spotkaniu z ich przyjaciółmi. Moje zadanie skończone. Dalej będą musieli radzić sobie sami..."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};

};

//---------------------------------------------------------------------
//	Info FREEMINE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FREEMINE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FREEMINE_Condition;
	information	= Info_Gorn_FREEMINE_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co zobaczyłeś w Wolnej Kopalni?";
};                       

FUNC INT Info_Gorn_FREEMINE_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	&& !FindXardas
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FREEMINE_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_01"); //Co zobaczyłeś w Wolnej Kopalni?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_02"); //Po powrocie ze starego klasztoru chciałem złożyć wizytę Okylowi, szefowi Wolnej Kopalni.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_03"); //Ale gdy dotarłem na miejsce, zastałem tylko stygnące ciała.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_04"); //Dostrzegłem kilku Strażników okopujących się przy wejściu do kopalni.
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_05"); //Jak to możliwe, że duży oddział Najemników uległ garstce Strażników?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_06"); //To musiała być jakaś zasadzka. W końcu kto mógłby się spodziewać ataku od strony gór?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_07"); //Element zaskoczenia może zwielokrotnić zdolności bojowe oddziału.
};

//---------------------------------------------------------------------
//	Info GUARDNC
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNC (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNC_Condition;
	information	= Info_Gorn_GUARDNC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co zamierzasz robić dalej?";
};                       

FUNC INT Info_Gorn_GUARDNC_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNC_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_01"); //Co zamierzasz robić dalej?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_02"); //Musimy zmienić całą naszą strategię obrony. To trochę potrwa.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_03"); //Dopóki Lee nie zdoła przeorganizować swoich oddziałów, dołączę do prowizorycznej straży Corda.
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_04"); //Przygotowujecie się do kontrataku?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_05"); //Jeszcze nie, ale wkrótce na pewno to zrobimy.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_06"); //Gdybyś mnie kiedyś potrzebował, zacznij tutaj i idź w stronę kopalni. Będę tam stał na straży.

	B_Story_CordsPost	();

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GUARDNCRUNNING
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNCRUNNING (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNCRUNNING_Condition;
	information	= Info_Gorn_GUARDNCRUNNING_Info;
	important	= 0;	
	permanent	= 1;
	description = "Jak leci?";
};                       

FUNC INT Info_Gorn_GUARDNCRUNNING_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_GUARDNC)
	&&	!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNCRUNNING_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01"); //Jak leci?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Na razie cicho. W Wolnej Kopalni nic się nie rusza.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //Lee zajmuje się jeszcze organizacją naszej obrony!
};

//---------------------------------------------------------------------
//	Info POST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_POST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_POST_Condition;
	information	= Info_Gorn_POST_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_POST_Condition()
{
	if (UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_POST_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_POST_09_01"); //Przybywasz w samą porę! Przygotowujemy się do kontruderzenia.
	AI_Output 			(self, hero,"Info_Gorn_POST_09_02"); //Na początek spróbujemy odbić Wolną Kopalnię.
};

//---------------------------------------------------------------------
//	Info TAKEBACK
//---------------------------------------------------------------------
INSTANCE Info_Gorn_TAKEBACK (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_TAKEBACK_Condition;
	information	= Info_Gorn_TAKEBACK_Info;
	important	= 0;	
	permanent	= 0;
	description = "Zamierzacie ją zdobyć we czterech?";
};                       

FUNC INT Info_Gorn_TAKEBACK_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_TAKEBACK_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_TAKEBACK_15_01"); //Zamierzacie ją zdobyć we czterech? A gdzie są wszyscy Najemnicy?
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_02"); //Uderzenie od frontu nie ma szans powodzenia. Ludzie Gomeza za dobrze się okopali.
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_03"); //Spróbujemy zaatakować po cichu, zabijając jednego strażnika po drugim. Może się uda...
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_04"); //Lee kazał mi przekazać ci wiadomość.

	var int guild;
	guild = Npc_GetTrueGuild(hero);
	if 		(guild == GIL_SLD)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_05"); //Jako jeden z naszych najlepszych Najemników zostałeś wyznaczony do udziału w tej misji.
	}
	else if	(guild == GIL_KDW)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_06"); //Jako Mag z Kręgu Wody i doświadczony wojownik, zostałeś wybrany do udziału w tej misji.
	}
	else if (guild == GIL_ORG)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_07"); //Jako jeden z naszych najlepszych Szkodników zostałeś wybrany do udziału w tej misji.
	}
	else
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_08"); //Choć nie jesteś jednym z nas, wielokrotnie oddałeś nam nieocenione przysługi.
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_09"); //Dlatego chcemy cię prosić o udział w tej misji.
	};
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_10"); //Pójdę z tobą. Razem może się nam udać.
};

//---------------------------------------------------------------------
//	Info SECOND
//---------------------------------------------------------------------
INSTANCE Info_Gorn_SECOND (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_SECOND_Condition;
	information	= Info_Gorn_SECOND_Info;
	important	= 0;	
	permanent	= 0;
	description = "Na początek? A co zamierzacie robić później?";
};                       

FUNC INT Info_Gorn_SECOND_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_SECOND_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_01"); //Na początek? A co zamierzacie robić później?
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_02"); //Jak tylko odbijemy kopalnię, spróbujemy odnaleźć ścieżkę, którą przyszli ludzie Gomeza!
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_03"); //Kiedy ustawimy przy niej straż, będziemy bezpieczni.
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_04"); //Rozumiem.
};

//---------------------------------------------------------------------
//	Info WHYME
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WHYME (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WHYME_Condition;
	information	= Info_Gorn_WHYME_Info;
	important	= 0;	
	permanent	= 0;
	description = "Dlaczego właśnie ja?!";
};                       

FUNC INT Info_Gorn_WHYME_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_TAKEBACK))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WHYME_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_WHYME_15_01"); //Dlaczego właśnie ja?!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_02"); //Wielokrotnie udowodniłeś, że jesteś silnym i przebiegłym wojownikiem!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_03"); //Poza tym znasz Stary Obóz i jego strażników lepiej niż ktokolwiek z nas.
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_04"); //Trudno o kogoś lepszego niż ty!
};

//---------------------------------------------------------------------
//	Info KICKBUTT
//---------------------------------------------------------------------
INSTANCE Info_Gorn_KICKBUTT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_KICKBUTT_Condition;
	information	= Info_Gorn_KICKBUTT_Info;
	important	= 0;	
	permanent	= 0;
	description = "No dobrze, chodźmy. Nauczymy tych nieproszonych gości dobrych manier.";
};                       

FUNC INT Info_Gorn_KICKBUTT_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_MYWAY)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_KICKBUTT_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_KICKBUTT_15_01"); //No dobrze, chodźmy. Nauczymy tych nieproszonych gości dobrych manier.
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_02"); //Wiedziałem, że można na ciebie liczyć.
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_03"); //Weź ten klucz. Otwiera stróżówkę przy wejściu do kopalni.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info MYWAY
//---------------------------------------------------------------------
INSTANCE Info_Gorn_MYWAY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MYWAY_Condition;
	information	= Info_Gorn_MYWAY_Info;
	important	= 0;	
	permanent	= 0;
	description = "Czemu nie. I tak muszę dostać się do kopalni!";
};                       

FUNC INT Info_Gorn_MYWAY_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MYWAY_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_MYWAY_15_01"); //Czemu nie. I tak muszę dostać się do kopalni!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_02"); //Nieważne DLACZEGO to robisz. Cieszę się, że jesteś z nami!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_03"); //Weź ten klucz. Otwiera stróżówkę przy wejściu do kopalni.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info WOLF
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WOLF (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WOLF_Condition;
	information	= Info_Gorn_WOLF_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_WOLF_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_076")<500)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WOLF_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_01"); //Ach, prawie zapomniałem!
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_02"); //Wilk chce z tobą koniecznie porozmawiać, zanim ruszymy do kopalni.

	Info_ClearChoices	(Info_Gorn_WOLF);
	Info_AddChoice		(Info_Gorn_WOLF,"To może zaczekać, mamy teraz ważniejsze sprawy na głowie.",	Info_Gorn_WOLF_FM);	
	Info_AddChoice		(Info_Gorn_WOLF,"Więc lepiej do niego zajrzę.",		Info_Gorn_WOLF_WOLF);	

	B_LogEntry			(CH4_UluMulu,"Wilk chce ze mną porozmawiać zanim ruszę do kopalni. Powinienem chyba do niego zajrzeć.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_04"); //To może zaczekać, mamy teraz ważniejsze sprawy na głowie.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_05"); //Jak chcesz!
	AI_StopProcessInfos	(self);
};

func void Info_Gorn_WOLF_WOLF ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_06"); //Więc lepiej do niego zajrzę.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_07"); //W porządku. Zaczekam na ciebie tutaj.

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LEAVEFORPOST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_LEAVEFORPOST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_LEAVEFORPOST_Condition;
	information	= Info_Gorn_LEAVEFORPOST_Info;
	important	= 1;	
	permanent	= 1;
};                       

FUNC INT Info_Gorn_LEAVEFORPOST_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_074")<2000)
	&& (FreemineOrc_LookingUlumulu != LOG_RUNNING)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_LEAVEFORPOST_Info()
{
	AI_GotoNpc			(self, hero);

	if (Npc_KnowsInfo(hero,Info_Gorn_WOLF))
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_01"); //Widzę, że jednak nie chcesz porozmawiać z Wilkiem!
	}
	else
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_02"); //Idziesz w złą stronę! Mamy iść prosto do kopalni!
	};
	AI_Output 			(self, hero,"Info_Gorn_LEAVEFORPOST_09_03"); //Zaczekam na ciebie przy prowizorycznym punkcie strażniczym!

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info REJOINFORFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_REJOINFORFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_REJOINFORFM_Condition;
	information	= Info_Gorn_REJOINFORFM_Info;
	important	= 0;	
	permanent	= 1;
	description = "Ruszamy do kopalni!";
};                       

FUNC INT Info_Gorn_REJOINFORFM_Condition()
{
	if 	(Npc_KnowsInfo  (hero, Info_Gorn_MYWAY) || Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT))
	&&	(Npc_GetDistToWP(hero, "OW_PATH_075_GUARD4")<1000)
	&&	(!Gorn_JoinedForFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_REJOINFORFM_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_REJOINFORFM_15_01"); //Ruszamy do kopalni!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_02"); //Pora przepędzić stamtąd ludzi Gomeza!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_03"); //Idź przodem. Pójdę za tobą.

	Gorn_JoinedForFM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"FollowToFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info RAZOR
//---------------------------------------------------------------------
INSTANCE Info_Gorn_RAZOR (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RAZOR_Condition;
	information	= Info_Gorn_RAZOR_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RAZOR_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_3000")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RAZOR_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_01"); //UWAGA! BRZYTWY!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_02"); //Polują w stadach, jak zębacze, tylko gryzą znacznie mocniej!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_03"); //Powinniśmy się najpierw z nimi rozprawić. Znasz mnie - lubię wiedzieć, co mam za plecami.

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMCENTRANCE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMCENTRANCE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMCENTRANCE_Condition;
	information	= Info_Gorn_FMCENTRANCE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMCENTRANCE_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "FMC_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMCENTRANCE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_01"); //Zaczekaj! Widzisz te wszystkie ciała?
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_02"); //Idź do wejścia do kopalni. Ja zaczekam tutaj i przypilnuję, żeby ktoś lub coś nie zaszło nas od tyłu.
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_03"); //Kiedy już zejdziesz na dół, pójdę za tobą.

	Npc_ExchangeRoutine	(self,	"WaitFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMGATE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMGATE_Condition;
	information	= Info_Gorn_FMGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMGATE_Condition()
{
	if Gorn_JoinedForFM
	&& !FM_GateOpen
	&& (Npc_GetDistToWP(hero, "FMC_FM_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMGATE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_01"); //Usłyszałem odgłosy walki i przybiegłem najszybciej jak mogłem!
	AI_Output 			(hero, self,"Info_Gorn_FMGATE_15_02"); //Stary znajomy... Rachunek wyrównany.
	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_03"); //Dobra, otwieraj bramę. Je będę tu stał na straży!

	Npc_ExchangeRoutine	(self,	"WaitFM");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_AFTERFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_AFTERFM_Condition;
	information	= Info_Gorn_AFTERFM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_AFTERFM_Condition()
{
	if	FreemineOrc_LookingUlumulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_AFTERFM_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_01"); //Stary, to się dopiero nazywa trudna walka!
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_02"); //Nie spodziewałem się, że Strażnicy Gomeza będą stawiali tak zaciekły opór.
	AI_Output 			(hero, self,"Info_Gorn_AFTERFM_15_03"); //Grunt, że kopalnia znowu jest w naszych rękach.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_04"); //Zostanę tutaj i dopilnuję, żeby tak już zostało!

	B_Story_LeftFM		();
	
	Lee_freeminereport = 1;  //jetzt kann der SC Lee über die befreite Mine informieren.     ***Björn***

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMWATCH
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMWATCH (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMWATCH_Condition;
	information	= Info_Gorn_FMWATCH_Info;
	important	= 0;	
	permanent	= 1;
	description = "Co słychać?";
};                       

FUNC INT Info_Gorn_FMWATCH_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_AFTERFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMWATCH_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FMWATCH_15_01"); //Co słychać?
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_02"); //Na razie cicho. W Wolnej Kopalni nic się nie rusza.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_03"); //Lee powinien niedługo podesłać tu posiłki.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_04"); //Póki co postaram się tutaj rozgościć.
};


//---------------------------------------------------------------------
//	Info FOUNDULUMULU
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FOUNDULUMULU (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FOUNDULUMULU_Condition;
	information	= Info_Gorn_FOUNDULUMULU_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FOUNDULUMULU_Condition()
{
	if	(FreemineOrc_LookingUlumulu == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FOUNDULUMULU_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_01"); //Masz przy sobie ciekawą ozdóbkę. Orkowa, prawda?
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_02"); //To od tego niewolnika z kopalni?
	AI_Output 			(hero, self,"Info_Gorn_FOUNDULUMULU_15_03"); //To orkowy symbol przyjaźni. Przy jego pomocy zamierzam dostać się do miasta Orków.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_04"); //Oby tylko Orkowie uszanowali to... COŚ!

	B_Kapitelwechsel	(5);

	AI_StopProcessInfos	(self);
};








