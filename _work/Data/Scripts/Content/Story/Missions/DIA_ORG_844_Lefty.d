// **************************************
//					EXIT 
// **************************************

instance DIA_Lefty_Exit (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 999;
	condition	= DIA_Lefty_Exit_Condition;
	information	= DIA_Lefty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Lefty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Lefty_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				First At Night
// **************************************

instance DIA_Lefty_FirstAtNight (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_FirstAtNight_Condition;
	information	= DIA_Lefty_FirstAtNight_Info;
	permanent	= 0;
	description = "¿Qué estás haciendo aquí?";
};                       

FUNC int DIA_Lefty_FirstAtNight_Condition()
{
	if	(Wld_IsTime(19,00,08,00))
	&&	(!Npc_KnowsInfo(hero,DIA_Lefty_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_FirstAtNight_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //¿Qué estás haciendo aquí?
	AI_Output (self, other,"DIA_846_Hello_07_01"); //Trabajo para el Señor del Arroz.
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //¿Tienes algún trabajo para mí?
	AI_Output (self, other,"DIA_Shrike_GetLost_07_01"); //¡Luego hablaré contigo!
	AI_StopProcessInfos	(self);
};

// **************************************
//				First
// **************************************

instance DIA_Lefty_First (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_First_Condition;
	information	= DIA_Lefty_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Lefty_First_Condition()
{
	if	(Wld_IsTime(08,00,19,00))
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_First_Info()
{
	AI_Output (self, other,"DIA_Lefty_First_07_00"); //¡Hey! ¿Eres un recién llegado?  Necesitamos a alguien que lleve algo de agua a los campesinos en los campos de arroz.
	AI_Output (self, other,"DIA_Lefty_First_07_01"); //De esta manera podrás hacer algunos nuevos amigos. ¿Qué opinas?
	
	Log_CreateTopic		(CH1_CarryWater,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_RUNNING);
	B_LogEntry			(CH1_CarryWater,"Lefty, un bandido del Campamento Nuevo que no para de hablar de sí mismo, quiere que lleve agua a los campesinos de los campos de arroz.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	Info_AddChoice		(DIA_Lefty_First,"Tal vez luego.",DIA_Lefty_First_Later);
	Info_AddChoice		(DIA_Lefty_First,"¡Lleva tú el agua a los campesinos!",DIA_Lefty_First_Never);
	Info_AddChoice		(DIA_Lefty_First,"Claro, me alegro de ayudar.",DIA_Lefty_First_Yes);
};

func void DIA_Lefty_First_Yes()
{
	AI_Output (other, self,"DIA_Lefty_First_Yes_15_00"); //Claro que sí, encantado de poder ayudar.
	AI_Output (self, other,"DIA_Lefty_First_Yes_07_01"); //¡Estupendo! Vete a ver al Señor del Arroz. Él te dará el agua y te dirá todo lo que necesitas saber. 
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_RUNNING;
	An_Bauern_verteilt = 0;
	B_LogEntry			(CH1_CarryWater,"Aunque probablemente se trate de una labor estúpida, he aceptado, pues quizá pueda hacer algunos amigos allí. Debo obtener el agua del llamado Señor del Arroz.");

	Info_ClearChoices	(DIA_Lefty_First);
};

func void DIA_Lefty_First_Never()
{
	AI_Output (other, self,"DIA_Lefty_First_Never_15_00"); //¡Llévale tú el agua a los campesinos!
	AI_Output (self, other,"DIA_Lefty_First_Never_07_01"); //¡Ésa no es forma de tratar a los amigos! ¡Me parece que vamos a tener que enseñarte buenas maneras!
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_FAILED;
	B_LogEntry			(CH1_CarryWater,"Cuando rechacé la 'oferta' de Lefty, ¡se puso bastante desagradable! ¡Y yo que pensaba que el Campamento Viejo era un lugar duro!");
	
	Info_ClearChoices	(DIA_Lefty_First );
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_First_Later()
{
	AI_Output (other, self,"DIA_Lefty_First_Later_15_00"); //Tal vez más tarde.
	AI_Output (self, other,"DIA_Lefty_First_Later_07_01"); //Pero más tarde no necesitaré a nadie. Necesito tu ayuda ahora mismo. ¿Quieres ayudarme o no?
};

// **************************************
//				Every Day
// **************************************
var int CarriedWaterForLefty;
// **************************************

instance DIA_Lefty_WorkDay (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_WorkDay_Condition;
	information	= DIA_Lefty_WorkDay_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC int DIA_Lefty_WorkDay_Condition()
{
	if	(Wld_IsTime(08,00,19,00) || (Lefty_Mission == LOG_SUCCESS))				// wenn Wasser verteilt, dann auch abends am Lagerfeuer!
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	&&	((Lefty_WorkDay <= Wld_GetDay()-1) || (Lefty_Mission == LOG_SUCCESS))	// wenn Wasser verteilt, dann auch noch am selben Tag! 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_WorkDay_Info()
{
	AI_Output (self, other,"DIA_Lefty_WorkDay_07_00"); //¡Eh, tú!
	
	if (Lefty_Mission == LOG_FAILED)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_00"); //¡Estás de suerte! Voy a darte una segunda oportunidad.
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_01"); //¡Esta vez, intenta no meter la pata! Bueno, vete a ver al Señor del Arroz y llévale agua a todos los campesinos. ¿Entendido?
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		B_LogEntry			(CH1_CarryWater,"¡He vuelto a encontrarme con Lefty! Quiere que vaya ante el Señor del Arroz y consiga el agua para los campesinos de los arrozales.");
		
		AI_StopProcessInfos	(self);
	}
	else if (Lefty_Mission == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //¡Te he dicho que le lleves algo de agua a los campesinos!
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //¡No me gusta la gente que hace promesas y luego no las cumple!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_FAILED;
		B_LogEntry			(CH1_CarryWater,"¡A Lefty no le ha gustado nada que aún no haya distribuido el agua! Parece que aún voy a poder divertirme a costa de él.");
		
		AI_StopProcessInfos	(self);
		Npc_SetTarget (self, other);
		AI_StartState (self, ZS_ATTACK, 1, "");
	}
	else if (Lefty_Mission == LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //¡Buen trabajo! Parece que sirves para algo, después de todo.
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //Creo que ésta es la tarea perfecta para ti. De ahora en adelante, la harás todos los días. Venga, ponte a ello ahora mismo.
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		if	!CarriedWaterForLefty
		{
			B_LogEntry		(CH1_CarryWater,"No puedo creerlo. Después de distribuir el agua por todas partes, Lefty quiere que me encargue de llevarla todos los días. Creo que este imbécil necesita que le digan cuatro cosas.");
			B_GiveXP		(XP_LeftyCarriedWater);
			CarriedWaterForLefty = TRUE;
		};
		
		AI_StopProcessInfos	(self);
	};
};

// **************************************
//				NICHT MEHR
// **************************************

instance DIA_Lefty_NeverAgain (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_NeverAgain_Condition;
	information	= DIA_Lefty_NeverAgain_Info;
	permanent	= 1;
	description	= "A partir de ahora puedes llevar tú el agua.";
};                       

FUNC int DIA_Lefty_NeverAgain_Condition()
{
	if ( (Lefty_Mission == LOG_RUNNING) && (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_NeverAgain_Info()
{
	AI_Output (other, self,"DIA_Lefty_NeverAgain_15_00"); //De ahora en adelante puedes llevar el agua tú mismo.
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_01"); //¿Oh? ¿Es que tienes planes más interesantes?
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_02"); //¡Me parece que voy a tener que recordarte quién es el jefe!
	
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};	

// **************************************
//				PERM
// **************************************
var int LeftyWasBeaten;
// **************************************
instance DIA_Lefty_PERM (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_PERM_Condition;
	information	= DIA_Lefty_PERM_Info;
	permanent	= 1;
	description	= "¿Qué tal estás, amigo mío?";
};                       

FUNC int DIA_Lefty_PERM_Condition()
{
	if (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE) 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_PERM_Info()
{
	AI_Output (other, self,"DIA_Lefty_PERM_15_00"); //¿Cómo estás, amigo mío?
	AI_Output (self, other,"DIA_Lefty_PERM_07_01"); //¡Oh, vaya! ¿Qué quieres?

	if	!LeftyWasBeaten
	{
		B_LogEntry			(CH1_CarryWater,"Le he dejado claro a Lefty que no me moleste más con sus teorías acerca del transporte del agua. Algunas personas sólo aprenden a base de golpes.");
		Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
		B_GiveXP			(XP_LeftyConfronted);
		LeftyWasBeaten = TRUE;
	};
	
	Info_ClearChoices	(DIA_Lefty_PERM );
	Info_AddChoice		(DIA_Lefty_PERM,"Simplemente quería ver cómo estás.",DIA_Lefty_PERM_Nothing);
	Info_AddChoice		(DIA_Lefty_PERM,"Los campesinos parecen sedientos.",DIA_Lefty_PERM_Durstig);
	Info_AddChoice		(DIA_Lefty_PERM,"He tenido un día muy malo. Quiero aliviar mi tensión... Quédate quieto...",DIA_Lefty_PERM_AufsMaul);

};	

func void DIA_Lefty_PERM_AufsMaul()
{
	AI_Output (other, self,"DIA_Lefty_PERM_AufsMaul_15_00"); //He tenido un día pésimo y estoy buscando alguna manera de liberar tensión... Quédate quieto un minuto...
	B_Say (self,other,"$YOUWANNAFOOLME");
	Info_ClearChoices	(DIA_Lefty_PERM );
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_PERM_Durstig()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Durstig_15_00"); //Los campesinos parecen sedientos.
	AI_Output (self, other,"DIA_Lefty_PERM_Durstig_07_01"); //Yo me encargo de ello... No te preocupes.
	AI_StopProcessInfos	(self);
};

func void DIA_Lefty_PERM_Nothing()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Nothing_15_00"); //Quería ver cómo estabas.
	AI_StopProcessInfos	(self);
};




	
	
	
	
	
