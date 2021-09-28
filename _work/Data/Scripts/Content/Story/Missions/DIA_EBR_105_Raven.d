// **************************************
//					EXIT 
// **************************************

instance DIA_Raven_Exit (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 999;
	condition	= DIA_Raven_Exit_Condition;
	information	= DIA_Raven_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Raven_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Erstes Mal rein
// **************************************

instance DIA_Raven_FirstIn (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_FirstIn_Condition;
	information	= DIA_Raven_FirstIn_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Raven_FirstIn_Condition()
{
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	if (wache218.aivar[AIV_PASSGATE]==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_FirstIn_Info()
{
	AI_Output (self, other,"DIA_Raven_FirstIn_10_00"); //�Qu� puedo hacer por ti?
};

// **************************************
//			Wer bist du?
// **************************************

instance DIA_Raven_Who (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Who_Condition;
	information	= DIA_Raven_Who_Info;
	permanent	= 0;
	description	= "�Qui�n eres?";
};                       

FUNC int DIA_Raven_Who_Condition()
{
	return 1;
};

FUNC VOID DIA_Raven_Who_Info()
{
	AI_Output (other, self,"DIA_Raven_Who_15_00"); //�Qui�n eres?
	AI_Output (self, other,"DIA_Raven_Who_10_01"); //Soy Raven, la mano derecha de G�mez. Todo el que quiera ver a G�mez tiene que hablar antes conmigo.
};

// **************************************
//			Krautbote
// **************************************

instance DIA_Raven_Krautbote (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Krautbote_Condition;
	information	= DIA_Raven_Krautbote_Info;
	permanent	= 0;
	description	= "Traigo un poco de hierba a G�mez de parte de Cor Kalom.";
};                       

FUNC int DIA_Raven_Krautbote_Condition()
{
	if	(KALOM_KRAUTBOTE == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID DIA_Raven_Krautbote_Info()
{
	AI_Output			(other, self,"DIA_Raven_Krautbote_15_00"); //Traigo un poco de hierba a G�mez de parte de Cor Kalom.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_01"); //Bartholo se encarga de esas cosas. G�mez no trata con recaderos.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_02"); //Lo encontrar�s en la habitaci�n de la derecha, debajo de la entrada, o en la cocina de la torre grande.
	AI_Output			(self, other,"DIA_Raven_Krautbote_10_03"); //Por supuesto, de noche duerme. Si estuviera en tu lugar, no le molestar�a a esas horas.

	B_LogEntry			(CH1_KrautBote,"El suministro de hierba para G�mez debe ser depositado donde Bartholo. Lo encontrar� en casa de los Magnates del Mineral.");
};

// **************************************
//		Gomez sehen (Stt-Aufnahme)
// **************************************

instance DIA_Raven_Aufnahme (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Aufnahme_Condition;
	information	= DIA_Raven_Aufnahme_Info;
	permanent	= 0;
	description	= "Quiero ver a G�mez. Thorus dice que voy a ser aceptado como Sombra.";
};                       

FUNC int DIA_Raven_Aufnahme_Condition()
{
	if ((Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	&& (Npc_GetTrueGuild(other) == GIL_NONE))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Aufnahme_Info()
{
	AI_Output (other, self,"DIA_Raven_Aufnahme_15_00"); //Quiero ver a G�mez. Thorus dice que voy a ser aceptado como Sombra.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_01"); //Siempre buscamos hombres competentes. Pareces bastante despabilado. Tal vez encajes.
	AI_Output (self, other,"DIA_Raven_Aufnahme_10_02"); //Te llevar� ante G�mez. S�gueme. �Y no toques nada!
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self, "GUIDE");
};

// **************************************
//		In Halle angekommen
// **************************************

instance DIA_Raven_There (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_There_Condition;
	information	= DIA_Raven_There_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int DIA_Raven_There_Condition()
{
	if 	( Npc_KnowsInfo(hero,DIA_Raven_Aufnahme) && Hlp_StrCmp(Npc_GetNearestWP(self),"OCC_BARONS_GREATHALL_CENTER_MOVEMENT") ) 
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_There_Info()
{
	AI_Output (self, other,"DIA_Raven_There_10_01"); //G�mez est� por all�. Si no le demuestras respeto, me encantar� ense�arte c�mo se hace personalmente, � lo coges?
	AI_StopProcessInfos	(self);
		
	Npc_ExchangeRoutine(self, "START");
};


// **************************************
//				PERM
// **************************************

instance DIA_Raven_PERM (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_PERM_Condition;
	information	= DIA_Raven_PERM_Info;
	permanent	= 1;
	description	= "�C�mo va el comercio de mineral?";
};                       

FUNC int DIA_Raven_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Thorus_ReadyForGomez))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_PERM_Info()
{
	AI_Output (other, self,"DIA_Raven_PERM_15_00"); //�C�mo va el comercio de mineral?
	AI_Output (self, other,"DIA_Raven_PERM_10_01"); //La Vieja Mina va bien. La �ltima carga de suministros del mundo exterior fue enorme.
};

// **************************************
//			Bin dabei
// **************************************

instance DIA_Raven_BinDabei (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 8;
	condition	= DIA_Raven_BinDabei_Condition;
	information	= DIA_Raven_BinDabei_Info;
	permanent	= 0;
	description	= "G�mez dice que me han aceptado.";
};                       

FUNC int DIA_Raven_BinDabei_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Gomez_Dabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_BinDabei_Info()
{
	CreateInvItem		(hero, STT_ARMOR_M);
	
	CreateInvItem		(self, ItAmArrow);
	B_GiveInvItems      (self, hero, ItAmArrow, 1);
	Npc_RemoveInvItem	(hero, ItAmArrow);
	
	AI_Output			(other, self,"DIA_Raven_BinDabei_15_00"); //G�mez dice que me han aceptado.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_01"); //�Estupendo! En ese caso, puedes demostrar tu val�a con una primera tarea.
	AI_Output			(self, other,"DIA_Raven_BinDabei_10_02"); //No deber�a resultarte dif�cil, suponiendo que tus contactos sean tan buenos como dices.

	AI_EquipBestArmor	(hero); 
};

// *********************************************
// 				Sekten-Auftrag
// *********************************************
	var int Raven_SpySect;
// *********************************************

INSTANCE DIA_Raven_SpySect (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpySect_Condition;
	information	= DIA_Raven_SpySect_Info;
	permanent	= 0;
	description	= "�Qu� quieres que haga?";
};

FUNC INT DIA_Raven_SpySect_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_BinDabei))
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpySect_Info()
{
	AI_Output (other, self,"DIA_Raven_SpySect_15_00"); //�Qu� quieres que haga?
	AI_Output (self, other,"DIA_Raven_SpySect_10_01"); //Comerciamos mucho con la Hermandad, pero eso no quiere decir que confiemos en ella.
	AI_Output (self, other,"DIA_Raven_SpySect_10_02"); //Ve al pantano.
	AI_Output (self, other,"DIA_Raven_SpySect_10_03"); //Cuando llegues al campamento, aguza el o�do. Cualquier cosa que escuches podr�a resultarnos �til.
	AI_Output (self, other,"DIA_Raven_SpySect_10_04"); //Cuanto m�s averig�es, mejor. Har� falta un poco de tacto, si sabes a lo que me refiero.
	AI_Output (other, self,"DIA_Raven_SpySect_15_05"); //Tranquilo, no voy a enfurecerles.
	AI_Output (self, other,"DIA_Raven_SpySect_10_06"); //Sab�a que lo entender�as.
	
	Raven_SpySect = LOG_RUNNING;
	
	Log_CreateTopic	(CH1_GoToPsi,	LOG_MISSION);
	Log_SetTopicStatus (CH1_GoToPsi,	LOG_RUNNING);
	B_LogEntry (CH1_GoToPsi,"Raven me ha enviado a la Hermandad del pantano de parte del Campamento Viejo. Debo echar un vistazo por all� y tener los ojos bien abiertos. Quiz� all� averig�e alguna informaci�n �til para los Magnates del Mineral.");
};

// *********************************************
// 				Ausr�stung
// *********************************************

INSTANCE DIA_Raven_Equipment (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_Equipment_Condition;
	information	= DIA_Raven_Equipment_Info;
	permanent	= 0;
	description	= "�D�nde puedo conseguir mejor equipo?";
};

FUNC INT DIA_Raven_Equipment_Condition()
{
	if (Raven_SpySect==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_Equipment_Info()
{
	AI_Output	(other, self,"DIA_Raven_Equipment_15_00"); //�D�nde puedo conseguir mejor equipo?
	AI_Output	(self, other,"DIA_Raven_Equipment_10_01"); //Ve a ver a Diego y te dar� algo de armadura. Evitar� que te maten y al mismo tiempo servir� de identificaci�n.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_02"); //Tu armadura te permitir� acceder a todos los lugares que necesites.
	AI_Output	(self, other,"DIA_Raven_Equipment_10_03"); //Si necesitas armas, ve a hablar con Skip. Lo encontrar�s en la caba�a grande en la parte de atr�s, a la izquierda del patio del castillo.

	Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Diego tiene mejores ARMADURAS para las Sombras de G�mez. Se encuentra a la entrada del castillo.");
	if	!Npc_KnowsInfo(hero, DIA_Skip_First)
	{
		B_LogEntry	(GE_TraderOC,"El guardia Skip del patio posterior vende ARMAS. Pero s�lo a los hombres de G�mez.");
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// *********************************************
// 				Spy Zwischenbericht
// *********************************************

INSTANCE DIA_Raven_SpyBericht (C_INFO)
{
	npc			= Ebr_105_Raven;
	nr			= 1;
	condition	= DIA_Raven_SpyBericht_Condition;
	information	= DIA_Raven_SpyBericht_Info;
	permanent	= 1;
	description	= "Se me ocurri� presentarme para informar.";
};

FUNC INT DIA_Raven_SpyBericht_Condition()
{
	if ( Raven_SpySect==LOG_RUNNING )
	{
		return 1;
	};
};

FUNC VOID DIA_Raven_SpyBericht_Info()
{
	AI_Output (other, self,"DIA_Raven_SpyBericht_15_00"); //Se me ocurri� presentarme para informar.
	AI_Output (self, other,"DIA_Raven_SpyBericht_10_01"); //Bien. Me gusta mantenerme al tanto.
	if (Npc_HasItems (other, itat_Crawlerqueen)>=1)
	|| (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output (other, self,"Org_826_Mordrag_RUNNING_15_04"); //La gran invocaci�n ya ha tenido lugar.
			AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //
			Raven_SpySect=LOG_SUCCESS;
			B_GiveXP (XP_ReportToRaven);
			Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
			B_LogEntry (CH1_GoToPsi,"�Raven me ha dado largas con palabrer�a! ��se no es el tipo de actitud que yo esperaba! De ahora en adelante, ir� por mi cuenta.");
		}
		else
		{
			AI_Output (other, self,"DIA_Raven_SpyBericht_15_02"); //Ahora quieren los huevos de una reina de los reptadores, para elaborar una poci�n que les permita contactar con el Durmiente. Yo tengo los huevos.
			if (CorKalom_BringMCQBalls != LOG_SUCCESS)
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_03"); //Muy interesante. Me pregunto si funcionar�. Lleva los huevos al templo.
			}
			else
			{
				AI_Output (self, other,"DIA_Raven_SpyBericht_10_04"); //
				Raven_SpySect=LOG_SUCCESS;
				B_GiveXP (XP_ReportToRaven);
				Log_SetTopicStatus (CH1_GoToPsi,	LOG_SUCCESS);
				B_LogEntry (CH1_GoToPsi,"�Raven me ha dado largas con palabrer�a! ��se no es el tipo de actitud que yo esperaba! De ahora en adelante, ir� por mi cuenta.");
			};
		};
	}
	else
	{
		AI_Output (other, self,"DIA_Raven_SpyBericht_15_05"); //A�n no s� lo que planean.
		AI_Output (self, other,"DIA_Raven_SpyBericht_10_06"); //�Entonces por qu� me molestas?
	};
};

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////


