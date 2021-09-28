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
		AI_Output (self, other,"Info_Gorn_EXIT_09_01"); //¡Luchemos!
	}
	else
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_02"); //Hasta luego.
	};
	
	AI_StopProcessInfos	( self );
};

//*************************************
//			1. Begrüßung
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
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //¿Quién eres tú?
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
	description		= "¿Qué hay que hacer como mercenario de los magos?";
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
	AI_Output (other, self,"DIA_Gorn_Leben_15_00"); //¿Cuál es tu labor como mercenario de los magos?
	AI_Output (self, other,"DIA_Gorn_Leben_09_01"); //Lee ha hecho un trato con los magos. Él contrata a los mejores combatientes que hay en la colonia. O sea, a nosotros.
	AI_Output (self, other,"DIA_Gorn_Leben_09_02"); //Nosotros nos ocupamos de que los raspadores puedan extraer el mineral sin ser molestados y de que los magos no tengan problemas.
	AI_Output (self, other,"DIA_Gorn_Leben_09_03"); //Los magos aseguran que salgamos de aquí. Y nos darán una parte del mineral como pago.
};

//*************************************
//			Hütte (Shrike)
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
	description		= "¿Puedo quedarme por aquí?";
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
	AI_Output (other, self,"DIA_Gorn_Hut_15_00"); //¿Hay algún lugar en el que pueda alojarme aquí sin tener que echar a alguien de su cabaña?
	AI_Output (self, other,"DIA_Gorn_Hut_09_01"); //Me parece que no. Pero si estás seguro de que eso es lo que deseas, vete a ver a Shrike.
	AI_Output (self, other,"DIA_Gorn_Hut_09_02"); //Ocupa la cabaña que está frente a la entrada de la cueva. Estaba vacía, pero en realidad nos pertenecía a nosotros.
	AI_Output (other, self,"DIA_Gorn_Hut_15_03"); //¿Nosotros?
	AI_Output (self, other,"DIA_Gorn_Hut_09_04"); //Bueno, a nosotros los mercenarios. Aquí, los mercenarios y los bandidos viven separadamente. Y ninguno de los hombres de Lares debería estar aquí, a este lado del gran agujero.
	AI_Output (self, other,"DIA_Gorn_Hut_09_05"); //La verdad es que no tiene demasiada importancia. Pero no pidió permiso. ¡Y no puedes dejar que esos bandidos se salgan con la suya, porque se vuelven muy engreídos!

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,"Gorn, el mercenario, me ha contado que Shrike ha ocupado una cabaña de los mercenarios sin avisar. Dado que se lo he preguntado a Dorn, ninguno de los mercenarios interferirá si 'convenzo' a Shrike de que se largue de allí.");
	Gorn_ShrikesHut = LOG_RUNNING;
};

//*************************************
//			Hütte LEER (Shrike)
//*************************************

instance DIA_Gorn_HutFree (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_HutFree_Condition;
	information		= Dia_Gorn_HutFree_Info;
	permanent		= 0;
	description		= "Shrike se ha mudado a otra cabaña.";
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
	AI_Output			(other, self,"DIA_Gorn_HutFree_15_00"); //Shrike se ha mudado a otra cabaña.
	AI_Output			(self, other,"DIA_Gorn_HutFree_09_01"); //Bien. Torlof me acaba de decir que quiere hablar con ese tipo.

	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_SUCCESS);
	B_LogEntry			(CH1_ShrikesHut,"A Gorn le ha parecido muy divertido que haya echado a Shrike de su cabaña. Creo que es un tipo honrado. Duro, pero justo. Me convendría mantenerme cerca de él en el futuro.");
	B_GiveXP			(XP_ReportedKickedShrike);
};

//*************************************
//			Söldner werden
//*************************************

instance DIA_Gorn_BecomeSLD (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 5;
	condition		= Dia_Gorn_BecomeSLD_Condition;
	information		= Dia_Gorn_BecomeSLD_Info;
	permanent		= 0;
	description		= "¿Qué tengo que hacer para ingresar en el Campamento Nuevo?";
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
	AI_Output (other, self,"DIA_Gorn_BecomeSLD_15_00"); //¿Qué es lo que tengo que hacer para unirme al Campamento Nuevo?
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_01"); //Antes de que Lee te admita, tienes que mejorar tus habilidades de combate. No importa qué arma utilices, pero tienes que ser bueno con ella.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_02"); //Además, deberías tener mucha experiencia con la vida de por aquí y todo eso.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_03"); //Si no quieres ir a uno de los otros campamentos, deberías intentar unirte a los bandidos antes de meterte a mercenario.
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
	AI_Output (other, self,"DIA_Gorn_TRADE_15_00"); //¿Tienes algo más de eso?
	AI_Output (self, other,"DIA_Gorn_TRADE_09_01"); //De sobra. ¿Quieres comerciar?
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
	description		= "¿Por qué tomaste parte en una de las incursiones de la banda?";
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
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_00"); //¿Por qué participaste en uno de los asaltos de la banda?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_01"); //¿Quién dice que lo hice?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_02"); //¿Por qué ibas a tener tanto si no fuera cierto?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_03"); //No vayas a pensar que todo esto proviene de un solo botín.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_04"); //¿Tomas parte en los ataques con mucha frecuencia?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_05"); //Si así fuera, no podría decírtelo. A lee no le gustaría ni un pelo.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_06"); //Entiendo.
	
	CreateInvItems(self, ItFoApple, 21);
	B_GiveInvItems	(self,other, ItFoApple,21); //Notwendig für Screenausgabe
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

	AI_Output (self, other,"Info_Gorn_NCWAIT_09_01"); //¡Ah, eres tú! Mi amigo Lester del pantano me contó todo lo que hacíais aquí.
	AI_Output (self, other,"Info_Gorn_NCWAIT_09_02"); //Para ser alguien que no lleva mucho tiempo aquí, has llegado muy lejos.
	AI_Output (other, self,"Info_Gorn_NCWAIT_15_03"); //También he estado cerca de convertirme en comida para gusanos un par de veces.
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
	description	= "¡Tengo un mensaje importante para los Magos del Agua!";
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
	AI_Output (other, self,"Info_Gorn_MAGES_15_01"); //¡Tengo un mensaje importante para los Magos del Agua!
	AI_Output (self, other,"Info_Gorn_MAGES_09_02"); //Entonces deberías ir a hablar con Saturas. Es el mago del agua superior y se pasa todo el día estudiando unos escritos u otros.
	AI_Output (self, other,"Info_Gorn_MAGES_09_03"); //Pero da igual lo importante que sea tu mensaje; los guardias del nivel superior no te dejarán entrar a verle.
	AI_Output (other, self,"Info_Gorn_MAGES_15_04"); //¿No podrías interceder por mí?
	AI_Output (self, other,"Info_Gorn_MAGES_09_05"); //No, pero Cronos, el guardián del mineral, podría concederte un permiso.
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
	description	= "¿Dónde puedo encontrar al 'guardián del mineral'?";
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
	AI_Output			(other, self,"Info_Gorn_CRONOS_15_01"); //¿Dónde puedo encontrar a este 'guardián del mineral'?
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_01a");//Saliendo de aquí te encontrarás una gran cueva habitada más allá la presa.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_02"); //Cronos suele estar en la reja que hay sobre el gran montículo de mineral.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_03"); //Pero es un poco arrogante. Tendrás que convencerle de la importancia de tu mensaje.

	VAR C_NPC Cronos;
	Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	
	B_LogEntry		(CH3_EscapePlanNC,"Gorn me ha recomendado que vaya directamente ante el Gran Mago del Agua, que se llama Saturas. Cronos, el guardián del mineral, puede conseguirme una audiencia."); 

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

	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_01"); //Hola, novato. Como puedes comprobar, la colonia es un pañuelo.
	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_02"); //Es imposible no andar encontrándose a la misma gente continuamente.
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
	description = "¿Qué estás haciendo aquí?";
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
	AI_Output 		(other, self,"Info_Gorn_RUINWHAT_15_01"); //¿Qué haces aquí?
	AI_Output		(self, other,"Info_Gorn_RUINWHAT_09_02"); //Oh, estoy intentando encontrar a una vieja leyenda.
	AI_Output		(other, self,"Info_Gorn_RUINWHAT_15_03"); //¿Una leyenda?
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_04"); //Sí; Milten, mi amigo del Campamento Viejo me ha dicho que aquí solían vivir unos monjes.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_05"); //Claro que eso fue mucho antes de la creación de la Barrera.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_06"); //Se dice que adoraban a un dios que les otorgaba el poder de convertirse en animales.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_07"); //Estoy seguro de que aquí todavía hay tesoros de los viejos tiempos.

	if (!Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS))
	{	
		AI_Output	(self, other,"Info_Gorn_RUINWHAT_09_08"); //¿Qué es lo que te trae por aquí?
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
	description = "Busco un foco mágico.";
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
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_01"); //Estoy buscando un foco mágico.
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_02"); //Tiene que estar en algún lugar de por aquí.
	AI_Output (self, other,"Info_Gorn_RUINFOCUS_09_03"); //Puede que lo que andas buscando se encuentre en el viejo monasterio en ruinas más allá del cañón.
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
	description = "Podríamos continuar juntos.";
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
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_01"); //Podríamos ir juntos.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_02"); //Buena idea. Esta zona está infestada de chasqueadores.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_03"); //Cuando van solos no suponen ningún problema para un cazador experimentado. Pero suelen cazar en manada.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_04"); //Una manada puede despedazar hasta al mejor de los espadachines.
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_05"); //¿Vamos juntos, entonces?
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_06"); //De acuerdo, pero antes de cruzar este tronco, me gustaría explorar el cañón. Me gusta saber qué tengo a mi espalda.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_07"); //Ven conmigo; he descubierto un sendero que nos conducirá allí.

	Log_CreateTopic		(CH3_MonasteryRuin,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_RUNNING);
	B_LogEntry			(CH3_MonasteryRuin,"Al acercarme al monasterio en ruinas, me he encontrado con el mercenario Gorn. Está aquí para registrar las ruinas en busca de viejos tesoros.");
	B_LogEntry			(CH3_MonasteryRuin,"Continuaremos nuestra búsqueda juntos. Gorn me ha advertido que en la zona hay grandes rebaños de chasqueadores.");

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

	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_01"); //Esto es lo que yo llamo suerte. Parece que era una cueva-almacén.
	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_02"); //Ve tú por delante; quiero comprobar que no seremos sorprendidos en nuestro viaje de regreso.

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

	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_01"); //Pareces haber perdido el interés por el monasterio en ruinas.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_02"); //Seguiré yo solo.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_03"); //Si cambias de opinión, sígueme

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
	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_02"); //Esas bestezuelas de ahí parecen ser las únicas que han conseguido entrar en el patio interior.

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
	description = "¿Ahora qué pasa?";
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
	AI_Output (other, self,"Info_Gorn_RUINWALLWHAT_15_01"); //¿Y ahora qué?
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

	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_01"); //Allí arriba hay una especie de plataforma. Pero parece estar demasiado alta como para escalar hasta ella.
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
	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_02"); //Tal vez el objeto que buscas se encontrase sobre él.

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

	B_LogEntry		(CH3_MonasteryRuin,"Me he transformado en sabandija de carne con la ayuda de los pergaminos de conjuro de la cueva de suministro. Así he podido arrastrarme a través del hueco de la pared.");
	B_LogEntry		(CH3_MonasteryRuin,"La puerta ya está abierta.");

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

	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //Pareces haber perdido el interés por el monasterio en ruinas.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //Seguiré yo solo.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Si cambias de opinión, sígueme

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

	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_01"); //¡Así que has encontrado tu artefacto mágico!
	AI_Output 			(other, self,"Info_Gorn_RUINSUCCESS_15_02"); //Sí, Tengo que llevar el foco a los Magos del Agua. Lo necesitan.
	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_03"); //te acompañaré un rato.

	B_LogEntry		(CH3_MonasteryRuin,"He encontrado el foco en una especie de estudio. Gorn me acompañará un poco más.");

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

	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_01"); //¡OH, DIABLOS! ¿Qué es ese monstruo de allí?
	AI_Output 			(other, self,"Info_Gorn_RUINTROLL_15_02"); //¿De dónde ha salido eso?
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_03"); //¡Se parece a uno de esos trolls invencibles. ¡Sólo que en pequeño!
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_04"); //Sea lo que sea, si queremos salir de aquí, tenemos que superar a esa bestia.

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
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_02"); //Sí, hemos derrotado a ese monstruo. Pero si no era más que un troll joven...
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_03"); //...preferirías no toparte con sus padres, ¿eh?
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_04"); //Algo así.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_05"); //Aquí es donde se separan nuestros caminos. Quiero quedarme por aquí un tiempo y explorar un poco.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_06"); //Pero estoy seguro de que nos volveremos a encontrar. Hasta la vista, amigo mío.

	B_LogEntry		(CH3_MonasteryRuin,"Volviendo al patio del monasterio, nos hemos encontrado con un troll joven. Ha sido un duro combate, pero hemos vencido.");
	B_LogEntry		(CH3_MonasteryRuin,"Mi viaje junto a Gorn ha llegado a su fin. Tengo la sensación de que pronto volveré a encontrarme con él.");

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
	description = "¡Me encontré a Diego y a Milten frente al Campamento Viejo!";
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
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //¡He visto a Diego y Milten en el Campamento Viejo!
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //¡Eso es una buena noticia!
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //Quieren veros a ti y a Lester. En el lugar de reunión habitual.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //Gracias. No hay nada más valioso que un buen amigo en estos tiempos turbulentos.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //Ya casi eres uno de los nuestros. ¡Eres de fiar!

	B_GiveXP			(XP_MessageForGorn);
	
	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else 
	{
		B_LogEntry			(CH4_4Friends,		"He informado a Lester y Gorn acerca de la reunión con sus amigos. Ahora ya no es asunto mío. Ellos sabrán qué van a hacer..."); 
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
	description = "¿Qué viste en la Mina Libre?";
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
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_01"); //¿Qué has visto en la Mina Libre?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_02"); //Después de volver del monasterio en ruinas, quería pasarme a ver a Okyl, el jefe de la Mina Libre.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_03"); //Pero, cuando llegué, no encontré más que cadáveres tirados por todas partes.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_04"); //Acabo de ver a unos guardias apostándose a la entrada de la mina.
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_05"); //¿Cómo es posible que un par de docenas de guardias hayan derrotado a tantos mercenarios?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_06"); //A mi me pareció que había sido una emboscada. Nadie hubiera esperado que unos atacantes cruzaran las montañas.
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
	description = "¿Qué tienes planeado?";
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
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_01"); //¿Qué planeas hacer ahora?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_02"); //Habrá que cambiar toda nuestra estrategia defensiva. Eso lleva tiempo.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_03"); //Mientras se preparan Lee y su gente, me uniré a la guardia provisional de Cord.
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_04"); //¿Planeas llevar a cabo un contraataque?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_05"); //Todavía no, pero ya llegará el momento de hacerlo.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_06"); //Si quieres encontrarme en el futuro, camina desde aquí en dirección a la mina. Estaré vigilando allí.

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
	description = "¿Qué tal?";
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
	AI_Output 			(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01"); //¿Cómo van las cosas?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //Todo está tranquilo. No hay movimiento en la Mina Libre.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //¡Lee todavía está ocupado organizando nuestra defensa!
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

	AI_Output 			(self, hero,"Info_Gorn_POST_09_01"); //¡Llegas justo a tiempo! Estamos preparando un contraataque.
	AI_Output 			(self, hero,"Info_Gorn_POST_09_02"); //La reconquista de la Mina Libre no es más que el primer paso.
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
	description = "¿Tienes pensado recuperarla sólo con cuatro hombres?";
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
	AI_Output 			(hero, self,"Info_Gorn_TAKEBACK_15_01"); //¿Planeas reconquistarla con sólo 4 hombres? ¿Dónde están todos los mercenarios?
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_02"); //¡Un ataque frontal no servirá de nada! ¡La gente de Gómez está demasiado bien atrincherada como para hacer eso!
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_03"); //Podríamos llevar a cabo una misión furtiva, eliminando un hombre detrás de otro; eso podría funcionar.
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_04"); //Lee me pidió que te diera un mensaje.

	var int guild;
	guild = Npc_GetTrueGuild(hero);
	if 		(guild == GIL_SLD)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_05"); //Como eres uno de nuestros mejores mercenarios, has sido el elegido para llevar a cabo esta misión.
	}
	else if	(guild == GIL_KDW)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_06"); //Como Mago del Círculo y combatiente experimentado que eres, has sido elegido para llevar a cabo esta misión.
	}
	else if (guild == GIL_ORG)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_07"); //¡Al ser uno de nuestros mejores bandidos, has resultado elegido para llevar a cabo esta misión!
	}
	else
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_08"); //Aunque no eres uno de nosotros, le has hecho un gran servicio a nuestro campamento y demostrado tu valía más de una vez.
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_09"); //¡Te ofrecemos la oportunidad de llevar a cabo esta misión!
	};
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_10"); //Yo te acompañaré. ¡Juntos podremos conseguirlo!
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
	description = "¿El primer paso? ¿Cuál será el segundo?";
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
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_01"); //¿El primer aso? ¿Cuál será el segundo?
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_02"); //¡En cuanto reconquistemos la mina, empezaremos a buscar el paso de montaña que la gente de Gómez utilizó para llevar a cabo el ataque!
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_03"); //Cuando hayamos cortado el paso, la situación volverá a estar bajo control.
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
	description = "¿Por qué me toca a mí?";
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
	AI_Output 			(hero, self,"Info_Gorn_WHYME_15_01"); //¿Por qué yo, precisamente?
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_02"); //¡Ya has demostrado más de una vez que puedes ser valiente y listo al mismo tiempo!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_03"); //Además, tú conoces mejor que la mayoría de nosotros el Campamento Viejo y a los guardias.
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_04"); //¡Eres el hombre más indicado para esta difícil misión!
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
	description = "¡De acuerdo, vayamos y demos una lección a los huéspedes inoportunos de la mina!";
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
	AI_Output 			(hero, self,"Info_Gorn_KICKBUTT_15_01"); //¡De acuerdo; vamos a darles una lección a esos molestos invitados de la mina!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_02"); //¡Sabía que dirías eso!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_03"); //Toma esta llave. Con ella podrás abrir la caseta del guardia frente a la entrada de la mina.

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
	description = "¿Por qué no? En cualquier caso, tengo que entrar en la mina.";
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
	AI_Output 			(hero, self,"Info_Gorn_MYWAY_15_01"); //¿Por qué no? ¡En cualquier caso, necesito entrar en la mina!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_02"); //Sin importarme tus razones, ¡me alegra que nos ocupemos juntos de este asunto!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_03"); //Toma esta llave. Con ella podrás abrir la caseta del guardia frente a la entrada de la mina.

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

	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_01"); //¡Oh, casi se me olvida!
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_02"); //Wolf el bandido quiere hablar contigo urgentemente antes de que salgamos hacia la mina.

	Info_ClearChoices	(Info_Gorn_WOLF);
	Info_AddChoice		(Info_Gorn_WOLF,"Puede esperar, tenemos cosas más importantes que hacer.",	Info_Gorn_WOLF_FM);	
	Info_AddChoice		(Info_Gorn_WOLF,"Será mejor que vaya ahora.",		Info_Gorn_WOLF_WOLF);	

	B_LogEntry			(CH4_UluMulu,"Wolf, el bandido, quiere volver a hablar conmigo antes de que vayamos a la mina. Tengo que pasar a verle.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_04"); //Eso puede esperar; tenemos cosas más urgentes que hacer.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_05"); //¡Como tú digas!
	AI_StopProcessInfos	(self);
};

func void Info_Gorn_WOLF_WOLF ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_06"); //Entonces será mejor que nos vayamos ahora.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_07"); //Hazlo tú. Yo te espero aquí.

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
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_01"); //¡Parece que sí que quieres hablar con Wolf!
	}
	else
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_02"); //¡Ésta es la dirección equivocada! ¡Tenemos que ir hacia la mina!
	};
	AI_Output 			(self, hero,"Info_Gorn_LEAVEFORPOST_09_03"); //¡Te espero en el puesto de guardia provisional!

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
	description = "¡Vayamos a la mina!";
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
	AI_Output 			(hero, self,"Info_Gorn_REJOINFORFM_15_01"); //¡Salgamos hacia la mina!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_02"); //¡Es hora de echar de ahí a los guardias!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_03"); //¡Tú primero; yo te sigo!

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

	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_01"); //¡CUIDADO; CUCHILLAS!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_02"); //¡Cazan en manada, como los chasqueadores, pero muerden con mucha más fuerza!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_03"); //Deberíamos liquidarlos. Ya me conoces; me gusta saber qué es lo que hay a mis espaldas.

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

	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_01"); //Un momento; ¿ves todos esos cadáveres?
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_02"); //Vete hacia la entrada de la mina; yo me quedaré aquí y comprobaré que no nos venga ninguna sorpresa desagradable por detrás.
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_03"); //Cuando hayas llegado, te seguiré.

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

	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_01"); //Oí cómo luchabas y salí detrás de ti de inmediato.
	AI_Output 			(hero, self,"Info_Gorn_FMGATE_15_02"); //Un viejo conocido... Pero esa deuda está saldada.
	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_03"); //Bueno; abre la puerta y yo vigilaré.

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

	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_01"); //Oh, tío. Ése sí que ha sido un combate duro de verdad.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_02"); //Nunca hubiera pensado que los guardias de Gómez opondrían tanta resistencia.
	AI_Output 			(hero, self,"Info_Gorn_AFTERFM_15_03"); //Lo más importante es que los hemos vuelto a expulsar de la mina.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_04"); //¡Yo me quedaré aquí asegurar que sigue siendo así!

	B_Story_LeftFM		();
	
	Lee_freeminereport = 1;  //jetzt kann der SC Lee über die befreite Mine informieren.     ***Björn***

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
	description = "¿Cómo está la situación?";
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
	AI_Output 			(hero,self,"Info_Gorn_FMWATCH_15_01"); //¿Cuál es la situación?
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_02"); //Todo está tranquilo. Nada se mueve en la Mina Libre.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_03"); //No puede faltar mucho para que Lee nos envíe refuerzos.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_04"); //Hasta que llegue ese momento, voy a ponerme cómodo.
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
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_02"); //¿Es del antiguo esclavo orco de la mina?
	AI_Output 			(hero, self,"Info_Gorn_FOUNDULUMULU_15_03"); //Es un símbolo de amistad de esta raza. Quiero utilizarlo para entrar en el pueblo orco.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_04"); //¡Por tu propio bien, espero que los orcos respeten esa... cosa!

	B_Kapitelwechsel	(5);

	AI_StopProcessInfos	(self);
};








