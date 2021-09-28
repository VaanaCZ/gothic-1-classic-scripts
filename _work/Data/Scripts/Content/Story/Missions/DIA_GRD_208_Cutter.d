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
	description = "Este castillo es muy espacioso.";
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
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //Este castillo es muy espacioso.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //Me parece que no te he visto por aquí antes. ¿Quién eres?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //Soy un recién llegado. Se me ocurrió echar un vistazo.
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
	description = "¿Qué puedes decirme del castillo?";
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
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //¿Qué puedes decirme del castillo?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //Gómez y su banda lo tomaron tras la gran sublevación.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //Enseguida supe que lo mejor era unirse a él.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //Incluso cuando aún estábamos encerrados en las mazmorras, y teníamos que matarnos a trabajar en las minas, el resto de los prisioneros siempre hacían lo que él decía.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //¿Hay mazmorras bajo el castillo?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //Sí, pero ahora ya no hay nada en ellas. Nadie ha bajado allí después de la gran sublevación.
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
	description = "¿Cómo es la vida de un guardia?";
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
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //¿Cómo es la vida de un guardia?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Tranquila. Somos el campamento más grande y fuerte de toda la colonia. Nadie se mete con nosotros.
	AI_Output (other, self,"DIA_Cutter_PERM_15_02"); //Entiendo.
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
	AI_Output (self, other,"GRD_208_Cutter_WELCOME_Info_08_01"); //Has tomado la decisión correcta. ¡Te gustará ser guardia!
	AI_StopProcessInfos	(self);
};
