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
	AI_Output (self, other,"DIA_Grim_Falle_06_00"); //Hej, ty! Czy to nie ty chcesz do³¹czyæ do naszego obozu?
	AI_Output (other, self,"DIA_Grim_Falle_15_01"); //A jeœli chcê?
	AI_Output (self, other,"DIA_Grim_Falle_06_02"); //Móg³bym ci pomóc...
	AI_Output (other, self,"DIA_Grim_Falle_15_03"); //Jak?
	AI_Output (self, other,"DIA_Grim_Falle_06_04"); //Na zewn¹trz Obozu siedzi dwóch goœci. Jeden z nich ukrad³ coœ cennego Magnatom. To cenny amulet, który mia³ nam zostaæ przys³any z ostatnim transportem ze œwiata zewnêtrznego.
	AI_Output (self, other,"DIA_Grim_Falle_06_05"); //Któryœ z nich powinien mieæ ten amulet przy sobie. Jeœli zaatakujemy ich razem, powinno nam siê udaæ. Sam raczej nie dam rady. Co ty na to?
		
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"To nie dla mnie. Poszukaj sobie kogoœ innego.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"A co siê stanie, gdy ju¿ zdobêdziemy amulet?",DIA_Grim_Falle_HowShare);
	Info_AddChoice		(DIA_Grim_Falle,"Pójdê z tob¹.",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output (other, self,"DIA_Grim_Falle_Deny_15_00"); //To nie dla mnie. Poszukaj sobie kogoœ innego.
	AI_Output (self, other,"DIA_Grim_Falle_Deny_06_01"); //Z takim podejœciem d³ugo tu miejsca nie zagrzejesz. Daj mi znaæ, gdybyœ zmieni³ zdanie!
	Info_ClearChoices	(DIA_Grim_Falle );
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output (other, self,"DIA_Grim_Falle_HowShare_15_00"); //A co siê stanie, gdy ju¿ zdobêdziemy amulet?
	AI_Output (self, other,"DIA_Grim_Falle_HowShare_06_01"); //To proste. Zwrócê go Magnatom i odbiorê nagrodê. Przy okazji powiem im, ¿e mi pomog³eœ. Ta wiadomoœæ na pewno dotrze do Gomeza! 
	
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"To nie dla mnie. Poszukaj sobie kogoœ innego.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"Nie! Albo dzielimy siê po po³owie, albo baw siê sam!",DIA_Grim_Falle_HalfHalf);
	Info_AddChoice		(DIA_Grim_Falle,"Pójdê z tob¹.",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output (other, self,"DIA_Grim_Falle_HalfHalf_15_00"); //Nie! Albo dzielimy siê po po³owie, albo baw siê sam!
	AI_Output (self, other,"DIA_Grim_Falle_HalfHalf_06_01"); //Niech bêdzie, pó³ na pó³! Nagrody wystarczy dla nas dwóch! To jak? Mogê na ciebie liczyæ?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output (other, self,"DIA_Grim_Falle_Accepr_15_00"); //Pójdê z tob¹.
	AI_Output (self, other,"DIA_Grim_Falle_Accepr_06_01"); //Œwietnie, daj mi znaæ, gdy bêdziesz gotów.
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
	description		= "Jestem gotowy. ChodŸmy po ten amulet.";
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
	AI_Output (other, self,"DIA_Grim_ReadyToGo_15_00"); //Jestem gotowy. ChodŸmy po ten amulet.
	AI_Output (self, other,"DIA_Grim_ReadyToGo_06_01"); //Zatem do dzie³a!
	
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
	AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_00"); //Oto jesteœmy - daleko od twojego kumpla, Diego.
	if ( ((Npc_GetDistToNpc(self,Bu520)<1000)&&(!Npc_IsDead(Bu520))) || ((Npc_GetDistToNpc(self,Bu534)<1000)&&(!Npc_IsDead(Bu534))) )
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_01"); //Mamy ci przekazaæ pozdrowienia od Bloodwyna!
	}
	else
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_02"); //Mam ci przekazaæ pozdrowienia od Bloodwyna!
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
	AI_Output (other, self,"DIA_Grim_NACHFalle_15_01"); //Ty g³upcze, chcia³eœ mnie zwabiæ w pu³apkê...
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_02"); //Hej, stary! Jedziemy na tym samym wózku! Ja te¿ nie zamierzam ryæ pod ziemi¹ do koñca moich dni!
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_03"); //Dlatego wype³niam polecenia Stra¿ników. Ja te¿ chcê do³¹czyæ do Obozu!
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_04"); //Zreszt¹ sam zas³u¿y³eœ na ca³y ten bajzel. Dlaczego zadar³eœ ze Stra¿nikami?
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_05"); //Osobiœcie nic do ciebie nie mam. To jak bêdzie - wojna czy pokój.
	
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	Info_AddChoice		(DIA_Grim_NACHFalle,"Wojna.",DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice		(DIA_Grim_NACHFalle,"Pokój.",DIA_Grim_NACHFalle_Frieden);
};


func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00"); //Nie mam nic przeciwko wojnie!
	AI_Output (self, other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01"); //Stary, mam ju¿ tego doœæ...
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	AI_StopProcessInfos	(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Frieden_15_00"); //Niech bêdzie pokój.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_01"); //Cieszê siê, ¿e mogliœmy to sobie wyjaœniæ. Najlepiej zapomnijmy o ca³ej sprawie. Od tej chwili jestem po twojej stronie.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_02"); //Gdybyœ jeszcze kiedyœ wpad³ w tarapaty, mo¿esz na mnie liczyæ. W koñcu jestem ci coœ winien.
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
	AI_Output (self, other,"DIA_Grim_Hallo_06_01"); //¯ó³todziób, co? Nazywam siê Grim - te¿ jestem tu od niedawna. Wrzucili mnie nied³ugo przed tob¹.
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
	description		= "Jak wygl¹da ¿ycie w kolonii?";
};

FUNC INT DIA_Grim_Leben_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Leben_Info()
{
	AI_Output (other, self,"DIA_Grim_Leben_15_00"); //Jak wygl¹da ¿ycie w kolonii?
	AI_Output (self, other,"DIA_Grim_Leben_06_01"); //Nie jest Ÿle, jeœli zap³acisz Stra¿nikom za ochronê.
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
	description		= "Co mam zrobiæ, jeœli chcê zostaæ przyjêty do tego obozu?";
};

FUNC INT DIA_Grim_Aufnahme_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Grim_Aufnahme_15_00"); //Co mam zrobiæ, jeœli chcê zostaæ przyjêty do tego obozu?
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_01"); //Na pocz¹tek musisz zostaæ Cieniem. W tym celu poszukaj sobie jakiegoœ wp³ywowego opiekuna. Kogoœ, kto wyjaœni ci co w trawie piszczy i wska¿e ci w³aœciw¹ drogê.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_02"); //Na twoim miejscu trzyma³bym siê blisko Diego - ja tak zrobi³em i nie ¿a³ujê!
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_03"); //On podda ciê testowi zaufania - dla ka¿dego wygl¹da on trochê inaczej. No i musisz wype³niaæ jeszcze zadania zlecane ci przez Cienie.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_04"); //Jeœli ci siê uda, zostaniesz jednym z nas.
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
	AI_Output (self, other,"DIA_Grim_HowFarAreYou_06_01"); //Rozmawia³em ju¿ z Dexterem, Z³ym i R¹czk¹. To jedni najbardziej wp³ywowych ludzi w Zewnêtrznym Pierœcieniu.
	
	if	!Grim_Tests
	{
		B_LogEntry( CH1_JoinOC,"Dexter, Z³y i R¹czka nale¿¹ do wp³ywowych Cieni.");
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
	description		= "A jak wygl¹da³ TWÓJ test zaufania?";
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
	AI_Output (other, self,"DIA_Grim_YourPDV_15_00"); //A jak wygl¹da³ TWÓJ test zaufania?
	AI_Output (self, other,"DIA_Grim_YourPDV_06_01"); //Tego nie mogê ci powiedzieæ. O takich rzeczach lepiej nie mówiæ g³oœno!
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
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_01"); //Hej, s³ysza³eœ ju¿ wieœci?
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_02"); //S¹ tu In Extremo! W³aœnie weszli na scenê!
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_03"); //Pospiesz siê, albo przegapisz koncert!

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
	description = "Gdzie s¹ In Extremo?";
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
	AI_Output			(hero, self,"DIA_Grim_INEXTREMOAWAY_15_01"); //Gdzie s¹ In Extremo?
	AI_Output			(self, hero,"DIA_Grim_INEXTREMOAWAY_06_02"); //Pojechali dalej. Szkoda. Zd¹¿y³em siê przyzwyczaiæ do imprez pod scen¹.

	AI_StopProcessInfos	(self);
};

