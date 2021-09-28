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
	description	= "Przysy³a mnie Ghorim.";
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
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_15_00"); //Przysy³a mnie Ghorim.
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_01_01"); //Co?
	Info_ClearChoices 	(DIA_Harlok_FetchHarlok);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,DIALOG_BACK															,DIA_Harlok_FetchHarlok_BACK);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,"Rusz dupê do roboty, albo dostaniesz kopa!",DIA_Harlok_FetchHarlok_OrElse);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,"Mam ci przypomnieæ, ¿e powinieneœ go wreszcie zluzowaæ.",DIA_Harlok_FetchHarlok_Please);
};

func int DIA_Harlok_FetchHarlok_Please()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_Please_15_00"); //Mam ci przypomnieæ, ¿e powinieneœ go wreszcie zluzowaæ.
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_Please_01_01"); //To bardzo mi³o z twojej strony. Przypomnij mi znowu, jak ju¿ siê wyœpiê, dobra?
};

func int DIA_Harlok_FetchHarlok_OrElse()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_OrElse_15_00"); //Rusz dupê do roboty, albo dostaniesz kopa!
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_OrElse_01_01"); //Tylko spróbuj mi podskoczyæ, frajerze!
	
	AI_StopProcessInfos(self);
};

func int DIA_Harlok_FetchHarlok_BACK()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_BACK_15_00"); //Dobra, dobra.
	Info_ClearChoices (DIA_Harlok_FetchHarlok);
};


// **************************************************
//				Harlok NOCHMAL überzeugen
// **************************************************

instance  DIA_Harlok_HarlokAgain (C_INFO)
{
	npc			= Nov_1358_Harlok;
	nr			= 1;
	condition	= DIA_Harlok_HarlokAgain_Condition;
	information	= DIA_Harlok_HarlokAgain_Info;
	permanent	= 0;
	description	= "Chcia³em ci tylko przypomnieæ, ¿e masz zmieniæ twojego kolegê.";
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
	AI_Output (other, self,"DIA_Harlok_HarlokAgain_15_00"); //Chcia³em ci tylko przypomnieæ, ¿e masz zmieniæ twojego kolegê.
	AI_Output (self, other,"DIA_Harlok_HarlokAgain_01_01"); //S³uchaj, koleœ. Kaza³em ci spadaæ!

	B_LogEntry(CH1_GhorimsRelief,"Harlok jest nie tylko leniwy, ale i bardzo uparty. Chyba powinienem byæ bardziej stanowczy...");
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
	description	= "No i co? Masz ju¿ ochotê zmieniæ swojego kolegê?";
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
	AI_Output	(other, self,"DIA_Harlok_SendHarlok_15_00"); //No i co? Masz ju¿ ochotê zmieniæ swojego kolegê?
	AI_Output	(self, other,"DIA_Harlok_SendHarlok_01_01"); //Wiesz co? Jesteœ jak wrzód na ty³ku! Czemu wtykasz nos w nie swoje sprawy?
	AI_Output	(other, self,"DIA_Harlok_SendHarlok_15_02"); //Chcia³em tylko zobaczyæ ciê przy pracy...
	AI_Output	(self, other,"DIA_Harlok_SendHarlok_01_03"); //Dobra, dobra - ju¿ idê... Frajer!

	B_LogEntry	(CH1_GhorimsRelief,"Harlok wreszcie ruszy³ ty³ek. Wkrótce zmieni Ghorima.");
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
	AI_Output (self, other,"DIA_Harlok_Angry_01_00"); //Zostaw mnie w spokoju! Przecie¿ ju¿ idê!

	AI_StopProcessInfos	(self);
};


	
	
	
