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
//			1. Begr��ung
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
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //Kim jeste�?
	AI_Output (self, other,"DIA_Gorn_First_09_02"); //Nazywam si� Gorn. Jestem najemnikiem w s�u�bie mag�w.
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
	description		= "Czym si� zajmuj� Najemnicy?";
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
	AI_Output (other, self,"DIA_Gorn_Leben_15_00"); //Czym si� zajmuj� Najemnicy?
	AI_Output (self, other,"DIA_Gorn_Leben_09_01"); //Lee zawar� z Magami umow�. Zatrudnia najlepszych wojownik�w z ca�ej kolonii - czyli nas.
	AI_Output (self, other,"DIA_Gorn_Leben_09_02"); //Pilnujemy, �eby nikt nie przeszkadza� Kretom w pracy i dbamy o bezpiecze�stwo Mag�w.
	AI_Output (self, other,"DIA_Gorn_Leben_09_03"); //Magowie natomiast przygotowuj� plan, kt�ry pozwoli si� nam st�d wyrwa�. Jako wynagrodzenie otrzymujemy troch� rudy.
};

//*************************************
//			H�tte (Shrike)
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
	description		= "Czy w Obozie s� jeszcze wolne miejsca?";
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
	AI_Output (other, self,"DIA_Gorn_Hut_15_00"); //Czy w Obozie s� jeszcze wolne miejsca, czy b�d� musia� wykopa� kogo� z jego chaty?
	AI_Output (self, other,"DIA_Gorn_Hut_09_01"); //Chyba b�dziesz musia�. Je�li naprawd� chcesz to zrobi�, zacznij od Krzykacza.
	AI_Output (self, other,"DIA_Gorn_Hut_09_02"); //Z�apa� dla siebie chat� przy samym wej�ciu do jaskini. By�a pusta, ale tak naprawd� nale�a�a do nas.
	AI_Output (other, self,"DIA_Gorn_Hut_15_03"); //Nas?
	AI_Output (self, other,"DIA_Gorn_Hut_09_04"); //No nas, Najemnik�w. Najemnicy i Szkodniki staraj� si� nie w�azi� sobie w drog�. Ludzie Laresa nie maj� wst�pu do tej cz�ci obozu.
	AI_Output (self, other,"DIA_Gorn_Hut_09_05"); //W sumie to drobiazg, ale sukinsyn nie zapyta� nawet o pozwolenie. Tym Szkodnikom nie mo�na pozwoli� na zbyt wiele, bo zrobi� si� nie do wytrzymania.

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,"Najemnik imieniem Gorn opowiedzia� mi o niejakim Krzykaczu, kt�ry przyw�aszczy� sobie jedn� z chat. Jako �e mam pozwolenie Gorna, �aden Najemnik nie b�dzie mi przeszkadza� w 'przekonywaniu' Krzykacza, �eby zmieni� lokal.");
	Gorn_ShrikesHut = LOG_RUNNING;
};

//*************************************
//			H�tte LEER (Shrike)
//*************************************

instance DIA_Gorn_HutFree (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_HutFree_Condition;
	information		= Dia_Gorn_HutFree_Info;
	permanent		= 0;
	description		= "Krzykacz przeni�s� si� ju� do innej chaty.";
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
	AI_Output			(other, self,"DIA_Gorn_HutFree_15_00"); //Krzykacz przeni�s� si� ju� do innej chaty.
	AI_Output			(self, other,"DIA_Gorn_HutFree_09_01"); //�wietnie! Przed chwil� Torlof powiedzia�, �e zamierza pokaza� temu ch�optasiowi, gdzie jest jego miejsce.

	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_SUCCESS);
	B_LogEntry			(CH1_ShrikesHut,"Wykopuj�c Krzykacza z jego chaty wprawi�em Gorna w dobry humor. To chyba porz�dny cz�owiek - twardy, ale uczciwy. W przysz�o�ci b�d� si� trzyma� blisko niego.");
	B_GiveXP			(XP_ReportedKickedShrike);
};

//*************************************
//			S�ldner werden
//*************************************

instance DIA_Gorn_BecomeSLD (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 5;
	condition		= Dia_Gorn_BecomeSLD_Condition;
	information		= Dia_Gorn_BecomeSLD_Info;
	permanent		= 0;
	description		= "Co mam zrobi�, �eby zosta� cz�onkiem Nowego Obozu?";
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
	AI_Output (other, self,"DIA_Gorn_BecomeSLD_15_00"); //Co mam zrobi�, �eby zosta� cz�onkiem Nowego Obozu?
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_01"); //Musisz troch� popracowa� nad swoimi umiej�tno�ciami bojowymi, zanim Lee zgodzi si� ci� przyj��. Niewa�ne w jakiej broni si� specjalizujesz, byle� by� w tym dobry.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_02"); //Opr�cz tego powiniene� mie� chocia� og�lne poj�cie o �yciu w kolonii, uk�adach mi�dzy obozami, i takie tam...
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_03"); //Je�li nie interesuj� ci� inne obozy, spr�buj na pocz�tek do��czy� do Szkodnik�w. Na zostanie Najemnikiem jeszcze przyjdzie czas.
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
	AI_Output (other, self,"DIA_Gorn_TRADE_15_00"); //Masz wi�cej tego towaru?
	AI_Output (self, other,"DIA_Gorn_TRADE_09_01"); //Ca�e mn�stwo. Chcesz kupi�?
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
	description		= "Jak to mo�liwe, �e wzi��e� udzia� w napadzie zorganizowanym przez t� band�?";
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
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_00"); //Jak to mo�liwe, �e wzi��e� udzia� w jednym z napad�w zorganizowanych przez t� band�?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_01"); //A kto twierdzi, �e wzi��em?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_02"); //Sk�d m�g�by� wzi�� tak� ilo�� towaru, gdyby� nie uczestniczy� w napadzie.
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_03"); //Naprawd� my�lisz, �e tak� ilo�� towaru mo�na zebra� po JEDNYM g�upim napadzie?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_04"); //To znaczy, �e uczestniczysz w nich regularnie?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_05"); //Nawet gdyby tak by�o, nie m�g� bym ci o tym powiedzie�. Lee da�by mi zdrowo popali�.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_06"); //Rozumiem.
	
	CreateInvItems(self, ItFoApple, 21);
	B_GiveInvItems	(self,other, ItFoApple,21); //Notwendig f�r Screenausgabe
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

	AI_Output (self, other,"Info_Gorn_NCWAIT_09_01"); //Ach, to ty! M�j przyjaciel z obozu na bagnie, Lester, doni�s� mi o twoich dokonaniach.
	AI_Output (self, other,"Info_Gorn_NCWAIT_09_02"); //Jak na kogo�, kto jest tu od niedawna, zaszed�e� ca�kiem daleko.
	AI_Output (other, self,"Info_Gorn_NCWAIT_15_03"); //Par� razy zaszed�em nawet na skraj w�asnego grobu.
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
	description	= "Mam wa�n� wiadomo�� dla Mag�w Wody!";
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
	AI_Output (other, self,"Info_Gorn_MAGES_15_01"); //Mam wa�n� wiadomo�� dla Mag�w Wody!
	AI_Output (self, other,"Info_Gorn_MAGES_09_02"); //W takim razie powiniene� zg�osi� si� do Saturasa. To najwy�szy z Mag�w Wody. Jak go znam, siedzi teraz nad jak�� magiczn� ksi�g� albo czym� w tym stylu.
	AI_Output (self, other,"Info_Gorn_MAGES_09_03"); //Ale niezale�nie od tego jak wa�ne s� wie�ci, kt�re przynosisz, stra�nicy z g�rnego poziomu nie pozwol� ci si� z nim zobaczy�.
	AI_Output (other, self,"Info_Gorn_MAGES_15_04"); //A nie m�g�by� si� za mn� wstawi�?
	AI_Output (self, other,"Info_Gorn_MAGES_09_05"); //Ja nie, ale Cronos, stra�nik rudy mo�e udzieli� ci pozwolenia na spotkanie z Saturasem.
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
	description	= "Gdzie znajd� tego 'stra�nika rudy'?";
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
	AI_Output			(other, self,"Info_Gorn_CRONOS_15_01"); //Gdzie znajd� tego "stra�nika rudy"?
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_01a");//Id�c st�d trafisz na wielk� jaskini� mieszkaln�, niedaleko tamy.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_02"); //Cronos przebywa zwykle obok kraty broni�cej dost�pu do kopca rudy.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_03"); //Ale to nieco arogancki cz�owiek. B�dziesz musia� go jako� przekona�, �e twoja wiadomo�� jest naprawd� wa�na.

	VAR C_NPC Cronos;
	Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	
	B_LogEntry		(CH3_EscapePlanNC,"Gorn radzi mi i�� wprost do Arcymistrza Mag�w Wody, niejakiego Saturasa. Cronos, Stra�nik Rudy, mo�e mi za�atwi� audiencj�. Znajd� go w centrum obozu, przy kracie nad kopcem rudy."); 

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

	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_01"); //Cze��, ��todziobie. Jak widzisz kolonia to bardzo ma�e miejsce.
	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_02"); //Ca�y czas wpada si� na tych samych ludzi.
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
	AI_Output		(self, other,"Info_Gorn_RUINWHAT_09_02"); //Och, pod��am �ladem pewnej prastarej legendy.
	AI_Output		(other, self,"Info_Gorn_RUINWHAT_15_03"); //Legendy?
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_04"); //Tak, Milten - m�j kumpel ze Starego Obozu, powiedzia� mi, �e kiedy� ten teren zamieszkiwali mnisi.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_05"); //Oczywi�cie to by�o na d�ugo przed powstaniem Bariery.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_06"); //Pono� czczono tutaj b�stwo, kt�re pozwala�o mnichom przybiera� posta� zwierz�t.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_07"); //Za�o�� si�, �e s� tu jeszcze jakie� skarby pozosta�e po dawnych czasach.

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
	description = "Szukam magicznego kamienia ogniskuj�cego.";
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
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_01"); //Szukam magicznego kamienia ogniskuj�cego.
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_02"); //Powinien by� gdzie� w okolicy.
	AI_Output (self, other,"Info_Gorn_RUINFOCUS_09_03"); //Przedmiot, kt�rego szukasz mo�e znajdowa� si� na terenie starego klasztoru, za tym kanionem.
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
	description = "Mogliby�my wybra� si� tam razem.";
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
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_01"); //Mogliby�my wybra� si� tam razem.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_02"); //Dobry pomys�. Ca�a okolica a� roi si� od z�baczy.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_03"); //W pojedynk� nie powinny stwarza� k�opotu wytrawnemu my�liwemu, ale te bestie zwykle poluj� ca�ymi stadami.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_04"); //A grupa z�baczy potrafi rozerwa� na strz�py nawet bardzo do�wiadczonego wojownika.
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_05"); //Zatem p�jdziemy tam razem?
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_06"); //Dobra, ale zanim przejdziemy po tym pniu, chcia�bym przyjrze� si� uwa�niej temu kanionowi. Lubi� wiedzie�, co mam za plecami.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_07"); //Chod� za mn�. Odkry�em �cie�k�, kt�ra nas tam zaprowadzi.

	Log_CreateTopic		(CH3_MonasteryRuin,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_RUNNING);
	B_LogEntry			(CH3_MonasteryRuin,"W pobli�u ruin starego klasztoru spotka�em Najemnika Gorna. Zamierza rozejrze� si� po ruinach w poszukiwaniu starych skarb�w.");
	B_LogEntry			(CH3_MonasteryRuin,"Od tej pory b�dziemy podr�owa� razem. Gorn uprzedzi� mnie o stadach z�baczy nawiedzaj�cych te tereny.");

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

	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_01"); //To si� nazywa szcz�cie! Najwyra�niej ta jaskinia by�a wykorzystywana jako sk�adowisko.
	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_02"); //Mo�esz teraz prowadzi� do klasztoru. Chcia�em mie� pewno��, �e nie spotkaj� nas jakie� paskudne niespodzianki w drodze powrotnej.

	B_LogEntry		(CH3_MonasteryRuin,"Odkryli�my ukryt� jaskini�! Po�r�d innych rzeczy, znale�li�my r�wnie� dwa zwoje z zakl�ciami i klucz!");

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

	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_01"); //Widz�, �e ten stary klasztor przesta� ci� ju� interesowa�.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_02"); //Zatem dalej p�jd� sam.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_03"); //Gdyby� zmieni� zdanie, mo�esz mnie dogoni�.

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

	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_01"); //Cholerna brama. Pono� nikomu jeszcze nie uda�o si� jej otworzy�.
	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_02"); //Te bestyjki pod drugiej stronie s� pewnie jedynymi istotami, kt�rym uda�o si� dosta� do �rodka.

	B_LogEntry		(CH3_MonasteryRuin,"Stoimy przed zamkni�t� bram�. Wygl�da na to, �e nie da si� jej otworzy� od zewn�trz.");

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
	AI_Output (self, other,"Info_Gorn_RUINWALLWHAT_09_02"); //Musisz znale�� jaki� spos�b na przedostanie si� na drug� stron� bramy.
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

	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_01"); //Na g�rze jest chyba jaka� platforma. Ale w�tpi�, �eby uda�o si� nam wspi�� tak wysoko.
	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_02"); //Musimy znale�� inn� drog�.

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

	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_01"); //To mi wygl�da na jaki� piedesta�.
	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_02"); //Mo�e le�a� tu kiedy� artefakt, kt�rego szukasz.

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

	AI_Output			(self, other,"Info_Gorn_RUINGATE_09_01"); //Widz�, �e uda�o ci si� otworzy� t� bram�. To zakl�cie, kt�rego u�y�e� by�o ca�kiem sprytne.
	AI_Output			(other, self,"Info_Gorn_RUINGATE_15_02"); //No, mo�emy i�� dalej.

	B_LogEntry		(CH3_MonasteryRuin,"Przy pomocy jednego ze zwoj�w znalezionych w jaskini, zamieni�em si� w chrz�szcza. W ten spos�b uda�o mi si� dosta� na teren klasztoru przez wyrw� w murze.");
	B_LogEntry		(CH3_MonasteryRuin,"Brama zosta�a otwarta.");

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

	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //Widz�, �e ten stary klasztor przesta� ci� ju� interesowa�.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //Dalej p�jd� sam.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Gdyby� zmieni� zdanie, mo�esz mnie dogoni�.

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

	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_01"); //A wi�c znalaz�e� sw�j magiczny artefakt!
	AI_Output 			(other, self,"Info_Gorn_RUINSUCCESS_15_02"); //Tak. Musz� zanie�� ten kamie� ogniskuj�cy do Mag�w Wody. 
	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_03"); //P�jd� kawa�ek z tob�.

	B_LogEntry		(CH3_MonasteryRuin,"Znalaz�em kamie� ogniskuj�cy! Gorn b�dzie mi jeszcze troch� towarzyszy�.");

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
	AI_Output 			(other, self,"Info_Gorn_RUINTROLL_15_02"); //Sk�d si� tu wzi�o co� takiego?
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_03"); //To mi wygl�da na jednego z tych niezniszczalnych Trolli, ale jest troch� mniejsze.
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_04"); //Trudno, je�li chcemy si� st�d wydosta�, musimy go jako� min��.

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

	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_01"); //Nie by�o �atwo!
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_02"); //Tak, ale w ko�cu si� nam uda�o! To chyba by� jaki� m�ody Troll.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_03"); //... Wi�c pewnie nie chcia�by� wpa�� na jego rodzic�w, co?
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_04"); //Raczej nie!
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_05"); //Tutaj nasze drogi si� rozchodz�. Chc� tu troch� zosta� i rozejrze� si� po okolicy.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_06"); //Ale na pewno jeszcze si� spotkamy. Do zobaczenia, przyjacielu.

	B_LogEntry		(CH3_MonasteryRuin,"W drodze powrotnej, na dziedzi�cu klasztoru, spotkali�my m�odego trolla. Stoczyli�my z nim ci�k� walk�, ale koniec ko�c�w - zwyci�yli�my!");
	B_LogEntry		(CH3_MonasteryRuin,"Nasze drogi tutaj si� rozchodz�. Mam przeczucie, �e ju� nied�ugo spotkamy si� znowu.");

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
	description = "Spotka�em Diego i Miltena przed Starym Obozem!";
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
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //Spotka�em Diego i Miltena przed Starym Obozem!
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //To dobra wiadomo��!
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //Maj� si� spotka� z tob� i z Lesterem w zwyk�ym miejscu.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Dzi�ki. W dzisiejszych czasach nie ma nic cenniejszego ni� kilku oddanych przyjaci�.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //Jeste� ju� prawie jednym z nas. Udowodni�e�, �e mo�na na tobie polega�!

	B_GiveXP			(XP_MessageForGorn);
	
	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else 
	{
		B_LogEntry			(CH4_4Friends,		"Poinformowa�em Lestera i Gorna o spotkaniu z ich przyjaci�mi. Moje zadanie sko�czone. Dalej b�d� musieli radzi� sobie sami..."); 
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
	description = "Co zobaczy�e� w Wolnej Kopalni?";
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
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_01"); //Co zobaczy�e� w Wolnej Kopalni?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_02"); //Po powrocie ze starego klasztoru chcia�em z�o�y� wizyt� Okylowi, szefowi Wolnej Kopalni.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_03"); //Ale gdy dotar�em na miejsce, zasta�em tylko stygn�ce cia�a.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_04"); //Dostrzeg�em kilku Stra�nik�w okopuj�cych si� przy wej�ciu do kopalni.
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_05"); //Jak to mo�liwe, �e du�y oddzia� Najemnik�w uleg� garstce Stra�nik�w?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_06"); //To musia�a by� jaka� zasadzka. W ko�cu kto m�g�by si� spodziewa� ataku od strony g�r?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_07"); //Element zaskoczenia mo�e zwielokrotni� zdolno�ci bojowe oddzia�u.
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
	description = "Co zamierzasz robi� dalej?";
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
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_01"); //Co zamierzasz robi� dalej?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_02"); //Musimy zmieni� ca�� nasz� strategi� obrony. To troch� potrwa.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_03"); //Dop�ki Lee nie zdo�a przeorganizowa� swoich oddzia��w, do��cz� do prowizorycznej stra�y Corda.
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_04"); //Przygotowujecie si� do kontrataku?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_05"); //Jeszcze nie, ale wkr�tce na pewno to zrobimy.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_06"); //Gdyby� mnie kiedy� potrzebowa�, zacznij tutaj i id� w stron� kopalni. B�d� tam sta� na stra�y.

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
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Na razie cicho. W Wolnej Kopalni nic si� nie rusza.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //Lee zajmuje si� jeszcze organizacj� naszej obrony!
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

	AI_Output 			(self, hero,"Info_Gorn_POST_09_01"); //Przybywasz w sam� por�! Przygotowujemy si� do kontruderzenia.
	AI_Output 			(self, hero,"Info_Gorn_POST_09_02"); //Na pocz�tek spr�bujemy odbi� Woln� Kopalni�.
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
	description = "Zamierzacie j� zdoby� we czterech?";
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
	AI_Output 			(hero, self,"Info_Gorn_TAKEBACK_15_01"); //Zamierzacie j� zdoby� we czterech? A gdzie s� wszyscy Najemnicy?
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_02"); //Uderzenie od frontu nie ma szans powodzenia. Ludzie Gomeza za dobrze si� okopali.
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_03"); //Spr�bujemy zaatakowa� po cichu, zabijaj�c jednego stra�nika po drugim. Mo�e si� uda...
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_04"); //Lee kaza� mi przekaza� ci wiadomo��.

	var int guild;
	guild = Npc_GetTrueGuild(hero);
	if 		(guild == GIL_SLD)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_05"); //Jako jeden z naszych najlepszych Najemnik�w zosta�e� wyznaczony do udzia�u w tej misji.
	}
	else if	(guild == GIL_KDW)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_06"); //Jako Mag z Kr�gu Wody i do�wiadczony wojownik, zosta�e� wybrany do udzia�u w tej misji.
	}
	else if (guild == GIL_ORG)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_07"); //Jako jeden z naszych najlepszych Szkodnik�w zosta�e� wybrany do udzia�u w tej misji.
	}
	else
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_08"); //Cho� nie jeste� jednym z nas, wielokrotnie odda�e� nam nieocenione przys�ugi.
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_09"); //Dlatego chcemy ci� prosi� o udzia� w tej misji.
	};
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_10"); //P�jd� z tob�. Razem mo�e si� nam uda�.
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
	description = "Na pocz�tek? A co zamierzacie robi� p�niej?";
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
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_01"); //Na pocz�tek? A co zamierzacie robi� p�niej?
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_02"); //Jak tylko odbijemy kopalni�, spr�bujemy odnale�� �cie�k�, kt�r� przyszli ludzie Gomeza!
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_03"); //Kiedy ustawimy przy niej stra�, b�dziemy bezpieczni.
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
	description = "Dlaczego w�a�nie ja?!";
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
	AI_Output 			(hero, self,"Info_Gorn_WHYME_15_01"); //Dlaczego w�a�nie ja?!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_02"); //Wielokrotnie udowodni�e�, �e jeste� silnym i przebieg�ym wojownikiem!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_03"); //Poza tym znasz Stary Ob�z i jego stra�nik�w lepiej ni� ktokolwiek z nas.
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_04"); //Trudno o kogo� lepszego ni� ty!
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
	description = "No dobrze, chod�my. Nauczymy tych nieproszonych go�ci dobrych manier.";
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
	AI_Output 			(hero, self,"Info_Gorn_KICKBUTT_15_01"); //No dobrze, chod�my. Nauczymy tych nieproszonych go�ci dobrych manier.
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_02"); //Wiedzia�em, �e mo�na na ciebie liczy�.
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_03"); //We� ten klucz. Otwiera str��wk� przy wej�ciu do kopalni.

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
	description = "Czemu nie. I tak musz� dosta� si� do kopalni!";
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
	AI_Output 			(hero, self,"Info_Gorn_MYWAY_15_01"); //Czemu nie. I tak musz� dosta� si� do kopalni!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_02"); //Niewa�ne DLACZEGO to robisz. Ciesz� si�, �e jeste� z nami!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_03"); //We� ten klucz. Otwiera str��wk� przy wej�ciu do kopalni.

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

	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_01"); //Ach, prawie zapomnia�em!
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_02"); //Wilk chce z tob� koniecznie porozmawia�, zanim ruszymy do kopalni.

	Info_ClearChoices	(Info_Gorn_WOLF);
	Info_AddChoice		(Info_Gorn_WOLF,"To mo�e zaczeka�, mamy teraz wa�niejsze sprawy na g�owie.",	Info_Gorn_WOLF_FM);	
	Info_AddChoice		(Info_Gorn_WOLF,"Wi�c lepiej do niego zajrz�.",		Info_Gorn_WOLF_WOLF);	

	B_LogEntry			(CH4_UluMulu,"Wilk chce ze mn� porozmawia� zanim rusz� do kopalni. Powinienem chyba do niego zajrze�.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_04"); //To mo�e zaczeka�, mamy teraz wa�niejsze sprawy na g�owie.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_05"); //Jak chcesz!
	AI_StopProcessInfos	(self);
};

func void Info_Gorn_WOLF_WOLF ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_06"); //Wi�c lepiej do niego zajrz�.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_07"); //W porz�dku. Zaczekam na ciebie tutaj.

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
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_01"); //Widz�, �e jednak nie chcesz porozmawia� z Wilkiem!
	}
	else
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_02"); //Idziesz w z�� stron�! Mamy i�� prosto do kopalni!
	};
	AI_Output 			(self, hero,"Info_Gorn_LEAVEFORPOST_09_03"); //Zaczekam na ciebie przy prowizorycznym punkcie stra�niczym!

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
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_02"); //Pora przep�dzi� stamt�d ludzi Gomeza!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_03"); //Id� przodem. P�jd� za tob�.

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
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_02"); //Poluj� w stadach, jak z�bacze, tylko gryz� znacznie mocniej!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_03"); //Powinni�my si� najpierw z nimi rozprawi�. Znasz mnie - lubi� wiedzie�, co mam za plecami.

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

	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_01"); //Zaczekaj! Widzisz te wszystkie cia�a?
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_02"); //Id� do wej�cia do kopalni. Ja zaczekam tutaj i przypilnuj�, �eby kto� lub co� nie zasz�o nas od ty�u.
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_03"); //Kiedy ju� zejdziesz na d�, p�jd� za tob�.

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

	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_01"); //Us�ysza�em odg�osy walki i przybieg�em najszybciej jak mog�em!
	AI_Output 			(hero, self,"Info_Gorn_FMGATE_15_02"); //Stary znajomy... Rachunek wyr�wnany.
	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_03"); //Dobra, otwieraj bram�. Je b�d� tu sta� na stra�y!

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

	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_01"); //Stary, to si� dopiero nazywa trudna walka!
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_02"); //Nie spodziewa�em si�, �e Stra�nicy Gomeza b�d� stawiali tak zaciek�y op�r.
	AI_Output 			(hero, self,"Info_Gorn_AFTERFM_15_03"); //Grunt, �e kopalnia znowu jest w naszych r�kach.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_04"); //Zostan� tutaj i dopilnuj�, �eby tak ju� zosta�o!

	B_Story_LeftFM		();
	
	Lee_freeminereport = 1;  //jetzt kann der SC Lee �ber die befreite Mine informieren.     ***Bj�rn***

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
	description = "Co s�ycha�?";
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
	AI_Output 			(hero,self,"Info_Gorn_FMWATCH_15_01"); //Co s�ycha�?
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_02"); //Na razie cicho. W Wolnej Kopalni nic si� nie rusza.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_03"); //Lee powinien nied�ugo podes�a� tu posi�ki.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_04"); //P�ki co postaram si� tutaj rozgo�ci�.
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

	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_01"); //Masz przy sobie ciekaw� ozd�bk�. Orkowa, prawda?
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_02"); //To od tego niewolnika z kopalni?
	AI_Output 			(hero, self,"Info_Gorn_FOUNDULUMULU_15_03"); //To orkowy symbol przyja�ni. Przy jego pomocy zamierzam dosta� si� do miasta Ork�w.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_04"); //Oby tylko Orkowie uszanowali to... CO�!

	B_Kapitelwechsel	(5);

	AI_StopProcessInfos	(self);
};








