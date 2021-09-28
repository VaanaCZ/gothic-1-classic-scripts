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
	description		= "Chci se zlepšit v ovládání jednoruèního meèe."; 
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
	AI_Output (other, self,"SLD_709_Cord_TRAINOFFER_Info_15_01"); //Chci se zlepšit v ovládání jednoruèního meèe.
	AI_Output (self, other,"SLD_709_Cord_TRAINOFFER_Info_14_02"); //Jistì. Bude tì to ovšem nìco stát. Chci 30 nugetù.

	Log_CreateTopic	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,"Žoldák Cord mì mùže nauèit bojovat s JEDNORUÈNÍMI ZBRANÌMI. Pøes den ho mùžu najít na skalnaté plošinì u jezera.");
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
	AI_Output (other, self,"SLD_709_Cord_TRAIN_Info_15_00"); //Chci se zlepšit v ovládání jednoruèního meèe.

	if (Npc_HasItems (hero,ItMiNugget) >= 30)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1)
		{
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_01"); //To je dobré rozhodnutí! Ještì než se zaèneš uèit techniku, musíš se nauèit správnì držet zbraò.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_02"); //Zaèáteèníci obyèejnì mívají snahu držet jednoruèní meè obìma rukama. Tímto zpùsobem rozhodnì nezaèínej, to není dobré.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_03"); //Drž zbraò v jedné ruce, èepelí vzhùru a šermuj s ní.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_04"); //Musíš se nauèit sladit pohyb zbranì s pohybem svého tìla. Tak budeš pøi útoku rychlejší.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_05"); //Když si zapamatuješ, co jsem tì nauèil, tak bude tvùj boj v budoucnu elegantnìjší a rychlejší.
			B_PracticeCombat	("NC_WATERFALL_TOP01");
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_06"); //Ovšem, ještì jednu vìc. Nìkteré údery zpùsobí vìtší škodu než ostatní. Jako zaèáteèníkovi se ti nebude èasto dostávat šance rozhodujících úderù.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_07"); //Ale èasem budeš dìlat pokroky a zlepšíš se.
			B_GiveInvItems (hero, self,ItMiNugget,30);
			SLD_709_Cord_TRAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nemáš dost rudy.
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
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Nauè mì ještì lépe ovládat jednoruèní meè.

	if (Npc_HasItems (hero,ItMiNugget) >= 50)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2)
		{
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_02"); //Dobrá, základy znáš. Když podržíš zbraò níž, umožní ti to mnohem silnìji vést první švih.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_03"); //Musíš se hýbat, pamatuješ? Dobøe, teï musíš ještì víc pracovat tìlem. Po druhém úderu se otoè. To protivníka zmate a tobì to umožní zaujmout optimální pozici.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_04"); //Ještì jednou veï èepel zprava doleva.
			B_PracticeCombat("NC_WATERFALL_TOP01");
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_05"); //A znovu kupøedu. Nezapomeò: cvièením k dokonalosti. Takže vzhùru do toho, aby ses stal mistrem jednoruèního meèe.
			B_GiveInvItems	(hero, self, ItMiNugget, 50);
			SLD_709_Cord_TRAINAGAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nemáš dost rudy.
	};
}; 
