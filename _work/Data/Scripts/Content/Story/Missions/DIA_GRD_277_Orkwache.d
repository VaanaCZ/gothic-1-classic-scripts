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
	description		= "Que se passe t'il avec cet Orc ?"; 
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
	AI_Output (other, self,"Grd_277_Gardist_SITTINGORK_Info_15_01"); //Que se passe t'il avec cet Orc ?
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_02"); //C'est notre prisonnier. Il a de la chance que l'engrenage du broyeur se soit cassé. C'est pourquoi on permet à ce fils de chienne de souffler un peu.
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_03"); //Aussitôt que le broyeur sera réparé, il sera temps pour lui de se remettre au travail. Il n'est pas ici pour se la couler douce à longueur de journée !
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
	description		= "Je vois que le broyeur est déjà réparé."; 
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
	AI_Output (other, self,"Grd_277_Gardist_WORKINGORK_Info_15_01"); //Je vois que le broyeur est déjà réparé.
	AI_Output (self, other,"Grd_277_Gardist_WORKINGORK_Info_06_02"); //Ouais, ça va plus vite quand il vient faire travailler les gens.
};  
