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
	AI_Output (self, other,"DIA_Dusty_Hello_03_01"); //Jdi pryè! Za poslední dva týdny jsem se v dolech sedøel k smrti. A co z toho?
	AI_Output (self, other,"DIA_Dusty_Hello_03_02"); //Nìjakej blbej kus rudy, to je všechno. Vìtšinu z toho utratím za jídlo.
	AI_Output (self, other,"DIA_Dusty_Hello_03_03"); //Mluvil jsem s Baalem Parvezem. Øekl mi o Sektovním táboøe nìkolik zajímavých vìcí.
	AI_Output (self, other,"DIA_Dusty_Hello_03_04"); //Myslím, že by bylo lepší pøejít tam, než tady dál otroèit na Gomeze.
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
	description		= "Tobì se tady nelíbí? Proè teda neodejdeš?";
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
	AI_Output (other, self,"DIA_Dusty_WhyNotLeave_15_00"); //Tobì se tady nelíbí? Proè teda neodejdeš?
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_01"); //Protože si nejsem úplnì jistý, co tam mùžu oèekávat. Mìl jsem tady kamaráda - jmenoval se Melvin. Odešel pøed týdnem do Sektovního tábora.
	AI_Output (self, other,"DIA_Dusty_WhyNotLeave_03_02"); //Od té doby jsem o nìm neslyšel. A dokud o nìm nedostanu zprávu, zùstanu tady!

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,"Dusty, kopáè ze Starého tábora, už je dlouho nespokojen se zdejším životem. Pøemýšlí o tom, že se pøidá k Bratrstvu v bažinách.");
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
	description		= "Byl jsem v Sektovním táboøe a setkal se s Melvinem.";
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
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_00"); //Byl jsem v Sektovním táboøe a setkal se s Melvinem.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_01"); //No a? Co øíkal?
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_02"); //Oèividnì mu to vyhovovalo líp, než se nechat utlaèovat od stráží.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_03"); //No, tìbuch! To si tu celou radost nechává sám pro sebe? Musím tam jít. Ale z tohohle tábora se nikdy nedostanu..
	AI_Output (other, self,"DIA_Dusty_MetMelvin_15_04"); //Vážnì? Proè ne?
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_05"); //Stráže zjistily, že jsem chtìl odejít, protože jsem asi moc mluvil.
	AI_Output (self, other,"DIA_Dusty_MetMelvin_03_06"); //Potøebuju aspoò 100 nugetù na uplacení stráží.
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
	description		= "Co kdybych ti dal tìch 100 nugetù pro stráže?";
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
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_00"); //Co kdybych ti dal tìch 100 nugetù pro stráže?
	AI_Output (self, other,"DIA_Dusty_Offer100Ore_03_01"); //To bys udìlal? Proè?
	AI_Output (other, self,"DIA_Dusty_Offer100Ore_15_02"); //Dobrá, øeknìme, že nejsi jediný, kdo by se chtìl do Sektovního tábora podívat.
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
	description		= "PÙJDU s tebou do Sektovního tábora.";
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
	AI_Output	(other, self,"DIA_Dusty_IWouldGo_15_00"); //PÙJDU s tebou do Sektovního tábora.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_01"); //Výbornì, èlovìèe! Jsem pøipraven. Mùžeme vyrazit, jakmile budeš chtít.
	AI_Output	(self, other,"DIA_Dusty_IWouldGo_03_02"); //Ale nezapomeò - potøebujeme tìch 100 nugetù pro stráže.

	B_LogEntry	(CH1_RecruitDusty,"Podaøilo se mi pøesvìdèit kopáèe Dustyho, aby se pøidal do Tábora v bažinách. Budu ale muset uplatit stráže nìjakou rudou. Nejlepší bude, když ho pøivedu pøímo k Baalu Tondralovi.");
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
	description		= "Jsem pøipraven - jdeme!";
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
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_00"); //Jsem pøipraven - jdeme!
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_01"); //Dobøe - pojïme jižní branou - severní brána se nedá použít, stráže tam není možné podplatit.
	AI_Output (self, other,"DIA_Dusty_LetsGo_03_02"); //Snad je ta ruda pøesvìdèí - nejsem v tìchhle vìcech moc dobrý.
	AI_Output (other, self,"DIA_Dusty_LetsGo_15_03"); //Dobrá - pojïme!

	if	!Dusty_LetsGo
	{
		B_LogEntry(CH1_RecruitDusty,"Dusty mì varoval, abych se vyhnul severní bránì. Snazší prý bude uplatit stráže u jižní brány.");
		Dusty_LetsGo = TRUE;
	};
	
	self.flags = NPC_FLAG_IMMORTAL;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,"FOLLOW");
	
	AI_StopProcessInfos	(self);
	
};

