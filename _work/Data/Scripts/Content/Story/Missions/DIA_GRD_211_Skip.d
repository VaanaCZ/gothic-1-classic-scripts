// **************************************
//					EXIT 
// **************************************

instance  DIA_Skip_Exit (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  999;
	condition	=  DIA_Skip_Exit_Condition;
	information	=  DIA_Skip_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Skip_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Skip_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				First
// **************************************
	var int Skip_TradeFree;
// **************************************

instance  DIA_Skip_First (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  1;
	condition	=  DIA_Skip_First_Condition;
	information	=  DIA_Skip_First_Info;
	permanent	=  0;
	description = "�Qu� haces aqu�?";
};                       

FUNC int  DIA_Skip_First_Condition()
{
	if ( !( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) ) )
	{	
		return 1;
	};
};

FUNC VOID  DIA_Skip_First_Info()
{
	AI_Output (other, self,"DIA_Skip_First_15_00"); //�Qu� haces aqu�?
	AI_Output (self, other,"DIA_Skip_First_12_01"); //Me ocupo de las armas de los guardias.
	AI_Output (other, self,"DIA_Skip_First_15_02"); //�Vendes armas?
	AI_Output (self, other,"DIA_Skip_First_12_03"); //S�lo a G�mez y a sus hombres.

	if	!Npc_KnowsInfo(hero, DIA_Raven_Equipment)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"El guardia Skip del patio posterior vende ARMAS. Pero s�lo a los hombres de G�mez.");
	};
	
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Entiendo. Hasta luego.",DIA_Skip_First_BACK);
	Info_Addchoice 		(DIA_Skip_First,"Me manda Thorus. Me dijo que consiguiera un arma.",DIA_Skip_First_Thorus);
	Info_Addchoice 		(DIA_Skip_First,"Me manda G�mez. Me dijo que me dar�as algo de equipo.",DIA_Skip_First_Gomez);
		
};

func void DIA_Skip_First_Gomez()
{
	AI_Output (other, self,"DIA_Skip_First_Gomez_15_00"); //Me manda G�mez. Me dijo que me dar�as algo de equipo.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_01"); //Lo normal, �eh? Una armadura nueva y la mejor arma en existencia.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_02"); //�Largo de aqu� antes de que vaya a por ti!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_15_00"); //Me manda Thorus. Me dijo que consiguiera un arma.
	AI_Output (self, other,"DIA_Skip_First_Thorus_12_01"); //�Oh?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"�Por qu� no vas y se lo preguntas?",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"Me dijo que te diera una buena patada en el culo si no me dabas un arma.",DIA_Skip_First_Thorus_KickAss);
	Info_Addchoice 		(DIA_Skip_First,"Quiere que haga algo por �l que ninguno de vosotros pod�is, �entiendes?",DIA_Skip_First_Thorus_Stranger);
};

func void DIA_Skip_First_BACK()
{
	AI_Output (other, self,"DIA_Skip_First_BACK_15_00"); //Entiendo. Hasta luego.
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};
//------------------------------------------------------
func void DIA_Skip_First_Thorus_Stranger()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_Stranger_15_00"); //Quiere que haga algo por �l que ninguno de vosotros pod�is hacer, �entiendes?
	AI_Output (self, other,"DIA_Skip_First_Thorus_Stranger_12_01"); //�Ah s�? Y supongo que no tiene nada mejor que hacer que enviarte a m�, �no?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"�Por qu� no vas y se lo preguntas?",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"Me dijo que te diera una buena patada en el culo si no me dabas un arma.",DIA_Skip_First_Thorus_KickAssAGAIN);
};

func void DIA_Skip_First_Thorus_KickAss()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAss_15_00"); //Me dijo que te diera una buena patada en el culo si no me dabas un arma.
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAss_12_01"); //�Ah s�? Desde mi punto de vista, como no te largues r�pidamente de aqu�, yo voy a ser el que te pegue la patada en el culo!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_AskHim()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_AskHim_15_00"); //�Por qu� no vas y se lo preguntas?
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_01"); //Ya lo creo que lo har�. Pero ahora no. Apuesto a que le interesa escuchar lo que cuentas de �l.
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_02"); //�No s� qui�n te ha dejado entrar, pero ser� mejor que utilices el camino m�s corto para salir!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_KickAssAGAIN()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00"); //Me dijo que te diera una buena patada en el culo si no me dabas un arma.
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAssAGAIN_12_01"); //De acuerdo, t�o; �qu� quieres?
	Info_ClearChoices 	(DIA_Skip_First);
	Skip_TradeFree = TRUE;
};

// **************************************
//			VERPATZT
// **************************************

instance  DIA_Skip_VERPATZT (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  1;
	condition	=  DIA_Skip_VERPATZT_Condition;
	information	=  DIA_Skip_VERPATZT_Info;
	permanent	=  1;
	description = "Se me ocurri� volver a pedirte ese equipo...";
};                       

FUNC int  DIA_Skip_VERPATZT_Condition()
{
	if 	( 
		( !( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) ) )
		&& ( (Npc_KnowsInfo(hero,DIA_Skip_First)) && (Skip_TradeFree == FALSE) ) 
		)
	{	
		return 1;
	};
};

FUNC VOID  DIA_Skip_VERPATZT_Info()
{
	AI_Output (other, self,"DIA_Skip_VERPATZT_15_00"); //Se me ocurri� volver a pedirte ese equipo...
	AI_Output (self, other,"DIA_Skip_VERPATZT_12_01"); //�L�rgate!
};

/*------------------------------------------------------------------------
							Waffenhandel								
------------------------------------------------------------------------*/

instance  GRD_211_Skip_TRADE (C_INFO)
{
	npc				= GRD_211_Skip;
	condition		= GRD_211_Skip_TRADE_Condition;
	information		= GRD_211_Skip_TRADE_Info;
	permanent		= 1;
	description		= "Me apa�o con unas cuantas cosillas."; 
	trade 			= 1;
};

FUNC int  GRD_211_Skip_TRADE_Condition()
{
	if ( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) 
			||	(Skip_TradeFree == TRUE) )
	{
		return TRUE;
	};
};


FUNC void  GRD_211_Skip_TRADE_Info()
{
	AI_Output (other, self,"GRD_211_Skip_TRADE_Info_15_01"); //Me apa�o con unas cuantas cosillas.
	AI_Output (self, other,"GRD_211_Skip_TRADE_Info_12_02"); //Podr�a venderte unas cuantas cosillas.
};  

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_211_Skip_WELCOME (C_INFO)
{
	npc				= GRD_211_Skip;
	condition		= GRD_211_Skip_WELCOME_Condition;
	information		= GRD_211_Skip_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_211_Skip_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_211_Skip_WELCOME_Info()
{
	AI_Output (self, other,"GRD_211_Skip_WELCOME_Info_12_01"); //Eh, has llegado bastante lejos, teniendo en cuenta que no llevas aqu� mucho tiempo.
};
