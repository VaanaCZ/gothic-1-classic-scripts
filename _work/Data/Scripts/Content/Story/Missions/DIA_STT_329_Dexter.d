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
	AI_Output (self,other,"DIA_Dexter_IAmNew_10_00"); //Hej, ty! Sprzedaję bagienne ziele i różne wywary z obozu na bagnach. Może czegoś potrzebujesz?
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
	AI_Output (self,other,"DIA_Dexter_Kraut_10_01"); //Jesteś tu nowy, co? Bagienne ziele można palić. To bardzo odprężające.
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
	description	= "Pokaż mi swoje towary.";
	Trade		= 1;
};                       

FUNC INT DIA_Dexter_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Trade_Info()
{
	AI_Output (other,self,"DIA_Dexter_Trade_15_00"); //Pokaż mi swoje towary.
	AI_Output (self,other,"DIA_Dexter_Trade_10_01"); //Mam tu tylko towar najwyższej jakości...
	
	if	(Dexter_Traded == FALSE)
	{
		Log_CreateTopic(GE_TraderOC, LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Cień o imieniu Dexter handluje bagiennym zielem i napojami z obozu Bractwa.");
	
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
	description	= "Chciałbym dołączyć do Obozu. Chcę zostać Cieniem.";
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
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_00"); //Chciałbym dołączyć do Obozu. Chcę zostać Cieniem.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_01"); //O, i szukasz pewnie okazji, żeby pokazać, na co cię stać, tak?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_02"); //Dobra - możesz wyświadczyć mi pewną przysługę. Jeśli dobrze się spiszesz, wstawię się za tobą u Diego.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_03"); //O co chodzi?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_04"); //W obozie Sekty mieszka mężczyzna imieniem Kalom. To wielka szycha - jeden z Guru całej tej pomylonej zgrai.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_05"); //Kalom jest alchemikiem. Posiada przepis na niezwykle skuteczny napój uzdrawiający.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_06"); //Chciałbym go od niego odkupić, wtedy sam mógłbym zacząć produkcję tego napoju.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_07"); //Ale do Kaloma trudno się zbliżyć, zwłaszcza ludziom z zewnątrz.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_08"); //A czego oczekujesz ode mnie?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_09"); //Te świry z sekty bez przerwy szukają nowych ludzi. Jesteś tu nowy, nikt cię nie zna. Udawaj, że chcesz do nich dołączyć.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_10"); //Kalom jest jednym z Guru, więc to on sprawdza nowych kandydatów. Jeśli uda ci się z nim spotkać, spróbuj zdobyć dla mnie tę recepturę.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_11"); //Czy za nią zapłacisz, czy nie - to już nie moja sprawa.

	Info_ClearChoices(DIA_Dexter_JoinOC);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Dobrze, zobaczę co się da zrobić.",DIA_Dexter_JoinOC_Ok);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"To nie będzie łatwe. Co będę z tego miał?",DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Ok_15_00"); //Dobrze, zobaczę co się da zrobić.
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, Cień z targowiska, kazał mi odwiedzić Guru Kaloma w obozie sekty i zdobyć pewną recepturę.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter poradził mi, żebym udawał sympatyka Sekty Śniącego.");
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch()	
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_HowMuch_15_00"); //To nie będzie łatwe. Co będę z tego miał?
	AI_Output (self,other,"DIA_Dexter_JoinOC_HowMuch_10_01"); //Prędzej czy później Diego zapyta mnie co o tobie sądzę. Zgadnij od czego będzie zależała moja odpowiedź.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Może będę mu musiał zapłacić za tę recepturę. Potrzebuję 50 bryłek rudy.",DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Advance_15_00"); //Może będę mu musiał zapłacić za tę recepturę. Potrzebuję 50 bryłek rudy jako zaliczkę.
	AI_Output (self,other,"DIA_Dexter_JoinOC_Advance_10_01"); //Nie ma mowy.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Nie ma rudy - nie ma receptury!",DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Threat_15_00"); //Nie ma rudy - nie ma receptury!
	AI_Output (self,other,"DIA_Dexter_JoinOC_Threat_10_01"); //No dobra, ale o rudzie porozmawiamy jak będziesz miał recepturę w ręku.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Nie! Albo zapłacisz mi z góry, albo sam sobie idź do obozu na bagnie.",DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00"); //Nie! Albo zapłacisz mi z góry, albo sam sobie idź do obozu na bagnie.
	AI_Output (self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01"); //Jest tu wielu żółtodziobów. Chyba jednak zlecę to zadanie komuś innemu...
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Świetnie! Zapomnijmy o całej sprawie.",DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00"); //Świetnie! Zapomnijmy o całej sprawie.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01"); //Zaraz, powoli! Chciałem tylko zobaczyć, jak daleko się posuniesz... 50 bryłek to trochę dużo jak na żółtodzioba, nie sądzisz?
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02"); //To już lepiej...
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03"); //A niech cię szlag! Masz tu swoje 50 bryłek! Tylko nie próbuj mnie wykiwać, mały!
	
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Dexter, Cień z targowiska, kazał mi odwiedzić Guru Kaloma w obozie sekty i zdobyć pewną recepturę.");
	B_LogEntry    (CH1_KalomsRecipe,"Dexter poradził mi, żebym udawał sympatyka Sekty Śniącego.");
	
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
	description	= "Gdzie jest ten cały obóz na bagnie?";
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
	AI_Output (other,self,"DIA_Dexter_WhereST_15_00"); //Gdzie jest ten cały obóz na bagnie?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_01"); //Wyjdź z Zewnętrznego Pierścienia przez południową bramę, potem skieruj się na wschód. Najlepiej będzie, jak weźmiesz mapę...
	
	if (Npc_HasItems(self,ItWrWorldmap) >0)														//Björn
		{																						//Björn
			AI_Output (self,other,"DIA_Dexter_WhereST_10_02"); //Mam tu jedną. Kosztuje 50 bryłek...
		};																						//Björn
	
	AI_Output (other,self,"DIA_Dexter_WhereST_15_02"); //Południowa brama to ta przy zawalonej wieży, tak?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_03"); //Dokładnie.
	
	if	!Dexter_PsiCamp
	{
		B_LogEntry    (CH1_KalomsRecipe,"Obóz sekty leży na wschód od Starego Obozu.");
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
	description	= "Mam dla ciebie recepturę, o którą prosiłeś!";
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
	AI_Output (other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00"); //Mam dla ciebie recepturę, o którą prosiłeś!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01"); //To świetnie! Pokaż ją!
	
	B_UseFakeScroll();
	
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02"); //Znakomicie! Teraz sam będę mógł wytwarzać napój uzdrawiający.
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03"); //Równy z ciebie chłop! Wspomnę o tobie Diego.
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //Weź to. To w nagrodę...
	
	CreateInvItems (other,itminugget,50);
	
	B_GiveInvItems (other, self, KalomsRecipe, 1);
	
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter był pod wrażeniem. Na pewno wspomni Diego o moich dokonaniach.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Dexter był pod wrażeniem, ale co z tego? I tak nie mogę już zostać Cieniem.");
	};
	B_GiveXP (XP_DexterKalom);
};

