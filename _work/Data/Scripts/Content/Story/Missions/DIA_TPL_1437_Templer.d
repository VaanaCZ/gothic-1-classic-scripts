
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
	description		= "Co se d�je?"; 
};

FUNC int  Tpl_1437_Templer_NERV_Condition()
{
	return TRUE;
};


FUNC void  Tpl_1437_Templer_NERV_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_NERV_Info_15_01"); //Co se d�je?
	AI_Output (self, other,"Tpl_1437_Templer_NERV_Info_13_02"); //Poslouchej, opravdu tady mus� ka�d�ho otravovat?
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
	description		= "V�echno v po��dku?"; 
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
	AI_Output (other, self,"Tpl_1437_Templer_LEAVE_Info_15_01"); //V�echno v po��dku?
	AI_Output (self, other,"Tpl_1437_Templer_LEAVE_Info_13_02"); //Chci sv�j klid, jasn�? Tak se kli� a d�lej n�co - jin�ho!
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
	description		= "Ne, nerozum�m ti!"; 
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
	AI_Output (other, self,"Tpl_1437_Templer_LEAVENOW_Info_15_01"); //Ne, nerozum�m ti!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_02"); //Dobr�, pokus�m se ti to teda vysv�tlit.
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_03"); //Vypadni!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_04"); //Odejdi z dolu!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_05"); //NIKDY m� u� neoslovuj!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_06"); //Vypadni! Nech m� o samot�!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_07"); //ZTRA� SE!!
	AI_StopProcessInfos	( self );
};

