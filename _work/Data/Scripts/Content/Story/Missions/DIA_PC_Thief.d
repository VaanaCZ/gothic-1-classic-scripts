var int Diego_After_Gamestart;

// ************************************************************
// 							GAMESTART
// ************************************************************

INSTANCE Info_Diego_Gamestart (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Gamestart_Condition;
	information	= Info_Diego_Gamestart_Info;
	permanent	= 0;
	important	= 1;
	//description = "(Startsatz: zum Goldmaster wieder zu Important-Info machen !!!)";
};                       

FUNC INT Info_Diego_Gamestart_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Gamestart_Info()
{
	AI_Output(self,hero,"Info_Diego_Gamestart_11_00"); //Soy Diego.
	AI_Output(hero,self,"Info_Diego_Gamestart_15_01"); //Yo soy...
	AI_Output(self,hero,"Info_Diego_Gamestart_11_02"); //No me interesa saber quien eres. Acabas de llegar y yo me encargo de los nuevos. Eso es todo por ahora.
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //Si planeas seguir con vida mucho tiempo, deberías hablar conmigo. Pero, por supuesto, no seré yo quien te impida elegir tu propia destrucción. Bueno, ¿qué opinas?
	
	B_Kapitelwechsel(1); //WICHTIG!!!
};

// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Diego_EXIT_Gamestart(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Gamestart_Condition;
	information	= Info_Diego_EXIT_Gamestart_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Gamestart_Condition()
{
	return 1;
};

FUNC VOID Info_Diego_EXIT_Gamestart_Info()
{
	AI_Output(hero,self,"Info_Diego_EXIT_Gamestart_15_00"); //Gracias por tu ayuda.
	
	if (!Npc_KnowsInfo (hero, Info_Diego_Kolonie)) 
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //Tú decides. Ha sido un placer conocerte.
	}
	else
	{
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_02"); //Nos veremos en el Campamento Viejo.
	};

	AI_StopProcessInfos	(self);
	
	if (Kapitel < 2)
	{
		Npc_ExchangeRoutine	(self, "Start");
		Diego_After_Gamestart = TRUE;
	};
};

// -------------------------------------------------------------

INSTANCE Info_Diego_EXIT_Later(C_INFO)
{
	npc			= PC_Thief;
	nr			= 999;
	condition	= Info_Diego_EXIT_Later_Condition;
	information	= Info_Diego_EXIT_Later_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Diego_EXIT_Later_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_EXIT_Gamestart)) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_EXIT_Later_Info()
{	
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Diego_EXIT_11_01"); //Vamos.
	}
	else
	{
	 	AI_Output	(hero,self,"Info_Diego_EXIT_15_00"); //Cuídate.
	};
	
	AI_StopProcessInfos	(self);
};

// *************************************************************
// 							 BRIEF 
// *************************************************************

INSTANCE Info_Diego_Brief (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Brief_Condition;
	information	= Info_Diego_Brief_Info;
	permanent	= 0;
	description = "Tengo una carta para el Gran Mago del Círculo del Fuego.";
};                       

FUNC INT Info_Diego_Brief_Condition()
{
	if (Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Brief_Info()
{
	AI_Output(hero,self,"Info_Diego_Brief_15_00"); //Tengo una carta para el Gran Mago del Círculo del Fuego.
	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //¿De verdad...?
	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //Me la entregó un mago poco antes de que me arrojaran aquí.
	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //Tienes suerte de que ya no pueda acercarme a los magos. Cualquier otro te cortaría el gaznate por esa carta.
	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //Porque los magos pagan espléndidamente a sus mensajeros y aquí hay mucha gente que no tiene nada.
	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //Yo en tu lugar me callaría hasta encontrarme con uno de los magos. Aunque, en tu situación, es improbable que eso ocurra.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//¿Por qué no?
	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //Los magos están en el castillo del Campamento Viejo. A los únicos a los que se permite entrar en el castillo es a los hombres de Gómez.
};

// **********************************************************
// 					SCHUTZ UND LAGER
// **********************************************************
 
INSTANCE Info_Diego_WarumGeholfen (C_INFO) // E1
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_WarumGeholfen_Condition;
	information	= Info_Diego_WarumGeholfen_Info;
	permanent	= 0;
	description = "¿Por qué me ayudaste?";
};                       

FUNC INT Info_Diego_WarumGeholfen_Condition()
{
	if	(!Diego_After_Gamestart)
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WarumGeholfen_Info()
{
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //¿Por qué me has ayudado?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //Porque necesitabas ayuda; si no, Bullit y sus muchachos podían haberte matado.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //Y no podía quedarme de brazos cruzados. Porque he recorrido un largo camino para ofrecer una sugerencia.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //Una sugerencia...
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //Sí. Tras este pequeño incidente con Bullit y sus muchachos, debes darte cuenta de que necesitas protección.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //Todos los que llegan aquí pueden elegir. En la colonia hay tres campamentos y tendrás que unirte a uno de ellos. 
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //Estoy aquí para decirle a los nuevos que el Campamento Viejo es el mejor lugar para ellos.
};

// -------------------------------------------------------------

INSTANCE Info_Diego_Bullit (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_Bullit_Condition;
	information	= Info_Diego_Bullit_Info;
	permanent	= 0;
	description = "¿Dónde está Bullit?";
};                       

FUNC INT Info_Diego_Bullit_Condition()
{
	if ( Npc_KnowsInfo (hero, Info_Diego_WarumGeholfen) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Bullit_Info()
{
	AI_Output(hero,self,"Info_Diego_Bullit_15_02"); //¿Dónde esta Bullit ahora?
	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //Él y los otros traen las mercancías del mundo exterior al Campamento. Allí podrás encontrarle.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //Pero si piensas combatir con él, ten cuidado. Es un guerrero experimentado.
};


// ************************************************************
// 							Kolonie
// ************************************************************

INSTANCE Info_Diego_Kolonie (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_Kolonie_Condition;
	information	= Info_Diego_Kolonie_Info;
	permanent	= 0;
	description = "Vale, ¿qué necesitas saber de este lugar?";
};                       

FUNC INT Info_Diego_Kolonie_Condition()
{
	if	(Kapitel < 2)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_Kolonie_Info()
{
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //Bueno, ¿qué es lo que necesito saber acerca de este lugar?
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //Lo llamamos la colonia. Ya sabes que producimos mineral para el rey. 
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //Bueno, al menos eso es lo que hacemos en el Campamento Viejo.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //En el interior de la Barrera hay tres campamentos. El Campamento Viejo es el de mayor tamaño y el más antiguo.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_Barriere (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_Barriere_Condition;
	information	= Info_Diego_Barriere_Info;
	permanent	= 0;
	description = "Cuéntame más cosas de la Barrera.";
};                       

FUNC INT Info_Diego_Barriere_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Barriere_Info()
{
	AI_Output(hero,self,"Info_Diego_Barriere_15_00"); //Cuéntame más cosas acerca de la Barrera.
	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //No hay mucho que contar. Es impenetrable.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //¿Qué ocurrirá si simplemente intento salir de aquí?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //El último que intentó hacerlo llegó muerto al otro lado. La maldita Barrera te deja entrar, pero nunca podrás salir de aquí.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //Si hay alguna manera de salir, la encontraré.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //¿Ya tienes prisa por salir de aquí? ¡Pero si acabas de llegar!
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OtherCamps (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 2;
	condition	= Info_Diego_OtherCamps_Condition;
	information	= Info_Diego_OtherCamps_Info;
	permanent	= 0;
	description = "¿Qué hay de los otros dos campamentos?";
};                       

FUNC INT Info_Diego_OtherCamps_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OtherCamps_Info()
{
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //¿Y qué hay de los otros dos campamentos?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //Los otros dos campamentos se independizaron para llevar a efecto sus enloquecidos planes de fuga.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //Al oeste de la colonia se encuentra el Campamento Nuevo, en el que los magos creen poder hacer explotar la barrera cuando hayan conseguido acumular el mineral suficiente.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //Y luego están los chalados de la secta al oeste. Su campamento está en medio del pantano y están rezándole a su ídolo para que les libere.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //Hasta el momento no les ha contestado.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //Yo en tu lugar no perdería el tiempo con esos chiflados.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OldCamp (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_OldCamp_Condition;
	information	= Info_Diego_OldCamp_Info;
	permanent	= 0;
	description = "Háblame del Campamento Viejo.";
};                       

FUNC INT Info_Diego_OldCamp_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_Kolonie) && (Diego_After_Gamestart==TRUE) ) 
	{
		return 1;
	};
};

FUNC VOID Info_Diego_OldCamp_Info()
{
	AI_Output(hero,self,"Info_Diego_OldCamp_15_00"); //Cuéntame más cosas acerca del Campamento Viejo.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //Es el mayor y más poderoso de los tres campamentos. Gómez y sus hombres lo controlan y, por tanto, también todo el negocio del mineral.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //Una vez al mes, el rey nos envía todo lo que necesitamos. Tenemos al viejo comiendo de la mano, ¿comprendes?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //Nos envía vino, pan, carne, armas... De todo.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{ 
	AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //Tú también puedes aprovecharte de ello. Lo único que tienes que hacer es unirte a los hombres de Gómez.
	};
};

// ************************************************************
// 							Gomez Leute
// ************************************************************

INSTANCE Info_Diego_WhosGomez (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_WhosGomez_Condition;
	information	= Info_Diego_WhosGomez_Info;
	permanent	= 0;
	description = "¿Quién es Gómez?";
};                       

FUNC INT Info_Diego_WhosGomez_Condition()
{
	if ( Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhosGomez_Info()
{
	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00"); //¿Quién es Gómez?
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //Gómez es el más poderoso de los Magnates del Mineral. Es el jefe del Campamento Viejo; el hombre más poderoso de la colonia.
};	

// ************************************************************
// 							JOIN OC
// ************************************************************

INSTANCE Info_Diego_JoinOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_JoinOldcamp_Condition;
	information	= Info_Diego_JoinOldcamp_Info;
	permanent	= 0;
	description = "Supongamos que quiera unirme a su gente. ¿Qué tengo que saber?";
};                       

FUNC INT Info_Diego_JoinOldcamp_Condition()
{
	if	(Npc_KnowsInfo(hero, Info_Diego_OldCamp) || Npc_KnowsInfo(hero, Info_Diego_Brief))
	&&	!C_NpcBelongsToOldCamp(hero)
	&&  (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Diego_JoinOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //Supongamos que quiero unirme a ellos; ¿qué es lo que tengo que hacer?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //A la puerta del castillo encontrarás a un hombre llamado Thorus. Dile que vas de parte de Diego.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
	
	Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC, LOG_RUNNING);
	B_LogEntry( CH1_JoinOC,"Necesito ver a Thoros para que me permitan unirme a la gente de Gómez en el Campamento Viejo.");
};	

// ************************************************************
// 						Weg zum Alten Lager
// ************************************************************

INSTANCE Info_Diego_WayToOldcamp (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WayToOldcamp_Condition;
	information	= Info_Diego_WayToOldcamp_Info;
	permanent	= 0;
	description = "¿Cómo llego al Campamento Viejo?";
};                       

FUNC INT Info_Diego_WayToOldcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Kolonie) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WayToOldcamp_Info()
{
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //¿Cómo puedo encontrar el Campamento Viejo?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //No tienes más que seguir este sendero. El Campamento Viejo es el primer lugar con aspecto de ser razonablemente seguro que encontrarás.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //Hay un gran número de bestias salvajes entre los campamentos. Sería una locura viajar sin un arma.
};
	
// ************************************************************
// 							Wo Waffe
// ************************************************************

INSTANCE Info_Diego_WoWaffe (C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 4;
	condition	= Info_Diego_WoWaffe_Condition;
	information	= Info_Diego_WoWaffe_Info;
	permanent	= 0;
	description = "¿Dónde consigo un arma?";
};                       

FUNC INT Info_Diego_WoWaffe_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_WayToOldcamp) && (!Diego_After_Gamestart) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WoWaffe_Info()
{
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //¿Dónde puedo obtener un arma?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //Cuando llegues a la Mina Vieja, echa un vistazo. Estoy seguro de que encontrarás algo útil.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //La mina es fácil de encontrar; está en este cañón, a unos pocos metros de distancia. 
};

// ************************************************************
// 						Mit Thorus geredet
// ************************************************************

INSTANCE Info_Diego_ThorusSays(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_ThorusSays_Condition;
	information	= Info_Diego_ThorusSays_Info;
	permanent	= 0;
	description = "He hablado con Thorus.";
};                       

FUNC INT Info_Diego_ThorusSays_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Thorus_DiegoSentMe) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_ThorusSays_Info()
{
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_00"); //He hablado con Thorus.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //¿Y qué te ha dicho?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //Dice que puedo unirme al Campamento Viejo si TÚ piensas que me lo merezco.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //Parece que tengo un nuevo trabajo.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //¿Empezamos ahora mismo?
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_05"); //Hay algunas cosas que debes saber primero.
};

// ************************************************************
// 						Aufnahme - Regeln
// ************************************************************

INSTANCE Info_Diego_Rules(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Rules_Condition;
	information	= Info_Diego_Rules_Info;
	permanent	= 0;
	description = "¿Qué tengo que hacer para que me acepten en el Campamento Viejo?";
};                       

FUNC INT Info_Diego_Rules_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_ThorusSays) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Rules_Info()
{
	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //¿Qué es lo que tengo que saber para ser aceptado en el Campamento Viejo?
	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //Si quieres unirte al Campamento, tendrás que hacer méritos.
	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //En el Anillo Exterior hay gente influyente. La mayoría son Sombras. Si consigues impresionarlos, habrás hecho algún mérito.
	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //Luego tendrás que pasar la prueba de la fe.
	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //Además, todo recién llegado tiene que aprender una serie de habilidades. Cuanto más aprendas, más valioso serás para nosotros.
	
	B_LogEntry( CH1_JoinOC,"Para que se me permita unirme, necesito impresionar a la gente del Anillo Exterior y superar una prueba de fe con Diego.");
};

// ************************************************************
// 						Wo wichtige Leute
// ************************************************************

INSTANCE Info_Diego_Celebs(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Celebs_Condition;
	information	= Info_Diego_Celebs_Info;
	permanent	= 0;
	description = "¿Dónde está la gente importante?";
};                       

FUNC INT Info_Diego_Celebs_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Celebs_Info()
{
	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //¿Dónde puedo encontrar a la gente importante?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //Bueno, estás mirando a uno de ellos. También está Thorus... A él ya le conoces.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //Por lo que se refiere a los demás... Tendrás que averiguarlo por tu cuenta. Si no lo consigues, es que tampoco te merecías estar aquí.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //Ve al Anillo Exterior y habla con la gente; entonces sabrás quién es importante.
};

// ************************************************************
// 							Wo Lehrer
// ************************************************************

INSTANCE Info_Diego_Teachers(C_INFO) // E2/E3
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_Teachers_Condition;
	information	= Info_Diego_Teachers_Info;
	permanent	= 0;
	description = "¿Quién puede enseñarme?";
};                       

FUNC INT Info_Diego_Teachers_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teachers_Info()
{
	AI_Output		(hero,self,"Info_Diego_Teachers_15_00"); //¿Quién puede enseñarme?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_01"); //Empieza con Fingers. Él es el más habilidoso de todos nosotros.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_02"); //Si mantienes los ojos abiertos, encontrarás a otros que pueden enseñarte.
	AI_Output		(hero,self,"Info_Diego_Teachers_15_03"); //¿Dónde puedo encontrar a Fingers?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_04"); //Su cabaña está bastante escondida. Está al lado de la muralla del castillo. Dirígete a la arena desde aquí.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_05"); //Para ir a la arena, tienes que girar a la izquierda cuando llegues a la entrada del castillo.

	if	(Fingers_CanTeach == FALSE)
	{
		Log_CreateTopic (GE_TeacherOC,	LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Fingers puede enseñarme HURTO y CERRAJERÍA. Vive en una cabaña cercana a la arena, algo aislado, junto a las murallas del castillo.");
	};
};

// ************************************************************
// 							DIEGO = Lehrer
// ************************************************************
	var int Diego_Merke_STR;
	var int Diego_Merke_DEX;
// ************************************************************

INSTANCE Info_Diego_Teach(C_INFO)
{
	npc			= PC_Thief;
	nr			= 100;
	condition	= Info_Diego_Teach_Condition;
	information	= Info_Diego_Teach_Info;
	permanent	= 1;
	description = "¿Puedes enseñarme algo?";
};                       

FUNC INT Info_Diego_Teach_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Teachers) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_Teach_Info()
{	
	if	(log_diegotrain == FALSE)
	{	
		Log_CreateTopic (GE_TeacherOC,LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Diego puede ayudarme a adquirir más FUERZA y DESTREZA.");
		log_diegotrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //¿Puedes enseñarme algo?
	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //Sí. Puedo enseñarte a mejorar tu destreza o tu fuerza.
	
	Diego_Merke_STR = hero.attribute[ATR_STRENGTH];
	Diego_Merke_DEX = hero.attribute[ATR_DEXTERITY];
	
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
	
	
};

func void Info_Diego_Teach_BACK()
{
	if (Diego_Merke_STR < hero.attribute[ATR_STRENGTH])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_00"); //Tu fuerza ha aumentado mucho.
	};
	if (Diego_Merke_DEX < hero.attribute[ATR_DEXTERITY])
	{
		AI_Output(self,hero,"Info_Diego_Teach_BACK_11_01"); //Tu habilidad en el manejo del arco y la ballesta ha mejorado.
	};
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Vuelve pronto. ¡Hay muchas cosas que tienes que aprender!
	Info_ClearChoices	(Info_Diego_Teach);
};

func void Info_Diego_Teach_STR_1()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5 ,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_STR_5()
{
	B_BuyAttributePoints (hero, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_1()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

func void Info_Diego_Teach_DEX_5()
{
	B_BuyAttributePoints (hero, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Info_Diego_Teach);
	Info_AddChoice		(Info_Diego_Teach,DIALOG_BACK									,Info_Diego_Teach_BACK);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)			,Info_Diego_Teach_STR_1);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_5);
	Info_AddChoice		(Info_Diego_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),Info_Diego_Teach_DEX_1);
};

// ************************************************************
// 							BRING LIST
// ************************************************************

VAR INT Diego_BringList; //MISSIONSVARIABLE

// ----------------------------- OFFER -------------------------------------

INSTANCE Info_Diego_BringList_Offer (C_INFO)
{
	npc			= PC_Thief;
	nr			= 10;
	condition	= Info_Diego_BringList_Offer_Condition;
	information	= Info_Diego_BringList_Offer_Info;
	permanent	= 0;
	description = "¿Qué es la prueba de fe?";
};                       

FUNC INT Info_Diego_BringList_Offer_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_Diego_Rules) )
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Offer_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_00"); //¿Qué es la prueba de fe?
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_01"); //Tienes que ir a la Vieja Mina. Allí encontrarás a un tipo llamado Ian, que te dará una lista.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_02"); //Esta lista es importante. En ella figuran todas las cosas que la gente de la mina necesita de nosotros.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_03"); //¡Recibirán todo eso en la próxima caravana!
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_04"); //¡Sin problemas!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_05"); //¡Sí que hay un problema! ¡Esta lista no debe caer en manos del Campamento Nuevo!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_06"); //Como ya te he contado, esta lista es importante. Si lo haces bien, habrás adelantado mucho.
	
	Diego_BringList = LOG_RUNNING;
    
    Log_CreateTopic (CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus(CH1_BringList,LOG_RUNNING);
    B_LogEntry    (CH1_BringList,"Diego me ha enviado a la Vieja Mina. Se supone que debo obtener una lista de alguien llamado Ian. Ésta no debe caer bajo ningún concepto en manos del Campamento Nuevo.");
    
	VAR C_NPC Ian; Ian = Hlp_GetNpc (STT_301_IAN);	
	CreateInvItem (STT_301_IAN, TheList);
};
	
// -------------------------------------------------------------------------------

INSTANCE Info_Diego_IanPassword (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_IanPassword_Condition;
	information	= Info_Diego_IanPassword_Info;
	permanent	= 0;
	description = "Si la lista es tan importante, ¿por qué me la iba a dar Ian? ";
};                       

FUNC INT Info_Diego_IanPassword_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_IanPassword_Info()
{
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_01"); //Si la lista es tan importante, ¿por qué me la ha dado Ian precisamente a mí?
	AI_Output (self, hero,"Info_Diego_IanPassword_Info_11_02"); //Porque vas a decirle que vas de parte de Diego.
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_03"); //Se lo diré.
	
	B_LogEntry    (CH1_BringList,"Ian me entregará la lista si le digo que me envía Diego.");
};

// ----------------------------------------------------------------------------------

INSTANCE Info_Diego_MapToOldMine (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_MapToOldMine_Condition;
	information	= Info_Diego_MapToOldMine_Info;
	permanent	= 0;
	description = "¿Dónde puedo encontrar la Vieja Mina?";
};                       

FUNC INT Info_Diego_MapToOldMine_Condition()
{
	if (Npc_KnowsInfo (hero, Info_Diego_BringList_Offer))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_MapToOldMine_Info()
{
	AI_Output (hero, self,"Info_Diego_MapToOldMine_Info_15_00"); //¿Dónde puedo encontrar la Vieja Mina?
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_01"); //Vete a ver a Graham. Es cartógrafo. Dile que vas de mi parte y que necesitas un mapa. En él podrás ver el camino a la mina.
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_02"); //Vive a la izquierda de la puerta antigua.
	
	B_LogEntry    (CH1_BringList,"Graham me dará un mapa. Puedo encontrarlo a la izquierda de la puerta del norte.");
};

// ------------------------------ SUCCESS ----------------------------------

INSTANCE Info_Diego_BringList_Success (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_BringList_Success_Condition;
	information	= Info_Diego_BringList_Success_Info;
	permanent	= 0;
	description = "Tengo la lista de Ian.";
};                       

FUNC INT Info_Diego_BringList_Success_Condition()
{
	if ( (Diego_BringList == LOG_RUNNING) && (Npc_HasItems(hero,TheList) || Npc_HasItems(hero,TheListNC)))
	{
		return 1;
	};
};

FUNC VOID Info_Diego_BringList_Success_Info()
{
	AI_Output (hero, self,"Info_Diego_BringList_Success_15_00"); //Ian me ha dado la lista.
		
	if	Npc_HasItems(hero,TheList)
	{
		B_GiveInvItems	(hero, self, TheList, 1);
		B_LogEntry    	(CH1_BringList,"Diego se ha puesto muy contento cuando le he entregado la lista de Ian.");
	}
	else if	Npc_HasItems(hero,TheListNC)
	{
		B_GiveInvItems	(hero, self, TheListNC, 1);
		B_LogEntry    	(CH1_BringList,"Diego se ha puesto muy contento cuando le he entregado la lista de Ian. Parece no haberse dado cuenta de que Lares la ha falsificado, aunque su mirada me ha parecido sospechosa.");
	};
	B_UseFakeScroll();
	
	AI_Output (self, hero,"Info_Diego_BringList_Success_11_01"); //¡Buen trabajo! ¡Con eso harás algún mérito!

	Diego_BringList = LOG_SUCCESS;
	B_GiveXP(XP_DiegoBringlist);
	
	Log_SetTopicStatus 		(CH1_BringList,LOG_SUCCESS);
	
	Points_OC = Points_OC + 5;
};

// ************************************************************
// 						Punktewertung
// ************************************************************
	var int Diego_GomezAudience;
// ************************************************************

INSTANCE Info_Diego_JoinAnalyze(C_INFO) 
{
	npc			= PC_Thief;
	nr			= 800;
	condition	= Info_Diego_JoinAnalyze_Condition;
	information	= Info_Diego_JoinAnalyze_Info;
	permanent	= 1;
	description = "¿Qué hay de mi estima dentro del Campamento?";
};                       

FUNC INT Info_Diego_JoinAnalyze_Condition()
{
	if	Npc_KnowsInfo(hero,Info_Diego_Rules)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_JoinAnalyze_Info()
{	
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_00"); //¿Y qué hay de la estima que se me tiene en el Campamento?
	AI_Output(self, hero,"Info_Diego_JoinAnalyze_11_01"); //He hablado con alguna gente...
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_02"); //¿Y?
	// -----------------------------------------------------------
	Points_OC = 0;
	// -----------------------------------------------------------
	if (Scatty_ChargeKirgo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_01"); //Scatty me ha dicho que derrotaste a Kirgo.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKirgo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //Scatty me ha dicho que dejaste que Kirgo te derrotara. No parecía demasiado entusiasmado.
		Points_OC = Points_OC - 1;
	}
	else if (Scatty_ChargeKirgo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //Scatty me ha dicho que está deseando ver qué tal te va contra Kirgo.
	};
	
	if (Scatty_ChargeKharim == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //Pero le ha impresionado que tuvieras el valor de enfrentarte a Kharim, aunque hayas salido derrotado.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKharim == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //Pero le había causado una gran impresión que derrotases a Kharim; no hacía más que hablar de ti. 
		Points_OC = Points_OC + 5;
	}
	else if (Scatty_ChargeKharim == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //Y tenía grandes deseos de ver si vas a desafiar a Kharim.
	};
	// -----------------------------------------------------------
	if (Whistler_BuyMySword == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //Whistler me ha contado lo de Frank... Bueno, yo en tu lugar habría cogido el mineral y me hubiera ido. Pero tiene una opinión muy buena de ti.
		Points_OC = Points_OC + 3;
	}
	else if ( (Whistler_BuyMySword == LOG_FAILED) || ( (Whistler_BuyMySword==LOG_RUNNING)&&(Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) ) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //He hablado con Whistler. ¡Tú le quitaste su mineral, bastardo listillo! ¡Tengo que admitir que tienes mucho coraje!
		Points_OC = Points_OC + 2;
	}
	else if (Whistler_BuyMySword == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //Whistler está esperando su espada. ¡Deberías decidir si se la vas a llevar o no; si no, pensará que te has fugado con su mineral!
		
	};
	// -----------------------------------------------------------
	if (Sly_LostNek == LOG_SUCCESS)			
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //Sly me ha dicho que encontraste a Nek. Parecía estar muy satisfecho.
		Points_OC = Points_OC + 4;
	}
	else if (Sly_LostNek == LOG_RUNNING)					
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //Creo que Sly se equivoca con  Nek. Es cierto que era un pesado, pero no creo que fuera al Campamento Nuevo.
	};
	// -----------------------------------------------------------
	if (Fingers_Learnt == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //Ya te he enviado a ver a Fingers; ¡él sí que podría enseñarte una cosa o dos!
	}
	else if (Fingers_Learnt == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //Fingers me ha dicho que ya has aprendido algo, pero que todavía puedes mejorar tus habilidades.
		Points_OC = Points_OC + 3;
	};
	// -----------------------------------------------------------
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //Necesito hablar con Dexter urgentemente. Te está utilizando en su provecho.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //Pero no hay muchas reglas para la prueba. Si la superas, habrás dado un gran paso.
		
	}
	else if (Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //Entonces es verdad que has conseguido que Kalorn te diera la receta. Dexter está muy impresionado; yo también lo estoy.
		Points_OC = Points_OC + 5;
	};
	// -----------------------------------------------------------
	if (Thorus_MordragKo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //El asunto con Mordrag tiene su miga. No es mal guerrero. Deberías practicar si es que quieres derrotarle.
	}
	else if (Thorus_MordragKo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //Thorus dice que nos vendría bien alguien como tú; eso es muy bueno para ti.
		Points_OC = Points_OC + 5;
	}
	else if (Thorus_MordragKo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //A Thorus casi le explota la cabeza; estaba realmente furioso. ¿Cómo te atreves a cagarla DE ESTA MANERA?
		Points_OC = Points_OC - 5;						
	}
	// ----WEITER-------------------------------------------------------
	if (Fisk_GetNewHehler == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //Fisk me ha dicho que le has sorprendido. En cualquier caso, estará de tu lado.
		Points_OC = Points_OC + 5;
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //Fisk está muy cabreado contigo. Yo en tu lugar buscaría un sustituto para Mordrag.
	};
	// -----------------------------------------------------------
	if (points_oc > 15)// runtergesetzt!! // Bei 20 + BringList = Aufnahme
	{
		AI_Output (self, hero,"Info_Diego_Points_11_00"); //Has conseguido que un número suficiente de personas hablara en favor de ti.
		
		if hero.level >= 5
		{
			if (Diego_BringList == LOG_SUCCESS)
			{
				AI_Output (self, hero,"Info_Diego_Points_11_01"); //También has pasado la prueba de fe. Ve a ver a Thorus. Ya se lo he contado todo y te dejará ver a Gómez.
				Diego_GomezAudience = TRUE;
				
				Log_SetTopicStatus(CH1_JoinOC, LOG_SUCCESS);
				B_LogEntry(CH1_JoinOC,"Diego me ha conseguido una audiencia con Gómez. Ahora puedo entrar a formar parte de la gente de Gómez y pasar al castillo. Antes tengo que ver a Thorus.");
			}
			else
			{
				AI_Output (self, hero,"Info_Diego_Points_11_02"); //Pero todavía tienes que pasar la prueba de fe.
			};
		}
		else
		{
			B_PrintGuildCondition(5);
		};
	}
	else if (points_oc > 10)
	{
		AI_Output (self, hero,"Info_Diego_Points_11_10"); //Bien mirado, no está mal para un recién llegado.
	}
	else if points_oc >= 0
	{
		AI_Output (self, hero,"Info_Diego_Points_11_20"); //¡No te pares! Hay mucho que debes hacer si quieres llegar a alguna parte en este Campamento.
	};
	/*else
	{
		AI_Output (self, hero,"Info_Diego_Points_11_30"); //Machst du Witze, Kleiner? Kein Schwein kennt dich hier!
	};*/
};

/*
	Scatty: 	Scatty_ChargeKirgo == LOG_SUCCESS 	+2
				Scatty_ChargeKirgo == LOG_FAILED 	-1
				Scatty_ChargeKharim == LOG_SUCCESS 	+5
				Scatty_ChargeKharim == LOG_FAILED 	+2
			
	Whistler: 	Whistler_BuyMySword = LOG_SUCCESS;	+3
				Whistler_BuyMySword = LOG_FAILED;	+2
				
	Sly: 		Sly_LostNek = LOG_SUCCESS;			+4
	
	Fingers: 	Fingers_Learnt = LOG_SUCCESS; 		+3
	
	Dexter: 	Dexter_GetKalomsRecipe = LOG_SUCCESS; +5
	
	Thorus: 	Thorus_MordragKo = LOG_SUCCESS;		+5
				Thorus_MordragKo = LOG_FAILED;		-5
	
				VAR INT MordragKO_PlayerChoseOreBarons;
				VAR INT MordragKO_PlayerChoseThorus;
				VAR INT MordragKO_HauAb;
				var int MordragKO_StayAtNC;
	
	Fisk: 		Fisk_GetNewHehler = LOG_SUCCESS; // else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	
	//--- EXTRA Bedingung ------
	
	Diego: 		Diego_BringList = LOG_SUCCESS;		
*/


INSTANCE Info_Diego_WhatToSayToGomez (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_WhatToSayToGomez_Condition;
	information	= Info_Diego_WhatToSayToGomez_Info;
	permanent	= 0;
	description = "¿Qué tengo que hacer cuando vea a Gómez?";
};                       

FUNC INT Info_Diego_WhatToSayToGomez_Condition()
{
	if (Diego_GomezAudience == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Diego_WhatToSayToGomez_Info()
{
	AI_Output (hero, self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //¿Qué es lo que tengo que hacer cuando vea a Gómez?
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //Gómez toma sus decisiones por puro instinto. Te mirará a la cara y decidirá si puedes unirte a nosotros.
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //De ahora en adelante tendrás que apañártelas tú solo; ¡hazlo lo mejor que puedas! Buena suerte.
};





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################
//***************************************************************************
//	Info ARMOR
//***************************************************************************
instance  PC_Thief_ARMOR (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_ARMOR_Condition;
	information		= PC_Thief_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildBuyArmorString(NAME_DiegoHeavyShadows,VALUE_STT_ARMOR_H); 
};

FUNC int  PC_Thief_ARMOR_Condition()
{	
	if  ( Npc_GetTrueGuild (hero) == GIL_STT)
	&&  (! Npc_HasItems(hero,STT_ARMOR_H))
	{
		return TRUE;
	};

};
FUNC void  PC_Thief_ARMOR_Info()
{
	
	if (Npc_HasItems (hero,ItMinugget) >= VALUE_STT_ARMOR_H)
	{
		AI_Output			(hero, self,"PC_Thief_ARMOR_Info_15_01"); //¿Puedo conseguir una armadura como la tuya?
		AI_Output			(self, hero,"PC_Thief_ARMOR_Info_11_02"); //¿Tienes mineral suficiente?

		CreateInvItem 		(hero,			STT_ARMOR_H);
		B_GiveInvItems		(hero, self,	ItMinugget,	VALUE_STT_ARMOR_H);
		
		//hier nur ein Text für die Bildschirmausgabe
		CreateInvItem		(self, 			ItAmArrow);
		B_GiveInvItems		(self, hero,	ItAmArrow,	1);
		Npc_RemoveInvItem	(hero,			ItAmArrow);
	}
	else
	{
		AI_Output (self, hero,"PC_Thief_ARMOR_Info_11_03"); //Consigue el mineral y conseguirás la armadura.
	};
};  





//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//----------------------------------------------------------------
// Die Troll Situation
//----------------------------------------------------------------
instance PC_Thief_MEETAGAIN (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_MEETAGAIN_Condition;
	information		= PC_Thief_MEETAGAIN_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_MEETAGAIN_Condition()
{	
	if (Kapitel == 3)
	&& (Npc_GetDistToWP (self,"OW_PATH_190") < 700 )
	{
		return TRUE;
	};
};
func void  PC_Thief_MEETAGAIN_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_00"); //Oye, creí que habías muerto.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_01"); //En algunos momentos yo también lo pensé.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_02"); //Han pasado muchas cosas desde la última vez que nos vimos. Tengo entendido que colaboraste decisivamente en la invocación final.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_03"); //Es evidente que estás bien informado.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_04"); //Mejor de lo que tú crees... ¿Y ahora vas en busca del foco?
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_05"); //Sí. Debe haber uno por aquí, en alguna parte.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_06"); //Yo sé dónde encontrar uno. Sólo hay un problema.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_07"); //Entiendo. ¿Qué es lo que quieres?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_08"); //Has aprendido bien la lección, pero no me refería a eso.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_09"); //¿No? Entonces, ¿cuál es el problema?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_10"); //Es un problema de tres toneladas.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_11"); //Ven conmigo. Enseguida lo entenderás.

 	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"GuideTroll");

	Log_CreateTopic		(CH3_TrollCanyon,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_RUNNING);
	B_LogEntry		(CH3_TrollCanyon,"Al acercarme al lugar del foco del norte, me he topado de sorpresa con Diego. Me ha dicho que hay algo 'grande' esperándome al final del cañón.");
	B_LogEntry		(CH3_TrollCanyon,"De algún modo conocía mis actividades en el campamento del pantano así como mi búsqueda de los focos. A partir de aquí seguiremos juntos.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info SHOWFOCUS
//---------------------------------------------------------------------
instance PC_Thief_SHOWFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_SHOWFOCUS_Condition;
	information		= PC_Thief_SHOWFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_SHOWFOCUS_Condition()
{	
	if (Npc_KnowsInfo   (hero,PC_Thief_MEETAGAIN))
	&& (Npc_GetDistToWP (self,"LOCATION_12_01") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_SHOWFOCUS_Info()
{	
	AI_GotoNpc(self,hero);
	//AI_PointAt (self, );
	//AI_StopPointAt (self);
	
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //En el lado izquierdo de este cañón se encuentra la entrada de una cueva que conduce al lugar en el que se encuentra el foco.
	AI_Output (hero, self,"PC_Thief_SHOWFOCUS_Info_15_02"); //De acuerdo. Pero primero tenemos que librarnos de ese monstruo de ahí.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //Intenta encontrar un punto débil u otra forma de derrotar al troll.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //Yo atraeré su atención.

	B_LogEntry		(CH3_TrollCanyon,"Nos hemos topado con un troll enorme bloqueándonos el camino. Diego quiere entretenerlo; mientras, yo tengo que encontrar una manera de hacerlo pedazos.");

	Npc_ExchangeRoutine	(self,	"WaitAtWheel");

	AI_DrawWeapon		(self);
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERTROLL
//---------------------------------------------------------------------
instance PC_Thief_AFTERTROLL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_AFTERTROLL_Condition;
	information		= PC_Thief_AFTERTROLL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_AFTERTROLL_Condition()
{	
	var int trollFound;
	Npc_PerceiveAll(self);
	trollFound = Wld_DetectNpc(self, Troll, NOFUNC, -1);

	if	Npc_KnowsInfo(hero,PC_Thief_SHOWFOCUS)
	&&	(	(trollFound && (Npc_IsDead(other) || Npc_IsInState(other,ZS_MagicShrink)))				// Troll besiegt...
		||	(Npc_GetDistToWP(hero, "LOCATION_12_14_WHEEL") < 1000)							)		// ...oder Spieler an der Winde angekommen
	{
		return TRUE;
	};
};
func void  PC_Thief_AFTERTROLL_Info()
{
	AI_GotoNpc			(self, hero);
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_01"); //Eso ha sido fantástico. Eres muy bueno. Y ahora, a por el foco.
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_02"); //Voy a asegurar que no haya más sorpresas desagradables.

	B_LogEntry		(CH3_TrollCanyon,"El troll ha sido derrotado. Ahora puedo ocuparme del torno que mueve la rejilla de la plataforma del foco.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WHEEL
//---------------------------------------------------------------------
instance  PC_Thief_WHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WHEEL_Condition;
	information		= PC_Thief_WHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_AFTERTROLL)) 
	&& (Troll_Wheel == 1) 
	{
		return TRUE;
	};
};
FUNC void  PC_Thief_WHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_01"); //Parece que el engranaje está atascado.
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_02"); //¡Déjame ver; tal vez yo pueda arreglarlo!

	AI_StopProcessInfos	(self);
	AI_GotoWP 			(self,	"LOCATION_12_14_WHEEL");
	AI_AlignToWP		(self);
	AI_PlayAni			(self,	"T_PLUNDER");
};

//---------------------------------------------------------------------
//	Info FIXWHEEL
//---------------------------------------------------------------------
instance PC_Thief_FIXWHEEL (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_FIXWHEEL_Condition;
	information		= PC_Thief_FIXWHEEL_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_FIXWHEEL_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Thief_WHEEL))
	{
		return TRUE;
	};
};
func void  PC_Thief_FIXWHEEL_Info()
{
	AI_Output 			(self, hero,"PC_Thief_FIXWHEEL_Info_11_01"); //Bueno, ahora debería funcionar.
	Troll_Wheel = 2;	// Winde repariert!

	B_LogEntry		(CH3_TrollCanyon,"Diego ha arreglado el torno atascado. Ahora ya nada se interpone en mi camino.");

	Npc_ExchangeRoutine (self, "WaitAtFocus");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info WAITATFOCUS
//---------------------------------------------------------------------
instance PC_Thief_WAITATFOCUS (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_WAITATFOCUS_Condition;
	information		= PC_Thief_WAITATFOCUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_WAITATFOCUS_Condition()
{	
	if	Npc_KnowsInfo(hero,PC_Thief_FIXWHEEL)
	&&	(Npc_GetDistToWP(hero,"LOCATION_12_03") < 1000)
	{
		return TRUE;
	};
};
func void  PC_Thief_WAITATFOCUS_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //¡Vete a por el foco; yo te espero aquí!

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GOTIT
//---------------------------------------------------------------------
//-----SPIELER HAT DEN FOKUS GEFUNDEN---------------------
instance  PC_Thief_GOTIT (C_INFO)
{
	npc				= PC_Thief;
	condition		= PC_Thief_GOTIT_Condition;
	information		= PC_Thief_GOTIT_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Thief_GOTIT_Condition()
{	
	if (Npc_HasItems (hero,Focus_2))
	{
		return TRUE;
	};
};

FUNC void  PC_Thief_GOTIT_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_01"); //Eh, has encontrado el foco. Excelente.
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_02"); //Creo que es hora de que vuelva a pasarme por el Campamento Viejo. Buena suerte.
	AI_Output			(hero, self,"PC_Thief_GOTIT_Info_15_03"); //¡Asegúrate de seguir vivo!
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_04"); //Volveremos a vernos.

	B_LogEntry		(CH3_TrollCanyon,"El foco es mío. Pero aún debo convencer a unas arpías de que me dejen quedármelo.");
	B_LogEntry		(CH3_TrollCanyon,"Diego se vuelve al Campamento Viejo. Estoy seguro de que volveremos a vernos.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;

	Npc_ExchangeRoutine	(self, "start");	
};  











//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info OCWARN
//***************************************************************************
instance Info_Diego_OCWARN (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARN_Condition;
	information	= Info_Diego_OCWARN_Info;
	important	= 1;
	permanent	= 0;
};

FUNC int Info_Diego_OCWARN_Condition()
{
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARN_Info()
{
	AI_GotoNpc			(self,hero);

	AI_Output			(self,hero,"Info_Diego_OCWARN_11_01"); //Eh... chitón... ¡silencio!
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN))
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_02"); //¡Hola, Diego; ya he hablado con Milten, al otro extremo del Campamento!
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_03"); //Bueno, así que ya sabes lo que ha pasado.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_04"); //Pero, ¿te has enterado también de los planes de atacar la Mina Libre?
	}
	else
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_05"); //Hola, Diego; ¿qué significa todo este juego del escondite?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_06"); //¿Es que no te has enterado?
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_07"); //¿Enterado de qué?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_08"); //La Vieja Mina se ha hundido, los magos del fuego han sido asesinados y se planea un ataque a la Mina Libre.
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_09"); //¿QUEEEEEEEÉ? ¿De qué estás hablando?
	};
};

//***************************************************************************
//	Info OCMINE
//***************************************************************************
instance Info_Diego_OCMINE (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMINE_Condition;
	information	= Info_Diego_OCMINE_Info;
	important	= 0;
	permanent	= 0;
	description = "¿Cómo pudo hundirse la Vieja Mina?";
};

FUNC int Info_Diego_OCMINE_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMINE_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMINE_15_01"); //¿Cómo es posible que se hundiera la Vieja Mina?
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_02"); //Uno de los cavadores supervivientes nos ha dicho que estaban excavando cuando se toparon con un río subterráneo en el nivel inferior.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_03"); //Cuando el agua inundó la mina, uno de los puntales se rompió y toda la sección superior se vino abajo.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_04"); //Sólo un puñado de personas consiguieron escapar de la mina.
};

//***************************************************************************
//	Info OCKDF
//***************************************************************************
instance Info_Diego_OCKDF (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCKDF_Condition;
	information	= Info_Diego_OCKDF_Info;
	important	= 0;
	permanent	= 0;
	description = "¿Por qué han muerto los magos del fuego?";
};

FUNC int Info_Diego_OCKDF_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCFM))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCKDF_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCKDF_15_01"); //¿Por qué han muerto todos los magos del fuego?
	AI_Output		(self,hero,"Info_Diego_OCKDF_11_02"); //Ésa es una larga historia.
};

//***************************************************************************
//	Info OCFM
//***************************************************************************
instance Info_Diego_OCFM (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFM_Condition;
	information	= Info_Diego_OCFM_Info;
	important	= 0;
	permanent	= 0;
	description = "¿Una incursión en la Mina Libre?";
};

FUNC int Info_Diego_OCFM_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCWARN) && !Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFM_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFM_15_01"); //¿Un ataque a la Mina Libre?
	AI_Output		(self,hero,"Info_Diego_OCFM_11_02"); //Ésa es una larga historia.
};

//***************************************************************************
//	Info OCSTORY
//***************************************************************************
instance Info_Diego_OCSTORY (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCSTORY_Condition;
	information	= Info_Diego_OCSTORY_Info;
	important	= 0;
	permanent	= 0;
	description = "¡Cuéntamelo!";
};

FUNC int Info_Diego_OCSTORY_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCFM) || Npc_KnowsInfo(hero, Info_Diego_OCKDF))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCSTORY_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_01"); //¡Cuéntamela! ¡No será la primera larga historia que haya tenido que escuchar!
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_02"); //Bueno. Por suerte, yo estaba en la casa de los Magnates del Mineral cuando recibieron la noticia del hundimiento de la mina.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_03"); //Gómez estaba lívido de furia cuando se enteró y temía que su puesto corriera peligro.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_04"); //Claro. ¡Quien controla el mineral también controla la colonia!
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_05"); //Exacto. Dado que ya no tiene una fuente de ingresos, las mercancías del exterior dejarán de llegar.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_06"); //Si no encuentra pronto otra fuente de ingresos, nadie trabajará para él.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_07"); //¿Y ésa es la razón del ataque a la Mina Libre?
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_08"); //Siendo honestos, ésa es la única posibilidad que tiene Gómez de mantenerse en el poder.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_09"); //Hace dos horas que salieron dos docenas de guardias hacia la Mina Libre.

	B_Story_FMTaken	();
};

//***************************************************************************
//	Info OCWARNNC
//***************************************************************************
instance Info_Diego_OCWARNNC (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCWARNNC_Condition;
	information	= Info_Diego_OCWARNNC_Info;
	important	= 0;
	permanent	= 0;
	description = "¡Es una locura! Tengo que alertar al Campamento Nuevo.";
};

FUNC int Info_Diego_OCWARNNC_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCWARNNC_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_01"); //¡Es una locura! Tengo que avisar al Campamento Nuevo.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_02"); //¡Entonces tendrás que apresurarte! Ya casi han llegado a la Mina Libre.
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_03"); //Pero nunca conseguirán atravesar las fortificaciones del Campamento Nuevo.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_04"); //No necesitan atravesarlas. Hace unos meses, encontraron un sendero que atraviesa las montañas y conduce hasta la Mina Libre; nadie más lo sabe.
};

//***************************************************************************
//	Info OCGUARDS
//***************************************************************************
instance Info_Diego_OCGUARDS (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCGUARDS_Condition;
	information	= Info_Diego_OCGUARDS_Info;
	important	= 0;
	permanent	= 0;
	description = "He visto a los guardias frente a las puertas cerradas con llave.";
};

FUNC int Info_Diego_OCGUARDS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCGUARDS_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCGUARDS_15_01"); //He visto a los guardias frente a las puertas cerradas.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_02"); //Mantente alejado de ellos. Atacarán a cualquiera que se acerque al Campamento.
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_03"); //Tienen miedo de represalias por el ataque a la Mina Libre.
};

//***************************************************************************
//	Info OCMURDER
//***************************************************************************
instance Info_Diego_OCMURDER (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCMURDER_Condition;
	information	= Info_Diego_OCMURDER_Info;
	important	= 0;
	permanent	= 0;
	description = "Pero, ¿qué pasó con los magos del fuego?";
};

FUNC int Info_Diego_OCMURDER_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCSTORY))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCMURDER_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_01"); //Pero, ¿qué les ha ocurrido a los magos del fuego?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_02"); //Corristo y los otros magos fueron los únicos en el campamento que mantuvieron la cabeza fría.
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_03"); //Prohibieron el ataque y exigieron un acuerdo con los otros dos campamentos.
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_04"); //¿PROHIBIERON a Gómez atacar la Mina Libre?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_05"); //Bueno, sí, Corristo y los demás no deberían haber estado tan seguros de sí mismos. Gómez ya no se fiaba de ellos y, pérfidamente, los hizo asesinar.
};

//***************************************************************************
//	Info OCRETREAT
//***************************************************************************
instance Info_Diego_OCRETREAT (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCRETREAT_Condition;
	information	= Info_Diego_OCRETREAT_Info;
	important	= 0;
	permanent	= 0;
	description = "¿Ahora qué vais a hacer tú y Milten?";
};

FUNC int Info_Diego_OCRETREAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCMURDER))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCRETREAT_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCRETREAT_15_01"); //¿Qué vais a hacer ahora Milten y tú?
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_02"); //Nos quedaremos aquí un poco más para avisar a algunos otros amigos para que no se topen con los guardias.
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_03"); //Pero podrías hacernos un favor.
};

//***************************************************************************
//	Info OCFAVOR
//***************************************************************************
instance Info_Diego_OCFAVOR (C_INFO)
{
	npc			= PC_Thief;
	condition	= Info_Diego_OCFAVOR_Condition;
	information	= Info_Diego_OCFAVOR_Info;
	important	= 0;
	permanent	= 0;
	description = "Considéralo hecho. ¡Dime lo que quieres!";
};

FUNC int Info_Diego_OCFAVOR_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Diego_OCRETREAT))
	{
		return TRUE;
	};	
};

func void Info_Diego_OCFAVOR_Info()
{
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_01"); //Dalo por hecho. ¡Dime qué es lo que deseas!
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_02"); //Espera a Lester y a Gorn. Tienen que enterarse de lo que ha ocurrido.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_03"); //Diles que nos reuniremos los cuatro en el mismo sitio de siempre.
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_04"); //Si les veo antes que tú, les avisaré y les enviaré a vuestro lugar de reunión.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_05"); //Gracias, amigo mío. Parece que eres en verdad un buen tipo. Ahora vete; nos veremos más tarde.
				
	Log_CreateTopic		(CH4_4Friends,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_4Friends,		LOG_RUNNING);
	B_LogEntry			(CH4_4Friends,		"Todos los Magos del Fuego están muertos, y la situación empieza a estar fuera de control. Diego quiere que le diga a Lester y Gorn que se reúnan con Milten y él en un lugar secreto. ¡Parece que no es la primera vez que hacen esto!"); 
};











































/*

// *******************************************************************

	AI_Output(self,hero,"Info_Diego_Gamestart_11_01"); //Warum haben sie dich hier reingeworfen?
	
	Info_ClearChoices(Info_Diego_Gamestart );
	Info_AddChoice	 (Info_Diego_Gamestart, "Gewitzter Überfall            (+3 Geschicklichkeit)"	,Info_Diego_Gamestart_Choice_Dex);
	Info_AddChoice	 (Info_Diego_Gamestart, "Schlägerei mit Folgen         (+3 Stärke)"				,Info_Diego_Gamestart_Choice_Str);
	Info_AddChoice	 (Info_Diego_Gamestart, "Wahre Worte zum falschen Mann (+3 Mana)"				,Info_Diego_Gamestart_Choice_Man);
	Info_AddChoice	 (Info_Diego_Gamestart, "Unschuldig                    (+1 auf alle Attribute)"	,Info_Diego_Gamestart_Choice_All);
};
// -------------------------------------------- CHOICES ----------------------------------------------------
FUNC VOID Info_Diego_Gamestart_Choice_Dex()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_00"); //Ich habe ne Ladung Erz verschwinden lassen.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_01"); //Dummerweise hat der Typ bei dem ich sie versteckt habe, lieber die Belohnung für mich kassiert, anstatt mit mir das Erz zu teilen.
	PrintScreen	("Geschicklichkeit +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Str()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_00"); //Eine Herausforderung konnte ich noch nie abschlagen. Auch nicht von des Königs Gardisten. dummerweise hat der König viele Gardisten.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_01"); //Zu viele.	
	PrintScreen	("Stärke +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Man()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_00"); //Ich saß in der Kneipe und habe meine Meinung über König, Krieg und Steuern gesagt. 
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_01"); //Ich hab' mich nur zu spät daran erinnert, dass der, der die Wahrheit spricht, ein schnelles Pferd braucht.
	PrintScreen	("Mana +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]+3;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_All()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_All_15_00"); //Ich bin unschuldig!
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_01"); //Du solltest eins wissen: Hier drin ist niemand unschuldig. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_02"); //Hier findest du Männer die so ziemlich jedes mögliche Verbrechen begangen haben. Und einen unschuldigen nehmen die nur zu gerne auseinander. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_03"); //Ich gebe dir nen Tipp, und der ist ganz umsonst. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_04"); //Wenn dich jemand fragt, warum du hier bist, sag ihm, du hast einen Typen gekillt, der dich gefragt hat, warum du hier bist. 
	PrintScreen	("Stärke, Geschick und Mana +1", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] 	= hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] 	= hero.attribute[ATR_STRENGTH]	+1;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]		+1;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]	+1;
	Info_ClearChoices(Info_Diego_Gamestart );


*/
