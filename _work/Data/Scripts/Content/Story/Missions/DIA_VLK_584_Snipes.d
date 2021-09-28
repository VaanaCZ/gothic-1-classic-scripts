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
	AI_Output			(other, self,"Info_Exit_Info_15_001"); //Do zobaczenia nastêpnym razem!
	AI_Output			(self, other,"Info_Exit_Info_07_02"); //Jasne!
	
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
	description		= "Jak leci?"; 
};

FUNC int  VLK_584_Snipes_DEAL_Condition()
{
	return 1;
};


FUNC void  VLK_584_Snipes_DEAL_Info()
{
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_Info_15_01");//Jak leci?
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_02"); //Mam dla ciebie pewn¹ propozycjê.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_Info_07_03"); //Spraw, ¿eby Aaron odczepi³ siê od tej skrzyni, a zap³acê ci 10 bry³ek rudy.
	Snipes_Deal = LOG_RUNNING;

	Log_CreateTopic		(CH2_SnipesDeal,	LOG_MISSION);
	Log_SetTopicStatus	(CH2_SnipesDeal,	LOG_RUNNING);
	B_LogEntry		(CH2_SnipesDeal,"Kopacz Snipes zaoferowa³ mi 10 bry³ek rudy w zamian za odci¹gniêcie Aarona od jego skrzyni.");
};
// ***************** Infos *****************************  
instance  VLK_584_Snipes_DEAL_RUN (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_RUN_Condition;
	information		= VLK_584_Snipes_DEAL_RUN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Nale¿y mi siê 10 bry³ek rudy!"; 
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
	AI_Output			(other, self,"VLK_584_Snipes_DEAL_RUN_Info_15_01"); //Nale¿y mi siê 10 bry³ek rudy!
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_02"); //Proszê, zas³u¿y³eœ na nie.
	AI_Output			(self, other,"VLK_584_Snipes_DEAL_RUN_Info_07_03"); //Ach, i jeszcze coœ: mam przy sobie klucz do tej skrzyni. Jak dla ciebie - 30 bry³ek.
	CreateInvItems		(self,ItMinugget,10);
	B_GiveInvItems      (self, other, ItMinugget,10);
	CreateInvItem 		(self,ItKe_OM_02);

	B_GiveXP			(XP_LureAaronAway);
	
	B_LogEntry		(CH2_SnipesDeal,"Za kolejne 30 bry³ek Snipes zaoferowa³ mi klucz do skrzyni Aarona."); 
};  
// ***************** Infos *****************************
instance  VLK_584_Snipes_DEAL_2 (C_INFO)
{
	npc				= VLK_584_Snipes;
	condition		= VLK_584_Snipes_DEAL_2_Condition;
	information		= VLK_584_Snipes_DEAL_2_Info;
	important		= 0;
	permanent		= 1;
	description		= "(kup klucz)"; 
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
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_01");//Wezmê ten klucz.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_02");//Trafi³a ci siê nie lada okazja.
		AI_Output			(other, self,"VLK_584_Snipes_DEAL_2_Info_15_03");//Zastanawiam siê co TY z tego masz.
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_04");//Zawsze siê cieszê, kiedy mogê daæ prztyczka w nos któremuœ ze Stra¿ników. Zreszt¹, gdyby znaleŸli przy mnie rzeczy z tej skrzyni, by³bym martwy.
		
		B_GiveInvItems 	(hero, self, ItMiNugget,30);
		B_GiveInvItems 	(self, hero, ItKe_OM_02, 1);
		VLK_584_Snipes_DEAL_2.permanent = 0;
	
		B_LogEntry		(CH2_SnipesDeal,"Kupi³em od Snipesa klucz od skrzyni! Ciekawe, co zrobi Aaron, gdy mu o tym powiem?"); 
	}
	else
	{
		AI_Output			(self, other,"VLK_584_Snipes_DEAL_2_Info_07_05"); //Ma byæ 30 bry³ek! Daj mi rudê, to dostaniesz klucz.
	};
};  
