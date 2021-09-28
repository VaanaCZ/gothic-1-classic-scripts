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
	description = "Vieni dalla miniera libera, vero?";
};                       

FUNC INT DIA_Senyan_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Senyan_Hello_Info()
{	
	AI_Output (other, self,"DIA_Senyan_Hello_15_00"); //Vieni dalla miniera libera, vero?
	AI_Output (self, other,"DIA_Senyan_Hello_01_01"); //Esatto. Come hai fatto a capirlo?
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
	description = "Devo parlarti.";
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
	AI_Output (other, self,"DIA_Senyan_JustTalk_15_00"); //Devo parlarti.
	AI_Output (self, other,"DIA_Senyan_JustTalk_01_01"); //Non sono qui per parlare.
	AI_StopProcessInfos	(self);
};
