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
	description	= "¡Hola! ¡Soy nuevo!";
};                       

FUNC INT Info_ORG_830_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_ORG_830_Hello_Info()
{	
	AI_Output (other, self,"Info_ORG_830_Hello_15_00"); //¡Hola! Soy nuevo aquí.
	AI_Output (self, other,"Info_ORG_830_Hello_13_01"); //¿Y qué?
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
	description	= "¿Qué haces?";
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
	AI_Output (other, self,"Info_ORG_830_What_15_00"); //¿Qué es lo que estás haciendo?
	AI_Output (self, other,"Info_ORG_830_What_13_01"); //¿A ti qué te parece? Estoy fumando.
	AI_Output (self, other,"Info_ORG_830_What_13_02"); //¡Si crees que te voy a dar una calada, vas listo!
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
	description	= "¿No vas a tratar de detenerme ni preguntarme qué hago?";
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
	AI_Output (other, self,"Info_ORG_830_Aufhalten_15_00"); //¿Es que no vas a intentar detenerme? ¿Ni a preguntarme qué quiero o algo así?
	AI_Output (self, other,"Info_ORG_830_Aufhalten_13_01"); //No. Demasiado esfuerzo para mí. Además, alguien como tú no hará demasiado daño ahí dentro.
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
	description	= "¿Cómo es por dentro?";
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
	AI_Output (other, self,"Info_ORG_830_Perm_15_00"); //¿Cómo son las cosas ahí dentro?
	AI_Output (self, other,"Info_ORG_830_Perm_13_01"); //Como siempre; tranquilas, con nada más que un par de peleas.
};
