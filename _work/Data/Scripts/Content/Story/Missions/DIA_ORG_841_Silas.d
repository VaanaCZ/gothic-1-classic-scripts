// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Silas_EXIT(C_Info)
{
	npc			= Org_841_Silas;
	nr			= 999;
	condition	= DIA_Silas_EXIT_Condition;
	information	= DIA_Silas_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Silas_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Silas_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Trade
// ************************************************************

INSTANCE DIA_Silas_Hehler(C_Info)
{
	npc			= Org_841_Silas;
	nr			= 1;
	condition	= DIA_Silas_Hehler_Condition;
	information	= DIA_Silas_Hehler_Info;
	permanent	= 0;
	description = "Jak leci?";
};                       

FUNC INT DIA_Silas_Hehler_Condition()
{
	return 1;
};

FUNC VOID DIA_Silas_Hehler_Info()
{	
	AI_Output (other, self,"DIA_Silas_Hehler_15_00"); //Jak leci?
	AI_Output (self, other,"DIA_Silas_Hehler_06_01"); //Œwietnie! Sprzedajemy tu nasz¹ ry¿ówkê za parê bry³ek rudy.
	AI_Output (self, other,"DIA_Silas_Hehler_06_02"); //Da siê z tego wy¿yæ. W koñcu co innego mog¹ ch³opcy zrobiæ z ciê¿ko zarobion¹ rud¹?
};

// ************************************************************
// 						Trade
// ************************************************************

INSTANCE DIA_Silas_Trade(C_Info)
{
	npc			= Org_841_Silas;
	nr			= 1;
	condition	= DIA_Silas_Trade_Condition;
	information	= DIA_Silas_Trade_Info;
	permanent	= 0;
	description = "Chcê siê napiæ.";
	trade		= 1;
};                       

FUNC INT DIA_Silas_Trade_Condition()
{
	return 1;
};

FUNC VOID DIA_Silas_Trade_Info()
{	
	AI_Output (other, self,"DIA_Silas_Trade_15_00"); //Chcê siê napiæ.
	AI_Output (self, other,"DIA_Silas_Trade_06_01"); //Nie ma nic za darmo.
};
