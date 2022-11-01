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
	AI_Output (self, other,"DIA_Grim_Falle_06_00"); //Hej, ty! Nejseš ty ten, co se chce přidat k táboru?
	AI_Output (other, self,"DIA_Grim_Falle_15_01"); //A co když jo?
	AI_Output (self, other,"DIA_Grim_Falle_06_02"); //Mohl bych ti pomoci.
	AI_Output (other, self,"DIA_Grim_Falle_15_03"); //A jak?
	AI_Output (self, other,"DIA_Grim_Falle_06_04"); //Před táborem posedávají dva chlapíci a jeden z nich něco ukradl Rudobaronům. Je to znamenitý amulet, který měl přijet s posledním konvojem.
	AI_Output (self, other,"DIA_Grim_Falle_06_05"); //Jeden z nich by ten amulet měl mít pořád ještě u sebe. Jestliže je napadneme společně, mohlo by se nám to podařit - sám bych to nedokázal. Co ty na to?
		
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"Nemám zájem - budeš se muset poohlédnout po někom jiném.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"Co se stane, až budeme mít ten amulet?",DIA_Grim_Falle_HowShare);
	Info_AddChoice		(DIA_Grim_Falle,"Můžeš!",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output (other, self,"DIA_Grim_Falle_Deny_15_00"); //Nemám zájem - budeš se muset poohlédnout po někom jiném.
	AI_Output (self, other,"DIA_Grim_Falle_Deny_06_01"); //S tímhle přístupem daleko nedojdeš -  řekni mi, kdyby sis to rozmyslel.
	Info_ClearChoices	(DIA_Grim_Falle );
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output (other, self,"DIA_Grim_Falle_HowShare_15_00"); //Co se stane, až budeme mít ten amulet?
	AI_Output (self, other,"DIA_Grim_Falle_HowShare_06_01"); //To je snadné! Vrátím ho a dostanu odměnu. Řeknu jim, že jsi mi pomohl. Pak budeš mít u Gomeze jistě oko... 
	
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"Nemám zájem - budeš se muset poohlédnout po někom jiném.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"Ne! Buď to bude půl na půl, nebo si to udělej sám!",DIA_Grim_Falle_HalfHalf);
	Info_AddChoice		(DIA_Grim_Falle,"Můžeš!",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output (other, self,"DIA_Grim_Falle_HalfHalf_15_00"); //Ne! Buď to bude půl na půl, nebo si to udělej sám!
	AI_Output (self, other,"DIA_Grim_Falle_HalfHalf_06_01"); //Dobře, dobře, teda půl na půl. Doufám, že to bude pro oba dost. Tak - můžu s tebou počítat?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output (other, self,"DIA_Grim_Falle_Accepr_15_00"); //Můžeš!
	AI_Output (self, other,"DIA_Grim_Falle_Accepr_06_01"); //Dobrá, řekni mi, kdy můžeme začít!
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
	description		= "Jsem připravený jít s tebou - pojďme pro ten amulet!";
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
	AI_Output (other, self,"DIA_Grim_ReadyToGo_15_00"); //Jsem připravený jít s tebou - pojďme pro ten amulet!
	AI_Output (self, other,"DIA_Grim_ReadyToGo_06_01"); //Dobře, pojďme do toho...
	
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
	AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_00"); //Tak, jsme tady - daleko od našeho přítele Diega.
	if ( ((Npc_GetDistToNpc(self,Bu520)<1000)&&(!Npc_IsDead(Bu520))) || ((Npc_GetDistToNpc(self,Bu534)<1000)&&(!Npc_IsDead(Bu534))) )
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_01"); //Máme vyřídit pozdravy od Bloodwyna!
	}
	else
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_02"); //Mám vyřídit pozdravy od Bloodwyna!
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
	AI_Output (other, self,"DIA_Grim_NACHFalle_15_01"); //Ty idiote, chtěl jsi mě chytit do pasti...
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_02"); //Hej, člověče! Jsme na stejné lodi! Nechce se mi rubat v dolech.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_03"); //Udělám, co mi řeknou stráže, pak mě přijmou dříve.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_04"); //Měl bych TĚ praštit po tlamě a zarazit do země. Proč jsi proboha začal bojovat se strážemi?
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_05"); //Já proti tobě osobně nic nemám. Tak co myslíš - mír nebo válka?
	
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	Info_AddChoice		(DIA_Grim_NACHFalle,"Do toho.",DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice		(DIA_Grim_NACHFalle,"Mír.",DIA_Grim_NACHFalle_Frieden);
};


func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00"); //Já to vidím jako válku.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01"); //Och, člověče, dostal jsi mě...
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	AI_StopProcessInfos	(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Frieden_15_00"); //Mír zní líp.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_01"); //Jsem rád, že jsme si to vyříkali z očí do očí. Zapomeňme na to. Od teďka jsem na tvojí straně.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_02"); //Kdybys měl ještě někdy nějaké problémy, můžeš se mnou počítat - konečně, něco ti dlužím.
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
	description		= "Jsem tady nový.";
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
	AI_Output (other, self,"DIA_Grim_Hallo_15_00"); //Jsem tady nový.
	AI_Output (self, other,"DIA_Grim_Hallo_06_01"); //Právě jsi přišel, viď? Já jsem Grim - nejsem tady ještě dlouho. Strčili mě sem se skupinou právě před tebou.
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
	description		= "Jak se tady žije?";
};

FUNC INT DIA_Grim_Leben_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Leben_Info()
{
	AI_Output (other, self,"DIA_Grim_Leben_15_00"); //Jaký je tady život?
	AI_Output (self, other,"DIA_Grim_Leben_06_01"); //Docela to ujde, pokud platíš strážím peníze za ochranu.
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
	description		= "Co musím udělat, aby mě v táboře uznávali?";
};

FUNC INT DIA_Grim_Aufnahme_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Grim_Aufnahme_15_00"); //Co musím udělat, když budu chtít, aby mě v táboře uznávali?
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_01"); //Tak, nejdřív se musíš stát Stínem. Proto si musíš najít někoho, kdo tě bude podporovat. Někoho, kdo ti všechno vysvětlí a bude za tebou stát.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_02"); //Být tebou, zkusil bych se dostat k Diegovi - já to taky tak udělal - je docela dobrý.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_03"); //Udělá s tebou zkoušku poctivosti - ta je pro každého jiná. Pak splníš pár menších úkolů od ostatních Stínů.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_04"); //Když se ti to podaří, budeš patřit k nám.
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
	description		= "A - jak daleko ses dostal se svými zkouškami?";
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
	AI_Output (other, self,"DIA_Grim_HowFarAreYou_15_00"); //A - jak daleko ses dostal se svými zkouškami?
	AI_Output (self, other,"DIA_Grim_HowFarAreYou_06_01"); //Už jsem mluvil s Dexterem, Slyem a Fingersem. Ti patří k nejdůležitějším lidem v táboře.
	
	if	!Grim_Tests
	{
		B_LogEntry( CH1_JoinOC,"Dexter, Sly a Shadow jsou vlivní Stínové.");
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
	description		= "Jaká byla TVOJE zkouška poctivosti?";
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
	AI_Output (other, self,"DIA_Grim_YourPDV_15_00"); //Jaká byla TVOJE zkouška poctivosti?
	AI_Output (self, other,"DIA_Grim_YourPDV_06_01"); //To ti, člověče, nemůžu říci. O věcech, jako je tahle, nesmíš mluvit.
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
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_01"); //Hej, už si slyšel novinky?
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_02"); //Jsou tady In Extremo. Jsou právě na tribuně.
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_03"); //Pospěš, jinak tu štaci propásneme!

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
	description = "Kde jsou In Extremo?";
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
	AI_Output			(hero, self,"DIA_Grim_INEXTREMOAWAY_15_01"); //Kde jsou In Extremo?
	AI_Output			(self, hero,"DIA_Grim_INEXTREMOAWAY_06_02"); //Už jsou pryč. To je škoda, obvykle bývám po večerech u tribuny.

	AI_StopProcessInfos	(self);
};

