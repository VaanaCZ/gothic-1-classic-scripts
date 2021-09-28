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
	AI_Output (self, other,"Info_Jackal_Hello_07_00"); //А! Кто-то новенький!
	AI_Output (other, self,"Info_Jackal_Hello_15_01"); //Что тебе нужно?
	AI_Output (self, other,"Info_Jackal_Hello_07_02"); //Я хочу предложить тебе помощь. Ты здесь новенький, а новички всегда попадают в неприятности... Ты можешь избежать их по очень доступной цене.
	AI_Output (self, other,"Info_Jackal_Hello_07_03"); //Всего десять кусков руды, парень! Здесь даже говорить не о чем.
	
	Info_ClearChoices	(Info_Jackal_Hello);
	Info_AddChoice		(Info_Jackal_Hello,"А что если я откажусь платить?",Info_Jackal_Hello_WhatIf);
	Info_AddChoice		(Info_Jackal_Hello,"И что я получу за нее?",Info_Jackal_Hello_WhatDoIGet);
	Info_AddChoice		(Info_Jackal_Hello,"Вот десять кусков. И ты должен будешь помочь мне.",Info_Jackal_Hello_Pay);
};

func void Info_Jackal_Hello_Pay()
{
	AI_Output (other, self,"Info_Jackal_Hello_Pay_15_00"); //Вот десять кусков. И ты должен будешь помочь мне, если у меня возникнут проблемы.
	
	if (Npc_HasItems(other,itminugget)>=10)
	{
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_01"); //Если я буду поблизости, можешь на меня рассчитывать. Меня всегда можно найти между рынком и южными воротами.
		AI_Output (self, other,"Info_Jackal_Hello_Pay_07_02"); //Другие места охраняют Флетчер и Бладвин.
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_NoOre_07_00"); //Эй, кого ты пытаешься обмануть?! Возвращайся, когда у тебя будет руда!
	};

	Info_ClearChoices	(Info_Jackal_Hello);
};

func void Info_Jackal_Hello_WhatDoIGet()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_00"); //И что я получу за нее?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_01"); //Пока ты находишься на моей территории, я буду защищать тебя.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_02"); //Если у тебя возникнут проблемы с кем-нибудь из Нового Лагеря или болотные придурки начнут действовать тебе на нервы, можешь на меня рассчитывать.
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_03"); //Если поссоришься с кем-нибудь из рудокопов, мы встанем на сторону того, кто заплатит - видишь, как все просто.
	AI_Output (other, self,"Info_Jackal_Hello_WhatDoIGet_15_04"); //А если мы оба заплатим?
	AI_Output (self, other,"Info_Jackal_Hello_WhatDoIGet_07_05"); //Тогда мы просто будем сидеть и смотреть. Но такое редко случается.
};

func void Info_Jackal_Hello_WhatIf()
{
	AI_Output (other, self,"Info_Jackal_Hello_WhatIf_15_00"); //А что если я откажусь платить?
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_01"); //Эй, парень, не напрягайся так! Ты здесь еще новичок, тебе многое предстоит узнать. Я не хочу на тебя давить - подкопи руды, заплатишь, когда будешь готов.
	AI_Output (self, other,"Info_Jackal_Hello_WhatIf_07_02"); //Ты можешь сделать это когда угодно, но пойми и меня - не стоит рассчитывать на мою помощь до тех пор, пока ты не поможешь мне справиться с текущими расходами.
	Info_AddChoice		(Info_Jackal_Hello,"Еще увидимся.",Info_Jackal_Hello_Later);
};

func void Info_Jackal_Hello_Later()
{
	AI_Output (other, self,"Info_Jackal_Hello_Later_15_00"); //Еще увидимся.
	AI_Output (self, other,"Info_Jackal_Hello_Later_07_01"); //Ты только береги себя!
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
	description = "Я тут подумал о твоем предложении - вот десять кусков руды.";
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
		AI_Output (other, self,"Info_Jackal_Schutz_15_00"); //Я тут подумал о твоем предложении - вот десять кусков руды.
		AI_Output (self, other,"Info_Jackal_Schutz_07_01"); //Ты сделал правильный выбор, парень! С этого момента я буду тебя защищать!
		Jackal_ProtectionPaid = TRUE;
		Npc_SetPermAttitude(self,ATT_FRIENDLY);
		Jackal_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Jackal_Schutz_07_02"); //Я что-то не вижу руды, парень. Возвращайся, когда у тебя будет чем заплатить.
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
	description = "Как дела?";
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
	AI_Output (other, self,"Info_Jackal_PermPaid_15_00"); //Ну и как идут дела?
	AI_Output (self, other,"Info_Jackal_PermPaid_07_01"); //Ты всегда можешь рассчитывать на меня, малыш!
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
	AI_Output (self, other,"GRD_201_Jackal_WELCOME_Info_07_01"); //Я гляжу, ты быстро освоился здесь! Так держать, парень!
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
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_01"); //Эй, ты только посмотри! Это один из тех предателей, что перешли в другой Лагерь!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_02"); //Тебе не стоило связываться с этими неудачниками - тогда бы ты до сих пор мог быть одним из нас!
		}
		else
		{
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_03"); //Эй, ты только посмотри! Это тот самый тип из Нового Лагеря, из-за которого и разгорелся весь сыр-бор!
			AI_Output		(self, other,"Info_Jackal_PAYDAY_07_04"); //Если бы тогда ты хоть немного пошевелил мозгами, сейчас бы ты был на нашей стороне - на стороне победителей!
		};
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_05"); //Нет, ты только погляди на это. Это парень из Болотного Лагеря.
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_06"); //Ты общался с этими придурками так долго, что и у тебя явно съехала крыша!
	};
	
	if 	Jackal_ProtectionPaid
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_07"); //Даже та руда, которую ты заплатил мне за защиту, теперь тебе не поможет.
	}
	else
	{
		AI_Output		(self, other,"Info_Jackal_PAYDAY_07_08"); //Тебе стоило заплатить мне, пока у тебя еще была такая возможность.
	};
			
	AI_Output			(other, self,"Info_Jackal_PAYDAY_15_09"); //Ты зарвался! Тебе не стоило нападать на меня!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_10"); //И тем не менее, все получилось как нельзя лучше. Этого тебе уже не изменить, поверь!
	AI_Output			(self, other,"Info_Jackal_PAYDAY_07_11"); //ЭЙ, ПАРНИ! ВЗЯТЬ ЕГО!!!
	
	AI_StopProcessInfos	(self);
	
	B_Story_JackalFight	();
};

