// ******************************************************************
// Zur Info: Bloodwyn: 244, 243; Bloodwyn: 229, 242; Fletcher: 241, 240

// ************************************************************
// 			  				   EXIT_Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_EXIT_Schutzgeld (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 999;
	condition	= Info_Bloodwyn_EXIT_Schutzgeld_Condition;
	information	= Info_Bloodwyn_EXIT_Schutzgeld_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Bloodwyn_EXIT_Schutzgeld_Condition()
{
	return 1;
};

FUNC VOID Info_Bloodwyn_EXIT_Schutzgeld_Info()
{	
	AI_Output (other,self,"Info_Bloodwyn_EXIT_Schutzgeld_15_00"); //��������.
	if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_01"); //������ ����, �����.
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_EXIT_Schutzgeld_08_02"); //�� ������ �� � ��� �� ��������. �� ��������� �� �����.
	};
	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Schutzgeld
// ************************************************************
INSTANCE Info_Bloodwyn_Hello (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Hello_Condition;
	information	= Info_Bloodwyn_Hello_Info;
	permanent	= 0;
	important   = 1;
};                       

FUNC INT Info_Bloodwyn_Hello_Condition()
{	
	if (Kapitel <= 2) 
	{
		return 1;
	};
};
FUNC VOID Info_Bloodwyn_Hello_Info()
{	
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_00"); //��, ��!
	AI_Output (other, self,"Info_Bloodwyn_Hello_15_01"); //��� �� ��� ��������?
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_02"); //� ������������ ����! ����� ����, ��� ��, ����� ������ �������� ����� � ������������!
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_03"); //���� �������, � ��������, ����������� ��������.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_04"); //� ��� ������, ��� ����� ������ � ����� ���, ��� �����. �� �� �� ����� �� ��������.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_05"); //����� �����, ����� � ������ ��� ���, � ��, ���������, ������ �� ����. �� ��� ������ ��������� ��� ��������.
	AI_Output (self, other,"Info_Bloodwyn_Hello_08_06"); //��� ������ � ��������� ���� ���������� ������� ����. ������ ���, � ���� ������. �� ��������� ���, �� �������� ����. � ���� � ���� ����� ��������, �� ������ �� ������.

	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"������ �� � ���? ������� �� ������ ��������?",Info_Bloodwyn_Hello_HowMuch);
	Info_AddChoice		(Info_Bloodwyn_Hello,"� ��� ���� � ���� ������������!",Info_Bloodwyn_Hello_ForgetIt);
	Info_AddChoice		(Info_Bloodwyn_Hello,"��� ������?",Info_Bloodwyn_Hello_SollDrohungSein);
};

func void Info_Bloodwyn_Hello_ForgetIt()
{
	AI_Output (other, self,"Info_Bloodwyn_ForgetIt_15_00"); //�� ����������� ��� ������� ������ �� ������? ���, �������, � ��� ���� � ���� ������������!
	AI_Output (self, other,"Info_Bloodwyn_ForgetIt_08_01"); //������ ����, �����. ����� �� ��������� � ���, ��� ������ ��� ��������� �����������.
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_SollDrohungSein()
{
	AI_Output (other, self,"Info_Bloodwyn_SollDrohungSein_15_00"); //��� ������?
	AI_Output (self, other,"Info_Bloodwyn_SollDrohungSein_08_01"); //������ ��������! ��� ����������� ������!
};

func void Info_Bloodwyn_Hello_HowMuch()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_HowMuch_15_01"); //������ �� � ���? ������� �� ������ ��������?
	AI_Output (self, other,"Info_Bloodwyn_Hello_HowMuch_08_02"); //�������. ������ ������ ����� ������ ����������.
	
	Info_ClearChoices	(Info_Bloodwyn_Hello );
	Info_AddChoice		(Info_Bloodwyn_Hello,"� ���� ��� ������ ������ ����.",Info_Bloodwyn_Hello_NotNow);
	if (Npc_HasItems(other,itminugget)>=10)
	{
		Info_AddChoice	(Info_Bloodwyn_Hello,"��� ���� ����. ������ ������ � ����.",Info_Bloodwyn_Hello_OkTakeIt);
	};
};
// -------------------------------------------------------
func void Info_Bloodwyn_Hello_OkTakeIt()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_OkTakeIt_15_00"); //��� ���� ����. ������ ������ � ����.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_01"); //������, �� ����� ������. � ����� ������� �� ����� �������� ����.
	AI_Output (self, other,"Info_Bloodwyn_Hello_OkTakeIt_08_02"); //�� ��� �� ������, ��� �� ������ ������ ���, ��� �������� - �� ��������� ������������� ���� �� �� ������ ���� ��������.
	
	B_GiveInvItems 	    (other, self, itminugget, 10);
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

func void Info_Bloodwyn_Hello_NotNow()
{
	AI_Output (other, self,"Info_Bloodwyn_Hello_NotNow_15_00"); //� ���� ��� ������ ������ ����.
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_01"); //����� ������� ����, � ��������� ������ �����.
	AI_GotoNpc (self,other);
	AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_08_02"); //���������...
		
	if (Npc_HasItems(other, itminugget) > 0)
	{
		if (Npc_HasItems(other, itminugget) > 9)
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_00"); //�� ������ ������� �� ���... ������, ���-�� �� ����� ������� �� ������, �?
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_TenOreMore_08_01"); //�������, � ������ ���, ��� � ���� ����. ����� ���� ����� � ����� ������, ��� �� ������� �������� ����.
		}
		else
		{
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_00"); //���� - �����, ��� ������. ������� �� ����, �����!
			AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_LessThanTen_08_01"); //� ����� ������� � ���� ������������ �� �����, ���� �� ���������� � ������.
		};
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Hello_NotNow_NoOre_08_00"); //������, � ���� ������ �� ������ �������, ��������. �� ������, ���-������ � ������ ���...
	};
	
	B_GiveInvItems		(other, self, itminugget, Npc_HasItems(other, itminugget) );//Alle Nuggets entfernen
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Bloodwyn_PayDay = B_SetDayTolerance();
	Info_ClearChoices	(Info_Bloodwyn_Hello );
};

// ************************************************************
// 						Schutzgeld
// ************************************************************

INSTANCE Info_Bloodwyn_PayDay (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_PayDay_Condition;
	information	= Info_Bloodwyn_PayDay_Info;
	permanent	= 1;		
	important   = 1;				//*** NUR, WENN SC AUCH 10 ERZ HAT! ***
};                       

FUNC INT Info_Bloodwyn_PayDay_Condition()
{
	if ( (Kapitel <= 2) && (Bloodwyn_PayDay <= Wld_GetDay()-1) && (Npc_HasItems(other, itminugget)>=10) )
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayDay_Info()
{	
	if (Bloodwyn_ProtectionPaid == TRUE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_00"); //�, ��� ���� ������, �������!
		AI_Output (self, other,"Info_Bloodwyn_PayDay_08_01"); //��� ������ ������� �����? �� ������ ������ ������, �������?
		
		Info_ClearChoices	(Info_Bloodwyn_PayDay );
		Info_AddChoice		(Info_Bloodwyn_PayDay,"���, ������. ��� ����� � 10 ������ �� �����.",Info_Bloodwyn_PayDay_PayAgain);
		Info_AddChoice		(Info_Bloodwyn_PayDay,"� �� ���� �������.",Info_Bloodwyn_PayDay_PayNoMore);
	}
	else if (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_00"); //��, ��!
		AI_Output (other, self,"Info_Bloodwyn_PayDay_Den_15_01"); //��� ���?
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_02"); //������ ����� ��������, ��� �� �� ����� ���� ������.
		AI_Output (self, other,"Info_Bloodwyn_PayDay_Den_08_03"); //����� ������ ������ ���� - ��� �������?
	};
	Bloodwyn_PayDay = B_SetDayTolerance();
};

func void Info_Bloodwyn_PayDay_PayAgain()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayAgain_15_00"); //���, ������. ��� ����� � ������ ������ �� �����.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayAgain_08_01"); //� ��� � ����� - �� ������!
	
	Bloodwyn_ProtectionPaid = TRUE;
	Herek_ProtectionBully = FALSE;
	Grim_ProtectionBully = FALSE;
	Npc_SetPermAttitude (self,ATT_FRIENDLY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

func void Info_Bloodwyn_PayDay_PayNoMore()
{
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_00"); //� �� ���� ������� - �� � ��� ������� � ���� ����� ��� ����������.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_01"); //�� ���� �����������. ������ �� �� ������. ��� ����� ������, ����� ����� ���� �� ������ � �� �������.
	AI_Output (other, self,"Info_Bloodwyn_PayDay_PayNoMore_15_02"); //�� ��������, � ���� � ���� ������������.
	AI_Output (self, other,"Info_Bloodwyn_PayDay_PayNoMore_08_03"); //���������...
	
	Bloodwyn_ProtectionPaid = FALSE;
	Herek_ProtectionBully = TRUE;
	Grim_ProtectionBully = TRUE;
	Npc_SetPermAttitude (self,ATT_ANGRY);
	Info_ClearChoices	(Info_Bloodwyn_PayDay );
};

// ************************************************************
// 						DOCH zahlen
// ************************************************************

INSTANCE Info_Bloodwyn_Doch (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 3;
	condition	= Info_Bloodwyn_Doch_Condition;
	information	= Info_Bloodwyn_Doch_Info;
	permanent	= 1;
	description = "� ���������. ��� ������ ������ ����. ";
};                       

FUNC INT Info_Bloodwyn_Doch_Condition()
{
	if (Bloodwyn_ProtectionPaid == FALSE)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_Doch_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_Doch_15_00"); //� ���������. ��� ������ ������ ����. 
	if (Npc_HasItems(other, itminugget)>=10)
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_01"); //��� ��� ������ ����! ������ - �� ������ ��������� ���������� �������.
		AI_Output (self, other,"Info_Bloodwyn_Doch_08_02"); //������ �� ������ ������� ��� ������ ����, ���?
		Bloodwyn_ProtectionPaid = TRUE;
		Herek_ProtectionBully = FALSE;
		Grim_ProtectionBully = FALSE;
		Npc_SetPermAttitude (self,ATT_FRIENDLY);
		Bloodwyn_PayDay = B_SetDayTolerance();
	}
	else
	{
		AI_Output (self, other,"Info_Bloodwyn_Doch_NoOre_08_00"); //�����������, ����� � ���� ����� ��� ���������.
		AI_StopProcessInfos	(self);
	};
};


	

INSTANCE Info_Bloodwyn_PayForJesse (C_INFO)
{
	npc			= GRD_233_Bloodwyn;
	nr			= 5;
	condition	= Info_Bloodwyn_PayForJesse_Condition;
	information	= Info_Bloodwyn_PayForJesse_Info;
	permanent	= 1;
	description = "����� ������ ��������� �� ���� ������ ������ ����.";
};                       

FUNC INT Info_Bloodwyn_PayForJesse_Condition()
{
	if (Jesse_PayForMe == LOG_RUNNING)
	{	
		return 1;
	};
};

FUNC VOID Info_Bloodwyn_PayForJesse_Info()
{	
	AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_00"); //����� ������ ��������� �� ���� ������ ������ ����.
	if  (Bloodwyn_ProtectionPaid == FALSE)
	{
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_01"); //��� �������, ������ �� ������ ��������� ���� ������ ������.
	};
	AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_02"); //������ ��� ������. �� ��������� � ��� ����� ����� �� ��������.
	if (Npc_HasItems(other,itminugget) >= 10)
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_03"); //���, � ������� �� ����. ������ ������ ������ � ������ ��� � �����.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_04"); //�����, ������, ��� ������.
		Jesse_PayForMe = LOG_SUCCESS;
	}
	else
	{
		AI_Output (other, self,"Info_Bloodwyn_PayForJesse_15_05"); //����! �������, � ���� �� ������� ����.
		AI_Output (self, other,"Info_Bloodwyn_PayForJesse_08_06"); //��� ���� �����, ������! ������� ��� ���! ����� ���� ������� ���� �� ����� ������?
	};
};
/*------------------------------------------------------------------------
//							GARDIST GEWORDEN							//
------------------------------------------------------------------------*/
instance GRD_233_Bloodwyn_WELCOME (C_INFO)
{
	npc				= GRD_233_Bloodwyn;
	condition		= GRD_233_Bloodwyn_WELCOME_Condition;
	information		= GRD_233_Bloodwyn_WELCOME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_233_Bloodwyn_WELCOME_Condition()
{	
	
	if (Npc_GetTrueGuild (hero) == GIL_GRD) 
	{
		return TRUE;
	};
};
func void  GRD_233_Bloodwyn_WELCOME_Info()
{
	AI_Output (self, other,"GRD_233_Bloodwyn_WELCOME_Info_08_01"); //������ �� ���� �� ���. ������. ������ ����� ����� �����, ��� ��.
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info DIE
//***************************************************************************
instance Info_Bloodwyn_DIE (C_INFO)
{
	npc			= Grd_233_Bloodwyn;
	condition	= Info_Bloodwyn_DIE_Condition;
	information	= Info_Bloodwyn_DIE_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_Bloodwyn_DIE_Condition()
{	
	if (Kapitel == 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_Bloodwyn_DIE_Info()
{
	AI_GotoNpc			(self,hero);

	if 	(oldHeroGuild == GIL_STT)
	||	(oldHeroGuild == GIL_GRD)
	||	(oldHeroGuild == GIL_KDF)
	{
		if (oldHeroGuild == GIL_GRD)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_01"); //��������� � ����� �����! ����! � �� �������� ���� ����������!
		}
		else if (oldHeroGuild == GIL_KDF)
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_02"); //������, �� ������� ������ �� �������� ����� ����!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_03"); //��� ������ ���� �� ���������!
		};			

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_04"); //������. � ��� �� ��������, �������?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_05"); //�������� � ����� �������, ��?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_06"); //���, ������, �...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_07"); //������. �� �����, ��� ������� ���������� ������� ��� �����.
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_08"); //��� �� ����...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_09"); //��������� ������ �������.
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_10"); //����, ���������!!!

		if	Npc_KnowsInfo(hero, Info_Fletcher_DIE)
		{
			B_LogEntry			(CH4_BannedFromOC,"�������, ���������� �������� ������, ������������ ��� ��, ��� � �������. �� ���� �����, ������, ��, ������ ����, ��� ���-�� ������� � ����� �������� ������� ��� ������ ������.");
		}
		else if	(Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH4_BannedFromOC,	LOG_MISSION);
			Log_SetTopicStatus	(CH4_BannedFromOC,	LOG_RUNNING);
			B_LogEntry			(CH4_BannedFromOC,"�������, ���������� ������ ������ ������� ������, ������ ���� ���������� � ������������. �� �� ����� ������� ���� � ����� �� �����!");
			B_LogEntry			(CH4_BannedFromOC,"������, ���� ������� �� ������� ������!");
		};
	}
	else
	{
		if (C_NpcBelongsToNewCamp(hero))
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_11"); //��� �� ����� �������� ��� �� ������ ������ ������? ��� ���� ����� ����� � ����� �������!
		}
		else
		{
			AI_Output	(self,hero,"Info_Bloodwyn_DIE_08_12"); //�, ��� �� ����� �������� ��� �� ������ ������? ��� ���� ����� ����� � ����� �������!
		};

		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_13"); //���?! ��� �� ������ � ����?
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_14"); //�� ���, �� ������ � ��������� �� �����?
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_15"); //���...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_16"); //������, �� �� �� ����� ��������� ���� ������� �� ���� ������� � ������.
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_17"); //��, � �� ���� �������������...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_18"); //���� ������ �������� �� ���� ������!
		AI_Output		(hero,self,"Info_Bloodwyn_DIE_15_19"); //���, � ���� ��������...
		AI_Output		(self,hero,"Info_Bloodwyn_DIE_08_20"); //� ���� ����! ������ ���!
	};
	
	Npc_ExchangeRoutine	(self,				"FMTaken2");	// Verst�rkung vor das Hinterem Tor (Anf�hrer)
	B_ExchangeRoutine	(GRD_232_Gardist,	"FMTaken2");	// Verst�rkung vor das Hinterem Tor
	B_ExchangeRoutine	(GRD_229_Gardist,	"FMTaken2");	// Verst�rkung vor das Hinterem Tor (Fernk�mpfer)
	B_ExchangeRoutine	(GRD_216_Torwache,	"FMTaken2");	// regul�re Wache am Hinteren Tor
	B_ExchangeRoutine	(GRD_217_Torwache,	"FMTaken2");	// regul�re Wache am Hinteren Tor

	B_SetPermAttitude	(GRD_233_Bloodwyn,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_232_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_229_Gardist,	ATT_HOSTILE);	
	B_SetPermAttitude	(GRD_216_Torwache,	ATT_HOSTILE);
	B_SetPermAttitude	(GRD_217_Torwache,	ATT_HOSTILE);

	
	if	!Npc_KnowsInfo(hero, Info_Fletcher_DIE)
	{
		B_LogEntry		(CH4_Firemages,"������ ������� ������ ������ ������� � ���������� �����������. ��� ������� ������, ��� �������� ������.");
	};
	
	AI_StopProcessInfos	(self);
};

