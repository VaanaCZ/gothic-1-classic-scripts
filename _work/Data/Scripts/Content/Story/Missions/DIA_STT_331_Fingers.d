// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_331_Fingers_Exit (C_INFO)
{
	npc			= STT_331_Fingers;
	nr			= 999;
	condition	= DIA_STT_331_Fingers_Exit_Condition;
	information	= DIA_STT_331_Fingers_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				 Schatten werden
// **************************************************
	var int Fingers_CanTeach;
// **************************************************

INSTANCE DIA_Fingers_BecomeShadow (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_BecomeShadow_Condition;
	information		= DIA_Fingers_BecomeShadow_Info;
	permanent		= 1;
	description		= "Chci se stát Stínem!"; 
};

FUNC INT DIA_Fingers_BecomeShadow_Condition()
{	
	if ( (Fingers_CanTeach == FALSE) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_BecomeShadow_Info()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_15_00"); //Chci se stát Stínem!
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_05_01"); //No a?
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
	Info_AddChoice		(DIA_Fingers_BecomeShadow,DIALOG_BACK										,DIA_Fingers_BecomeShadow_BACK);
	if (Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice		(DIA_Fingers_BecomeShadow,"Hledám někoho, kdo mě něco naučí.",DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice		(DIA_Fingers_BecomeShadow,"Můžeš mi pomoci?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //Můžeš mi pomoci?
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //Nevím jak...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //Hledám někoho, kdo mě něco naučí.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //Proč jsi ke mně přišel?
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Poslal mě Diego.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //To jsi měl říci rovnou.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //Jestli se chceš přidat k táboru, pak je výhodné být dobrý bojovník nebo zloděj.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //Jestli tě budou tady v táboře zkoušet nezávislé Stíny, dají ti takové úkoly, které nebudeš nejspíš schopný splnit.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //Proto by ses pro začátek mohl stát zlodějem.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //Mimochodem, já jsem nejlepší zloděj z celého Starého tábora.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry			(GE_TeacherOC,"Fingers mě může naučit dovednost VYBÍRÁNÍ KAPES a OTEVÍRÁNÍ ZÁMKŮ.");
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

// **************************************************
// 						 Lehrer
// **************************************************
	var int Fingers_Wherecavalorn;

INSTANCE DIA_Fingers_Lehrer (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Lehrer_Condition;
	information		= DIA_Fingers_Lehrer_Info;
	permanent		= 1;
	description		= "Co mě můžeš naučit?"; 
};

FUNC INT DIA_Fingers_Lehrer_Condition()
{	
	if (Fingers_CanTeach == TRUE)
	{
		return 1;	
	};
};

FUNC VOID DIA_Fingers_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_15_00"); //Co mě můžeš naučit?
	AI_Output (self, other,"DIA_Fingers_Lehrer_05_02"); //To záleží na tom, co chceš umět.



	Info_ClearChoices	(DIA_Fingers_Lehrer);
	Info_AddChoice		(DIA_Fingers_Lehrer,DIALOG_BACK																	,DIA_Fingers_Lehrer_BACK);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2	,	LPCOST_TALENT_PICKPOCKET_2,0)	,DIA_Fingers_Lehrer_Pickpocket2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1	,	LPCOST_TALENT_PICKPOCKET_1,0)	,DIA_Fingers_Lehrer_Pickpocket);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2		,	LPCOST_TALENT_PICKLOCK_2,0)	,DIA_Fingers_Lehrer_Lockpick2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1		,	LPCOST_TALENT_PICKLOCK_1,0)	,DIA_Fingers_Lehrer_Lockpick);
	Info_AddChoice		(DIA_Fingers_Lehrer,"Chci se naučit plížit.",DIA_Fingers_Lehrer_Schleichen);
};


func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //Chci se naučit plížit.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //Věřím, a to bez nadsázky, že jsem jeden z nejlepších zlodějů, jaké kdy tahle kolonie spatřila.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //Jestli se chceš ale naučit plížit, Cavalorn bude lepší učitel než já!
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //Jak můžu vylepšit své umění v otevírání zámků?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //To bys rád věděl, co? Není těžké s tím začít.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //Především se musíš ujistit, že se tvůj paklíč nezlomí.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //Když budeš v budoucnu trochu trpělivější, uvidíš, že nebudeš potřebovat tolik paklíčů!
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //Jak se ze mě stane odborník na vylamování zámků?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //Jedině když získáš nějaké zkušenosti, budeš moci říci, jestli se paklíč zlomí. Vydává jiný zvuk!
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //Myslím, že to máš. Nauč se poslouchat to jemné cvaknutí zámku a pak už nebudeš přicházet o tolik paklíčů.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //Odborník v tomto směru má velkou šanci, že otevře zámek, aniž by zlomil svůj paklíč.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //Chci se stát zběhlým kapsářem.
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //Takže chceš pár lidem odlehčit o jejich majetek? Dobrá teda.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //Naučím tě, jak zlepšit své umění, ale přesto bude dost pravděpodobné, že tě přitom chytnou.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //Měl bys to zkoušet pouze tehdy, až nebude kolem nikdo, než ty a tvoje oběť.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Jedině odborník dokáže vzít lidem věci z kapes, aniž by si toho všimli!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //Zapomeň na to! Nikdy z tebe nebude zkušený zloděj, dokud se nebudeš umět plížit.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //Chci se stát kapsářským odborníkem!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //Myslím, že jsi pokročil tak daleko, že tě můžu naučit poslední triky tohohle řemesla.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //Měl bys ale vědět, že i ten nejlepší může být někdy přistižen.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Opatruj se.
	};
};

func VOID DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Fingers_Lehrer );
};

// **************************************************
// 					Wo Cavalorn
// **************************************************

INSTANCE DIA_Fingers_WhereCavalorn (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_WhereCavalorn_Condition;
	information		= DIA_Fingers_WhereCavalorn_Info;
	permanent		= 1;
	description		= "Kde najdu Cavalorna?"; 
};

FUNC INT DIA_Fingers_WhereCavalorn_Condition()
{	
	if (Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_WhereCavalorn_Info()
{
	AI_Output (other, self,"DIA_Fingers_WhereCavalorn_15_00"); //Kde najdu Cavalorna?
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_01"); //Právě je na lovu v divočině. Najdeš ho po cestě do Nového tábora. Západně od Starého tábora je široký kaňon.
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_02"); //V tom kaňonu je stará dřevorubecká chata. Najdeš ho v ní.
	
	B_LogEntry( GE_TeacherOW,"Cavalorm mě může naučit plížení. Jeho chatrč stojí na západ od Starého tábora, směrem k Novému táboru.");
};

// **************************************************
// 					Gutes Wort
// **************************************************
	var int Fingers_Learnt;
// **************************************************

INSTANCE DIA_Fingers_Learnt (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Learnt_Condition;
	information		= DIA_Fingers_Learnt_Info;
	permanent		= 1;
	description		= "Nepřimluvil by ses za mě u Diega?"; 
};

FUNC INT DIA_Fingers_Learnt_Condition()
{	
	if ( (Fingers_Learnt != LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Learnt_Info()
{
	AI_Output (other, self,"DIA_Fingers_Learnt_15_00"); //Nepřimluvil by ses za mě u Diega?

	if ( Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK)+Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET)+Npc_GetTalentSkill(other, NPC_TALENT_SNEAK)	> 0)
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_01"); //Ano. Naučil ses něco, díky čemu budeš pro nás docela užitečný.
		AI_Output (self, other,"DIA_Fingers_Learnt_05_02"); //Potřebujeme tady v táboře zkušené zloděje. Dostaneš můj hlas.
		Fingers_Learnt = LOG_SUCCESS;
		
		B_GiveXP (XP_Fingerstrain);
		B_LogEntry( CH1_JoinOC,"Fingers je doopravdy spokojen s mými pokroky.");
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_03"); //Zaleží to na...
		AI_Output (self, other,"DIA_Fingers_Learnt_05_04"); //Jestli dokážeš, že ses naučil něco ze zlodějského řemesla, mohl bys být pro nás užitečný!
		AI_Output (other, self,"DIA_Fingers_Learnt_15_05"); //Co bych měl udělat?
		AI_Output (self, other,"DIA_Fingers_Learnt_05_06"); //Nauč se zlodějskému řemeslu! Potřebuješ se vypracovat v plížení, kapsářství nebo otevírání zámků. Pak dostaneš můj hlas.
		Fingers_Learnt = LOG_RUNNING;
		
		B_LogEntry( CH1_JoinOC,"Jakmile získám zlodějskou dovednost, Fingers se za mě přimluví.");
	};
};




























