func void B_Story_UrizielLoaded()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH5_Uriziel,"Zadanie wykonane! URIZIEL odzyska� dawn� moc. Saturas i jego Magowie Wody maj� mnie chyba serdecznie do��. Chwilowo lepiej b�dzie trzyma� si� od nich z dala. Tak czy inaczej, teraz czeka mnie przeprawa ze �ni�cym!");
	
	if (Npc_GetTrueGuild(hero) != GIL_KDW)
	{
		Log_SetTopicStatus(CH5_Uriziel,	LOG_SUCCESS);
	}
	else
	{
		B_LogEntry		(CH5_Uriziel,"Podczas mojej ostatniej wizyty, Xardas wspomnia� o mo�liwo�ci wykorzystania mocy Uriziela nawet przeze mnie - maga, jednak najpierw chce na niego rzuci� okiem. Powinienem uda� si� do siedziby Nekromanty.");
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
