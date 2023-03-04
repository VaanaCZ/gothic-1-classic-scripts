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
	B_LogEntry			(CH3_OrcGraveyard,"J'ai raconté à Cor Angar les évènements au cimetierre Orc. Il était trés en colère. Maintenant tous ses espoirs sont tournés vers Y'Bérion, qui est toujours inconscient.");
	Log_SetTopicStatus	(CH3_OrcGraveyard,	LOG_SUCCESS);
};
