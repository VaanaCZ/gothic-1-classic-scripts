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
	AI_Output		(self, other,"DIA_STT_315_Sly_10_01"); //Jesteœ tu nowy, co? Nigdy wczeœniej ciê tu nie widzia³em.
	AI_Output		(self, other,"DIA_STT_315_Sly_10_02"); //Jestem Z³y. Mam pewn¹ robotê dla takiego ¿ó³todzioba jak ty.
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
	description		= "Masz dla mnie robotê? O co chodzi?";
};

FUNC INT DIA_STT_315_LostNek_Condition()
{	
	return 1;		
};

func VOID DIA_STT_315_LostNek_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_15_00"); //Masz dla mnie robotê? O co chodzi?
	AI_Output (self, other,"DIA_STT_315_LostNek_10_01"); //Znikn¹³ gdzieœ jeden z naszych stra¿ników. Nazywa siê Nek. Mo¿liwe, ¿e da³ nogê do Nowego Obozu.
	AI_Output (self, other,"DIA_STT_315_LostNek_10_02"); //Jesteœ tu nowy i zagl¹dasz w ka¿dy k¹t. Po prostu miej oczy szeroko otwarte.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_03"); //Jeœli uda ci siê go znaleŸæ, bêdziesz móg³ liczyæ na moje poparcie.
	};
	Info_ClearChoices	(DIA_STT_315_LostNek);
	Info_AddChoice		(DIA_STT_315_LostNek,"Postaram siê go odnaleŸæ.",DIA_STT_315_LostNek_DoIt);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_STT_315_LostNek,"A co mi przyjdzie z twojego poparcia?",DIA_STT_315_LostNek_Why);
	};
};

func void DIA_STT_315_LostNek_Why()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_Why_15_00"); //A co mi przyjdzie z twojego poparcia?
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_01"); //Jeœli chcesz do³¹czyæ do naszego obozu, musisz zjednaæ sobie poparcie kilku wp³ywowych ludzi.
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_02"); //Gdybym szepn¹³ o tobie dobre s³owo, Diego spojrza³by na ciebie o wiele przychylniej.
};

func void DIA_STT_315_LostNek_DoIt()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_00"); //Postaram siê go odnaleŸæ.
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_01"); //Jakbyœ spotka³ Fletchera, mo¿esz go zapytaæ o Neka. Fletcher przej¹³ jego rewir po tym ca³ym tajemniczym znikniêciu.
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_02"); //Gdzie znajdê Fletchera?
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_03"); //Zwykle patroluje teren wokó³ areny.
	Sly_LostNek = LOG_RUNNING;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Niejaki Z³y obieca³ mi wstawiennictwo u Diego, jeœli znajdê Neka. Zachodzi podejrzenie, ¿e Stra¿nik zbieg³ do Nowego Obozu. Mam zapytaæ o niego Fletchera. Znajdê go w pobli¿u areny.");
	}
	else
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Niejaki Z³y poprosi³ mnie o znalezienie Neka. Zachodzi podejrzenie, ¿e Stra¿nik zbieg³ do Nowego Obozu. Mam zapytaæ o niego Fletchera. Znajdê go w pobli¿u areny.");
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
	description		= "Znalaz³em Neka.";
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
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_15_00"); //Znalaz³em Neka.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_10_01"); //To œwietnie! A masz na to jakieœ dowody?
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Nie, obawiam siê, ¿e nie.",DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Znalaz³em przy nim ten amulet. Proszê, oto on.",DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //Znalaz³em przy nim ten amulet. Proszê, oto on.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //W³aœnie o ten amulet mi chodzi³o. M¹dry z ciebie ch³opak.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //Za³o¿ê siê, ¿e kusi³o ciê, ¿eby zachowaæ ten amulet dla siebie, co? Spokojnie, dokona³eœ m¹drego wyboru.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	{
		AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //Jakby Diego pyta³ o ciebie, opowiem siê za tob¹.
	};
	Sly_LostNek = LOG_SUCCESS;
	
	B_GiveInvItems (other, self, Neks_Amulett, 1);
	
	Log_SetTopicStatus		(CH1_LostNek, LOG_SUCCESS);
	B_LogEntry				(CH1_LostNek,"Da³em Z³emu amulet Neka. Nie móg³ siê nadziwiæ mojej uczciwoœci.");
	
	B_GiveXP (XP_Slysearchfornek);		
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC, LOG_RUNNING);
		B_LogEntry			(CH1_JoinOC,"Da³em Z³emu amulet Neka, zyskuj¹c tym samym wa¿nego sprzymierzeñca.");
	}
	else
	{	
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus  (CH1_JoinOC, LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,"Da³em Z³emu amulet Neka. Szkoda tylko, ¿e nie mogê ju¿ zostaæ Cieniem.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};


func void DIA_STT_315_LostNekSuccess_NoProof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //Nie, obawiam siê, ¿e nie.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //Serio? Chyba nic przede mn¹ nie ukrywasz, co? Nek mia³ przy sobie taki dziwny amulet.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //Nie lubiê jak ktoœ ukrywa przede mn¹ rzeczy, które nale¿¹ do mnie. Jakbyœ znalaz³ ten amulet, przynieœ go mi!
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //Postaram siê o tym pamiêtaæ, kiedy ju¿ znajdê ten amulet.
	
	B_LogEntry( CH1_LostNek,"Z³y chce dostaæ amulet Neka.");
	
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
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //Œwietnie! Jeœli o mnie chodzi - Diego us³yszy, ¿e równy z ciebie goœæ!
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //Rêka rêkê myje, co?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //Dok³adnie.
};


	
	
	




		
		
