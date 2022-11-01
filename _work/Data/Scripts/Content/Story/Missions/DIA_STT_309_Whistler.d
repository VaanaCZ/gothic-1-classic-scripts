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
	description = "Zdar! Jsem tu nový!";
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
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_00"); //Zdar! Jsem tady nový!
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_01"); //Co ode mě chceš?
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_02"); //Chci se stát jedním z vás - chci se přidat k táboru.
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_03"); //Hledáš lidi, kteří by ti pomohli, viď?
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_04"); //Jestli chceš, abych se za tebe přimluvil u Diega, musíš mi prokázat službičku.
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
	description = "Jakou službičku bys chtěl?";
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
	AI_Output (other,self,"DIA_Whistler_Favour_15_00"); //Jakou službičku bys chtěl?
	AI_Output (self,other,"DIA_Whistler_Favour_11_01"); //Chci jednu z Fiskových zbraní. Je to jeden obchodník z tržiště.
	AI_Output (self,other,"DIA_Whistler_Favour_11_02"); //Nechce mi ji prodat. Je to zdobený meč se širokou čepelí.
	AI_Output (self,other,"DIA_Whistler_Favour_11_03"); //Dám ti 100 nugetů, abys mi tu zbraň obstaral. O mně mu ale neříkej.

	Info_ClearChoices(DIA_Whistler_Favour);
	Info_AddChoice	 (DIA_Whistler_Favour,"Dobře, dej mi těch 100 magických nugetů. Dostanu tu věc.",DIA_Whistler_Favour_Ok);
	Info_AddChoice	 (DIA_Whistler_Favour,"Nenapadlo tě snad, že bych mohl s tou rudou utéct...?",DIA_Whistler_Favour_OreAway);
	Info_AddChoice	 (DIA_Whistler_Favour,"Proč ti tu zbraň nechce prodat?",DIA_Whistler_Favour_WhyNotSell);
};

func void DIA_Whistler_Favour_Ok()
{
	AI_Output (other,self,"DIA_Whistler_Favour_Ok_15_00"); //Dobře, dej mi těch 100 magických nugetů. Dostanu tu věc.
	AI_Output (self,other,"DIA_Whistler_Favour_Ok_11_01"); //Tady jsi. Pojď hned sem!
	
	Whistler_BuyMySword = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"Whistler mi pomůže, když půjdu na tržiště za Fistem a koupím pro něj meč. Dal mi na něj 100 nugetů.");
	
	var C_NPC fisk; fisk = Hlp_GetNpc(Stt_311_Fisk);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget, 100);
	
	Whistler_BuyMySword_Day = Wld_GetDay();
	
	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
	AI_Output (other,self,"DIA_Whistler_Favour_OreAway_15_00"); //Nenapadlo tě snad, že bych mohl s tou rudou utéct...?
	AI_Output (self,other,"DIA_Whistler_Favour_OreAway_11_01"); //Nezapomeň: kolonie je malá! Jestli mi s tou rudou utečeš, najdu si tě!
};

func void DIA_Whistler_Favour_WhyNotSell()
{
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //Proč ti tu zbraň nechce prodat?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //Má k tomu malý důvod.
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //Jaký?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //Tohle ti musí stačit!
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
	description = "Fisk chce teď za tu zbraň 110 nugetů.";
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
	AI_Output (other,self,"DIA_Whistler_Running110_15_00"); //Fisk chce teď za tu zbraň 110 nugetů.
	AI_Output (self,other,"DIA_Whistler_Running110_11_01"); //A ty chceš, abych ti teď dal těch 10 nugetů...
	AI_Output (other,self,"DIA_Whistler_Running110_15_02"); //Myslel jsem, že chceš ten meč.
	AI_Output (self,other,"DIA_Whistler_Running110_11_03"); //Tady, vem si to a už spěchej!
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
	description = "Nedostal jsem ten meč - tady je tvých 100 nugetů zpátky.";
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
	AI_Output (other,self,"DIA_Whistler_RunningPayBack_15_00"); //Nedostal jsem ten meč - tady je tvých 100 nugetů zpátky.
	
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_01"); //Ty idiote! Nepotřebujeme tu takové idioty! Ztrať se!
		B_GiveInvItems (hero, self, itminugget, 100);
		Whistler_BuyMySword = LOG_OBSOLETE;
		
		B_LogEntry (CH1_JoinOC,"Nepochodil jsem, Whistler svůj meč už nikdy nedostane.");
		
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_02"); //Já ale nevidím žádných 100 nugetů - uděláš nejlíp, když odtud vypadneš, jak nejrychleji můžeš, jinak se dostaneš do maléru!
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
	AI_Output (self,other,"DIA_Whistler_MySword_TooLate_11_00"); //Tady jsi! Chtěl jsi utéci s mojí rudou, ech? Pojď sem, synku!
	
	Whistler_BuyMySword = LOG_FAILED;
	
	B_LogEntry (CH1_JoinOC,"Nepochodil jsem, Whistler se na mě pořádně naštval.");
	
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
	description = "Mám tvůj meč...";
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
	AI_Output (other,self,"DIA_Whistler_MySword_Success_15_00"); //Mám tvůj meč...

    B_GiveInvItems (other, self, Whistlers_Schwert, 1);
	
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_01"); //To nebylo tak těžké, že ne? Ale aťsi - prokázal jsi mi službu a já ti ji teď oplatím.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_02"); //Když se na tebe bude Diego ptát, budu mluvit v tvůj prospěch. Do té doby - měj se!
	
	B_LogEntry (CH1_JoinOC,"Whistler byl spokojený, když jsem mu dal meč, o který žádal. Doporučil mě Diegovi.");
	}
	else
	{
	B_LogEntry (CH1_JoinOC,"Whistler byl spokojený, když jsem mu dal meč, o který žádal. Bohužel z toho nic nebudu mít, protože už se nikdy nebudu moci stát Stínem.");
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
	description = "Jak to jde...";
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
	AI_Output (other,self,"DIA_Whistler_StandardKap1_15_00"); //Jak to jde...
	AI_Output (self,other,"DIA_Whistler_StandardKap1_11_01"); //Výborně! Prokázal jsi mi službu a já ti ji teď oplatím. Řeknu Diegovi, že jsi spolehlivý muž.
};





	
	





















