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
		Info_AddChoice		(DIA_Fingers_BecomeShadow,"Hledám nìkoho, kdo mì nìco nauèí.",DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice		(DIA_Fingers_BecomeShadow,"Mùžeš mi pomoci?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //Mùžeš mi pomoci?
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //Nevím jak...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //Hledám nìkoho, kdo mì nìco nauèí.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //Proè jsi ke mnì pøišel?
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Poslal mì Diego.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //To jsi mìl øíci rovnou.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //Jestli se chceš pøidat k táboru, pak je výhodné být dobrý bojovník nebo zlodìj.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //Jestli tì budou tady v táboøe zkoušet nezávislé Stíny, dají ti takové úkoly, které nebudeš nejspíš schopný splnit.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //Proto by ses pro zaèátek mohl stát zlodìjem.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //Mimochodem, já jsem nejlepší zlodìj z celého Starého tábora.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry			(GE_TeacherOC,"Fingers mì mùže nauèit dovednost VYBÍRÁNÍ KAPES a OTEVÍRÁNÍ ZÁMKÙ.");
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
	description		= "Co mì mùžeš nauèit?"; 
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
	AI_Output (other, self,"DIA_Fingers_Lehrer_15_00"); //Co mì mùžeš nauèit?
	AI_Output (self, other,"DIA_Fingers_Lehrer_05_02"); //To záleží na tom, co chceš umìt.



	Info_ClearChoices	(DIA_Fingers_Lehrer);
	Info_AddChoice		(DIA_Fingers_Lehrer,DIALOG_BACK																	,DIA_Fingers_Lehrer_BACK);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2	,	LPCOST_TALENT_PICKPOCKET_2,0)	,DIA_Fingers_Lehrer_Pickpocket2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1	,	LPCOST_TALENT_PICKPOCKET_1,0)	,DIA_Fingers_Lehrer_Pickpocket);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2		,	LPCOST_TALENT_PICKLOCK_2,0)	,DIA_Fingers_Lehrer_Lockpick2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1		,	LPCOST_TALENT_PICKLOCK_1,0)	,DIA_Fingers_Lehrer_Lockpick);
	Info_AddChoice		(DIA_Fingers_Lehrer,"Chci se nauèit plížit.",DIA_Fingers_Lehrer_Schleichen);
};


func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //Chci se nauèit plížit.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //Vìøím, a to bez nadsázky, že jsem jeden z nejlepších zlodìjù, jaké kdy tahle kolonie spatøila.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //Jestli se chceš ale nauèit plížit, Cavalorn bude lepší uèitel než já!
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //Jak mùžu vylepšit své umìní v otevírání zámkù?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //To bys rád vìdìl, co? Není tìžké s tím zaèít.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //Pøedevším se musíš ujistit, že se tvùj paklíè nezlomí.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //Když budeš v budoucnu trochu trpìlivìjší, uvidíš, že nebudeš potøebovat tolik paklíèù!
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //Jak se ze mì stane odborník na vylamování zámkù?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //Jedinì když získáš nìjaké zkušenosti, budeš moci øíci, jestli se paklíè zlomí. Vydává jiný zvuk!
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //Myslím, že to máš. Nauè se poslouchat to jemné cvaknutí zámku a pak už nebudeš pøicházet o tolik paklíèù.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //Odborník v tomto smìru má velkou šanci, že otevøe zámek, aniž by zlomil svùj paklíè.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //Chci se stát zbìhlým kapsáøem.
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //Takže chceš pár lidem odlehèit o jejich majetek? Dobrá teda.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //Nauèím tì, jak zlepšit své umìní, ale pøesto bude dost pravdìpodobné, že tì pøitom chytnou.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //Mìl bys to zkoušet pouze tehdy, až nebude kolem nikdo, než ty a tvoje obì.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Jedinì odborník dokáže vzít lidem vìci z kapes, aniž by si toho všimli!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //Zapomeò na to! Nikdy z tebe nebude zkušený zlodìj, dokud se nebudeš umìt plížit.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //Chci se stát kapsáøským odborníkem!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //Myslím, že jsi pokroèil tak daleko, že tì mùžu nauèit poslední triky tohohle øemesla.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //Mìl bys ale vìdìt, že i ten nejlepší mùže být nìkdy pøistižen.
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
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_01"); //Právì je na lovu v divoèinì. Najdeš ho po cestì do Nového tábora. Západnì od Starého tábora je široký kaòon.
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_02"); //V tom kaòonu je stará døevorubecká chata. Najdeš ho v ní.
	
	B_LogEntry( GE_TeacherOW,"Cavalorm mì mùže nauèit plížení. Jeho chatrè stojí na západ od Starého tábora, smìrem k Novému táboru.");
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
	description		= "Nepøimluvil by ses za mì u Diega?"; 
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
	AI_Output (other, self,"DIA_Fingers_Learnt_15_00"); //Nepøimluvil by ses za mì u Diega?

	if ( Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK)+Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET)+Npc_GetTalentSkill(other, NPC_TALENT_SNEAK)	> 0)
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_01"); //Ano. Nauèil ses nìco, díky èemu budeš pro nás docela užiteèný.
		AI_Output (self, other,"DIA_Fingers_Learnt_05_02"); //Potøebujeme tady v táboøe zkušené zlodìje. Dostaneš mùj hlas.
		Fingers_Learnt = LOG_SUCCESS;
		
		B_GiveXP (XP_Fingerstrain);
		B_LogEntry( CH1_JoinOC,"Fingers je doopravdy spokojen s mými pokroky.");
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_03"); //Zaleží to na...
		AI_Output (self, other,"DIA_Fingers_Learnt_05_04"); //Jestli dokážeš, že ses nauèil nìco ze zlodìjského øemesla, mohl bys být pro nás užiteèný!
		AI_Output (other, self,"DIA_Fingers_Learnt_15_05"); //Co bych mìl udìlat?
		AI_Output (self, other,"DIA_Fingers_Learnt_05_06"); //Nauè se zlodìjskému øemeslu! Potøebuješ se vypracovat v plížení, kapsáøství nebo otevírání zámkù. Pak dostaneš mùj hlas.
		Fingers_Learnt = LOG_RUNNING;
		
		B_LogEntry( CH1_JoinOC,"Jakmile získám zlodìjskou dovednost, Fingers se za mì pøimluví.");
	};
};




























