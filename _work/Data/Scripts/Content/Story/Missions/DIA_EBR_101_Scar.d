// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_SCAR_EXIT(C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 999;
	condition	= DIA_SCAR_EXIT_Condition;
	information	= DIA_SCAR_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SCAR_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_SCAR_Hello (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Hello_Condition;
	information	= DIA_SCAR_Hello_Info;
	permanent	= 0;
	description = "�Qui�n eres?";
};                       

FUNC INT DIA_SCAR_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_Hello_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Hello_15_00"); //�Qui�n eres?
	AI_Output (self, other,"DIA_SCAR_Hello_08_01"); //Me llaman Scar.
};

// ************************************************************
// 							What
// ************************************************************

INSTANCE DIA_SCAR_What (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_What_Condition;
	information	= DIA_SCAR_What_Info;
	permanent	= 0;
	description = "�En qu� trabajas?";
};                       

FUNC INT DIA_SCAR_What_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_What_Info()
{	
	AI_Output (other, self,"DIA_SCAR_What_15_00"); //�En qu� trabajas?
	AI_Output (self, other,"DIA_SCAR_What_08_01"); //Arto y yo hacemos que nadie vea a G�mez a menos que est� invitado.
	AI_Output (self, other,"DIA_SCAR_What_08_02"); //Y tambi�n hacemos que las mujeres no se inquieten.
};

// ************************************************************
// 							Frau
// ************************************************************

INSTANCE DIA_SCAR_Frau (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_Frau_Condition;
	information	= DIA_SCAR_Frau_Info;
	permanent	= 0;
	description = "Cuando me metieron aqu�, vi que tra�an a una mujer...";
};                       

FUNC INT DIA_SCAR_Frau_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_What))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_Frau_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Frau_15_00"); //Cuando me metieron aqu�, vi que tra�an a una mujer junto a las mercanc�as.
	AI_Output (self, other,"DIA_SCAR_Frau_08_01"); //�Y qu�?
	AI_Output (other, self,"DIA_SCAR_Frau_15_02"); //�Est� ella aqu�?
	AI_Output (self, other,"DIA_SCAR_Frau_08_03"); //Mira, d�jame darte un consejo por si est�s interesado en ella: olv�dala.
	AI_Output (self, other,"DIA_SCAR_Frau_08_04"); //Acaba de llegar y G�mez la tiene encerrada en su alcoba.
	AI_Output (self, other,"DIA_SCAR_Frau_08_05"); //Cuando haya acabado con ella, tal vez la env�e abajo. Pero por ahora es SUYA, as� que ser� mejor que te olvides de ella.
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE DIA_SCAR_PERM (C_INFO)
{
	npc			= Ebr_101_Scar;
	nr			= 3;
	condition	= DIA_SCAR_PERM_Condition;
	information	= DIA_SCAR_PERM_Info;
	permanent	= 1;
	description = "�Me puedes decir algo sobre G�mez?";
};                       

FUNC INT DIA_SCAR_PERM_Condition()
{
	if (Npc_KnowsInfo (hero,DIA_SCAR_Frau))
	{
		return 1;
	};
};

FUNC VOID DIA_SCAR_PERM_Info()
{	
	AI_Output (other, self,"DIA_SCAR_PERM_15_00"); //�Me puedes decir algo sobre G�mez?
	AI_Output (self, other,"DIA_SCAR_PERM_08_01"); //S�lo necesitas saber que es el hombre m�s poderoso de la colonia.
	AI_Output (self, other,"DIA_SCAR_PERM_08_02"); //Consigue todo lo que quiere, y lo que de verdad quiere es poder.
};

