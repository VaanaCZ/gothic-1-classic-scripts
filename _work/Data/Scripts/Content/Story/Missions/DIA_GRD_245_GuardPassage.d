// **************************************
//					EXIT 
// **************************************

instance DIA_GRD_245_Exit (C_INFO)
{
	npc			= GRD_245_Gardist;
	nr			= 999;
	condition	= DIA_GRD_245_Exit_Condition;
	information	= DIA_GRD_245_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_GRD_245_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_GRD_245_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				PERM
// **************************************

instance DIA_GRD_245_Hello (C_INFO)
{
	npc			= GRD_245_Gardist;
	nr			= 1;
	condition	= DIA_GRD_245_Hello_Condition;
	information	= DIA_GRD_245_Hello_Info;
	permanent	= 1;
	description	= "Cosa c'è in questa casa?";
};                       

FUNC int DIA_GRD_245_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_GRD_245_Hello_Info()
{
	AI_Output (other, self,"DIA_GRD_245_Hello_15_00"); //Cosa c'è in questa casa?
	AI_Output (self, other,"DIA_GRD_245_Hello_13_01"); //Questa è l'abitazione dei baroni delle miniere. Se decidi di entrare, farai meglio a comportarti come si deve!
};

