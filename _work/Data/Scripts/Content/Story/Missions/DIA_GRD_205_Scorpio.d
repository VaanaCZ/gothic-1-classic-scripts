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
	AI_Output (self, other,"DIA_Scorpio_Hello_13_00"); //Kto ciê tu wpuœci³?
	AI_Output (other, self,"DIA_Scorpio_Hello_15_01"); //Thorus.
	AI_Output (self, other,"DIA_Scorpio_Hello_13_02"); //I czego tu szukasz?

	Info_ClearChoices 	(DIA_Scorpio_Hello);
	Info_Addchoice 		(DIA_Scorpio_Hello,"Chcia³em siê tylko trochê rozejrzeæ.",DIA_Scorpio_Hello_JustLooking);
	Info_Addchoice 		(DIA_Scorpio_Hello,"Mam wiadomoœæ dla magów.",DIA_Scorpio_Hello_Mages);
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		Info_Addchoice 		(DIA_Scorpio_Hello,"Przynios³em bagienne ziele dla Gomeza.",DIA_Scorpio_Hello_Kraut);
	};
	if (Npc_KnowsInfo(hero, Info_Thorus_ReadyForGomez))
	{
		Info_Addchoice 		(DIA_Scorpio_Hello,"Idê siê zobaczyæ z Gomezem. Zamierzam do was do³¹czyæ.",DIA_Scorpio_Hello_Join);
	};
};

func void DIA_Scorpio_Hello_JustLooking()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_JustLooking_15_00"); //Chcia³em siê tylko trochê rozejrzeæ.
	AI_Output (self, other,"DIA_Scorpio_Hello_JustLooking_13_01"); //Bardzo œmieszne.
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Mages()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_Mages_15_00"); //Mam wiadomoœæ dla magów.
	AI_Output (self, other,"DIA_Scorpio_Hello_Mages_13_01"); //Pracujesz dla magów? Nie chcê mieæ z nimi nic do czynienia!
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Kraut()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_Kraut_15_00"); //Przynios³em bagienne ziele dla Gomeza.
	AI_Output (self, other,"DIA_Scorpio_Hello_Kraut_13_01"); //To zanieœ je do tego domu, którego wejœcia broni dwóch stra¿ników.
	Info_ClearChoices 	(DIA_Scorpio_Hello);
};

func void DIA_Scorpio_Hello_Join()
{
	AI_Output (other, self,"DIA_Scorpio_Hello_Join_15_00"); //Idê zobaczyæ siê z Gomezem. Zamierzam do was do³¹czyæ.
	AI_Output (self, other,"DIA_Scorpio_Hello_Join_13_01"); //Ty? A co z ciebie bêdzie za po¿ytek?
	AI_Output (other, self,"DIA_Scorpio_Hello_Join_15_02"); //Cienie na mnie nie narzeka³y.
	AI_Output (self, other,"DIA_Scorpio_Hello_Join_13_03"); //Ale my nie chcemy nawet s³yszeæ o Cieniach! To MY trzymamy rêkê na pulsie.
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
	description = "Mo¿esz mnie nauczyæ walczyæ?";
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
	AI_Output (other, self,"DIA_Scorpio_REFUSETRAIN_15_00"); //Mo¿esz mnie nauczyæ lepiej walczyæ?
	AI_Output (self, other,"DIA_Scorpio_REFUSETRAIN_13_01"); //Szkolê tylko Stra¿ników, wiêc dopóki Thorus nie przyjmie ciê w nasze szeregi, musisz poszukaæ sobie innego nauczyciela.
	
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
	
	AI_Output (self, other,"GRD_205_Scorpio_WELCOME_Info_13_01"); //Przejœcie do nas by³o najm¹drzejsz¹ decyzj¹ twojego ¿ycia!
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
	description		= "Mo¿esz mnie czegoœ nauczyæ?"; 
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
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW_Info_15_01"); //Mo¿esz mnie czegoœ nauczyæ?
	AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_Info_13_02"); //Jeœli masz doœæ rudy, poka¿ê ci jak pos³ugiwaæ siê kusz¹. To ciê bêdzie kosztowaæ jakieœ 200 bry³ek.
	if (log_scorpiocrossbow == FALSE)
	&& (Kapitel <= 4)
	{
		Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
		B_LogEntry			(GE_TeacherOC,"Skorpion mo¿e mnie nauczyæ pos³ugiwaæ siê kusz¹.");
		log_scorpiocrossbow = TRUE;
	}
	else if (log_scorpiocrossbow == FALSE)
	&& (Kapitel > 4)
	{
		Log_CreateTopic   	(GE_TeacherOW,LOG_NOTE);
		B_LogEntry			(GE_TeacherOW,"Skorpion mo¿e mnie nauczyæ pos³ugiwaæ siê kusz¹.");
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
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW_OK_15_01"); //Umowa stoi. Poka¿ mi jak obchodziæ siê z kusz¹.
	if (Npc_HasItems (hero,ItMiNugget)>= 200)
	{
		if (B_GiveSkill(other,NPC_TALENT_CROSSBOW , 1, LPCOST_TALENT_CROSSBOW_1))
		{
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_02"); //Dobra. Bierzmy siê do roboty.
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_03"); //Z³ap kuszê mocno i oprzyj j¹ o ramiê. To powinno zwiêkszyæ celnoœæ strza³u.
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_04"); //Przez kilka pierwszych dni twoje ramiê da ci siê nieŸle we znaki, ale z czasem przywykniesz.
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_05"); //Po jakimœ tygodniu bêdziesz mia³ rêce ze stali!
			AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_06"); //Wyceluj spokojnie i powoli œci¹gnij spust. Be³t niesie ze sob¹ wiêcej si³y ni¿ strza³a, dlatego powoduje wiêksze zniszczenia.
			B_GiveInvItems (hero,other,ItMiNugget,200);
			GRD_205_Scorpio_CROSSBOW.permanent = 0;
		};
	}
	else
	{
	 AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW_OK_13_07"); //DWIEŒCIE BRY£EK RUDY, p³atne do rêki i to od razu! Inaczej nie mamy o czym rozmawiaæ!
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
	description		= "Umowa stoi. Poka¿ mi jak obchodziæ siê z kusz¹."; 
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
	AI_Output (other, self,"GRD_205_Scorpio_CROSSBOW2_Info_15_01"); //Chcia³bym dowiedzieæ siê czegoœ wiêcej o strzelaniu z kuszy.
	AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_Info_13_02"); //To ciê bêdzie kosztowaæ 300 bry³ek rudy.
  
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
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_02"); //Dobra. Twoje strza³y bêd¹ celniejsze, jeœli przed œci¹gniêciem spustu ugniesz nieco nogi w kolanach.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_03"); //Naucz siê poprawnie oceniaæ prêdkoœæ z jak¹ porusza siê twój cel.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_04"); //Wystrzel pocisk tak, by w odpowiednim miejscu i czasie przeci¹³ œcie¿kê, któr¹ porusza siê cel.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_05"); //Jeœli atakujesz wiêcej ni¿ jeden cel, nie traæ czasu: musisz mo¿liwie szybko przygwoŸdziæ jeden za drugim dobrze wymierzonymi strza³ami.
		AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_06"); //To by by³o na tyle. 
		B_GiveInvItems (hero,other,ItMiNugget,300);
		GRD_205_Scorpio_CROSSBOW2.permanent = 0;
		};
	}
	else
	{
	 AI_Output (self, other,"GRD_205_Scorpio_CROSSBOW2_OK_13_07"); //Najpierw postaraj siê zdobyæ te TRZYSTA BRY£EK RUDY!
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
	AI_Output (self, other,"GRD_205_Scorpio_HeyPC_Info_13_01"); //Nie bój siê, cz³owieku! ChodŸ no tutaj!
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
	description		= "Wszystko w porz¹dku?"; 
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
	AI_Output (other, self,"GRD_205_Scorpio_BANISHED_Info_15_01"); //Wszystko w porz¹dku?
	AI_Output (self, other,"GRD_205_Scorpio_BANISHED_Info_13_02"); //Ukrywam siê. Mam ju¿ doœæ machlojek stra¿ników.
	AI_Output (self, other,"GRD_205_Scorpio_BANISHED_Info_13_03"); //Ale zabra³em kilka niez³ych cacek ze zbrojowni. Gdybyœ potrzebowa³ broni - zg³oœ siê do mnie.
	if (Scorpio_Exile == FALSE)
	{
	Log_CreateTopic   	(GE_TraderOW,LOG_NOTE);
	B_LogEntry		(GE_TraderOW,"Skorpion opuœci³ Stary Obóz i wraz z Cavalornem mieszka teraz w myœliwskiej chacie na drodze do Nowego Obozu.");
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
	description		= "Poka¿, co tam masz."; 
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
	AI_Output (other, self,"GRD_205_Scorpio_TRADE_Info_15_01"); //Poka¿, co tam masz.
	
};  
