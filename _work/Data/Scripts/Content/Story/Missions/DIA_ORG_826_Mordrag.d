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
//					Erste Begrüssung
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
	AI_Output (self, other,"Org_826_Mordrag_Greet_11_00"); //¡Hola, recién llegado! Yo soy Mordrag. Deberías recordar ese nombre; ¡puedes comprarme a buen precio cualquier tipo de mercancía!
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
	description = "Muéstrame tus mercancías.";
	trade		= 1;
};                       

func int  Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Trade_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Trade_15_00"); //Déjame ver tu mercancía.
	AI_Output (self, other,"Org_826_Mordrag_Trade_11_01"); //Elige algo.
	if	(Mordrag_Traded==0)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"El bandido Mordrag vende artículos robados en el mercado.");
		Mordrag_Traded=1;
	};
};

// **************************************************
//					KURIER FÜR MAGIER
// **************************************************

instance  Org_826_Mordrag_Courier (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Courier_Condition;
	information	= Org_826_Mordrag_Courier_Info;
	permanent	= 1;
	description = "¿De verdad eres el mensajero de los magos?";
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
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_00"); //¿Eres de verdad el mensajero de los magos?
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_01"); //Y si lo fuera, ¿qué?
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_02"); //Quiero tener una oportunidad de hablar con los magos. Tengo que entrar en el castillo.
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_03"); //Los mensajeros de los magos portan sellos que les permiten entrar en el castillo. Si tú fueras de los nuestros, podrías tener uno de esos sellos.
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
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_01"); //¿De verdad? ¿Cuál?
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_02"); //Por aquí hay gente que quiere librarse de ti.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_03"); //¿De verdad? Entonces puedes decirles que deberían enviar a alguien para hacer realidad sus deseos.
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_04"); //¿Qué te hace estar seguro de que no soy yo?
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_05"); //Porque creo que eres demasiado listo para eso, muchacho. Pronto comprenderás que hay cosas mejores que trabajar para Gómez.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_06"); //En el Campamento Nuevo también necesitamos gente capaz y nadie te dice lo que tienes que hacer.
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
	description = "Cuéntame más cosas del Campamento Nuevo.";
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
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_00"); //Cuéntame más cosas del Campamento Nuevo.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_01"); //Es el campamento en el que hay más libertad de toda la colonia. No tenemos ningún Magnate del Mineral o Gurú que nos dé órdenes.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_02"); //Tenemos nuestra propia mina. ¡Pero el mineral que se produce ahí no va a manos de ningún maldito rey!
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_03"); //¿Para qué se utiliza entonces?
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_04"); //Nuestros magos están trabajando en un plan para escaparnos de aquí. Todo el mineral se recoge para ese plan.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_05"); //Mientras Gómez y su gente andan haciendo el vago, nosotros trabajamos como negros para alcanzar la libertad; eso es lo que pasa.
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
	description = "Y si quiero ingresar en el Campamento Nuevo...";//könntest du mir dabei helfen... ZU LANG
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
	AI_Output (other, self,"Org_826_Mordrag_JoinNewcamp_15_00"); //Y si quisiera unirme al Campamento Nuevo... ¿podrías ayudarme?
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_01"); //¡Si lo dices en serio podemos ir ahora mismo! Puedo llevarte a ver a Lares. Él es el líder de nuestro grupo.
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_02"); //Pero si prefieres expulsarme a la fuerza del campamento... ¡vamos, inténtalo!
};


instance  Org_826_Mordrag_GotoNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_GotoNewcamp_Condition;
	information	= Org_826_Mordrag_GotoNewcamp_Info;
	permanent	= 0;
	description = "¡Vayamos al Campamento Nuevo!";
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
	AI_Output (other, self,"Org_826_Mordrag_GotoNewcamp_15_00"); //¡Vamos al Campamento Nuevo!
	AI_Output (self, other,"Org_826_Mordrag_GotoNewcamp_11_01"); //¡De acuerdo! Sígueme.
	
	Mordrag_GotoNC_Day = Wld_GetDay();
	
	AI_StopProcessInfos	(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);	// damit hat der Spieler einen Freischlag. Nach dem zweiten wehrt sich Mordrag!
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Mordrag ha aceptado mostrarme el camino hasta el Campamento Nuevo. ¡Espero que no sea una trampa!");

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
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //¡Pensé que no llegarías nunca! Bueno, no importa, ¡aquí estamos!
	};
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_01"); //Cuando atravieses la puerta, habrás entrado en el Campamento Nuevo. Habla con Lares. Él te ayudará. Dale esto. Es un anillo precioso.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_02"); //Es tu billete para ver a Lares. Necesitas una buena razón para que te permitan verle.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_03"); //Bueno, pensándolo bien, creo que me quedaré aquí un tiempo. Por ahora ya he ganado suficiente y las cosas se están poniendo feas en el Campamento Viejo.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_04"); //Si quieres, ven a verme a la taberna; es la cabaña que hay junto al lago. ¡Cuídate!
	AI_Output (other, self,"Org_826_Mordrag_AtNewcamp_15_05"); //Hasta pronto.
	
	CreateInvItems  (self, MordragsRing, 1);
	B_GiveInvItems	(self, other, MordragsRing, 1);

	B_GiveXP		(XP_ArrivedWithMordrag);	
	B_LogEntry		(CH1_JoinNC,"Estamos frente a la puerta del Campamento Nuevo. Mordrag me ha dado un anillo que, se supone, debo entregar a Lares, el líder de los bandidos, si de verdad quiero unirme al Campamento Nuevo. Mordrag quiere quedarse un rato en la taberna del lago.");
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
	description = "¡El campamento no es lo bastante grande para nosotros dos!";
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
	AI_Output (other, self,"Org_826_Mordrag_Fight_15_00"); //¡El campamento es demasiado pequeño para los dos!
	AI_Output (self, other,"Org_826_Mordrag_Fight_11_01"); //¿Perdón?
	
	Info_ClearChoices(Org_826_Mordrag_Fight);
	Info_AddChoice   (Org_826_Mordrag_Fight,"¡Lárgate de este campamento!",Info_Mordrag_Fight_GetAway);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"¡Aquí no hay lugar para la gente que roba a los Magnates del Mineral!",Info_Mordrag_Fight_OreBarons);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Me manda Thorus. Quiere librarse de ti de una vez por todas.",Info_Mordrag_Fight_Thorus);
};

FUNC VOID Info_Mordrag_Fight_GetAway()
{
	AI_Output (other, self,"Info_Mordrag_Fight_GetAway_15_00"); //¡Fuera de este campamento!
	AI_Output (self, other,"Info_Mordrag_Fight_GetAway_11_01"); //Ésas son palabras mayores viniendo de un hombre tan pequeño.
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_OreBarons()
{
	AI_Output (other, self,"Info_Mordrag_Fight_OreBarons_15_00"); //¡Aquí no hay lugar para aquellos que roban a los Magnates del Mineral!
	AI_Output (self, other,"Info_Mordrag_Fight_OreBarons_11_01"); //¡Oh, te refieres a eso! ¿Por qué no lo dijiste antes?
	
	MordragKO_PlayerChoseOreBarons = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_Thorus()
{
	AI_Output (other, self,"Info_Mordrag_Fight_Thorus_15_00"); //Vengo de parte de Thorus. Quiere librarse de ti de una vez por todas.
	AI_Output (self, other,"Info_Mordrag_Fight_Thorus_11_01"); //¿De verdad? ¿Thorus? Eso es cuanto quería saber.
	
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
	AI_Output (other, self,"Org_826_HauAb_GotoNewcamp_15_00"); //Lárgate de aquí.
	
	AI_StopProcessInfos	(self);
	
	MordragKO_HauAb = TRUE;
	
	B_LogEntry    (CH1_MordragKO,"Le he pegado una paliza a Mordrag y le he dicho que no quiero volver a verlo jamás por el Campamento Viejo.");

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
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_02"); //Quiere saber qué es lo que está pasando en el Campamento de la Secta y que tú lo averigües.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_03"); //Tengo el presentimiento de que este problema se resolverá solo.

	B_LogEntry	(CH1_JoinNC,"Le he dicho a Mordrag lo que Lares me pidió que dijera. Éste habló entre dientes acerca de cosas que se solucionan por sí mismas. ¡No tengo ni idea de qué quería decir con eso!");
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
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //Ves... Sabía que no sería yo quien tendría que hacerlo.
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //¿Quieres que solucione este asunto yo solo?
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //Estoy seguro de que podrás hacerlo. Escúchame: es importante averiguar la verdad acerca de la invocación esa.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //Sé que esos chiflados de la secta están planeando una gran invocación. Yo no creo en el Durmiente, pero hay una cosa segura:
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //Los Gurús tienen a su disposición una magia de gran poder. Así que es mejor estar al tanto de lo que ocurre. ¿Me sigues?

	B_LogEntry			(CH1_GotoPsiCamp,"Muy hábilmente, Mordrag me ha cargado a mí el muerto de espiar el campamento del pantano. Los Gurús parecen estar preparando una gran invocación, pero debo obtener más detalles.");
	B_GiveXP			(XP_AssistMordrag);	
	
	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;
	
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"¿Podrías darme instrucciones más concretas?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Veré lo que puedo hacer.",Org_826_Mordrag_GotoKalomNOW_DoIt);

};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //¿Podrías darme instrucciones más precisas?
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //Habla con Lester. Una vez pasé mucho tiempo en el Campamento de la Secta y él me echó una mano. Es uno de los buenos.
	B_LogEntry(CH1_GotoPsiCamp,"Según parece, debo hablar con un novicio llamado Lester en el campamento de la Hermandad. Se supone que es de confianza y que ha ayudado a Mordrag en el pasado.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //Veré qué puedo hacer.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //En cuanto averigües sus planes, vuelve a informarme.
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
	AI_Output			(self, other,"Org_826_Mordrag_RUNNING_11_01"); //¿Qué?

	if	(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_04"); //La gran invocación ya ha tenido lugar.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_09"); //¡No! ¿Quieres decir que tú también has participado en su locura?
		}
		else
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_06"); //Su propósito es fortalecerse y contactar con el Durmiente mediante una poción que elaboran con huevos de reptador de la mina.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_07"); //¡Es la monda! Esos chalados no se creen eso de verdad, ¿no?
		};
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_10"); //Tengo curiosidad por ver el resultado.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_11"); //Yo también. Avísame cuando los Gurús hayan acabado de hacer el ridículo.

		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP			(XP_ReportToMordrag);
		Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_SUCCESS);
		B_LogEntry			(CH1_GotoPsiCamp,"Mordrag se partió de risa cuando le hablé de los huevos de reptador de mina. Sin embargo, ya no parece demasiado interesado en volver a espiar a los Gurús. ¡Daré el asunto por zanjado!");
	}
	else
	{
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_02"); //Todavía no he conseguido averiguar nada.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_03"); //Entonces persevera.
	};

/*	
	//SN: Werde nicht gebraucht, da sie nicht zur Kapitel 2-6-Story passen!!!
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_08"); //Ich hab' die Eier bei mir.
		
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_05"); //(sarkastisch) Hab' ich auch gemerkt. Diese verdammten Sektenspinner haben Gomez die alte Mine gekostet. Wird nicht mehr lange dauern, dann stehen seine Gardisten bei UNS vor der Tür, um sich ihr Erz abzuholen...
*/
};
	
	













	




	
