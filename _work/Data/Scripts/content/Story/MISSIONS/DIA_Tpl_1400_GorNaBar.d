// ************************ EXIT **************************

instance  Tpl_1400_GorNaBar_Exit (C_INFO)
{
	npc			= Tpl_1400_GorNaBar;
	nr			= 999;
	condition	= Tpl_1400_GorNaBar_Exit_Condition;
	information	= Tpl_1400_GorNaBar_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1400_GorNaBar_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1400_GorNaBar_Exit_Info()
{
	AI_Output			(self, other,"Tpl_1400_GorNaBar_Exit_Info_09_02"); //Да хранит тебя Спящий!
	AI_StopProcessInfos	( self );
};




// ***************** TEMPLER SAMMELN  *****************************

instance  Tpl_1400_GorNaBar_SUGGEST (C_INFO)
{
	npc				= Tpl_1400_GorNaBar;
	condition		= Tpl_1400_GorNaBar_SUGGEST_Condition;
	information		= Tpl_1400_GorNaBar_SUGGEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ты можешь мне помочь? "; 
};

FUNC int  Tpl_1400_GorNaBar_SUGGEST_Condition()
{	
	if	 Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN)
	&&	!Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN_NOW)
	{
		return TRUE;
	};
};

FUNC void  Tpl_1400_GorNaBar_SUGGEST_Info()
{
	AI_Output			(other, self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_01"); //Ты можешь мне помочь?  
	AI_Output			(other, self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_02"); //Мне нужно добыть слюну ползунов для Кор Галома. Я знаю, где находится логово этих тварей.
	AI_Output			(other, self,"Tpl_1400_GorNaBar_SUGGEST_Info_15_03"); //Сможешь ли ты прикрыть меня, когда я открою ворота?
	AI_Output			(self, other,"Tpl_1400_GorNaBar_SUGGEST_Info_09_04"); //Логово ползунов! Наконец-то! Мой меч к твоим услугам!

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine (self,"GATE"); 
	Npc_SetPermAttitude (self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaBar);

	B_LogEntry		(CH2_MCEggs,	"Как только я упомянул гнездо ползунов, Страж Гор На Бар согласился помочь Асгхану охранять ворота. Я смогу найти его там.");
};

// ***************** Infos *****************************

instance  Tpl_1400_GorNaBar_INFO (C_INFO)
{
	npc				= Tpl_1400_GorNaBar;
	condition		= Tpl_1400_GorNaBar_INFO_Condition;
	information		= Tpl_1400_GorNaBar_INFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "Что ты знаешь о ползунах?";
};

FUNC int  Tpl_1400_GorNaBar_INFO_Condition()
{	
	if ! ( Npc_KnowsInfo (hero, Grd_263_Asghan_NEST ) )
	{
		return 1;
	};
};

FUNC void  Tpl_1400_GorNaBar_INFO_Info()
{
	AI_Output			(other, self,"Tpl_1400_GorNaBar_INFO_Info_15_01"); //Что ты знаешь о ползунах?
	AI_Output			(self, other,"Tpl_1400_GorNaBar_INFO_Info_09_02"); //Где-то в шахте у них есть логово. Если бы мы только узнали, где именно, мы смогли бы уничтожить их раз и навсегда.
};    


// EIER AM START
instance  Tpl_1400_GorNaBar_VICTORY (C_INFO)
{
	npc				= Tpl_1400_GorNaBar;
	condition		= Tpl_1400_GorNaBar_VICTORY_Condition;
	information		= Tpl_1400_GorNaBar_VICTORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я нашел логово королевы ползунов!"; 
};

FUNC int  Tpl_1400_GorNaBar_VICTORY_Condition()
{	
	if Npc_HasItems (hero,ItAt_Crawlerqueen ) >= 1 
	{
		return TRUE;
	};

};
FUNC void  Tpl_1400_GorNaBar_VICTORY_Info()
{
	AI_Output			(other, self,"Tpl_1400_GorNaBar_VICTORY_Info_15_01"); //Я нашел логово королевы ползунов!
	AI_Output			(self, other,"Tpl_1400_GorNaBar_VICTORY_Info_09_02"); //Ты смел и силен духом, и ты сумел доказать это. Нам нужны такие люди, как ты!
	
	Log_CreateTopic (GE_BecomeTemplar,LOG_NOTE);
	B_LogEntry (GE_BecomeTemplar,"Как только я приду в Болотный лагерь, мне нужно будет поговорить с Кор Ангаром. может быть, он сделает меня одним из Стражей.");
};  
