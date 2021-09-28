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
	description		= "Co je s t�m sk�etem?"; 
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
	AI_Output (other, self,"Grd_277_Gardist_SITTINGORK_Info_15_01"); //Co je s t�m sk�etem?
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_02"); //Je to n� v�ze�. M� �t�st�, �e ozuben� kolo drti�ky je rozbit�. Proto si ten �ub�� syn m��e dop��vat p�est�vku.
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_03"); //Jakmile bude drti�ka opraven�, bude zas pro n�j pr�ce. Nen� tu od toho, aby tu celou dobu ot�lel!
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
	description		= "Mysl�m, �e drti�ka je u� opraven�."; 
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
	AI_Output (other, self,"Grd_277_Gardist_WORKINGORK_Info_15_01"); //Mysl�m, �e drti�ka je u� opraven�.
	AI_Output (self, other,"Grd_277_Gardist_WORKINGORK_Info_06_02"); //Jist�, kdy� maj� lidi pracovat, tak jsme rychl�.
};  
