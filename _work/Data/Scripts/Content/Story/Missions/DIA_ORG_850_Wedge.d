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
	AI_Output (other, self,"DIA_Wedge_Psst_15_01"); //Kdo?... J�?
	AI_Output (self, other,"DIA_Wedge_Psst_05_02"); //P�esn� tak... Poj� sem!
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
	description		= "Co chce�?"; 
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
	AI_Output (other, self,"DIA_Wedge_Hello_15_00"); //Co chce�?
	AI_Output (self, other,"DIA_Wedge_Hello_05_01"); //Pr�v� jsi sem p�i�el, vi�? Hned jsem si toho v�iml.
	AI_Output (self, other,"DIA_Wedge_Hello_05_02"); //Je spousta v�c�, kter� pot�ebuje� v�d�t. M��u t� p�r v�c� nau�it.
	AI_Output (self, other,"DIA_Wedge_Hello_05_03"); //Mimo jin� mus� d�vat pozor na to, s k�m mluv�. Tak nap��klad Butch - to je ten chlap�k t�mhle, vedle t�borov�ho ohn�... D�vej si na n�j pozor!
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
	AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_01"); //M� ve zvyku ml�tit nov��ky. Rad�ji se mu vyh�bej.
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
	description		= "Co m� m��e� nau�it?"; 
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
		B_LogEntry			(GE_TeacherNC,"Bandita Wedge m� m��e u�it dovednostem PL͎EN�, VYB�R�N� KAPES a P��EN� Z�MK�.");
		log_wedgelearn = TRUE ;
	};
	AI_Output (other, self,"DIA_Wedge_Lehrer_15_00"); //Co m� m��e� nau�it?
	AI_Output (self, other,"DIA_Wedge_Lehrer_05_01"); //To z�le��... Co chce� um�t?
	

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
	AI_Output (other, self,"DIA_Wedge_Lehrer_Schleichen_15_00"); //Chci se nau�it pl�it.
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_01"); //To je z�le�itost udr�en� rovnov�hy. Tak� se mus� nau�it ovl�dat sv�j dech.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_02"); //D�vej pozor na dr�en� t�la a nikdo tv�j pohyb neusly��...
	};
};

func void DIA_Wedge_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick_15_00"); //Jak m��u vylep�it sv� um�n� v otev�r�n� z�mk�?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_01"); //To bys r�d v�d�l, co? Nen� t�k� s t�m za��t.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_02"); //P�edev��m se mus� ujistit, �e se tv�j pakl�� nezlom�.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_03"); //Kdy� bude� v budoucnu trochu trp�liv�j��, uvid�, �e nebude� pot�ebovat tolik pakl���!
	};
};

func void DIA_Wedge_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick2_15_00"); //Jak se ze m� stane odborn�k na vylamov�n� z�mk�?
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_01"); //Jedin� kdy� z�sk� n�jak� zku�enosti, bude� moci ��ci, jestli se pakl�� zlom�. Vyd�v� jin� zvuk!
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_02"); //Mysl�m, �e to m�. Nau� se poslouchat to jemn� cvaknut� z�mku a pak u� nebude� p�ich�zet o tolik pakl���.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_03"); //Odborn�k v tomhle oboru m� velkou �anci, �e otev�e z�mek, ani� by zlomil sv�j pakl��.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00"); //Chci se st�t zb�hl�m kaps��em.
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01"); //Tak�e chce� p�r lidem odleh�it o jejich majetek? Dobr� teda.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02"); //Nau��m t�, jak zlep�it sv� um�n�, ale p�esto bude dost pravd�podobn�, �e t� p�itom chytnou.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03"); //M�l bys to zkou�et pouze tehdy, a� nebude kolem nikdo, ne� ty a tvoje ob�.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04"); //Jedin� odborn�k dok�e vz�t lidem v�ci z kapes, ani� by si toho v�imli!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Wedge_lehrer_Pickpocket_05_05"); //Zapome� na to! Nikdy z tebe nebude zku�en� zlod�j, dokud se nebude� um�t pl�it.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Pickpocket2_15_00"); //Chci se st�t kaps��sk�m odborn�kem!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_01"); //Mysl�m, �e jsi pokro�il tak daleko, �e t� m��u nau�it posledn� triky tohohle �emesla.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_02"); //M�l bys ale v�d�t, �e i ten nejlep�� m��e b�t n�kdy p�isti�en.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_03"); //Opatruj se.
	};
};

func VOID DIA_Wedge_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Wedge_Lehrer );
};

