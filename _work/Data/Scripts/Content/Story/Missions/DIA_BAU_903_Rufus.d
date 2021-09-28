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
	description = "Przysy�a mnie Lewus. Przynosz� ci wod�.";
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
	AI_Output(other,self,"Info_Rufus_Wasser_15_00"); //Przysy�a mnie Lewus. Przynosz� ci wod�.
	if (Npc_HasItems(other, ItFo_Potion_Water_01)>=1)
	{
		AI_Output(self,other,"Info_Rufus_Wasser_02_01"); //Dzi�ki, stary. W g�bie mi ju� zasch�o.
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
		AI_Output(self,other,"Info_Rufus_Wasser_NOWATER_02_00"); //Woda?! Hej, kolego! Nic ci ju� nie zosta�o. Tylko mi nie m�w, �e znowu wszyscy zd��yli si� napi� opr�cz mnie!
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
	description	= "Cze��! Jestem tu nowy. Chcia�bym si� dowiedzie�, co si� tu dzieje.";
};                       

FUNC INT DIA_Rufus_Hello_Condition()
{
	return 1;
};

FUNC VOID DIA_Rufus_Hello_Info()
{	
	AI_Output (other, self,"DIA_Rufus_Hello_15_00"); //Cze��! Jestem tu nowy. Chcia�bym si� dowiedzie�, co si� tu dzieje.
	AI_Output (self, other,"DIA_Rufus_Hello_02_01"); //Zapytaj kogo� innego, dobra? Ja tu tylko uprawiam ry�. Na innych rzeczach si� nie znam.
	AI_Output (self, other,"DIA_Rufus_Hello_02_02"); //Najch�tniej powiedzia�bym Ry�owemu Ksi�ciuniowi, �eby sam odwala� swoj� brudn� robot�!
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
	AI_Output (self, other,"DIA_Rufus_Why_02_01"); //To si� zdarzy�o pierwszego dnia po moim przybyciu. Lewus, jeden z oprych�w pracuj�cych dla Ry�owego Ksi�cia, podszed� do mnie i spyta� czy nie m�g�bym im pom�c na polu.
	AI_Output (self, other,"DIA_Rufus_Why_02_02"); //Powiedzia�em "jasne". W ko�cu by�em tu nowy i zale�a�o mi na znalezieniu sobie przyjaci�.
	AI_Output (self, other,"DIA_Rufus_Why_02_03"); //Nast�pnego dnia, kiedy ucina�em sobie drzemk�, facet znowu si� zjawi�.
	AI_Output (self, other,"DIA_Rufus_Why_02_04"); //Powiedzia�: "Chyba nie chcesz, �eby twoi koledzy odwalali za ciebie ca�� robot�, co?".
	AI_Output (self, other,"DIA_Rufus_Why_02_05"); //Powiedzia�em mu, �e jestem wyczerpany wczorajsz� prac�, i �e potrzebuj� odpoczynku. Ale on mia� to gdzie�.
	AI_Output (self, other,"DIA_Rufus_Why_02_06"); //Z�apa� mnie za ko�nierz i ZACI�GN�� z powrotem na pole.
	AI_Output (self, other,"DIA_Rufus_Why_02_07"); //Od tamtej pory codziennie czeka� na mnie na progu mojej chaty - dop�ki nie nauczy�em si� sam wychodzi� w pole. Nie chcia�em, �eby mnie poturbowali.
	AI_Output (self, other,"DIA_Rufus_Why_02_08"); //To banda morderc�w. Lepiej trzymaj si� od nich z daleka.
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
	description	= "Kim jest Ry�owy Ksi��e?";
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
	AI_Output (other, self,"DIA_Rufus_Ricelord_15_00"); //Kim jest Ry�owy Ksi��e?
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_01"); //By� jednym z pierwszych ludzi, kt�rzy tutaj trafili. Pomaga� w zak�adaniu Obozu i rozpocz�� upraw� ry�u.
	AI_Output (self, other,"DIA_Rufus_Ricelord_02_02"); //Dzi� jedyne, co robi, to obnosi swoje brzuszysko po magazynie. T�usty wieprz!
	var C_NPC Ricelord;			Ricelord	= Hlp_GetNpc(Bau_900_Ricelord);
	Ricelord.aivar[AIV_FINDABLE] = TRUE;	
};


















	
