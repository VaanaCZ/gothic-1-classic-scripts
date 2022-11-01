// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_315_Sly_Exit (C_INFO)
{
	npc			= STT_315_Sly;
	nr 			= 999;
	condition	= DIA_STT_315_Sly_Exit_Condition;
	information	= DIA_STT_315_Sly_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_315_Sly_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_315_Sly_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begrüssung 
// **************************************************

instance DIA_STT_315_Sly (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_Condition;
	information		= DIA_STT_315_Sly_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_STT_315_Sly_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_Info()
{
	AI_SetWalkmode	(self, NPC_WALK);
	AI_GotoNpc		(self, other);
	AI_Output		(self, other,"DIA_STT_315_Sly_10_01"); //Jesteś tu nowy, co? Nigdy wcześniej cię tu nie widziałem.
	AI_Output		(self, other,"DIA_STT_315_Sly_10_02"); //Jestem Zły. Mam pewną robotę dla takiego żółtodzioba jak ty.
};

// **************************************************
// 					Erste Begrüssung 
// **************************************************
	var int Sly_LostNek;
// **************************************************

INSTANCE DIA_STT_315_LostNek (C_INFO)
{
	npc				= STT_315_Sly;
	nr 				= 1;
	condition		= DIA_STT_315_LostNek_Condition;
	information		= DIA_STT_315_LostNek_Info;
	permanent		= 0;
	description		= "Masz dla mnie robotę? O co chodzi?";
};

FUNC INT DIA_STT_315_LostNek_Condition()
{	
	return 1;		
};

func VOID DIA_STT_315_LostNek_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_15_00"); //Masz dla mnie robotę? O co chodzi?
	AI_Output (self, other,"DIA_STT_315_LostNek_10_01"); //Zniknął gdzieś jeden z naszych strażników. Nazywa się Nek. Możliwe, że dał nogę do Nowego Obozu.
	AI_Output (self, other,"DIA_STT_315_LostNek_10_02"); //Jesteś tu nowy i zaglądasz w każdy kąt. Po prostu miej oczy szeroko otwarte.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_03"); //Jeśli uda ci się go znaleźć, będziesz mógł liczyć na moje poparcie.
	};
	Info_ClearChoices	(DIA_STT_315_LostNek);
	Info_AddChoice		(DIA_STT_315_LostNek,"Postaram się go odnaleźć.",DIA_STT_315_LostNek_DoIt);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_STT_315_LostNek,"A co mi przyjdzie z twojego poparcia?",DIA_STT_315_LostNek_Why);
	};
};

func void DIA_STT_315_LostNek_Why()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_Why_15_00"); //A co mi przyjdzie z twojego poparcia?
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_01"); //Jeśli chcesz dołączyć do naszego obozu, musisz zjednać sobie poparcie kilku wpływowych ludzi.
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_02"); //Gdybym szepnął o tobie dobre słowo, Diego spojrzałby na ciebie o wiele przychylniej.
};

func void DIA_STT_315_LostNek_DoIt()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_00"); //Postaram się go odnaleźć.
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_01"); //Jakbyś spotkał Fletchera, możesz go zapytać o Neka. Fletcher przejął jego rewir po tym całym tajemniczym zniknięciu.
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_02"); //Gdzie znajdę Fletchera?
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_03"); //Zwykle patroluje teren wokół areny.
	Sly_LostNek = LOG_RUNNING;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Niejaki Zły obiecał mi wstawiennictwo u Diego, jeśli znajdę Neka. Zachodzi podejrzenie, że Strażnik zbiegł do Nowego Obozu. Mam zapytać o niego Fletchera. Znajdę go w pobliżu areny.");
	}
	else
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Niejaki Zły poprosił mnie o znalezienie Neka. Zachodzi podejrzenie, że Strażnik zbiegł do Nowego Obozu. Mam zapytać o niego Fletchera. Znajdę go w pobliżu areny.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNek );
	AI_StopProcessInfos	(self);
};

// **************************************************
// 						SUCCESS
// **************************************************

INSTANCE DIA_STT_315_LostNekSuccess (C_INFO)
{
	npc				= STT_315_Sly;
	nr 				= 1;
	condition		= DIA_STT_315_LostNekSuccess_Condition;
	information		= DIA_STT_315_LostNekSuccess_Info;
	permanent		= 1;
	description		= "Znalazłem Neka.";
};

FUNC INT DIA_STT_315_LostNekSuccess_Condition()
{	
	if ( (Sly_LostNek == LOG_RUNNING) && (Npc_HasItems(other,Neks_Amulett) > 0) )
	{
		return 1;
	};
};

func VOID DIA_STT_315_LostNekSuccess_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_15_00"); //Znalazłem Neka.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_10_01"); //To świetnie! A masz na to jakieś dowody?
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Nie, obawiam się, że nie.",DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Znalazłem przy nim ten amulet. Proszę, oto on.",DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //Znalazłem przy nim ten amulet. Proszę, oto on.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //Właśnie o ten amulet mi chodziło. Mądry z ciebie chłopak.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //Założę się, że kusiło cię, żeby zachować ten amulet dla siebie, co? Spokojnie, dokonałeś mądrego wyboru.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	{
		AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //Jakby Diego pytał o ciebie, opowiem się za tobą.
	};
	Sly_LostNek = LOG_SUCCESS;
	
	B_GiveInvItems (other, self, Neks_Amulett, 1);
	
	Log_SetTopicStatus		(CH1_LostNek, LOG_SUCCESS);
	B_LogEntry				(CH1_LostNek,"Dałem Złemu amulet Neka. Nie mógł się nadziwić mojej uczciwości.");
	
	B_GiveXP (XP_Slysearchfornek);		
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC, LOG_RUNNING);
		B_LogEntry			(CH1_JoinOC,"Dałem Złemu amulet Neka, zyskując tym samym ważnego sprzymierzeńca.");
	}
	else
	{	
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus  (CH1_JoinOC, LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,"Dałem Złemu amulet Neka. Szkoda tylko, że nie mogę już zostać Cieniem.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};


func void DIA_STT_315_LostNekSuccess_NoProof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //Nie, obawiam się, że nie.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //Serio? Chyba nic przede mną nie ukrywasz, co? Nek miał przy sobie taki dziwny amulet.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //Nie lubię jak ktoś ukrywa przede mną rzeczy, które należą do mnie. Jakbyś znalazł ten amulet, przynieś go mi!
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //Postaram się o tym pamiętać, kiedy już znajdę ten amulet.
	
	B_LogEntry( CH1_LostNek,"Zły chce dostać amulet Neka.");
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************

instance DIA_STT_315_Sly_AfterSuccess (C_INFO)
{
	npc				= STT_315_Sly;
	nr				= 1;
	condition		= DIA_STT_315_Sly_AfterSuccess_Condition;
	information		= DIA_STT_315_Sly_AfterSuccess_Info;
	permanent		= 1;
	description		= "Jak leci?";
	
};

FUNC int DIA_STT_315_Sly_AfterSuccess_Condition()
{
	if ( (Kapitel == 1) && (Sly_LostNek == LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_STT_315_Sly_AfterSuccess_Info()
{
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_00"); //Jak leci?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //Świetnie! Jeśli o mnie chodzi - Diego usłyszy, że równy z ciebie gość!
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //Ręka rękę myje, co?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //Dokładnie.
};


	
	
	




		
		
