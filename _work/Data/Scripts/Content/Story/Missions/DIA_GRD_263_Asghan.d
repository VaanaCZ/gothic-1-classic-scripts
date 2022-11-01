
// ************************ EXIT **************************

instance  Grd_263_Asghan_Exit (C_INFO)
{
	npc			=	Grd_263_Asghan;
	nr			=	999;
	condition	=	Grd_263_Asghan_Exit_Condition;
	information	=	Grd_263_Asghan_Exit_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Grd_263_Asghan_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_263_Asghan_Exit_Info()
{
	AI_StopProcessInfos	( self );
};
// ***************** Infos *****************************

instance  Grd_263_Asghan_NEST (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_NEST_Condition;
	information		= Grd_263_Asghan_NEST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Gdzieś tutaj musi być gniazdo pełzaczy."; 
};

FUNC int  Grd_263_Asghan_NEST_Condition()
{	
	if (CorKalom_BringMCQBalls == LOG_RUNNING) 
	{
		return 1;
	};

};
FUNC void  Grd_263_Asghan_NEST_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_01"); //Gdzieś tutaj musi być gniazdo pełzaczy.
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_02"); //Cała ta przeklęta góra jest jednym wielkim gniazdem pełzaczy!
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_03"); //Dlaczego zamknięto ten szyb?
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_04"); //Nieważne ile pełzaczy zabijaliśmy, kolejne zastępy wyrastały jak spod ziemi.
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_05"); //Wygląda na to, że gdzieś w pobliżu jest ich gniazdo. Pozwól mi otworzyć drzwi!
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_06"); //Nie! To przejście można otworzyć tylko za pozwoleniem Iana! Bez tego nie ma o czym mówić!
	
	B_LogEntry		(CH2_MCEggs,"Asghan, przywódca Strażników z kopalni nie chce otworzyć dla mnie bramy bez upoważnienia Iana.");

};
/*------------------------------------------------------------------------
							ERLAUBNIS VON IAN GEHOLT							
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_OPEN (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_Condition;
	information		= Grd_263_Asghan_OPEN_Info;
	important		= 0;
	permanent		= 0;
	description		= "Hej, Asghan! Możesz już otworzyć te drzwi!"; 
};

FUNC int  Grd_263_Asghan_OPEN_Condition()
{
	if Npc_KnowsInfo  ( hero, Grd_263_Asghan_NEST)
	&& Npc_KnowsInfo  ( hero, STT_301_IAN_GEAR_SUC)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_OPEN_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_01"); //Hej, Asghan! Możesz już otworzyć te drzwi!
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_02"); //Mówiłem ci już: tylko jeśli Ian.
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_03"); //Asghan... Wszystko będzie w porządku... Pozdrowienia od Iana.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_04"); //Cóż, jeśli Ian bierze na siebie odpowiedzialność... Ale tylko pod jednym warunkiem!
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_05"); //Jakim warunkiem?
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_06"); //Sprowadź mi tu najpierw dwóch albo trzech Strażników Świątynnych. Nie chcę tu siedzieć sam, gdy cały szyb zaroi się od pełzaczy!
	
	B_LogEntry		(CH2_MCEggs,"Mimo wszystko, Asghan nie otworzy bramy dopóki nie sprowadzę mu kilku Strażników Świątynnych do pomocy.");

	AI_StopProcessInfos	( self );
};  

  
// ***************** Infos *****************************
instance  Grd_263_Asghan_OPEN_NOW (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_OPEN_NOW_Condition;
	information		= Grd_263_Asghan_OPEN_NOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Przygotowania skończone. Można już otworzyć te drzwi!"; 
};

FUNC int  Grd_263_Asghan_OPEN_NOW_Condition()
{	
	if 		(Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST )) && (Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST))
	||		(Npc_KnowsInfo(hero, Tpl_1401_GorNaKosh_SUGGEST)) && (Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC ))
	||		(Npc_KnowsInfo(hero, Tpl_1433_GorNaVid_HEALTH_SUC)) && (Npc_KnowsInfo(hero, Tpl_1400_GorNaBar_SUGGEST ))   
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_OPEN_NOW_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //Przygotowania skończone. Można już otworzyć drzwi!
	AI_Output			(self, other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //Dobra, otwieramy szyb. Będzie niezły bal!
	
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Npc_ExchangeRoutine	(self,"opengate");
	
	B_GiveXP			(XP_OpenAsghansGate);
	B_LogEntry			(CH2_MCEggs,"Udało mi się znaleźć wystarczającą liczbę Strażników Świątynnych. Ciekawe, co mnie czeka po drugiej stronie bramy?");
		
	AI_StopProcessInfos	(self);
};    

// ***************** Nest gefunden *****************************
instance  Grd_263_Asghan_LAIRFOUND (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_LAIRFOUND_Condition;
	information		= Grd_263_Asghan_LAIRFOUND_Info;
	important		= 0;
	permanent		= 0;
	description		= "Pełzacze nie będą wam już zagrażały!"; 
};

FUNC int  Grd_263_Asghan_LAIRFOUND_Condition()
{	
	if	(Npc_HasItems(hero, ItAt_Crawlerqueen)>=3)   
	&&  (Npc_GetTrueGuild (hero) == GIL_STT)
	{
		return TRUE;
	};
	
};
FUNC void  Grd_263_Asghan_LAIRFOUND_Info()
{
	AI_Output			(other, self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //Pełzacze nie będą wam już zagrażały!
	AI_Output			(self, other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //To wspaniała wiadomość! Wyślę gońca do Thorusa z dobrymi nowinami!

	AI_StopProcessInfos	(self);
};    

/*------------------------------------------------------------------------
						MCQ Hatz läuft noch nicht 						
------------------------------------------------------------------------*/

instance  Grd_263_Asghan_SMALLTALK (C_INFO)
{
	npc				= Grd_263_Asghan;
	condition		= Grd_263_Asghan_SMALLTALK_Condition;
	information		= Grd_263_Asghan_SMALLTALK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Jak leci?"; 
};

FUNC int  Grd_263_Asghan_SMALLTALK_Condition()
{	
	if (CorKalom_BringMCQBalls != LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  Grd_263_Asghan_SMALLTALK_Info()
{
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_01"); //Jak leci?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Ujdzie... Tak długo jak nikt nie będzie próbował otworzyć tych drzwi, nie będę musiał wdawać się w bójki.
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //A co jest takiego szczególnego za tymi drzwiami?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Pełzacze. Wielkie, paskudne pełzacze. Całe mnóstwo wielkich, paskudnych pełzaczy!
};  



































