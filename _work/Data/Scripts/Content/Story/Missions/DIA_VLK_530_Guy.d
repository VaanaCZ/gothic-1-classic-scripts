// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Guy_Exit (C_INFO)
{
	npc			= Vlk_530_Guy;
	nr			= 999;
	condition	= DIA_Guy_Exit_Condition;
	information	= DIA_Guy_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Guy_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Guy_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Guy_Hello (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_Hello_Condition;
	information		= DIA_Guy_Hello_Info;
	permanent		= 0;
	description 	= "�Hola!";
};

FUNC INT DIA_Guy_Hello_Condition()
{	
	if (Kapitel <= 1)
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_Hello_Info()
{
	AI_Output (other, self,"DIA_Guy_Hello_15_00"); //�Hola!
	AI_Output (self, other,"DIA_Guy_Hello_03_01"); //�Mm? No te conozco; eres nuevo aqu�, �verdad?
	AI_Output (other, self,"DIA_Guy_Hello_15_02"); //Acabo de llegar.
	AI_Output (self, other,"DIA_Guy_Hello_03_03"); //�Ya has decido a qu� campamento unirte?
	AI_Output (other, self,"DIA_Guy_Hello_15_04"); //No. �T� qu� opinas?
	AI_Output (self, other,"DIA_Guy_Hello_03_05"); //Bueno, depende; supongo que cada campamento tiene sus ventajas.
	AI_Output (self, other,"DIA_Guy_Hello_03_06"); //Puedes quedarte aqu� hasta que tomes una decisi�n; acaba de quedar libre una caba�a.
};

// **************************************************
// 				Advantages OC
// **************************************************

INSTANCE DIA_Guy_AdOC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 2;
	condition		= DIA_Guy_AdOC_Condition;
	information		= DIA_Guy_AdOC_Info;
	permanent		= 1;
	description 	= "�Qu� ventajas tiene el Campamento Viejo?";
};

FUNC INT DIA_Guy_AdOC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdOC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdOC_15_00"); //�Cu�les son las ventajas del Campamento Viejo?
	AI_Output (self, other,"DIA_Guy_AdOC_03_01"); //Si pagas a los guardias para que te protejan, aqu� puedes llevar una vida relajada. Siempre intervienen cuando uno de los cavadores que les han pagado es atacado.
	AI_Output (self, other,"DIA_Guy_AdOC_03_02"); //Adem�s, �ste es el �nico sitio en el que puedes conseguir a bajo precio las mercanc�as que llegan del mundo exterior. Estas cosas tienen precios prohibitivos en los otros campamentos.

	Info_ClearChoices(DIA_Guy_AdOC);
	Info_AddChoice	 (DIA_Guy_AdOC,"Creo que ya s� suficientes cosas del Campamento Viejo.",DIA_Guy_AdOC_BACK);
	Info_AddChoice	 (DIA_Guy_AdOC,"�Qu� mercanc�as se consideran preciosas aqu�?",DIA_Guy_AdOC_Warez);
	Info_AddChoice	 (DIA_Guy_AdOC,"�Y si se pelean dos personas que pagan dinero a cambio de protecci�n?",DIA_Guy_AdOC_Protection);
};	

func void DIA_Guy_AdOC_BACK()
{
	AI_Output (other, self,"DIA_Guy_AdOC_BACK_15_00"); //Me parece que ya he o�do suficiente acerca del Campamento Viejo.
	AI_Output (self, other,"DIA_Guy_AdOC_BACK_03_01"); //Me gusta este lugar.
	Info_ClearChoices(DIA_Guy_AdOC);
};

func void DIA_Guy_AdOC_Warez()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Warez_15_00"); //�Qu� mercanc�as se consideran preciosas en este lugar?
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_01"); //Todo lo que venga del mundo exterior. Pan, queso, panceta y, sobre todo, cerveza y vino; no el cutre aguardiente de arroz del Campamento Nuevo, sino algo bueno de verdad.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_02"); //Siempre se puede obtener un buen precio por las armas, y las armaduras son car�simas.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_03"); //Los guardias les quitaron sus viejas armaduras a los custodios de la prisi�n despu�s de matarlos.
	AI_Output (self, other,"DIA_Guy_AdOC_Warez_03_04"); //Siempre podr�s reconocerlos por la armadura; s�lo se la venden a otros guardias. Un forastero no podr�a conseguirlas.
};

func void DIA_Guy_AdOC_Protection()
{
	AI_Output (other, self,"DIA_Guy_AdOC_Protection_15_00"); //�Y si se pelean dos personas que paguen por la protecci�n?
	AI_Output (self, other,"DIA_Guy_AdOC_Protection_03_01"); //Entonces los guardias se limitan a mirar, hasta que uno mata al otro. Entonces le liquidan.
};

// **************************************************
// 				Advantages NewCamp
// **************************************************

INSTANCE DIA_Guy_AdNC (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 3;
	condition		= DIA_Guy_AdNC_Condition;
	information		= DIA_Guy_AdNC_Info;
	permanent		= 0;
	description 		= "�Cu�les son las ventajas del Campamento Nuevo?";
};

FUNC INT DIA_Guy_AdNC_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdNC_Info()
{
	AI_Output (other, self,"DIA_Guy_AdNC_15_00"); //�Cu�les son las ventajas del Campamento Nuevo?
	AI_Output (self, other,"DIA_Guy_AdNC_03_01"); //Si te gusta que te deg�ellen por una rebanada de pan, deber�as ir all�.
	AI_Output (self, other,"DIA_Guy_AdNC_03_02"); //No, no es tan malo. Pero es diferente a este lugar.
	AI_Output (self, other,"DIA_Guy_AdNC_03_03"); //Aqu�, G�mez se encarga de que reine algo parecido a la paz. En el Campamento Nuevo no hay leyes.
	AI_Output (self, other,"DIA_Guy_AdNC_03_04"); //Los �nicos con poder suficiente como para ser escuchados son los magos del agua, pero est�n demasiado ocupados estudiando la Barrera todo el d�a.
};	

// **************************************************
// 				Advantages ST
// **************************************************

INSTANCE DIA_Guy_AdST (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 4;
	condition		= DIA_Guy_AdST_Condition;
	information		= DIA_Guy_AdST_Info;
	permanent		= 0;
	description 		= "�Por qu� debo unirme a la secta?";
};

FUNC INT DIA_Guy_AdST_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_AdST_Info()
{
	AI_Output (other, self,"DIA_Guy_AdST_15_00"); //�Por qu� deber�a unirme a la secta?
	AI_Output (self, other,"DIA_Guy_AdST_03_01"); //Bueno, ser� mejor que se lo preguntes a alguien del Campamento de la Secta.
	AI_Output (self, other,"DIA_Guy_AdST_03_02"); //Siempre hay un par de novicios en el Campamento y seguro que ellos podr�n contarte muchas cosas acerca de la secta.
	AI_Output (self, other,"DIA_Guy_AdST_03_03"); //Yo nunca he estado ah�. Pero, seg�n lo que dice todo el mundo, deben ser realmente generosos.
	AI_Output (self, other,"DIA_Guy_AdST_03_04"); //El Campamento de la Secta parece ser el que anda m�s necesitado de nuevos miembros.
};

// **************************************************
// 				Welche H�tte ist meine
// **************************************************

INSTANCE DIA_Guy_MyOwnHut (C_INFO)
{
	npc				= Vlk_530_Guy;
	nr				= 10;
	condition		= DIA_Guy_MyOwnHut_Condition;
	information		= DIA_Guy_MyOwnHut_Info;
	permanent		= 1;
	description 		= "�Con qu� caba�a me puedo quedar?";
};

FUNC INT DIA_Guy_MyOwnHut_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Guy_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Guy_MyOwnHut_Info()
{
	AI_Output (other, self,"DIA_Guy_MyOwnHut_15_00"); //�Cu�l de las caba�as puedo ocupar?
	AI_PointAt(self, "OCR_HUT_26");
	AI_Output (self, other,"DIA_Guy_MyOwnHut_03_01"); //Esa caba�a con toldo est� desocupada.
	AI_StopPointAt(self);
};	
