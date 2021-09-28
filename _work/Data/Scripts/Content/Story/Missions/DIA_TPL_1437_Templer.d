
// ************************ EXIT **************************

instance  Tpl_1437_Templer_Exit (C_INFO)
{
	npc			=  Tpl_1437_Templer;
	nr			=  999;
	condition	=  Tpl_1437_Templer_Exit_Condition;
	information	=  Tpl_1437_Templer_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  Tpl_1437_Templer_Exit_Condition()
{
	return TRUE;
};

FUNC VOID  Tpl_1437_Templer_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************************** BESSER NICHT ANSPRECHEN ****************************************//

instance  Tpl_1437_Templer_NERV (C_INFO)
{
	npc				= Tpl_1437_Templer;
	condition		= Tpl_1437_Templer_NERV_Condition;
	information		= Tpl_1437_Templer_NERV_Info;
	important		= 0;
	permanent		= 1;
	description		= "¿Qué pasa?"; 
};

FUNC int  Tpl_1437_Templer_NERV_Condition()
{
	return TRUE;
};


FUNC void  Tpl_1437_Templer_NERV_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_NERV_Info_15_01"); //¿Qué pasa?
	AI_Output (self, other,"Tpl_1437_Templer_NERV_Info_13_02"); //Oye, ¿tienes que abordar a todos los que te encuentras?
	AI_StopProcessInfos	( self );
};  
// ERNEUTES ANSPRECHEN ------------------------------------
instance  Tpl_1437_Templer_LEAVE (C_INFO)
{
	npc				= Tpl_1437_Templer;
	condition		= Tpl_1437_Templer_LEAVE_Condition;
	information		= Tpl_1437_Templer_LEAVE_Info;
	important		= 0;
	permanent		= 0;
	description		= "¿Todo va bien?"; 
};

FUNC int  Tpl_1437_Templer_LEAVE_Condition()
{	
	if Npc_KnowsInfo (hero, Tpl_1437_Templer_NERV)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1437_Templer_LEAVE_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_LEAVE_Info_15_01"); //¿Va todo bien?
	AI_Output (self, other,"Tpl_1437_Templer_LEAVE_Info_13_02"); //Quiero tranquilidad, ¿entendido? Así que esfúmate y haz otra cosa, ¡lo que sea!
	AI_StopProcessInfos	( self );
};
// ERNEUTES ANSPRECHEN ------------------------------------
instance  Tpl_1437_Templer_LEAVENOW (C_INFO)
{
	npc				= Tpl_1437_Templer;
	condition		= Tpl_1437_Templer_LEAVENOW_Condition;
	information		= Tpl_1437_Templer_LEAVENOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "¡No, no te entiendo!"; 
};

FUNC int  Tpl_1437_Templer_LEAVENOW_Condition()
{	
	if Npc_KnowsInfo (hero, Tpl_1437_Templer_LEAVE)
	{
		return TRUE;
	};

};
FUNC void  Tpl_1437_Templer_LEAVENOW_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_LEAVENOW_Info_15_01"); //¡No, no te entiendo!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_02"); //Bueno, entonces intentaré decirlo con mayor claridad.
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_03"); //¡Largo!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_04"); //¡Abandona esta mina!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_05"); //¡No vuelvas a dirigirme la palabra!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_06"); //¡Esfúmate! ¡Déjame en paz!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_07"); //¡PIÉRDETE!
	AI_StopProcessInfos	( self );
};

