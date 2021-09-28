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
// 					Erste Begr�ssung 
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
	AI_Output		(self, other,"DIA_STT_315_Sly_10_01"); //Jeste� tu nowy, co? Nigdy wcze�niej ci� tu nie widzia�em.
	AI_Output		(self, other,"DIA_STT_315_Sly_10_02"); //Jestem Z�y. Mam pewn� robot� dla takiego ��todzioba jak ty.
};

// **************************************************
// 					Erste Begr�ssung 
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
	description		= "Masz dla mnie robot�? O co chodzi?";
};

FUNC INT DIA_STT_315_LostNek_Condition()
{	
	return 1;		
};

func VOID DIA_STT_315_LostNek_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_15_00"); //Masz dla mnie robot�? O co chodzi?
	AI_Output (self, other,"DIA_STT_315_LostNek_10_01"); //Znikn�� gdzie� jeden z naszych stra�nik�w. Nazywa si� Nek. Mo�liwe, �e da� nog� do Nowego Obozu.
	AI_Output (self, other,"DIA_STT_315_LostNek_10_02"); //Jeste� tu nowy i zagl�dasz w ka�dy k�t. Po prostu miej oczy szeroko otwarte.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_03"); //Je�li uda ci si� go znale��, b�dziesz m�g� liczy� na moje poparcie.
	};
	Info_ClearChoices	(DIA_STT_315_LostNek);
	Info_AddChoice		(DIA_STT_315_LostNek,"Postaram si� go odnale��.",DIA_STT_315_LostNek_DoIt);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_STT_315_LostNek,"A co mi przyjdzie z twojego poparcia?",DIA_STT_315_LostNek_Why);
	};
};

func void DIA_STT_315_LostNek_Why()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_Why_15_00"); //A co mi przyjdzie z twojego poparcia?
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_01"); //Je�li chcesz do��czy� do naszego obozu, musisz zjedna� sobie poparcie kilku wp�ywowych ludzi.
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_02"); //Gdybym szepn�� o tobie dobre s�owo, Diego spojrza�by na ciebie o wiele przychylniej.
};

func void DIA_STT_315_LostNek_DoIt()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_00"); //Postaram si� go odnale��.
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_01"); //Jakby� spotka� Fletchera, mo�esz go zapyta� o Neka. Fletcher przej�� jego rewir po tym ca�ym tajemniczym znikni�ciu.
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_02"); //Gdzie znajd� Fletchera?
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_03"); //Zwykle patroluje teren wok� areny.
	Sly_LostNek = LOG_RUNNING;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Niejaki Z�y obieca� mi wstawiennictwo u Diego, je�li znajd� Neka. Zachodzi podejrzenie, �e Stra�nik zbieg� do Nowego Obozu. Mam zapyta� o niego Fletchera. Znajd� go w pobli�u areny.");
	}
	else
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Niejaki Z�y poprosi� mnie o znalezienie Neka. Zachodzi podejrzenie, �e Stra�nik zbieg� do Nowego Obozu. Mam zapyta� o niego Fletchera. Znajd� go w pobli�u areny.");
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
	description		= "Znalaz�em Neka.";
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
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_15_00"); //Znalaz�em Neka.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_10_01"); //To �wietnie! A masz na to jakie� dowody?
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Nie, obawiam si�, �e nie.",DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Znalaz�em przy nim ten amulet. Prosz�, oto on.",DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //Znalaz�em przy nim ten amulet. Prosz�, oto on.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //W�a�nie o ten amulet mi chodzi�o. M�dry z ciebie ch�opak.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //Za�o�� si�, �e kusi�o ci�, �eby zachowa� ten amulet dla siebie, co? Spokojnie, dokona�e� m�drego wyboru.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	{
		AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //Jakby Diego pyta� o ciebie, opowiem si� za tob�.
	};
	Sly_LostNek = LOG_SUCCESS;
	
	B_GiveInvItems (other, self, Neks_Amulett, 1);
	
	Log_SetTopicStatus		(CH1_LostNek, LOG_SUCCESS);
	B_LogEntry				(CH1_LostNek,"Da�em Z�emu amulet Neka. Nie m�g� si� nadziwi� mojej uczciwo�ci.");
	
	B_GiveXP (XP_Slysearchfornek);		
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC, LOG_RUNNING);
		B_LogEntry			(CH1_JoinOC,"Da�em Z�emu amulet Neka, zyskuj�c tym samym wa�nego sprzymierze�ca.");
	}
	else
	{	
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus  (CH1_JoinOC, LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,"Da�em Z�emu amulet Neka. Szkoda tylko, �e nie mog� ju� zosta� Cieniem.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};


func void DIA_STT_315_LostNekSuccess_NoProof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //Nie, obawiam si�, �e nie.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //Serio? Chyba nic przede mn� nie ukrywasz, co? Nek mia� przy sobie taki dziwny amulet.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //Nie lubi� jak kto� ukrywa przede mn� rzeczy, kt�re nale�� do mnie. Jakby� znalaz� ten amulet, przynie� go mi!
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //Postaram si� o tym pami�ta�, kiedy ju� znajd� ten amulet.
	
	B_LogEntry( CH1_LostNek,"Z�y chce dosta� amulet Neka.");
	
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
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //�wietnie! Je�li o mnie chodzi - Diego us�yszy, �e r�wny z ciebie go��!
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //R�ka r�k� myje, co?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //Dok�adnie.
};


	
	
	




		
		
