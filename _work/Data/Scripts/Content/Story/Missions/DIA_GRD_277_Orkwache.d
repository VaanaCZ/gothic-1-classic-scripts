/*------------------------------------------------------------------------
							Sitzender Ork									
------------------------------------------------------------------------*/

instance  Grd_277_Gardist_SITTINGORK (C_INFO)
{
	npc				= Grd_277_Gardist;
	condition		= Grd_277_Gardist_SITTINGORK_Condition;
	information		= Grd_277_Gardist_SITTINGORK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co to za Ork?"; 
};

FUNC int  Grd_277_Gardist_SITTINGORK_Condition()
{	
	if (Ian_gearwheel != LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Grd_277_Gardist_SITTINGORK_Info()
{
	AI_Output (other, self,"Grd_277_Gardist_SITTINGORK_Info_15_01"); //Co to za Ork?
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_02"); //To nasz jeniec. Ma sukinsyn szcz�cie, �e p�k�o ko�o z�bate w m�ocarni. Dlatego mo�e sobie troch� odpocz��.
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_03"); //Ale jak tylko naprawimy m�ocarni�, sko�cz� si� �ajdakowi wakacje!
};  
/*------------------------------------------------------------------------
							WORKINGORK							
------------------------------------------------------------------------*/

instance  Grd_277_Gardist_WORKINGORK (C_INFO)
{
	npc				= Grd_277_Gardist;
	condition		= Grd_277_Gardist_WORKINGORK_Condition;
	information		= Grd_277_Gardist_WORKINGORK_Info;
	important		= 0;
	permanent		= 0;
	description		= "Widz�, �e rozdrabniacz zosta� ju� naprawiony."; 
};

FUNC int  Grd_277_Gardist_WORKINGORK_Condition()
{	
	if (Ian_gearwheel == LOG_SUCCESS)
	{
		return TRUE;
	};

};
FUNC void  Grd_277_Gardist_WORKINGORK_Info()
{
	AI_Output (other, self,"Grd_277_Gardist_WORKINGORK_Info_15_01"); //Widz�, �e m�ocarnia jest ju� sprawna.
	AI_Output (self, other,"Grd_277_Gardist_WORKINGORK_Info_06_02"); //Tak, staramy si�, �eby ludzie nie narzekali tutaj na brak zaj�cia.
};  
