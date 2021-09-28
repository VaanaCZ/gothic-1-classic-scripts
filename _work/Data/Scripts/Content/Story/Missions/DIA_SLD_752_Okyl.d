
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
	AI_Output (self, other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01"); //Hej, ty! Nie jeste� jednym z moich ludzi! Czego tu szukasz?!
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
	description 	= "Musz� ju� i��.";
};

FUNC int DIA_SLD_752_OKYL_EXIT_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_EXIT_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01"); //Musz� ju� i��.
	AI_Output (self, other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02");//To nie zawracaj mi g�owy!
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
	description 	= "Tylko si� tu troch� rozejrz�.";
};

FUNC int DIA_SLD_752_OKYL_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_UMSEHEN_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01"); //Tylko si� tu troch� rozejrz�.
	AI_Output (self, other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");//Tylko nie pr�buj rozrabia� w Kotle, bo trafisz do piachu szybciej ni� my�lisz.
};

//--------------------- Wer bist Du -----------------------------

instance DIA_SLD_752_OKYL_WERBISTDU (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_WERBISTDU_CONDITION;
	information		= DIA_SLD_752_OKYL_WERBISTDU_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Kim jeste�?";
};

FUNC int DIA_SLD_752_OKYL_WERBISTDU_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_WERBISTDU_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01"); //Kim jeste�?
	AI_Output (self, other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");//Jestem Okyl. To ja rozkazuj� w Kotle.

};

//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_752_OKYL_INMINE (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_INMINE_CONDITION;
	information		= DIA_SLD_752_OKYL_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chcia�em rzuci� okiem na kopalni�.";
};

FUNC int DIA_SLD_752_OKYL_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01"); //Chcia�em rzuci� okiem na kopalni�.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");//Och, chcia�e� sobie zrobi� ma�y spacer po kopalni, co?
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");//Widz�, �e nie masz poj�cia co si� tutaj dzieje. Nikt nie mo�e wej�� do kopalni bez mojego pozwolenia.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");//I zapami�taj sobie: ktokolwiek wejdzie do str��wki bez mojej zgody, b�dzie martwym cz�owiekiem.
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
	AI_Output (self, other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");//Nawet ci� nie znam. Dlaczego mia�bym ci� wpu�ci� do kopalni?
	AI_Output (self, other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");//A teraz spadaj st�d, mam du�o roboty.
	AI_StopProcessInfos (self);
};
