// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Kyle_Exit (C_INFO)
{
	npc			= Vlk_536_Kyle;
	nr			= 999;
	condition	= DIA_Kyle_Exit_Condition;
	information	= DIA_Kyle_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kyle_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self,120);	//wegen AUTO-Ansprechen
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Kyle_HutRage (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_HutRage_Condition;
	information		= DIA_Kyle_HutRage_Info;
	permanent		= 1;
	important		= 1;
};

FUNC INT DIA_Kyle_HutRage_Condition()
{	
	if ( (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Kyle_HutRage_Info()
{
	AI_Output (self, other,"DIA_Kyle_HutRage_10_00"); //Quante volte vi ho detto di non correre nella mia capanna!
};

// **************************************************
// 				Was ist dein Problem?
// **************************************************

INSTANCE DIA_Kyle_Problem (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_Problem_Condition;
	information		= DIA_Kyle_Problem_Info;
	permanent		= 1;
	description		= "Qual è il problema?";
};

FUNC INT DIA_Kyle_Problem_Condition()
{	
	return 1;	
};

FUNC VOID DIA_Kyle_Problem_Info()
{
	AI_Output (other, self,"DIA_Kyle_Problem_15_00"); //Qual è il problema?
	AI_Output (self, other,"DIA_Kyle_Problem_10_01"); //Lasciami in pace! Chiunque è un problema per ME!
	AI_Output (self, other,"DIA_Kyle_Problem_10_02"); //È iniziato tutto quando ho costruito la mia capanna.
	AI_Output (self, other,"DIA_Kyle_Problem_10_03"); //Non costruire vicino al fosso', mi avvisavano.
	AI_Output (self, other,"DIA_Kyle_Problem_10_04"); //Ma nessuno di quei bastardi mi ha detto cosa sarebbe successo se l'avessi fatto!
	AI_Output (self, other,"DIA_Kyle_Problem_10_05"); //Quando sono tornato dalla miniera, alcuni giorni fa, avevo una seconda porta!
	AI_Output (self, other,"DIA_Kyle_Problem_10_06"); //Quei maiali! Li odio. Non riesco neppure a dire quanto li odio.
	AI_Output (self, other,"DIA_Kyle_Problem_10_07"); //Non tutti corrono attraverso la mia capanna. Solo gli idioti.
};

	
	
	
	
	


















