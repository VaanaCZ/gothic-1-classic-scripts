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
	description = "Co tady d�l�?";
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
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Co tady d�l�?
	AI_Output (self, other,"DIA_846_Hello_07_01"); //Pracuju pro R��ov�ho Lorda.
	AI_Output (other, self,"DIA_Ricelord_Arbeit_15_00"); //M� pro m� n�jakou pr�ci?
	AI_Output (self, other,"DIA_Shrike_GetLost_07_01"); //Je�t� si popov�d�me!
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
	AI_Output (self, other,"DIA_Lefty_First_07_00"); //Hej! Ty jsi pr�v� p�i�el? Pot�ebujeme n�koho, kdo by nosil vodu roln�k�m na r��ov� pole.
	AI_Output (self, other,"DIA_Lefty_First_07_01"); //Takhle m��e� s n�kter�mi lidmi nav�zat p��telstv�. Tak co ��k�?
	
	Log_CreateTopic		(CH1_CarryWater,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_CarryWater,	LOG_RUNNING);
	B_LogEntry			(CH1_CarryWater,"Lefty, otravn� bandita z Nov�ho t�bora, po mn� chce, abych nosil roln�k�m na pole vodu.");
	
	Info_ClearChoices	(DIA_Lefty_First );
	Info_AddChoice		(DIA_Lefty_First,"Mo�n� pozd�ji.",DIA_Lefty_First_Later);
	Info_AddChoice		(DIA_Lefty_First,"Dones tu vodu roln�k�m s�m!",DIA_Lefty_First_Never);
	Info_AddChoice		(DIA_Lefty_First,"Jist�, r�d pom��u.",DIA_Lefty_First_Yes);
};

func void DIA_Lefty_First_Yes()
{
	AI_Output (other, self,"DIA_Lefty_First_Yes_15_00"); //Jist�, r�d pom��u.
	AI_Output (self, other,"DIA_Lefty_First_Yes_07_01"); //V�born�! Jdi za R��ov�m Lordem. D� ti vodu a �ekne v�echno, co je pot�eba ud�lat. 
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_RUNNING;
	An_Bauern_verteilt = 0;
	B_LogEntry			(CH1_CarryWater,"P�esto�e to je dosti stupidn� �kol, p�ijal jsem to, proto�e si tam mo�n� najdu n�jak� p��tele. Mus�m si vyzvednout vodu od takzvan�ho R��ov�ho lorda.");

	Info_ClearChoices	(DIA_Lefty_First);
};

func void DIA_Lefty_First_Never()
{
	AI_Output (other, self,"DIA_Lefty_First_Never_15_00"); //Dones tu vodu roln�k�m s�m!
	AI_Output (self, other,"DIA_Lefty_First_Never_07_01"); //To nen� dobr� zp�sob, jak navazovat p��telstv�!  Budu t� muset nau�it slu�n�mu chov�n�!
	Lefty_WorkDay = B_SetDayTolerance();
	Lefty_Mission = LOG_FAILED;
	B_LogEntry			(CH1_CarryWater,"Kdy� jsem Leftyho 'nab�dku' odm�tl, tv��il se hodn� na�tvan�! A j� si myslel, jak� je Star� t�bor drsn� m�sto!");
	
	Info_ClearChoices	(DIA_Lefty_First );
	AI_StopProcessInfos	(self);
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_First_Later()
{
	AI_Output (other, self,"DIA_Lefty_First_Later_15_00"); //Mo�n� pozd�ji.
	AI_Output (self, other,"DIA_Lefty_First_Later_07_01"); //Pozd�ji u� nebudu nikoho pot�ebovat. Pot�ebuju tvou pomoc te� HNED. Chce� mi pomoci nebo ne?
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
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_00"); //M� �t�st�! D�m ti druhou p��le�itost.
		AI_Output (self, other,"DIA_Lefty_WorkDay_NextChance_07_01"); //Zkus to tentokr�t nezkazit! Dobr�, jdi za R��ov�m Lordem a pak roznes vodu v�em roln�k�m. Jasn�?
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		B_LogEntry			(CH1_CarryWater,"Znovu jsem se setkal s Leftym! Chce po mn�, abych �el k R��ov�mu lordovi vyzvednout vodu pro roln�ky na pol�ch.");
		
		AI_StopProcessInfos	(self);
	}
	else if (Lefty_Mission == LOG_RUNNING)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_00"); //�ekl jsem ti, abys zanesl vodu roln�k�m!
		AI_Output (self, other,"DIA_Lefty_WorkDay_StillRunning_07_01"); //Nem�m r�d lidi, kte�� d�vaj� sliby a pak je nepln�!
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_FAILED;
		B_LogEntry			(CH1_CarryWater,"Lefty byl doopravdy na padnut�, �e jsem je�t� neroznesl vodu! Jako bych si z toho �ipery st��lel. ");
		
		AI_StopProcessInfos	(self);
		Npc_SetTarget (self, other);
		AI_StartState (self, ZS_ATTACK, 1, "");
	}
	else if (Lefty_Mission == LOG_SUCCESS)
	{
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_00"); //Dobr� pr�ce! P�ece jen jsi k n��emu u�ite�n�.
		AI_Output (self, other,"DIA_Lefty_WorkDay_SUCCESS_07_01"); //Mysl�m, �e to je �kol pr�v� pro tebe. Od te�ka to bude� d�lat ka�d� den. Tak a te� pokra�uj.
		Lefty_WorkDay = B_SetDayTolerance();
		Lefty_Mission = LOG_RUNNING;
		An_Bauern_verteilt = 0;
		if	!CarriedWaterForLefty
		{
			B_LogEntry		(CH1_CarryWater,"Nem��u tomu uv��it. Potom, co jsem v�ude roznesl vodu, Lefty snad v�n� chce, abych to d�lal ka�d� den. M�m pocit, �e tomu idiotovi budu muset p�r v�c� vysv�tlit.");
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
	description	= "Od te�ka si m��e� tu vodu nosit s�m.";
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
	AI_Output (other, self,"DIA_Lefty_NeverAgain_15_00"); //Od te�ka si m��e� tu vodu nosit s�m.
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_01"); //Ale? M� n�co lep��ho?
	AI_Output (self, other,"DIA_Lefty_NeverAgain_07_02"); //Mysl�m, �e je �as ti p�ipomenout, kdo je tady ��f!
	
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
	description	= "Jak se m�, p��teli?";
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
	AI_Output (other, self,"DIA_Lefty_PERM_15_00"); //Jak se m�, p��teli?
	AI_Output (self, other,"DIA_Lefty_PERM_07_01"); //Ach, �lov��e! Co chce�?

	if	!LeftyWasBeaten
	{
		B_LogEntry			(CH1_CarryWater,"�ekl jsem Leftymu, aby m� ve vlastn�m z�jmu p�estal obt�ovat se sv�mi teoriemi o rozn�en� vody. N�kte�� lid� se pou��, jen kdy� je to zabol�.");
		Log_SetTopicStatus	(CH1_CarryWater,	LOG_SUCCESS);
		B_GiveXP			(XP_LeftyConfronted);
		LeftyWasBeaten = TRUE;
	};
	
	Info_ClearChoices	(DIA_Lefty_PERM );
	Info_AddChoice		(DIA_Lefty_PERM,"Jen jsem cht�l v�d�t, jak se m�.",DIA_Lefty_PERM_Nothing);
	Info_AddChoice		(DIA_Lefty_PERM,"Roln�ci vypadaj� ��zniv�.",DIA_Lefty_PERM_Durstig);
	Info_AddChoice		(DIA_Lefty_PERM,"M�l jsem v�n� zlej den. Rad�m ti, abys m� neprovokoval a z�stal rad�ji zticha.",DIA_Lefty_PERM_AufsMaul);

};	

func void DIA_Lefty_PERM_AufsMaul()
{
	AI_Output (other, self,"DIA_Lefty_PERM_AufsMaul_15_00"); //M�l jsem opravdu �patn� den a hled�m zp�sob, jak uvolnit nap�t�... jen takhle je�t� chvilku st�j.
	B_Say (self,other,"$YOUWANNAFOOLME");
	Info_ClearChoices	(DIA_Lefty_PERM );
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget (self, other);
	AI_StartState (self, ZS_ATTACK, 1, "");
};

func void DIA_Lefty_PERM_Durstig()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Durstig_15_00"); //Roln�ci vypadaj� ��zniv�.
	AI_Output (self, other,"DIA_Lefty_PERM_Durstig_07_01"); //Dohl�dnu na to... bez starosti.
	AI_StopProcessInfos	(self);
};

func void DIA_Lefty_PERM_Nothing()
{
	AI_Output (other, self,"DIA_Lefty_PERM_Nothing_15_00"); //Jen jsem cht�l v�d�t, jak se m�.
	AI_StopProcessInfos	(self);
};




	
	
	
	
	
