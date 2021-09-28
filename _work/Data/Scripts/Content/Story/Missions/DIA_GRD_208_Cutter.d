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
	description = "Questo castello è pieno di sale.";
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
	AI_Output (other, self,"DIA_Cutter_Hello_15_00"); //Questo castello è pieno di sale.
	AI_Output (self, other,"DIA_Cutter_Hello_08_01"); //Non ti ho mai visto prima. Chi sei?
	AI_Output (other, self,"DIA_Cutter_Hello_15_02"); //Sono nuovo, volevo solo dare un'occhiata in giro.
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
	description = "Cosa puoi dirmi sul castello?";
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
	AI_Output (other, self,"DIA_Cutter_Burg_15_00"); //Cosa puoi dirmi sul castello?
	AI_Output (self, other,"DIA_Cutter_Burg_08_01"); //Gomez e la sua banda l'hanno occupato dopo la grande rivolta.
	AI_Output (self, other,"DIA_Cutter_Burg_08_02"); //Ho capito subito che avrei fatto bene a unirmi a lui.
	AI_Output (self, other,"DIA_Cutter_Burg_08_03"); //Anche quando eravamo rinchiusi nelle segrete, e facevamo gli schiavi nelle miniere, noi prigionieri abbiamo sempre seguito i suoi ordini.
	AI_Output (other, self,"DIA_Cutter_Burg_15_04"); //Ci sono delle segrete sotto il castello?
	AI_Output (self, other,"DIA_Cutter_Burg_08_05"); //Sì, ma oramai sono vuote. Nessuno è più sceso laggiù dopo la grande rivolta.
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
	description = "Com'è la vita, quando sei una guardia?";
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
	AI_Output (other, self,"DIA_Cutter_PERM_15_00"); //Com'è la vita, quando sei una guardia?
	AI_Output (self, other,"DIA_Cutter_PERM_08_01"); //Tranquilla. Siamo il campo più grande e potente dell'intera colonia. Nessuno ci dà fastidio.
	AI_Output (other, self,"DIA_Cutter_PERM_15_02"); //Capisco.
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
	AI_Output (self, other,"GRD_208_Cutter_WELCOME_Info_08_01"); //Hai fatto la scelta giusta. Ti piacerà fare la guardia.
	AI_StopProcessInfos	(self);
};
