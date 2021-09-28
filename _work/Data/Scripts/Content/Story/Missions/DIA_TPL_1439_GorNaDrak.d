// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_GorNaDrak_EXIT (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 999;
	condition	= DIA_GorNaDrak_EXIT_Condition;
	information	= DIA_GorNaDrak_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_GorNaDrak_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_GorNaDrak_Greet (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Greet_Condition;
	information	= DIA_GorNaDrak_Greet_Info;
	permanent	= 0;
	description  = "Zdar! Kam odcházíš?";
};                       

FUNC int  DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_Greet_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Greet_15_00"); //Zdar! Kam odcházíš?
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_01"); //Neseme výmìšek dùlního èerva od našich bratrù ze Starého dolu ke Cor Kalomovi.
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_02"); //Chodíme pro nìj do Starého dolu každý den.
};

// **************************************************
//					Was ist Sekret
// **************************************************

instance  DIA_GorNaDrak_WasSekret (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WasSekret_Condition;
	information	= DIA_GorNaDrak_WasSekret_Info;
	permanent	= 0;
	description  = "Jaký druh výmìšku to je?";
};                       

FUNC int  DIA_GorNaDrak_WasSekret_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_WasSekret_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_WasSekret_15_00"); //Jaký druh výmìšku to je?
	AI_Output (self, other,"DIA_GorNaDrak_WasSekret_09_01"); //Je obsažený v èelistech dùlních èervù. Když víš jak na to, mùžeš je odnést, aniž bys ztratil výmìšek.
};

// **************************************************
//			 	LERNE: Zangen Nehmen
// **************************************************

instance  DIA_GorNaDrak_TeachMandibles (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_TeachMandibles_Condition;
	information	= DIA_GorNaDrak_TeachMandibles_Info;
	permanent	= 0;
	description  = "Mùžeš mi nìco øíci o tom, jak získáváš výmìšek dùlních èervù?";
};                       

FUNC int  DIA_GorNaDrak_TeachMandibles_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WasSekret) && (Knows_GetMCMandibles == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_TeachMandibles_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_TeachMandibles_15_00"); //Mùžeš mi nìco øíci o tom, jak získáváš výmìšek dùlních èervù?
	AI_Output (self, other,"DIA_GorNaDrak_TeachMandibles_09_01"); //Jistì. Když tu bestii zabiješ, vezmeš její èelisti a odneseš je. Tak získáš žlázu s výmìškem, aniž bys ji poškodil.
	
	PrintScreen	("Nauèit se: Odøíznout èelisti dùlních èervù", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Knows_GetMCMandibles = TRUE;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Jak odstranit èelisti - dùlní èervi");
};

// **************************************************
//			 	Wofür ist Sekret da?
// **************************************************

instance  DIA_GorNaDrak_WhatFor (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WhatFor_Condition;
	information	= DIA_GorNaDrak_WhatFor_Info;
	permanent	= 0;
	description  = "Na co Cor Kalom ten výmìšek potøebuje?";
};                       

FUNC int  DIA_GorNaDrak_WhatFor_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WasSekret))
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_WhatFor_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_WhatFor_15_00"); //Na co Cor Kalom ten výmìšek potøebuje?
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_01"); //Co já vím, pøipravuje z nìj nìjaký lektvar, který umocòuje magické síly novicù.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_02"); //Od té doby, co pøipravujeme velké vzývání, nemá té látky stále dost.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_03"); //S pomocí toho lektvaru pøipravuje novice na ten velký den.
};

// **************************************************
//			 	Kap 1 Permanent
// **************************************************

instance  DIA_GorNaDrak_Permanent (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Permanent_Condition;
	information	= DIA_GorNaDrak_Permanent_Info;
	permanent	= 1;
	description  = "Máte dost lektvaru na to velké vzývání Spáèe?";
};                       

FUNC int  DIA_GorNaDrak_Permanent_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WhatFor) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_Permanent_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Permanent_15_00"); //Máte dost lektvaru na to velké vzývání Spáèe?
	AI_Output (self, other,"DIA_GorNaDrak_Permanent_09_01"); //Ne - Poøád sbíráme další - jednotky našich lovcù dùlních èervù jsou ve dne v noci v akci.
};




