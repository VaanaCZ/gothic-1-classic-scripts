instance  Tpl_1438_Templer_Exit (C_INFO)
{
	npc			=  Tpl_1438_Templer;
	nr			=  999;
	condition	=  Tpl_1438_Templer_Exit_Condition;
	information	=  Tpl_1438_Templer_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1438_Templer_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1438_Templer_Exit_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_Exit_Info_15_01"); //Увидимся.
	AI_Output			(self, other,"Tpl_1438_Templer_Exit_Info_13_02"); //Да пробудится Спящий!
	
	AI_StopProcessInfos	( self );
};
// ***************** GELABER *****************************

instance  Tpl_1438_Templer_INFO (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_INFO_Condition;
	information		= Tpl_1438_Templer_INFO_Info;
	important		= 0;
	permanent		= 0;
	description		= "Что делают Стражи в шахте?"; 
};

FUNC int  Tpl_1438_Templer_INFO_Condition()
{	
	if (  CorKalom_BringMCQBalls != LOG_RUNNING ) 
	{
		return TRUE;
	};

};

FUNC void  Tpl_1438_Templer_INFO_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_INFO_Info_15_01"); //Что делают Стражи в шахте?
	AI_Output			(self, other,"Tpl_1438_Templer_INFO_Info_13_02"); //Мы охотимся на ползунов. Ты лучше возвращайся в Лагерь - там безопаснее.
}; 

// ***************** SEKRET *****************************

instance  Tpl_1438_Templer_WHY (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_WHY_Condition;
	information		= Tpl_1438_Templer_WHY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Зачем вы охотитесь на ползунов?"; 
};

FUNC int  Tpl_1438_Templer_WHY_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_INFO )) 
	{
		return 1;
	};

};
FUNC void  Tpl_1438_Templer_WHY_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_01"); //Зачем вы охотитесь на ползунов?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_02"); //Нам нужны их челюсти. У ползунов очень ценная слюна.
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_03"); //Какая такая слюна?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_04"); //Ядовитая. И только Кор Галом знает, как готовить из нее эликсиры.
};
// ***************** KALOM *****************************

instance  Tpl_1438_Templer_KALOM (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_KALOM_Condition;
	information		= Tpl_1438_Templer_KALOM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Кто такой Кор Галом?"; 
};

FUNC int  Tpl_1438_Templer_KALOM_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1438_Templer_WHY )) 
	{
		return 1;
	};

};

FUNC void  Tpl_1438_Templer_KALOM_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_01"); //Кто такой Кор Галом?
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_02"); //Это один из самых влиятельных людей во всем Братстве. Он знает множество тайн. Говорят, он даже может читать мысли людей.
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_03"); //Но помимо всего этого, он еще и алхимик. Он готовит эликсиры, благодаря которым души посвященных могут говорить со Спящим. Да ты просто загляни в Лагерь! Нам всегда нужны новые люди.
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_04"); //Я подумаю об этом.
};  
//---------------------WENN DIE EIERSUCHE LДUFT-------------------------------  
instance  Tpl_1438_Templer_EGGSEARCH (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_EGGSEARCH_Condition;
	information		= Tpl_1438_Templer_EGGSEARCH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я ищу логово ползунов."; 
};

FUNC int  Tpl_1438_Templer_EGGSEARCH_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING )
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_EGGSEARCH_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_EGGSEARCH_Info_15_01"); //Я ищу логово ползунов.
	AI_Output			(self, other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //Поговори с Гор На Видом, Гор На Кошем и Гор На Баром. Они знают о ползунах куда больше, чем я.

	B_LogEntry		(CH2_MCEggs,"Я спросил у стража у входа в Старую Шахту о логове ползунов. Он отослал меня к другим стражам: Гор На Виду, Гор На Кошу и Гор На Бару. Интересно, кто же из Братства занимается придумыванием таких заковыристых имен?");  
};  
/*------------------------------------------------------------------------
//							ZANGEN FREISCHALTEN						    //
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_ZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_ZANGEN_Condition;
	information		= Tpl_1438_Templer_ZANGEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Как добываются челюсти ползунов?"; 
};

FUNC int  Tpl_1438_Templer_ZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_WHY) || (CorKalom_BringMCQBalls == LOG_RUNNING))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_ZANGEN_Info()
{
	AI_Output			(other, self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //Как добываются челюсти ползунов?
	AI_Output			(self, other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //Это не так-то просто. Но я могу тебя научить.
}; 
/*------------------------------------------------------------------------
//							LERNEN ZANGEN ZU ENTFERNEN					//
------------------------------------------------------------------------*/

instance  Tpl_1438_Templer_TEACHZANGEN (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_TEACHZANGEN_Condition;
	information		= Tpl_1438_Templer_TEACHZANGEN_Info;
	important		= 0;
	permanent		= 1;
	description		= "Научиться вырезать челюсти (1 ед. обучения)"; 
};

FUNC int  Tpl_1438_Templer_TEACHZANGEN_Condition()
{	
	if	(Npc_KnowsInfo (hero,Tpl_1438_Templer_ZANGEN))
	&&	(Knows_GetMCMandibles == FALSE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1438_Templer_TEACHZANGEN_Info()
{
	
	AI_Output			(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //Ты можешь научить меня добывать челюсти ползунов?
	
	if (hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //Прежде всего нужно сделать глубокий надрез. Но будь осторожен, чтобы не повредить железы, - слюна может попасть тебе на руки.
		AI_Output		(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //Это должно быть неприятно.
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //Так и есть. Ты встречал когда-нибудь Коргура Трехпалого, знаменитого охотника на ползунов? Ах да, это же было еще до того, как ты появился здесь. Ладно, идем дальше...
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //Делаешь надрез вокруг слюнных желез, оставляя довольно большой промежуток, а затем вынимаешь их вместе с челюстями. Если сделаешь все, как я сказал, проблем быть не должно.
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry		(GE_AnimalTrophies,"Как удалять челюсти ползунов");
		Tpl_1438_Templer_TEACHZANGEN.permanent		= 0;
		PrintScreen		("Изучить: Удаление челюстей ползунов", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else 
	{
		PrintScreen		("Недостаточно очков обучения!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say			(self, other, "$NOLEARNNOPOINTS");
	};
};   
