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
	description		= "Zdar! Jsem tady nový - jak to jde?";
};

FUNC INT DIA_Dusty_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Dusty_Hello_Info()
{
	AI_Output (other, self,"DIA_Dusty_Hello_15_00"); //Zdar! Jsem tady nový - jak to jde?
	AI_Output (self, other,"DIA_Dusty_Hello_03_01"); //Jdi pryč! Za poslední dva týdny jsem se v dolech sedřel k smrti. A co z toho?
	AI_Output (self, other,"DIA_Dusty_Hello_03_02"); //Nějakej blbej kus rudy, to je všechno. Většinu z toho utratím za jídlo.
	AI_Output (self, other,"DIA_Dusty_Hello_03_03"); //Mluvil jsem s Baalem Parvezem. Řekl mi o Sektovním táboře několik zajímavých věcí.
	AI_Output (self, other,"DIA_Dusty_Hello_03_04"); //Myslím, že by bylo lepší přejít tam, než tady dál otročit na Gomeze.
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
	description		= "Tobě se tady nelíbí? Proč teda neodejdeš?";
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
	AI_Output (other, self,"DIA_Dusty_WhyNotLeave_15_00"); //Tobě se tady nelíbí? Proč teda neodejdeš?
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_01"); //Protože si nejsem úplně jistý, co tam můžu očekávat. Měl jsem tady kamaráda - jmenoval se Melvin. Odešel před týdnem do Sektovního tábora.
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_02"); //Od té doby jsem o něm neslyšel. A dokud o něm nedostanu zprávu, zůstanu tady!

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Dusty, kopáč ze Starého tábora, už je dlouho nespokojen se zdejším životem. Přemýšlí o tom, že se přidá k Bratrstvu v bažinách.");
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
	description		= "Byl jsem v Sektovním táboře a setkal se s Melvinem.";
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
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_00"); //Byl jsem v Sektovním táboře a setkal se s Melvinem.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_01"); //No a? Co říkal?
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_02"); //Očividně mu to vyhovovalo líp, než se nechat utlačovat od stráží.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_03"); //No, těbuch! To si tu celou radost nechává sám pro sebe? Musím tam jít. Ale z tohohle tábora se nikdy nedostanu..
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_04"); //Vážně? Proč ne?
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_05"); //Stráže zjistily, že jsem chtěl odejít, protože jsem asi moc mluvil.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_06"); //Potřebuju aspoň 100 nugetů na uplacení stráží.
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
	description		= "Co kdybych ti dal těch 100 nugetů pro stráže?";
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
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_00"); //Co kdybych ti dal těch 100 nugetů pro stráže?
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_01"); //To bys udělal? Proč?
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_02"); //Dobrá, řekněme, že nejsi jediný, kdo by se chtěl do Sektovního tábora podívat.
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_03"); //Takže ty chceš jít se mnou?
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
	description		= "PŮJDU s tebou do Sektovního tábora.";
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
	AI_Output	(other, self,"DIA_Dusty_IWouldGo_15_00"); //PŮJDU s tebou do Sektovního tábora.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_01"); //Výborně, člověče! Jsem připraven. Můžeme vyrazit, jakmile budeš chtít.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_02"); //Ale nezapomeň - potřebujeme těch 100 nugetů pro stráže.

	B_LogEntry	(CH1_RecruitDusty,"Podařilo se mi přesvědčit kopáče Dustyho, aby se přidal do Tábora v bažinách. Budu ale muset uplatit stráže nějakou rudou. Nejlepší bude, když ho přivedu přímo k Baalu Tondralovi.");
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
	description		= "Jsem připraven - jdeme!";
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
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_00"); //Jsem připraven - jdeme!
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_01"); //Dobře - pojďme jižní branou - severní brána se nedá použít, stráže tam není možné podplatit.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_02"); //Snad je ta ruda přesvědčí - nejsem v těchhle věcech moc dobrý.
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_03"); //Dobrá - pojďme!

	if	!Dusty_LetsGo
	{
		B_LogEntry(CH1_RecruitDusty,"Dusty mě varoval, abych se vyhnul severní bráně. Snazší prý bude uplatit stráže u jižní brány.");
		Dusty_LetsGo = TRUE;
	};
	
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"FOLLOW");
	
	AI_StopProcessInfos	(self);
	
};

