
//-------------------- Intro ---------------------------

instance DIA_SLD_752_OKYL_INTRO (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_INTRO_CONDITION;
	information		= DIA_SLD_752_OKYL_INTRO_INFO;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_SLD_752_OKYL_INTRO_CONDITION()
{
	if (Npc_GetDistToNpc( self, hero ) < 250)
	{
		return 1;
	};
};

func void DIA_SLD_752_OKYL_INTRO_INFO()
{
	AI_Output (self, other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01"); //Hej, ty! Ty nepatøíš k mým mužùm. Co tady dìláš?
};

//-------------------- Exit -----------------------------

instance DIA_SLD_752_OKYL_EXIT (C_INFO)
{
	nr				= 999;
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_EXIT_CONDITION;
	information		= DIA_SLD_752_OKYL_EXIT_INFO;
	important		= 0;
	permanent		= 1;
	description 	= "Musím jít dál.";
};

FUNC int DIA_SLD_752_OKYL_EXIT_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_EXIT_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01"); //Musím jít dál.
	AI_Output (self, other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02");//Nech mì být.
	AI_StopProcessInfos	( self );
};

//--------------------- Umsehen ---------------------------

instance DIA_SLD_752_OKYL_UMSEHEN (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_UMSEHEN_CONDITION;
	information		= DIA_SLD_752_OKYL_UMSEHEN_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Jen se tu porozhlédnu.";
};

FUNC int DIA_SLD_752_OKYL_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_UMSEHEN_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01"); //Jen se tu porozhlédnu.
	AI_Output (self, other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");//Dávej pozor, aby ses tady v Kotlinì nedostal do žádného maléru, jinak se dostaneš do hrobu rychleji, než by ses nadál.
};

//--------------------- Wer bist Du -----------------------------

instance DIA_SLD_752_OKYL_WERBISTDU (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_WERBISTDU_CONDITION;
	information		= DIA_SLD_752_OKYL_WERBISTDU_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Kdo jsi?";
};

FUNC int DIA_SLD_752_OKYL_WERBISTDU_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_WERBISTDU_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01"); //Kdo jsi?
	AI_Output (self, other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");//Jsem Okyl. Jsem šéf Kotliny.

};

//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_752_OKYL_INMINE (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_INMINE_CONDITION;
	information		= DIA_SLD_752_OKYL_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chtìl jsem se jednom podívat do dolu.";
};

FUNC int DIA_SLD_752_OKYL_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01"); //Chtìl jsem se jednom podívat do dolu.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");//Och, jen se tak procházet po dolu.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");//Vidím, že nemáš pøedstavu, jak to tady chodí. Bez mojeho svolení do dolu nevkroèí ani noha.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");//Provždy si zapamatuj: kdokoliv vstoupí do dolu nebo do strážnice bez mého svolení, je mrtvý muž!
};

//----------------------- Erlaubniss kriegen -------------------------

instance DIA_SLD_752_OKYL_PERMIT (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_PERMIT_CONDITION;
	information		= DIA_SLD_752_OKYL_PERMIT_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Dostanu povolení jít dovnitø?";
};

FUNC int DIA_SLD_752_OKYL_PERMIT_CONDITION()
{
	if (Npc_KnowsInfo(hero,DIA_SLD_752_OKYL_INMINE))
	{
		return 1;
	};
};

func void DIA_SLD_752_OKYL_PERMIT_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_PERMIT_INFO_15_01");//Dostanu povolení jít dovnitø?
	AI_Output (self, other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");//Ještì nevím. Proè bych tì mìl pouštìt do dolu?
	AI_Output (self, other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");//Teï zmiz, mám dùležitìjší vìci na práci.
	AI_StopProcessInfos (self);
};
