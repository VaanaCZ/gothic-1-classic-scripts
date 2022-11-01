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
	AI_Output (self, other,"DIA_Kyle_HutRage_10_00"); //Kolikrát vám budu, vy bastardi, muset opakovat, abyste neprocházeli mojí chatrčí?
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
	description		= "Co máš za problém?";
};

FUNC INT DIA_Kyle_Problem_Condition()
{	
	return 1;	
};

FUNC VOID DIA_Kyle_Problem_Info()
{
	AI_Output (other, self,"DIA_Kyle_Problem_15_00"); //Co máš za problém?
	AI_Output (self, other,"DIA_Kyle_Problem_10_01"); //Nech mě na pokoji, člověče! Každý má tady problémy se MNOU!
	AI_Output (self, other,"DIA_Kyle_Problem_10_02"); //Všechno začalo v okamžiku, když jsem stavěl tuhle chatrč.
	AI_Output (self, other,"DIA_Kyle_Problem_10_03"); //Říkali: nestav tu chatrč tak blízko strouhy.
	AI_Output (self, other,"DIA_Kyle_Problem_10_04"); //Nikdo z těch bastardů mi ale neřekl, co se stane, když to udělám.
	AI_Output (self, other,"DIA_Kyle_Problem_10_05"); //Když jsem se za pár dní vrátil z dolu, byly tam druhé dveře.
	AI_Output (self, other,"DIA_Kyle_Problem_10_06"); //Ty hajzlové! Nenávidím je! Ani nedokážu říci, jak strašně je nenávidím!
	AI_Output (self, other,"DIA_Kyle_Problem_10_07"); //Teď  každý prochází mojí chatrčí. Každý idiot.
};

	
	
	
	
	


















