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
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //Nemáme moc èasu, tak poslouchej bedlivì!
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //Jak jsi...
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //Spáè není daleko. Musel jsem použít všechny své síly, abych se sem dostal.
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //Pøeložil jsem Skøetí proroctví a objevil tajemství pìti srdcí.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //Pìt srdcí knìží, které jsi porazil, je uloženo v pìti relikviáøích.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //Tyto relikviáøe se dají otevøít, ale jen starobylá ostøí, která knìží nosili u sebe, mohou poškodit srdce.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //Ty musíš ta srdce probodnout pìti ostøími. Jedinì tak budeš moci odstranit Spáèe z tohoto svìta.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //Rozumím!
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //Pospìš, procitnutí arcidémona se blíží, pomatený Cor Kalom se svými zbloudilými žáky je tu.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //Shromáždili se ve Spáèovì sále.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //Už jsem krvácel dost! Teï mì nikdo nezastaví!
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //Spáèova moc sílí a sílí, nedokážu...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //Co se ti stalo?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //Já... musím...

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,"Nadešel èas. Musím být v tìsné blízkosti místa Spáèova odpoèinku. Znenadání se objevil Xardas a dal mi pokyny k boji. V relikviáøi je pìt srdcí nemrtvých skøetích šamanù, která musím proklát pìti èepelemi, které mám pøi sobì. To je jediný zpùsob, jak porazit Spáèe. Vypadá to prostì...");
	
	AI_StopProcessInfos	(self);
};		
