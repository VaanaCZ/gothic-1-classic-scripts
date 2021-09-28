// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Kyle_Exit (C_INFO)
{
	npc			= Vlk_536_Kyle;
	nr			= 999;
	condition	= DIA_Kyle_Exit_Condition;
	information	= DIA_Kyle_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Kyle_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Kyle_Exit_Info()
{
	Npc_SetRefuseTalk(self,120);	//wegen AUTO-Ansprechen
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Kyle_HutRage (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_HutRage_Condition;
	information		= DIA_Kyle_HutRage_Info;
	permanent		= 1;
	important		= 1;
};

FUNC INT DIA_Kyle_HutRage_Condition()
{	
	if ( (Npc_RefuseTalk(self) == FALSE) && (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist) )
	{
		return 1;
	};
};

FUNC VOID DIA_Kyle_HutRage_Info()
{
	AI_Output (self, other,"DIA_Kyle_HutRage_10_00"); //Ile razy mam wam powtarzaæ, sukinsyny, ¿ebyœcie nie przebiegali przez moj¹ chatê!
};

// **************************************************
// 				Was ist dein Problem?
// **************************************************

INSTANCE DIA_Kyle_Problem (C_INFO)
{
	npc				= Vlk_536_Kyle;
	nr				= 2;
	condition		= DIA_Kyle_Problem_Condition;
	information		= DIA_Kyle_Problem_Info;
	permanent		= 1;
	description		= "Co ciê ugryz³o?";
};

FUNC INT DIA_Kyle_Problem_Condition()
{	
	return 1;	
};

FUNC VOID DIA_Kyle_Problem_Info()
{
	AI_Output (other, self,"DIA_Kyle_Problem_15_00"); //Co ciê ugryz³o?
	AI_Output (self, other,"DIA_Kyle_Problem_10_01"); //Zostaw mnie w spokoju! Mam was wszystkich serdecznie doœæ!
	AI_Output (self, other,"DIA_Kyle_Problem_10_02"); //Wszystko zaczê³o siê, gdy zbudowa³em sobie tê chatê.
	AI_Output (self, other,"DIA_Kyle_Problem_10_03"); //Wszyscy mówili: nie buduj chaty tak blisko rowu.
	AI_Output (self, other,"DIA_Kyle_Problem_10_04"); //Ale ¿aden z tych sukinkotów nie powiedzia³ mi, co siê mo¿e staæ, jeœli j¹ tu jednak wybudujê!
	AI_Output (self, other,"DIA_Kyle_Problem_10_05"); //Jak wróci³em z kopalni kilka dni temu, mia³em dodatkowe drzwi.
	AI_Output (self, other,"DIA_Kyle_Problem_10_06"); //Banda wieprzy! Nienawidzê ich! Nie wyobra¿asz sobie, jak ja ich NIENAWIDZÊ!!!
	AI_Output (self, other,"DIA_Kyle_Problem_10_07"); //Teraz wszyscy prze³a¿¹ przez moj¹ chatê jakby nigdy nic. Ka¿dy cholerny dupek!
};

	
	
	
	
	


















