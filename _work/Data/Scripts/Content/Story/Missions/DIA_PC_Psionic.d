// **************************************************
//						EXIT 
// **************************************************
instance  PC_Psionic_Exit (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  999;
	condition	=  PC_Psionic_Exit_Condition;
	information	=  PC_Psionic_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description =	DIALOG_ENDE;
};                       

FUNC int  PC_Psionic_Exit_Condition()
{
	return 1;
};

FUNC VOID  PC_Psionic_Exit_Info()
{
	if (self.aivar[AIV_PARTYMEMBER])
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_01"); //¡Vamos!
	}
	else
	{
		AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); //¡Que el Durmiente te proteja!
	};
	
	AI_StopProcessInfos	( self );
};

// **************************************************
//			SAKRILEG! Meister angesprochen
// **************************************************
instance  DIA_Lester_Sakrileg (C_INFO)
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Sakrileg_Condition;
	information	= DIA_Lester_Sakrileg_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_Sakrileg_Condition()
{
	if (BaalNamib_Sakrileg == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Sakrileg_Info()
{
	AI_Output (self, other,"DIA_Lester_Sakrileg_05_00"); //¡Le has dirigido la palabra a un Gurú! ¡No vuelvas a hacerlo! ¡Es un sacrilegio! Si uno de los maestros quiere hablar contigo, será ÉL quien te hable a TI.
};

// **************************************************
//						Hallo
// **************************************************

instance  DIA_Lester_Hallo (C_INFO)
{
	npc			=  PC_Psionic;
	nr			=  1;
	condition	=  DIA_Lester_Hallo_Condition;
	information	=  DIA_Lester_Hallo_Info;
	permanent	=  0;
	description = "¿Quién eres?";
};                       

FUNC int  DIA_Lester_Hallo_Condition()
{
	if	(Kapitel < 3)
	{
		return TRUE;
	};
};

FUNC VOID  DIA_Lester_Hallo_Info()
{
	AI_Output (other, self,"DIA_Lester_Hallo_15_00"); //¿Quién eres?
	AI_Output (self, other,"DIA_Lester_Hallo_05_01"); //Soy Lester. Me ocupo de los forasteros que llegan aquí.
	if (BaalNamib_Sakrileg == FALSE)
	{
		AI_Output (self, other,"DIA_Lester_Hallo_05_02"); //Tienes suerte de no haberle hablado a Baal Namib. No se permite que los forasteros hablen a los Gurús.
	};
};

// **************************************************
//				Will mit Meister reden
// **************************************************

instance  DIA_Lester_WannaTalkToMaster (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaTalkToMaster_Condition;
	information	= DIA_Lester_WannaTalkToMaster_Info;
	permanent	= 0;
	description	= "Pero quiero hablar con tu señor.";
};                       

FUNC int  DIA_Lester_WannaTalkToMaster_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) || Npc_KnowsInfo(hero,DIA_Lester_Sakrileg) )
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&  (!Npc_KnowsInfo(hero,DIA_Lester_ShowHallo))
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaTalkToMaster_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaTalkToMaster_15_00"); //Pero quiero hablar con tu maestro.
	AI_Output (self, other,"DIA_Lester_WannaTalkToMaster_05_01"); //¡Olvídalo! Estoy seguro de no poder ayudarte con ninguno de tus problemas.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_CampInfo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_CampInfo_Condition;
	information	= DIA_Lester_CampInfo_Info;
	permanent	= 1;
	description	= "Háblame del Campamento.";
};                       

FUNC int  DIA_Lester_CampInfo_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo) )
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_CampInfo_Info()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_15_00"); //Háblame del Campamento.
	AI_Output (self, other,"DIA_Lester_CampInfo_05_01"); //¿Qué es lo que quieres saber?
	Info_Clearchoices (DIA_Lester_CampInfo);
	Info_Addchoice (DIA_Lester_CampInfo,DIALOG_BACK,DIA_Lester_CampInfo_BACK); 
	Info_Addchoice (DIA_Lester_CampInfo,"Háblame de las cofradías.",DIA_Lester_CampInfo_GIL);
	Info_Addchoice (DIA_Lester_CampInfo,"¿Qué puedes decirme del Durmiente?",DIA_Lester_CampInfo_SLEEPER);
	Info_Addchoice (DIA_Lester_CampInfo,"¿Qué sabes de la hierba?",DIA_Lester_CampInfo_HERB);
};
func void DIA_Lester_CampInfo_BACK()
{
	Info_Clearchoices (DIA_Lester_CampInfo);
};

func void DIA_Lester_CampInfo_GIL()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_GIL_15_00"); //Háblame de las cofradías.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_01"); //Los Gurús son la cofradía más importante. Son el espíritu de este campamento, ya que poseen un gran poder. Los templarios utilizan sus poderes espirituales para combatir.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_02"); //Tienen una fuerza de voluntad indomable. No deberías enfrentarte NUNCA a uno de ellos. Por lo que a mí respecta, soy un novicio. Rezamos al Durmiente y hacemos todo el trabajo del Campamento.
	AI_Output (self, other,"DIA_Lester_CampInfo_GIL_05_03"); //A algunos novicios se les permite pasar a formar parte de los Gurús, pero para llegar tan lejos necesitas estudiar durante muchos años.
};
func void DIA_Lester_CampInfo_SLEEPER()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_00"); //¿Qué puedes contarme acerca del Durmiente?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_01"); //El Durmiente es una criatura divina. Proporciona visiones; al menos a los Gurús.
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_02"); //Le rezamos porque él nos dará la libertad.
	AI_Output (other, self,"DIA_Lester_CampInfo_SLEEPER_15_03"); //¿Y tú crees eso?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_04"); //Oye, llevo dos años dentro de la barrera. ¿Sabes lo largos que pueden ser dos años?
	AI_Output (self, other,"DIA_Lester_CampInfo_SLEEPER_05_05"); //¡No puedes imaginarte lo que estoy dispuesto a creer y hacer para poder salir de aquí!
};
func void DIA_Lester_CampInfo_HERB()
{
	AI_Output (other, self,"DIA_Lester_CampInfo_HERB_15_00"); //¿Qué sabes acerca de la hierba?
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_01"); //Bueno, la hierba se produce en el pantano. Claro que hay que procesarla antes de poder fumarla. De eso nos encargamos los novicios.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_02"); //Las hierbas tienen un efecto relajante y tranquilizante. Te ayudan a concentrarte en las cosas esenciales y estimulan tus percepciones.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_03"); //Las cambiamos por mercancías al Campamento Viejo y también las utilizamos para conseguir nuevos miembros.
	AI_Output (self, other,"DIA_Lester_CampInfo_HERB_05_04"); //El resultado es, por supuesto, que algunos se unen a nosotros nada más que por la hierba. Bueno, al menos nos ayudan con los trabajos del Campamento.
};

// **************************************************
//					Wanna Join
// **************************************************

instance  DIA_Lester_WannaJoin (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WannaJoin_Condition;
	information	= DIA_Lester_WannaJoin_Info;
	permanent	= 0;
	description	= "¡Quiero convertirme en miembro de la Hermandad!";
};                       

FUNC int  DIA_Lester_WannaJoin_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WannaJoin_Info()
{
	AI_Output (other, self,"DIA_Lester_WannaJoin_15_00"); //¡Quiero convertirme en miembro de la Hermandad!
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_01"); //Cor Kalorn es quien decide si estás preparado para unirte a la Hermandad.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_02"); //Pero escucha los consejos de los otros Gurús. Ése de ahí, Baal Namib, es uno de ellos.
	AI_Output (self, other,"DIA_Lester_WannaJoin_05_03"); //Primero tienes que demostrar ser digno y luego uno de los Gurús te enviará a ver a Cor Kalorn.
};

// **************************************************
//					Lager-Infos
// **************************************************

instance  DIA_Lester_HowProofWorthy (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_HowProofWorthy_Condition;
	information	= DIA_Lester_HowProofWorthy_Info;
	permanent	= 0;
	description	= "¿Cómo va a funcionar si ninguno de los Gurús quiere hablar conmigo?";
};                       

FUNC int  DIA_Lester_HowProofWorthy_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_WannaJoin))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_HowProofWorthy_Info()
{
	AI_Output (other, self,"DIA_Lester_HowProofWorthy_15_00"); //¿Cómo se supone que funciona eso si ninguno de los Gurús habla conmigo?
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_01"); //Puede que no lo parezca, pero los Gurús observan todo lo que uno hace en el Campamento.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_02"); //Si creen que mereces convertirte en miembro de la comunidad, te lo dirán.
	AI_Output (self, other,"DIA_Lester_HowProofWorthy_05_03"); //Seguro que en el Campamento encontrarás oportunidades de demostrar que eres digno.

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	B_LogEntry			(CH1_JoinPsi,"Si quiero unirme a la Hermandad del campamento del pantano, tengo que impresionar a los Gurús. Por desgracia, no hablan con la gente nueva. Lester, el novicio, me ha dicho que aun así me observan, y que debo probar mi valía ante ellos. ¡No tengo la menor idea de cómo hacer eso! Mejor voy a echar un buen vistazo por el campamento del pantano.");

};

// **************************************************
//				WEIT WEG von BaalNamib
// **************************************************
	var int Lester_Show;
// **************************************************

instance  DIA_Lester_WeitWeg (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 2;
	condition	= DIA_Lester_WeitWeg_Condition;
	information	= DIA_Lester_WeitWeg_Info;
	permanent	= 0;
	description	= "¿Cómo puedo hacer que tu señor hable conmigo?";
};                       

FUNC int  DIA_Lester_WeitWeg_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) > 1000)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_WeitWeg_Info()
{
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_00"); //¿Cómo puedo hacer que tu maestro me hable?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_01"); //Tienes que saber lo que él quiere oír.
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_02"); //¿Y qué es lo que quiere oír?
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_03"); //Escucha. La próxima vez que estemos con él, dirígete a mí y mantendremos una pequeña charla.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_04"); //Baal Namib está preocupado porque muchos de los novicios no sólo le rezan al Durmiente, sino que también rezan a los viejos dioses.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_05"); //Me dirás que has renunciado a los viejos dioses y que, en el futuro, no rezarás mas que al Durmiente.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_06"); //Entonces yo te preguntaré por qué has tomado esa decisión y me dirás que tuviste una visión en la que el Durmiente te llamó.
	AI_Output (self, other,"DIA_Lester_WeitWeg_05_07"); //Eso le interesará. ¿Crees que podrás hacerlo?
	AI_Output (other, self,"DIA_Lester_WeitWeg_15_08"); //Sin problemas.
	
	B_LogEntry	(CH1_JoinPsi,"Para impresionar a Baal Namib, debo dirigirme a Lester cerca del Gurú y hablar de antiguos dioses y del Durmiente.");

	Lester_Show = TRUE;
};

// **************************************************
//					SHOW - Hallo
// **************************************************

instance  DIA_Lester_ShowHallo (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_ShowHallo_Condition;
	information	= DIA_Lester_ShowHallo_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Lester_ShowHallo_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if	(Npc_GetDistToNpc(other,namib) < 500)
	&&	(BaalNamib_Ansprechbar==FALSE)
	&&	(Lester_Show == TRUE)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_ShowHallo_Info()
{
	AI_Output (self, other,"DIA_Lester_ShowHallo_05_00"); //¡AH! ¡ME ALEGRA VOLVER A VERTE! ¿CÓMO TE VAN LAS COSAS?
};

// **************************************************
//						SHOW
// **************************************************

instance  DIA_Lester_Show (C_INFO) //E2
{
	npc			= PC_Psionic;
	nr			= 1;
	condition	= DIA_Lester_Show_Condition;
	information	= DIA_Lester_Show_Info;
	permanent	= 0;
	description	= "He renunciado a los viejos dioses.";
};                       

FUNC int  DIA_Lester_Show_Condition()
{
	var C_NPC namib; namib = Hlp_GetNpc(Gur_1204_BaalNamib);
	if ( (Npc_GetDistToNpc(other,namib) < 500) && (BaalNamib_Ansprechbar==FALSE) && (Lester_Show == TRUE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_Show_Info()
{
	AI_Output (other, self,"DIA_Lester_Show_15_00"); //HE RENUNCIADO A LOS VIEJOS DIOSES.
	AI_Output (self, other,"DIA_Lester_Show_05_01"); //¿DE VERDAD? ¿QUÉ ES LO QUE TE HA HECHO TOMAR ESA DECISIÓN?
	AI_Output (other, self,"DIA_Lester_Show_15_02"); //HE TENIDO UNA VISIÓN. EL DURMIENTE ME HA HABLADO.
	AI_Output (self, other,"DIA_Lester_Show_05_03"); //¿QUÉ FUE LO QUE TE DIJO?
	AI_Output (other, self,"DIA_Lester_Show_15_04"); //ME DIJO QUE FUERA AL CAMPAMENTO DEL PANTANO Y ME UNIERA A LA HERMANDAD.
	AI_Output (self, other,"DIA_Lester_Show_05_05"); //ERES UN HOMBRE AFORTUNADO, FORASTERO. EL DURMIENTE NO SUELE RECOMPENSAR A MUCHOS DE ESA MANERA.

	BaalNamib_Ansprechbar = TRUE;

	AI_StopProcessInfos(self);
};

// **************************************************
//				GUIDE	Offer
// **************************************************

instance  DIA_Lester_GuideOffer (C_INFO) //E3
{
	npc			= PC_Psionic;
	nr			= 5;
	condition	= DIA_Lester_GuideOffer_Condition;
	information	= DIA_Lester_GuideOffer_Info;
	permanent	= 0;
	description	= "¿Cómo puedo orientarme en el Campamento?";
};

FUNC int  DIA_Lester_GuideOffer_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	&&	(Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID  DIA_Lester_GuideOffer_Info()
{
	AI_Output (other, self,"DIA_Lester_GuideOffer_15_00"); //¿Cómo puedo orientarme aquí, en el Campamento?
	AI_Output (self, other,"DIA_Lester_GuideOffer_05_01"); //Puedo enseñarte los lugares más importantes.
};

// **************************************************
//				FÜHRUNG DURCHS PSI-CAMP
// **************************************************


// -----------UNTERWEGS--------------------  
instance  PC_Psionic_SOON (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_SOON_Condition;
	information	=  PC_Psionic_SOON_Info;
	important	=  0;	
	permanent	=  1;
	description = "¿Ya llegamos?";
};                       

FUNC int  PC_Psionic_SOON_Condition()
{	
	if  (Npc_KnowsInfo (hero,DIA_Lester_GuideOffer))
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_SOON_Info()
{
	AI_Output (other, self,"PC_Psionic_SOON_Info_15_01"); //¿Hemos llegado ya?
	AI_Output (self, other,"PC_Psionic_SOON_Info_05_02"); //Si dejaras de preguntármelo, llegaríamos mucho antes.
	AI_StopProcessInfos	( self );
};
//------ UNTERWEGS IM SUMPFLAGER UND ROUTE ÄNDERN ----------------
instance  PC_Psionic_CHANGE (C_INFO)
{
	npc			=  PC_Psionic;
	condition	=  PC_Psionic_CHANGE_Condition;
	information	=  PC_Psionic_CHANGE_Info;
	important	=  0;	
	permanent	=  1;
	description = "He cambiado de opinión.";
};                       

FUNC int  PC_Psionic_CHANGE_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_Lester_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide >= 1)
	{
		return TRUE;
	};
};
FUNC VOID  PC_Psionic_CHANGE_Info()
{
	AI_Output (other, self,"PC_Psionic_CHANGE_Info_15_01"); //He cambiado de opinión.
	AI_Output (self, other,"PC_Psionic_CHANGE_Info_05_02"); //Supongo que sabes dónde puedes encontrarme.
	AI_StopProcessInfos	( self );
	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");

};

//------------------FÜHRUNG DURCH DAS LAGER
instance  PC_Psionic_GUIDEFIRST (C_INFO)
{
	npc				= PC_Psionic;
	nr				= 5;
	condition		= PC_Psionic_GUIDEFIRST_Condition;
	information		= PC_Psionic_GUIDEFIRST_Info;
	important		= 0;
	permanent		= 1;
	description		= "Indícame el camino..."; 
};

FUNC int  PC_Psionic_GUIDEFIRST_Condition()
{	
	if  Npc_KnowsInfo (hero,DIA_LESTER_GuideOffer)
	&&  (Kapitel < 3)
	&&  (LesterGuide == 0)
	{
		return TRUE;
	};
		

};
FUNC void  PC_Psionic_GUIDEFIRST_Info()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_Info_15_01"); //Muéstrame el camino...
//	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_Info_05_02"); //Klar, wohin willst du?
	
	Info_ClearChoices (PC_Psionic_GUIDEFIRST);
	
	Info_Addchoice (PC_Psionic_GUIDEFIRST, DIALOG_BACK, PC_Psionic_GUIDEFIRST_BACK);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"de vuelta a la puerta principal.",PC_Psionic_GUIDEFIRST_MAINGATE);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"a la herrería.",PC_Psionic_GUIDEFIRST_SMITH);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"al templo.",PC_Psionic_GUIDEFIRST_TEMPEL);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"a los tutores.",PC_Psionic_GUIDEFIRST_TRAIN);
	Info_Addchoice (PC_Psionic_GUIDEFIRST,"al laboratorio alquímico.",PC_Psionic_GUIDEFIRST_HERB);

};  

func void PC_Psionic_GUIDEFIRST_MAINGATE()
{
	Npc_ClearAIQueue	(self);
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
	LesterGuide = 0;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"START");
};

func void PC_Psionic_GUIDEFIRST_SMITH()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_SMITH_Info_15_01"); //...hacia la herrería.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_SMITH_Info_05_02"); //¡Sígueme!
	LesterGuide = 1;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOSMITH");
};

func void PC_Psionic_GUIDEFIRST_TEMPEL()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_15_01"); //...al templo.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TEMPEL_Info_05_02"); //¡Sígueme!
	LesterGuide = 2;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTEMPEL");
};

func void PC_Psionic_GUIDEFIRST_TRAIN()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_TRAIN_Info_15_01"); //...a los tutores.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_TARIN_Info_05_02"); //¡Sígueme!
	LesterGuide = 3;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOTRAIN");
};

func void PC_Psionic_GUIDEFIRST_HERB()
{
	AI_Output (other, self,"PC_Psionic_GUIDEFIRST_HERB_Info_15_01"); //...al laboratorio de alquimia.
	AI_Output (self, other,"PC_Psionic_GUIDEFIRST_HERB_Info_05_02"); //¡Sígueme!
	LesterGuide = 4;
	AI_StopProcessInfos (self);
	Npc_ExchangeRoutine(self,"GUIDETOHERB");
};

func void PC_Psionic_GUIDEFIRST_BACK()
{
	Info_ClearChoices 	(PC_Psionic_GUIDEFIRST);
};

// ***************************** Am Platz der Lehrer ****************************************//
instance  PC_Psionic_TRAIN (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TRAIN_Condition; 
	information		= PC_Psionic_TRAIN_Info;      
	important		= 1;
	permanent		= 1;
	 
};
FUNC int  PC_Psionic_TRAIN_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_PATH_9_4") < 500 )
	&& (LesterGuide == 3)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TRAIN_Info()
{
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_01"); //Allí abajo encontrarás a Baal Cadar. Él es quien enseña a los novicios.
	AI_PointAt(self,"PSI_PATH_9_14");
	AI_StopPointAt (self);
	AI_Output (self, other,"PC_Psionic_TRAIN_Info_05_02"); //Subiendo por la escalera llegarás al campo de entrenamiento de los templarios. Yo te espero aquí. Si te retrasas, me podrás encontrar de nuevo acompañando a Baal Namib en la entrada del Campamento.

	LesterGuide = 0;
	Npc_ExchangeRoutine (self,"START");
	AI_StopProcessInfos (self);
	TA_BeginOverlay		(self);
	TA_Stay			    (00,00,00,55,"PSI_PATH_9_4");
	TA_EndOverlay		(self);	
};  
// ***************************** Am Tempelplatz ****************************************//
instance  PC_Psionic_TEMPEL (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_TEMPEL_Condition; 
	information		= PC_Psionic_TEMPEL_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_TEMPEL_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_TEMPLE_NOVIZE_PR") < 600 )
	&& (LesterGuide == 2)
	{
		return TRUE;
	};

};

FUNC void  PC_Psionic_TEMPEL_Info()
{
	AI_Output (self, other,"PC_Psionic_TEMPEL_Info_05_01"); //¡Ése es el templo! Te espero, pero si tardas demasiado, me volveré con Baal Namib.

	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_TEMPLE_NOVIZE_PR");  
	TA_EndOverlay (self);

};  
// ***************************** An der Schmiede ****************************************//
instance  PC_Psionic_SMITH (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_SMITH_Condition; 
	information		= PC_Psionic_SMITH_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_SMITH_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_SMITH_IN") < 900 )
	&& (LesterGuide == 1)
	{
		return 1;
	};

};

FUNC void  PC_Psionic_SMITH_Info()
{
	AI_Output (self, other,"PC_Psionic_SMITH_Info_05_01"); //¡Ésa es la herrería! Echa un vistazo; yo te esperaré aquí durante una hora y luego me marcho.
	LesterGuide = 0;
	
	
	Npc_ExchangeRoutine(self,"START");
	AI_StopProcessInfos(self);
	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_SMITH_IN");  
	TA_EndOverlay (self);
	
	
};   
// ***************************** Beim Krauthändler ****************************************// 
instance  PC_Psionic_HERB (C_INFO)
{
	npc				= PC_Psionic;                       
	condition		= PC_Psionic_HERB_Condition; 
	information		= PC_Psionic_HERB_Info;      
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  PC_Psionic_HERB_Condition()
{
	if ( Npc_GetDistToWP(self, "PSI_WALK_06") < 800 )
	&& (LesterGuide == 4)
	{
		return TRUE;
	};
};
FUNC void  PC_Psionic_HERB_Info()
{
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_01"); //Si subes por esta escalera, encontrarás a Kalorn, el alquimista. Aquí abajo está Fortuno, el mercader de hierba.
	AI_Output      (self, other,"PC_Psionic_HERB_Info_05_02"); //Te espero aquí. Pero si tardas demasiado me marcharé.
	
	LesterGuide = 0;
	
	Npc_ExchangeRoutine(self,"START");

	AI_StopProcessInfos(self);

	TA_BeginOverlay (self);
	TA_Stay(00,00,01,00,"PSI_32_HUT_EX");  
	TA_EndOverlay (self);
};    





//#####################################################################
//##
//##
//##							KAPITEL 2
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info SEND
//---------------------------------------------------------------------
instance  PC_Psionic_SEND (C_INFO)// PC muss im ersten Kapitel schon mal mit Lester geredet haben 
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_SEND_Condition;
	information		= PC_Psionic_SEND_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_SEND_Condition()
{
	//SN: NICHT auf Kapitel 2 abfragen, Kapitelwechel geschieht erst unten zentral für alle SC-Gilden!!!
	if	(Npc_GetTrueGuild(hero) != GIL_NONE)
	&&	(YBerion_BringFocus != LOG_RUNNING)
	&&	(YBerion_BringFocus != LOG_SUCCESS)
	{
		return 1;
	};
};

func void  PC_Psionic_SEND_Info()
{
	AI_GotoNpc			(self,hero);
	if (Npc_KnowsInfo(hero,DIA_Lester_Hallo))
	{
		AI_Output		(self, other,"PC_Psionic_SEND_Info_05_00"); //Me alegro de verte. Tengo noticias que darte.
		AI_Output		(other, self,"PC_Psionic_SEND_Info_15_01"); //Espero que sean buenas.
	};
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_02"); //Nuestra Hermandad está planeando algo verdaderamente gordo.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_03"); //¿Qué estáis planeando? ¿Escapar?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_04"); //Los Gurús están intentando comunicar con el Durmiente. Pero necesitan una cosa para combinar sus poderes.
	AI_Output			(other, self,"PC_Psionic_SEND_Info_15_05"); //Oh, ¿y?
	AI_Output			(self, other,"PC_Psionic_SEND_Info_05_06"); //Necesitan un objeto mágico; un foco.

	B_Kapitelwechsel	(2);
};  

//---------------------------------------------------------------------
//	Info BROTHERHOOD_TODO
//---------------------------------------------------------------------
instance  PC_Psionic_BROTHERHOOD_TODO (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BROTHERHOOD_TODO_Condition;
	information		= PC_Psionic_BROTHERHOOD_TODO_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Qué tiene que ver esto conmigo?"; 
};

FUNC int  PC_Psionic_BROTHERHOOD_TODO_Condition()
{	
	if Npc_KnowsInfo (hero, PC_Psionic_SEND)
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_BROTHERHOOD_TODO_Info()
{
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_01"); //¿Qué tiene eso que ver conmigo?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_02"); //Habla con Y'Berion. Es el hombre más poderoso aquí. Ésta es la oportunidad de conseguir su aprobación.
	AI_Output			(other, self,"PC_Psionic_BROTHERHOOD_TODO_15_03"); //¿Dónde puedo encontrarle?
	AI_Output			(self, other,"PC_Psionic_BROTHERHOOD_TODO_05_04"); //Ve al templo. Raras veces sale de él. Es probable que entre esas frías ruinas se sienta más cercano al Durmiente.

	Log_CreateTopic		(CH2_Focus,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_Focus,	LOG_RUNNING);
	B_LogEntry			(CH2_Focus,"Lester, el novicio, me ha dicho que Y'Berion está buscando un foco de piedra mágico. El Gurú está dentro de la montaña del templo.");

	var C_NPC YBerion;
	YBerion = Hlp_GetNpc(Gur_1200_YBerion);
	YBerion.aivar[AIV_FINDABLE] = TRUE;
};

//--------------------------------------- 

//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##				
//#####################################################################

//	Suche Nach Dem Fokus In Der Bergfestung

//---------------------------------------------------------------------
//	Info FOLLOWME
//---------------------------------------------------------------------
instance PC_Psionic_FOLLOWME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOLLOWME_Condition;
	information		= PC_Psionic_FOLLOWME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOLLOWME_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_01") < 400 ) 
	&& ( Npc_GetDistToNpc (hero,PC_PSIONIC) <400)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOLLOWME_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_01"); //Eh, ¿qué estás haciendo aquí?
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_02"); //He venido aquí por orden de los Magos del Agua. Estoy buscando unos artefactos mágicos llamados focos de piedra.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_03"); //¿Estás buscando los focos de piedra? En verdad eres valiente.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_04"); //Saturas y los otros magos del Campamento Nuevo quieren utilizarlos para hacer explotar la Barrera y liberarnos así de esta prisión.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_05"); //Lo creeré cuando lo vea con mis propios ojos.
	AI_Output (other, self,"PC_Psionic_FOLLOWME_Info_15_06"); //Yo pienso lo mismo. Pero dime, ¿por qué has venido aquí?
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_07"); //Estoy ponderando si merece la pena hacer una visita al fuerte de montaña.
	AI_Output (self, other,"PC_Psionic_FOLLOWME_Info_05_08"); //Es que allí hay un documento al que me gustaría echarle el guante. Pero, por otro lado, he oído decir que es muy peligroso entrar ahí.
};

// ***************************** INFOS ****************************************//
instance  PC_Psionic_GOLEM (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_GOLEM_Condition;
	information		= PC_Psionic_GOLEM_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Cómo conseguiste pasar junto a esa montaña ambulante?"; 
};

FUNC int  PC_Psionic_GOLEM_Condition()
{	
	if (Npc_KnowsInfo  (hero, PC_Psionic_FOLLOWME))
	&& (!Npc_KnowsInfo  (hero, PC_Psionic_FINISH ))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_GOLEM_Info()
{
	AI_Output (other, self,"PC_Psionic_NORMAL_Info_15_01"); //¿Cómo conseguiste superar a esa montaña viviente?
	AI_Output (self, other,"PC_Psionic_NORMAL_Info_05_02"); //He aprendido mucho de los Gurús. Su magia puede ser extremadamente útil.
};  

//------------GESCHICHTE WARUM LESTER ZUR BERGFESTUNG GEHT--------------------
instance  PC_Psionic_STORY (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_STORY_Condition;
	information		= PC_Psionic_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Qué es ese documento que buscas?"; 
};

FUNC int  PC_Psionic_STORY_Condition()
{	
	if	Npc_KnowsInfo (hero, PC_Psionic_FOLLOWME)  
	 
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_STORY_Info()
{
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_01"); //¿De qué trata este documento que andas buscando?
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_02"); //Hace muchos años, el señor de esta zona vivía en este fuerte de montaña. Estas tierras y las minas estaban bajo su control.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_03"); //Por supuesto, como cualquier otro aristócrata, tenía un documento como prueba de su titularidad. Éste es el documento que busco.
	AI_Output (other, self,"PC_Psionic_STORY_Info_15_04"); //Pero mientras la Barrera nos retenga aquí, no tendrá ningún valor.
	AI_Output (self, other,"PC_Psionic_STORY_Info_05_05"); //Es cierto. Pero si los magos del agua consiguieran destruir la Barrera, el documento podría volver a ser muy valioso.
};  

// ***************************** INFOS ****************************************//
instance  PC_Psionic_COMEWITHME (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEWITHME_Condition;
	information		= PC_Psionic_COMEWITHME_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡Podríamos echar un vistazo al fuerte juntos!"; 
};

FUNC int  PC_Psionic_COMEWITHME_Condition()
{	
	if	Npc_KnowsInfo(hero, PC_Psionic_STORY)
	&&	Npc_KnowsInfo(hero, PC_Psionic_GOLEM)
	{
		return TRUE;
	};
};

FUNC void  PC_Psionic_COMEWITHME_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEWITHME_Info_15_01"); //¡Podríamos echar un vistazo por el fuerte los dos juntos!
	AI_Output (self, other,"PC_Psionic_COMEWITHME_Info_05_02"); //Buena idea. Tú primero; yo te seguiré de cerca.

	Log_CreateTopic		(CH3_Fortress,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_Fortress,	LOG_RUNNING);
	B_LogEntry		(CH3_Fortress,"Me he reunido con el novicio Lester del campamento del pantano frente a una enorme fortaleza, construida dentro de la montaña. Está buscando un documento en el edificio, y se ha unido a mí en mi búsqueda del foco.");

  	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");
	AI_StopProcessInfos	(self);
};  

//--------------------SPIELER KOMMT MIT LESTER ZUM FOKUSPLATZ-------------------
instance PC_Psionic_FOKUSPLACE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FOKUSPLACE_Condition;
	information		= PC_Psionic_FOKUSPLACE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FOKUSPLACE_Condition()
{	
	if ( Npc_GetDistToWp (hero,"LOCATION_19_03_PATH_RUIN7") < 400 ) 
	{
		return TRUE;
	};
};
func void  PC_Psionic_FOKUSPLACE_Info()
{
	AI_GotoNpc(self,hero);
	//AI_PointAt(FOKUSWP)
	AI_Output (self, other,"PC_Psionic_FOKUSPLACE_Info_05_01"); //Mira, parece que el foco que andas buscando está ahí arriba.
	AI_Output (other, self,"PC_Psionic_FOKUSPLACE_Info_15_02"); //Sí, parece una plataforma de foco. Hm... No parece muy fácil de alcanzar.
	AI_StopProcessInfos(self);

	B_LogEntry		(CH3_Fortress,"El foco que ando buscando se encuentra sobre un pedestal. Sin embargo, está demasiado alto como para trepar. Debo encontrar otra manera de llegar hasta el artefacto.");	
	
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE2");
	Wld_InsertNpc		(Harpie,"LOCATION_19_03_ENTRANCE_HARPYE3");
};

// ---------SPIELER WILL ÜBER DIE BRÜCKE OHNE DEN AUFTRAG ERFÜLLT ZU HABEN--------
instance PC_Psionic_COMEBACK (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEBACK_Condition;
	information		= PC_Psionic_COMEBACK_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_COMEBACK_Condition()
{	
	if ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2" ) < 600 )
	&& ( Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	&& (! Npc_HasItems (hero,Focus_3))
	{
		return TRUE;
	};
};
func void  PC_Psionic_COMEBACK_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_COMEBACK_Info_05_01"); //¿Adónde vas? ¡Todavía no hemos acabado aquí!
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;
	Npc_ExchangeRoutine (self,"FORTRESSWAIT");
	AI_StopProcessInfos(self);
};

// -----SPIELER IST VERLETZT UND FRAGT NACH HILFE-------------------
instance  PC_Psionic_IAMHURT (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_IAMHURT_Condition;
	information		= PC_Psionic_IAMHURT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Estoy herido. ¿Puedes ayudarme?"; 
};

FUNC int  PC_Psionic_IAMHURT_Condition()
{	
	if (hero.attribute[ATR_HITPOINTS] < (hero.attribute[ATR_HITPOINTS_MAX]/2))
	&& (Npc_KnowsInfo (hero,PC_Psionic_FOLLOWME))
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_IAMHURT_Info()
{
	AI_Output (other, self,"PC_Psionic_IAMHURT_Info_15_01"); //Estoy herido. ¿Puedes ayudarme?
	AI_Output (self, other,"PC_Psionic_IAMHURT_Info_05_02"); //Tómate esta poción de curación.
	
	CreateInvItem (self,ItFo_Potion_Health_02);
	B_GiveInvItems 	(self, hero,ItFo_Potion_Health_02, 1);
};  

//------------- SPIELER HAT DIE URKUNDE FÜR LESTER GEFUNDEN-----------------------
instance  PC_Psionic_URKUNDE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_URKUNDE_Condition;
	information		= PC_Psionic_URKUNDE_Info;
	important		= 0;
	permanent		= 0;
	description		= "He encontrado el documento."; 
};

FUNC int  PC_Psionic_URKUNDE_Condition()
{	
	if(( Npc_HasItems (hero,ItWr_Urkunde_01 ))
	&&( Npc_KnowsInfo(hero,PC_Psionic_STORY)))  
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_URKUNDE_Info()
{
	AI_Output			(other, self,"PC_Psionic_URKUNDE_Info_15_01"); //He encontrado el documento.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_02"); //Buen trabajo. Como recompensa, toma estos pergaminos mágicos. Con ellos podrás llegar hasta el foco.
	AI_Output			(self, other,"PC_Psionic_URKUNDE_Info_05_03"); //Te espero junto a la plataforma del foco.

	B_LogEntry		(CH3_Fortress,"La escritura que Lesten buscaba estaba en un cofre. A cambio, me ha entregado cuatro pergaminos del conjuro Telequinesia, que puedo usar para alcanzar el foco.");
	
	CreateInvItems		(self,ItArScrollTelekinesis,4);
	B_GiveInvItems 	(self, hero, ItArScrollTelekinesis,4);
	B_GiveInvItems	(hero, self, ItWr_Urkunde_01, 1);

	Npc_ExchangeRoutine	(self,	"WaitAtFocus");
	AI_StopProcessInfos	(self);
};

//-------------
instance  PC_Psionic_TIP (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_TIP_Condition;
	information		= PC_Psionic_TIP_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Cómo puedo alcanzar el foco?"; 
};

FUNC int  PC_Psionic_TIP_Condition()
{	
	if (Npc_KnowsInfo (hero, PC_Psionic_URKUNDE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_TIP_Info()
{
	AI_Output (other, self,"PC_Psionic_TIP_Info_15_01"); //¿Cómo puedo llegar hasta el foco?
	AI_Output (self, other,"PC_Psionic_TIP_Info_05_02"); //El maestro Y'Berion solía decir que un estudiante intenta mover cosas con sus manos y sus pies y el maestro las mueve con sus poderes espirituales.
// 	AI_Output (self, other,"PC_Psionic_TIP_Info_05_03"); //Hier ist ein guter Ort, um die Kraft des Geistes zu nutzen!
};  

// ---ALLES IN DER BERGFESTUNG ERLEDIGT ABER LESTER DIE URKUNDE NICHT GEGEBEN
instance PC_Psionic_LEAVE (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_LEAVE_Condition;
	information		= PC_Psionic_LEAVE_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_LEAVE_Condition()
{	
	if ( ! Npc_HasItems (hero, Focus_3) )
	&& ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&& ( Npc_GetDistToWp (hero, "PATH_TO_PLATEAU04_BRIDGE2") < 900 )
	{
		return TRUE;
	};
};
func void  PC_Psionic_LEAVE_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_LEAVE_Info_05_01"); //Me quedo a buscar el documento.
	
  	self.aivar[AIV_PARTYMEMBER] =	FALSE;

	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos(self);
};

// --- Lester geht nach oben!-------------------------------
instance PC_Psionic_BALKON (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_BALKON_Condition;
	information		= PC_Psionic_BALKON_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_BALKON_Condition()
{	
	if  ( ! Npc_HasItems  (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp (hero, "LOCATION_19_03_PEMTAGRAM2") < 1000 )

	{
		return TRUE;
	};
};
func void  PC_Psionic_BALKON_Info()
{
	AI_GotoNpc(self,hero);
	AI_Output (self, other,"PC_Psionic_BALKON_Info_05_01"); //Voy a echar un vistazo ahí arriba.
	
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine (self,"BALKON");

};
//---------------------------------------------------------------
instance PC_Psionic_FINISH (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_FINISH_Condition;
	information		= PC_Psionic_FINISH_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  PC_Psionic_FINISH_Condition()
{	
	if Npc_HasItems (hero,Focus_3)
	&& Npc_KnowsInfo(hero,PC_Psionic_URKUNDE)
	{
		return TRUE;
	};
};
func void  PC_Psionic_FINISH_Info()
{
	AI_Output (self, other,"PC_Psionic_FINISH_Info_05_01"); //Ahora los dos tenemos lo que buscábamos. Me quedo aquí para leer los viejos libros.
	AI_Output (other, self,"PC_Psionic_FINISH_Info_15_02"); //Volveremos a vernos.

	B_LogEntry		(CH3_Fortress,"He recuperado el foco. Lester aún quiere echar un vistazo a la biblioteca de la fortaleza. Me pregunto cuándo volveré a verle.");

 	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine (self,"BOOK");
	AI_StopProcessInfos	(self);
}; 
/*---------------------------------BALKON DER BERGFESTUNG									
------------------------------------------------------------------------*/

instance  PC_Psionic_CHESTCLOSED (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_CHESTCLOSED_Condition;
	information		= PC_Psionic_CHESTCLOSED_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Has encontrado algo?"; 
};

FUNC int  PC_Psionic_CHESTCLOSED_Condition()
{	
	if  ( ! Npc_HasItems (hero, Focus_3) )
	&&  ( ! Npc_HasItems (self, ItWr_Urkunde_01) ) 
	&&  ( Npc_GetDistToWp(hero,"LOCATION_19_03_SECOND_ETAGE_BALCON") < 500)
	{ 
		return TRUE;
	};

};
FUNC void  PC_Psionic_CHESTCLOSED_Info()
{
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_01"); //¿Has encontrado algo?
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_02"); //Ese baúl está cerrado con llave. Puede que podamos encontrarla en algún lugar del fuerte.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_03"); //¿Has encontrado ya el documento?
	AI_Output (other, self,"PC_Psionic_CHESTCLOSED_Info_15_04"); //No, todavía no.
	AI_Output (self, other,"PC_Psionic_CHESTCLOSED_Info_05_05"); //¿Ya has echado un vistazo en la biblioteca?
	AI_StopProcessInfos(self);
};  
/*------------------------------------------------------------------------
							COME WITH ME AGAIN							
------------------------------------------------------------------------*/

instance  PC_Psionic_COMEAGAIN (C_INFO)
{
	npc				= PC_Psionic;
	condition		= PC_Psionic_COMEAGAIN_Condition;
	information		= PC_Psionic_COMEAGAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Exploremos juntos el fuerte."; 
};

FUNC int  PC_Psionic_COMEAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,PC_Psionic_LEAVE))
	&& ( ! Npc_HasItems (hero, Focus_3) )
	{
		return TRUE;
	};

};
FUNC void  PC_Psionic_COMEAGAIN_Info()
{
	AI_Output (other, self,"PC_Psionic_COMEAGAIN_Info_15_01"); //Exploremos el fuerte los dos juntos.
	AI_Output (self, other,"PC_Psionic_COMEAGAIN_Info_05_02"); //¡De acuerdo; tú primero!
 
 	self.aivar[AIV_PARTYMEMBER] =	TRUE;
	Npc_ExchangeRoutine (self,"FORTRESSFOLLOW");

	AI_StopProcessInfos(self);
};  

//---------------------------------------------------------------------
//	Info DIEGOMILTEN      ******Björn****** Patch2
//---------------------------------------------------------------------
INSTANCE Info_Lester_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Psionic;
	condition	= Info_Lester_DIEGOMILTEN_Condition;
	information	= Info_Lester_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "¡Me encontré a Diego y a Milten frente al Campamento Viejo!";
};                       

FUNC INT Info_Lester_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Lester_DIEGOMILTEN_Info()
{
	
	AI_Output	(hero,self,"Info_SFB_1_DieLage_15_00"); 				//¿Cómo te va?
	AI_Output 	(self, hero,"PC_Psionic_FOLLOWME_Info_05_01"); 			//Eh, ¿qué estás haciendo aquí?
	AI_Output	(hero,self,"Info_Saturas_COLLAPSE_15_01"); 				//¡La Vieja Mina se ha derrumbado tras sufrir unas filtraciones de agua!
	AI_Output 	(self, hero,"DIA_Fingers_BecomeShadow_05_01"); 			//¿Y?
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_01"); 					//¡Todos los Magos del Fuego están muertos!
	AI_Output 	(hero, self,"Info_Xardas_KDW_15_02"); 					//Gómez los hizo asesinar.
	AI_Output 	(self, hero,"SVM_5_GetThingsRight"); 					//¡No será fácil solucionar esto!
	AI_Output 	(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); 				//¡He visto a Diego y Milten en el Campamento Viejo!
	AI_Output 	(hero, self,"Info_lester_DIEGOMILTEN_15_01"); 			//Quieren reunirse contigo. En vuestro lugar de reunión habitual.
	AI_Output 	(self, hero,"SVM_5_YeahWellDone"); 						//¡Ya era hora!
	AI_Output 	(other, self,"Info_Gorn_RUINWALLWHAT_15_01"); 			//¿Y ahora qué?
	AI_Output 	(self, hero,"Info_lester_DIEGOMILTEN_05_02"); 			//Me quedo aquí para leer los viejos libros.
	AI_Output	(hero, self,"KDW_600_Saturas_OATH_Info_15_06"); 		//Esto... No comprendo.
	AI_Output 	(self, hero,"PC_Psionic_TIP_Info_05_02"); 				//El maestro Y'Berion solía decir que un estudiante intenta mover cosas con sus manos y sus pies y el maestro las mueve con sus poderes espirituales.
	AI_Output	(hero,self,"Info_Grd_6_DasLager_WasIstAerger_15_04"); 	//Vale, vale, entendido.
	AI_Output 	(self, hero,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); 	//Cuídate.
	AI_Output	(hero, self,"Info_FreemineOrc_EXIT_15_03"); 			//Gracias. Me marcho.
	AI_Output 	(self, hero,"Info_Lester_EXIT_05_02"); 					//¡Que el Durmiente te proteja!
		
	B_GiveXP			(XP_MessageForGorn);

	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else
	{
		B_LogEntry			(CH4_4Friends,		"He informado a Lester y Gorn acerca de la reunión con sus amigos. Ahora ya no es asunto mío. Ellos sabrán qué van a hacer..."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};


	AI_StopProcessInfos(self);

};
