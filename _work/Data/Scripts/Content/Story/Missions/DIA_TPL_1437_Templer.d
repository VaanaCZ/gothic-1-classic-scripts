
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
	description		= "Co s³ychaæ?"; 
};

FUNC int  Tpl_1437_Templer_NERV_Condition()
{
	return TRUE;
};


FUNC void  Tpl_1437_Templer_NERV_Info()
{
	AI_Output (other, self,"Tpl_1437_Templer_NERV_Info_15_01"); //Co s³ychaæ?
	AI_Output (self, other,"Tpl_1437_Templer_NERV_Info_13_02"); //S³uchaj, móg³byœ przestaæ zawracaæ nam g³owê?
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
	description		= "Wszystko w porz¹dku?"; 
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
	AI_Output (other, self,"Tpl_1437_Templer_LEAVE_Info_15_01"); //Wszystko w porz¹dku?
	AI_Output (self, other,"Tpl_1437_Templer_LEAVE_Info_13_02"); //Potrzebujê chwili spokoju, jasne? IdŸ st¹d i zajmij siê czymœ po¿ytecznym!
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
	description		= "Nie rozumiem!"; 
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
	AI_Output (other, self,"Tpl_1437_Templer_LEAVENOW_Info_15_01"); //Nie rozumiem!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_02"); //No to spróbujê wyra¿aæ siê jaœniej.
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_03"); //SPADAJ!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_04"); //Opuœæ tê kopalniê!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_05"); //NIGDY WIÊCEJ SIÊ DO MNIE NIE ODZYWAJ!
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_06"); //IdŸ sobie! Zostaw mnie w spokoju.
	AI_Output (self, other,"Tpl_1437_Templer_LEAVENOW_Info_13_07"); //SPADAJ ST¥D!
	AI_StopProcessInfos	( self );
};

