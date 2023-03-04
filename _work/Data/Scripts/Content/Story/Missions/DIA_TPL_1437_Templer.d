
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
	description		= "Ca va ?"; 
};

FUNC int  Tpl_1437_Templer_NERV_Condition()
{
	return TRUE;
};


FUNC void  Tpl_1437_Templer_NERV_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_NERV_Info_15_01"); //Ca va ?
	AI_Output (self, other,"Tpl_1437_Templer_NERV_Info_13_02"); //Écoutes, as-tu vraiment besoin d'aborder tout le monde ici ?
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
	description		= "Tout ca bien ?"; 
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
	AI_Output (other, self,"Tpl_1437_Templer_LEAVE_Info_15_01"); //Tout ca bien ?
	AI_Output (self, other,"Tpl_1437_Templer_LEAVE_Info_13_02"); //Je veux la paix, vu ? Alors, dégage loin de ma vue et va faire autre chose - n'importe quoi !
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
	description		= "Non, je ne te comprends pas !"; 
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
	AI_Output (other, self,"Tpl_1437_Templer_LEAVENOW_Info_15_01"); //Non, je ne te comprends pas !
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_02"); //Bon, j'essayerai de t'expliquer.
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_03"); //Fous le camp !
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_04"); //Quitte cette mine !
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_05"); //Ne m'adresse plus jamais la parole !
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_06"); //Dégage loin ! Laisse-moi seul !
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_07"); //FOUS LE CAMP ! !
	AI_StopProcessInfos	( self );
};

