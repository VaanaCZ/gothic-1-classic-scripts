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
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Jsem Baal Taran ze Spáčova Bratrstva.
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
	description = "Co to je Spáčovo Bratrstvo?";
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
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //Co to je Spáčovo Bratrstvo?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //Jsme komunita vyznavačů nové víry.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //Náš tábor se rozkládá na východě v bažinách. Přišel jsem šířit Spáčovo učení cizincům, jako jsi ty.
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
	description = "Kdo je ten Spáč?";
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
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //Kdo je ten Spáč?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //Spáč je náš spasitel. Zjevil se před pěti lety skrze našeho mistra Y´Beriona.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //Od té doby se zříkáme tří bohů. A ty bys to měl udělat také.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //Bohové dopustili, abychom byli vykázáni do tohoto vězení. Spáč nás ale dovede ke svobodě.
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
	description = "Povídej mi o Spáčově učení.";
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
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //Povídej mi o Spáčově učení.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //Spáč je mocná bytost, možná ještě mocnější než Innos, bůh světla.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //Je v naší duši. Jeho síla je však stále omezená. Spal po tisíce let, ale okamžik jeho procitnutí je už blízko.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //Zvolil nás, abysme byli svědky jeho procitnutí a šířili jeho učení.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //Tak poslouchej, všichni, kdo se přidají ke Spáčovi, získají nesmrtelné duše, ale ti, kteří se postaví proti němu, budou potrestáni.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //Spáč je však milosrdný a poslal důkaz své moci všem, kdo o něm pochybovali.
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
	description = "Jak vypadá cesta ke svobodě?";
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
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //Jak vypadá cesta ke svobodě?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //Připravujeme se na velké vzývání Spáče, při kterém vstoupí všichni novicové společně ve spojení.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //Při tomto vzývání Spáč ukáže cestu ke svobodě.
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
	description = "Jak váš bůh dokázal svou moc?";
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
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //Jak váš bůh dokázal svou moc?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //Promluvil k nám skrze vize. Kdo slyšel jeho hlas, přestal o jeho moci pochybovat.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //Když vezmeš drogu, která roste v bažinách, budeš Spáčovi blíž a budeš ho moci slyšet. Někteří dokonce vidí obrazy.
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
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //Nemám čas. Ale Baal Parvez by tu někde v táboře měl být také.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //Je poblíž tržiště, na druhé straně od hradu. Myslím, že bude ve své chatrči.

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi,"Novic jménem Baal Parvez mě může dovést do tábora Bratrstva v bažinách. Najdu ho na tržišti za hradem Starého tábora.");
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
	description = "Potřebuji se dostat do hradu. Můžeš mi pomoci?";
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
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //Potřebuji se dostat do hradu. Můžeš mi pomoci?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //Obávám se, že ne, bratře. Jen někteří z nás smějí vstoupit do hradu a to jsou ti, kteří zásobují Gomeze drogou.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //Sbíráme tady drogu z bažin a část jí pak prodáme do Starého tábora a vyměníme za zboží z vnějšího světa.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //Kdybys byl jedním z kurýrů, kteří pracují pro Cor Kaloma, mohl by ses na hrad dostat. Ale to bys musel být jedním z nás.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //A co vůbec chceš na hradě dělat?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Chci se tam s někým setkat.",DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Mám dopis pro Velkého mága Kruhu ohně.",DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Chci se tam s někým setkat.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //Tak? A s kým? A proč nepočkáš, až dotyčný vyjde ven?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Do toho ti nic není.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"On je jedním z mágů.",DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //Mám dopis pro Velkého mága Kruhu ohně.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //Och? A kde jsi k němu přišel? Dali ti ho mágové, ještě než tě sem vyhnali, co?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Jsi hloupý, když o tom říkáš lidem. Ale neměj obavy - já to nikomu neřeknu!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Ale pro svoje vlastní dobro to stejně nikomu neříkej. Zdejší lidi by za takovouhle věc byli schopní komukoliv podříznout krk!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //Většina lidí by ráda dostala odměnu za zprávu z vnějšího světa.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //On je jedním z mágů.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //Och! Dobře, ti nikdy neopustí hrad. Opravdu se musíš dostat dovnitř.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //Co od nich vůbec chceš? Kouzelné runy? Nebo lektvary?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Do toho ti nic není.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Ano.  ",DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //To není tvoje věc.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Dobře, člověče. Jen jsem chtěl pomoci...
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //Ano.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //Věděl jsem to! Co jiného by mohl chlapík, jako ty, chtít od mágů.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Můžu ti dát jednu dobrou radu: zapomeň na mágy. Chtějí za své zboží příliš rudy.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Kouzelné runy a lektvary jsou daleko levnější v našem táboře.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};
