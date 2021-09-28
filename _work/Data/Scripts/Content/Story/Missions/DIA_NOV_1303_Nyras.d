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
	description		= "Zdar! Jsem tady nový.";
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
	AI_Output			(other, self,"DIA_Nyras_Hallo_15_00"); //Zdar! Jsem tady nový!
	AI_Output			(self, other,"DIA_Nyras_Hallo_03_01"); //Spáè s tebou, cizinèe!
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
	description		= "Co mi mùžeš øíci o tomhle místì?";
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
	AI_Output			(other, self,"DIA_Nyras_Ort_15_00"); //Co mi mùžeš øíci o tomhle místì?
	AI_Output			(self, other,"DIA_Nyras_Ort_03_01"); //Dobrá - Guru jsou tady nejdùležitìjšími lidmi. Šíøí Spáèovo uèení a pøedávají vize našich mistrù novicùm.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_02"); //On sám je pochopitelnì pøíliš unavený, než aby to øíkal každému sám.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_03"); //Obèas k nám ale promluví v chrámovém dvoøe a pøedá nám svaté Spáèovo poslání.
	
	Info_ClearChoices 	(DIA_Nyras_Ort);
	Info_Addchoice 		(DIA_Nyras_Ort,"Povídej mi o svatém poslání velkého Spáèe!",DIA_Nyras_Ort_Holy);
	Info_Addchoice 		(DIA_Nyras_Ort,"A co øíká potom?",DIA_Nyras_Ort_Casual);
};

func void DIA_Nyras_Ort_Casual()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Casual_15_00"); //A co øíká potom?
	AI_Output			(self, other,"DIA_Nyras_Ort_Casual_03_01"); //Spáè urèuje naší cestu. Tomu by ale nevìrci, jako jsi ty, nemohli rozumìt!
	Info_ClearChoices 	(DIA_Nyras_Ort);
};

func void DIA_Nyras_Ort_Holy()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Holy_15_00"); //Povídej mi o svatém poslání velkého Spáèe!
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_01"); //ON nám øíká, co musíme udìlat, abysme opìt získali svobodu.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_02"); //Y´Berion øíká, že Spáè nám ukáže cestu ihned, jakmile mu budeme schopni naslouchat.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_03"); //Pøipravuje velké vzývání, ve kterém se spolu s nejlepšími novici spojí se Spáèem.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_04"); //Cor Kalom mu pomáhá. Je to alchymista, který pøipravuje substance, které ho uvádìjí do jakoby spánkového stavu.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_05"); //Jedinì v takovém stavu mùžeš pøijímat Spáèovy myšlenky - nebo ve spánku.
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
	AI_Output			(self,other ,"Nov_1303_Nyras_GREET_Info_03_00"); //Zmiz! Tady nemáš co dìlat!
};
// ***************************** INFOS ****************************************//

instance  Nov_1303_Nyras_LEAVE (C_INFO)
{
	npc				= Nov_1303_Nyras;
	condition		= Nov_1303_Nyras_LEAVE_Condition;
	information		= Nov_1303_Nyras_LEAVE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hledám ohnisko."; 
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
	AI_Output			(other, self,"Nov_1303_Nyras_LEAVE_Info_15_01"); //Hledám ohnisko.
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_02"); //Bohužel jdeš pøíliš pozdì. Už jsem ho našel!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_03"); //A nechám si ho pro sebe!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_04"); //Minulou noc ke mnì mluvil Spáè a prohlásil mì svým jediným nástrojem!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_05"); //Teï sloužím jen Spáèovi. Žádnému templáøi ani Guru!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_06"); //JEEENNN JÁÁÁÁ SÁÁÁÁÁMM!!!!!!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_07"); //ZEEEMØØÍÍÍ!!!!!

	B_LogEntry		(CH2_Focus,"Nyras se pominul. Chce získat ohnisko pro sebe a proto mì v návalu vzteku napadl.");

	Npc_SetPermAttitude (self,ATT_HOSTILE);
	AI_StopProcessInfos	(self);
		
};  
  
