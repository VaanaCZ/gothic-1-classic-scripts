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
	description = "Jestem tu nowy. Kim jesteœ?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Jestem tu nowy. Kim jesteœ?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Jestem Baal Taran z Bractwa Œni¹cego.
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
	description = "Bractwo Œni¹cego? A có¿ to takiego?";
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
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Bractwo Œni¹cego? A có¿ to takiego?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //Jesteœmy wspólnot¹ wyznawców nowej wiary.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //Nasz obóz znajduje siê na wschód st¹d, na bagnie. Przyszed³em tutaj, by nauczaæ niewiernych takich jak ty s³ów Œni¹cego.
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
	description = "Kim jest Œni¹cy?";
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
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Kim jest Œni¹cy?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //Œni¹cy bêdzie naszym wyzwolicielem. Piêæ lat temu ujawni³ siê nam przez Y'Beriona, naszego wielkiego mistrza.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //Od tej chwili, wyrzekliœmy siê trzech bogów, co i tobie radzê.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //Bogowie przygl¹dali siê bezczynnie, gdy byliœmy skazywani na do¿ywotni¹ katorgê w tym wiêzieniu. Ale Œni¹cy wska¿e nam drogê do wolnoœci.
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
	description = "Opowiedz mi o naukach Œni¹cego.";
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
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Opowiedz mi o naukach Œni¹cego.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //Œni¹cy jest niezwykle potê¿ny, mo¿e nawet potê¿niejszy od Innosa, boga œwiat³a.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //Zjednoczy³ siê z nami duchowo, ale jego moc jest wci¹¿ ograniczona. By³ uœpiony przez tysi¹ce lat, ale moment jego wielkiego przebudzenia jest ju¿ bardzo bliski!
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //Wybra³ nas na œwiadków swojego nadejœcia i kaza³ nam szerzyæ jego s³owa w ca³ej kolonii.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //Zatem s³uchaj: ka¿dy, kto stanie po jego stronie zostanie zbawiony, ale ci, którzy siê mu sprzeciwi¹, ponios¹ surow¹ karê.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //Ale Œni¹cy jest mi³osierny i wszystkim w¹tpi¹cym przysy³a znak swojej potêgi.
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
	description = "Jak bêdzie wygl¹daæ ta droga do wolnoœci?";
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
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //Jak bêdzie wygl¹daæ ta droga do wolnoœci?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //Przygotowujemy siê do wielkiego przyzwania, w którym wszyscy Nowicjusze zjednocz¹ swoje duchowe si³y.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //W trakcie rytua³u Œni¹cy ujawni nam œwiêt¹ drogê do wolnoœci.
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
	description = "W jaki sposób wasz bóg udowodni³ swoj¹ potêgê?";
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
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //W jaki sposób wasz bóg udowodni³ swoj¹ potêgê?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //Przemawiaj¹c do nas za poœrednictwem wizji. Kto raz us³yszy jego g³os, ju¿ nigdy nie zb³¹dzi na œcie¿kê z³a.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //Za¿yj rosn¹ce na bagnach ziele, a zbli¿ysz siê do Œni¹cego i bêdziesz móg³ us³yszeæ jego s³owa. Niektórym wybrañcom zdarzy³o siê go nawet zobaczyæ!
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
	description = "Jak mogê dotrzeæ do obozu Bractwa?";
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
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //Jak mogê dotrzeæ do obozu Bractwa?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //Jestem teraz zajêty, ale Baal Parvez powinien przebywaæ jeszcze w tym obozie.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //Znajdziesz go gdzieœ w pobli¿u targowiska, po drugiej stronie zamku. Zdajê siê, ¿e ma tam nawet w³asn¹ chatê!

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi,"Nowicjusz imieniem Baal Parvez mo¿e mnie zaprowadziæ do obozu na bagnie. Znajdê go na targowisku, za zamkiem Starego Obozu.");
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
	description = "Muszê siê dostaæ do zamku. Móg³byœ mi pomóc?";
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
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //Muszê siê dostaæ do zamku. Móg³byœ mi pomóc?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //Obawiam siê, ¿e nie. Tylko Bracia dostarczaj¹cy Gomezowi ziele maj¹ wstêp do zamku.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //Zbieramy bagienne ziele, i czêœæ zbiorów sprzedajemy do Starego Obozu w zamian za ró¿ne dobra z zewnêtrznego œwiata.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //Gdybyœ by³ jednym z kurierów pracuj¹cych dla Cor Kaloma, móg³byœ dostaæ siê do zamku. Oczywiœcie musia³byœ najpierw przyst¹piæ do Bractwa.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //A czego, jeœli wolno spytaæ, chcesz szukaæ w zamku?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Muszê siê tam z kimœ spotkaæ.",DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Mam list do Arcymistrza Magów Ognia.",DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Muszê siê tam z kimœ spotkaæ.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //Naprawdê? A z kim? Nie móg³byœ po prostu zaczekaæ, a¿ do ciebie wyjdzie?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"To nie twoja sprawa.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"To jeden z magów.",DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //Mam list do Arcymistrza Magów Ognia.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Czy¿by? A sk¹d go masz? Mo¿e dosta³eœ go od jednego z magów zanim ciê tu wrzucono?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Jesteœ g³upcem, rozpowiadaj¹c o tym na lewo i prawo, ale nie obawiaj siê - nikomu o tym nie powiem.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Jednak na twoim miejscu trzyma³bym jêzyk za zêbami. Za coœ takiego wiêkszoœæ ludzi bez wahania poder¿nê³aby ci gard³o.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //Nagroda, jak¹ otrzymuj¹ pos³añcy za dostarczenie wiadomoœci z zewnêtrznego œwiata, jest niezwykle cenna.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //To jeden z magów.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //Có¿, obawiam siê, ¿e oni nigdy nie opuszczaj¹ zamku. Rzeczywiœcie, musia³byœ dostaæ siê do œrodka.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //A czego od nich chcesz? Magicznych run? A mo¿e napojów?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"To nie twoja sprawa.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"W³aœnie tak!",DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //To nie twoja sprawa.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Dobrze, jak sobie ¿yczysz.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //W³aœnie tak!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //Wiedzia³em! Czegó¿ innego ktoœ taki jak ty móg³by chcieæ od maga.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Dam ci dobr¹ radê: daruj sobie tych ca³ych magów. Ceny, których ¿¹daj¹ za swoje zabawki s¹ niezwykle wygórowane.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Runy i napoje dostaniesz równie¿ w naszym obozie i to za po³owê ceny!
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};
