// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Rufus_EXIT (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 999;
	condition	= DIA_Rufus_EXIT_Condition;
	information	= DIA_Rufus_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Rufus_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 									WASSER
// *************************************************************************

INSTANCE Info_Rufus_Wasser(C_INFO) // E1
{
	npc			= Bau_903_Rufus;
	nr			= 800;
	condition	= Info_Rufus_Wasser_Condition;
	information	= Info_Rufus_Wasser_Info;
	permanent	= 1;
	description = "Lefty mì poslal. Pøinesl jsem ti trochu vody.";
};                       

FUNC INT Info_Rufus_Wasser_Condition()
{
	if	((Lefty_Mission==LOG_RUNNING) || ((Lefty_Mission==LOG_SUCCESS) && Npc_HasItems(other, ItFo_Potion_Water_01)))
	&&	(self.aivar[AIV_DEALDAY] <= Wld_GetDay())
	{
		return 1;
	};
};

FUNC VOID Info_Rufus_Wasser_Info()
{
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Poslal mì Lefty. Pøinesl jsem trochu vody.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Díky, pøíteli! Umírám žízní.
		B_GiveInvItems(other,self,ItFo_Potion_Water_01,1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem(self, ItFo_Potion_Water_01);
		An_Bauern_verteilt = An_Bauern_verteilt+1;
		if (An_Bauern_verteilt>=DurstigeBauern)
		{
			Lefty_Mission = LOG_SUCCESS;
		};
		self.aivar[AIV_DEALDAY] = Wld_GetDay()+1;
	}
	else
	{
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Vodu! Hej, pøíteli! Už tu žádná není! Neøíkej mi, že zase dostal každý kromì mì!
	};
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE DIA_Rufus_Hello (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Hello_Condition;
	information	= DIA_Rufus_Hello_Info;
	permanent	= 0;
	description	= "Zdar! Jsem tady nový. Jen jsem chtìl vìdìt, co se tu dìje.";
};                       

FUNC INT DIA_Rufus_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_Hello_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Hello_15_00"); //Zdar! Jsem tady nový. Jen jsem chtìl vìdìt, co se tu dìje.
	AI_Output (self, other,"DIA_Rufus_Hello_02_01"); //Zeptej se nìkoho jiného. Nedìlám nic jiného, než že tu pracuju na polích, nevím nic.
	AI_Output (self, other,"DIA_Rufus_Hello_02_02"); //Èlovìèe, nejradìji bych Rýžovému Lordovi øekl, aby si tu svoji zpropadenou práci dìlal sám!
};

// ************************************************************
// 						Warum arbeitest du
// ************************************************************

INSTANCE DIA_Rufus_Why (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 1;
	condition	= DIA_Rufus_Why_Condition;
	information	= DIA_Rufus_Why_Info;
	permanent	= 0;
	description	= "Když se ti to nelíbí, tak proè tu pracuješ?";
};                       

FUNC INT DIA_Rufus_Why_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Why_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Why_15_00"); //Když se ti to nelíbí, tak proè tu pracuješ?
	AI_Output (self, other,"DIA_Rufus_Why_02_01"); //Stalo se to první den, když jsem se sem dostal. Pøišel ke mnì Lefty, jeden z hrdloøezù, co dìlají pro Rýžového Lorda, a zeptal se mì, jestli nechci pracovat na rýžových polích.
	AI_Output (self, other,"DIA_Rufus_Why_02_02"); //Jasnì, øekl jsem. Byl jsem tu nový a chtìl jsem dìlat nìco užiteèného.
	AI_Output (self, other,"DIA_Rufus_Why_02_03"); //Pøíští den, když jsem si dával chvilku odpoèinku, ke mnì ten chlapík pøišel znovu.
	AI_Output (self, other,"DIA_Rufus_Why_02_04"); //Nechceš snad nechávat své kolegy, aby pracovali sami, že ne?
	AI_Output (self, other,"DIA_Rufus_Why_02_05"); //Øekl jsem mu, že jsem vyèerpaný z pøedešlého dne a že si potøebuji jen trochu odpoèinout. Vùbec mì neposlouchal.
	AI_Output (self, other,"DIA_Rufus_Why_02_06"); //Chytil mì za límec a odvlekl zpátky na pole.
	AI_Output (self, other,"DIA_Rufus_Why_02_07"); //Od toho dne stával pokaždé pøed mými dveømi, dokud jsem si nezvykl chodit sám. Nechtìl jsem mít s tìmi chlapíky žádné problémy.
	AI_Output (self, other,"DIA_Rufus_Why_02_08"); //Jsou to opravdoví hrdloøezové, udìláš nejlíp, když s nimi budeš zadobøe.
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};

// ************************************************************
// 						Wer ist Ricelord?
// ************************************************************

INSTANCE DIA_Rufus_Ricelord (C_INFO)
{
	npc			= Bau_903_Rufus;
	nr			= 2;
	condition	= DIA_Rufus_Ricelord_Condition;
	information	= DIA_Rufus_Ricelord_Info;
	permanent	= 1;
	description	= "Kdo je Rýžový Lord?";
};                       

FUNC INT DIA_Rufus_Ricelord_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Rufus_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Rufus_Ricelord_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Ricelord_15_00"); //Kdo je Rýžový Lord?
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_01"); //Byl jedním z prvních zdejších pøistìhovalcù. Pomáhal budovat tábor a založil rýžová pole.
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_02"); //Teï už jenom postává ve skladišti a cpe si bøicho, to tlustý prase!
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};


















	
