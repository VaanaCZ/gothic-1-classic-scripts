
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
	AI_Output (self, other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01"); //Hej, ty! Nie jesteś jednym z moich ludzi! Czego tu szukasz?!
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
	description 	= "Muszę już iść.";
};

FUNC int DIA_SLD_752_OKYL_EXIT_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_EXIT_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01"); //Muszę już iść.
	AI_Output (self, other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02");//To nie zawracaj mi głowy!
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
	description 	= "Tylko się tu trochę rozejrzę.";
};

FUNC int DIA_SLD_752_OKYL_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_UMSEHEN_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01"); //Tylko się tu trochę rozejrzę.
	AI_Output (self, other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");//Tylko nie próbuj rozrabiać w Kotle, bo trafisz do piachu szybciej niż myślisz.
};

//--------------------- Wer bist Du -----------------------------

instance DIA_SLD_752_OKYL_WERBISTDU (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_WERBISTDU_CONDITION;
	information		= DIA_SLD_752_OKYL_WERBISTDU_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Kim jesteś?";
};

FUNC int DIA_SLD_752_OKYL_WERBISTDU_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_WERBISTDU_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01"); //Kim jesteś?
	AI_Output (self, other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");//Jestem Okyl. To ja rozkazuję w Kotle.

};

//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_752_OKYL_INMINE (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_INMINE_CONDITION;
	information		= DIA_SLD_752_OKYL_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chciałem rzucić okiem na kopalnię.";
};

FUNC int DIA_SLD_752_OKYL_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01"); //Chciałem rzucić okiem na kopalnię.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");//Och, chciałeś sobie zrobić mały spacer po kopalni, co?
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");//Widzę, że nie masz pojęcia co się tutaj dzieje. Nikt nie może wejść do kopalni bez mojego pozwolenia.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");//I zapamiętaj sobie: ktokolwiek wejdzie do stróżówki bez mojej zgody, będzie martwym człowiekiem.
};

//----------------------- Erlaubniss kriegen -------------------------

instance DIA_SLD_752_OKYL_PERMIT (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_PERMIT_CONDITION;
	information		= DIA_SLD_752_OKYL_PERMIT_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Udzielisz mi powodzenia?";
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
	AI_Output (other, self,"DIA_SLD_752_OKYL_PERMIT_INFO_15_01");//Udzielisz mi powodzenia?
	AI_Output (self, other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");//Nawet cię nie znam. Dlaczego miałbym cię wpuścić do kopalni?
	AI_Output (self, other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");//A teraz spadaj stąd, mam dużo roboty.
	AI_StopProcessInfos (self);
};
