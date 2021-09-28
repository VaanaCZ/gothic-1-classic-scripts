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
	description		= "�Qu� pasa con ese orco?"; 
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
	AI_Output (other, self,"Grd_277_Gardist_SITTINGORK_Info_15_01"); //�Qu� pasa con ese orco?
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_02"); //Es nuestro prisionero. Tiene suerte de que la rueda de la trituradora se haya roto. Por eso este hijo de perra puede descansar un poco.
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_03"); //En cuanto la trituradora est� reparada, volver� al trabajo. �No est� aqu� para vaguear todo el rato!
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
	description		= "Veo que la trituradora ya est� arreglada."; 
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
	AI_Output (other, self,"Grd_277_Gardist_WORKINGORK_Info_15_01"); //Veo que la trituradora ya est� arreglada.
	AI_Output (self, other,"Grd_277_Gardist_WORKINGORK_Info_06_02"); //S�, somos r�pidos a la hora de hacer que la gente trabaje.
};  
