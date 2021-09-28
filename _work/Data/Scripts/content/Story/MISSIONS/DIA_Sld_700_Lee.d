//*********************************************************
//							EXIT									
//*********************************************************

instance  Sld_700_Lee_Exit (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  999;
	condition	=  Sld_700_Lee_Exit_Condition;
	information	=  Sld_700_Lee_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Sld_700_Lee_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Sld_700_Lee_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//*********************************************************
//						Greet									
//*********************************************************

instance  Sld_700_Lee_Greet (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  Sld_700_Lee_Greet_Condition;
	information	=  Sld_700_Lee_Greet_Info;
	permanent	=  0;
	description = "Ты глава наемников, да?";
};                       

FUNC int  Sld_700_Lee_Greet_Condition()
{
	return 1;
};

FUNC VOID  Sld_700_Lee_Greet_Info()
{
	AI_Output (other, self,"DIA_Lee_Greet_15_00"); //Ты глава наемников, да?
	AI_Output (self, other,"DIA_Lee_Greet_08_01"); //Да, ты совершенно прав!
};

//*********************************************************
//						Define									
//*********************************************************

instance  Sld_700_Lee_Define (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  Sld_700_Lee_Define_Condition;
	information	=  Sld_700_Lee_Define_Info;
	permanent	=  0;
	description = "Что делают наемники на службе у магов?";
};                       

FUNC int  Sld_700_Lee_Define_Condition()
{
	if (Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_Define_Info()
{
	AI_Output (other, self,"DIA_Lee_Define_15_00"); //Что делают наемники на службе у магов?
	AI_Output (self, other,"DIA_Lee_Define_08_01"); //У нас не такая уж сложная работа. Мы должны охранять руду и защищать магов.
	AI_Output (self, other,"DIA_Lee_Define_08_02"); //Иногда маги дают кому-нибудь из нас особые задания.
};

//*********************************************************
//						Mitmachen									
//*********************************************************

instance  Sld_700_Lee_Mitmachen (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  2;
	condition	=  Sld_700_Lee_Mitmachen_Condition;
	information	=  Sld_700_Lee_Mitmachen_Info;
	permanent	=  0;
	description = "Я хочу стать одним из вас.";
};                       

FUNC int  Sld_700_Lee_Mitmachen_Condition()
{
	if	(Npc_KnowsInfo(hero,Sld_700_Lee_Greet))
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	&&	(oldHeroGuild == 0)
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_Mitmachen_Info()
{
	AI_Output (other, self,"DIA_Lee_Mitmachen_15_00"); //Я хочу стать одним из вас.
	AI_Output (self, other,"DIA_Lee_Mitmachen_08_01"); //А ты храбр! Думаешь, я так просто принимаю каждого, кто ко мне приходит?
	AI_Output (self, other,"DIA_Lee_Mitmachen_08_02"); //Сначала познакомься с жизнью нашего лагеря, а я буду за тобой приглядывать!
};

//*********************************************************
//						NowReady for Sld?									
//*********************************************************
	var int Lee_SldPossible;
//*********************************************************

instance  Sld_700_Lee_NowReady (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  700;
	condition	=  Sld_700_Lee_NowReady_Condition;
	information	=  Sld_700_Lee_NowReady_Info;
	permanent	=  1;
	description = "Я хочу стать наемником и защищать магов. Ты примешь меня?";
};                       

FUNC int  Sld_700_Lee_NowReady_Condition()
{
	if	(Npc_GetTrueGuild(hero) == GIL_ORG)
	&&	(Npc_KnowsInfo(hero,Sld_700_Lee_Mitmachen) || (hero.level >= 10))
	{
		return 1;
	};
};

FUNC VOID  Sld_700_Lee_NowReady_Info()
{
	AI_Output (other, self,"DIA_Lee_NowReady_15_00"); //Я хочу стать наемником и защищать магов. Ты примешь меня?
	
	if (CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_01"); //Ты помог Братству, а твои дела в Старой шахте говорят сами за себя. 
		AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_02"); //Я согласен принять тебя в наемники.
	
		if hero.level < 10
		{
			AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_03"); //Но ты еще не готов стать одним из нас. Наберись сначала опыта, а там посмотрим.
	    	AI_StopProcessInfos	(self);
			B_PrintGuildCondition(10);
	    }
	    else if hero.level >= 10
	    {
	    	AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //Я дам тебе возможность проявить себя.
	    	Lee_SldPossible = TRUE;
		};
	}
	else
	{	
		if hero.level < 10
		{
			AI_Output (self, other,"DIA_Lee_NowReady_08_01"); //Ты недостаточно опытен. Тебе нужно еще многому научиться.
			B_PrintGuildCondition(10);
	    }
	    else if hero.level >= 10
	    {
	    	AI_Output			(self, other,"Sld_700_Lee_BECOMESLD_Info_08_04"); //Я дам тебе возможность проявить себя.
	    	Lee_SldPossible = TRUE;
		};
	};
};

/*------------------------------------------------------------------------
							SЦLDNER WERDEN	2									
------------------------------------------------------------------------*/

instance  Sld_700_Lee_BECOMESLDNOW (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_BECOMESLDNOW_Condition;
	information		= Sld_700_Lee_BECOMESLDNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я хочу стать наемником."; 
};

FUNC int  Sld_700_Lee_BECOMESLDNOW_Condition()
{	
	if (Lee_SldPossible == TRUE)
	&& (hero.level >= 10)
	{
		return TRUE;
	};
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_Info_15_01"); //Я хочу стать наемником.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_Info_08_02"); //Это хороший выбор. Ты о нем не пожалеешь.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_Info_08_03"); //Скажи мне только, почему? Почему ты решил присоединиться к нашему лагерю, а не к Гомезу или к Братству?

	Log_CreateTopic		(GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry			(GE_BecomeMercenary,"Ли принял меня в ряды наемников.");
	
	Info_ClearChoices	(Sld_700_Lee_BECOMESLDNOW);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Другие лагеря того не стоят.",Sld_700_Lee_BECOMESLDNOW_NOOTHER);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Я хотел свободы с тех пор как попал сюда.",Sld_700_Lee_BECOMESLDNOW_FREEDOM);
	Info_AddChoice		(Sld_700_Lee_BECOMESLDNOW,"Так уж вышло.",Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE);
};
  
FUNC void  Sld_700_Lee_BECOMESLDNOW_NOOTHER()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_15_01"); //Другие лагеря того не стоят.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_NOOTHER_08_02"); //Да, единственное, что хоть чего-то стоит в этой колонии - это надежда на освобождение. Добро пожаловать, наемник!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_FREEDOM()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_15_01"); //Я хотел свободы с тех пор как попал сюда.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_FREEDOM_08_02"); //И мы вернем ее себе. Добро пожаловать, наемник!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

FUNC void  Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE()
{
	AI_Output			(other, self,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_15_01"); //Так уж вышло.
	AI_Output			(self, other,"Sld_700_Lee_BECOMESLDNOW_JUSTBECAUSE_08_02"); //Главное, чтобы мы не остались в плену этого Барьера навечно. Добро пожаловать, наемник!
	CreateInvItem		(self,SLD_ARMOR_L);
	B_GiveInvItems      (self, hero, SLD_ARMOR_L, 1);
	AI_EquipBestArmor	(hero);
	Npc_SetTrueGuild	(hero,GIL_SLD);
	hero.guild = GIL_SLD;
	AI_StopProcessInfos	(self);
};

//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################
/*------------------------------------------------------------------------
							SZENE DAMM									
------------------------------------------------------------------------*/

instance Sld_700_Lee_DAMNPAST (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_DAMNPAST_Condition;
	information		= Sld_700_Lee_DAMNPAST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Sld_700_Lee_DAMNPAST_Condition()
{	
	if (Saturas_BringFoci == 5)
	&& (Npc_GetDistToNpc (hero,self) < 1000)	
	&& (Npc_GetDistToWp (self,"NC_DAM") < 1000) 
	{
		return TRUE;
	};
};
func void  Sld_700_Lee_DAMNPAST_Info()
{
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_01"); //А ведь когда-то я вел совсем другую жизнь.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_02"); //Я был одним из лучших генералов королевства.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_03"); //Всю свою жизнь я боролся за его свободу.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_04"); //Знать не принимала меня, но король прислушивался к моим советам. Вельможи считали, что я представляю угрозу их грязным интригам.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_05"); //Я недооценивал их коварства. Они не побоялись убить королеву ради победы надо мной.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_06"); //В этом бессмысленном убийстве обвинили меня. У короля Робара не осталось иного выбора.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_07"); //Мои заслуги перед королевством спасли меня от смерти. Но у меня забрали свободу.
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_08"); //Когда-нибудь я вырвусь отсюда. Вот тогда они за все поплатятся.
	
	AI_AlignToWP		(self);
	
	AI_Output			(self, other,"Sld_700_Lee_DAMNPAST_Info_08_09"); //Я должен им отомстить.
	
	Npc_ExchangeRoutine (self,"START");
	
	var C_NPC Homer;
	Homer = Hlp_GetNpc	(BAU_935_HOMER);
	Npc_ExchangeRoutine	(Homer,"START"); 
	AI_ContinueRoutine	(Homer);
};

//*********************************************************
//						FMTaken									
//*********************************************************

instance  Sld_700_Lee_FMTaken (C_INFO)
{
	npc			=  Sld_700_Lee;
	nr			=  1;
	condition	=  Sld_700_Lee_FMTaken_Condition;
	information	=  Sld_700_Lee_FMTaken_Info;
	permanent	=  1;
	description = "Что ты думаешь о нападении на шахту?";
};                       

FUNC int  Sld_700_Lee_FMTaken_Condition()
{
	if	FMTaken
	{
		return TRUE;
	};
};

FUNC VOID  Sld_700_Lee_FMTaken_Info()
{
	AI_Output (other, self,"DIA_Lee_FMTaken_15_00"); //Что ты думаешь о нападении на шахту?
	
	if (Lee_freeminereport == 0) 					//SC hat jetzt die Mцglichkeit, Lee ьber die freie Mine zu informieren! ***Bjцrn***
	{
	
		AI_Output (self, other,"DIA_Lee_FMTaken_08_01"); //Гомез зашел слишком далеко. Он еще пожалеет об этом.
	
	}
	else
	{
		AI_Output			(hero, self,"Info_Lee_now_freeminefree_15_01"); 	//Люди Гомеза больше не опасны!
		AI_Output			(self, hero,"Sld_700_Lee_CHANGESIDE_Info_08_02"); 	//Ты много сделал для нас. Нам нужны такие люди, как ты.
		AI_Output			(hero, self,"Info_FreemineOrc_EXIT_15_03"); 		//Спасибо. А теперь мне нужно уходить.
		AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_01"); 		//Подожди!
		AI_Output			(self, hero,"Info_CorAngar_TELEPORT_08_03"); 		//Возьми эту руну в знак нашей благодарности за твою помощь.
		AI_Output			(hero, self,"Info_CorAngar_TELEPORT_15_05"); 		//Спасибо тебе!
		AI_Output			(hero,	self,"Info_Exit_Info_15_01"); 				//До встречи!


		B_LogEntry			(CH4_BannedFromOC,	"Я рассказал Ли о том, что мы с Горном очистили Свободную шахту. Он был очень доволен.");
		
 	   	B_GiveInvItems (self,other, ItArRuneFirestorm, 1);
		B_GiveXP (500);		
		Lee_freeminereport = 0;
	};
};

/*------------------------------------------------------------------------
						WECHSEL VON GRD ZU SLD								
------------------------------------------------------------------------*/
instance  Sld_700_Lee_CHANGESIDE (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_CHANGESIDE_Condition;
	information		= Sld_700_Lee_CHANGESIDE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Меня прогнали из Старого лагеря. Я могу присоединиться к вам?"; 
};

FUNC int  Sld_700_Lee_CHANGESIDE_Condition()
{	
	if (Npc_KnowsInfo (hero,KDW_600_Saturas_GOTOLEE))
	{
		return TRUE;
	};

};

FUNC void  Sld_700_Lee_CHANGESIDE_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_CHANGESIDE_Info_15_01"); //Меня прогнали из Старого лагеря. Я могу присоединиться к вам?
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_02"); //Ты много сделал для нас. Нам нужны такие люди, как ты.
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_03"); //Что ж, добро пожаловать в Новый лагерь, наемник!
	AI_Output			(self, other,"Sld_700_Lee_CHANGESIDE_Info_08_04"); //Возьми эти доспехи. Я рад, что ты пришел к нам.

	CreateInvItem		(self, SLD_ARMOR_M);
	B_GiveInvItems      (self, hero, SLD_ARMOR_M, 1);
	Npc_GetInvItemBySlot(hero, INV_ARMOR, 2);
	if (Hlp_GetInstanceID(item)==SLD_ARMOR_M)
	{	
		AI_EquipArmor	(hero, item);
	};
	
	Npc_SetTrueGuild	(hero, GIL_SLD);
	hero.guild = GIL_SLD;

	B_LogEntry			(CH4_BannedFromOC,"Я перешел в другой лагерь. После того как меня изгнали из Старого лагеря, Ли принял меня в наемники. Мне нужно попасть к Сатурасу!");

	Log_CreateTopic 	(GE_TeacherNC,LOG_NOTE);
	B_LogEntry			(GE_TeacherNC,"Ли может научить меня вести бой двуручным мечом. Еще он может помочь мне увеличить силу и ловкость.");
};  

/*------------------------------------------------------------------------
							ARMOR									
------------------------------------------------------------------------*/
instance  Sld_700_Lee_ARMOR (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_ARMOR_Condition;
	information		= Sld_700_Lee_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "У тебя есть хорошие доспехи?"; 
};

FUNC int  Sld_700_Lee_ARMOR_Condition()
{	
	if  (Npc_GetTrueGuild (hero) == GIL_SLD)
	{
		return TRUE;
	};

};
FUNC void  Sld_700_Lee_ARMOR_Info()
{
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_Info_15_01"); //У тебя есть хорошие доспехи?
	AI_Output				(self, other,"Sld_700_Lee_ARMOR_Info_08_02"); //Доспехи нужно заслужить. К тому же, хорошие доспехи ценятся очень высоко.
	
	Info_ClearChoices	(Sld_700_Lee_ARMOR);
	Info_AddChoice		(Sld_700_Lee_ARMOR,DIALOG_BACK,Sld_700_Lee_ARMOR_BACK);
	Info_AddChoice		(Sld_700_Lee_ARMOR,B_BuildBuyArmorString("Средний доспех: оружие 55, стрелы 10, огонь 25", VALUE_SLD_ARMOR_M) ,Sld_700_Lee_ARMOR_M);
	Info_AddChoice		(Sld_700_Lee_ARMOR,B_BuildBuyArmorString("Тяжелый доспех: оружие 70, стрелы 10, огонь 35", VALUE_SLD_ARMOR_H),Sld_700_Lee_ARMOR_H);
};  
func void Sld_700_Lee_ARMOR_BACK()
{
	Info_ClearChoices (Sld_700_Lee_ARMOR);
};
func void Sld_700_Lee_ARMOR_M()
{
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_M_Info_08_01"); //Дай мне средний доспех.
	if (Kapitel < 3)
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_02"); //Ты еще не можешь носить такие доспехи. Приходи, когда у тебя будет больше опыта.
	}
	else if (Npc_HasItems (hero,ItMinugget) < VALUE_SLD_ARMOR_M) 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_03"); //Я не раздаю доспехи бесплатно.
	}
	else 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_M_Info_08_04"); //Это добротно сделанные доспехи. Они надежно защитят тебя.
		B_GiveInvItems  	(hero, self, ItMinugget,VALUE_SLD_ARMOR_M);
		CreateInvItem		(hero,SLD_ARMOR_M);
		
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};
};
func void Sld_700_Lee_ARMOR_H()
{
	AI_Output				(other, self,"Sld_700_Lee_ARMOR_H_Info_08_01"); //Дай мне тяжелый доспех.
	if (Kapitel < 4)
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_02"); //Ты еще не можешь носить такие доспехи. Приходи, когда у тебя будет больше опыта.
	}
	else if (Npc_HasItems(hero,ItMinugget) < VALUE_SLD_ARMOR_H) 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_03"); //Я не раздаю доспехи бесплатно.
	}
	else 
	{
		AI_Output			(self, other,"Sld_700_Lee_ARMOR_H_Info_08_04"); //Это лучшие доспехи, которые можно достать в колонии, поверь мне. Они стоят той руды, которую я за них беру.
		B_GiveInvItems  	(hero, self, ItMinugget,VALUE_SLD_ARMOR_H);

		CreateInvItem		(hero,SLD_ARMOR_H);	//SN: ohne B_GiveInvItem, weil sonst Lee nackt dasteht!

		// nur wegen Bildschirmausgabe "1 Gegenstand erhalten"
		CreateInvItem		(self, ItAmArrow);
		B_GiveInvItems      (self, hero, ItAmArrow, 1);
		Npc_RemoveInvItem	(hero, ItAmArrow);
	};

};
/*------------------------------------------------------------------------
							STR + DEX								
------------------------------------------------------------------------*/
INSTANCE Sld_700_Lee_Teach(C_INFO)
{
	npc			= Sld_700_Lee;
	nr			= 10;
	condition	= Sld_700_Lee_Teach_Condition;
	information	= Sld_700_Lee_Teach_Info;
	permanent	= 1;
	description = "Ты можешь научить меня чему-нибудь?";
};                       

FUNC INT Sld_700_Lee_Teach_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_SLD)
	  
	{
		return TRUE;
	};
};

FUNC VOID Sld_700_Lee_Teach_Info()
{
	AI_Output(other,self,"Sld_700_Lee_Teach_15_00"); //Ты можешь научить меня чему-нибудь?
	AI_Output(self,other,"Sld_700_Lee_Teach_08_01"); //Я могу помочь тебе стать более ловким и сильным.
	
	
	
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_BACK()
{
	
	Info_ClearChoices	(Sld_700_Lee_Teach);
};

func void Sld_700_Lee_Teach_STR_1()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_STR_5()
{
	B_BuyAttributePoints (other, ATR_STRENGTH, 5*LPCOST_ATTRIBUTE_STRENGTH);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString( NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_1()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};

func void Sld_700_Lee_Teach_DEX_5()
{
	B_BuyAttributePoints (other, ATR_DEXTERITY, 5*LPCOST_ATTRIBUTE_DEXTERITY);
	Info_ClearChoices	(Sld_700_Lee_Teach);
	Info_AddChoice		(Sld_700_Lee_Teach,DIALOG_BACK																,Sld_700_Lee_Teach_BACK);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_5,5*LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnStrength_1,LPCOST_ATTRIBUTE_STRENGTH,0)		,Sld_700_Lee_Teach_STR_1);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_5,5*LPCOST_ATTRIBUTE_DEXTERITY,0)	,Sld_700_Lee_Teach_DEX_5);
	Info_AddChoice		(Sld_700_Lee_Teach,B_BuildLearnString(NAME_LearnDexterity_1,LPCOST_ATTRIBUTE_DEXTERITY,0)		,Sld_700_Lee_Teach_DEX_1);
};
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 1
//-------------------------------------------------------------------------
instance  Sld_700_Lee_ZWEIHAND1 (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_ZWEIHAND1_Condition;
	information		= Sld_700_Lee_ZWEIHAND1_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_1, LPCOST_TALENT_2H_1,0); 
};

FUNC int  Sld_700_Lee_ZWEIHAND1_Condition()
{	
	if 	( 
			(Npc_GetTalentSkill  (hero,NPC_TALENT_2H) < 1)
			&& ((Npc_GetTrueGuild    (hero) == GIL_SLD) || ((Npc_GetTrueGuild(hero)==GIL_KDW) && (Kapitel >= 4))  )	//jetzt auch als Wassermagier im 4. Kapitel mцglich ***BJЦRN***
		)
	{
		return TRUE;
	};

};
FUNC void  Sld_700_Lee_ZWEIHAND1_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_ZWEIHAND1_Info_15_01"); //Научи меня владеть двуручным мечом.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 1, LPCOST_TALENT_2H_1))
	{
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_02"); //Хорошо, начнем с самых азов.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_03"); //Держи клинок горизонтально. Чтобы нанести удар таким тяжелым оружием, необходимо хорошо размахнуться.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_04"); //Подними меч и нанеси удар сверху. Обычно такой удар может повергнуть противника.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_05"); //Используй инерцию движения, чтобы нанести удар снизу.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_06"); //Двуручным мечом можно наносить очень сильные боковые удары. При этом противник не сможет к тебе приблизиться.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND1_Info_08_07"); //Что ж, для первого урока достаточно. Иди, тренируйся.
	
		Sld_700_Lee_ZWEIHAND1.permanent = 0;
	};
};  
//-------------------------------------------------------------------------
//							ZWEIHANDKAMPF LERNEN STUFE 2
//-------------------------------------------------------------------------
instance  Sld_700_Lee_ZWEIHAND2 (C_INFO)
{
	npc				= Sld_700_Lee;
	condition		= Sld_700_Lee_ZWEIHAND2_Condition;
	information		= Sld_700_Lee_ZWEIHAND2_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn2h_2, LPCOST_TALENT_2H_2,0); 
};

FUNC int  Sld_700_Lee_ZWEIHAND2_Condition()
{	
	if
		( 
			(Npc_GetTalentSkill  (hero,NPC_TALENT_2H) == 1)
			&& ( (Npc_GetTrueGuild    (hero) == GIL_SLD) ||  ((Npc_GetTrueGuild(hero)==GIL_KDW) && (Kapitel >= 4))  )	//jetzt auch als Wassermagier im 4. Kapitel mцglich ***BJЦRN***
		)
	{
		return TRUE;
	};

};
FUNC void  Sld_700_Lee_ZWEIHAND2_Info()
{
	AI_Output			(other, self,"Sld_700_Lee_ZWEIHAND2_Info_15_01"); //Я хочу узнать больше о владении двуручным мечом.
	
	if (B_GiveSkill(other,NPC_TALENT_2H , 2, LPCOST_TALENT_2H_2))
	{
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_02"); //Для начала тебе нужно изменить стойку. Держи клинок вертикально, возьмись за рукоять обеими руками и отведи меч немного в сторону.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_03"); //Нанеси быстрый удар сверху, направляя клинок над плечом. У тебя появится возможность перейти к быстрому удару слева.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_04"); //При этом у противника не будет никаких шансов приблизиться к тебе.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_05"); //Ты можешь еще нанести удар слева сверху, чтобы оттолкнуть противника.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_06"); //Сделай быстрый разворот, и ты сможешь ударить противника с силой, достаточной для того, чтобы повергнуть врага.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_07"); //Если противник смог избежать этого удара, используй инерцию меча, чтобы нанести следующий удар.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_08"); //После атаки прими оборонительную стойку и жди подходящего момента для следующего удара.
		AI_Output			(self, other,"Sld_700_Lee_ZWEIHAND2_Info_08_09"); //Смена ударов и правильный выбор позиции являются основой успешного ведения боя.
	
		Sld_700_Lee_ZWEIHAND2.permanent = 0;
	};
};  
