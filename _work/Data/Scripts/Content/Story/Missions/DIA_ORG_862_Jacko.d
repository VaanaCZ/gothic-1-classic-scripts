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
	AI_Output			(self, other,"ORG_862_Jacko_GoAway_Info_06_00"); //Co tady k �ertu pohled�v�?
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
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_Info_06_00"); //Zabloudili jsme, �e ano?
	AI_Output			(other, self,"ORG_862_Jacko_GUARD_Info_15_01"); //Cor Kalom v� o va�em mal�m podniku.
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_Info_06_02"); //Co�e? Pro� tady jsi?
	
	B_LogEntry			(CH1_DrugMonopol,"Na�el jsem tajnou v�robnu drogy z ba�in. Jacko a dva dal�� bandit� tu produkuj� lodyhy drogy.");

	Info_Clearchoices	(ORG_862_Jacko_GUARD);
	Info_Addchoice		(ORG_862_Jacko_GUARD,"Jsem tu, abych v�s varoval. Cor Kalom vyslal p�t templ���, aby s v�mi skoncovali.",ORG_862_Jacko_GUARD_Templer);
	Info_Addchoice		(ORG_862_Jacko_GUARD,"Zaj�malo by m�, jakou cenu m� pro tebe tahle informace.",ORG_862_Jacko_GUARD_InfoWert);
	Info_Addchoice		(ORG_862_Jacko_GUARD,"A v�c se ch�l� ke konci!",ORG_862_Jacko_GUARD_Angriff);
};  

func void ORG_862_Jacko_GUARD_Templer()
{
	AI_Output			(other, self,"ORG_862_Jacko_GUARD_Templer_Info_15_00"); //Jsem tu, abych t� varoval. Co Kalom vyslal p�t templ���, aby t� zastavili.
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_Templer_Info_06_01"); //Co�e? To nemysl� v�n�!
	AI_Output			(other, self,"ORG_862_Jacko_GUARD_Templer_Info_15_02"); //M�li by dorazit b�hem chvilky!
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_Templer_Info_06_03"); //Sakra! Mus�me zmizet!

	Info_Clearchoices	(ORG_862_Jacko_GUARD);

	B_LogEntry			(CH1_DrugMonopol,"Mal� lest s templ��i, kte�� tu v�bec nebyli, mi pomohla zbavit se t�ch zbab�lc�. Probl�m by m�l b�t na chvilku vy�e�en.");
	B_GiveXP			(XP_JackoRetired);

	Npc_ExchangeRoutine (self,				"ARBEITSLOS");
	B_ExchangeRoutine	(ORG_861_Killian,	"ARBEITSLOS");
	B_ExchangeRoutine	(ORG_860_Renyu,		"ARBEITSLOS");

	Stooges_Fled = TRUE;

	AI_StopProcessInfos	(self);
};

func void ORG_862_Jacko_GUARD_InfoWert()
{
	AI_Output			(other, self,"ORG_862_Jacko_GUARD_InfoWert_Info_15_00"); //Chci v�d�t, jestli je tv� informace pravdiv�.
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_01"); //Och, tak tohle teda chce�... Dobr�. Ruka ruku myje. Tady je ruda, kterou u sebe m�m.
	AI_Output			(self, other,"ORG_862_Jacko_GUARD_InfoWert_Info_06_02"); //Mus�me j�t! A ty bys m�l zmizet taky.

	B_GiveInvItems		(self, other,itminugget,95);

	Npc_ExchangeRoutine (self,				"ARBEITSLOS");
	B_ExchangeRoutine	(ORG_861_Killian,	"ARBEITSLOS");
	B_ExchangeRoutine	(ORG_860_Renyu,		"ARBEITSLOS");

	Stooges_Fled = TRUE;
	B_LogEntry			(CH1_DrugMonopol,"Kr�tkou domluvou jsem vy�e�il probl�m. Ta v�c byla pro Jacka tak o�ehav�, �e se rad�ji ztratil.");
	B_GiveXP			(XP_JackoRetired);

	Info_Clearchoices	(ORG_862_Jacko_GUARD);
	AI_StopProcessInfos	(self);
};

func void ORG_862_Jacko_GUARD_Angriff()
{
	AI_Output (other, self,"ORG_862_Jacko_GUARD_Angriff_Info_15_00"); //A v�c se ch�l� ke konci!
	AI_Output (self, other,"ORG_862_Jacko_GUARD_Angriff_Info_06_01"); //Chlapi! Poj�te rychle sem.

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
	description		= "Mus�te se odtud odpl�it.";
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
	AI_Output (other, self,"ORG_862_Jacko_Banditencamp_15_00"); //Mus�te se odtud odpl�it.
	AI_Output (self, other,"ORG_862_Jacko_Banditencamp_06_01"); //To bylo o fous. Sekt���t� templ��i by n�s byli zabili.
			
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
	AI_Output (self, other,"ORG_862_Jacko_ANGEBOT_Info_06_02"); //Was f�r ein Angebot? 
	AI_Output (other, self,"ORG_862_Jacko_ANGEBOT_Info_15_03"); //Das werde ich mit demjenigen bereden,der hier das Sagen hat.  
	AI_Output (self, other,"ORG_862_Jacko_ANGEBOT_Info_06_04"); //Na sch�n,dann rede mit Renyu. Aber keine faulen Tricks, sonst zerschlage ich jeden deiner Knochen einzeln!
	AI_StopProcessInfos	(self);
};  

*/
