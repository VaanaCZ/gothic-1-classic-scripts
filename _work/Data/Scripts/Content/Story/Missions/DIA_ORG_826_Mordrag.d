// **************************************************
VAR INT MordragKO_PlayerChoseOreBarons;
VAR INT MordragKO_PlayerChoseThorus;
VAR INT MordragKO_HauAb;
var int MordragKO_StayAtNC;
// **************************************************

// **************************************************
//						 EXIT 
// **************************************************

instance  Org_826_Mordrag_Exit (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 999;
	condition	= Org_826_Mordrag_Exit_Condition;
	information	= Org_826_Mordrag_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_826_Mordrag_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  Org_826_Mordrag_Greet (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 1;
	condition	= Org_826_Mordrag_Greet_Condition;
	information	= Org_826_Mordrag_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Greet_Info()
{
	AI_Output (self, other,"Org_826_Mordrag_Greet_11_00"); //�Hola, reci�n llegado! Yo soy Mordrag. Deber�as recordar ese nombre; �puedes comprarme a buen precio cualquier tipo de mercanc�a!
};

// **************************************************
//					Handeln
// **************************************************
var int Mordrag_Traded;
// **************************************************

instance  Org_826_Mordrag_Trade (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 800;
	condition	= Org_826_Mordrag_Trade_Condition;
	information	= Org_826_Mordrag_Trade_Info;
	permanent	= 1;
	description = "Mu�strame tus mercanc�as.";
	trade		= 1;
};                       

func int  Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Trade_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Trade_15_00"); //D�jame ver tu mercanc�a.
	AI_Output (self, other,"Org_826_Mordrag_Trade_11_01"); //Elige algo.
	if	(Mordrag_Traded==0)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"El bandido Mordrag vende art�culos robados en el mercado.");
		Mordrag_Traded=1;
	};
};

// **************************************************
//					KURIER F�R MAGIER
// **************************************************

instance  Org_826_Mordrag_Courier (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Courier_Condition;
	information	= Org_826_Mordrag_Courier_Info;
	permanent	= 1;
	description = "�De verdad eres el mensajero de los magos?";
};                       

FUNC int  Org_826_Mordrag_Courier_Condition()
{
	if	Thorus_MordragMageMessenger 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Courier_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_00"); //�Eres de verdad el mensajero de los magos?
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_01"); //Y si lo fuera, �qu�?
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_02"); //Quiero tener una oportunidad de hablar con los magos. Tengo que entrar en el castillo.
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_03"); //Los mensajeros de los magos portan sellos que les permiten entrar en el castillo. Si t� fueras de los nuestros, podr�as tener uno de esos sellos.
};

// **************************************************
//					DU HAST EIN PROBLEM
// **************************************************

instance  Org_826_Mordrag_Problem (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Problem_Condition;
	information	= Org_826_Mordrag_Problem_Info;
	permanent	= 0;
	description = "Tienes un problema.";
};                       

FUNC int  Org_826_Mordrag_Problem_Condition()
{
	if Thorus_MordragKo == LOG_RUNNING 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Problem_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_00"); //Tienes un problema.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_01"); //�De verdad? �Cu�l?
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_02"); //Por aqu� hay gente que quiere librarse de ti.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_03"); //�De verdad? Entonces puedes decirles que deber�an enviar a alguien para hacer realidad sus deseos.
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_04"); //�Qu� te hace estar seguro de que no soy yo?
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_05"); //Porque creo que eres demasiado listo para eso, muchacho. Pronto comprender�s que hay cosas mejores que trabajar para G�mez.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_06"); //En el Campamento Nuevo tambi�n necesitamos gente capaz y nadie te dice lo que tienes que hacer.
};

// **************************************************
//					  NCInfo
// **************************************************

instance  Org_826_Mordrag_NCInfo(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_NCInfo_Condition;
	information	= Org_826_Mordrag_NCInfo_Info;
	permanent	= 0;
	description = "Cu�ntame m�s cosas del Campamento Nuevo.";
};                       

FUNC int  Org_826_Mordrag_NCInfo_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_NCInfo_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_00"); //Cu�ntame m�s cosas del Campamento Nuevo.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_01"); //Es el campamento en el que hay m�s libertad de toda la colonia. No tenemos ning�n Magnate del Mineral o Gur� que nos d� �rdenes.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_02"); //Tenemos nuestra propia mina. �Pero el mineral que se produce ah� no va a manos de ning�n maldito rey!
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_03"); //�Para qu� se utiliza entonces?
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_04"); //Nuestros magos est�n trabajando en un plan para escaparnos de aqu�. Todo el mineral se recoge para ese plan.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_05"); //Mientras G�mez y su gente andan haciendo el vago, nosotros trabajamos como negros para alcanzar la libertad; eso es lo que pasa.
};

// **************************************************
//					JoinNewcamp
// **************************************************

instance  Org_826_Mordrag_JoinNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_JoinNewcamp_Condition;
	information	= Org_826_Mordrag_JoinNewcamp_Info;
	permanent	= 0;
	description = "Y si quiero ingresar en el Campamento Nuevo...";//k�nntest du mir dabei helfen... ZU LANG
};                       

FUNC int  Org_826_Mordrag_JoinNewcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_JoinNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_JoinNewcamp_15_00"); //Y si quisiera unirme al Campamento Nuevo... �podr�as ayudarme?
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_01"); //�Si lo dices en serio podemos ir ahora mismo! Puedo llevarte a ver a Lares. �l es el l�der de nuestro grupo.
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_02"); //Pero si prefieres expulsarme a la fuerza del campamento... �vamos, int�ntalo!
};


instance  Org_826_Mordrag_GotoNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_GotoNewcamp_Condition;
	information	= Org_826_Mordrag_GotoNewcamp_Info;
	permanent	= 0;
	description = "�Vayamos al Campamento Nuevo!";
};                       

FUNC int  Org_826_Mordrag_GotoNewcamp_Condition()
{
	if (Npc_KnowsInfo(hero,Org_826_Mordrag_JoinNewcamp))
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoNewcamp_15_00"); //�Vamos al Campamento Nuevo!
	AI_Output (self, other,"Org_826_Mordrag_GotoNewcamp_11_01"); //�De acuerdo! S�gueme.
	
	Mordrag_GotoNC_Day = Wld_GetDay();
	
	AI_StopProcessInfos	(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);	// damit hat der Spieler einen Freischlag. Nach dem zweiten wehrt sich Mordrag!
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Mordrag ha aceptado mostrarme el camino hasta el Campamento Nuevo. �Espero que no sea una trampa!");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine		(self,"GUIDE");
};

// **************************************************
//				AM NEWCMAP ANGEKOMMEN
// **************************************************

instance  Org_826_Mordrag_AtNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_AtNewcamp_Condition;
	information	= Org_826_Mordrag_AtNewcamp_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_AtNewcamp_Condition()
{
	if 	( Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_07_21") ) 
	{
		self.flags	= 0;
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_AtNewcamp_Info()
{
	if (Mordrag_GotoNC_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_00"); //Bueno, ya hemos llegado.
	}
	else
	{
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //�Pens� que no llegar�as nunca! Bueno, no importa, �aqu� estamos!
	};
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_01"); //Cuando atravieses la puerta, habr�s entrado en el Campamento Nuevo. Habla con Lares. �l te ayudar�. Dale esto. Es un anillo precioso.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_02"); //Es tu billete para ver a Lares. Necesitas una buena raz�n para que te permitan verle.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_03"); //Bueno, pens�ndolo bien, creo que me quedar� aqu� un tiempo. Por ahora ya he ganado suficiente y las cosas se est�n poniendo feas en el Campamento Viejo.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_04"); //Si quieres, ven a verme a la taberna; es la caba�a que hay junto al lago. �Cu�date!
	AI_Output (other, self,"Org_826_Mordrag_AtNewcamp_15_05"); //Hasta pronto.
	
	CreateInvItems  (self, MordragsRing, 1);
	B_GiveInvItems	(self, other, MordragsRing, 1);

	B_GiveXP		(XP_ArrivedWithMordrag);	
	B_LogEntry		(CH1_JoinNC,"Estamos frente a la puerta del Campamento Nuevo. Mordrag me ha dado un anillo que, se supone, debo entregar a Lares, el l�der de los bandidos, si de verdad quiero unirme al Campamento Nuevo. Mordrag quiere quedarse un rato en la taberna del lago.");
	var C_NPC lares; lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar [AIV_FINDABLE]=TRUE;
	
	MordragKO_StayAtNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
//					AUFS MAUL
// **************************************************

instance  Org_826_Mordrag_Fight (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Fight_Condition;
	information	= Org_826_Mordrag_Fight_Info;
	permanent	= 0;
	description = "�El campamento no es lo bastante grande para nosotros dos!";
};                       

FUNC int  Org_826_Mordrag_Fight_Condition()
{
	if ( (Thorus_MordragKo == LOG_RUNNING) && (!Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp)) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Fight_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Fight_15_00"); //�El campamento es demasiado peque�o para los dos!
	AI_Output (self, other,"Org_826_Mordrag_Fight_11_01"); //�Perd�n?
	
	Info_ClearChoices(Org_826_Mordrag_Fight);
	Info_AddChoice   (Org_826_Mordrag_Fight,"�L�rgate de este campamento!",Info_Mordrag_Fight_GetAway);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"�Aqu� no hay lugar para la gente que roba a los Magnates del Mineral!",Info_Mordrag_Fight_OreBarons);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Me manda Thorus. Quiere librarse de ti de una vez por todas.",Info_Mordrag_Fight_Thorus);
};

FUNC VOID Info_Mordrag_Fight_GetAway()
{
	AI_Output (other, self,"Info_Mordrag_Fight_GetAway_15_00"); //�Fuera de este campamento!
	AI_Output (self, other,"Info_Mordrag_Fight_GetAway_11_01"); //�sas son palabras mayores viniendo de un hombre tan peque�o.
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_OreBarons()
{
	AI_Output (other, self,"Info_Mordrag_Fight_OreBarons_15_00"); //�Aqu� no hay lugar para aquellos que roban a los Magnates del Mineral!
	AI_Output (self, other,"Info_Mordrag_Fight_OreBarons_11_01"); //�Oh, te refieres a eso! �Por qu� no lo dijiste antes?
	
	MordragKO_PlayerChoseOreBarons = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_Thorus()
{
	AI_Output (other, self,"Info_Mordrag_Fight_Thorus_15_00"); //Vengo de parte de Thorus. Quiere librarse de ti de una vez por todas.
	AI_Output (self, other,"Info_Mordrag_Fight_Thorus_11_01"); //�De verdad? �Thorus? Eso es cuanto quer�a saber.
	
	MordragKO_PlayerChoseThorus = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

// **************************************************
//					HauAb
// **************************************************

instance  Org_826_Mordrag_HauAb(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_HauAb_Condition;
	information	= Org_826_Mordrag_HauAb_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_HauAb_Condition()
{
	VAR C_NPC Mordrag;
	Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	
	if (Mordrag.aivar[AIV_WASDEFEATEDBYSC] >= 1)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_HauAb_Info()
{
	AI_Output (other, self,"Org_826_HauAb_GotoNewcamp_15_00"); //L�rgate de aqu�.
	
	AI_StopProcessInfos	(self);
	
	MordragKO_HauAb = TRUE;
	
	B_LogEntry    (CH1_MordragKO,"Le he pegado una paliza a Mordrag y le he dicho que no quiero volver a verlo jam�s por el Campamento Viejo.");

	Npc_ExchangeRoutine	(self, "Start");
};
		
// **************************************************
//					GotoKalom
// **************************************************

instance  Org_826_Mordrag_GotoKalom(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalom_Condition;
	information	= Org_826_Mordrag_GotoKalom_Info;
	permanent	= 0;
	description = "Lares tiene un mensaje para ti.";
};                       

FUNC int  Org_826_Mordrag_GotoKalom_Condition()
{
	if 	(Npc_GetTrueGuild(other)!=GIL_ORG)
	&&	(Lares_InformMordrag == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalom_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_00"); //Lares tiene un mensaje para ti.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_01"); //Dime.
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_02"); //Quiere saber qu� es lo que est� pasando en el Campamento de la Secta y que t� lo averig�es.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_03"); //Tengo el presentimiento de que este problema se resolver� solo.

	B_LogEntry	(CH1_JoinNC,"Le he dicho a Mordrag lo que Lares me pidi� que dijera. �ste habl� entre dientes acerca de cosas que se solucionan por s� mismas. �No tengo ni idea de qu� quer�a decir con eso!");
};

// **************************************************
//					GotoKalom - NOW
// **************************************************
	var int Mordrag_GotoKalom;
// **************************************************

instance  Org_826_Mordrag_GotoKalomNOW(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalomNOW_Condition;
	information	= Org_826_Mordrag_GotoKalomNOW_Info;
	permanent	= 0;
	description = "Lares me dijo que te ayudara con los asuntos de esta secta.";
};                       

FUNC int  Org_826_Mordrag_GotoKalomNOW_Condition()
{
	if 	(Npc_GetTrueGuild(other)==GIL_ORG)
	&&	Npc_KnowsInfo(hero,ORG_801_Lares_GotoKalom)
	{
		return TRUE;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalomNOW_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //Lares me dijo que te echara una mano en este asunto de la secta.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //Ves... Sab�a que no ser�a yo quien tendr�a que hacerlo.
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //�Quieres que solucione este asunto yo solo?
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //Estoy seguro de que podr�s hacerlo. Esc�chame: es importante averiguar la verdad acerca de la invocaci�n esa.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //S� que esos chiflados de la secta est�n planeando una gran invocaci�n. Yo no creo en el Durmiente, pero hay una cosa segura:
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //Los Gur�s tienen a su disposici�n una magia de gran poder. As� que es mejor estar al tanto de lo que ocurre. �Me sigues?

	B_LogEntry			(CH1_GotoPsiCamp,"Muy h�bilmente, Mordrag me ha cargado a m� el muerto de espiar el campamento del pantano. Los Gur�s parecen estar preparando una gran invocaci�n, pero debo obtener m�s detalles.");
	B_GiveXP			(XP_AssistMordrag);	
	
	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;
	
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"�Podr�as darme instrucciones m�s concretas?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Ver� lo que puedo hacer.",Org_826_Mordrag_GotoKalomNOW_DoIt);

};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //�Podr�as darme instrucciones m�s precisas?
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //Habla con Lester. Una vez pas� mucho tiempo en el Campamento de la Secta y �l me ech� una mano. Es uno de los buenos.
	B_LogEntry(CH1_GotoPsiCamp,"Seg�n parece, debo hablar con un novicio llamado Lester en el campamento de la Hermandad. Se supone que es de confianza y que ha ayudado a Mordrag en el pasado.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //Ver� qu� puedo hacer.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //En cuanto averig�es sus planes, vuelve a informarme.
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	AI_StopProcessInfos	(self);
};

// **************************************************
//					RUNNING
// **************************************************

instance  Org_826_Mordrag_RUNNING (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_RUNNING_Condition;
	information	= Org_826_Mordrag_RUNNING_Info;
	permanent	= 1;
	description = "Acerca de los asuntos de esa secta...";
};                       

FUNC int  Org_826_Mordrag_RUNNING_Condition()
{
	if (Mordrag_GotoKalom == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_RUNNING_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_RUNNING_15_00"); //Acerca de ese asunto de la secta...
	AI_Output			(self, other,"Org_826_Mordrag_RUNNING_11_01"); //�Qu�?

	if	(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_04"); //La gran invocaci�n ya ha tenido lugar.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_09"); //�No! �Quieres decir que t� tambi�n has participado en su locura?
		}
		else
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_06"); //Su prop�sito es fortalecerse y contactar con el Durmiente mediante una poci�n que elaboran con huevos de reptador de la mina.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_07"); //�Es la monda! Esos chalados no se creen eso de verdad, �no?
		};
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_10"); //Tengo curiosidad por ver el resultado.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_11"); //Yo tambi�n. Av�same cuando los Gur�s hayan acabado de hacer el rid�culo.

		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP			(XP_ReportToMordrag);
		Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_SUCCESS);
		B_LogEntry			(CH1_GotoPsiCamp,"Mordrag se parti� de risa cuando le habl� de los huevos de reptador de mina. Sin embargo, ya no parece demasiado interesado en volver a espiar a los Gur�s. �Dar� el asunto por zanjado!");
	}
	else
	{
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_02"); //Todav�a no he conseguido averiguar nada.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_03"); //Entonces persevera.
	};

/*	
	//SN: Werde nicht gebraucht, da sie nicht zur Kapitel 2-6-Story passen!!!
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_08"); //Ich hab' die Eier bei mir.
		
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_05"); //(sarkastisch) Hab' ich auch gemerkt. Diese verdammten Sektenspinner haben Gomez die alte Mine gekostet. Wird nicht mehr lange dauern, dann stehen seine Gardisten bei UNS vor der T�r, um sich ihr Erz abzuholen...
*/
};
	
	













	




	
