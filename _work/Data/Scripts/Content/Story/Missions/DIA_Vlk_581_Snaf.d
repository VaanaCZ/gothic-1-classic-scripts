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
	description		= "Как у тебя дела?";
};

FUNC INT DIA_Snaf_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Snaf_Hello_Info()
{
	AI_Output (other, self,"DIA_Snaf_Hello_15_00"); //Как у тебя дела?
	AI_Output (self, other,"DIA_Snaf_Hello_01_01"); //Не плохо. Если умеешь хорошо готовить, друзья к тебе сами придут.
	AI_Output (self, other,"DIA_Snaf_Hello_01_02");	//Хочешь попробовать тушеный рис? Вот возьми, и сам убедись, как это вкусно.
	AI_Output (other, self,"DIA_Snaf_Hello_15_03"); //Спасибо.  
	AI_Output (self, other,"DIA_Snaf_Hello_01_04");	//А ты мог бы мне помочь.
	
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
	description		="Что тебе нужно?";
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
	AI_Output (other, self,"DIA_Snaf_Zutaten_15_00"); //Что тебе нужно?
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_01"); //Думаю, ты любишь вкусно поесть. Я придумал новое блюдо: рагу из мясных жуков а ля Снеф с рисом и грибами.
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_02"); //Я дам тебе столько рагу, сколько захочешь, но для его приготовления мне нужно три жука и немного грибов. Пяти должно быть достаточно.
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice	 (DIA_Snaf_Zutaten, "Ты хочешь меня отравить?"	,DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice	 (DIA_Snaf_Zutaten, "Мне нравится идея с рагу."			,DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_KOTZ_15_00"); //Ты хочешь меня отравить?
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_01"); //Если не хочешь есть, не ешь. Никто не заставляет. Но может быть, ты все же попробуешь? Если достанешь все, что мне нужно, приходи.
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_02"); //Я уже просил кого-то сходить за грибами, но он так и не вернулся. Наверное, ушел в Новый лагерь.
	Snaf_Zutaten = LOG_RUNNING;
	
	Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe, "Повар Снэф из Старого лагеря попросил меня найти для него 3-х мясных жуков и 5 адских грибов. Он хочет приготовить новое блюдо.");
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_DoIt_15_00"); //Мне нравится идея с рагу.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_01"); //Тогда постарайся достать мне нужные ингредиенты.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_02"); //Тот, кого я в последний раз отправлял за ними, так и не вернулся. Наверное, ушел в Новый лагерь.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
		
    Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe, "Повар Снэф из Старого лагеря попросил меня найти для него 3 мясных жуков и 5 адских грибов. Он хочет приготовить новое блюдо. Я тоже смогу его попробовать.");		
			
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
	description		= "Я достал все ингредиенты, посмотри.";
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
	AI_Output (other, self,"DIA_Snaf_ZutatenSuccess_15_00"); //Я достал все ингредиенты, посмотри.
	AI_Output (self, other,"DIA_Snaf_ZutatenSuccess_01_01"); //Хорошо! Теперь их нужно положить в котел, и рагу будет готово... Вот так...
	
	CreateInvItems(other, ItFo_Plants_Mushroom_01, 3);
	B_GiveInvItems(other,self,ItFo_Plants_Mushroom_01,8);//Notwendig zur Anzeige 8 Items ьbergeben, wird sofort angepasst
	
	Npc_RemoveInvItems(self, ItFo_Plants_Mushroom_01, 8);//Alle Zutaten weg
	Npc_RemoveInvItems(other, ItAt_MeatBug_01, 3);
	
	CreateInvItems(self, ItFoMeatbugragout,3);
	B_GiveInvItems(self, other,ItFoMeatbugragout,3);
	
	Snaf_Zutaten = LOG_SUCCESS;
	
	Log_SetTopicStatus	(CH1_SnafsRecipe, LOG_SUCCESS);
	B_LogEntry			(CH1_SnafsRecipe, "Снэф остался доволен тем, что я принес ему необходимые ингредиенты.");
	
	if Snaf_FreeMBRagout==TRUE
	{
	    B_LogEntry( CH1_SnafsRecipe, "Теперь я смогу каждый день получать у него порцию рагу из мясных жуков.");
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
	description		= "Ты говорил, что я могу взять столько порций, сколько захочу...";
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
 	AI_Output (other, self,"DIA_Snaf_AfterSuccess_15_00"); //Ты говорил, что я могу взять столько порций, сколько захочу...
 	
 	if (Snaf_RagoutDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_01"); //Да, так и есть. Вот возьми три порции.
		CreateInvItems(self, ItFoMeatbugragout,3);
		B_GiveInvItems(self, other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_02"); //Конечно! Но сегодняшнее рагу закончилось. Приходи завтра.
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
	description		= "Ты знаешь, где найти жуков?";
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
	AI_Output (other, self,"DIA_Snaf_WhereMeatbugs_15_00"); //Ты знаешь, где найти жуков?
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_01"); //Там, где много мусора. Возле стен лагеря есть несколько заброшенных домов, может быть, там ты что-нибудь найдешь.
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_02"); //На первый взгляд они кажутся несъедобными, но это обманчивое впечатление. Из них получается отличное рагу.
	
    B_LogEntry( CH1_SnafsRecipe, "Мясных жуков можно найти в заброшенных домах у стен замка.");			
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
	description		= "Где мне найти адские грибы?";
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
	AI_Output (other, self,"DIA_Snaf_WhereMushrooms_15_00"); //Где мне найти адские грибы?
	AI_Output (self, other,"DIA_Snaf_WhereMushrooms_01_01"); //Когда ты выйдешь через южные ворота - там, где разрушенная башня, - ты сразу увидишь поляну, на которой они растут.
	
	B_LogEntry( CH1_SnafsRecipe, "Адские грибы растут на поляне перед разрушенной башней у южных ворот.");			
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
	description		= "А как звали того, кого ты посылал за грибами до меня?";
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
	AI_Output (other, self,"DIA_Snaf_WhereNek_15_00"); //А как звали того, кого ты посылал за грибами до меня?
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_01"); //Нек. Ему здесь не очень нравилось. Думаю, он уже сидит где-нибудь в Новом лагере.
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_02"); //Я посылал его за грибами, но он так и не вернулся...
	
	if	(Sly_LostNek != LOG_SUCCESS)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_LostNek,	"Повар Снэф послал Нека за грибами. После этого он его ни разу не видел.");
};







	
	 




