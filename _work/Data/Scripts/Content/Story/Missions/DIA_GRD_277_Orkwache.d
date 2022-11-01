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
	description		= "Co je s tím skřetem?"; 
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
	AI_Output (other, self,"Grd_277_Gardist_SITTINGORK_Info_15_01"); //Co je s tím skřetem?
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_02"); //Je to náš vězeň. Má štěstí, že ozubené kolo drtičky je rozbité. Proto si ten čubčí syn může dopřávat přestávku.
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_03"); //Jakmile bude drtička opravená, bude zas pro něj práce. Není tu od toho, aby tu celou dobu otálel!
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
	description		= "Myslím, že drtička je už opravená."; 
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
	AI_Output (other, self,"Grd_277_Gardist_WORKINGORK_Info_15_01"); //Myslím, že drtička je už opravená.
	AI_Output (self, other,"Grd_277_Gardist_WORKINGORK_Info_06_02"); //Jistě, když mají lidi pracovat, tak jsme rychlí.
};  
