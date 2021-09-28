
// **************************************************
//						 EXIT 
// **************************************************

instance  Org_819_Drax_Exit (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 999;
	condition	= Org_819_Drax_Exit_Condition;
	information	= Org_819_Drax_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_819_Drax_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					 Ihr jagt hier...
// **************************************************

instance  Org_819_Drax_HuntHere (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_HuntHere_Condition;
	information	= Org_819_Drax_HuntHere_Info;
	permanent	= 0;
	description = "Ты ведь охотник, так?";
};                       

FUNC int  Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_HuntHere_Info()
{
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_00"); //Ты ведь охотник, так?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_01"); //Похоже на то... а что тебе нужно?
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //Мне очень пригодилась бы пара советов.
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //Я могу научить тебя нескольким хитростям - но все здесь имеет свою цену.
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_04"); //И сколько же это будет стоить?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_05"); //Для начала - один добрый глоток пива. А там посмотрим.
};

// **************************************************
//				Scavenger jagen + Bier
// **************************************************
	var int drax_bierbekommen;
	var int drax_Lehrer_frei;
// **************************************************

instance  Org_819_Drax_Scavenger (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Scavenger_Condition;
	information	= Org_819_Drax_Scavenger_Info;
	permanent	= 1;
	description = "Вот, пей пиво и расскажи мне об охоте.";
};                       

FUNC int  Org_819_Drax_Scavenger_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_819_Drax_HuntHere) && (drax_bierbekommen==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Scavenger_Info()
{
	if (Npc_HasItems(other,itfobeer)>0)
	{
		B_GiveInvItems	(other, self, itfobeer,1);
	
		AI_Output	(other, self,"Org_819_Drax_Scavenger_15_00"); //Вот, пей пиво и расскажи мне об охоте.
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem	(self,	ItFobeer);
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_01"); //Падальщиками мы называем этих больших птиц. Атаковать их нужно поодиночке. Довольно легко выманить одного падальщика из стаи.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_02"); //Когда ты подойдешь поближе, птица сперва забеспокоится, а затем помчится на тебя. Ты должен уже ждать ее с оружием в руках.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_03"); //Если тебе удастся нанести удар, прежде чем тварь укусит тебя, не останавливайся, продолжай драться - и ты одержишь победу, не получив ни единой царапины.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_04"); //Если же ОНА ударит тебя первой... ну, не стоит до этого доводить.
		drax_bierbekommen = TRUE;
	}
	else
	{
		AI_Output (other, self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //У меня больше нет пива.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //Ну так сходи, раздобудь еще. Это лучший бесплатный совет из тех, что ты получишь в ближайшее время. И по дороге прихвати немного руды!
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //Я могу еще много чего порассказать о местных тварях, но не задаром же!
	};	
	drax_Lehrer_frei = TRUE;
	
	Log_CreateTopic	(GE_TeacherOW, LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Вор Дракс сказал, что  за определенную цену может научить меня потрошить животных. Он охотится в районе от торговой площади до Старого Лагеря.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_819_Drax_Creatures (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Creatures_Condition;
	information	= Org_819_Drax_Creatures_Info;
	permanent	= 1;
	description = "Можешь ли ты рассказать мне еще об охоте?";
};                       

FUNC int  Org_819_Drax_Creatures_Condition()
{
	if ( Drax_Lehrer_frei == TRUE )
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Creatures_Info()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_15_00"); //Можешь ли ты рассказать мне еще об охоте?
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_06_01"); //Могу - но пивом ты тут уже не отделаешься.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //Если знаешь как, то с убитой твари можно снять шкуру, забрать клыки и когти. Это не так-то просто, но подобные трофеи высоко ценятся.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //Любой торговец с радостью купит их у тебя.
		
		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice   (Org_819_Drax_Creatures, DIALOG_BACK 													,Org_819_Drax_Creatures_BACK);
		Info_AddChoice   (Org_819_Drax_Creatures,"Твои советы стоят недешево.",Org_819_Drax_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_819_Drax_Creatures,"Добывать клыки (1 ед. обучения, 50 кусков руды)",Org_819_Drax_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Добывать мех (1 ед. обучения, 100 кусков руды)",Org_819_Drax_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Добывать когти (1 ед. обучения, 50 кусков руды)",Org_819_Drax_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Добывать кожу (1 ед. обучения, 100 кусков руды)",Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //Ну вот, я рассказал все, что знал.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //Твои советы стоят недешево.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //Но с их помощью ты заработаешь немало руды.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //Туша зверя, которую ты не умеешь разделывать, просто сгниет без пользы.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //А ты потеряешь возможность задорого продать его шкуру. Выходит, ты рисковал зря.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //На твоем месте я постарался бы научиться всему как можно быстрее.
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Zahn_15_00"); //Как добываются клыки?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Изучить: Вырезание зубов", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_01"); //Главное - не сломать их. Поставь нож примерно на середину зуба, у самого основания и, как рычагом, выковырни его.
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_02"); //Клыки есть у волков, глорхов и мракорисов.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Знание о вырезании зубов у волков, орочьих гончих, глорхов, мракорисов, кусачей и ищеек.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //Тебе нужно набраться опыта, иначе мой совет окажется бесполезным для тебя.
			PrintScreen	("Недостаточно очков обучения!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //Прежде покажи руду. Как я уже говорил, все здесь имеет свою цену.
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Fell_15_00"); //Как снять шкуру?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			
			PrintScreen	("Изучить: Снятие шкуры", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_01"); //Начинать следует с задней части туши, двигаясь к голове. Главное - подцепить ее, дальше все будет легко. Мех стоит очень дорого.
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_02"); //Одежду делают из шкуры волка или мракориса. Присмотревшись к меху, ты поймешь, годится он на что-нибудь или нет. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Знание о том, как снять шкуру с волка, орочей гончей, мракориса, тролля.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //У тебя не хватит опыта, чтобы воспользоваться моим советом.
			PrintScreen	("Недостаточно очков обучения!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //Прежде покажи руду. Как я уже говорил, все здесь имеет свою цену.
	};
};

func void Org_819_Drax_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Изучить: Вырезание когтей", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_819_Drax_Creatures_Kralle_15_00"); //Как добываются когти?
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_01"); //На самом деле это очень просто - если ты знаешь, что и как делать. Нужно просто отогнуть коготь вперед - только не назад, и НЕ ПЫТАЙСЯ его выдергивать!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_02"); //Разумеется, в дело идут далеко не все когти. Чаще всего мы добываем их у ящериц.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Знание о том, как вырезать когти у ящериц, глорхов, шныг, кусачей и остеров.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //Сперва наберись опыта, иначе мой совет тебе не пригодится.
			PrintScreen	("Недостаточно очков обучения!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //Прежде покажи руду. Как я уже говорил, все здесь имеет свою цену.
	};
};

func void Org_819_Drax_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Изучить: Снятие кожи", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_819_Drax_Creatures_Haut_15_00"); //А если я захочу снять шкуру с рептилии?
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_01"); //Для этой цели подходят разве что шныги да болотожоры.
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_02"); //Нужно подрезать шкуру по краям, и дальше она слезет сама. Вот и вся наука.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Знание о снятии кожи с болотожоров, шныг.");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //Сперва наберись опыта, иначе мой совет тебе не пригодится.
			PrintScreen	("Недостаточно очков обучения!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //Прежде покажи руду. Как я уже говорил, все здесь имеет свою цену.
	};
};
