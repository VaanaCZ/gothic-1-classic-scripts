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
	B_LogEntry			(CH3_OrcGraveyard,"Le he contado a Cor Angar lo sucedido en el cementerio orco y se sintió muy disgustado. Ahora, todas sus esperanzas recaen en Y'Berion, que sigue inconsciente.");
	Log_SetTopicStatus	(CH3_OrcGraveyard,	LOG_SUCCESS);
};
