// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grim_Exit (C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 999;
	condition	= DIA_Grim_Exit_Condition;
	information	= DIA_Grim_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grim_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				FALLE (Schutzgeld)
// **************************************************

INSTANCE DIA_Grim_Falle (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Falle_Condition;
	information		= DIA_Grim_Falle_Info;
	permanent		= 0;
	important 		= 1;
};

FUNC INT DIA_Grim_Falle_Condition()
{	
	if	(Grim_ProtectionBully == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_Falle_Info()
{
	AI_Output (self, other,"DIA_Grim_Falle_06_00"); //Hej, ty! Czy to nie ty chcesz do��czy� do naszego obozu?
	AI_Output (other, self,"DIA_Grim_Falle_15_01"); //A je�li chc�?
	AI_Output (self, other,"DIA_Grim_Falle_06_02"); //M�g�bym ci pom�c...
	AI_Output (other, self,"DIA_Grim_Falle_15_03"); //Jak?
	AI_Output (self, other,"DIA_Grim_Falle_06_04"); //Na zewn�trz Obozu siedzi dw�ch go�ci. Jeden z nich ukrad� co� cennego Magnatom. To cenny amulet, kt�ry mia� nam zosta� przys�any z ostatnim transportem ze �wiata zewn�trznego.
	AI_Output (self, other,"DIA_Grim_Falle_06_05"); //Kt�ry� z nich powinien mie� ten amulet przy sobie. Je�li zaatakujemy ich razem, powinno nam si� uda�. Sam raczej nie dam rady. Co ty na to?
		
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"To nie dla mnie. Poszukaj sobie kogo� innego.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"A co si� stanie, gdy ju� zdob�dziemy amulet?",DIA_Grim_Falle_HowShare);
	Info_AddChoice		(DIA_Grim_Falle,"P�jd� z tob�.",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output (other, self,"DIA_Grim_Falle_Deny_15_00"); //To nie dla mnie. Poszukaj sobie kogo� innego.
	AI_Output (self, other,"DIA_Grim_Falle_Deny_06_01"); //Z takim podej�ciem d�ugo tu miejsca nie zagrzejesz. Daj mi zna�, gdyby� zmieni� zdanie!
	Info_ClearChoices	(DIA_Grim_Falle );
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output (other, self,"DIA_Grim_Falle_HowShare_15_00"); //A co si� stanie, gdy ju� zdob�dziemy amulet?
	AI_Output (self, other,"DIA_Grim_Falle_HowShare_06_01"); //To proste. Zwr�c� go Magnatom i odbior� nagrod�. Przy okazji powiem im, �e mi pomog�e�. Ta wiadomo�� na pewno dotrze do Gomeza! 
	
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"To nie dla mnie. Poszukaj sobie kogo� innego.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"Nie! Albo dzielimy si� po po�owie, albo baw si� sam!",DIA_Grim_Falle_HalfHalf);
	Info_AddChoice		(DIA_Grim_Falle,"P�jd� z tob�.",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output (other, self,"DIA_Grim_Falle_HalfHalf_15_00"); //Nie! Albo dzielimy si� po po�owie, albo baw si� sam!
	AI_Output (self, other,"DIA_Grim_Falle_HalfHalf_06_01"); //Niech b�dzie, p� na p�! Nagrody wystarczy dla nas dw�ch! To jak? Mog� na ciebie liczy�?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output (other, self,"DIA_Grim_Falle_Accepr_15_00"); //P�jd� z tob�.
	AI_Output (self, other,"DIA_Grim_Falle_Accepr_06_01"); //�wietnie, daj mi zna�, gdy b�dziesz got�w.
	Info_ClearChoices	(DIA_Grim_Falle );
};

// **************************************************
// 				Bereit f�r Falle
// **************************************************

INSTANCE DIA_Grim_ReadyToGo (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_ReadyToGo_Condition;
	information		= DIA_Grim_ReadyToGo_Info;
	permanent		= 0;
	description		= "Jestem gotowy. Chod�my po ten amulet.";
};

FUNC INT DIA_Grim_ReadyToGo_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Falle))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_ReadyToGo_Info()
{
	AI_Output (other, self,"DIA_Grim_ReadyToGo_15_00"); //Jestem gotowy. Chod�my po ten amulet.
	AI_Output (self, other,"DIA_Grim_ReadyToGo_06_01"); //Zatem do dzie�a!
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"GUIDE");
};	

// **************************************************
//				OC DRAUSSEN ANGEKOMMEN
// **************************************************

instance  DIA_Grim_AtOCdraussen(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 3;
	condition	= DIA_Grim_AtOCdraussen_Condition;
	information	= DIA_Grim_AtOCdraussen_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Grim_AtOCdraussen_Condition()
{
	if 	( Npc_KnowsInfo(hero,DIA_Grim_ReadyToGo)) && (Npc_GetDistToWp (hero,"OC_ROUND_22_CF_2_MOVEMENT") < 500 ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_Grim_AtOCdraussen_Info()
{
	AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_00"); //Oto jeste�my - daleko od twojego kumpla, Diego.
	if ( ((Npc_GetDistToNpc(self,Bu520)<1000)&&(!Npc_IsDead(Bu520))) || ((Npc_GetDistToNpc(self,Bu534)<1000)&&(!Npc_IsDead(Bu534))) )
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_01"); //Mamy ci przekaza� pozdrowienia od Bloodwyna!
	}
	else
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_02"); //Mam ci przekaza� pozdrowienia od Bloodwyna!
	};

	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self,"START");
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
	
	var C_NPC Bu520; Bu520 = Hlp_GetNpc(Vlk_520_Buddler);
	var C_NPC Bu534; Bu534 = Hlp_GetNpc(Vlk_534_Buddler);
	
	if ( (Npc_GetDistToNpc(self,Bu520)<1000) && (!Npc_IsDead(Bu520)) )
	{
		Npc_SetTarget(Bu520,other);
		AI_StartState(Bu520,ZS_ATTACK,1,"");
	};
	
	if ( (Npc_GetDistToNpc(self,Bu534)<1000) && (!Npc_IsDead(Bu534)) )
	{
		Npc_SetTarget(Bu534,other);
		AI_StartState(Bu534,ZS_ATTACK,1,"");
	};
};

// **************************************************
// 				NACH Falle
// **************************************************

INSTANCE DIA_Grim_NACHFalle (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_NACHFalle_Condition;
	information		= DIA_Grim_NACHFalle_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Grim_NACHFalle_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Grim_AtOCdraussen)) && (Npc_GetDistToNpc(self,other)<ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_NACHFalle_Info()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_15_01"); //Ty g�upcze, chcia�e� mnie zwabi� w pu�apk�...
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_02"); //Hej, stary! Jedziemy na tym samym w�zku! Ja te� nie zamierzam ry� pod ziemi� do ko�ca moich dni!
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_03"); //Dlatego wype�niam polecenia Stra�nik�w. Ja te� chc� do��czy� do Obozu!
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_04"); //Zreszt� sam zas�u�y�e� na ca�y ten bajzel. Dlaczego zadar�e� ze Stra�nikami?
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_05"); //Osobi�cie nic do ciebie nie mam. To jak b�dzie - wojna czy pok�j.
	
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	Info_AddChoice		(DIA_Grim_NACHFalle,"Wojna.",DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice		(DIA_Grim_NACHFalle,"Pok�j.",DIA_Grim_NACHFalle_Frieden);
};


func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00"); //Nie mam nic przeciwko wojnie!
	AI_Output (self, other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01"); //Stary, mam ju� tego do��...
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	AI_StopProcessInfos	(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Frieden_15_00"); //Niech b�dzie pok�j.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_01"); //Ciesz� si�, �e mogli�my to sobie wyja�ni�. Najlepiej zapomnijmy o ca�ej sprawie. Od tej chwili jestem po twojej stronie.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_02"); //Gdyby� jeszcze kiedy� wpad� w tarapaty, mo�esz na mnie liczy�. W ko�cu jestem ci co� winien.
	Info_ClearChoices	(DIA_Grim_NACHFalle );

	Npc_SetPermAttitude(self,ATT_FRIENDLY);
};

// **************************************************
// 				Hallo
// **************************************************
	var int FirstOver;				
// **************************************************

INSTANCE DIA_Grim_Hallo (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 1;
	condition		= DIA_Grim_Hallo_Condition;
	information		= DIA_Grim_Hallo_Info;
	permanent		= 0;
	description		= "Jestem tu nowy.";
};

FUNC INT DIA_Grim_Hallo_Condition()
{	
	if (Grim_ProtectionBully==TRUE)
	{
		FirstOver = TRUE;
	};
	
	if (FirstOver == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_Hallo_Info()
{
	AI_Output (other, self,"DIA_Grim_Hallo_15_00"); //Jestem tu nowy.
	AI_Output (self, other,"DIA_Grim_Hallo_06_01"); //��todzi�b, co? Nazywam si� Grim - te� jestem tu od niedawna. Wrzucili mnie nied�ugo przed tob�.
};

// **************************************************
// 						Leben
// **************************************************

INSTANCE DIA_Grim_Leben (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_Leben_Condition;
	information		= DIA_Grim_Leben_Info;
	permanent		= 0;
	description		= "Jak wygl�da �ycie w kolonii?";
};

FUNC INT DIA_Grim_Leben_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Leben_Info()
{
	AI_Output (other, self,"DIA_Grim_Leben_15_00"); //Jak wygl�da �ycie w kolonii?
	AI_Output (self, other,"DIA_Grim_Leben_06_01"); //Nie jest �le, je�li zap�acisz Stra�nikom za ochron�.
};

// **************************************************
// 						Aufnahme
// **************************************************

INSTANCE DIA_Grim_Aufnahme (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 3;
	condition		= DIA_Grim_Aufnahme_Condition;
	information		= DIA_Grim_Aufnahme_Info;
	permanent		= 0;
	description		= "Co mam zrobi�, je�li chc� zosta� przyj�ty do tego obozu?";
};

FUNC INT DIA_Grim_Aufnahme_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Grim_Aufnahme_15_00"); //Co mam zrobi�, je�li chc� zosta� przyj�ty do tego obozu?
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_01"); //Na pocz�tek musisz zosta� Cieniem. W tym celu poszukaj sobie jakiego� wp�ywowego opiekuna. Kogo�, kto wyja�ni ci co w trawie piszczy i wska�e ci w�a�ciw� drog�.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_02"); //Na twoim miejscu trzyma�bym si� blisko Diego - ja tak zrobi�em i nie �a�uj�!
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_03"); //On podda ci� testowi zaufania - dla ka�dego wygl�da on troch� inaczej. No i musisz wype�nia� jeszcze zadania zlecane ci przez Cienie.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_04"); //Je�li ci si� uda, zostaniesz jednym z nas.
};

// **************************************************
// 						Wie weit bist DU?
// **************************************************
var int Grim_Tests;
// **************************************************

INSTANCE DIA_Grim_HowFarAreYou (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 4;
	condition		= DIA_Grim_HowFarAreYou_Condition;
	information		= DIA_Grim_HowFarAreYou_Info;
	permanent		= 1;
	description		= "A ty, jak sobie radzisz?";
};

FUNC INT DIA_Grim_HowFarAreYou_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme) && Npc_KnowsInfo(hero,Info_Diego_Rules))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_HowFarAreYou_Info()
{
	AI_Output (other, self,"DIA_Grim_HowFarAreYou_15_00"); //A ty, jak sobie radzisz?
	AI_Output (self, other,"DIA_Grim_HowFarAreYou_06_01"); //Rozmawia�em ju� z Dexterem, Z�ym i R�czk�. To jedni najbardziej wp�ywowych ludzi w Zewn�trznym Pier�cieniu.
	
	if	!Grim_Tests
	{
		B_LogEntry( CH1_JoinOC,"Dexter, Z�y i R�czka nale�� do wp�ywowych Cieni.");
		Grim_Tests = TRUE;
	};
};

// **************************************************
// 						Leben
// **************************************************

INSTANCE DIA_Grim_YourPDV (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 5;
	condition		= DIA_Grim_YourPDV_Condition;
	information		= DIA_Grim_YourPDV_Info;
	permanent		= 0;
	description		= "A jak wygl�da� TW�J test zaufania?";
};

FUNC INT DIA_Grim_YourPDV_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Grim_Aufnahme))
	{
		return 1;
	};
};

FUNC VOID DIA_Grim_YourPDV_Info()
{
	AI_Output (other, self,"DIA_Grim_YourPDV_15_00"); //A jak wygl�da� TW�J test zaufania?
	AI_Output (self, other,"DIA_Grim_YourPDV_06_01"); //Tego nie mog� ci powiedzie�. O takich rzeczach lepiej nie m�wi� g�o�no!
};



//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMO
//---------------------------------------------------------------------
instance  DIA_Grim_INEXTREMO(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 1;
	condition	= DIA_Grim_INEXTREMO_Condition;
	information	= DIA_Grim_INEXTREMO_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Grim_INEXTREMO_Condition()
{
	if	((Kapitel == 2) && (InExtremoPlaying == true))
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Grim_INEXTREMO_Info()
{
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_01"); //Hej, s�ysza�e� ju� wie�ci?
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_02"); //S� tu In Extremo! W�a�nie weszli na scen�!
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_03"); //Pospiesz si�, albo przegapisz koncert!

	Npc_ExchangeRoutine	(self,	"InExtremo");

	AI_StopProcessInfos(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info INEXTREMOAWAY
//---------------------------------------------------------------------
instance  DIA_Grim_INEXTREMOAWAY(C_INFO)
{
	npc			= Vlk_580_Grim;
	nr			= 1;
	condition	= DIA_Grim_INEXTREMOAWAY_Condition;
	information	= DIA_Grim_INEXTREMOAWAY_Info;
	permanent	= 0;
	important 	= 0;
	description = "Gdzie s� In Extremo?";
};                       

FUNC int  DIA_Grim_INEXTREMOAWAY_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Grim_INEXTREMO)
	&&	(Kapitel == 3) 
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Grim_INEXTREMOAWAY_Info()
{
	AI_Output			(hero, self,"DIA_Grim_INEXTREMOAWAY_15_01"); //Gdzie s� In Extremo?
	AI_Output			(self, hero,"DIA_Grim_INEXTREMOAWAY_06_02"); //Pojechali dalej. Szkoda. Zd��y�em si� przyzwyczai� do imprez pod scen�.

	AI_StopProcessInfos	(self);
};

