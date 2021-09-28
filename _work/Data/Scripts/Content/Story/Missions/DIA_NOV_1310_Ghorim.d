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
	description	= "Czeœæ, jak leci?";
};                       

FUNC int  DIA_Ghorim_MissingHarlok_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_MissingHarlok_Info()
{
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_00"); //Czeœæ, jak leci?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_01"); //Ledwie siê trzymam na nogach. Pracujê od dwóch dni, bez chwili przerwy.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_02"); //Harlok powinien mnie zmieniæ ju¿ dawno temu. Ten cz³owiek nigdy siê nie zmieni.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_03"); //Pewnie œpi teraz jak zabity w swojej chacie!
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_04"); //Dlaczego nie pójdziesz do niego i nie dasz mu porz¹dnego kopa w ty³ek?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_05"); //Nie mogê st¹d odejœæ, póki Baal Orun wszystkiego pilnuje. Tak, czy inaczej - robota musi zostaæ wykonana!
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_06"); //Ale ty móg³byœ tam pójœæ zamiast mnie. Jego chata jest zaraz pod laboratorium Cor Kaloma, ko³o Fortuno.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_07"); //Powiedz mu, ¿eby ruszy³ tu swój leniwy ty³ek.
		
	Log_CreateTopic		(CH1_GhorimsRelief,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_RUNNING);
	B_LogEntry			(CH1_GhorimsRelief,"Nowicjusz Ghorim poprosi³ mnie o zmuszenie leniwego Harloka, by zaj¹³ jego miejsce. Harlok krêci siê zwykle w pobli¿u Fortuno.");

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
	description	= "No i? Wreszcie ktoœ ciê zluzowa³?";
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
	AI_Output (other, self,"DIA_Ghorim_SUCCESS_15_00"); //No i? Wreszcie ktoœ ciê zluzowa³?
	AI_Output (self, other,"DIA_Ghorim_SUCCESS_02_01"); //Tak, nareszcie mogê siê porz¹dnie wyspaæ. Dziêki, stary!
};


