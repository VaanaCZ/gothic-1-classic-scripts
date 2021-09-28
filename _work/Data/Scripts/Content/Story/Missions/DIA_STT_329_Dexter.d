// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dexter_Exit (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 999;
	condition	= DIA_Dexter_Exit_Condition;
	information	= DIA_Dexter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dexter_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Erste Begrьssung
// **************************************************

INSTANCE DIA_Dexter_First (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_First_Condition;
	information	= DIA_Dexter_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Dexter_First_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_First_Info()
{
	AI_Output (self,other,"DIA_Dexter_IAmNew_10_00"); //Эй, ты! У меня есть болотник и эликсиры из Лагеря Сектантов. Интересуешься?
};

// **************************************************
// 					Kraut
// **************************************************

INSTANCE DIA_Dexter_Kraut (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_Kraut_Condition;
	information	= DIA_Dexter_Kraut_Info;
	permanent	= 0;
	description	= "Что такое болотник?";
};                       

FUNC INT DIA_Dexter_Kraut_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Kraut_Info()
{
	AI_Output (other,self,"DIA_Dexter_Kraut_15_00"); //Что такое болотник?
	AI_Output (self,other,"DIA_Dexter_Kraut_10_01"); //Ты новенький, да? Болотник курят, когда хотят немного расслабиться.
};

// **************************************************
// 					TRADE
// **************************************************

// **************************************************

INSTANCE DIA_Dexter_Trade (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_Trade_Condition;
	information	= DIA_Dexter_Trade_Info;
	permanent	= 1;
	description	= "Покажи мне, что у тебя есть.";
	Trade		= 1;
};                       

FUNC INT DIA_Dexter_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Dexter_Trade_Info()
{
	AI_Output (other,self,"DIA_Dexter_Trade_15_00"); //Покажи мне, что у тебя есть.
	AI_Output (self,other,"DIA_Dexter_Trade_10_01"); //Все самое лучшее...
	
	if	(Dexter_Traded == FALSE)
	{
		Log_CreateTopic(GE_TraderOC, LOG_NOTE);
		B_LogEntry(GE_TraderOC,"Призрак по имени Декстер торгует эликсирами и болотником от Лагеря Братства.");
	
		Dexter_Traded = TRUE;
	};
};

// **************************************************
// 					JOIN OC
// **************************************************
	var int Dexter_GetKalomsRecipe;
// **************************************************

INSTANCE DIA_Dexter_JoinOC (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 1;
	condition	= DIA_Dexter_JoinOC_Condition;
	information	= DIA_Dexter_JoinOC_Info;
	permanent	= 0;
	description	= "Я хочу присоединиться к Лагерю - хочу стать Призраком.";
};                       

FUNC INT DIA_Dexter_JoinOC_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID DIA_Dexter_JoinOC_Info()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_00"); //Я хочу присоединиться к Лагерю - хочу стать Призраком.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_01"); //Да? Хочешь доказать, что ты чего-то стоишь?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_02"); //Хорошо. Есть одно дело. Если справишься, я замолвлю за тебя словечко перед Диего.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_03"); //Какое дело?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_04"); //В Лагере Сектантов есть один тип по имени Галом. Большая шишка - один из их Гуру.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_05"); //Галом - алхимик. У него есть рецепт хорошего целебного эликсира.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_06"); //Я хочу купить у него рецепт, чтобы самому делать такой эликсир.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_07"); //Но для этого нужно как-то встретиться с Галомом.
	AI_Output (other,self,"DIA_Dexter_JoinOC_15_08"); //Что я должен сделать?
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_09"); //Болотным придуркам постоянно нужны новые люди. Ты здесь новенький. Притворись, что хочешь присоединиться к ним.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_10"); //Галом - один из Гуру. Он непременно захочет испытать новичка. Когда встретишься с ним, попробуй добыть рецепт.
	AI_Output (self,other,"DIA_Dexter_JoinOC_10_11"); //Можешь купить его, можешь украсть - мне все равно, как ты его добудешь.

	Info_ClearChoices(DIA_Dexter_JoinOC);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Ладно, я попробую.",DIA_Dexter_JoinOC_Ok);
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Это должно быть непросто. Что я получу в итоге?",DIA_Dexter_JoinOC_HowMuch);
};

func void DIA_Dexter_JoinOC_Ok()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Ok_15_00"); //Ладно, я попробую.
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Призрак по имени Декстер, торгующий на рынке, поручил мне отправиться к Идолу Галому в Болотный Лагерь и принести ему рецепт.");
	B_LogEntry    (CH1_KalomsRecipe,"Чтобы попасть туда, мне надо быть одним из союзников Болотного Лагеря. Так сказал Декстер.");
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

func void DIA_Dexter_JoinOC_HowMuch()	
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_HowMuch_15_00"); //Это должно быть непросто. Что я получу в итоге?
	AI_Output (self,other,"DIA_Dexter_JoinOC_HowMuch_10_01"); //Однажды Диего спросит меня о тебе. Угадай, от чего будет зависить мой ответ.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Возможно, мне придется заплатить за рецепт.",DIA_Dexter_JoinOC_Advance);
};

func void DIA_Dexter_JoinOC_Advance()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Advance_15_00"); //Возможно, мне придется заплатить за рецепт. Как насчет небольшого аванса? Скажем, 50 кусков руды?
	AI_Output (self,other,"DIA_Dexter_JoinOC_Advance_10_01"); //Забудь об этом.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Без руды я не смогу добыть тебе этот рецепт!",DIA_Dexter_JoinOC_Threat);
};

func void DIA_Dexter_JoinOC_Threat()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_Threat_15_00"); //Без руды я не смогу добыть тебе этот рецепт!
	AI_Output (self,other,"DIA_Dexter_JoinOC_Threat_10_01"); //Хорошо! О руде поговорим позже, когда рецепт уже будет у тебя.
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Нет!",DIA_Dexter_JoinOC_OreNowOrElse);
};

func void DIA_Dexter_JoinOC_OreNowOrElse()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_OreNowOrElse_15_00"); //Нет! Или ты даешь мне руду сейчас, или можешь сам искать свой рецепт!
	AI_Output (self,other,"DIA_Dexter_JoinOC_OreNowOrElse_10_01"); //Знаешь, помимо тебя здесь есть много других новичков. Пожалуй, я поручу эту работу кому-нибудь из них...
	
	Info_AddChoice	 (DIA_Dexter_JoinOC,"Ладно! Забудем об этом.",DIA_Dexter_JoinOC_ForgetIt);
};

func void DIA_Dexter_JoinOC_ForgetIt()
{
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_00"); //Ладно! Забудем об этом.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_01"); //Погоди. Я просто хотел знать, как далеко ты сможешь зайти. 50 кусков руды - довольно большая сумма для новичка, ты не находишь?
	AI_Output (other,self,"DIA_Dexter_JoinOC_ForgetIt_15_02"); //Звучит уже лучше.
	AI_Output (self,other,"DIA_Dexter_JoinOC_ForgetIt_10_03"); //Ладно, ладно, у меня как раз есть 50 лишних кусков. Не подведи меня, малыш! 
	
	Dexter_GetKalomsRecipe = LOG_RUNNING;
	
	Log_CreateTopic (CH1_KalomsRecipe,LOG_MISSION);
	Log_SetTopicStatus (CH1_KalomsRecipe,LOG_RUNNING);
	B_LogEntry    (CH1_KalomsRecipe,"Призрак по имени Декстер, торгующий на рынке, поручил мне отправиться к Идолу Галому в Болотный Лагерь и принести ему рецепт.");
	B_LogEntry    (CH1_KalomsRecipe,"Чтобы попасть туда, мне надо быть одним из союзников Болотного Лагеря. Так сказал Декстер.");
	
	CreateInvItems(self, itminugget, 50);
	B_GiveInvItems(self, other, itminugget, 50);
	
	Info_ClearChoices(DIA_Dexter_JoinOC);
};

// **************************************************
// 					Where ST
// **************************************************
var int Dexter_PsiCamp;
// **************************************************

INSTANCE DIA_Dexter_WhereST (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_WhereST_Condition;
	information	= DIA_Dexter_WhereST_Info;
	permanent	= 1;
	description	= "Где находится Лагерь Сектантов?";
};                       

FUNC INT DIA_Dexter_WhereST_Condition()
{
	if (Dexter_GetKalomsRecipe == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_WhereST_Info()
{
	AI_Output (other,self,"DIA_Dexter_WhereST_15_00"); //Где находится Лагерь Сектантов?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_01"); //Выходишь из Лагеря через южные ворота и идешь на восток. Тебе понадобится карта. 
	
	if (Npc_HasItems(self,ItWrWorldmap) >0)														//Bjцrn
		{																						//Bjцrn
			AI_Output (self,other,"DIA_Dexter_WhereST_10_02"); //У меня как раз есть одна - за 50 кусков...
		};																						//Bjцrn
	
	AI_Output (other,self,"DIA_Dexter_WhereST_15_02"); //Южные ворота - это обрушившаяся башня, верно?
	AI_Output (self,other,"DIA_Dexter_WhereST_10_03"); //Верно.
	
	if	!Dexter_PsiCamp
	{
		B_LogEntry    (CH1_KalomsRecipe,"Болотный Лагерь расположен к востоку от старого Лагеря.");
		Dexter_PsiCamp = TRUE;
	};
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Dexter_KalomsRecipeSuccess (C_INFO)
{
	npc			= STT_329_Dexter;
	nr			= 800;
	condition	= DIA_Dexter_KalomsRecipeSuccess_Condition;
	information	= DIA_Dexter_KalomsRecipeSuccess_Info;
	permanent	= 1;
	description	= "Я добыл рецепт!";
};                       

FUNC INT DIA_Dexter_KalomsRecipeSuccess_Condition()
{
	if ( (Dexter_GetKalomsRecipe == LOG_RUNNING) && (Npc_HasItems (other, KalomsRecipe) > 0) )
	{
		return 1;
	};
};

FUNC VOID DIA_Dexter_KalomsRecipeSuccess_Info()
{
	AI_Output (other,self,"DIA_Dexter_KalomsRecipeSuccess_15_00"); //Я добыл рецепт!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_01"); //Очень хорошо! Покажи мне его!
	
	B_UseFakeScroll();
	
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_02"); //Отлично! Теперь я сам смогу готовить этот эликсир.
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_03"); //Ты хороший парень! Диего будет знать об этом!
	AI_Output (self,other,"DIA_Dexter_KalomsRecipeSuccess_10_04"); //Вот, возьми, это тебе за услуги...
	
	CreateInvItems (other,itminugget,50);
	
	B_GiveInvItems (other, self, KalomsRecipe, 1);
	
	Dexter_GetKalomsRecipe = LOG_SUCCESS;
	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Декстер остался под впечатлением. Уверен, он расскажет об этом Диего.");
	}
	else
	{
		Log_SetTopicStatus(CH1_KalomsRecipe, LOG_SUCCESS);
		B_LogEntry    (CH1_KalomsRecipe,"Декстер остался под впечатлением. Но что толку - я не могу стать призраком в любом случае.");
	};
	B_GiveXP (XP_DexterKalom);
};

