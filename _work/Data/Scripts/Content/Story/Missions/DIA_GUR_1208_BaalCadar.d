// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_BaalCadar_Exit (C_INFO)
{
	npc			= Gur_1208_BaalCadar;
	nr			= 999;
	condition	= DIA_BaalCadar_Exit_Condition;
	information	= DIA_BaalCadar_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_BaalCadar_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_BaalCadar_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************************************************
// 					NICHT ansprechbar (Ungläubiger) 
// ************************************************************
	var int BaalCadar_Ansprechbar;
	var int BaalCadar_Sakrileg;
// ************************************************************

INSTANCE DIA_BaalCadar_NoTalk(C_INFO)
{
	npc				= GUR_1208_BaalCadar;
	nr				= 2;
	condition		= DIA_BaalCadar_NoTalk_Condition;
	information		= DIA_BaalCadar_NoTalk_Info;
	permanent		= 1;
	important 		= 1;
};                       

FUNC INT DIA_BaalCadar_NoTalk_Condition()
{
	if	Npc_IsInState(self,ZS_TALK)
	&&	(BaalCadar_Ansprechbar==FALSE)
	&&	(Npc_GetPermAttitude(self,other)!=ATT_FRIENDLY)
	&&	(Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_BaalCadar_NoTalk_Info()
{	
	Info_ClearChoices 	(DIA_BaalCadar_NoTalk);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,DIALOG_ENDE					,DIA_BaalCadar_NoTalk_ENDE);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,"¿Va todo bien, amigo?",DIA_BaalCadar_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,"¡Que el Durmiente te acompañe!",DIA_BaalCadar_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalCadar_NoTalk,"¡Hola! ¡Soy nuevo!",DIA_BaalCadar_NoTalk_Hi);
};

func void DIA_BaalCadar_NoTalk_Hi()
{
	AI_Output (other, self,"DIA_BaalCadar_NoTalk_Hi_15_00"); //¡Hola! ¡Soy nuevo aquí!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //[Suspiro]
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Sleeper()
{
	AI_Output (other, self,"DIA_BaalCadar_NoTalk_Sleeper_15_00"); //¡Que el Durmiente sea contigo!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Sleeper_02_01"); //[Suspiro]
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_Imp()
{
	AI_Output (other, self,"DIA_BaalCadar_NoTalk_Imp_15_00"); //¿Hay algún problema, amigo?
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Imp_02_01"); //[Suspiro]
	BaalCadar_Sakrileg = TRUE;
};

func void DIA_BaalCadar_NoTalk_ENDE()
{
	AI_StopProcessInfos	(self);
};

/*


	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_01"); //Du solltest deinen Weg mit Bedacht wählen und nach reiflicher Überlegung. 
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_02"); //Bedenke wie du entscheidest. In den anderen Lagern bekommst zwar Schutz und Nahrung, aber ist es das, was du willst?
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_15_03"); //Was erwartet mich, was es wert wäre, zu euch zu kommen?
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_04"); //Ich könnte dir jetzt erzählen, das die Templer einen unbezwinglichen Willen haben,das die magische Macht der Gurus, die Vorstellungskraft von Feuer- und Wassermagiern bei weitem übersteigt.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_05"); //Das unsere Nahrung auch satt macht. Aber das ist es nicht, was diese Gemeinschaft ausmacht.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_06"); //Was dich hier erwartet, ist die Gabe. Du wirst einen Weg beschreiten, der dir sehr viel abverlangt.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_07"); //Aber das was du erreichen wirst ist eine Größe, eine Macht die dir Erleuchtung schenkt. Eine Macht, die dich zur Freiheit führt.
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_08"); //Ist es nicht das, was du willst?... Freiheit?
	AI_Output (self, other,"Sit_1_PSI_BaalCadar_HypnoticTeacher_2FuncNo_02_09"); //Also solltest du nicht die Frage stellen, warum du her kommen solltest, die Frage ist viel mehr, warum solltest du nicht?
	Log_CreateTopic (GE_TeacherPSI,LOG_NOTE);
	B_LogEntry    (GE_TeacherPSI,"Baal Cadar kann mir zeigen, wie ich meine geistige Kraft verbessern kann.");
*/

// **************************************************
// 						 Sleep Spell
// **************************************************

INSTANCE DIA_BaalCadar_SleepSpell (C_INFO)
{
	npc			= Gur_1208_BaalCadar;
	nr			= 1;
	condition	= DIA_BaalCadar_SleepSpell_Condition;
	information	= DIA_BaalCadar_SleepSpell_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_BaalCadar_SleepSpell_Condition()
{
	var C_NPC Nov1336; Nov1336=Hlp_GetNpc(Nov_1336_Novize);
	var C_NPC Nov1340; Nov1340=Hlp_GetNpc(Nov_1340_Novize);
	var C_NPC Nov1345; Nov1345=Hlp_GetNpc(Nov_1345_Novize);
	
	if ( Npc_IsInState(Nov1336,ZS_MagicSleep) || Npc_IsInState(Nov1340,ZS_MagicSleep) || Npc_IsInState(Nov1345,ZS_MagicSleep) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalCadar_SleepSpell_Info()
{
	AI_Output (self, other,"DIA_BaalCadar_SleepSpell_02_00"); //¿Qué estás haciendo? Estoy intentando meditar con mis discípulos.
	AI_Output (self, other,"DIA_BaalCadar_SleepSpell_02_01"); //¿Quién te enseñó a utilizar los poderes mágicos del Durmiente?
	AI_Output (other, self,"DIA_BaalCadar_SleepSpell_15_02"); //Nadie. Fue muy fácil.
	AI_Output (self, other,"DIA_BaalCadar_SleepSpell_02_03"); //Pareces ser un estudiante inteligente. Yo te instruiré.

	BaalCadar_Ansprechbar = TRUE;
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	};
	B_LogEntry		(CH1_JoinPsi,"¡Baal Cadar piensa que soy un discípulo receptivo!");
	B_GiveXP		(XP_ImpressBaalCadar);
};

/*------------------------------------------------------------------------
						MANA								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_Teach (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_Teach_Condition;
	information		= Gur_1208_BaalCadar_Teach_Info;
	permanent		= 1;
	description		= "Me gustaría aprender a aumentar el poder de mi magia."; 
};

FUNC int  Gur_1208_BaalCadar_Teach_Condition()
{	
	if	(BaalCadar_Ansprechbar == TRUE)
	||	(Npc_GetTrueGuild(other) != GIL_NONE)
	{
		return TRUE;
	};
};
FUNC void  Gur_1208_BaalCadar_Teach_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_Teach_Info_15_01"); //Me gustaría aprender a incrementar el poder de mi magia.
	AI_Output (self, other,"Gur_1208_BaalCadar_Teach_Info_02_02"); //La clave reside en el poder de tu espíritu.
	
	if (log_baalcadartrain == FALSE) 
	{
		Log_CreateTopic   	(GE_TeacherPSI,LOG_NOTE);
		B_LogEntry			(GE_TeacherPSI,"El Gurú Baal Cadar puede ayudarme a incrementar mi MANA.");
		log_baalcadartrain = TRUE;
	};
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,DIALOG_BACK									,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)	,Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_BACK()
{
	
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
};
func void Gur_1208_BaalCadar_Teach_MAN_1()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,DIALOG_BACK									,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)	,Gur_1208_BaalCadar_Teach_MAN_1);
};

func void Gur_1208_BaalCadar_Teach_MAN_5()
{
	B_BuyAttributePoints (other, ATR_MANA_MAX, 5*LPCOST_ATTRIBUTE_MANA);
	Info_ClearChoices	(Gur_1208_BaalCadar_Teach);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,DIALOG_BACK									,Gur_1208_BaalCadar_Teach_BACK);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach, B_BuildLearnString(NAME_LearnMana_5,5*LPCOST_ATTRIBUTE_MANA,0)		,Gur_1208_BaalCadar_Teach_MAN_5);
	Info_AddChoice		(Gur_1208_BaalCadar_Teach,B_BuildLearnString(NAME_LearnMana_1,LPCOST_ATTRIBUTE_MANA,0)	,Gur_1208_BaalCadar_Teach_MAN_1);

};
/*------------------------------------------------------------------------
							DIE KREISE DER BRUDERSCHAFT									
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_FIRSTTEST (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_FIRSTTEST_Condition;
	information		= Gur_1208_BaalCadar_FIRSTTEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Enséñame la magia de las runas."; 
};

FUNC int  Gur_1208_BaalCadar_FIRSTTEST_Condition()
{	
	if	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_FIRSTTEST_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_FIRSTTEST_Info_15_01"); //Enséñame la magia de las runas.
	AI_Output (self, other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_02"); //Muchos son los que han aprendido el lenguaje de las runas, pero muy pocos los que han comprendido su magia.
	AI_Output (self, other,"Gur_1208_BaalCadar_FIRSTTEST_Info_02_03"); //Intentaré instruirte.
	
	Log_CreateTopic (GE_TeacherPSI,LOG_NOTE);
	B_LogEntry    	(GE_TeacherPSI,"Baal Cadar puede enseñarme los CÍRCULOS mágicos de la magia rúnica.");
		
};

/*------------------------------------------------------------------------
							DER ERSTE KREIS								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS1 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS1_Condition;
	information		= Gur_1208_BaalCadar_KREIS1_Info;
	important		= 0;
	permanent		= 1;
	description		= "Estoy preparado para ingresar en el Primer Círculo."; 
};

FUNC int  Gur_1208_BaalCadar_KREIS1_Condition()
{	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 0)
	&&	(Npc_KnowsInfo (hero,Gur_1208_BaalCadar_FIRSTTEST))
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS1_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS1_Info_15_01"); //Estoy preparado para entrar en el Primer Círculo.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 1, LPCOST_TALENT_MAGE_1))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_02"); //Escucha mis palabras.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_03"); //Hace mucho tiempo, el Durmiente apareció y envió una visión a la humanidad.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_04"); //Pero muchos se negaron a ver sus signos; estaban cegados por las ansias de mineral.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_05"); //Sólo Y'Berion y otros pocos emprendieron el camino y fundaron la Hermandad.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS1_Info_02_06"); //El Primer Circulo nació en el momento en el que obedecieron la llamada del Durmiente. La magia de las runas podrá ser comprendida por cualquier seguidor del Durmiente.
		Gur_1208_BaalCadar_KREIS1.permanent = 0;
	};
	AI_StopProcessInfos	( self );

};
/*------------------------------------------------------------------------
							DER ZWEITE KREIS									
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS2 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS2_Condition;
	information		= Gur_1208_BaalCadar_KREIS2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Estoy preparado para ingresar en el Segundo Círculo."; 
};

FUNC int  Gur_1208_BaalCadar_KREIS2_Condition()
{	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 1)
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS2_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS2_Info_15_01"); //Estoy preparado para entrar en el Segundo Círculo.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 2,LPCOST_TALENT_MAGE_2))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_02"); //Entonces escucha y comprende.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_03"); //El Durmiente guió a Y'Berion y sus fieles discípulos hasta este lugar y aquí  se establecieron.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_04"); //Trabajaron sin descanso, durante días, semanas y meses. El Campamento creció. Más y más hombres se unían a ellos, obedeciendo a la llamada del Durmiente.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_05"); //Todos juntos intentaron entrar en contacto con el Durmiente en un nivel espiritual.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS2_Info_02_06"); //Así nació el Segundo Círculo.
		Gur_1208_BaalCadar_KREIS2.permanent = 0;
	};
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
							DER DRITTE KREIS								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS3 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS3_Condition;
	information		= Gur_1208_BaalCadar_KREIS3_Info;
	important		= 0;
	permanent		= 1;
	description		= "Estoy preparado para ingresar en el Tercer Círculo."; 
};

FUNC int  Gur_1208_BaalCadar_KREIS3_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 2)
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS3_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS3_Info_15_01"); //Estoy preparado para entrar en el Tercer Círculo.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 3, LPCOST_TALENT_MAGE_3))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_02"); //Presta atención a mis palabras.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_03"); //Las visiones se fueron haciendo más claras, pero el poder espiritual de la Hermandad no era suficiente para establecer contacto.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_04"); //Uno de los Gurús, un alquimista, resolvió el problema. Elaboró una poción extraída de las secreciones de un reptador. Los hermanos la ingirieron antes de rezar sus oraciones y sus poderes espirituales se unieron por primera vez.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_05"); //Al mismo tiempo, los novicios se dirigieron hacia los Campamentos para predicar la palabra del Durmiente y convencer de su veracidad a los infieles.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS3_Info_02_06"); //Así se logró el Tercer Círculo.
	};
	AI_StopProcessInfos	( self );
};
/*------------------------------------------------------------------------
						DER VIERTE KREIS								
------------------------------------------------------------------------*/

instance  Gur_1208_BaalCadar_KREIS4 (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_KREIS4_Condition;
	information		= Gur_1208_BaalCadar_KREIS4_Info;
	important		= 0;
	permanent		= 1;
	description		= "Estoy preparado para ingresar en el Cuarto Círculo."; 
};

FUNC int  Gur_1208_BaalCadar_KREIS4_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_MAGE) == 3)
	&&	C_NpcBelongsToPsiCamp(hero)
	{
		return TRUE;
	};

};
FUNC void  Gur_1208_BaalCadar_KREIS4_Info()
{
	AI_Output (other, self,"Gur_1208_BaalCadar_KREIS4_Info_15_01"); //Estoy preparado para entrar en el Cuarto Círculo.
	if (B_GiveSkill(other,NPC_TALENT_MAGE , 4, LPCOST_TALENT_MAGE_4))
	{
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_02"); //Ha pasado mucho tiempo desde la fundación del Campamento. Han cambiado muchas cosas.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_03"); //La fe ha crecido, ha sido reforzada y se ha difundido.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_04"); //No hemos olvidado nuestro objetivo. No hemos renunciado a intentar invocar al Durmiente.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_05"); //El Cuarto Círculo está representado por la perseverancia y la estabilidad de la fe.
		AI_Output (self, other,"Gur_1208_BaalCadar_KREIS4_Info_02_06"); //Ahora ya sabes todo lo que un hermano necesita saber acerca de la magia. Has sido un buen estudiante.
		Gur_1208_BaalCadar_KREIS4.permanent = 0;
	};

};
//---------------------------------------------------------
//					MAGISCHEN KRAM KAUFEN
//---------------------------------------------------------
instance  Gur_1208_BaalCadar_SELLSTUFF (C_INFO)
{
	npc				= Gur_1208_BaalCadar;
	condition		= Gur_1208_BaalCadar_SELLSTUFF_Condition;
	information		= Gur_1208_BaalCadar_SELLSTUFF_Info;
	important		= 0;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  Gur_1208_BaalCadar_SELLSTUFF_Condition()
{	
	if	(BaalCadar_Ansprechbar == TRUE)
	||	(Npc_GetTrueGuild(other) != GIL_NONE)
	{
		return TRUE;
	};
};
FUNC void  Gur_1208_BaalCadar_SELLSTUFF_Info()
{
	if  (log_baalcadarsell == FALSE)
	{
		Log_CreateTopic   	(GE_TraderPSI,LOG_NOTE);
		B_LogEntry			(GE_TraderPSI,"El Gurú Baal Cadar vende RUNAS, PERGAMINOS MÁGICOS, POCIONES, AMULETOS y ANILLOS.");
		log_baalcadarsell = TRUE;
	};	
	AI_Output (other, self,"Gur_1208_BaalCadar_SELLSTUFF_Info_15_01"); //Quiero obtener escritos mágicos.

};  






     
