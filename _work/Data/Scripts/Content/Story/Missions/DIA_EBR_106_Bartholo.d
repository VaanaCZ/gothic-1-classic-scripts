// **************************************
//					EXIT 
// **************************************

instance DIA_Bartholo_Exit (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 999;
	condition	= DIA_Bartholo_Exit_Condition;
	information	= DIA_Bartholo_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Bartholo_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Bartholo_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					HAllo
// ************************************************************

INSTANCE Info_Bartholo_HAllo (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_HAllo_Condition;
	information	= Info_Bartholo_HAllo_Info;
	permanent	= 0;
	description = "Как тебя зовут?";
};                       

FUNC INT Info_Bartholo_HAllo_Condition()
{	
	return 1;
};

FUNC VOID Info_Bartholo_HAllo_Info()
{
	AI_Output (other, self,"Info_Bartholo_HAllo_15_00"); //Кто ты?
	AI_Output (self, other,"Info_Bartholo_HAllo_12_01"); //Зовут меня Бартоло. Моя работа - следить за тем, чтобы Бароны вовремя получали припасы.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_02"); //Я отвечаю за поставки еды и болотника, за продовольствие для женщин...
	AI_Output (self, other,"Info_Bartholo_HAllo_12_03"); //Также приходится следить за этими идиотами-поварами.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_04"); //Они еще должны быть мне благодарны. Гомез не прощает ошибок - последних двух поваров он скормил речным шныгам.
};

// ************************************************************
// 					PERM TRADE
// ************************************************************

INSTANCE Info_Bartholo_PERM (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_PERM_Condition;
	information	= Info_Bartholo_PERM_Info;
	permanent	= 0;
	description = "Я хочу заключить с тобой сделку.";
	Trade		= 1;
};                       

FUNC INT Info_Bartholo_PERM_Condition()
{	
//SN: Problematisch, da Bartholo auch einen wichtigen Schlьssel hat!
//	if (Npc_KnowsInfo(hero, Info_Bartholo_Hallo))
//	{
//		return 1;
//	};
};

FUNC VOID Info_Bartholo_PERM_Info()
{
	AI_Output (other, self,"Info_Bartholo_PERM_15_00"); //Я хочу заключить с тобой сделку.
	AI_Output (self, other,"Info_Bartholo_PERM_12_01"); //Я многое могу предложить - если у тебя есть руда, конечно.
};


// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Bartholo_Krautbote (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_Krautbote_Condition;
	information	= Info_Bartholo_Krautbote_Info;
	permanent	= 1;
	description = "Здесь у меня болотник для Гомеза. Его послал Кор Галом.";
};                       

FUNC INT Info_Bartholo_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Bartholo_Krautbote_Info()
{
	AI_Output				(other, self,"Info_Bartholo_Krautbote_15_00"); //Здесь у меня болотник для Гомеза. Его послал Кор Галом.
	AI_Output				(self, other,"Info_Bartholo_Krautbote_12_01"); //Покажи!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_02"); //М-ммммммммм...
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_03"); //Хорошо! Гомез как раз начал терять терпение. Это просто удача, что ты объявился сегодня.
		AI_Output			(other, self,"Info_Bartholo_Krautbote_15_04"); //Как насчет платы?
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_05"); //Не торопись... Вот, возьми. Сойдемся на пяти сотнях.
		
		B_GiveInvItems  	(other,self,itmijoint_3,30);
		CreateInvItems  	(self,itminugget, 500);
		B_GiveInvItems		(self,other, itminugget, 500);

		Kalom_DeliveredWeed	= TRUE;
		B_LogEntry			(CH1_KrautBote,"Бартоло заплатил мне 500 кусков руды за груз болотника.");
		B_GiveXP			(XP_WeedShipmentDelivered);

		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //Для посыльного у тебя слишком мало болотника! Надеюсь, что ты не продал часть на сторону. Возвращайся с нормальным запасом!
	};
};

// **************************************************************************
// 				Wartet auf den SC
// **************************************************************************

instance  DIA_EBR_106_Bartholo_Wait4SC (C_INFO)
{
	npc				= EBR_106_Bartholo;
	condition		= DIA_EBR_106_Bartholo_Wait4SC_Condition;
	information		= DIA_EBR_106_Bartholo_Wait4SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_EBR_106_Bartholo_Wait4SC_Condition()
{	
	if	ExploreSunkenTower
	{
		return TRUE;
	};
};
FUNC void  DIA_EBR_106_Bartholo_Wait4SC_Info()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	AI_Output			(self, other,"Info_Bartholo_12_01");	//Я знал, что кто-нибудь попытается добраться до нас через пентаграмму!
	AI_Output			(self, other,"Info_Bartholo_12_02");	//Но в отличие от этого предателя-кузнеца Стоуна, ты нам больше не нужен!
	AI_Output			(other, self,"Info_Bartholo_15_03");	//Где Стоун?
	AI_Output			(self, other,"Info_Bartholo_12_04");	//За решеткой! А ты через минуту окажешься на полметра ниже. 
	AI_Output			(self, other,"Info_Bartholo_12_05");	//Взять его, парни! Порубить на куски!

	AI_StopProcessInfos	(self);
	
	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(self, GIL_EBR);	
};
