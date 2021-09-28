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
	AI_Output (self, other,"DIA_Grim_Falle_06_00"); //Hej, ty! Nejse� ty ten, co se chce p�idat k t�boru?
	AI_Output (other, self,"DIA_Grim_Falle_15_01"); //A co kdy� jo?
	AI_Output (self, other,"DIA_Grim_Falle_06_02"); //Mohl bych ti pomoci.
	AI_Output (other, self,"DIA_Grim_Falle_15_03"); //A jak?
	AI_Output (self, other,"DIA_Grim_Falle_06_04"); //P�ed t�borem posed�vaj� dva chlap�ci a jeden z nich n�co ukradl Rudobaron�m. Je to znamenit� amulet, kter� m�l p�ijet s posledn�m konvojem.
	AI_Output (self, other,"DIA_Grim_Falle_06_05"); //Jeden z nich by ten amulet m�l m�t po��d je�t� u sebe. Jestli�e je napadneme spole�n�, mohlo by se n�m to poda�it - s�m bych to nedok�zal. Co ty na to?
		
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"Nem�m z�jem - bude� se muset poohl�dnout po n�kom jin�m.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"Co se stane, a� budeme m�t ten amulet?",DIA_Grim_Falle_HowShare);
	Info_AddChoice		(DIA_Grim_Falle,"M��e�!",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_Deny()
{
	AI_Output (other, self,"DIA_Grim_Falle_Deny_15_00"); //Nem�m z�jem - bude� se muset poohl�dnout po n�kom jin�m.
	AI_Output (self, other,"DIA_Grim_Falle_Deny_06_01"); //S t�mhle p��stupem daleko nedojde� -  �ekni mi, kdyby sis to rozmyslel.
	Info_ClearChoices	(DIA_Grim_Falle );
};

func void DIA_Grim_Falle_HowShare()
{
	AI_Output (other, self,"DIA_Grim_Falle_HowShare_15_00"); //Co se stane, a� budeme m�t ten amulet?
	AI_Output (self, other,"DIA_Grim_Falle_HowShare_06_01"); //To je snadn�! Vr�t�m ho a dostanu odm�nu. �eknu jim, �e jsi mi pomohl. Pak bude� m�t u Gomeze jist� oko... 
	
	Info_ClearChoices	(DIA_Grim_Falle );
	Info_AddChoice		(DIA_Grim_Falle,"Nem�m z�jem - bude� se muset poohl�dnout po n�kom jin�m.",DIA_Grim_Falle_Deny);
	Info_AddChoice		(DIA_Grim_Falle,"Ne! Bu� to bude p�l na p�l, nebo si to ud�lej s�m!",DIA_Grim_Falle_HalfHalf);
	Info_AddChoice		(DIA_Grim_Falle,"M��e�!",DIA_Grim_Falle_Accepr);
};

func void DIA_Grim_Falle_HalfHalf()
{
	AI_Output (other, self,"DIA_Grim_Falle_HalfHalf_15_00"); //Ne! Bu� to bude p�l na p�l, nebo si to ud�lej s�m!
	AI_Output (self, other,"DIA_Grim_Falle_HalfHalf_06_01"); //Dob�e, dob�e, teda p�l na p�l. Douf�m, �e to bude pro oba dost. Tak - m��u s tebou po��tat?
};

func void DIA_Grim_Falle_Accepr()
{
	AI_Output (other, self,"DIA_Grim_Falle_Accepr_15_00"); //M��e�!
	AI_Output (self, other,"DIA_Grim_Falle_Accepr_06_01"); //Dobr�, �ekni mi, kdy m��eme za��t!
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
	description		= "Jsem p�ipraven� j�t s tebou - poj�me pro ten amulet!";
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
	AI_Output (other, self,"DIA_Grim_ReadyToGo_15_00"); //Jsem p�ipraven� j�t s tebou - poj�me pro ten amulet!
	AI_Output (self, other,"DIA_Grim_ReadyToGo_06_01"); //Dob�e, poj�me do toho...
	
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
	AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_00"); //Tak, jsme tady - daleko od na�eho p��tele Diega.
	if ( ((Npc_GetDistToNpc(self,Bu520)<1000)&&(!Npc_IsDead(Bu520))) || ((Npc_GetDistToNpc(self,Bu534)<1000)&&(!Npc_IsDead(Bu534))) )
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_01"); //M�me vy��dit pozdravy od Bloodwyna!
	}
	else
	{
		AI_Output (self, other,"DIA_Grim_AtOCdraussen_06_02"); //M�m vy��dit pozdravy od Bloodwyna!
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
	AI_Output (other, self,"DIA_Grim_NACHFalle_15_01"); //Ty idiote, cht�l jsi m� chytit do pasti...
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_02"); //Hej, �lov��e! Jsme na stejn� lodi! Nechce se mi rubat v dolech.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_03"); //Ud�l�m, co mi �eknou str�e, pak m� p�ijmou d��ve.
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_04"); //M�l bych T� pra�tit po tlam� a zarazit do zem�. Pro� jsi proboha za�al bojovat se str�emi?
	AI_Output (self, other,"DIA_Grim_NACHFalle_06_05"); //J� proti tob� osobn� nic nem�m. Tak co mysl� - m�r nebo v�lka?
	
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	Info_AddChoice		(DIA_Grim_NACHFalle,"Do toho.",DIA_Grim_NACHFalle_Weiterpruegeln);
	Info_AddChoice		(DIA_Grim_NACHFalle,"M�r.",DIA_Grim_NACHFalle_Frieden);
};


func void DIA_Grim_NACHFalle_Weiterpruegeln()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Weiterpruegeln_15_00"); //J� to vid�m jako v�lku.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Weiterpruegeln_06_01"); //Och, �lov��e, dostal jsi m�...
	Info_ClearChoices	(DIA_Grim_NACHFalle );
	AI_StopProcessInfos	(self);

	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

func void DIA_Grim_NACHFalle_Frieden()
{
	AI_Output (other, self,"DIA_Grim_NACHFalle_Frieden_15_00"); //M�r zn� l�p.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_01"); //Jsem r�d, �e jsme si to vy��kali z o�� do o��. Zapome�me na to. Od te�ka jsem na tvoj� stran�.
	AI_Output (self, other,"DIA_Grim_NACHFalle_Frieden_06_02"); //Kdybys m�l je�t� n�kdy n�jak� probl�my, m��e� se mnou po��tat - kone�n�, n�co ti dlu��m.
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
	description		= "Jsem tady nov�.";
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
	AI_Output (other, self,"DIA_Grim_Hallo_15_00"); //Jsem tady nov�.
	AI_Output (self, other,"DIA_Grim_Hallo_06_01"); //Pr�v� jsi p�i�el, vi�? J� jsem Grim - nejsem tady je�t� dlouho. Str�ili m� sem se skupinou pr�v� p�ed tebou.
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
	description		= "Jak se tady �ije?";
};

FUNC INT DIA_Grim_Leben_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Leben_Info()
{
	AI_Output (other, self,"DIA_Grim_Leben_15_00"); //Jak� je tady �ivot?
	AI_Output (self, other,"DIA_Grim_Leben_06_01"); //Docela to ujde, pokud plat� str��m pen�ze za ochranu.
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
	description		= "Co mus�m ud�lat, aby m� v t�bo�e uzn�vali?";
};

FUNC INT DIA_Grim_Aufnahme_Condition()
{	
	return 1;
};

FUNC VOID DIA_Grim_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Grim_Aufnahme_15_00"); //Co mus�m ud�lat, kdy� budu cht�t, aby m� v t�bo�e uzn�vali?
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_01"); //Tak, nejd��v se mus� st�t St�nem. Proto si mus� naj�t n�koho, kdo t� bude podporovat. N�koho, kdo ti v�echno vysv�tl� a bude za tebou st�t.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_02"); //B�t tebou, zkusil bych se dostat k Diegovi - j� to taky tak ud�lal - je docela dobr�.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_03"); //Ud�l� s tebou zkou�ku poctivosti - ta je pro ka�d�ho jin�. Pak spln� p�r men��ch �kol� od ostatn�ch St�n�.
	AI_Output (self, other,"DIA_Grim_Aufnahme_06_04"); //Kdy� se ti to poda��, bude� pat�it k n�m.
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
	description		= "A - jak daleko ses dostal se sv�mi zkou�kami?";
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
	AI_Output (other, self,"DIA_Grim_HowFarAreYou_15_00"); //A - jak daleko ses dostal se sv�mi zkou�kami?
	AI_Output (self, other,"DIA_Grim_HowFarAreYou_06_01"); //U� jsem mluvil s Dexterem, Slyem a Fingersem. Ti pat�� k nejd�le�it�j��m lidem v t�bo�e.
	
	if	!Grim_Tests
	{
		B_LogEntry( CH1_JoinOC,"Dexter, Sly a Shadow jsou vlivn� St�nov�.");
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
	description		= "Jak� byla TVOJE zkou�ka poctivosti?";
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
	AI_Output (other, self,"DIA_Grim_YourPDV_15_00"); //Jak� byla TVOJE zkou�ka poctivosti?
	AI_Output (self, other,"DIA_Grim_YourPDV_06_01"); //To ti, �lov��e, nem��u ��ci. O v�cech, jako je tahle, nesm� mluvit.
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
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_01"); //Hej, u� si sly�el novinky?
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_02"); //Jsou tady In Extremo. Jsou pr�v� na tribun�.
	AI_Output		(self, other,"DIA_Grim_INEXTREMO_06_03"); //Posp�, jinak tu �taci prop�sneme!

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
	AI_Output			(self, hero,"DIA_Grim_INEXTREMOAWAY_06_02"); //U� jsou pry�. To je �koda, obvykle b�v�m po ve�erech u tribuny.

	AI_StopProcessInfos	(self);
};

