// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_331_Fingers_Exit (C_INFO)
{
	npc			= STT_331_Fingers;
	nr			= 999;
	condition	= DIA_STT_331_Fingers_Exit_Condition;
	information	= DIA_STT_331_Fingers_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				 Schatten werden
// **************************************************
	var int Fingers_CanTeach;
// **************************************************

INSTANCE DIA_Fingers_BecomeShadow (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_BecomeShadow_Condition;
	information		= DIA_Fingers_BecomeShadow_Info;
	permanent		= 1;
	description		= "¡Quiero convertirme en una Sombra!"; 
};

FUNC INT DIA_Fingers_BecomeShadow_Condition()
{	
	if ( (Fingers_CanTeach == FALSE) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_BecomeShadow_Info()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_15_00"); //¡Quiero ingresar en las Sombras!
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_05_01"); //¿Y?
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
	Info_AddChoice		(DIA_Fingers_BecomeShadow,DIALOG_BACK										,DIA_Fingers_BecomeShadow_BACK);
	if (Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice		(DIA_Fingers_BecomeShadow,"Busco a alguien que me enseñe algo.",DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice		(DIA_Fingers_BecomeShadow,"¿Puedes ayudarme?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //¿Puedes ayudarme?
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //No sé cómo...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //Busco a alguien que me enseñe algo.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //¿Por qué acudes a mí?
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Vengo de parte de Diego.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //Haberlo dicho antes.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //Si quieres unirte al Campamento, es beneficioso ser un buen luchador o un buen ladrón.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //Si los miembros influyentes de las Sombras te ponen a prueba, te encargarán tareas que será mejor que nadie te pille llevando a cabo.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //Por eso te sería de utilidad aprender a ser un buen ladrón.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //Por cierto, yo soy el mejor ladrón de todo el Campamento Viejo.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry			(GE_TeacherOC,"Fingers puede enseñarme las habilidades de HURTO y CERRAJERÍA.");
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

// **************************************************
// 						 Lehrer
// **************************************************
	var int Fingers_Wherecavalorn;

INSTANCE DIA_Fingers_Lehrer (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Lehrer_Condition;
	information		= DIA_Fingers_Lehrer_Info;
	permanent		= 1;
	description		= "¿Qué puedes enseñarme?"; 
};

FUNC INT DIA_Fingers_Lehrer_Condition()
{	
	if (Fingers_CanTeach == TRUE)
	{
		return 1;	
	};
};

FUNC VOID DIA_Fingers_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_15_00"); //¿Qué puedes enseñarme?
	AI_Output (self, other,"DIA_Fingers_Lehrer_05_02"); //Eso depende de lo que quieras saber.



	Info_ClearChoices	(DIA_Fingers_Lehrer);
	Info_AddChoice		(DIA_Fingers_Lehrer,DIALOG_BACK																	,DIA_Fingers_Lehrer_BACK);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2	,	LPCOST_TALENT_PICKPOCKET_2,0)	,DIA_Fingers_Lehrer_Pickpocket2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1	,	LPCOST_TALENT_PICKPOCKET_1,0)	,DIA_Fingers_Lehrer_Pickpocket);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2		,	LPCOST_TALENT_PICKLOCK_2,0)	,DIA_Fingers_Lehrer_Lockpick2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1		,	LPCOST_TALENT_PICKLOCK_1,0)	,DIA_Fingers_Lehrer_Lockpick);
	Info_AddChoice		(DIA_Fingers_Lehrer,"Quiero aprender a moverme con sigilo.",DIA_Fingers_Lehrer_Schleichen);
};


func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //Quiero aprender a moverme con sigilo.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //Modestia aparte, creo que soy uno de los mejores ladrones que han sido arrojados a esta colonia.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //¡Pero cuando se trata de enseñar a moverse con sigilo, Cavalorn es el mejor!
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //¿Cómo puedo mejorar mis habilidades de cerrajería?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //¡Ya te gustaría saber eso! Para empezar, no es demasiado difícil.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //Sobre todo tienes que conseguir que tu ganzúa no se rompa.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //¡En el futuro, si eres un poco más paciente, verás como dejas de necesitar tantas ganzúas!
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //¿Cómo puedo convertirme en un experto en abrir cerraduras?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //Sólo podrás saber el momento en que va a romperse una ganzúa cuando hayas ganado algo de experiencia. ¡Produce un sonido diferente!
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //Me parece que ya lo has pillado. Aprende a escuchar los suaves chasquidos de la cerradura y no perderás tantas ganzúas.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //Un experto en este campo tiene muchas posibilidades de abrir un arcón sin romper su ganzúa.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //¡Quiero convertirme en un buen carterista!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //Así que quieres quitarle sus pertenencias a unos cuantos, ¿eh? Bueno.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //Te enseñaré cómo mejorar tus habilidades, pero seguirá siendo probable que te pillen.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //Sólo deberías arriesgarte cuando no haya nadie alrededor de tu víctima.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //¡Sólo un experto puede quitarle cosas de los bolsillos a la gente sin que se note!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //¡Olvídalo! Nunca conseguirás convertirte en un ladrón habilidoso si no sabes moverte sigilosamente.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //¡Quiero convertirme en un carterista experto!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //Me parece que has hecho los suficientes progresos como para que te enseñe los últimos trucos del oficio.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //Pero tienes que saber que incluso los mejores pueden ser atrapados a veces.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Cuídate.
	};
};

func VOID DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Fingers_Lehrer );
};

// **************************************************
// 					Wo Cavalorn
// **************************************************

INSTANCE DIA_Fingers_WhereCavalorn (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_WhereCavalorn_Condition;
	information		= DIA_Fingers_WhereCavalorn_Info;
	permanent		= 1;
	description		= "¿Dónde puedo encontrar a Cavalorn?"; 
};

FUNC INT DIA_Fingers_WhereCavalorn_Condition()
{	
	if (Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_WhereCavalorn_Info()
{
	AI_Output (other, self,"DIA_Fingers_WhereCavalorn_15_00"); //¿Dónde puedo encontrar a Cavalorn?
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_01"); //Está cazando en el bosque. Lo encontrarás en el sendero hacia el Campamento Nuevo. Al oeste del Campamento Viejo hay un gran cañón.
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_02"); //En ese cañón hay un antiguo refugio de leñadores. Allí podrás encontrarle.
	
	B_LogEntry( GE_TeacherOW,"Cavalorn puede enseñarme SIGILO. Su cabaña se encuentra en un cañón situado al oeste del Campamento Viejo, en dirección al Campamento Nuevo.");
};

// **************************************************
// 					Gutes Wort
// **************************************************
	var int Fingers_Learnt;
// **************************************************

INSTANCE DIA_Fingers_Learnt (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Learnt_Condition;
	information		= DIA_Fingers_Learnt_Info;
	permanent		= 1;
	description		= "No me defenderías delante de Diego, ¿verdad?"; 
};

FUNC INT DIA_Fingers_Learnt_Condition()
{	
	if ( (Fingers_Learnt != LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Learnt_Info()
{
	AI_Output (other, self,"DIA_Fingers_Learnt_15_00"); //¿Podrías hablar a Diego en mi favor?

	if ( Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK)+Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET)+Npc_GetTalentSkill(other, NPC_TALENT_SNEAK)	> 0)
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_01"); //Sí. Has aprendido algo que te vuelve muy útil para nosotros.
		AI_Output (self, other,"DIA_Fingers_Learnt_05_02"); //En este campamento siempre vienen bien los ladrones habilidosos. Tendrás mi voto.
		Fingers_Learnt = LOG_SUCCESS;
		
		B_GiveXP (XP_Fingerstrain);
		B_LogEntry( CH1_JoinOC,"Fingers está muy satisfecho con mis progresos.");
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_03"); //Depende...
		AI_Output (self, other,"DIA_Fingers_Learnt_05_04"); //¡Si me demuestras que has aprendido algo como ladrón, nos vendrías bien!
		AI_Output (other, self,"DIA_Fingers_Learnt_15_05"); //¿Cómo puedo hacerlo?
		AI_Output (self, other,"DIA_Fingers_Learnt_05_06"); //¡Aprende habilidades de ladrón! Necesitas moverte con mayor sigilo, ser mejor carterista y mejorar a la hora de abrir cerraduras. Entonces tendrás mi voto.
		Fingers_Learnt = LOG_RUNNING;
		
		B_LogEntry( CH1_JoinOC,"Fingers hablará en mi favor en cuanto aprenda una de las habilidades de ladrón.");
	};
};




























