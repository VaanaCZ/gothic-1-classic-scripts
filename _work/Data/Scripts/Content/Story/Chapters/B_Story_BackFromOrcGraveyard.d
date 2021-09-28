//#####################################################################
//##
//##							KAPITEL 3
//##							=========
//##	Der Spieler kehrt vom Ork-Friedhof zurück und berichtet
//##	von Baal-Lukor und den Ereignissen dort.
//##
//#####################################################################

func void B_Story_BackFromOrcGraveyard()
{
	//-------- Tagebucheintrag --------
	B_LogEntry			(CH3_OrcGraveyard,"Øekl jsem Coru Angarovi o tom, co se stalo na skøetím høbitovì. Byl velmi zmatený. Nyní se všechny jeho nadìje upínají k Y´Berionovi, který je stále v bezvìdomí.");
	Log_SetTopicStatus	(CH3_OrcGraveyard,	LOG_SUCCESS);
};
