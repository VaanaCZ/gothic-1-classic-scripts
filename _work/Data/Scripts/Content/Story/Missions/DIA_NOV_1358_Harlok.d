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
	description	= "Me manda Ghorim.";
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
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_15_00"); //Vengo de parte de Ghorim.
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_01_01"); //�C�mo?
	Info_ClearChoices 	(DIA_Harlok_FetchHarlok);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,DIALOG_BACK															,DIA_Harlok_FetchHarlok_BACK);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,"Mueve tu culo hasta las trituradoras de hierba o te la cargar�s.",DIA_Harlok_FetchHarlok_OrElse);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,"Estoy aqu� para recordarte que tienes que sustituirle.",DIA_Harlok_FetchHarlok_Please);
};

func int DIA_Harlok_FetchHarlok_Please()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_Please_15_00"); //He venido a recordarte que tienes que sustituirle.
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_Please_01_01"); //Muy amable por tu parte. Vuelve a record�rmelo cuando acabe de dormir, �vale?
};

func int DIA_Harlok_FetchHarlok_OrElse()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_OrElse_15_00"); //Mueve el culo y vete a las trituradoras de hierba o te la vas a cargar.
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_OrElse_01_01"); //�Intenta siquiera volver a jugar conmigo, mam�n!
	
	AI_StopProcessInfos(self);
};

func int DIA_Harlok_FetchHarlok_BACK()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_BACK_15_00"); //Vale, vale.
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
	description	= "�Quer�a recordarte que ocuparas el lugar de tu amigo ahora mismo!";
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
	AI_Output (other, self,"DIA_Harlok_HarlokAgain_15_00"); //�S�lo quer�a recordarte que tienes que relevar a tu colega!
	AI_Output (self, other,"DIA_Harlok_HarlokAgain_01_01"); //�Oye, te he dicho que te vayas por ah�!

	B_LogEntry(CH1_GhorimsRelief,"Parece que Harlok no s�lo es vago, sino tambi�n testarudo. Quiz� deba darle un empujoncito...");
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
	description	= "Bueno, �te apetece dar un respiro a tu amigo?";
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
	AI_Output	(other, self,"DIA_Harlok_SendHarlok_15_00"); //Bueno, �te sientes ahora con �nimo de darle un descanso a tu colega?
	AI_Output	(self, other,"DIA_Harlok_SendHarlok_01_01"); //�Maldito incordio de t�o! �Por qu� metes las narices en mis asuntos?
	AI_Output	(other, self,"DIA_Harlok_SendHarlok_15_02"); //Quiero verte haciendo pur�.
	AI_Output	(self, other,"DIA_Harlok_SendHarlok_01_03"); //Vale, vale, ya voy... �mam�n!

	B_LogEntry	(CH1_GhorimsRelief,"Harlok ha captado por fin el mensaje. Ahora sustituir� a Ghorim.");
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
	AI_Output (self, other,"DIA_Harlok_Angry_01_00"); //�D�jame en paz! Ya voy...

	AI_StopProcessInfos	(self);
};


	
	
	
