//#####################################################################
//##
//##							KAPITEL 3
//##							=========
//##	Der Spieler kehrt vom Ork-Friedhof zur�ck und berichtet
//##	von Baal-Lukor und den Ereignissen dort.
//##
//#####################################################################

func void B_Story_BackFromOrcGraveyard()
{
	//-------- Tagebucheintrag --------
	B_LogEntry			(CH3_OrcGraveyard,"�ekl jsem Coru Angarovi o tom, co se stalo na sk�et�m h�bitov�. Byl velmi zmaten�. Nyn� se v�echny jeho nad�je up�naj� k Y�Berionovi, kter� je st�le v bezv�dom�.");
	Log_SetTopicStatus	(CH3_OrcGraveyard,	LOG_SUCCESS);
};
