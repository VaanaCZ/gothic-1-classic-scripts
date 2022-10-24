// ********************************
// 				EXIT
// ********************************

instance DIA_Gilbert_EXIT (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 999;
	condition	= DIA_Gilbert_EXIT_Condition;
	information	= DIA_Gilbert_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Gilbert_First (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_First_Condition;
	information	= DIA_Gilbert_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Gilbert_First_Condition()
{
	if (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Gilbert_First_Info()
{
	AI_Output (self, other,"DIA_Gilbert_First_04_00"); //Что ты здесь делаешь? Редко кто заходит ко мне сюда, хе-хе!
	AI_Output (self, other,"DIA_Gilbert_First_04_01"); //Тебе удалось найти мое убежище, что не многим под силу.
	
	B_GiveXP(XP_GilbertFound);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Gilbert_Hallo (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_Hallo_Condition;
	information	= DIA_Gilbert_Hallo_Info;
	permanent	= 1;
	description = "Что ты здесь делаешь?";
};                       

FUNC int DIA_Gilbert_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Hallo_15_00"); //Что ты здесь делаешь?
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_01"); //Старый лагерь мне давно надоел. У нас давние разногласия с людьми Гомеза. Как давно это все началось...
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_02"); //Теперь обо мне, наверное, никто и не помнит. Но я все равно останусь здесь. В Старом лагере стало слишком много солдатни.
};




