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
	description = "Jsem tady nový. Kdo jsi?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Jsem tady nový. Kdo jsi?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Jsem Baal Taran ze Spáèova Bratrstva.
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
	description = "Co to je Spáèovo Bratrstvo?";
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
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Co to je Spáèovo Bratrstvo?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //Jsme komunita vyznavaèù nové víry.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //Náš tábor se rozkládá na východì v bažinách. Pøišel jsem šíøit Spáèovo uèení cizincùm, jako jsi ty.
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
	description = "Kdo je ten Spáè?";
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
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Kdo je ten Spáè?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //Spáè je náš spasitel. Zjevil se pøed pìti lety skrze našeho mistra Y´Beriona.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //Od té doby se zøíkáme tøí bohù. A ty bys to mìl udìlat také.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //Bohové dopustili, abychom byli vykázáni do tohoto vìzení. Spáè nás ale dovede ke svobodì.
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
	description = "Povídej mi o Spáèovì uèení.";
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
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Povídej mi o Spáèovì uèení.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //Spáè je mocná bytost, možná ještì mocnìjší než Innos, bùh svìtla.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //Je v naší duši. Jeho síla je však stále omezená. Spal po tisíce let, ale okamžik jeho procitnutí je už blízko.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //Zvolil nás, abysme byli svìdky jeho procitnutí a šíøili jeho uèení.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //Tak poslouchej, všichni, kdo se pøidají ke Spáèovi, získají nesmrtelné duše, ale ti, kteøí se postaví proti nìmu, budou potrestáni.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //Spáè je však milosrdný a poslal dùkaz své moci všem, kdo o nìm pochybovali.
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
	description = "Jak vypadá cesta ke svobodì?";
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
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //Jak vypadá cesta ke svobodì?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //Pøipravujeme se na velké vzývání Spáèe, pøi kterém vstoupí všichni novicové spoleènì ve spojení.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //Pøi tomto vzývání Spáè ukáže cestu ke svobodì.
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
	description = "Jak váš bùh dokázal svou moc?";
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
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //Jak váš bùh dokázal svou moc?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //Promluvil k nám skrze vize. Kdo slyšel jeho hlas, pøestal o jeho moci pochybovat.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //Když vezmeš drogu, která roste v bažinách, budeš Spáèovi blíž a budeš ho moci slyšet. Nìkteøí dokonce vidí obrazy.
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_03"); //Aha.
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
	description = "Jak se dostanu do tábora Bratrstva?";
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
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //Jak se dostanu do tábora Bratrstva?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //Nemám èas. Ale Baal Parvez by tu nìkde v táboøe mìl být také.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //Je poblíž tržištì, na druhé stranì od hradu. Myslím, že bude ve své chatrèi.

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi,"Novic jménem Baal Parvez mì mùže dovést do tábora Bratrstva v bažinách. Najdu ho na tržišti za hradem Starého tábora.");
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
	description = "Potøebuji se dostat do hradu. Mùžeš mi pomoci?";
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
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //Potøebuji se dostat do hradu. Mùžeš mi pomoci?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //Obávám se, že ne, bratøe. Jen nìkteøí z nás smìjí vstoupit do hradu a to jsou ti, kteøí zásobují Gomeze drogou.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //Sbíráme tady drogu z bažin a èást jí pak prodáme do Starého tábora a vymìníme za zboží z vnìjšího svìta.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //Kdybys byl jedním z kurýrù, kteøí pracují pro Cor Kaloma, mohl by ses na hrad dostat. Ale to bys musel být jedním z nás.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //A co vùbec chceš na hradì dìlat?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Chci se tam s nìkým setkat.",DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Mám dopis pro Velkého mága Kruhu ohnì.",DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Chci se tam s nìkým setkat.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //Tak? A s kým? A proè nepoèkáš, až dotyèný vyjde ven?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Do toho ti nic není.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"On je jedním z mágù.",DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //Mám dopis pro Velkého mága Kruhu ohnì.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Och? A kde jsi k nìmu pøišel? Dali ti ho mágové, ještì než tì sem vyhnali, co?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Jsi hloupý, když o tom øíkáš lidem. Ale nemìj obavy - já to nikomu neøeknu!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Ale pro svoje vlastní dobro to stejnì nikomu neøíkej. Zdejší lidi by za takovouhle vìc byli schopní komukoliv podøíznout krk!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //Vìtšina lidí by ráda dostala odmìnu za zprávu z vnìjšího svìta.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //On je jedním z mágù.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //Och! Dobøe, ti nikdy neopustí hrad. Opravdu se musíš dostat dovnitø.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //Co od nich vùbec chceš? Kouzelné runy? Nebo lektvary?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Do toho ti nic není.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Ano.  ",DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //To není tvoje vìc.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Dobøe, èlovìèe. Jen jsem chtìl pomoci...
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //Ano.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //Vìdìl jsem to! Co jiného by mohl chlapík, jako ty, chtít od mágù.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Mùžu ti dát jednu dobrou radu: zapomeò na mágy. Chtìjí za své zboží pøíliš rudy.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Kouzelné runy a lektvary jsou daleko levnìjší v našem táboøe.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};
