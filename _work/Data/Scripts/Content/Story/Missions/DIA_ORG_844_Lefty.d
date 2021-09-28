// **************************************
//					EXIT 
// **************************************

instance DIA_Lefty_Exit (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 999;
	condition	= DIA_Lefty_Exit_Condition;
	information	= DIA_Lefty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Lefty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Lefty_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//				First At Night
// **************************************

instance DIA_Lefty_FirstAtNight (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_FirstAtNight_Condition;
	information	= DIA_Lefty_FirstAtNight_Info;
	permanent	= 0;
	description = "Co tu robisz?";
};                       

FUNC int DIA_Lefty_FirstAtNight_Condition()
{
	if	(Wld_IsTime(19,00,08,00))
	&&	(!Npc_KnowsInfo(hero,DIA_Lefty_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_FirstAtNight_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Co tu robisz?
	AI_Output (self, other,"DIA_846_Hello_07_01"); //Pracujê dla Ry¿owego Ksiêcia.
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //A masz dla mnie jakieœ zajêcie?
	AI_Output (self, other,"DIA_Shrike_GetLost_07_01"); //Porozmawiamy innym razem!
	AI_StopProcessInfos	(self);
};

// **************************************
//				First
// **************************************

instance DIA_Lefty_First (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_First_Condition;
	information	= DIA_Lefty_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int DIA_Lefty_First_Condition()
{
	if	(Wld_IsTime(08,00,19,00))
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_First_Info()
{
	AI_Output (self, other,"DIA_Lefty_First_07_00"); //Hej! Jesteœ tu nowy, nie? Potrzebujê kogoœ, kto zaniesie wodê naszym zbieraczom ry¿u.
	AI_Output (self, other,"DIA_Lefty_First_07_01"); //W ten sposób od razu poznasz kilku ludzi. Zainteresowany?
	
	Log_CreateTopic		(CH1_CarryWater,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_RUNNING);
	B_LogEntry			(CH1_CarryWater,"Lewus, zadufany w sobie Szkodnik z Nowego Obozu, chce, ¿ebym zaniós³ wodê zbieraczom ry¿u.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	Info_AddChoice		(DIA_Lefty_First,"Mo¿e innym razem.",DIA_Lefty_First_Later);
	Info_AddChoice		(DIA_Lefty_First,"Sam sobie noœ tê wodê.",DIA_Lefty_First_Never);
	Info_AddChoice		(DIA_Lefty_First,"Jasne, chêtnie wam pomogê.",DIA_Lefty_First_Yes);
};

func void DIA_Lefty_First_Yes()
{
	AI_Output (other, self,"DIA_Lefty_First_Yes_15_00"); //Jasne, chêtnie wam pomogê.
	AI_Output (self, other,"DIA_Lefty_First_Yes_07_01"); //Œwietnie! IdŸ do Ry¿owego Ksiêcia. On da ci wodê i powie ci co nale¿y zrobiæ. 
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_RUNNING;
	An_Bauern_verteilt = 0;
	B_LogEntry			(CH1_CarryWater,"Nie jest to mo¿e zbyt zaszczytne zadanie, ale zyskam kilku przyjació³. Wodê dostanê od niejakiego Ry¿owego Ksiêcia.");

	Info_ClearChoices	(DIA_Lefty_First);
};

func void DIA_Lefty_First_Never()
{
	AI_Output (other, self,"DIA_Lefty_First_Never_15_00"); //Sam sobie noœ tê wodê.
	AI_Output (self, other,"DIA_Lefty_First_Never_07_01"); //Tak siê nie traktuje przyjació³! Widzê, ¿e muszê nauczyæ ciê dobrych manier!
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_FAILED;
	B_LogEntry			(CH1_CarryWater,"Lewus nieŸle siê wœciek³, gdy odrzuci³em jego 'propozycjê'! A myœla³em, ¿e w Starym Obozie by³o niebezpiecznie!");
	
	Info_ClearChoices	(DIA_Lefty_First );
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_First_Later()
{
	AI_Output (other, self,"DIA_Lefty_First_Later_15_00"); //Mo¿e innym razem.
	AI_Output (self, other,"DIA_Lefty_First_Later_07_01"); //Innym razem mogê ciê ju¿ nie potrzebowaæ. Zdecyduj siê: chcesz mi pomóc czy nie?
};

// **************************************
//				Every Day
// **************************************
var int CarriedWaterForLefty;
// **************************************

instance DIA_Lefty_WorkDay (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_WorkDay_Condition;
	information	= DIA_Lefty_WorkDay_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC int DIA_Lefty_WorkDay_Condition()
{
	if	(Wld_IsTime(08,00,19,00) || (Lefty_Mission == LOG_SUCCESS))				// wenn Wasser verteilt, dann auch abends am Lagerfeuer!
	&&	(self.aivar[AIV_WASDEFEATEDBYSC]==FALSE)
	&&	((Lefty_WorkDay <= Wld_GetDay()-1) || (Lefty_Mission == LOG_SUCCESS))	// wenn Wasser verteilt, dann auch noch am selben Tag! 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_WorkDay_Info()
{
	AI_Output (self, other,"DIA_Lefty_WorkDay_07_00"); //Hej, ty!
	
	if (Lefty_Mission == LOG_FAILED)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_00"); //Masz ogromne szczêœcie! Postanowi³em daæ ci drug¹ szansê.
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_01"); //Ale tym razem postaraj siê tego nie spartaczyæ! IdŸ do Ry¿owego Ksiêcia, a potem roznieœ wodê wszystkim zbieraczom, jasne?
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		B_LogEntry			(CH1_CarryWater,"Znowu wpad³em na Lewusa! Kaza³ mi zajrzeæ do Ry¿owego Ksiêcia i zanieœæ wodê zbieraczom na polach ry¿owych.");
		
		AI_StopProcessInfos	(self);
	}
	else if (Lefty_Mission == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //Przecie¿ kaza³em ci roznieœæ wodê zbieraczom!
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //Nie lubiê ludzi, którzy coœ obiecuj¹, a potem nie dotrzymuj¹ s³owa!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_FAILED;
		B_LogEntry			(CH1_CarryWater,"Lewus bardzo siê zez³oœci³, ¿e nie roznios³em jeszcze wody! Z tym goœciem bêd¹ jeszcze k³opoty!");
		
		AI_StopProcessInfos	(self);
		Npc_SetTarget (self, other);
		AI_StartState (self, ZS_ATTACK, 1, "");
	}
	else if (Lefty_Mission == LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //Dobra robota! Mo¿e bêd¹ z ciebie ludzie.
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //Widzê, ¿e jesteœ wprost stworzony do tego zadania! Od tej pory bêdziesz to robi³ codziennie. Bierz siê do roboty!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		if	!CarriedWaterForLefty
		{
			B_LogEntry		(CH1_CarryWater,"Nie mogê w to uwierzyæ! Roznios³em wodê tak, jak mi kazano, ale Lewus oczekuje, ¿e bêdê to robi³ codziennie! Ten dureñ powinien chyba dostaæ nauczkê.");
			B_GiveXP		(XP_LeftyCarriedWater);
			CarriedWaterForLefty = TRUE;
		};
		
		AI_StopProcessInfos	(self);
	};
};

// **************************************
//				NICHT MEHR
// **************************************

instance DIA_Lefty_NeverAgain (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_NeverAgain_Condition;
	information	= DIA_Lefty_NeverAgain_Info;
	permanent	= 1;
	description	= "Od tej pory mo¿esz sam sobie biegaæ z t¹ wod¹!";
};                       

FUNC int DIA_Lefty_NeverAgain_Condition()
{
	if ( (Lefty_Mission == LOG_RUNNING) && (self.aivar[AIV_WASDEFEATEDBYSC]==FALSE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_NeverAgain_Info()
{
	AI_Output (other, self,"DIA_Lefty_NeverAgain_15_00"); //Od tej pory mo¿esz sam sobie biegaæ z t¹ wod¹!
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_01"); //Czy¿by? A co - masz coœ lepszego do roboty?
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_02"); //Chyba muszê ci przypomnieæ kto tu jest szefem!
	
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};	

// **************************************
//				PERM
// **************************************
var int LeftyWasBeaten;
// **************************************
instance DIA_Lefty_PERM (C_INFO)
{
	npc			= Org_844_Lefty;
	nr			= 1;
	condition	= DIA_Lefty_PERM_Condition;
	information	= DIA_Lefty_PERM_Info;
	permanent	= 1;
	description	= "Co s³ychaæ, przyjacielu?";
};                       

FUNC int DIA_Lefty_PERM_Condition()
{
	if (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE) 
	{
		return 1;
	};
};

FUNC VOID DIA_Lefty_PERM_Info()
{
	AI_Output (other, self,"DIA_Lefty_PERM_15_00"); //Co s³ychaæ, przyjacielu?
	AI_Output (self, other,"DIA_Lefty_PERM_07_01"); //Cz³owieku! Czego chcesz?!

	if	!LeftyWasBeaten
	{
		B_LogEntry			(CH1_CarryWater,"Wyjaœni³em Lewusowi, ¿e nie zamierzam ganiaæ w tê i z powrotem z wod¹ dla Zbieraczy. Niektórzy ludzie musz¹ oberwaæ, zanim zrozumiej¹, co siê do nich mówi.");
		Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
		B_GiveXP			(XP_LeftyConfronted);
		LeftyWasBeaten = TRUE;
	};
	
	Info_ClearChoices	(DIA_Lefty_PERM );
	Info_AddChoice		(DIA_Lefty_PERM,"Chcia³em zobaczyæ, co u ciebie s³ychaæ.",DIA_Lefty_PERM_Nothing);
	Info_AddChoice		(DIA_Lefty_PERM,"Zbieracze wygl¹daj¹ na spragnionych.",DIA_Lefty_PERM_Durstig);
	Info_AddChoice		(DIA_Lefty_PERM,"Mia³em paskudny dzieñ, i mam ochotê roz³adowaæ drzemi¹c¹ we mnie z³oœæ!",DIA_Lefty_PERM_AufsMaul);

};	

func void DIA_Lefty_PERM_AufsMaul()
{
	AI_Output (other, self,"DIA_Lefty_PERM_AufsMaul_15_00"); //Mia³em paskudny dzieñ, i mam ochotê roz³adowaæ czêœæ drzemi¹cej we mnie z³oœci... Nie ruszaj siê przez chwilkê!
	B_Say (self,other,"$YOUWANNAFOOLME");
	Info_ClearChoices	(DIA_Lefty_PERM );
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_PERM_Durstig()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Durstig_15_00"); //Zbieracze wygl¹daj¹ na spragnionych.
	AI_Output (self, other,"DIA_Lefty_PERM_Durstig_07_01"); //Zajmê siê tym... Nie ma obawy.
	AI_StopProcessInfos	(self);
};

func void DIA_Lefty_PERM_Nothing()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Nothing_15_00"); //Chcia³em zobaczyæ, co u ciebie s³ychaæ.
	AI_StopProcessInfos	(self);
};




	
	
	
	
	
