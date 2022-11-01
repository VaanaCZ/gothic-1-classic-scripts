// **************************************
//					EXIT 
// **************************************

instance  DIA_Skip_Exit (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  999;
	condition	=  DIA_Skip_Exit_Condition;
	information	=  DIA_Skip_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Skip_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Skip_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				First
// **************************************
	var int Skip_TradeFree;
// **************************************

instance  DIA_Skip_First (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  1;
	condition	=  DIA_Skip_First_Condition;
	information	=  DIA_Skip_First_Info;
	permanent	=  0;
	description = "Czym się tutaj zajmujesz?";
};                       

FUNC int  DIA_Skip_First_Condition()
{
	if ( !( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) ) )
	{	
		return 1;
	};
};

FUNC VOID  DIA_Skip_First_Info()
{
	AI_Output (other, self,"DIA_Skip_First_15_00"); //Czym się tutaj zajmujesz?
	AI_Output (self, other,"DIA_Skip_First_12_01"); //Dbam o broń strażników.
	AI_Output (other, self,"DIA_Skip_First_15_02"); //Sprzedajesz oręż?
	AI_Output (self, other,"DIA_Skip_First_12_03"); //Też, ale tylko Gomezowi i jego ludziom.

	if	!Npc_KnowsInfo(hero, DIA_Raven_Equipment)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"Skip, strażnik z tylnego dziedzińca, sprzedaje oręż, ale tylko ludziom Gomeza.");
	};
	
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Rozumiem. Do zobaczenia.",DIA_Skip_First_BACK);
	Info_Addchoice 		(DIA_Skip_First,"Przysyła mnie Thorus. Kazał mi wybrać sobie jakąś broń.",DIA_Skip_First_Thorus);
	Info_Addchoice 		(DIA_Skip_First,"Przysyła mnie Gomez. Podobno masz dla mnie jakieś wyposażenie.",DIA_Skip_First_Gomez);
		
};

func void DIA_Skip_First_Gomez()
{
	AI_Output (other, self,"DIA_Skip_First_Gomez_15_00"); //Przysyła mnie Gomez. Podobno masz dla mnie jakieś wyposażenie.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_01"); //To co zwykle, tak? Nowy pancerz i najlepsza broń, jaką mam na składzie.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_02"); //Wynoś się, albo cię stąd wyniosą!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_15_00"); //Przysyła mnie Thorus. Kazał mi wybrać sobie jakąś broń.
	AI_Output (self, other,"DIA_Skip_First_Thorus_12_01"); //Czyżby?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Jeśli mi nie wierzysz, idź i sam go zapytaj.",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"Mam ci dać porządnego kopa w dupę jeśli będziesz sprawiał kłopoty.",DIA_Skip_First_Thorus_KickAss);
	Info_Addchoice 		(DIA_Skip_First,"Mam zrobić dla niego coś, czego nie może zrobić żaden z ludzi Gomeza.",DIA_Skip_First_Thorus_Stranger);
};

func void DIA_Skip_First_BACK()
{
	AI_Output (other, self,"DIA_Skip_First_BACK_15_00"); //Rozumiem. Do zobaczenia.
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};
//------------------------------------------------------
func void DIA_Skip_First_Thorus_Stranger()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_Stranger_15_00"); //Widzisz, mam zrobić dla niego coś, czego nie może zrobić żaden z ludzi Gomeza.
	AI_Output (self, other,"DIA_Skip_First_Thorus_Stranger_12_01"); //Tak? I pewnie stary Thorus nie ma nic lepszego do roboty niż przysyłać cię do mnie, co?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Jeśli mi nie wierzysz, idź i sam go zapytaj.",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"Mam ci dać porządnego kopa w dupę jeśli będziesz sprawiał kłopoty.",DIA_Skip_First_Thorus_KickAssAGAIN);
};

func void DIA_Skip_First_Thorus_KickAss()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAss_15_00"); //Powiedział, że mam ci dać porządnego kopa w dupę jeśli będziesz sprawiał kłopoty.
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAss_12_01"); //Naprawdę? Wiesz co? Zrobimy inaczej: jeśli nie wyjdziesz stąd w tej chwili, to TY dostaniesz kopa w dupę!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_AskHim()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_AskHim_15_00"); //Jeśli mi nie wierzysz, idź i sam go zapytaj.
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_01"); //Oczywiście, że zapytam! Ale nie teraz. Założę się, że zainteresują go historie, które o nim opowiadasz.
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_02"); //Nie wiem kto cię tu wpuścił, ale radziłbym ci wynosić się stąd, póki jeszcze możesz.
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_KickAssAGAIN()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00"); //Powiedział, że mam ci dać porządnego kopa w dupę jeśli będziesz sprawiał kłopoty.
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAssAGAIN_12_01"); //Dobra, stary, czego potrzebujesz?
	Info_ClearChoices 	(DIA_Skip_First);
	Skip_TradeFree = TRUE;
};

// **************************************
//			VERPATZT
// **************************************

instance  DIA_Skip_VERPATZT (C_INFO)
{
	npc			=  GRD_211_Skip;
	nr			=  1;
	condition	=  DIA_Skip_VERPATZT_Condition;
	information	=  DIA_Skip_VERPATZT_Info;
	permanent	=  1;
	description = "Pomyślałem, że zajrzę do ciebie i zapytam o to wyposażenie...";
};                       

FUNC int  DIA_Skip_VERPATZT_Condition()
{
	if 	( 
		( !( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) ) )
		&& ( (Npc_KnowsInfo(hero,DIA_Skip_First)) && (Skip_TradeFree == FALSE) ) 
		)
	{	
		return 1;
	};
};

FUNC VOID  DIA_Skip_VERPATZT_Info()
{
	AI_Output (other, self,"DIA_Skip_VERPATZT_15_00"); //Pomyślałem, że zajrzę do ciebie i zapytam o to wyposażenie...
	AI_Output (self, other,"DIA_Skip_VERPATZT_12_01"); //Spadaj!
};

/*------------------------------------------------------------------------
							Waffenhandel								
------------------------------------------------------------------------*/

instance  GRD_211_Skip_TRADE (C_INFO)
{
	npc				= GRD_211_Skip;
	condition		= GRD_211_Skip_TRADE_Condition;
	information		= GRD_211_Skip_TRADE_Info;
	permanent		= 1;
	description		= "Przydałoby mi się kilka drobiazgów."; 
	trade 			= 1;
};

FUNC int  GRD_211_Skip_TRADE_Condition()
{
	if ( (Npc_GetTrueGuild(other)==GIL_STT) || (Npc_GetTrueGuild(other)==GIL_GRD) || (Npc_GetTrueGuild(other)==GIL_KDF) 
			||	(Skip_TradeFree == TRUE) )
	{
		return TRUE;
	};
};


FUNC void  GRD_211_Skip_TRADE_Info()
{
	AI_Output (other, self,"GRD_211_Skip_TRADE_Info_15_01"); //Przydałoby mi się kilka drobiazgów.
	AI_Output (self, other,"GRD_211_Skip_TRADE_Info_12_02"); //Mam kilka drobiazgów na sprzedaż.
};  

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_211_Skip_WELCOME (C_INFO)
{
	npc				= GRD_211_Skip;
	condition		= GRD_211_Skip_WELCOME_Condition;
	information		= GRD_211_Skip_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_211_Skip_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_211_Skip_WELCOME_Info()
{
	AI_Output (self, other,"GRD_211_Skip_WELCOME_Info_12_01"); //Hej, daleko zaszedłeś, jak na kogoś, kto jest tu tak krótko.
};
