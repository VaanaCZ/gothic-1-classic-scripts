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
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //Nazywam si� Diego.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //Jestem...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //Nie interesuje mnie kim jeste�. Jeste� tu nowy - a do mnie nale�y dbanie o nowych. Na razie to tyle...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //Je�li chcesz jeszcze troch� po�y�, s�uchaj si� mnie, ale oczywi�cie nie b�d� ci przeszkadza� w ewentualnej pr�bie samob�jstwa. To jak b�dzie?
	
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
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00"); //Dzi�ki za pomoc.
	
	if (!Npc_KnowsInfo (hero, Info_Diego_Kolonie)) 
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //Jak sobie chcesz. Mi�o by�o ci� pozna�.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02"); //Spotkamy si� w Starym Obozie.
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
		AI_Output 	(self, hero,"Info_Diego_EXIT_11_01"); //Chod�my.
	}
	else
	{
	 	AI_Output	(hero,self,"Info_Diego_EXIT_15_00"); //Trzymaj si�.
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
	description = "Mam list do przyw�dcy Mag�w Ognia.";
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
	AI_Output(hero,self,"Info_Diego_Brief_15_00"); //Mam list do Arcymistrza Mag�w Ognia.
	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //Czy�by...?
	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //Jaki� mag da� mi go zanim mnie tu wrzucono.
	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //Twoje szcz�cie, �e nie mog� si� wi�cej pokazywa� u mag�w. Kto� inny m�g�by ci poder�n�� gard�o za taki list.
	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //A to dlatego, �e magowie hojnie op�acaj� swoich kurier�w, a wi�kszo�� z tutejszych ludzi nic nie posiada.
	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //Na twoim miejscu trzyma�bym j�zyk za z�bami a� do chwili, gdy spotkasz kt�rego� z mag�w. Chocia� w�tpi�, �eby ci si� uda�o.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//Dlaczego?
	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //Magowie mieszkaj� w zamku, w Starym Obozie. Tylko ludzie Gomeza maj� tam wst�p.
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
	description = "Dlaczego mi pomog�e�?";
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
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //Dlaczego mi pomog�e�?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //Bo potrzebowa�e� pomocy. Gdyby nie ja, Bullit i jego ch�opcy mogliby ci� wyko�czy�.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //A ja jestem zbyt mi�y, �eby si� temu spokojnie przygl�da�. W ko�cu przeby�em ca�� t� drog� po to, by z�o�y� ci propozycj�.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //Propozycj�...
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //Tak. Po tym zaj�ciu z Bullitem i jego lud�mi powiniene� si� domy�li�, �e przyda ci si� ochrona.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //Ka�dy, kto tu trafia ma wyb�r. W kolonii s� trzy obozy i w ko�cu b�dziesz musia� do kt�rego� do��czy�. 
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //Jestem tu, by udowodni� wszystkim nowym, �e najlepszym miejscem dla nich b�dzie Stary Ob�z.
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
	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //On i pozostali przenosz� towary z zewn�trz do Obozu. Tam go znajdziesz.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //Ale je�li chcesz z nim walczy�, radz� ci uwa�a�. To do�wiadczony wojownik.
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
	description = "Dobra, co powinienem wiedzie� o tym miejscu?";
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
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //Dobra, co powinienem wiedzie� o tym miejscu?
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //Nazywamy je koloni�. Wiesz ju�, �e wydobywamy rud� dla kr�la. 
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //C�, w ka�dym razie tak robi� ludzie ze Starego Obozu.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //Wewn�trz Bariery powsta�y trzy obozy. Najwi�kszy i najstarszy jest tak zwany Stary Ob�z.
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
	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //Nie ma za bardzo o czym m�wi�. Jest nie do sforsowania.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //A co si� stanie, je�li po prostu spr�buj� st�d wyj��?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //Ostatni, kt�ry tego spr�bowa� dotar� na drug� stron� jako trup. Przez to przekl�te magiczne pole mo�na wej��, ale ju� nigdy si� st�d nie wydostaniesz.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //Je�li jest st�d jakie� wyj�cie - znajd� je.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //Tak ci spieszno, �eby si� st�d wyrwa�? Dopiero co tu trafi�e�!
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OtherCamps (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 2;
	condition	= Info_Diego_OtherCamps_Condition;
	information	= Info_Diego_OtherCamps_Info;
	permanent	= 0;
	description = "A co z pozosta�ymi obozami?";
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
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //A co z pozosta�ymi obozami?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //Te dwa obozy zamieszkuj� szale�cy, kt�rzy pr�buj� si� st�d wydosta� za wszelk� cen�.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //W zachodniej cz�ci kolonii znajduje si� Nowy Ob�z. Rezyduj� tam magowie, kt�rzy my�l�, �e uda si� im wysadzi� Barier�, jak tylko zbior� dostatecznie du�o rudy.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //No i s� jeszcze �wiry z Sekty, na wschodzie. Ich ob�z znajduje si� na �rodku bagna. Oni z kolei czekaj� a� ich b�stwo pomo�e im si� st�d wydosta�.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //Wygl�da na to, �e jeszcze troch� poczekaj�.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //Na twoim miejscu nie traci�bym czasu na zadawanie si� z szale�cami.
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
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //To najwi�kszy i najpot�niejszy z trzech oboz�w. Gomez i jego ludzie kontroluj� kopalni�, a tym samym - ca�y handel ze �wiatem zewn�trznym.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //Raz w miesi�cu kr�l przysy�a nam wszystko, czego potrzebujemy. Mamy staruszka w gar�ci, kapujesz?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //Przysy�a nam bro�, chleb, mi�so... wszystko.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{ 
	AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //Ty te� mo�esz mie� w tym udzia�. Musisz tylko do��czy� do ludzi Gomeza.
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
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //Gomez jest najpot�niejszym z Magnat�w kieruj�cych handlem rud�. To on rz�dzi w Starym Obozie i ma najwi�cej do powiedzenia w ca�ej kolonii.
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
	description = "Za��my, �e chcia�bym do��czy� do jego ludzi. Co powinienem zrobi�?";
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
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //Za��my, �e chcia�bym do��czy� do jego ludzi. Co powinienem zrobi�?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //Przy bramie do zamku znajdziesz cz�owieka imieniem Thorus. Powiedz mu, �e Diego ci� przys�a�.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
	
	Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC, LOG_RUNNING);
	B_LogEntry( CH1_JoinOC,"Aby zosta� przyj�tym w poczet ludzi Gomeza, musz� najpierw porozmawia� z Thorusem.");
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
	description = "Jak dostan� si� do Starego Obozu?";
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
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //Jak dostan� si� do Starego Obozu?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //Pod��aj t� �cie�k�. Stary Ob�z to najbli�sze, mniej wi�cej bezpieczne miejsce jakie napotkasz po drodze.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //Pomi�dzy obozami kr�ci si� wiele gro�nych zwierz�t. Radzi�bym ci postara� si� o jak�� bro�.
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
	description = "Gdzie mog� znale�� or�?";
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
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //Gdzie mog� znale�� or�?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //Rozejrzyj si� troch� w pobli�u Opuszczonej Kopalni. Na pewno znajdziesz tam co� przydatnego.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //Kopalni� nie trudno znale��. Le�y par� metr�w w d� kanionu. 
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
	description = "Rozmawia�em z Thorusem.";
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
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00"); //Rozmawia�em z Thorusem.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //I co ci powiedzia�?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //M�wi, �e b�d� m�g� do��czy� do Starego Obozu, je�li TY uznasz, �e si� nadaj�.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //Widz�, �e czeka mnie dodatkowa robota.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //Zaczynamy od razu?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05"); //Najpierw powiniene� dowiedzie� si� kilku rzeczy.
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
	description = "Co powinienem wiedzie�, �eby mnie przyj�to do Starego Obozu?";
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
	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //Co powinienem wiedzie�, zanim zostan� przyj�ty do Starego Obozu?
	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //Je�li chcesz do nas nale�e�, musisz najpierw zaplusowa� u kilku ludzi.
	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //W Zewn�trznym Pier�cieniu mo�esz spotka� paru wp�ywowych ludzi, g��wnie Cieni. Je�li uda ci si� ich do siebie przekona�, twoje szanse wzrosn�.
	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //P�niej czeka ci� test zaufania.
	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //Opr�cz tego musisz si� jeszcze wiele nauczy�. Im wi�cej nowych umiej�tno�ci zdob�dziesz, tym cenniejszy b�dziesz dla nas.
	
	B_LogEntry( CH1_JoinOC,"Zanim zostan� przyj�ty, musz� zjedna� sobie kilku wp�ywowych ludzi z Zewn�trznego Pier�cienia i przej�� test zaufania.");
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
	description = "Gdzie znajd� te wa�ne osoby?";
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
	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //Gdzie znajd� te wa�ne osoby?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //C�, na jednego z nich w�a�nie patrzysz. Poza tym, jest jeszcze Thorus, jego ju� znasz.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //Co do pozosta�ych... sam musisz ich rozpozna�. Je�li nie jeste� w stanie tego zrobi�, to i tak nie masz tu czego szuka�.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //Najlepiej przejd� si� po Zewn�trznym Pier�cieniu i porozmawiaj z lud�mi.
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
	description = "Kto mo�e mnie czego� nauczy�?";
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
	AI_Output		(hero,self,"Info_Diego_Teachers_15_00"); //Kto mo�e mnie czego� nauczy�?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_01"); //Zacznij od R�czki. To najzr�czniejszy cz�owiek w Obozie.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_02"); //Miej oczy szeroko otwarte, a na pewno znajdziesz wielu ludzi, kt�rzy zechc� ci� czego� nauczy�.
	AI_Output		(hero,self,"Info_Diego_Teachers_15_03"); //Gdzie znajd� R�czk�?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_04"); //Jego chata stoi nieco na uboczu, zaraz przy murach zamku. Id�c st�d udaj si� w stron� areny.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_05"); //Przy zamkowej bramie p�jd� w lewo. To w�a�nie droga do areny.

	if	(Fingers_CanTeach == FALSE)
	{
		Log_CreateTopic (GE_TeacherOC,	LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"R�czka mo�e mnie nauczy� otwierania zamk�w i kradzie�y kieszonkowej. Jego chata znajduje si� nieco na uboczu, niedaleko areny.");
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
	description = "Mo�esz mnie czego� nauczy�?";
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
		B_LogEntry		(GE_TeacherOC,"Diego mo�e mi pom�c w zwi�kszeniu mojej zwinno�ci i si�y.");
		log_diegotrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //Mo�esz mnie czego� nauczy�?
	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //Tak. Mog� ci pokaza�, jak zwi�kszy� swoj� si�� lub zr�czno��.
	
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
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //Jeste� teraz o wiele silniejszy.
	};
	if (Diego_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //Umiesz teraz sprawniej pos�ugiwa� si� �ukiem i kusz�.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Wr�� nied�ugo. Musisz si� jeszcze wiele nauczy�.
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
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_01"); //B�dziesz si� musia� wybra� do Starej Kopalni. Tam znajdziesz faceta imieniem Ian. Od niego dostaniesz list�.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_02"); //To bardzo wa�ny dokument. Zawiera spis wszystkich rzeczy, kt�rych potrzebuj� od nas ludzie z kopalni.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_03"); //Postaramy si�, �eby dostarczono je z nast�pnym konwojem.
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_04"); //�aden problem!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_05"); //W�a�nie �e jest problem. Ta lista nie mo�e wpa�� w r�ce ludzi z Nowego Obozu!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_06"); //Jak ju� powiedzia�em: to bardzo wa�na lista. Je�li nie zawalisz - daleko tu zajdziesz.
	
	Diego_BringList = LOG_RUNNING;
    
    Log_CreateTopic (CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus(CH1_BringList,LOG_RUNNING);
    B_LogEntry    (CH1_BringList,"Diego wys�a� mnie do Starej Kopalni. Tam, od cz�owieka imieniem Ian, dostan� bardzo wa�n� list�, kt�ra pod �adnym pozorem nie mo�e wpa�� w �apy ludzi z Nowego Obozu.");
    
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
	description = "Skoro ta lista jest taka wa�na, my�lisz, �e Ian wyda j� komu� takiemu jak JA?";
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
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_01"); //Skoro ta lista jest taka wa�na, sk�d pewno��, �e Ian wyda j� komu� takiemu jak JA?
	AI_Output (self, hero,"Info_Diego_IanPassword_Info_11_02"); //Bo powiesz mu, �e przys�a� ci� Diego.
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_03"); //Tak zrobi�.
	
	B_LogEntry    (CH1_BringList,"Ian da mi list�, je�li powiem mu, �e przysy�a mnie Diego.");
};

// ----------------------------------------------------------------------------------

INSTANCE Info_Diego_MapToOldMine (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_MapToOldMine_Condition;
	information	= Info_Diego_MapToOldMine_Info;
	permanent	= 0;
	description = "Gdzie znajd� Star� Kopalni�?";
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
	AI_Output (hero, self,"Info_Diego_MapToOldMine_Info_15_00"); //Gdzie znajd� Star� Kopalni�?
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_01"); //Porozmawiaj z Grahamem, to nasz kartograf. Powiedz mu, �e ja ci� przysy�am, i �e potrzebujesz mapy. Z niej dowiesz si�, gdzie le�y kopalnia.
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_02"); //Graham mieszka na lewo od p�nocnej bramy.
	
	B_LogEntry    (CH1_BringList,"Od Grahama dostan� map�. Znajd� go na lewo od p�nocnej bramy.");
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_Diego_BringList_Success (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_BringList_Success_Condition;
	information	= Info_Diego_BringList_Success_Info;
	permanent	= 0;
	description = "Mam list� od Iana.";
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
	AI_Output (hero, self,"Info_Diego_BringList_Success_15_00"); //Mam list� od Iana.
		
	if	Npc_HasItems(hero,TheList)
	{
		B_GiveInvItems	(hero, self, TheList, 1);
		B_LogEntry    	(CH1_BringList,"Diego bardzo si� ucieszy�, gdy wr�czy�em mu list� Iana.");
	}
	else if	Npc_HasItems(hero,TheListNC)
	{
		B_GiveInvItems	(hero, self, TheListNC, 1);
		B_LogEntry    	(CH1_BringList,"Diego ucieszy� si�, gdy wr�czy�em mu list� od Iana. Chyba nie zauwa�y�, �e Lares doda� kilka rzeczy od siebie. A mo�e rzeczywi�cie widzia�em dziwny b�ysk w jego oku?");
	};
	B_UseFakeScroll();
	
	AI_Output (self, hero,"Info_Diego_BringList_Success_11_01"); //Dobra robota! Zaczynasz mi si� naprawd� podoba�!

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
	description = "Jak tam z moj� opini� w Obozie?";
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
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_00"); //Jak tam z moj� opini� w Obozie?
	AI_Output(self, hero,"Info_Diego_JoinAnalyze_11_01"); //Rozmawia�em z kilkoma lud�mi...
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_02"); //I?
	// -----------------------------------------------------------
	Points_OC = 0;
	// -----------------------------------------------------------
	if (Scatty_ChargeKirgo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01"); //Scatty powiedzia� mi, �e pokona�e� Kirgo.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKirgo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //Scatty powiedzia� mi, �e pozwoli�e� Kirgo spu�ci� sobie baty. Chyba nie jest tob� zachwycony.
		Points_OC = Points_OC - 1;
	}
	else if (Scatty_ChargeKirgo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //Scatty powiedzia� mi, �e nie mo�e si� doczeka� na twoj� walk� z Kirgo.
	};
	
	if (Scatty_ChargeKharim == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //Ale by� pod wra�eniem twojej �mia�o�ci. Nie ka�dy mia�by odwag�, �eby wyzwa� Kharima. Cho�by nawet z nim przegra�.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKharim == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //Ale by� pod wielkim wra�eniem twojej walki z Kharimem. Bez przerwy opowiada jaki to z ciebie wojownik. 
		Points_OC = Points_OC + 5;
	}
	else if (Scatty_ChargeKharim == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //I nie mo�e si� doczeka�, kiedy staniesz do walki z Kharimem.
	};
	// -----------------------------------------------------------
	if (Whistler_BuyMySword == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //�wistak opowiedzia� mi o tej historii z Fiskiem... C�, na twoim miejscu wzi��bym t� rud� i da� nog�, ale tak, czy inaczej - �wistak chyba bardzo ci� polubi�.
		Points_OC = Points_OC + 3;
	}
	else if ( (Whistler_BuyMySword == LOG_FAILED) || ( (Whistler_BuyMySword==LOG_RUNNING)&&(Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) ) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //Rozmawia�em ze �wistakiem. Zwia�e� z jego rud�, cwaniaku! Musz� przyzna�, �e �mia�o�ci ci nie brakuje!
		Points_OC = Points_OC + 2;
	}
	else if (Whistler_BuyMySword == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //�wistak czeka na sw�j miecz. Zdecyduj si� wreszcie czy zamierzasz mu go da�, czy nie. W przeciwnym wypadku mo�e pomy�le�, �e zwia�e� z jego rud�!
		
	};
	// -----------------------------------------------------------
	if (Sly_LostNek == LOG_SUCCESS)			
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //Z�y powiedzia� mi, �e znalaz�e� Neka. Wydawa� si� by� bardzo zadowolony.
		Points_OC = Points_OC + 4;
	}
	else if (Sly_LostNek == LOG_RUNNING)					
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //Moim zdaniem Z�y myli si� co do Neka. By� uci��liwy, to fakt, ale nie wierz�, �eby zdezerterowa� do Nowego Obozu.
	};
	// -----------------------------------------------------------
	if (Fingers_Learnt == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //M�wi�em ci ju� o R�czce! On mo�e ci� wiele nauczy�!
	}
	else if (Fingers_Learnt == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //R�czka powiedzia� mi, �e troch� si� ju� nauczy�e�, ale uwa�a, �e m�g�by� by� jeszcze lepszy.
		Points_OC = Points_OC + 3;
	};
	// -----------------------------------------------------------
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //Musz� powa�nie porozmawia� z Dexterem. Wykorzystuje ci� do za�atwiania w�asnych porachunk�w.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //Ale je�li chodzi o nasz test - nie ma �adnych przepis�w. Je�li uda ci si� dokona� czego� TAKIEGO, to b�dzie wielki krok do przodu.
		
	}
	else if (Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //Naprawd� uda�o ci si� zdoby� przepis Kaloma. Dexter jest pod wra�eniem. Ja zreszt� te�!
		Points_OC = Points_OC + 5;
	};
	// -----------------------------------------------------------
	if (Thorus_MordragKo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //Ta sprawa z Mordragiem to nie lada wyzwanie. Niez�y z niego wojownik. Musisz porz�dnie po�wiczy�, je�li chcesz go pokona�.
	}
	else if (Thorus_MordragKo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //Thorus uwa�a, �e przyda si� nam kto� taki jak ty - to dla ciebie niezwykle korzystne.
		Points_OC = Points_OC + 5;
	}
	else if (Thorus_MordragKo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //Thorus dosta� ataku apopleksji. Zreszt� wcale mu si� nie dziwi�. Jak mo�na A� TAK schrzani� robot�?
		Points_OC = Points_OC - 5;						
	}
	// ----WEITER-------------------------------------------------------
	if (Fisk_GetNewHehler == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //Fisk powiedzia� mi, ze go zaskoczy�e�. W ka�dym razie b�dzie po twojej stronie.
		Points_OC = Points_OC + 5;
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //Fisk bardzo si� na ciebie wkurzy�. Na twoim miejscu znalaz�bym kogo� na miejsce Mordraga.
	};
	// -----------------------------------------------------------
	if (points_oc > 15)// runtergesetzt!! // Bei 20 + BringList = Aufnahme
	{
		AI_Output (self, hero,"Info_Diego_Points_11_00"); //Uda�o ci si� zjedna� wystarczaj�co wiele os�b.
		
		if hero.level >= 5
		{
			if (Diego_BringList == LOG_SUCCESS)
			{
				AI_Output (self, hero,"Info_Diego_Points_11_01"); //Przeszed�e� r�wnie� test zaufania. Id� do Thorusa. Ju� go o wszystkim powiadomi�em. Pozwoli ci si� spotka� z Gomezem.
				Diego_GomezAudience = TRUE;
				
				Log_SetTopicStatus(CH1_JoinOC, LOG_SUCCESS);
				B_LogEntry(CH1_JoinOC,"Diego za�atwi� mi audiencj� u Gomeza. Teraz musz� jeszcze zamieni� s�owo z Thorusem. Wkr�tce b�d� jednym z ludzi Gomeza!");
			}
			else
			{
				AI_Output (self, hero,"Info_Diego_Points_11_02"); //Ale musisz jeszcze przej�� test zaufania.
			};
		}
		else
		{
			B_PrintGuildCondition(5);
		};
	}
	else if (points_oc > 10)
	{
		AI_Output (self, hero,"Info_Diego_Points_11_10"); //W sumie - ca�kiem nie�le jak na ��todzioba.
	}
	else if points_oc >= 0
	{
		AI_Output (self, hero,"Info_Diego_Points_11_20"); //Bierz si� do roboty. Przed tob� jeszcze daleka droga, je�li chcesz do czego� doj�� w tym obozie.
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
	description = "Co mam zrobi�, kiedy stan� przed Gomezem?";
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
	AI_Output (hero, self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //Co mam zrobi�, kiedy stan� przed Gomezem?
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //Gomez podejmuje decyzje na podstawie instynktu. Je�li spodoba mu si� twoja g�ba - pozwoli ci zosta�.
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //Od tej pory musisz sobie radzi� sam - postaraj si�! Powodzenia!
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
		AI_Output			(hero, self,"PC_Thief_ARMOR_Info_15_01"); //Mog� dosta� tak� zbroj� jak twoja?
		AI_Output			(self, hero,"PC_Thief_ARMOR_Info_11_02"); //A masz do�� rudy?

		CreateInvItem 		(hero,			STT_ARMOR_H);
		B_GiveInvItems		(hero, self,	ItMinugget,	VALUE_STT_ARMOR_H);
		
		//hier nur ein Text f�r die Bildschirmausgabe
		CreateInvItem		(self, 			ItAmArrow);
		B_GiveInvItems		(self, hero,	ItAmArrow,	1);
		Npc_RemoveInvItem	(hero,			ItAmArrow);
	}
	else
	{
		AI_Output (self, hero,"PC_Thief_ARMOR_Info_11_03"); //Zdob�d� rud�, to dostaniesz zbroj�.
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
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_00"); //Hej! My�la�em, �e ju� nie �yjesz!
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_01"); //Par� razy te� mi si� tak wydawa�o.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_02"); //Wiele si� wydarzy�o od naszego ostatniego spotkania. S�ysza�em, �e mia�e� sw�j wk�ad w wielkie przywo�anie!
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_03"); //Widz�, �e jeste� �wietnie poinformowany.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_04"); //Lepiej ni� my�lisz... Teraz szukasz kamienia ogniskuj�cego?
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_05"); //Tak. Powinien by� gdzie� w pobli�u.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_06"); //Wiem, gdzie go mo�na znale��. Jest tylko jeden problem.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_07"); //Rozumiem. Czego chcesz?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_08"); //Widz�, �e szybko si� uczysz, ale nie o to mi chodzi�o.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_09"); //Nie? Wi�c c� to za problem?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_10"); //O, to ca�e trzy tony problem�w!
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_11"); //Chod�my. Za chwil� sam zobaczysz.

 	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"GuideTroll");

	Log_CreateTopic		(CH3_TrollCanyon,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_RUNNING);
	B_LogEntry		(CH3_TrollCanyon,"W pobli�u p�nocnego kamienia ogniskuj�cego, niespodziewanie natkn��em si� na Diego. Ostrzeg� mnie, �e co� 'wielkiego' czeka na mnie na ko�cu tego kanionu.");
	B_LogEntry		(CH3_TrollCanyon,"Jakim� cudem dowiedzia� si� o moich dzia�aniach w obozie Bractwa oraz o poszukiwaniach kamienia. Dalej p�jdziemy razem.");

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
	
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //Po lewej stronie tego kanionu znajdziesz wej�cie do jaskini, kt�ra prowadzi do kamienia.
	AI_Output (hero, self,"PC_Thief_SHOWFOCUS_Info_15_02"); //Wszystko jasne. Jednak najpierw musimy si� jako� pozby� tamtego bydlaka.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //Spr�buj znale�� jaki� jego s�aby punkt albo inny spos�b na pokonanie tego Trolla.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //�ci�gn� na siebie jego uwag�.

	B_LogEntry		(CH3_TrollCanyon,"Na naszej drodze stan�� ogromny troll. Diego zamierza �ci�gn�� na siebie jego uwag� a ja mam znale�� jaki� s�aby punkt.");

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
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_01"); //To by�o niesamowite. Niez�y jeste�. Teraz mo�esz i�� po kamie� ogniskuj�cy.
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_02"); //Ja dopilnuj�, �eby�my nie mieli ju� wi�cej niemi�ych niespodzianek.

	B_LogEntry		(CH3_TrollCanyon,"Pokonali�my trolla! Teraz mog� zaj�� si� ko�owrotem podnosz�cym krat� przed platform� z kamieniem ogniskuj�cym.");

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
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_01"); //Ko�owr�t chyba si� zaci��!
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_02"); //Czekaj, mo�e uda mi si� go naprawi�!

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
	AI_Output 			(self, hero,"PC_Thief_FIXWHEEL_Info_11_01"); //No, teraz powinno dzia�a�!
	Troll_Wheel = 2;	// Winde repariert!

	B_LogEntry		(CH3_TrollCanyon,"Diego naprawi� ko�owr�t. Teraz nic ju� nie stanie mi na drodze.");

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

	AI_Output 			(self, hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //Id� po kamie�. Zaczekam na ciebie tutaj!

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

	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_01"); //Widz�, �e znalaz�e� kamie�! �wietnie.
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_02"); //Chyba powinienem znowu zajrze� do Starego Obozu. Powodzenia!
	AI_Output			(hero, self,"PC_Thief_GOTIT_Info_15_03"); //Nie daj si� zabi�!
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_04"); //Jeszcze si� zobaczymy.

	B_LogEntry		(CH3_TrollCanyon,"Mam ju� kamie� ogniskuj�cy. Teraz pozosta�o tylko przekona� par� harpii, �e nie zamierzam go pr�dko oddawa�.");
	B_LogEntry		(CH3_TrollCanyon,"Diego wraca do Starego Obozu. Pewnie si� jeszcze spotkamy...");

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

	AI_Output			(self,hero,"Info_Diego_OCWARN_11_01"); //Hej... Ciii... B�d� cicho!
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN))
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_02"); //Cze��, Diego. Rozmawia�em ju� z Miltenem po przeciwnej stronie obozu.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_03"); //Dobrze, zatem wiesz ju�, co si� sta�o.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_04"); //A s�ysza�e� o planowanym ataku na Woln� Kopalni�?
	}
	else
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_05"); //Cze��, Diego. Co ma znaczy� ta ca�a zabawa w chowanego?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_06"); //Nic nie s�ysza�e�?
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_07"); //O czym?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_08"); //O zawaleniu si� Starej Kopalni, zamordowaniu Mag�w Ognia i planach ataku na Woln� Kopalni�.
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_09"); //CO?! O czym ty m�wisz?!
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
	description = "Jak mog�o doj�� do zawalenia si� Starej Kopalni?";
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
	AI_Output		(hero,self,"Info_Diego_OCMINE_15_01"); //Jak mog�o doj�� do zawalenia si� kopalni?
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_02"); //Jeden z Kopaczy, kt�remu uda�o si� uratowa�, powiedzia�, �e kopi�c na najni�szym poziomie trafili na podziemn� rzek�.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_03"); //Kiedy woda wdar�a si� do szyb�w, pop�ka�y podpory i run�a ca�a g�rna cz��.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_04"); //Tylko garstce ludzi uda�o si� wydosta� na powierzchni�.
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
	description = "Co si� sta�o z Magami Ognia?";
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
	AI_Output		(hero,self,"Info_Diego_OCKDF_15_01"); //Co si� sta�o z Magami Ognia?
	AI_Output		(self,hero,"Info_Diego_OCKDF_11_02"); //To d�uga historia.
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
	description = "Napad na Woln� Kopalni�?";
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
	AI_Output		(hero,self,"Info_Diego_OCFM_15_01"); //Napad na Woln� Kopalni�?
	AI_Output		(self,hero,"Info_Diego_OCFM_11_02"); //To d�uga historia.
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
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_01"); //Opowiadaj, to nie pierwsza d�uga historia, kt�rej musia�em wys�ucha�.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_02"); //No dobra. Na szcz�cie by�em w�a�nie w siedzibie Magnat�w, kiedy dotar�y do nich wie�ci o zawaleniu si� kopalni.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_03"); //Kiedy Gomez dowiedzia� si� o wypadku, oszala� z w�ciek�o�ci. Wcale mu si� nie dziwi� - jego autorytet m�g� run�� w ka�dej chwili, razem z kopalni�.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_04"); //Jasne. Kto kontroluje rud�, kontroluje ca�� koloni�!
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_05"); //No w�a�nie. Przecie� bez sta�ego nap�ywu rudy, handel ze �wiatem zewn�trznym padnie raz - dwa.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_06"); //Je�li Gomez nie znajdzie szybko nowego �r�d�a dochodu, ludzie przestan� go s�ucha�.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_07"); //I dlatego postanowi� najecha� Woln� Kopalni�?
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_08"); //C�, obiektywnie rzecz bior�c, to jedyna szansa Gomeza na zachowanie w�adzy.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_09"); //Dwie godziny temu dwa tuziny stra�nik�w wyruszy�y w kierunku Wolnej Kopalni.

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
	description = "To szale�stwo! Musz� uprzedzi� Nowy Ob�z.";
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
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_01"); //To szale�stwo! Musz� uprzedzi� Nowy Ob�z.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_02"); //W takim razie lepiej si� pospiesz! Stra�nicy s� ju� pewnie niedaleko Wolnej Kopalni.
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_03"); //Ale przecie� nie przedr� si� tak �atwo przez obronne fortyfikacje Nowego Obozu!
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_04"); //Wcale nie musz� si� przez nie przedziera�. Kilka miesi�cy temu znale�li�my �cie�k�, kt�ra prowadzi przez g�ry wprost do Wolnej Kopalni. Nikt inny nie wie o jej istnieniu.
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
	description = "Widzia�em Stra�nik�w pilnuj�cych zamkni�tych bram.";
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
	AI_Output		(hero,self,"Info_Diego_OCGUARDS_15_01"); //Widzia�em Stra�nik�w pilnuj�cych zamkni�tych bram.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_02"); //Trzymaj si� z dala od nich. Zaatakuj� ka�dego, kto spr�buje dosta� si� do Obozu.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_03"); //Obawiaj� si� odwetu za napad na Woln� Kopalni�.
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
	description = "Ale co sta�o si� z Magami Ognia?";
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
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_01"); //Ale co sta�o si� z Magami Ognia?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_02"); //Corristo i jego towarzysze byli jedynymi lud�mi w obozie, kt�rzy zachowali zimn� krew.
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_03"); //Zabronili przeprowadzenia ataku i domagali si� pertraktacji z pozosta�ymi obozami.
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_04"); //ZABRONILI Gomezowi przeprowadzenia ataku na Woln� Kopalni�?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_05"); //No w�a�nie. Corristo i jego ludzie byli zbyt zadufani w sobie. Gomez przesta� im ufa� i kaza� ich zdradziecko zamordowa�.
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
	description = "I co teraz zamierzacie zrobi�? To znaczy - ty i Milten?";
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
	AI_Output		(hero,self,"Info_Diego_OCRETREAT_15_01"); //I co teraz zamierzacie zrobi�? To znaczy - ty i Milten?
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_02"); //Zostaniemy tu jeszcze przez jaki� czas. B�dziemy ostrzegali innych przyjaci�, �eby nie wpadli w �apy Stra�nik�w.
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_03"); //Ale m�g�by� co� dla nas zrobi�.
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
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_02"); //Znajd� Lestera i Gorna. Musz� si� dowiedzie� o tym, co si� tutaj wydarzy�o.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_03"); //Powiedz im, �e spotkamy si� we czw�rk� tam gdzie zwykle.
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_04"); //Je�li znajd� ich przed tob�, przeka�� im ostrze�enie i wezwanie na spotkanie.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_05"); //Dzi�ki, przyjacielu. Widz�, �e r�wny z ciebie go��. Id� ju�. Jeszcze si� kiedy� spotkamy.
				
	Log_CreateTopic		(CH4_4Friends,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_4Friends,		LOG_RUNNING);
	B_LogEntry			(CH4_4Friends,		"Wszyscy Magowie Ognia zgin�li. Sytuacja wymyka si� spod kontroli. Diego kaza� mi powiadomi� Lestera i Gorna, �e maj� si� spotka� z nim i z Miltenem w tajemnym miejscu. Chyba nie robi� tego pierwszy raz!"); 
};











































/*

// *******************************************************************

	AI_Output(self,hero,"Info_Diego_Gamestart_11_01"); //Warum haben sie dich hier reingeworfen?
	
	Info_ClearChoices(Info_Diego_Gamestart );
	Info_AddChoice	 (Info_Diego_Gamestart, "Gewitzter �berfall            (+3 Geschicklichkeit)"	,Info_Diego_Gamestart_Choice_Dex);
	Info_AddChoice	 (Info_Diego_Gamestart, "Schl�gerei mit Folgen         (+3 St�rke)"				,Info_Diego_Gamestart_Choice_Str);
	Info_AddChoice	 (Info_Diego_Gamestart, "Wahre Worte zum falschen Mann (+3 Mana)"				,Info_Diego_Gamestart_Choice_Man);
	Info_AddChoice	 (Info_Diego_Gamestart, "Unschuldig                    (+1 auf alle Attribute)"	,Info_Diego_Gamestart_Choice_All);
};
// -------------------------------------------- CHOICES ----------------------------------------------------
FUNC VOID Info_Diego_Gamestart_Choice_Dex()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_00"); //Ich habe ne Ladung Erz verschwinden lassen.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_01"); //Dummerweise hat der Typ bei dem ich sie versteckt habe, lieber die Belohnung f�r mich kassiert, anstatt mit mir das Erz zu teilen.
	PrintScreen	("Geschicklichkeit +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Str()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_00"); //Eine Herausforderung konnte ich noch nie abschlagen. Auch nicht von des K�nigs Gardisten. dummerweise hat der K�nig viele Gardisten.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_01"); //Zu viele.	
	PrintScreen	("St�rke +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Man()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_00"); //Ich sa� in der Kneipe und habe meine Meinung �ber K�nig, Krieg und Steuern gesagt. 
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_01"); //Ich hab' mich nur zu sp�t daran erinnert, dass der, der die Wahrheit spricht, ein schnelles Pferd braucht.
	PrintScreen	("Mana +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]+3;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_All()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_All_15_00"); //Ich bin unschuldig!
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_01"); //Du solltest eins wissen: Hier drin ist niemand unschuldig. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_02"); //Hier findest du M�nner die so ziemlich jedes m�gliche Verbrechen begangen haben. Und einen unschuldigen nehmen die nur zu gerne auseinander. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_03"); //Ich gebe dir nen Tipp, und der ist ganz umsonst. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_04"); //Wenn dich jemand fragt, warum du hier bist, sag ihm, du hast einen Typen gekillt, der dich gefragt hat, warum du hier bist. 
	PrintScreen	("St�rke, Geschick und Mana +1", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] 	= hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] 	= hero.attribute[ATR_STRENGTH]	+1;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]		+1;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]	+1;
	Info_ClearChoices(Info_Diego_Gamestart );


*/
