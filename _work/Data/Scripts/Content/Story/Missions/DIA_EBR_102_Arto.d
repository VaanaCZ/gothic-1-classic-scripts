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
	description = "¿Quién eres?";
};                       

FUNC INT DIA_ARTO_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_ARTO_Hello_Info()
{	
	AI_Output (other, self,"DIA_ARTO_Hello_15_00"); //¿Quién eres?
	AI_Output (self, other,"DIA_ARTO_Hello_13_01"); //Soy Arto.
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
	description = "¿Qué haces aquí?";
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
	AI_Output (other, self,"DIA_ARTO_What_15_00"); //¿Qué haces aquí?
	AI_Output (self, other,"DIA_ARTO_What_13_01"); //Soy el guardaespaldas de Gómez.
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
	description = "No hablas mucho, ¿verdad?";
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
	AI_Output (other, self,"DIA_ARTO_PERM_15_00"); //No hablas mucho, ¿verdad?
	AI_Output (self, other,"DIA_ARTO_PERM_13_01"); //No.
};

