// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bau_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bau_2_EXIT_Condition;
	information	= Info_Bau_2_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Bau_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Bau_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Bau_2_WichtigePersonen_Condition;
	information	= Info_Bau_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Pracuje� na r��ov�ch pol�ch dobrovoln�?";
};                       

FUNC INT Info_Bau_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_00"); //Pracuje� na r��ov�ch pol�ch dobrovoln�?
	AI_Output(self,other,"Info_Bau_2_WichtigePersonen_02_01"); //Jasn�. V pohod�. Lep�� tu pracovat ze sv� vlastn� v�le, ne� k tomu b�t donucen hrdlo�ezy R��ov�ho Lorda.
	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_02"); //Aha...
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Bau_2_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Bau_2_DasLager_Condition;
	information	= Info_Bau_2_DasLager_Info;
	permanent	= 1;
	description = "M��e� mi ��ci n�co o t�bo�e?";
};                       

FUNC INT Info_Bau_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_2_DasLager_15_00"); //M��e� mi n�co ��ci o t�bo�e?
	AI_Output(self,other,"Info_Bau_2_DasLager_02_01"); //Je nebezpe�n� tam chodit. Leeovi �old�ci a m�gov� jsou docela dob��, ale p�ed gaunery se mus� m�t na pozoru!
	var C_NPC Lee;			Lee		= Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;	
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Bau_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Bau_2_DieLage_Condition;
	information	= Info_Bau_2_DieLage_Info;
	permanent	= 1;
	description = "Jsi v po��dku?";
};                       

FUNC INT Info_Bau_2_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_2_DieLage_15_00"); //Jsi v po��dku?
	AI_Output(self,other,"Info_Bau_2_DieLage_02_01"); //Co chce�? Poslal t� R��ov� Lord? Pracuju, jak nejl�pe m��u.
	AI_Output(other,self,"Info_Bau_2_DieLage_15_02"); //Nikdo m� neposlal, jen jsem si cht�l popov�dat.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Bau_2_Wasser(C_INFO) // E1
{
	nr			= 800;
	condition	= Info_Bau_2_Wasser_Condition;
	information	= Info_Bau_2_Wasser_Info;
	permanent	= 1;
	description = "Lefty m� poslal. P�inesl jsem ti trochu vody.";
};                       

FUNC INT Info_Bau_2_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Bau_2_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_2_Wasser_15_00"); //Lefty m� poslal. P�inesl jsem ti trochu vody.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output			(self,other,"Info_Bau_2_Wasser_02_01"); //D�ky, kamar�de. Um�r�m ��zn�!

		B_GiveInvItems		(other, self,	ItFo_Potion_Water_01, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,	ItFo_Potion_Water_01);
		
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_2_Wasser_NOWATER_02_00"); //Voda! Posly�, u� ti ��dn� nezbyla! Ne��kej mi, �e v�ichni krom� m� dostali?
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Bau_2(var c_NPC slf)
{
	Info_Bau_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bau_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Bau_2_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Bau_2_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Bau_2_Wasser.npc 				= Hlp_GetInstanceID(slf);
};
