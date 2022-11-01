// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Herek_Exit (C_INFO)
{
	npc			= Vlk_511_Herek;
	nr			= 999;
	condition	= DIA_Herek_Exit_Condition;
	information	= DIA_Herek_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Herek_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Herek_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Herek_Bully (C_INFO)
{
	npc				= Vlk_511_Herek;
	nr				= 2;
	condition		= DIA_Herek_Bully_Condition;
	information		= DIA_Herek_Bully_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Herek_Bully_Condition()
{	
	if ( (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Herek_Bully_Info()
{
	AI_Output (self, other,"DIA_Herek_Bully_01_00"); //Zaczekaj! Słyszałem, że gadałeś z Bloodwynem?
	AI_Output (other, self,"DIA_Herek_Bully_15_01"); //A co? Czego chcesz?
	AI_Output (self, other,"DIA_Herek_Bully_01_02"); //Niezły z ciebie gość! Niewielu ma tyle odwagi, żeby mu podskoczyć!
	AI_Output (self, other,"DIA_Herek_Bully_01_03"); //A to oznacza, że teraz my wszyscy będziemy musieli płacić twoją dolę.
	AI_Output (self, other,"DIA_Herek_Bully_01_04"); //Postaram się, żebyś o tym pamiętał, gdy Bloodwyn znów poprosi cię o datek.
	
	Npc_SetPermAttitude (self,ATT_ANGRY);
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};

// **************************************************
// 					Motz
// **************************************************

INSTANCE DIA_Herek_Motz (C_INFO)
{
	npc				= Vlk_511_Herek;
	nr				= 2;
	condition		= DIA_Herek_Motz_Condition;
	information		= DIA_Herek_Motz_Info;
	permanent		= 0;
	description		= "Co słychać?";
};

FUNC INT DIA_Herek_Motz_Condition()
{	
	if (Herek_ProtectionBully==FALSE)
	{
		return 1;
	};
};

FUNC VOID DIA_Herek_Motz_Info()
{
	AI_Output (other, self,"DIA_Herek_Motz_15_00"); //Co słychać?
	AI_Output (self, other,"DIA_Herek_Motz_01_01"); //W tym obozie jest miejsce tylko dla jednego z nas!
	AI_Output (other, self,"DIA_Herek_Motz_15_02"); //Co proszę?
	AI_Output (self, other,"DIA_Herek_Motz_01_03"); //Gdyby to zależało ode mnie, dawno już byś nie żył!
	AI_Output (self, other,"DIA_Herek_Motz_01_04"); //Wiesz dlaczego tu trafiłem? Zabiłem dwunastu ludzi jednej nocy, ot - tak sobie... Hi hi hi!
	
	Npc_SetPermAttitude (self,ATT_ANGRY);
		
	AI_StopProcessInfos	(self);
};

// **************************************************
// 					Anlegen!
// **************************************************

INSTANCE DIA_Herek_Anlegen (C_INFO)
{
	npc				= Vlk_511_Herek;
	nr				= 2;
	condition		= DIA_Herek_Anlegen_Condition;
	information		= DIA_Herek_Anlegen_Info;
	permanent		= 1;
	description		= "Myślisz, że taki twardziel z ciebie? Może spróbujesz szczęścia ze mną?!";
};

FUNC INT DIA_Herek_Anlegen_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Motz)) || (Npc_KnowsInfo(hero,DIA_Herek_Bully)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Herek_Anlegen_Info()
{
	AI_Output (other, self,"DIA_Herek_Anlegen_15_00"); //Myślisz, że taki twardziel z ciebie? Może spróbujesz szczęścia ze mną?!
	AI_Output (self, other,"DIA_Herek_Anlegen_01_01"); //Chcesz dostać w czapę? Cóż, nasz klient - nasz pan!
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};


