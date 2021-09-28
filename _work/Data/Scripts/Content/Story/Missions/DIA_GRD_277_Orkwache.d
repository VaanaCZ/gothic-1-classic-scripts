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
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_02"); //To nasz jeniec. Ma sukinsyn szczêœcie, ¿e pêk³o ko³o zêbate w m³ocarni. Dlatego mo¿e sobie trochê odpocz¹æ.
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_03"); //Ale jak tylko naprawimy m³ocarniê, skoñcz¹ siê ³ajdakowi wakacje!
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
	description		= "Widzê, ¿e rozdrabniacz zosta³ ju¿ naprawiony."; 
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
	AI_Output (other, self,"Grd_277_Gardist_WORKINGORK_Info_15_01"); //Widzê, ¿e m³ocarnia jest ju¿ sprawna.
	AI_Output (self, other,"Grd_277_Gardist_WORKINGORK_Info_06_02"); //Tak, staramy siê, ¿eby ludzie nie narzekali tutaj na brak zajêcia.
};  
