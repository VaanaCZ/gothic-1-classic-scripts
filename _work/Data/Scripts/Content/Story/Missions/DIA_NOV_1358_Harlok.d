// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Harlok_Exit (C_INFO)
{
	npc			= Nov_1358_Harlok;
	nr			= 999;
	condition	= DIA_Harlok_Exit_Condition;
	information	= DIA_Harlok_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Harlok_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Harlok_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Harlok abholen
// **************************************************

instance  DIA_Harlok_FetchHarlok (C_INFO)
{
	npc			= Nov_1358_Harlok;
	nr			= 1;
	condition	= DIA_Harlok_FetchHarlok_Condition;
	information	= DIA_Harlok_FetchHarlok_Info;
	permanent	= 0;
	description	= "Poslal mÏ Ghorim.";
};                       

FUNC int  DIA_Harlok_FetchHarlok_Condition()
{
	if	(Ghorim_KickHarlok == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  DIA_Harlok_FetchHarlok_Info()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_15_00"); //Poslal mÏ Ghorim.
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_01_01"); //Coûe?
	Info_ClearChoices 	(DIA_Harlok_FetchHarlok);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,DIALOG_BACK															,DIA_Harlok_FetchHarlok_BACK);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,"Pohni sv˝m zadkem k mÌsiË˘m drogy, nebo uvidÌö.",DIA_Harlok_FetchHarlok_OrElse);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,"M·m ti p¯ipomenout, ûe ho m·ö vyst¯Ìdat.",DIA_Harlok_FetchHarlok_Please);
};

func int DIA_Harlok_FetchHarlok_Please()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_Please_15_00"); //M·m ti p¯ipomenout, ûe ho m·ö vyst¯Ìdat.
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_Please_01_01"); //To je od tebe hezkÈ. P¯ipomeÚ mi to znova, aû budu sp·t, jo?
};

func int DIA_Harlok_FetchHarlok_OrElse()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_OrElse_15_00"); //Pohni sv˝m zadkem k mÌsiË˘m drogy, nebo uvidÌö.
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_OrElse_01_01"); //ZKUS mÏ s tÌm jeötÏ jednou otravovat, cuc·ku!
	
	AI_StopProcessInfos(self);
};

func int DIA_Harlok_FetchHarlok_BACK()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_BACK_15_00"); //Dob¯e, dob¯e...
	Info_ClearChoices (DIA_Harlok_FetchHarlok);
};


// **************************************************
//				Harlok NOCHMAL ¸berzeugen
// **************************************************

instance  DIA_Harlok_HarlokAgain (C_INFO)
{
	npc			= Nov_1358_Harlok;
	nr			= 1;
	condition	= DIA_Harlok_HarlokAgain_Condition;
	information	= DIA_Harlok_HarlokAgain_Info;
	permanent	= 0;
	description	= "ChtÏl jsem ti jenom p¯ipomenout, ûe bys mÏl ihned vyst¯Ìdat svÈho kamar·da!";
};                       

FUNC int  DIA_Harlok_HarlokAgain_Condition()
{
	if ( (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE) && Npc_KnowsInfo(hero, DIA_Harlok_FetchHarlok) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Harlok_HarlokAgain_Info()
{
	AI_Output (other, self,"DIA_Harlok_HarlokAgain_15_00"); //ChtÏl jsem ti jenom p¯ipomenout, ûe bys mÏl ihned vyst¯Ìdat svÈho kamar·da!
	AI_Output (self, other,"DIA_Harlok_HarlokAgain_01_01"); //Poslouchej! ÿekl jsem ti, aby ses ztratil!

	B_LogEntry(CH1_GhorimsRelief,"Vypad· to, ûe je Harlok nejen lÌn˝, ale takÈ tvrdohlav˝. Snad bych mu mÏl pomoci...");
};


// **************************************************
//				Harlok schicken (nach Aufs-Maul)
// **************************************************

instance  DIA_Harlok_SendHarlok (C_INFO)
{
	npc			= Nov_1358_Harlok;
	nr			= 1;
	condition	= DIA_Harlok_SendHarlok_Condition;
	information	= DIA_Harlok_SendHarlok_Info;
	permanent	= 0;
	description	= "Dobr·, nem·ö pocit, ûe bys mÏl taky nechat svÈho kamar·da odpoËinout?";
};                       

FUNC int  DIA_Harlok_SendHarlok_Condition()
{
	if ( (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE) && Npc_KnowsInfo(hero, DIA_Harlok_FetchHarlok) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Harlok_SendHarlok_Info()
{
	AI_Output	(other, self,"DIA_Harlok_SendHarlok_15_00"); //Dobr·, nem·ö pocit, ûe bys mÏl taky nechat svÈho kamar·da odpoËinout?
	AI_Output	(self, other,"DIA_Harlok_SendHarlok_01_01"); //Ty zatracenej otrapo! ProË se musÌö plÈst do m˝ch vÏcÌ?
	AI_Output	(other, self,"DIA_Harlok_SendHarlok_15_02"); //Akor·t tÏ chci vidÏt pracovat.
	AI_Output	(self, other,"DIA_Harlok_SendHarlok_01_03"); //Dob¯e, dob¯e - uû jdu... cuc·ku!

	B_LogEntry	(CH1_GhorimsRelief,"Harlokovi to koneËnÏ doölo. TeÔ uû vyst¯Ìd· Ghorima.");
	B_GiveXP	(XP_SentHarlok);
	
	Npc_ExchangeRoutine(self,"START");
	var C_NPC Ghorim; Ghorim = Hlp_GetNpc(Nov_1310_Ghorim);
	Npc_ExchangeRoutine(Ghorim,"START");
	Ghorim_KickHarlok = LOG_SUCCESS;
	Npc_SetPermAttitude(Ghorim,ATT_FRIENDLY);
	Npc_SetPermAttitude(self,ATT_ANGRY);
	AI_StopProcessInfos	(self);
};

// **************************************************
//			Harlok REFUSE TALK - PERM
// **************************************************

instance  DIA_Harlok_Angry (C_INFO)
{
	npc			= Nov_1358_Harlok;
	nr			= 1;
	condition	= DIA_Harlok_Angry_Condition;
	information	= DIA_Harlok_Angry_Info;
	permanent	= 1;
	important 	= 1; 
};                       

FUNC int  DIA_Harlok_Angry_Condition()
{
	if (Npc_IsInState(self,ZS_TALK) && (Ghorim_KickHarlok == LOG_SUCCESS) )
	{
		return 1;
	};
};

FUNC VOID  DIA_Harlok_Angry_Info()
{
	AI_Output (self, other,"DIA_Harlok_Angry_01_00"); //Nech mÏ na pokoji! Vûdyù uû dÏl·m...

	AI_StopProcessInfos	(self);
};


	
	
	
