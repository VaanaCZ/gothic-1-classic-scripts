func void B_Story_UrizielLoaded()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH5_Uriziel,"Je to hotovo. Vypadá to, že URIZIEL znovu nabyl své někdejší síly. Saturas a jeho mágové Vody jsou nyní velmi rozzuření, takže se teď před nimi nebudu raději ukazovat. Nevadí, Spáč mě očekává!");
	
	if (Npc_GetTrueGuild(hero) != GIL_KDW)
	{
		Log_SetTopicStatus(CH5_Uriziel,	LOG_SUCCESS);
	}
	else
	{
		B_LogEntry		(CH5_Uriziel,"Během mé poslední návštěvy Xardas poznamenal, že by měl existovat nějaký způsob, jak bych mohl využít sílu URIZIELU, dokonce i jako mág. Chtěl si však meč znovu prohlédnout. Měl bych ho navštívit.");
	};
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_LoadedUriziel);

	//-------- Wassermagier sauer machen --------
	B_SetPermAttitude	(Kdw_600_Saturas,	ATT_HOSTILE);	
	B_SetPermAttitude	(Kdw_601_Myxir, 	ATT_HOSTILE);
	B_SetPermAttitude	(Kdw_602_Merdarion,	ATT_HOSTILE);
	B_SetPermAttitude	(Kdw_603_Nefarius, 	ATT_HOSTILE);
	B_SetPermAttitude	(Kdw_604_Cronos, 	ATT_HOSTILE);
	B_SetPermAttitude	(Kdw_605_Riordian, 	ATT_HOSTILE);
	
	B_ClearImmortal		(Kdw_600_Saturas	);	
	B_ClearImmortal		(Kdw_601_Myxir		); 	
	B_ClearImmortal		(Kdw_602_Merdarion	); 	
	B_ClearImmortal		(Kdw_603_Nefarius	); 	
	B_ClearImmortal		(Kdw_604_Cronos		); 	
	B_ClearImmortal		(Kdw_605_Riordian	); 	
	
	B_SetNpcType		(Kdw_600_Saturas,	NPCTYPE_MAIN);	
	B_SetNpcType		(Kdw_601_Myxir, 	NPCTYPE_MAIN);
	B_SetNpcType		(Kdw_602_Merdarion,	NPCTYPE_MAIN);
	B_SetNpcType		(Kdw_603_Nefarius, 	NPCTYPE_MAIN);
	B_SetNpcType		(Kdw_604_Cronos, 	NPCTYPE_MAIN);
	B_SetNpcType		(Kdw_605_Riordian, 	NPCTYPE_MAIN);
};
