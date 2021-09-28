// ************************ EXIT **************************

INSTANCE DIA_SLD_709_Cord_Exit (C_INFO)
{
	npc			= SLD_709_Cord;
	nr			= 999;
	condition	= DIA_SLD_709_Cord_Exit_Condition;
	information	= DIA_SLD_709_Cord_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_SLD_709_Cord_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_709_Cord_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

/*------------------------------------------------------------------------
						TRAIN ANGEBOT								
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAINOFFER (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAINOFFER_Condition;
	information		= SLD_709_Cord_TRAINOFFER_Info;
	important		= 0;
	permanent		= 0;
	description		= "Chci se zlep�it v ovl�d�n� jednoru�n�ho me�e."; 
};

FUNC int  SLD_709_Cord_TRAINOFFER_Condition()
{	
	if (Npc_GetTalentSkill (hero,NPC_TALENT_1H) < 2)
	{
		return TRUE;
	};

};
FUNC void  SLD_709_Cord_TRAINOFFER_Info()
{
	AI_Output (other, self,"SLD_709_Cord_TRAINOFFER_Info_15_01"); //Chci se zlep�it v ovl�d�n� jednoru�n�ho me�e.
	AI_Output (self, other,"SLD_709_Cord_TRAINOFFER_Info_14_02"); //Jist�. Bude t� to ov�em n�co st�t. Chci 30 nuget�.

	Log_CreateTopic	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,"�old�k Cord m� m��e nau�it bojovat s JEDNORU�N�MI ZBRAN�MI. P�es den ho m��u naj�t na skalnat� plo�in� u jezera.");
};  
/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ERSTE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAIN (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAIN_Condition;
	information		= SLD_709_Cord_TRAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_1, LPCOST_TALENT_1H_1,30); 
};

FUNC int  SLD_709_Cord_TRAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,SLD_709_Cord_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_1H) == 0)
	{
		return TRUE;
	};
};
FUNC void  SLD_709_Cord_TRAIN_Info()
{
	AI_Output (other, self,"SLD_709_Cord_TRAIN_Info_15_00"); //Chci se zlep�it v ovl�d�n� jednoru�n�ho me�e.

	if (Npc_HasItems (hero,ItMiNugget) >= 30)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1)
		{
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_01"); //To je dobr� rozhodnut�! Je�t� ne� se za�ne� u�it techniku, mus� se nau�it spr�vn� dr�et zbra�.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_02"); //Za��te�n�ci oby�ejn� m�vaj� snahu dr�et jednoru�n� me� ob�ma rukama. T�mto zp�sobem rozhodn� neza��nej, to nen� dobr�.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_03"); //Dr� zbra� v jedn� ruce, �epel� vzh�ru a �ermuj s n�.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_04"); //Mus� se nau�it sladit pohyb zbran� s pohybem sv�ho t�la. Tak bude� p�i �toku rychlej��.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_05"); //Kdy� si zapamatuje�, co jsem t� nau�il, tak bude tv�j boj v budoucnu elegantn�j�� a rychlej��.
			B_PracticeCombat	("NC_WATERFALL_TOP01");
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_06"); //Ov�em, je�t� jednu v�c. N�kter� �dery zp�sob� v�t�� �kodu ne� ostatn�. Jako za��te�n�kovi se ti nebude �asto dost�vat �ance rozhoduj�c�ch �der�.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_07"); //Ale �asem bude� d�lat pokroky a zlep�� se.
			B_GiveInvItems (hero, self,ItMiNugget,30);
			SLD_709_Cord_TRAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nem� dost rudy.
	};
};  
/*------------------------------------------------------------------------
						EINHANDKAMPF	DIE ZWEITE LEHRSTUNDE							
------------------------------------------------------------------------*/

instance  SLD_709_Cord_TRAINAGAIN (C_INFO)
{
	npc				= SLD_709_Cord;
	condition		= SLD_709_Cord_TRAINAGAIN_Condition;
	information		= SLD_709_Cord_TRAINAGAIN_Info;
	important		= 0;
	permanent		= 1;
	description		= B_BuildLearnString(NAME_Learn1h_2, LPCOST_TALENT_1H_2,50); 
};

FUNC int  SLD_709_Cord_TRAINAGAIN_Condition()
{	
	if (Npc_KnowsInfo (hero,SLD_709_Cord_TRAINOFFER))
	&& (Npc_GetTalentSkill (hero,NPC_TALENT_1H) < 2)
	{
		return TRUE;
	};

};
FUNC void  SLD_709_Cord_TRAINAGAIN_Info()
{
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Nau� m� je�t� l�pe ovl�dat jednoru�n� me�.

	if (Npc_HasItems (hero,ItMiNugget) >= 50)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2)
		{
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_02"); //Dobr�, z�klady zn�. Kdy� podr�� zbra� n�, umo�n� ti to mnohem siln�ji v�st prvn� �vih.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_03"); //Mus� se h�bat, pamatuje�? Dob�e, te� mus� je�t� v�c pracovat t�lem. Po druh�m �deru se oto�. To protivn�ka zmate a tob� to umo�n� zaujmout optim�ln� pozici.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_04"); //Je�t� jednou ve� �epel zprava doleva.
			B_PracticeCombat("NC_WATERFALL_TOP01");
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_05"); //A znovu kup�edu. Nezapome�: cvi�en�m k dokonalosti. Tak�e vzh�ru do toho, aby ses stal mistrem jednoru�n�ho me�e.
			B_GiveInvItems	(hero, self, ItMiNugget, 50);
			SLD_709_Cord_TRAINAGAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nem� dost rudy.
	};
}; 
