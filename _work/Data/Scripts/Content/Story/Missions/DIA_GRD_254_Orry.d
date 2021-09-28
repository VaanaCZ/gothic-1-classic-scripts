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
	AI_Output (self, other,"DIA_Orry_PreExit_06_00"); //�Ser� mejor que te asegures de llegar de una pieza al Campamento Viejo!
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
	description		= "�Qu� haces aqu�?"; 
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
	AI_Output (other, self,"DIA_Orry_GuardGate_15_00"); //�Qu� haces aqu�?
	AI_Output (self, other,"DIA_Orry_GuardGate_06_01"); //Asegurando que nadie se acerca al lugar de intercambio. Especialmente ninguno de esos asesinos del Campamento Nuevo.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_02"); //Eres el tipo nuevo que han arrojado hoy, �verdad?
	AI_Output (other, self,"DIA_Orry_GuardGate_15_03"); //S�.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_04"); //�Entonces, ten cuidado con los tipos del Campamento Nuevo!
	AI_Output (self, other,"DIA_Orry_GuardGate_06_05"); //Trabajo para el Campamento Viejo, igual que los dem�s que viste en la lonja.
	AI_Output (self, other,"DIA_Orry_GuardGate_06_06"); //Supongo que has hablado con Diego...
	Info_ClearChoices	(DIA_Orry_GuardGate );
	Info_AddChoice		(DIA_Orry_GuardGate,"No.",DIA_Orry_GuardGate_No);
	Info_AddChoice		(DIA_Orry_GuardGate,"S�.",DIA_Orry_GuardGate_Yes);
};

func void DIA_Orry_GuardGate_No()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_No_15_00"); //No.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_01"); //�Pues hazlo! �l es el que recibe a los reci�n llegados.
	AI_Output (self, other,"DIA_Orry_GuardGate_No_06_02"); //Sabe muchas cosas de la colonia; cosas que son importantes para la gente nueva como t�.
	Info_ClearChoices	(DIA_Orry_GuardGate );
};

func void DIA_Orry_GuardGate_Yes()
{
	AI_Output (other, self,"DIA_Orry_GuardGate_Yes_15_00"); //S�, lo he hecho.
	AI_Output (self, other,"DIA_Orry_GuardGate_Yes_06_01"); //Bien. Entonces ya sabes lo que pasa por aqu�.
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
	description		= "�Por qu� tengo que estar pendiente de los tipos del Campamento Nuevo?"; 
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
	AI_Output (other, self,"DIA_Orry_NewCamp_15_00"); //�Por qu� tengo que estar pendiente de los tipos del Campamento Nuevo?
	AI_Output (self, other,"DIA_Orry_NewCamp_06_01"); //Comparado con el Campamento Nuevo, el Campamento Viejo es un lugar tranquilo y pac�fico.
	AI_Output (self, other,"DIA_Orry_NewCamp_06_02"); //En el Campamento Nuevo no se reciben provisiones del mundo exterior. La mayor�a de los bandidos de all� roban lo que necesitan.
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
	description		= "�Y el Campamento Viejo?"; 
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
	AI_Output (other, self,"DIA_Orry_OldCamp_15_00"); //�Y el Campamento Viejo?
	AI_Output (self, other,"DIA_Orry_OldCamp_06_01"); //Los magnates del mineral tienen todo bajo control. A continuaci�n est�n los guardias, seguidos por las Sombras. Los cavadores son el estrato inferior.
	AI_Output (self, other,"DIA_Orry_OldCamp_06_02"); //Todo el que llega aqu� empieza como cavador. Si quieres ser algo mejor, primero tendr�s que ser aceptado en las Sombras.
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
	description		= "Cuando desembarqu�, uno de los tipos me dio un pu�etazo en la cara."; 
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
	AI_Output (other, self,"DIA_Orry_Shore_15_00"); //Cuando desembarqu�, uno de los tipos me dio un pu�etazo en la cara.
	AI_Output (self, other,"DIA_Orry_Shore_06_01"); //Se lo hacen a todos los reci�n llegados. Lo llaman 'el Padrino'.
	AI_Output (other, self,"DIA_Orry_Shore_15_02"); //Oh. �En el Campamento Viejo son todos as�?
	AI_Output (self, other,"DIA_Orry_Shore_06_03"); //Tenemos a unos cuantos capullos. Pero no te pondr�n la mano encima si les pagas dinero a cambio de protecci�n.
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
	description		= "Vi que mandaban a una mujer con las mercanc�as."; 
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
	AI_Output (other, self,"DIA_Orry_Woman_15_00"); //Vi que mandaban a una mujer con las mercanc�as.
	AI_Output (self, other,"DIA_Orry_Woman_06_01"); //S�, los magnates del mineral consiguen todo lo que quieren.
	AI_Output (other, self,"DIA_Orry_Woman_15_02"); //�El rey intercambia mujeres por mineral?
	AI_Output (self, other,"DIA_Orry_Woman_06_03"); //Tambi�n son criminales convictas. Si G�mez no las hubiese pedido, estar�an encerradas en alguna mazmorra.
	AI_Output (self, other,"DIA_Orry_Woman_06_04"); //No s� lo que es peor.
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
	AI_Output (self, other,"DIA_Orry_Waffe_06_01"); //Debe haber algunas armas viejas en la mina derruida bajando por el ca��n.
	AI_Output (self, other,"DIA_Orry_Waffe_06_02"); //Pero no inicies una guerra con un pico herrumbroso a modo de arma... Son lentos y pesados.
	AI_Output (self, other,"DIA_Orry_Waffe_06_03"); //Un guerrero inexperto no deber�a usarlos, salvo en una emergencia.
	
};



