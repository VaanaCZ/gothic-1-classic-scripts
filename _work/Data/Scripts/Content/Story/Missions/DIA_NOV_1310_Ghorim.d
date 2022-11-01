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
	description	= "Cześć, jak leci?";
};                       

FUNC int  DIA_Ghorim_MissingHarlok_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_MissingHarlok_Info()
{
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_00"); //Cześć, jak leci?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_01"); //Ledwie się trzymam na nogach. Pracuję od dwóch dni, bez chwili przerwy.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_02"); //Harlok powinien mnie zmienić już dawno temu. Ten człowiek nigdy się nie zmieni.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_03"); //Pewnie śpi teraz jak zabity w swojej chacie!
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_04"); //Dlaczego nie pójdziesz do niego i nie dasz mu porządnego kopa w tyłek?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_05"); //Nie mogę stąd odejść, póki Baal Orun wszystkiego pilnuje. Tak, czy inaczej - robota musi zostać wykonana!
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_06"); //Ale ty mógłbyś tam pójść zamiast mnie. Jego chata jest zaraz pod laboratorium Cor Kaloma, koło Fortuno.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_07"); //Powiedz mu, żeby ruszył tu swój leniwy tyłek.
		
	Log_CreateTopic		(CH1_GhorimsRelief,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_RUNNING);
	B_LogEntry			(CH1_GhorimsRelief,"Nowicjusz Ghorim poprosił mnie o zmuszenie leniwego Harloka, by zajął jego miejsce. Harlok kręci się zwykle w pobliżu Fortuno.");

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
	description	= "No i? Wreszcie ktoś cię zluzował?";
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
	AI_Output (other, self,"DIA_Ghorim_SUCCESS_15_00"); //No i? Wreszcie ktoś cię zluzował?
	AI_Output (self, other,"DIA_Ghorim_SUCCESS_02_01"); //Tak, nareszcie mogę się porządnie wyspać. Dzięki, stary!
};


