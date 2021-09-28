// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bau_9_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_9 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bau_9_EXIT_Condition;
	information	= Info_Bau_9_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Bau_9_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_9_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Bau_9_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Bau_9_WichtigePersonen_Condition;
	information	= Info_Bau_9_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo má na starosti dohled nad plnìním plánu práce na tìch polích?";
};                       

FUNC INT Info_Bau_9_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_9_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Bau_9_WichtigePersonen_15_00"); //Kdo má na starosti dohled nad plnìním plánu práce na tìch polích?
	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_01"); //Každý! Rýžový Lord sice hlídá všechno, ale já mám dojem, že celé dny prosedí ve svém bunkru a poèítá pytle.
	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_02"); //On a Homer to všechno vymysleli.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Bau_9_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Bau_9_DasLager_Condition;
	information	= Info_Bau_9_DasLager_Info;
	permanent	= 1;
	description = "Povídej mi o táboøe.";
};                       

FUNC INT Info_Bau_9_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_9_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_9_DasLager_15_00"); //Povídej mi o táboøe.
	AI_Output(self,other,"Info_Bau_9_DasLager_09_01"); //Je až po støechu plný bastardù. Kdyby bylo po mém, nechal bych žoldáky, aby všechny ty lotry z tábora vyházeli.
	AI_Output(self,other,"Info_Bau_9_DasLager_09_02"); //Nedìlají nic...jenom problémy.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Bau_9_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Bau_9_DieLage_Condition;
	information	= Info_Bau_9_DieLage_Info;
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_Bau_9_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_9_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_9_DieLage_15_00"); //Jak se máš?
	AI_Output(self,other,"Info_Bau_9_DieLage_09_01"); //Pracujeme do úmoru, abysme dostali nìco k jídlu!
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Bau_9_Wasser(C_INFO) // E1
{
	nr			= 800;
	condition	= Info_Bau_9_Wasser_Condition;
	information	= Info_Bau_9_Wasser_Info;
	permanent	= 1;
	description = "Lefty mì poslal. Pøinesl jsem ti trochu vody.";
};                       

FUNC INT Info_Bau_9_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Bau_9_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_9_Wasser_15_00"); //Lefty mì poslal. Pøinesl jsem ti trochu vody.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems		(other, self,	ItFo_Potion_Water_01, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,	ItFo_Potion_Water_01);

		AI_Output			(self,other,"Info_Bau_9_Wasser_09_01"); //Díky, kamaráde! Ještì chvilku a zešílel bych žízní!
		
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_9_Wasser_NOWATER_09_00"); //Už nic nezbylo. Vezmu trochu od ostatních.
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Bau_9(var c_NPC slf)
{
	Info_Bau_9_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bau_9_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Bau_9_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Bau_9_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Bau_9_Wasser.npc				= Hlp_GetInstanceID(slf);
};








