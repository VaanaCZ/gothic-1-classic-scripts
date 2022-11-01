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
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //Nemáme moc času, tak poslouchej bedlivě!
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //Jak jsi...
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //Spáč není daleko. Musel jsem použít všechny své síly, abych se sem dostal.
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //Přeložil jsem Skřetí proroctví a objevil tajemství pěti srdcí.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //Pět srdcí kněží, které jsi porazil, je uloženo v pěti relikviářích.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //Tyto relikviáře se dají otevřít, ale jen starobylá ostří, která kněží nosili u sebe, mohou poškodit srdce.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //Ty musíš ta srdce probodnout pěti ostřími. Jedině tak budeš moci odstranit Spáče z tohoto světa.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //Rozumím!
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //Pospěš, procitnutí arcidémona se blíží, pomatený Cor Kalom se svými zbloudilými žáky je tu.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //Shromáždili se ve Spáčově sále.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //Už jsem krvácel dost! Teď mě nikdo nezastaví!
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //Spáčova moc sílí a sílí, nedokážu...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //Co se ti stalo?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //Já... musím...

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,"Nadešel čas. Musím být v těsné blízkosti místa Spáčova odpočinku. Znenadání se objevil Xardas a dal mi pokyny k boji. V relikviáři je pět srdcí nemrtvých skřetích šamanů, která musím proklát pěti čepelemi, které mám při sobě. To je jediný způsob, jak porazit Spáče. Vypadá to prostě...");
	
	AI_StopProcessInfos	(self);
};		
