// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Whistler_Exit (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 999;
	condition	= DIA_Whistler_Exit_Condition;
	information	= DIA_Whistler_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Whistler_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Whistler_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Ich bin neu hier 
// **************************************************

INSTANCE DIA_Whistler_IAmNew (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_IAmNew_Condition;
	information	= DIA_Whistler_IAmNew_Info;
	permanent	= 0;
	description = "Cześć! Jestem tu nowy!";
};                       

FUNC INT DIA_Whistler_IAmNew_Condition()
{	
	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Whistler_IAmNew_Info()
{
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_00"); //Cześć! Jestem tu nowy!
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_01"); //Czego chcesz?
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_02"); //Chciałbym zostać jednym z was - chcę zostać członkiem Obozu.
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_03"); //Szukasz ludzi, którzy cię poprą, co?
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_04"); //Jeśli chcesz, żebym zarekomendował cię u Diego, musisz coś dla mnie zrobić.
};

// **************************************************
// 					 Welcher Gefallen
// **************************************************
	var int Whistler_BuyMySword;
	var int Whistler_BuyMySword_Day;
// **************************************************

INSTANCE DIA_Whistler_Favour (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_Favour_Condition;
	information	= DIA_Whistler_Favour_Info;
	permanent	= 0;
	description = "Co mam dla ciebie zrobić?";
};                       

FUNC INT DIA_Whistler_Favour_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_Whistler_IAmNew))
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Favour_Info()
{
	AI_Output (other,self,"DIA_Whistler_Favour_15_00"); //Co mam dla ciebie zrobić?
	AI_Output (self,other,"DIA_Whistler_Favour_11_01"); //Chcę jedną z broni, którą ma na składzie Fisk. To jeden z handlarzy na targowisku.
	AI_Output (self,other,"DIA_Whistler_Favour_11_02"); //Ale on nie chce mi jej sprzedać. To pewien szczególnie pięknie zdobiony miecz.
	AI_Output (self,other,"DIA_Whistler_Favour_11_03"); //Dam ci 100 bryłek rudy, za które kupisz dla mnie ten miecz. Tylko nie mów mu, że ja cię przysłałem.

	Info_ClearChoices(DIA_Whistler_Favour);
	Info_AddChoice	 (DIA_Whistler_Favour,"Dobrze. Daj mi 100 bryłek, a ja się wszystkim zajmę.",DIA_Whistler_Favour_Ok);
	Info_AddChoice	 (DIA_Whistler_Favour,"Przyszło ci do głowy, że mógłbym po prostu uciec z twoją rudą?",DIA_Whistler_Favour_OreAway);
	Info_AddChoice	 (DIA_Whistler_Favour,"Dlaczego Fisk nie chce ci sprzedać tej broni?",DIA_Whistler_Favour_WhyNotSell);
};

func void DIA_Whistler_Favour_Ok()
{
	AI_Output (other,self,"DIA_Whistler_Favour_Ok_15_00"); //Dobrze. Daj mi 100 bryłek, a ja się wszystkim zajmę.
	AI_Output (self,other,"DIA_Whistler_Favour_Ok_11_01"); //Masz. Tylko nie marudź za długo!
	
	Whistler_BuyMySword = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"Świstak pomoże mi, jeśli porozmawiam z Fiskiem i kupię od niego miecz dla Świstaka. Dał mi nawet 100 bryłek rudy.");
	
	var C_NPC fisk; fisk = Hlp_GetNpc(Stt_311_Fisk);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget, 100);
	
	Whistler_BuyMySword_Day = Wld_GetDay();
	
	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
	AI_Output (other,self,"DIA_Whistler_Favour_OreAway_15_00"); //Przyszło ci do głowy, że mógłbym po prostu uciec z twoją rudą?
	AI_Output (self,other,"DIA_Whistler_Favour_OreAway_11_01"); //Nie zapominaj, że to jest niewielka kolonia. Prędzej czy później bym cię znalazł!
};

func void DIA_Whistler_Favour_WhyNotSell()
{
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //Dlaczego Fisk nie chce ci sprzedać tej broni?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //Trochę się posprzeczaliśmy.
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //I?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //I to wszystko, co powinieneś wiedzieć!
};

// **************************************************
// 					 RUNNING 110
// **************************************************

INSTANCE DIA_Whistler_Running110 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 4;
	condition	= DIA_Whistler_Running110_Condition;
	information	= DIA_Whistler_Running110_Info;
	permanent	= 0;
	description = "Fisk żąda teraz 110 bryłek rudy za ten miecz.";
};                       

FUNC INT DIA_Whistler_Running110_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Fisk_SCknows110 == TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_Running110_Info()
{
	AI_Output (other,self,"DIA_Whistler_Running110_15_00"); //Fisk żąda teraz 110 bryłek rudy za ten miecz.
	AI_Output (self,other,"DIA_Whistler_Running110_11_01"); //I pewnie mam ci teraz dać dodatkowe 10 bryłek...
	AI_Output (other,self,"DIA_Whistler_Running110_15_02"); //Myślałem, że zależy ci na tym mieczu.
	AI_Output (self,other,"DIA_Whistler_Running110_11_03"); //Masz. Tylko się pospiesz!
	CreateInvItems  (self,itminugget,10);
	B_GiveInvItems  (self, hero, itminugget, 10);
};	

// **************************************************
// 				RUNNING - PayBack
// **************************************************

INSTANCE DIA_Whistler_RunningPayBack (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 5;
	condition	= DIA_Whistler_RunningPayBack_Condition;
	information	= DIA_Whistler_RunningPayBack_Info;
	permanent	= 1;
	description = "Nie mogę zdobyć tego miecza. Zwracam ci twoją rudę.";
};                       

FUNC INT DIA_Whistler_RunningPayBack_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_RunningPayBack_Info()
{
	AI_Output (other,self,"DIA_Whistler_RunningPayBack_15_00"); //Nie mogę zdobyć tego miecza. Zwracam ci twoją rudę.
	
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_01"); //Ty idioto! Nie potrzebujemy tu takich jak ty! Zejdź mi z oczu!
		B_GiveInvItems (hero, self, itminugget, 100);
		Whistler_BuyMySword = LOG_OBSOLETE;
		
		B_LogEntry (CH1_JoinOC,"Zawaliłem sprawę. Świstak nigdy już nie dostanie tego miecza.");
		
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_02"); //Ale ja tu nie widzę żadnych 100 bryłek. Radzę ci, żeby szybko się znalazły, bo inaczej...
		AI_StopProcessInfos(self);
	};
};	




// **************************************************
// 					 Too late
// **************************************************

INSTANCE DIA_Whistler_MySword_TooLate (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 1;
	condition	= DIA_Whistler_MySword_TooLate_Condition;
	information	= DIA_Whistler_MySword_TooLate_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Whistler_MySword_TooLate_Condition()
{
	if ( (Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_TooLate_Info()
{
	AI_Output (self,other,"DIA_Whistler_MySword_TooLate_11_00"); //Tu jesteś! Próbowałeś zwiać z moją rudą, co? Chodź no tu, chłopcze!
	
	Whistler_BuyMySword = LOG_FAILED;
	
	B_LogEntry (CH1_JoinOC,"Zawaliłem sprawę. Świstak nie chce mnie widzieć na oczy.");
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude (self, ATT_ANGRY);
	Npc_SetTarget (self,other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

// **************************************************
// 					Success
// **************************************************

INSTANCE DIA_Whistler_MySword_Success (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_MySword_Success_Condition;
	information	= DIA_Whistler_MySword_Success_Info;
	permanent	= 1;
	description = "Mam dla ciebie miecz...";
};                       

FUNC INT DIA_Whistler_MySword_Success_Condition()
{
	if ( 	(Whistler_BuyMySword==LOG_RUNNING) && (Whistler_BuyMySword_Day>(Wld_GetDay()-2)) 
		&&	(Npc_HasItems (other,Whistlers_Schwert)>=1) )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_MySword_Success_Info()
{
	AI_Output (other,self,"DIA_Whistler_MySword_Success_15_00"); //Mam dla ciebie miecz...

    B_GiveInvItems (other, self, Whistlers_Schwert, 1);
	
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_01"); //To nie było zbyt trudne. Tak, czy inaczej - wyświadczyłeś mi przysługę, teraz ja wyświadczę przysługę tobie.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_02"); //Jeśli Diego zapyta mnie o ciebie, opowiem się za tobą. Póki co - trzymaj się!
	
	B_LogEntry (CH1_JoinOC,"Świstak ucieszył się, gdy wręczyłem mu jego miecz. Mogę liczyć na jego wsparcie u Diego.");
	}
	else
	{
	B_LogEntry (CH1_JoinOC,"Świstak ucieszył się, gdy wręczyłem mu jego miecz. Szkoda tylko, że nie mogę już zostać Cieniem.");
	};
	Whistler_BuyMySword = LOG_SUCCESS;
	B_GiveXP (XP_Whistlerssword);
    
	AI_StopProcessInfos	( self );
};

// **************************************************
// 			STANDARD - Kap 1 nach SUCCESS
// **************************************************

INSTANCE DIA_Whistler_StandardKap1 (C_INFO)
{
	npc			= STT_309_Whistler;
	nr			= 800;
	condition	= DIA_Whistler_StandardKap1_Condition;
	information	= DIA_Whistler_StandardKap1_Info;
	permanent	= 1;
	description = "Jak leci...";
};                       

FUNC INT DIA_Whistler_StandardKap1_Condition()
{
	if ( Whistler_BuyMySword == LOG_SUCCESS )
	{
		return 1;
	};
};

FUNC VOID DIA_Whistler_StandardKap1_Info()
{
	AI_Output (other,self,"DIA_Whistler_StandardKap1_15_00"); //Jak leci...
	AI_Output (self,other,"DIA_Whistler_StandardKap1_11_01"); //Świetnie! Wyświadczyłeś mi przysługę, teraz ja wyświadczę przysługę tobie. Powiem Diego, że można na tobie polegać.
};





	
	





















