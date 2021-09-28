//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################
instance  Info_Xardas_OT (C_INFO)
{
	npc				= Kdf_406_OTXardas;
	condition		= Info_Xardas_OT_Condition;
	information		= Info_Xardas_OT_Info;
	important		= 1;
	permanent		= 0; 
};

FUNC int  Info_Xardas_OT_Condition()
{	
	if (Npc_GetDistToWP(self, "TPL_331") < 1000)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OT_Info()
{
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //�No tenemos mucho tiempo, as� que escucha con atenci�n!
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //�C�mo has...?
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //El Durmiente est� cerca. He tenido que hacer uso de todos mis poderes para llegar aqu�.
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //He traducido las profec�as orcas y descubierto qu� son los cinco corazones.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //Los cinco corazones de los sacerdotes a los que has derrotado fueron colocados en cinco capillas.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //Estas capillas pueden ser abiertas, pero s�lo las antiqu�simas espadas que portan los sacerdotes pueden da�arlos.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //Ahora debes atravesar los corazones con las cinco espadas. Solo de esa manera podr�s expulsar al Durmiente de este mundo.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //�Entendido!
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //Apres�rate, ya que el archidemonio se despertar� pronto; el enloquecido Cor Kalorn y sus disc�pulos descarriados est�n aqu�.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //Se han reunido en la sala del Durmiente.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //�Ya he sangrado lo suficiente! �Ya nadie puede detenerme!
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //El poder del Durmiente est� creciendo m�s y m�s; no puedo...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //�Qu� te pasa?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //Debo...

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,"Ha llegado la hora. Debo encontrarme a poca distancia del lugar de descanso del Durmiente. Xardas ha aparecido de repente y me ha dado instrucciones de combatir. Los cinco corazones de los chamanes orcos no-muertos est�n en hornacinas; tengo que atravesarlos con las cinco hojas que llevo encima. �sta es la �nica forma de derrotar al Durmiente. Suena bastante sencillo...");
	
	AI_StopProcessInfos	(self);
};		
