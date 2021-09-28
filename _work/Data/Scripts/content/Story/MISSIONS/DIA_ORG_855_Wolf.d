//****************************************
//					EXIT
//****************************************

INSTANCE DIA_ORG_855_Wolf_Exit (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 999;
	condition	= DIA_ORG_855_Wolf_Exit_Condition;
	information	= DIA_ORG_855_Wolf_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ORG_855_Wolf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_ORG_855_Wolf_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//****************************************
//					Hallo
//****************************************

INSTANCE DIA_Wolf_Hello (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 1;
	condition	= DIA_Wolf_Hello_Condition;
	information	= DIA_Wolf_Hello_Info;
	permanent	= 0;
	description = "Кто ты?";
};                       

FUNC INT DIA_Wolf_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Wolf_Hello_Info()
{
	AI_Output			(other, self,"DIA_Wolf_Hello_15_00"); //Кто ты?
	AI_Output			(self, other,"DIA_Wolf_Hello_09_01"); //Меня зовут Волк. Я делаю доспехи.

	B_LogEntry			(GE_TraderNC,	"Волк продает ворам доспехи. Его можно найти возле его дома, в большой пещере Нового лагеря.");
};

//****************************************
//				Bin ORG!
//****************************************

INSTANCE DIA_Wolf_GreetORG (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 1;
	condition	= DIA_Wolf_GreetORG_Condition;
	information	= DIA_Wolf_GreetORG_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Wolf_GreetORG_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_ORG)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Wolf_GreetORG_Info()
{
	AI_Output (self, other,"DIA_Wolf_GreetORG_09_00"); //Эй! Теперь ты один из нас.
};

//****************************************
//				TRADE
//****************************************

instance  Org_855_Wolf_TRADE (C_INFO)
{
	npc				= Org_855_Wolf;
	nr				= 800;
	condition		= Org_855_Wolf_TRADE_Condition;
	information		= Org_855_Wolf_TRADE_Info;
	permanent		= 1;
	description		= DIALOG_TRADE; 
	trade 			= 1;
};

FUNC int  Org_855_Wolf_TRADE_Condition()
{	
	return 1;
};

FUNC void  Org_855_Wolf_TRADE_Info()
{
	AI_Output (other, self,"Org_855_Wolf_TRADE_15_00"); //А ты берешь в оплату что-нибудь еще?
	AI_Output (self, other,"Org_855_Wolf_TRADE_09_01"); //Я покупаю меха и шкуры у охотников. Если у тебя найдется что-то подобное, с удовольствием куплю.
	

};

//****************************************
//				Wo Jдger
//****************************************

instance  Org_855_Wolf_WhereHunter (C_INFO)
{
	npc				= Org_855_Wolf;
	nr				= 900;
	condition		= Org_855_Wolf_WhereHunter_Condition;
	information		= Org_855_Wolf_WhereHunter_Info;
	permanent		= 1;
	description		= "Как добываются меха и шкуры?"; 
};

FUNC int  Org_855_Wolf_WhereHunter_Condition()
{	
	return 1;
};

FUNC void  Org_855_Wolf_WhereHunter_Info()
{
	AI_Output (other, self,"Org_855_Wolf_WhereHunter_15_00"); //Как добываются меха и шкуры?
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_01"); //По пути в Новый лагерь живет охотник Эйдан. Он может тебя научить, как правильно разделывать добычу.
	AI_Output (self, other,"Org_855_Wolf_WhereHunter_09_02"); //Рэтфорд и Дракс живут в северной части Старого лагеря, по пути к рыночной площади. 
};

//****************************************
//				Sell Armor
//****************************************

INSTANCE DIA_Wolf_SellArmor (C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 700;
	condition	= DIA_Wolf_SellArmor_Condition;
	information	= DIA_Wolf_SellArmor_Info;
	permanent	= 1;
	description = "Мне нужен доспех получше.";
};                       

FUNC INT DIA_Wolf_SellArmor_Condition()
{
	if ( (Npc_KnowsInfo(hero,DIA_Wolf_Hello)) 
	&& (!Npc_KnowsInfo(hero, Info_Wolf_ARMORFINISHED)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Wolf_SellArmor_Info()
{
	AI_Output (other, self,"DIA_Wolf_SellArmor_15_00"); //Мне нужен доспех получше.
	
	if ( (Npc_GetTrueGuild(other)==GIL_ORG) || (Npc_GetTrueGuild(other)==GIL_SLD) )
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_09_01"); //Теперь ты один из нас, и можешь купить у меня все, что захочешь.

		Info_ClearChoices 	(DIA_Wolf_SellArmor);
		Info_Addchoice 		(DIA_Wolf_SellArmor,DIALOG_BACK														,DIA_Wolf_SellArmor_BACK);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString("Средний доспех: оружие 35, стрелы 5, огонь 15",VALUE_ORG_ARMOR_M),DIA_Wolf_SellArmor_M);
		Info_Addchoice 		(DIA_Wolf_SellArmor,B_BuildBuyArmorString("Тяжелый доспех: оружия 40, стрелы 5, огонь 20",VALUE_ORG_ARMOR_H)		,DIA_Wolf_SellArmor_H);
	}
	else
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_WRONGGUILD_09_00"); //Сейчас я не могу продать их тебе. Ларс мне голову оторвет, если я продам доспехи чужаку.
	};
};

func void DIA_Wolf_SellArmor_BACK()
{
	Info_ClearChoices 	(DIA_Wolf_SellArmor);
};

func void DIA_Wolf_SellArmor_M()
{
	AI_Output (other, self,"DIA_Wolf_SellArmor_M_15_01"); //Я хочу купить средний доспех.
	
	if (Npc_HasItems (hero,ItMinugget)< VALUE_ORG_ARMOR_M)
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_M_09_02"); //Без руды ты ничего не сможешь купить.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_M_09_03"); //Хороший доспех. Правда не такой, как на мне, но он тоже сможет тебя защитить.

		B_GiveInvItems		(hero, self,ItMinugget,VALUE_ORG_ARMOR_M);
		
		CreateInvItem		(hero,ORG_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};

func void DIA_Wolf_SellArmor_H()
{
	AI_Output (other,self,"DIA_Wolf_SellArmor_H_15_01"); //Ты продаешь тяжелые доспехи?

	if (Npc_HasItems (hero,ItMinugget) < VALUE_ORG_ARMOR_H) 
	{
		AI_Output (self, other,"DIA_Wolf_SellArmor_H_09_02"); //Без руды ты ничего не сможешь купить.
	}
	else 
	{
		AI_Output			(self, other,"DIA_Wolf_SellArmor_H_09_03"); //Этот доспех защитит тебя от любой опасности. Я сам такой ношу, и, как видишь, до сих пор жив.

		B_GiveInvItems		(hero, self, ItMinugget,VALUE_ORG_ARMOR_H);
		
		CreateInvItem 		(hero,ORG_ARMOR_H);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};

/*------------------------------------------------------------------------
							BOGENSCHIESSEN	DAS ANGEBOT							
------------------------------------------------------------------------*/

instance  ORG_855_Wolf_TRAINOFFER (C_INFO)
{
	npc				= ORG_855_Wolf;
	nr				= 100;
	condition		= ORG_855_Wolf_TRAINOFFER_Condition;
	information		= ORG_855_Wolf_TRAINOFFER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я хочу научиться стрелять из лука."; 
};

FUNC int  ORG_855_Wolf_TRAINOFFER_Condition()
{	
	if( Npc_GetTalentSkill (hero,NPC_TALENT_BOW) != 2)
	{
		return TRUE;
	};
};

FUNC void  ORG_855_Wolf_TRAINOFFER_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_01"); //Я хочу научиться стрелять из лука.
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_02"); //Я могу научить тебя, но не бесплатно. Мне тоже нужно на что-то жить.
	AI_Output (other, self,"ORG_855_Wolf_TRAINOFFER_Info_15_03"); //Сколько ты хочешь?
	AI_Output (self, other,"ORG_855_Wolf_TRAINOFFER_Info_09_04"); //Каждый мой урок стоит 50 кусков руды, и торг здесь неуместен.
	
	Log_CreateTopic   	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,	"Вор Волк может научить меня стрелять из лука.");
	
};  
/*------------------------------------------------------------------------
						BOGENSCHIESSEN		DIE ERSTE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  ORG_855_Wolf_TRAIN (C_INFO)
{
	npc				= ORG_855_Wolf;
	nr				= 100;
	condition		= ORG_855_Wolf_TRAIN_Condition;
	information		= ORG_855_Wolf_TRAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= B_BuildLearnString(NAME_LearnBow_1,LPCOST_TALENT_BOW_1,50); 
};

FUNC int  ORG_855_Wolf_TRAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_855_Wolf_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 0)
	{
		return TRUE;
	};

};
FUNC void  ORG_855_Wolf_TRAIN_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRAIN_Info_15_01"); //Научи меня стрелять из лука.
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,1,LPCOST_TALENT_BOW_1)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_02"); //Твоя ловкость влияет на точность стрельбы. Чем лучше ты владеешь телом, тем точнее будут твои выстрелы.
			AI_Output (self, other,"ORG_855_Wolf_TRAIN_Info_09_03"); //Чем лучше ты освоишь стрельбу из лука, тем больше будет расстояние, на котором ты сможешь поразить свою цель. Ты должен развивать и то, и другое, чтобы стать хорошим лучником.
			B_GiveInvItems (hero, self, ItMiNugget,50);
		};
	};
};  
/*------------------------------------------------------------------------
						BOGENSCHIESSEN		DIE ZWEITE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  ORG_855_Wolf_TRAINAGAIN (C_INFO)
{
	npc				= ORG_855_Wolf;
	nr				= 100;
	condition		= ORG_855_Wolf_TRAINAGAIN_Condition;
	information		= ORG_855_Wolf_TRAINAGAIN_Info;
	important		= 0;
	permanent		= 0;
	description		= B_BuildLearnString(NAME_LearnBow_2,	LPCOST_TALENT_BOW_2,50); 
};

FUNC int  ORG_855_Wolf_TRAINAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_855_Wolf_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_BOW) == 1)
	{
		return TRUE;
	};

};
FUNC void  ORG_855_Wolf_TRAINAGAIN_Info()
{
	AI_Output (other, self,"ORG_855_Wolf_TRAINAGAIN_Info_15_01"); //Я хочу научиться лучше стрелять из лука.
	if (Npc_HasItems (hero,ItMiNugget) >= 50) 
	{
		if B_GiveSkill(hero,NPC_TALENT_BOW,2,LPCOST_TALENT_BOW_2)
		{
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_02"); //Ты уже хороший охотник. Тебе осталось выучить последнюю премудрость.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_03"); //Ты должен научиться двигаться бессознательно, не раздумывая над тем, что делать в следующий момент.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_04"); //Запомни закон: рассчитываешь расстояние до цели, скорость полета, силу натяжения тетивы - и стрела летит в цель. Будь всегда внимателен.
			AI_Output (self, other,"ORG_855_Wolf_TRAINAGAIN_Info_09_05"); //Технику ты очень хорошо освоил. Теперь настало время применить свои знания на практике.
			
			B_GiveInvItems (hero, self, ItMiNugget,50);
		};
	};
}; 
//---------------------------------------------------------------
//     					 DEX
//---------------------------------------------------------------
INSTANCE ORG_855_Wolf_Teach(C_INFO)
{
	npc			= ORG_855_Wolf;
	nr			= 100;
	condition	= ORG_855_Wolf_Teach_Condition;
	information	= ORG_855_Wolf_Teach_Info;
	permanent	= 1;
	description = "Ты можешь научить меня чему-нибудь?";
};                       

FUNC INT ORG_855_Wolf_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD)  
	{
		return TRUE;
	};
};

FUNC VOID ORG_855_Wolf_Teach_Info()
{
	AI_Output(other,self,"ORG_855_Wolf_Teach_15_00"); //Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"ORG_855_Wolf_Teach_09_01"); //Развивай ловкость, это поможет тебе добиться успеха в охоте.
	
	if (log_wolftrain == FALSE)
	{
	Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Вор Волк может помочь мне увеличить ловкость.");
	log_wolftrain = TRUE;
	};
	
	Info_ClearChoices	(ORG_855_Wolf_Teach);
	Info_AddChoice		(ORG_855_Wolf_Teach,DIALOG_BACK									,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_BACK()
{
	
	Info_ClearChoices	(ORG_855_Wolf_Teach);
};
func void ORG_855_Wolf_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(ORG_855_Wolf_Teach);
	Info_AddChoice		(ORG_855_Wolf_Teach,DIALOG_BACK									,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0) ,ORG_855_Wolf_Teach_DEX_1);
};

func void ORG_855_Wolf_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(ORG_855_Wolf_Teach);
	Info_AddChoice		(ORG_855_Wolf_Teach,DIALOG_BACK									,ORG_855_Wolf_Teach_BACK);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_5);
	Info_AddChoice		(ORG_855_Wolf_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0),ORG_855_Wolf_Teach_DEX_1);
};




//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################


//---------------------------------------------------------------------
//	Info GOOD
//---------------------------------------------------------------------
INSTANCE Info_Wolf_GOOD (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_GOOD_Condition;
	information	= Info_Wolf_GOOD_Info;
	important	= 0;	
	permanent	= 0;
	description = "Горн сказал, что ты хочешь поговорить со мной.";
};                       

FUNC INT Info_Wolf_GOOD_Condition()
{
	if	Gorn_GotoWolf
	{
		return TRUE;
	};
};

func VOID Info_Wolf_GOOD_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_GOOD_15_01"); //Горн сказал, что ты хочешь поговорить со мной.
	AI_Output 			(self,hero,"Info_Wolf_GOOD_09_02"); //Рад, что ты пришел ко мне перед уходом.
	if (!Npc_KnowsInfo(hero,Info_Gorn_FMCENTRANCE))
	{
		AI_Output 			(hero,self,"Info_Wolf_GOOD_15_03"); //Перед каким уходом?
		AI_Output 			(self,hero,"Info_Wolf_GOOD_09_04"); //Перед уходом в не такую Свободную шахту.
	};
};

//---------------------------------------------------------------------
//	Info SPEAK
//---------------------------------------------------------------------
INSTANCE Info_Wolf_SPEAK (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_SPEAK_Condition;
	information	= Info_Wolf_SPEAK_Info;
	important	= 0;	
	permanent	= 0;
	description = "И что ты хочешь?";
};                       

FUNC INT Info_Wolf_SPEAK_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Wolf_GOOD)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_SPEAK_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_01"); //И что ты хочешь?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_02"); //Я придумал, как улучшить свойства наших доспехов.
	AI_Output 			(hero,self,"Info_Wolf_SPEAK_15_03"); //Да? И как?
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_04"); //Самый прочный материал в колонии - панцири ползунов. 
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_05"); //Конечно, не тех мелких ползунков, которые прячутся в шахте Гомеза...
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_06"); //...Нет. Я говорю о других ползунах, о тех, что живут в нашей шахте.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_07"); //Их панцири почти невозможно пробить. Их не берет никакое оружие.
	AI_Output 			(self,hero,"Info_Wolf_SPEAK_09_08"); //Если ты принесешь мне хоть один такой панцирь, я постараюсь сделать из него доспех.
};

//---------------------------------------------------------------------
//	Info SKIN
//---------------------------------------------------------------------
INSTANCE Info_Wolf_SKIN (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_SKIN_Condition;
	information	= Info_Wolf_SKIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Как добывать эти пластины с панцирей ползунов?";
};                       

FUNC INT Info_Wolf_SKIN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Wolf_SPEAK)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_SKIN_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_01"); //Как добывать эти пластины с панцирей ползунов?
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_02"); //Довольно просто. Спинные пластины скрепляются с основным панцирем только по краям.
	AI_Output 			(self,hero,"Info_Wolf_SKIN_09_03"); //Их можно срезать, использовав очень острый нож.
	AI_Output 			(hero,self,"Info_Wolf_SKIN_15_04"); //Я понял! Посмотрим, смогу ли я найти эти пластины.

	Knows_GetMCPlates = TRUE;
	PrintScreen	("Навык: добыча панцирных пластин", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	
	Log_CreateTopic		(CH4_MCPlateArmor,	LOG_MISSION);
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_RUNNING);
	B_LogEntry			(CH4_MCPlateArmor,	"Вор по имени Волк из Нового лагеря предложил мне добыть панцирные пластины ползунов, из которых он сможет сделать доспех. Он рассказал мне, как добывать эти пластины."); 
	
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Навык добычи панцирных пластин: ползун-воин.");

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info PROFIT
//---------------------------------------------------------------------
INSTANCE Info_Wolf_PROFIT (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_PROFIT_Condition;
	information	= Info_Wolf_PROFIT_Info;
	important	= 0;	
	permanent	= 0;
	description = "И ты говоришь мне все это, ничего не требуя взамен?";
};                       

FUNC INT Info_Wolf_PROFIT_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Wolf_SPEAK)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_PROFIT_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_PROFIT_15_01"); //И ты говоришь мне все это, ничего не требуя взамен?
	AI_Output 			(self,hero,"Info_Wolf_PROFIT_09_02"); //Ну, не совсем... Если у меня получится сделать доспех из этих пластин, то я быстро... сильно... А, ладно, забудь об этом!
};

//---------------------------------------------------------------------
//	Info MCPLATESFEW
//---------------------------------------------------------------------
INSTANCE Info_Wolf_MCPLATESFEW (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_MCPLATESFEW_Condition;
	information	= Info_Wolf_MCPLATESFEW_Info;
	important	= 0;	
	permanent	= 0;
	description = "Я нашел несколько пластин с панцирей ползунов!";
};                       

FUNC INT Info_Wolf_MCPLATESFEW_Condition()
{
	if	(Knows_GetMCPlates)
	&&	(Npc_HasItems(hero, ItAt_Crawler_02) > 0)
	&&	(Npc_HasItems(hero, ItAt_Crawler_02) < 15)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_MCPLATESFEW_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESFEW_15_01"); //Я нашел несколько пластин с панцирей ползунов!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_02"); //Нет, их слишком мало! Их не хватит на хороший доспех!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESFEW_09_03"); //Добудь мне еще!
};

//---------------------------------------------------------------------
//	Info MCPLATESENOUGH
//---------------------------------------------------------------------
INSTANCE Info_Wolf_MCPLATESENOUGH (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_MCPLATESENOUGH_Condition;
	information	= Info_Wolf_MCPLATESENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "Я собрал пластины всех убитых ползунов!";
};                       

FUNC INT Info_Wolf_MCPLATESENOUGH_Condition()
{
	if	(Knows_GetMCPlates)
	&&	(Npc_HasItems(hero, ItAt_Crawler_02) >= 15)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_MCPLATESENOUGH_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_01"); //Я собрал пластины всех убитых ползунов!
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_02"); //Отлично! Я займусь этим прямо сейчас!
	AI_Output 			(hero,self,"Info_Wolf_MCPLATESENOUGH_15_03"); //Это займет много времени?
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_04"); //Не знаю. Я же никогда еще не обрабатывал такой материал.
	AI_Output 			(self,hero,"Info_Wolf_MCPLATESENOUGH_09_05"); //Заходи ко мне, когда у тебя будет на это время.

	MCPlatesDelivered = TRUE;

	B_LogEntry			(CH4_MCPlateArmor,	"Я отдал Волку 15 панцирных пластин. Он сказал, что ему нужно время. Я зайду к нему позже.");
	B_GiveXP			(XP_DeliveredMCPlates);
	
	B_GiveInvItems	(hero, self, ItAt_Crawler_02,	15);
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info ARMORINWORK
//---------------------------------------------------------------------
INSTANCE Info_Wolf_ARMORINWORK (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_ARMORINWORK_Condition;
	information	= Info_Wolf_ARMORINWORK_Info;
	important	= 0;	
	permanent	= 1;
	description = "Как продвигается изготовление доспехов?";
};                       

FUNC INT Info_Wolf_ARMORINWORK_Condition()
{
	if	(MCPlatesDelivered			== TRUE)
	&&	(FreemineOrc_LookingUlumulu	!= LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_ARMORINWORK_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_ARMORINWORK_15_01"); //Как продвигается изготовление доспехов?
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_02"); //Дело идет не так быстро, как хотелось бы. Эти пластины почти не поддаются обработке, и я еще не придумал, как их можно скрепить между собой.
	AI_Output 			(self,hero,"Info_Wolf_ARMORINWORK_09_03"); //Мне нужно еще немного времени. Уж я что-нибудь придумаю!
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info ARMORFINISHED
//---------------------------------------------------------------------
INSTANCE Info_Wolf_ARMORFINISHED (C_INFO)
{
	npc			= Org_855_Wolf;
	condition	= Info_Wolf_ARMORFINISHED_Condition;
	information	= Info_Wolf_ARMORFINISHED_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ну что, ты уже сделал доспехи?";
};                       

FUNC INT Info_Wolf_ARMORFINISHED_Condition()
{
	if	(MCPlatesDelivered			== TRUE)
	&&	(FreemineOrc_LookingUlumulu	== LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Wolf_ARMORFINISHED_Info()
{
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_01"); //Ну что, ты уже сделал доспехи?
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_02"); //Я придумал, как скрепить пластины. У меня получилось.
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_03"); //Это значит, что доспехи уже готовы?
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_04"); //Да, конечно. Вот они. Они прочнее всех доспехов в нашем лагере, это сразу видно.
	AI_Output 			(hero,self,"Info_Wolf_ARMORFINISHED_15_05"); //Спасибо. Я твой должник.
	AI_Output 			(self,hero,"Info_Wolf_ARMORFINISHED_09_06"); //А, не беспокойся! Я всегда найду способ взять свое.

	B_LogEntry			(CH4_MCPlateArmor,	"Доспех готов. Отличная работа, к тому же это лучший доспех, который я когда-либо видел.");
	Log_SetTopicStatus	(CH4_MCPlateArmor,	LOG_SUCCESS);

	B_GiveXP			(XP_GorMCPlateArmor);

	CreateInvItem		(self, CRW_ARMOR_H);
	B_GiveInvItems      (self,hero,CRW_ARMOR_H,1);
};

/*------------------------------------------------------------------------
						BOGEN KAUFEN						
------------------------------------------------------------------------*/

instance  Org_855_Wolf_SELLBOW (C_INFO)
{
	npc				= Org_855_Wolf;
	condition		= Org_855_Wolf_SELLBOW_Condition;
	information		= Org_855_Wolf_SELLBOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Где здесь продаются хорошие луки?"; 
};

FUNC int  Org_855_Wolf_SELLBOW_Condition()
{
	return TRUE;
};
FUNC void  Org_855_Wolf_SELLBOW_Info()
{
	AI_Output (other, self,"Org_855_Wolf_SELLBOW_Info_15_01"); //Где здесь продаются хорошие луки?
	AI_Output (self, other,"Org_855_Wolf_SELLBOW_Info_09_02"); //Ты пришел туда, куда нужно. Ты можешь купить у меня хороший лук, если у тебя есть руда.
	Log_CreateTopic   	(GE_TraderNC,LOG_NOTE);
	B_LogEntry			(GE_TraderNC,"Вор Волк продает луки.");

};  





