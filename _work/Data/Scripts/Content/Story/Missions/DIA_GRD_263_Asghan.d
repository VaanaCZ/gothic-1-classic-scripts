
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
	description		= "Gdzieœ tutaj musi byæ gniazdo pe³zaczy."; 
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
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_01"); //Gdzieœ tutaj musi byæ gniazdo pe³zaczy.
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_02"); //Ca³a ta przeklêta góra jest jednym wielkim gniazdem pe³zaczy!
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_03"); //Dlaczego zamkniêto ten szyb?
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_04"); //Niewa¿ne ile pe³zaczy zabijaliœmy, kolejne zastêpy wyrasta³y jak spod ziemi.
	AI_Output			(other, self,"Grd_263_Asghan_NEST_Info_15_05"); //Wygl¹da na to, ¿e gdzieœ w pobli¿u jest ich gniazdo. Pozwól mi otworzyæ drzwi!
	AI_Output			(self, other,"Grd_263_Asghan_NEST_Info_06_06"); //Nie! To przejœcie mo¿na otworzyæ tylko za pozwoleniem Iana! Bez tego nie ma o czym mówiæ!
	
	B_LogEntry		(CH2_MCEggs,"Asghan, przywódca Stra¿ników z kopalni nie chce otworzyæ dla mnie bramy bez upowa¿nienia Iana.");

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
	description		= "Hej, Asghan! Mo¿esz ju¿ otworzyæ te drzwi!"; 
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
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_01"); //Hej, Asghan! Mo¿esz ju¿ otworzyæ te drzwi!
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_02"); //Mówi³em ci ju¿: tylko jeœli Ian.
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_03"); //Asghan... Wszystko bêdzie w porz¹dku... Pozdrowienia od Iana.
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_04"); //Có¿, jeœli Ian bierze na siebie odpowiedzialnoœæ... Ale tylko pod jednym warunkiem!
	AI_Output (other, self,"Grd_263_Asghan_OPEN_Info_15_05"); //Jakim warunkiem?
	AI_Output (self, other,"Grd_263_Asghan_OPEN_Info_06_06"); //SprowadŸ mi tu najpierw dwóch albo trzech Stra¿ników Œwi¹tynnych. Nie chcê tu siedzieæ sam, gdy ca³y szyb zaroi siê od pe³zaczy!
	
	B_LogEntry		(CH2_MCEggs,"Mimo wszystko, Asghan nie otworzy bramy dopóki nie sprowadzê mu kilku Stra¿ników Œwi¹tynnych do pomocy.");

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
	description		= "Przygotowania skoñczone. Mo¿na ju¿ otworzyæ te drzwi!"; 
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
	AI_Output			(other, self,"Grd_263_Asghan_OPEN_NOW_Info_15_01"); //Przygotowania skoñczone. Mo¿na ju¿ otworzyæ drzwi!
	AI_Output			(self, other,"Grd_263_Asghan_OPEN_NOW_Info_06_02"); //Dobra, otwieramy szyb. Bêdzie niez³y bal!
	
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Npc_ExchangeRoutine	(self,"opengate");
	
	B_GiveXP			(XP_OpenAsghansGate);
	B_LogEntry			(CH2_MCEggs,"Uda³o mi siê znaleŸæ wystarczaj¹c¹ liczbê Stra¿ników Œwi¹tynnych. Ciekawe, co mnie czeka po drugiej stronie bramy?");
		
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
	description		= "Pe³zacze nie bêd¹ wam ju¿ zagra¿a³y!"; 
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
	AI_Output			(other, self,"Grd_263_Asghan_LAIRFOUND_Info_15_01"); //Pe³zacze nie bêd¹ wam ju¿ zagra¿a³y!
	AI_Output			(self, other,"Grd_263_Asghan_LAIRFOUND_Info_06_02"); //To wspania³a wiadomoœæ! Wyœlê goñca do Thorusa z dobrymi nowinami!

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
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_02"); //Ujdzie... Tak d³ugo jak nikt nie bêdzie próbowa³ otworzyæ tych drzwi, nie bêdê musia³ wdawaæ siê w bójki.
	AI_Output (other, self,"Grd_263_Asghan_SMALLTALK_Info_15_03"); //A co jest takiego szczególnego za tymi drzwiami?
	AI_Output (self, other,"Grd_263_Asghan_SMALLTALK_Info_06_04"); //Pe³zacze. Wielkie, paskudne pe³zacze. Ca³e mnóstwo wielkich, paskudnych pe³zaczy!
};  



































