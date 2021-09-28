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
	AI_Output (self, other,"DIA_Kyle_HutRage_10_00"); //Ile razy mam wam powtarza�, sukinsyny, �eby�cie nie przebiegali przez moj� chat�!
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
	description		= "Co ci� ugryz�o?";
};

FUNC INT DIA_Kyle_Problem_Condition()
{	
	return 1;	
};

FUNC VOID DIA_Kyle_Problem_Info()
{
	AI_Output (other, self,"DIA_Kyle_Problem_15_00"); //Co ci� ugryz�o?
	AI_Output (self, other,"DIA_Kyle_Problem_10_01"); //Zostaw mnie w spokoju! Mam was wszystkich serdecznie do��!
	AI_Output (self, other,"DIA_Kyle_Problem_10_02"); //Wszystko zacz�o si�, gdy zbudowa�em sobie t� chat�.
	AI_Output (self, other,"DIA_Kyle_Problem_10_03"); //Wszyscy m�wili: nie buduj chaty tak blisko rowu.
	AI_Output (self, other,"DIA_Kyle_Problem_10_04"); //Ale �aden z tych sukinkot�w nie powiedzia� mi, co si� mo�e sta�, je�li j� tu jednak wybuduj�!
	AI_Output (self, other,"DIA_Kyle_Problem_10_05"); //Jak wr�ci�em z kopalni kilka dni temu, mia�em dodatkowe drzwi.
	AI_Output (self, other,"DIA_Kyle_Problem_10_06"); //Banda wieprzy! Nienawidz� ich! Nie wyobra�asz sobie, jak ja ich NIENAWIDZ�!!!
	AI_Output (self, other,"DIA_Kyle_Problem_10_07"); //Teraz wszyscy prze�a�� przez moj� chat� jakby nigdy nic. Ka�dy cholerny dupek!
};

	
	
	
	
	


















