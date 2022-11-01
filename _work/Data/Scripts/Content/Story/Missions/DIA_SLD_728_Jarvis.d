// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE DIA_Jarvis_EXIT (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 999;
	condition	= DIA_Jarvis_EXIT_Condition;
	information	= DIA_Jarvis_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jarvis_EXIT_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_EXIT_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //Hlídej si záda!
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						First
// ************************************************************

INSTANCE DIA_Jarvis_First (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_First_Condition;
	information	= DIA_Jarvis_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Jarvis_First_Condition()
{
	return 1;
};

FUNC VOID DIA_Jarvis_First_Info()
{	
	AI_Output (self, other,"DIA_Jarvis_First_08_00"); //Máš v úmyslu projít touhle branou?
	AI_Output (other, self,"DIA_Jarvis_First_15_01"); //Máš v úmyslu mě zastavit?
	AI_Output (self, other,"DIA_Jarvis_First_08_02"); //Ne, ale měl bys vědět, co tě čeká. Tady to není jako ve Starém táboře nebo jako u těch sektářských bláznů!
	AI_Output (other, self,"DIA_Jarvis_First_15_03"); //A co mě tu čeká?
	AI_Output (self, other,"DIA_Jarvis_First_08_04"); //Tady nejsou žádní strážci ani templáři, kteří by na tebe dohlídli. Tady jedná každý sám za sebe a jediní, kdo spolu drží, jsme my, žoldáci.
};

// ************************************************************
// 						Söldner
// ************************************************************

INSTANCE DIA_Jarvis_SldInfo (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_SldInfo_Condition;
	information	= DIA_Jarvis_SldInfo_Info;
	permanent	= 0;
	description	= "Co dělají žoldáci?";
};                       

FUNC INT DIA_Jarvis_SldInfo_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_SldInfo_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_SldInfo_15_00"); //Co dělají žoldáci?
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_01"); //My - my jsme žoldáci mágů Vody.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_02"); //Náš cíl je dostat se odtud. Tvrdě na tom pracujeme a nevidíme věci tak snadno jako ti hoši ze Starého tábora, kteří si užívají dobrých časů na zádech svých kopáčů.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_03"); //Všichni jdeme za Leem. Je to velký muž. Muž, který drží tenhle proklatý tábor pohromadě.
};

// ************************************************************
// 						Magier
// ************************************************************

INSTANCE DIA_Jarvis_Magier (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Magier_Condition;
	information	= DIA_Jarvis_Magier_Info;
	permanent	= 0;
	description	= "Co dělají mágové?";
};                       

FUNC INT DIA_Jarvis_Magier_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_SldInfo))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Magier_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Magier_15_00"); //Co dělají mágové?
	AI_Output (self, other,"DIA_Jarvis_Magier_08_01"); //Zkoumají magické vlastnosti rudy, kterou naši rudaři vytěžili v dolu.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_02"); //Co já vím, chtějí vyhodit celou tu zpropadenou rudnou haldu do povětří, aby se osvobodili z Bariéry.
	AI_Output (other, self,"DIA_Jarvis_Magier_15_03"); //To vypadá nebezpečně.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_04"); //Říkali, abysme se neznepokojovali.
};

// ************************************************************
// 						Erzhaufen
// ************************************************************

INSTANCE DIA_Jarvis_Erzhaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_Erzhaufen_Condition;
	information	= DIA_Jarvis_Erzhaufen_Info;
	permanent	= 0;
	description	= "Máte tady velkou rudnou haldu?";
};                       

FUNC INT DIA_Jarvis_Erzhaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Erzhaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Erzhaufen_15_00"); //Máte tady velkou rudnou haldu?
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_01"); //Dalo by se tak říci. Mohli bysme za to koupit královu ženu.
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_02"); //My se ale nestaráme o žádný proklatý obchod s rudou s tím starým páprdou. My se chceme ODTUD DOSTAT!
};

// ************************************************************
// 						Wo Haufen
// ************************************************************

INSTANCE DIA_Jarvis_WoHaufen (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 2;
	condition	= DIA_Jarvis_WoHaufen_Condition;
	information	= DIA_Jarvis_WoHaufen_Info;
	permanent	= 0;
	description	= "Kde je rudná halda?";
};                       

FUNC INT DIA_Jarvis_WoHaufen_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Erzhaufen))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_WoHaufen_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_00"); //Kde je rudná halda?
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_01"); //Chceš vidět opravdovou haldu rudy, viď? Uprostřed jeskyně je velká díra, do které to všechno ukládají.
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_02"); //Ale blízko se k ní nedostaneš, to ti povídám. Mágové a naši lidé ji střeží ve dne v noci.
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_03"); //Byl jsem zvědavý.
};

// ************************************************************
// 						Rest
// ************************************************************

INSTANCE DIA_Jarvis_Rest (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 3;
	condition	= DIA_Jarvis_Rest_Condition;
	information	= DIA_Jarvis_Rest_Info;
	permanent	= 0;
	description	= "A co zbytek lidí?";
};                       

FUNC INT DIA_Jarvis_Rest_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_First))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_Rest_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_Rest_15_00"); //A co zbytek lidí?
	AI_Output (self, other,"DIA_Jarvis_Rest_08_01"); //Všechno darebáci. Ti se o ten zpropadenej tábor nestarají. Raději bych měl před branou rolnickou stráž.
};

// ************************************************************
// 						PERM
// ************************************************************

INSTANCE DIA_Jarvis_PERM (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 10;
	condition	= DIA_Jarvis_PERM_Condition;
	information	= DIA_Jarvis_PERM_Info;
	permanent	= 1;
	description	= "Tak jak to jde?";
};                       

FUNC INT DIA_Jarvis_PERM_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Jarvis_Magier))
	{
		return 1;
	};
};

FUNC VOID DIA_Jarvis_PERM_Info()
{	
	AI_Output (other, self,"DIA_Jarvis_PERM_15_00"); //Tak jak to jde?
	AI_Output (self, other,"DIA_Jarvis_PERM_08_01"); //Rudaři pořád těží. Až budeme mít dost rudy, tak tu haldu odpálíme.
};

/*------------------------------------------------------------------------
//							SÖLDNERAUFNAHME									//
------------------------------------------------------------------------*/
instance Sld_728_Jarvis_AUFNAHMESOLDIER (C_INFO)
{
	npc				= Sld_728_Jarvis;
	condition		= Sld_728_Jarvis_AUFNAHMESOLDIER_Condition;
	information		= Sld_728_Jarvis_AUFNAHMESOLDIER_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  Sld_728_Jarvis_AUFNAHMESOLDIER_Condition()
{	
	if ( Npc_GetTrueGuild  (hero) == GIL_ORG) 
	&& ( (Npc_HasItems (hero, ItAt_Crawlerqueen) >= 1) || (CorKalom_BringMCQBalls == LOG_SUCCESS) )
	&& (Npc_GetDistToNpc (hero,self) < 1000)
	{
		return TRUE;
	};
};
func void  Sld_728_Jarvis_AUFNAHMESOLDIER_Info()
{
	AI_GotoNpc (hero,self); 
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Hej, slyšel jsem, že jsi v dolech pořádně zatopil důlním červům.
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Lee by tě byl docela ochotný přijmout za žoldáka. Promluv s ním.

	self.flags = 0;		// Immortal-Flag löschen

	Log_CreateTopic (GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry (GE_BecomeMercenary,"Měl bych si promluvit s Leem. Možná mi dovolí přidat se k žoldákům.");
};






	


