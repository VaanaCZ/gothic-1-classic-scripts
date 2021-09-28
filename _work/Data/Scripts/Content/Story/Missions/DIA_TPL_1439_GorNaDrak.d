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
	description  = "¡Hola! ¿Dónde vas?";
};                       

FUNC int  DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_Greet_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Greet_15_00"); //¡Hola! ¿Adónde vas?
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_01"); //Llevamos a Cor Kalorn la secreción de reptador de nuestros hermanos en la Vieja Mina.
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_02"); //Vamos todos los días a recogerla allí.
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
	description  = "¿Qué clase de secreción es ésta?";
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
	AI_Output (other, self,"DIA_GorNaDrak_WasSekret_15_00"); //¿De qué clase de secreción se trata?
	AI_Output (self, other,"DIA_GorNaDrak_WasSekret_09_01"); //La obtenemos de las mandíbulas de los reptadores. Si sabes cómo hacerlo, puedes extraerlas sin perder la secreción.
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
	description  = "¿Puedes decirme cómo conseguir la secreción de un reptador de la mina?";
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
	AI_Output (other, self,"DIA_GorNaDrak_TeachMandibles_15_00"); //¿Puedes enseñarme el modo de obtener la secreción de los reptadores?
	AI_Output (self, other,"DIA_GorNaDrak_TeachMandibles_09_01"); //Claro que sí. Tras matar a la bestia, tienes que agarrar las mandíbulas y sacarlas tirando de ellas. De ese modo conseguirás la glándula secretora sin destruirla.
	
	PrintScreen	("Aprender: quitar mandíbulas de reptador", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Knows_GetMCMandibles = TRUE;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Cómo quitar mandíbulas: reptadores de la mina.");
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
	description  = "¿Para qué necesita Cor Kalom la secreción?";
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
	AI_Output (other, self,"DIA_GorNaDrak_WhatFor_15_00"); //¿Para qué necesita Cor Kalorn la secreción?
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_01"); //Por lo que yo sé, con ella elabora una poción que incrementa los poderes mágicos de un novicio.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_02"); //Dado que estamos preparándonos para la gran invocación, necesita grandes cantidades de secreción.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_03"); //Con la ayuda de la poción, preparará a los novicios para el gran día.
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
	description  = "¿Tenéis suficiente poción para la gran invocación del Durmiente?";
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
	AI_Output (other, self,"DIA_GorNaDrak_Permanent_15_00"); //¿Tenéis ya poción suficiente para la gran invocación del Durmiente?
	AI_Output (self, other,"DIA_GorNaDrak_Permanent_09_01"); //No, todavía tenemos que recoger mucha más. Nuestras unidades de cazadores de reptadores trabajan día y noche.
};




