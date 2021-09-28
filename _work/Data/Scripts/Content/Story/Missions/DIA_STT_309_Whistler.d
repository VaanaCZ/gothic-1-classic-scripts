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
	description = "Zdar! Jsem tu nov˝!";
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
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_00"); //Zdar! Jsem tady nov˝!
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_01"); //Co ode mÏ chceö?
	AI_Output (other,self,"DIA_Whistler_IAmNew_15_02"); //Chci se st·t jednÌm z v·s - chci se p¯idat k t·boru.
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_03"); //Hled·ö lidi, kte¯Ì by ti pomohli, viÔ?
	AI_Output (self,other,"DIA_Whistler_IAmNew_11_04"); //Jestli chceö, abych se za tebe p¯imluvil u Diega, musÌö mi prok·zat sluûbiËku.
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
	description = "Jakou sluûbiËku bys chtÏl?";
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
	AI_Output (other,self,"DIA_Whistler_Favour_15_00"); //Jakou sluûbiËku bys chtÏl?
	AI_Output (self,other,"DIA_Whistler_Favour_11_01"); //Chci jednu z Fiskov˝ch zbranÌ. Je to jeden obchodnÌk z trûiötÏ.
	AI_Output (self,other,"DIA_Whistler_Favour_11_02"); //Nechce mi ji prodat. Je to zdoben˝ meË se öirokou ËepelÌ.
	AI_Output (self,other,"DIA_Whistler_Favour_11_03"); //D·m ti 100 nuget˘, abys mi tu zbraÚ obstaral. O mnÏ mu ale ne¯Ìkej.

	Info_ClearChoices(DIA_Whistler_Favour);
	Info_AddChoice	 (DIA_Whistler_Favour,"Dob¯e, dej mi tÏch 100 magick˝ch nuget˘. Dostanu tu vÏc.",DIA_Whistler_Favour_Ok);
	Info_AddChoice	 (DIA_Whistler_Favour,"Nenapadlo tÏ snad, ûe bych mohl s tou rudou utÈct...?",DIA_Whistler_Favour_OreAway);
	Info_AddChoice	 (DIA_Whistler_Favour,"ProË ti tu zbraÚ nechce prodat?",DIA_Whistler_Favour_WhyNotSell);
};

func void DIA_Whistler_Favour_Ok()
{
	AI_Output (other,self,"DIA_Whistler_Favour_Ok_15_00"); //Dob¯e, dej mi tÏch 100 magick˝ch nuget˘. Dostanu tu vÏc.
	AI_Output (self,other,"DIA_Whistler_Favour_Ok_11_01"); //Tady jsi. PojÔ hned sem!
	
	Whistler_BuyMySword = LOG_RUNNING;
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC,LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC,LOG_RUNNING);
	};
	B_LogEntry (CH1_JoinOC,"Whistler mi pom˘ûe, kdyû p˘jdu na trûiötÏ za Fistem a koupÌm pro nÏj meË. Dal mi na nÏj 100 nuget˘.");
	
	var C_NPC fisk; fisk = Hlp_GetNpc(Stt_311_Fisk);
	
	CreateInvItems (self, itminugget, 100);
	B_GiveInvItems (self, hero, itminugget, 100);
	
	Whistler_BuyMySword_Day = Wld_GetDay();
	
	Info_ClearChoices(DIA_Whistler_Favour);
};

func void DIA_Whistler_Favour_OreAway()
{
	AI_Output (other,self,"DIA_Whistler_Favour_OreAway_15_00"); //Nenapadlo tÏ snad, ûe bych mohl s tou rudou utÈct...?
	AI_Output (self,other,"DIA_Whistler_Favour_OreAway_11_01"); //NezapomeÚ: kolonie je mal·! Jestli mi s tou rudou uteËeö, najdu si tÏ!
};

func void DIA_Whistler_Favour_WhyNotSell()
{
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_00"); //ProË ti tu zbraÚ nechce prodat?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_01"); //M· k tomu mal˝ d˘vod.
	AI_Output (other,self,"DIA_Whistler_Favour_WhyNotSell_15_02"); //Jak˝?
	AI_Output (self,other,"DIA_Whistler_Favour_WhyNotSell_11_03"); //Tohle ti musÌ staËit!
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
	description = "Fisk chce teÔ za tu zbraÚ 110 nuget˘.";
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
	AI_Output (other,self,"DIA_Whistler_Running110_15_00"); //Fisk chce teÔ za tu zbraÚ 110 nuget˘.
	AI_Output (self,other,"DIA_Whistler_Running110_11_01"); //A ty chceö, abych ti teÔ dal tÏch 10 nuget˘...
	AI_Output (other,self,"DIA_Whistler_Running110_15_02"); //Myslel jsem, ûe chceö ten meË.
	AI_Output (self,other,"DIA_Whistler_Running110_11_03"); //Tady, vem si to a uû spÏchej!
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
	description = "Nedostal jsem ten meË - tady je tv˝ch 100 nuget˘ zp·tky.";
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
	AI_Output (other,self,"DIA_Whistler_RunningPayBack_15_00"); //Nedostal jsem ten meË - tady je tv˝ch 100 nuget˘ zp·tky.
	
	if (Npc_HasItems(other,itminugget) >= 100)
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_01"); //Ty idiote! Nepot¯ebujeme tu takovÈ idioty! Ztraù se!
		B_GiveInvItems (hero, self, itminugget, 100);
		Whistler_BuyMySword = LOG_OBSOLETE;
		
		B_LogEntry (CH1_JoinOC,"Nepochodil jsem, Whistler sv˘j meË uû nikdy nedostane.");
		
		AI_StopProcessInfos(self);
	}
	else
	{
		AI_Output (self,other,"DIA_Whistler_RunningPayBack_11_02"); //J· ale nevidÌm û·dn˝ch 100 nuget˘ - udÏl·ö nejlÌp, kdyû odtud vypadneö, jak nejrychleji m˘ûeö, jinak se dostaneö do malÈru!
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
	AI_Output (self,other,"DIA_Whistler_MySword_TooLate_11_00"); //Tady jsi! ChtÏl jsi utÈci s mojÌ rudou, ech? PojÔ sem, synku!
	
	Whistler_BuyMySword = LOG_FAILED;
	
	B_LogEntry (CH1_JoinOC,"Nepochodil jsem, Whistler se na mÏ po¯·dnÏ naötval.");
	
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
	description = "M·m tv˘j meË...";
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
	AI_Output (other,self,"DIA_Whistler_MySword_Success_15_00"); //M·m tv˘j meË...

    B_GiveInvItems (other, self, Whistlers_Schwert, 1);
	
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_01"); //To nebylo tak tÏûkÈ, ûe ne? Ale aùsi - prok·zal jsi mi sluûbu a j· ti ji teÔ oplatÌm.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self,other,"DIA_Whistler_MySword_Success_11_02"); //Kdyû se na tebe bude Diego pt·t, budu mluvit v tv˘j prospÏch. Do tÈ doby - mÏj se!
	
	B_LogEntry (CH1_JoinOC,"Whistler byl spokojen˝, kdyû jsem mu dal meË, o kter˝ û·dal. DoporuËil mÏ Diegovi.");
	}
	else
	{
	B_LogEntry (CH1_JoinOC,"Whistler byl spokojen˝, kdyû jsem mu dal meË, o kter˝ û·dal. Bohuûel z toho nic nebudu mÌt, protoûe uû se nikdy nebudu moci st·t StÌnem.");
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
	AI_Output (self,other,"DIA_Whistler_StandardKap1_11_01"); //V˝bornÏ! Prok·zal jsi mi sluûbu a j· ti ji teÔ oplatÌm. ÿeknu Diegovi, ûe jsi spolehliv˝ muû.
};





	
	





















