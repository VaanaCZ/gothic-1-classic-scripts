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
	description	= "Cześć, jestem tu nowy.";
};                       

FUNC INT Info_ORG_830_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_ORG_830_Hello_Info()
{	
	AI_Output (other, self,"Info_ORG_830_Hello_15_00"); //Cześć, jestem tu nowy.
	AI_Output (self, other,"Info_ORG_830_Hello_13_01"); //I co z tego?
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
	description	= "Co robisz?";
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
	AI_Output (other, self,"Info_ORG_830_What_15_00"); //Co robisz?
	AI_Output (self, other,"Info_ORG_830_What_13_01"); //A na co ci to wygląda? Palę!
	AI_Output (self, other,"Info_ORG_830_What_13_02"); //Jeśli myślisz, że dam ci się zaciągnąć, to się grubo mylisz!
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
	description	= "Nie będziesz próbował mnie zatrzymać? Nie zapytasz czego tu szukam?";
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
	AI_Output (other, self,"Info_ORG_830_Aufhalten_15_00"); //Nie będziesz próbował mnie zatrzymać? Nie zapytasz czego tu szukam, albo coś w tym rodzaju?
	AI_Output (self, other,"Info_ORG_830_Aufhalten_13_01"); //A po cholerę mam sobie zawracać głowę. Zresztą ktoś taki jak ty nie narobi raczej wielkich szkód.
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
	description	= "Co słychać wewnątrz?";
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
	AI_Output (other, self,"Info_ORG_830_Perm_15_00"); //Co słychać wewnątrz?
	AI_Output (self, other,"Info_ORG_830_Perm_13_01"); //To co zwykle - ogólnie spokój, od czasu do czasu jakaś drobna burda.
};
