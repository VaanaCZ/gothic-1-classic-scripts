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
	description = "�Qu� est�s haciendo aqu�?";
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
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //�Qu� est�s haciendo aqu�?
	AI_Output (self, other,"DIA_846_Hello_07_01"); //Trabajo para el Se�or del Arroz.
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //�Tienes alg�n trabajo para m�?
	AI_Output (self, other,"DIA_Shrike_GetLost_07_01"); //�Luego hablar� contigo!
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
	AI_Output (self, other,"DIA_Lefty_First_07_00"); //�Hey! �Eres un reci�n llegado?  Necesitamos a alguien que lleve algo de agua a los campesinos en los campos de arroz.
	AI_Output (self, other,"DIA_Lefty_First_07_01"); //De esta manera podr�s hacer algunos nuevos amigos. �Qu� opinas?
	
	Log_CreateTopic		(CH1_CarryWater,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_RUNNING);
	B_LogEntry			(CH1_CarryWater,"Lefty, un bandido del Campamento Nuevo que no para de hablar de s� mismo, quiere que lleve agua a los campesinos de los campos de arroz.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	Info_AddChoice		(DIA_Lefty_First,"Tal vez luego.",DIA_Lefty_First_Later);
	Info_AddChoice		(DIA_Lefty_First,"�Lleva t� el agua a los campesinos!",DIA_Lefty_First_Never);
	Info_AddChoice		(DIA_Lefty_First,"Claro, me alegro de ayudar.",DIA_Lefty_First_Yes);
};

func void DIA_Lefty_First_Yes()
{
	AI_Output (other, self,"DIA_Lefty_First_Yes_15_00"); //Claro que s�, encantado de poder ayudar.
	AI_Output (self, other,"DIA_Lefty_First_Yes_07_01"); //�Estupendo! Vete a ver al Se�or del Arroz. �l te dar� el agua y te dir� todo lo que necesitas saber. 
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_RUNNING;
	An_Bauern_verteilt = 0;
	B_LogEntry			(CH1_CarryWater,"Aunque probablemente se trate de una labor est�pida, he aceptado, pues quiz� pueda hacer algunos amigos all�. Debo obtener el agua del llamado Se�or del Arroz.");

	Info_ClearChoices	(DIA_Lefty_First);
};

func void DIA_Lefty_First_Never()
{
	AI_Output (other, self,"DIA_Lefty_First_Never_15_00"); //�Ll�vale t� el agua a los campesinos!
	AI_Output (self, other,"DIA_Lefty_First_Never_07_01"); //��sa no es forma de tratar a los amigos! �Me parece que vamos a tener que ense�arte buenas maneras!
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_FAILED;
	B_LogEntry			(CH1_CarryWater,"Cuando rechac� la 'oferta' de Lefty, �se puso bastante desagradable! �Y yo que pensaba que el Campamento Viejo era un lugar duro!");
	
	Info_ClearChoices	(DIA_Lefty_First );
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_First_Later()
{
	AI_Output (other, self,"DIA_Lefty_First_Later_15_00"); //Tal vez m�s tarde.
	AI_Output (self, other,"DIA_Lefty_First_Later_07_01"); //Pero m�s tarde no necesitar� a nadie. Necesito tu ayuda ahora mismo. �Quieres ayudarme o no?
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
	AI_Output (self, other,"DIA_Lefty_WorkDay_07_00"); //�Eh, t�!
	
	if (Lefty_Mission == LOG_FAILED)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_00"); //�Est�s de suerte! Voy a darte una segunda oportunidad.
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_01"); //�Esta vez, intenta no meter la pata! Bueno, vete a ver al Se�or del Arroz y ll�vale agua a todos los campesinos. �Entendido?
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		B_LogEntry			(CH1_CarryWater,"�He vuelto a encontrarme con Lefty! Quiere que vaya ante el Se�or del Arroz y consiga el agua para los campesinos de los arrozales.");
		
		AI_StopProcessInfos	(self);
	}
	else if (Lefty_Mission == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //�Te he dicho que le lleves algo de agua a los campesinos!
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //�No me gusta la gente que hace promesas y luego no las cumple!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_FAILED;
		B_LogEntry			(CH1_CarryWater,"�A Lefty no le ha gustado nada que a�n no haya distribuido el agua! Parece que a�n voy a poder divertirme a costa de �l.");
		
		AI_StopProcessInfos	(self);
		Npc_SetTarget (self, other);
		AI_StartState (self, ZS_ATTACK, 1, "");
	}
	else if (Lefty_Mission == LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //�Buen trabajo! Parece que sirves para algo, despu�s de todo.
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //Creo que �sta es la tarea perfecta para ti. De ahora en adelante, la har�s todos los d�as. Venga, ponte a ello ahora mismo.
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		if	!CarriedWaterForLefty
		{
			B_LogEntry		(CH1_CarryWater,"No puedo creerlo. Despu�s de distribuir el agua por todas partes, Lefty quiere que me encargue de llevarla todos los d�as. Creo que este imb�cil necesita que le digan cuatro cosas.");
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
	description	= "A partir de ahora puedes llevar t� el agua.";
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
	AI_Output (other, self,"DIA_Lefty_NeverAgain_15_00"); //De ahora en adelante puedes llevar el agua t� mismo.
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_01"); //�Oh? �Es que tienes planes m�s interesantes?
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_02"); //�Me parece que voy a tener que recordarte qui�n es el jefe!
	
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
	description	= "�Qu� tal est�s, amigo m�o?";
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
	AI_Output (other, self,"DIA_Lefty_PERM_15_00"); //�C�mo est�s, amigo m�o?
	AI_Output (self, other,"DIA_Lefty_PERM_07_01"); //�Oh, vaya! �Qu� quieres?

	if	!LeftyWasBeaten
	{
		B_LogEntry			(CH1_CarryWater,"Le he dejado claro a Lefty que no me moleste m�s con sus teor�as acerca del transporte del agua. Algunas personas s�lo aprenden a base de golpes.");
		Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
		B_GiveXP			(XP_LeftyConfronted);
		LeftyWasBeaten = TRUE;
	};
	
	Info_ClearChoices	(DIA_Lefty_PERM );
	Info_AddChoice		(DIA_Lefty_PERM,"Simplemente quer�a ver c�mo est�s.",DIA_Lefty_PERM_Nothing);
	Info_AddChoice		(DIA_Lefty_PERM,"Los campesinos parecen sedientos.",DIA_Lefty_PERM_Durstig);
	Info_AddChoice		(DIA_Lefty_PERM,"He tenido un d�a muy malo. Quiero aliviar mi tensi�n... Qu�date quieto...",DIA_Lefty_PERM_AufsMaul);

};	

func void DIA_Lefty_PERM_AufsMaul()
{
	AI_Output (other, self,"DIA_Lefty_PERM_AufsMaul_15_00"); //He tenido un d�a p�simo y estoy buscando alguna manera de liberar tensi�n... Qu�date quieto un minuto...
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
	AI_Output (other, self,"DIA_Lefty_PERM_Nothing_15_00"); //Quer�a ver c�mo estabas.
	AI_StopProcessInfos	(self);
};




	
	
	
	
	
