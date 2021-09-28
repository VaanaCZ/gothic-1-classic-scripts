// ********************************
// 				EXIT
// ********************************

instance DIA_Sld_702_EXIT (C_INFO)
{
	npc			= Sld_702_Soeldner;
	nr			= 999;
	condition	= DIA_Sld_702_EXIT_Condition;
	information	= DIA_Sld_702_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Sld_702_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Sld_702_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Sld_702_First (C_INFO)
{
	npc			= Sld_702_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_702_First_Condition;
	information	= DIA_Sld_702_First_Info;
	permanent	= 0;
	important	= 1;
};                       

FUNC int DIA_Sld_702_First_Condition()
{
	if (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Sld_702_First_Info()
{
	AI_Output (self, other,"DIA_Sld_702_First_04_00"); //�Sabes ad�nde vas?
	AI_Output (other, self,"DIA_Sld_702_First_15_01"); //�Ad�nde?
	AI_Output (self, other,"DIA_Sld_702_First_04_02"); //Vas derechito a nuestro l�der, Lee.
};

// ********************************
// 				PERM
// ********************************

instance DIA_Sld_702_PERM (C_INFO)
{
	npc			= Sld_702_Soeldner;
	nr			= 1;
	condition	= DIA_Sld_702_PERM_Condition;
	information	= DIA_Sld_702_PERM_Info;
	permanent	= 1;
	description = "�Qu� tengo que hacer para que me dejes ver a Lee?";
};                       

FUNC int DIA_Sld_702_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Sld_702_PERM_Info()
{
	AI_Output (other, self,"DIA_Sld_702_PERM_15_00"); //�Qu� tengo que hacer para que me permitas ver a Lee?
	AI_Output (self, other,"DIA_Sld_702_PERM_04_01"); //�Nada!
	AI_Output (self, other,"DIA_Sld_702_PERM_04_02"); //�Esto no es el Campamento Viejo y Lee no es G�mez!
	AI_Output (self, other,"DIA_Sld_702_PERM_04_03"); //No necesita un ej�rcito de guardaespaldas tras el que esconderse. Puede defenderse �l solo.
	AI_Output (self, other,"DIA_Sld_702_PERM_04_04"); //Nosotros s�lo estamos aqu� por si nos necesita.
};



