// **************************************
//					EXIT 
// **************************************

instance DIA_Gomez_Exit (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 999;
	condition	= DIA_Gomez_Exit_Condition;
	information	= DIA_Gomez_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Gomez_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Gomez_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//		Nicht mit Raven geredet
// **************************************

instance DIA_Gomez_Fault (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Fault_Condition;
	information	= DIA_Gomez_Fault_Info;
	permanent	= 0;
	description	= "Vine a ofrecer mis servicios.";
};                       

FUNC int DIA_Gomez_Fault_Condition()
{
	if (!Npc_KnowsInfo(hero,DIA_Raven_There))
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_Fault_Info()
{
	AI_Output (other, self,"DIA_Gomez_Fault_15_00"); //Vine a ofrecer mis servicios.
	AI_Output (self, other,"DIA_Gomez_Fault_11_01"); //¿Llegas decididamente y esperas que me preocupe por ti, gusano? ¡GUARDIAS!
	
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};

// **************************************
//				Hallo
// **************************************
	var int gomez_kontakte;
// **************************************
	

instance DIA_Gomez_Hello (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Hello_Condition;
	information	= DIA_Gomez_Hello_Info;
	permanent	= 1;
	description	= "He venido a ofrecer mis servicios.";
};                       

FUNC int DIA_Gomez_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_There) && (gomez_kontakte<4) )
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_Hello_Info()
{
	AI_Output (other, self,"DIA_Gomez_Hello_15_00"); //He venido a ofrecer mis servicios.
	AI_Output (self, other,"DIA_Gomez_Hello_11_01"); //¿Qué te hace pensar que nos interesan tus servicios?
	
	Info_ClearChoices	(DIA_Gomez_Hello);																			
	Info_AddChoice		(DIA_Gomez_Hello,"Espero no tener que cortarte la cabeza para demostrar mi valía.",DIA_Gomez_Hello_KopfAb);
	Info_AddChoice		(DIA_Gomez_Hello,"Aquí no hay más que tarugos.",DIA_Gomez_Hello_Spinner);
	Info_AddChoice		(DIA_Gomez_Hello,"He viajado mucho y tengo contactos en todos los campamentos.",DIA_Gomez_Hello_Kontakte);
	Info_AddChoice		(DIA_Gomez_Hello,"He superado la prueba de fe.",DIA_Gomez_Hello_ThorusSays);
	
};

func void DIA_Gomez_Hello_ThorusSays()
{
	AI_Output (other, self,"DIA_Gomez_Hello_ThorusSays_15_00"); //He superado la prueba de fe y Thorus dice que soy digno.
	AI_Output (self, other,"DIA_Gomez_Hello_ThorusSays_11_01"); //No habrías llegado aquí vivo si no fuera así. Espero que eso no sea lo mejor que puedes hacer.
};

func void DIA_Gomez_Hello_Kontakte()
{
	gomez_kontakte = 0;
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_15_00"); //He viajado mucho y tengo contactos en todos los campamentos.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_11_01"); //Eso podría resultar útil. ¿Con quién estás en contacto?
	Info_ClearChoices	(DIA_Gomez_Hello);
	Info_AddChoice		(DIA_Gomez_Hello,"Aquellos eran los importantes.",DIA_Gomez_Hello_Kontakte_ThatsAll);
	Info_AddChoice		(DIA_Gomez_Hello,"Un par de peristas del Campamento Nuevo.",DIA_Gomez_Hello_Kontakte_NLHehler);
	Info_AddChoice		(DIA_Gomez_Hello,"Lares.",DIA_Gomez_Hello_Kontakte_Lares);
	//Info_AddChoice		(DIA_Gomez_Hello,"Zu Lee."	,DIA_Gomez_Hello_Kontakte_Lee);
	Info_AddChoice		(DIA_Gomez_Hello,"Unos cuantos Baal del campamento de la Hermandad.",DIA_Gomez_Hello_Kontakte_Baals);
	Info_AddChoice		(DIA_Gomez_Hello,"Cor Kalom.",DIA_Gomez_Hello_Kontakte_Kalom);
	
	if (gomez_kontakte < 3)
	{
	Info_AddChoice		(DIA_Gomez_Hello,"Y'Berion.",DIA_Gomez_Hello_Kontakte_YBerion);
	};
};

func void DIA_Gomez_Hello_Spinner()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Spinner_15_00"); //Aquí no hay más que tarugos, que buscan recién llegados a los que pasar sus trabajos para no hacerlos ellos mismos.
	AI_Output (self, other,"DIA_Gomez_Hello_Spinner_11_01"); //Eso puede ser cierto, con pocas excepciones. Aun así, no es motivo para contratar a otro tarugo.
};

func void DIA_Gomez_Hello_KopfAb()
{
	AI_Output (other, self,"DIA_Gomez_Hello_KopfAb_15_00"); //Espero que no tenga que cortarte la cabeza para demostrar que puedo blandir un arma.
	AI_Output (self, other,"DIA_Gomez_Hello_KopfAb_11_01"); //Hay una línea sutil entre la valentía y la estupidez.
	
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_ATTACK,1,"");
};

//----------------KONTAKTE--------------------


func void DIA_Gomez_Hello_Kontakte_YBerion()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_YBerion_15_00"); //Y'Berion.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_01"); //Y'Berion no pierde el tiempo con tipos como tú.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_02"); //Tus mentiras me dicen que crees que soy idiota.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_03"); //Es decepcionante ver que crees que soy ESTÚPIDO.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_04"); //Y odio las decepciones.
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};

func void DIA_Gomez_Hello_Kontakte_Kalom()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Kalom_15_00"); //Cor Kalom.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Kalom_11_01"); //¿Y?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_Baals()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Baals_15_00"); //Unos cuantos Baal del campamento de la Hermandad.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Baals_11_01"); //¿Y?
	gomez_kontakte = gomez_kontakte + 1;
};

/*
func void DIA_Gomez_Hello_Kontakte_Lee()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Lee_15_00"); //Zu Lee.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Lee_11_01"); //Lee ist also ein guter Freund von dir, ja?
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Lee_11_02"); //Dann sieht die Sache natürlich ANDERS AUS (zornig am ENDE)

	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};
*/
func void DIA_Gomez_Hello_Kontakte_Lares()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Lares_15_00"); //Lares.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Lares_11_01"); //¿Y?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_NLHehler()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_NLHehler_15_00"); //Un par de peristas del Campamento Nuevo.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_NLHehler_11_01"); //¿Y?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_ThatsAll()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_ThatsAll_15_00"); //Aquellos eran los importantes.
	if (gomez_kontakte >= 4)	
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_01"); //No está mal para un novato.
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_02"); //Tendrás tu oportunidad.
		Info_ClearChoices	(DIA_Gomez_Hello);
	}
	else
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_INSUFF_11_00"); //¿Esperas que ESO me impresione? ¡Tenemos CAVADORES con mejores contactos!
		Info_ClearChoices	(DIA_Gomez_Hello);
	};
};

// **************************************
//				Bin ich dabei
// **************************************

instance DIA_Gomez_Dabei (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Dabei_Condition;
	information	= DIA_Gomez_Dabei_Info;
	permanent	= 0;
	description	= "¿Significa eso que estoy admitido?";
};                       

FUNC int DIA_Gomez_Dabei_Condition()
{
	if	(gomez_kontakte >= 3)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_Dabei_Info()
{
	AI_Output (other, self,"DIA_Gomez_Dabei_15_00"); //¿Significa eso que estoy admitido?
	AI_Output (self, other,"DIA_Gomez_Dabei_11_01"); //Apuesta a que sí. Ya eres uno de los nuestros, muchacho.
	AI_Output (self, other,"DIA_Gomez_Dabei_11_02"); //Raven te explicará todo.
	
	Npc_SetTrueGuild (hero,GIL_STT );
	hero.guild = GIL_STT;
	B_GiveXP (XP_BecomeShadow);
	B_LogEntry			(CH1_JoinOC,"De ahora en adelante, trabajo para Gómez y el Campamento Viejo. ¡Raven me contará todo lo demás!");
	Log_SetTopicStatus	(CH1_JoinOC,	LOG_SUCCESS);

	// Canceln der anderen Aufnahmen
	Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
	B_LogEntry			(CH1_JoinNC,"Dado que ahora pertenezco a la gente de Gómez, ¡no me admiten en la banda de Lares!");
	
	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
	B_LogEntry			(CH1_JoinPsi,"De ahora en adelante, el Campamento Viejo es mi nuevo hogar. La Hermandad del Durmiente tendrá que arreglárselas sin mí.");
	
	AI_StopProcessInfos	(self);
};

// **************************************
//				Nur so (PERM)
// **************************************

instance DIA_Gomez_NurSo (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_NurSo_Condition;
	information	= DIA_Gomez_NurSo_Info;
	permanent	= 1;
	description	= "Se me ocurrió presentarme para informar.";
};                       

FUNC int DIA_Gomez_NurSo_Condition()
{
	if (Raven_SpySect==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_NurSo_Info()
{
	AI_Output (other, self,"DIA_Gomez_NurSo_15_00"); //Se me ocurrió presentarme para informar.
	AI_Output (self, other,"DIA_Gomez_NurSo_11_00"); //Entonces ve a ver a Raven. ¡Y no vuelvas a hablarme a menos que se te ordene!
};


////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////////////////   	Kapitel 5        ///////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////


// ***********************************************
// 				Wartet auf den SC
// ***********************************************

instance  DIA_EBR_100_Gomez_Wait4SC (C_INFO)
{
	npc				= EBR_100_Gomez;
	condition		= DIA_EBR_100_Gomez_Wait4SC_Condition;
	information		= DIA_EBR_100_Gomez_Wait4SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_EBR_100_Gomez_Wait4SC_Condition()
{	
	if	ExploreSunkenTower
	{
		return TRUE;
	};
};
FUNC void  DIA_EBR_100_Gomez_Wait4SC_Info()
{
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_01"); //¿Cómo has entrado aquí?
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_02"); //¡Espera! ¿No eres uno de los que lucharon con nuestros hombres en la Mina Libre?
	AI_Output (other, self,"DIA_EBR_100_Gomez_Wait4SC_15_03"); //Tus hombres no tenían derecho a invadirla. ¡Simplemente corregí su ataque de megalomanía!
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_04"); //Hablarme a mí, a GOMEZ, de ese modo demuestra cierta valentía. Pero cometiste una estupidez al presentarte aquí así.
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_05"); //Me encargaré personalmente de que no te vuelvas a interponer en mi camino.
	
	AI_StopProcessInfos	( self );

	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	( self, GIL_EBR );	
};
