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
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //Me parece que no te he visto por aqu� antes. �Qui�n eres?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //Soy un reci�n llegado. Se me ocurri� echar un vistazo.
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
	description = "�Qu� puedes decirme del castillo?";
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
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //�Qu� puedes decirme del castillo?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //G�mez y su banda lo tomaron tras la gran sublevaci�n.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //Enseguida supe que lo mejor era unirse a �l.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //Incluso cuando a�n est�bamos encerrados en las mazmorras, y ten�amos que matarnos a trabajar en las minas, el resto de los prisioneros siempre hac�an lo que �l dec�a.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //�Hay mazmorras bajo el castillo?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //S�, pero ahora ya no hay nada en ellas. Nadie ha bajado all� despu�s de la gran sublevaci�n.
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
	description = "�C�mo es la vida de un guardia?";
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
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //�C�mo es la vida de un guardia?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Tranquila. Somos el campamento m�s grande y fuerte de toda la colonia. Nadie se mete con nosotros.
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
	AI_Output (self, other,"GRD_208_Cutter_WELCOME_Info_08_01"); //Has tomado la decisi�n correcta. �Te gustar� ser guardia!
	AI_StopProcessInfos	(self);
};
