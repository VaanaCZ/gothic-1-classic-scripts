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
	AI_Output (self, other,"DIA_Herek_Bully_01_00"); //Zadrž! Slyšel jsem, že jsi mluvil s Bloodwynem?
	AI_Output (other, self,"DIA_Herek_Bully_15_01"); //Proè? Co chceš?
	AI_Output (self, other,"DIA_Herek_Bully_01_02"); //To bylo vážnì moudré, odmítnout mu zaplatit peníze za ochranu!
	AI_Output (self, other,"DIA_Herek_Bully_01_03"); //To znamená, že my ostatní musíme platit tvùj podíl!
	AI_Output (self, other,"DIA_Herek_Bully_01_04"); //Postarám se, aby sis na to pøíštì vzpomnìl, až s ním budeš zase mluvit...
	
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
	AI_Output (self, other,"DIA_Herek_Motz_01_01"); //V tomhle táboøe není pro nás dva dost místa!
	AI_Output (other, self,"DIA_Herek_Motz_15_02"); //Prosím?
	AI_Output (self, other,"DIA_Herek_Motz_01_03"); //Kdyby bylo po mém, už bys tu pìknì dlouho nebyl!
	AI_Output (self, other,"DIA_Herek_Motz_01_04"); //Víš, proè tady jsem? Bìhem jedné noci, jako je tahle, jsem zabil tucet lidí... hehehe!
	
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
	description		= "Takže si myslíš, že jsi jeden z tìch divokejch chlapíkù, ne? Proè to teda nezkusíš se mnou...";
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
	AI_Output (other, self,"DIA_Herek_Anlegen_15_00"); //Takže si myslíš, že jsi jeden z tìch divokejch chlapíkù, ne? Proè to teda nezkusíš na mnì...
	AI_Output (self, other,"DIA_Herek_Anlegen_01_01"); //Chceš dostat nakládaèku? Dobøe, jestli to opravdu chceš!
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};


