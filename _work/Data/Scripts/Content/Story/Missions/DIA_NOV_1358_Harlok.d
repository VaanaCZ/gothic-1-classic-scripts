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
	description	= "Przysy�a mnie Ghorim.";
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
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_15_00"); //Przysy�a mnie Ghorim.
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_01_01"); //Co?
	Info_ClearChoices 	(DIA_Harlok_FetchHarlok);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,DIALOG_BACK															,DIA_Harlok_FetchHarlok_BACK);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,"Rusz dup� do roboty, albo dostaniesz kopa!",DIA_Harlok_FetchHarlok_OrElse);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,"Mam ci przypomnie�, �e powiniene� go wreszcie zluzowa�.",DIA_Harlok_FetchHarlok_Please);
};

func int DIA_Harlok_FetchHarlok_Please()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_Please_15_00"); //Mam ci przypomnie�, �e powiniene� go wreszcie zluzowa�.
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_Please_01_01"); //To bardzo mi�o z twojej strony. Przypomnij mi znowu, jak ju� si� wy�pi�, dobra?
};

func int DIA_Harlok_FetchHarlok_OrElse()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_OrElse_15_00"); //Rusz dup� do roboty, albo dostaniesz kopa!
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_OrElse_01_01"); //Tylko spr�buj mi podskoczy�, frajerze!
	
	AI_StopProcessInfos(self);
};

func int DIA_Harlok_FetchHarlok_BACK()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_BACK_15_00"); //Dobra, dobra.
	Info_ClearChoices (DIA_Harlok_FetchHarlok);
};


// **************************************************
//				Harlok NOCHMAL �berzeugen
// **************************************************

instance  DIA_Harlok_HarlokAgain (C_INFO)
{
	npc			= Nov_1358_Harlok;
	nr			= 1;
	condition	= DIA_Harlok_HarlokAgain_Condition;
	information	= DIA_Harlok_HarlokAgain_Info;
	permanent	= 0;
	description	= "Chcia�em ci tylko przypomnie�, �e masz zmieni� twojego koleg�.";
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
	AI_Output (other, self,"DIA_Harlok_HarlokAgain_15_00"); //Chcia�em ci tylko przypomnie�, �e masz zmieni� twojego koleg�.
	AI_Output (self, other,"DIA_Harlok_HarlokAgain_01_01"); //S�uchaj, kole�. Kaza�em ci spada�!

	B_LogEntry(CH1_GhorimsRelief,"Harlok jest nie tylko leniwy, ale i bardzo uparty. Chyba powinienem by� bardziej stanowczy...");
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
	description	= "No i co? Masz ju� ochot� zmieni� swojego koleg�?";
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
	AI_Output	(other, self,"DIA_Harlok_SendHarlok_15_00"); //No i co? Masz ju� ochot� zmieni� swojego koleg�?
	AI_Output	(self, other,"DIA_Harlok_SendHarlok_01_01"); //Wiesz co? Jeste� jak wrz�d na ty�ku! Czemu wtykasz nos w nie swoje sprawy?
	AI_Output	(other, self,"DIA_Harlok_SendHarlok_15_02"); //Chcia�em tylko zobaczy� ci� przy pracy...
	AI_Output	(self, other,"DIA_Harlok_SendHarlok_01_03"); //Dobra, dobra - ju� id�... Frajer!

	B_LogEntry	(CH1_GhorimsRelief,"Harlok wreszcie ruszy� ty�ek. Wkr�tce zmieni Ghorima.");
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
	AI_Output (self, other,"DIA_Harlok_Angry_01_00"); //Zostaw mnie w spokoju! Przecie� ju� id�!

	AI_StopProcessInfos	(self);
};


	
	
	
