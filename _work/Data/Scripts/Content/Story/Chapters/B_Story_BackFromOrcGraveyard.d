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
	B_LogEntry			(CH3_OrcGraveyard,"Opowiedzia�em Cor Angarowi o wydarzeniach na cmentarzysku ork�w. Guru by� bardzo niepocieszony. Teraz ca�a nasza nadzieja spoczywa w nieprzytomnym Y'Berionie.");
	Log_SetTopicStatus	(CH3_OrcGraveyard,	LOG_SUCCESS);
};
