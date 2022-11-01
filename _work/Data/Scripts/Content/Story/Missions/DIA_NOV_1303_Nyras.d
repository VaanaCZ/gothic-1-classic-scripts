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
	description		= "Cześć, jestem tu nowy.";
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
	AI_Output			(other, self,"DIA_Nyras_Hallo_15_00"); //Cześć, jestem tu nowy.
	AI_Output			(self, other,"DIA_Nyras_Hallo_03_01"); //Niech Śniący będzie z tobą, nieznajomy.
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
	description		= "Co możesz mi powiedzieć o tym miejscu?";
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
	AI_Output			(other, self,"DIA_Nyras_Ort_15_00"); //Co możesz mi powiedzieć o tym miejscu?
	AI_Output			(self, other,"DIA_Nyras_Ort_03_01"); //Cóż - najważniejszymi osobami w obozie są Guru. Oni głoszą słowo Śniącego i przekazują Nowicjuszom informacje o wizjach naszego Mistrza.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_02"); //On sam jest naturalnie zbyt zapracowany, by rozmawiać ze wszystkimi osobiście.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_03"); //Ale czasami przemawia do zgromadzonych na świątynnym dziedzińcu, objawiając święte prawdy ustanowione przez Śniącego.
	
	Info_ClearChoices 	(DIA_Nyras_Ort);
	Info_Addchoice 		(DIA_Nyras_Ort,"Opowiedz mi jeszcze o świętych słowach Śniącego.",DIA_Nyras_Ort_Holy);
	Info_Addchoice 		(DIA_Nyras_Ort,"I co wtedy mówi?",DIA_Nyras_Ort_Casual);
};

func void DIA_Nyras_Ort_Casual()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Casual_15_00"); //I co wtedy mówi?
	AI_Output			(self, other,"DIA_Nyras_Ort_Casual_03_01"); //Śniący wskazuje nam jedyną słuszną drogę. Ale niewierny nigdy tego nie zrozumie!
	Info_ClearChoices 	(DIA_Nyras_Ort);
};

func void DIA_Nyras_Ort_Holy()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Holy_15_00"); //Opowiedz mi jeszcze o świętych słowach Śniącego.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_01"); //On będzie tym, który wyprowadzi nas na wolność.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_02"); //Y'Berion powiedział, że poznamy właściwą drogę, jak tylko uda się nam nawiązać kontakt ze Śniącym.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_03"); //Nasz Mistrz przygotowuje rytuał wielkiego przyzwania, podczas którego wspólnie z najlepszymi Nowicjuszami nawiąże kontakt ze Śniącym.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_04"); //Pomaga mu w tym Cor Kalom, alchemik, który przygotowuje magiczne wywary wprowadzające nas w stan transu.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_05"); //Tylko w transie - lub we śnie - można usłyszeć słowa naszego Wyzwoliciela.
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

// ***************************** BEGRÜßUNG ****************************************//

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
	AI_Output			(self,other ,"Nov_1303_Nyras_GREET_Info_03_00"); //Idź precz! Nie masz tu czego szukać!
};
// ***************************** INFOS ****************************************//

instance  Nov_1303_Nyras_LEAVE (C_INFO)
{
	npc				= Nov_1303_Nyras;
	condition		= Nov_1303_Nyras_LEAVE_Condition;
	information		= Nov_1303_Nyras_LEAVE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Szukam kamienia ogniskującego!"; 
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
	AI_Output			(other, self,"Nov_1303_Nyras_LEAVE_Info_15_01"); //Szukam kamienia ogniskującego!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_02"); //Obawiam się, że trochę się spóźniłeś! Ja go znalazłem wcześniej!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_03"); //I zamierzam go sobie zatrzymać!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_04"); //Śniący przemówił do mnie ostatniej nocy i uczynił mnie swym arcykapłanem!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_05"); //Teraz jestem jedynym prawdziwym sługą Śniącego. Żadnej Straży, żadnych Guru!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_06"); //TYLKO JA!!!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_07"); //GIŃ!

	B_LogEntry		(CH2_Focus,"Nyras postradał zmysły! Chce zatrzymać dla siebie kamień ogniskujący i rzucił się na mnie bez ostrzeżenia!");

	Npc_SetPermAttitude (self,ATT_HOSTILE);
	AI_StopProcessInfos	(self);
		
};  
  
