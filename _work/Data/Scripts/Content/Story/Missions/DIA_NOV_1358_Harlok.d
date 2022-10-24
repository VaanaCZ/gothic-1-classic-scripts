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
	description	= "Меня прислал Горим.";
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
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_15_00"); //Меня прислал Горим.
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_01_01"); //Что?
	Info_ClearChoices 	(DIA_Harlok_FetchHarlok);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,DIALOG_BACK															,DIA_Harlok_FetchHarlok_BACK);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,"Быстро иди к прессу и начинай работать, иначе тебе будет худо!",DIA_Harlok_FetchHarlok_OrElse);
	Info_Addchoice 		(DIA_Harlok_FetchHarlok,"Я должен напомнить тебе, что пора работать."			,DIA_Harlok_FetchHarlok_Please);
};

func int DIA_Harlok_FetchHarlok_Please()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_Please_15_00"); //Я должен напомнить тебе, что пора работать.
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_Please_01_01"); //Ой, какой ты добрый. Напомни мне об этом, когда я высплюсь, ладно?
};

func int DIA_Harlok_FetchHarlok_OrElse()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_OrElse_15_00"); //Быстро иди к прессу и начинай работать, иначе тебе будет худо!
	AI_Output (self, other,"DIA_Harlok_FetchHarlok_OrElse_01_01"); //Только попробуй подойти ко мне еще раз, щенок!
	
	AI_StopProcessInfos(self);
};

func int DIA_Harlok_FetchHarlok_BACK()
{
	AI_Output (other, self,"DIA_Harlok_FetchHarlok_BACK_15_00"); //Да, ладно, не волнуйся так.
	Info_ClearChoices (DIA_Harlok_FetchHarlok);
};


// **************************************************
//				Harlok NOCHMAL ьberzeugen
// **************************************************

instance  DIA_Harlok_HarlokAgain (C_INFO)
{
	npc			= Nov_1358_Harlok;
	nr			= 1;
	condition	= DIA_Harlok_HarlokAgain_Condition;
	information	= DIA_Harlok_HarlokAgain_Info;
	permanent	= 0;
	description	= "Я просто хотел напомнить тебе, что пора бы сменить твоего друга!";
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
	AI_Output (other, self,"DIA_Harlok_HarlokAgain_15_00"); //Я просто хотел напомнить тебе, что пора бы сменить твоего друга!
	AI_Output (self, other,"DIA_Harlok_HarlokAgain_01_01"); //Слушай! Убирайся отсюда, пока жив!

	B_LogEntry(CH1_GhorimsRelief,	"Кажется, Харлок самый ленивый из всех, кого я видел. Думаю, мне стоит помочь ему собраться с силами...");
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
	description	= "Ну, что, ты уже готов сменить своего друга?";
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
	AI_Output	(other, self,"DIA_Harlok_SendHarlok_15_00"); //Ну, что, ты уже готов сменить своего друга?
	AI_Output	(self, other,"DIA_Harlok_SendHarlok_01_01"); //Сколько можно приставать ко мне?! Не суй свой нос в чужие дела!
	AI_Output	(other, self,"DIA_Harlok_SendHarlok_15_02"); //Просто хотел посмотреть, как ты работаешь.
	AI_Output	(self, other,"DIA_Harlok_SendHarlok_01_03"); //Ладно уж, иду... Я уже иду... 

	B_LogEntry	(CH1_GhorimsRelief,	"Харлок меня правильно понял. Он согласен сменить Горима.");
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
	AI_Output (self, other,"DIA_Harlok_Angry_01_00"); //Да оставь же меня в покое! Я иду, не видишь?!

	AI_StopProcessInfos	(self);
};


	
	
	
