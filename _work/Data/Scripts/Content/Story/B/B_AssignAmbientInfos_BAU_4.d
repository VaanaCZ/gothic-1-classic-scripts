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
	description = "KONEC";
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
	description = "Máte nìjakého vùdce?";
};                       

FUNC INT Info_Bau_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Bau_4_WichtigePersonen_15_00"); //Máte nìjakého vùdce?
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_01"); //Rýžový Lord je nìco jako náš vùdce. Ale vìtšina z nás pro nìj pracuje jen ze strachu z nìho a z jeho hrdloøezù.
	AI_Output(self,other,"Info_Bau_4_WichtigePersonen_04_02"); //Já ale ne. Už jsem tu nìjakých pár let, protože jsem mìl už dost výpraskù od tìch lotrù z tábora... rýžová pole jsou pro mì to pravé.
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
	description = "Je nìco, co bych mìl vìdìt o tomhle místì?";
};                       

FUNC INT Info_Bau_4_DasLager_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Bau_4_DasLager_15_00"); //Je nìco, co bych mìl o tomhle místì vìdìt?
	AI_Output(self,other,"Info_Bau_4_DasLager_04_01"); //Dávej si v táboøe pozor, chlapèe. Motá se tam spousta zabijákù, kteøí se nemohou doèkat, až si podají nováèky, jako jsi ty.
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
	description = "Jak to jde?";
};                       

FUNC INT Info_Bau_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Bau_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Bau_4_DieLage_15_00"); //Jak to jde?
	AI_Output(self,other,"Info_Bau_4_DieLage_04_01"); //Je tu spousta práce. Musíme dodávat hromady rýže na obživu všech tìch lidí.
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
	description = "Lefty mì poslal. Pøinesl jsem ti trochu vody.";
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
	AI_Output(other,self,"Info_Bau_4_Wasser_15_00"); //Lefty mì poslal. Pøinesl jsem ti trochu vody.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		B_GiveInvItems		(other, self,	ItFo_Potion_Water_01, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,	ItFo_Potion_Water_01);

		AI_Output(self,other,"Info_Bau_4_Wasser_04_01"); //Díky, kamaráde. Už jsem to potøeboval!
		
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Bau_4_Wasser_NOWATER_04_00"); //Ale tobì už žádná nezùstala. Nezoufej, chlapèe. Øeknu nìkomu jinému.
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
