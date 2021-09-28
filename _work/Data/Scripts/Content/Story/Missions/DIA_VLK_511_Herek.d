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
	AI_Output (self, other,"DIA_Herek_Bully_01_00"); //Zadr�! Sly�el jsem, �e jsi mluvil s Bloodwynem?
	AI_Output (other, self,"DIA_Herek_Bully_15_01"); //Pro�? Co chce�?
	AI_Output (self, other,"DIA_Herek_Bully_01_02"); //To bylo v�n� moudr�, odm�tnout mu zaplatit pen�ze za ochranu!
	AI_Output (self, other,"DIA_Herek_Bully_01_03"); //To znamen�, �e my ostatn� mus�me platit tv�j pod�l!
	AI_Output (self, other,"DIA_Herek_Bully_01_04"); //Postar�m se, aby sis na to p��t� vzpomn�l, a� s n�m bude� zase mluvit...
	
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
	description		= "A jak to jde?";
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
	AI_Output (other, self,"DIA_Herek_Motz_15_00"); //A jak to jde?
	AI_Output (self, other,"DIA_Herek_Motz_01_01"); //V tomhle t�bo�e nen� pro n�s dva dost m�sta!
	AI_Output (other, self,"DIA_Herek_Motz_15_02"); //Pros�m?
	AI_Output (self, other,"DIA_Herek_Motz_01_03"); //Kdyby bylo po m�m, u� bys tu p�kn� dlouho nebyl!
	AI_Output (self, other,"DIA_Herek_Motz_01_04"); //V�, pro� tady jsem? B�hem jedn� noci, jako je tahle, jsem zabil tucet lid�... hehehe!
	
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
	description		= "Tak�e si mysl�, �e jsi jeden z t�ch divokejch chlap�k�, ne? Pro� to teda nezkus� se mnou...";
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
	AI_Output (other, self,"DIA_Herek_Anlegen_15_00"); //Tak�e si mysl�, �e jsi jeden z t�ch divokejch chlap�k�, ne? Pro� to teda nezkus� na mn�...
	AI_Output (self, other,"DIA_Herek_Anlegen_01_01"); //Chce� dostat nakl�da�ku? Dob�e, jestli to opravdu chce�!
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};


