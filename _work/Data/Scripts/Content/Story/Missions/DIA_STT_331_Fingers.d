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
	description		= "Chci se st�t St�nem!"; 
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
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_15_00"); //Chci se st�t St�nem!
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_05_01"); //No a?
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
	Info_AddChoice		(DIA_Fingers_BecomeShadow,DIALOG_BACK										,DIA_Fingers_BecomeShadow_BACK);
	if (Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice		(DIA_Fingers_BecomeShadow,"Hled�m n�koho, kdo m� n�co nau��.",DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice		(DIA_Fingers_BecomeShadow,"M��e� mi pomoci?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //M��e� mi pomoci?
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //Nev�m jak...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //Hled�m n�koho, kdo m� n�co nau��.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //Pro� jsi ke mn� p�i�el?
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Poslal m� Diego.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //To jsi m�l ��ci rovnou.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //Jestli se chce� p�idat k t�boru, pak je v�hodn� b�t dobr� bojovn�k nebo zlod�j.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //Jestli t� budou tady v t�bo�e zkou�et nez�visl� St�ny, daj� ti takov� �koly, kter� nebude� nejsp� schopn� splnit.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //Proto by ses pro za��tek mohl st�t zlod�jem.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //Mimochodem, j� jsem nejlep�� zlod�j z cel�ho Star�ho t�bora.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry			(GE_TeacherOC,"Fingers m� m��e nau�it dovednost VYB�R�N� KAPES a OTEV�R�N� Z�MK�.");
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
	description		= "Co m� m��e� nau�it?"; 
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
	AI_Output (other, self,"DIA_Fingers_Lehrer_15_00"); //Co m� m��e� nau�it?
	AI_Output (self, other,"DIA_Fingers_Lehrer_05_02"); //To z�le�� na tom, co chce� um�t.



	Info_ClearChoices	(DIA_Fingers_Lehrer);
	Info_AddChoice		(DIA_Fingers_Lehrer,DIALOG_BACK																	,DIA_Fingers_Lehrer_BACK);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2	,	LPCOST_TALENT_PICKPOCKET_2,0)	,DIA_Fingers_Lehrer_Pickpocket2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1	,	LPCOST_TALENT_PICKPOCKET_1,0)	,DIA_Fingers_Lehrer_Pickpocket);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2		,	LPCOST_TALENT_PICKLOCK_2,0)	,DIA_Fingers_Lehrer_Lockpick2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1		,	LPCOST_TALENT_PICKLOCK_1,0)	,DIA_Fingers_Lehrer_Lockpick);
	Info_AddChoice		(DIA_Fingers_Lehrer,"Chci se nau�it pl�it.",DIA_Fingers_Lehrer_Schleichen);
};


func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //Chci se nau�it pl�it.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //V���m, a to bez nads�zky, �e jsem jeden z nejlep��ch zlod�j�, jak� kdy tahle kolonie spat�ila.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //Jestli se chce� ale nau�it pl�it, Cavalorn bude lep�� u�itel ne� j�!
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //Jak m��u vylep�it sv� um�n� v otev�r�n� z�mk�?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //To bys r�d v�d�l, co? Nen� t�k� s t�m za��t.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //P�edev��m se mus� ujistit, �e se tv�j pakl�� nezlom�.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //Kdy� bude� v budoucnu trochu trp�liv�j��, uvid�, �e nebude� pot�ebovat tolik pakl���!
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //Jak se ze m� stane odborn�k na vylamov�n� z�mk�?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //Jedin� kdy� z�sk� n�jak� zku�enosti, bude� moci ��ci, jestli se pakl�� zlom�. Vyd�v� jin� zvuk!
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //Mysl�m, �e to m�. Nau� se poslouchat to jemn� cvaknut� z�mku a pak u� nebude� p�ich�zet o tolik pakl���.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //Odborn�k v tomto sm�ru m� velkou �anci, �e otev�e z�mek, ani� by zlomil sv�j pakl��.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //Chci se st�t zb�hl�m kaps��em.
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //Tak�e chce� p�r lidem odleh�it o jejich majetek? Dobr� teda.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //Nau��m t�, jak zlep�it sv� um�n�, ale p�esto bude dost pravd�podobn�, �e t� p�itom chytnou.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //M�l bys to zkou�et pouze tehdy, a� nebude kolem nikdo, ne� ty a tvoje ob�.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Jedin� odborn�k dok�e vz�t lidem v�ci z kapes, ani� by si toho v�imli!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //Zapome� na to! Nikdy z tebe nebude zku�en� zlod�j, dokud se nebude� um�t pl�it.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //Chci se st�t kaps��sk�m odborn�kem!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //Mysl�m, �e jsi pokro�il tak daleko, �e t� m��u nau�it posledn� triky tohohle �emesla.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //M�l bys ale v�d�t, �e i ten nejlep�� m��e b�t n�kdy p�isti�en.
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
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_01"); //Pr�v� je na lovu v divo�in�. Najde� ho po cest� do Nov�ho t�bora. Z�padn� od Star�ho t�bora je �irok� ka�on.
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_02"); //V tom ka�onu je star� d�evorubeck� chata. Najde� ho v n�.
	
	B_LogEntry( GE_TeacherOW,"Cavalorm m� m��e nau�it pl�en�. Jeho chatr� stoj� na z�pad od Star�ho t�bora, sm�rem k Nov�mu t�boru.");
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
	description		= "Nep�imluvil by ses za m� u Diega?"; 
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
	AI_Output (other, self,"DIA_Fingers_Learnt_15_00"); //Nep�imluvil by ses za m� u Diega?

	if ( Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK)+Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET)+Npc_GetTalentSkill(other, NPC_TALENT_SNEAK)	> 0)
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_01"); //Ano. Nau�il ses n�co, d�ky �emu bude� pro n�s docela u�ite�n�.
		AI_Output (self, other,"DIA_Fingers_Learnt_05_02"); //Pot�ebujeme tady v t�bo�e zku�en� zlod�je. Dostane� m�j hlas.
		Fingers_Learnt = LOG_SUCCESS;
		
		B_GiveXP (XP_Fingerstrain);
		B_LogEntry( CH1_JoinOC,"Fingers je doopravdy spokojen s m�mi pokroky.");
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_03"); //Zale�� to na...
		AI_Output (self, other,"DIA_Fingers_Learnt_05_04"); //Jestli dok�e�, �e ses nau�il n�co ze zlod�jsk�ho �emesla, mohl bys b�t pro n�s u�ite�n�!
		AI_Output (other, self,"DIA_Fingers_Learnt_15_05"); //Co bych m�l ud�lat?
		AI_Output (self, other,"DIA_Fingers_Learnt_05_06"); //Nau� se zlod�jsk�mu �emeslu! Pot�ebuje� se vypracovat v pl�en�, kaps��stv� nebo otev�r�n� z�mk�. Pak dostane� m�j hlas.
		Fingers_Learnt = LOG_RUNNING;
		
		B_LogEntry( CH1_JoinOC,"Jakmile z�sk�m zlod�jskou dovednost, Fingers se za m� p�imluv�.");
	};
};




























