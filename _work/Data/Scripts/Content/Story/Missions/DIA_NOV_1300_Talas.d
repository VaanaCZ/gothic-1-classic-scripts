
// ************************ EXIT **************************

instance  Nov_1300_Talas_Exit (C_INFO)
{
	npc			=  Nov_1300_Talas;
	nr			=  999;
	condition	=  Nov_1300_Talas_Exit_Condition;
	information	=  Nov_1300_Talas_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Nov_1300_Talas_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Nov_1300_Talas_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_UR (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_UR_Condition;
	information		= Nov_1300_Talas_UR_Info;
	important		= 0;
	permanent		= 0;
	description		= "Eres Talas, al que robaron."; 
};

FUNC int  Nov_1300_Talas_UR_Condition()
{
	if	Npc_KnowsInfo(hero, Info_CorKalom_BringBook)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Nov_1300_Talas_UR_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_UR_Info_15_01"); //Tú eres Talas, el que fue asaltado.
	AI_Output			(self, other,"Nov_1300_Talas_UR_Info_02_02"); //Déjame en paz; ¡no quiero hablar de ello!
};  
// ***************************** INFOS ****************************************//

instance  Nov_1300_Talas_HELP (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_HELP_Condition;
	information		= Nov_1300_Talas_HELP_Info;
	important		= 0;
	permanent		= 0;
	description		= "Puedo ayudarte a recuperar el almanaque."; 
};

FUNC int  Nov_1300_Talas_HELP_Condition()
{
	if	Npc_KnowsInfo(hero, Nov_1300_Talas_UR)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return 1;
	};
};
FUNC void  Nov_1300_Talas_HELP_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_Info_15_01"); //Puedo ayudarte a recuperar el almanaque.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_02"); //¿De verdad? ¡Fui atacado por unos trasgos! ¡Y ahora se supone que debo volver allí y recuperar el almanaque!
	AI_Output			(self, other,"Nov_1300_Talas_HELP_Info_02_03"); //Tengo una sugerencia que hacerte: te mostraré el camino hasta el almanaque para que puedas recuperarlo.

	Info_ClearChoices	(Nov_1300_Talas_HELP);
	Info_AddChoice		(Nov_1300_Talas_HELP,"De acuerdo.",Nov_1300_Talas_HELP_OK);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Eso te costará 30 pepitas de mineral.",Nov_1300_Talas_HELP_BRING);
	Info_AddChoice		(Nov_1300_Talas_HELP,"Dame 50 pepitas y me apunto.",Nov_1300_Talas_HELP_MORE);
	
};  

func void Nov_1300_Talas_HELP_OK ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_OK_15_01"); //De acuerdo.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_OK_02_02"); //Vale; podemos salir en cuanto estés preparado.
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_BRING ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_BRING_15_01"); //Eso te costará 30 pepitas.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_BRING_02_02"); //Vale; podemos salir en cuanto estés preparado.
	CreateInvItems		(self,ItMiNugget,30);
	B_GiveInvItems      (self,hero,ItMiNugget,30);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};
func void Nov_1300_Talas_HELP_MORE ()
{
	AI_Output			(other, self,"Nov_1300_Talas_HELP_MORE_15_01"); //Dame 50 pepitas y puedes contar conmigo.
	AI_Output			(self, other,"Nov_1300_Talas_HELP_MORE_02_02"); //¿Cómo? ¡Eso es un robo! Bueno, entonces avísame cuando estés preparado.
	CreateInvItems		(self,ItMiNugget,50);
	B_GiveInvItems      (self,hero,ItMiNugget,50);
	Info_ClearChoices	(Nov_1300_Talas_HELP);
};

// ***************************** INFOS ****************************************//
instance  Nov_1300_Talas_READY (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_READY_Condition;
	information		= Nov_1300_Talas_READY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Estoy listo, ya podemos marcharnos."; 
};

FUNC int  Nov_1300_Talas_READY_Condition()
{
	if	Npc_KnowsInfo(hero, Nov_1300_Talas_HELP)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_READY_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_READY_Info_15_01"); //Estoy preparado; podemos partir ahora mismo.
	AI_Output			(self, other,"Nov_1300_Talas_READY_Info_02_02"); //De acuerdo. Sígueme.
	
	B_LogEntry		(CH2_Book,"Me he ofrecido a Talas para devolverle el almanaque. Quiere llevarme hasta el lugar donde se encuentra el libro."); 
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"GOBBOCAVE");
	AI_StopProcessInfos	(self);
	
};  

// ***************************** AN DER BRÜCKE ****************************************//
instance  Nov_1300_Talas_BRIDGE (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BRIDGE_Condition;
	information		= Nov_1300_Talas_BRIDGE_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BRIDGE_Condition()
{
	if 	(Npc_KnowsInfo (hero, Nov_1300_Talas_READY ))
	&&	(Npc_GetDistToWP(self, "LOCATION_29_02")<1000)
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_BRIDGE_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_01"); //¡Esas malditas bestezuelas viven en una cueva detrás de este puente! ¡Ten cuidado!
	AI_Output			(other, self,"Nov_1300_Talas_BRIDGE_Info_15_02"); //¿Es que no vienes conmigo?
	AI_Output			(self, other,"Nov_1300_Talas_BRIDGE_Info_02_03"); //Te esperaré aquí y... Ejem... Cubriré nuestra retirada.

	B_LogEntry		(CH2_Book,"Estamos frente a una cueva de trasgos. Este novicio cobarde quiere que vaya yo solo.");
};

// ***************************** ZURÜCK INS LAGER ****************************************//
instance  Nov_1300_Talas_BACK (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BACK_Condition;
	information		= Nov_1300_Talas_BACK_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BACK_Condition()
{
	if 	(Npc_KnowsInfo (hero, Nov_1300_Talas_BRIDGE ))
	&&	(Npc_HasItems (hero,ItWrFokusbuch))
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_BACK_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BACK_Info_02_01"); //¡Has conseguido el almanaque! Buen trabajo. Ahora volvamos al Campamento.

	B_LogEntry		(CH2_Book,"He encontrado el almanaque y lo llevaré al campamento del pantano junto a Talas.");

	Npc_ExchangeRoutine	(self,"RETURNTOCAMP");
	AI_StopProcessInfos	(self);
};

// ***************************** Zurück im Lager ****************************************//
instance  Nov_1300_Talas_RETURNED (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_RETURNED_Condition;
	information		= Nov_1300_Talas_RETURNED_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_RETURNED_Condition()
{
	if	(Npc_KnowsInfo (hero, Nov_1300_Talas_BACK ))
	&&	Npc_HasItems (hero,ItWrFokusbuch)
	&&	(Npc_GetDistToWP  (self, "PSI_START")<1000)
	&&	(CorKalom_BringBook != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Nov_1300_Talas_RETURNED_Info()
{
	AI_Output			(self, other,"Info_Talas_RETURNED_02_01"); //Ya hemos vuelto. Será mejor que le lleves el almanaque a Cor Kalorn de inmediato.
	AI_Output			(other, self,"Info_Talas_RETURNED_15_02"); //Ten cuidado, no vayas a cansarte demasiado.
	AI_Output			(self, other,"Info_Talas_RETURNED_02_03"); //¡No te preocupes, no lo haré! No hace falta que te preocupes por mí.

	B_LogEntry		(CH2_Book,"Ya hemos vuelto al campamento del pantano. Talas es el mayor cobarde con que me haya cruzado jamás. Yo mismo le llevaré el libro a Cor Kalom.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,"BackInCamp");
	AI_StopProcessInfos	(self);
};


// ***************************** zum OGY ****************************************//
instance  Nov_1300_Talas_OGY (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_OGY_Condition;
	information		= Nov_1300_Talas_OGY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Me manda Cor Angar."; 
};

FUNC int  Nov_1300_Talas_OGY_Condition()
{
	if ( Npc_KnowsInfo ( hero, GUR_1202_CorAngar_WHERE ))
	{
		return 1;
	};

};
FUNC void  Nov_1300_Talas_OGY_Info()
{
	AI_Output			(other, self,"Nov_1300_Talas_OGY_15_01"); //Vengo de parte de Cor Angar. Me ha dicho que debes conducirme hasta el cementerio orco para que pueda encontrar a Baal Lukor y sus templarios.
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_02"); //Así que de nuevo soy el chico de los recados. ¡Maldición! Nunca debería haber perdido ese almanaque...
	AI_Output			(self, other,"Nov_1300_Talas_OGY_02_03"); //Bueno, ven conmigo pues.
	
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"OGY");
};  

// ***************************** am OGY ****************************************//
instance  Nov_1300_Talas_BACKAGAIN (C_INFO)
{
	npc				= Nov_1300_Talas;
	condition		= Nov_1300_Talas_BACKAGAIN_Condition;
	information		= Nov_1300_Talas_BACKAGAIN_Info;
	important		= 1;
	permanent		= 0;
	 
};
FUNC int  Nov_1300_Talas_BACKAGAIN_Condition()
{
	if ( Npc_GetDistToWP(self,"OW_PATH_011")<1000 )
	{
		return 1;
	};
};

FUNC void  Nov_1300_Talas_BACKAGAIN_Info()
{
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_01"); //No voy a cruzar el puente contigo; no quiero suicidarme.
	AI_Output			(self, other,"Nov_1300_Talas_BACKAGAIN_Info_02_02"); //Tienes que estar loco para ir allí; ni siquiera Baal Lukor y sus templarios consiguieron salir.
	AI_Output			(other, self,"Nov_1300_Talas_BACKAGAIN_Info_15_03"); //Ya veremos qué es lo que pasa. Vuélvete al Campamento; yo iré más tarde.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,"ReturnToCampAgain");
	
};

 
