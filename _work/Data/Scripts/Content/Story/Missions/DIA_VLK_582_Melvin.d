// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Melvin_Exit (C_INFO)
{
	npc			= Vlk_582_Melvin;
	nr			= 999;
	condition	= DIA_Melvin_Exit_Condition;
	information	= DIA_Melvin_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Melvin_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Melvin_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Was machst du?
// **************************************************

INSTANCE DIA_Melvin_Hello (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_Hello_Condition;
	information		= DIA_Melvin_Hello_Info;
	permanent		= 0;
	description		= "Zdar! Ty nejsi z tohoto t�bora, �e ne?";
};

FUNC INT DIA_Melvin_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Melvin_Hello_Info()
{
	AI_Output (other, self,"DIA_Melvin_Hello_15_00"); //Zdar! Ty nejsi z tohoto t�bora, �e ne?
	AI_Output (self, other,"DIA_Melvin_Hello_03_01"); //Ano, jsem! P�ed t�dnem jsem opustil Star� t�bor. �ekl jsem sv�mu kamar�dovi Dustymu, aby �el se mnou, ale cht�l po�kat.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Kop�� Melvin se p�idal k Bratrstvu. Jeho kamar�d Dusty st�le z�st�v� ve Star�m t�bo�e, ale tak� pom��l� na odchod.");
};

// **************************************************
// 				Dusty getroffen
// **************************************************

INSTANCE DIA_Melvin_MetDusty (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_MetDusty_Condition;
	information		= DIA_Melvin_MetDusty_Info;
	permanent		= 0;
	description		= "Zn�m Dustyho - p�ed ned�vnem jsem s n�m mluvil.";
};

FUNC INT DIA_Melvin_MetDusty_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Melvin_Hello)) && (Npc_KnowsInfo(hero,DIA_Dusty_Hello)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Melvin_MetDusty_Info()
{
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_00"); //Zn�m Dustyho - p�ed ned�vnem jsem s n�m mluvil.
	AI_Output (self, other,"DIA_Melvin_MetDusty_03_01"); //Kdybys ho potkal zase, �ekni mu, �e byl tup�, kdy� tam z�stal. Je to desetkr�t lep��, ne� se nechat otravovat od str�� ve Star�m t�bo�e.
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_02"); //�eknu mu to, a� ho zase uvid�m.
};


