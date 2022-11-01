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
	description	= "Jak to jde?";
};                       

FUNC int  DIA_Ghorim_MissingHarlok_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_MissingHarlok_Info()
{
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_00"); //Zdar! Jak to jde?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_01"); //Padám únavou, člověče. Pracoval jsem dva dny bez přestávky.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_02"); //Harlok mě měl během té doby vystřídat. Ale tak je to s těma chlapama pořád.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_03"); //Nejspíš se vyvaluje ve své chatrči a spí!
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_04"); //Proč tam za ním nezajdeš a pořádně ho nekopneš do zadku?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_05"); //Nemůžu odsud odejít, dokud tu hlídá Baal Orun - práce se musí za každou cenu dodělat!
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_06"); //Ale ty bys za ním mohl kvůli mně zajít - bydlí hned pod alchymistickou dílnou Cora Kaloma, u Fortuna.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_07"); //Řekni mu, ať hejbne zadkem a přijde sem.
		
	Log_CreateTopic		(CH1_GhorimsRelief,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_RUNNING);
	B_LogEntry			(CH1_GhorimsRelief,"Novic Ghorim mě požádal, abych ho zbavil zahálčivého Harloka. Harlok se obvykle potlouká kolem Fortunova drogového obchodu.");

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
	description	= "Tak? Vystřídá mě?";
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
	AI_Output (other, self,"DIA_Ghorim_SUCCESS_15_00"); //Tak? Vystřídá mě?
	AI_Output (self, other,"DIA_Ghorim_SUCCESS_02_01"); //Dobře - konečně se budu moci vyspat. Díky, člověče!
};


