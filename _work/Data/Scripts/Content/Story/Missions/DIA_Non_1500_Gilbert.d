// ********************************
// 				EXIT
// ********************************

instance DIA_Gilbert_EXIT (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 999;
	condition	= DIA_Gilbert_EXIT_Condition;
	information	= DIA_Gilbert_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Gilbert_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// ********************************
// 				First
// ********************************

instance DIA_Gilbert_First (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_First_Condition;
	information	= DIA_Gilbert_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Gilbert_First_Condition()
{
	if (Npc_GetDistToNpc(self,other) <= ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Gilbert_First_Info()
{
	AI_Output (self, other,"DIA_Gilbert_First_04_00"); //Co tu robisz? Nie miewam tu zbyt czêsto goœci, he he!
	AI_Output (self, other,"DIA_Gilbert_First_04_01"); //Widzê, ¿e niez³y cwaniak z ciebie. Tak znaleŸæ moj¹ kryjówkê, no no!
	
	B_GiveXP(XP_GilbertFound);
};

// ********************************
// 				Hallo
// ********************************

instance DIA_Gilbert_Hallo (C_INFO)
{
	npc			= Non_1500_Gilbert;
	nr			= 1;
	condition	= DIA_Gilbert_Hallo_Condition;
	information	= DIA_Gilbert_Hallo_Info;
	permanent	= 1;
	description = "Co tu robisz?";
};                       

FUNC int DIA_Gilbert_Hallo_Condition()
{
	return 1;
};

FUNC VOID  DIA_Gilbert_Hallo_Info()
{
	AI_Output (other, self,"DIA_Gilbert_Hallo_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_01"); //Mia³em ju¿ doœæ Starego Obozu. Podpad³em paru ludziom Gomeza. To by³o dawno temu.
	AI_Output (self, other,"DIA_Gilbert_Hallo_04_02"); //Teraz pewnie nikt ju¿ o mnie nie pamiêta, ale ja siê st¹d nie ruszam. Jak na mój gust - w Starym Obozie wci¹¿ jest za du¿o têpych osi³ków.
};




