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
	AI_Output		(self, other,"DIA_STT_315_Sly_10_01"); //Jsi tady nový, že jo? Neznám tvou tvář.
	AI_Output		(self, other,"DIA_STT_315_Sly_10_02"); //Jsem Sly. Nabízím nováčkům práci.
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
	description		= "Máš pro mě práci? Jakou?";
};

FUNC INT DIA_STT_315_LostNek_Condition()
{	
	return 1;		
};

func VOID DIA_STT_315_LostNek_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_15_00"); //Máš pro mě práci? Jakou?
	AI_Output (self, other,"DIA_STT_315_LostNek_10_01"); //Jeden z našich stráží zmizel! Jmenoval se Nek. Možná odešel do Nového tábora.
	AI_Output (self, other,"DIA_STT_315_LostNek_10_02"); //Jsi tady nový a už ses stal docela známý. Takže měj pořád oči na stopkách.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_03"); //Jestli ho najdeš, přimluvím se za tebe v táboře.
	};
	Info_ClearChoices	(DIA_STT_315_LostNek);
	Info_AddChoice		(DIA_STT_315_LostNek,"Uvidím, jestli ho dokážu najít.",DIA_STT_315_LostNek_DoIt);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_STT_315_LostNek,"Co mám udělat, aby ses za mě přimluvil?",DIA_STT_315_LostNek_Why);
	};
};

func void DIA_STT_315_LostNek_Why()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_Why_15_00"); //Co mám udělat, aby ses za mě přimluvil?
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_01"); //Jestli se chceš přidat do tábora, budeš potřebovat lidi, kteří se za tebe přimluví.
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_02"); //Když se za tebe u Diega přimluvím, velice ti to pomůže.
};

func void DIA_STT_315_LostNek_DoIt()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_00"); //Uvidím, jestli ho dokážu najít.
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_01"); //Jestli potkáš Fletchera, zeptej se ho na Neka. Dohlíží na jeho obvod od doby, co Nek zmizel.
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_02"); //Kde ho najdu?
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_03"); //Jeho obvod je kolem arény.
	Sly_LostNek = LOG_RUNNING;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Sly, jeden ze Stínů, slíbil, že jestli najdu Neka, tak se za mě přimluví u Diega. Tento strážce se měl přidat k Novému táboru. Zeptám se na Neka Fletchera z obvodu arény.");
	}
	else
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Sly, jeden ze Stínů, mě požádal, abych našel nezvěstného strážce Neka. Tento strážce se měl přidat k Novému táboru. Zeptám se na Neka Fletchera z obvodu arény.");
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
	description		= "Našel jsem Neka.";
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
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_15_00"); //Našel jsem Neka.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_10_01"); //Dobře! Máš pro to nějaké důkazy?
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Obávám se, že ne.",DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Našel jsem u něj jeho amulet - tady.",DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //Našel jsem u něho jeho amulet - tady.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //Ten amulet bylo skutečně všechno, co u sebe měl. Jsi šikovný chlapík.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //Možná sis mohl pomyslet, že by sis ten amulet nechal, ale rozhodl ses správně.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	{
		AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //Jestli se mě Diego na tebe zeptá, vyslovím se ve tvůj prospěch.
	};
	Sly_LostNek = LOG_SUCCESS;
	
	B_GiveInvItems (other, self, Neks_Amulett, 1);
	
	Log_SetTopicStatus		(CH1_LostNek, LOG_SUCCESS);
	B_LogEntry				(CH1_LostNek,"Dal jsem Slyovi Nekův amulet. Byl ohromen mojí poctivostí.");
	
	B_GiveXP (XP_Slysearchfornek);		
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC, LOG_RUNNING);
		B_LogEntry			(CH1_JoinOC,"Dal jsem Slyovi Nekův amulet. Přimluví se za mě u Diega.");
	}
	else
	{	
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus  (CH1_JoinOC, LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,"Dal jsem Slyovi Nekův amulet. Bohužel však z toho nebudu mít nic - Ke Starému táboru se už nemohu přidat.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};


func void DIA_STT_315_LostNekSuccess_NoProof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //Obávám se, že ne.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //Och? Přede mnou nic neschováš, jasný? Nek měl u sebe amulet.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //Nemám rád lidi, kteří mi berou moje věci. Kdybys ten amulet našel, přines mi ho!
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //Budu na tebe myslet, až budu mít ten amulet v ruce.
	
	B_LogEntry( CH1_LostNek,"Sly chce Nekův amulet.");
	
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
	description		= "Jak to jde?";
	
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
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_00"); //Jak to jde?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //Dobře! Se mnou si už nemusíš dělat s Diegem žádné starosti.
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //Ruka ruku myje, co?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //Tak to je.
};


	
	
	




		
		
