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
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //Uwa¿aj na siebie!
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
	AI_Output (self, other,"DIA_Jarvis_First_08_00"); //Chcesz przejœæ przez tê bramê?
	AI_Output (other, self,"DIA_Jarvis_First_15_01"); //A spróbujesz mnie powstrzymaæ?
	AI_Output (self, other,"DIA_Jarvis_First_08_02"); //Nie, ale powinieneœ wiedzieæ, co ciê tam czeka. Nie jesteœ w Starym Obozie, ani wœród tych nawiedzonych œwirów!
	AI_Output (other, self,"DIA_Jarvis_First_15_03"); //No i co mnie tam czeka?
	AI_Output (self, other,"DIA_Jarvis_First_08_04"); //Tutaj nie ma Cieni ani Œwi¹tynnych Stra¿ników, którzy wyci¹gn¹ ciê z k³opotów. W Nowym Obozie ka¿dy musi radziæ sobie sam. Tylko my - Najemnicy - trzymamy siê razem.
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
	description	= "Czym zajmuj¹ siê Najemnicy?";
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
	AI_Output (other, self,"DIA_Jarvis_SldInfo_15_00"); //Czym zajmuj¹ siê Najemnicy?
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_01"); //Jesteœmy ¿o³nierzami w s³u¿bie Magów Wody.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_02"); //Naszym celem jest wyrwanie siê z tej przeklêtej kolonii. Musimy ciê¿ko pracowaæ, bo nie chcieliœmy iœæ na ³atwiznê, jak Magnaci ze Starego Obozu, którzy ¿eruj¹ na niewolniczej pracy Kopaczy.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_03"); //I wszyscy jesteœmy pos³uszni Lee. To wspania³y cz³owiek. Tylko dziêki niemu ten cholerny obóz jeszcze siê nie rozpad³.
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
	description	= "Co robi¹ magowie?";
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
	AI_Output (other, self,"DIA_Jarvis_Magier_15_00"); //Co robi¹ magowie?
	AI_Output (self, other,"DIA_Jarvis_Magier_08_01"); //Badaj¹ magiczne w³aœciwoœci wydobywanej przez Krety rudy.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_02"); //O ile siê orientujê, zamierzaj¹ wysadziæ w powietrze ca³y ten piekielny kopiec i zniszczyæ Barierê.
	AI_Output (other, self,"DIA_Jarvis_Magier_15_03"); //To chyba niebezpiecznie.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_04"); //Magowie twierdz¹, ¿e nie mamy siê czego obawiaæ.
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
	description	= "Macie tutaj wielk¹ ha³dê rudy?";
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
	AI_Output (other, self,"DIA_Jarvis_Erzhaufen_15_00"); //Macie tutaj wielk¹ ha³dê rudy?
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_01"); //Aha, mo¿na tak powiedzieæ. Za tak¹ iloœæ rudy Rhobar sprzeda³by w³asn¹ ¿onê.
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_02"); //Ale my mamy gdzieœ tego starego pierdziela. Chcemy siê st¹d wydostaæ!
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
	description	= "Gdzie jest ten kopiec?";
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
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_00"); //Gdzie jest ten kopiec?
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_01"); //Chcesz zobaczyæ wielk¹ górê rudy, co? Na œrodku jaskini jest dziura. Tam wszystko zrzucaj¹.
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_02"); //Ale nie pozwol¹ ci siê do niej zbli¿yæ, mówiê ci. Magowie i nasi ludzie pilnuj¹ rudy dniem i noc¹.
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_03"); //Pyta³em z ciekawoœci.
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
	description	= "A co z innymi ludŸmi?";
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
	AI_Output (other, self,"DIA_Jarvis_Rest_15_00"); //A co z innymi ludŸmi?
	AI_Output (self, other,"DIA_Jarvis_Rest_08_01"); //Szumowiny, bez wyj¹tku. Maj¹ gdzieœ ten Obóz. Ju¿ wola³bym, ¿eby byle zbieracze ry¿u pilnowali bramy.
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
	description	= "Co s³ychaæ w Obozie?";
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
	AI_Output (other, self,"DIA_Jarvis_PERM_15_00"); //Co s³ychaæ w Obozie?
	AI_Output (self, other,"DIA_Jarvis_PERM_08_01"); //Krety nadal pracuj¹. Kiedy uzbieraj¹ doœæ rudy, wysadzimy j¹ w powietrze.
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
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Hej, s³ysza³em, ¿e nieŸle da³eœ popaliæ pe³zaczom z kopalni!
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Lee pewnie zgodzi siê przyj¹æ ciê do Najemników. Powinieneœ z nim pogadaæ.

	self.flags = 0;		// Immortal-Flag löschen

	Log_CreateTopic (GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry (GE_BecomeMercenary,"Powinienem porozmawiaæ z Lee. Mo¿e pozwoli mi do³¹czyæ do Najemników.");
};






	


