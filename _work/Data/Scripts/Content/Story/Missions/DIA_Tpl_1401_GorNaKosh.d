// ************************ EXIT **************************

instance  Tpl_1401_GorNaKosh_Exit (C_INFO)
{
	npc			= Tpl_1401_GorNaKosh;
	nr			= 999;
	condition	= Tpl_1401_GorNaKosh_Exit_Condition;
	information	= Tpl_1401_GorNaKosh_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1401_GorNaKosh_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1401_GorNaKosh_Exit_Info()
{
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_Exit_Info_13_02"); //Да пробудится Спящий!
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  Tpl_1401_GorNaKosh_SUGGEST (C_INFO)
{
	npc				= Tpl_1401_GorNaKosh;
	condition		= Tpl_1401_GorNaKosh_SUGGEST_Condition;
	information		= Tpl_1401_GorNaKosh_SUGGEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я знаю, где находится логово ползунов..."; 
};

FUNC int  Tpl_1401_GorNaKosh_SUGGEST_Condition()
{	
	if	 Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN)
	&&	!Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN_NOW)
	{
		return TRUE;
	};
};


FUNC void  Tpl_1401_GorNaKosh_SUGGEST_Info()
{
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_01"); //Я знаю, где находится логово ползунов, и собираюсь пойти туда, чтобы добыть их слюну для зелья Кор Галома.
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_SUGGEST_Info_13_02"); //Мой меч к твоим услугам. Я пойду с тобой.
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_SUGGEST_Info_15_03"); //Хорошо. Встретимся у большого прохода.
	
	Npc_ExchangeRoutine (self,"GATE");
	Npc_SetPermAttitude (self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaKosh);
	B_LogEntry		(CH2_MCEggs,	"Я смог уговорить Стража Гор На Коша защищать ворота вместе с Асгханом. Он будет ждать меня у ворот.");	

	AI_StopProcessInfos	(self);
};

// ***************** Infos *****************************

instance  Tpl_1401_GorNaKosh_INFO (C_INFO)
{
	npc				= Tpl_1401_GorNaKosh;
	condition		= Tpl_1401_GorNaKosh_INFO_Condition;
	information		= Tpl_1401_GorNaKosh_INFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Что ты здесь делаешь?"; 
};

FUNC int  Tpl_1401_GorNaKosh_INFO_Condition()
{	
	if ! ( Npc_KnowsInfo (hero, Grd_263_Asghan_NEST ) )
	{
		return 1;
	};
};

FUNC void  Tpl_1401_GorNaKosh_INFO_Info()
{
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_INFO_Info_15_01"); //Что ты здесь делаешь?
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_INFO_Info_13_02"); //Я охочусь на ползунов.
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_INFO_Info_15_03"); //Ты можешь рассказать мне, как охотиться на ползунов?
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_INFO_Info_13_04"); //Что ж, здесь есть только одно правило. Когда ты видишь перед собой ползуна, атакуй его первым так быстро, как только сможешь. 
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_INFO_Info_13_05"); //Твое бесстрашие и отвага сослужат тебе хорошую службу.

	AI_StopProcessInfos(self);		// SN:nur fьr die Vermeidung des Bugs, dass der letzte Satz in roter Schrift erscheint, und der InfoManager danach defekt ist
};

// ***************** Infos *****************************

instance  Tpl_1401_GorNaKosh_CRAWLER (C_INFO)
{
	npc				= Tpl_1401_GorNaKosh;
	condition		= Tpl_1401_GorNaKosh_CRAWLER_Condition;
	information		= Tpl_1401_GorNaKosh_CRAWLER_Info;
	important		= 0;
	permanent		= 1;
	description		= "Ты можешь рассказать о ползунах еще что-нибудь?"; 
};

FUNC int  Tpl_1401_GorNaKosh_CRAWLER_Condition()
{	
	if  ( Npc_KnowsInfo (hero, Tpl_1401_GorNaKosh_INFO) )
	{
		return 1;
	};
};

FUNC void  Tpl_1401_GorNaKosh_CRAWLER_Info()
{
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_CRAWLER_Info_15_01"); //Ты можешь рассказать о ползунах еще что-нибудь?
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_02"); //Их природа - убивать все! Все что движется, - все, что не похоже на них самих.
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_CRAWLER_Info_13_03"); //Запомни мои слова, они тебе еще пригодятся.
}; 

// ***************************** Die Kцnigin ist tot, lang lebe die Kцnigin ****************************************//

instance  Tpl_1401_GorNaKosh_VICTORY (C_INFO)
{
	npc				= Tpl_1401_GorNaKosh;
	condition		= Tpl_1401_GorNaKosh_VICTORY_Condition;
	information		= Tpl_1401_GorNaKosh_VICTORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я нашел логово ползунов!"; 
};

FUNC int  Tpl_1401_GorNaKosh_VICTORY_Condition()
{	
	if ( Npc_HasItems (hero,ItAt_Crawlerqueen) > 3 ) 
	{
		return TRUE;
	};

};
FUNC void  Tpl_1401_GorNaKosh_VICTORY_Info()
{
	AI_Output			(other, self,"Tpl_1401_GorNaKosh_VICTORY_Info_15_01"); //Я нашел логово ползунов!
	AI_Output			(self, other,"Tpl_1401_GorNaKosh_VICTORY_Info_13_02"); //Отлично! Теперь иди в лагерь и расскажи об окончании своей миссии. Кор Галом ждет тебя.
	B_LogEntry			(CH2_MCEggs,	"Я должен отнести Кор Галому яйца ползунов. Он уже давно ждет моего возвращения.");
};  
