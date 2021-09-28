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
	description		= "Cosa ha fatto quell'orco?"; 
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
	AI_Output (other, self,"Grd_277_Gardist_SITTINGORK_Info_15_01"); //Cosa ha fatto quell'orco?
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_02"); //� nostro prigioniero. � fortunato che la ruota dentata della schiacciatrice sia rotta. � l'unico motivo per cui questo figlio di puttana � in pausa.
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_03"); //Appena avremo riparato la schiacciatrice, torner� al lavoro. Non � qui per poltrire tutto il giorno!
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
	description		= "La schiacciatrice � gi� stata riparata."; 
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
	AI_Output (other, self,"Grd_277_Gardist_WORKINGORK_Info_15_01"); //La schiacciatrice � gi� stata riparata.
	AI_Output (self, other,"Grd_277_Gardist_WORKINGORK_Info_06_02"); //Siamo veloci, quando si tratta di far lavorare la gente.
};  
