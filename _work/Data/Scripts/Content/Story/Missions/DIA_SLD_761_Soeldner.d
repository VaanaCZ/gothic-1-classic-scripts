
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
	AI_Output (self, other,"DIA_SLD_761_Soeldner_INTRO_INFO_03_01"); //Co tady d�l� v tom dole?
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
	description 	= "D�l�m po��d tu samou pr�ci.";
};

FUNC int DIA_SLD_761_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_EXIT_1_INFO()
{
	AI_Output (other, self,"DIA_SLD_761_Soeldner_EXIT_1_INFO_15_01"); //D�l�m po��d tu samou pr�ci.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_EXIT_1_INFO_03_02");//Taky si to mysl�m.
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
	description 	= "Rad�ji p�jdu!";
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
	AI_Output (other, self,"DIA_SLD_761_Soeldner_EXIT_2_INFO_15_01"); //Rad�ji p�jdu!
	AI_Output (self, other,"DIA_SLD_761_Soeldner_EXIT_2_INFO_03_02");//Dobr�.
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
	description 	= "Jen jsem se cht�l porozhl�dnout po t�bo�e.";
};

FUNC int DIA_SLD_761_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_UMSEHEN_INFO()
{  
	AI_Output (other, self,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_15_01"); //Jen jsem se cht�l porozhl�dnout po t�bo�e.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_03_02");//Pak jsi p�i�el na nespr�vn� m�sto, proto�e tohle je vchod do dolu, kam t� nepust�me.
};


//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_761_Soeldner_INMINE (C_INFO)
{
	npc				= SLD_761_Soeldner;
	condition		= DIA_SLD_761_Soeldner_INMINE_CONDITION;
	information		= DIA_SLD_761_Soeldner_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Cht�l jsem vid�t d�l.";
};

FUNC int DIA_SLD_761_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_761_Soeldner_INMINE_INFO_15_01");//Cht�l jsem vid�t d�l.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_INMINE_INFO_03_02");//Snad vid�, �e d�l je zam�en�, tak�e tu nen� v�bec nic k vid�n�.

};

//----------------------- Bestechen --------------------------------

instance DIA_SLD_761_Soeldner_Bribe (C_INFO)
{
	npc				= SLD_761_Soeldner;
	condition		= DIA_SLD_761_Soeldner_Bribe_CONDITION;
	information		= DIA_SLD_761_Soeldner_Bribe_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Nemohlo by se s t�m n�co ud�lat?";
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
	AI_Output (other, self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_01");//Nemohlo by se s t�m n�co ud�lat?
	AI_Output (self, other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_02");//Co bysme s t�m m�li ud�lat?
	AI_Output (self, other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_03");//Okam�ik, jestli se m� pokou�� podplatit, tak to jsi narazil na toho nespr�vn�ho.
	AI_Output (other, self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_04");//Ne, nepokou�el jsem se nikoho podplatit, jenom jsem myslel...
	AI_Output (other, self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_05");//J� mysl�m, �e bys m�l rad�ji j�t pry�.
	AI_StopProcessInfos	(self); 
};

