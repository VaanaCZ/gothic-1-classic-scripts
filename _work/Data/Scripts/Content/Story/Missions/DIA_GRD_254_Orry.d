// **************************************************
// 						 PRE EXIT 
// **************************************************

INSTANCE DIA_Orry_PreExit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_PreExit_Condition;
	information	= DIA_Orry_PreExit_Info;
	permanent	= 0;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_PreExit_Condition()
	
	{
		return 1;
	};

FUNC VOID DIA_Orry_PreExit_Info()
{
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //¡Será mejor que te asegures de llegar de una pieza al Campamento Viejo!
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Orry_Exit (C_INFO)
{
	npc			= GRD_254_Orry;
	nr			= 999;
	condition	= DIA_Orry_Exit_Condition;
	information	= DIA_Orry_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Orry_Exit_Condition()
{
	if (Npc_KnowsInfo (hero, DIA_Orry_PreExit))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 					Ich Wache
// **************************************************

INSTANCE DIA_Orry_GuardGate (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_GuardGate_Condition;
	information		= DIA_Orry_GuardGate_Info;
	permanent		= 0;
	description		= "¿Qué haces aquí?"; 
};

FUNC INT DIA_Orry_GuardGate_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_GuardGate_Info()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //¿Qué haces aquí?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Asegurando que nadie se acerca al lugar de intercambio. Especialmente ninguno de esos asesinos del Campamento Nuevo.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Eres el tipo nuevo que han arrojado hoy, ¿verdad?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //Sí.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //¡Entonces, ten cuidado con los tipos del Campamento Nuevo!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Trabajo para el Campamento Viejo, igual que los demás que viste en la lonja.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //Supongo que has hablado con Diego...
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"No.",DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"Sí.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //No.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //¡Pues hazlo! Él es el que recibe a los recién llegados.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //Sabe muchas cosas de la colonia; cosas que son importantes para la gente nueva como tú.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //Sí, lo he hecho.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //Bien. Entonces ya sabes lo que pasa por aquí.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

// **************************************************
// 					New Camp
// **************************************************

INSTANCE DIA_Orry_NewCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 1;
	condition		= DIA_Orry_NewCamp_Condition;
	information		= DIA_Orry_NewCamp_Info;
	permanent		= 0;
	description		= "¿Por qué tengo que estar pendiente de los tipos del Campamento Nuevo?"; 
};

FUNC INT DIA_Orry_NewCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_NewCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //¿Por qué tengo que estar pendiente de los tipos del Campamento Nuevo?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //Comparado con el Campamento Nuevo, el Campamento Viejo es un lugar tranquilo y pacífico.
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //En el Campamento Nuevo no se reciben provisiones del mundo exterior. La mayoría de los bandidos de allí roban lo que necesitan.
};

// **************************************************
// 					Old Camp
// **************************************************

INSTANCE DIA_Orry_OldCamp (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 2;
	condition		= DIA_Orry_OldCamp_Condition;
	information		= DIA_Orry_OldCamp_Info;
	permanent		= 0;
	description		= "¿Y el Campamento Viejo?"; 
};

FUNC INT DIA_Orry_OldCamp_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_OldCamp_Info()
{
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //¿Y el Campamento Viejo?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //Los magnates del mineral tienen todo bajo control. A continuación están los guardias, seguidos por las Sombras. Los cavadores son el estrato inferior.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Todo el que llega aquí empieza como cavador. Si quieres ser algo mejor, primero tendrás que ser aceptado en las Sombras.
};

// **************************************************
// 					Shore
// **************************************************

INSTANCE DIA_Orry_Shore (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Shore_Condition;
	information		= DIA_Orry_Shore_Info;
	permanent		= 0;
	description		= "Cuando desembarqué, uno de los tipos me dio un puñetazo en la cara."; 
};

FUNC INT DIA_Orry_Shore_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Shore_Info()
{
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Cuando desembarqué, uno de los tipos me dio un puñetazo en la cara.
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //Se lo hacen a todos los recién llegados. Lo llaman 'el Padrino'.
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //Oh. ¿En el Campamento Viejo son todos así?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //Tenemos a unos cuantos capullos. Pero no te pondrán la mano encima si les pagas dinero a cambio de protección.
};

// **************************************************
// 					Frau
// **************************************************

INSTANCE DIA_Orry_Woman (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Woman_Condition;
	information		= DIA_Orry_Woman_Info;
	permanent		= 0;
	description		= "Vi que mandaban a una mujer con las mercancías."; 
};

FUNC INT DIA_Orry_Woman_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Woman_Info()
{
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //Vi que mandaban a una mujer con las mercancías.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //Sí, los magnates del mineral consiguen todo lo que quieren.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //¿El rey intercambia mujeres por mineral?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //También son criminales convictas. Si Gómez no las hubiese pedido, estarían encerradas en alguna mazmorra.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //No sé lo que es peor.
};

// **************************************************
// 					Waffe
// **************************************************

INSTANCE DIA_Orry_Waffe (C_INFO)
{
	npc				= GRD_254_Orry;
	nr				= 3;
	condition		= DIA_Orry_Waffe_Condition;
	information		= DIA_Orry_Waffe_Info;
	permanent		= 0;
	description		= "Busco un arma."; 
};

FUNC INT DIA_Orry_Waffe_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Orry_GuardGate))
	{
		return 1;
	};
};

FUNC VOID DIA_Orry_Waffe_Info()
{
	AI_Output (other, self,"DIA_Orry_Waffe_15_00"); //Busco un arma.
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //Debe haber algunas armas viejas en la mina derruida bajando por el cañón.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Pero no inicies una guerra con un pico herrumbroso a modo de arma... Son lentos y pesados.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Un guerrero inexperto no debería usarlos, salvo en una emergencia.
	
};



