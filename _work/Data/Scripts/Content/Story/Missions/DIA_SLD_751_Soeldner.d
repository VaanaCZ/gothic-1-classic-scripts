
//-------------------- Intro ---------------------------

instance DIA_SLD_751_Soeldner_INTRO (C_INFO)
{
	npc				= SLD_751_Soeldner;
	condition		= DIA_SLD_751_Soeldner_INTRO_CONDITION;
	information		= DIA_SLD_751_Soeldner_INTRO_INFO;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_SLD_751_Soeldner_INTRO_CONDITION()
{
	if (Npc_GetDistToNpc( self, hero ) < 300)
	//&& (Hlp_StrCmp(Npc_GetNearestWp (self),self.wp)== 0))
	{
		return 1;
	};
};

func void DIA_SLD_751_Soeldner_INTRO_INFO()
{
	AI_Output (self, other,"DIA_SLD_751_Soeldner_INTRO_INFO_01_01"); //Á, návštìvník! Nedìlej tady žádné rozbroje, jinak to schytáš!
};

//-------------------- Exit 1 -----------------------------

instance DIA_SLD_751_Soeldner_EXIT_1 (C_INFO)
{
	nr				= 999;
	npc				= SLD_751_Soeldner;
	condition		= DIA_SLD_751_Soeldner_EXIT_1_CONDITION;
	information		= DIA_SLD_751_Soeldner_EXIT_1_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Radìji pùjdu!";
};

FUNC int DIA_SLD_751_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_EXIT_1_INFO()
{
	AI_Output (other, self,"DIA_SLD_751_Soeldner_EXIT_1_INFO_15_01"); //Radìji pùjdu!
	AI_Output (self, other,"DIA_SLD_751_Soeldner_EXIT_1_INFO_01_02");//To doufám.
	AI_StopProcessInfos	( self );
};

//-------------------- Exit 2 -----------------------------

instance DIA_SLD_751_Soeldner_EXIT_2 (C_INFO)
{
	nr				= 999;
	npc				= SLD_751_Soeldner;
	condition		= DIA_SLD_751_Soeldner_EXIT_2_CONDITION;
	information		= DIA_SLD_751_Soeldner_EXIT_2_INFO;
	important		= 0;
	permanent		= 1;
	description 	= "Musím jít dál.";
};

FUNC int DIA_SLD_751_Soeldner_EXIT_2_CONDITION()
{
	if (Npc_KnowsInfo	(hero, DIA_SLD_751_Soeldner_EXIT_1))
	{
		return 1;
	};
};

func void DIA_SLD_751_Soeldner_EXIT_2_INFO()
{
	AI_Output (other, self,"DIA_SLD_751_Soeldner_EXIT_2_INFO_15_01"); //Musím jít dál.
	AI_Output (self, other,"DIA_SLD_751_Soeldner_EXIT_2_INFO_01_02");//Tak bìž.
	AI_StopProcessInfos	( self );
};

//--------------------- Umsehen ---------------------------

instance DIA_SLD_751_Soeldner_UMSEHEN (C_INFO)
{
	npc				= SLD_751_Soeldner;
	condition		= DIA_SLD_751_Soeldner_UMSEHEN_CONDITION;
	information		= DIA_SLD_751_Soeldner_UMSEHEN_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chci se tu porozhlédnout.";
};

FUNC int DIA_SLD_751_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_UMSEHEN_INFO()
{  
	AI_Output (other, self,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_15_01"); //Chci se tu porozhlédnout.
	AI_Output (self, other,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_01_02");//Pak dávej pozor, abys nikomu nešlápl na nohu.
};


//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_751_Soeldner_INMINE (C_INFO)
{
	npc				= SLD_751_Soeldner;
	condition		= DIA_SLD_751_Soeldner_INMINE_CONDITION;
	information		= DIA_SLD_751_Soeldner_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chci jít do dolu.";
};

FUNC int DIA_SLD_751_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_751_Soeldner_INMINE_INFO_15_01"); //Chci jít do dolu.
	AI_Output (self, other,"DIA_SLD_751_Soeldner_INMINE_INFO_01_02");//Nevìøím, že se ti to povede. Promluv si ale s Okylem.

};




