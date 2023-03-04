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
	description	= "Hé ! Comment ça va ?";
};                       

FUNC int  DIA_Ghorim_MissingHarlok_Condition()
{
	return 1;
};

FUNC VOID  DIA_Ghorim_MissingHarlok_Info()
{
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_00"); //Hé ! Comment ça va ?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_01"); //Je tombe de fatigue, mon gars. Je viens de travailler pendant deux jours d'affilé.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_02"); //Harlok aurait dû me remplacer depuis des lustres. C'est toujours comme ça avec ce type.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_03"); //Il est probablement allongé dans sa cabane, endormi !
	AI_Output (other, self,"DIA_Ghorim_MissingHarlok_15_04"); //Pourquoi est-ce que tu ne vas pas là-bas pour lui botter les fesses ?
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_05"); //Je ne peux pas partir d'ici tandis que Baal Orun est responsable - de toutes façons, le travail doit être effectué !
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_06"); //Mais tu pourrais y aller à ma place - il est juste sous le laboratoire d'alchimie de Cor Kalom, chez Fortuno.
	AI_Output (self, other,"DIA_Ghorim_MissingHarlok_02_07"); //Dis-lui de rappliquer ici.
		
	Log_CreateTopic		(CH1_GhorimsRelief,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_RUNNING);
	B_LogEntry			(CH1_GhorimsRelief,"Le novice Ghorim m'a demandé d'empêcher Harlok d'esquiver son tour aux broyeurs. Harlok est d'habitude prêt du magasin d'Herbe de Fortuno.");

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
	description	= "Hé bien ? A-t-il repris maintenant ?";
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
	AI_Output (other, self,"DIA_Ghorim_SUCCESS_15_00"); //Hé bien ? A-t-il repris maintenant ?
	AI_Output (self, other,"DIA_Ghorim_SUCCESS_02_01"); //Ouais - finalement je peux aller dormir. Merci, l'ami !
};


