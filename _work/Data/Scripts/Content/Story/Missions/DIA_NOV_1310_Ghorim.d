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
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_01"); //Pad�m �navou, �lov��e. Pracoval jsem dva dny bez p�est�vky.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_02"); //Harlok m� m�l b�hem t� doby vyst��dat. Ale tak je to s t�ma chlapama po��d.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_03"); //Nejsp� se vyvaluje ve sv� chatr�i a sp�!
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_04"); //Pro� tam za n�m nezajde� a po��dn� ho nekopne� do zadku?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_05"); //Nem��u odsud odej�t, dokud tu hl�d� Baal Orun - pr�ce se mus� za ka�dou cenu dod�lat!
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_06"); //Ale ty bys za n�m mohl kv�li mn� zaj�t - bydl� hned pod alchymistickou d�lnou Cora Kaloma, u Fortuna.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_07"); //�ekni mu, a� hejbne zadkem a p�ijde sem.
		
	Log_CreateTopic		(CH1_GhorimsRelief,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_RUNNING);
	B_LogEntry			(CH1_GhorimsRelief,"Novic Ghorim m� po��dal, abych ho zbavil zah�l�iv�ho Harloka. Harlok se obvykle potlouk� kolem Fortunova drogov�ho obchodu.");

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
	description	= "Tak? Vyst��d� m�?";
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
	AI_Output (other, self,"DIA_Ghorim_SUCCESS_15_00"); //Tak? Vyst��d� m�?
	AI_Output (self, other,"DIA_Ghorim_SUCCESS_02_01"); //Dob�e - kone�n� se budu moci vyspat. D�ky, �lov��e!
};


