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
	description  = "Hé ! d'où sors-tu ?";
};                       

FUNC int  DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_Greet_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Greet_15_00"); //Hé ! d'où sors-tu ?
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_01"); //Nous donnons à Cor Kalom la sécrétion des Chenilles de mine de nos frères qui sont dans la vieille mine
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_02"); //Nous allons tous les jours à la vieille mine pour la collecter.
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
	description  = "Quel genre de sécrétion est-ce cela ?";
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
	AI_Output (other, self,"DIA_GorNaDrak_WasSekret_15_00"); //Quel genre de sécrétion est-ce cela ?
	AI_Output (self, other,"DIA_GorNaDrak_WasSekret_09_01"); //Nous l'obtenons à partir des mandibules inférieures des Chenille de mines. Si tu sais le faire, tu peux les enlever sans perdre la sécrétion.
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
	description  = "Peux-tu me dire comment obtenir la sécrétion d'une Chenille des mines ?";
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
	AI_Output (other, self,"DIA_GorNaDrak_TeachMandibles_15_00"); //Peux-tu me dire comment obtenir la sécrétion d'une Chenille des mines ?
	AI_Output (self, other,"DIA_GorNaDrak_TeachMandibles_09_01"); //Naturellement. Après que tu aies tué la bête, tu prends les mandibules inférieures et tu les enlèves directement. De cette façon tu auras la glande à sécrétion sans la détruire.
	
	PrintScreen	("Apprendre : Extraire les mandibules de Chenilles des mines", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Knows_GetMCMandibles = TRUE;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Comment extraire des mandibules - Chenilles des mines");
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
	description  = "Pourquoi Cor Kalom a-t-il besoin de cette sécrétion ?";
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
	AI_Output (other, self,"DIA_GorNaDrak_WhatFor_15_00"); //Pourquoi Cor Kalom a-t-il besoin de cette sécrétion ?
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_01"); //D'après ce que je sais, il fait une potion avec laquelle il développe les puissances magiques d'un novice.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_02"); //Puisque nous nous préparons à la grande invocation, il ne peut pas avoir suffisamment de marchandise.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_03"); //À l'aide de la potion, il préparera les novices pour ce jour fabuleux.
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
	description  = "As-tu assez de potion pour la grande invocation du Dormeur ?";
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
	AI_Output (other, self,"DIA_GorNaDrak_Permanent_15_00"); //As-tu assez de potion pour la grande invocation du Dormeur ?
	AI_Output (self, other,"DIA_GorNaDrak_Permanent_09_01"); //Non - nous devons en collecter beaucoup plus - nos groupes de chasseurs de Chenille de mine travaillent jour et nuit.
};




