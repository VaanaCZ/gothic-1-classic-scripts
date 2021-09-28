// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Bau_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Bau_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Bau_4_EXIT_Condition;
	information	= Info_Bau_4_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Bau_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Bau_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Bau_4_WichtigePersonen_Condition;
	information	= Info_Bau_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "Macie jakiegoœ przywódcê?";
};                       

FUNC INT Info_Bau_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Bau_4_WichtigePersonen_15_00"); //Macie jakiegoœ przywódcê?
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_01"); //Có¿, teoretycznie naszym szefem jest Ry¿owy Ksi¹¿e, ale wiêkszoœæ z nas pracuje dla niego tylko ze strachu przed jego siepaczami.
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_02"); //Ja jestem wyj¹tkiem. Jestem tu od kilku lat i zd¹¿y³em ju¿ parê razy oberwaæ od Szkodników. Na polach ry¿owych jest przynajmniej spokojnie.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Bau_4_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Bau_4_DasLager_Condition;
	information	= Info_Bau_4_DasLager_Info;
	permanent	= 1;
	description = "Co powinienem wiedzieæ o tym miejscu?";
};                       

FUNC INT Info_Bau_4_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_4_DasLager_15_00"); //Co powinienem wiedzieæ o tym miejscu?
	AI_Output(self,other,"Info_Bau_4_DasLager_04_01"); //Uwa¿aj na siebie, ch³opcze! W Obozie roi siê od morderców i rabusiów. Oni tylko czekaj¹ na przybycie kogoœ takiego jak ty.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Bau_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Bau_4_DieLage_Condition;
	information	= Info_Bau_4_DieLage_Info;
	permanent	= 1;
	description = "Co s³ychaæ?";
};                       

FUNC INT Info_Bau_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_4_DieLage_15_00"); //Co s³ychaæ?
	AI_Output(self,other,"Info_Bau_4_DieLage_04_01"); //Mamy mnóstwo pracy. Do wykarmienia tylu ludzi potrzeba mnóstwa ry¿u.
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Bau_4_Wasser(C_INFO) // E1
{
	nr			= 800;
	condition	= Info_Bau_4_Wasser_Condition;
	information	= Info_Bau_4_Wasser_Info;
	permanent	= 1;
	description = "Przysy³a mnie Lewus. Przynios³em ci wodê.";
};                       

FUNC INT Info_Bau_4_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Bau_4_Wasser_Info()
{
	AI_Output(other,self,"Info_Bau_4_Wasser_15_00"); //Przysy³a mnie Lewus. Przynios³em ci wodê.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems		(other, self,	ItFo_Potion_Water_01, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,	ItFo_Potion_Water_01);

		AI_Output(self,other,"Info_Bau_4_Wasser_04_01"); //Dziêki, ch³opcze. Piêkne dziêki.
		
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_4_Wasser_NOWATER_04_00"); //Ale nic ci nie zosta³o! No trudno, poszukam u innych.
	};
};

// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Bau_4(var c_NPC slf)
{
	Info_Bau_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Bau_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Bau_4_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Bau_4_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Bau_4_Wasser.npc				= Hlp_GetInstanceID(slf);
};
