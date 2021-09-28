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
	description		= "Jak wygl�da �ycie stra�nik�w Bractwa?";
};

FUNC INT DIA_Tpl_1416_Torwache_Life_Condition()
{	
	return 1;
};

FUNC VOID DIA_Tpl_1416_Torwache_Life_Info()
{
	AI_Output (other, self,"DIA_Tpl_1416_Torwache_Life_15_00"); //Jak wygl�da �ycie stra�nik�w Bractwa?
	AI_Output (self, other,"DIA_Tpl_1416_Torwache_Life_08_01"); //Otrzyma�em niezwykle wa�ne zadanie. Ja�nie O�wiecony i jego uczniowie z�o�yli swe �ycie w moich r�kach.
	AI_Output (self, other,"DIA_Tpl_1416_Torwache_Life_08_02");	//Niech cie� zapomnienia pokryje moje dawne �ycie. Teraz jestem GOR NA - �wi�ty Stra�nik �ni�cego!
};
