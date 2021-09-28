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
	description = "KONIEC";
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
	description = "Nie przyda³by siê wam dodatkowy cz³owiek?";
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
	AI_Output(other,self,"Info_Sld_8_EinerVonEuchWerden_15_00"); //Nie przyda³by siê wam dodatkowy cz³owiek?
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_01"); //Lee nie przyjmuje ludzi, którzy nie spêdzili tu kilku lat i nie maja du¿ego doœwiadczenia.
	AI_Output(self,other,"Info_Sld_8_EinerVonEuchWerden_08_02"); //Jeœli chcesz zostaæ w Obozie musisz najpierw postawiæ siê Szkodnikom.
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
	description = "Kto tu dowodzi?";
};                       

FUNC INT Info_Sld_8_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_00"); //Kto tu dowodzi?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_01"); //Wszyscy Najemnicy s³uchaj¹ Lee. Szef zawar³ umowê z Magami - my ich ochraniamy, a oni pomog¹ nam st¹d zwiaæ!
	AI_Output(other,self,"Info_Sld_8_WichtigePersonen_15_02"); //A wiêc w rzeczywistoœci rz¹dz¹ tu Magowie?
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_03"); //Nie, obozem NIKT tak naprawdê nie rz¹dzi. Wiêkszoœæ z mieszkaj¹cych tu ludzi nie chcia³a b¹dŸ nie mog³a mieszkaæ w Starym Obozie.
	AI_Output(self,other,"Info_Sld_8_WichtigePersonen_08_04"); //Ka¿dy dba tu o w³asny interes. Zgadzamy siê tylko co do jednego: lepiej ju¿ usypaæ z rudy wielki kopiec i wysadziæ go w powietrze, ni¿ wchodziæ w uk³ady z królem, niech mu ziemia ciê¿k¹ bêdzie.
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
	description = "Co mo¿esz mi opowiedzieæ o tym obozie?";
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
	AI_Output(other,self,"Info_Sld_8_DasLager_15_00"); //Co mo¿esz mi opowiedzieæ o tym obozie?
	AI_Output(self,other,"Info_Sld_8_DasLager_08_01"); //Uwa¿aj na siebie! W Obozie a¿ roi siê od morderców i rabusiów!
	AI_Output(self,other,"Info_Sld_8_DasLager_08_02"); //Mamy tutaj kilka niepisanych praw. Pierwsze: tylko Najemnicy mog¹ wchodziæ do strefy Magów.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_03"); //Drugie: zanim zbli¿ysz siê do kopca rudy, wykop sobie wygodny grób. Trzecie: nie pokazuj siê w knajpie na jeziorze.
	AI_Output(self,other,"Info_Sld_8_DasLager_08_04"); //Widzisz, to jest lokal Szkodników, a oni nie lubi¹ jak pokazuj¹ siê tam ¿ó³todzioby takie jak ty.
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
	description = "Jak leci?";
};                       

FUNC INT Info_Sld_8_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Sld_8_DieLage_Info()
{
	AI_Output(other,self,"Info_Sld_8_DieLage_15_00"); //Jak leci?
	AI_Output(self,other,"Info_Sld_8_DieLage_08_01"); //Jak zwykle. Pilnujemy, ¿eby nikt nie zbli¿y³ siê do Magów ani do rudy.
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
	description = "Mam przy sobie trochê bagiennego ziela? Mo¿e chcesz trochê kupiæ?";
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
	AI_Output(other,self,"Info_Sld_8_Krautprobe_15_00"); //Mam przy sobie trochê bagiennego ziela? Mo¿e chcesz je kupiæ?
	
	if ( (Npc_HasItems(other,ItMiJoint_1)>0) || (Npc_HasItems(other,ItMiJoint_2)>0) || (Npc_HasItems(other,ItMiJoint_3)>0) )
	{
		if 		(Npc_HasItems(other,ItMiJoint_1))
		{	B_GiveInvItems(other,self,ItMiJoint_1,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_2))
		{	B_GiveInvItems(other,self,ItMiJoint_2,1);	 }
		else if (Npc_HasItems(other,ItMiJoint_3))
		{	B_GiveInvItems(other,self,ItMiJoint_3,1);	 };
		
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_01"); //Czemu nie? Dam ci za nie 10 bry³ek rudy.
		AI_Output(self,other,"Info_Sld_8_Krautprobe_08_02"); //Pogadaj jeszcze z reszt¹ ch³opaków. Oni pewnie te¿ bêd¹ zainteresowani.
		
		CreateInvItems(self,itminugget,10);
		B_GiveInvItems(self,other,itminugget,10);
		NC_Joints_verteilt = NC_Joints_verteilt + 1;
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output (self, other,"Info_Sld_8_Krautprobe_No_Joint_08_00"); //Nie tak szybko. Najpierw poka¿ ziele! Nie masz, co?!
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
