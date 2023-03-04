// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_ARTO_EXIT(C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 999;
	condition	= DIA_ARTO_EXIT_Condition;
	information	= DIA_ARTO_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_ARTO_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_ARTO_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_ARTO_Hello (C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 3;
	condition	= DIA_ARTO_Hello_Condition;
	information	= DIA_ARTO_Hello_Info;
	permanent	= 0;
	description = "Qui es-tu ?";
};                       

FUNC INT DIA_ARTO_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_ARTO_Hello_Info()
{	
	AI_Output (other, self,"DIA_ARTO_Hello_15_00"); //Qui es-tu ?
	AI_Output (self, other,"DIA_ARTO_Hello_13_01"); //Je m'appelle Arto.
};

// ************************************************************
// 							What
// ************************************************************

INSTANCE DIA_ARTO_What (C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 3;
	condition	= DIA_ARTO_What_Condition;
	information	= DIA_ARTO_What_Info;
	permanent	= 0;
	description = "Que fais-tu par ici ?";
};                       

FUNC INT DIA_ARTO_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_ARTO_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_ARTO_What_Info()
{	
	AI_Output (other, self,"DIA_ARTO_What_15_00"); //Que fais-tu ici?
	AI_Output (self, other,"DIA_ARTO_What_13_01"); //Je suis le garde du corps de Gomez
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_ARTO_PERM (C_INFO)
{
	npc			= Ebr_102_Arto;
	nr			= 3;
	condition	= DIA_ARTO_PERM_Condition;
	information	= DIA_ARTO_PERM_Info;
	permanent	= 1;
	description = "Tu ne parles pas beaucoup, n'est-ce pas ?";
};                       

FUNC INT DIA_ARTO_PERM_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_ARTO_What))
	{
		return 1;
	};
};

FUNC VOID DIA_ARTO_PERM_Info()
{	
	AI_Output (other, self,"DIA_ARTO_PERM_15_00"); //Tu ne parles pas beaucoup, n'est-ce pas ?
	AI_Output (self, other,"DIA_ARTO_PERM_13_01"); //Non
};

