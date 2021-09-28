// ************************ EXIT **************************

instance  GRD_261_Brandick_Exit (C_INFO)
{
	npc			=  GRD_261_Brandick;
	nr			= 999;
	condition	=  GRD_261_Brandick_Exit_Condition;
	information	=  GRD_261_Brandick_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  GRD_261_Brandick_Exit_Condition()
{
	return 1;
};

FUNC VOID  GRD_261_Brandick_Exit_Info()
{
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  GRD_261_Brandick_ALEPH (C_INFO)
{
	npc				= GRD_261_Brandick;
	condition		= GRD_261_Brandick_ALEPH_Condition;
	information		= GRD_261_Brandick_ALEPH_Info;
	important		= 0;
	permanent		= 0;
	description		= "(lamentati di Aleph)"; 
};

FUNC int  GRD_261_Brandick_ALEPH_Condition()
{	
	if ( Npc_KnowsInfo ( hero, VLK_585_Aleph_GUARDS) )
	{
		return 1;
	};

};
FUNC void  GRD_261_Brandick_ALEPH_Info()
{
	AI_Output			(other, self,"GRD_261_Brandick_ALEPH_Info_15_01"); //Ascolta. Quando non ci sei, Aleph passa tutto il tempo seduto a far niente.
	AI_Output			(self, other,"GRD_261_Brandick_ALEPH_Info_06_02"); //Davvero?
	AI_Output			(self, other,"GRD_261_Brandick_ALEPH_Info_06_03"); //Sai cosa mi fa più schifo dei perdigiorno? Le spie! Sparisci!
	
	AI_StopProcessInfos	(self);
};  
