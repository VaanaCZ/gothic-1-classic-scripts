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
//					Erste Begrьssung
// **************************************************

instance  DIA_GorNaDrak_Greet (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Greet_Condition;
	information	= DIA_GorNaDrak_Greet_Info;
	permanent	= 0;
	description  = "Привет! Куда вы идете?";
};                       

FUNC int  DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_Greet_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Greet_15_00"); //Привет! Куда вы идете?
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_01"); //Мы несем Кор Галому слюну ползунов, убитых нашими братьями в Старой шахте.
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_02"); //Раз в день мы приходим к ним и забираем их добычу.
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
	description  = "О какой слюне ты говоришь?";
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
	AI_Output (other, self,"DIA_GorNaDrak_WasSekret_15_00"); //О какой слюне ты говоришь?
	AI_Output (self, other,"DIA_GorNaDrak_WasSekret_09_01"); //Ее производят особые железы в пасти ползунов. Но чтобы ее добыть, нужно знать несколько особых приемов.
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
	description  = "Ты можешь рассказать мне, как добывать слюну?";
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
	AI_Output (other, self,"DIA_GorNaDrak_TeachMandibles_15_00"); //Ты можешь рассказать мне, как добывать слюну?
	AI_Output (self, other,"DIA_GorNaDrak_TeachMandibles_09_01"); //Конечно. Убив ползуна, ухватись покрепче за клыки и дергай их на себя. Так ты вырвешь челюсти вместе с железами, которые при этом останутся целыми.
	
	PrintScreen	("Навык: добыча челюстей ползунов", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Knows_GetMCMandibles = TRUE;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Навык добычи челюстей: ползуны.");
};

// **************************************************
//			 	Wofьr ist Sekret da?
// **************************************************

instance  DIA_GorNaDrak_WhatFor (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WhatFor_Condition;
	information	= DIA_GorNaDrak_WhatFor_Info;
	permanent	= 0;
	description  = "А зачем Кор Галому нужна эта слюна?";
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
	AI_Output (other, self,"DIA_GorNaDrak_WhatFor_15_00"); //А зачем Кор Галому нужна эта слюна?
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_01"); //Насколько я знаю, он готовит из нее зелья, повышающие магическую силу наших послушников.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_02"); //Мы ведь готовимся к великой Церемонии, и к тому времени у нас должно быть столько зелья, чтобы его хватило на всех.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_03"); //С его помощью Кор Галом сможет подготовить всех послушников к этому великому дню.
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
	description  = "У вас уже достаточно зелья для великой Церемонии?";
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
	AI_Output (other, self,"DIA_GorNaDrak_Permanent_15_00"); //У вас уже достаточно зелья для великой Церемонии?
	AI_Output (self, other,"DIA_GorNaDrak_Permanent_09_01"); //Нет. Нам нужно еще очень много слюны. Нашим Стражам приходится охотиться на ползунов в Старой шахте и днем, и ночью.
};




