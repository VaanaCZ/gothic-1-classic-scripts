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
	AI_Output (self, other,"DIA_Sld_702_First_04_00"); //Sais-tu où tu vas ?
	AI_Output (other, self,"DIA_Sld_702_First_15_01"); //Où ?
	AI_Output (self, other,"DIA_Sld_702_First_04_02"); //Tu te diriges directement sur Lee, notre chef.
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
	description = "Que dois-je faire pour que tu me laisses voir Lee ?";
};                       

FUNC int DIA_Sld_702_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Sld_702_PERM_Info()
{
	AI_Output (other, self,"DIA_Sld_702_PERM_15_00"); //Que dois-je faire pour que tu me laisses voir Lee ?
	AI_Output (self, other,"DIA_Sld_702_PERM_04_01"); //Rien !
	AI_Output (self, other,"DIA_Sld_702_PERM_04_02"); //Ce n'est pas le Vieux camp, et Lee n'est pas Gomez !
	AI_Output (self, other,"DIA_Sld_702_PERM_04_03"); //Il n'a pas besoin d'une armée de partisans pour se cacher. Il peut se défendre.
	AI_Output (self, other,"DIA_Sld_702_PERM_04_04"); //NOUS sommes seulement ici au cas où il aurait besoin de nous.
};



