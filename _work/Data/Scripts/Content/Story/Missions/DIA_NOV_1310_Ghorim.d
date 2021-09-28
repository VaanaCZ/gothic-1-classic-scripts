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
	description	= "Salve, come va?";
};                       

FUNC int  DIA_Ghorim_MissingHarlok_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_MissingHarlok_Info()
{
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_00"); //Salve, come va?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_01"); //Sono stanco morto, amico! Lavoro ininterrottamente da due giorni.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_02"); //Harlok mi avrebbe dovuto dare il cambio secoli fa. Non si smentisce mai!
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_03"); //Probabilmente sta dormendo nella sua capanna!
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_04"); //Perché non vai a prenderlo a calci in culo?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_05"); //Non posso lasciare il posto, finché Baal Orun sta di guardia. In un modo o nell'altro, il lavoro deve essere fatto!
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_06"); //Però puoi farlo tu per me! Si trova proprio sotto il laboratorio alchemico di Cor Kalom, da Fortuno.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_07"); //Digli di portare qui le chiappe.
		
	Log_CreateTopic		(CH1_GhorimsRelief,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_RUNNING);
	B_LogEntry			(CH1_GhorimsRelief,"Ghorim il novizio mi ha chiesto di convincere quel pigro di Harlok a dargli il cambio. Di solito, lo si può trovare dalle parti del negozio d'erba di Fortuno.");

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
	description	= "Cosa? È arrivato a darmi il cambio?";
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
	AI_Output (other, self,"DIA_Ghorim_SUCCESS_15_00"); //Cosa? È arrivato a darmi il cambio?
	AI_Output (self, other,"DIA_Ghorim_SUCCESS_02_01"); //Finalmente posso andare a dormire. Grazie, amico!
};


