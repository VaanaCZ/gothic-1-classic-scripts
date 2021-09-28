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
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_02"); //È nostro prigioniero. È fortunato che la ruota dentata della schiacciatrice sia rotta. È l'unico motivo per cui questo figlio di puttana è in pausa.
	AI_Output (self, other,"Grd_277_Gardist_SITTINGORK_Info_06_03"); //Appena avremo riparato la schiacciatrice, tornerà al lavoro. Non è qui per poltrire tutto il giorno!
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
	description		= "La schiacciatrice è già stata riparata."; 
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
	AI_Output (other, self,"Grd_277_Gardist_WORKINGORK_Info_15_01"); //La schiacciatrice è già stata riparata.
	AI_Output (self, other,"Grd_277_Gardist_WORKINGORK_Info_06_02"); //Siamo veloci, quando si tratta di far lavorare la gente.
};  
