
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
	AI_Output (self, other,"DIA_SLD_751_Soeldner_INTRO_INFO_01_01"); //А, посетитель! Смотри, чтобы все было тихо, или ты об этом крупно пожалеешь!
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
	description 	= "Я лучше пойду.";
};

FUNC int DIA_SLD_751_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_EXIT_1_INFO()
{
	AI_Output (other, self,"DIA_SLD_751_Soeldner_EXIT_1_INFO_15_01"); //Я лучше пойду.
	AI_Output (self, other,"DIA_SLD_751_Soeldner_EXIT_1_INFO_01_02");//Надеюсь, мы понимаем друг друга.
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
	description 	= "Мне пора идти.";
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
	AI_Output (other, self,"DIA_SLD_751_Soeldner_EXIT_2_INFO_15_01"); //Мне пора идти.
	AI_Output (self, other,"DIA_SLD_751_Soeldner_EXIT_2_INFO_01_02");//Ну, иди.
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
	description 	= "Я просто хотел немного оглядеться.";
};

FUNC int DIA_SLD_751_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_UMSEHEN_INFO()
{  
	AI_Output (other, self,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_15_01"); //Я бы хотел немного оглядеться.
	AI_Output (self, other,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_01_02");//Только постарайся не отдавить кому-нибудь любимую мозоль.
};


//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_751_Soeldner_INMINE (C_INFO)
{
	npc				= SLD_751_Soeldner;
	condition		= DIA_SLD_751_Soeldner_INMINE_CONDITION;
	information		= DIA_SLD_751_Soeldner_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Я хочу зайти в шахту.";
};

FUNC int DIA_SLD_751_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_751_Soeldner_INMINE_INFO_15_01"); //Я хочу заглянуть в шахту.
	AI_Output (self, other,"DIA_SLD_751_Soeldner_INMINE_INFO_01_02");//Не думаю, что тебе это удастся, но попробуй поговорить с Окилом.

};




