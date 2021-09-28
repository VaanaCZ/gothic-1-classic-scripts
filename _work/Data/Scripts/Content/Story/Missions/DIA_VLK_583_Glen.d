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
	description		= "¿Qué debo tener presente cuando esté en la mina?"; 
};

FUNC int  VLK_583_Glen_INFO_Condition()
{
	return 1;
};


FUNC void  VLK_583_Glen_INFO_Info()
{
	AI_Output (other, self,"VLK_583_Glen_INFO_Info_15_01"); //¿Qué debería tener presente cuando esté en la mina?
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_02"); //Ten cuidado con los reptadores.
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_03"); //Cuanto más abajo llegues, más cerca estarás de las bestias. ¡Esas repugnantes criaturas vienen derechitas del reino de Beliar!
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_04"); //Se las puede oír raspar y rascar. Se quedan sentadas en la oscuridad, esperándote. Las he visto matar...
	AI_Output (self, other,"VLK_583_Glen_INFO_Info_02_05"); //Son despiadadas y veloces. Si te gusta la vida, no deberías estar aquí abajo. Será mejor que te marches antes de que te ocurra algo.
};  
// ***************** Infos *****************************

instance  VLK_583_Glen_LOCKPICK (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_LOCKPICK_Condition;
	information	=  VLK_583_Glen_LOCKPICK_Info;
	important	= 0;	
	permanent	= 0;
	description = "Tengo entendido que aquí puedo comprar ganzúas.";
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
	AI_Output (other, self,"VLK_583_Glen_LOCKPICK_15_01"); //Me dijeron que aquí abajo podría conseguir ganzúas.
	AI_Output (self, other,"VLK_583_Glen_LOCKPICK_02_02"); //Bueno, dado que fuiste lo bastante listo como para averiguar eso, puedo venderte alguna. 10 pepitas cada una.
	
	
};
// ***************** Infos *****************************

instance  VLK_583_Glen_BUY (C_INFO)
{
	npc			=  VLK_583_Glen;
	condition	=  VLK_583_Glen_BUY_Condition;
	information	=  VLK_583_Glen_BUY_Info;
	important	= 0;	
	permanent	= 1;
	description = "(Comprar ganzúas)";
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
	AI_Output (other, self,"VLK_583_Glen_BUY_Info_15_01"); //Quiero comprar unas ganzúas.
	
	
	
};
