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
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //Non abbiamo molto tempo, quindi ascolta attentamente!
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //Come hai fatto a...
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //Il Dormiente non è lontano. Ho dovuto usare tutto il mio potere per arrivare fin qui.
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //Ho tradotto le profezie degli orchi e scoperto il significato dei cinque cuori.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //I cinque cuori dei sacerdoti che hai sconfitto si trovavano in cinque reliquiari.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //Questi possono essere aperti, ma solo le antiche lame dei sacerdoti possono ferire i cuori.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //Devi trafiggerli con le cinque lame: solo così potrai allontanare per sempre il Dormiente da questo mondo.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //Ho capito!
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //Sbrigati! Il risveglio del demone è prossimo. Cor Kalom e i suoi discepoli deviati sono già qui.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //Si sono riuniti nella sala del Dormiente.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //Nessuno può fermarmi, oramai.
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //Il Dormiente diventa sempre più forte, non posso...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //Che ti prende?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //Io... devo...

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,"Il momento è giunto. Devo essere vicino al luogo in cui riposa il Dormiente. Xardas è apparso all'improvviso, dandomi istruzioni su come affrontare il combattimento. I cinque cuori degli orchi sciamani non-morti sono custoditi dentro dei reliquiari: devo trafiggerli con le cinque lame che ho con me. Questo è l'unico modo per sconfiggere il Dormiente. Sembra facile...");
	
	AI_StopProcessInfos	(self);
};		
