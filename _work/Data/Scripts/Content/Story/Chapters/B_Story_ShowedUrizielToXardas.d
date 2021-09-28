func void B_Story_ShowedUrizielToXardas()
{
	//-------- Missionsgegenstände --------
	
	//-------- Tagebucheinträge --------
	B_LogEntry			(CH4_EnterTemple,"Xardas by³ bardzo zaskoczony, ¿e uda³o mi siê dotrzeæ do podziemnej œwi¹tyni. Chyba naprawdê uwa¿a, ¿e jestem osob¹, o której mówi staro¿ytna przepowiednia orków.");
	Log_SetTopicStatus	(CH4_EnterTemple,	LOG_SUCCESS);
	
	Log_CreateTopic		(CH5_Uriziel,	LOG_MISSION);
	Log_SetTopicStatus	(CH5_Uriziel,	LOG_RUNNING);
	B_LogEntry			(CH5_Uriziel,"Xardasowi uda³o siê zidentyfikowaæ dziwny miecz, który znalaz³em w œwi¹tyni Œni¹cego. To staro¿ytny URIZIEL - niegdyœ obdarzony niezwykle potê¿nymi mocami. Niestety, z biegiem lat miecz straci³ swe magiczne w³aœciwoœci. Muszê znaleŸæ jakiœ sposób, by przywróciæ mu dawn¹ œwietnoœæ.");
	
	//-------- Erfahrung --------
	B_GiveXP			(XP_ShowUrizielToXardas);
};
