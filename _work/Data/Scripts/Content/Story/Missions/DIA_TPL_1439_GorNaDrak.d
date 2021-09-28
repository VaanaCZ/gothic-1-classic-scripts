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
//					Erste Begr�ssung
// **************************************************

instance  DIA_GorNaDrak_Greet (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Greet_Condition;
	information	= DIA_GorNaDrak_Greet_Info;
	permanent	= 0;
	description  = "�Hola! �D�nde vas?";
};                       

FUNC int  DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_Greet_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Greet_15_00"); //�Hola! �Ad�nde vas?
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_01"); //Llevamos a Cor Kalorn la secreci�n de reptador de nuestros hermanos en la Vieja Mina.
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_02"); //Vamos todos los d�as a recogerla all�.
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
	description  = "�Qu� clase de secreci�n es �sta?";
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
	AI_Output (other, self,"DIA_GorNaDrak_WasSekret_15_00"); //�De qu� clase de secreci�n se trata?
	AI_Output (self, other,"DIA_GorNaDrak_WasSekret_09_01"); //La obtenemos de las mand�bulas de los reptadores. Si sabes c�mo hacerlo, puedes extraerlas sin perder la secreci�n.
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
	description  = "�Puedes decirme c�mo conseguir la secreci�n de un reptador de la mina?";
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
	AI_Output (other, self,"DIA_GorNaDrak_TeachMandibles_15_00"); //�Puedes ense�arme el modo de obtener la secreci�n de los reptadores?
	AI_Output (self, other,"DIA_GorNaDrak_TeachMandibles_09_01"); //Claro que s�. Tras matar a la bestia, tienes que agarrar las mand�bulas y sacarlas tirando de ellas. De ese modo conseguir�s la gl�ndula secretora sin destruirla.
	
	PrintScreen	("Aprender: quitar mand�bulas de reptador", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Knows_GetMCMandibles = TRUE;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"C�mo quitar mand�bulas: reptadores de la mina.");
};

// **************************************************
//			 	Wof�r ist Sekret da?
// **************************************************

instance  DIA_GorNaDrak_WhatFor (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WhatFor_Condition;
	information	= DIA_GorNaDrak_WhatFor_Info;
	permanent	= 0;
	description  = "�Para qu� necesita Cor Kalom la secreci�n?";
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
	AI_Output (other, self,"DIA_GorNaDrak_WhatFor_15_00"); //�Para qu� necesita Cor Kalorn la secreci�n?
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_01"); //Por lo que yo s�, con ella elabora una poci�n que incrementa los poderes m�gicos de un novicio.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_02"); //Dado que estamos prepar�ndonos para la gran invocaci�n, necesita grandes cantidades de secreci�n.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_03"); //Con la ayuda de la poci�n, preparar� a los novicios para el gran d�a.
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
	description  = "�Ten�is suficiente poci�n para la gran invocaci�n del Durmiente?";
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
	AI_Output (other, self,"DIA_GorNaDrak_Permanent_15_00"); //�Ten�is ya poci�n suficiente para la gran invocaci�n del Durmiente?
	AI_Output (self, other,"DIA_GorNaDrak_Permanent_09_01"); //No, todav�a tenemos que recoger mucha m�s. Nuestras unidades de cazadores de reptadores trabajan d�a y noche.
};




