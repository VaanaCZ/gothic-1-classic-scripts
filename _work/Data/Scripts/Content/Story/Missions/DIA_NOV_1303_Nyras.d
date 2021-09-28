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
	description		= "Cze��, jestem tu nowy.";
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
	AI_Output			(other, self,"DIA_Nyras_Hallo_15_00"); //Cze��, jestem tu nowy.
	AI_Output			(self, other,"DIA_Nyras_Hallo_03_01"); //Niech �ni�cy b�dzie z tob�, nieznajomy.
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
	description		= "Co mo�esz mi powiedzie� o tym miejscu?";
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
	AI_Output			(other, self,"DIA_Nyras_Ort_15_00"); //Co mo�esz mi powiedzie� o tym miejscu?
	AI_Output			(self, other,"DIA_Nyras_Ort_03_01"); //C� - najwa�niejszymi osobami w obozie s� Guru. Oni g�osz� s�owo �ni�cego i przekazuj� Nowicjuszom informacje o wizjach naszego Mistrza.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_02"); //On sam jest naturalnie zbyt zapracowany, by rozmawia� ze wszystkimi osobi�cie.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_03"); //Ale czasami przemawia do zgromadzonych na �wi�tynnym dziedzi�cu, objawiaj�c �wi�te prawdy ustanowione przez �ni�cego.
	
	Info_ClearChoices 	(DIA_Nyras_Ort);
	Info_Addchoice 		(DIA_Nyras_Ort,"Opowiedz mi jeszcze o �wi�tych s�owach �ni�cego.",DIA_Nyras_Ort_Holy);
	Info_Addchoice 		(DIA_Nyras_Ort,"I co wtedy m�wi?",DIA_Nyras_Ort_Casual);
};

func void DIA_Nyras_Ort_Casual()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Casual_15_00"); //I co wtedy m�wi?
	AI_Output			(self, other,"DIA_Nyras_Ort_Casual_03_01"); //�ni�cy wskazuje nam jedyn� s�uszn� drog�. Ale niewierny nigdy tego nie zrozumie!
	Info_ClearChoices 	(DIA_Nyras_Ort);
};

func void DIA_Nyras_Ort_Holy()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Holy_15_00"); //Opowiedz mi jeszcze o �wi�tych s�owach �ni�cego.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_01"); //On b�dzie tym, kt�ry wyprowadzi nas na wolno��.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_02"); //Y'Berion powiedzia�, �e poznamy w�a�ciw� drog�, jak tylko uda si� nam nawi�za� kontakt ze �ni�cym.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_03"); //Nasz Mistrz przygotowuje rytua� wielkiego przyzwania, podczas kt�rego wsp�lnie z najlepszymi Nowicjuszami nawi��e kontakt ze �ni�cym.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_04"); //Pomaga mu w tym Cor Kalom, alchemik, kt�ry przygotowuje magiczne wywary wprowadzaj�ce nas w stan transu.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_05"); //Tylko w transie - lub we �nie - mo�na us�ysze� s�owa naszego Wyzwoliciela.
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
	AI_Output			(self,other ,"Nov_1303_Nyras_GREET_Info_03_00"); //Id� precz! Nie masz tu czego szuka�!
};
// ***************************** INFOS ****************************************//

instance  Nov_1303_Nyras_LEAVE (C_INFO)
{
	npc				= Nov_1303_Nyras;
	condition		= Nov_1303_Nyras_LEAVE_Condition;
	information		= Nov_1303_Nyras_LEAVE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Szukam kamienia ogniskuj�cego!"; 
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
	AI_Output			(other, self,"Nov_1303_Nyras_LEAVE_Info_15_01"); //Szukam kamienia ogniskuj�cego!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_02"); //Obawiam si�, �e troch� si� sp�ni�e�! Ja go znalaz�em wcze�niej!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_03"); //I zamierzam go sobie zatrzyma�!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_04"); //�ni�cy przem�wi� do mnie ostatniej nocy i uczyni� mnie swym arcykap�anem!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_05"); //Teraz jestem jedynym prawdziwym s�ug� �ni�cego. �adnej Stra�y, �adnych Guru!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_06"); //TYLKO JA!!!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_07"); //GI�!

	B_LogEntry		(CH2_Focus,"Nyras postrada� zmys�y! Chce zatrzyma� dla siebie kamie� ogniskuj�cy i rzuci� si� na mnie bez ostrze�enia!");

	Npc_SetPermAttitude (self,ATT_HOSTILE);
	AI_StopProcessInfos	(self);
		
};  
  
