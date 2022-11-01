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
	description		= "Chciałbym nauczyć się walki jednoręcznym orężem."; 
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
	AI_Output (other, self,"SLD_709_Cord_TRAINOFFER_Info_15_01"); //Chciałbym nauczyć się walki jednoręcznym orężem.
	AI_Output (self, other,"SLD_709_Cord_TRAINOFFER_Info_14_02"); //Nie ma sprawy. Ale to cię będzie kosztowało 30 bryłek rudy. Może być?

	Log_CreateTopic	(GE_TeacherNC,	LOG_NOTE);
	B_LogEntry		(GE_TeacherNC,"Najemnik Cord może mnie nauczyć walki jednoręcznym orężem. Za dnia można go znaleźć na kamienistej równinie, przy jeziorze.");
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
	AI_Output (other, self,"SLD_709_Cord_TRAIN_Info_15_00"); //Chciałbym nauczyć się walki jednoręcznym orężem.

	if (Npc_HasItems (hero,ItMiNugget) >= 30)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,1,LPCOST_TALENT_1H_1)
		{
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_01"); //Mądra decyzja. Jednak zanim poznasz bardziej zaawansowane techniki, powinieneś nauczyć się prawidłowo trzymać oręż w ręku.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_02"); //Początkujący często łapią zwykły miecz obydwoma rękami. Radziłbym ci się do tego nie przyzwyczajać, to fatalny nawyk. 
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_03"); //Trzymaj broń jedną ręką, ostrzem do góry, i zacznij nią machać.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_04"); //Musisz się nauczyć, jak zgrać twoje ruchy z bezwładnością oręża. Dzięki temu twoje ataki będą szybsze i bardziej zaskakujące.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_05"); //Zapamiętaj sobie dobrze, co ci powiedziałem, a twój styl walki stanie się o wiele bardziej elegancki i skuteczny.
			B_PracticeCombat	("NC_WATERFALL_TOP01");
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_06"); //A, i jeszcze coś! Niektóre ciosy powodują większe obrażenia niż zwykle. Oczywiście, jako początkujący masz raczej niewielkie szanse na zadanie krytycznego uderzenia.
			AI_Output			(self,other,"SLD_709_Cord_TRAIN_14_07"); //Ale to się zmieni w miarę czynienia przez ciebie postępów.
			B_GiveInvItems (hero, self,ItMiNugget,30);
			SLD_709_Cord_TRAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczającej ilości rudy!
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
	AI_Output			(other, self,"SLD_709_Cord_TRAINAGAIN_Info_15_01"); //Naucz mnie, jak sprawniej posługiwać się jednoręczną bronią.

	if (Npc_HasItems (hero,ItMiNugget) >= 50)
	{
		if B_GiveSkill(hero,NPC_TALENT_1H,2,LPCOST_TALENT_1H_2)
		{
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_02"); //Dobrze, podstawy już znasz. Nieznaczne opuszczenie broni zwiększy siłę twojego pierwszego ciosu.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_03"); //Musisz wykorzystać siłę bezwładności, pamiętasz? Świetnie. Teraz nauczysz się lepiej balansować ciałem. Po zadaniu dwóch ciosów wykonaj obrót. To powinno zmylić twojego przeciwnika i pozwolić ci wyjść na dobrą pozycję do następnego ataku.
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_04"); //Wtedy wyprowadź następne cięcie z prawej strony...
			B_PracticeCombat("NC_WATERFALL_TOP01");
			AI_Output		(self, other,"SLD_709_Cord_TRAINAGAIN_Info_14_05"); //I znowu do przodu. Pamiętaj - trening czyni mistrza, więc najlepiej weź się od razu do roboty!
			B_GiveInvItems	(hero, self, ItMiNugget, 50);
			SLD_709_Cord_TRAINAGAIN.permanent = 0;
		};
	}
	else
	{
		AI_Output (self, other,"KDF_402_Corristo_HEAVYARMOR_Info_14_03"); //Nie masz wystarczającej ilości rudy!
	};
}; 
