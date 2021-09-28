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
	AI_Output (self, other,"Info_TPL_1455_GorBoba_08_01"); //Sparisci, non sei il benvenuto.
};


instance Info_TPL_1455_GorBoba1 (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba1_Condition;
	information		= Info_TPL_1455_GorBoba1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "E TU avresti intenzione di fermarmi?";	
};

FUNC int Info_TPL_1455_GorBoba1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1455_GorBoba )) {
		return 1;
	};	
};

func void Info_TPL_1455_GorBoba1_Info()
{
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_01"); //E TU avresti intenzione di fermarmi?
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_02"); //SÌ! TI fermerò! Non impedirai al maestro Kalom dievocare il Dormiente.
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_03"); //Non tentare d'attaccarmi. L'alto sacerdote ha passato parte dei suoi poteri al maestro Kalom e a noi. Ora siamo immortali.
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_04"); //Ti farò vedere quanto sei immortale!
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_05"); //Preparati a incontrare il tuo creatore!

	AI_StopProcessInfos	( self );
	
	Log_CreateTopic        ( "Orktempel", LOG_NOTE );
	B_LogEntry            ( "Orktempel","GorBoba voleva fermarmi. Mi ha detto che Kalom e i suoi seguaci hanno ottenuto dagli alti sacerdoti l'invulnerabilità alle armi degli umani."); 

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );	
};
