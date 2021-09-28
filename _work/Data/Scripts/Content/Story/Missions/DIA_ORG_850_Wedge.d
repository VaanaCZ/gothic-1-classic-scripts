// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Wedge_Exit (C_INFO)
{
	npc			= ORG_850_Wedge;
	nr			= 999;
	condition	= DIA_Wedge_Exit_Condition;
	information	= DIA_Wedge_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Wedge_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wedge_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ****************************************
// 					Psst
// ****************************************

instance DIA_Wedge_Psst (C_INFO)
{
	npc				= Org_850_Wedge;
	nr				= 1;
	condition		= DIA_Wedge_Psst_Condition;
	information		= DIA_Wedge_Psst_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_Wedge_Psst_Condition()
{	
	if ( (Npc_GetDistToNpc (hero,self) < 900) && (Wld_IsTime(08,00,23,30)) )
	{
		return TRUE;
	};
};
func void  DIA_Wedge_Psst_Info()
{
	AI_Output (self, other,"DIA_Wedge_Psst_05_00"); //Pssss... hej, ty!
	AI_Output (other, self,"DIA_Wedge_Psst_15_01"); //Kdo?... Já?
	AI_Output (self, other,"DIA_Wedge_Psst_05_02"); //Pøesnì tak... Pojï sem!
	AI_StopProcessInfos	(self);
};

// ****************************************
// 					Hallo
// ****************************************

instance  DIA_Wedge_Hello (C_INFO)
{
	npc				= Org_850_Wedge;
	condition		= DIA_Wedge_Hello_Condition;
	information		= DIA_Wedge_Hello_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co chceš?"; 
};

FUNC int  DIA_Wedge_Hello_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Psst))
	{
		return TRUE;
	};

};
FUNC void  DIA_Wedge_Hello_Info()
{
	AI_Output (other, self,"DIA_Wedge_Hello_15_00"); //Co chceš?
	AI_Output (self, other,"DIA_Wedge_Hello_05_01"); //Právì jsi sem pøišel, viï? Hned jsem si toho všiml.
	AI_Output (self, other,"DIA_Wedge_Hello_05_02"); //Je spousta vìcí, které potøebuješ vìdìt. Mùžu tì pár vìcí nauèit.
	AI_Output (self, other,"DIA_Wedge_Hello_05_03"); //Mimo jiné musíš dávat pozor na to, s kým mluvíš. Tak napøíklad Butch - to je ten chlapík támhle, vedle táborového ohnì... Dávej si na nìj pozor!
};  

// ****************************************
// 				Was ist mit Butch
// ****************************************

instance  DIA_Wedge_WarnsOfButch (C_INFO)
{
	npc				= Org_850_Wedge;
	condition		= DIA_Wedge_WarnsOfButch_Condition;
	information		= DIA_Wedge_WarnsOfButch_Info;
	important		= 0;
	permanent		= 0;
	description		= "Co je s Butchem?"; 
};

FUNC int  DIA_Wedge_WarnsOfButch_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};

};
FUNC void  DIA_Wedge_WarnsOfButch_Info()
{
	AI_Output (other, self,"DIA_Wedge_WarnsOfButch_15_00"); //Co je s Butchem?
	AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_01"); //Má ve zvyku mlátit nováèky. Radìji se mu vyhýbej.
	//AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_02"); //Also, geh ihm am besten aus dem Weg.//***Doppelt***
};  

// ****************************************
// 					Lehrer
// ****************************************

INSTANCE DIA_Wedge_Lehrer (C_INFO)
{
	npc				= Org_850_Wedge;
	nr				= 700;
	condition		= DIA_Wedge_Lehrer_Condition;
	information		= DIA_Wedge_Lehrer_Info;
	permanent		= 1;
	description		= "Co mì mùžeš nauèit?"; 
};

FUNC INT DIA_Wedge_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Hello))
	{	
		return TRUE;	
	};
};

FUNC VOID DIA_Wedge_Lehrer_Info()
{
	if (log_wedgelearn == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
		B_LogEntry			(GE_TeacherNC,"Bandita Wedge mì mùže uèit dovednostem PLÍŽENÍ, VYBÍRÁNÍ KAPES a PÁÈENÍ ZÁMKÙ.");
		log_wedgelearn = TRUE ;
	};
	AI_Output (other, self,"DIA_Wedge_Lehrer_15_00"); //Co mì mùžeš nauèit?
	AI_Output (self, other,"DIA_Wedge_Lehrer_05_01"); //To záleží... Co chceš umìt?
	

	Info_ClearChoices	(DIA_Wedge_Lehrer );
	Info_AddChoice		(DIA_Wedge_Lehrer,DIALOG_BACK																,DIA_Wedge_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0)		,DIA_Wedge_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0)		,DIA_Wedge_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,0)		,DIA_Wedge_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,0)		,DIA_Wedge_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)			,DIA_Wedge_Lehrer_Schleichen);
	};
};


func void DIA_Wedge_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Schleichen_15_00"); //Chci se nauèit plížit.
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_01"); //To je záležitost udržení rovnováhy. Také se musíš nauèit ovládat svùj dech.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_02"); //Dávej pozor na držení tìla a nikdo tvùj pohyb neuslyší...
	};
};

func void DIA_Wedge_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick_15_00"); //Jak mùžu vylepšit své umìní v otevírání zámkù?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_01"); //To bys rád vìdìl, co? Není tìžké s tím zaèít.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_02"); //Pøedevším se musíš ujistit, že se tvùj paklíè nezlomí.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_03"); //Když budeš v budoucnu trochu trpìlivìjší, uvidíš, že nebudeš potøebovat tolik paklíèù!
	};
};

func void DIA_Wedge_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick2_15_00"); //Jak se ze mì stane odborník na vylamování zámkù?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_01"); //Jedinì když získáš nìjaké zkušenosti, budeš moci øíci, jestli se paklíè zlomí. Vydává jiný zvuk!
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_02"); //Myslím, že to máš. Nauè se poslouchat to jemné cvaknutí zámku a pak už nebudeš pøicházet o tolik paklíèù.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_03"); //Odborník v tomhle oboru má velkou šanci, že otevøe zámek, aniž by zlomil svùj paklíè.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00"); //Chci se stát zbìhlým kapsáøem.
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01"); //Takže chceš pár lidem odlehèit o jejich majetek? Dobrá teda.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02"); //Nauèím tì, jak zlepšit své umìní, ale pøesto bude dost pravdìpodobné, že tì pøitom chytnou.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03"); //Mìl bys to zkoušet pouze tehdy, až nebude kolem nikdo, než ty a tvoje obì.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04"); //Jedinì odborník dokáže vzít lidem vìci z kapes, aniž by si toho všimli!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Wedge_lehrer_Pickpocket_05_05"); //Zapomeò na to! Nikdy z tebe nebude zkušený zlodìj, dokud se nebudeš umìt plížit.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Pickpocket2_15_00"); //Chci se stát kapsáøským odborníkem!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_01"); //Myslím, že jsi pokroèil tak daleko, že tì mùžu nauèit poslední triky tohohle øemesla.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_02"); //Mìl bys ale vìdìt, že i ten nejlepší mùže být nìkdy pøistižen.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_03"); //Opatruj se.
	};
};

func VOID DIA_Wedge_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Wedge_Lehrer );
};

