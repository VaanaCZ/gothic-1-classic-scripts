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
	description		= "Salve! Sono nuovo di qui.";
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
	AI_Output			(other, self,"DIA_Nyras_Hallo_15_00"); //Salve! Sono nuovo di qui.
	AI_Output			(self, other,"DIA_Nyras_Hallo_03_01"); //Che il Dormiente sia con te, straniero!
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
	description		= "Che mi dici di questo posto?";
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
	AI_Output			(other, self,"DIA_Nyras_Ort_15_00"); //Che mi dici di questo posto?
	AI_Output			(self, other,"DIA_Nyras_Ort_03_01"); //Beh... I guru sono le persone più importanti. Diffondono la parola del Dormiente e riferiscono ai novizi le visioni del nostro maestro.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_02"); //Ovviamente, lui è troppo affaticato per parlare con tutti.
	AI_Output			(self, other,"DIA_Nyras_Ort_03_03"); //Però certe volte ci raduna nel cortile del tempio per rivelare il sacro verbo del Dormiente.
	
	Info_ClearChoices 	(DIA_Nyras_Ort);
	Info_Addchoice 		(DIA_Nyras_Ort,"Parlami del sacro verbo del grande Dormiente.",DIA_Nyras_Ort_Holy);
	Info_Addchoice 		(DIA_Nyras_Ort,"E cosa dice?",DIA_Nyras_Ort_Casual);
};

func void DIA_Nyras_Ort_Casual()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Casual_15_00"); //E cosa dice?
	AI_Output			(self, other,"DIA_Nyras_Ort_Casual_03_01"); //Il Dormiente indica la via da seguire. Ma un infedele come te non può capire!
	Info_ClearChoices 	(DIA_Nyras_Ort);
};

func void DIA_Nyras_Ort_Holy()
{
	AI_Output			(other, self,"DIA_Nyras_Ort_Holy_15_00"); //Parlami del sacro verbo del grande Dormiente.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_01"); //EGLI ci rivela come dobbiamo agire per tornare a essere liberi.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_02"); //Y'Berion sostiene che il Dormiente ci mostrerà la via, appena saremo in grado di udirlo.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_03"); //Sta preparando una grande evocazione, durante la quale, insieme ai suoi migliori novizi, contatterà il Dormiente.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_04"); //Ad assisterlo c'è Cor Kalom, l'alchimista che crea le pozioni per farci entrare in trance.
	AI_Output			(self, other,"DIA_Nyras_Ort_Holy_03_05"); //Puoi accogliere i pensieri del Dormiente esclusivamente in questo stato o mentre dormi.
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
	AI_Output			(self,other ,"Nov_1303_Nyras_GREET_Info_03_00"); //Sparisci! Non hai niente da fare qui!
};
// ***************************** INFOS ****************************************//

instance  Nov_1303_Nyras_LEAVE (C_INFO)
{
	npc				= Nov_1303_Nyras;
	condition		= Nov_1303_Nyras_LEAVE_Condition;
	information		= Nov_1303_Nyras_LEAVE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Sto cercando la pietra focalizzatrice."; 
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
	AI_Output			(other, self,"Nov_1303_Nyras_LEAVE_Info_15_01"); //Sto cercando la pietra focalizzatrice.
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_02"); //Sfortunatamente, sei arrivato tardi. L'ho già trovata io!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_03"); //E ho intenzione di tenermela!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_04"); //La scorsa notte il Dormiente mi ha parlato e ha deciso di farmi diventare il suo unico servo.
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_05"); //Ora servo solo il Dormiente. Basta con guru e templari!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_06"); //SSOOOOOLOOOOO IIIOOOOOOOO!!!!!!
	AI_Output			(self, other,"Nov_1303_Nyras_LEAVE_Info_03_07"); //MUOOOOOORIIIIIIIII!!!!!!!!

	B_LogEntry		(CH2_Focus,"Nyras ha perso la ragione. Vuole tenersi la pietra focalizzatrice e attaccarmi.");

	Npc_SetPermAttitude (self,ATT_HOSTILE);
	AI_StopProcessInfos	(self);
		
};  
  
