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
	description = "Przysyła mnie Lewus. Przynoszę ci wodę.";
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
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Przysyła mnie Lewus. Przynoszę ci wodę.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Dzięki, stary. W gębie mi już zaschło.
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
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Woda?! Hej, kolego! Nic ci już nie zostało. Tylko mi nie mów, że znowu wszyscy zdążyli się napić oprócz mnie!
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
	description	= "Cześć! Jestem tu nowy. Chciałbym się dowiedzieć, co się tu dzieje.";
};                       

FUNC INT DIA_Rufus_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_Hello_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Hello_15_00"); //Cześć! Jestem tu nowy. Chciałbym się dowiedzieć, co się tu dzieje.
	AI_Output (self, other,"DIA_Rufus_Hello_02_01"); //Zapytaj kogoś innego, dobra? Ja tu tylko uprawiam ryż. Na innych rzeczach się nie znam.
	AI_Output (self, other,"DIA_Rufus_Hello_02_02"); //Najchętniej powiedziałbym Ryżowemu Księciuniowi, żeby sam odwalał swoją brudną robotę!
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
	description	= "Skoro tak ci to nie odpowiada, dlaczego tu pracujesz?";
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
	AI_Output (other, self,"DIA_Rufus_Why_15_00"); //Skoro tak ci to nie odpowiada, dlaczego tu pracujesz?
	AI_Output (self, other,"DIA_Rufus_Why_02_01"); //To się zdarzyło pierwszego dnia po moim przybyciu. Lewus, jeden z oprychów pracujących dla Ryżowego Księcia, podszedł do mnie i spytał czy nie mógłbym im pomóc na polu.
	AI_Output (self, other,"DIA_Rufus_Why_02_02"); //Powiedziałem "jasne". W końcu byłem tu nowy i zależało mi na znalezieniu sobie przyjaciół.
	AI_Output (self, other,"DIA_Rufus_Why_02_03"); //Następnego dnia, kiedy ucinałem sobie drzemkę, facet znowu się zjawił.
	AI_Output (self, other,"DIA_Rufus_Why_02_04"); //Powiedział: "Chyba nie chcesz, żeby twoi koledzy odwalali za ciebie całą robotę, co?".
	AI_Output (self, other,"DIA_Rufus_Why_02_05"); //Powiedziałem mu, że jestem wyczerpany wczorajszą pracą, i że potrzebuję odpoczynku. Ale on miał to gdzieś.
	AI_Output (self, other,"DIA_Rufus_Why_02_06"); //Złapał mnie za kołnierz i ZACIĄGNĄŁ z powrotem na pole.
	AI_Output (self, other,"DIA_Rufus_Why_02_07"); //Od tamtej pory codziennie czekał na mnie na progu mojej chaty - dopóki nie nauczyłem się sam wychodzić w pole. Nie chciałem, żeby mnie poturbowali.
	AI_Output (self, other,"DIA_Rufus_Why_02_08"); //To banda morderców. Lepiej trzymaj się od nich z daleka.
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
	description	= "Kim jest Ryżowy Książe?";
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
	AI_Output (other, self,"DIA_Rufus_Ricelord_15_00"); //Kim jest Ryżowy Książe?
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_01"); //Był jednym z pierwszych ludzi, którzy tutaj trafili. Pomagał w zakładaniu Obozu i rozpoczął uprawę ryżu.
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_02"); //Dziś jedyne, co robi, to obnosi swoje brzuszysko po magazynie. Tłusty wieprz!
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};


















	
