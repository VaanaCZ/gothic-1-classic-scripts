// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Jacko_EXIT(C_INFO)
{
	npc			= ORG_862_Jacko;
	nr			= 999;
	condition		= Info_Jacko_EXIT_Condition;
	information	= Info_Jacko_EXIT_Info;
	permanent	= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_Jacko_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Jacko_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//******************************************************************
//							Raus hier!				
//******************************************************************

instance  ORG_862_Jacko_GoAway (C_INFO)
{
	npc				= ORG_862_Jacko;
	nr 				= 1;
	condition		= ORG_862_Jacko_GoAway_Condition;
	information		= ORG_862_Jacko_GoAway_Info;
	permanent		= 1;
	important		= 1;
};

FUNC int  ORG_862_Jacko_GoAway_Condition()
{	
	if	(Npc_GetDistToWP(hero,"LOCATION_23_CAVE_1_IN")<500)
	&&	(Kalom_DrugMonopol != LOG_RUNNING)
	&&	(Kalom_DrugMonopol != LOG_SUCCESS)
	{
		return TRUE;
	};
};

FUNC void  ORG_862_Jacko_GoAway_Info()
{
	AI_Output			(self, other,"ORG_862_Jacko_GoAway_Info_06_00"); //Que diable fait-tu ici ?
	AI_StopProcessInfos	(self);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_ATTACK,1,"");
}; 

//******************************************************************
//							Weg mit den Jungs				
//******************************************************************

instance  ORG_862_Jacko_GUARD (C_INFO)
{
	npc				= ORG_862_Jacko;
	nr 				= 1;
	condition		= ORG_862_Jacko_GUARD_Condition;
	information		= ORG_862_Jacko_GUARD_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int  ORG_862_Jacko_GUARD_Condition()
{	
	if	(Kalom_DrugMonopol == LOG_RUNNING)
	{
		return TRUE;
	};
};

FUNC void  ORG_862_Jacko_GUARD_Info()
{
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_Info_06_00"); //Perdu, n'est-ce pas ?
	AI_Output			(other, self,"ORG_862_Jacko_GUARD_Info_15_01"); //Cor Kalom connaît ton petit commerce.
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_Info_06_02"); //Quoi ? Pourquoi es-tu ici ?
	
	B_LogEntry			(CH1_DrugMonopol,"J'ai trouvé le secret de la production d'Herbe. Jacko et deux autres brigands produisent des tiges d'Herbe.");

	Info_Clearchoices	(ORG_862_Jacko_GUARD);
	Info_Addchoice		(ORG_862_Jacko_GUARD,"Je dois t'avertir. Cor Kalom a envoyé cinq templiers pour t'exterminer.",ORG_862_Jacko_GUARD_Templer);
	Info_Addchoice		(ORG_862_Jacko_GUARD,"Je veux savoir ce que cette information vaut pour toi.",ORG_862_Jacko_GUARD_InfoWert);
	Info_Addchoice		(ORG_862_Jacko_GUARD,"Mettre fin à l'affaire ici !",ORG_862_Jacko_GUARD_Angriff);
};  

func void ORG_862_Jacko_GUARD_Templer()
{
	AI_Output			(other, self,"ORG_862_Jacko_GUARD_Templer_Info_15_00"); //Je suis ici pour t'avertir. Cor Kalom a envoyé cinq templiers pour te tuer.
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_Templer_Info_06_01"); //Quoi? Tu ne peux pas être sérieux !
	AI_Output			(other, self,"ORG_862_Jacko_GUARD_Templer_Info_15_02"); //Ils devraient arriver ici dans quelques minutes.
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_Templer_Info_06_03"); //Zut ! Nous devons partir !

	Info_Clearchoices	(ORG_862_Jacko_GUARD);

	B_LogEntry			(CH1_DrugMonopol,"Un petit tour avec des templiers qui n'existent même pas, a fait déguerpir les mauviettes. Ce problème a l'air d'être résolu maintenant.");
	B_GiveXP			(XP_JackoRetired);

	Npc_ExchangeRoutine (self,				"ARBEITSLOS");
	B_ExchangeRoutine	(ORG_861_Killian,	"ARBEITSLOS");
	B_ExchangeRoutine	(ORG_860_Renyu,		"ARBEITSLOS");

	Stooges_Fled = TRUE;

	AI_StopProcessInfos	(self);
};

func void ORG_862_Jacko_GUARD_InfoWert()
{
	AI_Output			(other, self,"ORG_862_Jacko_GUARD_InfoWert_Info_15_00"); //Je veux savoir ce que cette information vaut pour toi.
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_01"); //Ah, c'est ce que tu veux... Bien. Tu me grattes le dos et je gratterai le tien. Voilà, c'est tout le minerai que j'ai sur moi.
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_02"); //Nous devons y aller ! Et tu ferais mieux de disparaître aussi.

	B_GiveInvItems		(self, other,itminugget,95);

	Npc_ExchangeRoutine (self,				"ARBEITSLOS");
	B_ExchangeRoutine	(ORG_861_Killian,	"ARBEITSLOS");
	B_ExchangeRoutine	(ORG_860_Renyu,		"ARBEITSLOS");

	Stooges_Fled = TRUE;
	B_LogEntry			(CH1_DrugMonopol,"Par un entretien intelligent j'ai résolu ce problème. La chose devenait trop grosse pour Jacko, il a déguerpie.");
	B_GiveXP			(XP_JackoRetired);

	Info_Clearchoices	(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos	(self);
};

func void ORG_862_Jacko_GUARD_Angriff()
{
	AI_Output (other, self,"ORG_862_Jacko_GUARD_Angriff_Info_15_00"); //Mettre fin à l'affaire ici !
	AI_Output (self, other,"ORG_862_Jacko_GUARD_Angriff_Info_06_01"); //Les gars ! Venez ici une minute !

	Info_Clearchoices	(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos	(self);

	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
	Npc_SetPermAttitude (self,ATT_HOSTILE);
	Npc_SetTempAttitude (self,ATT_HOSTILE);
	var C_NPC Killian; 	
	Killian = Hlp_GetNpc(ORG_861_Killian);
	Npc_SetTarget		(Killian,	hero);
	AI_StartState		(Killian,	ZS_Attack,	0,	"");	//0 ist richtig!
	Npc_SetPermAttitude (Killian,ATT_HOSTILE);
	Npc_SetTempAttitude (Killian,ATT_HOSTILE);
	var C_NPC Renyu; 	
	Renyu = Hlp_GetNpc(ORG_860_Renyu);
	Npc_SetTarget		(Renyu,	hero);
	AI_StartState		(Renyu,	ZS_Attack,	0,	"");		//0 ist richtig!
	Npc_SetPermAttitude (Renyu,ATT_HOSTILE);
	Npc_SetTempAttitude (Renyu,ATT_HOSTILE);
};

//******************************************************************
//							Im Banditencamp				
//******************************************************************

instance  ORG_862_Jacko_Banditencamp (C_INFO)
{
	npc				= ORG_862_Jacko;
	nr 				= 1;
	condition		= ORG_862_Jacko_Banditencamp_Condition;
	information		= ORG_862_Jacko_Banditencamp_Info;
	permanent		= 1;
	description		= "Ainsi, c'est ici que tu t'es faufilé.";
};

FUNC int  ORG_862_Jacko_Banditencamp_Condition()
{	
	if ( (Kalom_DrugMonopol == LOG_SUCCESS) && Hlp_StrCmp(Npc_GetNearestWP(self),"LOCATION_11_08") )
	{
		return TRUE;
	};
};

FUNC void  ORG_862_Jacko_Banditencamp_Info()
{
	AI_Output (other, self,"ORG_862_Jacko_Banditencamp_15_00"); //Ainsi c'est là où tu es parti fureter.
	AI_Output (self, other,"ORG_862_Jacko_Banditencamp_06_01"); //C'est passé tout près. Les templiers nous auraient tués.
			
	AI_StopProcessInfos	(self);
}; 






/*
//******************************************************************
//					SPELER SOLL ABHAUEN						
//******************************************************************

instance  ORG_862_Jacko_DRUGGUARD (C_INFO)
{
	npc				= ORG_862_Jacko;
	condition		= ORG_862_Jacko_DRUGGUARD_Condition;
	information		= ORG_862_Jacko_DRUGGUARD_Info;
	important		= 0;
	permanent		= 0;
	description		= "Was machst du hier?"; 
};

FUNC int  ORG_862_Jacko_DRUGGUARD_Condition()
{	
	return TRUE;
};
FUNC void  ORG_862_Jacko_DRUGGUARD_Info()
{
	AI_Output (other, self,"ORG_862_Jacko_DRUGGUARD_Info_15_01"); //Was machst du hier?
	AI_Output (self, other,"ORG_862_Jacko_DRUGGUARD_Info_06_02"); //Gar nichts. Geh weg!
	AI_StopProcessInfos	(self);
};  


//******************************************************************
//						NORMAL									
//******************************************************************

instance  ORG_862_Jacko_KALOM (C_INFO)
{
	npc				= ORG_862_Jacko;
	condition		= ORG_862_Jacko_KALOM_Condition;
	information		= ORG_862_Jacko_KALOM_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich bin im Auftrag der Bruderschaft hier."; 
};

FUNC int  ORG_862_Jacko_KALOM_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_862_Jacko_DRUGGUARD))
	&& ( Kalom_DrugMonopol == LOG_RUNNING)
	{
		return TRUE;
	};

};
FUNC void  ORG_862_Jacko_KALOM_Info()
{
	AI_Output (other, self,"ORG_862_Jacko_KALOM_Info_15_01"); //Ich bin im Auftrag der Bruderschaft hier. 
	AI_Output (self, other,"ORG_862_Jacko_KALOM_Info_06_02"); //Oh scheisse! Und da schicken die so einen wie dich? 
};  

//******************************************************************
//				NORMAL									
//******************************************************************

instance  ORG_862_Jacko_ANGEBOT (C_INFO)
{
	npc				= ORG_862_Jacko;
	condition		= ORG_862_Jacko_ANGEBOT_Condition;
	information		= ORG_862_Jacko_ANGEBOT_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ich will euch ein Angebot machen!"; 
};

FUNC int  ORG_862_Jacko_ANGEBOT_Condition()
{	
	if (Npc_KnowsInfo (hero,ORG_862_Jacko_KALOM))
	{
		return TRUE;
	};

};
FUNC void  ORG_862_Jacko_ANGEBOT_Info()
{
	AI_Output (other, self,"ORG_862_Jacko_ANGEBOT_Info_15_01"); //Ich will euch ein Angebot machen!
	AI_Output (self, other,"ORG_862_Jacko_ANGEBOT_Info_06_02"); //Was für ein Angebot? 
	AI_Output (other, self,"ORG_862_Jacko_ANGEBOT_Info_15_03"); //Das werde ich mit demjenigen bereden,der hier das Sagen hat.  
	AI_Output (self, other,"ORG_862_Jacko_ANGEBOT_Info_06_04"); //Na schön,dann rede mit Renyu. Aber keine faulen Tricks, sonst zerschlage ich jeden deiner Knochen einzeln!
	AI_StopProcessInfos	(self);
};  

*/
