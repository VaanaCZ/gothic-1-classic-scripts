// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dexter_Exit (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 999;
	condition	= DIA_Dexter_Exit_Condition;
	information	= DIA_Dexter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dexter_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begrüssung
// **************************************************

INSTANCE DIA_Dexter_First (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_First_Condition;
	information	= DIA_Dexter_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Dexter_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_First_Info()
{
	AI_Output (self,other,"DIA_Dexter_IAmNew_10_00"); //Hej, ty! Sprzedajê bagienne ziele i ró¿ne wywary z obozu na bagnach. Mo¿e czegoœ potrzebujesz?
};

// **************************************************
// 					Kraut
// **************************************************

INSTANCE DIA_Dexter_Kraut (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_Kraut_Condition;
	information	= DIA_Dexter_Kraut_Info;
	permanent	= 0;
	description	= "Co to jest 'bagienne ziele'?";
};                       

FUNC INT DIA_Dexter_Kraut_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Kraut_Info()
{
	AI_Output (other,self,"DIA_Dexter_Kraut_15_00"); //Co to jest "bagienne ziele"?
	AI_Output (self,other,"DIA_Dexter_Kraut_10_01"); //Jesteœ tu nowy, co? Bagienne ziele mo¿na paliæ. To bardzo odprê¿aj¹ce.
};

// **************************************************
// 					TRADE
// **************************************************

// **************************************************

INSTANCE DIA_Dexter_Trade (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_Trade_Condition;
	information	= DIA_Dexter_Trade_Info;
	permanent	= 1;
	description	= "Poka¿ mi swoje towary.";
	Trade		= 1;
};                       

FUNC INT DIA_Dexter_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Trade_Info()
{
	AI_Output (other,self,"DIA_Dexter_Trade_15_00"); //Poka¿ mi swoje towary.
	AI_Output (self,other,"DIA_Dexter_Trade_10_01"); //Mam tu tylko towar najwy¿szej jakoœci...
	
	if	(Dexter_Traded == FALSE)
	{
		Log_CreateTopic(GE_TraderOC, LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Cieñ o imieniu Dexter handluje bagiennym zielem i napojami z obozu Bractwa.");
	
		Dexter_Traded = TRUE;
	};
};

// **************************************************
// 					JOIN OC
// **************************************************
	var int Dexter_GetKalomsRecipe;
// **************************************************

INSTANCE DIA_Dexter_JoinOC (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_JoinOC_Condition;
	information	= DIA_Dexter_JoinOC_Info;
	permanent	= 0;
	description	= "Chcia³bym do³¹czyæ do Obozu. Chcê zostaæ Cieniem.";
};                       

FUNC INT DIA_Dexter_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Dexter_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_00"); //Chcia³bym do³¹czyæ do Obozu. Chcê zostaæ Cieniem.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_01"); //O, i szukasz pewnie okazji, ¿eby pokazaæ, na co ciê staæ, tak?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_02"); //Dobra - mo¿esz wyœwiadczyæ mi pewn¹ przys³ugê. Jeœli dobrze siê spiszesz, wstawiê siê za tob¹ u Diego.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_03"); //O co chodzi?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_04"); //W obozie Sekty mieszka mê¿czyzna imieniem Kalom. To wielka szycha - jeden z Guru ca³ej tej pomylonej zgrai.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_05"); //Kalom jest alchemikiem. Posiada przepis na niezwykle skuteczny napój uzdrawiaj¹cy.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_06"); //Chcia³bym go od niego odkupiæ, wtedy sam móg³bym zacz¹æ produkcjê tego napoju.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_07"); //Ale do Kaloma trudno siê zbli¿yæ, zw³aszcza ludziom z zewn¹trz.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_08"); //A czego oczekujesz ode mnie?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_09"); //Te œwiry z sekty bez przerwy szukaj¹ nowych ludzi. Jesteœ tu nowy, nikt ciê nie zna. Udawaj, ¿e chcesz do nich do³¹czyæ.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_10"); //Kalom jest jednym z Guru, wiêc to on sprawdza nowych kandydatów. Jeœli uda ci siê z nim spotkaæ, spróbuj zdobyæ dla mnie tê recepturê.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_11"); //Czy za ni¹ zap³acisz, czy nie - to ju¿ nie moja sprawa.

	Info_ClearChoices(DIA_Dexter_JoinOC);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Dobrze, zobaczê co siê da zrobiæ.",DIA_Dexter_JoinOC_Ok);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"To nie bêdzie ³atwe. Co bêdê z tego mia³?",DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Ok_15_00"); //Dobrze, zobaczê co siê da zrobiæ.
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, Cieñ z targowiska, kaza³ mi odwiedziæ Guru Kaloma w obozie sekty i zdobyæ pewn¹ recepturê.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter poradzi³ mi, ¿ebym udawa³ sympatyka Sekty Œni¹cego.");
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch()	
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_HowMuch_15_00"); //To nie bêdzie ³atwe. Co bêdê z tego mia³?
	AI_Output (self,other,"DIA_Dexter_JoinOC_HowMuch_10_01"); //Prêdzej czy póŸniej Diego zapyta mnie co o tobie s¹dzê. Zgadnij od czego bêdzie zale¿a³a moja odpowiedŸ.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Mo¿e bêdê mu musia³ zap³aciæ za tê recepturê. Potrzebujê 50 bry³ek rudy.",DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Advance_15_00"); //Mo¿e bêdê mu musia³ zap³aciæ za tê recepturê. Potrzebujê 50 bry³ek rudy jako zaliczkê.
	AI_Output (self,other,"DIA_Dexter_JoinOC_Advance_10_01"); //Nie ma mowy.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Nie ma rudy - nie ma receptury!",DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Threat_15_00"); //Nie ma rudy - nie ma receptury!
	AI_Output (self,other,"DIA_Dexter_JoinOC_Threat_10_01"); //No dobra, ale o rudzie porozmawiamy jak bêdziesz mia³ recepturê w rêku.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Nie! Albo zap³acisz mi z góry, albo sam sobie idŸ do obozu na bagnie.",DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00"); //Nie! Albo zap³acisz mi z góry, albo sam sobie idŸ do obozu na bagnie.
	AI_Output (self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01"); //Jest tu wielu ¿ó³todziobów. Chyba jednak zlecê to zadanie komuœ innemu...
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Œwietnie! Zapomnijmy o ca³ej sprawie.",DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00"); //Œwietnie! Zapomnijmy o ca³ej sprawie.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01"); //Zaraz, powoli! Chcia³em tylko zobaczyæ, jak daleko siê posuniesz... 50 bry³ek to trochê du¿o jak na ¿ó³todzioba, nie s¹dzisz?
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02"); //To ju¿ lepiej...
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03"); //A niech ciê szlag! Masz tu swoje 50 bry³ek! Tylko nie próbuj mnie wykiwaæ, ma³y!
	
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, Cieñ z targowiska, kaza³ mi odwiedziæ Guru Kaloma w obozie sekty i zdobyæ pewn¹ recepturê.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter poradzi³ mi, ¿ebym udawa³ sympatyka Sekty Œni¹cego.");
	
	CreateInvItems(self, itminugget, 50);
	B_GiveInvItems(self, other, itminugget, 50);
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

// **************************************************
// 					Where ST
// **************************************************
var int Dexter_PsiCamp;
// **************************************************

INSTANCE DIA_Dexter_WhereST (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_WhereST_Condition;
	information	= DIA_Dexter_WhereST_Info;
	permanent	= 1;
	description	= "Gdzie jest ten ca³y obóz na bagnie?";
};                       

FUNC INT DIA_Dexter_WhereST_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_WhereST_Info()
{
	AI_Output (other,self,"DIA_Dexter_WhereST_15_00"); //Gdzie jest ten ca³y obóz na bagnie?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_01"); //WyjdŸ z Zewnêtrznego Pierœcienia przez po³udniow¹ bramê, potem skieruj siê na wschód. Najlepiej bêdzie, jak weŸmiesz mapê...
	
	if (Npc_HasItems(self,ItWrWorldmap) >0)														//Björn
		{																						//Björn
			AI_Output (self,other,"DIA_Dexter_WhereST_10_02"); //Mam tu jedn¹. Kosztuje 50 bry³ek...
		};																						//Björn
	
	AI_Output (other,self,"DIA_Dexter_WhereST_15_02"); //Po³udniowa brama to ta przy zawalonej wie¿y, tak?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_03"); //Dok³adnie.
	
	if	!Dexter_PsiCamp
	{
		B_LogEntry    (CH1_KalomsRecipe,"Obóz sekty le¿y na wschód od Starego Obozu.");
		Dexter_PsiCamp = TRUE;
	};
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Dexter_KalomsRecipeSuccess (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_KalomsRecipeSuccess_Condition;
	information	= DIA_Dexter_KalomsRecipeSuccess_Info;
	permanent	= 1;
	description	= "Mam dla ciebie recepturê, o któr¹ prosi³eœ!";
};                       

FUNC INT DIA_Dexter_KalomsRecipeSuccess_Condition()
{
	if ( (Dexter_GetKalomsRecipe == LOG_RUNNING) && (Npc_HasItems (other, KalomsRecipe) > 0) )
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_KalomsRecipeSuccess_Info()
{
	AI_Output (other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00"); //Mam dla ciebie recepturê, o któr¹ prosi³eœ!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01"); //To œwietnie! Poka¿ j¹!
	
	B_UseFakeScroll();
	
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02"); //Znakomicie! Teraz sam bêdê móg³ wytwarzaæ napój uzdrawiaj¹cy.
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03"); //Równy z ciebie ch³op! Wspomnê o tobie Diego.
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //WeŸ to. To w nagrodê...
	
	CreateInvItems (other,itminugget,50);
	
	B_GiveInvItems (other, self, KalomsRecipe, 1);
	
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter by³ pod wra¿eniem. Na pewno wspomni Diego o moich dokonaniach.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter by³ pod wra¿eniem, ale co z tego? I tak nie mogê ju¿ zostaæ Cieniem.");
	};
	B_GiveXP (XP_DexterKalom);
};

