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
	AI_Output (self, other,"DIA_Herek_Bully_01_00"); //Zaczekaj! S³ysza³em, ¿e gada³eœ z Bloodwynem?
	AI_Output (other, self,"DIA_Herek_Bully_15_01"); //A co? Czego chcesz?
	AI_Output (self, other,"DIA_Herek_Bully_01_02"); //Niez³y z ciebie goœæ! Niewielu ma tyle odwagi, ¿eby mu podskoczyæ!
	AI_Output (self, other,"DIA_Herek_Bully_01_03"); //A to oznacza, ¿e teraz my wszyscy bêdziemy musieli p³aciæ twoj¹ dolê.
	AI_Output (self, other,"DIA_Herek_Bully_01_04"); //Postaram siê, ¿ebyœ o tym pamiêta³, gdy Bloodwyn znów poprosi ciê o datek.
	
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
	description		= "Co s³ychaæ?";
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
	AI_Output (other, self,"DIA_Herek_Motz_15_00"); //Co s³ychaæ?
	AI_Output (self, other,"DIA_Herek_Motz_01_01"); //W tym obozie jest miejsce tylko dla jednego z nas!
	AI_Output (other, self,"DIA_Herek_Motz_15_02"); //Co proszê?
	AI_Output (self, other,"DIA_Herek_Motz_01_03"); //Gdyby to zale¿a³o ode mnie, dawno ju¿ byœ nie ¿y³!
	AI_Output (self, other,"DIA_Herek_Motz_01_04"); //Wiesz dlaczego tu trafi³em? Zabi³em dwunastu ludzi jednej nocy, ot - tak sobie... Hi hi hi!
	
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
	description		= "Myœlisz, ¿e taki twardziel z ciebie? Mo¿e spróbujesz szczêœcia ze mn¹?!";
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
	AI_Output (other, self,"DIA_Herek_Anlegen_15_00"); //Myœlisz, ¿e taki twardziel z ciebie? Mo¿e spróbujesz szczêœcia ze mn¹?!
	AI_Output (self, other,"DIA_Herek_Anlegen_01_01"); //Chcesz dostaæ w czapê? Có¿, nasz klient - nasz pan!
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};


