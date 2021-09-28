// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Vlk_534_Exit (C_INFO)
{
	npc			= Vlk_534_Buddler;
	nr			= 999;
	condition	= DIA_Vlk_534_Exit_Condition;
	information	= DIA_Vlk_534_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Vlk_534_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Vlk_534_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Lass mich in Ruhe!
// **************************************************

INSTANCE DIA_Vlk_534_LeaveMe (C_INFO)
{
	npc				= Vlk_534_Buddler;
	nr				= 1;
	condition		= DIA_Vlk_534_LeaveMe_Condition;
	information		= DIA_Vlk_534_LeaveMe_Info;
	permanent		= 1;
	description		= "�Por qu� est�s aqu� y no en el Campamento?";
};

FUNC INT DIA_Vlk_534_LeaveMe_Condition()
{	
	return 1;
};

FUNC VOID DIA_Vlk_534_LeaveMe_Info()
{
	AI_Output (other, self,"DIA_Vlk_534_LeaveMe_15_00"); //�Por qu� est�s aqu� en lugar de en el Campamento?
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_01"); //Estoy esperando a que un amigo vuelva de la mina. Me debe algo de mineral.
	AI_Output (self, other,"DIA_Vlk_534_LeaveMe_02_02"); //No puedo presentarme en el Campamento sin el mineral; no podr�a pagar a los guardias por la protecci�n y las cosas se pondr�an realmente feas para m�.

	AI_StopProcessInfos	(self);
};
