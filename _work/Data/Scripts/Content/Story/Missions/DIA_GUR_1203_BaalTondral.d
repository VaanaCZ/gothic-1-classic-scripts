// **************************************************
// 					Pre - EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_MuteExit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_MuteExit_Condition;
	information	= DIA_BaalTondral_MuteExit_Info;
	permanent	= 0;
	description = "No decir nada.";
};                       

FUNC INT DIA_BaalTondral_MuteExit_Condition()
{
	if (!Npc_KnowsInfo (hero,DIA_BaalTondral_YouTalked))
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_MuteExit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalTondral_Exit (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 999;
	condition	= DIA_BaalTondral_Exit_Condition;
	information	= DIA_BaalTondral_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalTondral_Exit_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_BaalTondral_MuteExit) || Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked) )
	{ 
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Fanatic Teacher
// **************************************************

INSTANCE DIA_BaalTondral_FanaticTeacher (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_FanaticTeacher_Condition;
	information	= DIA_BaalTondral_FanaticTeacher_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_BaalTondral_FanaticTeacher_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_FanaticTeacher_Info()
{
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_00"); //No parece que seas alguien esclavizado por los magnates del mineral.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_01"); //Más bien pareces un buscador... Alguien que busca la fe verdadera. ¿No sientes un fuego dentro de tu cuerpo que te impide dormir por la noche?
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_02"); //Entiendo, no sabes si lo que te dicen los esclavos de los magnates del mineral es verdadero y justo. ¡También sabes por qué dudas de ellos! ¡Mienten!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_03"); //Con esas mentiras intentan controlar a los espíritus débiles. ¡Pero tu espíritu es más fuerte que sus mentiras!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_04"); //¿Es que no sientes todos los días un ansia de libertad? ¿Acaso no sientes cómo se vuelve más y más fuerte? Es lo que guía a tu espíritu. ¡Déjala salir!
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_05"); //¿Sabes lo que estás haciendo cuando intentas reprimirlo? ¡Estás negando a tu propia alma, a ti mismo! No permitas que los miedos dominen tu vida.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_06"); //Libérate a ti mismo. ¡Tienes que comprender! El Durmiente se despertará. Él te liberará y se llevará por delante a todos estos infieles incrédulos.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_07"); //Desaparecerán de este mundo como si se tratara de escoria arrastrada por la lluvia. Lloriquearán, gemirán y se arrepentirán, pero será demasiado tarde.
	AI_Output (self, other,"DIA_BaalTondral_FanaticTeacher_13_08"); //Entonces pagaran por ello. Lo pagaran con sangre. Y con sus vidas.
};

// **************************************************
// 				Du hast mich angesprochen
// **************************************************

INSTANCE DIA_BaalTondral_YouTalked (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_YouTalked_Condition;
	information	= DIA_BaalTondral_YouTalked_Info;
	permanent	= 0;
	description = "¡Oye! Me has hablado. ¿Significa que ya puedo hablarte?";
};                       

FUNC INT DIA_BaalTondral_YouTalked_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalTondral_YouTalked_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_YouTalked_15_00"); //¡Eh! Te has dirigido a mí. ¿Quiere eso decir que ya puedo hablar contigo?
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_01"); //Veo que te has familiarizado con nuestras reglas. Eso es bueno.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_02"); //¡Puedo sentir la gran fuerza de tu espíritu! Pronto se te permitirá unirte a nuestra comunidad.
	AI_Output (self, other,"DIA_BaalTondral_YouTalked_13_03"); //Me he dirigido a ti porque quiero darte una oportunidad de demostrar tu lealtad.
};

// **************************************************
// 				Loyalität beweisen
// **************************************************
	var int BaalTondral_GetNewGuy;
// **************************************************

INSTANCE DIA_BaalTondral_Loyality (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_Loyality_Condition;
	information	= DIA_BaalTondral_Loyality_Info;
	permanent	= 0;
	description = "¿Cómo puedo demostrar mi lealtad?";
};                       

FUNC INT DIA_BaalTondral_Loyality_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_BaalTondral_YouTalked))
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_Loyality_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_Loyality_15_00"); //¿Cómo puedo demostrar mi lealtad?
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_01"); //Lo que más necesitamos son nuevas almas que se unan a nuestra comunidad.
	AI_Output (self, other,"DIA_BaalTondral_Loyality_13_02"); //Si consigues reclutar más hombres para nuestro campamento, así demostrarás estar dispuesto a trabajar en pro de nuestra comunidad.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Baal Tondral me ha enviado el Campamento Viejo a reclutar a un nuevo hombre para la Hermandad. ¡Supongo que es una buena oportunidad para ganarse su favor!");

	BaalTondral_GetNewGuy = LOG_RUNNING;
};

// **************************************************
// 				Wo finde ich neuen Mann
// **************************************************

INSTANCE DIA_BaalTondral_NewMember (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember_Condition;
	information	= DIA_BaalTondral_NewMember_Info;
	permanent	= 1;
	description = "¿Dónde puedo reclutar nuevos miembros para la Hermandad?";
};                       

FUNC INT DIA_BaalTondral_NewMember_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember_15_00"); //¿Dónde puedo reclutar nuevos miembros para la Hermandad?
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_01"); //El Campamento Viejo es un buen lugar para intentarlo, ya que allí, la mayoría de la gente está harta de miedo y mentiras. Necesitan algo en que apoyarse.
	AI_Output (self, other,"DIA_BaalTondral_NewMember_13_02"); //No creo que tengas mucho éxito en el Campamento Nuevo. Los que viven allí son unos bárbaros.
};

// **************************************************
// 			Wieso braucht ihr so dringend Neue
// **************************************************

INSTANCE DIA_BaalTondral_NewMember2 (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_NewMember2_Condition;
	information	= DIA_BaalTondral_NewMember2_Info;
	permanent	= 0;
	description = "¿Por qué buscáis nuevos miembros con tanta desesperación?";
};                       

FUNC INT DIA_BaalTondral_NewMember2_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_NewMember2_Info()
{
	AI_Output (other, self,"DIA_BaalTondral_NewMember2_15_00"); //¿Por qué tantas ansias de incorporar nuevos miembros?
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_01"); //El Durmiente ha hablado con nuestro maestro y le ha revelado que tiene un importante mensaje para nosotros.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_02"); //Pero todavía no ha conseguido reunir todo su poder. Por eso necesita NUESTRA fuerza para poder ponerse en contacto con nosotros.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_03"); //Por lo tanto, estamos preparando una gran invocación, y cuantos más hombres participen en ella, mayor será la posibilidad de tener éxito.
	AI_Output (self, other,"DIA_BaalTondral_NewMember2_13_04"); //Si quieres saber más acerca de ello, dirígete al gran patio frente a la colina del templo. ¡Pero no molestes a nuestro maestro mientras está meditando!
};

// **************************************************
// 					DUSTY SUCCESS
// **************************************************

INSTANCE DIA_BaalTondral_DustySuccess (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_DustySuccess_Condition;
	information	= DIA_BaalTondral_DustySuccess_Info;
	permanent	= 0;
	description = "¡Aquí hay alguien que quiere conocerte, maestro!";
};                       

FUNC INT DIA_BaalTondral_DustySuccess_Condition()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	if ( (BaalTondral_GetNewGuy == LOG_RUNNING) && (Npc_GetDistToNpc(self,dusty)<1000) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_DustySuccess_Info()
{
	var C_NPC dusty; dusty = Hlp_GetNpc(Vlk_524_Dusty);
	
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_00"); //¡Aquí hay alguien que quiere conocerle, Maestro!
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_01"); //¿A quién me traes? ¿Es digno?
	AI_Output			(other, self,"DIA_BaalTondral_DustySuccess_15_02"); //Seguro que necesitará que le oriente espiritualmente, Maestro.
	AI_Output			(self, other,"DIA_BaalTondral_DustySuccess_13_03"); //De acuerdo. De ahora en adelante será uno de mis discípulos.
	//------------------------------------------------------------------	
	AI_TurnToNpc		(self, dusty);
	AI_TurnToNpc		(dusty,other);
	AI_Output			(self, NULL,"DIA_BaalTondral_DustySuccess_13_04"); //Vendrás todos los días a mi cabaña para escuchar mis palabras. Tu alma todavía puede ser salvada.

	//AI_Output			(dusty,other,"DIA_BaalTondral_DustySuccess_03_05"); //Heißt das, ich bin dabei - einfach so?
	//AI_TurnToNpc		(other,dusty);
	//AI_Output			(other,NULL,"DIA_BaalTondral_DustySuccess_15_06"); //Sieht so aus. Tu einfach, was der Meister dir sagt.

	//---- Dusty vom SC lösen ----
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal löschen
	dusty.guild = GIL_NOV;
	Npc_SetTrueGuild	(dusty, GIL_NOV);
	B_ExchangeRoutine	(Vlk_524_Dusty,"PREPARERITUAL");
	
	BaalTondral_GetNewGuy = LOG_SUCCESS;
	B_LogEntry			(CH1_RecruitDusty,"Dusty es ahora el discípulo de Baal Tondral. He cumplido con mi tarea.");
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_SUCCESS);
	B_GiveXP			(XP_DeliveredDusty);
};

// **************************************************
// 					zu Kalom
// **************************************************

INSTANCE DIA_BaalTondral_SendToKalom (C_INFO)
{
	npc			= Gur_1203_BaalTondral;
	nr			= 1;
	condition	= DIA_BaalTondral_SendToKalom_Condition;
	information	= DIA_BaalTondral_SendToKalom_Info;
	permanent	= 0;
	description = "¡Maestro! Me gustaría ingresar en la Hermandad.";
};                       

FUNC INT DIA_BaalTondral_SendToKalom_Condition()
{
	if (BaalTondral_GetNewGuy == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTondral_SendToKalom_Info()
{
	AI_Output 		(other, self,"DIA_BaalTondral_SendToKalom_15_00"); //¡Maestro! Deseo unirme a la Hermandad. Necesito que usted hable en mi favor.
	AI_TurnToNpc	(self, other);
	AI_Output 		(self, other,"DIA_BaalTondral_SendToKalom_13_01"); //Has demostrado tu valía. Ve a ver a Cor Kalorn y asume el manto.

	B_LogEntry(CH1_JoinPsi,"¡Baal Tondral me considera digno de vestir una túnica de novicio!");
};








