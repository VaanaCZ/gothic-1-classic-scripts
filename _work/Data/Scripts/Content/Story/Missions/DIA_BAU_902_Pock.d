// ************************************************************
// 			  				   EXIT 
// ************************************************************
	var int Pock_ForgetAll;
// ************************************************************

INSTANCE DIA_Pock_EXIT (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 999;
	condition	= DIA_Pock_EXIT_Condition;
	information	= DIA_Pock_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Pock_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Pock_EXIT_Info()
{	
	Pock_ForgetAll = TRUE;
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Pock_Wasser(C_INFO) // E1
{
	npc			= Bau_902_Pock;
	nr			= 800;
	condition	= Info_Pock_Wasser_Condition;
	information	= Info_Pock_Wasser_Info;
	permanent	= 1;
	description = "Меня послал Лефти. Я принес тебе воды.";
};                       

FUNC INT Info_Pock_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Pock_Wasser_Info()
{
	AI_Output(other,self,"Info_Pock_Wasser_15_00"); //Меня послал Лефти. Я принес тебе воды.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		AI_Output(self,other,"Info_Pock_Wasser_04_01"); //Спасибо, парень! Это как раз то, что нужно!
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Pock_Wasser_NOWATER_04_00"); //Но у тебя совсем ничего не осталось. Ничего страшного - я попрошу у остальных.
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Pock_Hello (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_Hello_Condition;
	information	= DIA_Pock_Hello_Info;
	permanent	= 0;
	description	= "Привет! Я здесь новенький.";
};                       

FUNC INT DIA_Pock_Hello_Condition()
{
	if (Pock_ForgetAll == FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_Hello_Info()
{	
	AI_Output (other, self,"DIA_Pock_Hello_15_00"); //Привет! Я новенький!
	AI_Output (self, other,"DIA_Pock_Hello_04_01"); //Приятно видеть новые лица.
	AI_Output (other, self,"DIA_Pock_Hello_15_02"); //Ты, должно быть, уже очень давно здесь?
	AI_Output (self, other,"DIA_Pock_Hello_04_03"); //Ты чертовски прав, приятель. Я был одним из первых.
};

// ************************************************************
// 						WeiЯt ne Menge
// ************************************************************

INSTANCE DIA_Pock_KnowMuch (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_KnowMuch_Condition;
	information	= DIA_Pock_KnowMuch_Info;
	permanent	= 0;
	description	= "Значит, ты должен знать все об этом месте?";
};                       

FUNC INT DIA_Pock_KnowMuch_Condition()
{
	if ( (Pock_ForgetAll==FALSE) && Npc_KnowsInfo(hero,DIA_Pock_Hello) )
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_KnowMuch_Info()
{	
	AI_Output (other, self,"DIA_Pock_KnowMuch_15_00"); //Значит, ты должен знать все об этом месте?
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_01"); //Да как сказать... Большую часть времени я провожу здесь, собирая рис.
	AI_Output (self, other,"DIA_Pock_KnowMuch_04_02"); //Вот почему я протянул так долго. Мы получаем рис и шнапс - немного, но волне достаточно.
};

// ************************************************************
// 							Warum hier?
// ************************************************************

INSTANCE DIA_Pock_WhyJail (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 2;
	condition	= DIA_Pock_WhyJail_Condition;
	information	= DIA_Pock_WhyJail_Info;
	permanent	= 0;
	description	= "Почему ты здесь?";
};                       

FUNC INT DIA_Pock_WhyJail_Condition()
{
	if ( (Pock_ForgetAll==FALSE) && Npc_KnowsInfo(hero,DIA_Pock_Hello) )
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_WhyJail_Info()
{	
	AI_Output (other, self,"DIA_Pock_WhyJail_15_00"); //Почему ты здесь?
	AI_Output (self, other,"DIA_Pock_WhyJail_04_01"); //Налоги, парень, налоги. В кошельке у меня было так же пусто, как и в желудке, и я просто не смог заплатить.
	AI_Output (self, other,"DIA_Pock_WhyJail_04_02"); //В один прекрасный день пришли содаты и притащили меня сюда. Впрочем, здесь не хуже, чем на воле. По крайней мере, я не протяну ноги с голода.
	AI_Output (self, other,"DIA_Pock_WhyJail_04_03"); //Я всегда вовремя платил налоги - всю свою жизнь. Но этому коронованному сукиному сыну этого оказалось мало!
};

// ************************************************************
// 						PERM (Forget)
// ************************************************************

INSTANCE DIA_Pock_ForgotAll (C_INFO)
{
	npc			= Bau_902_Pock;
	nr			= 1;
	condition	= DIA_Pock_ForgotAll_Condition;
	information	= DIA_Pock_ForgotAll_Info;
	permanent	= 1;
	description	= "Все в порядке?";
};                       

FUNC INT DIA_Pock_ForgotAll_Condition()
{
	if (Pock_ForgetAll == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Pock_ForgotAll_Info()
{	
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_00"); //С тобой все в порядке?
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_01"); //Приятно видеть новые лица.
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_02"); //Эй, мы же уже с тобой разговаривали!
	AI_Output (self, other,"DIA_Pock_ForgotAll_04_03"); //Нет! Этого не может быть! Я тебя никогда раньше не видел.
	AI_Output (other, self,"DIA_Pock_ForgotAll_15_04"); //Конечно...
};

