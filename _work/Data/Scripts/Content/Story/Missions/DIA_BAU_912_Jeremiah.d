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
	description = "Чем ты занимаешься?";
};                       

FUNC int DIA_Jeremiah_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_Hallo_15_00"); //Что ты делаешь?
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_01"); //Готовлю рисовый шнапс, парень.
	AI_Output (self, other,"DIA_Jeremiah_Hallo_04_02"); //Вот, возьми бутыку. Только не говори Силасу.
	
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
	description = "Как идут дела?";
};                       

FUNC int DIA_Jeremiah_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Jeremiah_PERM_Info()
{
	AI_Output (other, self,"DIA_Jeremiah_PERM_15_00"); //Как идут дела?
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_01"); //Я едва поспеваю с этими типами. Боже, сколько же они пьют!
	AI_Output (self, other,"DIA_Jeremiah_PERM_04_02"); //Но это к лучшему. Пока я занят делом, шакалы нашего Лорда стараются мне не мешать.
	
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
	description = "Расскажи мне о Лорде.";
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
	AI_Output (other, self,"DIA_Jeremiah_Horatio_15_00"); //Расскажи мне о Лорде.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_01"); //Проклятая свинья! Его головорезы выбирают тех, кто послабее, и заставляют их работать на полях.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_02"); //Единственный, кто мог бы противостоять ему, - это Горацио.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_03"); //Я слышал однажды, как он говорил, что с удовольствием вбил бы тупую голову нашего Лорда в плечи по самые уши... Но он никогда этого не сделает.
	AI_Output (self, other,"DIA_Jeremiah_Horatio_04_04"); //Это против его убеждений.
};

