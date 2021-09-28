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
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //Kim jesteœ?
	AI_Output (self, other,"DIA_Gorn_First_09_02"); //Nazywam siê Gorn. Jestem najemnikiem w s³u¿bie magów.
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
	description		= "Czym siê zajmuj¹ Najemnicy?";
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
	AI_Output (other, self,"DIA_Gorn_Leben_15_00"); //Czym siê zajmuj¹ Najemnicy?
	AI_Output (self, other,"DIA_Gorn_Leben_09_01"); //Lee zawar³ z Magami umowê. Zatrudnia najlepszych wojowników z ca³ej kolonii - czyli nas.
	AI_Output (self, other,"DIA_Gorn_Leben_09_02"); //Pilnujemy, ¿eby nikt nie przeszkadza³ Kretom w pracy i dbamy o bezpieczeñstwo Magów.
	AI_Output (self, other,"DIA_Gorn_Leben_09_03"); //Magowie natomiast przygotowuj¹ plan, który pozwoli siê nam st¹d wyrwaæ. Jako wynagrodzenie otrzymujemy trochê rudy.
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
	description		= "Czy w Obozie s¹ jeszcze wolne miejsca?";
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
	AI_Output (other, self,"DIA_Gorn_Hut_15_00"); //Czy w Obozie s¹ jeszcze wolne miejsca, czy bêdê musia³ wykopaæ kogoœ z jego chaty?
	AI_Output (self, other,"DIA_Gorn_Hut_09_01"); //Chyba bêdziesz musia³. Jeœli naprawdê chcesz to zrobiæ, zacznij od Krzykacza.
	AI_Output (self, other,"DIA_Gorn_Hut_09_02"); //Z³apa³ dla siebie chatê przy samym wejœciu do jaskini. By³a pusta, ale tak naprawdê nale¿a³a do nas.
	AI_Output (other, self,"DIA_Gorn_Hut_15_03"); //Nas?
	AI_Output (self, other,"DIA_Gorn_Hut_09_04"); //No nas, Najemników. Najemnicy i Szkodniki staraj¹ siê nie w³aziæ sobie w drogê. Ludzie Laresa nie maj¹ wstêpu do tej czêœci obozu.
	AI_Output (self, other,"DIA_Gorn_Hut_09_05"); //W sumie to drobiazg, ale sukinsyn nie zapyta³ nawet o pozwolenie. Tym Szkodnikom nie mo¿na pozwoliæ na zbyt wiele, bo zrobi¹ siê nie do wytrzymania.

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,"Najemnik imieniem Gorn opowiedzia³ mi o niejakim Krzykaczu, który przyw³aszczy³ sobie jedn¹ z chat. Jako ¿e mam pozwolenie Gorna, ¿aden Najemnik nie bêdzie mi przeszkadza³ w 'przekonywaniu' Krzykacza, ¿eby zmieni³ lokal.");
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
	description		= "Krzykacz przeniós³ siê ju¿ do innej chaty.";
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
	AI_Output			(other, self,"DIA_Gorn_HutFree_15_00"); //Krzykacz przeniós³ siê ju¿ do innej chaty.
	AI_Output			(self, other,"DIA_Gorn_HutFree_09_01"); //Œwietnie! Przed chwil¹ Torlof powiedzia³, ¿e zamierza pokazaæ temu ch³optasiowi, gdzie jest jego miejsce.

	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_SUCCESS);
	B_LogEntry			(CH1_ShrikesHut,"Wykopuj¹c Krzykacza z jego chaty wprawi³em Gorna w dobry humor. To chyba porz¹dny cz³owiek - twardy, ale uczciwy. W przysz³oœci bêdê siê trzyma³ blisko niego.");
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
	description		= "Co mam zrobiæ, ¿eby zostaæ cz³onkiem Nowego Obozu?";
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
	AI_Output (other, self,"DIA_Gorn_BecomeSLD_15_00"); //Co mam zrobiæ, ¿eby zostaæ cz³onkiem Nowego Obozu?
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_01"); //Musisz trochê popracowaæ nad swoimi umiejêtnoœciami bojowymi, zanim Lee zgodzi siê ciê przyj¹æ. Niewa¿ne w jakiej broni siê specjalizujesz, byleœ by³ w tym dobry.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_02"); //Oprócz tego powinieneœ mieæ chocia¿ ogólne pojêcie o ¿yciu w kolonii, uk³adach miêdzy obozami, i takie tam...
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_03"); //Jeœli nie interesuj¹ ciê inne obozy, spróbuj na pocz¹tek do³¹czyæ do Szkodników. Na zostanie Najemnikiem jeszcze przyjdzie czas.
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
	AI_Output (other, self,"DIA_Gorn_TRADE_15_00"); //Masz wiêcej tego towaru?
	AI_Output (self, other,"DIA_Gorn_TRADE_09_01"); //Ca³e mnóstwo. Chcesz kupiæ?
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
	description		= "Jak to mo¿liwe, ¿e wzi¹³eœ udzia³ w napadzie zorganizowanym przez tê bandê?";
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
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_00"); //Jak to mo¿liwe, ¿e wzi¹³eœ udzia³ w jednym z napadów zorganizowanych przez tê bandê?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_01"); //A kto twierdzi, ¿e wzi¹³em?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_02"); //Sk¹d móg³byœ wzi¹æ tak¹ iloœæ towaru, gdybyœ nie uczestniczy³ w napadzie.
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_03"); //Naprawdê myœlisz, ¿e tak¹ iloœæ towaru mo¿na zebraæ po JEDNYM g³upim napadzie?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_04"); //To znaczy, ¿e uczestniczysz w nich regularnie?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_05"); //Nawet gdyby tak by³o, nie móg³ bym ci o tym powiedzieæ. Lee da³by mi zdrowo popaliæ.
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

	AI_Output (self, other,"Info_Gorn_NCWAIT_09_01"); //Ach, to ty! Mój przyjaciel z obozu na bagnie, Lester, doniós³ mi o twoich dokonaniach.
	AI_Output (self, other,"Info_Gorn_NCWAIT_09_02"); //Jak na kogoœ, kto jest tu od niedawna, zaszed³eœ ca³kiem daleko.
	AI_Output (other, self,"Info_Gorn_NCWAIT_15_03"); //Parê razy zaszed³em nawet na skraj w³asnego grobu.
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
	description	= "Mam wa¿n¹ wiadomoœæ dla Magów Wody!";
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
	AI_Output (other, self,"Info_Gorn_MAGES_15_01"); //Mam wa¿n¹ wiadomoœæ dla Magów Wody!
	AI_Output (self, other,"Info_Gorn_MAGES_09_02"); //W takim razie powinieneœ zg³osiæ siê do Saturasa. To najwy¿szy z Magów Wody. Jak go znam, siedzi teraz nad jak¹œ magiczn¹ ksiêg¹ albo czymœ w tym stylu.
	AI_Output (self, other,"Info_Gorn_MAGES_09_03"); //Ale niezale¿nie od tego jak wa¿ne s¹ wieœci, które przynosisz, stra¿nicy z górnego poziomu nie pozwol¹ ci siê z nim zobaczyæ.
	AI_Output (other, self,"Info_Gorn_MAGES_15_04"); //A nie móg³byœ siê za mn¹ wstawiæ?
	AI_Output (self, other,"Info_Gorn_MAGES_09_05"); //Ja nie, ale Cronos, stra¿nik rudy mo¿e udzieliæ ci pozwolenia na spotkanie z Saturasem.
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
	description	= "Gdzie znajdê tego 'stra¿nika rudy'?";
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
	AI_Output			(other, self,"Info_Gorn_CRONOS_15_01"); //Gdzie znajdê tego "stra¿nika rudy"?
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_01a");//Id¹c st¹d trafisz na wielk¹ jaskiniê mieszkaln¹, niedaleko tamy.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_02"); //Cronos przebywa zwykle obok kraty broni¹cej dostêpu do kopca rudy.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_03"); //Ale to nieco arogancki cz³owiek. Bêdziesz musia³ go jakoœ przekonaæ, ¿e twoja wiadomoœæ jest naprawdê wa¿na.

	VAR C_NPC Cronos;
	Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	
	B_LogEntry		(CH3_EscapePlanNC,"Gorn radzi mi iœæ wprost do Arcymistrza Magów Wody, niejakiego Saturasa. Cronos, Stra¿nik Rudy, mo¿e mi za³atwiæ audiencjê. Znajdê go w centrum obozu, przy kracie nad kopcem rudy."); 

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

	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_01"); //Czeœæ, ¿ó³todziobie. Jak widzisz kolonia to bardzo ma³e miejsce.
	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_02"); //Ca³y czas wpada siê na tych samych ludzi.
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
	AI_Output		(self, other,"Info_Gorn_RUINWHAT_09_02"); //Och, pod¹¿am œladem pewnej prastarej legendy.
	AI_Output		(other, self,"Info_Gorn_RUINWHAT_15_03"); //Legendy?
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_04"); //Tak, Milten - mój kumpel ze Starego Obozu, powiedzia³ mi, ¿e kiedyœ ten teren zamieszkiwali mnisi.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_05"); //Oczywiœcie to by³o na d³ugo przed powstaniem Bariery.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_06"); //Ponoæ czczono tutaj bóstwo, które pozwala³o mnichom przybieraæ postaæ zwierz¹t.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_07"); //Za³o¿ê siê, ¿e s¹ tu jeszcze jakieœ skarby pozosta³e po dawnych czasach.

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
	description = "Szukam magicznego kamienia ogniskuj¹cego.";
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
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_01"); //Szukam magicznego kamienia ogniskuj¹cego.
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_02"); //Powinien byæ gdzieœ w okolicy.
	AI_Output (self, other,"Info_Gorn_RUINFOCUS_09_03"); //Przedmiot, którego szukasz mo¿e znajdowaæ siê na terenie starego klasztoru, za tym kanionem.
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
	description = "Moglibyœmy wybraæ siê tam razem.";
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
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_01"); //Moglibyœmy wybraæ siê tam razem.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_02"); //Dobry pomys³. Ca³a okolica a¿ roi siê od zêbaczy.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_03"); //W pojedynkê nie powinny stwarzaæ k³opotu wytrawnemu myœliwemu, ale te bestie zwykle poluj¹ ca³ymi stadami.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_04"); //A grupa zêbaczy potrafi rozerwaæ na strzêpy nawet bardzo doœwiadczonego wojownika.
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_05"); //Zatem pójdziemy tam razem?
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_06"); //Dobra, ale zanim przejdziemy po tym pniu, chcia³bym przyjrzeæ siê uwa¿niej temu kanionowi. Lubiê wiedzieæ, co mam za plecami.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_07"); //ChodŸ za mn¹. Odkry³em œcie¿kê, która nas tam zaprowadzi.

	Log_CreateTopic		(CH3_MonasteryRuin,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_RUNNING);
	B_LogEntry			(CH3_MonasteryRuin,"W pobli¿u ruin starego klasztoru spotka³em Najemnika Gorna. Zamierza rozejrzeæ siê po ruinach w poszukiwaniu starych skarbów.");
	B_LogEntry			(CH3_MonasteryRuin,"Od tej pory bêdziemy podró¿owaæ razem. Gorn uprzedzi³ mnie o stadach zêbaczy nawiedzaj¹cych te tereny.");

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

	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_01"); //To siê nazywa szczêœcie! NajwyraŸniej ta jaskinia by³a wykorzystywana jako sk³adowisko.
	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_02"); //Mo¿esz teraz prowadziæ do klasztoru. Chcia³em mieæ pewnoœæ, ¿e nie spotkaj¹ nas jakieœ paskudne niespodzianki w drodze powrotnej.

	B_LogEntry		(CH3_MonasteryRuin,"Odkryliœmy ukryt¹ jaskiniê! Poœród innych rzeczy, znaleŸliœmy równie¿ dwa zwoje z zaklêciami i klucz!");

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

	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_01"); //Widzê, ¿e ten stary klasztor przesta³ ciê ju¿ interesowaæ.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_02"); //Zatem dalej pójdê sam.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_03"); //Gdybyœ zmieni³ zdanie, mo¿esz mnie dogoniæ.

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

	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_01"); //Cholerna brama. Ponoæ nikomu jeszcze nie uda³o siê jej otworzyæ.
	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_02"); //Te bestyjki pod drugiej stronie s¹ pewnie jedynymi istotami, którym uda³o siê dostaæ do œrodka.

	B_LogEntry		(CH3_MonasteryRuin,"Stoimy przed zamkniêt¹ bram¹. Wygl¹da na to, ¿e nie da siê jej otworzyæ od zewn¹trz.");

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
	AI_Output (self, other,"Info_Gorn_RUINWALLWHAT_09_02"); //Musisz znaleŸæ jakiœ sposób na przedostanie siê na drug¹ stronê bramy.
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

	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_01"); //Na górze jest chyba jakaœ platforma. Ale w¹tpiê, ¿eby uda³o siê nam wspi¹æ tak wysoko.
	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_02"); //Musimy znaleŸæ inn¹ drogê.

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

	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_01"); //To mi wygl¹da na jakiœ piedesta³.
	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_02"); //Mo¿e le¿a³ tu kiedyœ artefakt, którego szukasz.

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

	AI_Output			(self, other,"Info_Gorn_RUINGATE_09_01"); //Widzê, ¿e uda³o ci siê otworzyæ tê bramê. To zaklêcie, którego u¿y³eœ by³o ca³kiem sprytne.
	AI_Output			(other, self,"Info_Gorn_RUINGATE_15_02"); //No, mo¿emy iœæ dalej.

	B_LogEntry		(CH3_MonasteryRuin,"Przy pomocy jednego ze zwojów znalezionych w jaskini, zamieni³em siê w chrz¹szcza. W ten sposób uda³o mi siê dostaæ na teren klasztoru przez wyrwê w murze.");
	B_LogEntry		(CH3_MonasteryRuin,"Brama zosta³a otwarta.");

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

	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //Widzê, ¿e ten stary klasztor przesta³ ciê ju¿ interesowaæ.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //Dalej pójdê sam.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Gdybyœ zmieni³ zdanie, mo¿esz mnie dogoniæ.

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

	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_01"); //A wiêc znalaz³eœ swój magiczny artefakt!
	AI_Output 			(other, self,"Info_Gorn_RUINSUCCESS_15_02"); //Tak. Muszê zanieœæ ten kamieñ ogniskuj¹cy do Magów Wody. 
	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_03"); //Pójdê kawa³ek z tob¹.

	B_LogEntry		(CH3_MonasteryRuin,"Znalaz³em kamieñ ogniskuj¹cy! Gorn bêdzie mi jeszcze trochê towarzyszy³.");

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
	AI_Output 			(other, self,"Info_Gorn_RUINTROLL_15_02"); //Sk¹d siê tu wziê³o coœ takiego?
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_03"); //To mi wygl¹da na jednego z tych niezniszczalnych Trolli, ale jest trochê mniejsze.
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_04"); //Trudno, jeœli chcemy siê st¹d wydostaæ, musimy go jakoœ min¹æ.

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

	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_01"); //Nie by³o ³atwo!
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_02"); //Tak, ale w koñcu siê nam uda³o! To chyba by³ jakiœ m³ody Troll.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_03"); //... Wiêc pewnie nie chcia³byœ wpaœæ na jego rodziców, co?
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_04"); //Raczej nie!
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_05"); //Tutaj nasze drogi siê rozchodz¹. Chcê tu trochê zostaæ i rozejrzeæ siê po okolicy.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_06"); //Ale na pewno jeszcze siê spotkamy. Do zobaczenia, przyjacielu.

	B_LogEntry		(CH3_MonasteryRuin,"W drodze powrotnej, na dziedziñcu klasztoru, spotkaliœmy m³odego trolla. Stoczyliœmy z nim ciê¿k¹ walkê, ale koniec koñców - zwyciê¿yliœmy!");
	B_LogEntry		(CH3_MonasteryRuin,"Nasze drogi tutaj siê rozchodz¹. Mam przeczucie, ¿e ju¿ nied³ugo spotkamy siê znowu.");

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
	description = "Spotka³em Diego i Miltena przed Starym Obozem!";
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
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //Spotka³em Diego i Miltena przed Starym Obozem!
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //To dobra wiadomoœæ!
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //Maj¹ siê spotkaæ z tob¹ i z Lesterem w zwyk³ym miejscu.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Dziêki. W dzisiejszych czasach nie ma nic cenniejszego ni¿ kilku oddanych przyjació³.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //Jesteœ ju¿ prawie jednym z nas. Udowodni³eœ, ¿e mo¿na na tobie polegaæ!

	B_GiveXP			(XP_MessageForGorn);
	
	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else 
	{
		B_LogEntry			(CH4_4Friends,		"Poinformowa³em Lestera i Gorna o spotkaniu z ich przyjació³mi. Moje zadanie skoñczone. Dalej bêd¹ musieli radziæ sobie sami..."); 
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
	description = "Co zobaczy³eœ w Wolnej Kopalni?";
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
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_01"); //Co zobaczy³eœ w Wolnej Kopalni?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_02"); //Po powrocie ze starego klasztoru chcia³em z³o¿yæ wizytê Okylowi, szefowi Wolnej Kopalni.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_03"); //Ale gdy dotar³em na miejsce, zasta³em tylko stygn¹ce cia³a.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_04"); //Dostrzeg³em kilku Stra¿ników okopuj¹cych siê przy wejœciu do kopalni.
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_05"); //Jak to mo¿liwe, ¿e du¿y oddzia³ Najemników uleg³ garstce Stra¿ników?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_06"); //To musia³a byæ jakaœ zasadzka. W koñcu kto móg³by siê spodziewaæ ataku od strony gór?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_07"); //Element zaskoczenia mo¿e zwielokrotniæ zdolnoœci bojowe oddzia³u.
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
	description = "Co zamierzasz robiæ dalej?";
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
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_01"); //Co zamierzasz robiæ dalej?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_02"); //Musimy zmieniæ ca³¹ nasz¹ strategiê obrony. To trochê potrwa.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_03"); //Dopóki Lee nie zdo³a przeorganizowaæ swoich oddzia³ów, do³¹czê do prowizorycznej stra¿y Corda.
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_04"); //Przygotowujecie siê do kontrataku?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_05"); //Jeszcze nie, ale wkrótce na pewno to zrobimy.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_06"); //Gdybyœ mnie kiedyœ potrzebowa³, zacznij tutaj i idŸ w stronê kopalni. Bêdê tam sta³ na stra¿y.

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
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Na razie cicho. W Wolnej Kopalni nic siê nie rusza.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //Lee zajmuje siê jeszcze organizacj¹ naszej obrony!
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

	AI_Output 			(self, hero,"Info_Gorn_POST_09_01"); //Przybywasz w sam¹ porê! Przygotowujemy siê do kontruderzenia.
	AI_Output 			(self, hero,"Info_Gorn_POST_09_02"); //Na pocz¹tek spróbujemy odbiæ Woln¹ Kopalniê.
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
	description = "Zamierzacie j¹ zdobyæ we czterech?";
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
	AI_Output 			(hero, self,"Info_Gorn_TAKEBACK_15_01"); //Zamierzacie j¹ zdobyæ we czterech? A gdzie s¹ wszyscy Najemnicy?
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_02"); //Uderzenie od frontu nie ma szans powodzenia. Ludzie Gomeza za dobrze siê okopali.
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_03"); //Spróbujemy zaatakowaæ po cichu, zabijaj¹c jednego stra¿nika po drugim. Mo¿e siê uda...
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_04"); //Lee kaza³ mi przekazaæ ci wiadomoœæ.

	var int guild;
	guild = Npc_GetTrueGuild(hero);
	if 		(guild == GIL_SLD)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_05"); //Jako jeden z naszych najlepszych Najemników zosta³eœ wyznaczony do udzia³u w tej misji.
	}
	else if	(guild == GIL_KDW)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_06"); //Jako Mag z Krêgu Wody i doœwiadczony wojownik, zosta³eœ wybrany do udzia³u w tej misji.
	}
	else if (guild == GIL_ORG)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_07"); //Jako jeden z naszych najlepszych Szkodników zosta³eœ wybrany do udzia³u w tej misji.
	}
	else
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_08"); //Choæ nie jesteœ jednym z nas, wielokrotnie odda³eœ nam nieocenione przys³ugi.
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_09"); //Dlatego chcemy ciê prosiæ o udzia³ w tej misji.
	};
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_10"); //Pójdê z tob¹. Razem mo¿e siê nam udaæ.
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
	description = "Na pocz¹tek? A co zamierzacie robiæ póŸniej?";
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
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_01"); //Na pocz¹tek? A co zamierzacie robiæ póŸniej?
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_02"); //Jak tylko odbijemy kopalniê, spróbujemy odnaleŸæ œcie¿kê, któr¹ przyszli ludzie Gomeza!
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_03"); //Kiedy ustawimy przy niej stra¿, bêdziemy bezpieczni.
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
	description = "Dlaczego w³aœnie ja?!";
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
	AI_Output 			(hero, self,"Info_Gorn_WHYME_15_01"); //Dlaczego w³aœnie ja?!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_02"); //Wielokrotnie udowodni³eœ, ¿e jesteœ silnym i przebieg³ym wojownikiem!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_03"); //Poza tym znasz Stary Obóz i jego stra¿ników lepiej ni¿ ktokolwiek z nas.
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_04"); //Trudno o kogoœ lepszego ni¿ ty!
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
	description = "No dobrze, chodŸmy. Nauczymy tych nieproszonych goœci dobrych manier.";
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
	AI_Output 			(hero, self,"Info_Gorn_KICKBUTT_15_01"); //No dobrze, chodŸmy. Nauczymy tych nieproszonych goœci dobrych manier.
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_02"); //Wiedzia³em, ¿e mo¿na na ciebie liczyæ.
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_03"); //WeŸ ten klucz. Otwiera stró¿ówkê przy wejœciu do kopalni.

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
	description = "Czemu nie. I tak muszê dostaæ siê do kopalni!";
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
	AI_Output 			(hero, self,"Info_Gorn_MYWAY_15_01"); //Czemu nie. I tak muszê dostaæ siê do kopalni!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_02"); //Niewa¿ne DLACZEGO to robisz. Cieszê siê, ¿e jesteœ z nami!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_03"); //WeŸ ten klucz. Otwiera stró¿ówkê przy wejœciu do kopalni.

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

	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_01"); //Ach, prawie zapomnia³em!
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_02"); //Wilk chce z tob¹ koniecznie porozmawiaæ, zanim ruszymy do kopalni.

	Info_ClearChoices	(Info_Gorn_WOLF);
	Info_AddChoice		(Info_Gorn_WOLF,"To mo¿e zaczekaæ, mamy teraz wa¿niejsze sprawy na g³owie.",	Info_Gorn_WOLF_FM);	
	Info_AddChoice		(Info_Gorn_WOLF,"Wiêc lepiej do niego zajrzê.",		Info_Gorn_WOLF_WOLF);	

	B_LogEntry			(CH4_UluMulu,"Wilk chce ze mn¹ porozmawiaæ zanim ruszê do kopalni. Powinienem chyba do niego zajrzeæ.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_04"); //To mo¿e zaczekaæ, mamy teraz wa¿niejsze sprawy na g³owie.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_05"); //Jak chcesz!
	AI_StopProcessInfos	(self);
};

func void Info_Gorn_WOLF_WOLF ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_06"); //Wiêc lepiej do niego zajrzê.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_07"); //W porz¹dku. Zaczekam na ciebie tutaj.

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
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_01"); //Widzê, ¿e jednak nie chcesz porozmawiaæ z Wilkiem!
	}
	else
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_02"); //Idziesz w z³¹ stronê! Mamy iœæ prosto do kopalni!
	};
	AI_Output 			(self, hero,"Info_Gorn_LEAVEFORPOST_09_03"); //Zaczekam na ciebie przy prowizorycznym punkcie stra¿niczym!

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
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_02"); //Pora przepêdziæ stamt¹d ludzi Gomeza!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_03"); //IdŸ przodem. Pójdê za tob¹.

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
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_02"); //Poluj¹ w stadach, jak zêbacze, tylko gryz¹ znacznie mocniej!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_03"); //Powinniœmy siê najpierw z nimi rozprawiæ. Znasz mnie - lubiê wiedzieæ, co mam za plecami.

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

	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_01"); //Zaczekaj! Widzisz te wszystkie cia³a?
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_02"); //IdŸ do wejœcia do kopalni. Ja zaczekam tutaj i przypilnujê, ¿eby ktoœ lub coœ nie zasz³o nas od ty³u.
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_03"); //Kiedy ju¿ zejdziesz na dó³, pójdê za tob¹.

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

	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_01"); //Us³ysza³em odg³osy walki i przybieg³em najszybciej jak mog³em!
	AI_Output 			(hero, self,"Info_Gorn_FMGATE_15_02"); //Stary znajomy... Rachunek wyrównany.
	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_03"); //Dobra, otwieraj bramê. Je bêdê tu sta³ na stra¿y!

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

	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_01"); //Stary, to siê dopiero nazywa trudna walka!
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_02"); //Nie spodziewa³em siê, ¿e Stra¿nicy Gomeza bêd¹ stawiali tak zaciek³y opór.
	AI_Output 			(hero, self,"Info_Gorn_AFTERFM_15_03"); //Grunt, ¿e kopalnia znowu jest w naszych rêkach.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_04"); //Zostanê tutaj i dopilnujê, ¿eby tak ju¿ zosta³o!

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
	description = "Co s³ychaæ?";
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
	AI_Output 			(hero,self,"Info_Gorn_FMWATCH_15_01"); //Co s³ychaæ?
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_02"); //Na razie cicho. W Wolnej Kopalni nic siê nie rusza.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_03"); //Lee powinien nied³ugo podes³aæ tu posi³ki.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_04"); //Póki co postaram siê tutaj rozgoœciæ.
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

	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_01"); //Masz przy sobie ciekaw¹ ozdóbkê. Orkowa, prawda?
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_02"); //To od tego niewolnika z kopalni?
	AI_Output 			(hero, self,"Info_Gorn_FOUNDULUMULU_15_03"); //To orkowy symbol przyjaŸni. Przy jego pomocy zamierzam dostaæ siê do miasta Orków.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_04"); //Oby tylko Orkowie uszanowali to... COŒ!

	B_Kapitelwechsel	(5);

	AI_StopProcessInfos	(self);
};








