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
// 					NICHT ansprechbar (Ungläubiger) 
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
	Info_Addchoice 		(DIA_BaalOrun_NoTalk,"Wszystko w porz¹dku, kolego?",DIA_BaalOrun_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalOrun_NoTalk,"Niech Œni¹cy bêdzie z tob¹!",DIA_BaalOrun_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalOrun_NoTalk,"Czeœæ! Jestem tu nowy!",DIA_BaalOrun_NoTalk_Hi);
};

func void DIA_BaalOrun_NoTalk_Hi()
{
	AI_Output (other, self,"DIA_BaalOrun_NoTalk_Hi_15_00"); //Czeœæ! Jestem tu nowy!
	AI_Output (self, other,"DIA_BaalOrun_NoTalk_Hi_12_01"); //(Wzdycha)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Sleeper()
{
	AI_Output (other, self,"DIA_BaalOrun_NoTalk_Sleeper_15_00"); //Niech Œni¹cy bêdzie z tob¹!
	AI_Output (self, other,"DIA_BaalOrun_NoTalk_Sleeper_12_01"); //(Wzdycha)
	BaalOrun_Sakrileg = TRUE;
};

func void DIA_BaalOrun_NoTalk_Imp()
{
	AI_Output (other, self,"DIA_BaalOrun_NoTalk_Imp_15_00"); //Wszystko w porz¹dku, kolego?
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
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_00"); //Rozmawia³em z Ghorimem. Odda³eœ jednemu z naszych braci nie lada przys³ugê. Twoja sprawa by³a s³uszna.
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_01"); //Dlatego postanowi³em wyznaczyæ ciê do pewnego szczególnego zadania.
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_02"); //Cor Kalom pilnie potrzebuje do swoich eksperymentów œwie¿ej dostawy bagiennego ziela.
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_12_03"); //Nasi zbieracze pracuj¹ dniem i noc¹. IdŸ do nich i przynieœ wszystko co uzbierali do laboratorium alchemicznego Kaloma.
	
	B_GiveXP			(XP_BaalOrunTalks);
	B_LogEntry			(CH1_GhorimsRelief,"Harlok wreszcie zast¹pi³ Ghorima. Cuda siê zdarzaj¹.");
	Log_SetTopicStatus	(CH1_GhorimsRelief,	LOG_SUCCESS);

	Log_CreateTopic		(CH1_DeliverWeed,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_DeliverWeed,	LOG_RUNNING);
	B_LogEntry			(CH1_DeliverWeed,"Sposób, w jaki poradzi³em sobie z Harlokiem wywar³ wra¿enie na Guru Baal Orunie. Powierzy³ mi zaszczytne zadanie dostarczenia œwie¿ego zbioru bagiennego ziela do laboratorium Cor Kaloma.");
	BaalOrun_FetchWeed = LOG_RUNNING;
	
	Info_ClearChoices 	(DIA_BaalOrun_FirstTalk);
	Info_Addchoice 		(DIA_BaalOrun_FirstTalk,"Nic nie mów.",DIA_BaalOrun_FirstTalk_MuteEnde);
	Info_Addchoice 		(DIA_BaalOrun_FirstTalk,"Gdzie znajdê tych zbieraczy?",DIA_BaalOrun_FirstTalk_Where);
};

func void DIA_BaalOrun_FirstTalk_Where()
{
	AI_Output (other, self,"DIA_BaalOrun_FirstTalk_Where_15_00"); //Gdzie znajdê tych zbieraczy?
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_Where_12_01"); //Nie pozwoli³em ci zwracaæ siê do mnie!
	AI_Output (self, other,"DIA_BaalOrun_FirstTalk_Where_12_02"); //Módl siê, aby Œni¹cy wybaczy³ ci to bluŸnierstwo! A teraz odejdŸ! Twoje zadanie jest niezwykle wa¿ne.
	
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
	AI_Output (self, other,"DIA_BaalOrun_GotWeed_12_00"); //Obroni³eœ naszych zbieraczy...
	AI_Output (self, other,"DIA_BaalOrun_GotWeed_12_01"); //Nie tylko udowodni³eœ, ¿e jesteœ po naszej stronie - pokaza³eœ równie¿, ¿e jesteœ godnym s³ug¹ Œni¹cego.
	AI_Output (self, other,"DIA_BaalOrun_GotWeed_12_02"); //Myœlê, ¿e jesteœ godzien nosiæ szatê Nowicjusza.
	BaalOrun_Ansprechbar = TRUE;

	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_JoinPsi,"Baal Orun nazwa³ mnie godnym s³ug¹ Œni¹cego, gdy¿ obroni³em Nowicjuszy na bagnie przed atakami krwiopijców.");
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
	description = "Zanios³em ziele Cor Kalomowi.";
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
	AI_Output		(other, self,"DIA_BaalOrun_WeedAtKaloms_15_00"); //Zanios³em ziele Cor Kalomowi.
	AI_Output		(self, other,"DIA_BaalOrun_WeedAtKaloms_12_01"); //Dobrze siê spisa³eœ. Mam dla ciebie drobn¹ nagrodê za twoje trudy. Proszê, weŸ to.
	AI_Output		(self, other,"DIA_BaalOrun_WeedAtKaloms_12_02"); //To magiczne zaklêcie snu. Mo¿esz go u¿yæ tylko jeden raz, ale jestem pewien, ¿e kiedyœ ci siê przyda.
	
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
	AI_Output (self, other,"DIA_BaalOrun_Perm_12_01"); //Wytê¿amy wszystkie si³y, ¿eby nad¹¿yæ z produkcj¹. W koñcu musimy zadbaæ o w³asne potrzeby, i jeszcze wymieniaæ czêœæ towaru z innymi obozami.
	AI_Output (self, other,"DIA_BaalOrun_Perm_12_02"); //Ale nasi Nowicjusze chêtnie ponosz¹ tê ofiarê, ku wiêkszej chwale Œni¹cego.
};



