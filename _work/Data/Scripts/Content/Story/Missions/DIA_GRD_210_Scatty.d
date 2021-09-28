// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Scatty_Exit (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 999;
	condition	= DIA_Scatty_Exit_Condition;
	information	= DIA_Scatty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Scatty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					 Was machst du hier 
// **************************************************

INSTANCE DIA_Scatty_WhatDoYouDo (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WhatDoYouDo_Condition;
	information	= DIA_Scatty_WhatDoYouDo_Info;
	permanent	= 0;
	description = "¿Cuál es tu labor aquí?";
};                       

FUNC INT DIA_Scatty_WhatDoYouDo_Condition()
{
	return 1;
};

FUNC VOID DIA_Scatty_WhatDoYouDo_Info()
{
	AI_Output (other,self,"DIA_Scatty_WhatDoYouDo_15_00"); //¿Cuál es tu labor aquí?
	AI_Output (self,other,"DIA_Scatty_WhatDoYouDo_01_01"); //Estoy a cargo de la arena. Organizo las apuestas, contrato a nuevos luchadores... esas cosas.
};

// **************************************************
// 					 Join OC
// **************************************************
	var int Scatty_ChargeKirgo;
	var int Scatty_ChargeKharim;
	var int Scatty_ChargeGorHanis;
// **************************************************

INSTANCE DIA_Scatty_JoinOC (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_JoinOC_Condition;
	information	= DIA_Scatty_JoinOC_Info;
	permanent	= 0;
	description = "Quiero ingresar en el campamento. ¿Puedes ayudarme?";
};                       

FUNC INT DIA_Scatty_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Scatty_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Scatty_JoinOC_15_00"); //Quiero ingresar en el campamento. ¿Puedes ayudarme?
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_01"); //Tal vez pueda, si consigues causarme buena impresión.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_02"); //Algunos de los mejores luchadores de los tres campamentos vienen aquí para competir entre sí.
	AI_Output (self,other,"DIA_Scatty_JoinOC_01_03"); //Desafía a uno de ellos a combatir. Te observaré, y si eres bueno tal vez me lo piense.
	
	Scatty_ChargeKirgo = LOG_RUNNING;
	Scatty_ChargeKharim = LOG_RUNNING;
	Scatty_ChargeGorHanis = LOG_RUNNING;
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			Kirgo.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kirgo.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC Kharim;	Kharim = Hlp_GetNpc(Sld_729_Kharim);		Kharim.aivar[AIV_WASDEFEATEDBYSC] = FALSE;		Kharim.aivar[AIV_HASDEFEATEDSC] = FALSE;
	var C_NPC GorHanis;	GorHanis = Hlp_GetNpc(Tpl_1422_GorHanis);	GorHanis.aivar[AIV_WASDEFEATEDBYSC] = FALSE;	GorHanis.aivar[AIV_HASDEFEATEDSC] = FALSE;
	
	B_LogEntry( CH1_JoinOC,"Scatty, maestro de la arena, quedará impresionado si desafío a uno de los combatientes.");
};

// **************************************************
// 					 KIRGO SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KirgoSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KirgoSuccess_Condition;
	information	= DIA_Scatty_KirgoSuccess_Info;
	permanent	= 0;
	description = "¡Luché con Kirgo!";
};                       

FUNC INT DIA_Scatty_KirgoSuccess_Condition()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);			

	if ( (Scatty_ChargeKirgo == LOG_RUNNING) && (Kirgo_Charged == TRUE) && ( (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KirgoSuccess_Info()
{
	var C_NPC Kirgo; 	Kirgo = Hlp_GetNpc(Grd_251_Kirgo);	
	
	AI_Output (other,self,"DIA_Scatty_KirgoSuccess_15_00"); //¡Luché con Kirgo!
	if (Kirgo.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_01"); //¡Sí, y perdiste!
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_02"); //No esperarás que me impresione eso...
		Scatty_ChargeKirgo = LOG_FAILED;
		
		B_LogEntry( CH1_JoinOC,"El hecho de que Kirgo me haya derrotado no ha impresionado en absoluto a Scatty.");
	}
	else if (Kirgo.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KirgoSuccess_01_03"); //¡Y le venciste! ¡No está mal para un novato como tú! ¡Estoy impresionado!
		Scatty_ChargeKirgo = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"Scatty quedó impresionado por mi combate contra Kirgo.");
		B_GiveXP (XP_kirgovictory);
	};
};

// **************************************************
// 					 KHARIM SUCCESS
// **************************************************

INSTANCE DIA_Scatty_KHARIMSuccess (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_KHARIMSuccess_Condition;
	information	= DIA_Scatty_KHARIMSuccess_Info;
	permanent	= 0;
	description = "¡Desafié a Kharim!";
};                       

FUNC INT DIA_Scatty_KHARIMSuccess_Condition()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);			

	if ( (Scatty_ChargeKHARIM == LOG_RUNNING) && (Kharim_Charged == TRUE) && ( (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE) || (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE) ) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_KHARIMSuccess_Info()
{
	var C_NPC KHARIM; 	KHARIM = Hlp_GetNpc(Sld_729_Kharim);	
	
	AI_Output (other,self,"DIA_Scatty_KHARIMSuccess_15_00"); //¡Desafié a Kharim!
	if (KHARIM.aivar[AIV_HASDEFEATEDSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_01"); //¡Y menuda paliza que te dio!
		if (Npc_GetTrueGuild (hero) == GIL_NONE)
		{
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_02"); //¡Aun así, escogiste al contrincante adecuado! No soporto a esos bastardos del Campamento Nuevo.
			AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_03"); //Parece que tú opinas lo mismo. ¡Eres la clase de persona que necesitamos!
		};
		Scatty_ChargeKHARIM = LOG_FAILED;
		B_GiveXP(XP_Kharimlost);
		B_LogEntry( CH1_JoinOC,"¡Kharim me ha derrotado! A Scatty le gustó mi valor, pero no mi forma de combatir.");
		
	}
	else if (KHARIM.aivar[AIV_WASDEFEATEDBYSC] == TRUE)
	{
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_04"); //¡Y le derrotaste! Tengo que admitir que no estuvo mal. Tiene fama de ser uno de los luchadores más duros.
		AI_Output (self,other,"DIA_Scatty_KHARIMSuccess_01_05"); //¡Estoy profundamente impresionado!
		Scatty_ChargeKHARIM = LOG_SUCCESS;
		
		B_LogEntry( CH1_JoinOC,"¡Le he dado su merecido a Kharim! Scatty ha quedado impresionado.");
		B_GiveXP(XP_kharimvictory);
	};
};


// **************************************************
// 				 Warum andere Lager Kämpfer
// **************************************************

INSTANCE DIA_Scatty_OtherCamps (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_OtherCamps_Condition;
	information	= DIA_Scatty_OtherCamps_Info;
	permanent	= 0;
	description = "¿Por qué dejáis que la gente de los otros campamentos luche aquí?";
};                       

FUNC INT DIA_Scatty_OtherCamps_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_OtherCamps_Info()
{
	AI_Output (other,self,"DIA_Scatty_OtherCamps_15_00"); //Pensaba que el Campamento Viejo y el Nuevo no se llevaban bien. ¿Por qué dejáis que su gente combata aquí?
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_01"); //Es sencillo: hay peleas una vez por semana, y a los cavadores les gusta ver cómo destrozan a uno de los bandidos del Campamento Nuevo.
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_02"); //Si uno de ellos lucha, hay más apuestas... ¡y eso es bueno para el negocio!
	AI_Output (self,other,"DIA_Scatty_OtherCamps_01_03"); //Personalmente, no aguanto a los cerdos del Campamento Nuevo... pero los negocios son los negocios.
};

// **************************************************
// 					Will Wetten
// **************************************************

INSTANCE DIA_Scatty_WannaBet (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaBet_Condition;
	information	= DIA_Scatty_WannaBet_Info;
	permanent	= 1;
	description = "Quiero hacer una apuesta.";
};                       

FUNC INT DIA_Scatty_WannaBet_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_WannaBet_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaBet_15_00"); //Quiero hacer una apuesta.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_01"); //Pero no hay ninguna pelea en curso.
	AI_Output (self,other,"DIA_Scatty_WannaBet_01_02"); //La siguiente pelea es dentro de un par de días. Ya se anunciará.
	
};

// **************************************************
// 					Will Kämpfen
// **************************************************

INSTANCE DIA_Scatty_WannaFight (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 1;
	condition	= DIA_Scatty_WannaFight_Condition;
	information	= DIA_Scatty_WannaFight_Info;
	permanent	= 1;
	description = "¡Quiero luchar en la arena!";
};                       

FUNC INT DIA_Scatty_WannaFight_Condition()
{
//	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
//	{
//		return 1;
//	};
};

FUNC VOID DIA_Scatty_WannaFight_Info()
{
	AI_Output (other,self,"DIA_Scatty_WannaFight_15_00"); //¡Quiero luchar en la arena!
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_01"); //¡No puedo dejarte luchar hasta que hayas ingresado en uno de los campamentos!
	AI_Output (self,other,"DIA_Scatty_WannaFight_01_02"); //¡Nadie quiere ver a un luchador independiente!
};

// **************************************************
// 					TRAIN
// **************************************************

INSTANCE DIA_Scatty_TRAIN (C_INFO)
{
	npc			= Grd_210_Scatty;
	nr			= 10;
	condition	= DIA_Scatty_TRAIN_Condition;
	information	= DIA_Scatty_TRAIN_Info;
	permanent	= 1;
	description = "¿Adiestráis a los luchadores?";
};                       

FUNC INT DIA_Scatty_TRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scatty_WhatDoYouDo))
	{
		return 1;
	};
};

FUNC VOID DIA_Scatty_TRAIN_Info()
{
	if( log_scattytrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
    B_LogEntry(GE_TeacherOC,"Scatty, el maestro de la arena, puede enseñarme a combatir con ARMAS DE UNA MANO.");
    log_scattytrain = TRUE;
    };
	AI_Output (other,self,"DIA_Scatty_TRAIN_15_00"); //¿Adiestráis a los luchadores?
	AI_Output (self,other,"DIA_Scatty_TRAIN_01_01"); //Sí, pero no por diversión. Si quieres que te adiestre, tendrás que pagar por ello.


	Info_ClearChoices	(DIA_Scatty_TRAIN );
	Info_AddChoice		(DIA_Scatty_TRAIN,DIALOG_BACK		,DIA_Scatty_TRAIN_BACK);
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 1) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,150)	,DIA_Scatty_TRAIN_2h);
	};
	if 	(Npc_GetTalentSkill(hero, NPC_TALENT_1H) == 0) 
	{
		Info_AddChoice		(DIA_Scatty_TRAIN,B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,50)	,DIA_Scatty_TRAIN_1h);
	};
};

func void DIA_Scatty_TRAIN_BACK()
{
	Info_ClearChoices	(DIA_Scatty_TRAIN );
};

func void DIA_Scatty_TRAIN_1h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_1h_15_00"); //Quiero mejorar mi manejo de las armas de una mano.
	
	if (Npc_HasItems(other,itminugget) >= 50)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 1, LPCOST_TALENT_1H_1))
		{
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_01"); //¡Buena decisión! Antes de mejorar tu técnica, tendrás que aprender a coger correctamente el arma.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_02"); //Los principiantes suelen agarrar las armas de una mano con las dos. No cojas esa costumbre, que no te hará ningún bien.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_03"); //Coge el arma con una mano, con la hoja hacia arriba, y ponte a ondearla.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_04"); //Tendrás que aprender a armonizar el balanceo de tu arma con tus propios movimientos. Eso te hará más rápido en el ataque.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_05"); //Si recuerdas lo que te he enseñado, en el futuro tus luchas serán más elegantes y mucho más rápidas.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_06"); //Ah sí, una cosa más: ¡algunos golpes causan más daño que otros! Como principiante, no tienes muchas posibilidades de infligir impactos críticos.
			AI_Output (self,other,"DIA_Scatty_TRAIN_1h_01_07"); //Pero cuanto más progreses, mejor serás.
			B_GiveInvItems(other,self,itminugget,50);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_1h_NoOre_01_00"); //¡No tienes suficiente mineral!
	};
};

func void DIA_Scatty_TRAIN_2h()
{
	AI_Output (other,self,"DIA_Scatty_TRAIN_2h_15_01"); //Enséñame a manejar mejor las armas de una mano.
	
	if (Npc_HasItems(other,itminugget) >= 150)
	{
		if (B_GiveSkill(other, NPC_TALENT_1H, 2, LPCOST_TALENT_1H_2))
		{
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_02"); //De acuerdo, ya conoces lo básico. Si mantienes baja el arma podrás imprimir más fuerza a tu primer golpe.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_03"); //Usa el balanceo, ¿recuerdas? Vale, ahora tienes que usar más tu cuerpo. Cuando hayas golpeado dos veces, gira. Eso confundirá al rival y te pondrá en una posición excelente.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_04"); //Después cruza tu hoja de derecha a izquierda una vez más.
			AI_Output (self, other,"DIA_Scatty_TRAIN_2h_Info_01_05"); //Y de nuevo al frente. No lo olvides: la práctica sirve para perfeccionar. Ponte a ello y domina el arte del combate con una mano.
			B_GiveInvItems(other,self,itminugget,150);
		};
	}
	else
	{
		AI_Output (self,other,"DIA_Scatty_TRAIN_2h_NoOre_01_00"); //¡Vuelve cuando tengas suficiente mineral!
	};
};
