// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_GorNaDrak_EXIT (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 999;
	condition	= DIA_GorNaDrak_EXIT_Condition;
	information	= DIA_GorNaDrak_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_GorNaDrak_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begrüssung
// **************************************************

instance  DIA_GorNaDrak_Greet (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Greet_Condition;
	information	= DIA_GorNaDrak_Greet_Info;
	permanent	= 0;
	description  = "Salve! Che state facendo?";
};                       

FUNC int  DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_Greet_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Greet_15_00"); //Salve! Che state facendo?
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_01"); //Riceviamo la secrezione mandibolare dai nostri fratelli della vecchia miniera e la portiamo a Cor Kalom.
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_02"); //Veniamo alla vecchia miniera tutti i giorni proprio per questo motivo.
};

// **************************************************
//					Was ist Sekret
// **************************************************

instance  DIA_GorNaDrak_WasSekret (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WasSekret_Condition;
	information	= DIA_GorNaDrak_WasSekret_Info;
	permanent	= 0;
	description  = "Di che tipo di secrezione si tratta?";
};                       

FUNC int  DIA_GorNaDrak_WasSekret_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_WasSekret_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_WasSekret_15_00"); //Di che tipo di secrezione si tratta?
	AI_Output (self, other,"DIA_GorNaDrak_WasSekret_09_01"); //Si ricava dalle mascelle dei pidocchi di miniera. Se sai come fare, puoi rimuoverle senza perdere la secrezione.
};

// **************************************************
//			 	LERNE: Zangen Nehmen
// **************************************************

instance  DIA_GorNaDrak_TeachMandibles (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_TeachMandibles_Condition;
	information	= DIA_GorNaDrak_TeachMandibles_Info;
	permanent	= 0;
	description  = "Puoi insegnarmi a raccogliere la secrezione dei pidocchi di miniera?";
};                       

FUNC int  DIA_GorNaDrak_TeachMandibles_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WasSekret) && (Knows_GetMCMandibles == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_TeachMandibles_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_TeachMandibles_15_00"); //Puoi insegnarmi a raccogliere la secrezione dai pidocchi di miniera?
	AI_Output (self, other,"DIA_GorNaDrak_TeachMandibles_09_01"); //Certo. Dopo aver ucciso la bestia. Tieni ferma la mascella e tirala tutta fuori. In questo modo, raccoglierai la ghiandola senza distruggerla.
	
	PrintScreen	("Impara: rimuovi mascelle di pidocchi", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Knows_GetMCMandibles = TRUE;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Come rimuovere le mascelle: pidocchi di miniera");
};

// **************************************************
//			 	Wofür ist Sekret da?
// **************************************************

instance  DIA_GorNaDrak_WhatFor (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WhatFor_Condition;
	information	= DIA_GorNaDrak_WhatFor_Info;
	permanent	= 0;
	description  = "Cosa ci fa Cor Kalom con la secrezione?";
};                       

FUNC int  DIA_GorNaDrak_WhatFor_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WasSekret))
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_WhatFor_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_WhatFor_15_00"); //Cosa ci fa Cor Kalom con la secrezione?
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_01"); //Da quel che so, la trasforma in una pozione che aumenta i poteri magici dei novizi.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_02"); //Da quando stiamo preparando la grande evocazione, non ne ha mai a sufficienza.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_03"); //Con l'aiuto della pozione, preparerà i novizi per il gran giorno.
};

// **************************************************
//			 	Kap 1 Permanent
// **************************************************

instance  DIA_GorNaDrak_Permanent (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Permanent_Condition;
	information	= DIA_GorNaDrak_Permanent_Info;
	permanent	= 1;
	description  = "Avete pozione a sufficienza per la grande evocazione del Dormiente?";
};                       

FUNC int  DIA_GorNaDrak_Permanent_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WhatFor) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_Permanent_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Permanent_15_00"); //Avete pozione a sufficienza per la grande evocazione del Dormiente?
	AI_Output (self, other,"DIA_GorNaDrak_Permanent_09_01"); //No. Dobbiamo ancora raccogliere molta secrezione. I nostri cacciatori di pidocchi di miniera lavorano giorno e notte.
};




