// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Senyan_EXIT(C_INFO)
{
	npc			= SFB_1000_Senyan;
	nr			= 999;
	condition	= DIA_Senyan_EXIT_Condition;
	information	= DIA_Senyan_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Senyan_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Senyan_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_Senyan_Hello(C_INFO)
{
	npc			= SFB_1000_Senyan;
	nr			= 1;
	condition	= DIA_Senyan_Hello_Condition;
	information	= DIA_Senyan_Hello_Info;
	permanent	= 0;
	description = "Ты со Свободной Шахты, верно?";
};                       

FUNC INT DIA_Senyan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Senyan_Hello_Info()
{	
	AI_Output (other, self,"DIA_Senyan_Hello_15_00"); //Ты со Свободной Шахты, верно?
	AI_Output (self, other,"DIA_Senyan_Hello_01_01"); //Верно. Как ты узнал?
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 							Hallo
// ************************************************************

INSTANCE DIA_Senyan_JustTalk(C_INFO)
{
	npc			= SFB_1000_Senyan;
	nr			= 1;
	condition	= DIA_Senyan_JustTalk_Condition;
	information	= DIA_Senyan_JustTalk_Info;
	permanent	= 1;
	description = "Я хотел бы поговорить с тобой.";
};                       

FUNC INT DIA_Senyan_JustTalk_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Senyan_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Senyan_JustTalk_Info()
{	
	AI_Output (other, self,"DIA_Senyan_JustTalk_15_00"); //Я хотел бы поговорить с тобой.
	AI_Output (self, other,"DIA_Senyan_JustTalk_01_01"); //Я здесь не для того, чтобы разговаривать.
	AI_StopProcessInfos	(self);
};
