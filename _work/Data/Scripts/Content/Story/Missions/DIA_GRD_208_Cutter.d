//******************************************
//					EXIT	
//******************************************

instance  DIA_Cutter_Exit (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 999;
	condition	= DIA_Cutter_Exit_Condition;
	information	= DIA_Cutter_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Cutter_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Cutter_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

//******************************************
//					Hallo	
//******************************************

instance  DIA_Cutter_Hello (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Hello_Condition;
	information	= DIA_Cutter_Hello_Info;
	permanent	= 0;
	description = "Tenhle hrad je po��dn� velk�.";
};                       

FUNC int  DIA_Cutter_Hello_Condition()
{	
	if (!C_NpcBelongsToOldcamp (other))
	{
		return 1;
	};
};
FUNC VOID  DIA_Cutter_Hello_Info()
{
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //Tenhle hrad je po��dn� velk�.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //Nemysl�m, �e bych t� u� n�kdy vid�l. Kdo jsi?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //Jsem tady nov�. Akor�t se tu trochu porozhl��m.
};

//******************************************
//					Burg	
//******************************************

instance  DIA_Cutter_Burg (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_Burg_Condition;
	information	= DIA_Cutter_Burg_Info;
	permanent	= 10;
	description = "Co mi m��e� ��ci o hradu?";
};                       

FUNC int  DIA_Cutter_Burg_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Hello))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_Burg_Info()
{
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //Co mi m��e� ��ci o hradu?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //Gomez a jeho banda ho zabrali po velk�m povst�n�.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //Hned jsem v�d�l, �e bude lep�� d�t se k n�mu.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //U� kdy� jsme se ma�kali ve v�zen� a museli otro�it v dolech, v�dycky jsme d�lali, co on �ekl.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //Pod hradem je v�zen�?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //Ano, ale je pr�zdn�. Po velk�m povst�n� u� tam nikdo nebyl uv�zn�n�.
};

//******************************************
//					PERM	
//******************************************

instance  DIA_Cutter_PERM (C_INFO)
{
	npc			= GRD_208_Cutter;
	nr			= 1;
	condition	= DIA_Cutter_PERM_Condition;
	information	= DIA_Cutter_PERM_Info;
	permanent	= 1;
	description = "Jak� to je b�t str�cem?";
};                       

FUNC int  DIA_Cutter_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Cutter_Burg))
	{
		return 1;
	};
};

FUNC VOID  DIA_Cutter_PERM_Info()
{
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //Jak� je to �ivot b�t str�cem?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Klidn�. Jsme nejv�t�� a nejsiln�j�� t�bor v kolonii. Nikdo se na n�s nedovoluje.
	AI_Output (other, self,"DIA_Cutter_PERM_15_02"); //Aha.
	AI_StopProcessInfos	(self);
};

	














/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_208_Cutter_WELCOME (C_INFO)
{
	npc				= GRD_208_Cutter;
	condition		= GRD_208_Cutter_WELCOME_Condition;
	information		= GRD_208_Cutter_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_208_Cutter_WELCOME_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_208_Cutter_WELCOME_Info()
{
	AI_Output (self, other,"GRD_208_Cutter_WELCOME_Info_08_01"); //Dob�e sis zvolil. Jako str�ce bude� m�t dobr� �ivot!
	AI_StopProcessInfos	(self);
};
