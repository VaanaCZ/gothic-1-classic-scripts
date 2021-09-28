// **************************** 
//				EXIT 
// ****************************

instance  Info_Nefarius_EXIT (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	999;
	condition	=	Info_Nefarius_EXIT_Condition;
	information	=	Info_Nefarius_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Nefarius_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Nefarius_Hallo (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_Hallo_Condition;
	information	=	Info_Nefarius_Hallo_Info;
	permanent	=	0;
	description =	"Chi sei?";
};                       

FUNC int  Info_Nefarius_Hallo_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_Hallo_Info()
{
	AI_Output (other, self,"Info_Nefarius_Hallo_15_00"); //Chi sei?
	AI_Output (self, other,"Info_Nefarius_Hallo_04_01"); //Sono Nefarius, mago del Circolo dell'Acqua!
};

// **************************** 
//			Wo Saturas
// ****************************

instance  Info_Nefarius_WoSaturas (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	2;
	condition	=	Info_Nefarius_WoSaturas_Condition;
	information	=	Info_Nefarius_WoSaturas_Info;
	permanent	=	0;
	description =	"Dove si trova Saturas?";
};                       

FUNC int  Info_Nefarius_WoSaturas_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_WoSaturas_Info()
{
	AI_Output (other, self,"Info_Nefarius_WoSaturas_15_00"); //Dove si trova Saturas?
	AI_Output (self, other,"Info_Nefarius_WoSaturas_04_01"); //Attraversa il grande portale rotondo, lo troverai lì.
};

// **************************** 
//			WannaMage
// ****************************

instance  Info_Nefarius_WannaMage (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_WannaMage_Condition;
	information	=	Info_Nefarius_WannaMage_Info;
	permanent	=	0;
	description =	"Voglio diventare un mago del Circolo dell'Acqua!";
};                       

FUNC int  Info_Nefarius_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Hallo))
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_WannaMage_Info()
{
	AI_Output (other, self,"Info_Nefarius_WannaMage_15_00"); //Voglio diventare un mago del Circolo dell'Acqua!
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_01"); //(ride) Non così in fretta, ragazzo mio!
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_02"); //Un giovane deve aver fatto qualcosa di grande per essere accettato fra noi.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_03"); //E deve averci serviti per un certo tempo.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_04"); //Se fai sul serio, devi unirti ai nostri mercenari e servirci.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_05"); //E un giorno, forse, avrai la possibilità di compiere un'azione memorabile.
};

// **************************** 
//			NowReady
// ****************************

instance  Info_Nefarius_NowReady (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_NowReady_Condition;
	information	=	Info_Nefarius_NowReady_Info;
	permanent	=	1;
	description =	"Sono pronto per il Circolo dell'Acqua?";
};                       

FUNC int  Info_Nefarius_NowReady_Condition()
{
	if	( !FMTaken && Npc_KnowsInfo(hero, Info_Nefarius_WannaMage) && (Npc_GetTrueGuild(hero)!=GIL_KDW) )
	{
		return 1;
	};	
};

FUNC VOID  Info_Nefarius_NowReady_Info()
{
	AI_Output (other, self,"Info_Nefarius_NowReady_15_00"); //Sono pronto per il Circolo dell'Acqua?
	
	if (Npc_GetTrueGuild (hero) != GIL_SLD) 
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_01"); //Prima entra a far parte dei nostri mercenari, poi vedremo...
	}
	else
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_02"); //Sei diventato uno dei nostri mercenari. Molto bene...
		AI_Output (self, other,"Info_Nefarius_NowReady_04_03"); //Il tempo farà il resto...
	};
};

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////		Kapitel 4				//////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

// **************************** 
//			OCNews
// ****************************

instance  Info_Nefarius_OCNews (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_OCNews_Condition;
	information	=	Info_Nefarius_OCNews_Info;
	permanent	=	0;
	important	= 	1;
};                       

FUNC int  Info_Nefarius_OCNews_Condition()
{
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID  Info_Nefarius_OCNews_Info()
{
	AI_Output (self, other,"Info_Nefarius_OCNews_04_00"); //Ci sono novità dai nostri amici di Campo Vecchio?
	AI_Output (other, self,"Info_Nefarius_OCNews_15_01"); //Gomez ha fatto uccidere tutti i Maghi del Fuoco!
	AI_Output (self, other,"Info_Nefarius_OCNews_04_02"); //No! Quell'idiota! Avevo avvertito Corristo che non ci si doveva fidare di lui! Vai subito a riferire questa notizia a Saturas!
	if (Npc_GetTrueGuild(hero)==GIL_SLD)
	{
		AI_Output (self, other,"Info_Nefarius_OCNews_04_03"); //Aspetta!
		AI_Output (self, other,"Info_Nefarius_OCNews_04_04"); //Hai affrontato grandi pericoli per noi.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_05"); //Credo che tu sia pronto per indossare la veste dei Maghi dell'Acqua.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_06"); //Ma ora corri da Saturas! Svelto!
	};
	AI_StopProcessInfos	(self);
};
