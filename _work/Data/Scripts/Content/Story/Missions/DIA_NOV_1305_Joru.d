// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Joru_Exit (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 999;
	condition	= DIA_Joru_Exit_Condition;
	information	= DIA_Joru_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Joru_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Joru_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Was machst du?
// **************************************************

instance  DIA_Joru_Greet (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Greet_Condition;
	information	= DIA_Joru_Greet_Info;
	permanent	= 0;
	description = "�Qu� est�s haciendo aqu�?";
};                       

FUNC int  DIA_Joru_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_Joru_Greet_Info()
{
	AI_Output (other, self,"DIA_Joru_Greet_15_00"); //�Qu� haces aqu�?
	AI_Output (self, other,"DIA_Joru_Greet_07_01"); //Estoy ense��ndole las palabras del Durmiente a los novicios.
	AI_Output (self, other,"DIA_Joru_Greet_07_02"); //Yo tambi�n soy un novicio, pero pronto ser� un Baal; uno de los Gur�s.
	AI_Output (self, other,"DIA_Joru_Greet_07_03"); //Incluso he hablado con Y'Berion. �l es el elegido. Me ha dicho que, si trabajo duro, pronto ser� un maestro.
	AI_Output (self, other,"DIA_Joru_Greet_07_04"); //Pero todav�a no. No hay prisa, �entiendes? Puedo convertirme en maestro en cualquier momento.
	AI_Output (self, other,"DIA_Joru_Greet_07_05"); //De momento estoy satisfecho con mis actuales tareas.
};

// **************************************************
//					Tester
// **************************************************

instance  DIA_Joru_Tester (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_Tester_Condition;
	information	= DIA_Joru_Tester_Info;
	permanent	= 0;
	description = "�Cu�l es tu cometido aqu�?";
};                       

FUNC int  DIA_Joru_Tester_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_Tester_Info()
{
	AI_Output (other, self,"DIA_Joru_Tester_15_00"); //�Cu�l es tu tarea aqu�?
	AI_Output (self, other,"DIA_Joru_Tester_07_01"); //Pruebo, junto con estos amigos m�os, las sustancias que desarrolla Cor Kalorn en su laboratorio de alquimia.
	AI_Output (self, other,"DIA_Joru_Tester_07_02"); //Su ayudante nos da algo nuevo cada par de d�as. Y nosotros lo probamos.
	AI_Output (self, other,"DIA_Joru_Tester_07_03"); //Esta hierba libera tu esp�ritu. Si tomas la cantidad adecuada, puedes entrar en contacto con el Durmiente.
};

// **************************************************
//				Schonmal Kontakt?
// **************************************************

instance  DIA_Joru_SleeperContact (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 1;
	condition	= DIA_Joru_SleeperContact_Condition;
	information	= DIA_Joru_SleeperContact_Info;
	permanent	= 0;
	description = "�Te has puesto en contacto alguna vez con el Durmiente?";
};                       

FUNC int  DIA_Joru_SleeperContact_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Tester))
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_SleeperContact_Info()
{
	AI_Output (other, self,"DIA_Joru_SleeperContact_15_00"); //�Has estado alguna vez en contacto con el Durmiente?
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_01"); //No. Todav�a no. Pero solo porque nunca nos dan suficiente.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_02"); //Kalorn siempre quiere que le contemos sus efectos, pero tengo la impresi�n de que no le interesa en absoluto mi opini�n.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_03"); //Si la sustancia me ha parecido estimulante, se la pasa directamente a los Gur�s.
	AI_Output (self, other,"DIA_Joru_SleeperContact_07_04"); //Pero pronto yo tambi�n ser� un Gur� y podr� apurar mis l�mites y escuchar por m� mismo la voz del Durmiente.
};


// **************************************************
//					JOIN PSI
// **************************************************
	var int Joru_BringJoints;
// **************************************************

instance  DIA_Joru_JoinPsi (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JoinPsi_Condition;
	information	= DIA_Joru_JoinPsi_Info;
	permanent	= 0;
	description = "Me gustar�a ingresar en vuestro campamento. �Me pod�is ayudar?";
};                       

FUNC int  DIA_Joru_JoinPsi_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Joru_Greet))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JoinPsi_Info()
{
	AI_Output (other, self,"DIA_Joru_JoinPsi_15_00"); //Me gustar�a unirme a vuestro campamento; �puedes ayudarme?
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_01"); //�Quieres unirte a nosotros? �Espl�ndido! Espera un momento... S�, creo que puedo ayudarte.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_02"); //Todav�a no soy un Gur�, pero tengo algunas influencias en la Hermandad.
	AI_Output (self, other,"DIA_Joru_JoinPsi_07_03"); //Tienes que hacerme un favor. �Has visto ya a Fortuno?
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
	Info_AddChoice		(DIA_Joru_JoinPsi,"No.",DIA_Joru_JoinPsi_Nein);
	Info_AddChoice		(DIA_Joru_JoinPsi,"S�.",DIA_Joru_JoinPsi_Ja);
};

func void DIA_Joru_JoinPsi_Ja()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Ja_07_00"); //Entonces, �tienes tu raci�n diaria? Si me la das, podemos hacer un trato.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Ja_15_01"); //Me lo pensar�.
	Joru_BringJoints = LOG_RUNNING; 
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

func void DIA_Joru_JoinPsi_Nein()
{
	AI_Output (self, other,"DIA_Joru_JoinPsi_Nein_07_00"); //Entonces vete a verle y recoge tu raci�n diaria. Si me entregas toda la hierba del pantano que te d�, podemos hacer un trato.
	AI_Output (other, self,"DIA_Joru_JoinPsi_Nein_15_01"); //Me lo pensar�.
	Joru_BringJoints = LOG_RUNNING; 

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"A Joru le gustar�a hacerse con la raci�n diaria de hierba del pantano que obtengo de Fortuno.");
	
	Info_ClearChoices	(DIA_Joru_JoinPsi );
};

// **************************************************
//					SUCCESS
// **************************************************

instance  DIA_Joru_JointsRunning (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_JointsRunning_Condition;
	information	= DIA_Joru_JointsRunning_Info;
	permanent	= 1;
	description = "Tengo hierba del pantano. Pod�is qued�rosla.";
};                       

FUNC int  DIA_Joru_JointsRunning_Condition()
{
	if (Joru_BringJoints == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_JointsRunning_Info()
{
	AI_Output				(other, self,"DIA_Joru_JointsRunning_15_00"); //Tengo hierba del pantano. Puedes qued�rtela.
		
	if (Npc_HasItems(other,itmijoint_2)>=3)
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_01"); //�Estupendo! Debes haberte dado cuenta de que ninguno de los Gur�s quiere hablar contigo.
		AI_Output			(self, other,"DIA_Joru_JointsRunning_07_02"); //Puedes hacer que eso cambie si les impresionas. Yo puedo decirte c�mo conseguirlo.
		
		B_GiveInvItems		(other, self, itmijoint_2, 3);
		
		Joru_BringJoints = 	LOG_SUCCESS; 
		B_GiveXP			(XP_WeedForJoru);
	}
	else
	{
		AI_Output			(self, other,"DIA_Joru_JointsRunning_NO_JOINTS_07_00"); //�Acordamos que tres de Oscura del norte y nada m�s que eso! �Primero dame las hierbas y entonces podremos alcanzar un acuerdo!
	}; 
};

// **************************************************
//			Wie kann ich Gurus beeindrucken?
// **************************************************
	var int Joru_Tips;
// **************************************************

instance  DIA_Joru_ImpressGurus (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_ImpressGurus_Condition;
	information	= DIA_Joru_ImpressGurus_Info;
	permanent	= 1;
	description = "�C�mo puedo impresionar a los Gur�s?";
};                       

FUNC int  DIA_Joru_ImpressGurus_Condition()
{
	if (Joru_BringJoints == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_ImpressGurus_Info()
{
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_00"); //�C�mo puedo impresionar a los Gur�s?
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_01"); //Baal Cadar instruye a los novicios acerca de la magia del Durmiente.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_02"); //Si quieres atraer su atenci�n tienes que utilizar magia.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_03"); //�Pero no emplees el Pu�o del viento! Haz dormir a un miembro de su p�blico o algo as�.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_04"); //Baal Namib, ese que est� junto al portal principal. Es uno de los tipos m�s duros. Creo que Lester podr�a echarte una mano con �l. Habla con �l en cuanto se ausente su maestro.
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_05"); //Los otros Gur�s son b�sicamente buena gente; intenta ser de utilidad.
	AI_Output (other, self,"DIA_Joru_ImpressGurus_15_06"); //Gracias por tus consejos..
	AI_Output (self, other,"DIA_Joru_ImpressGurus_07_07"); //Oye, un trato es un trato.
	
	if ( Joru_JoinPsi == FALSE)
	{
		B_LogEntry	(CH1_JoinPsi,"Para impresionar a Baal Cadar, tengo que ejecutar un conjuro de dormir sobre uno de sus oyentes.");
		B_LogEntry	(CH1_JoinPsi,"Voy a preguntarle al novicio Lester c�mo impresionar a Baal Namib en la puerta principal. Sin embargo, �debo intentar que no haya cerca ning�n Gur�!");
		Joru_JoinPsi = TRUE;
	};
	
	Joru_Tips = TRUE;
};

// **************************************************
//					Woher Magie?
// **************************************************

instance  DIA_Joru_GetMagic (C_INFO)
{
	npc			= Nov_1305_Joru;
	nr			= 5;
	condition	= DIA_Joru_GetMagic_Condition;
	information	= DIA_Joru_GetMagic_Info;
	permanent	= 1;
	description = "�C�mo consigo la magia del Durmiente?";
};                       

FUNC int  DIA_Joru_GetMagic_Condition()
{
	if (Joru_Tips == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Joru_GetMagic_Info()
{
	if (Joru_Tips_Mage == FALSE)
	{
		Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
		B_LogEntry		(GE_TraderPSI,"Baal Cadar vende RUNAS y PERGAMINOS.");
		Joru_Tips_Mage	=TRUE;
	};
	AI_Output (other, self,"DIA_Joru_GetMagic_15_00"); //�C�mo puedo alcanzar la magia del Durmiente?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_01"); //Baal Cadar vende runas y pergaminos de conjuro. Pero eso no te sirve de nada si se niega a hablar contigo, �verdad?
	AI_Output (self, other,"DIA_Joru_GetMagic_07_02"); //Tal vez otro Gur� pueda ayudarte.
};







/*
Sit_1_PSI_Joru_SmokingTeacher

Joru: Du bist neu hier. Hast Du schon unser Kraut genossen?
Das solltest du unbedingt tun. Wei�t du, es ist ziemlich gut. Es �ffnet deinen Geist f�r die Worte des Schl�fers.
Komm, komm zu uns und lasse deinen Geist frei. Mach dich bereit f�r eine Reise.
Eine spirituelle Reise. Lerne die Macht des Geistes zu nutzen. Lerne sie zu kontrollieren.
Komm zu uns in die Gemeinschaft der Erwachten und gleichzeitig Erwecker. Teile mit uns deine Kraft, wie wir unsere Kraft mit dir teilen.
Mach dich frei von Suche und beginne zu finden. Entdecke die Wahrheit. Das alles kannst du erreichen, wenn du zu uns kommst.

*/ 


	










