// infos 
instance Info_TPL_1455_GorBoba (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba_Condition;
	information		= Info_TPL_1455_GorBoba_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_TPL_1455_GorBoba_Condition()
{
	return TRUE;
};

func void Info_TPL_1455_GorBoba_Info()
{
	AI_Output (self, other,"Info_TPL_1455_GorBoba_08_01"); //Piérdete; aquí estás de más.
};


instance Info_TPL_1455_GorBoba1 (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba1_Condition;
	information		= Info_TPL_1455_GorBoba1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "¿Y TÚ vas a detenerme?";	
};

FUNC int Info_TPL_1455_GorBoba1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1455_GorBoba )) {
		return 1;
	};	
};

func void Info_TPL_1455_GorBoba1_Info()
{
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_01"); //¿Y vas a ser tú el que me detenga?
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_02"); //¡SÍ! Yo te detendré; no impedirás que el Maestro Kalorn despierte al Durmiente.
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_03"); //No intentes atacarme; el sumo sacerdote ha transferido parte de su poder al Maestro Kalorn. Ahora somos inmortales.
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_04"); //¡Voy a demostrarte lo inmortal que eres!
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_05"); //¡Prepárate a reunirte con tu creador!

	AI_StopProcessInfos	( self );
	
	Log_CreateTopic        ( "Orktempel", LOG_NOTE );
	B_LogEntry            ( "Orktempel","GorBoba quería detenerme. Me ha dicho que Kalom y sus partidarios habían recibido del sumo sacerdote  unos poderes que los hacían invencibles ante las armas humanas."); 

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );	
};
