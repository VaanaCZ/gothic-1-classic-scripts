// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Tpl_1416_Torwache_Exit (C_INFO)
{
	npc			= Tpl_1416_Templer;
	nr			= 999;
	condition	= DIA_Tpl_1416_Torwache_Exit_Condition;
	information	= DIA_Tpl_1416_Torwache_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Tpl_1416_Torwache_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Tpl_1416_Torwache_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Wie ist das Leben hier
// **************************************************

INSTANCE DIA_Tpl_1416_Torwache_Life (C_INFO)
{
	npc				= Tpl_1416_Templer;
	nr				= 1;
	condition		= DIA_Tpl_1416_Torwache_Life_Condition;
	information		= DIA_Tpl_1416_Torwache_Life_Info;
	permanent		= 1;
	description		= "Как живут Стражи Братства?";
};

FUNC INT DIA_Tpl_1416_Torwache_Life_Condition()
{	
	return 1;
};

FUNC VOID DIA_Tpl_1416_Torwache_Life_Info()
{
	AI_Output (other, self,"DIA_Tpl_1416_Torwache_Life_15_00"); //Как живут Стражи Братства?
	AI_Output (self, other,"DIA_Tpl_1416_Torwache_Life_08_01"); //У меня важная миссия. Сам Просвещенный и его ученики рассчитывают на меня.
	AI_Output (self, other,"DIA_Tpl_1416_Torwache_Life_08_02");	//Моя прежняя жизнь осталась в прошлом. Теперь я ГОР НА - Страж на службе у Спящего.
};
