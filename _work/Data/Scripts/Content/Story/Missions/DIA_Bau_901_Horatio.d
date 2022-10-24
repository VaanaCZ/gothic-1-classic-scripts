// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Horatio_EXIT (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 999;
	condition	= DIA_Horatio_EXIT_Condition;
	information	= DIA_Horatio_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Horatio_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Horatio_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 			  				   Wasser
// ************************************************************

INSTANCE Info_Horatio_Wasser(C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 800;
	condition	= Info_Horatio_Wasser_Condition;
	information	= Info_Horatio_Wasser_Info;
	permanent	= 1;
	description = "Меня Лефти послал. Я принес воды.";
};                       

FUNC INT Info_Horatio_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Horatio_Wasser_Info()
{
	AI_Output(other,self,"Info_Horatio_Wasser_15_00"); //Меня послал Лефти. Я принес тебе воды.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Horatio_Wasser_09_01"); //Спасибо, парень. А то я уже был готов пить хоть из лужи.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Horatio_Wasser_NOWATER_09_00"); //У тебя же ничего нет. Ладно, может у других есть.
	};
};

// ************************************************************
// 						Hallo
// ************************************************************
	var int horatio_trouble;
// ************************************************************

INSTANCE DIA_Horatio_Hello (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_Hello_Condition;
	information	= DIA_Horatio_Hello_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC INT DIA_Horatio_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Horatio_Hello_Info()
{	
	AI_GotoNpc	(self, hero);

	AI_Output (self, other,"DIA_Horatio_Hello_09_00"); //Что тебе здесь надо? Хочешь проблем?
	
	Info_ClearChoices(DIA_Horatio_Hello );
	Info_AddChoice	 (DIA_Horatio_Hello, "Проблемы? С крестьянином что ли?",DIA_Horatio_Hello_PissOff);
	Info_AddChoice	 (DIA_Horatio_Hello, "Эй, успокойся! Я новенький."	,DIA_Horatio_Hello_BeCool);
};

func void DIA_Horatio_Hello_BeCool()
{
	AI_Output (other, self,"DIA_Horatio_Hello_BeCool_15_00"); //Эй, успокойся! Я новенький.
	AI_Output (self, other,"DIA_Horatio_Hello_BeCool_09_01"); //А-а... ну, тогда ладно. Сам понимаешь, тут такая толпа людей, и каждый думает, что он самый крутой.
	Info_ClearChoices(DIA_Horatio_Hello );
};

func void DIA_Horatio_Hello_PissOff()
{
	AI_Output (other, self,"DIA_Horatio_Hello_PissOff_15_00"); //Проблемы? С крестьянином что ли?
	AI_Output (self, other,"DIA_Horatio_Hello_PissOff_09_01"); //Парень, если я работаю в поле, это не значит, что я не могу постоять за себя.
	AI_Output (self, other,"DIA_Horatio_Hello_PissOff_09_02"); //Нужны неприятности? Тогда давай, вперед!
	horatio_trouble = TRUE;
	
	Info_ClearChoices(DIA_Horatio_Hello);
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						SORRY (PERM)
// ************************************************************

INSTANCE DIA_Horatio_SORRY (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_SORRY_Condition;
	information	= DIA_Horatio_SORRY_Info;
	permanent	= 1;
	description = "Прости, я не собирался тебя обижать.";
};                       

FUNC INT DIA_Horatio_SORRY_Condition()
{
	if (horatio_trouble == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_SORRY_Info()
{	
	AI_Output (other, self,"DIA_Horatio_SORRY_15_00"); //Прости, я не собирался тебя обижать.
	AI_Output (self, other,"DIA_Horatio_SORRY_09_01"); //Надо было раньше подумать об этом!
};

// ************************************************************
// 					Horatios Story
// ************************************************************

INSTANCE DIA_Horatio_Story (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_Story_Condition;
	information	= DIA_Horatio_Story_Info;
	permanent	= 0;
	description = "Что такой человек, как ты делает среди крестьян?";
};                       

FUNC INT DIA_Horatio_Story_Condition()
{
	if ( (horatio_trouble==FALSE) && (Npc_KnowsInfo(hero,DIA_Horatio_Hello)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_Story_Info()
{	
	AI_Output (other, self,"DIA_Horatio_Story_15_00"); //Что такой человек, как ты делает среди крестьян?
	AI_Output (self, other,"DIA_Horatio_Story_09_01"); //Ли мне предложил. Я уже больше не дерусь, разве только для самозащиты.
	AI_Output (self, other,"DIA_Horatio_Story_09_02"); //Я убил одного парня, а это уже серьезно. В общем меня вышвырнули в эту Богом забытую колонию справедливо, правда.
	AI_Output (other, self,"DIA_Horatio_Story_15_03"); //Как это тебя угораздило?
	AI_Output (self, other,"DIA_Horatio_Story_09_04"); //Да в кабаке подрался. Я не хотел убивать того парня. Просто сильно его ударил.
	AI_Output (self, other,"DIA_Horatio_Story_09_05"); //Я был кузнецом в то время и не очень осознавал свою силу...
};

// ************************************************************
// 						Warum hier?
// ************************************************************

INSTANCE DIA_Horatio_WhyHere (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 1;
	condition	= DIA_Horatio_WhyHere_Condition;
	information	= DIA_Horatio_WhyHere_Info;
	permanent	= 0;
	description = "Почему ты пришел именно в этот лагерь?";
};                       

FUNC INT DIA_Horatio_WhyHere_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_WhyHere_Info()
{	
	AI_Output (other, self,"DIA_Horatio_WhyHere_15_00"); //Почему ты пришел именно в этот лагерь?
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_01"); //Что я тебе скажу: я мог бы присоединиться к сектантам, но не хотел, чтобы эти Гуру промывали мне мозги.
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_02"); //В Старом лагере у меня были проблемы со стражниками, а вот воры и наемники были более приветливы ко мне.
	AI_Output (other, self,"DIA_Horatio_WhyHere_15_03"); //Они боятся тебя...
	AI_Output (self, other,"DIA_Horatio_WhyHere_09_04"); //Может и так. В любом случае здесь меня оставили в покое. Может, и тебе попробовать стоит.
};

// ************************************************************
// 						Bitte STR
// ************************************************************
	var int horatio_StrFree;
// ************************************************************

INSTANCE DIA_Horatio_PleaseTeachSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_PleaseTeachSTR_Condition;
	information	= DIA_Horatio_PleaseTeachSTR_Info;
	permanent	= 0;
	description = "Я бы хотел быть сильным, таким как ты. Можешь научить?";
};                       

FUNC INT DIA_Horatio_PleaseTeachSTR_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_Story))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_PleaseTeachSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_15_00"); //Я бы хотел быть сильным, как ты. Можешь научить?
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_09_01"); //Может, и могу. Вот только зачем тебе нужна сила?
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if	Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
		Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR, "Хочу уничтожить Лорда и его головорезов!",DIA_Horatio_PleaseTeachSTR_Ricelord);
	}
	else
	{
		Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR, "Хороший вопрос. Я подумаю об этом...",DIA_Horatio_PleaseTeachSTR_BACK);
	};
	Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR, "Просто для самозащиты.",DIA_Horatio_PleaseTeachSTR_Defend);
	Info_AddChoice	 (DIA_Horatio_PleaseTeachSTR, "Хочу поставить на место всех этих уродов!",DIA_Horatio_PleaseTeachSTR_Attack);

	Log_CreateTopic		(CH1_HoratiosTeachings,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_HoratiosTeachings, LOG_RUNNING);
	B_LogEntry			(CH1_HoratiosTeachings,	"Горацио, крестьянин, который работает на рисовых полях в Новом лагере, может помочь мне стать сильнее. Но я должен сказать ему, зачем мне это нужно.");
};

func void DIA_Horatio_PleaseTeachSTR_Attack()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Attack_15_00"); //Хочу поставить на место всех этих уродов!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Attack_09_01"); //Да, но, сделав это, ты сам станешь одним из них. Так что... я тебя учить не буду.
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

func void DIA_Horatio_PleaseTeachSTR_Defend()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Defend_15_00"); //Просто для самозащиты.
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Defend_09_01"); //Чтобы остаться в живых лучше иметь быстрые ноги, чем силу. Или ты думаешь выбивать челюсти лучше, чем жить спокойно?
};

func void DIA_Horatio_PleaseTeachSTR_BACK()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_BACK_15_00"); //Хороший вопрос. Я подумаю об этом...
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

func void DIA_Horatio_PleaseTeachSTR_Ricelord()
{
	AI_Output (other, self,"DIA_Horatio_PleaseTeachSTR_Ricelord_15_00"); //Хочу уничтожить Лорда и его головорезов!
	AI_Output (self, other,"DIA_Horatio_PleaseTeachSTR_Ricelord_09_01"); //Хм... Ты не первый, кто этого хотел.
	horatio_StrFree = TRUE;
	Info_ClearChoices(DIA_Horatio_PleaseTeachSTR );
};

// ************************************************************
// 						Nachgedacht (STR)
// ************************************************************

INSTANCE DIA_Horatio_ThoughtSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_ThoughtSTR_Condition;
	information	= DIA_Horatio_ThoughtSTR_Info;
	permanent	= 1;
	description = "Я уже много думал об этом...";
};                       

FUNC INT DIA_Horatio_ThoughtSTR_Condition()
{
	if ( Npc_KnowsInfo(hero,DIA_Horatio_PleaseTeachSTR) && (horatio_StrFree == FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_ThoughtSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_15_00"); //Я уже много думал об этом...
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_09_01"); //И? Придумал что-нибудь получше?
	
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
	Info_AddChoice	 (DIA_Horatio_ThoughtSTR, "Нет.",DIA_Horatio_ThoughtSTR_NoIdea);
	
	var C_NPC ricelord; ricelord = Hlp_GetNpc(Bau_900_Ricelord);
	if	Npc_KnowsInfo(hero,DIA_Jeremiah_Horatio)
	{
		Info_AddChoice	 (DIA_Horatio_ThoughtSTR, "Да. Я просто обязан избавиться от Лорда и его головорезов!",DIA_Horatio_ThoughtSTR_Ricelord);
	};
};

func void DIA_Horatio_ThoughtSTR_NoIdea()
{
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_NoIdea_15_00"); //Нет.
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_NoIdea_09_01"); //Вот и я тоже.
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
};

func void DIA_Horatio_ThoughtSTR_Ricelord()
{
	AI_Output (other, self,"DIA_Horatio_ThoughtSTR_Ricelord_15_00"); //Да. Я просто обязан избавиться от Лорда и его головорезов!
	AI_Output (self, other,"DIA_Horatio_ThoughtSTR_Ricelord_09_01"); //Хм... Ты будешь далеко не первым из тех, кто пытался сделать это.
	horatio_StrFree = TRUE;
	
	Info_ClearChoices(DIA_Horatio_ThoughtSTR );
};

// ************************************************************
//					Will Ricelord kцpfen
// ************************************************************

func void DIA_Horatio_HelpSTR_LEARN_NOW()
{
	if (other.attribute[ATR_STRENGTH]<=(100-5))
	{
		other.attribute[ATR_STRENGTH] = other.attribute[ATR_STRENGTH] + 5;
		PrintScreen	("Сила + 5", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	}
	else
	{
		other.attribute[ATR_STRENGTH] = 100; 
		PrintScreen	("Сила: 100", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
	};
				
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_00"); //Если хочешь иметь сильный удар, ты должен знать основные принципы, как это делается. Это первое, что должен знать кузнец.
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_01"); //Старайся наносить удар всей рукой, от плеча до запястья.
	AI_Output (self, other,"DIA_Horatio_HelpSTR_LEARN_NOW_09_02"); //Чем лучше у тебя это получится, тем сильнее удар. Я думаю, научиться этому тебе будет не так уж сложно.
};

//--------------------------------------------------------------

INSTANCE DIA_Horatio_HelpSTR (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_HelpSTR_Condition;
	information	= DIA_Horatio_HelpSTR_Info;
	permanent	= 0;
	description = "Я избавлюсь от Лорда и его головорезов... не без твоей помощи!";
};                       

FUNC INT DIA_Horatio_HelpSTR_Condition()
{
	if (horatio_StrFree == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_HelpSTR_Info()
{	
	AI_Output (other, self,"DIA_Horatio_HelpSTR_15_00"); //Я избавлюсь от Лорда и его головорезов, конечно, не без твоей помощи!
	AI_Output (self, other,"DIA_Horatio_HelpSTR_09_01"); //Ладно! Я дал клятву, что больше никогда не буду бить человека, но это не значит, что я не могу другого научить этому.
	AI_Output (other, self,"DIA_Horatio_HelpSTR_15_02"); //Слушаю тебя!
	DIA_Horatio_HelpSTR_LEARN_NOW();

	Log_SetTopicStatus	(CH1_HoratiosTeachings, LOG_SUCCESS);
	B_LogEntry			(CH1_HoratiosTeachings,	"Горацио помог мне стать сильнее. Хорошо, что есть такие люди как он.");
};

// ************************************************************
// 							Thanks (PERM)
// ************************************************************

INSTANCE DIA_Horatio_Thanks (C_INFO)
{
	npc			= Bau_901_Horatio;
	nr			= 2;
	condition	= DIA_Horatio_Thanks_Condition;
	information	= DIA_Horatio_Thanks_Info;
	permanent	= 1;
	description = "Спасибо, что помог!";
};                       

FUNC INT DIA_Horatio_Thanks_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Horatio_HelpSTR))
	{
		return 1;
	};
};

FUNC VOID DIA_Horatio_Thanks_Info()
{	
	AI_Output (other, self,"DIA_Horatio_Thanks_15_00"); //Спасибо, что помог!
	AI_Output (self, other,"DIA_Horatio_Thanks_09_01"); //Используй свою силу только в крайних случаях и никак больше.
};



