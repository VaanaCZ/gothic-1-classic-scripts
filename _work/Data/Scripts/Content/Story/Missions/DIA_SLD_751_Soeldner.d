
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
	AI_Output (self, other,"DIA_SLD_751_Soeldner_INTRO_INFO_01_01"); //Ach, goœæ! Nie próbuj nam tutaj sprawiaæ ¿adnych k³opotów, bo oberwiesz!
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
	description 	= "Lepiej ju¿ sobie pójdê.";
};

FUNC int DIA_SLD_751_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_EXIT_1_INFO()
{
	AI_Output (other, self,"DIA_SLD_751_Soeldner_EXIT_1_INFO_15_01"); //Lepiej ju¿ sobie pójdê.
	AI_Output (self, other,"DIA_SLD_751_Soeldner_EXIT_1_INFO_01_02");//Mam nadziejê, ¿e siê rozumiemy.
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
	description 	= "Muszê ju¿ iœæ.";
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
	AI_Output (other, self,"DIA_SLD_751_Soeldner_EXIT_2_INFO_15_01"); //Muszê ju¿ iœæ.
	AI_Output (self, other,"DIA_SLD_751_Soeldner_EXIT_2_INFO_01_02");//No to idŸ!
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
	description 	= "Chcê siê tylko trochê rozejrzeæ.";
};

FUNC int DIA_SLD_751_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_UMSEHEN_INFO()
{  
	AI_Output (other, self,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_15_01"); //Chcê siê tylko trochê rozejrzeæ.
	AI_Output (self, other,"DIA_SLD_751_Soeldner_UMSEHEN_INFO_01_02");//Tylko uwa¿aj, ¿ebyœ nie nadepn¹³ komuœ na odcisk.
};


//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_751_Soeldner_INMINE (C_INFO)
{
	npc				= SLD_751_Soeldner;
	condition		= DIA_SLD_751_Soeldner_INMINE_CONDITION;
	information		= DIA_SLD_751_Soeldner_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chcê siê dostaæ do kopalni.";
};

FUNC int DIA_SLD_751_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_751_Soeldner_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_751_Soeldner_INMINE_INFO_15_01"); //Chcê siê dostaæ do kopalni.
	AI_Output (self, other,"DIA_SLD_751_Soeldner_INMINE_INFO_01_02");//Nie wró¿ê ci wielkich szans powodzenia, ale pogadaj z Okylem.

};




