// ************************ EXIT **************************

instance  VLK_584_Snipes_Exit (C_INFO)
{
	npc			=  VLK_584_Snipes;
	nr			=  999;
	condition	=  VLK_584_Snipes_Exit_Condition;
	information	=  VLK_584_Snipes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_584_Snipes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_584_Snipes_Exit_Info()
{
	AI_Output			(other, self,"Info_Exit_Info_15_001"); //Еще увидимся!
	AI_Output			(self, other,"Info_Exit_Info_07_02"); //Конечно, увидимся!
	
	AI_StopProcessInfos	( self );
};

// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_Condition;
	information		= VLK_584_Snipes_DEAL_Info;
	important		= 0;
	permanent		= 0;
	description		= "Как идут дела?"; 
};

FUNC int  VLK_584_Snipes_DEAL_Condition()
{
	return 1;
};


FUNC void  VLK_584_Snipes_DEAL_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_Info_15_01");//Как идут дела?
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_02"); //Я могу предложить тебе одно дельце.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_03"); //Если ты сможешь отправить Аарона подальше от его сундука, я дам тебе десять кусков руды.
	Snipes_Deal = LOG_RUNNING;

	Log_CreateTopic		(CH2_SnipesDeal,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_RUNNING);
	B_LogEntry		(CH2_SnipesDeal,	"Рудокоп Снайпс предложил мне 10 кусков руды, если я отвлеку стражника Аарона от его сундука!");
};
// ***************** Infos *****************************  
instance  VLK_584_Snipes_DEAL_RUN (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_RUN_Condition;
	information		= VLK_584_Snipes_DEAL_RUN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ну, где мои десять кусков?"; 
};

FUNC int  VLK_584_Snipes_DEAL_RUN_Condition()
{
	if (Snipes_deal == LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC void  VLK_584_Snipes_DEAL_RUN_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_RUN_Info_15_01"); //Ну, где мои десять кусков?
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_02"); //Возьми, ты заслужил их.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_03"); //Да, знаешь, что еще: у меня есть ключ от этого сундука. Только для тебя - всего за тридцать кусков!
	CreateInvItems		(self,ItMinugget,10);
	B_GiveInvItems      (self, other, ItMinugget,10);
	CreateInvItem 		(self,ItKe_OM_02);

	B_GiveXP			(XP_LureAaronAway);
	
	B_LogEntry		(CH2_SnipesDeal,	"Снайпс предложил мне купить у него ключ за 30 кусков руды."); 
};  
// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL_2 (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_2_Condition;
	information		= VLK_584_Snipes_DEAL_2_Info;
	important		= 0;
	permanent		= 1;
	description		= "(Купить ключ)"; 
};

FUNC int  VLK_584_Snipes_DEAL_2_Condition()
{
	if ( Npc_KnowsInfo (hero, VLK_584_Snipes_DEAL_RUN) )
	&& (Npc_HasItems   (self,ItKe_OM_02))
	{
	return 1;
	};
};


FUNC void  VLK_584_Snipes_DEAL_2_Info()
{
	
	if ( Npc_HasItems (hero, ItMinugget)  >= 30 ) 
	{
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_01");//По рукам, я его покупаю!
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_02");//Думаю, дело того стоит.
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_03");//А что с этого получишь ты?
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_04");//Да, знаешь, мне просто приятно, что я смогу обвести кого-то из стражников вокруг пальца. А если что-то из этого сундука окажется у меня, мне не жить.
		
		B_GiveInvItems 	(hero, self, ItMiNugget,30);
		B_GiveInvItems 	(self, hero, ItKe_OM_02, 1);
		VLK_584_Snipes_DEAL_2.permanent = 0;
	
		B_LogEntry		(CH2_SnipesDeal,	"Я купил у Снайпса ключ от сундука. Интересно, что мне скажет об этом Аарон, когда я расскажу ему об этом?"); 
	}
	else
	{
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_05"); //Я же сказал: тридцать кусков, и ключ твой.
	};
};  
