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
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //Nazywam siê Diego.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //Jestem...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //Nie interesuje mnie kim jesteœ. Jesteœ tu nowy - a do mnie nale¿y dbanie o nowych. Na razie to tyle...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //Jeœli chcesz jeszcze trochê po¿yæ, s³uchaj siê mnie, ale oczywiœcie nie bêdê ci przeszkadza³ w ewentualnej próbie samobójstwa. To jak bêdzie?
	
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
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00"); //Dziêki za pomoc.
	
	if (!Npc_KnowsInfo (hero, Info_Diego_Kolonie)) 
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //Jak sobie chcesz. Mi³o by³o ciê poznaæ.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02"); //Spotkamy siê w Starym Obozie.
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
		AI_Output 	(self, hero,"Info_Diego_EXIT_11_01"); //ChodŸmy.
	}
	else
	{
	 	AI_Output	(hero,self,"Info_Diego_EXIT_15_00"); //Trzymaj siê.
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
	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //Czy¿by...?
	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //Jakiœ mag da³ mi go zanim mnie tu wrzucono.
	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //Twoje szczêœcie, ¿e nie mogê siê wiêcej pokazywaæ u magów. Ktoœ inny móg³by ci poder¿n¹æ gard³o za taki list.
	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //A to dlatego, ¿e magowie hojnie op³acaj¹ swoich kurierów, a wiêkszoœæ z tutejszych ludzi nic nie posiada.
	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //Na twoim miejscu trzyma³bym jêzyk za zêbami a¿ do chwili, gdy spotkasz któregoœ z magów. Chocia¿ w¹tpiê, ¿eby ci siê uda³o.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//Dlaczego?
	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //Magowie mieszkaj¹ w zamku, w Starym Obozie. Tylko ludzie Gomeza maj¹ tam wstêp.
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
	description = "Dlaczego mi pomog³eœ?";
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
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //Dlaczego mi pomog³eœ?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //Bo potrzebowa³eœ pomocy. Gdyby nie ja, Bullit i jego ch³opcy mogliby ciê wykoñczyæ.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //A ja jestem zbyt mi³y, ¿eby siê temu spokojnie przygl¹daæ. W koñcu przeby³em ca³¹ tê drogê po to, by z³o¿yæ ci propozycjê.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //Propozycjê...
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //Tak. Po tym zajœciu z Bullitem i jego ludŸmi powinieneœ siê domyœliæ, ¿e przyda ci siê ochrona.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //Ka¿dy, kto tu trafia ma wybór. W kolonii s¹ trzy obozy i w koñcu bêdziesz musia³ do któregoœ do³¹czyæ. 
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //Jestem tu, by udowodniæ wszystkim nowym, ¿e najlepszym miejscem dla nich bêdzie Stary Obóz.
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
	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //On i pozostali przenosz¹ towary z zewn¹trz do Obozu. Tam go znajdziesz.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //Ale jeœli chcesz z nim walczyæ, radzê ci uwa¿aæ. To doœwiadczony wojownik.
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
	description = "Dobra, co powinienem wiedzieæ o tym miejscu?";
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
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //Dobra, co powinienem wiedzieæ o tym miejscu?
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //Nazywamy je koloni¹. Wiesz ju¿, ¿e wydobywamy rudê dla króla. 
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //Có¿, w ka¿dym razie tak robi¹ ludzie ze Starego Obozu.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //Wewn¹trz Bariery powsta³y trzy obozy. Najwiêkszy i najstarszy jest tak zwany Stary Obóz.
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
	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //Nie ma za bardzo o czym mówiæ. Jest nie do sforsowania.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //A co siê stanie, jeœli po prostu spróbujê st¹d wyjœæ?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //Ostatni, który tego spróbowa³ dotar³ na drug¹ stronê jako trup. Przez to przeklête magiczne pole mo¿na wejœæ, ale ju¿ nigdy siê st¹d nie wydostaniesz.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //Jeœli jest st¹d jakieœ wyjœcie - znajdê je.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //Tak ci spieszno, ¿eby siê st¹d wyrwaæ? Dopiero co tu trafi³eœ!
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OtherCamps (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 2;
	condition	= Info_Diego_OtherCamps_Condition;
	information	= Info_Diego_OtherCamps_Info;
	permanent	= 0;
	description = "A co z pozosta³ymi obozami?";
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
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //A co z pozosta³ymi obozami?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //Te dwa obozy zamieszkuj¹ szaleñcy, którzy próbuj¹ siê st¹d wydostaæ za wszelk¹ cenê.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //W zachodniej czêœci kolonii znajduje siê Nowy Obóz. Rezyduj¹ tam magowie, którzy myœl¹, ¿e uda siê im wysadziæ Barierê, jak tylko zbior¹ dostatecznie du¿o rudy.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //No i s¹ jeszcze œwiry z Sekty, na wschodzie. Ich obóz znajduje siê na œrodku bagna. Oni z kolei czekaj¹ a¿ ich bóstwo pomo¿e im siê st¹d wydostaæ.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //Wygl¹da na to, ¿e jeszcze trochê poczekaj¹.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //Na twoim miejscu nie traci³bym czasu na zadawanie siê z szaleñcami.
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
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //To najwiêkszy i najpotê¿niejszy z trzech obozów. Gomez i jego ludzie kontroluj¹ kopalniê, a tym samym - ca³y handel ze œwiatem zewnêtrznym.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //Raz w miesi¹cu król przysy³a nam wszystko, czego potrzebujemy. Mamy staruszka w garœci, kapujesz?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //Przysy³a nam broñ, chleb, miêso... wszystko.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{ 
	AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //Ty te¿ mo¿esz mieæ w tym udzia³. Musisz tylko do³¹czyæ do ludzi Gomeza.
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
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //Gomez jest najpotê¿niejszym z Magnatów kieruj¹cych handlem rud¹. To on rz¹dzi w Starym Obozie i ma najwiêcej do powiedzenia w ca³ej kolonii.
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
	description = "Za³ó¿my, ¿e chcia³bym do³¹czyæ do jego ludzi. Co powinienem zrobiæ?";
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
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //Za³ó¿my, ¿e chcia³bym do³¹czyæ do jego ludzi. Co powinienem zrobiæ?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //Przy bramie do zamku znajdziesz cz³owieka imieniem Thorus. Powiedz mu, ¿e Diego ciê przys³a³.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
	
	Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC, LOG_RUNNING);
	B_LogEntry( CH1_JoinOC,"Aby zostaæ przyjêtym w poczet ludzi Gomeza, muszê najpierw porozmawiaæ z Thorusem.");
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
	description = "Jak dostanê siê do Starego Obozu?";
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
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //Jak dostanê siê do Starego Obozu?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //Pod¹¿aj t¹ œcie¿k¹. Stary Obóz to najbli¿sze, mniej wiêcej bezpieczne miejsce jakie napotkasz po drodze.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //Pomiêdzy obozami krêci siê wiele groŸnych zwierz¹t. Radzi³bym ci postaraæ siê o jak¹œ broñ.
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
	description = "Gdzie mogê znaleŸæ orê¿?";
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
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //Gdzie mogê znaleŸæ orê¿?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //Rozejrzyj siê trochê w pobli¿u Opuszczonej Kopalni. Na pewno znajdziesz tam coœ przydatnego.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //Kopalniê nie trudno znaleŸæ. Le¿y parê metrów w dó³ kanionu. 
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
	description = "Rozmawia³em z Thorusem.";
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
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00"); //Rozmawia³em z Thorusem.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //I co ci powiedzia³?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //Mówi, ¿e bêdê móg³ do³¹czyæ do Starego Obozu, jeœli TY uznasz, ¿e siê nadajê.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //Widzê, ¿e czeka mnie dodatkowa robota.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //Zaczynamy od razu?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05"); //Najpierw powinieneœ dowiedzieæ siê kilku rzeczy.
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
	description = "Co powinienem wiedzieæ, ¿eby mnie przyjêto do Starego Obozu?";
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
	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //Co powinienem wiedzieæ, zanim zostanê przyjêty do Starego Obozu?
	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //Jeœli chcesz do nas nale¿eæ, musisz najpierw zaplusowaæ u kilku ludzi.
	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //W Zewnêtrznym Pierœcieniu mo¿esz spotkaæ paru wp³ywowych ludzi, g³ównie Cieni. Jeœli uda ci siê ich do siebie przekonaæ, twoje szanse wzrosn¹.
	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //PóŸniej czeka ciê test zaufania.
	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //Oprócz tego musisz siê jeszcze wiele nauczyæ. Im wiêcej nowych umiejêtnoœci zdobêdziesz, tym cenniejszy bêdziesz dla nas.
	
	B_LogEntry( CH1_JoinOC,"Zanim zostanê przyjêty, muszê zjednaæ sobie kilku wp³ywowych ludzi z Zewnêtrznego Pierœcienia i przejœæ test zaufania.");
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
	description = "Gdzie znajdê te wa¿ne osoby?";
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
	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //Gdzie znajdê te wa¿ne osoby?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //Có¿, na jednego z nich w³aœnie patrzysz. Poza tym, jest jeszcze Thorus, jego ju¿ znasz.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //Co do pozosta³ych... sam musisz ich rozpoznaæ. Jeœli nie jesteœ w stanie tego zrobiæ, to i tak nie masz tu czego szukaæ.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //Najlepiej przejdŸ siê po Zewnêtrznym Pierœcieniu i porozmawiaj z ludŸmi.
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
	description = "Kto mo¿e mnie czegoœ nauczyæ?";
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
	AI_Output		(hero,self,"Info_Diego_Teachers_15_00"); //Kto mo¿e mnie czegoœ nauczyæ?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_01"); //Zacznij od R¹czki. To najzrêczniejszy cz³owiek w Obozie.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_02"); //Miej oczy szeroko otwarte, a na pewno znajdziesz wielu ludzi, którzy zechc¹ ciê czegoœ nauczyæ.
	AI_Output		(hero,self,"Info_Diego_Teachers_15_03"); //Gdzie znajdê R¹czkê?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_04"); //Jego chata stoi nieco na uboczu, zaraz przy murach zamku. Id¹c st¹d udaj siê w stronê areny.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_05"); //Przy zamkowej bramie pójdŸ w lewo. To w³aœnie droga do areny.

	if	(Fingers_CanTeach == FALSE)
	{
		Log_CreateTopic (GE_TeacherOC,	LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"R¹czka mo¿e mnie nauczyæ otwierania zamków i kradzie¿y kieszonkowej. Jego chata znajduje siê nieco na uboczu, niedaleko areny.");
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
	description = "Mo¿esz mnie czegoœ nauczyæ?";
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
		B_LogEntry		(GE_TeacherOC,"Diego mo¿e mi pomóc w zwiêkszeniu mojej zwinnoœci i si³y.");
		log_diegotrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //Tak. Mogê ci pokazaæ, jak zwiêkszyæ swoj¹ si³ê lub zrêcznoœæ.
	
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
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //Jesteœ teraz o wiele silniejszy.
	};
	if (Diego_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //Umiesz teraz sprawniej pos³ugiwaæ siê ³ukiem i kusz¹.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Wróæ nied³ugo. Musisz siê jeszcze wiele nauczyæ.
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
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_01"); //Bêdziesz siê musia³ wybraæ do Starej Kopalni. Tam znajdziesz faceta imieniem Ian. Od niego dostaniesz listê.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_02"); //To bardzo wa¿ny dokument. Zawiera spis wszystkich rzeczy, których potrzebuj¹ od nas ludzie z kopalni.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_03"); //Postaramy siê, ¿eby dostarczono je z nastêpnym konwojem.
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_04"); //¯aden problem!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_05"); //W³aœnie ¿e jest problem. Ta lista nie mo¿e wpaœæ w rêce ludzi z Nowego Obozu!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_06"); //Jak ju¿ powiedzia³em: to bardzo wa¿na lista. Jeœli nie zawalisz - daleko tu zajdziesz.
	
	Diego_BringList = LOG_RUNNING;
    
    Log_CreateTopic (CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus(CH1_BringList,LOG_RUNNING);
    B_LogEntry    (CH1_BringList,"Diego wys³a³ mnie do Starej Kopalni. Tam, od cz³owieka imieniem Ian, dostanê bardzo wa¿n¹ listê, która pod ¿adnym pozorem nie mo¿e wpaœæ w ³apy ludzi z Nowego Obozu.");
    
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
	description = "Skoro ta lista jest taka wa¿na, myœlisz, ¿e Ian wyda j¹ komuœ takiemu jak JA?";
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
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_01"); //Skoro ta lista jest taka wa¿na, sk¹d pewnoœæ, ¿e Ian wyda j¹ komuœ takiemu jak JA?
	AI_Output (self, hero,"Info_Diego_IanPassword_Info_11_02"); //Bo powiesz mu, ¿e przys³a³ ciê Diego.
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_03"); //Tak zrobiê.
	
	B_LogEntry    (CH1_BringList,"Ian da mi listê, jeœli powiem mu, ¿e przysy³a mnie Diego.");
};

// ----------------------------------------------------------------------------------

INSTANCE Info_Diego_MapToOldMine (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_MapToOldMine_Condition;
	information	= Info_Diego_MapToOldMine_Info;
	permanent	= 0;
	description = "Gdzie znajdê Star¹ Kopalniê?";
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
	AI_Output (hero, self,"Info_Diego_MapToOldMine_Info_15_00"); //Gdzie znajdê Star¹ Kopalniê?
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_01"); //Porozmawiaj z Grahamem, to nasz kartograf. Powiedz mu, ¿e ja ciê przysy³am, i ¿e potrzebujesz mapy. Z niej dowiesz siê, gdzie le¿y kopalnia.
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_02"); //Graham mieszka na lewo od pó³nocnej bramy.
	
	B_LogEntry    (CH1_BringList,"Od Grahama dostanê mapê. Znajdê go na lewo od pó³nocnej bramy.");
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_Diego_BringList_Success (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_BringList_Success_Condition;
	information	= Info_Diego_BringList_Success_Info;
	permanent	= 0;
	description = "Mam listê od Iana.";
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
	AI_Output (hero, self,"Info_Diego_BringList_Success_15_00"); //Mam listê od Iana.
		
	if	Npc_HasItems(hero,TheList)
	{
		B_GiveInvItems	(hero, self, TheList, 1);
		B_LogEntry    	(CH1_BringList,"Diego bardzo siê ucieszy³, gdy wrêczy³em mu listê Iana.");
	}
	else if	Npc_HasItems(hero,TheListNC)
	{
		B_GiveInvItems	(hero, self, TheListNC, 1);
		B_LogEntry    	(CH1_BringList,"Diego ucieszy³ siê, gdy wrêczy³em mu listê od Iana. Chyba nie zauwa¿y³, ¿e Lares doda³ kilka rzeczy od siebie. A mo¿e rzeczywiœcie widzia³em dziwny b³ysk w jego oku?");
	};
	B_UseFakeScroll();
	
	AI_Output (self, hero,"Info_Diego_BringList_Success_11_01"); //Dobra robota! Zaczynasz mi siê naprawdê podobaæ!

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
	description = "Jak tam z moj¹ opini¹ w Obozie?";
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
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_00"); //Jak tam z moj¹ opini¹ w Obozie?
	AI_Output(self, hero,"Info_Diego_JoinAnalyze_11_01"); //Rozmawia³em z kilkoma ludŸmi...
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_02"); //I?
	// -----------------------------------------------------------
	Points_OC = 0;
	// -----------------------------------------------------------
	if (Scatty_ChargeKirgo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01"); //Scatty powiedzia³ mi, ¿e pokona³eœ Kirgo.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKirgo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //Scatty powiedzia³ mi, ¿e pozwoli³eœ Kirgo spuœciæ sobie baty. Chyba nie jest tob¹ zachwycony.
		Points_OC = Points_OC - 1;
	}
	else if (Scatty_ChargeKirgo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //Scatty powiedzia³ mi, ¿e nie mo¿e siê doczekaæ na twoj¹ walkê z Kirgo.
	};
	
	if (Scatty_ChargeKharim == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //Ale by³ pod wra¿eniem twojej œmia³oœci. Nie ka¿dy mia³by odwagê, ¿eby wyzwaæ Kharima. Choæby nawet z nim przegra³.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKharim == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //Ale by³ pod wielkim wra¿eniem twojej walki z Kharimem. Bez przerwy opowiada jaki to z ciebie wojownik. 
		Points_OC = Points_OC + 5;
	}
	else if (Scatty_ChargeKharim == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //I nie mo¿e siê doczekaæ, kiedy staniesz do walki z Kharimem.
	};
	// -----------------------------------------------------------
	if (Whistler_BuyMySword == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //Œwistak opowiedzia³ mi o tej historii z Fiskiem... Có¿, na twoim miejscu wzi¹³bym tê rudê i da³ nogê, ale tak, czy inaczej - Œwistak chyba bardzo ciê polubi³.
		Points_OC = Points_OC + 3;
	}
	else if ( (Whistler_BuyMySword == LOG_FAILED) || ( (Whistler_BuyMySword==LOG_RUNNING)&&(Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) ) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //Rozmawia³em ze Œwistakiem. Zwia³eœ z jego rud¹, cwaniaku! Muszê przyznaæ, ¿e œmia³oœci ci nie brakuje!
		Points_OC = Points_OC + 2;
	}
	else if (Whistler_BuyMySword == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //Œwistak czeka na swój miecz. Zdecyduj siê wreszcie czy zamierzasz mu go daæ, czy nie. W przeciwnym wypadku mo¿e pomyœleæ, ¿e zwia³eœ z jego rud¹!
		
	};
	// -----------------------------------------------------------
	if (Sly_LostNek == LOG_SUCCESS)			
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //Z³y powiedzia³ mi, ¿e znalaz³eœ Neka. Wydawa³ siê byæ bardzo zadowolony.
		Points_OC = Points_OC + 4;
	}
	else if (Sly_LostNek == LOG_RUNNING)					
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //Moim zdaniem Z³y myli siê co do Neka. By³ uci¹¿liwy, to fakt, ale nie wierzê, ¿eby zdezerterowa³ do Nowego Obozu.
	};
	// -----------------------------------------------------------
	if (Fingers_Learnt == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //Mówi³em ci ju¿ o R¹czce! On mo¿e ciê wiele nauczyæ!
	}
	else if (Fingers_Learnt == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //R¹czka powiedzia³ mi, ¿e trochê siê ju¿ nauczy³eœ, ale uwa¿a, ¿e móg³byœ byæ jeszcze lepszy.
		Points_OC = Points_OC + 3;
	};
	// -----------------------------------------------------------
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //Muszê powa¿nie porozmawiaæ z Dexterem. Wykorzystuje ciê do za³atwiania w³asnych porachunków.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //Ale jeœli chodzi o nasz test - nie ma ¿adnych przepisów. Jeœli uda ci siê dokonaæ czegoœ TAKIEGO, to bêdzie wielki krok do przodu.
		
	}
	else if (Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //Naprawdê uda³o ci siê zdobyæ przepis Kaloma. Dexter jest pod wra¿eniem. Ja zreszt¹ te¿!
		Points_OC = Points_OC + 5;
	};
	// -----------------------------------------------------------
	if (Thorus_MordragKo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //Ta sprawa z Mordragiem to nie lada wyzwanie. Niez³y z niego wojownik. Musisz porz¹dnie poæwiczyæ, jeœli chcesz go pokonaæ.
	}
	else if (Thorus_MordragKo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //Thorus uwa¿a, ¿e przyda siê nam ktoœ taki jak ty - to dla ciebie niezwykle korzystne.
		Points_OC = Points_OC + 5;
	}
	else if (Thorus_MordragKo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //Thorus dosta³ ataku apopleksji. Zreszt¹ wcale mu siê nie dziwiê. Jak mo¿na A¯ TAK schrzaniæ robotê?
		Points_OC = Points_OC - 5;						
	}
	// ----WEITER-------------------------------------------------------
	if (Fisk_GetNewHehler == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //Fisk powiedzia³ mi, ze go zaskoczy³eœ. W ka¿dym razie bêdzie po twojej stronie.
		Points_OC = Points_OC + 5;
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //Fisk bardzo siê na ciebie wkurzy³. Na twoim miejscu znalaz³bym kogoœ na miejsce Mordraga.
	};
	// -----------------------------------------------------------
	if (points_oc > 15)// runtergesetzt!! // Bei 20 + BringList = Aufnahme
	{
		AI_Output (self, hero,"Info_Diego_Points_11_00"); //Uda³o ci siê zjednaæ wystarczaj¹co wiele osób.
		
		if hero.level >= 5
		{
			if (Diego_BringList == LOG_SUCCESS)
			{
				AI_Output (self, hero,"Info_Diego_Points_11_01"); //Przeszed³eœ równie¿ test zaufania. IdŸ do Thorusa. Ju¿ go o wszystkim powiadomi³em. Pozwoli ci siê spotkaæ z Gomezem.
				Diego_GomezAudience = TRUE;
				
				Log_SetTopicStatus(CH1_JoinOC, LOG_SUCCESS);
				B_LogEntry(CH1_JoinOC,"Diego za³atwi³ mi audiencjê u Gomeza. Teraz muszê jeszcze zamieniæ s³owo z Thorusem. Wkrótce bêdê jednym z ludzi Gomeza!");
			}
			else
			{
				AI_Output (self, hero,"Info_Diego_Points_11_02"); //Ale musisz jeszcze przejœæ test zaufania.
			};
		}
		else
		{
			B_PrintGuildCondition(5);
		};
	}
	else if (points_oc > 10)
	{
		AI_Output (self, hero,"Info_Diego_Points_11_10"); //W sumie - ca³kiem nieŸle jak na ¿ó³todzioba.
	}
	else if points_oc >= 0
	{
		AI_Output (self, hero,"Info_Diego_Points_11_20"); //Bierz siê do roboty. Przed tob¹ jeszcze daleka droga, jeœli chcesz do czegoœ dojœæ w tym obozie.
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
	description = "Co mam zrobiæ, kiedy stanê przed Gomezem?";
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
	AI_Output (hero, self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //Co mam zrobiæ, kiedy stanê przed Gomezem?
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //Gomez podejmuje decyzje na podstawie instynktu. Jeœli spodoba mu siê twoja gêba - pozwoli ci zostaæ.
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //Od tej pory musisz sobie radziæ sam - postaraj siê! Powodzenia!
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
		AI_Output			(hero, self,"PC_Thief_ARMOR_Info_15_01"); //Mogê dostaæ tak¹ zbrojê jak twoja?
		AI_Output			(self, hero,"PC_Thief_ARMOR_Info_11_02"); //A masz doœæ rudy?

		CreateInvItem 		(hero,			STT_ARMOR_H);
		B_GiveInvItems		(hero, self,	ItMinugget,	VALUE_STT_ARMOR_H);
		
		//hier nur ein Text für die Bildschirmausgabe
		CreateInvItem		(self, 			ItAmArrow);
		B_GiveInvItems		(self, hero,	ItAmArrow,	1);
		Npc_RemoveInvItem	(hero,			ItAmArrow);
	}
	else
	{
		AI_Output (self, hero,"PC_Thief_ARMOR_Info_11_03"); //Zdob¹dŸ rudê, to dostaniesz zbrojê.
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
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_00"); //Hej! Myœla³em, ¿e ju¿ nie ¿yjesz!
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_01"); //Parê razy te¿ mi siê tak wydawa³o.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_02"); //Wiele siê wydarzy³o od naszego ostatniego spotkania. S³ysza³em, ¿e mia³eœ swój wk³ad w wielkie przywo³anie!
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_03"); //Widzê, ¿e jesteœ œwietnie poinformowany.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_04"); //Lepiej ni¿ myœlisz... Teraz szukasz kamienia ogniskuj¹cego?
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_05"); //Tak. Powinien byæ gdzieœ w pobli¿u.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_06"); //Wiem, gdzie go mo¿na znaleŸæ. Jest tylko jeden problem.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_07"); //Rozumiem. Czego chcesz?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_08"); //Widzê, ¿e szybko siê uczysz, ale nie o to mi chodzi³o.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_09"); //Nie? Wiêc có¿ to za problem?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_10"); //O, to ca³e trzy tony problemów!
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_11"); //ChodŸmy. Za chwilê sam zobaczysz.

 	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"GuideTroll");

	Log_CreateTopic		(CH3_TrollCanyon,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_RUNNING);
	B_LogEntry		(CH3_TrollCanyon,"W pobli¿u pó³nocnego kamienia ogniskuj¹cego, niespodziewanie natkn¹³em siê na Diego. Ostrzeg³ mnie, ¿e coœ 'wielkiego' czeka na mnie na koñcu tego kanionu.");
	B_LogEntry		(CH3_TrollCanyon,"Jakimœ cudem dowiedzia³ siê o moich dzia³aniach w obozie Bractwa oraz o poszukiwaniach kamienia. Dalej pójdziemy razem.");

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
	
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //Po lewej stronie tego kanionu znajdziesz wejœcie do jaskini, która prowadzi do kamienia.
	AI_Output (hero, self,"PC_Thief_SHOWFOCUS_Info_15_02"); //Wszystko jasne. Jednak najpierw musimy siê jakoœ pozbyæ tamtego bydlaka.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //Spróbuj znaleŸæ jakiœ jego s³aby punkt albo inny sposób na pokonanie tego Trolla.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //Œci¹gnê na siebie jego uwagê.

	B_LogEntry		(CH3_TrollCanyon,"Na naszej drodze stan¹³ ogromny troll. Diego zamierza œci¹gn¹æ na siebie jego uwagê a ja mam znaleŸæ jakiœ s³aby punkt.");

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
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_01"); //To by³o niesamowite. Niez³y jesteœ. Teraz mo¿esz iœæ po kamieñ ogniskuj¹cy.
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_02"); //Ja dopilnujê, ¿ebyœmy nie mieli ju¿ wiêcej niemi³ych niespodzianek.

	B_LogEntry		(CH3_TrollCanyon,"Pokonaliœmy trolla! Teraz mogê zaj¹æ siê ko³owrotem podnosz¹cym kratê przed platform¹ z kamieniem ogniskuj¹cym.");

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
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_01"); //Ko³owrót chyba siê zaci¹³!
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_02"); //Czekaj, mo¿e uda mi siê go naprawiæ!

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
	AI_Output 			(self, hero,"PC_Thief_FIXWHEEL_Info_11_01"); //No, teraz powinno dzia³aæ!
	Troll_Wheel = 2;	// Winde repariert!

	B_LogEntry		(CH3_TrollCanyon,"Diego naprawi³ ko³owrót. Teraz nic ju¿ nie stanie mi na drodze.");

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

	AI_Output 			(self, hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //IdŸ po kamieñ. Zaczekam na ciebie tutaj!

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

	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_01"); //Widzê, ¿e znalaz³eœ kamieñ! Œwietnie.
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_02"); //Chyba powinienem znowu zajrzeæ do Starego Obozu. Powodzenia!
	AI_Output			(hero, self,"PC_Thief_GOTIT_Info_15_03"); //Nie daj siê zabiæ!
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_04"); //Jeszcze siê zobaczymy.

	B_LogEntry		(CH3_TrollCanyon,"Mam ju¿ kamieñ ogniskuj¹cy. Teraz pozosta³o tylko przekonaæ parê harpii, ¿e nie zamierzam go prêdko oddawaæ.");
	B_LogEntry		(CH3_TrollCanyon,"Diego wraca do Starego Obozu. Pewnie siê jeszcze spotkamy...");

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

	AI_Output			(self,hero,"Info_Diego_OCWARN_11_01"); //Hej... Ciii... B¹dŸ cicho!
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN))
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_02"); //Czeœæ, Diego. Rozmawia³em ju¿ z Miltenem po przeciwnej stronie obozu.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_03"); //Dobrze, zatem wiesz ju¿, co siê sta³o.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_04"); //A s³ysza³eœ o planowanym ataku na Woln¹ Kopalniê?
	}
	else
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_05"); //Czeœæ, Diego. Co ma znaczyæ ta ca³a zabawa w chowanego?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_06"); //Nic nie s³ysza³eœ?
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_07"); //O czym?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_08"); //O zawaleniu siê Starej Kopalni, zamordowaniu Magów Ognia i planach ataku na Woln¹ Kopalniê.
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
	description = "Jak mog³o dojœæ do zawalenia siê Starej Kopalni?";
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
	AI_Output		(hero,self,"Info_Diego_OCMINE_15_01"); //Jak mog³o dojœæ do zawalenia siê kopalni?
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_02"); //Jeden z Kopaczy, któremu uda³o siê uratowaæ, powiedzia³, ¿e kopi¹c na najni¿szym poziomie trafili na podziemn¹ rzekê.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_03"); //Kiedy woda wdar³a siê do szybów, popêka³y podpory i runê³a ca³a górna czêœæ.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_04"); //Tylko garstce ludzi uda³o siê wydostaæ na powierzchniê.
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
	description = "Co siê sta³o z Magami Ognia?";
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
	AI_Output		(hero,self,"Info_Diego_OCKDF_15_01"); //Co siê sta³o z Magami Ognia?
	AI_Output		(self,hero,"Info_Diego_OCKDF_11_02"); //To d³uga historia.
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
	description = "Napad na Woln¹ Kopalniê?";
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
	AI_Output		(hero,self,"Info_Diego_OCFM_15_01"); //Napad na Woln¹ Kopalniê?
	AI_Output		(self,hero,"Info_Diego_OCFM_11_02"); //To d³uga historia.
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
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_01"); //Opowiadaj, to nie pierwsza d³uga historia, której musia³em wys³uchaæ.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_02"); //No dobra. Na szczêœcie by³em w³aœnie w siedzibie Magnatów, kiedy dotar³y do nich wieœci o zawaleniu siê kopalni.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_03"); //Kiedy Gomez dowiedzia³ siê o wypadku, oszala³ z wœciek³oœci. Wcale mu siê nie dziwiê - jego autorytet móg³ run¹æ w ka¿dej chwili, razem z kopalni¹.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_04"); //Jasne. Kto kontroluje rudê, kontroluje ca³¹ koloniê!
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_05"); //No w³aœnie. Przecie¿ bez sta³ego nap³ywu rudy, handel ze œwiatem zewnêtrznym padnie raz - dwa.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_06"); //Jeœli Gomez nie znajdzie szybko nowego Ÿród³a dochodu, ludzie przestan¹ go s³uchaæ.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_07"); //I dlatego postanowi³ najechaæ Woln¹ Kopalniê?
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_08"); //Có¿, obiektywnie rzecz bior¹c, to jedyna szansa Gomeza na zachowanie w³adzy.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_09"); //Dwie godziny temu dwa tuziny stra¿ników wyruszy³y w kierunku Wolnej Kopalni.

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
	description = "To szaleñstwo! Muszê uprzedziæ Nowy Obóz.";
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
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_01"); //To szaleñstwo! Muszê uprzedziæ Nowy Obóz.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_02"); //W takim razie lepiej siê pospiesz! Stra¿nicy s¹ ju¿ pewnie niedaleko Wolnej Kopalni.
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_03"); //Ale przecie¿ nie przedr¹ siê tak ³atwo przez obronne fortyfikacje Nowego Obozu!
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_04"); //Wcale nie musz¹ siê przez nie przedzieraæ. Kilka miesiêcy temu znaleŸliœmy œcie¿kê, która prowadzi przez góry wprost do Wolnej Kopalni. Nikt inny nie wie o jej istnieniu.
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
	description = "Widzia³em Stra¿ników pilnuj¹cych zamkniêtych bram.";
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
	AI_Output		(hero,self,"Info_Diego_OCGUARDS_15_01"); //Widzia³em Stra¿ników pilnuj¹cych zamkniêtych bram.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_02"); //Trzymaj siê z dala od nich. Zaatakuj¹ ka¿dego, kto spróbuje dostaæ siê do Obozu.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_03"); //Obawiaj¹ siê odwetu za napad na Woln¹ Kopalniê.
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
	description = "Ale co sta³o siê z Magami Ognia?";
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
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_01"); //Ale co sta³o siê z Magami Ognia?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_02"); //Corristo i jego towarzysze byli jedynymi ludŸmi w obozie, którzy zachowali zimn¹ krew.
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_03"); //Zabronili przeprowadzenia ataku i domagali siê pertraktacji z pozosta³ymi obozami.
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_04"); //ZABRONILI Gomezowi przeprowadzenia ataku na Woln¹ Kopalniê?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_05"); //No w³aœnie. Corristo i jego ludzie byli zbyt zadufani w sobie. Gomez przesta³ im ufaæ i kaza³ ich zdradziecko zamordowaæ.
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
	description = "I co teraz zamierzacie zrobiæ? To znaczy - ty i Milten?";
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
	AI_Output		(hero,self,"Info_Diego_OCRETREAT_15_01"); //I co teraz zamierzacie zrobiæ? To znaczy - ty i Milten?
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_02"); //Zostaniemy tu jeszcze przez jakiœ czas. Bêdziemy ostrzegali innych przyjació³, ¿eby nie wpadli w ³apy Stra¿ników.
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_03"); //Ale móg³byœ coœ dla nas zrobiæ.
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
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_02"); //ZnajdŸ Lestera i Gorna. Musz¹ siê dowiedzieæ o tym, co siê tutaj wydarzy³o.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_03"); //Powiedz im, ¿e spotkamy siê we czwórkê tam gdzie zwykle.
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_04"); //Jeœli znajdê ich przed tob¹, przeka¿ê im ostrze¿enie i wezwanie na spotkanie.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_05"); //Dziêki, przyjacielu. Widzê, ¿e równy z ciebie goœæ. IdŸ ju¿. Jeszcze siê kiedyœ spotkamy.
				
	Log_CreateTopic		(CH4_4Friends,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_4Friends,		LOG_RUNNING);
	B_LogEntry			(CH4_4Friends,		"Wszyscy Magowie Ognia zginêli. Sytuacja wymyka siê spod kontroli. Diego kaza³ mi powiadomiæ Lestera i Gorna, ¿e maj¹ siê spotkaæ z nim i z Miltenem w tajemnym miejscu. Chyba nie robi¹ tego pierwszy raz!"); 
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
