
//-------------------- Intro ---------------------------

instance DIA_SLD_761_Soeldner_INTRO (C_INFO)
{
	npc				= SLD_761_Soeldner;
	condition		= DIA_SLD_761_Soeldner_INTRO_CONDITION;
	information		= DIA_SLD_761_Soeldner_INTRO_INFO;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_SLD_761_Soeldner_INTRO_CONDITION()
{
	if (Npc_GetDistToNpc( self, hero ) < 300)
	//&& (Hlp_StrCmp(Npc_GetNearestWp (self),self.wp)== 0))
	{
		return 1;
	};
};

func void DIA_SLD_761_Soeldner_INTRO_INFO()
{
	AI_Output (self, other,"DIA_SLD_761_Soeldner_INTRO_INFO_03_01"); //Co robisz tutaj, w kopalni?
};

//-------------------- Exit 1 -----------------------------

instance DIA_SLD_761_Soeldner_EXIT_1 (C_INFO)
{
	nr				= 999;
	npc				= SLD_761_Soeldner;
	condition		= DIA_SLD_761_Soeldner_EXIT_1_CONDITION;
	information		= DIA_SLD_761_Soeldner_EXIT_1_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Mam jeszcze kilka rzeczy do za³atwienia.";
};

FUNC int DIA_SLD_761_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_EXIT_1_INFO()
{
	AI_Output (other, self,"DIA_SLD_761_Soeldner_EXIT_1_INFO_15_01"); //Mam jeszcze kilka rzeczy do za³atwienia.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_EXIT_1_INFO_03_02");//Tak te¿ myœla³em.
	AI_StopProcessInfos	( self );
};

//-------------------- Exit 2 -----------------------------

instance DIA_SLD_761_Soeldner_EXIT_2 (C_INFO)
{
	nr				= 999;
	npc				= SLD_761_Soeldner;
	condition		= DIA_SLD_761_Soeldner_EXIT_2_CONDITION;
	information		= DIA_SLD_761_Soeldner_EXIT_2_INFO;
	important		= 0;
	permanent		= 1;
	description 	= "Najlepiej bêdzie, jak ju¿ sobie pójdê.";
};

FUNC int DIA_SLD_761_Soeldner_EXIT_2_CONDITION()
{
	if (Npc_KnowsInfo	(hero, DIA_SLD_761_Soeldner_EXIT_1))
	{
		return 1;
	};
};

func void DIA_SLD_761_Soeldner_EXIT_2_INFO()
{
	AI_Output (other, self,"DIA_SLD_761_Soeldner_EXIT_2_INFO_15_01"); //Najlepiej bêdzie, jak ju¿ sobie pójdê.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_EXIT_2_INFO_03_02");//W porz¹dku.
	AI_StopProcessInfos	( self );
};

//--------------------- Umsehen ---------------------------

instance DIA_SLD_761_Soeldner_UMSEHEN (C_INFO)
{
	npc				= SLD_761_Soeldner;
	condition		= DIA_SLD_761_Soeldner_UMSEHEN_CONDITION;
	information		= DIA_SLD_761_Soeldner_UMSEHEN_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chcia³em siê trochê rozejrzeæ po Obozie.";
};

FUNC int DIA_SLD_761_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_UMSEHEN_INFO()
{  
	AI_Output (other, self,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_15_01"); //Chcia³em siê trochê rozejrzeæ po Obozie.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_03_02");//To trafi³eœ w niew³aœciwe miejsce. To jest wejœcie do kopalni. Nie mo¿esz siê tutaj krêciæ.
};


//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_761_Soeldner_INMINE (C_INFO)
{
	npc				= SLD_761_Soeldner;
	condition		= DIA_SLD_761_Soeldner_INMINE_CONDITION;
	information		= DIA_SLD_761_Soeldner_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chcia³em tylko obejrzeæ kopalniê.";
};

FUNC int DIA_SLD_761_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_761_Soeldner_INMINE_INFO_15_01");//Chcia³em tylko obejrzeæ kopalniê.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_INMINE_INFO_03_02");//Jak widzisz, kopalnia jest zamkniêta. Nie ma tu nic ciekawego do ogl¹dania.

};

//----------------------- Bestechen --------------------------------

instance DIA_SLD_761_Soeldner_Bribe (C_INFO)
{
	npc				= SLD_761_Soeldner;
	condition		= DIA_SLD_761_Soeldner_Bribe_CONDITION;
	information		= DIA_SLD_761_Soeldner_Bribe_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Mo¿e siê jakoœ dogadamy?";
};

FUNC int DIA_SLD_761_Soeldner_Bribe_CONDITION()
{	
	if (Npc_KnowsInfo	(hero,DIA_SLD_761_Soeldner_INMINE))
	{
		return 1;
	};
};

func void DIA_SLD_761_Soeldner_Bribe_INFO()
{  
	AI_Output (other, self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_01");//Mo¿e siê jakoœ dogadamy?
	AI_Output (self, other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_02");//A o czym tu niby gadaæ?
	AI_Output (self, other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_03");//Sekundê, jeœli próbujesz mnie przekupiæ, to trafi³eœ na niew³aœciwego cz³owieka.
	AI_Output (other, self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_04");//Nie próbujê nikogo przekupiæ. Pomyœla³em tylko...
	AI_Output (other, self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_05");//Lepiej ju¿ sobie pójdê.
	AI_StopProcessInfos	(self); 
};

