// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Ghorim_Exit (C_INFO)
{
	npc			=  Nov_1310_Ghorim;
	nr			=  999;
	condition	=  DIA_Ghorim_Exit_Condition;
	information	=  DIA_Ghorim_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Ghorim_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

instance  DIA_Ghorim_MissingHarlok (C_INFO)
{
	npc			= Nov_1310_Ghorim;
	nr			= 1;
	condition	= DIA_Ghorim_MissingHarlok_Condition;
	information	= DIA_Ghorim_MissingHarlok_Info;
	permanent	= 0;
	description	= "�Hola! �Qu� tal?";
};                       

FUNC int  DIA_Ghorim_MissingHarlok_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_MissingHarlok_Info()
{
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_00"); //�Hola! �C�mo va eso?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_01"); //Estoy hecho polvo, t�o. Llevo dos d�as enteros trabajando sin parar.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_02"); //Harlok deber�a haberme relevado hace mucho. Siempre pasa lo mismo con �se.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_03"); //�Lo m�s probable es que est� dormido en su choza!
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_04"); //�Por qu� no vas all� y le pegas una buena patada en el trasero?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_05"); //No puedo irme mientras Baal Orun est� al mando; �el trabajo tiene que estar hecho sea como sea!
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_06"); //Pero podr�as ir all� en  mi lugar; le encontrar�s bajo el laboratorio de alquimia de Cor Kalorn, donde Fortuno.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_07"); //Dile que mueva el culo para ac�.
		
	Log_CreateTopic		(CH1_GhorimsRelief,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_RUNNING);
	B_LogEntry			(CH1_GhorimsRelief,"El novicio Ghorim me ha pedido que haga que el gandul Harlok le sustituya. Harlok suele estar en la tienda de hierba de Fortuno.");

	Ghorim_KickHarlok = LOG_RUNNING;
};

// **************************************************
//					SUCCESS
// **************************************************

instance  DIA_Ghorim_SUCCESS (C_INFO)
{
	npc			= Nov_1310_Ghorim;
	nr			= 1;
	condition	= DIA_Ghorim_SUCCESS_Condition;
	information	= DIA_Ghorim_SUCCESS_Info;
	permanent	= 1;
	description	= "�Y bien? �Ya se ha hecho con el poder?";
};                       

FUNC int  DIA_Ghorim_SUCCESS_Condition()
{
	if (Ghorim_KickHarlok == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_Ghorim_SUCCESS_Info()
{
	AI_Output (other, self,"DIA_Ghorim_SUCCESS_15_00"); //�Y bien? �Se ha hecho cargo ya?
	AI_Output (self, other,"DIA_Ghorim_SUCCESS_02_01"); //S�, por fin puedo irme a dormir. �Gracias, hombre!
};


