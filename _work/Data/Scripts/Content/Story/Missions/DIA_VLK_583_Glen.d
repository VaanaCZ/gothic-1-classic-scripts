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
	description		= "O czym powinienem pami�ta�, b�d�c w kopalni?"; 
};

FUNC int  VLK_583_Glen_INFO_Condition()
{
	return 1;
};


FUNC void  VLK_583_Glen_INFO_Info()
{
	AI_Output (other, self,"VLK_583_Glen_INFO_Info_15_01"); //O czym powinienem pami�ta�, b�d�c w kopalni?
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_02"); //Uwa�aj na pe�zacze.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_03"); //Im ni�ej zejdziesz, tym cz�ciej mo�esz na nie wpa��. Te przekl�te stwory przychodz� chyba wprost z kr�lestwa samego Beliara!
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_04"); //Bez przerwy s�ycha�, jak grzebi� i kopi�. Siedz� w ciemno�ci i czekaj� na jakiego� biednego g�rnika, z kt�rego zrobi� sobie obiad.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_05"); //S� bezlitosne i bardzo szybkie. Je�li ci �ycie mi�e, uciekaj st�d ile si� w nogach. Pr�dzej czy p�niej padnie i na ciebie.
};  
// ***************** Infos *****************************

instance  VLK_583_Glen_LOCKPICK (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_LOCKPICK_Condition;
	information	=  VLK_583_Glen_LOCKPICK_Info;
	important	= 0;	
	permanent	= 0;
	description = "S�ysza�em, �e mo�na tu kupi� wytrychy?";
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
	AI_Output (other, self,"VLK_583_Glen_LOCKPICK_15_01"); //S�ysza�em, �e mo�na tu kupi� wytrychy?
	AI_Output (self, other,"VLK_583_Glen_LOCKPICK_02_02"); //Skoro okaza�e� si� na tyle sprytny, �eby do mnie dotrze�, mo�esz kilka kupi�. To b�dzie 10 bry�ek rudy za sztuk�.
	
	
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
	AI_Output (other, self,"VLK_583_Glen_BUY_Info_15_01"); //Chc� kupi� kilka wytrych�w.
	
	
	
};
