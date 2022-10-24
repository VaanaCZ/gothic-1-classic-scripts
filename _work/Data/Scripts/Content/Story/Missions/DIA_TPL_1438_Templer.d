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
	description		= "Что могут Стражи делать в этой шахте?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_INFO_Info_15_01"); //Что могут Стражи делать в этой шахте? 
	AI_Output			(self, other,"Tpl_1438_Templer_INFO_Info_13_02"); //Охотятся на ползунов. Тебе лучше бы идти в лагерь - жизнь целее будет.
}; 

// ***************** SEKRET *****************************

instance  Tpl_1438_Templer_WHY (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_WHY_Condition;
	information		= Tpl_1438_Templer_WHY_Info;
	important		= 0;
	permanent		= 0;
	description		= "А зачем вы охотитесь на ползунов?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_01"); //А зачем вы охотитесь на ползунов? 
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_02"); //Челюсти - вот, что нам надо. В них содержится ценная слюна.
	AI_Output			(other, self,"Tpl_1438_Templer_WHY_Info_15_03"); //Что она из себя представляет?
	AI_Output			(self, other,"Tpl_1438_Templer_WHY_Info_13_04"); //Яд. Но Кор Галом знает, как из него приготовить эликсир.
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
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_02"); //Он один из самых влиятельных особ нашего Братства. Он знает многое, и даже как читать мысли людей.
	AI_Output			(self, other,"Tpl_1438_Templer_KALOM_Info_13_03"); //Еще он алхимик. Приготовленные им эликсиры помогают душе говорить со Спящим. Да ты просто загляни в лагерь! У нас всегда рады новичкам!
	AI_Output			(other, self,"Tpl_1438_Templer_KALOM_Info_15_04"); //Хорошо, может быть, загляну.
};  
//---------------------WENN DIE EIERSUCHE LДUFT-------------------------------  
instance  Tpl_1438_Templer_EGGSEARCH (C_INFO)
{
	npc				= Tpl_1438_Templer;
	condition		= Tpl_1438_Templer_EGGSEARCH_Condition;
	information		= Tpl_1438_Templer_EGGSEARCH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я ищу логово ползунов.  "; 
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
	AI_Output			(self, other,"Tpl_1438_Templer_EGGSEARCH_Info_13_02"); //Думаю, Гор На Вид, Гор На Кош и Гор На Бар знают о ползунах куда больше, чем я. Поговори с ними.

	B_LogEntry		(CH2_MCEggs,	"Я спросил Стража на входе в Старую шахту о логове ползунов. Он посоветовал мне обратиться к Гор На Виду, Гор На Кошу и Гор На Бару. Эти имена, которые они дают своим Стражам, скоро сведут меня с ума!");  
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
	description		= "Как добывать слюну ползунов?"; 
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
	AI_Output			(other, self,"Tpl_1438_Templer_ZANGEN_Info_15_01"); //Как добывать слюну ползунов?
	AI_Output			(self, other,"Tpl_1438_Templer_ZANGEN_Info_13_02"); //Это не такое уж легкое дело, но если хочешь, могу научить.
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
	description		= "Добыча челюстей (1 пункт обучения)"; 
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
	
	AI_Output			(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_01"); //Ты можешь научить меня добывать слюну ползунов?
	
	if (hero.lp >= 1)
	{
		hero.lp = hero.lp - 1;
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_01"); //Для начала делается глубокий надрез. Но только аккуратно, чтобы не повредить железы, - слюна может попасть тебе на руки.
		AI_Output		(other, self,"Tpl_1438_Templer_TEACHZANGEN_Info_15_02"); //Это, наверное, очень опасно. 
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_03"); //А ты как думал. Ты видел когда-нибудь Коргура Трехпалого, всем известного охотника на ползунов? А, погоди, это же было еще до того, как ты появился здесь. Ладно, тогда продолжим...  
		AI_Output		(self, other,"Tpl_1438_Templer_TEACHZANGEN_Info_13_04"); //Нужно сделать надрез вокруг слюнных желез, оставляя довольно большой промежуток. Теперь ты можешь вынимать их вместе с челюстями. Если будешь делать, как я сказал, проблем не будет.  
		Knows_GetMCMandibles = TRUE;
		Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
		B_LogEntry		(GE_AnimalTrophies,"Навык добычи челюстей: ползуны.");
		Tpl_1438_Templer_TEACHZANGEN.permanent		= 0;
		PrintScreen		("Навык: добыча челюстей ползунов", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else 
	{
		PrintScreen		("Недостаточно очков обучения!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		B_Say			(self, other, "$NOLEARNNOPOINTS");
	};
};   
