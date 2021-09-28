// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_Fortuno_EXIT (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 999;
	condition	= DIA_Fortuno_EXIT_Condition;
	information	= DIA_Fortuno_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Fortuno_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_Fortuno_Greet (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 1;
	condition	= DIA_Fortuno_Greet_Condition;
	information	= DIA_Fortuno_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Fortuno_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Fortuno_Greet_Info()
{
	AI_Output (self, other,"DIA_Fortuno_Greet_05_00"); //Avvicinati! Ogni nuovo arrivato riceve un regalo di benvenuto!
};

// **************************************************
//				Was ist das Geschenk?
// **************************************************
	var int Fortuno_RationDay;
// **************************************************

instance  DIA_Fortuno_GetGeschenk (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 1;
	condition	= DIA_Fortuno_GetGeschenk_Condition;
	information	= DIA_Fortuno_GetGeschenk_Info;
	permanent	= 0;
	description = "Cos'hai per me?";
};                       

FUNC int  DIA_Fortuno_GetGeschenk_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fortuno_GetGeschenk_Info()
{
	AI_Output (other, self,"DIA_Fortuno_GetGeschenk_15_00"); //Cos'hai per me?
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_01"); //Ecco, prendi queste tre piante d'erba di palude. SI tratta di 'Buio del Nord'. Roba buona.
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_02"); //Puoi averne tutti i giorni. Se ne vuoi una quantità maggiore della razione giornaliera, devi pagare.
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_03"); //Se trovi bacche o erbe, nelle strade che collegano i campi, portale a me e te le comprerò.

	CreateInvItems(self, itmijoint_2, 3);
	B_GiveInvItems(self, other, itmijoint_2, 3);
	Fortuno_RationDay = Wld_GetDay();
	
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,"Fortuno commercia in erbe, sotto il laboratorio alchemico.");
};

// **************************************************
//				Tägliche Ration
// **************************************************

instance  DIA_Fortuno_DailyRation (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 3;
	condition	= DIA_Fortuno_DailyRation_Condition;
	information	= DIA_Fortuno_DailyRation_Info;
	permanent	= 1;
	description = "Sono qui per la razione giornaliera.";
};                       

FUNC int  DIA_Fortuno_DailyRation_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk))
	{
		return 1;
	};
};

FUNC VOID  DIA_Fortuno_DailyRation_Info()
{
	AI_Output (other, self,"DIA_Fortuno_DailyRation_15_00"); //Sono qui per la razione giornaliera.
	if (Fortuno_RationDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Fortuno_DailyRation_05_01"); //Ecco, prendi. Tre 'Buio del Nord'. Ma non fumarle tutte assieme!
		CreateInvItems(self, itmijoint_2, 3);
		B_GiveInvItems(self, other, itmijoint_2, 3);
		Fortuno_RationDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Fortuno_DailyRation_05_02"); //Hai già avuto la tua razione giornaliera. Se ne vuoi ancora, torna domani o compra qualcosa.
	};
};

// **************************************************
//						TRADE
// **************************************************

instance  DIA_Fortuno_BuyJoints (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 4;
	condition	= DIA_Fortuno_BuyJoints_Condition;
	information	= DIA_Fortuno_BuyJoints_Info;
	permanent	= 1;
	description = "Voglio fare affari.";
	Trade		= 1;
};                       

FUNC int  DIA_Fortuno_BuyJoints_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk))
	{
		return 1;
	};
};

FUNC VOID  DIA_Fortuno_BuyJoints_Info()
{
	AI_Output (other, self,"DIA_Fortuno_BuyJoints_15_00"); //Voglio fare affari.
	AI_Output (self, other,"DIA_Fortuno_BuyJoints_05_01"); //Cosa desideri? O forse vuoi vendermi qualcosa?
};




