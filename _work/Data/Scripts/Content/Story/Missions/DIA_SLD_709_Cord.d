// ************************ EXIT **************************

INSTANCE DIA_SLD_709_Cord_Exit (C_INFO)
{
	npc			= SLD_709_Cord;
	nr			= 999;
	condition	= DIA_SLD_709_Cord_Exit_Condition;
	information	= DIA_SLD_709_Cord_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_709_Cord_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_709_Cord_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

/*------------------------------------------------------------------------
						TRAIN ANGEBOT								
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAINOFFER (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAINOFFER_Condition;
	information		= SLD_709_Cord_TRAINOFFER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я хочу научиться владеть одноручным мечом."; 
};

FUNC int  SLD_709_Cord_TRAINOFFER_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_1H) < 2)
	{
		return TRUE;
	};

};
FUNC void  SLD_709_Cord_TRAINOFFER_Info()
{
	AI_Output (other, self,"SLD_709_Cord_TRAINOFFER_Info_15_01"); //Я хочу научиться владеть одноручным мечом.
	AI_Output (self, other,"SLD_709_Cord_TRAINOFFER_Info_14_02"); //Хорошо. Но не бесплатно. За это я хочу тридцать кусков руды.

	Log_CreateTopic	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,	"Наемник Корд может научить меня обращаться с одноручным мечом. Он постоянно тренируется на площадке возле озера.");
};  
/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ERSTE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAIN (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAIN_Condition;
	information		= SLD_709_Cord_TRAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,30); 
};

FUNC int  SLD_709_Cord_TRAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,SLD_709_Cord_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_1H) == 0)
	{
		return TRUE;
	};
};
FUNC void  SLD_709_Cord_TRAIN_Info()
{
	AI_Output (other, self,"SLD_709_Cord_TRAIN_Info_15_00"); //Я хочу улучшить технику ведения боя с одноручным мечом.

	if (Npc_HasItems (hero,ItMiNugget) >= 30)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1)
		{
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_01"); //Правильное решение! Но прежде, чем освоить технику боя, тебе нужно научиться правильно держать меч.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_02"); //Почти все новички привыкли держать оружие двумя руками. Это неправильно. 
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_03"); //Всегда держи меч одной рукой, острием вверх.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_04"); //Он должен стать продолжением твоей руки, слиться с ее движением. Это позволит тебе атаковать намного быстрее.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_05"); //Если усвоишь все, что я тебе сказал, твои удары станут более изящными и быстрыми.
			B_PracticeCombat	("NC_WATERFALL_TOP01");
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_06"); //И еще: есть ряд более мощных ударов, но у новичка не так уж много шансов повторить их. 
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_07"); //Но как говорится: тяжело в учении, зато легко в бою. Тренируйся, парень!
			B_GiveInvItems (hero, self,ItMiNugget,30);
			SLD_709_Cord_TRAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Тебе не хватает руды.
	};
};  
/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ZWEITE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAINAGAIN (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAINAGAIN_Condition;
	information		= SLD_709_Cord_TRAINAGAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,50); 
};

FUNC int  SLD_709_Cord_TRAINAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,SLD_709_Cord_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_1H) < 2)
	{
		return TRUE;
	};

};
FUNC void  SLD_709_Cord_TRAINAGAIN_Info()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Научи меня лучше владеть одноручным мечом.

	if (Npc_HasItems (hero,ItMiNugget) >= 50)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2)
		{
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_02"); //Хорошо. Основное ты уже знаешь. Вот еще: если держать меч немного ниже, то первый удар будет более сильным.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_03"); //Ну, рубящий удар, ты помнишь?! Тогда давай расскажу, как правильно двигаться. Наносишь два удара и резко разворачиваешься. Враг, скорее всего, растеряется, а для тебя это отличный момент:
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_04"); //делаешь еще один удар справа налево...
			B_PracticeCombat("NC_WATERFALL_TOP01");
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_05"); //...и возвращаешься в исходную позицию. Так что тренируйся и станешь настоящим профессионалом.
			B_GiveInvItems	(hero, self, ItMiNugget, 50);
			SLD_709_Cord_TRAINAGAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Тебе не хватает руды.
	};
}; 
