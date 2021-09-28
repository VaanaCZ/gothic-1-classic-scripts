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
	description	= "Cze��, jak leci?";
};                       

FUNC int  DIA_Ghorim_MissingHarlok_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_MissingHarlok_Info()
{
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_00"); //Cze��, jak leci?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_01"); //Ledwie si� trzymam na nogach. Pracuj� od dw�ch dni, bez chwili przerwy.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_02"); //Harlok powinien mnie zmieni� ju� dawno temu. Ten cz�owiek nigdy si� nie zmieni.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_03"); //Pewnie �pi teraz jak zabity w swojej chacie!
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_04"); //Dlaczego nie p�jdziesz do niego i nie dasz mu porz�dnego kopa w ty�ek?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_05"); //Nie mog� st�d odej��, p�ki Baal Orun wszystkiego pilnuje. Tak, czy inaczej - robota musi zosta� wykonana!
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_06"); //Ale ty m�g�by� tam p�j�� zamiast mnie. Jego chata jest zaraz pod laboratorium Cor Kaloma, ko�o Fortuno.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_07"); //Powiedz mu, �eby ruszy� tu sw�j leniwy ty�ek.
		
	Log_CreateTopic		(CH1_GhorimsRelief,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_RUNNING);
	B_LogEntry			(CH1_GhorimsRelief,"Nowicjusz Ghorim poprosi� mnie o zmuszenie leniwego Harloka, by zaj�� jego miejsce. Harlok kr�ci si� zwykle w pobli�u Fortuno.");

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
	description	= "No i? Wreszcie kto� ci� zluzowa�?";
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
	AI_Output (other, self,"DIA_Ghorim_SUCCESS_15_00"); //No i? Wreszcie kto� ci� zluzowa�?
	AI_Output (self, other,"DIA_Ghorim_SUCCESS_02_01"); //Tak, nareszcie mog� si� porz�dnie wyspa�. Dzi�ki, stary!
};


