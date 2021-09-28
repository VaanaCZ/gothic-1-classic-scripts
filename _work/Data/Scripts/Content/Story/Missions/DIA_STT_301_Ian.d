
// ************************ EXIT **************************

instance  STT_301_IAN_Exit (C_INFO)
{
	npc			=  STT_301_IAN;
	nr			= 999;
	condition	=  STT_301_IAN_Exit_Condition;
	information	=  STT_301_IAN_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  STT_301_IAN_Exit_Condition()
{
	return 1;
};

FUNC VOID  STT_301_IAN_Exit_Info()
{
	AI_Output			(other, self,"STT_301_IAN_Exit_Info_15_01"); //Rozejrzê siê trochê po okolicy.
	AI_Output			(self, other,"STT_301_IAN_Exit_Info_13_02"); //Nie sprawiaj ¿adnych k³opotów.
	
	AI_StopProcessInfos	( self );
};
// ***************** Erstes Treffen *****************************

instance  STT_301_IAN_HI (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_HI_Condition;
	information		= STT_301_IAN_HI_Info;
	important		= 0;
	permanent		= 0;
	description		= "To ty jesteœ Ian, szef tej kopalni?"; 
};

FUNC int  STT_301_IAN_HI_Condition()
{	
	if ( ! Npc_KnowsInfo (hero,STT_301_IAN_NEST))
	{	
		return TRUE;
	};
};
FUNC void  STT_301_IAN_HI_Info()
{
	AI_Output			(other, self,"STT_301_IAN_HI_Info_15_01"); //To ty jesteœ Ian, szef tej kopalni?
	AI_Output			(self, other,"STT_301_IAN_HI_Info_13_02"); //Tak, to ja. A to moja kopalnia, wiêc lepiej nie próbuj niczego g³upiego.
}; 
// ***************** Infos *****************************
instance STT_301_IAN_GOMEZ  (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GOMEZ_Condition;
	information		= STT_301_IAN_GOMEZ_Info;
	important		= 0;
	permanent		= 0;
	description		= "Myœla³em, ¿e to kopalnia Gomeza?"; 
};

FUNC int  STT_301_IAN_GOMEZ_Condition()
{	
	if Npc_KnowsInfo (hero,STT_301_IAN_HI)
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GOMEZ_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOMEZ_Info_15_01"); //Myœla³em, ¿e to kopalnia Gomeza?
	AI_Output			(self, other,"STT_301_IAN_GOMEZ_Info_13_02"); //No có¿, oczywiœcie, kopalnia nale¿y do Starego Obozu. Ale tutaj, pod ziemi¹, jest tylko jeden szef - ja!
}; 
// ***************** Infos *****************************
instance  STT_301_IAN_ORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_ORE_Condition;
	information		= STT_301_IAN_ORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Mo¿esz mi opowiedzieæ o wydobyciu rudy?"; 
};

FUNC int  STT_301_IAN_ORE_Condition()
{
	if Npc_KnowsInfo (hero,STT_301_IAN_GOMEZ)
	{
		return TRUE ;
	};

};
FUNC void  STT_301_IAN_ORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_ORE_Info_15_01"); //Mo¿esz mi opowiedzieæ o wydobyciu rudy?
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_02"); //Kopiemy dniem i noc¹. Dziêki temu wydobywamy oko³o 200 worków rudy na miesi¹c, plus jakieœ 20 worków, które od razu zostaj¹ przetopione.
	AI_Output			(self, other,"STT_301_IAN_ORE_Info_13_03"); //Z rudy, któr¹ dostarczamy królowi mo¿na by wykuæ orê¿ dla nie lada armii.
	
}; 
// ***************** Infos *****************************   
instance  STT_301_IAN_MORE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MORE_Condition;
	information		= STT_301_IAN_MORE_Info;
	important		= 0;
	permanent		= 0;
	description		= "S³ysza³em, ¿e ruda ma w³aœciwoœci magiczne. Opowiedz mi o tym."; 
};

FUNC int  STT_301_IAN_MORE_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_ORE) ;
};


FUNC void  STT_301_IAN_MORE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MORE_Info_15_01"); //S³ysza³em, ¿e ruda ma w³aœciwoœci magiczne. Opowiedz mi o tym.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_02"); //Tak, nasza ruda rzeczywiœcie posiada w³aœciwoœci magiczne. Wykuta z niej broñ nigdy siê nie psuje, a miecze i topory s¹ ostrzejsze, ni¿ te wykute ze stali.
	AI_Output			(self, other,"STT_301_IAN_MORE_Info_13_03"); //Ka¿da armia wyposa¿ona w taki orê¿ ma powa¿n¹ przewagê w boju.
	
};   
// ***************** Infos *****************************  
instance  STT_301_IAN_MAGIC (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MAGIC_Condition;
	information		= STT_301_IAN_MAGIC_Info;
	important		= 0;
	permanent		= 0;
	description		= "Opowiedz mi coœ jeszcze o rudzie."; 
};

FUNC int  STT_301_IAN_MAGIC_Condition()
{
	return Npc_KnowsInfo (hero,STT_301_IAN_MORE) ;
};


FUNC void  STT_301_IAN_MAGIC_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MAGIC_Info_15_01"); //Opowiedz mi coœ jeszcze o rudzie.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_02"); //Niestety, magiczne w³aœciwoœci rudy zanikaj¹ podczas przetapiania. W hutach Nordmaru znaj¹ odpowiednie techniki przetapiania.
	AI_Output			(self, other,"STT_301_IAN_MAGIC_Info_13_03"); //Ale nawet bez mocy magicznych, broñ wykonana z naszej rudy jest bardziej wytrzyma³a i zadaje wiêksze obra¿enia ni¿ zwyk³y orê¿.
	
};   
// ***************** Infos *****************************   
instance  STT_301_IAN_MINE (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_MINE_Condition;
	information		= STT_301_IAN_MINE_Info;
	important		= 0;
	permanent		= 0;
	description		= "Opowiedz mi o kopalni."; 
};

FUNC int  STT_301_IAN_MINE_Condition()
{	
	if (Kapitel < 3) 
	&& (Npc_KnowsInfo (hero, STT_301_IAN_HI))
	{
		return TRUE;
	};

};
func void  STT_301_IAN_MINE_Info()
{
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_01"); //Opowiedz mi o kopalni.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_02"); //Jeœli chcesz siê tu trochê rozejrzeæ, to radzê ci dobrze uwa¿aæ. W jaskiniach kryj¹ siê pe³zacze. Najlepiej trzymaj siê g³ównego szybu.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_03"); //I nie przeszkadzaj Œwi¹tynnym Stra¿nikom. Chocia¿ przez wiêkszoœæ czasu zbijaj¹ b¹ki, to najlepsi sprzymierzeñcy, jakich mo¿na sobie wyobraziæ podczas starcia z pe³zaczami.
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_04"); //Postaram siê o tym pamiêtaæ.
	AI_Output			(self, other,"STT_301_IAN_MINE_Info_13_05"); //Mam jeszcze sporo roboty. A, i nie przeszkadzaj w pracy moim ludziom!
	AI_Output			(other, self,"STT_301_IAN_MINE_Info_15_06"); //Tylko siê tu trochê rozejrzê.
};
/*------------------------------------------------------------------------
					BRING LIST									
------------------------------------------------------------------------*/

instance  STT_301_IAN_WANTLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_WANTLIST_Condition;
	information		= STT_301_IAN_WANTLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Przychodzê tu po listê dla Obozu."; 
};

FUNC int  STT_301_IAN_WANTLIST_Condition()
{
	if (Diego_BringList == LOG_RUNNING)
	&& (!Npc_KnowsInfo (hero,Info_Diego_IanPassword)) 
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_WANTLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_WANTLIST_Info_15_01"); //Przychodzê tu po listê dla Obozu.
	AI_Output			(self, other,"STT_301_IAN_WANTLIST_Info_13_02"); //Ka¿dy mo¿e tak powiedzieæ. Spadaj.
	 
};  
/*------------------------------------------------------------------------
							LISTE ABHOLEN									
------------------------------------------------------------------------*/

instance  STT_301_IAN_GETLIST (C_INFO)
{
	npc				= STT_301_IAN;
	condition		= STT_301_IAN_GETLIST_Condition;
	information		= STT_301_IAN_GETLIST_Info;
	important		= 0;
	permanent		= 0;
	description		= "Przysy³a mnie Diego. Mam odebraæ listê."; 
};

FUNC int  STT_301_IAN_GETLIST_Condition()
{	
	if (Diego_BringList == LOG_RUNNING)
	&& (Npc_KnowsInfo (hero,Info_Diego_IanPassword))
	{
		return TRUE;
	};

};
FUNC void  STT_301_IAN_GETLIST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GETLIST_Info_15_01"); //Przysy³a mnie Diego. Mam odebraæ listê.
	AI_Output			(self, other,"STT_301_IAN_GETLIST_Info_13_02"); //W porz¹dku. Oto i ona. Powiedz im, ¿eby siê pospieszyli z dostawami.
	B_LogEntry  (CH1_BringList,"Ian bez sprzeciwu wrêczy³ mi listê zamówieñ.");
	B_GiveInvItems	(self,hero,TheList,1);
};  
// **************************************************************************
// 							MISSION BRING MCQ EIER RUNNING , 
//							oder: Ohne Zahnrad keine Eier
// **************************************************************************  
instance  STT_301_IAN_NEST (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NEST_Condition;
	information	=  STT_301_IAN_NEST_Info;
	important	= 0;	
	permanent	= 0;
	description = "Gdzieœ tutaj musi byæ gniazdo pe³zaczy.";
};                       

FUNC int  STT_301_IAN_NEST_Condition()
{
	if (CorKalom_BringMCQBalls == LOG_RUNNING)
	&& ( Npc_KnowsInfo (hero,STT_301_IAN_HI) )
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_NEST_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_01"); //Gdzieœ tutaj musi byæ gniazdo pe³zaczy.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_02"); //Za³o¿ê siê, ¿e jest tu przynajmniej z tuzin gniazd.
	AI_Output			(other, self,"STT_301_IAN_NEST_Info_15_03"); //S³uchaj, muszê natychmiast iœæ do tego gniazda...
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_04"); //Nie mam teraz na to czasu! Parê godzin temu zepsu³a siê nasza m³ocarnia. Ko³o zêbate pêk³o w drzazgi.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_05"); //Nie mam pojêcia, gdzie znajdê nowe.
	AI_Output			(self, other,"STT_301_IAN_NEST_Info_13_06"); //Przynieœ mi ko³o zêbate. Wtedy zajmê siê twoim problemem.

	B_LogEntry		(CH2_MCEggs,"Ian, szef Starej Kopalni, nie pomo¿e mi w odnalezieniu gniazda pe³zaczy. Mam za to przynieœæ mu ko³o zêbate do zepsutego rozdrabniacza rudy. Podobno mogê je znaleŸæ w którymœ z opuszczonych bocznych tuneli.");

	Ian_gearwheel = LOG_RUNNING;
};
// ******************************MISSION RUNNING********************************************  
instance  STT_301_IAN_GEAR_RUN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_RUN_Condition;
	information	=  STT_301_IAN_GEAR_RUN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Ko³o zêbate? A gdzie ja niby mam je znaleŸæ?";
};                       

FUNC int  STT_301_IAN_GEAR_RUN_Condition()
{
	PrintDebugInt	(PD_MISSION, "Ian_gearwheel: ", Ian_gearwheel);
	
	if ((Ian_gearwheel == LOG_RUNNING)
	&&	!Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_RUN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GEAR_RUN_Info_15_01"); //Ko³o zêbate? A gdzie ja niby mam je znaleŸæ?
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_02"); //Nie mam pojêcia. Jestem równie bezradny co ty!
	AI_Output			(self, other,"STT_301_IAN_GEAR_RUN_Info_13_03"); //W którymœ z bocznych szybów stoi zepsuta m³ocarnia. Mo¿e tam coœ znajdziesz.
};

// ******************************MISSION SUCCESS********************************************  
instance  STT_301_IAN_GEAR_SUC (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GEAR_SUC_Condition;
	information	=  STT_301_IAN_GEAR_SUC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Mam ko³o zêbate.";
};                       

FUNC int  STT_301_IAN_GEAR_SUC_Condition()
{
	if (Npc_HasItems (hero,ItMi_Stuff_Gearwheel_01))
	&& (Ian_gearwheel == LOG_RUNNING)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GEAR_SUC_Info()
{
	B_GiveInvItems (hero,self, ItMi_Stuff_Gearwheel_01 ,1);
	Npc_RemoveInvItem (self,ItMi_Stuff_Gearwheel_01);
	
	Ian_gearwheel = LOG_SUCCESS;
	B_GiveXP	(XP_BringGearWheel);
	
	var C_Npc Sklave; 				
	Sklave = Hlp_GetNpc	(ORC_2001_SKLAVE);
	Npc_ExchangeRoutine (Sklave,"Stomper");

	AI_Output			(other, self,"STT_301_IAN_GEAR_SUC_Info_15_01"); //Mam ko³o zêbate.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_02"); //Dobra robota! Powinno dzia³aæ. No a teraz wróæmy do twojej sprawy. Szukasz gniazda pe³zaczy... Hmmm...
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_03"); //ZnajdŸ Asghana i powiedz mu, ¿eby otworzy³ ci drzwi. Bêdziesz móg³ rozejrzeæ siê po zamkniêtych korytarzach.
	AI_Output			(self, other,"STT_301_IAN_GEAR_SUC_Info_13_04"); //Powiedz mu "Wszystko bêdzie w porz¹dku". Po tym pozna, ¿e to ja ciê przysy³am.

	B_LogEntry		(CH2_MCEggs,"Przynios³em Ianowi ko³o zêbate, o które prosi³. Teraz mam powiedzieæ Asghanowi, ¿e WSZYSTKO BÊDZIE W PORZ¥DKU. Wtedy Stra¿nik otworzy dla mnie bramê do opuszczonych szybów.");
};

// ******************************GOTO ASGHAN********************************************  
instance  STT_301_IAN_GOTOASGHAN (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_GOTOASGHAN_Condition;
	information	=  STT_301_IAN_GOTOASGHAN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Nadal szukam gniazda pe³zaczy.";
};                       

FUNC int  STT_301_IAN_GOTOASGHAN_Condition()
{
	if ((Ian_gearwheel == LOG_SUCCESS)
	&&  (!Npc_KnowsInfo (hero,Grd_263_Asghan_NEST)))
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_GOTOASGHAN_Info()
{
	AI_Output			(other, self,"STT_301_IAN_GOTOASGHAN_Info_15_01"); //Nadal szukam gniazda pe³zaczy.
	AI_Output			(self, other,"STT_301_IAN_GOTOASGHAN_Info_13_02"); //Mówi³em ci ju¿ - idŸ do Asghana. To dowódca stra¿ników. Znajdziesz go gdzieœ na najni¿szym poziomie.

	B_LogEntry		(CH2_MCEggs,"Jeœli chcê odnaleŸæ gniazdo pe³zaczy, powinienem porozmawiaæ z Asghanem.");
};

//--SPIELER HAT DIE EIER AM START-------------------------
instance  STT_301_IAN_AFTERALL (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_AFTERALL_Condition;
	information	=  STT_301_IAN_AFTERALL_Info;
	important	= 0;	
	permanent	= 0;
	description = "Znalaz³em gniazdo!";
};                       

FUNC int  STT_301_IAN_AFTERALL_Condition()
{
	if (Npc_HasItems (hero,ItAt_Crawlerqueen) >= 3)
	{
		return 1;
	};
};
FUNC VOID  STT_301_IAN_AFTERALL_Info()
{
	AI_Output			(other, self,"STT_301_IAN_AFTERALL_Info_15_01"); //Znalaz³em gniazdo!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_02"); //No to nareszcie bêdziemy tu mieli chwilê spokoju. Ha ha ha!
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_03"); //Bez obrazy. Dobra robota, ch³opcze.
	AI_Output			(self, other,"STT_301_IAN_AFTERALL_Info_13_04"); //Masz. WeŸ tê skrzynkê piwa. Zas³u¿y³eœ.
	CreateInvItems		(self, ItFo_OM_Beer_01,6);
	B_GiveInvItems      (self, hero, ItFo_OM_Beer_01,6);
};

//-------NOT ENOUGH EGGS---------------
instance  STT_301_IAN_NOTENOUGH (C_INFO)
{
	npc			=  STT_301_IAN;
	condition	=  STT_301_IAN_NOTENOUGH_Condition;
	information	=  STT_301_IAN_NOTENOUGH_Info;
	important	= 0;	
	permanent	= 0;
	description = "Znalaz³em gniazdo! I jaja z³o¿one przez królow¹ pe³zaczy!";
};                       

FUNC int  STT_301_IAN_NOTENOUGH_Condition()
{
	if ( Npc_HasItems (hero,ItAt_Crawlerqueen) > 1 )
	&& ( Npc_HasItems (hero,ItAt_Crawlerqueen) < 3 )
	{
		return TRUE;
	};
};
FUNC VOID  STT_301_IAN_NOTENOUGH_Info()
{
	AI_Output			(other, self,"STT_301_IAN_NOTENOUGH_Info_15_01"); //Znalaz³em gniazdo! I jaja z³o¿one przez królow¹ pe³zaczy!
	AI_Output			(self, other,"STT_301_IAN_NOTENOUGH_Info_13_02"); //Co? Tylko tyle tych jaj? A zreszt¹... Udowodni³eœ, ¿e twardy z ciebie goœæ.
};
