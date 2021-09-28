//***************************************************************************
//	Info EXIT
//***************************************************************************

INSTANCE Info_Gorn_EXIT (C_INFO)
{
	npc			= PC_Fighter;
	nr   		= 999;
	condition	= Info_Gorn_EXIT_Condition;
	information	= Info_Gorn_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Gorn_EXIT_Condition()
{
	return 1;
};

func VOID Info_Gorn_EXIT_Info()
{
	if	self.aivar[AIV_PARTYMEMBER]
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_01"); //�Luchemos!
	}
	else
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_02"); //Hasta luego.
	};
	
	AI_StopProcessInfos	( self );
};

//*************************************
//			1. Begr��ung
//*************************************

instance DIA_Gorn_First (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_First_Condition;
	information		= Dia_Gorn_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int DIA_Gorn_First_Condition()
{
	if	(Kapitel < 3)
	{
		return 1;
	};
};

func void DIA_Gorn_First_Info()
{
	AI_Output (self, other,"DIA_Gorn_First_09_00"); //Eh. Una cara nueva.
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //�Qui�n eres t�?
	AI_Output (self, other,"DIA_Gorn_First_09_02"); //Soy Gorn, mercenario de los magos.
};

//*************************************
//				Leben
//*************************************

instance DIA_Gorn_Leben (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 2;
	condition		= Dia_Gorn_Leben_Condition;
	information		= Dia_Gorn_Leben_Info;
	permanent		= 0;
	description		= "�Qu� hay que hacer como mercenario de los magos?";
};

FUNC int DIA_Gorn_Leben_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Leben_Info()
{
	AI_Output (other, self,"DIA_Gorn_Leben_15_00"); //�Cu�l es tu labor como mercenario de los magos?
	AI_Output (self, other,"DIA_Gorn_Leben_09_01"); //Lee ha hecho un trato con los magos. �l contrata a los mejores combatientes que hay en la colonia. O sea, a nosotros.
	AI_Output (self, other,"DIA_Gorn_Leben_09_02"); //Nosotros nos ocupamos de que los raspadores puedan extraer el mineral sin ser molestados y de que los magos no tengan problemas.
	AI_Output (self, other,"DIA_Gorn_Leben_09_03"); //Los magos aseguran que salgamos de aqu�. Y nos dar�n una parte del mineral como pago.
};

//*************************************
//			H�tte (Shrike)
//*************************************
	var int Gorn_ShrikesHut;
//*************************************

instance DIA_Gorn_Hut (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_Hut_Condition;
	information		= Dia_Gorn_Hut_Info;
	permanent		= 0;
	description		= "�Puedo quedarme por aqu�?";
};

FUNC int DIA_Gorn_Hut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Hut_Info()
{
	AI_Output (other, self,"DIA_Gorn_Hut_15_00"); //�Hay alg�n lugar en el que pueda alojarme aqu� sin tener que echar a alguien de su caba�a?
	AI_Output (self, other,"DIA_Gorn_Hut_09_01"); //Me parece que no. Pero si est�s seguro de que eso es lo que deseas, vete a ver a Shrike.
	AI_Output (self, other,"DIA_Gorn_Hut_09_02"); //Ocupa la caba�a que est� frente a la entrada de la cueva. Estaba vac�a, pero en realidad nos pertenec�a a nosotros.
	AI_Output (other, self,"DIA_Gorn_Hut_15_03"); //�Nosotros?
	AI_Output (self, other,"DIA_Gorn_Hut_09_04"); //Bueno, a nosotros los mercenarios. Aqu�, los mercenarios y los bandidos viven separadamente. Y ninguno de los hombres de Lares deber�a estar aqu�, a este lado del gran agujero.
	AI_Output (self, other,"DIA_Gorn_Hut_09_05"); //La verdad es que no tiene demasiada importancia. Pero no pidi� permiso. �Y no puedes dejar que esos bandidos se salgan con la suya, porque se vuelven muy engre�dos!

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,"Gorn, el mercenario, me ha contado que Shrike ha ocupado una caba�a de los mercenarios sin avisar. Dado que se lo he preguntado a Dorn, ninguno de los mercenarios interferir� si 'convenzo' a Shrike de que se largue de all�.");
	Gorn_ShrikesHut = LOG_RUNNING;
};

//*************************************
//			H�tte LEER (Shrike)
//*************************************

instance DIA_Gorn_HutFree (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_HutFree_Condition;
	information		= Dia_Gorn_HutFree_Info;
	permanent		= 0;
	description		= "Shrike se ha mudado a otra caba�a.";
};

FUNC int DIA_Gorn_HutFree_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Shrike_GetLost))
	{
		return 1;
	};
};

func void DIA_Gorn_HutFree_Info()
{
	AI_Output			(other, self,"DIA_Gorn_HutFree_15_00"); //Shrike se ha mudado a otra caba�a.
	AI_Output			(self, other,"DIA_Gorn_HutFree_09_01"); //Bien. Torlof me acaba de decir que quiere hablar con ese tipo.

	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_SUCCESS);
	B_LogEntry			(CH1_ShrikesHut,"A Gorn le ha parecido muy divertido que haya echado a Shrike de su caba�a. Creo que es un tipo honrado. Duro, pero justo. Me convendr�a mantenerme cerca de �l en el futuro.");
	B_GiveXP			(XP_ReportedKickedShrike);
};

//*************************************
//			S�ldner werden
//*************************************

instance DIA_Gorn_BecomeSLD (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 5;
	condition		= Dia_Gorn_BecomeSLD_Condition;
	information		= Dia_Gorn_BecomeSLD_Info;
	permanent		= 0;
	description		= "�Qu� tengo que hacer para ingresar en el Campamento Nuevo?";
};

FUNC int DIA_Gorn_BecomeSLD_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Gorn_First)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_Gorn_BecomeSLD_Info()
{
	AI_Output (other, self,"DIA_Gorn_BecomeSLD_15_00"); //�Qu� es lo que tengo que hacer para unirme al Campamento Nuevo?
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_01"); //Antes de que Lee te admita, tienes que mejorar tus habilidades de combate. No importa qu� arma utilices, pero tienes que ser bueno con ella.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_02"); //Adem�s, deber�as tener mucha experiencia con la vida de por aqu� y todo eso.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_03"); //Si no quieres ir a uno de los otros campamentos, deber�as intentar unirte a los bandidos antes de meterte a mercenario.
};

/*
//*************************************
//				PERM
//*************************************

instance DIA_Gorn_PERM (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_PERM_Condition;
	information		= Dia_Gorn_PERM_Info;
	permanent		= 1;
	description		= "";
};

FUNC int DIA_Gorn_PERM_Condition()
{
	return 1;
};

func void DIA_Gorn_PERM_Info()
{
	AI_Output (other, self,"DIA_Gorn_PERM_15_00"); //
	AI_Output (self, other,"DIA_Gorn_PERM_09_01"); //
};
*/

//*************************************
//				TRADE
//*************************************
	var int Gorn_Trade;
//*************************************

instance DIA_Gorn_TRADE (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 800;
	condition		= Dia_Gorn_TRADE_Condition;
	information		= Dia_Gorn_TRADE_Info;
	permanent		= 1;
	description		= DIALOG_TRADE;
	trade 			= 1;
};

FUNC int DIA_Gorn_TRADE_Condition()
{
	//if (Npc_KnowsInfo(hero,DIA_Gorn_DuHehler))
	//{
		//return 1; //***Man darf NICHT seine Waffe weggkaufen oder so...
	//};
};

func void DIA_Gorn_TRADE_Info()
{
	AI_Output (other, self,"DIA_Gorn_TRADE_15_00"); //�Tienes algo m�s de eso?
	AI_Output (self, other,"DIA_Gorn_TRADE_09_01"); //De sobra. �Quieres comerciar?
};

//*************************************
//			DU Hehler?
//*************************************

instance DIA_Gorn_DuHehler (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_DuHehler_Condition;
	information		= Dia_Gorn_DuHehler_Info;
	permanent		= 0;
	description		= "�Por qu� tomaste parte en una de las incursiones de la banda?";
};

FUNC int DIA_Gorn_DuHehler_Condition()
{
	if (Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil))
	{
		return 1;
	};
};

func void DIA_Gorn_DuHehler_Info()
{
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_00"); //�Por qu� participaste en uno de los asaltos de la banda?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_01"); //�Qui�n dice que lo hice?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_02"); //�Por qu� ibas a tener tanto si no fuera cierto?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_03"); //No vayas a pensar que todo esto proviene de un solo bot�n.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_04"); //�Tomas parte en los ataques con mucha frecuencia?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_05"); //Si as� fuera, no podr�a dec�rtelo. A lee no le gustar�a ni un pelo.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_06"); //Entiendo.
	
	CreateInvItems(self, ItFoApple, 21);
	B_GiveInvItems	(self,other, ItFoApple,21); //Notwendig f�r Screenausgabe
	Npc_RemoveInvItems (other, ItFoApple,21);
	
	CreateInvItems(other, ItMw_1H_LightGuardsSword_03, 1);
	CreateInvItems(other, ItFoApple, 5);
	CreateInvItems(other, ItFoLoaf, 5);
	CreateInvItems(other, ItFoCheese, 5);
	CreateInvItems(other, ItFoBeer, 5);
};







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NCWAIT
//***************************************************************************
INSTANCE Info_Gorn_NCWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 1;
	condition	= Info_Gorn_NCWAIT_Condition;
	information	= Info_Gorn_NCWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_NCWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"NC_PATH52")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_NCWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_NCWAIT_09_01"); //�Ah, eres t�! Mi amigo Lester del pantano me cont� todo lo que hac�ais aqu�.
	AI_Output (self, other,"Info_Gorn_NCWAIT_09_02"); //Para ser alguien que no lleva mucho tiempo aqu�, has llegado muy lejos.
	AI_Output (other, self,"Info_Gorn_NCWAIT_15_03"); //Tambi�n he estado cerca de convertirme en comida para gusanos un par de veces.
};

//***************************************************************************
//	Info MAGES
//***************************************************************************
INSTANCE Info_Gorn_MAGES (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MAGES_Condition;
	information	= Info_Gorn_MAGES_Info;
	important	= 0;	
	permanent	= 0;
	description	= "�Tengo un mensaje importante para los Magos del Agua!";
};                       

FUNC INT Info_Gorn_MAGES_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_NCWAIT))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MAGES_Info()
{
	AI_Output (other, self,"Info_Gorn_MAGES_15_01"); //�Tengo un mensaje importante para los Magos del Agua!
	AI_Output (self, other,"Info_Gorn_MAGES_09_02"); //Entonces deber�as ir a hablar con Saturas. Es el mago del agua superior y se pasa todo el d�a estudiando unos escritos u otros.
	AI_Output (self, other,"Info_Gorn_MAGES_09_03"); //Pero da igual lo importante que sea tu mensaje; los guardias del nivel superior no te dejar�n entrar a verle.
	AI_Output (other, self,"Info_Gorn_MAGES_15_04"); //�No podr�as interceder por m�?
	AI_Output (self, other,"Info_Gorn_MAGES_09_05"); //No, pero Cronos, el guardi�n del mineral, podr�a concederte un permiso.
};

//***************************************************************************
//	Info CRONOS
//***************************************************************************
INSTANCE Info_Gorn_CRONOS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_CRONOS_Condition;
	information	= Info_Gorn_CRONOS_Info;
	important	= 0;	
	permanent	= 0;
	description	= "�D�nde puedo encontrar al 'guardi�n del mineral'?";
};                       

FUNC INT Info_Gorn_CRONOS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_MAGES))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_CRONOS_Info()
{
	AI_Output			(other, self,"Info_Gorn_CRONOS_15_01"); //�D�nde puedo encontrar a este 'guardi�n del mineral'?
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_01a");//Saliendo de aqu� te encontrar�s una gran cueva habitada m�s all� la presa.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_02"); //Cronos suele estar en la reja que hay sobre el gran mont�culo de mineral.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_03"); //Pero es un poco arrogante. Tendr�s que convencerle de la importancia de tu mensaje.

	VAR C_NPC Cronos;
	Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	
	B_LogEntry		(CH3_EscapePlanNC,"Gorn me ha recomendado que vaya directamente ante el Gran Mago del Agua, que se llama Saturas. Cronos, el guardi�n del mineral, puede conseguirme una audiencia."); 

	Npc_ExchangeRoutine	(self, "start");
};

//***************************************************************************
//	Info RUINWAIT
//***************************************************************************
INSTANCE Info_Gorn_RUINWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 2;
	condition	= Info_Gorn_RUINWAIT_Condition;
	information	= Info_Gorn_RUINWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"OW_PATH_ABYSS_4")<1000)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_01"); //Hola, novato. Como puedes comprobar, la colonia es un pa�uelo.
	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_02"); //Es imposible no andar encontr�ndose a la misma gente continuamente.
};

//***************************************************************************
//	Info RUINWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWHAT_Condition;
	information	= Info_Gorn_RUINWHAT_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Qu� est�s haciendo aqu�?";
};                       

FUNC INT Info_Gorn_RUINWHAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWHAT_Info()
{
	AI_Output 		(other, self,"Info_Gorn_RUINWHAT_15_01"); //�Qu� haces aqu�?
	AI_Output		(self, other,"Info_Gorn_RUINWHAT_09_02"); //Oh, estoy intentando encontrar a una vieja leyenda.
	AI_Output		(other, self,"Info_Gorn_RUINWHAT_15_03"); //�Una leyenda?
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_04"); //S�; Milten, mi amigo del Campamento Viejo me ha dicho que aqu� sol�an vivir unos monjes.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_05"); //Claro que eso fue mucho antes de la creaci�n de la Barrera.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_06"); //Se dice que adoraban a un dios que les otorgaba el poder de convertirse en animales.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_07"); //Estoy seguro de que aqu� todav�a hay tesoros de los viejos tiempos.

	if (!Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS))
	{	
		AI_Output	(self, other,"Info_Gorn_RUINWHAT_09_08"); //�Qu� es lo que te trae por aqu�?
	};
};

//***************************************************************************
//	Info RUINFOCUS
//***************************************************************************
INSTANCE Info_Gorn_RUINFOCUS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINFOCUS_Condition;
	information	= Info_Gorn_RUINFOCUS_Info;
	important	= 0;	
	permanent	= 0;
	description = "Busco un foco m�gico.";
};                       

FUNC INT Info_Gorn_RUINFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINFOCUS_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_01"); //Estoy buscando un foco m�gico.
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_02"); //Tiene que estar en alg�n lugar de por aqu�.
	AI_Output (self, other,"Info_Gorn_RUINFOCUS_09_03"); //Puede que lo que andas buscando se encuentre en el viejo monasterio en ruinas m�s all� del ca��n.
};

//***************************************************************************
//	Info RUINJOIN
//***************************************************************************
INSTANCE Info_Gorn_RUINJOIN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINJOIN_Condition;
	information	= Info_Gorn_RUINJOIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Podr�amos continuar juntos.";
};                       

FUNC INT Info_Gorn_RUINJOIN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS) && Npc_KnowsInfo(hero, Info_Gorn_RUINWHAT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINJOIN_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_01"); //Podr�amos ir juntos.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_02"); //Buena idea. Esta zona est� infestada de chasqueadores.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_03"); //Cuando van solos no suponen ning�n problema para un cazador experimentado. Pero suelen cazar en manada.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_04"); //Una manada puede despedazar hasta al mejor de los espadachines.
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_05"); //�Vamos juntos, entonces?
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_06"); //De acuerdo, pero antes de cruzar este tronco, me gustar�a explorar el ca��n. Me gusta saber qu� tengo a mi espalda.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_07"); //Ven conmigo; he descubierto un sendero que nos conducir� all�.

	Log_CreateTopic		(CH3_MonasteryRuin,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_RUNNING);
	B_LogEntry			(CH3_MonasteryRuin,"Al acercarme al monasterio en ruinas, me he encontrado con el mercenario Gorn. Est� aqu� para registrar las ruinas en busca de viejos tesoros.");
	B_LogEntry			(CH3_MonasteryRuin,"Continuaremos nuestra b�squeda juntos. Gorn me ha advertido que en la zona hay grandes reba�os de chasqueadores.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,	"RuinAbyss");
};

//***************************************************************************
//	Info RUINABYSS
//***************************************************************************
INSTANCE Info_Gorn_RUINABYSS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINABYSS_Condition;
	information	= Info_Gorn_RUINABYSS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINABYSS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) && (Npc_GetDistToWP(self,"OW_ABYSS_TO_CAVE_MOVE6")<1000) )
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINABYSS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_01"); //Esto es lo que yo llamo suerte. Parece que era una cueva-almac�n.
	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_02"); //Ve t� por delante; quiero comprobar que no seremos sorprendidos en nuestro viaje de regreso.

	B_LogEntry		(CH3_MonasteryRuin,"Hemos descubierto una cueva de suministros secreta. Sobre todo, una llave y dos pergaminos de conjuro han resultado ser bastante interesantes.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinFollow");
};

//***************************************************************************
//	Info RUINLEAVE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVE_Condition;
	information	= Info_Gorn_RUINLEAVE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_175_MEATBUG")>15000)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEAVE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_01"); //Pareces haber perdido el inter�s por el monasterio en ruinas.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_02"); //Seguir� yo solo.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_03"); //Si cambias de opini�n, s�gueme

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinWall");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINWALL
//***************************************************************************
INSTANCE Info_Gorn_RUINWALL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALL_Condition;
	information	= Info_Gorn_RUINWALL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWALL_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		(Npc_GetDistToWP(hero,"OW_PATH_175_GATE1")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWALL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_01"); //Esta maldita puerta. Dicen que nadie del campamento ha podido abrirla.
	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_02"); //Esas bestezuelas de ah� parecen ser las �nicas que han conseguido entrar en el patio interior.

	B_LogEntry		(CH3_MonasteryRuin,"Estamos justo frente a una puerta cerrada. Parece que no puede abrirse desde fuera.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinWall");
};

//***************************************************************************
//	Info RUINWALLWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWALLWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALLWHAT_Condition;
	information	= Info_Gorn_RUINWALLWHAT_Info;
	important	= 0;	
	permanent	= 1;
	description = "�Ahora qu� pasa?";
};                       

FUNC INT Info_Gorn_RUINWALLWHAT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINWALL)
	&& 		!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINWALLWHAT_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINWALLWHAT_15_01"); //�Y ahora qu�?
	AI_Output (self, other,"Info_Gorn_RUINWALLWHAT_09_02"); //Tienes que encontrar un modo de conseguir llegar al otro lado de la puerta.
};

//***************************************************************************
//	Info RUINLEDGE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEDGE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEDGE_Condition;
	information	= Info_Gorn_RUINLEDGE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEDGE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_MONSTER_NAVIGATE_02")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEDGE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_01"); //All� arriba hay una especie de plataforma. Pero parece estar demasiado alta como para escalar hasta ella.
	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_02"); //Tendremos que encontrar otro camino.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINPLATFORM
//***************************************************************************
INSTANCE Info_Gorn_RUINPLATFORM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINPLATFORM_Condition;
	information	= Info_Gorn_RUINPLATFORM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINPLATFORM_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_176_TEMPELFOCUS4")<300)	)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINPLATFORM_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_01"); //Parece una especie de pedestal.
	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_02"); //Tal vez el objeto que buscas se encontrase sobre �l.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINGATE
//***************************************************************************
INSTANCE Info_Gorn_RUINGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINGATE_Condition;
	information	= Info_Gorn_RUINGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINGATE_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		MonasteryRuin_GateOpen																	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINGATE_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINGATE_09_01"); //Has conseguido abrir la puerta. Ese hechizo tuyo ha sido muy ingenioso.
	AI_Output			(other, self,"Info_Gorn_RUINGATE_15_02"); //Venga, sigamos adelante.

	B_LogEntry		(CH3_MonasteryRuin,"Me he transformado en sabandija de carne con la ayuda de los pergaminos de conjuro de la cueva de suministro. As� he podido arrastrarme a trav�s del hueco de la pared.");
	B_LogEntry		(CH3_MonasteryRuin,"La puerta ya est� abierta.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"RuinFollowInside");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info RUINLEAVEINSIDE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVEINSIDE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVEINSIDE_Condition;
	information	= Info_Gorn_RUINLEAVEINSIDE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVEINSIDE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_ABYSS_CROSS_6")<1000)
	&&	!Npc_HasItems(hero, Focus_4)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINLEAVEINSIDE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //Pareces haber perdido el inter�s por el monasterio en ruinas.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //Seguir� yo solo.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Si cambias de opini�n, s�gueme

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinStay");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINSUCCESS
//***************************************************************************
INSTANCE Info_Gorn_RUINSUCCESS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINSUCCESS_Condition;
	information	= Info_Gorn_RUINSUCCESS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINSUCCESS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		Npc_HasItems (hero, Focus_4)			)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINSUCCESS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_01"); //�As� que has encontrado tu artefacto m�gico!
	AI_Output 			(other, self,"Info_Gorn_RUINSUCCESS_15_02"); //S�, Tengo que llevar el foco a los Magos del Agua. Lo necesitan.
	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_03"); //te acompa�ar� un rato.

	B_LogEntry		(CH3_MonasteryRuin,"He encontrado el foco en una especie de estudio. Gorn me acompa�ar� un poco m�s.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinYard");

	Wld_InsertNpc		(YoungTroll,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINTROLL
//***************************************************************************
INSTANCE Info_Gorn_RUINTROLL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINTROLL_Condition;
	information	= Info_Gorn_RUINTROLL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINTROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_SNAPPER04_SPAWN01")<1000)		)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINTROLL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_01"); //�OH, DIABLOS! �Qu� es ese monstruo de all�?
	AI_Output 			(other, self,"Info_Gorn_RUINTROLL_15_02"); //�De d�nde ha salido eso?
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_03"); //�Se parece a uno de esos trolls invencibles. �S�lo que en peque�o!
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_04"); //Sea lo que sea, si queremos salir de aqu�, tenemos que superar a esa bestia.

	AI_StopProcessInfos	(self);

	AI_DrawWeapon		(self);
	AI_SetWalkmode		(self,	NPC_RUN);
	//AI_GotoWP			(self,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINVICTORY
//***************************************************************************
INSTANCE Info_Gorn_RUINVICTORY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINVICTORY_Condition;
	information	= Info_Gorn_RUINVICTORY_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINVICTORY_Condition()
{
	var C_NPC	yTroll;
	yTroll = Hlp_GetNpc(YoungTroll);

	if	Npc_KnowsInfo(hero, Info_Gorn_RUINTROLL) 
	&&	Npc_IsDead(yTroll)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINVICTORY_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_01"); //Ha sido dificilillo.
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_02"); //S�, hemos derrotado a ese monstruo. Pero si no era m�s que un troll joven...
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_03"); //...preferir�as no toparte con sus padres, �eh?
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_04"); //Algo as�.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_05"); //Aqu� es donde se separan nuestros caminos. Quiero quedarme por aqu� un tiempo y explorar un poco.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_06"); //Pero estoy seguro de que nos volveremos a encontrar. Hasta la vista, amigo m�o.

	B_LogEntry		(CH3_MonasteryRuin,"Volviendo al patio del monasterio, nos hemos encontrado con un troll joven. Ha sido un duro combate, pero hemos vencido.");
	B_LogEntry		(CH3_MonasteryRuin,"Mi viaje junto a Gorn ha llegado a su fin. Tengo la sensaci�n de que pronto volver� a encontrarme con �l.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"RuinStay");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DIEGOMILTEN
//---------------------------------------------------------------------
INSTANCE Info_Gorn_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_DIEGOMILTEN_Condition;
	information	= Info_Gorn_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Me encontr� a Diego y a Milten frente al Campamento Viejo!";
};                       

FUNC INT Info_Gorn_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_DIEGOMILTEN_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //�He visto a Diego y Milten en el Campamento Viejo!
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //�Eso es una buena noticia!
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //Quieren veros a ti y a Lester. En el lugar de reuni�n habitual.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Gracias. No hay nada m�s valioso que un buen amigo en estos tiempos turbulentos.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //Ya casi eres uno de los nuestros. �Eres de fiar!

	B_GiveXP			(XP_MessageForGorn);
	
	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else 
	{
		B_LogEntry			(CH4_4Friends,		"He informado a Lester y Gorn acerca de la reuni�n con sus amigos. Ahora ya no es asunto m�o. Ellos sabr�n qu� van a hacer..."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};

};

//---------------------------------------------------------------------
//	Info FREEMINE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FREEMINE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FREEMINE_Condition;
	information	= Info_Gorn_FREEMINE_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Qu� viste en la Mina Libre?";
};                       

FUNC INT Info_Gorn_FREEMINE_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	&& !FindXardas
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FREEMINE_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_01"); //�Qu� has visto en la Mina Libre?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_02"); //Despu�s de volver del monasterio en ruinas, quer�a pasarme a ver a Okyl, el jefe de la Mina Libre.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_03"); //Pero, cuando llegu�, no encontr� m�s que cad�veres tirados por todas partes.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_04"); //Acabo de ver a unos guardias apost�ndose a la entrada de la mina.
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_05"); //�C�mo es posible que un par de docenas de guardias hayan derrotado a tantos mercenarios?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_06"); //A mi me pareci� que hab�a sido una emboscada. Nadie hubiera esperado que unos atacantes cruzaran las monta�as.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_07"); //El elemento sorpresa puede multiplicar el poder de una tropa.
};

//---------------------------------------------------------------------
//	Info GUARDNC
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNC (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNC_Condition;
	information	= Info_Gorn_GUARDNC_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Qu� tienes planeado?";
};                       

FUNC INT Info_Gorn_GUARDNC_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNC_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_01"); //�Qu� planeas hacer ahora?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_02"); //Habr� que cambiar toda nuestra estrategia defensiva. Eso lleva tiempo.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_03"); //Mientras se preparan Lee y su gente, me unir� a la guardia provisional de Cord.
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_04"); //�Planeas llevar a cabo un contraataque?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_05"); //Todav�a no, pero ya llegar� el momento de hacerlo.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_06"); //Si quieres encontrarme en el futuro, camina desde aqu� en direcci�n a la mina. Estar� vigilando all�.

	B_Story_CordsPost	();

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GUARDNCRUNNING
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNCRUNNING (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNCRUNNING_Condition;
	information	= Info_Gorn_GUARDNCRUNNING_Info;
	important	= 0;	
	permanent	= 1;
	description = "�Qu� tal?";
};                       

FUNC INT Info_Gorn_GUARDNCRUNNING_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_GUARDNC)
	&&	!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNCRUNNING_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01"); //�C�mo van las cosas?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Todo est� tranquilo. No hay movimiento en la Mina Libre.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //�Lee todav�a est� ocupado organizando nuestra defensa!
};

//---------------------------------------------------------------------
//	Info POST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_POST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_POST_Condition;
	information	= Info_Gorn_POST_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_POST_Condition()
{
	if (UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_POST_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_POST_09_01"); //�Llegas justo a tiempo! Estamos preparando un contraataque.
	AI_Output 			(self, hero,"Info_Gorn_POST_09_02"); //La reconquista de la Mina Libre no es m�s que el primer paso.
};

//---------------------------------------------------------------------
//	Info TAKEBACK
//---------------------------------------------------------------------
INSTANCE Info_Gorn_TAKEBACK (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_TAKEBACK_Condition;
	information	= Info_Gorn_TAKEBACK_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Tienes pensado recuperarla s�lo con cuatro hombres?";
};                       

FUNC INT Info_Gorn_TAKEBACK_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_TAKEBACK_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_TAKEBACK_15_01"); //�Planeas reconquistarla con s�lo 4 hombres? �D�nde est�n todos los mercenarios?
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_02"); //�Un ataque frontal no servir� de nada! �La gente de G�mez est� demasiado bien atrincherada como para hacer eso!
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_03"); //Podr�amos llevar a cabo una misi�n furtiva, eliminando un hombre detr�s de otro; eso podr�a funcionar.
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_04"); //Lee me pidi� que te diera un mensaje.

	var int guild;
	guild = Npc_GetTrueGuild(hero);
	if 		(guild == GIL_SLD)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_05"); //Como eres uno de nuestros mejores mercenarios, has sido el elegido para llevar a cabo esta misi�n.
	}
	else if	(guild == GIL_KDW)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_06"); //Como Mago del C�rculo y combatiente experimentado que eres, has sido elegido para llevar a cabo esta misi�n.
	}
	else if (guild == GIL_ORG)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_07"); //�Al ser uno de nuestros mejores bandidos, has resultado elegido para llevar a cabo esta misi�n!
	}
	else
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_08"); //Aunque no eres uno de nosotros, le has hecho un gran servicio a nuestro campamento y demostrado tu val�a m�s de una vez.
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_09"); //�Te ofrecemos la oportunidad de llevar a cabo esta misi�n!
	};
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_10"); //Yo te acompa�ar�. �Juntos podremos conseguirlo!
};

//---------------------------------------------------------------------
//	Info SECOND
//---------------------------------------------------------------------
INSTANCE Info_Gorn_SECOND (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_SECOND_Condition;
	information	= Info_Gorn_SECOND_Info;
	important	= 0;	
	permanent	= 0;
	description = "�El primer paso? �Cu�l ser� el segundo?";
};                       

FUNC INT Info_Gorn_SECOND_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_SECOND_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_01"); //�El primer aso? �Cu�l ser� el segundo?
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_02"); //�En cuanto reconquistemos la mina, empezaremos a buscar el paso de monta�a que la gente de G�mez utiliz� para llevar a cabo el ataque!
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_03"); //Cuando hayamos cortado el paso, la situaci�n volver� a estar bajo control.
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_04"); //Entiendo.
};

//---------------------------------------------------------------------
//	Info WHYME
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WHYME (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WHYME_Condition;
	information	= Info_Gorn_WHYME_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Por qu� me toca a m�?";
};                       

FUNC INT Info_Gorn_WHYME_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_TAKEBACK))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WHYME_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_WHYME_15_01"); //�Por qu� yo, precisamente?
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_02"); //�Ya has demostrado m�s de una vez que puedes ser valiente y listo al mismo tiempo!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_03"); //Adem�s, t� conoces mejor que la mayor�a de nosotros el Campamento Viejo y a los guardias.
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_04"); //�Eres el hombre m�s indicado para esta dif�cil misi�n!
};

//---------------------------------------------------------------------
//	Info KICKBUTT
//---------------------------------------------------------------------
INSTANCE Info_Gorn_KICKBUTT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_KICKBUTT_Condition;
	information	= Info_Gorn_KICKBUTT_Info;
	important	= 0;	
	permanent	= 0;
	description = "�De acuerdo, vayamos y demos una lecci�n a los hu�spedes inoportunos de la mina!";
};                       

FUNC INT Info_Gorn_KICKBUTT_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_MYWAY)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_KICKBUTT_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_KICKBUTT_15_01"); //�De acuerdo; vamos a darles una lecci�n a esos molestos invitados de la mina!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_02"); //�Sab�a que dir�as eso!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_03"); //Toma esta llave. Con ella podr�s abrir la caseta del guardia frente a la entrada de la mina.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info MYWAY
//---------------------------------------------------------------------
INSTANCE Info_Gorn_MYWAY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MYWAY_Condition;
	information	= Info_Gorn_MYWAY_Info;
	important	= 0;	
	permanent	= 0;
	description = "�Por qu� no? En cualquier caso, tengo que entrar en la mina.";
};                       

FUNC INT Info_Gorn_MYWAY_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MYWAY_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_MYWAY_15_01"); //�Por qu� no? �En cualquier caso, necesito entrar en la mina!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_02"); //Sin importarme tus razones, �me alegra que nos ocupemos juntos de este asunto!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_03"); //Toma esta llave. Con ella podr�s abrir la caseta del guardia frente a la entrada de la mina.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info WOLF
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WOLF (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WOLF_Condition;
	information	= Info_Gorn_WOLF_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_WOLF_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_076")<500)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WOLF_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_01"); //�Oh, casi se me olvida!
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_02"); //Wolf el bandido quiere hablar contigo urgentemente antes de que salgamos hacia la mina.

	Info_ClearChoices	(Info_Gorn_WOLF);
	Info_AddChoice		(Info_Gorn_WOLF,"Puede esperar, tenemos cosas m�s importantes que hacer.",	Info_Gorn_WOLF_FM);	
	Info_AddChoice		(Info_Gorn_WOLF,"Ser� mejor que vaya ahora.",		Info_Gorn_WOLF_WOLF);	

	B_LogEntry			(CH4_UluMulu,"Wolf, el bandido, quiere volver a hablar conmigo antes de que vayamos a la mina. Tengo que pasar a verle.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_04"); //Eso puede esperar; tenemos cosas m�s urgentes que hacer.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_05"); //�Como t� digas!
	AI_StopProcessInfos	(self);
};

func void Info_Gorn_WOLF_WOLF ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_06"); //Entonces ser� mejor que nos vayamos ahora.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_07"); //Hazlo t�. Yo te espero aqu�.

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LEAVEFORPOST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_LEAVEFORPOST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_LEAVEFORPOST_Condition;
	information	= Info_Gorn_LEAVEFORPOST_Info;
	important	= 1;	
	permanent	= 1;
};                       

FUNC INT Info_Gorn_LEAVEFORPOST_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_074")<2000)
	&& (FreemineOrc_LookingUlumulu != LOG_RUNNING)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_LEAVEFORPOST_Info()
{
	AI_GotoNpc			(self, hero);

	if (Npc_KnowsInfo(hero,Info_Gorn_WOLF))
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_01"); //�Parece que s� que quieres hablar con Wolf!
	}
	else
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_02"); //��sta es la direcci�n equivocada! �Tenemos que ir hacia la mina!
	};
	AI_Output 			(self, hero,"Info_Gorn_LEAVEFORPOST_09_03"); //�Te espero en el puesto de guardia provisional!

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info REJOINFORFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_REJOINFORFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_REJOINFORFM_Condition;
	information	= Info_Gorn_REJOINFORFM_Info;
	important	= 0;	
	permanent	= 1;
	description = "�Vayamos a la mina!";
};                       

FUNC INT Info_Gorn_REJOINFORFM_Condition()
{
	if 	(Npc_KnowsInfo  (hero, Info_Gorn_MYWAY) || Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT))
	&&	(Npc_GetDistToWP(hero, "OW_PATH_075_GUARD4")<1000)
	&&	(!Gorn_JoinedForFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_REJOINFORFM_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_REJOINFORFM_15_01"); //�Salgamos hacia la mina!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_02"); //�Es hora de echar de ah� a los guardias!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_03"); //�T� primero; yo te sigo!

	Gorn_JoinedForFM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"FollowToFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info RAZOR
//---------------------------------------------------------------------
INSTANCE Info_Gorn_RAZOR (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RAZOR_Condition;
	information	= Info_Gorn_RAZOR_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RAZOR_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_3000")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RAZOR_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_01"); //�CUIDADO; CUCHILLAS!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_02"); //�Cazan en manada, como los chasqueadores, pero muerden con mucha m�s fuerza!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_03"); //Deber�amos liquidarlos. Ya me conoces; me gusta saber qu� es lo que hay a mis espaldas.

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMCENTRANCE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMCENTRANCE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMCENTRANCE_Condition;
	information	= Info_Gorn_FMCENTRANCE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMCENTRANCE_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "FMC_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMCENTRANCE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_01"); //Un momento; �ves todos esos cad�veres?
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_02"); //Vete hacia la entrada de la mina; yo me quedar� aqu� y comprobar� que no nos venga ninguna sorpresa desagradable por detr�s.
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_03"); //Cuando hayas llegado, te seguir�.

	Npc_ExchangeRoutine	(self,	"WaitFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMGATE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMGATE_Condition;
	information	= Info_Gorn_FMGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMGATE_Condition()
{
	if Gorn_JoinedForFM
	&& !FM_GateOpen
	&& (Npc_GetDistToWP(hero, "FMC_FM_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMGATE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_01"); //O� c�mo luchabas y sal� detr�s de ti de inmediato.
	AI_Output 			(hero, self,"Info_Gorn_FMGATE_15_02"); //Un viejo conocido... Pero esa deuda est� saldada.
	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_03"); //Bueno; abre la puerta y yo vigilar�.

	Npc_ExchangeRoutine	(self,	"WaitFM");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_AFTERFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_AFTERFM_Condition;
	information	= Info_Gorn_AFTERFM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_AFTERFM_Condition()
{
	if	FreemineOrc_LookingUlumulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_AFTERFM_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_01"); //Oh, t�o. �se s� que ha sido un combate duro de verdad.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_02"); //Nunca hubiera pensado que los guardias de G�mez opondr�an tanta resistencia.
	AI_Output 			(hero, self,"Info_Gorn_AFTERFM_15_03"); //Lo m�s importante es que los hemos vuelto a expulsar de la mina.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_04"); //�Yo me quedar� aqu� asegurar que sigue siendo as�!

	B_Story_LeftFM		();
	
	Lee_freeminereport = 1;  //jetzt kann der SC Lee �ber die befreite Mine informieren.     ***Bj�rn***

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMWATCH
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMWATCH (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMWATCH_Condition;
	information	= Info_Gorn_FMWATCH_Info;
	important	= 0;	
	permanent	= 1;
	description = "�C�mo est� la situaci�n?";
};                       

FUNC INT Info_Gorn_FMWATCH_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_AFTERFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMWATCH_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FMWATCH_15_01"); //�Cu�l es la situaci�n?
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_02"); //Todo est� tranquilo. Nada se mueve en la Mina Libre.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_03"); //No puede faltar mucho para que Lee nos env�e refuerzos.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_04"); //Hasta que llegue ese momento, voy a ponerme c�modo.
};


//---------------------------------------------------------------------
//	Info FOUNDULUMULU
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FOUNDULUMULU (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FOUNDULUMULU_Condition;
	information	= Info_Gorn_FOUNDULUMULU_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FOUNDULUMULU_Condition()
{
	if	(FreemineOrc_LookingUlumulu == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FOUNDULUMULU_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_01"); //Ese estandarte orco que llevas es muy interesante.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_02"); //�Es del antiguo esclavo orco de la mina?
	AI_Output 			(hero, self,"Info_Gorn_FOUNDULUMULU_15_03"); //Es un s�mbolo de amistad de esta raza. Quiero utilizarlo para entrar en el pueblo orco.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_04"); //�Por tu propio bien, espero que los orcos respeten esa... cosa!

	B_Kapitelwechsel	(5);

	AI_StopProcessInfos	(self);
};








