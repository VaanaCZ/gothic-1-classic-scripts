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
	description = "Кто ты?";
};                       

FUNC INT Info_Bartholo_HAllo_Condition()
{	
	return 1;
};

FUNC VOID Info_Bartholo_HAllo_Info()
{
	AI_Output (other, self,"Info_Bartholo_HAllo_15_00"); //Кто ты?
	AI_Output (self, other,"Info_Bartholo_HAllo_12_01"); //Я Бартоло. Слежу, чтобы Бароны получали припасы вовремя.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_02"); //Еда, болотник, продовольствие для женщин...
	AI_Output (self, other,"Info_Bartholo_HAllo_12_03"); //Также приходится следить за этими идиотами поварами.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_04"); //Гомез не любит оплошностей. Последних двух поваров он скормил речным шныгам.
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
	description = "Я хочу поторговать с тобой.";
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
	AI_Output (other, self,"Info_Bartholo_PERM_15_00"); //Я хочу поторговать с тобой.
	AI_Output (self, other,"Info_Bartholo_PERM_12_01"); //У меня много чего есть для тех, у кого есть руда, конечно.
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
	description = "У меня болотник для Гомеза. Его послал Кор Галом.";
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
	AI_Output				(other, self,"Info_Bartholo_Krautbote_15_00"); //У меня болотник для Гомеза. Его послал Кор Галом.
	AI_Output				(self, other,"Info_Bartholo_Krautbote_12_01"); //Покажи!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_02"); //
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_03"); //Это хорошо. А то Гомез уже начал терять терпение. Это просто удача, что ты объявился сегодня.
		AI_Output			(other, self,"Info_Bartholo_Krautbote_15_04"); //Как насчет платы?
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_05"); //Не так быстро... Вот, держи. Как договаривались - пять сотен.
		
		B_GiveInvItems  	(other,self,itmijoint_3,30);
		CreateInvItems  	(self,itminugget, 500);
		B_GiveInvItems		(self,other, itminugget, 500);

		Kalom_DeliveredWeed	= TRUE;
		B_LogEntry			(CH1_KrautBote,	"Бартоло дал мне 500 кусков руды за болотник, который я принес для Гомеза.");
		B_GiveXP			(XP_WeedShipmentDelivered);

		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //У тебя слишком мало болотника! Надеюсь, ты не продал его на сторону. Будет нормальный запас, тогда и приходи.
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
	AI_Output			(self, other,"Info_Bartholo_12_02");	//Но в отличие от этого предателя кузнеца Стоуна, ты нам больше не нужен!
	AI_Output			(other, self,"Info_Bartholo_15_03");	//Где Стоун?
	AI_Output			(self, other,"Info_Bartholo_12_04");	//За решеткой! А ты через минуту окажешься на полметра ниже.
	AI_Output			(self, other,"Info_Bartholo_12_05");	//Взять его, парни! Порубить на куски!

	AI_StopProcessInfos	(self);
	
	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(self, GIL_EBR);	
};
