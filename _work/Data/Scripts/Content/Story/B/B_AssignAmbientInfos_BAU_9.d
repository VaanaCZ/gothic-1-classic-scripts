// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bau_9_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_9 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bau_9_EXIT_Condition;
	information	= Info_Bau_9_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ";
};                       

FUNC INT Info_Bau_9_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_9_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Bau_9_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Bau_9_WichtigePersonen_Condition;
	information	= Info_Bau_9_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто следит за работой на полях?";
};                       

FUNC INT Info_Bau_9_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_9_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Bau_9_WichtigePersonen_15_00"); //Кто следит за работой на полях?
	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_01"); //Все! Вообще-то, за работой должен следить Лорд, но по-моему он целыми днями пересчитывает мешки в своих закромах.
	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_02"); //Ну, они с Гомером все это и обустроили...
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Bau_9_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Bau_9_DasLager_Condition;
	information	= Info_Bau_9_DasLager_Info;
	permanent	= 1;
	description = "Расскажи мне об этом Лагере.";
};                       

FUNC INT Info_Bau_9_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_9_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_9_DasLager_15_00"); //Расскажи мне об этом Лагере.
	AI_Output(self,other,"Info_Bau_9_DasLager_09_01"); //Он до отказа заполнен разными ублюдками. Моя бы воля, я бы поручил наемникам вышвырнуть всех воров из Лагеря.
	AI_Output(self,other,"Info_Bau_9_DasLager_09_02"); //Они ничего не делают, и от них одни неприятности.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Bau_9_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Bau_9_DieLage_Condition;
	information	= Info_Bau_9_DieLage_Info;
	permanent	= 1;
	description = "Как дела?";
};                       

FUNC INT Info_Bau_9_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_9_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_9_DieLage_15_00"); //Ты как?
	AI_Output(self,other,"Info_Bau_9_DieLage_09_01"); //Мы надрываемся здесь, чтобы получить хоть немного еды.
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Bau_9_Wasser(C_INFO) // E1
{
	nr			= 800;
	condition	= Info_Bau_9_Wasser_Condition;
	information	= Info_Bau_9_Wasser_Info;
	permanent	= 1;
	description = "Меня послал Лефти. Я принес тебе воды.";
};                       

FUNC INT Info_Bau_9_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Bau_9_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_9_Wasser_15_00"); //Меня прислал Лефти. Я принес тебе воды.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems		(other, self,	ItFo_Potion_Water_01, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,	ItFo_Potion_Water_01);

		AI_Output			(self,other,"Info_Bau_9_Wasser_09_01"); //Спасибо, приятель. Еще немного, и я начал бы пить из лужи.
		
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_9_Wasser_NOWATER_09_00"); //У тебя ничего не осталось. Я попрошу у остальных.
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Bau_9(var c_NPC slf)
{
	Info_Bau_9_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bau_9_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Bau_9_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Bau_9_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Bau_9_Wasser.npc				= Hlp_GetInstanceID(slf);
};








