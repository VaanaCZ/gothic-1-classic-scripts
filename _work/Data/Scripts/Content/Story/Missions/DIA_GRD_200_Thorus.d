// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Thorus_EXIT(C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 999;
	condition	= Info_Thorus_EXIT_Condition;
	information	= Info_Thorus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Thorus_EXIT_Condition()
{
	return 1;
};
 
FUNC VOID Info_Thorus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					Nur Gomez Leute in Burg
// ************************************************************

INSTANCE Info_Thorus_EnterCastle(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_EnterCastle_Condition;
	information	= Info_Thorus_EnterCastle_Info;
	permanent	= 0;
	description = "No parece que dejes entrar a todo el mundo en el castillo.";
};                       

FUNC INT Info_Thorus_EnterCastle_Condition()
{	
	if !C_NpcBelongsToOldCamp (other)
	&& (Diego_GomezAudience == FALSE)
	{
		return 1;
	};
};
FUNC VOID Info_Thorus_EnterCastle_Info()
{	
	AI_Output (other, self,"Info_EnterCastle_15_00"); //No parece que dejes entrar a todo el mundo en el castillo.
	AI_Output (self, other,"Info_EnterCastle_09_01"); //Sólo los hombres de Gómez pueden entrar en el castillo.
};

// ************************************************************
// 					Ich will für Gomez arbeiten
// ************************************************************

INSTANCE Info_Thorus_WorkForGomez(C_INFO) //E2
{
	npc			= GRD_200_THORUS;
	nr			= 3;
	condition	= Info_Thorus_WorkForGomez_Condition;
	information	= Info_Thorus_WorkForGomez_Info;
	permanent	= 0;
	description = "Quiero trabajar para Gómez.";
};                       

FUNC INT Info_Thorus_WorkForGomez_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) || Npc_KnowsInfo (hero,Info_Thorus_EnterCastle) )
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_WorkForGomez_Info()
{	
	AI_Output (other, self,"Info_WorkForGomez_15_00"); //Quiero trabajar para Gómez.
	AI_Output (self, other,"Info_WorkForGomez_09_01"); //¿Ah, sí? ¿Y qué te hace pensar que a Gómez le interesará que trabajes para él?
};

// ************************************************************
// 						Diego schickt mich
// ************************************************************

INSTANCE Info_Thorus_DiegoSentMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_DiegoSentMe_Condition;
	information	= Info_Thorus_DiegoSentMe_Info;
	permanent	= 0;
	description = "Diego dice que TÚ decides en quién se interesa Gómez.";
};                       

FUNC INT Info_Thorus_DiegoSentMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) && Npc_KnowsInfo(hero,Info_Diego_JoinOldcamp) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_DiegoSentMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_00"); //Diego dice que TÚ decides en quién se interesa Gómez.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_01"); //Uh... Si Diego piensa que vales, ¿por qué no se ocupa ÉL de ti?
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_02"); //Déjame que te explique: Diego va a ponerte a prueba. Si cree que eres lo bastante bueno, te dejaré entrar en el castillo para ver a Gómez.
	AI_Output (self, other,"Info_Thorus_DiegoSentMe_09_03"); //Lo que suceda después depende de ti, ¿vale?
	AI_Output (other, self,"Info_Thorus_DiegoSentMe_15_04"); //Hablaré con Diego.
	
	B_LogEntry(CH1_JoinOC,"Thorus me ha dicho que debo hablar con Diego si quiero ser admitido en el Campamento Viejo. Éste me pondrá a prueba.");
};

// ************************************************************
// 						Try Me
// ************************************************************

INSTANCE Info_Thorus_TryMe(C_INFO) //E3
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMe_Condition;
	information	= Info_Thorus_TryMe_Info;
	permanent	= 0;
	description = "¿Por qué no me pones a prueba?";
};                       

FUNC INT Info_Thorus_TryMe_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_WorkForGomez) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMe_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMe_15_00"); //¿Por qué no me pones a prueba?
	AI_Output (self, other,"Info_Thorus_TryMe_09_01"); //¡No es tan sencillo, muchacho! Todos los recién llegados que quieren llegar a algún sitio necesitan un patrocinador.
	AI_Output (self, other,"Info_Thorus_TryMe_09_02"); //Ese patrocinador tiene que ser uno de los hombres de Gómez. Él te pondrá a prueba.
	AI_Output (self, other,"Info_Thorus_TryMe_09_03"); //Y si fallas, eres responsabilidad suya; ésas son las normas por aquí.
};

// ************************************************************
// 						TryMeAgain
// ************************************************************

INSTANCE Info_Thorus_TryMeAgain(C_INFO) //E4
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeAgain_Condition;
	information	= Info_Thorus_TryMeAgain_Info;
	permanent	= 0;
	description = "Debe haber algo que quieras que se haga.";
};                       

FUNC INT Info_Thorus_TryMeAgain_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeAgain_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeAgain_15_00"); //Debe haber algo que quieras que se haga.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_01"); //No. Los guardias nos ocupamos de cosas que quedan fuera de tu alcance, muchacho.
	AI_Output (self, other,"Info_Thorus_TryMeAgain_09_02"); //Limítate a llevar a cabo las tareas que te plantee tu patrocinador.
};

// ************************************************************
// 						TryMeICanDoIt
// ************************************************************

INSTANCE Info_Thorus_TryMeICanDoIt(C_INFO) //E5
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_TryMeICanDoIt_Condition;
	information	= Info_Thorus_TryMeICanDoIt_Info;
	permanent	= 0;
	description = "Soy muy capaz de hacer lo que me pidas.";
};                       

FUNC INT Info_Thorus_TryMeICanDoIt_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeAgain) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_TryMeICanDoIt_Info()
{	
	AI_Output (other, self,"Info_Thorus_TryMeICanDoIt_15_00"); //Soy muy capaz de hacer lo que me pidas.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_01"); //¿Cómo? Estás empeñado en fracasar, eh... Sólo hay una cosa de la que puede encargarse alguien que no esté con Gómez.
	AI_Output (self, other,"Info_Thorus_TryMeICanDoIt_09_02"); //Pero te lo advierto: si la pifias, te meterás en un buen lío.
};

// **************************************************************************
// 							MISSION MORDRAG KO
// **************************************************************************
VAR INT Thorus_MordragKo;
// **************************************************************************
// 							MISSION MORDRAG KO VERGABE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Offer (C_INFO) //E6
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Offer_Condition;
	information	= Info_Thorus_MordragKo_Offer_Info;
	permanent	= 0;
	description = "Estoy listo para la labor que me encomiendes.";
};                       

FUNC INT Info_Thorus_MordragKo_Offer_Condition()
{
	if ( Npc_KnowsInfo (hero,Info_Thorus_TryMeICanDoIt) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Offer_Info()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_00"); //Estoy listo para la labor que me encomiendes.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_01"); //Lo que estoy a punto de contarte queda entre tú y yo, y nadie más debe enterarse. ¿Está claro?
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_02"); //Por supuesto.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_03"); //Tenemos un problema con un tipo del Campamento Nuevo. Se llama Mordrag. Ha estado robando a los magnates del mineral.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_04"); //Por supuesto, sucede lo mismo con muchos bandidos del Campamento Nuevo, pero este tipo tiene la cara de venir a NUESTRO campamento y vender NUESTRAS mercancías robadas a NUESTROS muchachos.
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_05"); //Ha ido demasiado lejos. Pero sabe que no puedo hacer nada al respecto.
	AI_Output (other, self,"Info_Thorus_MordragKo_Offer_15_06"); //¿Por qué?
	AI_Output (self, other,"Info_Thorus_MordragKo_Offer_09_07"); //Porque los magos lo protegen.

	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
	Info_AddChoice   (Info_Thorus_MordragKo_Offer,"Me encargaré de ello.",Info_Thorus_MordragKo_OFFER_BACK);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"¿Quieres que mate a ese tipo?",Info_Thorus_MordragKo_KillHim);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"¿Dónde puedo encontrar a Mordrag?",Info_Thorus_MordragKo_Where);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"¿Por qué protegen los magos a ese tal Mordrag?",Info_Thorus_MordragKo_MagesProtect);
	Info_AddChoice	 (Info_Thorus_MordragKo_Offer,"Me parece que tu problema son los magos...",Info_Thorus_MordragKo_MageProblem);
	
	Thorus_MordragKo = LOG_RUNNING;
	
	Log_CreateTopic		(CH1_MordragKO, LOG_MISSION);
	B_LogEntry			(CH1_MordragKO,"Thorus me ha pedido que expulse del Campamento a un bandido llamado Mordrag. Queda en mis manos cómo hacerlo, pero nadie debe averiguar que Thorus está implicado.");
	Log_SetTopicStatus	(CH1_MordragKO, LOG_RUNNING);

	var C_Npc Mordrag; 				
	Mordrag = Hlp_GetNpc(ORG_826_Mordrag);
};

FUNC VOID Info_Thorus_MordragKo_OFFER_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_OFFER_BACK_15_00"); //Me encargaré de ello.
	Info_ClearChoices(Info_Thorus_MordragKo_Offer);
};

FUNC VOID Info_Thorus_MordragKo_KillHim()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_KillHim_15_00"); //¿Quieres que mate a ese tipo?
	AI_Output (self, other,"Info_Thorus_MordragKo_KillHim_09_01"); //Quiero que consigas que no vuelva a ver su cara por aquí. No me importa lo que hagas.
};

FUNC VOID Info_Thorus_MordragKo_Where()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_Where_15_00"); //¿Dónde puedo encontrar a Mordrag?
	AI_Output (self, other,"Info_Thorus_MordragKo_Where_09_01"); //Lo encontrarás en la puerta sur del otro extremo del castillo, pasada la entrada. El bastardo no se atreve a entrar más en el campamento.
	B_LogEntry(CH1_MordragKO,"Mordrag está en la puerta sur de la parte de atrás del castillo.");
};

FUNC VOID Info_Thorus_MordragKo_MagesProtect()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_00"); //¿Por qué protegen los magos a ese tal Mordrag?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_01"); //Porque lo usan de recadero. Nuestros magos están en contacto con los magos del Campamento Nuevo. A menudo mandan recados entre los dos campamentos.
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_02"); //Probablemente se enfaden mucho si mato o echo del campamento a uno de sus recaderos.
	AI_Output (other, self,"Info_Thorus_MordragKo_MagesProtect_15_03"); //¿Y yo? ¿Qué crees que me harán los magos?
	AI_Output (self, other,"Info_Thorus_MordragKo_MagesProtect_09_04"); //Eres nuevo aquí. No te pasará nada. Pero yo soy responsable de lo que hacen mis muchachos. Por eso es fundamental que tengas la boca cerrada.
	Thorus_MordragMageMessenger = TRUE;
};

FUNC VOID Info_Thorus_MordragKo_MageProblem()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MageProblem_15_00"); //Me parece que tu problema son los magos...
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_01"); //Sí, pero son un problema difícil de resolver. Hace unos cuantos años, una de las Sombras trató de apuñalar al Gran Mago del Círculo del Fuego mientras dormía.
	AI_Output (self, other,"Info_Thorus_MordragKo_MageProblem_09_02"); //Más tarde lo encontraron en el Anillo Exterior; en realidad, estaba esparcido POR TODO el Anillo Exterior.
};

// **************************************************************************
// 									ANALYZE
// **************************************************************************

INSTANCE Info_Thorus_MordragKo_Analyze (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragKo_Analyze_Condition;
	information	= Info_Thorus_MordragKo_Analyze_Info;
	permanent	= 1;
	description = "En cuanto a Mordrag...";
};                       

FUNC INT Info_Thorus_MordragKo_Analyze_Condition()
{	
	if ( (Thorus_MordragKo == LOG_RUNNING) && (MordragKO_PlayerChoseThorus != TRUE) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragKo_Analyze_Info()
{
	Info_ClearChoices	(Info_Thorus_MordragKo_Analyze);
	Info_AddChoice   	(Info_Thorus_MordragKo_Analyze,"Me encargaré de ello.",Info_Thorus_MordragKo_ANALYZE_BACK);
	Info_AddChoice	 	(Info_Thorus_MordragKo_Analyze,"¿Dónde puedo encontrar a Mordrag?",Info_Thorus_MordragKo_Where);	//SIEHE OBEN
	var C_NPC Mordrag; Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	if (Npc_IsDead(Mordrag))
	{
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"¡Mordrag no volverá a robar nada a nadie!",Info_Thorus_MordragKo_MordragDead);
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{ 
		Info_AddChoice	(Info_Thorus_MordragKo_Analyze,"¡No va a volver a asomar su rostro por aquí!",Info_Thorus_MordragKo_MordragGone);
	};
    
};

FUNC VOID Info_Thorus_MordragKo_ANALYZE_BACK()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_ANALYZE_BACK_15_00"); //Me encargaré de ello.
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

FUNC VOID Info_Thorus_MordragKo_MordragDead()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragDead_15_00"); //¡Mordrag no volverá a robar nada a nadie!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragDead_09_01"); //¿Quieres decir que lo has vencido? No está mal, muchacho.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);	
	B_LogEntry (CH1_MordragKO,"Thorus está impresionado de que haya logrado librarme de Mordrag. Una clara ventaja para mí.");
	B_GiveXP(XP_Thorusmordragdead);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);

};

FUNC VOID Info_Thorus_MordragKo_MordragGone()
{
	AI_Output (other, self,"Info_Thorus_MordragKo_MordragGone_15_00"); //¡No va a volver a asomar su rostro por aquí!
	AI_Output (self, other,"Info_Thorus_MordragKo_MordragGone_09_01"); //Estaría más contento si lo hubieses matado.
	Thorus_MordragKo = LOG_SUCCESS;
	Log_SetTopicStatus(CH1_MordragKO, LOG_SUCCESS);
	B_LogEntry (CH1_MordragKO,"Thorus está contento de que Mordrag ya no esté en el Campamento.");
	B_GiveXP(XP_Thorusmordragko);
	Info_ClearChoices(Info_Thorus_MordragKo_Analyze);
};

// ************************************************************
// 						Mordrag verplappert					
// ************************************************************

INSTANCE Info_Thorus_MordragFailed (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_MordragFailed_Condition;
	information	= Info_Thorus_MordragFailed_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT Info_Thorus_MordragFailed_Condition()
{	
	if (MordragKO_PlayerChoseThorus == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_MordragFailed_Info()
{
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_00"); //¡Has fracasado! ¡Te dije que NO MENCIONARAS MI NOMBRE!
	AI_Output (self, other,"Info_Thorus_MordragFailed_09_01"); //¡La has cagado! ¡Olvídate de todo! ¡No te atrevas a inmiscuirte de nuevo en el asunto!
			
	Thorus_MordragKo = LOG_FAILED;
	
	Log_SetTopicStatus(CH1_MordragKO, LOG_FAILED);
	B_LogEntry (CH1_MordragKO,"A Thorus no le gusta que le haya dicho su nombre a Mordrag. No creo que me convenga visitarlo durante una temporada.");
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Bribe Thorus					
// ************************************************************

INSTANCE Info_Thorus_BribeGuard (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_BribeGuard_Condition;
	information	= Info_Thorus_BribeGuard_Info;
	permanent	= 0;
	description = "Si te doy algo de mineral, ¿me dejarías entrar en el castillo?";
};                       

FUNC INT Info_Thorus_BribeGuard_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_EnterCastle) && (Npc_GetTrueGuild (other)!=GIL_STT) && (Npc_GetTrueGuild (other)!=GIL_GRD) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_BribeGuard_Info()
{
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_00"); //Si te doy algo de mineral, ¿me dejarías entrar en el castillo?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_01"); //A cambio de algo de mineral...
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_02"); //¿Cuánto?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_02"); //Bueno, tendría que tardar un rato en contar el mineral. El tiempo suficiente para asegurar que mis muchachos y yo estamos ocupados contando mientras te cuelas.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_03"); //Dime cuánto.
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_03"); //Basta con 1000 pepitas.
	AI_Output (other, self,"Info_Thorus_BribeGuard_15_04"); //¿1000 pepitas?
	AI_Output (self, other,"Info_Thorus_BribeGuard_09_04"); //Bueno, podrías unirte a Gómez y así entrarías gratis en el castillo.
};

// ************************************************************
// 						Give1000Ore					
// ************************************************************

INSTANCE Info_Thorus_Give1000Ore (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_Give1000Ore_Condition;
	information	= Info_Thorus_Give1000Ore_Info;
	permanent	= 1;
	description = "Tengo las 1000 pepitas de mineral. ¡Déjame entrar!";
};                       

FUNC INT Info_Thorus_Give1000Ore_Condition()
{	
	if (Npc_KnowsInfo(hero,Info_Thorus_BribeGuard))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Give1000Ore_Info()
{
	AI_Output (other, self,"Info_Thorus_Give1000Ore_15_00"); //Tengo las 1000 pepitas de mineral. ¡Déjame entrar!
	
	if (Npc_HasItems(other, ItMiNugget)>=1000)
	{
		B_GiveInvItems 	(other,self,ItMiNugget,1000);		
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_01"); //De acuerdo, adelante. Puedes entrar en el castillo, pero no hagas nada estúpido, ¿vale?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Give1000Ore_09_02"); //No me tomes el pelo, chaval. ¡No tienes 1000 pepitas de oro!
	};
};
		
// ************************************************************
// 					Brief für Magier
// ************************************************************

INSTANCE Info_Thorus_LetterForMages (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_LetterForMages_Condition;
	information	= Info_Thorus_LetterForMages_Info;
	permanent	= 1;
	description = "¡Tengo que entrar en el castillo! Tengo una carta para el Gran Mago.";
};                       

FUNC INT Info_Thorus_LetterForMages_Condition()
{	
	if	Npc_KnowsInfo(hero, Info_Thorus_EnterCastle)
	&&	(Npc_HasItems (hero, ItWr_Fire_Letter_01) || Npc_HasItems (hero, ItWr_Fire_Letter_02))
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_LetterForMages_Info()
{
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_00"); //¡Tengo que entrar en el castillo! Tengo una carta para el Gran Mago.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_01"); //¿Y esperas que te deje colarte en el castillo para entregarla y recoger tu recompensa?
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_02"); //Sí.
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_03"); //De acuerdo, enséñame la carta.
	AI_Output (other, self,"Info_Thorus_LetterForMages_15_04"); //No voy a dejar que TÚ la entregues. ¡Olvídalo!
	AI_Output (self, other,"Info_Thorus_LetterForMages_09_05"); //De acuerdo, ya se me ha olvidado.
};

// ************************************************************
// 					Bereit für Gomez !!!
// ************************************************************

INSTANCE Info_Thorus_ReadyForGomez (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_ReadyForGomez_Condition;
	information	= Info_Thorus_ReadyForGomez_Info;
	permanent	= 0;//1
	description = "¡Diego dice que estoy listo para ver a Gómez!";
};                       

FUNC INT Info_Thorus_ReadyForGomez_Condition()
{	
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_ReadyForGomez_Info()
{
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_00"); //¡Diego dice que estoy listo para ver a Gómez!
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_01"); //¡Eso me corresponde a mí decidirlo!
	AI_Output (other, self,"Info_Thorus_ReadyForGomez_15_02"); //¿Y qué decides?
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_03"); //Hmmm...
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_04"); //Debo admitir que pareces haber hecho bien la mayoría de las cosas.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_05"); //¡De acuerdo! Puedes ver a Gómez. Sólo él decidirá si te unes o no a nosotros.
	AI_Output (self, other,"Info_Thorus_ReadyForGomez_09_06"); //A partir de ahora estás solo, muchacho.
				
	var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
	var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
	var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
	wache212.aivar[AIV_PASSGATE] = TRUE;
	wache213.aivar[AIV_PASSGATE] = TRUE;
	wache218.aivar[AIV_PASSGATE] = TRUE;
};

// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Thorus_Krautbote (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_Krautbote_Condition;
	information	= Info_Thorus_Krautbote_Info;
	permanent	= 0;
	description = "Tengo una remesa de hierba para Gómez de parte de Cor Kalom.";
};                       

FUNC INT Info_Thorus_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_Krautbote_Info()
{
	AI_Output (other, self,"Info_Thorus_Krautbote_15_00"); //Tengo una remesa de hierba para Gómez de parte de Cor Kalom.
	AI_Output (self, other,"Info_Thorus_Krautbote_09_01"); //¡Enséñamela!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_02"); //Hmmmmmmm...
		AI_Output (self, other,"Info_Thorus_Krautbote_09_03"); //¡De acuerdo! Puedes pasar. Ve directamente a la casa de los magnates del mineral. Bartholo te recibirá allí.
		
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		var C_NPC wache218; wache218 = Hlp_GetNpc(Grd_218_Gardist);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		wache218.aivar[AIV_PASSGATE] = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_Krautbote_09_04"); //¡No tienes suficiente hierba para ser un recadero! ¡Por tu bien, espero que no la hayas vendido por ahí! ¡Vuelve cuando tengas la cantidad adecuada!
	};
};

// ************************************************************
// 					SIEGEL der KdW
// ************************************************************
	var int thorus_Amulettgezeigt;
// ************************************************************

INSTANCE Info_Thorus_KdWSiegel (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 4;
	condition	= Info_Thorus_KdWSiegel_Condition;
	information	= Info_Thorus_KdWSiegel_Info;
	permanent	= 1;
	description = "Los magos del agua me han hecho un encargo. ¡Debo entrar en el castillo!";
};                       

FUNC INT Info_Thorus_KdWSiegel_Condition()
{	
	if 	(( (Npc_KnowsInfo(hero, Org_826_Mordrag_Courier))||(Npc_HasItems(other,KdW_Amulett)>=1) )
		&& (thorus_Amulettgezeigt == FALSE) 
		)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_KdWSiegel_Info()
{
	AI_Output (other, self,"Info_Thorus_KdWSiegel_15_00"); //Los magos del agua me han encargado un recado. ¡Tengo que entrar en el castillo!
	if (Npc_HasItems(other,KdW_Amulett)>=1)
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_01"); //Llevas un amuleto de mensajero. Los guardias te permitirán pasar.
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_02"); //No quiero tener nada que ver con los magos. Deja de incordiarme, ¿vale?
		var C_NPC wache212; wache212 = Hlp_GetNpc(Grd_212_Torwache);
		var C_NPC wache213; wache213 = Hlp_GetNpc(Grd_213_Torwache);
		wache212.aivar[AIV_PASSGATE] = TRUE;
		wache213.aivar[AIV_PASSGATE] = TRUE;
		
		thorus_Amulettgezeigt = TRUE;
	}
	else
	{
		AI_Output (self, other,"Info_Thorus_KdWSiegel_09_03"); //Lo que tú digas. Supongo que debes haber perdido tu amuleto, ¿eh?
	};
};

// ************************************************************
// 					Habs GESCHAFFT
// ************************************************************

INSTANCE Info_Thorus_SttGeschafft (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_SttGeschafft_Condition;
	information	= Info_Thorus_SttGeschafft_Info;
	permanent	= 0;
	description = "Lo he conseguido. ¡Por fin pertenezco al campamento!";
};                       

FUNC INT Info_Thorus_SttGeschafft_Condition()
{	
	if (Npc_GetTrueGuild(other) == GIL_STT)
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_SttGeschafft_Info()
{
	AI_Output (other, self,"Info_Thorus_SttGeschafft_15_00"); //Lo he conseguido. ¡Por fin pertenezco al campamento!
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_01"); //¡Felicidades, muchacho! Será mejor que permanezcas cerca de Diego a partir de ahora.
	AI_Output (self, other,"Info_Thorus_SttGeschafft_09_02"); //Ve a Gómez o a Raven únicamente si tienes algo VERDADERAMENTE importante que decir.
};	

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 2 	   ///////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

// ************************************************************
// 					PERM2
// ************************************************************

INSTANCE Info_Thorus_PERM2 (C_INFO)
{
	npc			= GRD_200_THORUS;
	nr			= 1;
	condition	= Info_Thorus_PERM2_Condition;
	information	= Info_Thorus_PERM2_Info;
	permanent	= 0;
	description = "¿Qué tal estás?";
};                       

FUNC INT Info_Thorus_PERM2_Condition()
{	
	if ( (Npc_GetTrueGuild(other) == GIL_STT) && (Kapitel < 4) )
	{
		return 1;
	};
};

FUNC VOID Info_Thorus_PERM2_Info()
{
	AI_Output (other, self,"Info_Thorus_PERM2_15_00"); //¿Qué tal estás?
	AI_Output (self, other,"Info_Thorus_PERM2_09_01"); //El Campamento Nuevo no nos da mucha guerra. Me preocupan mucho más esos zumbados de la secta.
};	

//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////    Kapitel 3    ///////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

//-----------------------------------------------------
// GILDENAUFNAHME GARDIST
//-----------------------------------------------------

instance  GRD_200_Thorus_GARDIST (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_GARDIST_Condition;
	information		= GRD_200_Thorus_GARDIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Tienes algo que decirme?"; 
};

FUNC int  GRD_200_Thorus_GARDIST_Condition()
{	
	if ( (CorKalom_BringMCQBalls == LOG_SUCCESS)
	|| Npc_KnowsInfo (hero,Grd_214_Torwache_SEETHORUS)
	|| Npc_KnowsInfo (hero,GRD_216_Torwache_SEETHORUS) )
	&& (Npc_GetTrueGuild (hero ) == GIL_STT)
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_WANNABEMAGE))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_GARDIST_Info()
{
	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = TRUE;
	AI_Output (other, self,"GRD_200_Thorus_GARDIST_Info_15_01"); //¿Tienes algo que decirme?
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_02"); //Sí. Lo que hiciste en la mina no sólo es una prueba de tu valentía, sino que también demuestra tu fuerza y tus talentos de combate.
	AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_03"); //Estoy dispuesto a aceptarte en las filas de los guardias.
	if hero.level < 10
	{
		AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_04"); //Pero aún no estás preparado para convertirte en guardia. Tienes que reunir un poco más de experiencia antes de que te acepte.
	    AI_StopProcessInfos	(self);
		B_PrintGuildCondition(10);
    }
    else if hero.level >= 10
    {
	    AI_Output (self, other,"GRD_200_Thorus_GARDIST_Info_09_05"); //Te estoy dando una oportunidad. ¿Qué dices?
	};
};
//---------------------------------------------------------------
// GARDIST WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_AUFNAHME (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_AUFNAHME_Condition;
	information		= GRD_200_Thorus_AUFNAHME_Info;
	permanent		= 0;
	description		= "Quiero convertirme en guardia."; 
};

FUNC int  GRD_200_Thorus_AUFNAHME_Condition()
{	
	if (Npc_KnowsInfo (hero,GRD_200_Thorus_GARDIST))
	&& (hero.level >=10)	
	&& (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_AUFNAHME_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_AUFNAHME_Info_15_01"); //Quiero convertirme en guardia.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_02"); //Me alegro. Pero antes debo decirte algo que digo a todos los nuevos reclutas. Escucha atentamente, pues sólo lo diré una vez.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_03"); //Por ahora, has intentado valértelas por ti mismo. Eso se ha acabado. Mis muchachos actúan juntos. Los guardias protegemos a los magnates del mineral, el mineral, el campamento y la mina.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_04"); //Los cavadores extraen el mineral, pero hacemos que los reptadores no se los coman. Los magnates negocian con el rey, pero nosotros somos los que los protegen.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_05"); //Estamos en la mina noche y día. Noche y día permanecemos en las puertas del campamento y aseguramos que todos duerman tranquilos.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_06"); //Cuando empezamos éramos un grupo alocado, pero ahora se nos tiene en cuenta. Todos hemos trabajado duro para conseguir esta vida.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_07"); //De mis muchachos sólo espero una cosa: que permanezcan unidos. Sólo permaneciendo unidos conseguiremos conservar lo que tenemos.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_08"); //Y sobrevivir.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_09"); //Aprenderás todo lo demás a su debido tiempo. Estate preparado y ayuda allá donde sea necesario o haga falta algo.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_10"); //Pídele a Stone que te dé una espada y algo de armadura.
	AI_Output (self, other,"GRD_200_Thorus_AUFNAHME_Info_09_11"); //Encontrarás a Stone en la herrería del Círculo Interior.

	var C_Npc KDFWache; 				
	KDFWache = Hlp_GetNpc(GRD_245_GARDIST);
	KDFWache.aivar[AIV_PASSGATE] = FALSE;

	Npc_SetTrueGuild (hero,GIL_GRD);
	hero.guild = GIL_GRD;
};  
//---------------------------------------------------------------
// GARDIST WERDEN TEIL 2
//---------------------------------------------------------------
instance GRD_200_Thorus_NOCHWAS (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_NOCHWAS_Condition;
	information		= GRD_200_Thorus_NOCHWAS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_200_Thorus_NOCHWAS_Condition()
{	
	if (Npc_KnowsInfo     (hero, GRD_200_Thorus_AUFNAHME))
	&& (Npc_GetTrueGuild  (hero) == GIL_GRD ) 
	{
		return TRUE;
	};
};
func void  GRD_200_Thorus_NOCHWAS_Info()
{
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_01"); //Oh, una cosa más...
	AI_Output			(self, other,"GRD_200_Thorus_NOCHWAS_Info_09_02"); //Bienvenido a la guardia.
	AI_StopProcessInfos	(self);

	Log_CreateTopic		(GE_BecomeGuard,	LOG_NOTE);
	B_LogEntry			(GE_BecomeGuard,"Thorus me ha admitido hoy en la guardia. Puedo ir a recoger mi nueva armadura en la herrería de Stone, en el castillo.");
	
};

//---------------------------------------------------------------
// ICH WILL MAGIER WERDEN
//---------------------------------------------------------------
instance  GRD_200_Thorus_WANNABEMAGE (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_WANNABEMAGE_Condition;
	information		= GRD_200_Thorus_WANNABEMAGE_Info;
	permanent		= 0;
	description		= "Me interesa la senda de la magia."; 
};
//
FUNC int  GRD_200_Thorus_WANNABEMAGE_Condition()
{	
	if (Npc_KnowsInfo (hero, GRD_200_Thorus_GARDIST))
	&& (!Npc_KnowsInfo (hero, GRD_200_Thorus_AUFNAHME))
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_WANNABEMAGE_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_WANNABEMAGE_Info_15_01"); //Me interesa la senda de la magia.
	AI_Output (self, other,"GRD_200_Thorus_WANNABEMAGE_Info_09_02"); //Bueno, en ese caso tal vez deberías hablar con Corristo. Él enseñó a Milten. Seguro que nada te lo impide.

	var C_NPC Corristo;
	Corristo = Hlp_GetNpc		(KDF_402_Corristo);
	Npc_ExchangeRoutine			(Corristo,"WAITFORSC");
	AI_ContinueRoutine			(Corristo);
};  
//---------------------------------------------------------------
//     						STR + DEX
//---------------------------------------------------------------
INSTANCE GRD_200_Thorus_Teach(C_INFO)
{
	npc			= GRD_200_Thorus;
	nr			= 10;
	condition	= GRD_200_Thorus_Teach_Condition;
	information	= GRD_200_Thorus_Teach_Info;
	permanent	= 1;
	description = "¿Puedes enseñarme?";
};                       

FUNC INT GRD_200_Thorus_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD)  
	{
		return TRUE;
	};
};

FUNC VOID GRD_200_Thorus_Teach_Info()
{
	AI_Output(other,self,"GRD_200_Thorus_Teach_15_00"); //¿Puedes enseñarme?
	AI_Output(self,other,"GRD_200_Thorus_Teach_09_01"); //Puedo enseñarte a mejorar tu habilidad y tu fuerza.
	
	if (log_thorustrain == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Thorus va a ayudarme a mejorar mi FUERZA y mi DESTREZA.");
		log_thorustrain = TRUE;
	};
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_BACK()
{
	
	Info_ClearChoices	(GRD_200_Thorus_Teach);
};

func void GRD_200_Thorus_Teach_STR_1()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_STR_5()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY,LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};

func void GRD_200_Thorus_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(GRD_200_Thorus_Teach);
	Info_AddChoice		(GRD_200_Thorus_Teach,DIALOG_BACK									,GRD_200_Thorus_Teach_BACK);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,GRD_200_Thorus_Teach_STR_1);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_5);
	Info_AddChoice		(GRD_200_Thorus_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)	,GRD_200_Thorus_Teach_DEX_1);
};
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND1 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND1_Condition;
	information		= GRD_200_Thorus_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND1_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_1H) == 2)
	&& (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_GRD)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND1_Info()
{	
	if (log_thorusfight == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry			(GE_TeacherOC,"Thorus puede enseñarme a combatir con ARMAS DE DOS MANOS en cuanto haya dominado el combate con las de UNA MANO.");
		log_thorusfight = TRUE;
	};
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND1_Info_15_01"); //Quiero aprender a manejar una espada de dos manos.
	
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_02"); //De acuerdo, comencemos por el principio.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_03"); //Sujeta la espada en posición horizontal. Tendrás que balancearte más para atacar a tu rival con un arma tan pesada.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_04"); //Alza el brazo y ondéalo hacia abajo. Eso suele bastar para derribar a tu rival.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_05"); //Usa el impulso del arma para volverla a enderezar.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_06"); //Las espadas de dos manos son ideales para coordinar golpes laterales y mantener alejados a los rivales.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND1_Info_09_07"); //Para empezar, con eso debería bastar. Practica.
		GRD_200_Thorus_ZWEIHAND1.permanent = 0;
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  GRD_200_Thorus_ZWEIHAND2 (C_INFO)
{
	npc				= GRD_200_Thorus;
	condition		= GRD_200_Thorus_ZWEIHAND2_Condition;
	information		= GRD_200_Thorus_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
};

FUNC int  GRD_200_Thorus_ZWEIHAND2_Condition()
{	
	if (Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
	&& (Npc_GetTrueGuild    (hero) == GIL_GRD)
	{
		return TRUE;
	};

};
FUNC void  GRD_200_Thorus_ZWEIHAND2_Info()
{
	AI_Output (other, self,"GRD_200_Thorus_ZWEIHAND2_Info_15_01"); //Quiero aprender más cosas del combate con una espada a dos manos.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_02"); //En primer lugar, tienes que cambiar tu posición básica. Mantén vertical la espada, coge la empuñadura firmemente con ambas manos y sostenla al lado de tu cuerpo.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_03"); //Bájala rápidamente y ondea la hoja sobre tu hombro. Ahora es el momento de dar un tajo rápido a tu derecha.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_04"); //Tu contrincante no tendrá tiempo de llegar hasta ti.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_05"); //O baja la espada desde la parte superior izquierda en una estocada hacia delante para hacer retroceder a tu oponente.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_06"); //Gira para dar a tu siguiente golpe el impulso necesario para derribar a tu rival.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_07"); //Si eso no basta, usa lo que queda del movimiento para blandir de nuevo el arma.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_08"); //Cuando hayas finalizado tu ataque, bloquea a tu rival y espera una abertura para volver a atacar.
		AI_Output (self, other,"GRD_200_Thorus_ZWEIHAND2_Info_09_09"); //La clave del éxito es variar las posturas y cambiar las posiciones.
		GRD_200_Thorus_ZWEIHAND2.permanent = 0 ;
	};
};  
