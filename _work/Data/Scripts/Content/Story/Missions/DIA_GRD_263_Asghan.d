
// ************************ EXIT **************************

instance  Grd_263_Asghan_Exit (C_INFO)
{
	npc			=	Grd_263_Asghan;
	nr			=	999;
	condition	=	Grd_263_Asghan_Exit_Condition;
	information	=	Grd_263_Asghan_Exit_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Grd_263_Asghan_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_263_Asghan_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************** Infos *****************************

instance  Grd_263_Asghan_NEST (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_NEST_Condition;
	information		= Grd_263_Asghan_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Где-то здесь должно быть логово ползунов."; 
};

FUNC int  Grd_263_Asghan_NEST_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING) 
	{
		return 1;
	};

};
FUNC void  Grd_263_Asghan_NEST_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_01"); //Где-то здесь должно быть логово ползунов.
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_02"); //Вся гора - одно сплошное логово этих тварей!
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_03"); //Почему закрыли эту шахту?
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_04"); //Сколько бы мы ни убивали ползунов, их становилось все больше и больше.
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_05"); //Похоже, где-то неподалеку должно быть их логово. Позволь мне открыть ворота!
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_06"); //Нет! Эти ворота могут быть открыты только с разрешения Яна! До тех пор пока ты не получишь его, я не сдвинусь с места.
	
	B_LogEntry		(CH2_MCEggs,"Асгхан, начальник стражников шахты, не откроет ворота. Для этого необходимо иметь разрешение Яна.");

};
/*------------------------------------------------------------------------
							ERLAUBNIS VON IAN GEHOLT							
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_OPEN (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_Condition;
	information		= Grd_263_Asghan_OPEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Эй, Асгхан, теперь ты можешь открыть ворота!"; 
};

FUNC int  Grd_263_Asghan_OPEN_Condition()
{
	if Npc_KnowsInfo  ( hero, Grd_263_Asghan_NEST)
	&& Npc_KnowsInfo  ( hero, STT_301_IAN_GEAR_SUC)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_OPEN_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_01"); //Эй, Асгхан, теперь ты можешь открыть ворота!
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_02"); //Я уже говорил тебе: только если Ян...
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_03"); //Асгхан... Все будет в порядке... И прими наилучшие пожелания от Яна.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_04"); //Ну, если Ян берет ответственность на себя... Но только на одном условии!
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_05"); //На каком же?
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_06"); //Добудь мне подкрепление - двух-трех Стражей. Я не хочу стоять здесь один, когда ползуны попрут из шахты!
	
	B_LogEntry		(CH2_MCEggs,"Хотя Ян и дал мне разрешение, Асгхан все равно не откроет ворота до тех пор, пока я не соберу подкрепление из нескольких стражей.");

	AI_StopProcessInfos	( self );
};  

  
// ***************** Infos *****************************
instance  Grd_263_Asghan_OPEN_NOW (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_NOW_Condition;
	information		= Grd_263_Asghan_OPEN_NOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Все приготовления окончены. Теперь можно открыть шахту!"; 
};

FUNC int  Grd_263_Asghan_OPEN_NOW_Condition()
{	
	if 		(Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST )) && (Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST))
	||		(Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST)) && (Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC ))
	||		(Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC)) && (Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST ))   
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_OPEN_NOW_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //Все приготовления окончены. Теперь можно открыть шахту!
	AI_Output			(self, other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //Ладно, открывай. Представление начинается!
	
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Npc_ExchangeRoutine	(self,"opengate");
	
	B_GiveXP			(XP_OpenAsghansGate);
	B_LogEntry			(CH2_MCEggs,"Мне удалось собрать несколько стражей перед воротами. Что же ждет нас там, в темноте?");
		
	AI_StopProcessInfos	(self);
};    

// ***************** Nest gefunden *****************************
instance  Grd_263_Asghan_LAIRFOUND (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_LAIRFOUND_Condition;
	information		= Grd_263_Asghan_LAIRFOUND_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ползуны больше не представляют угрозы!"; 
};

FUNC int  Grd_263_Asghan_LAIRFOUND_Condition()
{	
	if	(Npc_HasItems(hero, ItAt_Crawlerqueen)>=3)   
	&&  (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_LAIRFOUND_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //Ползуны больше не представляют угрозы!
	AI_Output			(self, other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //Хорошая новость. Я отправлю гонца к Торусу!

	AI_StopProcessInfos	(self);
};    

/*------------------------------------------------------------------------
						MCQ Hatz lдuft noch nicht 						
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_SMALLTALK (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_SMALLTALK_Condition;
	information		= Grd_263_Asghan_SMALLTALK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Как идут дела?"; 
};

FUNC int  Grd_263_Asghan_SMALLTALK_Condition()
{	
	if (CorKalom_BringMCQBalls != LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_SMALLTALK_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_01"); //Эй, как дела?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Нормально... Пока никто не пытается открыть ворота, мне не нужно откручивать никому голову.
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //Что такого особенного в этих воротах?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Ползуны. Большие мерзкие твари. И их здесь очень много.
};  



































