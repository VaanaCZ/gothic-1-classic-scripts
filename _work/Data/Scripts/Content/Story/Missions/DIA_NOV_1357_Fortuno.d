// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_Fortuno_EXIT (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 999;
	condition	= DIA_Fortuno_EXIT_Condition;
	information	= DIA_Fortuno_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_Fortuno_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fortuno_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  DIA_Fortuno_Greet (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 1;
	condition	= DIA_Fortuno_Greet_Condition;
	information	= DIA_Fortuno_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_Fortuno_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,other)<=ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_Fortuno_Greet_Info()
{
	AI_Output (self, other,"DIA_Fortuno_Greet_05_00"); //Poj� bl�! Ka�d� nov� p��choz� dostane na p�iv�tanou d�rek!
};

// **************************************************
//				Was ist das Geschenk?
// **************************************************
	var int Fortuno_RationDay;
// **************************************************

instance  DIA_Fortuno_GetGeschenk (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 1;
	condition	= DIA_Fortuno_GetGeschenk_Condition;
	information	= DIA_Fortuno_GetGeschenk_Info;
	permanent	= 0;
	description = "Co pro m� m�?";
};                       

FUNC int  DIA_Fortuno_GetGeschenk_Condition()
{
	return 1;
};

FUNC VOID  DIA_Fortuno_GetGeschenk_Info()
{
	AI_Output (other, self,"DIA_Fortuno_GetGeschenk_15_00"); //Co pro m� m�?
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_01"); //Tady jsou t�i roli�ky drogy z ba�in. Je to Severn� soumrak. Dobr� materi�l.
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_02"); //Ka�d� den m��e� dostat dal��, ale pokud bude� cht�t v�c ne� denn� p��d�l, mus� zaplatit.
	AI_Output (self, other,"DIA_Fortuno_GetGeschenk_05_03"); //Kdy� najde� na cest� mezi t�bory bobule a byliny, m��e� mi je p�in�st a j� je od tebe koup�m.

	CreateInvItems(self, itmijoint_2, 3);
	B_GiveInvItems(self, other, itmijoint_2, 3);
	Fortuno_RationDay = Wld_GetDay();
	
	Log_CreateTopic	(GE_TraderPSI,	LOG_NOTE);
	B_LogEntry		(GE_TraderPSI,"Fortuno obchoduje s bylinami pod alchymistickou d�lnou.");
};

// **************************************************
//				T�gliche Ration
// **************************************************

instance  DIA_Fortuno_DailyRation (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 3;
	condition	= DIA_Fortuno_DailyRation_Condition;
	information	= DIA_Fortuno_DailyRation_Info;
	permanent	= 1;
	description = "P�i�el jsem si vyzvednout sv�j denn� p��d�l.";
};                       

FUNC int  DIA_Fortuno_DailyRation_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk))
	{
		return 1;
	};
};

FUNC VOID  DIA_Fortuno_DailyRation_Info()
{
	AI_Output (other, self,"DIA_Fortuno_DailyRation_15_00"); //P�i�el jsem si vyzvednout sv�j denn� p��d�l.
	if (Fortuno_RationDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Fortuno_DailyRation_05_01"); //Tady je. T�ikr�t Severn� soumrak - nevyku� ale v�echno najednou.
		CreateInvItems(self, itmijoint_2, 3);
		B_GiveInvItems(self, other, itmijoint_2, 3);
		Fortuno_RationDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Fortuno_DailyRation_05_02"); //U� jsi sv�j denn� p��d�l dostal. Jestli chce� dal��, mus� p�ij�t z�tra nebo si n�co koupit.
	};
};

// **************************************************
//						TRADE
// **************************************************

instance  DIA_Fortuno_BuyJoints (C_INFO)
{
	npc			= NOV_1357_Fortuno;
	nr			= 4;
	condition	= DIA_Fortuno_BuyJoints_Condition;
	information	= DIA_Fortuno_BuyJoints_Info;
	permanent	= 1;
	description = "Chci obchodovat.";
	Trade		= 1;
};                       

FUNC int  DIA_Fortuno_BuyJoints_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Fortuno_GetGeschenk))
	{
		return 1;
	};
};

FUNC VOID  DIA_Fortuno_BuyJoints_Info()
{
	AI_Output (other, self,"DIA_Fortuno_BuyJoints_15_00"); //Chci obchodovat.
	AI_Output (self, other,"DIA_Fortuno_BuyJoints_05_01"); //Co ode m� chce�? Nebo chce� n�co prodat?
};




