// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalParvez_EXIT (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 999;
	condition	= DIA_BaalParvez_EXIT_Condition;
	information	= DIA_BaalParvez_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalParvez_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalParvez_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_BaalParvez_Greet (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_Greet_Condition;
	information	= DIA_BaalParvez_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Greet_Info()
{
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_00"); //¡Que el Durmiente sea contigo, forastero!
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_01"); //Estoy aquí para llevarte por el buen camino.
};

// **************************************************
//					Rechter Weg
// **************************************************

instance  DIA_BaalParvez_RightWay (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_RightWay_Condition;
	information	= DIA_BaalParvez_RightWay_Info;
	permanent	= 0;
	description = "¿Y cuál es la senda correcta?";
};                       

FUNC int  DIA_BaalParvez_RightWay_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_RightWay_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_RightWay_15_00"); //¿Y cuál es el buen camino?
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_01"); //El camino del Durmiente. Él es el único que tiene poder para liberarnos.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_02"); //Los Gurús están preparando una gran invocación en nuestro campamento; quieren establecer contacto con el Durmiente.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_03"); //Hasta el momento nos ha hablado en visiones, pero ha llegado la hora de contactar con él.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_04"); //Para ello necesitaremos el mayor número posible de seguidores. Si concentramos nuestro poder espiritual conseguiremos comunicarnos con él.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_05"); //Nuestro campamento está lejos, en el pantano. Yo podría conducirte allí, si quieres.
};

// **************************************************
//					Vorteile für mich
// **************************************************

instance  DIA_BaalParvez_MyAdvantage (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_MyAdvantage_Condition;
	information	= DIA_BaalParvez_MyAdvantage_Info;
	permanent	= 0;
	description = "¿En qué me beneficiaría unirme a ti?";
};                       

FUNC int  DIA_BaalParvez_MyAdvantage_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_MyAdvantage_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_MyAdvantage_15_00"); //¿Qué ganaría si me uniera a vosotros?
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_01"); //Puede que seas uno de los elegidos que reciban el don de la magia del Durmiente.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_02"); //O podrías obtener el más grande de los honores y convertirte en templario. Sólo los mejores luchadores entre nosotros pueden alcanzar esa posición.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_03"); //Si el Durmiente está contigo, puedes llegar a combinar ambas cosas; los mejores entre los templarios también reciben el don de la magia.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_04"); //Como puedes ver, nuestra Hermandad te ofrece muchas posibilidades.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_05"); //¡Deberías ser consciente de ello antes de decidir unirte a cualquier otro campamento!
};

// **************************************************
//					Schläfer
// **************************************************

instance  DIA_BaalParvez_Sleeper (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_Sleeper_Condition;
	information	= DIA_BaalParvez_Sleeper_Info;
	permanent	= 0;
	description = "¿Quién es el Durmiente?";
};                       

FUNC int  DIA_BaalParvez_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_00"); //¿Quién es el Durmiente?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_01"); //El Durmiente nos habla a través de sueños y visiones.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_02"); //Nos ha guiado desde que estableció contacto con Y'Berion, hace cinco años.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_03"); //Todos los seguidores de la Hermandad han renunciado a los tres dioses. Sólo rezamos al Durmiente por nuestra salvación.
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_04"); //¿Salvación de qué?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_05"); //¡De este maldito lugar, claro! ¡El Durmiente nos mostrará el camino a la libertad!
};

// **************************************************
//			Was hat Schläfer zu euch gesagt?
// **************************************************

instance  DIA_BaalParvez_SleeperSaid (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_SleeperSaid_Condition;
	information	= DIA_BaalParvez_SleeperSaid_Info;
	permanent	= 0;
	description = "¿Qué te dijo el Durmiente?";
};                       

FUNC int  DIA_BaalParvez_SleeperSaid_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_SleeperSaid_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_SleeperSaid_15_00"); //¿Qué os contó el Durmiente?
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_01"); //Nos condujo al pantano, hasta el viejo templo en ruinas. Ahí construimos nuestro campamento.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_02"); //Nos dio la independencia; ninguno de nosotros tiene que trabajar en las minas.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_03"); //Nos mostró lo que la hierba del pantano podía hacer. Se la vendemos a los otros campamentos, obteniendo a cambio todo lo que necesitamos.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_04"); //Y a algunos de nosotros nos dio el don de la magia. De una magia antigua y poderosa, diferente a la que usan los magos del reino.
};

// **************************************************
//		Erzähl mir von der MAgie des Schläfers
// **************************************************

instance  DIA_BaalParvez_PSIMagic (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_PSIMagic_Condition;
	information	= DIA_BaalParvez_PSIMagic_Info;
	permanent	= 0;
	description = "Háblame de la magia del Durmiente.";
};                       

FUNC int  DIA_BaalParvez_PSIMagic_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_SleeperSaid))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_PSIMagic_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_PSIMagic_15_00"); //Háblame de la magia del Durmiente.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_01"); //Este don te permite controlar cosas con el poder de tu mente.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_02"); //Sólo los Gurús de nuestra Hermandad han sido iniciados en los secretos de la magia.
};

// **************************************************
//					GotoNewcamp
// **************************************************
	var int BaalParvez_GotoPSI_Day;
// **************************************************

instance  DIA_BaalParvez_GotoPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 800;
	condition	= DIA_BaalParvez_GotoPSI_Condition;
	information	= DIA_BaalParvez_GotoPSI_Info;
	permanent	= 1;
	description = "Llévame a tu campamento. ¡Quiero echar un vistazo!";
};                       

FUNC int  DIA_BaalParvez_GotoPSI_Condition()
{
	if	(Npc_RefuseTalk(self)==FALSE)
	&&	(Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	&&	(Npc_GetDistToWP(self,"PATH_OC_PSI_18")>5000)
	&&	!Npc_KnowsInfo(hero, DIA_BaalParvez_AtPSI)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_GotoPSI_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_GotoPSI_15_00"); //Condúceme a tu campamento. ¡Quiero echarle un vistazo!
	if (Psi_Walk == 0)
	{
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
		};
		B_LogEntry				(CH1_JoinPsi,"Baal Parvez es un misionero de la Hermandad. ¡Permanece en el Campamento Viejo en busca de nuevos creyentes en el DURMIENTE! Se ha ofrecido a acompañarme al campamento del pantano, el hogar de la Hermandad.");
		Psi_Walk	= 1;
	};
	AI_Output (self, other,"DIA_BaalParvez_GotoPSI_10_01"); //¡Espléndido! Yo iré delante. ¡Sígueme!
	
	BaalParvez_GotoPSI_Day = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_SetRefuseTalk (self, 300);
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************************
//				AM PSICAMP ANGEKOMMEN
// **************************************************

instance DIA_BaalParvez_AtPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_AtPSI_Condition;
	information	= DIA_BaalParvez_AtPSI_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_AtPSI_Condition()
{
	if 	( Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_PSI_18") ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_AtPSI_Info()
{
	if (BaalParvez_GotoPSI_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_10_00"); //Ya hemos llegado. Ahí abajo está el campamento de la Hermandad.
	}
	else
	{
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //¡Te has tomado tu tiempo, hermano! Ahí abajo puedes ver el Campamento.
	};
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_01"); //Atraviesa la puerta y habla con mis hermanos. Estoy seguro de que no habrás venido aquí para nada.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_02"); //Pregunta por Cor Kalorn. Él está a cargo de los novicios y los tutores.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_03"); //Yo me volveré al Campamento Viejo; todavía quedan muchos infieles a los que llevar al buen camino.
	AI_Output 	(other, self,"DIA_BaalParvez_AtPSI_15_04"); //Buena suerte.

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_LogEntry	(CH1_JoinPsi,"El Campamento del Pantano está ante mí. Mi acompañante me ha recomendado que hable con Cor Kalom, líder de los novicios y los tutores.");
	B_GiveXP	(XP_ArrivedAtPsiCamp);

	var C_NPC Kalom; Kalom = Hlp_GetNpc(Gur_1201_CorKalom);
	Kalom.aivar[AIV_FINDABLE]=TRUE;
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};


