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
	description		= "Что с этим орком?"; 
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
	AI_Output (other, self,"Grd_277_Gardist_SITTINGORK_Info_15_01"); //Что с этим орком?
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_02"); //Он наш пленник. Ему еще повезло, что сломалась шестеренка у пресса. Только поэтому этот гаденыш сейчас отдыхает.
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_03"); //Как только пресс починят, он вновь будет работать. Хватит уже бездельничать!
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
	description		= "По-моему, пресс уже починили."; 
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
	AI_Output (other, self,"Grd_277_Gardist_WORKINGORK_Info_15_01"); //По-моему, пресс уже починили.
	AI_Output (self, other,"Grd_277_Gardist_WORKINGORK_Info_06_02"); //Да, когда нужно заставить кого-нибудь работать, мы делаем это быстро.
};  
