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
	AI_Output (self, other,"DIA_Herek_Bully_01_00"); //Attends ! J'ai entendu que tu avais parlé à Bloodwyn ?
	AI_Output (other, self,"DIA_Herek_Bully_15_01"); //Pourquoi ? Que veux-tu ?
	AI_Output (self, other,"DIA_Herek_Bully_01_02"); //C'était vraiment bien de ta part de refuser de lui payer l'argent de la protection !
	AI_Output (self, other,"DIA_Herek_Bully_01_03"); //Cela signifie que nous allons tous être obligé de payer ta part !
	AI_Output (self, other,"DIA_Herek_Bully_01_04"); //Je veux m'assurer que tu t'en souviendras la fois prochaine qu'il t'en parle.
	
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
	description		= "Et, comment vont les choses ?";
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
	AI_Output (other, self,"DIA_Herek_Motz_15_00"); //Et, comment vont les choses ?
	AI_Output (self, other,"DIA_Herek_Motz_01_01"); //Il n'y a pas assez de place dans ce camp pour nous deux !
	AI_Output (other, self,"DIA_Herek_Motz_15_02"); //Pardon ?
	AI_Output (self, other,"DIA_Herek_Motz_01_03"); //Si ça ne tenait qu'à moi, tu ne ferais pas de vieux os ici !
	AI_Output (self, other,"DIA_Herek_Motz_01_04"); //Tu sais pourquoi je suis ici ? J'ai tué des douzaine personnes en une nuit, juste comme ça... Hé hé hé !
	
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
	description		= "Donc tu penses être un des garçons sauvages, n'est-ce pas ? Essaye avec moi...";
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
	AI_Output (other, self,"DIA_Herek_Anlegen_15_00"); //Alors tu t'imagines que tu es l'un de ces garçons sauvages, hein ? Pourquoi tu n'essayes pas avec moi...
	AI_Output (self, other,"DIA_Herek_Anlegen_01_01"); //Tu veux être mis en pièces ? Bien, si c'est ce que tu veux ! !
	
	AI_StopProcessInfos	(self);
	
	Npc_SetTarget(self,other);
	AI_StartState(self,ZS_ATTACK,1,"");
};


