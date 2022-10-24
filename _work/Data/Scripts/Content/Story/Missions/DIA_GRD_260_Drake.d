// ************************	EXIT **************************

instance  Grd_260_Drake_Exit (C_INFO) //E1
{
	npc			=  Grd_260_Drake;
	nr			=  999;
	condition	=  Grd_260_Drake_Exit_Condition;
	information	=  Grd_260_Drake_Exit_Info;
	important	=  0;
	permanent	=  1;
	description	= DIALOG_ENDE;
};

FUNC int  Grd_260_Drake_Exit_Condition()
{
	return 1;
};

FUNC VOID  Grd_260_Drake_Exit_Info()
{
	AI_Output			(other,	self,"Info_Exit_Info_15_01"); //�� �������!
	AI_StopProcessInfos	( self );
};
/**************** GEFAHREN *********************/

INSTANCE  Grd_260_Drake_Gefahr (C_INFO)	//E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Gefahr_Condition;
	information		= Grd_260_Drake_Gefahr_Info;
	important		= 0;
	permanent		= 0;
	description		= "�������� ���, ���� ����� ������� ������������.";
};

FUNC INT  Grd_260_Drake_Gefahr_Condition()
{
		return (Npc_KnowsInfo (hero,Grd_260_Drake_Mine));
};

func VOID  Grd_260_Drake_Gefahr_Info()
{

	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_01");//�������� ���, ���� ����� ������� ������������.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_02");//������� ��������� ������������ �������. 
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_03");//��-�� ��� �� ��������� ���� �������� ��������� ������. ��� ���� ����� ���������� ���������.
	AI_Output			(other,self,"Grd_260_Drake_Gefahr_Info_15_04");//�������� ��� � ��������.
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_05");//� ���� � ����� ������ ���������...
	AI_Output			(self,other,"Grd_260_Drake_Gefahr_Info_11_06");//���� �� ��������� ��� ����, � �������� ���� � ���.


};
/**************** CRAWLER, MEHR	GEFAHREN INFOS *********************/

INSTANCE  Grd_260_Drake_Crawler_Okay (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Crawler_Okay_Condition;
	information		= Grd_260_Drake_Crawler_Okay_Info;
	important		= 0;
	permanent		= 0;
	description		= "(���������� ����)";
};

FUNC INT  Grd_260_Drake_Crawler_Okay_Condition()
{
	if (Npc_KnowsInfo (hero,Grd_260_Drake_Gefahr))
	{
			return 1;
	};
};
FUNC void Grd_260_Drake_Crawler_Okay_Info()
{
	if	( Npc_HasItems (hero,ItFobeer) )
	{
		AI_Output			(hero,self,"Grd_260_Drake_Crawler_Okay_15_01");//���, ����� ��� �� ��� ��������!

		B_GiveInvItems		(hero, self, ItFoBeer, 1);
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem			(self,ItFobeer);

		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_02");//�������. ������� ����� �������� ������ � ������ ����������� ������.
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_03");//� �������� ������ ��� ��� �� �� ���� �� ��������. ���� �� ���������� �� �������, ���� �� ���� ��� ����� ������!
		AI_Output			(self,hero,"Grd_260_Drake_Crawler_Okay_11_04");//��� ����� ������ � �����. �����, ����� ����, ���� ������� ��������.

		//Grd_260_Drake_Crawler_Okay.permanent = 0;
	}
	else
	{
		AI_Output			(self,other,"Grd_260_Drake_Crawler_Okay_11_06");//�� ������, ��? �������, ����� � ���� ����� ����.
   		Grd_260_Drake_Crawler_Okay.permanent = 1;
   };
};
// ***************** DIE MINE *****************************

instance  Grd_260_Drake_Mine (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Condition;
	information		= Grd_260_Drake_Mine_Info;
	important		= 0;
	permanent		= 0;
	description		= "�� ������ ���������� ��� ���-������ � �����?";
};

FUNC int  Grd_260_Drake_Mine_Condition()
{
	return 1;
};
func void Grd_260_Drake_Mine_Info ()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Info_15_01");//�� ������ ���������� ��� ���-������ � �����?
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_02");//�� ��������� � ������� ������. ���� ����� ���������� � ������� ������� ���������.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_03");//�������� �������� �����. �� ���� ���������, ����� ����� ����� ��������.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Info_11_04");//�� ������ ��������� ����� ���������. �� ���� ������ ��������� ����� ���������� ����.


};
// ***************** MEHR MINE *****************************
instance  Grd_260_Drake_Mine_Mehr (C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Mine_Mehr_Condition;
	information		= Grd_260_Drake_Mine_Mehr_Info;
	important		= 0;
	permanent		= 0;
	description		= "�������� �� ���� ���-������ ���.";
};

FUNC int  Grd_260_Drake_Mine_Mehr_Condition()
{
	if ( Npc_KnowsInfo (hero, Grd_260_Drake_Mine) )
	{
		return 1;
	};
};
func void  Grd_260_Drake_Mine_Mehr_Info	()
{
	AI_Output			(other,self,"Grd_260_Drake_Mine_Mehr_Info_15_01");//�������� �� ���� ���-������ ���.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_02");//� �����, ������ ������ ���������� ���� ������. ������ ���. �� ��� ����������.
	AI_Output			(self,other,"Grd_260_Drake_Mine_Mehr_Info_11_03");//��� �������� � ����. �� ��������� ����� ������ �����. 
	
};

// ***************** IAN *****************************
instance  Grd_260_Drake_Ian	(C_INFO) //E1
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_Ian_Condition;
	information		= Grd_260_Drake_Ian_Info;
	important		= 0;
	permanent		= 0;
	description		= "��� ��� ����� ���?";
};

FUNC int  Grd_260_Drake_Ian_Condition()
{
	if !(Npc_KnowsInfo (hero,STT_301_IAN_HI)) && ( Npc_KnowsInfo (hero,	Grd_260_Drake_Mine_Mehr))
	{
		return TRUE;
	};

};
FUNC void  Grd_260_Drake_Ian_Info()
{
	AI_Output			(other,self,"Grd_260_Drake_Ian_Info_15_01");//��� ��� ����� ���?
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_02");//�� ��������� � ������ �������� ������, ����� ������.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_03");//��, �� ������ ������? ������ ����� � ���!
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_04");//� ����� ��������� ������ ���� �������, � ��� ��. �� � ��� �������.
	AI_Output			(self,other,"Grd_260_Drake_Ian_Info_11_05");//���� �� ���������� � ���, ������, ��� �� ���������� �� ����� � �����, �����?
};	 

/*------------------------------------------------------------------------
//						GARDEAUFNAHME								//
------------------------------------------------------------------------*/
instance Grd_260_Drake_GARDEAUFNAHME (C_INFO)
{
	npc				= Grd_260_Drake;
	condition		= Grd_260_Drake_GARDEAUFNAHME_Condition;
	information		= Grd_260_Drake_GARDEAUFNAHME_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Grd_260_Drake_GARDEAUFNAHME_Condition()
{	
	if (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) 
	&& ( Npc_GetTrueGuild  (hero) == GIL_STT)
	&& (! Npc_KnowsInfo   (hero,Grd_264_Gardist_GARDEAUFNAHME))
	{
		return TRUE;
	};
};
func void  Grd_260_Drake_GARDEAUFNAHME_Info()
{
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_01"); //��! �� ������� ����������� � ���������! �����, ������ �� ������������ ��������� ���������.
	AI_Output (self, other,"Grd_260_Drake_GARDEAUFNAHME_Info_11_02"); //��� � ������ ������ � �������� � �������!

	Log_CreateTopic (GE_BecomeGuard,LOG_NOTE);
	B_LogEntry (GE_BecomeGuard,"����� � ������� ����, � ������ ���� ���������� � �������. ����� ����, �� ������ ���� � ���������.");
};

