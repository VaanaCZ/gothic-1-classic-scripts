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
	AI_Output(self,hero,"Info_Diego_Gamestart_11_03"); //Si planeas seguir con vida mucho tiempo, deber�as hablar conmigo. Pero, por supuesto, no ser� yo quien te impida elegir tu propia destrucci�n. Bueno, �qu� opinas?
	
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
		AI_Output(self,hero,"Info_Diego_EXIT_Gamestart_11_01"); //T� decides. Ha sido un placer conocerte.
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
	 	AI_Output	(hero,self,"Info_Diego_EXIT_15_00"); //Cu�date.
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
	description = "Tengo una carta para el Gran Mago del C�rculo del Fuego.";
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
	AI_Output(hero,self,"Info_Diego_Brief_15_00"); //Tengo una carta para el Gran Mago del C�rculo del Fuego.
	AI_Output(self,hero,"Info_Diego_Brief_11_01"); //�De verdad...?
	AI_Output(hero,self,"Info_Diego_Brief_15_02"); //Me la entreg� un mago poco antes de que me arrojaran aqu�.
	AI_Output(self,hero,"Info_Diego_Brief_11_03"); //Tienes suerte de que ya no pueda acercarme a los magos. Cualquier otro te cortar�a el gaznate por esa carta.
	AI_Output(self,hero,"Info_Diego_Brief_11_04"); //Porque los magos pagan espl�ndidamente a sus mensajeros y aqu� hay mucha gente que no tiene nada.
	AI_Output(self,hero,"Info_Diego_Brief_11_05"); //Yo en tu lugar me callar�a hasta encontrarme con uno de los magos. Aunque, en tu situaci�n, es improbable que eso ocurra.
	AI_Output(hero,self,"Info_Diego_Brief_15_06");	//�Por qu� no?
	AI_Output(self,hero,"Info_Diego_Brief_11_07"); //Los magos est�n en el castillo del Campamento Viejo. A los �nicos a los que se permite entrar en el castillo es a los hombres de G�mez.
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
	description = "�Por qu� me ayudaste?";
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
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_00"); //�Por qu� me has ayudado?
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_01"); //Porque necesitabas ayuda; si no, Bullit y sus muchachos pod�an haberte matado.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_02"); //Y no pod�a quedarme de brazos cruzados. Porque he recorrido un largo camino para ofrecer una sugerencia.
	AI_Output(hero,self,"Info_Diego_WarumGeholfen_15_03"); //Una sugerencia...
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_04"); //S�. Tras este peque�o incidente con Bullit y sus muchachos, debes darte cuenta de que necesitas protecci�n.
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_05"); //Todos los que llegan aqu� pueden elegir. En la colonia hay tres campamentos y tendr�s que unirte a uno de ellos. 
	AI_Output(self,hero,"Info_Diego_WarumGeholfen_11_06"); //Estoy aqu� para decirle a los nuevos que el Campamento Viejo es el mejor lugar para ellos.
};

// -------------------------------------------------------------

INSTANCE Info_Diego_Bullit (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 5;
	condition	= Info_Diego_Bullit_Condition;
	information	= Info_Diego_Bullit_Info;
	permanent	= 0;
	description = "�D�nde est� Bullit?";
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
	AI_Output(hero,self,"Info_Diego_Bullit_15_02"); //�D�nde esta Bullit ahora?
	AI_Output(self,hero,"Info_Diego_Bullit_11_03"); //�l y los otros traen las mercanc�as del mundo exterior al Campamento. All� podr�s encontrarle.
	AI_Output(self,hero,"Info_Diego_Bullit_11_04"); //Pero si piensas combatir con �l, ten cuidado. Es un guerrero experimentado.
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
	description = "Vale, �qu� necesitas saber de este lugar?";
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
	AI_Output(hero,self,"Info_Diego_Kolonie_15_00"); //Bueno, �qu� es lo que necesito saber acerca de este lugar?
	AI_Output(self,hero,"Info_Diego_Kolonie_11_01"); //Lo llamamos la colonia. Ya sabes que producimos mineral para el rey. 
	AI_Output(self,hero,"Info_Diego_Kolonie_11_02"); //Bueno, al menos eso es lo que hacemos en el Campamento Viejo.
	AI_Output(self,hero,"Info_Diego_Kolonie_11_03"); //En el interior de la Barrera hay tres campamentos. El Campamento Viejo es el de mayor tama�o y el m�s antiguo.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_Barriere (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 3;
	condition	= Info_Diego_Barriere_Condition;
	information	= Info_Diego_Barriere_Info;
	permanent	= 0;
	description = "Cu�ntame m�s cosas de la Barrera.";
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
	AI_Output(hero,self,"Info_Diego_Barriere_15_00"); //Cu�ntame m�s cosas acerca de la Barrera.
	AI_Output(self,hero,"Info_Diego_Barriere_11_01"); //No hay mucho que contar. Es impenetrable.
	AI_Output(hero,self,"Info_Diego_Barriere_15_02"); //�Qu� ocurrir� si simplemente intento salir de aqu�?
	AI_Output(self,hero,"Info_Diego_Barriere_11_03"); //El �ltimo que intent� hacerlo lleg� muerto al otro lado. La maldita Barrera te deja entrar, pero nunca podr�s salir de aqu�.
	AI_Output(hero,self,"Info_Diego_Barriere_15_04"); //Si hay alguna manera de salir, la encontrar�.
	AI_Output(self,hero,"Info_Diego_Barriere_11_05"); //�Ya tienes prisa por salir de aqu�? �Pero si acabas de llegar!
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OtherCamps (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 2;
	condition	= Info_Diego_OtherCamps_Condition;
	information	= Info_Diego_OtherCamps_Info;
	permanent	= 0;
	description = "�Qu� hay de los otros dos campamentos?";
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
	AI_Output(hero,self,"Info_Diego_OtherCamps_15_00"); //�Y qu� hay de los otros dos campamentos?
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_01"); //Los otros dos campamentos se independizaron para llevar a efecto sus enloquecidos planes de fuga.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_02"); //Al oeste de la colonia se encuentra el Campamento Nuevo, en el que los magos creen poder hacer explotar la barrera cuando hayan conseguido acumular el mineral suficiente.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_03"); //Y luego est�n los chalados de la secta al oeste. Su campamento est� en medio del pantano y est�n rez�ndole a su �dolo para que les libere.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_04"); //Hasta el momento no les ha contestado.
	AI_Output(self,hero,"Info_Diego_OtherCamps_11_05"); //Yo en tu lugar no perder�a el tiempo con esos chiflados.
};

// -----------------------------------------------------------------------

INSTANCE Info_Diego_OldCamp (C_INFO) // E2
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_OldCamp_Condition;
	information	= Info_Diego_OldCamp_Info;
	permanent	= 0;
	description = "H�blame del Campamento Viejo.";
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
	AI_Output(hero,self,"Info_Diego_OldCamp_15_00"); //Cu�ntame m�s cosas acerca del Campamento Viejo.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_01"); //Es el mayor y m�s poderoso de los tres campamentos. G�mez y sus hombres lo controlan y, por tanto, tambi�n todo el negocio del mineral.
	AI_Output(self,hero,"Info_Diego_OldCamp_11_02"); //Una vez al mes, el rey nos env�a todo lo que necesitamos. Tenemos al viejo comiendo de la mano, �comprendes?
	AI_Output(self,hero,"Info_Diego_OldCamp_11_03"); //Nos env�a vino, pan, carne, armas... De todo.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{ 
	AI_Output(self,hero,"Info_Diego_OldCamp_11_04"); //T� tambi�n puedes aprovecharte de ello. Lo �nico que tienes que hacer es unirte a los hombres de G�mez.
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
	description = "�Qui�n es G�mez?";
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
	AI_Output(hero,self,"Info_Diego_WhosGomez_15_00"); //�Qui�n es G�mez?
	AI_Output(self,hero,"Info_Diego_WhosGomez_11_01"); //G�mez es el m�s poderoso de los Magnates del Mineral. Es el jefe del Campamento Viejo; el hombre m�s poderoso de la colonia.
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
	description = "Supongamos que quiera unirme a su gente. �Qu� tengo que saber?";
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
	AI_Output(hero,self,"Info_Diego_JoinOldcamp_15_00"); //Supongamos que quiero unirme a ellos; �qu� es lo que tengo que hacer?
	AI_Output(self,hero,"Info_Diego_JoinOldcamp_11_01"); //A la puerta del castillo encontrar�s a un hombre llamado Thorus. Dile que vas de parte de Diego.
	VAR C_NPC Thorus; Thorus = Hlp_GetNpc(GRD_200_THORUS);
	Thorus.aivar[AIV_FINDABLE]=TRUE;
	
	Log_CreateTopic(CH1_JoinOC, LOG_MISSION);
	Log_SetTopicStatus(CH1_JoinOC, LOG_RUNNING);
	B_LogEntry( CH1_JoinOC,"Necesito ver a Thoros para que me permitan unirme a la gente de G�mez en el Campamento Viejo.");
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
	description = "�C�mo llego al Campamento Viejo?";
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
	AI_Output(hero,self,"Info_Diego_WayToOldcamp_15_00"); //�C�mo puedo encontrar el Campamento Viejo?
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_01"); //No tienes m�s que seguir este sendero. El Campamento Viejo es el primer lugar con aspecto de ser razonablemente seguro que encontrar�s.
	AI_Output(self,hero,"Info_Diego_WayToOldcamp_11_02"); //Hay un gran n�mero de bestias salvajes entre los campamentos. Ser�a una locura viajar sin un arma.
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
	description = "�D�nde consigo un arma?";
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
	AI_Output(hero,self,"Info_Diego_WoWaffe_15_00"); //�D�nde puedo obtener un arma?
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_01"); //Cuando llegues a la Mina Vieja, echa un vistazo. Estoy seguro de que encontrar�s algo �til.
	AI_Output(self,hero,"Info_Diego_WoWaffe_11_02"); //La mina es f�cil de encontrar; est� en este ca��n, a unos pocos metros de distancia. 
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
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_01"); //�Y qu� te ha dicho?
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_02"); //Dice que puedo unirme al Campamento Viejo si T� piensas que me lo merezco.
	AI_Output(self,hero,"Info_Diego_ThorusSays_11_03"); //Parece que tengo un nuevo trabajo.
	AI_Output(hero,self,"Info_Diego_ThorusSays_15_04"); //�Empezamos ahora mismo?
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
	description = "�Qu� tengo que hacer para que me acepten en el Campamento Viejo?";
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
	AI_Output(hero,self,"Info_Diego_Rules_15_00"); //�Qu� es lo que tengo que saber para ser aceptado en el Campamento Viejo?
	AI_Output(self,hero,"Info_Diego_Rules_11_01"); //Si quieres unirte al Campamento, tendr�s que hacer m�ritos.
	AI_Output(self,hero,"Info_Diego_Rules_11_02"); //En el Anillo Exterior hay gente influyente. La mayor�a son Sombras. Si consigues impresionarlos, habr�s hecho alg�n m�rito.
	AI_Output(self,hero,"Info_Diego_Rules_11_03"); //Luego tendr�s que pasar la prueba de la fe.
	AI_Output(self,hero,"Info_Diego_Rules_11_04"); //Adem�s, todo reci�n llegado tiene que aprender una serie de habilidades. Cuanto m�s aprendas, m�s valioso ser�s para nosotros.
	
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
	description = "�D�nde est� la gente importante?";
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
	AI_Output(hero,self,"Info_Diego_Celebs_15_00"); //�D�nde puedo encontrar a la gente importante?
	AI_Output(self,hero,"Info_Diego_Celebs_11_01"); //Bueno, est�s mirando a uno de ellos. Tambi�n est� Thorus... A �l ya le conoces.
	AI_Output(self,hero,"Info_Diego_Celebs_11_02"); //Por lo que se refiere a los dem�s... Tendr�s que averiguarlo por tu cuenta. Si no lo consigues, es que tampoco te merec�as estar aqu�.
	AI_Output(self,hero,"Info_Diego_Celebs_11_03"); //Ve al Anillo Exterior y habla con la gente; entonces sabr�s qui�n es importante.
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
	description = "�Qui�n puede ense�arme?";
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
	AI_Output		(hero,self,"Info_Diego_Teachers_15_00"); //�Qui�n puede ense�arme?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_01"); //Empieza con Fingers. �l es el m�s habilidoso de todos nosotros.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_02"); //Si mantienes los ojos abiertos, encontrar�s a otros que pueden ense�arte.
	AI_Output		(hero,self,"Info_Diego_Teachers_15_03"); //�D�nde puedo encontrar a Fingers?
	AI_Output		(self,hero,"Info_Diego_Teachers_11_04"); //Su caba�a est� bastante escondida. Est� al lado de la muralla del castillo. Dir�gete a la arena desde aqu�.
	AI_Output		(self,hero,"Info_Diego_Teachers_11_05"); //Para ir a la arena, tienes que girar a la izquierda cuando llegues a la entrada del castillo.

	if	(Fingers_CanTeach == FALSE)
	{
		Log_CreateTopic (GE_TeacherOC,	LOG_NOTE);
		B_LogEntry		(GE_TeacherOC,"Fingers puede ense�arme HURTO y CERRAJER�A. Vive en una caba�a cercana a la arena, algo aislado, junto a las murallas del castillo.");
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
	description = "�Puedes ense�arme algo?";
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
		B_LogEntry		(GE_TeacherOC,"Diego puede ayudarme a adquirir m�s FUERZA y DESTREZA.");
		log_diegotrain	= TRUE;
	};
	AI_Output(hero,self,"Info_Diego_Teach_15_00"); //�Puedes ense�arme algo?
	AI_Output(self,hero,"Info_Diego_Teach_11_01"); //S�. Puedo ense�arte a mejorar tu destreza o tu fuerza.
	
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
	AI_Output(self,hero,"Info_Diego_Teach_BACK_11_02"); //Vuelve pronto. �Hay muchas cosas que tienes que aprender!
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
	description = "�Qu� es la prueba de fe?";
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
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_00"); //�Qu� es la prueba de fe?
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_01"); //Tienes que ir a la Vieja Mina. All� encontrar�s a un tipo llamado Ian, que te dar� una lista.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_02"); //Esta lista es importante. En ella figuran todas las cosas que la gente de la mina necesita de nosotros.
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_03"); //�Recibir�n todo eso en la pr�xima caravana!
	AI_Output (hero, self,"Info_Diego_BringList_Offer_15_04"); //�Sin problemas!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_05"); //�S� que hay un problema! �Esta lista no debe caer en manos del Campamento Nuevo!
	AI_Output (self, hero,"Info_Diego_BringList_Offer_11_06"); //Como ya te he contado, esta lista es importante. Si lo haces bien, habr�s adelantado mucho.
	
	Diego_BringList = LOG_RUNNING;
    
    Log_CreateTopic (CH1_BringList,LOG_MISSION);
    Log_SetTopicStatus(CH1_BringList,LOG_RUNNING);
    B_LogEntry    (CH1_BringList,"Diego me ha enviado a la Vieja Mina. Se supone que debo obtener una lista de alguien llamado Ian. �sta no debe caer bajo ning�n concepto en manos del Campamento Nuevo.");
    
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
	description = "Si la lista es tan importante, �por qu� me la iba a dar Ian? ";
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
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_01"); //Si la lista es tan importante, �por qu� me la ha dado Ian precisamente a m�?
	AI_Output (self, hero,"Info_Diego_IanPassword_Info_11_02"); //Porque vas a decirle que vas de parte de Diego.
	AI_Output (hero, self,"Info_Diego_IanPassword_Info_15_03"); //Se lo dir�.
	
	B_LogEntry    (CH1_BringList,"Ian me entregar� la lista si le digo que me env�a Diego.");
};

// ----------------------------------------------------------------------------------

INSTANCE Info_Diego_MapToOldMine (C_INFO)
{
	npc			= PC_Thief;
	nr			= 1;
	condition	= Info_Diego_MapToOldMine_Condition;
	information	= Info_Diego_MapToOldMine_Info;
	permanent	= 0;
	description = "�D�nde puedo encontrar la Vieja Mina?";
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
	AI_Output (hero, self,"Info_Diego_MapToOldMine_Info_15_00"); //�D�nde puedo encontrar la Vieja Mina?
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_01"); //Vete a ver a Graham. Es cart�grafo. Dile que vas de mi parte y que necesitas un mapa. En �l podr�s ver el camino a la mina.
	AI_Output (self, hero,"Info_Diego_MapToOldMine_Info_11_02"); //Vive a la izquierda de la puerta antigua.
	
	B_LogEntry    (CH1_BringList,"Graham me dar� un mapa. Puedo encontrarlo a la izquierda de la puerta del norte.");
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
	
	AI_Output (self, hero,"Info_Diego_BringList_Success_11_01"); //�Buen trabajo! �Con eso har�s alg�n m�rito!

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
	description = "�Qu� hay de mi estima dentro del Campamento?";
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
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_00"); //�Y qu� hay de la estima que se me tiene en el Campamento?
	AI_Output(self, hero,"Info_Diego_JoinAnalyze_11_01"); //He hablado con alguna gente...
	AI_Output(hero, self,"Info_Diego_JoinAnalyze_15_02"); //�Y?
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
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_02"); //Scatty me ha dicho que dejaste que Kirgo te derrotara. No parec�a demasiado entusiasmado.
		Points_OC = Points_OC - 1;
	}
	else if (Scatty_ChargeKirgo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_03"); //Scatty me ha dicho que est� deseando ver qu� tal te va contra Kirgo.
	};
	
	if (Scatty_ChargeKharim == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_04"); //Pero le ha impresionado que tuvieras el valor de enfrentarte a Kharim, aunque hayas salido derrotado.
		Points_OC = Points_OC + 2;
	}
	else if (Scatty_ChargeKharim == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_05"); //Pero le hab�a causado una gran impresi�n que derrotases a Kharim; no hac�a m�s que hablar de ti. 
		Points_OC = Points_OC + 5;
	}
	else if (Scatty_ChargeKharim == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Scatty_11_06"); //Y ten�a grandes deseos de ver si vas a desafiar a Kharim.
	};
	// -----------------------------------------------------------
	if (Whistler_BuyMySword == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_01"); //Whistler me ha contado lo de Frank... Bueno, yo en tu lugar habr�a cogido el mineral y me hubiera ido. Pero tiene una opini�n muy buena de ti.
		Points_OC = Points_OC + 3;
	}
	else if ( (Whistler_BuyMySword == LOG_FAILED) || ( (Whistler_BuyMySword==LOG_RUNNING)&&(Whistler_BuyMySword_Day<=(Wld_GetDay()-2)) ) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_02"); //He hablado con Whistler. �T� le quitaste su mineral, bastardo listillo! �Tengo que admitir que tienes mucho coraje!
		Points_OC = Points_OC + 2;
	}
	else if (Whistler_BuyMySword == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Whistler_11_03"); //Whistler est� esperando su espada. �Deber�as decidir si se la vas a llevar o no; si no, pensar� que te has fugado con su mineral!
		
	};
	// -----------------------------------------------------------
	if (Sly_LostNek == LOG_SUCCESS)			
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_01"); //Sly me ha dicho que encontraste a Nek. Parec�a estar muy satisfecho.
		Points_OC = Points_OC + 4;
	}
	else if (Sly_LostNek == LOG_RUNNING)					
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Sly_11_02"); //Creo que Sly se equivoca con  Nek. Es cierto que era un pesado, pero no creo que fuera al Campamento Nuevo.
	};
	// -----------------------------------------------------------
	if (Fingers_Learnt == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_01"); //Ya te he enviado a ver a Fingers; ��l s� que podr�a ense�arte una cosa o dos!
	}
	else if (Fingers_Learnt == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fingers_11_02"); //Fingers me ha dicho que ya has aprendido algo, pero que todav�a puedes mejorar tus habilidades.
		Points_OC = Points_OC + 3;
	};
	// -----------------------------------------------------------
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_01"); //Necesito hablar con Dexter urgentemente. Te est� utilizando en su provecho.
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_02"); //Pero no hay muchas reglas para la prueba. Si la superas, habr�s dado un gran paso.
		
	}
	else if (Dexter_GetKalomsRecipe == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Dexter_11_03"); //Entonces es verdad que has conseguido que Kalorn te diera la receta. Dexter est� muy impresionado; yo tambi�n lo estoy.
		Points_OC = Points_OC + 5;
	};
	// -----------------------------------------------------------
	if (Thorus_MordragKo == LOG_RUNNING)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_01"); //El asunto con Mordrag tiene su miga. No es mal guerrero. Deber�as practicar si es que quieres derrotarle.
	}
	else if (Thorus_MordragKo == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_02"); //Thorus dice que nos vendr�a bien alguien como t�; eso es muy bueno para ti.
		Points_OC = Points_OC + 5;
	}
	else if (Thorus_MordragKo == LOG_FAILED)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Thorus_11_03"); //A Thorus casi le explota la cabeza; estaba realmente furioso. �C�mo te atreves a cagarla DE ESTA MANERA?
		Points_OC = Points_OC - 5;						
	}
	// ----WEITER-------------------------------------------------------
	if (Fisk_GetNewHehler == LOG_SUCCESS)
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_01"); //Fisk me ha dicho que le has sorprendido. En cualquier caso, estar� de tu lado.
		Points_OC = Points_OC + 5;
	}
	else if ( (MordragKO_HauAb==TRUE) || (MordragKO_StayAtNC==TRUE) )
	{
		AI_Output(self,hero,"Info_Diego_JoinAnalyze_Fisk_11_02"); //Fisk est� muy cabreado contigo. Yo en tu lugar buscar�a un sustituto para Mordrag.
	};
	// -----------------------------------------------------------
	if (points_oc > 15)// runtergesetzt!! // Bei 20 + BringList = Aufnahme
	{
		AI_Output (self, hero,"Info_Diego_Points_11_00"); //Has conseguido que un n�mero suficiente de personas hablara en favor de ti.
		
		if hero.level >= 5
		{
			if (Diego_BringList == LOG_SUCCESS)
			{
				AI_Output (self, hero,"Info_Diego_Points_11_01"); //Tambi�n has pasado la prueba de fe. Ve a ver a Thorus. Ya se lo he contado todo y te dejar� ver a G�mez.
				Diego_GomezAudience = TRUE;
				
				Log_SetTopicStatus(CH1_JoinOC, LOG_SUCCESS);
				B_LogEntry(CH1_JoinOC,"Diego me ha conseguido una audiencia con G�mez. Ahora puedo entrar a formar parte de la gente de G�mez y pasar al castillo. Antes tengo que ver a Thorus.");
			}
			else
			{
				AI_Output (self, hero,"Info_Diego_Points_11_02"); //Pero todav�a tienes que pasar la prueba de fe.
			};
		}
		else
		{
			B_PrintGuildCondition(5);
		};
	}
	else if (points_oc > 10)
	{
		AI_Output (self, hero,"Info_Diego_Points_11_10"); //Bien mirado, no est� mal para un reci�n llegado.
	}
	else if points_oc >= 0
	{
		AI_Output (self, hero,"Info_Diego_Points_11_20"); //�No te pares! Hay mucho que debes hacer si quieres llegar a alguna parte en este Campamento.
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
	description = "�Qu� tengo que hacer cuando vea a G�mez?";
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
	AI_Output (hero, self,"Info_Diego_WhatToSayToGomez_Info_15_00"); //�Qu� es lo que tengo que hacer cuando vea a G�mez?
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_01"); //G�mez toma sus decisiones por puro instinto. Te mirar� a la cara y decidir� si puedes unirte a nosotros.
	AI_Output (self, hero,"Info_Diego_WhatToSayToGomez_Info_11_02"); //De ahora en adelante tendr�s que apa��rtelas t� solo; �hazlo lo mejor que puedas! Buena suerte.
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
		AI_Output			(hero, self,"PC_Thief_ARMOR_Info_15_01"); //�Puedo conseguir una armadura como la tuya?
		AI_Output			(self, hero,"PC_Thief_ARMOR_Info_11_02"); //�Tienes mineral suficiente?

		CreateInvItem 		(hero,			STT_ARMOR_H);
		B_GiveInvItems		(hero, self,	ItMinugget,	VALUE_STT_ARMOR_H);
		
		//hier nur ein Text f�r die Bildschirmausgabe
		CreateInvItem		(self, 			ItAmArrow);
		B_GiveInvItems		(self, hero,	ItAmArrow,	1);
		Npc_RemoveInvItem	(hero,			ItAmArrow);
	}
	else
	{
		AI_Output (self, hero,"PC_Thief_ARMOR_Info_11_03"); //Consigue el mineral y conseguir�s la armadura.
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
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_00"); //Oye, cre� que hab�as muerto.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_01"); //En algunos momentos yo tambi�n lo pens�.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_02"); //Han pasado muchas cosas desde la �ltima vez que nos vimos. Tengo entendido que colaboraste decisivamente en la invocaci�n final.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_03"); //Es evidente que est�s bien informado.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_04"); //Mejor de lo que t� crees... �Y ahora vas en busca del foco?
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_05"); //S�. Debe haber uno por aqu�, en alguna parte.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_06"); //Yo s� d�nde encontrar uno. S�lo hay un problema.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_07"); //Entiendo. �Qu� es lo que quieres?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_08"); //Has aprendido bien la lecci�n, pero no me refer�a a eso.
	AI_Output (hero, self,"PC_Thief_MEETAGAIN_Info_15_09"); //�No? Entonces, �cu�l es el problema?
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_10"); //Es un problema de tres toneladas.
	AI_Output (self, hero,"PC_Thief_MEETAGAIN_Info_11_11"); //Ven conmigo. Enseguida lo entender�s.

 	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine (self,"GuideTroll");

	Log_CreateTopic		(CH3_TrollCanyon,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_TrollCanyon,	LOG_RUNNING);
	B_LogEntry		(CH3_TrollCanyon,"Al acercarme al lugar del foco del norte, me he topado de sorpresa con Diego. Me ha dicho que hay algo 'grande' esper�ndome al final del ca��n.");
	B_LogEntry		(CH3_TrollCanyon,"De alg�n modo conoc�a mis actividades en el campamento del pantano as� como mi b�squeda de los focos. A partir de aqu� seguiremos juntos.");

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
	
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_01"); //En el lado izquierdo de este ca��n se encuentra la entrada de una cueva que conduce al lugar en el que se encuentra el foco.
	AI_Output (hero, self,"PC_Thief_SHOWFOCUS_Info_15_02"); //De acuerdo. Pero primero tenemos que librarnos de ese monstruo de ah�.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_03"); //Intenta encontrar un punto d�bil u otra forma de derrotar al troll.
	AI_Output (self, hero,"PC_Thief_SHOWFOCUS_Info_11_04"); //Yo atraer� su atenci�n.

	B_LogEntry		(CH3_TrollCanyon,"Nos hemos topado con un troll enorme bloque�ndonos el camino. Diego quiere entretenerlo; mientras, yo tengo que encontrar una manera de hacerlo pedazos.");

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
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_01"); //Eso ha sido fant�stico. Eres muy bueno. Y ahora, a por el foco.
	AI_Output			(self, hero,"PC_Thief_AFTERTROLL_Info_11_02"); //Voy a asegurar que no haya m�s sorpresas desagradables.

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
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_01"); //Parece que el engranaje est� atascado.
	AI_Output 			(self, hero,"PC_Thief_WHEEL_Info_11_02"); //�D�jame ver; tal vez yo pueda arreglarlo!

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
	AI_Output 			(self, hero,"PC_Thief_FIXWHEEL_Info_11_01"); //Bueno, ahora deber�a funcionar.
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

	AI_Output 			(self, hero,"PC_Thief_WAITATFOCUS_Info_11_01"); //�Vete a por el foco; yo te espero aqu�!

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
	AI_Output			(hero, self,"PC_Thief_GOTIT_Info_15_03"); //�Aseg�rate de seguir vivo!
	AI_Output			(self, hero,"PC_Thief_GOTIT_Info_11_04"); //Volveremos a vernos.

	B_LogEntry		(CH3_TrollCanyon,"El foco es m�o. Pero a�n debo convencer a unas arp�as de que me dejen qued�rmelo.");
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

	AI_Output			(self,hero,"Info_Diego_OCWARN_11_01"); //Eh... chit�n... �silencio!
	if (Npc_KnowsInfo(hero, Info_Milten_OCWARN))
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_02"); //�Hola, Diego; ya he hablado con Milten, al otro extremo del Campamento!
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_03"); //Bueno, as� que ya sabes lo que ha pasado.
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_04"); //Pero, �te has enterado tambi�n de los planes de atacar la Mina Libre?
	}
	else
	{
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_05"); //Hola, Diego; �qu� significa todo este juego del escondite?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_06"); //�Es que no te has enterado?
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_07"); //�Enterado de qu�?
		AI_Output		(self,hero,"Info_Diego_OCWARN_11_08"); //La Vieja Mina se ha hundido, los magos del fuego han sido asesinados y se planea un ataque a la Mina Libre.
		AI_Output		(hero,self,"Info_Diego_OCWARN_15_09"); //�QUEEEEEEE�? �De qu� est�s hablando?
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
	description = "�C�mo pudo hundirse la Vieja Mina?";
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
	AI_Output		(hero,self,"Info_Diego_OCMINE_15_01"); //�C�mo es posible que se hundiera la Vieja Mina?
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_02"); //Uno de los cavadores supervivientes nos ha dicho que estaban excavando cuando se toparon con un r�o subterr�neo en el nivel inferior.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_03"); //Cuando el agua inund� la mina, uno de los puntales se rompi� y toda la secci�n superior se vino abajo.
	AI_Output		(self,hero,"Info_Diego_OCMINE_11_04"); //S�lo un pu�ado de personas consiguieron escapar de la mina.
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
	description = "�Por qu� han muerto los magos del fuego?";
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
	AI_Output		(hero,self,"Info_Diego_OCKDF_15_01"); //�Por qu� han muerto todos los magos del fuego?
	AI_Output		(self,hero,"Info_Diego_OCKDF_11_02"); //�sa es una larga historia.
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
	description = "�Una incursi�n en la Mina Libre?";
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
	AI_Output		(hero,self,"Info_Diego_OCFM_15_01"); //�Un ataque a la Mina Libre?
	AI_Output		(self,hero,"Info_Diego_OCFM_11_02"); //�sa es una larga historia.
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
	description = "�Cu�ntamelo!";
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
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_01"); //�Cu�ntamela! �No ser� la primera larga historia que haya tenido que escuchar!
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_02"); //Bueno. Por suerte, yo estaba en la casa de los Magnates del Mineral cuando recibieron la noticia del hundimiento de la mina.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_03"); //G�mez estaba l�vido de furia cuando se enter� y tem�a que su puesto corriera peligro.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_04"); //Claro. �Quien controla el mineral tambi�n controla la colonia!
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_05"); //Exacto. Dado que ya no tiene una fuente de ingresos, las mercanc�as del exterior dejar�n de llegar.
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_06"); //Si no encuentra pronto otra fuente de ingresos, nadie trabajar� para �l.
	AI_Output		(hero,self,"Info_Diego_OCSTORY_15_07"); //�Y �sa es la raz�n del ataque a la Mina Libre?
	AI_Output		(self,hero,"Info_Diego_OCSTORY_11_08"); //Siendo honestos, �sa es la �nica posibilidad que tiene G�mez de mantenerse en el poder.
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
	description = "�Es una locura! Tengo que alertar al Campamento Nuevo.";
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
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_01"); //�Es una locura! Tengo que avisar al Campamento Nuevo.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_02"); //�Entonces tendr�s que apresurarte! Ya casi han llegado a la Mina Libre.
	AI_Output		(hero,self,"Info_Diego_OCWARNNC_15_03"); //Pero nunca conseguir�n atravesar las fortificaciones del Campamento Nuevo.
	AI_Output		(self,hero,"Info_Diego_OCWARNNC_11_04"); //No necesitan atravesarlas. Hace unos meses, encontraron un sendero que atraviesa las monta�as y conduce hasta la Mina Libre; nadie m�s lo sabe.
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
	AI_Output		(self,hero,"Info_Diego_OCGUARDS_11_02"); //Mantente alejado de ellos. Atacar�n a cualquiera que se acerque al Campamento.
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
	description = "Pero, �qu� pas� con los magos del fuego?";
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
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_01"); //Pero, �qu� les ha ocurrido a los magos del fuego?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_02"); //Corristo y los otros magos fueron los �nicos en el campamento que mantuvieron la cabeza fr�a.
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_03"); //Prohibieron el ataque y exigieron un acuerdo con los otros dos campamentos.
	AI_Output		(hero,self,"Info_Diego_OCMURDER_15_04"); //�PROHIBIERON a G�mez atacar la Mina Libre?
	AI_Output		(self,hero,"Info_Diego_OCMURDER_11_05"); //Bueno, s�, Corristo y los dem�s no deber�an haber estado tan seguros de s� mismos. G�mez ya no se fiaba de ellos y, p�rfidamente, los hizo asesinar.
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
	description = "�Ahora qu� vais a hacer t� y Milten?";
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
	AI_Output		(hero,self,"Info_Diego_OCRETREAT_15_01"); //�Qu� vais a hacer ahora Milten y t�?
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_02"); //Nos quedaremos aqu� un poco m�s para avisar a algunos otros amigos para que no se topen con los guardias.
	AI_Output		(self,hero,"Info_Diego_OCRETREAT_11_03"); //Pero podr�as hacernos un favor.
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
	description = "Consid�ralo hecho. �Dime lo que quieres!";
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
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_01"); //Dalo por hecho. �Dime qu� es lo que deseas!
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_02"); //Espera a Lester y a Gorn. Tienen que enterarse de lo que ha ocurrido.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_03"); //Diles que nos reuniremos los cuatro en el mismo sitio de siempre.
	AI_Output		(hero,self,"Info_Diego_OCFAVOR_15_04"); //Si les veo antes que t�, les avisar� y les enviar� a vuestro lugar de reuni�n.
	AI_Output		(self,hero,"Info_Diego_OCFAVOR_11_05"); //Gracias, amigo m�o. Parece que eres en verdad un buen tipo. Ahora vete; nos veremos m�s tarde.
				
	Log_CreateTopic		(CH4_4Friends,		LOG_MISSION);
	Log_SetTopicStatus	(CH4_4Friends,		LOG_RUNNING);
	B_LogEntry			(CH4_4Friends,		"Todos los Magos del Fuego est�n muertos, y la situaci�n empieza a estar fuera de control. Diego quiere que le diga a Lester y Gorn que se re�nan con Milten y �l en un lugar secreto. �Parece que no es la primera vez que hacen esto!"); 
};











































/*

// *******************************************************************

	AI_Output(self,hero,"Info_Diego_Gamestart_11_01"); //Warum haben sie dich hier reingeworfen?
	
	Info_ClearChoices(Info_Diego_Gamestart );
	Info_AddChoice	 (Info_Diego_Gamestart, "Gewitzter �berfall            (+3 Geschicklichkeit)"	,Info_Diego_Gamestart_Choice_Dex);
	Info_AddChoice	 (Info_Diego_Gamestart, "Schl�gerei mit Folgen         (+3 St�rke)"				,Info_Diego_Gamestart_Choice_Str);
	Info_AddChoice	 (Info_Diego_Gamestart, "Wahre Worte zum falschen Mann (+3 Mana)"				,Info_Diego_Gamestart_Choice_Man);
	Info_AddChoice	 (Info_Diego_Gamestart, "Unschuldig                    (+1 auf alle Attribute)"	,Info_Diego_Gamestart_Choice_All);
};
// -------------------------------------------- CHOICES ----------------------------------------------------
FUNC VOID Info_Diego_Gamestart_Choice_Dex()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_00"); //Ich habe ne Ladung Erz verschwinden lassen.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Dex_15_01"); //Dummerweise hat der Typ bei dem ich sie versteckt habe, lieber die Belohnung f�r mich kassiert, anstatt mit mir das Erz zu teilen.
	PrintScreen	("Geschicklichkeit +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] = hero.attribute[ATR_DEXTERITY]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Str()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_00"); //Eine Herausforderung konnte ich noch nie abschlagen. Auch nicht von des K�nigs Gardisten. dummerweise hat der K�nig viele Gardisten.
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Str_15_01"); //Zu viele.	
	PrintScreen	("St�rke +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_STRENGTH] = hero.attribute[ATR_STRENGTH]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_Man()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_00"); //Ich sa� in der Kneipe und habe meine Meinung �ber K�nig, Krieg und Steuern gesagt. 
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_Man_15_01"); //Ich hab' mich nur zu sp�t daran erinnert, dass der, der die Wahrheit spricht, ein schnelles Pferd braucht.
	PrintScreen	("Mana +3", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]+3;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]+3;
	Info_ClearChoices(Info_Diego_Gamestart );
};

FUNC VOID Info_Diego_Gamestart_Choice_All()
{
	AI_Output(hero,self,"Info_Diego_Gamestart_Choice_All_15_00"); //Ich bin unschuldig!
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_01"); //Du solltest eins wissen: Hier drin ist niemand unschuldig. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_02"); //Hier findest du M�nner die so ziemlich jedes m�gliche Verbrechen begangen haben. Und einen unschuldigen nehmen die nur zu gerne auseinander. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_03"); //Ich gebe dir nen Tipp, und der ist ganz umsonst. 
	AI_Output(self,hero,"Info_Diego_Gamestart_Choice_All_11_04"); //Wenn dich jemand fragt, warum du hier bist, sag ihm, du hast einen Typen gekillt, der dich gefragt hat, warum du hier bist. 
	PrintScreen	("St�rke, Geschick und Mana +1", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	hero.attribute[ATR_DEXTERITY] 	= hero.attribute[ATR_DEXTERITY]+1;
	hero.attribute[ATR_STRENGTH] 	= hero.attribute[ATR_STRENGTH]	+1;
	hero.attribute[ATR_MANA] 		= hero.attribute[ATR_MANA]		+1;
	hero.attribute[ATR_MANA_MAX] 	= hero.attribute[ATR_MANA_MAX]	+1;
	Info_ClearChoices(Info_Diego_Gamestart );


*/
