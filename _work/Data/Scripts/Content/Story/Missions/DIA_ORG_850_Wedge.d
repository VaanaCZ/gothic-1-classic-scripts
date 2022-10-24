// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Wedge_Exit (C_INFO)
{
	npc			= ORG_850_Wedge;
	nr			= 999;
	condition	= DIA_Wedge_Exit_Condition;
	information	= DIA_Wedge_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Wedge_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wedge_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ****************************************
// 					Psst
// ****************************************

instance DIA_Wedge_Psst (C_INFO)
{
	npc				= Org_850_Wedge;
	nr				= 1;
	condition		= DIA_Wedge_Psst_Condition;
	information		= DIA_Wedge_Psst_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_Wedge_Psst_Condition()
{	
	if ( (Npc_GetDistToNpc (hero,self) < 900) && (Wld_IsTime(08,00,23,30)) )
	{
		return TRUE;
	};
};
func void  DIA_Wedge_Psst_Info()
{
	AI_Output (self, other,"DIA_Wedge_Psst_05_00"); //Эй, ты!
	AI_Output (other, self,"DIA_Wedge_Psst_15_01"); //Кто?.. Я?
	AI_Output (self, other,"DIA_Wedge_Psst_05_02"); //Да, да, ты... Подойди-ка сюда!
	AI_StopProcessInfos	(self);
};

// ****************************************
// 					Hallo
// ****************************************

instance  DIA_Wedge_Hello (C_INFO)
{
	npc				= Org_850_Wedge;
	condition		= DIA_Wedge_Hello_Condition;
	information		= DIA_Wedge_Hello_Info;
	important		= 0;
	permanent		= 0;
	description		= "Что тебе от меня нужно?"; 
};

FUNC int  DIA_Wedge_Hello_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Psst))
	{
		return TRUE;
	};

};
FUNC void  DIA_Wedge_Hello_Info()
{
	AI_Output (other, self,"DIA_Wedge_Hello_15_00"); //Что тебе от меня нужно?
	AI_Output (self, other,"DIA_Wedge_Hello_05_01"); //Ты ведь не так давно здесь, да? Я сразу это заметил.
	AI_Output (self, other,"DIA_Wedge_Hello_05_02"); //Тебе нужно многое знать и уметь, чтобы выжить здесь. Я могу поучить тебя, если хочешь.
	AI_Output (self, other,"DIA_Wedge_Hello_05_03"); //Прежде всего следи за тем, с кем ты разговариваешь. Например, Бутч - вон тот вор у костра, очень опасный тип. Держись от него подальше!
};  

// ****************************************
// 				Was ist mit Butch
// ****************************************

instance  DIA_Wedge_WarnsOfButch (C_INFO)
{
	npc				= Org_850_Wedge;
	condition		= DIA_Wedge_WarnsOfButch_Condition;
	information		= DIA_Wedge_WarnsOfButch_Info;
	important		= 0;
	permanent		= 0;
	description		= "Почему?"; 
};

FUNC int  DIA_Wedge_WarnsOfButch_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};

};
FUNC void  DIA_Wedge_WarnsOfButch_Info()
{
	AI_Output (other, self,"DIA_Wedge_WarnsOfButch_15_00"); //Почему?
	AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_01"); //Есть у него одна нехорошая привычка - бить всех новичков. Так что постарайся не попадаться ему на глаза.
	//AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_02"); //Also, geh ihm am besten aus dem Weg.//***Doppelt***
};  

// ****************************************
// 					Lehrer
// ****************************************

INSTANCE DIA_Wedge_Lehrer (C_INFO)
{
	npc				= Org_850_Wedge;
	nr				= 700;
	condition		= DIA_Wedge_Lehrer_Condition;
	information		= DIA_Wedge_Lehrer_Info;
	permanent		= 1;
	description		= "Ты можешь научить меня чему-нибудь?"; 
};

FUNC INT DIA_Wedge_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Hello))
	{	
		return TRUE;	
	};
};

FUNC VOID DIA_Wedge_Lehrer_Info()
{
	if (log_wedgelearn == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
		B_LogEntry			(GE_TeacherNC, "Вор Ведж может научить меня подкрадываться, воровать и вскрывать замки.");
		log_wedgelearn = TRUE ;
	};
	AI_Output (other, self,"DIA_Wedge_Lehrer_15_00"); //Ты можешь научить меня чему-нибудь?
	AI_Output (self, other,"DIA_Wedge_Lehrer_05_01"); //Зависит от того, что ты хочешь узнать!
	

	Info_ClearChoices	(DIA_Wedge_Lehrer );
	Info_AddChoice		(DIA_Wedge_Lehrer,DIALOG_BACK																,DIA_Wedge_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0)		,DIA_Wedge_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0)		,DIA_Wedge_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,0)		,DIA_Wedge_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,0)		,DIA_Wedge_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)			,DIA_Wedge_Lehrer_Schleichen);
	};
};


func void DIA_Wedge_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Schleichen_15_00"); //Я хочу научиться подкрадываться.
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_01"); //Все решает твое умение сохранять равновесие. Так же немаловажно контролировать свое дыхание.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_02"); //Существует особый способ движения, при котором никто не сможет услышать твоих шагов.
	};
};

func void DIA_Wedge_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick_15_00"); //Я хочу научиться виртуозно вскрывать замки.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_01"); //Ты ведь хотел бы это узнать, да? Научиться этому не очень сложно.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_02"); //Очень важно следить за тем, чтобы у тебя не сломалась отмычка.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_03"); //Если ты будешь действовать очень осторожно, ты заметишь, что во многих случаях тебе не понадобится больше одной отмычки.
	};
};

func void DIA_Wedge_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick2_15_00"); //Я хочу стать мастером взлома замков.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_01"); //Стоит немного потренироваться, и ты уже с легкостью будешь распознавать момент, когда отмычка готова вот-вот сломаться. При этом ты услышишь особый звук.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_02"); //С опытом к тебе придет умение различать щелчки в замке при повороте отмычки. При этом ты будешь ломать их гораздо реже.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_03"); //Настоящему профессионалу часто удается открыть замок, не сломав ни одной отмычки.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00"); //Я хочу стать опытным карманником.
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01"); //Так ты хочешь облегчать кошельки местных богачей, да? Что ж.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02"); //Я научу тебя этому, но у вора всегда есть небольшой шанс быть застигнутым на месте преступления.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03"); //Риск будет оправдан только в том случае, если ты остаешься один на один со своей жертвой.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04"); //Но только профессиональный вор может совершенно незаметно вытащить что-нибудь ценное из кармана зазевавшегося прохожего!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Wedge_lehrer_Pickpocket_05_05"); //Даже не думай об этом! Тот, кто не умеет подкрадываться, никогда не станет вором.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Pickpocket2_15_00"); //Я хочу стать мастером-карманником.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_01"); //Думаю, ты уже готов к тому, чтобы я посвятил тебя в секреты настоящего мастерства.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_02"); //Но знай, что даже самого лучше вора могут застать на месте преступления.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_03"); //Будь осторожен.
	};
};

func VOID DIA_Wedge_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Wedge_Lehrer );
};

