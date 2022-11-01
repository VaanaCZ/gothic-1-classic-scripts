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
	description		= "O czym powinienem pamiętać, będąc w kopalni?"; 
};

FUNC int  VLK_583_Glen_INFO_Condition()
{
	return 1;
};


FUNC void  VLK_583_Glen_INFO_Info()
{
	AI_Output (other, self,"VLK_583_Glen_INFO_Info_15_01"); //O czym powinienem pamiętać, będąc w kopalni?
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_02"); //Uważaj na pełzacze.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_03"); //Im niżej zejdziesz, tym częściej możesz na nie wpaść. Te przeklęte stwory przychodzą chyba wprost z królestwa samego Beliara!
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_04"); //Bez przerwy słychać, jak grzebią i kopią. Siedzą w ciemności i czekają na jakiegoś biednego górnika, z którego zrobią sobie obiad.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_05"); //Są bezlitosne i bardzo szybkie. Jeśli ci życie miłe, uciekaj stąd ile sił w nogach. Prędzej czy później padnie i na ciebie.
};  
// ***************** Infos *****************************

instance  VLK_583_Glen_LOCKPICK (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_LOCKPICK_Condition;
	information	=  VLK_583_Glen_LOCKPICK_Info;
	important	= 0;	
	permanent	= 0;
	description = "Słyszałem, że można tu kupić wytrychy?";
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
	AI_Output (other, self,"VLK_583_Glen_LOCKPICK_15_01"); //Słyszałem, że można tu kupić wytrychy?
	AI_Output (self, other,"VLK_583_Glen_LOCKPICK_02_02"); //Skoro okazałeś się na tyle sprytny, żeby do mnie dotrzeć, możesz kilka kupić. To będzie 10 bryłek rudy za sztukę.
	
	
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
	AI_Output (other, self,"VLK_583_Glen_BUY_Info_15_01"); //Chcę kupić kilka wytrychów.
	
	
	
};
