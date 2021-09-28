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
	AI_Output (self, other,"DIA_Sld_702_First_04_00"); //Lo sai dove stai andando?
	AI_Output (other, self,"DIA_Sld_702_First_15_01"); //Dove?
	AI_Output (self, other,"DIA_Sld_702_First_04_02"); //Stai andando dritto da Lee, il nostro capo.
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
	description = "Cosa devo fare per parlare con Lee?";
};                       

FUNC int DIA_Sld_702_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Sld_702_PERM_Info()
{
	AI_Output (other, self,"DIA_Sld_702_PERM_15_00"); //Cosa devo fare per parlare con Lee?
	AI_Output (self, other,"DIA_Sld_702_PERM_04_01"); //Niente!
	AI_Output (self, other,"DIA_Sld_702_PERM_04_02"); //Questo non è Campo Vecchio e Lee non è Gomez!
	AI_Output (self, other,"DIA_Sld_702_PERM_04_03"); //Non ha bisogno di nascondersi dietro un esercito di scagnozzi. Sa difendersi da solo.
	AI_Output (self, other,"DIA_Sld_702_PERM_04_04"); //NOI siamo qui solo in caso abbia bisogno d'aiuto.
};



