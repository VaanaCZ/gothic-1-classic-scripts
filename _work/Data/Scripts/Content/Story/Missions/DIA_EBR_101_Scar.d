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
	description = "Kim jeste�?";
};                       

FUNC INT DIA_SCAR_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_SCAR_Hello_Info()
{	
	AI_Output (other, self,"DIA_SCAR_Hello_15_00"); //Kim jeste�?
	AI_Output (self, other,"DIA_SCAR_Hello_08_01"); //M�wi� na mnie Blizna.
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
	description = "Czym si� zajmujesz?";
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
	AI_Output (other, self,"DIA_SCAR_What_15_00"); //Czym si� zajmujesz?
	AI_Output (self, other,"DIA_SCAR_What_08_01"); //Ja i Arto zapewniamy Gomezowi spok�j przed nieproszonymi go��mi.
	AI_Output (self, other,"DIA_SCAR_What_08_02"); //Opr�cz tego, do moich obowi�zk�w nale�y poskramianie co zadziorniejszych kobiet.
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
	description = "Kiedy mnie tu zrzucano widzia�em kobiet� opuszczan� na d�.";
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
	AI_Output (other, self,"DIA_SCAR_Frau_15_00"); //Kiedy mnie tu zrzucano, widzia�em kobiet� opuszczan� na d� wraz z �adunkiem.
	AI_Output (self, other,"DIA_SCAR_Frau_08_01"); //I co z tego?
	AI_Output (other, self,"DIA_SCAR_Frau_15_02"); //Jest tutaj?
	AI_Output (self, other,"DIA_SCAR_Frau_08_03"); //S�uchaj, je�li wi��esz z ni� jakie� nadzieje, dam ci dobr� rad�: Zapomnij o niej.
	AI_Output (self, other,"DIA_SCAR_Frau_08_04"); //Dopiero co j� dostarczono i Gomez kaza� j� zamkn�� w swojej komnacie.
	AI_Output (self, other,"DIA_SCAR_Frau_08_05"); //Jak ju� mu si� znudzi, mo�e przy�le j� tu, na d�. Ale p�ki co, ona nale�y DO NIEGO, wi�c lepiej nie zawracaj sobie ni� g�owy.
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
	description = "Co mo�esz mi powiedzie� o Gomezie?";
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
	AI_Output (other, self,"DIA_SCAR_PERM_15_00"); //Co mo�esz mi powiedzie� o Gomezie?
	AI_Output (self, other,"DIA_SCAR_PERM_08_01"); //To najpot�niejszy cz�owiek w ca�ej kolonii. To ci powinno wystarczy�.
	AI_Output (self, other,"DIA_SCAR_PERM_08_02"); //Dostaje wszystko, czego zapragnie, cho� tak naprawd� zale�y mu tylko na w�adzy.
};

