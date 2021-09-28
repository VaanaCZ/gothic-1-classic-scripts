
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
	AI_Output (self, other,"DIA_SLD_761_Soeldner_INTRO_INFO_03_01"); //Co tady dìláš v tom dole?
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
	description 	= "Dìlám poøád tu samou práci.";
};

FUNC int DIA_SLD_761_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_EXIT_1_INFO()
{
	AI_Output (other, self,"DIA_SLD_761_Soeldner_EXIT_1_INFO_15_01"); //Dìlám poøád tu samou práci.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_EXIT_1_INFO_03_02");//Taky si to myslím.
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
	description 	= "Radìji pùjdu!";
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
	AI_Output (other, self,"DIA_SLD_761_Soeldner_EXIT_2_INFO_15_01"); //Radìji pùjdu!
	AI_Output (self, other,"DIA_SLD_761_Soeldner_EXIT_2_INFO_03_02");//Dobrá.
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
	description 	= "Jen jsem se chtìl porozhlédnout po táboøe.";
};

FUNC int DIA_SLD_761_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_UMSEHEN_INFO()
{  
	AI_Output (other, self,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_15_01"); //Jen jsem se chtìl porozhlédnout po táboøe.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_03_02");//Pak jsi pøišel na nesprávné místo, protože tohle je vchod do dolu, kam tì nepustíme.
};


//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_761_Soeldner_INMINE (C_INFO)
{
	npc				= SLD_761_Soeldner;
	condition		= DIA_SLD_761_Soeldner_INMINE_CONDITION;
	information		= DIA_SLD_761_Soeldner_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Chtìl jsem vidìt dùl.";
};

FUNC int DIA_SLD_761_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_761_Soeldner_INMINE_INFO_15_01");//Chtìl jsem vidìt dùl.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_INMINE_INFO_03_02");//Snad vidíš, že dùl je zamèený, takže tu není vùbec nic k vidìní.

};

//----------------------- Bestechen --------------------------------

instance DIA_SLD_761_Soeldner_Bribe (C_INFO)
{
	npc				= SLD_761_Soeldner;
	condition		= DIA_SLD_761_Soeldner_Bribe_CONDITION;
	information		= DIA_SLD_761_Soeldner_Bribe_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Nemohlo by se s tím nìco udìlat?";
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
	AI_Output (other, self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_01");//Nemohlo by se s tím nìco udìlat?
	AI_Output (self, other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_02");//Co bysme s tím mìli udìlat?
	AI_Output (self, other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_03");//Okamžik, jestli se mì pokoušíš podplatit, tak to jsi narazil na toho nesprávného.
	AI_Output (other, self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_04");//Ne, nepokoušel jsem se nikoho podplatit, jenom jsem myslel...
	AI_Output (other, self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_05");//Já myslím, že bys mìl radìji jít pryè.
	AI_StopProcessInfos	(self); 
};

