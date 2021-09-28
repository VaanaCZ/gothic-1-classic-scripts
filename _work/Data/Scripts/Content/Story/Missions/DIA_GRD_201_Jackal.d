// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Jackal_EXIT (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 999;
	condition	= Info_Jackal_EXIT_Condition;
	information	= Info_Jackal_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Jackal_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Jackal_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
	var int Jackal_ProtectionPaid;
	var int Jackal_PayDay;
// ************************************************************

INSTANCE Info_Jackal_Hello (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Hello_Condition;
	information	= Info_Jackal_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_Hello_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
FUNC VOID Info_Jackal_Hello_Info()
{	
	AI_Output (self, other,"Info_Jackal_Hello_07_00"); //¡Ah! Una cara nueva.
	AI_Output (other, self,"Info_Jackal_Hello_15_01"); //¿Qué quieres?
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //Quiero ofrecerte ayuda. Eres nuevo, y los nuevos siempre se meten en líos... Podrías evitarlo haciendo un pequeño donativo.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //¡Sólo 10 pepitas, tío! No es mucho pedir.
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"¿Y si no pago?",Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"¿Y qué gano con ello?",Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"Aquí tienes 10 pepitas de mineral. Tendrás que ayudarme si me meto en líos.",Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //Aquí tienes 10 pepitas de mineral. Y tendrás que ayudarme si me meto en líos.
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //Cuenta conmigo si estoy cerca. Me encontrarás entre el mercado y la puerta sur.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //Las otras zonas son asunto de Fletcher y Bloodwyn.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //Eh, ¿a quién intentas engañar? ¡Vuelve cuando tengas el mineral!
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //¿Y qué gano con ello?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //Mientras estés en mi distrito, te protegeré.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //Si te metes en líos con los tipos del Campamento Nuevo, o si uno de los zumbados de la secta te crispa los nervios, puedes contar conmigo.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //Si tienes problemas con uno de los cavadores, ayudaremos al que haya pagado. Así de sencillo.
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //¿Y si ambos hemos pagado?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Nos sentaremos y veremos el espectáculo. Pero eso no suele suceder.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //¿Y si no pago?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //¡Eh tío, no te estreses! Acabas de llegar, date un vuelta. Reúne un poco de mineral y paga cuando puedas hacerlo.
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //Puedes hacerlo en cualquier momento, pero no cuentes con mi ayuda hasta que hayas hecho tu contribución a mis gastos. Seguro que lo entiendes.
	Info_AddChoice		(Info_Jackal_Hello,"Hasta luego.",Info_Jackal_Hello_Later);
};

func void Info_Jackal_Hello_Later()
{
	AI_Output (other, self,"Info_Jackal_Hello_Later_15_00"); //Hasta luego.
	AI_Output (self, other,"Info_Jackal_Hello_Later_07_01"); //Cuídate.
	Jackal_ProtectionPaid = FALSE;
	Npc_SetPermAttitude(self,ATT_NEUTRAL);
	Jackal_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Jackal_Hello);
};

// ************************************************************
// 					DOCH Schutzgeld
// ************************************************************

// Bei JACKAL reicht es, wenn man EINMAL zahlt

INSTANCE Info_Jackal_Schutz (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Schutz_Condition;
	information	= Info_Jackal_Schutz_Info;
	permanent	= 0;
	description = "He estado pensando en el pago a cambio de protección: toma las 10 pepitas.";
};                       

FUNC INT Info_Jackal_Schutz_Condition()
{
	if ( (Npc_KnowsInfo(hero,Info_Jackal_Hello)) && (Jackal_ProtectionPaid == FALSE) )
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_Schutz_Info()
{	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //He estado pensando en el pago a cambio de protección: aquí tienes las 10 pepitas.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //Has tomado la decisión correcta, tío. ¡A partir de ahora de protegeré!
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //No veo las 10 pepitas, tío. Vuelve cuando las tengas.
	};
};


// ************************************************************
// 					Perm - wenn gezahlt
// ************************************************************

INSTANCE Info_Jackal_PermPaid (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_PermPaid_Condition;
	information	= Info_Jackal_PermPaid_Info;
	permanent	= 1;
	description = "Bueno, ¿qué tal estás?";
};                       

FUNC INT Info_Jackal_PermPaid_Condition()
{
	if (Jackal_ProtectionPaid == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_PermPaid_Info()
{	
	AI_Output (other, self,"Info_Jackal_PermPaid_15_00"); //Bueno, ¿qué tal estás?
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //¡Siempre puedes contar conmigo, muchacho!
};

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_201_Jackal_WELCOME (C_INFO)
{
	npc				= GRD_201_Jackal;
	condition		= GRD_201_Jackal_WELCOME_Condition;
	information		= GRD_201_Jackal_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_201_Jackal_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_201_Jackal_WELCOME_Info()
{
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //¡Has ascendido muy rápido! ¡Bien hecho, tío!
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info	PAYDAY
//---------------------------------------------------------------------
INSTANCE Info_Jackal_PAYDAY (C_INFO)
{
	npc			= GRD_201_Jackal;
	condition	= Info_Jackal_PAYDAY_Condition;
	information	= Info_Jackal_PAYDAY_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_PAYDAY_Condition()
{
	if (FMTaken)
	{
		return TRUE;
	};
};

FUNC VOID Info_Jackal_PAYDAY_Info()
{	
	if	C_NpcBelongsToNewCamp(hero)
	{
		if 	(oldHeroGuild == GIL_GRD)
		||	(oldHeroGuild == GIL_KDF)
		||	(oldHeroGuild == GIL_STT)
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //¡Eh, mira eso! ¡Es el traidor que se cambió de campamento!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //¡Si no te hubieras relacionado con esos perdedores, seguirías siendo uno de los nuestros!
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //¡Eh, mira! Es ese tipo del Campamento Nuevo, el que nos dio tanta guerra!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //Si hubieras sido más sensato entonces, ahora estarías en nuestro bando. ¡El bando de los ganadores!
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //Mira eso. Es el tipo del campamento de la ciénaga.
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //Llevas mucho tiempo con esos zumbados, y te han vuelto estúpido.
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //Ni siquiera el dinero de protección que me pagaste va a ayudarte ahora.
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //Deberías haberme pagado cuando tuviste la oportunidad.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //¡Has ido demasiado lejos! ¡Vaya idea más estúpida atacar la mina!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //Parece que ha funcionado. ¡Y tú no vas a cambiar eso, créeme!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //¡EH, MUCHACHOS, ECHÉMOSLE!
	
	AI_StopProcessInfos	(self);
	
	B_Story_JackalFight	();
};

