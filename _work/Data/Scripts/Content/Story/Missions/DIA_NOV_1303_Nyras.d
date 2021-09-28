// **************************************************
//						EXIT 
// **************************************************

instance  DIA_Nyras_Exit (C_INFO)
{
	npc			=  Nov_1303_Nyras;
	nr			=  999;
	condition	=  DIA_Nyras_Exit_Condition;
	information	=  DIA_Nyras_Exit_Info;
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Nyras_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_Nyras_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//						Hi
// **************************************************

instance DIA_Nyras_Hallo (C_INFO)
{
	npc				= Nov_1303_Nyras;
	nr				= 1;
	condition		= DIA_Nyras_Hallo_Condition;
	information		= DIA_Nyras_Hallo_Info;
	permanent		= 0;
	description		= "�Hola! �Soy nuevo!";
};

FUNC int  DIA_Nyras_Hallo_Condition()
{
	if	(Kapitel <= 1)
	{
		return TRUE;
	};
};
func void  DIA_Nyras_Hallo_Info()
{
	AI_Output			(other, self,"DIA_Nyras_Hallo_15_00"); //�Hola! Soy nuevo aqu�.
	AI_Output			(self, other,"DIA_Nyras_Hallo_03_01"); //�Que el Durmiente te acompa�e, forastero!
};

// **************************************************
//						Ort
// **************************************************

instance DIA_Nyras_Ort (C_INFO)
{
	npc				= Nov_1303_Nyras;
	nr				= 1;
	condition		= DIA_Nyras_Ort_Condition;
	information		= DIA_Nyras_Ort_Info;
	permanent		= 0;
	description		= "�Qu� puedes contarme de este lugar?";
};

FUNC int  DIA_Nyras_Ort_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_Nyras_Hallo))
	&&	(Kapitel <= 1)
	{
		return 1;
	};
};

func void  DIA_Nyras_Ort_Info()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_15_00"); //�Qu� puedes contarme acerca de este lugar?
	AI_Output			(self, other,"DIA_Nyras_Ort_03_01"); //Bueno, los gur�s son la gente m�s importante que hay por aqu�. Predican las palabras del Durmiente e imparten las visiones de nuestro amo a los novicios.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_02"); //Por supuesto, �l est� demasiado agotado como para hablar en persona con todo el mundo.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_03"); //Pero algunos d�as nos habla en el patio del templo y nos revela la palabra sagrada del Durmiente.
	
	Info_ClearChoices 	(DIA_Nyras_Ort);
	Info_Addchoice 		(DIA_Nyras_Ort,"H�blame de las palabras sagradas del gran Durmiente.",DIA_Nyras_Ort_Holy);
	Info_Addchoice 		(DIA_Nyras_Ort,"Y entonces, �qu� dice?",DIA_Nyras_Ort_Casual);
};

func void DIA_Nyras_Ort_Casual()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Casual_15_00"); //�Y qu� es lo que dice entonces?
	AI_Output			(self, other,"DIA_Nyras_Ort_Casual_03_01"); //El Durmiente se�ala el camino. �Pero un infiel como t� no lo comprender�!
	Info_ClearChoices 	(DIA_Nyras_Ort);
};

func void DIA_Nyras_Ort_Holy()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Holy_15_00"); //Cu�ntame m�s acerca de la palabra sagrada del Durmiente.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_01"); //�L nos dice qu� es lo que tenemos que hacer para recuperar la libertad.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_02"); //Y'Berion dice que el Durmiente nos mostrar� el camino en cuanto podamos o�rle.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_03"); //Est� preparando una gran invocaci�n con la que contactar� con el Durmiente junto con los mejores novicios.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_04"); //Cor Kalorn le apoya. Es un alquimista que elabora sustancias que nos sumergen en un estado parecido al sue�o.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_05"); //S�lo en ese estado se pueden recibir los pensamientos del Durmiente. O cuando est�s dormido.
	Info_ClearChoices 	(DIA_Nyras_Ort);
};

// ***************************************************
//						
// ***************************************************








///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////
////////////////////		Bring Fokus 1		///////////////////////////
///////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////

// ***************************** BEGR��UNG ****************************************//

instance Nov_1303_Nyras_GREET (C_INFO)
{
	npc				= Nov_1303_Nyras;
	condition		= Nov_1303_Nyras_GREET_Condition;
	information		= Nov_1303_Nyras_GREET_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Nov_1303_Nyras_GREET_Condition()
{
	if ( YBerion_BringFocus == LOG_RUNNING )
	{
		return 1;
	};
};
func void  Nov_1303_Nyras_GREET_Info()
{
	AI_Output			(self,other ,"Nov_1303_Nyras_GREET_Info_03_00"); //�L�rgate! �Aqu� no pintas nada!
};
// ***************************** INFOS ****************************************//

instance  Nov_1303_Nyras_LEAVE (C_INFO)
{
	npc				= Nov_1303_Nyras;
	condition		= Nov_1303_Nyras_LEAVE_Condition;
	information		= Nov_1303_Nyras_LEAVE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Busco el foco."; 
};

FUNC int  Nov_1303_Nyras_LEAVE_Condition()
{	
	if ( Npc_KnowsInfo (hero,Nov_1303_Nyras_GREET))
	{
		return 1;
	};
};
FUNC void  Nov_1303_Nyras_LEAVE_Info()
{
	AI_Output			(other, self,"Nov_1303_Nyras_LEAVE_Info_15_01"); //Estoy buscando el foco.
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_02"); //Por desgracia, llegas demasiado tarde. �Ya lo he encontrado yo!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_03"); //�Y me lo voy a quedar!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_04"); //�El Durmiente me habl� anoche e hizo de m� su �nico instrumento!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_05"); //Ahora s�lo servir� al Durmiente. �No m�s templarios ni Gur�s!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_06"); //�NAAAAAAAAADA M�SSSSSSSSSS QUEEEE YOOOOOOOOO!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_07"); //�MUEEEEEEEEEEEEEEEERE!

	B_LogEntry		(CH2_Focus,"Nyras ha perdido el juicio. Quiere quedarse el foco y me ha atacado llevado por su furia.");

	Npc_SetPermAttitude (self,ATT_HOSTILE);
	AI_StopProcessInfos	(self);
		
};  
  
