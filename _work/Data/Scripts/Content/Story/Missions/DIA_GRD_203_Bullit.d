//******************************************
//					EXIT	
//******************************************

instance  DIA_Bullit_Exit (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 999;
	condition	= DIA_Bullit_Exit_Condition;
	information	= DIA_Bullit_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Bullit_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Bullit_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//******************************************
//					First	
//******************************************

instance  DIA_Bullit_First (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 1;
	condition	= DIA_Bullit_First_Condition;
	information	= DIA_Bullit_First_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int  DIA_Bullit_First_Condition()
{
	return 1;
};

FUNC VOID  DIA_Bullit_First_Info()
{
	AI_Output (self, other,"DIA_Bullit_First_06_00"); //Kohopak to tady m�me? Nen� to ten hoch, kter�ho jsem kdysi pok�til? Co chce�? Vrac� se a chce� je�t� v�c?
};

//******************************************
//				Aufs Maul
//******************************************

instance  DIA_Bullit_AufsMAul (C_INFO)
{
	npc			= GRD_203_Bullit;
	nr			= 1;
	condition	= DIA_Bullit_AufsMAul_Condition;
	information	= DIA_Bullit_AufsMAul_Info;
	permanent	= 0;
	description = "P�i�el jsem, abych ti zacpal tu tvoj� velkou hubu.";
};                       

FUNC int  DIA_Bullit_AufsMAul_Condition()
{
	return 1;
};

FUNC VOID  DIA_Bullit_AufsMAul_Info()
{
	AI_Output (other, self,"DIA_Bullit_AufsMAul_15_00"); //P�i�el jsem, abych ti zacpal tu tvoji velkou hubu.
	AI_Output (self, other,"DIA_Bullit_AufsMAul_06_01"); //Ha, tak poj� a zkus to, zlat��ko!
	
	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget (self, other); 
	AI_StartState (self, ZS_Attack, 1, "");
};

// *****************************************************
// 				Wartet auf den SC
// *****************************************************

instance  DIA_GRD_203_Bullit_Wait4SC (C_INFO)
{
	npc				= GRD_203_Bullit;
	condition		= DIA_GRD_203_Bullit_Wait4SC_Condition;
	information		= DIA_GRD_203_Bullit_Wait4SC_Info;
	important		= 1;	
	permanent		= 0;
};

FUNC int  DIA_GRD_203_Bullit_Wait4SC_Condition()
{	
	if( Npc_KnowsInfo (hero, Info_Xardas_LOADSWORD02 ) )
	{
		return 1;
	};
};

func void  DIA_GRD_203_Bullit_Wait4SC_Info()
{
	AI_Output (self, other,"DIA_GRD_203_Bullit_Wait4SC_06_01"); //Zase ty! M�l jsem t� utopit v jeze�e hned, jak jsem t� poprv� uvid�l!
	AI_Output (other, self,"DIA_GRD_203_Bullit_Wait4SC_15_02"); //Tehdy jsem nem�l �anci - te� se ale karta obr�tila.
	AI_Output (self, other,"DIA_GRD_203_Bullit_Wait4SC_06_03"); //Ty �erve! Jenom douf�m, �e mi to tentokr�t tolik neusnadn� jako poprv�!
		
	AI_StopProcessInfos	( self );

	self.guild 	= GIL_GRD;
	Npc_SetTrueGuild	( self, GIL_GRD );	

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );
	
	Npc_SetTarget 	( self, other ); 
	AI_StartState 	( self, ZS_Attack, 1, "");
}; 
