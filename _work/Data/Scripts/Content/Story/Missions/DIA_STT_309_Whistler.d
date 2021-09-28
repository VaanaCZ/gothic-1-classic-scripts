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
	description = "Czeœæ! Jestem tu nowy!";
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
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_00"); //Czeœæ! Jestem tu nowy!
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_01"); //Czego chcesz?
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_02"); //Chcia³bym zostaæ jednym z was - chcê zostaæ cz³onkiem Obozu.
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_03"); //Szukasz ludzi, którzy ciê popr¹, co?
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_04"); //Jeœli chcesz, ¿ebym zarekomendowa³ ciê u Diego, musisz coœ dla mnie zrobiæ.
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
	description = "Co mam dla ciebie zrobiæ?";
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
	AI_Output (other,self,"DIA_Whistler_Favour_15_00"); //Co mam dla ciebie zrobiæ?
	AI_Output (self,other,"DIA_Whistler_Favour_11_01"); //Chcê jedn¹ z broni, któr¹ ma na sk³adzie Fisk. To jeden z handlarzy na targowisku.
	AI_Output (self,other,"DIA_Whistler_Favour_11_02"); //Ale on nie chce mi jej sprzedaæ. To pewien szczególnie piêknie zdobiony miecz.
	AI_Output (self,other,"DIA_Whistler_Favour_11_03"); //Dam ci 100 bry³ek rudy, za które kupisz dla mnie ten miecz. Tylko nie mów mu, ¿e ja ciê przys³a³em.

	Info_ClearChoices(DIA_Whistler_Favour);
	Info_AddChoice	 (DIA_Whistler_Favour,"Dobrze. Daj mi 100 bry³ek, a ja siê wszystkim zajmê.",DIA_Whistler_Favour_Ok);
	Info_AddChoice	 (DIA_Whistler_Favour,"Przysz³o ci do g³owy, ¿e móg³bym po prostu uciec z twoj¹ rud¹?",DIA_Whistler_Favour_OreAway);
	Info_AddChoice	 (DIA_Whistler_Favour,"Dlaczego Fisk nie chce ci sprzedaæ tej broni?",DIA_Whistler_Favour_WhyNotSell);
};

func void DIA_Whistler_Favour_Ok()
{
	AI_Output (other,self,"DIA_Whistler_Favour_Ok_15_00"); //Dobrze. Daj mi 100 bry³ek, a ja siê wszystkim zajmê.
	AI_Output (self,other,"DIA_Whistler_Favour_Ok_11_01"); //Masz. Tylko nie marudŸ za d³ugo!
	
	Whistler_BuyMySword = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"Œwistak pomo¿e mi, jeœli porozmawiam z Fiskiem i kupiê od niego miecz dla Œwistaka. Da³ mi nawet 100 bry³ek rudy.");
	
	var C_NPC fisk; fisk = Hlp_GetNpc(Stt_311_Fisk);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget, 100);
	
	Whistler_BuyMySword_Day = Wld_GetDay();
	
	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
	AI_Output (other,self,"DIA_Whistler_Favour_OreAway_15_00"); //Przysz³o ci do g³owy, ¿e móg³bym po prostu uciec z twoj¹ rud¹?
	AI_Output (self,other,"DIA_Whistler_Favour_OreAway_11_01"); //Nie zapominaj, ¿e to jest niewielka kolonia. Prêdzej czy póŸniej bym ciê znalaz³!
};

func void DIA_Whistler_Favour_WhyNotSell()
{
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //Dlaczego Fisk nie chce ci sprzedaæ tej broni?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //Trochê siê posprzeczaliœmy.
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //I?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //I to wszystko, co powinieneœ wiedzieæ!
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
	description = "Fisk ¿¹da teraz 110 bry³ek rudy za ten miecz.";
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
	AI_Output (other,self,"DIA_Whistler_Running110_15_00"); //Fisk ¿¹da teraz 110 bry³ek rudy za ten miecz.
	AI_Output (self,other,"DIA_Whistler_Running110_11_01"); //I pewnie mam ci teraz daæ dodatkowe 10 bry³ek...
	AI_Output (other,self,"DIA_Whistler_Running110_15_02"); //Myœla³em, ¿e zale¿y ci na tym mieczu.
	AI_Output (self,other,"DIA_Whistler_Running110_11_03"); //Masz. Tylko siê pospiesz!
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
	description = "Nie mogê zdobyæ tego miecza. Zwracam ci twoj¹ rudê.";
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
	AI_Output (other,self,"DIA_Whistler_RunningPayBack_15_00"); //Nie mogê zdobyæ tego miecza. Zwracam ci twoj¹ rudê.
	
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_01"); //Ty idioto! Nie potrzebujemy tu takich jak ty! ZejdŸ mi z oczu!
		B_GiveInvItems (hero, self, itminugget, 100);
		Whistler_BuyMySword = LOG_OBSOLETE;
		
		B_LogEntry (CH1_JoinOC,"Zawali³em sprawê. Œwistak nigdy ju¿ nie dostanie tego miecza.");
		
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_02"); //Ale ja tu nie widzê ¿adnych 100 bry³ek. Radzê ci, ¿eby szybko siê znalaz³y, bo inaczej...
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
	AI_Output (self,other,"DIA_Whistler_MySword_TooLate_11_00"); //Tu jesteœ! Próbowa³eœ zwiaæ z moj¹ rud¹, co? ChodŸ no tu, ch³opcze!
	
	Whistler_BuyMySword = LOG_FAILED;
	
	B_LogEntry (CH1_JoinOC,"Zawali³em sprawê. Œwistak nie chce mnie widzieæ na oczy.");
	
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
	
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_01"); //To nie by³o zbyt trudne. Tak, czy inaczej - wyœwiadczy³eœ mi przys³ugê, teraz ja wyœwiadczê przys³ugê tobie.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_02"); //Jeœli Diego zapyta mnie o ciebie, opowiem siê za tob¹. Póki co - trzymaj siê!
	
	B_LogEntry (CH1_JoinOC,"Œwistak ucieszy³ siê, gdy wrêczy³em mu jego miecz. Mogê liczyæ na jego wsparcie u Diego.");
	}
	else
	{
	B_LogEntry (CH1_JoinOC,"Œwistak ucieszy³ siê, gdy wrêczy³em mu jego miecz. Szkoda tylko, ¿e nie mogê ju¿ zostaæ Cieniem.");
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
	AI_Output (self,other,"DIA_Whistler_StandardKap1_11_01"); //Œwietnie! Wyœwiadczy³eœ mi przys³ugê, teraz ja wyœwiadczê przys³ugê tobie. Powiem Diego, ¿e mo¿na na tobie polegaæ.
};





	
	





















