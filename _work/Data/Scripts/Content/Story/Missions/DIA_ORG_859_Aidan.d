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
	description		= "Чем ты занимаешься?";
};

FUNC int  DIA_Aidan_Hello_Condition()
{	
	return 1;
};

func void  DIA_Aidan_Hello_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Чем ты занимаешься?
	AI_Output (self, other,"DIA_Aidan_Hello_13_01"); //Я охотник. Живу тем, что продаю клыки да шкуры.
	AI_Output (other, self,"DIA_Aidan_Hello_15_02"); //За это хорошо платят?
	AI_Output (self, other,"DIA_Aidan_Hello_13_03"); //Если все делаешь правильно, можно сорвать неплохой куш. Главное - научиться разделывать добычу.

	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Эйдан, охотник, живущий между Старым и Новым Лагерями, может научить меня тому, как надо потрошить животных.");
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
	description = "Я хочу научиться разделывать добычу.";
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
	AI_Output (other, self,"Org_859_Aidan_Creatures_15_00"); //Я хочу научиться разделывать добычу.
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_13_01"); //Что ты хочешь узнать?
		
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice   (Org_859_Aidan_Creatures, DIALOG_BACK 											,Org_859_Aidan_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_859_Aidan_Creatures,"Добывать клыки (1 ед. обучения, 50 кусков руды)",Org_859_Aidan_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Добывать мех (1 ед. обучения, 100 кусков руды)",Org_859_Aidan_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Добывать когти (1 ед. обучения, 50 кусков руды)",Org_859_Aidan_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Добывать кожу (1 ед. обучения, 100 кусков руды)",Org_859_Aidan_Creatures_Haut);
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
	AI_Output (other, self,"Org_859_Aidan_Creatures_Zahn_15_00"); //Как добываются клыки?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Изучить: Вырезание зубов", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_01"); //Главное - не сломать их. Поставь нож примерно на середину зуба и осторожно вытащи его.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_02"); //Клыки есть у волков, глорхов и мракорисов.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Знание об вырезании зубов у волков, орочьих гончих, глорхов, мракорисов, ищеек и кусачей.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Сперва наберись опыта, иначе мой совет тебе не пригодится.
			PrintScreen	("Недостаточно очков обучения!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Прежде покажи руду. Как я уже говорил, все здесь имеет свою цену.
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Fell_15_00"); //Как снять шкуру?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Изучить: Снятие шкуры", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_01"); //Начинать следует с задней части туши, двигаясь к голове. Главное - подцепить ее, дальше все будет легко. Мех стоит очень дорого.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_02"); //Одежду делают из шкуры волка или мракориса. Присмотревшись к меху, ты поймешь, годится он на что-нибудь или нет. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Знание о том, как снять шкуру с волка, орочей гончей, мракориса, тролля.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Сперва наберись опыта, иначе мой совет тебе не пригодится.
			PrintScreen	("Недостаточно очков обучения!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Прежде покажи руду. Как я уже говорил, все здесь имеет свою цену.
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
			
			PrintScreen	("Изучить: Вырезание когтей", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Покажи мне, как добываются когти.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_01"); //На самом деле это очень просто - если ты знаешь, что и как делать. Нужно просто отогнуть коготь вперед - только не назад, и НЕ ПЫТАЙСЯ его выдергивать!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Разумеется, в дело идут далеко не все когти. Чаще всего мы добываем их у ящериц.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Знание о том, как вырезать когти у ящериц, глорхов, шныг, кусачей и остеров.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Сперва наберись опыта, иначе мой совет тебе не пригодится.
			PrintScreen	("Недостаточно очков обучения!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Прежде покажи руду. Как я уже говорил, все здесь имеет свою цену.
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
			
			PrintScreen	("Изучить: Снятие кожи", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_859_Aidan_Creatures_Haut_15_00"); //А если я захочу снять шкуру с рептилии?
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_01"); //Для этого подходят разве что шныги да болотожоры.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_02"); //Нужно подрезать шкуру по краям, и дальше она слезет сама. Вот и вся наука.
				
			Knows_GetHide = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Знание о снятии кожи с болотожоров, шныг.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Сперва наберись опыта, иначе мой совет тебе не пригодится.
			PrintScreen	("Недостаточно очков обучения!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Прежде покажи руду. Как я уже говорил, все здесь имеет свою цену.
	};
};
