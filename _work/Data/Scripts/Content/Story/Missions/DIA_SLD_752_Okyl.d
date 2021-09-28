
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
	AI_Output (self, other,"DIA_SLD_752_OKYL_INTRO_INFO_11_01"); //¡Eh, tú! Tú no eres uno de mis hombres. ¿Qué estás haciendo aquí?
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
	description 	= "¡Tengo que continuar!";
};

FUNC int DIA_SLD_752_OKYL_EXIT_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_EXIT_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_EXIT_INFO_15_01"); //¡Tengo que seguir adelante!
	AI_Output (self, other,"DIA_SLD_752_OKYL_EXIT_INFO_11_02");//Entonces déjame en paz.
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
	description 	= "Sólo echaré un vistazo.";
};

FUNC int DIA_SLD_752_OKYL_UMSEHEN_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_UMSEHEN_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_UMSEHEN_INFO_15_01"); //Sólo quiero echar una ojeada.
	AI_Output (self, other,"DIA_SLD_752_OKYL_UMSEHEN_INFO_11_02");//Entonces cuidado con pifiarla aquí en la Hondonada o acabarás en una tumba antes de lo que te piensas.
};

//--------------------- Wer bist Du -----------------------------

instance DIA_SLD_752_OKYL_WERBISTDU (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_WERBISTDU_CONDITION;
	information		= DIA_SLD_752_OKYL_WERBISTDU_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "¿Quién eres?";
};

FUNC int DIA_SLD_752_OKYL_WERBISTDU_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_WERBISTDU_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_WERBISTDU_INFO_15_01"); //¿Quién eres tú?
	AI_Output (self, other,"DIA_SLD_752_OKYL_WERBISTDU_INFO_11_02");//Me llamo Okyl. Soy el jefe en la Hondonada.

};

//----------------------- Will nur mal in die Mine ------------------

instance DIA_SLD_752_OKYL_INMINE (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_INMINE_CONDITION;
	information		= DIA_SLD_752_OKYL_INMINE_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "Sólo quería echar un vistazo dentro de la mina.";
};

FUNC int DIA_SLD_752_OKYL_INMINE_CONDITION()
{
	return 1;
};

func void DIA_SLD_752_OKYL_INMINE_INFO()
{
	AI_Output (other, self,"DIA_SLD_752_OKYL_INMINE_INFO_15_01"); //Sólo quería echarle un vistazo a la mina.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_02");//Oh, sólo querías dar un paseo por la mina.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_03");//Supongo que no tienes ni idea de lo que está pasando aquí. Nadie pone un pie en la mina sin mi permiso.
	AI_Output (self, other,"DIA_SLD_752_OKYL_INMINE_INFO_11_04");//Recuerda siempre esto: ¡el que entre en la mina o la caseta de guardia sin mi permiso es hombre muerto!
};

//----------------------- Erlaubniss kriegen -------------------------

instance DIA_SLD_752_OKYL_PERMIT (C_INFO)
{
	npc				= SLD_752_OKYL;
	condition		= DIA_SLD_752_OKYL_PERMIT_CONDITION;
	information		= DIA_SLD_752_OKYL_PERMIT_INFO;
	important		= 0;
	permanent		= 0;
	description 	= "¿Me dejarán entrar?";
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
	AI_Output (other, self,"DIA_SLD_752_OKYL_PERMIT_INFO_15_01");//¿Me das permiso para entrar?
	AI_Output (self, other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_02");//Ni siquiera sé quien eres. ¿Por qué iba a dejarte entrar en la mina?
	AI_Output (self, other,"DIA_SLD_752_OKYL_PERMIT_INFO_11_03");//Ahora lárgate, que tengo cosas que hacer.
	AI_StopProcessInfos (self);
};
