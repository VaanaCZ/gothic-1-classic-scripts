// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Cavalorn_Exit (C_INFO)
{
	npc			= STT_336_Cavalorn;
	nr			= 999;
	condition	= DIA_Cavalorn_Exit_Condition;
	information	= DIA_Cavalorn_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Cavalorn_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Cavalorn_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich J�ger
// **************************************************

INSTANCE DIA_cavalorn_Hunter (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Hunter_Condition;
	information		= DIA_cavalorn_Hunter_Info;
	permanent		= 0;
	description		= "Co d�l� tady venku?"; 
};

FUNC INT DIA_cavalorn_Hunter_Condition()
{	
	return 1;	
};

FUNC VOID DIA_cavalorn_Hunter_Info()
{
	AI_Output (other, self,"DIA_cavalorn_Hunter_15_00"); //Co d�l� tady venku?
	AI_Output (self, other,"DIA_cavalorn_Hunter_12_01"); //Jsem lovec - lov�m p�edev��m mrcho�routy..
	
};

// **************************************************
// 						Lehrer
// **************************************************

INSTANCE DIA_cavalorn_Lehrer (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Lehrer_Condition;
	information		= DIA_cavalorn_Lehrer_Info;
	permanent		= 1;
	description		= "M��e� m� nau�it n�co o lovu?"; 
};

FUNC INT DIA_cavalorn_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return 1;	
	};
};

FUNC VOID DIA_cavalorn_Lehrer_Info()
{
	if (log_cavalorntrain == FALSE)
	{
		Log_CreateTopic (GE_TeacherOW,LOG_NOTE);
		B_LogEntry		(GE_TeacherOW,"Cavalorn je lovec. M��e m� nau�it PL͎EN� a tak� LUKOST�ELB�. �ije v chatr�i mezi Star�m a Nov�m t�borem.");
		log_cavalorntrain = TRUE;
	};
	AI_Output (other, self,"DIA_cavalorn_Lehrer_15_00"); //M��e� m� nau�it n�co o lovu?
	AI_Output (self, other,"DIA_cavalorn_Lehrer_12_01"); //To z�le�� - co chce� um�t?
	
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
	Info_AddChoice		(DIA_cavalorn_Lehrer,DIALOG_BACK															,DIA_cavalorn_Lehrer_BACK);

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_2,		LPCOST_TALENT_BOW_2,0)	,DIA_cavalorn_Lehrer_Bow_2);
	};

	if	(Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnBow_1,		LPCOST_TALENT_BOW_1,0)	,DIA_cavalorn_Lehrer_Bow);
	};
	
	if	(Npc_GetTalentSkill (hero,NPC_TALENT_SNEAK) == 0)
	{
		Info_AddChoice		(DIA_cavalorn_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)	,DIA_cavalorn_Lehrer_Schleichen);
	};
};

func void DIA_cavalorn_Lehrer_BACK()
{
	Info_ClearChoices	(DIA_cavalorn_Lehrer );
};

func void DIA_Cavalorn_Lehrer_Bow()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 1, LPCOST_TALENT_BOW_1))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Bow_15_00"); //M��e� m� nau�it, jak se zlep�it v zach�zen� s lukem?
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_01"); //Pro za��te�n�ka nen� t�k� se zlep�it. Je to ot�zka postoje.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Rozkro� nohy hodn� od sebe, dr� ruce ve stejn� v��ce, nadechni se - a vyst�el!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_03"); //Pokud zas�hne� ur�it� partie t�la, sta�� jedin� v�st�el. Jako za��te�n�k m� jen nepatrnou nad�ji zas�hnout tyhle partie.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_04"); //Jestli si ale zapamatuje�, co ti �eknu, bude� u� p��t� lep��.
	};
};

func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Chci se nau�it pl�it.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //Dobr� n�pad. To je nejd�le�it�j�� v�c, kdy� se chce� nepozorovan� dostat do n��� chalupy.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //P�i ch�zi se mus� prohnout v kolenou, abys vid�l l�p na zem a z�rove� mohl l�p kontrolovat cel� t�lo.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //Ka�d� si ale tv�ho postoje v�imne, a tak mus� db�t na to, aby t� nikdo p�i pl�en� nevid�l.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Pamatuj si, co jsem ti �ekl, ale p�edev��m - nikdy se nenech p�istihnout!
	};
};
func void DIA_Cavalorn_Lehrer_Bow_2()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //U� jsi dobr� lovec. Te� si osvoj� zb�vaj�c� v�domosti.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //Aby ses stal dobr�m st�elcem, mus� se o to p�estat sna�it.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Objev z�kony zraku, nap�t�, dr�hy a c�le. V�dy bu� ve st�ehu a bu� p�ipraven�.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //Te� u� jsi velmi dob�e zvl�dl techniku. Tak poj� a vyzkou�ej sv� znalosti a um�n�.
	};
};
/*------------------------------------------------------------------------
						BOGEN KAUFEN						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_SELLBOW (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_SELLBOW_Condition;
	information		= STT_336_cavalorn_SELLBOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Kde dostanu luk?"; 
};

FUNC int  STT_336_cavalorn_SELLBOW_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_cavalorn_Hunter))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_SELLBOW_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //Kde dostanu luk?
	AI_Output (self, other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //Tady. Prod�v�m nejlep�� luky ve Star�m t�bo�e.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Cavalorn obchoduje s LUKY a ��PY. Najdu ho na cest� k Nov�mu t�boru, v ka�onu na z�pad od Star�ho t�bora.");
};  

/*------------------------------------------------------------------------
						TRADE						
------------------------------------------------------------------------*/

instance  STT_336_cavalorn_TRADE (C_INFO)
{
	npc				= STT_336_cavalorn;
	condition		= STT_336_cavalorn_TRADE_Condition;
	information		= STT_336_cavalorn_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Uka� mi svoje zbo��."; 
	trade 			= 1;
};

FUNC int  STT_336_cavalorn_TRADE_Condition()
{	
	if (Npc_KnowsInfo (hero,STT_336_cavalorn_SELLBOW))
	{
		return TRUE;
	};

};
FUNC void  STT_336_cavalorn_TRADE_Info()
{
	AI_Output (other, self,"STT_336_cavalorn_TRADE_Info_15_01"); //Uka� mi svoje zbo��.
	
};  








