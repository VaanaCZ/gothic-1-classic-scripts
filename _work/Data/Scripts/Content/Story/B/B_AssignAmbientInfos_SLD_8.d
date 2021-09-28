// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Sld_8_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Sld_8 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Sld_8_EXIT_Condition;
	information	= Info_Sld_8_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Sld_8_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Sld_8_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Sld_8_EinerVonEuchWerden_Condition;
	information	= Info_Sld_8_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Pot�ebujete spolehliv�ho mu�e?";
};                       

FUNC INT Info_Sld_8_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other)!=GIL_SLD)
	&& (Npc_GetTrueGuild(other)!=GIL_KDW)
	&& (!C_NpcBelongsToOldCamp (other))
	&& (!C_NpcBelongsToPsiCamp (other))
	{
		return TRUE;
	};
};

FUNC VOID Info_Sld_8_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Sld_8_EinerVonEuchWerden_15_00"); //Pot�ebujete spolehliv�ho mu�e?
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_01"); //Lee nechce, aby se n�kdo d�val k �old�k�m, dokud tu n�jak� �as nepobude a nez�sk� dost zku�enost�.
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_02"); //Jestli chce� z�stat v t�bo�e, mus� si z�skat respekt u bandit�.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Sld_8_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Sld_8_WichtigePersonen_Condition;
	information	= Info_Sld_8_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo to tady vede?";
};                       

FUNC INT Info_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_00"); //Kdo tady m� velen�?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_01"); //My �old�ci jdeme v�ichni s Leem. Uzav�eli jsme s m�gy dohodu, budeme je chr�nit a oni n�s odtud dostanou ven.
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_02"); //Tak�e tu ve skute�nosti vel� m�gov�?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_03"); //Ani n�hodou. V t�bo�e nevel� nikdo. V�t�ina lid� jsou chlap�ci, kte�� nemohli nebo necht�li b�t ve Star�m t�bo�e.
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_04"); //V�ichni si tady hled�me sv�ho. Ale v jednom jsme zajedno: Je lep�� d�t v�echnu rudu na hromadu a vyhodit ji do vzduchu, ne� ji cp�t do ch�t�nu tomu zpropaden�mu kr�li!
	var C_NPC Lee;			Lee		= Hlp_GetNpc(Sld_700_Lee);
	Lee.aivar[AIV_FINDABLE] = TRUE;
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Sld_8_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Sld_8_DasLager_Condition;
	information	= Info_Sld_8_DasLager_Info;
	permanent	= 1;
	description = "Co mi m��e� ��ci o t�bo�e?";
};                       

FUNC INT Info_Sld_8_DasLager_Condition()
{	
	if (!C_NpcBelongsToNewCamp(other))
	{
		return 1;
	};
};
FUNC VOID Info_Sld_8_DasLager_Info()
{
	AI_Output(other,self,"Info_Sld_8_DasLager_15_00"); //Co mi m��e� ��ci o t�boru?
	AI_Output(self,other,"Info_Sld_8_DasLager_08_01"); //D�vej si tu pozor. V t�bo�e je spousta hrdlo�ez�.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_02"); //M�me tu n�kolik nepsan�ch z�kon�. Zaprv�: jen �old�ci sm�j� vstoupit na �zem� m�g�.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_03"); //Zadruh�: pokus� se p�ibl�it k hald� rudy a jsi mrtv� mu�. Zat�et�: nezkou�ej se dostat do baru na jeze�e.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_04"); //Abys v�d�l, je to bar bandit� a ti nemaj� r�di, kdy� se tam ukazuj� nov��ci.
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Sld_8_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Sld_8_DieLage_Condition;
	information	= Info_Sld_8_DieLage_Info;
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_Sld_8_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Sld_8_DieLage_15_00"); //Jak to jde?
	AI_Output(self,other,"Info_Sld_8_DieLage_08_01"); //Jako v�dycky. Star�me se, aby se nikdo nep�ibli�oval k m�g�m a k rud�.
	var C_NPC Cronos;		Cronos  = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 									Krautprobe
// *************************************************************************

INSTANCE Info_Sld_8_Krautprobe (C_INFO) // E1
{
	nr			= 5;
	condition	= Info_Sld_8_Krautprobe_Condition;
	information	= Info_Sld_8_Krautprobe_Info;
	permanent	= 1;
	description = "M�m tu trochu drogy z ba�in. D� si?";
};                       

FUNC INT Info_Sld_8_Krautprobe_Condition()
{
	if	((BaalKagan_VerteilKraut == LOG_RUNNING) || (BaalKagan_VerteilKraut == LOG_SUCCESS))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return TRUE;
	};
};

FUNC VOID Info_Sld_8_Krautprobe_Info()
{
	AI_Output(other,self,"Info_Sld_8_Krautprobe_15_00"); //M�m tu trochu drogy z ba�in. D� si?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_01"); //Pro� ne. D�m ti 10 nuget�.
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_02"); //Jdi a �ekni i ostatn�m chlap�m, ur�it� budou cht�t taky.
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output (self, other,"Info_Sld_8_Krautprobe_No_Joint_08_00"); //Nejd��v mi uka� drogu. ��dnou nem�, vi�?
	};
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Sld_8(var c_NPC slf)
{
	B_AssignFindNpc_NC(slf);
	
	Info_Sld_8_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Sld_8_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Sld_8_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Sld_8_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Sld_8_DieLage.npc				= Hlp_GetInstanceID(slf);
	
	Info_Sld_8_Krautprobe.npc			= Hlp_GetInstanceID(slf);
};
