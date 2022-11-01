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
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //Uważaj na siebie!
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
	AI_Output (self, other,"DIA_Jarvis_First_08_00"); //Chcesz przejść przez tę bramę?
	AI_Output (other, self,"DIA_Jarvis_First_15_01"); //A spróbujesz mnie powstrzymać?
	AI_Output (self, other,"DIA_Jarvis_First_08_02"); //Nie, ale powinieneś wiedzieć, co cię tam czeka. Nie jesteś w Starym Obozie, ani wśród tych nawiedzonych świrów!
	AI_Output (other, self,"DIA_Jarvis_First_15_03"); //No i co mnie tam czeka?
	AI_Output (self, other,"DIA_Jarvis_First_08_04"); //Tutaj nie ma Cieni ani Świątynnych Strażników, którzy wyciągną cię z kłopotów. W Nowym Obozie każdy musi radzić sobie sam. Tylko my - Najemnicy - trzymamy się razem.
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
	description	= "Czym zajmują się Najemnicy?";
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
	AI_Output (other, self,"DIA_Jarvis_SldInfo_15_00"); //Czym zajmują się Najemnicy?
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_01"); //Jesteśmy żołnierzami w służbie Magów Wody.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_02"); //Naszym celem jest wyrwanie się z tej przeklętej kolonii. Musimy ciężko pracować, bo nie chcieliśmy iść na łatwiznę, jak Magnaci ze Starego Obozu, którzy żerują na niewolniczej pracy Kopaczy.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_03"); //I wszyscy jesteśmy posłuszni Lee. To wspaniały człowiek. Tylko dzięki niemu ten cholerny obóz jeszcze się nie rozpadł.
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
	description	= "Co robią magowie?";
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
	AI_Output (other, self,"DIA_Jarvis_Magier_15_00"); //Co robią magowie?
	AI_Output (self, other,"DIA_Jarvis_Magier_08_01"); //Badają magiczne właściwości wydobywanej przez Krety rudy.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_02"); //O ile się orientuję, zamierzają wysadzić w powietrze cały ten piekielny kopiec i zniszczyć Barierę.
	AI_Output (other, self,"DIA_Jarvis_Magier_15_03"); //To chyba niebezpiecznie.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_04"); //Magowie twierdzą, że nie mamy się czego obawiać.
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
	description	= "Macie tutaj wielką hałdę rudy?";
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
	AI_Output (other, self,"DIA_Jarvis_Erzhaufen_15_00"); //Macie tutaj wielką hałdę rudy?
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_01"); //Aha, można tak powiedzieć. Za taką ilość rudy Rhobar sprzedałby własną żonę.
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_02"); //Ale my mamy gdzieś tego starego pierdziela. Chcemy się stąd wydostać!
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
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_01"); //Chcesz zobaczyć wielką górę rudy, co? Na środku jaskini jest dziura. Tam wszystko zrzucają.
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_02"); //Ale nie pozwolą ci się do niej zbliżyć, mówię ci. Magowie i nasi ludzie pilnują rudy dniem i nocą.
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_03"); //Pytałem z ciekawości.
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
	description	= "A co z innymi ludźmi?";
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
	AI_Output (other, self,"DIA_Jarvis_Rest_15_00"); //A co z innymi ludźmi?
	AI_Output (self, other,"DIA_Jarvis_Rest_08_01"); //Szumowiny, bez wyjątku. Mają gdzieś ten Obóz. Już wolałbym, żeby byle zbieracze ryżu pilnowali bramy.
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
	description	= "Co słychać w Obozie?";
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
	AI_Output (other, self,"DIA_Jarvis_PERM_15_00"); //Co słychać w Obozie?
	AI_Output (self, other,"DIA_Jarvis_PERM_08_01"); //Krety nadal pracują. Kiedy uzbierają dość rudy, wysadzimy ją w powietrze.
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
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Hej, słyszałem, że nieźle dałeś popalić pełzaczom z kopalni!
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Lee pewnie zgodzi się przyjąć cię do Najemników. Powinieneś z nim pogadać.

	self.flags = 0;		// Immortal-Flag löschen

	Log_CreateTopic (GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry (GE_BecomeMercenary,"Powinienem porozmawiać z Lee. Może pozwoli mi dołączyć do Najemników.");
};






	


