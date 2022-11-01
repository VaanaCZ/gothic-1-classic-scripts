func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_EnterTemple,"Xardas był bardzo zaskoczony, że udało mi się dotrzeć do podziemnej świątyni. Chyba naprawdę uważa, że jestem osobą, o której mówi starożytna przepowiednia orków.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,"Xardasowi udało się zidentyfikować dziwny miecz, który znalazłem w świątyni Śniącego. To starożytny URIZIEL - niegdyś obdarzony niezwykle potężnymi mocami. Niestety, z biegiem lat miecz stracił swe magiczne właściwości. Muszę znaleźć jakiś sposób, by przywrócić mu dawną świetność.");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};
