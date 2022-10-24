// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Jackal_EXIT (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 999;
	condition	= Info_Jackal_EXIT_Condition;
	information	= Info_Jackal_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Jackal_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Jackal_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
	var int Jackal_ProtectionPaid;
	var int Jackal_PayDay;
// ************************************************************

INSTANCE Info_Jackal_Hello (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Hello_Condition;
	information	= Info_Jackal_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_Hello_Condition()
{	
	if (Kapitel <= 2)
	{
		return 1;
	};
};
FUNC VOID Info_Jackal_Hello_Info()
{	
	AI_Output (self, other,"Info_Jackal_Hello_07_00"); //А! Новые лица!
	AI_Output (other, self,"Info_Jackal_Hello_15_01"); //Что тебе от меня нужно?
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //Хочу предложить тебе свою помощь. Ты здесь новенький, а такие часто попадают в неприятности... Я смогу избавить тебя от некоторых из них за небольшое вознаграждение.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //Всего десять кусков руды. Это же совсем немного!
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"А если я откажусь платить тебе?" ,Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"И что будет, после того как я отдам ее тебе?" ,Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"Вот возьми, десять кусков. Твоя помощь может мне пригодиться." ,Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //Вот возьми, свои десять кусков. Твоя помощь может мне пригодиться.
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //Если я буду неподалеку, ты можешь на меня рассчитывать. Ты всегда сможешь найти меня между рынком и южными воротами.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //За порядком в других районах следят Флетчер и Бладвин.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //Эй, только попробуй меня обмануть! Приходи, когда у тебя будет руда!
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //И что будет, после того как я отдам ее тебе?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //Пока ты будешь в моем районе, я буду приглядывать за тобой.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //Если на тебя нападет кто-нибудь из Нового лагеря, или ты поссоришься с каким-нибудь ненормальным из лагеря сектантов, я приду к тебе на помощь.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //Если ты поругаешься с кем-нибудь из рудокопов, мы поможем тому, кто нам платит за защиту.
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //А если заплатят оба?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Тогда мы понаблюдаем за дракой. Но такое зрелище здесь редко увидишь.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //А если я откажусь платить тебе?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //Эй, не стоит наживать себе неприятностей! Ты еще незнаком с нашими порядками. Подзаработай немного руды, и когда будешь готов, все равно заплатишь!
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //Это можно сделать в любое время. Вот только пока ты не заплатишь, не рассчитывай на мою помощь. Это понятно?
	Info_AddChoice		(Info_Jackal_Hello,"Мы еще увидимся." ,Info_Jackal_Hello_Later);
};

func void Info_Jackal_Hello_Later()
{
	AI_Output (other, self,"Info_Jackal_Hello_Later_15_00"); //Мы еще увидимся.
	AI_Output (self, other,"Info_Jackal_Hello_Later_07_01"); //Постарайся не ввязываться в неприятности!
	Jackal_ProtectionPaid = FALSE;
	Npc_SetPermAttitude(self,ATT_NEUTRAL);
	Jackal_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Jackal_Hello);
};

// ************************************************************
// 					DOCH Schutzgeld
// ************************************************************

// Bei JACKAL reicht es, wenn man EINMAL zahlt

INSTANCE Info_Jackal_Schutz (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_Schutz_Condition;
	information	= Info_Jackal_Schutz_Info;
	permanent	= 0;
	description = "Я обдумал твое предложение. Вот тебе десять кусков.";
};                       

FUNC INT Info_Jackal_Schutz_Condition()
{
	if ( (Npc_KnowsInfo(hero,Info_Jackal_Hello)) && (Jackal_ProtectionPaid == FALSE) )
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_Schutz_Info()
{	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //Я обдумал твое предложение. Вот тебе десять кусков.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //Хорошее решение! Теперь я буду тебя защищать!
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //Ты еще не заплатил десять кусков. Приходи, когда у тебя будет руда.
	};
};


// ************************************************************
// 					Perm - wenn gezahlt
// ************************************************************

INSTANCE Info_Jackal_PermPaid (C_INFO)
{
	npc			= GRD_201_Jackal;
	nr			= 3;
	condition	= Info_Jackal_PermPaid_Condition;
	information	= Info_Jackal_PermPaid_Info;
	permanent	= 1;
	description = "Ну, как дела?";
};                       

FUNC INT Info_Jackal_PermPaid_Condition()
{
	if (Jackal_ProtectionPaid == TRUE)
	{
		return 1;
	};
};

FUNC VOID Info_Jackal_PermPaid_Info()
{	
	AI_Output (other, self,"Info_Jackal_PermPaid_15_00"); //Ну, как дела?
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //Ты можешь рассчитывать на мою помощь!
};

/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_201_Jackal_WELCOME (C_INFO)
{
	npc				= GRD_201_Jackal;
	condition		= GRD_201_Jackal_WELCOME_Condition;
	information		= GRD_201_Jackal_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_201_Jackal_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_201_Jackal_WELCOME_Info()
{
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //Ты быстро делаешь успехи в нашем лагере! Так держать!
};


//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info	PAYDAY
//---------------------------------------------------------------------
INSTANCE Info_Jackal_PAYDAY (C_INFO)
{
	npc			= GRD_201_Jackal;
	condition	= Info_Jackal_PAYDAY_Condition;
	information	= Info_Jackal_PAYDAY_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Jackal_PAYDAY_Condition()
{
	if (FMTaken)
	{
		return TRUE;
	};
};

FUNC VOID Info_Jackal_PAYDAY_Info()
{	
	if	C_NpcBelongsToNewCamp(hero)
	{
		if 	(oldHeroGuild == GIL_GRD)
		||	(oldHeroGuild == GIL_KDF)
		||	(oldHeroGuild == GIL_STT)
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //Так, кто тут у нас? Предатель, который перешел в другой лагерь!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //Если бы ты не связался с этими неудачниками, ты бы все еще смог присоединиться к нам!
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //Посмотрите-ка на него! Это же тот тип из Нового лагеря, который постоянно действует нам на нервы!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //Если бы ты в свое время принял правильное решение, ты бы был один из нас - победителей!
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //Так, так, это еще кто? Один из сумасшедших из Болотного лагеря!
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //Ты так долго с ними общался, что сам стал похож на этих безголовых!
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //Теперь та руда, которую ты мне заплатил, тебе не поможет.
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //Тебе стоило отдать мне руду тогда, когда у тебя была такая возможность.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //Ты слишком далеко зашел! Зря ты напал на шахту!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //Но все получилось как нельзя лучше. И тебе уже ничего не удастся изменить. За это я ручаюсь!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //Эй, он не должен уйти от нас живым!
	
	AI_StopProcessInfos	(self);
	
	B_Story_JackalFight	();
};

