
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
	description 	= "Mam jeszcze kilka rzeczy do za�atwienia.";
};

FUNC int DIA_SLD_761_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_EXIT_1_INFO()
{
	AI_Output (other, self,"DIA_SLD_761_Soeldner_EXIT_1_INFO_15_01"); //Mam jeszcze kilka rzeczy do za�atwienia.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_EXIT_1_INFO_03_02");//Tak te� my�la�em.
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
	description 	= "Najlepiej b�dzie, jak ju� sobie p�jd�.";
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
	AI_Output (other, self,"DIA_SLD_761_Soeldner_EXIT_2_INFO_15_01"); //Najlepiej b�dzie, jak ju� sobie p�jd�.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_EXIT_2_INFO_03_02");//W porz�dku.
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
	description 	= "Chcia�em si� troch� rozejrze� po Obozie.";
};

FUNC int DIA_SLD_761_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_UMSEHEN_INFO()
{  
	AI_Output (other, self,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_15_01"); //Chcia�em si� troch� rozejrze� po Obozie.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_03_02");//To trafi�e� w niew�a�ciwe miejsce. To jest wej�cie do kopalni. Nie mo�esz si� tutaj kr�ci�.
};


//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_761_Soeldner_INMINE (C_INFO)
{
	npc				= SLD_761_Soeldner;
	condition		= DIA_SLD_761_Soeldner_INMINE_CONDITION;
	information		= DIA_SLD_761_Soeldner_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chcia�em tylko obejrze� kopalni�.";
};

FUNC int DIA_SLD_761_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_761_Soeldner_INMINE_INFO_15_01");//Chcia�em tylko obejrze� kopalni�.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_INMINE_INFO_03_02");//Jak widzisz, kopalnia jest zamkni�ta. Nie ma tu nic ciekawego do ogl�dania.

};

//----------------------- Bestechen --------------------------------

instance DIA_SLD_761_Soeldner_Bribe (C_INFO)
{
	npc				= SLD_761_Soeldner;
	condition		= DIA_SLD_761_Soeldner_Bribe_CONDITION;
	information		= DIA_SLD_761_Soeldner_Bribe_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Mo�e si� jako� dogadamy?";
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
	AI_Output (other, self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_01");//Mo�e si� jako� dogadamy?
	AI_Output (self, other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_02");//A o czym tu niby gada�?
	AI_Output (self, other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_03");//Sekund�, je�li pr�bujesz mnie przekupi�, to trafi�e� na niew�a�ciwego cz�owieka.
	AI_Output (other, self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_04");//Nie pr�buj� nikogo przekupi�. Pomy�la�em tylko...
	AI_Output (other, self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_05");//Lepiej ju� sobie p�jd�.
	AI_StopProcessInfos	(self); 
};

