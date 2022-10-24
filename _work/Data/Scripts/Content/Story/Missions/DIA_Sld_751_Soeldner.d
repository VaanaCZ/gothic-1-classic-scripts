
//-------------------- Intro ---------------------------

instance DIA_SLD_751_Soeldner_INTRO (C_INFO)
{
	npc				= SLD_751_Soeldner;
	condition		= DIA_SLD_751_Soeldner_INTRO_CONDITION;
	information		= DIA_SLD_751_Soeldner_INTRO_INFO;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_SLD_751_Soeldner_INTRO_CONDITION()
{
	if (Npc_GetDistToNpc( self, hero ) < 300)
	//&& (Hlp_StrCmp(Npc_GetNearestWp (self),self.wp)== 0))
	{
		return 1;
	};
};

func void DIA_SLD_751_Soeldner_INTRO_INFO()
{
	AI_Output (self, other,"DIA_SLD_751_Soeldner_INTRO_INFO_01_01"); //А, новенький! Смотри, не создавай нам проблем, ведь мы спросим с тебя!
};

//-------------------- Exit 1 -----------------------------

instance DIA_SLD_751_Soeldner_EXIT_1 (C_INFO)
{
	nr				= 999;
	npc				= SLD_751_Soeldner;
	condition		= DIA_SLD_751_Soeldner_EXIT_1_CONDITION;
	information		= DIA_SLD_751_Soeldner_EXIT_1_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Пожалуй, я пойду.";
};

FUNC int DIA_SLD_751_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_EXIT_1_INFO()
{
	AI_Output (other, self,"DIA_SLD_751_Soeldner_EXIT_1_INFO_15_01"); //Пожалуй, я пойду.
	AI_Output (self, other,"DIA_SLD_751_Soeldner_EXIT_1_INFO_01_02");//Надеюсь, ты понимаешь, как себя вести.
	AI_StopProcessInfos	( self );
};

//-------------------- Exit 2 -----------------------------

instance DIA_SLD_751_Soeldner_EXIT_2 (C_INFO)
{
	nr				= 999;
	npc				= SLD_751_Soeldner;
	condition		= DIA_SLD_751_Soeldner_EXIT_2_CONDITION;
	information		= DIA_SLD_751_Soeldner_EXIT_2_INFO;
	important		= 0;
	permanent		= 1;
	description 	= "Я пойду, ладно?";
};

FUNC int DIA_SLD_751_Soeldner_EXIT_2_CONDITION()
{
	if (Npc_KnowsInfo	(hero, DIA_SLD_751_Soeldner_EXIT_1))
	{
		return 1;
	};
};

func void DIA_SLD_751_Soeldner_EXIT_2_INFO()
{
	AI_Output (other, self,"DIA_SLD_751_Soeldner_EXIT_2_INFO_15_01"); //Я пойду, ладно?
	AI_Output (self, other,"DIA_SLD_751_Soeldner_EXIT_2_INFO_01_02");//Да, да, иди.
	AI_StopProcessInfos	( self );
};

//--------------------- Umsehen ---------------------------

instance DIA_SLD_751_Soeldner_UMSEHEN (C_INFO)
{
	npc				= SLD_751_Soeldner;
	condition		= DIA_SLD_751_Soeldner_UMSEHEN_CONDITION;
	information		= DIA_SLD_751_Soeldner_UMSEHEN_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Я просто хотел посмотреть, что здесь есть.";
};

FUNC int DIA_SLD_751_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_UMSEHEN_INFO()
{  
	AI_Output (other, self,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_15_01"); //Я просто хотел посмотреть, что здесь есть.
	AI_Output (self, other,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_01_02");//Только будь осторожен и постарайся ни с кем не ссориться.
};


//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_751_Soeldner_INMINE (C_INFO)
{
	npc				= SLD_751_Soeldner;
	condition		= DIA_SLD_751_Soeldner_INMINE_CONDITION;
	information		= DIA_SLD_751_Soeldner_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Я хочу осмотреть шахту.";
};

FUNC int DIA_SLD_751_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_751_Soeldner_INMINE_INFO_15_01"); //Я хочу осмотреть шахту.
	AI_Output (self, other,"DIA_SLD_751_Soeldner_INMINE_INFO_01_02");//Не думаю, что у тебя это получится. Но можешь поговорить об этом с Окилом.

};




