// **************************************
//					EXIT 
// **************************************

instance DIA_Lefty_Exit (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 999;
	condition	= DIA_Lefty_Exit_Condition;
	information	= DIA_Lefty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Lefty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Lefty_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				First At Night
// **************************************

instance DIA_Lefty_FirstAtNight (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_FirstAtNight_Condition;
	information	= DIA_Lefty_FirstAtNight_Info;
	permanent	= 0;
	description = "Co tady dìláš?";
};                       

FUNC int DIA_Lefty_FirstAtNight_Condition()
{
	if	(Wld_IsTime(19,00,08,00))
	&&	(!Npc_KnowsInfo(hero,DIA_Lefty_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_FirstAtNight_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Co tady dìláš?
	AI_Output (self, other,"DIA_846_Hello_07_01"); //Pracuju pro Rýžového Lorda.
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //Máš pro mì nìjakou práci?
	AI_Output (self, other,"DIA_Shrike_GetLost_07_01"); //Ještì si popovídáme!
	AI_StopProcessInfos	(self);
};

// **************************************
//				First
// **************************************

instance DIA_Lefty_First (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_First_Condition;
	information	= DIA_Lefty_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Lefty_First_Condition()
{
	if	(Wld_IsTime(08,00,19,00))
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_First_Info()
{
	AI_Output (self, other,"DIA_Lefty_First_07_00"); //Hej! Ty jsi právì pøišel? Potøebujeme nìkoho, kdo by nosil vodu rolníkùm na rýžová pole.
	AI_Output (self, other,"DIA_Lefty_First_07_01"); //Takhle mùžeš s nìkterými lidmi navázat pøátelství. Tak co øíkáš?
	
	Log_CreateTopic		(CH1_CarryWater,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_RUNNING);
	B_LogEntry			(CH1_CarryWater,"Lefty, otravný bandita z Nového tábora, po mnì chce, abych nosil rolníkùm na pole vodu.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	Info_AddChoice		(DIA_Lefty_First,"Možná pozdìji.",DIA_Lefty_First_Later);
	Info_AddChoice		(DIA_Lefty_First,"Dones tu vodu rolníkùm sám!",DIA_Lefty_First_Never);
	Info_AddChoice		(DIA_Lefty_First,"Jistì, rád pomùžu.",DIA_Lefty_First_Yes);
};

func void DIA_Lefty_First_Yes()
{
	AI_Output (other, self,"DIA_Lefty_First_Yes_15_00"); //Jistì, rád pomùžu.
	AI_Output (self, other,"DIA_Lefty_First_Yes_07_01"); //Výbornì! Jdi za Rýžovým Lordem. Dá ti vodu a øekne všechno, co je potøeba udìlat. 
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_RUNNING;
	An_Bauern_verteilt = 0;
	B_LogEntry			(CH1_CarryWater,"Pøestože to je dosti stupidní úkol, pøijal jsem to, protože si tam možná najdu nìjaké pøátele. Musím si vyzvednout vodu od takzvaného Rýžového lorda.");

	Info_ClearChoices	(DIA_Lefty_First);
};

func void DIA_Lefty_First_Never()
{
	AI_Output (other, self,"DIA_Lefty_First_Never_15_00"); //Dones tu vodu rolníkùm sám!
	AI_Output (self, other,"DIA_Lefty_First_Never_07_01"); //To není dobrý zpùsob, jak navazovat pøátelství!  Budu tì muset nauèit slušnému chování!
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_FAILED;
	B_LogEntry			(CH1_CarryWater,"Když jsem Leftyho 'nabídku' odmítl, tváøil se hodnì naštvanì! A já si myslel, jaké je Starý tábor drsné místo!");
	
	Info_ClearChoices	(DIA_Lefty_First );
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_First_Later()
{
	AI_Output (other, self,"DIA_Lefty_First_Later_15_00"); //Možná pozdìji.
	AI_Output (self, other,"DIA_Lefty_First_Later_07_01"); //Pozdìji už nebudu nikoho potøebovat. Potøebuju tvou pomoc teï HNED. Chceš mi pomoci nebo ne?
};

// **************************************
//				Every Day
// **************************************
var int CarriedWaterForLefty;
// **************************************

instance DIA_Lefty_WorkDay (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_WorkDay_Condition;
	information	= DIA_Lefty_WorkDay_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC int DIA_Lefty_WorkDay_Condition()
{
	if	(Wld_IsTime(08,00,19,00) || (Lefty_Mission == LOG_SUCCESS))				// wenn Wasser verteilt, dann auch abends am Lagerfeuer!
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	&&	((Lefty_WorkDay <= Wld_GetDay()-1) || (Lefty_Mission == LOG_SUCCESS))	// wenn Wasser verteilt, dann auch noch am selben Tag! 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_WorkDay_Info()
{
	AI_Output (self, other,"DIA_Lefty_WorkDay_07_00"); //Hej, ty!
	
	if (Lefty_Mission == LOG_FAILED)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_00"); //Máš štìstí! Dám ti druhou pøíležitost.
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_01"); //Zkus to tentokrát nezkazit! Dobrá, jdi za Rýžovým Lordem a pak roznes vodu všem rolníkùm. Jasný?
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		B_LogEntry			(CH1_CarryWater,"Znovu jsem se setkal s Leftym! Chce po mnì, abych šel k Rýžovému lordovi vyzvednout vodu pro rolníky na polích.");
		
		AI_StopProcessInfos	(self);
	}
	else if (Lefty_Mission == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //Øekl jsem ti, abys zanesl vodu rolníkùm!
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //Nemám rád lidi, kteøí dávají sliby a pak je neplní!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_FAILED;
		B_LogEntry			(CH1_CarryWater,"Lefty byl doopravdy na padnutí, že jsem ještì neroznesl vodu! Jako bych si z toho èipery støílel. ");
		
		AI_StopProcessInfos	(self);
		Npc_SetTarget (self, other);
		AI_StartState (self, ZS_ATTACK, 1, "");
	}
	else if (Lefty_Mission == LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //Dobrá práce! Pøece jen jsi k nìèemu užiteèný.
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //Myslím, že to je úkol právì pro tebe. Od teïka to budeš dìlat každý den. Tak a teï pokraèuj.
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		if	!CarriedWaterForLefty
		{
			B_LogEntry		(CH1_CarryWater,"Nemùžu tomu uvìøit. Potom, co jsem všude roznesl vodu, Lefty snad vážnì chce, abych to dìlal každý den. Mám pocit, že tomu idiotovi budu muset pár vìcí vysvìtlit.");
			B_GiveXP		(XP_LeftyCarriedWater);
			CarriedWaterForLefty = TRUE;
		};
		
		AI_StopProcessInfos	(self);
	};
};

// **************************************
//				NICHT MEHR
// **************************************

instance DIA_Lefty_NeverAgain (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_NeverAgain_Condition;
	information	= DIA_Lefty_NeverAgain_Info;
	permanent	= 1;
	description	= "Od teïka si mùžeš tu vodu nosit sám.";
};                       

FUNC int DIA_Lefty_NeverAgain_Condition()
{
	if ( (Lefty_Mission == LOG_RUNNING) && (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_NeverAgain_Info()
{
	AI_Output (other, self,"DIA_Lefty_NeverAgain_15_00"); //Od teïka si mùžeš tu vodu nosit sám.
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_01"); //Ale? Máš nìco lepšího?
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_02"); //Myslím, že je èas ti pøipomenout, kdo je tady šéf!
	
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};	

// **************************************
//				PERM
// **************************************
var int LeftyWasBeaten;
// **************************************
instance DIA_Lefty_PERM (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_PERM_Condition;
	information	= DIA_Lefty_PERM_Info;
	permanent	= 1;
	description	= "Jak se máš, pøíteli?";
};                       

FUNC int DIA_Lefty_PERM_Condition()
{
	if (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE) 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_PERM_Info()
{
	AI_Output (other, self,"DIA_Lefty_PERM_15_00"); //Jak se máš, pøíteli?
	AI_Output (self, other,"DIA_Lefty_PERM_07_01"); //Ach, èlovìèe! Co chceš?

	if	!LeftyWasBeaten
	{
		B_LogEntry			(CH1_CarryWater,"Øekl jsem Leftymu, aby mì ve vlastním zájmu pøestal obtìžovat se svými teoriemi o roznášení vody. Nìkteøí lidé se pouèí, jen když je to zabolí.");
		Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
		B_GiveXP			(XP_LeftyConfronted);
		LeftyWasBeaten = TRUE;
	};
	
	Info_ClearChoices	(DIA_Lefty_PERM );
	Info_AddChoice		(DIA_Lefty_PERM,"Jen jsem chtìl vìdìt, jak se máš.",DIA_Lefty_PERM_Nothing);
	Info_AddChoice		(DIA_Lefty_PERM,"Rolníci vypadají žíznivì.",DIA_Lefty_PERM_Durstig);
	Info_AddChoice		(DIA_Lefty_PERM,"Mìl jsem vážnì zlej den. Radím ti, abys mì neprovokoval a zùstal radìji zticha.",DIA_Lefty_PERM_AufsMaul);

};	

func void DIA_Lefty_PERM_AufsMaul()
{
	AI_Output (other, self,"DIA_Lefty_PERM_AufsMaul_15_00"); //Mìl jsem opravdu špatný den a hledám zpùsob, jak uvolnit napìtí... jen takhle ještì chvilku stùj.
	B_Say (self,other,"$YOUWANNAFOOLME");
	Info_ClearChoices	(DIA_Lefty_PERM );
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_PERM_Durstig()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Durstig_15_00"); //Rolníci vypadají žíznivì.
	AI_Output (self, other,"DIA_Lefty_PERM_Durstig_07_01"); //Dohlédnu na to... bez starosti.
	AI_StopProcessInfos	(self);
};

func void DIA_Lefty_PERM_Nothing()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Nothing_15_00"); //Jen jsem chtìl vìdìt, jak se máš.
	AI_StopProcessInfos	(self);
};




	
	
	
	
	
