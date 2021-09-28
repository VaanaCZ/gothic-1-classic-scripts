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
// 					Ich Jäger
// **************************************************

INSTANCE DIA_cavalorn_Hunter (C_INFO)
{
	npc				= STT_336_cavalorn;
	nr				= 2;
	condition		= DIA_cavalorn_Hunter_Condition;
	information		= DIA_cavalorn_Hunter_Info;
	permanent		= 0;
	description		= "Che ci fai qua fuori?"; 
};

FUNC INT DIA_cavalorn_Hunter_Condition()
{	
	return 1;	
};

FUNC VOID DIA_cavalorn_Hunter_Info()
{
	AI_Output (other, self,"DIA_cavalorn_Hunter_15_00"); //Cosa stai facendo?
	AI_Output (self, other,"DIA_cavalorn_Hunter_12_01"); //Sono un cacciatore. Soprattutto di saprofagi.
	
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
	description		= "Puoi insegnarmi qualcosa sulla caccia?"; 
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
		B_LogEntry		(GE_TeacherOW,"Cavalorn è un cacciatore. Può insegnarmi a essere FURTIVO e a TIRARE CON L'ARCO. Vive in una capanna fra Campo Vecchio e Campo Nuovo.");
		log_cavalorntrain = TRUE;
	};
	AI_Output (other, self,"DIA_cavalorn_Lehrer_15_00"); //Puoi insegnarmi qualcosa sulla caccia?
	AI_Output (self, other,"DIA_cavalorn_Lehrer_12_01"); //Dipende... Cosa vuoi sapere?
	
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
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Bow_15_00"); //Puoi dirmi come usare meglio l'arco?
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_01"); //Per un principiante non è difficile migliorare. Tutto dipende dalla posizione.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_02"); //Tieni le gambe ben divaricate, le braccia parallele, trattieni il respiro e... scocca!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_03"); //Colpendo certe parti del corpo, ti basterà una sola freccia. Essendo un principiante, non hai molte probabilità di farcela.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Bow_12_04"); //Ma se tieni a mente ciò che ti ho detto, migliorerai a ogni tiro.
	};
};

func void DIA_Cavalorn_Lehrer_Schleichen()
{
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{		
		AI_Output (other, self,"DIA_cavalorn_Lehrer_Schleichen_15_00"); //Voglio imparare a muovermi furtivamente.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_01"); //Buona idea. È la cosa più importante, se desideri entrare nelle capanne e sorprendere qualcuno alle spalle.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_02"); //Piega le ginocchia mentre cammini e vedrai meglio il pavimento. Inoltre, avrai un maggiore controllo sul tuo corpo.
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_03"); //In questa posizione, però, ti vedranno tutti. Controlla che non ci sia nessuno attorno!
		AI_Output (self, other,"DIA_cavalorn_Lehrer_Schleichen_12_04"); //Ricorda ciò che ti ho detto, ma soprattutto: non farti beccare!
	};
};
func void DIA_Cavalorn_Lehrer_Bow_2()
{
	if (B_GiveSkill(other, NPC_TALENT_BOW, 2, LPCOST_TALENT_BOW_2))
	{		
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_02"); //Sei già un bravo cacciatore. Ora imparerai quello che ti manca di sapere.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_03"); //Per diventare un bravo cecchino, devi smettere di provarci.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_04"); //Impara la legge che unisce occhio, tensione, traiettoria e bersaglio. Stai sempre in guardia e pronto in qualsiasi momento.
			AI_Output (self, other,"DIA_Cavalorn_Lehrer_Bow_2_Info_12_05"); //Ora sei diventato davvero esperto. Vai ad applicare ciò che hai imparato.
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
	description		= "Dove posso trovare un arco?"; 
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
	AI_Output (other, self,"STT_336_cavalorn_SELLBOW_Info_15_01"); //Dove posso trovare un arco?
	AI_Output (self, other,"STT_336_cavalorn_SELLBOW_Info_12_02"); //Qui. Ho gli archi migliori di tutto Campo Vecchio.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry (GE_TraderOC,"Cavalorn commercia in ARCHI e FRECCE. Lo troverò sulla strada per Campo Nuovo, nel canyon a ovest di Campo Vecchio. ");
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
	description		= "Mostrami la merce."; 
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
	AI_Output (other, self,"STT_336_cavalorn_TRADE_Info_15_01"); //Mostrami la merce.
	
};  








