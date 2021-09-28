// ************************ EXIT **************************

instance  VLK_583_Glen_Exit (C_INFO)
{
	npc			=  VLK_583_Glen;
	nr			= 999;
	condition	=  VLK_583_Glen_Exit_Condition;
	information	=  VLK_583_Glen_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_583_Glen_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_583_Glen_Exit_Info()
{
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance   VLK_583_Glen_INFO(C_INFO)
{
	npc				= VLK_583_Glen;
	condition		= VLK_583_Glen_INFO_Condition;
	information		= VLK_583_Glen_INFO_Info;
	important		= 0;
	permanent		= 1;
	description		= "O czym powinienem pamiêtaæ, bêd¹c w kopalni?"; 
};

FUNC int  VLK_583_Glen_INFO_Condition()
{
	return 1;
};


FUNC void  VLK_583_Glen_INFO_Info()
{
	AI_Output (other, self,"VLK_583_Glen_INFO_Info_15_01"); //O czym powinienem pamiêtaæ, bêd¹c w kopalni?
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_02"); //Uwa¿aj na pe³zacze.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_03"); //Im ni¿ej zejdziesz, tym czêœciej mo¿esz na nie wpaœæ. Te przeklête stwory przychodz¹ chyba wprost z królestwa samego Beliara!
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_04"); //Bez przerwy s³ychaæ, jak grzebi¹ i kopi¹. Siedz¹ w ciemnoœci i czekaj¹ na jakiegoœ biednego górnika, z którego zrobi¹ sobie obiad.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_05"); //S¹ bezlitosne i bardzo szybkie. Jeœli ci ¿ycie mi³e, uciekaj st¹d ile si³ w nogach. Prêdzej czy póŸniej padnie i na ciebie.
};  
// ***************** Infos *****************************

instance  VLK_583_Glen_LOCKPICK (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_LOCKPICK_Condition;
	information	=  VLK_583_Glen_LOCKPICK_Info;
	important	= 0;	
	permanent	= 0;
	description = "S³ysza³em, ¿e mo¿na tu kupiæ wytrychy?";
};                       

FUNC int  VLK_583_Glen_LOCKPICK_Condition()
{
	if ( Npc_KnowsInfo(hero, VLK_585_Aleph_GLEN) )
	{
		return 1;
	};
};

FUNC VOID  VLK_583_Glen_LOCKPICK_Info()
{
	AI_Output (other, self,"VLK_583_Glen_LOCKPICK_15_01"); //S³ysza³em, ¿e mo¿na tu kupiæ wytrychy?
	AI_Output (self, other,"VLK_583_Glen_LOCKPICK_02_02"); //Skoro okaza³eœ siê na tyle sprytny, ¿eby do mnie dotrzeæ, mo¿esz kilka kupiæ. To bêdzie 10 bry³ek rudy za sztukê.
	
	
};
// ***************** Infos *****************************

instance  VLK_583_Glen_BUY (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_BUY_Condition;
	information	=  VLK_583_Glen_BUY_Info;
	important	= 0;	
	permanent	= 1;
	description = "(kup wytrychy)";
	trade		= 1;
};                       

FUNC int  VLK_583_Glen_BUY_Condition()
{	
	if ( Npc_KnowsInfo (hero, VLK_583_Glen_LOCKPICK) )
	{
		return 1;
	};
};
FUNC VOID  VLK_583_Glen_BUY_Info()
{
	AI_Output (other, self,"VLK_583_Glen_BUY_Info_15_01"); //Chcê kupiæ kilka wytrychów.
	
	
	
};
