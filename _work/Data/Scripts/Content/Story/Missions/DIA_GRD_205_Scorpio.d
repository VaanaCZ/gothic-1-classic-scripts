// **************************************
//					EXIT 
// **************************************

instance DIA_Scorpio_Exit (C_INFO)
{
	npc			= GRD_205_Scorpio;
	nr			= 999;
	condition	= DIA_Scorpio_Exit_Condition;
	information	= DIA_Scorpio_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Scorpio_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Scorpio_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//			Was willst du hier?
// **************************************

instance DIA_Scorpio_Hello (C_INFO)
{
	npc			= GRD_205_Scorpio;
	nr			= 1;
	condition	= DIA_Scorpio_Hello_Condition;
	information	= DIA_Scorpio_Hello_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Scorpio_Hello_Condition()
{	
	if	!C_NpcBelongsToOldcamp (other)
	&&	(Kapitel < 4)
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_Hello_Info()
{
	AI_Output (self, other,"DIA_Scorpio_Hello_13_00"); //Kto cię tu wpuścił?
	AI_Output (other, self,"DIA_Scorpio_Hello_15_01"); //Thorus.
	AI_Output (self, other,"DIA_Scorpio_Hello_13_02"); //I czego tu szukasz?

	Info_ClearChoices 	(DIA_Scorpio_Hello);
	Info_Addchoice 		(DIA_Scorpio_Hello,"Chciałem się tylko trochę rozejrzeć.",DIA_Scorpio_Hello_JustLooking);
	Info_Addchoice 		(DIA_Scorpio_Hello,"Mam wiadomość dla magów.",DIA_Scorpio_Hello_Mages);
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		Info_Addchoice 		(DIA_Scorpio_Hello,"Przyniosłem bagienne ziele dla Gomeza.",DIA_Scorpio_Hello_Kraut);
	};
	if (Npc_KnowsInfo(hero, Info_Thorus_ReadyForGomez))
	{
		Info_Addchoice 		(DIA_Scorpio_Hello,"Idę się zobaczyć z Gomezem. Zamierzam do was dołączyć.",DIA_Scorpio_Hello_Join);
	};
};

func void DIA_Scorpio_Hello_JustLooking()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_JustLooking_15_00"); //Chciałem się tylko trochę rozejrzeć.
	AI_Output (self, other,"DIA_Scorpio_Hello_JustLooking_13_01"); //Bardzo śmieszne.
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Mages()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_Mages_15_00"); //Mam wiadomość dla magów.
	AI_Output (self, other,"DIA_Scorpio_Hello_Mages_13_01"); //Pracujesz dla magów? Nie chcę mieć z nimi nic do czynienia!
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Kraut()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_Kraut_15_00"); //Przyniosłem bagienne ziele dla Gomeza.
	AI_Output (self, other,"DIA_Scorpio_Hello_Kraut_13_01"); //To zanieś je do tego domu, którego wejścia broni dwóch strażników.
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Join()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_Join_15_00"); //Idę zobaczyć się z Gomezem. Zamierzam do was dołączyć.
	AI_Output (self, other,"DIA_Scorpio_Hello_Join_13_01"); //Ty? A co z ciebie będzie za pożytek?
	AI_Output (other, self,"DIA_Scorpio_Hello_Join_15_02"); //Cienie na mnie nie narzekały.
	AI_Output (self, other,"DIA_Scorpio_Hello_Join_13_03"); //Ale my nie chcemy nawet słyszeć o Cieniach! To MY trzymamy rękę na pulsie.
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

// **************************************
//			REFUSE TRAIN
// **************************************

instance DIA_Scorpio_REFUSETRAIN (C_INFO)
{
	npc			= GRD_205_Scorpio;
	nr			= 1;
	condition	= DIA_Scorpio_REFUSETRAIN_Condition;
	information	= DIA_Scorpio_REFUSETRAIN_Info;
	permanent	= 1;
	description = "Możesz mnie nauczyć walczyć?";
};                       

FUNC int DIA_Scorpio_REFUSETRAIN_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Scorpio_Hello) && (Npc_GetTrueGuild (hero) != GIL_GRD) )
	{
		return 1;
	};
};

FUNC VOID DIA_Scorpio_REFUSETRAIN_Info()
{
	AI_Output (other, self,"DIA_Scorpio_REFUSETRAIN_15_00"); //Możesz mnie nauczyć lepiej walczyć?
	AI_Output (self, other,"DIA_Scorpio_REFUSETRAIN_13_01"); //Szkolę tylko Strażników, więc dopóki Thorus nie przyjmie cię w nasze szeregi, musisz poszukać sobie innego nauczyciela.
	
};

//*******************************
//*********°°°°°°°°°°°***********
//********* KAPITEL 3 ***********
//*********...........***********
//*******************************


/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_205_Scorpio_WELCOME (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_WELCOME_Condition;
	information		= GRD_205_Scorpio_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_205_Scorpio_WELCOME_Condition()
{
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_205_Scorpio_WELCOME_Info()
{
	
	AI_Output (self, other,"GRD_205_Scorpio_WELCOME_Info_13_01"); //Przejście do nas było najmądrzejszą decyzją twojego życia!
	AI_StopProcessInfos	( self );
};

/*------------------------------------------------------------------------
							ARMBRUST TALK							
------------------------------------------------------------------------*/

instance  GRD_205_Scorpio_CROSSBOW (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_CROSSBOW_Condition;
	information		= GRD_205_Scorpio_CROSSBOW_Info;
	important		= 0;
	permanent		= 1;
	description		= "Możesz mnie czegoś nauczyć?"; 
};

FUNC int  GRD_205_Scorpio_CROSSBOW_Condition()
{	
	if (Kapitel >= 4)
	|| (Npc_GetTrueGuild (hero) == GIL_GRD) 
	
	{
		return TRUE;
	};

};
FUNC void  GRD_205_Scorpio_CROSSBOW_Info()
{
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW_Info_15_01"); //Możesz mnie czegoś nauczyć?
	AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_Info_13_02"); //Jeśli masz dość rudy, pokażę ci jak posługiwać się kuszą. To cię będzie kosztować jakieś 200 bryłek.
	if (log_scorpiocrossbow == FALSE)
	&& (Kapitel <= 4)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry			(GE_TeacherOC,"Skorpion może mnie nauczyć posługiwać się kuszą.");
		log_scorpiocrossbow = TRUE;
	}
	else if (log_scorpiocrossbow == FALSE)
	&& (Kapitel > 4)
	{
		Log_CreateTopic   	(GE_TeacherOW,LOG_NOTE);
		B_LogEntry			(GE_TeacherOW,"Skorpion może mnie nauczyć posługiwać się kuszą.");
		log_scorpiocrossbow = TRUE;
	};
	Info_ClearChoices (GRD_205_Scorpio_CROSSBOW);
	Info_Addchoice 	(GRD_205_Scorpio_CROSSBOW,B_BuildLearnString(NAME_LearnCrossbow_1,	LPCOST_TALENT_CROSSBOW_1,200),GRD_205_Scorpio_CROSSBOW_OK);
	Info_Addchoice 	(GRD_205_Scorpio_CROSSBOW,DIALOG_BACK,GRD_205_Scorpio_CROSSBOW_BACK);

};  
func void GRD_205_Scorpio_CROSSBOW_BACK()
{
	Info_ClearChoices	(GRD_205_Scorpio_CROSSBOW );
};

func void GRD_205_Scorpio_CROSSBOW_OK()
{
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW_OK_15_01"); //Umowa stoi. Pokaż mi jak obchodzić się z kuszą.
	if (Npc_HasItems (hero,ItMiNugget)>= 200)
	{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 1, LPCOST_TALENT_CROSSBOW_1))
		{
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_02"); //Dobra. Bierzmy się do roboty.
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_03"); //Złap kuszę mocno i oprzyj ją o ramię. To powinno zwiększyć celność strzału.
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_04"); //Przez kilka pierwszych dni twoje ramię da ci się nieźle we znaki, ale z czasem przywykniesz.
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_05"); //Po jakimś tygodniu będziesz miał ręce ze stali!
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_06"); //Wyceluj spokojnie i powoli ściągnij spust. Bełt niesie ze sobą więcej siły niż strzała, dlatego powoduje większe zniszczenia.
			B_GiveInvItems (hero,other,ItMiNugget,200);
			GRD_205_Scorpio_CROSSBOW.permanent = 0;
		};
	}
	else
	{
	 AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_07"); //DWIEŚCIE BRYŁEK RUDY, płatne do ręki i to od razu! Inaczej nie mamy o czym rozmawiać!
	};
};

/*------------------------------------------------------------------------
							ARMBRUST TALENT2									
------------------------------------------------------------------------*/

instance  GRD_205_Scorpio_CROSSBOW2 (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_CROSSBOW2_Condition;
	information		= GRD_205_Scorpio_CROSSBOW2_Info;
	important		= 0;
	permanent		= 1;
	description		= "Umowa stoi. Pokaż mi jak obchodzić się z kuszą."; 
};

FUNC int  GRD_205_Scorpio_CROSSBOW2_Condition()
{
	if (Npc_GetTalentSkill  ( hero, NPC_TALENT_CROSSBOW ) == 1) 
	{
		return TRUE;
	};

};
FUNC void  GRD_205_Scorpio_CROSSBOW2_Info()
{
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW2_Info_15_01"); //Chciałbym dowiedzieć się czegoś więcej o strzelaniu z kuszy.
	AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_Info_13_02"); //To cię będzie kosztować 300 bryłek rudy.
  
	Info_ClearChoices (GRD_205_Scorpio_CROSSBOW2);
	Info_Addchoice 	(GRD_205_Scorpio_CROSSBOW2,B_BuildLearnString(NAME_LearnCrossbow_2,	LPCOST_TALENT_CROSSBOW_2,300),GRD_205_Scorpio_CROSSBOW2_OK);
	Info_Addchoice 	(GRD_205_Scorpio_CROSSBOW2,DIALOG_BACK,  GRD_205_Scorpio_CROSSBOW2_BACK);
	

};  
func void GRD_205_Scorpio_CROSSBOW2_BACK()
{
	Info_ClearChoices (GRD_205_Scorpio_CROSSBOW);
};

func void GRD_205_Scorpio_CROSSBOW2_OK()
{
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW2_OK_15_01"); //Zaczynajmy.
	if (Npc_HasItems (hero,ItMiNugget)>= 300)
	{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 2, LPCOST_TALENT_CROSSBOW_2))
		{
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_02"); //Dobra. Twoje strzały będą celniejsze, jeśli przed ściągnięciem spustu ugniesz nieco nogi w kolanach.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_03"); //Naucz się poprawnie oceniać prędkość z jaką porusza się twój cel.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_04"); //Wystrzel pocisk tak, by w odpowiednim miejscu i czasie przeciął ścieżkę, którą porusza się cel.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_05"); //Jeśli atakujesz więcej niż jeden cel, nie trać czasu: musisz możliwie szybko przygwoździć jeden za drugim dobrze wymierzonymi strzałami.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_06"); //To by było na tyle. 
		B_GiveInvItems (hero,other,ItMiNugget,300);
		GRD_205_Scorpio_CROSSBOW2.permanent = 0;
		};
	}
	else
	{
	 AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_07"); //Najpierw postaraj się zdobyć te TRZYSTA BRYŁEK RUDY!
	};
};
/*------------------------------------------------------------------------
Ab Kapitel 4 steht Scorpio draussen, damit der Spieler bei ihm noch lernen kann								
------------------------------------------------------------------------*/
/*------------------------------------------------------------------------
//							hey PC!								//
------------------------------------------------------------------------*/
instance GRD_205_Scorpio_HeyPC (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_HeyPC_Condition;
	information		= GRD_205_Scorpio_HeyPC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_205_Scorpio_HeyPC_Condition()
{	
	if (kapitel >= 4)
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  GRD_205_Scorpio_HeyPC_Info()
{
	AI_Output (self, other,"GRD_205_Scorpio_HeyPC_Info_13_01"); //Nie bój się, człowieku! Chodź no tutaj!
};

/*------------------------------------------------------------------------
//							Scorpio ist abgehauen								//
------------------------------------------------------------------------*/
instance  GRD_205_Scorpio_BANISHED (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_BANISHED_Condition;
	information		= GRD_205_Scorpio_BANISHED_Info;
	important		= 0;
	permanent		= 0;
	description		= "Wszystko w porządku?"; 
};

FUNC int  GRD_205_Scorpio_BANISHED_Condition()
{	
	if (Npc_KnowsInfo (hero,GRD_205_Scorpio_HeyPC))
	{
		return TRUE;
	};

};
FUNC void  GRD_205_Scorpio_BANISHED_Info()
{
	AI_Output (other, self,"GRD_205_Scorpio_BANISHED_Info_15_01"); //Wszystko w porządku?
	AI_Output (self, other,"GRD_205_Scorpio_BANISHED_Info_13_02"); //Ukrywam się. Mam już dość machlojek strażników.
	AI_Output (self, other,"GRD_205_Scorpio_BANISHED_Info_13_03"); //Ale zabrałem kilka niezłych cacek ze zbrojowni. Gdybyś potrzebował broni - zgłoś się do mnie.
	if (Scorpio_Exile == FALSE)
	{
	Log_CreateTopic   	(GE_TraderOW,LOG_NOTE);
	B_LogEntry		(GE_TraderOW,"Skorpion opuścił Stary Obóz i wraz z Cavalornem mieszka teraz w myśliwskiej chacie na drodze do Nowego Obozu.");
	Scorpio_Exile = TRUE;
	};
};  

/*------------------------------------------------------------------------
							TRADE								
------------------------------------------------------------------------*/

instance  GRD_205_Scorpio_TRADE (C_INFO)
{
	npc				= GRD_205_Scorpio;
	condition		= GRD_205_Scorpio_TRADE_Condition;
	information		= GRD_205_Scorpio_TRADE_Info;
	important		= 0;
	permanent		= 1;
	description		= "Pokaż, co tam masz."; 
	trade			= 1;
};

FUNC int  GRD_205_Scorpio_TRADE_Condition()
{	
	if( Npc_KnowsInfo (hero,GRD_205_Scorpio_BANISHED))
	{
		return TRUE;
	};

};
FUNC void  GRD_205_Scorpio_TRADE_Info()
{
	AI_Output (other, self,"GRD_205_Scorpio_TRADE_Info_15_01"); //Pokaż, co tam masz.
	
};  
