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
//					Erste Begr�ssung
// **************************************************

instance  DIA_BaalTaran_Greet (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Greet_Condition;
	information	= DIA_BaalTaran_Greet_Info;
	permanent	= 0;
	description = "Jestem tu nowy. Kim jeste�?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Jestem tu nowy. Kim jeste�?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Jestem Baal Taran z Bractwa �ni�cego.
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
	description = "Bractwo �ni�cego? A c� to takiego?";
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
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Bractwo �ni�cego? A c� to takiego?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //Jeste�my wsp�lnot� wyznawc�w nowej wiary.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //Nasz ob�z znajduje si� na wsch�d st�d, na bagnie. Przyszed�em tutaj, by naucza� niewiernych takich jak ty s��w �ni�cego.
};

// **************************************************
//					Wer ist der Schl�fer
// **************************************************

instance  DIA_BaalTaran_Sleeper (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Sleeper_Condition;
	information	= DIA_BaalTaran_Sleeper_Info;
	permanent	= 0;
	description = "Kim jest �ni�cy?";
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
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Kim jest �ni�cy?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //�ni�cy b�dzie naszym wyzwolicielem. Pi�� lat temu ujawni� si� nam przez Y'Beriona, naszego wielkiego mistrza.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //Od tej chwili, wyrzekli�my si� trzech bog�w, co i tobie radz�.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //Bogowie przygl�dali si� bezczynnie, gdy byli�my skazywani na do�ywotni� katorg� w tym wi�zieniu. Ale �ni�cy wska�e nam drog� do wolno�ci.
};

// **************************************************
//					Lehre des Schl�fers
// **************************************************

instance  DIA_BaalTaran_Lehre (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Lehre_Condition;
	information	= DIA_BaalTaran_Lehre_Info;
	permanent	= 0;
	description = "Opowiedz mi o naukach �ni�cego.";
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
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Opowiedz mi o naukach �ni�cego.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //�ni�cy jest niezwykle pot�ny, mo�e nawet pot�niejszy od Innosa, boga �wiat�a.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //Zjednoczy� si� z nami duchowo, ale jego moc jest wci�� ograniczona. By� u�piony przez tysi�ce lat, ale moment jego wielkiego przebudzenia jest ju� bardzo bliski!
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //Wybra� nas na �wiadk�w swojego nadej�cia i kaza� nam szerzy� jego s�owa w ca�ej kolonii.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //Zatem s�uchaj: ka�dy, kto stanie po jego stronie zostanie zbawiony, ale ci, kt�rzy si� mu sprzeciwi�, ponios� surow� kar�.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //Ale �ni�cy jest mi�osierny i wszystkim w�tpi�cym przysy�a znak swojej pot�gi.
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
	description = "Jak b�dzie wygl�da� ta droga do wolno�ci?";
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
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //Jak b�dzie wygl�da� ta droga do wolno�ci?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //Przygotowujemy si� do wielkiego przyzwania, w kt�rym wszyscy Nowicjusze zjednocz� swoje duchowe si�y.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //W trakcie rytua�u �ni�cy ujawni nam �wi�t� drog� do wolno�ci.
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
	description = "W jaki spos�b wasz b�g udowodni� swoj� pot�g�?";
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
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //W jaki spos�b wasz b�g udowodni� swoj� pot�g�?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //Przemawiaj�c do nas za po�rednictwem wizji. Kto raz us�yszy jego g�os, ju� nigdy nie zb��dzi na �cie�k� z�a.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //Za�yj rosn�ce na bagnach ziele, a zbli�ysz si� do �ni�cego i b�dziesz m�g� us�ysze� jego s�owa. Niekt�rym wybra�com zdarzy�o si� go nawet zobaczy�!
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
	description = "Jak mog� dotrze� do obozu Bractwa?";
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
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //Jak mog� dotrze� do obozu Bractwa?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //Jestem teraz zaj�ty, ale Baal Parvez powinien przebywa� jeszcze w tym obozie.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //Znajdziesz go gdzie� w pobli�u targowiska, po drugiej stronie zamku. Zdaj� si�, �e ma tam nawet w�asn� chat�!

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi,"Nowicjusz imieniem Baal Parvez mo�e mnie zaprowadzi� do obozu na bagnie. Znajd� go na targowisku, za zamkiem Starego Obozu.");
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
	description = "Musz� si� dosta� do zamku. M�g�by� mi pom�c?";
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
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //Musz� si� dosta� do zamku. M�g�by� mi pom�c?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //Obawiam si�, �e nie. Tylko Bracia dostarczaj�cy Gomezowi ziele maj� wst�p do zamku.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //Zbieramy bagienne ziele, i cz�� zbior�w sprzedajemy do Starego Obozu w zamian za r�ne dobra z zewn�trznego �wiata.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //Gdyby� by� jednym z kurier�w pracuj�cych dla Cor Kaloma, m�g�by� dosta� si� do zamku. Oczywi�cie musia�by� najpierw przyst�pi� do Bractwa.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //A czego, je�li wolno spyta�, chcesz szuka� w zamku?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Musz� si� tam z kim� spotka�.",DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Mam list do Arcymistrza Mag�w Ognia.",DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Musz� si� tam z kim� spotka�.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //Naprawd�? A z kim? Nie m�g�by� po prostu zaczeka�, a� do ciebie wyjdzie?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"To nie twoja sprawa.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"To jeden z mag�w.",DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //Mam list do Arcymistrza Mag�w Ognia.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Czy�by? A sk�d go masz? Mo�e dosta�e� go od jednego z mag�w zanim ci� tu wrzucono?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Jeste� g�upcem, rozpowiadaj�c o tym na lewo i prawo, ale nie obawiaj si� - nikomu o tym nie powiem.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Jednak na twoim miejscu trzyma�bym j�zyk za z�bami. Za co� takiego wi�kszo�� ludzi bez wahania poder�n�aby ci gard�o.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //Nagroda, jak� otrzymuj� pos�a�cy za dostarczenie wiadomo�ci z zewn�trznego �wiata, jest niezwykle cenna.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //To jeden z mag�w.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //C�, obawiam si�, �e oni nigdy nie opuszczaj� zamku. Rzeczywi�cie, musia�by� dosta� si� do �rodka.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //A czego od nich chcesz? Magicznych run? A mo�e napoj�w?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"To nie twoja sprawa.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"W�a�nie tak!",DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //To nie twoja sprawa.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Dobrze, jak sobie �yczysz.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //W�a�nie tak!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //Wiedzia�em! Czeg� innego kto� taki jak ty m�g�by chcie� od maga.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Dam ci dobr� rad�: daruj sobie tych ca�ych mag�w. Ceny, kt�rych ��daj� za swoje zabawki s� niezwykle wyg�rowane.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Runy i napoje dostaniesz r�wnie� w naszym obozie i to za po�ow� ceny!
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};
