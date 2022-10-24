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
	AI_Output		(self, other,"DIA_STT_315_Sly_10_01"); //Я тебя раньше не видел. Ты ведь новенький, не так ли? 
	AI_Output		(self, other,"DIA_STT_315_Sly_10_02"); //Я Слай. Предлагаю новеньким работу.
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
	description		= "Ты можешь предложить мне работу? Какую?";
};

FUNC INT DIA_STT_315_LostNek_Condition()
{	
	return 1;		
};

func VOID DIA_STT_315_LostNek_Info()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_15_00"); //Ты можешь предложить мне работу? Какую?
	AI_Output (self, other,"DIA_STT_315_LostNek_10_01"); //Пропал один из стражников - Нек! Возможно, он ушел в Новый лагерь.
	AI_Output (self, other,"DIA_STT_315_LostNek_10_02"); //Ты новенький здесь, не вызываешь подозрений. Походи по окрестностям, понаблюдай.
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
	AI_Output (self, other,"DIA_STT_315_LostNek_10_03"); //А найдешь его, так я замолвлю словечко за тебя в лагере.
	};
	Info_ClearChoices	(DIA_STT_315_LostNek);
	Info_AddChoice		(DIA_STT_315_LostNek,"Я попробую найти Нека."				,DIA_STT_315_LostNek_DoIt);
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Info_AddChoice		(DIA_STT_315_LostNek,"А что это мне даст какое-то там словечко?"	,DIA_STT_315_LostNek_Why);
	};
};

func void DIA_STT_315_LostNek_Why()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_Why_15_00"); //А что это мне даст какое-то там словечко?
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_01"); //Если хочешь присоединиться к нашему лагерю, то для начала тебе надо заручиться поддержкой наших людей.
	AI_Output (self, other,"DIA_STT_315_LostNek_Why_10_02"); //Тебе только лучше будет, если я поговорю с Диего.
};

func void DIA_STT_315_LostNek_DoIt()
{
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_00"); //Я попробую найти Нека.
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_01"); //Расспроси о нем Флетчера. После исчезновения Нека, он контролирует его район.
	AI_Output (other, self,"DIA_STT_315_LostNek_DoIt_15_02"); //Где я могу его найти?
	AI_Output (self, other,"DIA_STT_315_LostNek_DoIt_10_03"); //Возле арены.
	Sly_LostNek = LOG_RUNNING;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek, "Призрак Слай пообещал мне замолвить за меня словечко, если я найду Нека. Он думает, что этот стражник перебежал в Новый лагерь. Он посоветовал мне расспросить Флетчера, который следит за порядком возле арены.");
	}
	else
	{
		Log_CreateTopic( CH1_LostNek, LOG_MISSION);
		Log_SetTopicStatus( CH1_LostNek, LOG_RUNNING);
		B_LogEntry( CH1_LostNek, "Призрак Слай попросил меня найти стражника Нека. Он думает, что тот убежал в Новый лагерь. Он посоветовал мне поговорить с Флетчером, который следит за порядком возле арены.");
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
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_10_01"); //Хорошо! А доказать можешь?
	
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Нет, не могу."					,DIA_STT_315_LostNekSuccess_NoProof);
	Info_AddChoice		(DIA_STT_315_LostNekSuccess,"Да, на нем был амулет. Вот он."	,DIA_STT_315_LostNekSuccess_Proof);
};

func void DIA_STT_315_LostNekSuccess_Proof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_Proof_15_00"); //Да, на нем был амулет. Вот он.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_01"); //Амулет. Из-за него-то все и началось. А ты смышленый парень.
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_02"); //Уверен, ты хотел оставить амулет себе, но ты правильно сделал, что отдал его.
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	&& hero.guild == GIL_NONE
	{
		AI_Output (self, other,"DIA_STT_315_LostNekSuccess_Proof_10_03"); //Если Диего будет интересно мое мнение, то я буду за тебя.
	};
	Sly_LostNek = LOG_SUCCESS;
	
	B_GiveInvItems (other, self, Neks_Amulett, 1);
	
	Log_SetTopicStatus		(CH1_LostNek, LOG_SUCCESS);
	B_LogEntry				(CH1_LostNek, "Я отдал Слаю амулет Нека. Он был удивлен моей честности.");
	
	B_GiveXP (XP_Slysearchfornek);		
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinOC, LOG_RUNNING);
		B_LogEntry			(CH1_JoinOC, "Я передал Слаю амулет Нека. Он поговорит с Диего и замолвит за меня словечко.");
	}
	else
	{	
		Log_CreateTopic		(CH1_JoinOC, LOG_MISSION);
		Log_SetTopicStatus  (CH1_JoinOC, LOG_FAILED);
		B_LogEntry			(CH1_JoinOC, "Я отдал Слаю амулет Нека. Но мне это все равно ничего не дало, ведь я больше не смогу вступить в Старый лагерь.");
	};
	Info_ClearChoices	(DIA_STT_315_LostNekSuccess );
	AI_StopProcessInfos	( self );
};


func void DIA_STT_315_LostNekSuccess_NoProof()
{
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_00"); //Нет, не могу. 
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_01"); //Точно? Ты уверен? У Нека был один амулет...
	AI_Output (self, other,"DIA_STT_315_LostNekSuccess_NoProof_10_02"); //Не люблю, когда мои вещи у чужих людей. Найди этот амулет, он должен быть у меня!
	AI_Output (other, self,"DIA_STT_315_LostNekSuccess_NoProof_15_03"); //Ты первый узнаешь о том, что я нашел амулет.
	
	B_LogEntry( CH1_LostNek, "Слай хочет получить амулет Нека в качестве доказательства.");
	
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
	description		= "Как у тебя дела?";
	
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
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_00"); //Как у тебя дела?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_01"); //Все хорошо! Я за тебя, так что можешь не волноваться по поводу Диего!
	AI_Output (other, self,"DIA_STT_315_Sly_AfterSuccess_15_02"); //Услуга за услугу, как всегда?
	AI_Output (self, other,"DIA_STT_315_Sly_AfterSuccess_10_03"); //Да, как всегда.
};


	
	
	




		
		
