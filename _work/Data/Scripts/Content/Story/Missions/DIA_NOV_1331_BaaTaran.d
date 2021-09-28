// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalTaran_EXIT (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 999;
	condition	= DIA_BaalTaran_EXIT_Condition;
	information	= DIA_BaalTaran_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalTaran_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  DIA_BaalTaran_Greet (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Greet_Condition;
	information	= DIA_BaalTaran_Greet_Info;
	permanent	= 0;
	description = "Soy nuevo aqu�. �Qui�n eres?";
};                       

FUNC int  DIA_BaalTaran_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTaran_Greet_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Greet_15_00"); //Soy nuevo aqu�. �Qui�n eres?
	AI_Output (self, other,"DIA_BaalTaran_Greet_05_01"); //Yo soy Baal Taran de la Hermandad del Durmiente.
};

// **************************************************
//					Was ist Bruderschaft
// **************************************************

instance  DIA_BaalTaran_Bruderschaft (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Bruderschaft_Condition;
	information	= DIA_BaalTaran_Bruderschaft_Info;
	permanent	= 0;
	description = "�Qu� es la Hermandad del Durmiente?";
};                       

FUNC int  DIA_BaalTaran_Bruderschaft_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Bruderschaft_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Bruderschaft_15_00"); //�Qu� es la Hermandad del Durmiente?
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_01"); //Somos una comunidad de creyentes de una nueva fe.
	AI_Output (self, other,"DIA_BaalTaran_Bruderschaft_05_02"); //Nuestro campamento se encuentra al este, en el pantano. He venido a predicar las palabras del Durmiente a forasteros como t�.
};

// **************************************************
//					Wer ist der Schl�fer
// **************************************************

instance  DIA_BaalTaran_Sleeper (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_Sleeper_Condition;
	information	= DIA_BaalTaran_Sleeper_Info;
	permanent	= 0;
	description = "�Qui�n es el Durmiente?";
};                       

FUNC int  DIA_BaalTaran_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Sleeper_15_00"); //�Qui�n es el Durmiente?
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_01"); //El Durmiente es nuestro redentor. Se revel� hace cinco a�os a trav�s de Y'Berion, nuestro maestro.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_02"); //Desde entonces, todos hemos renunciado a los tres dioses. T� tambi�n deber�as hacerlo.
	AI_Output (self, other,"DIA_BaalTaran_Sleeper_05_03"); //Los dioses se quedaron mir�ndonos y sin hacer nada cuando fuimos exiliados a esta prisi�n. Pero el Durmiente nos conducir� a la libertad.
};

// **************************************************
//					Lehre des Schl�fers
// **************************************************

instance  DIA_BaalTaran_Lehre (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Lehre_Condition;
	information	= DIA_BaalTaran_Lehre_Info;
	permanent	= 0;
	description = "H�blame de las ense�anzas del Durmiente.";
};                       

FUNC int  DIA_BaalTaran_Lehre_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Lehre_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Lehre_15_00"); //H�blame de las ense�anzas del Durmiente.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_01"); //EL Durmiente es un ser muy poderoso, tal vez m�s poderoso incluso que Innos, el dios de la luz.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_02"); //Est� con nosotros en esp�ritu. Pero su poder todav�a es limitado. Lleva mil a�os durmiendo, pero se acerca el momento de su despertar.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_03"); //Nos ha elegido para ser testigos de su despertar y para predicar su palabra.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_04"); //As� que esc�chame; las almas de todos los que se unan al Durmiente ser�n inmortales, pero aquellos que est�n contra �l ser�n castigados.
	AI_Output (self, other,"DIA_BaalTaran_Lehre_05_05"); //Sin embargo, el Durmiente es compasivo y env�a pruebas de su poder a aquellos que dudan de �l.
};

// **************************************************
//						Freiheit
// **************************************************

instance  DIA_BaalTaran_Freiheit (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 4;
	condition	= DIA_BaalTaran_Freiheit_Condition;
	information	= DIA_BaalTaran_Freiheit_Info;
	permanent	= 0;
	description = "�Qu� aspecto tendr� el camino hacia la libertad?";
};                       

FUNC int  DIA_BaalTaran_Freiheit_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Freiheit_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Freiheit_15_00"); //�Qu� aspecto tendr� el sendero hacia la libertad?
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_01"); //Estamos preparando una gran invocaci�n del Durmiente en la que todos los novicios juntos establecer�n contacto.
	AI_Output (self, other,"DIA_BaalTaran_Freiheit_05_02"); //En esta invocaci�n, el Durmiente nos revelar� el sendero hacia la libertad.
};

// **************************************************
//						Beweis
// **************************************************

instance  DIA_BaalTaran_Beweis (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 3;
	condition	= DIA_BaalTaran_Beweis_Condition;
	information	= DIA_BaalTaran_Beweis_Info;
	permanent	= 0;
	description = "�C�mo demuestra su poder vuestro dios?";
};                       

FUNC int  DIA_BaalTaran_Beweis_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_Beweis_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_00"); //�C�mo demuestra su poder vuestro dios?
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_01"); //Se dirige a nosotros mediante visiones. Quien escucha su voz deja de dudar de su poder.
	AI_Output (self, other,"DIA_BaalTaran_Beweis_05_02"); //Si tomas la hierba que crece en el pantano, estar�s pr�ximo al Durmiente y podr�s o�rle. Alguna gente incluso ve im�genes.
	AI_Output (other, self,"DIA_BaalTaran_Beweis_15_03"); //Entiendo.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance  DIA_BaalTaran_WayToST (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 1;
	condition	= DIA_BaalTaran_WayToST_Condition;
	information	= DIA_BaalTaran_WayToST_Info;
	permanent	= 0;
	description = "�C�mo llego hasta el campamento de la Hermandad?";
};                       

FUNC int  DIA_BaalTaran_WayToST_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Bruderschaft))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_WayToST_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_WayToST_15_00"); //�C�mo puedo llegar al campamento de la Hermandad?
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_01"); //Estoy ocupado. Pero Baal Parvez tambi�n debe encontrarse en alguna parte de este campamento.
	AI_Output (self, other,"DIA_BaalTaran_WayToST_05_02"); //Est� cerca del mercado, al otro lado del castillo. Creo que incluso tiene una choza all�.

	if (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinPsi, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinPsi, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinPsi,"Un novicio llamado Baal Parvez puede llevarme hasta el campamento del pantano de la Hermandad. Est� en la plaza del mercado que hay tras el castillo del Campamento Viejo.");
};


// **************************************************
//					Will in die BURG
// **************************************************

instance  DIA_BaalTaran_IntoCastle (C_INFO)
{
	npc			= NOV_1331_BaalTaran;
	nr			= 10;
	condition	= DIA_BaalTaran_IntoCastle_Condition;
	information	= DIA_BaalTaran_IntoCastle_Info;
	permanent	= 1;
	description = "Tengo que entrar en el castillo. �Puedes ayudarme?";
};                       

FUNC int  DIA_BaalTaran_IntoCastle_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalTaran_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTaran_IntoCastle_Info()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_15_00"); //Necesito entrar en el castillo. �Puedes ayudarme?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_01"); //Me temo que no, hermano. Los �nicos de nosotros que pueden entrar en el castillo son aquellos que le suministran la hierba a G�mez.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_02"); //Recogemos hierba del pantano y vendemos parte al Campamento Viejo, a cambio de mercanc�as del mundo exterior.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_03"); //Si fueras uno de los mensajeros que trabajan para Cor Kalorn, podr�as entrar en el castillo. Pero para eso tendr�as que ser uno de nosotros.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_05_04"); //Pero, �para qu� quieres entrar en el castillo?
	
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Quiero reunirme con alguien all�.",DIA_BaalTaran_IntoCastle_MeetSomeone);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"Tengo una carta para el Gran Mago del C�rculo de Fuego.",DIA_BaalTaran_IntoCastle_Letter);
};

func void DIA_BaalTaran_IntoCastle_MeetSomeone()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_MeetSomeone_15_00"); //Quiero ver a alguien en el interior.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_MeetSomeone_05_01"); //�De verdad? �A qui�n? �Y por qu� no te limitas a esperar a que salga?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"No es asunto tuyo.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"�l es uno de los magos.",DIA_BaalTaran_IntoCastle_Mage);
};

func void DIA_BaalTaran_IntoCastle_Letter()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Letter_15_00"); //Tengo una carta para al gran Mago del C�rculo del Fuego.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_01"); //�S�? �Y de d�nde la has sacado? Los magos te la dieron antes de arrojarte aqu�, �no?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_02"); //Eres un est�pido al irlo contando por ah�. Pero no te preocupes, no se lo dir� a nadie.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_03"); //Hazte un favor a ti mismo y no se lo digas a nadie m�s. �La gente de por aqu� te cortar�a la garganta por algo as�!
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Letter_05_04"); //A la mayor�a de la gente le gustar�a ganarse la recompensa que hay por llevar un mensaje del mundo exterior.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};
//-----------------------------------------
func void DIA_BaalTaran_IntoCastle_Mage()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Mage_15_00"); //Es uno de los magos.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_01"); //�Oh! Bueno, pues nunca salen del castillo. Vas a tener que entrar.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Mage_05_02"); //De todos modos, �qu� quieres de ellos? �Magia o runas? �O pociones?
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"No es asunto tuyo.",DIA_BaalTaran_IntoCastle_ForgetIt);
	Info_AddChoice		(DIA_BaalTaran_IntoCastle,"De acuerdo.",DIA_BaalTaran_IntoCastle_Exactly);
};

func void DIA_BaalTaran_IntoCastle_ForgetIt()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_ForgetIt_15_00"); //Eso a ti no te importa.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_ForgetIt_05_01"); //Vale, hombre. S�lo quer�a ayudar.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle );
};

func void DIA_BaalTaran_IntoCastle_Exactly()
{
	AI_Output (other, self,"DIA_BaalTaran_IntoCastle_Exactly_15_00"); //Claro.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_01"); //�Lo sab�a! �para qu� si no iba a querer ver a los magos un tipo como t�?
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_02"); //Puedo darte un buen consejo. Olv�date de los magos. Cobran demasiadas pepitas por sus cosas.
	AI_Output (self, other,"DIA_BaalTaran_IntoCastle_Exactly_05_03"); //Las runas m�gicas y las pociones son m�s baratas en nuestro campamento.
	Info_ClearChoices	(DIA_BaalTaran_IntoCastle);
};
