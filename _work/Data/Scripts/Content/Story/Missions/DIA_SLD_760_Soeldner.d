
//-------------------- Intro ---------------------------

instance DIA_SLD_760_Soeldner_INTRO (C_INFO)
{
	npc				= SLD_760_Soeldner;
	condition		= DIA_SLD_760_Soeldner_INTRO_CONDITION;
	information		= DIA_SLD_760_Soeldner_INTRO_INFO;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_SLD_760_Soeldner_INTRO_CONDITION()
{
	if (Npc_GetDistToNpc( self, hero ) < 200)
	//&& (Hlp_StrCmp(Npc_GetNearestWp (self),self.wp)== 0))
	{
		return 1;
	};
};

func void DIA_SLD_760_Soeldner_INTRO_INFO()
{
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INTRO_INFO_13_01"); //Co se tu potloukáš? Øeknu ti jedno: kliï se od mých dveøí!
};

//-------------------- Exit 1 -----------------------------

instance DIA_SLD_760_Soeldner_EXIT_1 (C_INFO)
{
	nr				= 999;
	npc				= SLD_760_Soeldner;
	condition		= DIA_SLD_760_Soeldner_EXIT_1_CONDITION;
	information		= DIA_SLD_760_Soeldner_EXIT_1_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Radìji pùjdu!";
};

FUNC int DIA_SLD_760_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_EXIT_1_INFO()
{
	AI_Output (other, self,"DIA_SLD_760_Soeldner_EXIT_1_INFO_15_01"); //Radìji pùjdu!
	AI_Output (self, other,"DIA_SLD_760_Soeldner_EXIT_1_INFO_13_02");//To doufám.
	AI_StopProcessInfos	( self );
};

//-------------------- Exit 2 -----------------------------

instance DIA_SLD_760_Soeldner_EXIT_2 (C_INFO)
{
	nr				= 999;
	npc				= SLD_760_Soeldner;
	condition		= DIA_SLD_760_Soeldner_EXIT_2_CONDITION;
	information		= DIA_SLD_760_Soeldner_EXIT_2_INFO;
	important		= 0;
	permanent		= 1;
	description 	= "Musím jít dál.";
};

FUNC int DIA_SLD_760_Soeldner_EXIT_2_CONDITION()
{
	if (Npc_KnowsInfo	(hero, DIA_SLD_760_Soeldner_EXIT_1))
	{
		return 1;
	};
};

func void DIA_SLD_760_Soeldner_EXIT_2_INFO()
{
	AI_Output (other, self,"DIA_SLD_760_Soeldner_EXIT_2_INFO_15_01"); //Potøebuju jít dál.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_EXIT_2_INFO_13_02");//Tak bìž.
	AI_StopProcessInfos	( self );
};

//--------------------- Umsehen ---------------------------

instance DIA_SLD_760_Soeldner_UMSEHEN (C_INFO)
{
	npc				= SLD_760_Soeldner;
	condition		= DIA_SLD_760_Soeldner_UMSEHEN_CONDITION;
	information		= DIA_SLD_760_Soeldner_UMSEHEN_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chtìl bych se tady porozhlédnout.";
};

FUNC int DIA_SLD_760_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_UMSEHEN_INFO()
{
	AI_Output (other, self,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_15_01"); //Chtìl bych se tady porozhlédnout.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_13_02");//Vyndej si ruce z kapes nebo ti je urazím!
};


//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_760_Soeldner_INMINE (C_INFO)
{
	npc				= SLD_760_Soeldner;
	condition		= DIA_SLD_760_Soeldner_INMINE_CONDITION;
	information		= DIA_SLD_760_Soeldner_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chci jít do dolu.";
};

FUNC int DIA_SLD_760_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_01"); //Chci jít do dolu.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_02");//Do dolu? Bez Okylova povolení nikoho dovnitø nepustím.

	if	(!Npc_KnowsInfo	(hero, DIA_SLD_752_OKYL_WERBISTDU))
	{
		AI_Output (other, self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_03");//Kdo je Okyl?
	}
	else
	{
		AI_Output (other, self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_08");//Okyl, není to ten chlapík s velkou sekyrou a tìžkou zbrojí?
	};
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_04");//Dávej pozor na to, co øíkáš a jak mluvíš o našem šéfovi.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_05");//Øeknu ti nìco o Okylovi, je to nejtvrdší chlap z celého tábora. Jednou se dokonce vplížil na hrad ve Starém táboøe a ukradl tam Rudobaronùm hromadu rudy.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_06");//Tak zachovej trochu úcty, prosím.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_07");//Nevím kde je, ale jestli ho potkáš, mìl bys mít tuhle vìc stále na pamìti.
};



