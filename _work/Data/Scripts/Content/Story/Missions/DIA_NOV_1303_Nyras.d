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
	description		= "Czeœæ, jestem tu nowy.";
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
	AI_Output			(other, self,"DIA_Nyras_Hallo_15_00"); //Czeœæ, jestem tu nowy.
	AI_Output			(self, other,"DIA_Nyras_Hallo_03_01"); //Niech Œni¹cy bêdzie z tob¹, nieznajomy.
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
	description		= "Co mo¿esz mi powiedzieæ o tym miejscu?";
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
	AI_Output			(other, self,"DIA_Nyras_Ort_15_00"); //Co mo¿esz mi powiedzieæ o tym miejscu?
	AI_Output			(self, other,"DIA_Nyras_Ort_03_01"); //Có¿ - najwa¿niejszymi osobami w obozie s¹ Guru. Oni g³osz¹ s³owo Œni¹cego i przekazuj¹ Nowicjuszom informacje o wizjach naszego Mistrza.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_02"); //On sam jest naturalnie zbyt zapracowany, by rozmawiaæ ze wszystkimi osobiœcie.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_03"); //Ale czasami przemawia do zgromadzonych na œwi¹tynnym dziedziñcu, objawiaj¹c œwiête prawdy ustanowione przez Œni¹cego.
	
	Info_ClearChoices 	(DIA_Nyras_Ort);
	Info_Addchoice 		(DIA_Nyras_Ort,"Opowiedz mi jeszcze o œwiêtych s³owach Œni¹cego.",DIA_Nyras_Ort_Holy);
	Info_Addchoice 		(DIA_Nyras_Ort,"I co wtedy mówi?",DIA_Nyras_Ort_Casual);
};

func void DIA_Nyras_Ort_Casual()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Casual_15_00"); //I co wtedy mówi?
	AI_Output			(self, other,"DIA_Nyras_Ort_Casual_03_01"); //Œni¹cy wskazuje nam jedyn¹ s³uszn¹ drogê. Ale niewierny nigdy tego nie zrozumie!
	Info_ClearChoices 	(DIA_Nyras_Ort);
};

func void DIA_Nyras_Ort_Holy()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Holy_15_00"); //Opowiedz mi jeszcze o œwiêtych s³owach Œni¹cego.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_01"); //On bêdzie tym, który wyprowadzi nas na wolnoœæ.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_02"); //Y'Berion powiedzia³, ¿e poznamy w³aœciw¹ drogê, jak tylko uda siê nam nawi¹zaæ kontakt ze Œni¹cym.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_03"); //Nasz Mistrz przygotowuje rytua³ wielkiego przyzwania, podczas którego wspólnie z najlepszymi Nowicjuszami nawi¹¿e kontakt ze Œni¹cym.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_04"); //Pomaga mu w tym Cor Kalom, alchemik, który przygotowuje magiczne wywary wprowadzaj¹ce nas w stan transu.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_05"); //Tylko w transie - lub we œnie - mo¿na us³yszeæ s³owa naszego Wyzwoliciela.
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
	AI_Output			(self,other ,"Nov_1303_Nyras_GREET_Info_03_00"); //IdŸ precz! Nie masz tu czego szukaæ!
};
// ***************************** INFOS ****************************************//

instance  Nov_1303_Nyras_LEAVE (C_INFO)
{
	npc				= Nov_1303_Nyras;
	condition		= Nov_1303_Nyras_LEAVE_Condition;
	information		= Nov_1303_Nyras_LEAVE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Szukam kamienia ogniskuj¹cego!"; 
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
	AI_Output			(other, self,"Nov_1303_Nyras_LEAVE_Info_15_01"); //Szukam kamienia ogniskuj¹cego!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_02"); //Obawiam siê, ¿e trochê siê spóŸni³eœ! Ja go znalaz³em wczeœniej!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_03"); //I zamierzam go sobie zatrzymaæ!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_04"); //Œni¹cy przemówi³ do mnie ostatniej nocy i uczyni³ mnie swym arcykap³anem!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_05"); //Teraz jestem jedynym prawdziwym s³ug¹ Œni¹cego. ¯adnej Stra¿y, ¿adnych Guru!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_06"); //TYLKO JA!!!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_07"); //GIÑ!

	B_LogEntry		(CH2_Focus,"Nyras postrada³ zmys³y! Chce zatrzymaæ dla siebie kamieñ ogniskuj¹cy i rzuci³ siê na mnie bez ostrze¿enia!");

	Npc_SetPermAttitude (self,ATT_HOSTILE);
	AI_StopProcessInfos	(self);
		
};  
  
