// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Snaf_Exit (C_INFO)
{
	npc			= Vlk_581_Snaf;
	nr			= 999;
	condition	= DIA_Snaf_Exit_Condition;
	information	= DIA_Snaf_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Snaf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Snaf_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Snaf_Hello (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Hello_Condition;
	information		= DIA_Snaf_Hello_Info;
	permanent		= 0;
	description		= "Как жизнь?";
};

FUNC INT DIA_Snaf_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Snaf_Hello_Info()
{
	AI_Output (other, self,"DIA_Snaf_Hello_15_00"); //Как дела?
	AI_Output (self, other,"DIA_Snaf_Hello_01_01"); //Не так уж плохо. Если умеешь хорошо готовить, у тебя здесь будет много друзей.
	AI_Output (self, other,"DIA_Snaf_Hello_01_02");	//Хочешь попробовать тушеный рис?
	AI_Output (other, self,"DIA_Snaf_Hello_15_03"); //Спасибо.
	AI_Output (self, other,"DIA_Snaf_Hello_01_04");	//Знаешь, ты мог бы мне помочь.
	
	CreateInvItem (self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};

// **************************************************
// 				Bring Zutaten
// **************************************************
	var int Snaf_Zutaten; 
	var int Snaf_FreeMBRagout;
// **************************************************

INSTANCE DIA_Snaf_Zutaten (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Zutaten_Condition;
	information		= DIA_Snaf_Zutaten_Info;
	permanent		= 0;
	description		="Что я могу для тебя сделать?";
};

FUNC INT DIA_Snaf_Zutaten_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Zutaten_Info()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_15_00"); //Что я могу для тебя сделать?
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_01"); //Ты, должно быть, любишь вкусно поесть. У меня тут новый рецепт: рагу из мясных жуков по снефски с грибами и рисом.
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_02"); //Ты получишь самую большую порцию, если сможешь принести мне трех жуков и несколько адских грибов... Я думаю, пяти будет достаточно.
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"Ты хочешь, чтобы меня вырвало?",DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"Звучит неплохо.",DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_KOTZ_15_00"); //Ты хочешь, чтобы меня вырвало?
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_01"); //Ты не обязан это есть, но, по крайней мере, мог бы попробовать! Приходи, если сможешь раздобыть то, о чем я просил.
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_02"); //Я уже отправил одного за припасами, но он так и не вернулся: небось, сбежал в Новый Лагерь.
	Snaf_Zutaten = LOG_RUNNING;
	
	Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"Повар Снаф, живущий во внешнем кольце Старого Лагеря, послал меня раздобыть 3 мясных жука и 5  адских грибов для своего нового рецепта.");
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_DoIt_15_00"); //Звучит неплохо.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_01"); //Тогда иди и раздобудь то, о чем я тебя просил.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_02"); //Я уже отправил одного за припасами, но он так и не вернулся: небось, сбежал в Новый Лагерь.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
		
    Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"Повар Снаф, живущий во внешнем кольце Старого Лагеря, послал меня раздобыть 3 мясных жука и 5  адских грибов для своего нового рецепта. Я даже смогу попробовать его варево.");		
			
	Info_ClearChoices(DIA_Snaf_Zutaten);	
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Snaf_ZutatenSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_ZutatenSuccess_Condition;
	information		= DIA_Snaf_ZutatenSuccess_Info;
	permanent		= 0;
	description		= "Я достал все, что тебе нужно!";
};

FUNC INT DIA_Snaf_ZutatenSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Mushroom_01)>=5) && (Npc_HasItems(other,ItAt_Meatbug_01)>=3) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_ZutatenSuccess_Info()
{
	AI_Output (other, self,"DIA_Snaf_ZutatenSuccess_15_00"); //Я достал все, что тебе нужно!
	AI_Output (self, other,"DIA_Snaf_ZutatenSuccess_01_01"); //Отлично! Осталось только добавить это в котел, и рагу будет готово... Погоди...
	
	CreateInvItems(other, ItFo_Plants_Mushroom_01, 3);
	B_GiveInvItems(other,self,ItFo_Plants_Mushroom_01,8);//Notwendig zur Anzeige 8 Items ьbergeben, wird sofort angepasst
	
	Npc_RemoveInvItems(self, ItFo_Plants_Mushroom_01, 8);//Alle Zutaten weg
	Npc_RemoveInvItems(other, ItAt_MeatBug_01, 3);
	
	CreateInvItems(self, ItFoMeatbugragout,3);
	B_GiveInvItems(self, other,ItFoMeatbugragout,3);
	
	Snaf_Zutaten = LOG_SUCCESS;
	
	Log_SetTopicStatus	(CH1_SnafsRecipe, LOG_SUCCESS);
	B_LogEntry			(CH1_SnafsRecipe,"Снаф остался весьма доволен принесенными ингредиентами.");
	
	if Snaf_FreeMBRagout==TRUE
	{
	    B_LogEntry( CH1_SnafsRecipe,"Теперь он каждый день будет давать мне рагу из мясных жуков.");
	};
	
	B_GiveXP(100);
	
	AI_StopProcessInfos	(self);
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************
	var int Snaf_RagoutDay;
// **************************************************

INSTANCE DIA_Snaf_AfterSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_AfterSuccess_Condition;
	information		= DIA_Snaf_AfterSuccess_Info;
	permanent		= 1;
	description		= "Ты сказал, что я смогу взять столько, сколько захочу...";
};

FUNC INT DIA_Snaf_AfterSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_SUCCESS) && (Snaf_FreeMBRagout==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_AfterSuccess_Info()
{
 	AI_Output (other, self,"DIA_Snaf_AfterSuccess_15_00"); //Ты сказал, что я смогу взять столько, сколько захочу...
 	
 	if (Snaf_RagoutDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_01"); //И я тебя не обманул. Вот, забирай три порции.
		CreateInvItems(self, ItFoMeatbugragout,3);
		B_GiveInvItems(self, other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_02"); //Конечно! Но сегодня у меня уже ничего не осталось. Приходи завтра.
	};
};

// **************************************************
// 					Wo Fleischwanzen
// **************************************************

INSTANCE DIA_Snaf_WhereMeatbugs (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 3;
	condition		= DIA_Snaf_WhereMeatbugs_Condition;
	information		= DIA_Snaf_WhereMeatbugs_Info;
	permanent		= 0;
	description		= "Где можно найти мясных жуков?";
};

FUNC INT DIA_Snaf_WhereMeatbugs_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMeatbugs_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMeatbugs_15_00"); //Где можно найти мясных жуков?
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_01"); //Да на любой свалке! Загляни в пустые дома у стены замка - там наверняка найдешь парочку.
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_02"); //И пусть тебя не смущает их вид. Рагу из них получается - просто объеденье!
	
    B_LogEntry( CH1_SnafsRecipe,"Мясные жуки обитают неподалеку от покинутых хижин у стен замка.");			
};

// **************************************************
// 					Where Mushrooms
// **************************************************

INSTANCE DIA_Snaf_WhereMushrooms (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 4;
	condition		= DIA_Snaf_WhereMushrooms_Condition;
	information		= DIA_Snaf_WhereMushrooms_Info;
	permanent		= 0;
	description		= "Где растут адские грибы?";
};

FUNC INT DIA_Snaf_WhereMushrooms_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMushrooms_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMushrooms_15_00"); //Где растут адские грибы?
	AI_Output (self, other,"DIA_Snaf_WhereMushrooms_01_01"); //Выходишь через южные ворота - там еще разрушенная башня - и прямо перед тобой будет пустырь, на котором растут грибы.
	
	B_LogEntry( CH1_SnafsRecipe,"Адские грибы можно найти на поляне перед упавшей башней у южных ворот.");			
};

// **************************************************
// 					Where Nek
// **************************************************

INSTANCE DIA_Snaf_WhereNek (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 5;
	condition		= DIA_Snaf_WhereNek_Condition;
	information		= DIA_Snaf_WhereNek_Info;
	permanent		= 0;
	description		= "Как звали того парня, которого ты посылал до меня?";
};

FUNC INT DIA_Snaf_WhereNek_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereNek_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereNek_15_00"); //Как звали того парня, которого ты посылал до меня?
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_01"); //Нек. Он как-то не прижился здесь. Я думаю, сейчас он уже в Новом Лагере.
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_02"); //Я отправил его собирать грибы - но он так и не вернулся...
	
	if	(Sly_LostNek != LOG_SUCCESS)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_LostNek,"Повар Снаф видел Нека последний раз, когда тот шел собирать грибы.");
};







	
	 




