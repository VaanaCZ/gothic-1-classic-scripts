
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
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INTRO_INFO_13_01"); //Co siê tak krêcisz? Dobrze ci radzê: ³apy z dala od tych drzwi!
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
	description 	= "Lepiej ju¿ sobie pójdê.";
};

FUNC int DIA_SLD_760_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_EXIT_1_INFO()
{
	AI_Output (other, self,"DIA_SLD_760_Soeldner_EXIT_1_INFO_15_01"); //Lepiej ju¿ sobie pójdê.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_EXIT_1_INFO_13_02");//Mam nadziejê, ¿e siê rozumiemy.
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
	description 	= "Muszê ju¿ iœæ.";
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
	AI_Output (other, self,"DIA_SLD_760_Soeldner_EXIT_2_INFO_15_01"); //Muszê ju¿ iœæ.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_EXIT_2_INFO_13_02");//No to idŸ!
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
	description 	= "Chcia³bym siê tutaj trochê rozejrzeæ.";
};

FUNC int DIA_SLD_760_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_UMSEHEN_INFO()
{
	AI_Output (other, self,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_15_01"); //Chcia³bym siê tutaj trochê rozejrzeæ.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_13_02");//Tylko trzymaj ³apy przy sobie, albo ci je odr¹biê.
};


//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_760_Soeldner_INMINE (C_INFO)
{
	npc				= SLD_760_Soeldner;
	condition		= DIA_SLD_760_Soeldner_INMINE_CONDITION;
	information		= DIA_SLD_760_Soeldner_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chcia³bym siê dostaæ do kopalni.";
};

FUNC int DIA_SLD_760_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_01"); //Chcia³bym siê dostaæ do kopalni.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_02");//Do kopalni? Nie wpuszczê nikogo, kto nie otrzyma³ upowa¿nienia od Okyla.

	if	(!Npc_KnowsInfo	(hero, DIA_SLD_752_OKYL_WERBISTDU))
	{
		AI_Output (other, self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_03");//Kim jest Okyl?
	}
	else
	{
		AI_Output (other, self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_08");//Okyl? Czy to nie ten goœæ w ciê¿kiej zbroi i z wielkim toporem?
	};
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_04");//Uwa¿aj co mówisz o naszym szefie!
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_05");//Powiem ci coœ o Okylu: to najtwardszy goœæ w ca³ym Obozie. Kiedyœ nawet wœlizn¹³ siê do zamku w Starym Obozie i podwêdzi³ Magnatom spory ³adunek rudy.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_06");//Wiêc na przysz³oœæ radzê ci okazywaæ mu trochê wiêcej szacunku.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_07");//Nie wiem, gdzie jest teraz, ale jakbyœ go spotka³, lepiej pamiêtaj o tym, co ci dziœ powiedzia³em.
};



