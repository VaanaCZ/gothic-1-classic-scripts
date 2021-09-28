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
	description = "Zdar! Jsem tu nov�!";
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
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_00"); //Zdar! Jsem tady nov�!
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_01"); //Co ode m� chce�?
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_02"); //Chci se st�t jedn�m z v�s - chci se p�idat k t�boru.
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_03"); //Hled� lidi, kte�� by ti pomohli, vi�?
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_04"); //Jestli chce�, abych se za tebe p�imluvil u Diega, mus� mi prok�zat slu�bi�ku.
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
	description = "Jakou slu�bi�ku bys cht�l?";
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
	AI_Output (other,self,"DIA_Whistler_Favour_15_00"); //Jakou slu�bi�ku bys cht�l?
	AI_Output (self,other,"DIA_Whistler_Favour_11_01"); //Chci jednu z Fiskov�ch zbran�. Je to jeden obchodn�k z tr�i�t�.
	AI_Output (self,other,"DIA_Whistler_Favour_11_02"); //Nechce mi ji prodat. Je to zdoben� me� se �irokou �epel�.
	AI_Output (self,other,"DIA_Whistler_Favour_11_03"); //D�m ti 100 nuget�, abys mi tu zbra� obstaral. O mn� mu ale ne��kej.

	Info_ClearChoices(DIA_Whistler_Favour);
	Info_AddChoice	 (DIA_Whistler_Favour,"Dob�e, dej mi t�ch 100 magick�ch nuget�. Dostanu tu v�c.",DIA_Whistler_Favour_Ok);
	Info_AddChoice	 (DIA_Whistler_Favour,"Nenapadlo t� snad, �e bych mohl s tou rudou ut�ct...?",DIA_Whistler_Favour_OreAway);
	Info_AddChoice	 (DIA_Whistler_Favour,"Pro� ti tu zbra� nechce prodat?",DIA_Whistler_Favour_WhyNotSell);
};

func void DIA_Whistler_Favour_Ok()
{
	AI_Output (other,self,"DIA_Whistler_Favour_Ok_15_00"); //Dob�e, dej mi t�ch 100 magick�ch nuget�. Dostanu tu v�c.
	AI_Output (self,other,"DIA_Whistler_Favour_Ok_11_01"); //Tady jsi. Poj� hned sem!
	
	Whistler_BuyMySword = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"Whistler mi pom��e, kdy� p�jdu na tr�i�t� za Fistem a koup�m pro n�j me�. Dal mi na n�j 100 nuget�.");
	
	var C_NPC fisk; fisk = Hlp_GetNpc(Stt_311_Fisk);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget, 100);
	
	Whistler_BuyMySword_Day = Wld_GetDay();
	
	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
	AI_Output (other,self,"DIA_Whistler_Favour_OreAway_15_00"); //Nenapadlo t� snad, �e bych mohl s tou rudou ut�ct...?
	AI_Output (self,other,"DIA_Whistler_Favour_OreAway_11_01"); //Nezapome�: kolonie je mal�! Jestli mi s tou rudou ute�e�, najdu si t�!
};

func void DIA_Whistler_Favour_WhyNotSell()
{
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //Pro� ti tu zbra� nechce prodat?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //M� k tomu mal� d�vod.
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //Jak�?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //Tohle ti mus� sta�it!
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
	description = "Fisk chce te� za tu zbra� 110 nuget�.";
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
	AI_Output (other,self,"DIA_Whistler_Running110_15_00"); //Fisk chce te� za tu zbra� 110 nuget�.
	AI_Output (self,other,"DIA_Whistler_Running110_11_01"); //A ty chce�, abych ti te� dal t�ch 10 nuget�...
	AI_Output (other,self,"DIA_Whistler_Running110_15_02"); //Myslel jsem, �e chce� ten me�.
	AI_Output (self,other,"DIA_Whistler_Running110_11_03"); //Tady, vem si to a u� sp�chej!
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
	description = "Nedostal jsem ten me� - tady je tv�ch 100 nuget� zp�tky.";
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
	AI_Output (other,self,"DIA_Whistler_RunningPayBack_15_00"); //Nedostal jsem ten me� - tady je tv�ch 100 nuget� zp�tky.
	
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_01"); //Ty idiote! Nepot�ebujeme tu takov� idioty! Ztra� se!
		B_GiveInvItems (hero, self, itminugget, 100);
		Whistler_BuyMySword = LOG_OBSOLETE;
		
		B_LogEntry (CH1_JoinOC,"Nepochodil jsem, Whistler sv�j me� u� nikdy nedostane.");
		
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_02"); //J� ale nevid�m ��dn�ch 100 nuget� - ud�l� nejl�p, kdy� odtud vypadne�, jak nejrychleji m��e�, jinak se dostane� do mal�ru!
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
	AI_Output (self,other,"DIA_Whistler_MySword_TooLate_11_00"); //Tady jsi! Cht�l jsi ut�ci s moj� rudou, ech? Poj� sem, synku!
	
	Whistler_BuyMySword = LOG_FAILED;
	
	B_LogEntry (CH1_JoinOC,"Nepochodil jsem, Whistler se na m� po��dn� na�tval.");
	
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
	description = "M�m tv�j me�...";
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
	AI_Output (other,self,"DIA_Whistler_MySword_Success_15_00"); //M�m tv�j me�...

    B_GiveInvItems (other, self, Whistlers_Schwert, 1);
	
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_01"); //To nebylo tak t�k�, �e ne? Ale a�si - prok�zal jsi mi slu�bu a j� ti ji te� oplat�m.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_02"); //Kdy� se na tebe bude Diego pt�t, budu mluvit v tv�j prosp�ch. Do t� doby - m�j se!
	
	B_LogEntry (CH1_JoinOC,"Whistler byl spokojen�, kdy� jsem mu dal me�, o kter� ��dal. Doporu�il m� Diegovi.");
	}
	else
	{
	B_LogEntry (CH1_JoinOC,"Whistler byl spokojen�, kdy� jsem mu dal me�, o kter� ��dal. Bohu�el z toho nic nebudu m�t, proto�e u� se nikdy nebudu moci st�t St�nem.");
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
	AI_Output (self,other,"DIA_Whistler_StandardKap1_11_01"); //V�born�! Prok�zal jsi mi slu�bu a j� ti ji te� oplat�m. �eknu Diegovi, �e jsi spolehliv� mu�.
};





	
	





















