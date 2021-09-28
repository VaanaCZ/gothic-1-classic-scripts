// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Herek_Exit (C_INFO)
{
	npc			= Vlk_511_Herek;
	nr			= 999;
	condition	= DIA_Herek_Exit_Condition;
	information	= DIA_Herek_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Herek_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Herek_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Herek_Bully (C_INFO)
{
	npc				= Vlk_511_Herek;
	nr				= 2;
	condition		= DIA_Herek_Bully_Condition;
	information		= DIA_Herek_Bully_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Herek_Bully_Condition()
{	
	if ( (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Herek_Bully_Info()
{
	AI_Output (self, other,"DIA_Herek_Bully_01_00"); //Подожди-ка! Я слышал, ты разговаривал с Бладвином? 
	AI_Output (other, self,"DIA_Herek_Bully_15_01"); //Ну и что с того?
	AI_Output (self, other,"DIA_Herek_Bully_01_02"); //Ты должно быть крут, если отказался платить ему деньги за защиту.
	AI_Output (self, other,"DIA_Herek_Bully_01_03"); //И это значит, что нам придется внести за тебя твою долю.
	AI_Output (self, other,"DIA_Herek_Bully_01_04"); //Я постараюсь, чтобы ты запомнил следующий разговор с ним.
	
	Npc_SetPermAttitude (self,ATT_ANGRY);
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

// **************************************************
// 					Motz
// **************************************************

INSTANCE DIA_Herek_Motz (C_INFO)
{
	npc				= Vlk_511_Herek;
	nr				= 2;
	condition		= DIA_Herek_Motz_Condition;
	information		= DIA_Herek_Motz_Info;
	permanent		= 0;
	description		= "Как дела?";
};

FUNC INT DIA_Herek_Motz_Condition()
{	
	if (Herek_ProtectionBully==FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Herek_Motz_Info()
{
	AI_Output (other, self,"DIA_Herek_Motz_15_00"); //Как дела?
	AI_Output (self, other,"DIA_Herek_Motz_01_01"); //В этом Лагере есть место только для одного из нас!
	AI_Output (other, self,"DIA_Herek_Motz_15_02"); //Прошу прощения?
	AI_Output (self, other,"DIA_Herek_Motz_01_03"); //Если бы это зависело от меня, ты бы здесь долго не продержался!
	AI_Output (self, other,"DIA_Herek_Motz_01_04"); //Знаешь, почему я здесь? За одну ночь я убил двенадцать человек, вот так... Хе-хе-хе!
	
	Npc_SetPermAttitude (self,ATT_ANGRY);
		
	AI_StopProcessInfos	(self);
};

// **************************************************
// 					Anlegen!
// **************************************************

INSTANCE DIA_Herek_Anlegen (C_INFO)
{
	npc				= Vlk_511_Herek;
	nr				= 2;
	condition		= DIA_Herek_Anlegen_Condition;
	information		= DIA_Herek_Anlegen_Info;
	permanent		= 1;
	description		= "Похоже, ты считаешь себя крутым парнем.";
};

FUNC INT DIA_Herek_Anlegen_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Motz)) || (Npc_KnowsInfo(hero,DIA_Herek_Bully)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Herek_Anlegen_Info()
{
	AI_Output (other, self,"DIA_Herek_Anlegen_15_00"); //Похоже, ты считаешь себя крутым парнем. Почему бы тебе не опробовать свои... Х-мм... Навыки на мне?
	AI_Output (self, other,"DIA_Herek_Anlegen_01_01"); //Жить надоело? Ладно, если ты этого хочешь!
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};


