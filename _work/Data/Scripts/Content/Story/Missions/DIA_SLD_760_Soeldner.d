
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
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INTRO_INFO_13_01"); //¿Qué andas buscando? Deja que te diga una cosa: mantén las manos alejadas de la puerta.
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
	description 	= "Será mejor que me marche.";
};

FUNC int DIA_SLD_760_Soeldner_EXIT_1_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_EXIT_1_INFO()
{
	AI_Output (other, self,"DIA_SLD_760_Soeldner_EXIT_1_INFO_15_01"); //Será mejor que me vaya.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_EXIT_1_INFO_13_02");//Espero que nos entendamos.
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
	description 	= "Tengo que continuar.";
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
	AI_Output (other, self,"DIA_SLD_760_Soeldner_EXIT_2_INFO_15_01"); //Necesito seguir adelante.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_EXIT_2_INFO_13_02");//Bueno, pues vete.
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
	description 	= "Simplemente me gustaría echar un vistazo.";
};

FUNC int DIA_SLD_760_Soeldner_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_UMSEHEN_INFO()
{
	AI_Output (other, self,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_15_01"); //Me gustaría echar un vistazo por aquí.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_UMSEHEN_INFO_13_02");//Entonces no saques las manos de los bolsillos o te las corto.
};


//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_760_Soeldner_INMINE (C_INFO)
{
	npc				= SLD_760_Soeldner;
	condition		= DIA_SLD_760_Soeldner_INMINE_CONDITION;
	information		= DIA_SLD_760_Soeldner_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Quiero entrar en la mina.";
};

FUNC int DIA_SLD_760_Soeldner_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_760_Soeldner_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_01"); //Quiero entrar en la mina.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_02");//¿En la mina? No dejo entrar a nadie en la mina sin el permiso expreso de Okyl.

	if	(!Npc_KnowsInfo	(hero, DIA_SLD_752_OKYL_WERBISTDU))
	{
		AI_Output (other, self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_03");//¿Quién es Okyl?
	}
	else
	{
		AI_Output (other, self,"DIA_SLD_760_Soeldner_INMINE_INFO_15_08");//¿Okyl? ¿No es ese que lleva un pedazo de hacha y una armadura pesada?
	};
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_04");//Cuidadito con lo que dices de nuestro jefe.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_05");//Déjame que te cuente una cosa sobre Okyl; es el tipo más duro de todo el Campamento. Una vez incluso se coló en el Campamento Viejo y le robó un montón de mineral a los Magnates.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_06");//Así que muestra un poco más de respeto, por favor.
	AI_Output (self, other,"DIA_SLD_760_Soeldner_INMINE_INFO_13_07");//No sé dónde está, pero si le ves deberías tener presente esa historia.
};



