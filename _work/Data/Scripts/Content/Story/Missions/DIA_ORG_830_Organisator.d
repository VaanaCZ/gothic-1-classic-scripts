// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_ORG_830_EXIT (C_INFO)
{
	npc			= ORG_830_Organisator;
	nr			= 999;
	condition	= Info_ORG_830_EXIT_Condition;
	information	= Info_ORG_830_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_ORG_830_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_ORG_830_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_ORG_830_Hello (C_INFO)
{
	npc			= ORG_830_Organisator;
	nr			= 1;
	condition	= Info_ORG_830_Hello_Condition;
	information	= Info_ORG_830_Hello_Info;
	permanent	= 0;
	description	= "Zdar! Jsem tady nový.";
};                       

FUNC INT Info_ORG_830_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_ORG_830_Hello_Info()
{	
	AI_Output (other, self,"Info_ORG_830_Hello_15_00"); //Zdar! Jsem tady nový!
	AI_Output (self, other,"Info_ORG_830_Hello_13_01"); //A co?
};

// ************************************************************
// 						Was machst du hier?
// ************************************************************

INSTANCE Info_ORG_830_What (C_INFO)
{
	npc			= ORG_830_Organisator;
	nr			= 1;
	condition	= Info_ORG_830_What_Condition;
	information	= Info_ORG_830_What_Info;
	permanent	= 0;
	description	= "Co děláš?";
};                       

FUNC INT Info_ORG_830_What_Condition()
{
	if (Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_ORG_830_What_Info()
{	
	AI_Output (other, self,"Info_ORG_830_What_15_00"); //Co tady děláš?
	AI_Output (self, other,"Info_ORG_830_What_13_01"); //Jak to vypadá? Kouřím.
	AI_Output (self, other,"Info_ORG_830_What_13_02"); //Jestli si myslíš, že tě nechám potáhnout... Zapomeň na to!
};

// ************************************************************
// 						Aufhalten
// ************************************************************

INSTANCE Info_ORG_830_Aufhalten (C_INFO)
{
	npc			= ORG_830_Organisator;
	nr			= 2;
	condition	= Info_ORG_830_Aufhalten_Condition;
	information	= Info_ORG_830_Aufhalten_Info;
	permanent	= 0;
	description	= "Nechceš se mě pokusit zastavit? Zeptat se mě, co tu chci nebo tak?";
};                       

FUNC INT Info_ORG_830_Aufhalten_Condition()
{
	if (Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_ORG_830_Aufhalten_Info()
{	
	AI_Output (other, self,"Info_ORG_830_Aufhalten_15_00"); //Nechceš se mě pokusit zastavit? Zeptat se mě, co tu chci nebo tak?
	AI_Output (self, other,"Info_ORG_830_Aufhalten_13_01"); //Ne. Ještě by mě to znervóznilo. Kromě toho, někdo jako ty tady moc škody nenadělá.
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE Info_ORG_830_Perm (C_INFO)
{
	npc			= ORG_830_Organisator;
	nr			= 3;
	condition	= Info_ORG_830_Perm_Condition;
	information	= Info_ORG_830_Perm_Info;
	permanent	= 1;
	description	= "Jaké je to uvnitř?";
};                       

FUNC INT Info_ORG_830_Perm_Condition()
{
	if (Npc_KnowsInfo(hero,Info_ORG_830_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_ORG_830_Perm_Info()
{	
	AI_Output (other, self,"Info_ORG_830_Perm_15_00"); //Jaké je to uvnitř?
	AI_Output (self, other,"Info_ORG_830_Perm_13_01"); //Jako vždy - klid, až na pár hádek.
};
