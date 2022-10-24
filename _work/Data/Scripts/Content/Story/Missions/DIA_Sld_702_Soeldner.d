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
	AI_Output (self, other,"DIA_Sld_702_First_04_00"); //Ты сам знаешь, куда ты идешь?
	AI_Output (other, self,"DIA_Sld_702_First_15_01"); //И куда?
	AI_Output (self, other,"DIA_Sld_702_First_04_02"); //Ты идешь к нашему предводителю, Ли.
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
	description = "А что я должен сделать, чтобы ты пропустил меня к Ли?";
};                       

FUNC int DIA_Sld_702_PERM_Condition()
{
	return 1;
};

FUNC VOID  DIA_Sld_702_PERM_Info()
{
	AI_Output (other, self,"DIA_Sld_702_PERM_15_00"); //А что я должен сделать, чтобы ты пропустил меня к Ли?
	AI_Output (self, other,"DIA_Sld_702_PERM_04_01"); //Ничего!
	AI_Output (self, other,"DIA_Sld_702_PERM_04_02"); //Здесь тебе не Старый лагерь, а Ли не такой, как Гомез.
	AI_Output (self, other,"DIA_Sld_702_PERM_04_03"); //Ему не нужна толпа прислужников, за которыми можно спрятаться. Он и сам сможет себя защитить.
	AI_Output (self, other,"DIA_Sld_702_PERM_04_04"); //Мы охраняем его и помогаем только тогда, когда это действительно нужно.
};



