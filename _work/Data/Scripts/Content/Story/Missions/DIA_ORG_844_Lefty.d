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
	AI_Output (self, other,"DIA_846_Hello_07_01"); //Pracuj� dla Ry�owego Ksi�cia.
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //A masz dla mnie jakie� zaj�cie?
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
	AI_Output (self, other,"DIA_Lefty_First_07_00"); //Hej! Jeste� tu nowy, nie? Potrzebuj� kogo�, kto zaniesie wod� naszym zbieraczom ry�u.
	AI_Output (self, other,"DIA_Lefty_First_07_01"); //W ten spos�b od razu poznasz kilku ludzi. Zainteresowany?
	
	Log_CreateTopic		(CH1_CarryWater,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_RUNNING);
	B_LogEntry			(CH1_CarryWater,"Lewus, zadufany w sobie Szkodnik z Nowego Obozu, chce, �ebym zani�s� wod� zbieraczom ry�u.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	Info_AddChoice		(DIA_Lefty_First,"Mo�e innym razem.",DIA_Lefty_First_Later);
	Info_AddChoice		(DIA_Lefty_First,"Sam sobie no� t� wod�.",DIA_Lefty_First_Never);
	Info_AddChoice		(DIA_Lefty_First,"Jasne, ch�tnie wam pomog�.",DIA_Lefty_First_Yes);
};

func void DIA_Lefty_First_Yes()
{
	AI_Output (other, self,"DIA_Lefty_First_Yes_15_00"); //Jasne, ch�tnie wam pomog�.
	AI_Output (self, other,"DIA_Lefty_First_Yes_07_01"); //�wietnie! Id� do Ry�owego Ksi�cia. On da ci wod� i powie ci co nale�y zrobi�. 
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_RUNNING;
	An_Bauern_verteilt = 0;
	B_LogEntry			(CH1_CarryWater,"Nie jest to mo�e zbyt zaszczytne zadanie, ale zyskam kilku przyjaci�. Wod� dostan� od niejakiego Ry�owego Ksi�cia.");

	Info_ClearChoices	(DIA_Lefty_First);
};

func void DIA_Lefty_First_Never()
{
	AI_Output (other, self,"DIA_Lefty_First_Never_15_00"); //Sam sobie no� t� wod�.
	AI_Output (self, other,"DIA_Lefty_First_Never_07_01"); //Tak si� nie traktuje przyjaci�! Widz�, �e musz� nauczy� ci� dobrych manier!
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_FAILED;
	B_LogEntry			(CH1_CarryWater,"Lewus nie�le si� w�ciek�, gdy odrzuci�em jego 'propozycj�'! A my�la�em, �e w Starym Obozie by�o niebezpiecznie!");
	
	Info_ClearChoices	(DIA_Lefty_First );
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_First_Later()
{
	AI_Output (other, self,"DIA_Lefty_First_Later_15_00"); //Mo�e innym razem.
	AI_Output (self, other,"DIA_Lefty_First_Later_07_01"); //Innym razem mog� ci� ju� nie potrzebowa�. Zdecyduj si�: chcesz mi pom�c czy nie?
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
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_00"); //Masz ogromne szcz�cie! Postanowi�em da� ci drug� szans�.
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_01"); //Ale tym razem postaraj si� tego nie spartaczy�! Id� do Ry�owego Ksi�cia, a potem roznie� wod� wszystkim zbieraczom, jasne?
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		B_LogEntry			(CH1_CarryWater,"Znowu wpad�em na Lewusa! Kaza� mi zajrze� do Ry�owego Ksi�cia i zanie�� wod� zbieraczom na polach ry�owych.");
		
		AI_StopProcessInfos	(self);
	}
	else if (Lefty_Mission == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //Przecie� kaza�em ci roznie�� wod� zbieraczom!
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //Nie lubi� ludzi, kt�rzy co� obiecuj�, a potem nie dotrzymuj� s�owa!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_FAILED;
		B_LogEntry			(CH1_CarryWater,"Lewus bardzo si� zez�o�ci�, �e nie roznios�em jeszcze wody! Z tym go�ciem b�d� jeszcze k�opoty!");
		
		AI_StopProcessInfos	(self);
		Npc_SetTarget (self, other);
		AI_StartState (self, ZS_ATTACK, 1, "");
	}
	else if (Lefty_Mission == LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //Dobra robota! Mo�e b�d� z ciebie ludzie.
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //Widz�, �e jeste� wprost stworzony do tego zadania! Od tej pory b�dziesz to robi� codziennie. Bierz si� do roboty!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		if	!CarriedWaterForLefty
		{
			B_LogEntry		(CH1_CarryWater,"Nie mog� w to uwierzy�! Roznios�em wod� tak, jak mi kazano, ale Lewus oczekuje, �e b�d� to robi� codziennie! Ten dure� powinien chyba dosta� nauczk�.");
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
	description	= "Od tej pory mo�esz sam sobie biega� z t� wod�!";
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
	AI_Output (other, self,"DIA_Lefty_NeverAgain_15_00"); //Od tej pory mo�esz sam sobie biega� z t� wod�!
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_01"); //Czy�by? A co - masz co� lepszego do roboty?
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_02"); //Chyba musz� ci przypomnie� kto tu jest szefem!
	
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
	description	= "Co s�ycha�, przyjacielu?";
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
	AI_Output (other, self,"DIA_Lefty_PERM_15_00"); //Co s�ycha�, przyjacielu?
	AI_Output (self, other,"DIA_Lefty_PERM_07_01"); //Cz�owieku! Czego chcesz?!

	if	!LeftyWasBeaten
	{
		B_LogEntry			(CH1_CarryWater,"Wyja�ni�em Lewusowi, �e nie zamierzam gania� w t� i z powrotem z wod� dla Zbieraczy. Niekt�rzy ludzie musz� oberwa�, zanim zrozumiej�, co si� do nich m�wi.");
		Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
		B_GiveXP			(XP_LeftyConfronted);
		LeftyWasBeaten = TRUE;
	};
	
	Info_ClearChoices	(DIA_Lefty_PERM );
	Info_AddChoice		(DIA_Lefty_PERM,"Chcia�em zobaczy�, co u ciebie s�ycha�.",DIA_Lefty_PERM_Nothing);
	Info_AddChoice		(DIA_Lefty_PERM,"Zbieracze wygl�daj� na spragnionych.",DIA_Lefty_PERM_Durstig);
	Info_AddChoice		(DIA_Lefty_PERM,"Mia�em paskudny dzie�, i mam ochot� roz�adowa� drzemi�c� we mnie z�o��!",DIA_Lefty_PERM_AufsMaul);

};	

func void DIA_Lefty_PERM_AufsMaul()
{
	AI_Output (other, self,"DIA_Lefty_PERM_AufsMaul_15_00"); //Mia�em paskudny dzie�, i mam ochot� roz�adowa� cz�� drzemi�cej we mnie z�o�ci... Nie ruszaj si� przez chwilk�!
	B_Say (self,other,"$YOUWANNAFOOLME");
	Info_ClearChoices	(DIA_Lefty_PERM );
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_PERM_Durstig()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Durstig_15_00"); //Zbieracze wygl�daj� na spragnionych.
	AI_Output (self, other,"DIA_Lefty_PERM_Durstig_07_01"); //Zajm� si� tym... Nie ma obawy.
	AI_StopProcessInfos	(self);
};

func void DIA_Lefty_PERM_Nothing()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Nothing_15_00"); //Chcia�em zobaczy�, co u ciebie s�ycha�.
	AI_StopProcessInfos	(self);
};




	
	
	
	
	
