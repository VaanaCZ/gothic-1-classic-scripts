
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
	AI_Output (self, other,"DIA_SLD_761_Soeldner_INTRO_INFO_03_01"); //�Qu� est�is haciendo en esta mina?
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
	description 	= "A�n tengo cosas que hacer.";
};

FUNC int DIA_SLD_761_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_EXIT_1_INFO()
{
	AI_Output (other, self,"DIA_SLD_761_Soeldner_EXIT_1_INFO_15_01"); //Todav�a tengo cosas que hacer.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_EXIT_1_INFO_03_02");//Eso creo yo tambi�n.
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
	description 	= "Ser� mejor que me marche.";
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
	AI_Output (other, self,"DIA_SLD_761_Soeldner_EXIT_2_INFO_15_01"); //Ser� mejor que me marche.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_EXIT_2_INFO_03_02");//Vale.
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
	description 	= "S�lo quer�a echar un vistazo en el campamento.";
};

FUNC int DIA_SLD_761_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_UMSEHEN_INFO()
{  
	AI_Output (other, self,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_15_01"); //S�lo quer�a echar un vistazo por el Campamento.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_UMSEHEN_INFO_03_02");//Entonces has venido al lugar equivocado, porque �sta es la entrada de la mina y no puedes cruzarla.
};


//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_761_Soeldner_INMINE (C_INFO)
{
	npc				= SLD_761_Soeldner;
	condition		= DIA_SLD_761_Soeldner_INMINE_CONDITION;
	information		= DIA_SLD_761_Soeldner_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "S�lo quer�a ver la mina.";
};

FUNC int DIA_SLD_761_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_761_Soeldner_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_761_Soeldner_INMINE_INFO_15_01");//S�lo quer�a ver la mina.
	AI_Output (self, other,"DIA_SLD_761_Soeldner_INMINE_INFO_03_02");//Supongo que puedes ver que la mina est� cerrada, as� que no hay absolutamente nada que ver.

};

//----------------------- Bestechen --------------------------------

instance DIA_SLD_761_Soeldner_Bribe (C_INFO)
{
	npc				= SLD_761_Soeldner;
	condition		= DIA_SLD_761_Soeldner_Bribe_CONDITION;
	information		= DIA_SLD_761_Soeldner_Bribe_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "�No podemos hacer nada al respecto?";
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
	AI_Output (other, self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_01");//�No hay nada que pueda hacer al respecto?
	AI_Output (self, other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_02");//�Qu� podr�a hacerse al respecto?
	AI_Output (self, other,"DIA_SLD_761_Soeldner_Bribe_INFO_03_03");//Un momento; si est�s intentando sobornarme, has ido a dar con la persona equivocada.
	AI_Output (other, self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_04");//No, no estaba intentando sobornar a nadie; es s�lo que pens�...
	AI_Output (other, self,"DIA_SLD_761_Soeldner_Bribe_INFO_15_05");//Ser� mejor que me marche.
	AI_StopProcessInfos	(self); 
};

