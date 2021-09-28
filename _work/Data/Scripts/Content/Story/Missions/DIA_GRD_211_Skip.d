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
	description = "Czym siê tutaj zajmujesz?";
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
	AI_Output (other, self,"DIA_Skip_First_15_00"); //Czym siê tutaj zajmujesz?
	AI_Output (self, other,"DIA_Skip_First_12_01"); //Dbam o broñ stra¿ników.
	AI_Output (other, self,"DIA_Skip_First_15_02"); //Sprzedajesz orê¿?
	AI_Output (self, other,"DIA_Skip_First_12_03"); //Te¿, ale tylko Gomezowi i jego ludziom.

	if	!Npc_KnowsInfo(hero, DIA_Raven_Equipment)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"Skip, stra¿nik z tylnego dziedziñca, sprzedaje orê¿, ale tylko ludziom Gomeza.");
	};
	
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Rozumiem. Do zobaczenia.",DIA_Skip_First_BACK);
	Info_Addchoice 		(DIA_Skip_First,"Przysy³a mnie Thorus. Kaza³ mi wybraæ sobie jak¹œ broñ.",DIA_Skip_First_Thorus);
	Info_Addchoice 		(DIA_Skip_First,"Przysy³a mnie Gomez. Podobno masz dla mnie jakieœ wyposa¿enie.",DIA_Skip_First_Gomez);
		
};

func void DIA_Skip_First_Gomez()
{
	AI_Output (other, self,"DIA_Skip_First_Gomez_15_00"); //Przysy³a mnie Gomez. Podobno masz dla mnie jakieœ wyposa¿enie.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_01"); //To co zwykle, tak? Nowy pancerz i najlepsza broñ, jak¹ mam na sk³adzie.
	AI_Output (self, other,"DIA_Skip_First_Gomez_12_02"); //Wynoœ siê, albo ciê st¹d wynios¹!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_15_00"); //Przysy³a mnie Thorus. Kaza³ mi wybraæ sobie jak¹œ broñ.
	AI_Output (self, other,"DIA_Skip_First_Thorus_12_01"); //Czy¿by?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Jeœli mi nie wierzysz, idŸ i sam go zapytaj.",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"Mam ci daæ porz¹dnego kopa w dupê jeœli bêdziesz sprawia³ k³opoty.",DIA_Skip_First_Thorus_KickAss);
	Info_Addchoice 		(DIA_Skip_First,"Mam zrobiæ dla niego coœ, czego nie mo¿e zrobiæ ¿aden z ludzi Gomeza.",DIA_Skip_First_Thorus_Stranger);
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
	AI_Output (other, self,"DIA_Skip_First_Thorus_Stranger_15_00"); //Widzisz, mam zrobiæ dla niego coœ, czego nie mo¿e zrobiæ ¿aden z ludzi Gomeza.
	AI_Output (self, other,"DIA_Skip_First_Thorus_Stranger_12_01"); //Tak? I pewnie stary Thorus nie ma nic lepszego do roboty ni¿ przysy³aæ ciê do mnie, co?
	Info_ClearChoices 	(DIA_Skip_First);
	Info_Addchoice 		(DIA_Skip_First,"Jeœli mi nie wierzysz, idŸ i sam go zapytaj.",DIA_Skip_First_Thorus_AskHim);
	Info_Addchoice 		(DIA_Skip_First,"Mam ci daæ porz¹dnego kopa w dupê jeœli bêdziesz sprawia³ k³opoty.",DIA_Skip_First_Thorus_KickAssAGAIN);
};

func void DIA_Skip_First_Thorus_KickAss()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAss_15_00"); //Powiedzia³, ¿e mam ci daæ porz¹dnego kopa w dupê jeœli bêdziesz sprawia³ k³opoty.
	AI_Output (self, other,"DIA_Skip_First_Thorus_KickAss_12_01"); //Naprawdê? Wiesz co? Zrobimy inaczej: jeœli nie wyjdziesz st¹d w tej chwili, to TY dostaniesz kopa w dupê!
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_AskHim()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_AskHim_15_00"); //Jeœli mi nie wierzysz, idŸ i sam go zapytaj.
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_01"); //Oczywiœcie, ¿e zapytam! Ale nie teraz. Za³o¿ê siê, ¿e zainteresuj¹ go historie, które o nim opowiadasz.
	AI_Output (self, other,"DIA_Skip_First_Thorus_AskHim_12_02"); //Nie wiem kto ciê tu wpuœci³, ale radzi³bym ci wynosiæ siê st¹d, póki jeszcze mo¿esz.
	Info_ClearChoices 	(DIA_Skip_First);
	AI_StopProcessInfos	(self);
};

func void DIA_Skip_First_Thorus_KickAssAGAIN()
{
	AI_Output (other, self,"DIA_Skip_First_Thorus_KickAssAGAIN_15_00"); //Powiedzia³, ¿e mam ci daæ porz¹dnego kopa w dupê jeœli bêdziesz sprawia³ k³opoty.
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
	description = "Pomyœla³em, ¿e zajrzê do ciebie i zapytam o to wyposa¿enie...";
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
	AI_Output (other, self,"DIA_Skip_VERPATZT_15_00"); //Pomyœla³em, ¿e zajrzê do ciebie i zapytam o to wyposa¿enie...
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
	description		= "Przyda³oby mi siê kilka drobiazgów."; 
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
	AI_Output (other, self,"GRD_211_Skip_TRADE_Info_15_01"); //Przyda³oby mi siê kilka drobiazgów.
	AI_Output (self, other,"GRD_211_Skip_TRADE_Info_12_02"); //Mam kilka drobiazgów na sprzeda¿.
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
	AI_Output (self, other,"GRD_211_Skip_WELCOME_Info_12_01"); //Hej, daleko zaszed³eœ, jak na kogoœ, kto jest tu tak krótko.
};
