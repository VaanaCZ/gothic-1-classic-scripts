// **************************************************
//						EXIT
// **************************************************

instance  DIA_BaalOrun_Exit (C_INFO)
{
	npc			=  Gur_1209_BaalOrun;
	nr			=  999;
	condition	=  DIA_BaalOrun_Exit_Condition;
	information	=  DIA_BaalOrun_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalOrun_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalOrun_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************************************************
// 					NICHT ansprechbar (Ungl�ubiger) 
// ************************************************************
	var int BaalOrun_Ansprechbar;
	var int BaalOrun_Sakrileg;
// ************************************************************

INSTANCE DIA_BaalOrun_NoTalk(C_INFO)
{
	npc				= GUR_1209_BaalOrun;
	nr				= 2;
	condition		= DIA_BaalOrun_NoTalk_Condition;
	information		= DIA_BaalOrun_NoTalk_Info;
	permanent		= 1;
	important 		= 1;
};                       

FUNC INT DIA_BaalOrun_NoTalk_Condition()
{
	if ( Npc_IsInState(self,ZS_TALK) && (BaalOrun_Ansprechbar==FALSE) && (Npc_GetPermAttitude(self,other)!=ATT_FRIENDLY) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalOrun_NoTalk_Info()
{	
	Info_ClearChoices 	(DIA_BaalOrun_NoTalk);
	Info_Addchoice 		(DIA_BaalOrun_NoTalk,DIALOG_ENDE					,DIA_BaalOrun_NoTalk_ENDE);
	Info_Addchoice 		(DIA_BaalOrun_NoTalk,"Wszystko w porz�dku, kolego?",DIA_BaalOrun_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalOrun_NoTalk,"Niech �ni�cy b�dzie z tob�!",DIA_BaalOrun_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalOrun_NoTalk,"Cze��! Jestem tu nowy!",DIA_BaalOrun_NoTalk_Hi);
};

func void DIA_BaalOrun_NoTalk_Hi()
{
	AI_Output (other, self,"DIA_BaalOrun_NoTalk_Hi_15_00"); //Cze��! Jestem tu nowy!
	AI_Output (self, other,"DIA_BaalOrun_NoTalk_Hi_12_01"); //(Wzdycha)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Sleeper()
{
	AI_Output (other, self,"DIA_BaalOrun_NoTalk_Sleeper_15_00"); //Niech �ni�cy b�dzie z tob�!
	AI_Output (self, other,"DIA_BaalOrun_NoTalk_Sleeper_12_01"); //(Wzdycha)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Imp()
{
	AI_Output (other, self,"DIA_BaalOrun_NoTalk_Imp_15_00"); //Wszystko w porz�dku, kolego?
	AI_Output (self, other,"DIA_BaalOrun_NoTalk_Imp_12_01"); //(Wzdycha)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_ENDE()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//		Ghorim_KickHarlok Success + MISSION
// **************************************************
instance  DIA_BaalOrun_FirstTalk (C_INFO)
{
	npc			= Gur_1209_BaalOrun;
	nr			= 1;
	condition	= DIA_BaalOrun_FirstTalk_Condition;
	information	= DIA_BaalOrun_FirstTalk_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalOrun_FirstTalk_Condition()
{
	if (Ghorim_KickHarlok == LOG_SUCCESS)
	{
		BaalOrun_Ansprechbar = TRUE; //damit NoTalk-info nicht kommt
		return 1;
	};
};

FUNC VOID  DIA_BaalOrun_FirstTalk_Info()
{
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_00"); //Rozmawia�em z Ghorimem. Odda�e� jednemu z naszych braci nie lada przys�ug�. Twoja sprawa by�a s�uszna.
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_01"); //Dlatego postanowi�em wyznaczy� ci� do pewnego szczeg�lnego zadania.
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_02"); //Cor Kalom pilnie potrzebuje do swoich eksperyment�w �wie�ej dostawy bagiennego ziela.
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_03"); //Nasi zbieracze pracuj� dniem i noc�. Id� do nich i przynie� wszystko co uzbierali do laboratorium alchemicznego Kaloma.
	
	B_GiveXP			(XP_BaalOrunTalks);
	B_LogEntry			(CH1_GhorimsRelief,"Harlok wreszcie zast�pi� Ghorima. Cuda si� zdarzaj�.");
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_SUCCESS);

	Log_CreateTopic		(CH1_DeliverWeed,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_DeliverWeed,	LOG_RUNNING);
	B_LogEntry			(CH1_DeliverWeed,"Spos�b, w jaki poradzi�em sobie z Harlokiem wywar� wra�enie na Guru Baal Orunie. Powierzy� mi zaszczytne zadanie dostarczenia �wie�ego zbioru bagiennego ziela do laboratorium Cor Kaloma.");
	BaalOrun_FetchWeed = LOG_RUNNING;
	
	Info_ClearChoices 	(DIA_BaalOrun_FirstTalk);
	Info_Addchoice 		(DIA_BaalOrun_FirstTalk,"Nic nie m�w.",DIA_BaalOrun_FirstTalk_MuteEnde);
	Info_Addchoice 		(DIA_BaalOrun_FirstTalk,"Gdzie znajd� tych zbieraczy?",DIA_BaalOrun_FirstTalk_Where);
};

func void DIA_BaalOrun_FirstTalk_Where()
{
	AI_Output (other, self,"DIA_BaalOrun_FirstTalk_Where_15_00"); //Gdzie znajd� tych zbieraczy?
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_Where_12_01"); //Nie pozwoli�em ci zwraca� si� do mnie!
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_Where_12_02"); //M�dl si�, aby �ni�cy wybaczy� ci to blu�nierstwo! A teraz odejd�! Twoje zadanie jest niezwykle wa�ne.
	
	Info_ClearChoices 	(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos	(self);
	BaalOrun_Ansprechbar = FALSE;
};

func void DIA_BaalOrun_FirstTalk_MuteEnde()
{
	Info_ClearChoices 	(DIA_BaalOrun_FirstTalk);
	AI_StopProcessInfos	(self);
	BaalOrun_Ansprechbar = FALSE;
};

// **************************************************
//					Kraut geholt
// **************************************************

instance  DIA_BaalOrun_GotWeed (C_INFO)
{
	npc			= Gur_1209_BaalOrun;
	nr			= 1;
	condition	= DIA_BaalOrun_GotWeed_Condition;
	information	= DIA_BaalOrun_GotWeed_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalOrun_GotWeed_Condition()
{
	if (Viran_Bloodflies == LOG_SUCCESS) //automatisch auch Kraut geholt
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalOrun_GotWeed_Info()
{
	AI_Output (self, other,"DIA_BaalOrun_GotWeed_12_00"); //Obroni�e� naszych zbieraczy...
	AI_Output (self, other,"DIA_BaalOrun_GotWeed_12_01"); //Nie tylko udowodni�e�, �e jeste� po naszej stronie - pokaza�e� r�wnie�, �e jeste� godnym s�ug� �ni�cego.
	AI_Output (self, other,"DIA_BaalOrun_GotWeed_12_02"); //My�l�, �e jeste� godzien nosi� szat� Nowicjusza.
	BaalOrun_Ansprechbar = TRUE;

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_JoinPsi,"Baal Orun nazwa� mnie godnym s�ug� �ni�cego, gdy� obroni�em Nowicjuszy na bagnie przed atakami krwiopijc�w.");
	B_GiveXP			(XP_ImpressedBaalOrun);
};

// **************************************************
//					Kraut abgeliefert!
// **************************************************

instance  DIA_BaalOrun_WeedAtKaloms (C_INFO)
{
	npc			= Gur_1209_BaalOrun;
	nr			= 1;
	condition	= DIA_BaalOrun_WeedAtKaloms_Condition;
	information	= DIA_BaalOrun_WeedAtKaloms_Info;
	permanent	= 0;
	description = "Zanios�em ziele Cor Kalomowi.";
};                       

FUNC int  DIA_BaalOrun_WeedAtKaloms_Condition()
{
	if (BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalOrun_WeedAtKaloms_Info()
{
	AI_Output		(other, self,"DIA_BaalOrun_WeedAtKaloms_15_00"); //Zanios�em ziele Cor Kalomowi.
	AI_Output		(self, other,"DIA_BaalOrun_WeedAtKaloms_12_01"); //Dobrze si� spisa�e�. Mam dla ciebie drobn� nagrod� za twoje trudy. Prosz�, we� to.
	AI_Output		(self, other,"DIA_BaalOrun_WeedAtKaloms_12_02"); //To magiczne zakl�cie snu. Mo�esz go u�y� tylko jeden raz, ale jestem pewien, �e kiedy� ci si� przyda.
	
	BaalOrun_Ansprechbar = TRUE; //damit NoTalk-info nicht kommt
	B_GiveXP		(XP_ReportToBaalOrun);
	
	CreateInvItem	(self,ItArScrollSleep);
	B_GiveInvItems  (self,other,ItArScrollSleep, 1);
};

// **************************************************
//					Permanent
// **************************************************

instance  DIA_BaalOrun_Perm (C_INFO)
{
	npc			= Gur_1209_BaalOrun;
	nr			= 2;
	condition	= DIA_BaalOrun_Perm_Condition;
	information	= DIA_BaalOrun_Perm_Info;
	permanent	= 1;
	description = "Jak przebiega produkcja ziela?";
};                       

FUNC int  DIA_BaalOrun_Perm_Condition()
{
	if (BaalOrun_FetchWeed == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalOrun_Perm_Info()
{
	AI_Output (other, self,"DIA_BaalOrun_Perm_15_00"); //Jak przebiega produkcja ziela?
	AI_Output (self, other,"DIA_BaalOrun_Perm_12_01"); //Wyt�amy wszystkie si�y, �eby nad��y� z produkcj�. W ko�cu musimy zadba� o w�asne potrzeby, i jeszcze wymienia� cz�� towaru z innymi obozami.
	AI_Output (self, other,"DIA_BaalOrun_Perm_12_02"); //Ale nasi Nowicjusze ch�tnie ponosz� t� ofiar�, ku wi�kszej chwale �ni�cego.
};



