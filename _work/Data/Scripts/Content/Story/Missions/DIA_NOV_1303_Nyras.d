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
	description		= "Zdar! Jsem tady nov�.";
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
	AI_Output			(other, self,"DIA_Nyras_Hallo_15_00"); //Zdar! Jsem tady nov�!
	AI_Output			(self, other,"DIA_Nyras_Hallo_03_01"); //Sp�� s tebou, cizin�e!
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
	description		= "Co mi m��e� ��ci o tomhle m�st�?";
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
	AI_Output			(other, self,"DIA_Nyras_Ort_15_00"); //Co mi m��e� ��ci o tomhle m�st�?
	AI_Output			(self, other,"DIA_Nyras_Ort_03_01"); //Dobr� - Guru jsou tady nejd�le�it�j��mi lidmi. ���� Sp��ovo u�en� a p�ed�vaj� vize na�ich mistr� novic�m.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_02"); //On s�m je pochopiteln� p��li� unaven�, ne� aby to ��kal ka�d�mu s�m.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_03"); //Ob�as k n�m ale promluv� v chr�mov�m dvo�e a p�ed� n�m svat� Sp��ovo posl�n�.
	
	Info_ClearChoices 	(DIA_Nyras_Ort);
	Info_Addchoice 		(DIA_Nyras_Ort,"Pov�dej mi o svat�m posl�n� velk�ho Sp��e!",DIA_Nyras_Ort_Holy);
	Info_Addchoice 		(DIA_Nyras_Ort,"A co ��k� potom?",DIA_Nyras_Ort_Casual);
};

func void DIA_Nyras_Ort_Casual()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Casual_15_00"); //A co ��k� potom?
	AI_Output			(self, other,"DIA_Nyras_Ort_Casual_03_01"); //Sp�� ur�uje na�� cestu. Tomu by ale nev�rci, jako jsi ty, nemohli rozum�t!
	Info_ClearChoices 	(DIA_Nyras_Ort);
};

func void DIA_Nyras_Ort_Holy()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Holy_15_00"); //Pov�dej mi o svat�m posl�n� velk�ho Sp��e!
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_01"); //ON n�m ��k�, co mus�me ud�lat, abysme op�t z�skali svobodu.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_02"); //Y�Berion ��k�, �e Sp�� n�m uk�e cestu ihned, jakmile mu budeme schopni naslouchat.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_03"); //P�ipravuje velk� vz�v�n�, ve kter�m se spolu s nejlep��mi novici spoj� se Sp��em.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_04"); //Cor Kalom mu pom�h�. Je to alchymista, kter� p�ipravuje substance, kter� ho uv�d�j� do jakoby sp�nkov�ho stavu.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_05"); //Jedin� v takov�m stavu m��e� p�ij�mat Sp��ovy my�lenky - nebo ve sp�nku.
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
	AI_Output			(self,other ,"Nov_1303_Nyras_GREET_Info_03_00"); //Zmiz! Tady nem� co d�lat!
};
// ***************************** INFOS ****************************************//

instance  Nov_1303_Nyras_LEAVE (C_INFO)
{
	npc				= Nov_1303_Nyras;
	condition		= Nov_1303_Nyras_LEAVE_Condition;
	information		= Nov_1303_Nyras_LEAVE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hled�m ohnisko."; 
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
	AI_Output			(other, self,"Nov_1303_Nyras_LEAVE_Info_15_01"); //Hled�m ohnisko.
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_02"); //Bohu�el jde� p��li� pozd�. U� jsem ho na�el!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_03"); //A nech�m si ho pro sebe!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_04"); //Minulou noc ke mn� mluvil Sp�� a prohl�sil m� sv�m jedin�m n�strojem!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_05"); //Te� slou��m jen Sp��ovi. ��dn�mu templ��i ani Guru!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_06"); //JEEENNN J���� S�����MM!!!!!!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_07"); //ZEEEM�����!!!!!

	B_LogEntry		(CH2_Focus,"Nyras se pominul. Chce z�skat ohnisko pro sebe a proto m� v n�valu vzteku napadl.");

	Npc_SetPermAttitude (self,ATT_HOSTILE);
	AI_StopProcessInfos	(self);
		
};  
  
