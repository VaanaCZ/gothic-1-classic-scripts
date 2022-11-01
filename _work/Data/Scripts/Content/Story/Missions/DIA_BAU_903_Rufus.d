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
	description = "Lefty mě poslal. Přinesl jsem ti trochu vody.";
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
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Poslal mě Lefty. Přinesl jsem trochu vody.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Díky, příteli! Umírám žízní.
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
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Vodu! Hej, příteli! Už tu žádná není! Neříkej mi, že zase dostal každý kromě mě!
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
	description	= "Zdar! Jsem tady nový. Jen jsem chtěl vědět, co se tu děje.";
};                       

FUNC INT DIA_Rufus_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_Hello_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Hello_15_00"); //Zdar! Jsem tady nový. Jen jsem chtěl vědět, co se tu děje.
	AI_Output (self, other,"DIA_Rufus_Hello_02_01"); //Zeptej se někoho jiného. Nedělám nic jiného, než že tu pracuju na polích, nevím nic.
	AI_Output (self, other,"DIA_Rufus_Hello_02_02"); //Člověče, nejraději bych Rýžovému Lordovi řekl, aby si tu svoji zpropadenou práci dělal sám!
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
	description	= "Když se ti to nelíbí, tak proč tu pracuješ?";
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
	AI_Output (other, self,"DIA_Rufus_Why_15_00"); //Když se ti to nelíbí, tak proč tu pracuješ?
	AI_Output (self, other,"DIA_Rufus_Why_02_01"); //Stalo se to první den, když jsem se sem dostal. Přišel ke mně Lefty, jeden z hrdlořezů, co dělají pro Rýžového Lorda, a zeptal se mě, jestli nechci pracovat na rýžových polích.
	AI_Output (self, other,"DIA_Rufus_Why_02_02"); //Jasně, řekl jsem. Byl jsem tu nový a chtěl jsem dělat něco užitečného.
	AI_Output (self, other,"DIA_Rufus_Why_02_03"); //Příští den, když jsem si dával chvilku odpočinku, ke mně ten chlapík přišel znovu.
	AI_Output (self, other,"DIA_Rufus_Why_02_04"); //Nechceš snad nechávat své kolegy, aby pracovali sami, že ne?
	AI_Output (self, other,"DIA_Rufus_Why_02_05"); //Řekl jsem mu, že jsem vyčerpaný z předešlého dne a že si potřebuji jen trochu odpočinout. Vůbec mě neposlouchal.
	AI_Output (self, other,"DIA_Rufus_Why_02_06"); //Chytil mě za límec a odvlekl zpátky na pole.
	AI_Output (self, other,"DIA_Rufus_Why_02_07"); //Od toho dne stával pokaždé před mými dveřmi, dokud jsem si nezvykl chodit sám. Nechtěl jsem mít s těmi chlapíky žádné problémy.
	AI_Output (self, other,"DIA_Rufus_Why_02_08"); //Jsou to opravdoví hrdlořezové, uděláš nejlíp, když s nimi budeš zadobře.
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
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_01"); //Byl jedním z prvních zdejších přistěhovalců. Pomáhal budovat tábor a založil rýžová pole.
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_02"); //Teď už jenom postává ve skladišti a cpe si břicho, to tlustý prase!
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};


















	
