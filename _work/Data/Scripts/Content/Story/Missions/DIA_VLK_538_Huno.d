// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Huno_Exit (C_INFO)
{
	npc			= Vlk_538_Huno;
	nr			= 999;
	condition	= DIA_Huno_Exit_Condition;
	information	= DIA_Huno_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Huno_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Huno_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//	Info YouKnowYourJob
// **************************************************
INSTANCE DIA_Huno_YouKnowYourJob (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_YouKnowYourJob_Condition;
	information		= DIA_Huno_YouKnowYourJob_Info;
	permanent		= 0;
	important		= 0;
	description		= "Parece como si supieras lo que estás haciendo.";
};

FUNC INT DIA_Huno_YouKnowYourJob_Condition()
{	
	return TRUE;
};

FUNC VOID DIA_Huno_YouKnowYourJob_Info()
{
	AI_Output (other,self,"DIA_Huno_YouKnowYourJob_15_00"); //Parece que sabías lo que estabas haciendo.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_01"); //Todavía no se ha quejado nadie.
	AI_Output (self,other,"DIA_Huno_YouKnowYourJob_09_02"); //Pero ésa sería una mala idea. Todos los idiotas de por aquí necesitan una espada y eso es lo que yo les proporciono.
};


// **************************************************
//	Info HowLong
// **************************************************
INSTANCE DIA_Huno_HowLong (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowLong_Condition;
	information		= DIA_Huno_HowLong_Info;
	permanent		= 0;
	important		= 0;
	description		= "¿Cuánto tiempo tardas en hacer una espada?";
};

FUNC INT DIA_Huno_HowLong_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowLong_Info()
{
	AI_Output (other,self,"DIA_Huno_HowLong_15_00"); //¿Cuánto tiempo tardas en hacer una espada?
	AI_Output (self,other,"DIA_Huno_HowLong_09_01"); //Depende. Con las espadas sencillas soy más rápido que el viento.
	AI_Output (self,other,"DIA_Huno_HowLong_09_02"); //Eso sí, a condición de que el precio me motive.
	AI_Output (self,other,"DIA_Huno_HowLong_09_03"); //Un bichejo como Whistler suele tener que esperar más que otros por su juguete.
	AI_Output (other,self,"DIA_Huno_HowLong_15_04"); //¿Por qué? ¿Es que no te paga lo suficiente?
	AI_Output (self,other,"DIA_Huno_HowLong_09_05"); //No, al contrario. Me pagó 150 pepitas por su última espada.
	AI_Output (self,other,"DIA_Huno_HowLong_09_06"); //A ese tipo le gustan las decoraciones y mariconadas de esas y, por supuesto, eso sale caro..
	AI_Output (self,other,"DIA_Huno_HowLong_09_07"); //Oye, eres curioso de verdad, amigo.
};

// **************************************************
//	Info HowsYourBusiness
// **************************************************
INSTANCE DIA_Huno_HowsYourBusiness (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_HowsYourBusiness_Condition;
	information		= DIA_Huno_HowsYourBusiness_Info;
	permanent		= 1;
	important		= 0;
	description		= "¿Qué tal va el negocio, herrero?";
};

FUNC INT DIA_Huno_HowsYourBusiness_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_HowsYourBusiness_Info()
{
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_00"); //Hola, herrero ¿cómo va el negocio?
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_01"); //¿Por qué quieres saberlo?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_02"); //Puede que tenga un encargo para ti.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_03"); //¿Oh? ¿De verdad? ¿Qué encargo?
	AI_Output (other,self,"DIA_Huno_HowsYourBusiness_15_04"); //Me lo pensaré.
	AI_Output (self,other,"DIA_Huno_HowsYourBusiness_09_05"); //Vuelve cuando necesites algo de verdad y no me des el coñazo.
};

// **************************************************
//	Info LEARNSMITH
// **************************************************
var int	Huno_LearnSmith;
// **************************************************

INSTANCE DIA_Huno_LEARNSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_LEARNSMITH_Condition;
	information		= DIA_Huno_LEARNSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "También me gustaría intentar trabajar aquí.";
};

FUNC INT DIA_Huno_LEARNSMITH_Condition()
{	
	if	Npc_KnowsInfo(hero, DIA_Huno_YouKnowYourJob)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_LEARNSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_00"); //A mí también me gustaría trabajar aquí.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_01"); //¡Oh, pero no te creas que tú también puedes fabricar buenas espadas!
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_02"); //¿Qué es lo que tengo que hacer?
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_03"); //Vale, coge el acero y ponlo en el fuego.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_04"); //Después tienes que depositar el acero al rojo sobre el yunque.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_05"); //Cuando hayas acabado, pon la espada caliente en ese cubo para templarla.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_06"); //Por último, una vez fría, la espada tiene que ser afilada en la piedra de afilar.
	AI_Output (other,self,"DIA_Huno_LEARNSMITH_15_07"); //Entiendo.
	AI_Output (self,other,"DIA_Huno_LEARNSMITH_09_08"); //Pero para hacer eso te harán falta unas cuantas cosas. Yo podría vendértelas.

	Huno_LearnSmith = TRUE;
};

// **************************************************
//	Info BUYSMITH
// **************************************************
INSTANCE DIA_Huno_BUYSMITH (C_INFO)
{
	npc				= Vlk_538_Huno;
	nr				= 2;
	condition		= DIA_Huno_BUYSMITH_Condition;
	information		= DIA_Huno_BUYSMITH_Info;
	permanent		= 1;
	important		= 0;
	description		= "¡Me gustaría comprar material de herrería!";
	trade			= 1;
};

FUNC INT DIA_Huno_BUYSMITH_Condition()
{	
	if	(Huno_LearnSmith == TRUE)
	{
		return TRUE;
	};
};

FUNC VOID DIA_Huno_BUYSMITH_Info()
{
	AI_Output (other,self,"DIA_Huno_BUYSMITH_15_00"); //¡Quiero comprar herramientas de herrería!

	if	(Npc_HasItems(self,ItMiSwordRaw		) < 5)		{	CreateInvItems(self,ItMiSwordRaw,		5);	};
	if	(Npc_HasItems(self,ItMiSwordRawHot	) < 5)		{	CreateInvItems(self,ItMiSwordRawHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBladeHot) < 5)		{	CreateInvItems(self,ItMiSwordBladeHot,	5);	};
	if	(Npc_HasItems(self,ItMiSwordBlade	) < 5)		{	CreateInvItems(self,ItMiSwordBlade,		5);	};
};


