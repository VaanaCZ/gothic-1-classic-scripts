// ********************************
// 				EXIT
// ********************************

instance DIA_Jeremiah_EXIT (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 999;
	condition	= DIA_Jeremiah_EXIT_Condition;
	information	= DIA_Jeremiah_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Jeremiah_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Jeremiah_Hallo (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_Hallo_Condition;
	information	= DIA_Jeremiah_Hallo_Info;
	permanent	= 0;
	description = "Que fais-tu ?";
};                       

FUNC int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Hallo_15_00"); //Que fais-tu ?
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_01"); //Je fais de l'alcool de riz, mon garçon
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_02"); //Ici - prends une bouteille. Mais ne le dis pas à Silas..
	
	CreateInvItems	(self, ItFoBooze, 1);
	B_GiveInvItems	(self, other, ItFoBooze, 1);
};

// ********************************
// 				PERM
// ********************************
	var int Jeremiah_Bauer; //NUR lokal benutzt - wegen perm-info-condition Umgehung
// ********************************

instance DIA_Jeremiah_PERM (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 1;
	condition	= DIA_Jeremiah_PERM_Condition;
	information	= DIA_Jeremiah_PERM_Info;
	permanent	= 1;
	description = "Comment va la distillerie ?";
};                       

FUNC int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_PERM_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_PERM_15_00"); //Comment va la distillerie ?
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_01"); //J'ai de la peine à les suivre. Qu'est-ce qu'ils boivent !
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_02"); //C'est vraiment une bonne chose. Tant que je suis occupé, les serviteurs du Seigneur du riz me laissent tout seul.
	
	Jeremiah_Bauer = TRUE;
};

// ********************************
// 				Horatio
// ********************************

instance DIA_Jeremiah_Horatio (C_INFO)
{
	npc			= Bau_912_Jeremiah;
	nr			= 2;
	condition	= DIA_Jeremiah_Horatio_Condition;
	information	= DIA_Jeremiah_Horatio_Info;
	permanent	= 0;
	description = "Que peux-tu me dire sur le Seigneur du Riz ?";
};                       

FUNC int DIA_Jeremiah_Horatio_Condition()
{
	if (Jeremiah_Bauer == TRUE)
	{
		return 1;
	};
};

FUNC VOID  DIA_Jeremiah_Horatio_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Horatio_15_00"); //Que peux-tu me dire sur le Seigneur du Riz ?
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_01"); //C'est un fichu porc ! Ses bandits sélectionnent les faibles et les forcent à travailler dans les champs.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_02"); //Le seul qui pourrait lui tenir tête c'est Horatio. Mais ce n'est pas un violent.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_03"); //J'ai par le passé entendu dire qu'il voulait casser la tête du Seigneur du riz, mais il ne l'a jamais fait.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_04"); //ça allait contre sa croyance.
};

