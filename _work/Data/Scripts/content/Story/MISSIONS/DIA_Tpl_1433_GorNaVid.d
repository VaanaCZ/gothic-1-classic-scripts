// ************************ EXIT **************************

instance  Tpl_1433_GorNaVid_Exit (C_INFO)
{
	npc			= Tpl_1433_GorNaVid;
	nr			= 999;
	condition	= Tpl_1433_GorNaVid_Exit_Condition;
	information	= Tpl_1433_GorNaVid_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1433_GorNaVid_Exit_Condition()
{
	return 1;
};

FUNC VOID  Tpl_1433_GorNaVid_Exit_Info()
{
	AI_Output (self, other,"Tpl_1433_GorNaVid_Exit_Info_13_02"); //Да пробудится Спящий!
	AI_StopProcessInfos	( self );
};

// ***************** Infos *****************************

instance  Tpl_1433_GorNaVid_HEALTH (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_HEALTH_Condition;
	information		= Tpl_1433_GorNaVid_HEALTH_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ты можешь мне помочь?"; 
};

FUNC int  Tpl_1433_GorNaVid_HEALTH_Condition()
{	
	if	 Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN)
	&&	!Npc_KnowsInfo(hero, Grd_263_Asghan_OPEN_NOW)
	{
		return TRUE;
	};
};

FUNC void  Tpl_1433_GorNaVid_HEALTH_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_01"); //Ты можешь мне помочь?  
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_02"); //Мне нужно добыть слюну ползунов для Кор Галома. Я знаю, где находится логово этих тварей.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_Info_15_03"); //Сможешь ли ты прикрыть меня, когда я открою ворота?
	AI_Output (self, other,"Tpl_1433_GorNaVid_HEALTH_Info_13_04"); //Охота на ползунов без крови не обходится. Если бы у меня был целебный эликсир, и я не задумываясь бы помог тебе.

};  
// ***************** Infos *****************************

instance  Tpl_1433_GorNaVid_IAN (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_IAN_Condition;
	information		= Tpl_1433_GorNaVid_IAN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я ищу логово ползунов. Не знаешь, где оно?"; 
};

FUNC int  Tpl_1433_GorNaVid_IAN_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING
	&&	!Npc_KnowsInfo(hero,Grd_263_Asghan_OPEN))
	{
		return 1;
	};
};

FUNC void  Tpl_1433_GorNaVid_IAN_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNaVid_IAN_Info_15_01"); //Я ищу логово ползунов. Не знаешь, где оно?
	AI_Output (self, other,"Tpl_1433_GorNaVid_IAN_Info_13_02"); //Возле главной шахты много пещер, но логова там нет.
};  

// ***************** Infos *****************************
instance  Tpl_1433_GorNaVid_HEALTH_SUC (C_INFO)
{
	npc				= Tpl_1433_GorNaVid;
	condition		= Tpl_1433_GorNaVid_HEALTH_SUC_Condition;
	information		= Tpl_1433_GorNaVid_HEALTH_SUC_Info;
	important		= 0;
	permanent		= 0;
	description		= "(Отдать лечебное зелье)"; 
};

FUNC int  Tpl_1433_GorNaVid_HEALTH_SUC_Condition()
{	
	if ( Npc_KnowsInfo (hero, Tpl_1433_GorNaVid_HEALTH )) &&
		(Npc_HasItems (hero, Itfo_Potion_Health_01)  || 
		 Npc_HasItems (hero, Itfo_Potion_Health_02)  ||
		 Npc_HasItems (hero, Itfo_Potion_Health_03))	
	{
		return 1;
	};

};
FUNC void  Tpl_1433_GorNaVid_HEALTH_SUC_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_01"); //Вот, может быть, это поможет тебе.
	AI_Output (self, other,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_13_02"); //Благодарю. Можешь на меня положиться. Я и Асгхан будем ждать тебя внизу.
	AI_Output (other, self,"Tpl_1433_GorNaVid_HEALTH_SUC_Info_15_03"); //Я подойду к вам.
	
	if Npc_HasItems (hero,Itfo_Potion_Health_01)
	{
		B_GiveInvItems (hero, self,Itfo_Potion_Health_01, 1);
	}
	else if Npc_HasItems (hero,Itfo_Potion_Health_02)
	{
		B_GiveInvItems (hero, self,Itfo_Potion_Health_02, 1);
	}	 
	else if Npc_HasItems (hero,Itfo_Potion_Health_03)
	{
	 	B_GiveInvItems (hero, self,Itfo_Potion_Health_03, 1);
	}
	else 
	{
		PrintDebugNpc (PD_MISSION, "У меня нет зелья.");
	};

	Npc_ExchangeRoutine (self,"GATE"); 
	Npc_SetPermAttitude	(self,ATT_FRIENDLY); 
	B_GiveXP			(XP_HireGorNaVid);
	B_LogEntry		(CH2_MCEggs,	"Я должен отдать Гор На Виду лечебное зелье, прежде чем он сможет помочь Асгхану защищать ворота от ползунов.");	

	AI_StopProcessInfos	(self);
};

//---------EIER GEFUNDEN------------------------------------------------------
instance  Tpl_1433_GorNavid_VICTORY (C_INFO)
{
	npc				= Tpl_1433_GorNavid;
	condition		= Tpl_1433_GorNavid_VICTORY_Condition;
	information		= Tpl_1433_GorNavid_VICTORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Я нашел логово королевы ползунов!"; 
};

FUNC int  Tpl_1433_GorNavid_VICTORY_Condition()
{	
	if Npc_HasItems (hero,ItAt_Crawlerqueen ) >= 1 
	{
		return TRUE;
	};

};
FUNC void  Tpl_1433_GorNavid_VICTORY_Info()
{
	AI_Output (other, self,"Tpl_1433_GorNavid_VICTORY_Info_15_01"); //Я нашел логово королевы ползунов!
	AI_Output (self, other,"Tpl_1433_GorNavid_VICTORY_Info_13_02"); //От всего Братства благодарен тебе!
	AI_Output (self, other,"Tpl_1433_GorNavid_VICTORY_Info_13_03"); //И пусть Спящий хранит тебя!
};     
 
