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
	description = "Tenhle hrad je poøádnì velký.";
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
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //Tenhle hrad je poøádnì velký.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //Nemyslím, že bych tì už nìkdy vidìl. Kdo jsi?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //Jsem tady nový. Akorát se tu trochu porozhlížím.
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
	description = "Co mi mùžeš øíci o hradu?";
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
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //Co mi mùžeš øíci o hradu?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //Gomez a jeho banda ho zabrali po velkém povstání.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //Hned jsem vìdìl, že bude lepší dát se k nìmu.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //Už když jsme se maèkali ve vìzení a museli otroèit v dolech, vždycky jsme dìlali, co on øekl.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //Pod hradem je vìzení?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //Ano, ale je prázdné. Po velkém povstání už tam nikdo nebyl uvìznìný.
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
	description = "Jaké to je být strážcem?";
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
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //Jaký je to život být strážcem?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Klidný. Jsme nejvìtší a nejsilnìjší tábor v kolonii. Nikdo se na nás nedovoluje.
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
	AI_Output (self, other,"GRD_208_Cutter_WELCOME_Info_08_01"); //Dobøe sis zvolil. Jako strážce budeš mít dobrý život!
	AI_StopProcessInfos	(self);
};
