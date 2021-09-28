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
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_01"); //Pad·m ˙navou, ËlovÏËe. Pracoval jsem dva dny bez p¯est·vky.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_02"); //Harlok mÏ mÏl bÏhem tÈ doby vyst¯Ìdat. Ale tak je to s tÏma chlapama po¯·d.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_03"); //NejspÌö se vyvaluje ve svÈ chatrËi a spÌ!
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_04"); //ProË tam za nÌm nezajdeö a po¯·dnÏ ho nekopneö do zadku?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_05"); //Nem˘ûu odsud odejÌt, dokud tu hlÌd· Baal Orun - pr·ce se musÌ za kaûdou cenu dodÏlat!
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_06"); //Ale ty bys za nÌm mohl kv˘li mnÏ zajÌt - bydlÌ hned pod alchymistickou dÌlnou Cora Kaloma, u Fortuna.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_07"); //ÿekni mu, aù hejbne zadkem a p¯ijde sem.
		
	Log_CreateTopic		(CH1_GhorimsRelief,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_RUNNING);
	B_LogEntry			(CH1_GhorimsRelief,"Novic Ghorim mÏ poû·dal, abych ho zbavil zah·lËivÈho Harloka. Harlok se obvykle potlouk· kolem Fortunova drogovÈho obchodu.");

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
	description	= "Tak? Vyst¯Ìd· mÏ?";
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
	AI_Output (other, self,"DIA_Ghorim_SUCCESS_15_00"); //Tak? Vyst¯Ìd· mÏ?
	AI_Output (self, other,"DIA_Ghorim_SUCCESS_02_01"); //Dob¯e - koneËnÏ se budu moci vyspat. DÌky, ËlovÏËe!
};


