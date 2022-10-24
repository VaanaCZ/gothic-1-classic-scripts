// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Jesse_Exit (C_INFO)
{
	npc			= Vlk_564_Jesse;
	nr			= 999;
	condition	= DIA_Jesse_Exit_Condition;
	information	= DIA_Jesse_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jesse_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Hi
// **************************************************

INSTANCE DIA_Jesse_Hallo (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Hallo_Condition;
	information		= DIA_Jesse_Hallo_Info;
	permanent		= 0;
	description		= "Как дела?";
};

FUNC INT DIA_Jesse_Hallo_Condition()
{	
	if (!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jesse_Hallo_15_00"); //Как дела?
	AI_Output (self, other,"DIA_Jesse_Hallo_03_01"); //Ты здесь недавно? Запомни сразу: со стражниками лучше не ссорится.
	AI_Output (self, other,"DIA_Jesse_Hallo_03_02"); //Если они потребуют от тебя плату за защиту, лучше им заплатить, иначе половина лагеря будет настроено против тебя.
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Jesse_Warn (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Warn_Condition;
	information		= DIA_Jesse_Warn_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Jesse_Warn_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Bully)) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Warn_Info()
{
	AI_Output (self, other,"DIA_Jesse_Warn_03_00"); //Эй, ты! Ты отказался платить Бладвину за защиту, да?
	AI_Output (other, self,"DIA_Jesse_Warn_15_01"); //Ну и что?
	AI_Output (self, other,"DIA_Jesse_Warn_03_02"); //Я подумал, что лучше предупредить тебя. Он нанял местных головорезов, чтобы отомстить тебе.
	AI_Output (self, other,"DIA_Jesse_Warn_03_03"); //Ну, я слышал его разговор с Хереком. Быть может, он нанял и кого-нибудь еще.
	AI_Output (other, self,"DIA_Jesse_Warn_15_04"); //Твое предупреждение о Хереке немного запоздало.
	AI_Output (self, other,"DIA_Jesse_Warn_03_05"); //Возможно, он подговорил сразу нескольких человек. Будь осторожен.
};

// **************************************************
// 				MISSION Pay 4 Me
// **************************************************
	
// ************************************************************

INSTANCE DIA_Jesse_Mission (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Mission_Condition;
	information		= DIA_Jesse_Mission_Info;
	permanent		= 0;
	description		= "Почему ты рассказал мне о Бладвине?";
};

FUNC INT DIA_Jesse_Mission_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Jesse_Mission))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Mission_Info()
{
	AI_Output (other, self,"DIA_Jesse_Mission_15_00"); //Почему ты рассказал мне о Бладвине?
	AI_Output (self, other,"DIA_Jesse_Mission_03_01"); //Потому что просто так ничего не бывает. Мне показалось, что тебе не нужно будет это объяснять.
	AI_Output (self, other,"DIA_Jesse_Mission_03_02"); //А так как я помог тебе, я дам тебе возможность помочь мне.
	
	Info_ClearChoices	(DIA_Jesse_Mission );
	Info_AddChoice		(DIA_Jesse_Mission,"Я тебе ничего не должен!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice		(DIA_Jesse_Mission,"И что же ты от меня хочешь?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output (other, self,"DIA_Jesse_Mission_ForgetIt_15_00"); //Я тебе ничего не должен!
	AI_Output (self, other,"DIA_Jesse_Mission_ForgetIt_03_01"); // Тогда забудь об этом и убирайся!
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
	AI_StopProcessInfos	(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output (other, self,"DIA_Jesse_Mission_What_15_00"); //И что же ты от меня хочешь?
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_01"); //У меня совсем не осталось руды. Бладвин забрал у меня все до последнего кусочка.
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_02"); //И ему все равно не хватило. Я должен ему 10 кусков. Ты можешь отдать ему руду и сказать, что она от меня.
	Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld
	
	Info_AddChoice		(DIA_Jesse_Mission,"Платить за тебя? Я не стану этого делать!",DIA_Jesse_Mission_NO);
	Info_AddChoice		(DIA_Jesse_Mission,"Я посмотрю, что тут можно сделать...",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
	AI_Output (other, self,"DIA_Jesse_Mission_YES_15_00"); //Я посмотрю, что тут можно сделать...
	AI_Output (self, other,"DIA_Jesse_Mission_YES_03_01"); //Спасибо! Ты спасаешь меня! Скажешь, когда эта проблема будет решена, хорошо?
	Jesse_PayForMe = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Jesse_Mission );
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output (other, self,"DIA_Jesse_Mission_NO_15_00"); //Платить за тебя? Я не стану этого делать!
	AI_Output (self, other,"DIA_Jesse_Mission_NO_03_01"); //Как я так мог ошибиться в тебе. Больше на мою помощь не рассчитывай.
	//MUSS SO - Mike
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
};


// **************************************************
// 					RUNNING / SUCCESS
// **************************************************

INSTANCE DIA_Jesse_MisSuccess (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_MisSuccess_Condition;
	information		= DIA_Jesse_MisSuccess_Info;
	permanent		= 0;
	description		= "Я отдал руду Бладвину!";
};

FUNC INT DIA_Jesse_MisSuccess_Condition()
{	
	if (Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_MisSuccess_Info()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_15_00"); //Я отдал руду Бладвину!
	AI_Output (self, other,"DIA_Jesse_MisSuccess_03_01"); //Да? Отлично! Теперь мы в расчете.
	Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT
	
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
	Info_AddChoice		(DIA_Jesse_MisSuccess,"Что? И ради этого я заплатил десять кусков?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice		(DIA_Jesse_MisSuccess,"Да. Ты мне - я тебе. Как всегда.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //Что? И ради этого я заплатил десять кусков?
	AI_Output (self, other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Кажется, да.
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Да. Ты мне - я тебе. Как всегда.
};

//a) <Herek tot>
//b) Herek wird versuchen, 


/* */
