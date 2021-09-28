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
	description = "Lefty m� poslal. P�inesl jsem ti trochu vody.";
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
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Poslal m� Lefty. P�inesl jsem trochu vody.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //D�ky, p��teli! Um�r�m ��zn�.
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
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Vodu! Hej, p��teli! U� tu ��dn� nen�! Ne��kej mi, �e zase dostal ka�d� krom� m�!
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
	description	= "Zdar! Jsem tady nov�. Jen jsem cht�l v�d�t, co se tu d�je.";
};                       

FUNC INT DIA_Rufus_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_Hello_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Hello_15_00"); //Zdar! Jsem tady nov�. Jen jsem cht�l v�d�t, co se tu d�je.
	AI_Output (self, other,"DIA_Rufus_Hello_02_01"); //Zeptej se n�koho jin�ho. Ned�l�m nic jin�ho, ne� �e tu pracuju na pol�ch, nev�m nic.
	AI_Output (self, other,"DIA_Rufus_Hello_02_02"); //�lov��e, nejrad�ji bych R��ov�mu Lordovi �ekl, aby si tu svoji zpropadenou pr�ci d�lal s�m!
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
	description	= "Kdy� se ti to nel�b�, tak pro� tu pracuje�?";
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
	AI_Output (other, self,"DIA_Rufus_Why_15_00"); //Kdy� se ti to nel�b�, tak pro� tu pracuje�?
	AI_Output (self, other,"DIA_Rufus_Why_02_01"); //Stalo se to prvn� den, kdy� jsem se sem dostal. P�i�el ke mn� Lefty, jeden z hrdlo�ez�, co d�laj� pro R��ov�ho Lorda, a zeptal se m�, jestli nechci pracovat na r��ov�ch pol�ch.
	AI_Output (self, other,"DIA_Rufus_Why_02_02"); //Jasn�, �ekl jsem. Byl jsem tu nov� a cht�l jsem d�lat n�co u�ite�n�ho.
	AI_Output (self, other,"DIA_Rufus_Why_02_03"); //P��t� den, kdy� jsem si d�val chvilku odpo�inku, ke mn� ten chlap�k p�i�el znovu.
	AI_Output (self, other,"DIA_Rufus_Why_02_04"); //Nechce� snad nech�vat sv� kolegy, aby pracovali sami, �e ne?
	AI_Output (self, other,"DIA_Rufus_Why_02_05"); //�ekl jsem mu, �e jsem vy�erpan� z p�ede�l�ho dne a �e si pot�ebuji jen trochu odpo�inout. V�bec m� neposlouchal.
	AI_Output (self, other,"DIA_Rufus_Why_02_06"); //Chytil m� za l�mec a odvlekl zp�tky na pole.
	AI_Output (self, other,"DIA_Rufus_Why_02_07"); //Od toho dne st�val poka�d� p�ed m�mi dve�mi, dokud jsem si nezvykl chodit s�m. Necht�l jsem m�t s t�mi chlap�ky ��dn� probl�my.
	AI_Output (self, other,"DIA_Rufus_Why_02_08"); //Jsou to opravdov� hrdlo�ezov�, ud�l� nejl�p, kdy� s nimi bude� zadob�e.
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
	description	= "Kdo je R��ov� Lord?";
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
	AI_Output (other, self,"DIA_Rufus_Ricelord_15_00"); //Kdo je R��ov� Lord?
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_01"); //Byl jedn�m z prvn�ch zdej��ch p�ist�hovalc�. Pom�hal budovat t�bor a zalo�il r��ov� pole.
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_02"); //Te� u� jenom post�v� ve skladi�ti a cpe si b�icho, to tlust� prase!
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};


















	
