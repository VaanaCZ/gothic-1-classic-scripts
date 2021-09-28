// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bau_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bau_4_EXIT_Condition;
	information	= Info_Bau_4_EXIT_Info;
	permanent	= 1;
	description = "ЗАКОНЧИТЬ";
};                       

FUNC INT Info_Bau_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Bau_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Bau_4_WichtigePersonen_Condition;
	information	= Info_Bau_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "Кто у вас главный?";
};                       

FUNC INT Info_Bau_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Bau_4_WichtigePersonen_15_00"); //Кто у вас главный?
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_01"); //Ты можешь считать главным нашего Лорда. Но большинство работает на него только потому, что боится его головорезов.
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_02"); //Я здесь несколько лет и сыт по горло проблемами с ворами в Лагере... Рисовые поля для меня - в самый раз.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Bau_4_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Bau_4_DasLager_Condition;
	information	= Info_Bau_4_DasLager_Info;
	permanent	= 1;
	description = "Расскажи мне об этом месте.";
};                       

FUNC INT Info_Bau_4_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_4_DasLager_15_00"); //Что мне стоит узнать об этом месте?
	AI_Output(self,other,"Info_Bau_4_DasLager_04_01"); //Будь осторожен в Лагере, парень! Там полно головорезов, которые только и ждут очередного новичка, вроде тебя.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Bau_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Bau_4_DieLage_Condition;
	information	= Info_Bau_4_DieLage_Info;
	permanent	= 1;
	description = "Как дела?";
};                       

FUNC INT Info_Bau_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_4_DieLage_15_00"); //Как дела?
	AI_Output(self,other,"Info_Bau_4_DieLage_04_01"); //Полно работы. Нужно много риса, чтобы прокормить всех этих людей.
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Bau_4_Wasser(C_INFO) // E1
{
	nr			= 800;
	condition	= Info_Bau_4_Wasser_Condition;
	information	= Info_Bau_4_Wasser_Info;
	permanent	= 1;
	description = "Меня послал Лефти. Я принес тебе воды.";
};                       

FUNC INT Info_Bau_4_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Bau_4_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_4_Wasser_15_00"); //Меня прислал Лефти. Я принес тебе воды.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems		(other, self,	ItFo_Potion_Water_01, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,	ItFo_Potion_Water_01);

		AI_Output(self,other,"Info_Bau_4_Wasser_04_01"); //Спасибо, парень! Это как раз то, что нужно!
		
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_4_Wasser_NOWATER_04_00"); //Но у тебя ничего не осталось. Не переживай, приятель. Я попрошу у остальных.
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Bau_4(var c_NPC slf)
{
	Info_Bau_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bau_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Bau_4_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Bau_4_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Bau_4_Wasser.npc				= Hlp_GetInstanceID(slf);
};
