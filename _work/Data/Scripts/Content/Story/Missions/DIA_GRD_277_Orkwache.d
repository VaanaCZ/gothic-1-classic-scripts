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
	description		= "Co je s tím skøetem?"; 
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
	AI_Output (other, self,"Grd_277_Gardist_SITTINGORK_Info_15_01"); //Co je s tím skøetem?
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_02"); //Je to náš vìzeò. Má štìstí, že ozubené kolo drtièky je rozbité. Proto si ten èubèí syn mùže dopøávat pøestávku.
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_03"); //Jakmile bude drtièka opravená, bude zas pro nìj práce. Není tu od toho, aby tu celou dobu otálel!
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
	description		= "Myslím, že drtièka je už opravená."; 
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
	AI_Output (other, self,"Grd_277_Gardist_WORKINGORK_Info_15_01"); //Myslím, že drtièka je už opravená.
	AI_Output (self, other,"Grd_277_Gardist_WORKINGORK_Info_06_02"); //Jistì, když mají lidi pracovat, tak jsme rychlí.
};  
