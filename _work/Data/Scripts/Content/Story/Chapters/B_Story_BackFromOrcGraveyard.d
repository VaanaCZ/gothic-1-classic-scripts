//#####################################################################
//##
//##							KAPITEL 3
//##							=========
//##	Der Spieler kehrt vom Ork-Friedhof zurьck und berichtet
//##	von Baal-Lukor und den Ereignissen dort.
//##
//#####################################################################

func void B_Story_BackFromOrcGraveyard()
{
	//-------- Tagebucheintrag --------
	B_LogEntry			(CH3_OrcGraveyard,	"Я рассказал Кор-Ангару о том, что произошло на кладбище орков. Эти события расстроили его, и теперь он надеется только на выздоровление Юбериона.");
	Log_SetTopicStatus	(CH3_OrcGraveyard,	LOG_SUCCESS);
};