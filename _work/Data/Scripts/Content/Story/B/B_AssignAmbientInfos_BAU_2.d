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
	description = "KONIEC";
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
	description = "Pracujesz na polach ry¿owych z w³asnej woli?";
};                       

FUNC INT Info_Bau_2_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_00"); //Pracujesz na polach ry¿owych z w³asnej woli?
	AI_Output(self,other,"Info_Bau_2_WichtigePersonen_02_01"); //Jasne! Lepsze to, ni¿ zostaæ ZMUSZONYM do pracy przez oprychów Ry¿owego Ksiêcia!
	AI_Output(other,self,"Info_Bau_2_WichtigePersonen_15_02"); //Rozumiem...
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
	description = "Co mo¿esz mi powiedzieæ o Obozie?";
};                       

FUNC INT Info_Bau_2_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_2_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_2_DasLager_15_00"); //Co mo¿esz mi powiedzieæ o Obozie?
	AI_Output(self,other,"Info_Bau_2_DasLager_02_01"); //Nie³atwo siê tu ¿yje. Najemnicy Lee i magowie s¹ w porz¹dku, ale Szkodniki daj¹ siê wszystkim we znaki!
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
	description = "Co s³ychaæ?";
};                       

FUNC INT Info_Bau_2_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_2_DieLage_15_00"); //Co s³ychaæ?
	AI_Output(self,other,"Info_Bau_2_DieLage_02_01"); //Czego chcesz? Przys³a³ ciê Ry¿owy Ksi¹¿e? Pracujê najlepiej jak potrafiê!
	AI_Output(other,self,"Info_Bau_2_DieLage_15_02"); //Nikt mnie nie przys³a³! Chcê po prostu porozmawiaæ!
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
	description = "Przysy³a mnie Lewus. Przynios³em ci wodê.";
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
	AI_Output(other,self,"Info_Bau_2_Wasser_15_00"); //Przysy³a mnie Lewus. Przynios³em ci wodê.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output			(self,other,"Info_Bau_2_Wasser_02_01"); //O, dziêki. Umieram z pragnienia!

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
		AI_Output(self,other,"Info_Bau_2_Wasser_NOWATER_02_00"); //Woda! Hej, cz³owieku! Nic nie zosta³o! Tylko mi nie mów, ¿e znowu wszyscy siê napili, oprócz mnie!
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
