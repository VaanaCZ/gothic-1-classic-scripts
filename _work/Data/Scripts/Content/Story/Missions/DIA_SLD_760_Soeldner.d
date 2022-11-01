
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
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INTRO_INFO_13_01"); //Co się tak kręcisz? Dobrze ci radzę: łapy z dala od tych drzwi!
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
	description 	= "Lepiej już sobie pójdę.";
};

FUNC int DIA_SLD_760_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_EXIT_1_INFO()
{
	AI_Output (other, self,"DIA_SLD_760_Soeldner_EXIT_1_INFO_15_01"); //Lepiej już sobie pójdę.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_EXIT_1_INFO_13_02");//Mam nadzieję, że się rozumiemy.
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
	description 	= "Muszę już iść.";
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
	AI_Output (other, self,"DIA_SLD_760_Soeldner_EXIT_2_INFO_15_01"); //Muszę już iść.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_EXIT_2_INFO_13_02");//No to idź!
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
	description 	= "Chciałbym się tutaj trochę rozejrzeć.";
};

FUNC int DIA_SLD_760_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_UMSEHEN_INFO()
{
	AI_Output (other, self,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_15_01"); //Chciałbym się tutaj trochę rozejrzeć.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_13_02");//Tylko trzymaj łapy przy sobie, albo ci je odrąbię.
};


//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_760_Soeldner_INMINE (C_INFO)
{
	npc				= SLD_760_Soeldner;
	condition		= DIA_SLD_760_Soeldner_INMINE_CONDITION;
	information		= DIA_SLD_760_Soeldner_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chciałbym się dostać do kopalni.";
};

FUNC int DIA_SLD_760_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_01"); //Chciałbym się dostać do kopalni.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_02");//Do kopalni? Nie wpuszczę nikogo, kto nie otrzymał upoważnienia od Okyla.

	if	(!Npc_KnowsInfo	(hero, DIA_SLD_752_OKYL_WERBISTDU))
	{
		AI_Output (other, self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_03");//Kim jest Okyl?
	}
	else
	{
		AI_Output (other, self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_08");//Okyl? Czy to nie ten gość w ciężkiej zbroi i z wielkim toporem?
	};
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_04");//Uważaj co mówisz o naszym szefie!
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_05");//Powiem ci coś o Okylu: to najtwardszy gość w całym Obozie. Kiedyś nawet wśliznął się do zamku w Starym Obozie i podwędził Magnatom spory ładunek rudy.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_06");//Więc na przyszłość radzę ci okazywać mu trochę więcej szacunku.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_07");//Nie wiem, gdzie jest teraz, ale jakbyś go spotkał, lepiej pamiętaj o tym, co ci dziś powiedziałem.
};



