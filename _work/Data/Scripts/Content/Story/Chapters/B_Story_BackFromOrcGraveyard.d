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
	B_LogEntry			(CH3_OrcGraveyard,"Opowiedzia³em Cor Angarowi o wydarzeniach na cmentarzysku orków. Guru by³ bardzo niepocieszony. Teraz ca³a nasza nadzieja spoczywa w nieprzytomnym Y'Berionie.");
	Log_SetTopicStatus	(CH3_OrcGraveyard,	LOG_SUCCESS);
};
