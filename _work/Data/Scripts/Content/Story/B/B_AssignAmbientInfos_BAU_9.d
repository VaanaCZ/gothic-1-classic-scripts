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
	description = "KONIEC";
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
	description = "Kto pilnuje, by praca w polu przebiega�a bez przeszk�d?";
};                       

FUNC INT Info_Bau_9_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_9_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Bau_9_WichtigePersonen_15_00"); //Kto pilnuje, by praca w polu przebiega�a bez przeszk�d?
	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_01"); //Wszyscy! W zasadzie powinien si� tym zajmowa� Ry�owy Ksi��e, ale moim zdaniem ten cz�owiek umie tylko siedzie� w swojej norze i liczy� worki.
	AI_Output(self,other,"Info_Bau_9_WichtigePersonen_09_02"); //W ka�dym razie to on i Homer zapocz�tkowali to wszystko...
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
	description = "Opowiedz mi o tym obozie.";
};                       

FUNC INT Info_Bau_9_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_9_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_9_DasLager_15_00"); //Opowiedz mi o tym obozie.
	AI_Output(self,other,"Info_Bau_9_DasLager_09_01"); //Ob�z? Jest wype�niony po brzegi najgorszymi szumowinami. Moim zdaniem Najemnicy powinni ju� dawno oczy�ci� to miejsce ze Szkodnik�w.
	AI_Output(self,other,"Info_Bau_9_DasLager_09_02"); //Nie ma z nich �adnego po�ytku, tylko same k�opoty.
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
	description = "Jak si� masz?";
};                       

FUNC INT Info_Bau_9_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_9_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_9_DieLage_15_00"); //Jak si� masz?
	AI_Output(self,other,"Info_Bau_9_DieLage_09_01"); //Harujemy tu do upad�ego, �eby reszta mia�a co w�o�y� do garnka.
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
	description = "Przysy�a mnie Lewus. Przynios�em ci wod�.";
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
	AI_Output(other,self,"Info_Bau_9_Wasser_15_00"); //Przysy�a mnie Lewus. Przynios�em ci wod�.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems		(other, self,	ItFo_Potion_Water_01, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,	ItFo_Potion_Water_01);

		AI_Output			(self,other,"Info_Bau_9_Wasser_09_01"); //Pi�kne dzi�ki! Jeszcze troch�, a zacz��bym pi� z ka�u�y.
		
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_9_Wasser_NOWATER_09_00"); //Chyba ci si� sko�czy�a. Trudno, wezm� troch� od innych.
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








