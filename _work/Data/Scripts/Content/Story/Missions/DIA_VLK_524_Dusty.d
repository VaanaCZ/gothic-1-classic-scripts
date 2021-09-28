// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Dusty_Exit (C_INFO)
{
	npc			= Vlk_524_Dusty;
	nr			= 999;
	condition	= DIA_Dusty_Exit_Condition;
	information	= DIA_Dusty_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Dusty_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Dusty_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Was machst du?
// **************************************************

INSTANCE DIA_Dusty_Hello (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Hello_Condition;
	information		= DIA_Dusty_Hello_Info;
	permanent		= 0;
	description		= "Zdar! Jsem tady nov� - jak to jde?";
};

FUNC INT DIA_Dusty_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Dusty_Hello_Info()
{
	AI_Output (other, self,"DIA_Dusty_Hello_15_00"); //Zdar! Jsem tady nov� - jak to jde?
	AI_Output (self, other,"DIA_Dusty_Hello_03_01"); //Jdi pry�! Za posledn� dva t�dny jsem se v dolech sed�el k smrti. A co z toho?
	AI_Output (self, other,"DIA_Dusty_Hello_03_02"); //N�jakej blbej kus rudy, to je v�echno. V�t�inu z toho utrat�m za j�dlo.
	AI_Output (self, other,"DIA_Dusty_Hello_03_03"); //Mluvil jsem s Baalem Parvezem. �ekl mi o Sektovn�m t�bo�e n�kolik zaj�mav�ch v�c�.
	AI_Output (self, other,"DIA_Dusty_Hello_03_04"); //Mysl�m, �e by bylo lep�� p�ej�t tam, ne� tady d�l otro�it na Gomeze.
};

// **************************************************
// 				Warum gehst du nicht?
// **************************************************

INSTANCE DIA_Dusty_WhyNotLeave (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_WhyNotLeave_Condition;
	information		= DIA_Dusty_WhyNotLeave_Info;
	permanent		= 0;
	description		= "Tob� se tady nel�b�? Pro� teda neodejde�?";
};

FUNC INT DIA_Dusty_WhyNotLeave_Condition()
{	
	if	 Npc_KnowsInfo(hero,DIA_Dusty_Hello)
	&&	!Npc_KnowsInfo(hero,DIA_Dusty_MetMelvin)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_WhyNotLeave_Info()
{
	AI_Output (other, self,"DIA_Dusty_WhyNotLeave_15_00"); //Tob� se tady nel�b�? Pro� teda neodejde�?
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_01"); //Proto�e si nejsem �pln� jist�, co tam m��u o�ek�vat. M�l jsem tady kamar�da - jmenoval se Melvin. Ode�el p�ed t�dnem do Sektovn�ho t�bora.
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_02"); //Od t� doby jsem o n�m nesly�el. A dokud o n�m nedostanu zpr�vu, z�stanu tady!

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Dusty, kop�� ze Star�ho t�bora, u� je dlouho nespokojen se zdej��m �ivotem. P�em��l� o tom, �e se p�id� k Bratrstvu v ba�in�ch.");
};

// **************************************************
// 				Mit Melvin geredet
// **************************************************

INSTANCE DIA_Dusty_MetMelvin (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_MetMelvin_Condition;
	information		= DIA_Dusty_MetMelvin_Info;
	permanent		= 0;
	description		= "Byl jsem v Sektovn�m t�bo�e a setkal se s Melvinem.";
};

FUNC INT DIA_Dusty_MetMelvin_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Melvin_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_MetMelvin_Info()
{
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_00"); //Byl jsem v Sektovn�m t�bo�e a setkal se s Melvinem.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_01"); //No a? Co ��kal?
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_02"); //O�ividn� mu to vyhovovalo l�p, ne� se nechat utla�ovat od str��.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_03"); //No, t�buch! To si tu celou radost nech�v� s�m pro sebe? Mus�m tam j�t. Ale z tohohle t�bora se nikdy nedostanu..
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_04"); //V�n�? Pro� ne?
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_05"); //Str�e zjistily, �e jsem cht�l odej�t, proto�e jsem asi moc mluvil.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_06"); //Pot�ebuju aspo� 100 nuget� na uplacen� str��.
};

// **************************************************
// 				Ich gebe dir 100 Erz
// **************************************************

INSTANCE DIA_Dusty_Offer100Ore (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_Offer100Ore_Condition;
	information		= DIA_Dusty_Offer100Ore_Info;
	permanent		= 0;
	description		= "Co kdybych ti dal t�ch 100 nuget� pro str�e?";
};

FUNC INT DIA_Dusty_Offer100Ore_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_MetMelvin))
	&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_Offer100Ore_Info()
{
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_00"); //Co kdybych ti dal t�ch 100 nuget� pro str�e?
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_01"); //To bys ud�lal? Pro�?
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_02"); //Dobr�, �ekn�me, �e nejsi jedin�, kdo by se cht�l do Sektovn�ho t�bora pod�vat.
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_03"); //Tak�e ty chce� j�t se mnou?
};

// **************************************************
// 				Ich gehe mit dir
// **************************************************

INSTANCE DIA_Dusty_IWouldGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_IWouldGo_Condition;
	information		= DIA_Dusty_IWouldGo_Info;
	permanent		= 0;
	description		= "P�JDU s tebou do Sektovn�ho t�bora.";
};

FUNC INT DIA_Dusty_IWouldGo_Condition()
{	
	if (Npc_KnowsInfo(hero, DIA_Dusty_Offer100Ore))
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_IWouldGo_Info()
{
	AI_Output	(other, self,"DIA_Dusty_IWouldGo_15_00"); //P�JDU s tebou do Sektovn�ho t�bora.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_01"); //V�born�, �lov��e! Jsem p�ipraven. M��eme vyrazit, jakmile bude� cht�t.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_02"); //Ale nezapome� - pot�ebujeme t�ch 100 nuget� pro str�e.

	B_LogEntry	(CH1_RecruitDusty,"Poda�ilo se mi p�esv�d�it kop��e Dustyho, aby se p�idal do T�bora v ba�in�ch. Budu ale muset uplatit str�e n�jakou rudou. Nejlep�� bude, kdy� ho p�ivedu p��mo k Baalu Tondralovi.");
	B_GiveXP	(XP_DustyJoined);
};

// **************************************************
// 				Lass uns gehen
// **************************************************
var int Dusty_LetsGo;
// **************************************************

INSTANCE DIA_Dusty_LetsGo (C_INFO)
{
	npc				= Vlk_524_Dusty;
	nr				= 1;
	condition		= DIA_Dusty_LetsGo_Condition;
	information		= DIA_Dusty_LetsGo_Info;
	permanent		= 1;
	description		= "Jsem p�ipraven - jdeme!";
};

FUNC INT DIA_Dusty_LetsGo_Condition()
{	
	if	(Npc_KnowsInfo(hero, DIA_Dusty_IWouldGo))
	&&	(Npc_GetDistToWP(hero, "OCR_MAINGATE_INSIDE") > 1500)
	&&	(Npc_GetDistToWP(hero, "OCR_NORTHGATE_RAMP_ATOP") > 1500)
	&&	(BaalTondral_GetNewGuy == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Dusty_LetsGo_Info()
{
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_00"); //Jsem p�ipraven - jdeme!
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_01"); //Dob�e - poj�me ji�n� branou - severn� br�na se ned� pou��t, str�e tam nen� mo�n� podplatit.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_02"); //Snad je ta ruda p�esv�d�� - nejsem v t�chhle v�cech moc dobr�.
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_03"); //Dobr� - poj�me!

	if	!Dusty_LetsGo
	{
		B_LogEntry(CH1_RecruitDusty,"Dusty m� varoval, abych se vyhnul severn� br�n�. Snaz�� pr� bude uplatit str�e u ji�n� br�ny.");
		Dusty_LetsGo = TRUE;
	};
	
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"FOLLOW");
	
	AI_StopProcessInfos	(self);
	
};

