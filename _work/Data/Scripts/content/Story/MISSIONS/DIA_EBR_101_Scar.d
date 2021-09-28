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
	description = "Ты кто?";
};                       

FUNC INT DIA_SCAR_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_Hello_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Hello_15_00"); //Ты кто?
	AI_Output (self, other,"DIA_SCAR_Hello_08_01"); //Все называют меня Шрам.
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
	description = "И чем ты занимаешься?";
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
	AI_Output (other, self,"DIA_SCAR_What_15_00"); //И чем ты занимаешься?
	AI_Output (self, other,"DIA_SCAR_What_08_01"); //Я и мой напарник Арто следим за тем, чтобы к Гомезу не заходили непрошенные гости.
	AI_Output (self, other,"DIA_SCAR_What_08_02"); //Еще мы заботимся о том, чтобы никто не подходил к женщинам слишком близко.
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
	description = "Когда меня отправляли сюда, я видел женщину.";
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
	AI_Output (other, self,"DIA_SCAR_Frau_15_00"); //Когда меня отправляли сюда, я видел женщину на платформе с товаром.
	AI_Output (self, other,"DIA_SCAR_Frau_08_01"); //Ну и что?
	AI_Output (other, self,"DIA_SCAR_Frau_15_02"); //Она здесь?
	AI_Output (self, other,"DIA_SCAR_Frau_08_03"); //Если она тебе понравилась, мой тебе совет: забудь о ней.
	AI_Output (self, other,"DIA_SCAR_Frau_08_04"); //Как только она здесь появилась, Гомез отвел ее в свою комнату и запер там.
	AI_Output (self, other,"DIA_SCAR_Frau_08_05"); //Когда она ему надоест, он отправит ее вниз. Но пока она принадлежит ему, так что лучше перестань о ней вспоминать.
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
	description = "Что ты знаешь о Гомезе?";
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
	AI_Output (other, self,"DIA_SCAR_PERM_15_00"); //Что ты знаешь о Гомезе?
	AI_Output (self, other,"DIA_SCAR_PERM_08_01"); //Я могу сказать тебе только то, что он один из самых влиятельных людей колонии.
	AI_Output (self, other,"DIA_SCAR_PERM_08_02"); //Он может получить все, что хочет, но единственное, что ему действительно нужно - это власть.
};

