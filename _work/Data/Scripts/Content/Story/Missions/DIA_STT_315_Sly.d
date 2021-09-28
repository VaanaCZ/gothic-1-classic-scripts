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
	AI_Output		(self, other,"DIA_STT_315_Sly_10_01"); //Jsi tady nov�, �e jo? Nezn�m tvou tv��.
	AI_Output		(self, other,"DIA_STT_315_Sly_10_02"); //Jsem Sly. Nab�z�m nov��k�m pr�ci.
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
	description		= "M� pro m� pr�ci? Jakou?";
};

FUNC INT DIA_STT_315_LostNek_Condition()
{	
	return 1;		
};

func VOID DIA_STT_315_LostNek_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_15_00"); //M� pro m� pr�ci? Jakou?
	AI_Output (self, other,"DIA_STT_315_LostNek_10_01"); //Jeden z na�ich str�� zmizel! Jmenoval se Nek. Mo�n� ode�el do Nov�ho t�bora.
	AI_Output (self, other,"DIA_STT_315_LostNek_10_02"); //Jsi tady nov� a u� ses stal docela zn�m�. Tak�e m�j po��d o�i na stopk�ch.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_03"); //Jestli ho najde�, p�imluv�m se za tebe v t�bo�e.
	};
	Info_ClearChoices	(DIA_STT_315_LostNek);
	Info_AddChoice		(DIA_STT_315_LostNek,"Uvid�m, jestli ho dok�u naj�t.",DIA_STT_315_LostNek_DoIt);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_STT_315_LostNek,"Co m�m ud�lat, aby ses za m� p�imluvil?",DIA_STT_315_LostNek_Why);
	};
};

func void DIA_STT_315_LostNek_Why()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_Why_15_00"); //Co m�m ud�lat, aby ses za m� p�imluvil?
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_01"); //Jestli se chce� p�idat do t�bora, bude� pot�ebovat lidi, kte�� se za tebe p�imluv�.
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_02"); //Kdy� se za tebe u Diega p�imluv�m, velice ti to pom��e.
};

func void DIA_STT_315_LostNek_DoIt()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_00"); //Uvid�m, jestli ho dok�u naj�t.
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_01"); //Jestli potk� Fletchera, zeptej se ho na Neka. Dohl�� na jeho obvod od doby, co Nek zmizel.
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_02"); //Kde ho najdu?
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_03"); //Jeho obvod je kolem ar�ny.
	Sly_LostNek = LOG_RUNNING;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Sly, jeden ze St�n�, sl�bil, �e jestli najdu Neka, tak se za m� p�imluv� u Diega. Tento str�ce se m�l p�idat k Nov�mu t�boru. Zept�m se na Neka Fletchera z obvodu ar�ny.");
	}
	else
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Sly, jeden ze St�n�, m� po��dal, abych na�el nezv�stn�ho str�ce Neka. Tento str�ce se m�l p�idat k Nov�mu t�boru. Zept�m se na Neka Fletchera z obvodu ar�ny.");
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
	description		= "Na�el jsem Neka.";
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
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_15_00"); //Na�el jsem Neka.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_10_01"); //Dob�e! M� pro to n�jak� d�kazy?
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Ob�v�m se, �e ne.",DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Na�el jsem u n�j jeho amulet - tady.",DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //Na�el jsem u n�ho jeho amulet - tady.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //Ten amulet bylo skute�n� v�echno, co u sebe m�l. Jsi �ikovn� chlap�k.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //Mo�n� sis mohl pomyslet, �e by sis ten amulet nechal, ale rozhodl ses spr�vn�.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	{
		AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //Jestli se m� Diego na tebe zept�, vyslov�m se ve tv�j prosp�ch.
	};
	Sly_LostNek = LOG_SUCCESS;
	
	B_GiveInvItems (other, self, Neks_Amulett, 1);
	
	Log_SetTopicStatus		(CH1_LostNek, LOG_SUCCESS);
	B_LogEntry				(CH1_LostNek,"Dal jsem Slyovi Nek�v amulet. Byl ohromen moj� poctivost�.");
	
	B_GiveXP (XP_Slysearchfornek);		
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC, LOG_RUNNING);
		B_LogEntry			(CH1_JoinOC,"Dal jsem Slyovi Nek�v amulet. P�imluv� se za m� u Diega.");
	}
	else
	{	
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus  (CH1_JoinOC, LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,"Dal jsem Slyovi Nek�v amulet. Bohu�el v�ak z toho nebudu m�t nic - Ke Star�mu t�boru se u� nemohu p�idat.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};


func void DIA_STT_315_LostNekSuccess_NoProof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //Ob�v�m se, �e ne.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //Och? P�ede mnou nic neschov�, jasn�? Nek m�l u sebe amulet.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //Nem�m r�d lidi, kte�� mi berou moje v�ci. Kdybys ten amulet na�el, p�ines mi ho!
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //Budu na tebe myslet, a� budu m�t ten amulet v ruce.
	
	B_LogEntry( CH1_LostNek,"Sly chce Nek�v amulet.");
	
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
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //Dob�e! Se mnou si u� nemus� d�lat s Diegem ��dn� starosti.
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //Ruka ruku myje, co?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //Tak to je.
};


	
	
	




		
		
