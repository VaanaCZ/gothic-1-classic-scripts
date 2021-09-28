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
	description = "Kim jesteœ?";
};                       

FUNC INT DIA_SCAR_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_Hello_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Hello_15_00"); //Kim jesteœ?
	AI_Output (self, other,"DIA_SCAR_Hello_08_01"); //Mówi¹ na mnie Blizna.
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
	description = "Czym siê zajmujesz?";
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
	AI_Output (other, self,"DIA_SCAR_What_15_00"); //Czym siê zajmujesz?
	AI_Output (self, other,"DIA_SCAR_What_08_01"); //Ja i Arto zapewniamy Gomezowi spokój przed nieproszonymi goœæmi.
	AI_Output (self, other,"DIA_SCAR_What_08_02"); //Oprócz tego, do moich obowi¹zków nale¿y poskramianie co zadziorniejszych kobiet.
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
	description = "Kiedy mnie tu zrzucano widzia³em kobietê opuszczan¹ na dó³.";
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
	AI_Output (other, self,"DIA_SCAR_Frau_15_00"); //Kiedy mnie tu zrzucano, widzia³em kobietê opuszczan¹ na dó³ wraz z ³adunkiem.
	AI_Output (self, other,"DIA_SCAR_Frau_08_01"); //I co z tego?
	AI_Output (other, self,"DIA_SCAR_Frau_15_02"); //Jest tutaj?
	AI_Output (self, other,"DIA_SCAR_Frau_08_03"); //S³uchaj, jeœli wi¹¿esz z ni¹ jakieœ nadzieje, dam ci dobr¹ radê: Zapomnij o niej.
	AI_Output (self, other,"DIA_SCAR_Frau_08_04"); //Dopiero co j¹ dostarczono i Gomez kaza³ j¹ zamkn¹æ w swojej komnacie.
	AI_Output (self, other,"DIA_SCAR_Frau_08_05"); //Jak ju¿ mu siê znudzi, mo¿e przyœle j¹ tu, na dó³. Ale póki co, ona nale¿y DO NIEGO, wiêc lepiej nie zawracaj sobie ni¹ g³owy.
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
	description = "Co mo¿esz mi powiedzieæ o Gomezie?";
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
	AI_Output (other, self,"DIA_SCAR_PERM_15_00"); //Co mo¿esz mi powiedzieæ o Gomezie?
	AI_Output (self, other,"DIA_SCAR_PERM_08_01"); //To najpotê¿niejszy cz³owiek w ca³ej kolonii. To ci powinno wystarczyæ.
	AI_Output (self, other,"DIA_SCAR_PERM_08_02"); //Dostaje wszystko, czego zapragnie, choæ tak naprawdê zale¿y mu tylko na w³adzy.
};

