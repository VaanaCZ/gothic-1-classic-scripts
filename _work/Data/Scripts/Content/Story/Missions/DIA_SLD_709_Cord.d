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
	description		= "Я хотел бы потренироваться с одноручным оружием."; 
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
	AI_Output (other, self,"SLD_709_Cord_TRAINOFFER_Info_15_01"); //Я хотел бы потренироваться с одноручным оружием.
	AI_Output (self, other,"SLD_709_Cord_TRAINOFFER_Info_14_02"); //Хорошо. Но не задаром. Это обойдется тебе в 30 кусков руды.

	Log_CreateTopic	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,"Наемник Корд может научить меня сражаться с одноручным оружием. В течение дня его можно найти на скалистом плато у озера.");
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
	AI_Output (other, self,"SLD_709_Cord_TRAIN_Info_15_00"); //Я хотел бы потренироваться с одноручным оружием.

	if (Npc_HasItems (hero,ItMiNugget) >= 30)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1)
		{
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_01"); //Хорошая мысль! Но прежде чем заниматься техникой, тебе нужно научиться правильно держать оружие.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_02"); //Новички часто держатся за рукоять двумя руками. Это неправильно, к этому лучше не привыкать.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_03"); //Возьмись за рукоять одной рукой. Лезвие вверх, и не держи его неподвижно.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_04"); //Оружие должно стать продолжением твоей руки, вписываться в твои движения. Это поможет ускорить атаку.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_05"); //Если запомнишь все, о чем я тебе говорил, твои удары станут более изящными и быстрыми.
			B_PracticeCombat	("NC_WATERFALL_TOP01");
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_06"); //Да, и вот еще что: некоторые удары куда эффективнее остальных. У новичка не так много шансов повторить их.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_07"); //Но чем больше ты будешь тренироваться, тем лучше они у тебя будут получаться.
			B_GiveInvItems (hero, self,ItMiNugget,30);
			SLD_709_Cord_TRAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Для этого у тебя недостаточно руды.
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
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Расскажи мне еще что-нибудь про одноручное оружие.

	if (Npc_HasItems (hero,ItMiNugget) >= 50)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2)
		{
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_02"); //Ладно, ты уже знаешь главное. Если держать клинок немного ниже, первый удар получится более сильным.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_03"); //Рубящий удар, помнишь? Ладно, теперь о том, как нужно двигаться. Наносишь два удара и разворачиваешься - враг наверняка растеряется, а ты окажешься в выгодном положении.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_04"); //Еще один взмах клинком справа налево...
			B_PracticeCombat("NC_WATERFALL_TOP01");
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_05"); //...и возвращаешься в исходную стойку. Главное, не забывай тренироваться. Иди, отрабатывай технику боя для одной руки.
			B_GiveInvItems	(hero, self, ItMiNugget, 50);
			SLD_709_Cord_TRAINAGAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Для этого у тебя недостаточно руды.
	};
}; 
