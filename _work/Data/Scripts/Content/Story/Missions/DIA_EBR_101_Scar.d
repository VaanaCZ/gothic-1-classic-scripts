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
	description = "Как тебя зовут?";
};                       

FUNC INT DIA_SCAR_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_Hello_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Hello_15_00"); //Кто ты?
	AI_Output (self, other,"DIA_SCAR_Hello_08_01"); //Меня называют Шрам.
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
	description = "Чем ты занимаешься?";
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
	AI_Output (other, self,"DIA_SCAR_What_15_00"); //Чем ты занимаешься?
	AI_Output (self, other,"DIA_SCAR_What_08_01"); //Мы с Арто следим за тем, чтобы никто не заходил к Гомезу без приглашения.
	AI_Output (self, other,"DIA_SCAR_What_08_02"); //И еще я слежу за тем, чтобы никто не беспокоил женщин.
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
	description = "Когда меня зашвырнули сюда, я видел женщину...";
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
	AI_Output (other, self,"DIA_SCAR_Frau_15_00"); //Когда меня зашвырнули сюда, я видел женщину, которую отправляли на платформе с товарами.
	AI_Output (self, other,"DIA_SCAR_Frau_08_01"); //И что?
	AI_Output (other, self,"DIA_SCAR_Frau_15_02"); //Она здесь?
	AI_Output (self, other,"DIA_SCAR_Frau_08_03"); //Послушай, на тот случай, если она заинтересовала тебя, позволь дать небольшой совет: забудь о ней.
	AI_Output (self, other,"DIA_SCAR_Frau_08_04"); //Как только эта женщина появилась здесь, Гомез запер ее в своей комнате.
	AI_Output (self, other,"DIA_SCAR_Frau_08_05"); //Когда она ему надоест, Гомез может просто отправить ее вниз. Но пока она принадлежит ЕМУ, так что не забивай себе голову всякой ерундой, понял?
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
	description = "Что ты можешь сказать о Гомезе?";
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
	AI_Output (other, self,"DIA_SCAR_PERM_15_00"); //Что ты можешь сказать о Гомезе?
	AI_Output (self, other,"DIA_SCAR_PERM_08_01"); //Главное, что тебе нужно знать: он самый влиятельный человек в колонии.
	AI_Output (self, other,"DIA_SCAR_PERM_08_02"); //Он получает все, чего хочет, а больше всего он хочет власти.
};

