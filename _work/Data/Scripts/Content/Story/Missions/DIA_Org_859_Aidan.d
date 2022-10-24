// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Aidan_Exit (C_INFO)
{
	npc			= ORG_859_Aidan;
	nr			= 999;
	condition	= DIA_Aidan_Exit_Condition;
	information	= DIA_Aidan_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Aidan_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Aidan_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ****************************************
// 				Hallo
// ****************************************

instance DIA_Aidan_Hello (C_INFO)
{
	npc				= Org_859_Aidan;
	nr				= 1;
	condition		= DIA_Aidan_Hello_Condition;
	information		= DIA_Aidan_Hello_Info;
	permanent		= 0;
	description		= "Что ты здесь делаешь?";
};

FUNC int  DIA_Aidan_Hello_Condition()
{	
	return 1;
};

func void  DIA_Aidan_Hello_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Что ты здесь делаешь?
	AI_Output (self, other,"DIA_Aidan_Hello_13_01"); //Я охотник. Добываю шкуры и клыки, тем и живу.
	AI_Output (other, self,"DIA_Aidan_Hello_15_02"); //За них хорошо платят?
	AI_Output (self, other,"DIA_Aidan_Hello_13_03"); //Да, можно неплохо зарабатывать, если знать, как разделывать добычу.

	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,	"Айдан, охотник, живущий между Старым и Новым лагерями, может научить меня разделывать добычу.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_859_Aidan_Creatures (C_INFO)
{
	npc			= Org_859_Aidan;
	nr			= 1;
	condition	= Org_859_Aidan_Creatures_Condition;
	information	= Org_859_Aidan_Creatures_Info;
	permanent	= 1;
	description = "Я хочу научиться правильно разделывать добычу.";
};                       

FUNC int  Org_859_Aidan_Creatures_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Aidan_Hello))
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_859_Aidan_Creatures_Info()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_15_00"); //Я хочу научиться правильно разделывать добычу.
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_13_01"); //А чему ты хочешь научиться?
		
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice   (Org_859_Aidan_Creatures, DIALOG_BACK 											,Org_859_Aidan_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_859_Aidan_Creatures, "Добыча клыков (Цена: 1 очко обучения, 50 кусков руды)" 		,Org_859_Aidan_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures, "Добыча шкур (Цена: 1 очко обучения, 100 кусков руды)"			,Org_859_Aidan_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures, "Добыча когтей (Цена: 1 очко обучения, 50 кусков руды)" 		,Org_859_Aidan_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures, "Добыча шкур рептилий (Цена: 1 очко обучения, 100 кусков руды)"	,Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //Я научил тебя всему, что знал сам.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Zahn_15_00"); //Как добывать клыки?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Навык: добыча клыков", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_01"); //Ты должен следить за тем, чтобы клыки не сломались. Чтобы этого избежать, используй очень острый нож.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_02"); //Лучше всего продаются клыки волков, глорхов и мракорисов.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Навык добычи клыков: волк, орочья собака, глорх, жерх, пес-кровосос, мракорис.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Ты должен получить больше опыта, прежде чем чему-то учиться у меня.
			PrintScreen	("Недостаточно очков обучения!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Сначала заплати мне. Как говорится, всему своя цена.
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Fell_15_00"); //Как снимать шкуры?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Навык: добыча шкур", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_01"); //Важно знать, что начинать разделывать тушу следует с головы. Шкуры здесь высоко ценятся, поэтому главное не повредить их при снятии.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_02"); //Из шкур волков и мракорисов шьют хорошую одежду. С практикой к тебе придет умение распознавать, годится та или иная шкура на одежду или нет.
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Навык добычи шкур: волк, орочья собака, мракорис, тролль.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Ты должен получить больше опыта, прежде чем чему-то учиться у меня.
			PrintScreen	("Недостаточно очков обучения!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Сначала заплати мне. Как говорится, всему своя цена.
	};
};

func void Org_859_Aidan_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Навык: добыча когтей", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Научи меня добывать когти.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_01"); //Это проще, чем кажется на первый взгляд. Нужно отогнуть коготь вперед, но при этом не пытаться его выдернуть и не отгибать назад.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Конечно, пригодные когти можно добыть не у всякого зверя. Обычно в дело идут когти ящериц.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Навык добычи когтей: ящерица, глорх, шныг, жерх, штек.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Ты должен получить больше опыта, прежде чем чему-то учиться у меня.
			PrintScreen	("Недостаточно очков обучения!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Сначала заплати мне. Как говорится, всему своя цена.
	};
};

func void Org_859_Aidan_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Навык: добыча шкур рептилий", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_859_Aidan_Creatures_Haut_15_00"); //Что мне нужно знать, чтобы добывать шкуры рептилий?
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_01"); //Для этого подходят не всякие рептилии, а лишь шныги и болотожоры.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_02"); //Если ты подрежешь шкуру по краям, то ты сможешь легко ее снять. Теперь ты сможешь легко справляться с этой задачей.
				
			Knows_GetHide = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Навык добычи шкур рептилий: шныг, болотожор.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Ты должен получить больше опыта, прежде чем чему-то учиться у меня.
			PrintScreen	("Недостаточно очков обучения!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Сначала заплати мне. Как говорится, всему своя цена.
	};
};
