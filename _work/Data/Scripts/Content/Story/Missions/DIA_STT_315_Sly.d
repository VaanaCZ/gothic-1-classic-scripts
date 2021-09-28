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
// 					Erste Begrьssung 
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
	AI_Output		(self, other,"DIA_STT_315_Sly_10_01"); //Ты новенький, да? Я тебя здесь еще не видел.
	AI_Output		(self, other,"DIA_STT_315_Sly_10_02"); //Меня зовут Слай. Я предлагаю новичкам работу.
};

// **************************************************
// 					Erste Begrьssung 
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
	description		= "У тебя есть для меня работа? Какая?";
};

FUNC INT DIA_STT_315_LostNek_Condition()
{	
	return 1;		
};

func VOID DIA_STT_315_LostNek_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_15_00"); //У тебя есть для меня работа? Какая?
	AI_Output (self, other,"DIA_STT_315_LostNek_10_01"); //Пропал один из наших стражников. Его зовут Нек. Он мог переметнуться к Новому Лагерю!
	AI_Output (self, other,"DIA_STT_315_LostNek_10_02"); //Ты новенький, ходишь повсюду и не вызываешь подозрений. Так что смотри в оба.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_03"); //Найдешь его, и я замолвлю за тебя словечко в Лагере.
	};
	Info_ClearChoices	(DIA_STT_315_LostNek);
	Info_AddChoice		(DIA_STT_315_LostNek,"Я постараюсь найти его.",DIA_STT_315_LostNek_DoIt);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_STT_315_LostNek,"Что мне с того, что ты замолвишь за меня словечко?",DIA_STT_315_LostNek_Why);
	};
};

func void DIA_STT_315_LostNek_Why()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_Why_15_00"); //Что мне с того, что ты замолвишь за меня словечко?
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_01"); //Для того чтобы присоединиться к нашему Лагерю, нужно заручиться поддержкой многих.
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_02"); //Если я поговорю с Диего, тебе это очень поможет.
};

func void DIA_STT_315_LostNek_DoIt()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_00"); //Я постараюсь найти его.
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_01"); //Если встретишь Флетчера, расспроси его про Нека. Флетчер забрал его район, с тех пор как Нек исчез.
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_02"); //Где мне его искать?
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_03"); //Его район находится возле арены.
	Sly_LostNek = LOG_RUNNING;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Призрак по имени Слай обещал поговорить с Диего, если я сумею отыскать Нека. Этот стражник, должно быть, присоединился к Новому Лагерю. Надо сходить к арене и спросить о нем Флетчера.");
	}
	else
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek,"Призрак по имени Слай попросил меня найти пропавшего стражника Нека. Возможно, что он присоединился к Новому Лагерю. Надо сходить к арене и поговорить об этом с Флетчером.");
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
	description		= "Я нашел Нека.";
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
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_15_00"); //Я нашел Нека.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_10_01"); //Хорошо! И ты можешь это доказать?
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Нет, боюсь, что нет.",DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"На нем был этот амулет - смотри.",DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //На нем был этот амулет - смотри.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //Собственно, из-за этого амулета все и затевалось. Ты умный парень.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //Думаю, ты хотел оставить амулет себе, но в итоге ты поступил верно.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	{
		AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //Если Диего спросит меня, я выскажусь в твою поддержку.
	};
	Sly_LostNek = LOG_SUCCESS;
	
	B_GiveInvItems (other, self, Neks_Amulett, 1);
	
	Log_SetTopicStatus		(CH1_LostNek, LOG_SUCCESS);
	B_LogEntry				(CH1_LostNek,"Я отдал амулет Нека Слаю. Он был очень удивлен моей честностью.");
	
	B_GiveXP (XP_Slysearchfornek);		
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC, LOG_RUNNING);
		B_LogEntry			(CH1_JoinOC,"Я отдал Слаю амулет Нека. Теперь он поговорит обо мне с Диего.");
	}
	else
	{	
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus  (CH1_JoinOC, LOG_FAILED);
		B_LogEntry			(CH1_JoinOC,"Я отдал Слаю амулет Нека. Сделал я это просто так, не из корысти - ведь Старый Лагерь все равно не позволит мне к ним присоединиться.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};


func void DIA_STT_315_LostNekSuccess_NoProof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //Нет, боюсь, что нет.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //Да? Ты ведь ничего от меня не скрываешь, правда? У Нека был один амулет...
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //Не люблю, когда у кого-то оказываются мои вещи. Если найдешь этот амулет, принеси его мне!
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //Если я найду амулет, ты будешь первым, кому я скажу об этом.
	
	B_LogEntry( CH1_LostNek,"Слаю нужен амулет Нека.");
	
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
	description		= "Как дела?";
	
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
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_00"); //Как дела?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //Хорошо! Со мной ты можешь больше не волноваться по поводу Диего!
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //Услуга за услугу, а?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //На том жизнь и стоит.
};


	
	
	




		
		
