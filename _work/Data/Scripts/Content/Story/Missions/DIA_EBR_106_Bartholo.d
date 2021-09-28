// **************************************
//					EXIT 
// **************************************

instance DIA_Bartholo_Exit (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 999;
	condition	= DIA_Bartholo_Exit_Condition;
	information	= DIA_Bartholo_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Bartholo_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Bartholo_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					HAllo
// ************************************************************

INSTANCE Info_Bartholo_HAllo (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_HAllo_Condition;
	information	= Info_Bartholo_HAllo_Info;
	permanent	= 0;
	description = "¿Quién eres?";
};                       

FUNC INT Info_Bartholo_HAllo_Condition()
{	
	return 1;
};

FUNC VOID Info_Bartholo_HAllo_Info()
{
	AI_Output (other, self,"Info_Bartholo_HAllo_15_00"); //¿Quién eres?
	AI_Output (self, other,"Info_Bartholo_HAllo_12_01"); //Me llamo Bartholo. Aseguro que los magnates del mineral reciban sus suministros.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_02"); //Estoy a cargo de todo; desde las reservas de hierba a los alimentos y las provisiones para las mujeres.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_03"); //Además, me encargo de que estos cocineros estúpidos hagan bien su trabajo.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_04"); //Deberían agradecérmelo. Gómez no tolera fallos. Echó a los dos últimos cocineros a los acechadores del río.
};

// ************************************************************
// 					PERM TRADE
// ************************************************************

INSTANCE Info_Bartholo_PERM (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_PERM_Condition;
	information	= Info_Bartholo_PERM_Info;
	permanent	= 0;
	description = "Quiero hacer un trato contigo.";
	Trade		= 1;
};                       

FUNC INT Info_Bartholo_PERM_Condition()
{	
//SN: Problematisch, da Bartholo auch einen wichtigen Schlüssel hat!
//	if (Npc_KnowsInfo(hero, Info_Bartholo_Hallo))
//	{
//		return 1;
//	};
};

FUNC VOID Info_Bartholo_PERM_Info()
{
	AI_Output (other, self,"Info_Bartholo_PERM_15_00"); //Quiero hacer un trato contigo.
	AI_Output (self, other,"Info_Bartholo_PERM_12_01"); //Tengo mucho que ofrecer... si tienes suficiente mineral.
};


// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Bartholo_Krautbote (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_Krautbote_Condition;
	information	= Info_Bartholo_Krautbote_Info;
	permanent	= 1;
	description = "Tengo un poco de hierba para Gómez. La manda Cor Kalom.";
};                       

FUNC INT Info_Bartholo_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Bartholo_Krautbote_Info()
{
	AI_Output				(other, self,"Info_Bartholo_Krautbote_15_00"); //Tengo un poco de hierba para Gómez. La manda Cor Kalom.
	AI_Output				(self, other,"Info_Bartholo_Krautbote_12_01"); //¡Enséñamela!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_02"); //Hmmmmmmm...
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_03"); //¡Muy bien! Gómez se estaba impacientando. ¡Tienes suerte de haberla entregado hoy!
		AI_Output			(other, self,"Info_Bartholo_Krautbote_15_04"); //¿Y el pago?
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_05"); //No tan deprisa... Ten, toma. 500 pepitas es lo acordado.
		
		B_GiveInvItems  	(other,self,itmijoint_3,30);
		CreateInvItems  	(self,itminugget, 500);
		B_GiveInvItems		(self,other, itminugget, 500);

		Kalom_DeliveredWeed	= TRUE;
		B_LogEntry			(CH1_KrautBote,"Bartholo me ha dado 500 pepitas para la entrega de hierba.");
		B_GiveXP			(XP_WeedShipmentDelivered);

		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //¡No tienes suficiente hierba para ser un recadero! ¡Por tu bien, espero que no la hayas vendido por ahí! ¡Vuelve cuando tengas la cantidad adecuada!
	};
};

// **************************************************************************
// 				Wartet auf den SC
// **************************************************************************

instance  DIA_EBR_106_Bartholo_Wait4SC (C_INFO)
{
	npc				= EBR_106_Bartholo;
	condition		= DIA_EBR_106_Bartholo_Wait4SC_Condition;
	information		= DIA_EBR_106_Bartholo_Wait4SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_EBR_106_Bartholo_Wait4SC_Condition()
{	
	if	ExploreSunkenTower
	{
		return TRUE;
	};
};
FUNC void  DIA_EBR_106_Bartholo_Wait4SC_Info()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	AI_Output			(self, other,"Info_Bartholo_12_01");	//¡Sabía que alguien intentaría llegar hasta nosotros a través de la estrella de cinco puntas!
	AI_Output			(self, other,"Info_Bartholo_12_02");	//¡Pero, a diferencia de Stone, ese herrero traidor, a ti no te necesitamos!
	AI_Output			(other, self,"Info_Bartholo_15_03");	//¿Dónde está Stone?
	AI_Output			(self, other,"Info_Bartholo_12_04");	//¡Entre rejas! ¡Pero tú vas a estar bajo tierra en un instante!
	AI_Output			(self, other,"Info_Bartholo_12_05");	//¡Muchachos, cogedle y hacedle rebanadas!

	AI_StopProcessInfos	(self);
	
	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(self, GIL_EBR);	
};
