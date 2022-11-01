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
	AI_Output (self, other,"DIA_Grim_Falle_06_00"); //Hej, ty! Czy to nie ty chcesz dołączyć do naszego obozu?
	AI_Output (other, self,"DIA_Grim_Falle_15_01"); //A jeśli chcę?
	AI_Output (self, other,"DIA_Grim_Falle_06_02"); //Mógłbym ci pomóc...
	AI_Output (other, self,"DIA_Grim_Falle_15_03"); //Jak?
	AI_Output (self, other,"DIA_Grim_Falle_06_04"); //Na zewnątrz Obozu siedzi dwóch gości. Jeden z nich ukradł coś cennego Magnatom. To cenny amulet, który miał nam zostać przysłany z ostatnim transportem ze świata zewnętrznego.
	AI_Output (self, other,"DIA_Grim_Falle_06_05"); //Któryś z nich powinien mieć ten amulet przy sobie. Jeśli zaatakujemy ich razem, powinno nam się udać. Sam raczej nie dam rady. Co ty na to?
		
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"To nie dla mnie. Poszukaj sobie kogoś innego.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"A co się stanie, gdy już zdobędziemy amulet?",DIA_Grim_Falle_HowShare);
	Info_AddChoice		(DIA_Grim_Falle,"Pójdę z tobą.",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output (other, self,"DIA_Grim_Falle_Deny_15_00"); //To nie dla mnie. Poszukaj sobie kogoś innego.
	AI_Output (self, other,"DIA_Grim_Falle_Deny_06_01"); //Z takim podejściem długo tu miejsca nie zagrzejesz. Daj mi znać, gdybyś zmienił zdanie!
	Info_ClearChoices	(DIA_Grim_Falle );
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output (other, self,"DIA_Grim_Falle_HowShare_15_00"); //A co się stanie, gdy już zdobędziemy amulet?
	AI_Output (self, other,"DIA_Grim_Falle_HowShare_06_01"); //To proste. Zwrócę go Magnatom i odbiorę nagrodę. Przy okazji powiem im, że mi pomogłeś. Ta wiadomość na pewno dotrze do Gomeza! 
	
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"To nie dla mnie. Poszukaj sobie kogoś innego.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"Nie! Albo dzielimy się po połowie, albo baw się sam!",DIA_Grim_Falle_HalfHalf);
	Info_AddChoice		(DIA_Grim_Falle,"Pójdę z tobą.",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output (other, self,"DIA_Grim_Falle_HalfHalf_15_00"); //Nie! Albo dzielimy się po połowie, albo baw się sam!
	AI_Output (self, other,"DIA_Grim_Falle_HalfHalf_06_01"); //Niech będzie, pół na pół! Nagrody wystarczy dla nas dwóch! To jak? Mogę na ciebie liczyć?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output (other, self,"DIA_Grim_Falle_Accepr_15_00"); //Pójdę z tobą.
	AI_Output (self, other,"DIA_Grim_Falle_Accepr_06_01"); //Świetnie, daj mi znać, gdy będziesz gotów.
	Info_ClearChoices	(DIA_Grim_Falle );
};

// **************************************************
// 				Bereit für Falle
// **************************************************

INSTANCE DIA_Grim_ReadyToGo (C_INFO)
{
	npc				= Vlk_580_Grim;
	nr				= 2;
	condition		= DIA_Grim_ReadyToGo_Condition;
	information		= DIA_Grim_ReadyToGo_Info;
	permanent		= 0;
	description		= "Jestem gotowy. Chodźmy po ten amulet.";
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
	AI_Output (other, self,"DIA_Grim_ReadyToGo_15_00"); //Jestem gotowy. Chodźmy po ten amulet.
	AI_Output (self, other,"DIA_Grim_ReadyToGo_06_01"); //Zatem do dzieła!
	
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
	AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_00"); //Oto jesteśmy - daleko od twojego kumpla, Diego.
	if ( ((Npc_GetDistToNpc(self,Bu520)<1000)&&(!Npc_IsDead(Bu520))) || ((Npc_GetDistToNpc(self,Bu534)<1000)&&(!Npc_IsDead(Bu534))) )
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_01"); //Mamy ci przekazać pozdrowienia od Bloodwyna!
	}
	else
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_02"); //Mam ci przekazać pozdrowienia od Bloodwyna!
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
	AI_Output (other, self,"DIA_Grim_NACHFalle_15_01"); //Ty głupcze, chciałeś mnie zwabić w pułapkę...
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_02"); //Hej, stary! Jedziemy na tym samym wózku! Ja też nie zamierzam ryć pod ziemią do końca moich dni!
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_03"); //Dlatego wypełniam polecenia Strażników. Ja też chcę dołączyć do Obozu!
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_04"); //Zresztą sam zasłużyłeś na cały ten bajzel. Dlaczego zadarłeś ze Strażnikami?
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_05"); //Osobiście nic do ciebie nie mam. To jak będzie - wojna czy pokój.
	
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	Info_AddChoice		(DIA_Grim_NACHFalle,"Wojna.",DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice		(DIA_Grim_NACHFalle,"Pokój.",DIA_Grim_NACHFalle_Frieden);
};


func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00"); //Nie mam nic przeciwko wojnie!
	AI_Output (self, other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01"); //Stary, mam już tego dość...
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	AI_StopProcessInfos	(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Frieden_15_00"); //Niech będzie pokój.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_01"); //Cieszę się, że mogliśmy to sobie wyjaśnić. Najlepiej zapomnijmy o całej sprawie. Od tej chwili jestem po twojej stronie.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_02"); //Gdybyś jeszcze kiedyś wpadł w tarapaty, możesz na mnie liczyć. W końcu jestem ci coś winien.
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
	AI_Output (self, other,"DIA_Grim_Hallo_06_01"); //Żółtodziób, co? Nazywam się Grim - też jestem tu od niedawna. Wrzucili mnie niedługo przed tobą.
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
	description		= "Jak wygląda życie w kolonii?";
};

FUNC INT DIA_Grim_Leben_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Leben_Info()
{
	AI_Output (other, self,"DIA_Grim_Leben_15_00"); //Jak wygląda życie w kolonii?
	AI_Output (self, other,"DIA_Grim_Leben_06_01"); //Nie jest źle, jeśli zapłacisz Strażnikom za ochronę.
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
	description		= "Co mam zrobić, jeśli chcę zostać przyjęty do tego obozu?";
};

FUNC INT DIA_Grim_Aufnahme_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Grim_Aufnahme_15_00"); //Co mam zrobić, jeśli chcę zostać przyjęty do tego obozu?
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_01"); //Na początek musisz zostać Cieniem. W tym celu poszukaj sobie jakiegoś wpływowego opiekuna. Kogoś, kto wyjaśni ci co w trawie piszczy i wskaże ci właściwą drogę.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_02"); //Na twoim miejscu trzymałbym się blisko Diego - ja tak zrobiłem i nie żałuję!
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_03"); //On podda cię testowi zaufania - dla każdego wygląda on trochę inaczej. No i musisz wypełniać jeszcze zadania zlecane ci przez Cienie.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_04"); //Jeśli ci się uda, zostaniesz jednym z nas.
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
	AI_Output (self, other,"DIA_Grim_HowFarAreYou_06_01"); //Rozmawiałem już z Dexterem, Złym i Rączką. To jedni najbardziej wpływowych ludzi w Zewnętrznym Pierścieniu.
	
	if	!Grim_Tests
	{
		B_LogEntry( CH1_JoinOC,"Dexter, Zły i Rączka należą do wpływowych Cieni.");
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
	description		= "A jak wyglądał TWÓJ test zaufania?";
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
	AI_Output (other, self,"DIA_Grim_YourPDV_15_00"); //A jak wyglądał TWÓJ test zaufania?
	AI_Output (self, other,"DIA_Grim_YourPDV_06_01"); //Tego nie mogę ci powiedzieć. O takich rzeczach lepiej nie mówić głośno!
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
	return FALSE;
};

FUNC VOID  DIA_Grim_INEXTREMO_Info()
{
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_01"); //Hej, słyszałeś już wieści?
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_02"); //Są tu In Extremo! Właśnie weszli na scenę!
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_03"); //Pospiesz się, albo przegapisz koncert!

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
	description = "Gdzie są In Extremo?";
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
	AI_Output			(hero, self,"DIA_Grim_INEXTREMOAWAY_15_01"); //Gdzie są In Extremo?
	AI_Output			(self, hero,"DIA_Grim_INEXTREMOAWAY_06_02"); //Pojechali dalej. Szkoda. Zdążyłem się przyzwyczaić do imprez pod sceną.

	AI_StopProcessInfos	(self);
};

