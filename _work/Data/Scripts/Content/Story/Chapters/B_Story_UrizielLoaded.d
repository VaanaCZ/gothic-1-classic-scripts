func void B_Story_UrizielLoaded()
{
	//-------- Missionsgegenst�nde --------
	
	//-------- Tagebucheintr�ge --------
	B_LogEntry			(CH5_Uriziel,"Je to hotovo. Vypad� to, �e URIZIEL znovu nabyl sv� n�kdej�� s�ly. Saturas a jeho m�gov� Vody jsou nyn� velmi rozzu�en�, tak�e se te� p�ed nimi nebudu rad�ji ukazovat. Nevad�, Sp�� m� o�ek�v�!");
	
	if (Npc_GetTrueGuild(hero) != GIL_KDW)
	{
		Log_SetTopicStatus(CH5_Uriziel,	LOG_SUCCESS);
	}
	else
	{
		B_LogEntry		(CH5_Uriziel,"B�hem m� posledn� n�v�t�vy Xardas poznamenal, �e by m�l existovat n�jak� zp�sob, jak bych mohl vyu��t s�lu URIZIELU, dokonce i jako m�g. Cht�l si v�ak me� znovu prohl�dnout. M�l bych ho nav�t�vit.");
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
