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
	AI_Output (self, other,"DIA_Jarvis_EXIT_08_00"); //Uwa�aj na siebie!
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
	AI_Output (self, other,"DIA_Jarvis_First_08_00"); //Chcesz przej�� przez t� bram�?
	AI_Output (other, self,"DIA_Jarvis_First_15_01"); //A spr�bujesz mnie powstrzyma�?
	AI_Output (self, other,"DIA_Jarvis_First_08_02"); //Nie, ale powiniene� wiedzie�, co ci� tam czeka. Nie jeste� w Starym Obozie, ani w�r�d tych nawiedzonych �wir�w!
	AI_Output (other, self,"DIA_Jarvis_First_15_03"); //No i co mnie tam czeka?
	AI_Output (self, other,"DIA_Jarvis_First_08_04"); //Tutaj nie ma Cieni ani �wi�tynnych Stra�nik�w, kt�rzy wyci�gn� ci� z k�opot�w. W Nowym Obozie ka�dy musi radzi� sobie sam. Tylko my - Najemnicy - trzymamy si� razem.
};

// ************************************************************
// 						S�ldner
// ************************************************************

INSTANCE DIA_Jarvis_SldInfo (C_INFO)
{
	npc			= Sld_728_Jarvis;
	nr			= 1;
	condition	= DIA_Jarvis_SldInfo_Condition;
	information	= DIA_Jarvis_SldInfo_Info;
	permanent	= 0;
	description	= "Czym zajmuj� si� Najemnicy?";
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
	AI_Output (other, self,"DIA_Jarvis_SldInfo_15_00"); //Czym zajmuj� si� Najemnicy?
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_01"); //Jeste�my �o�nierzami w s�u�bie Mag�w Wody.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_02"); //Naszym celem jest wyrwanie si� z tej przekl�tej kolonii. Musimy ci�ko pracowa�, bo nie chcieli�my i�� na �atwizn�, jak Magnaci ze Starego Obozu, kt�rzy �eruj� na niewolniczej pracy Kopaczy.
	AI_Output (self, other,"DIA_Jarvis_SldInfo_08_03"); //I wszyscy jeste�my pos�uszni Lee. To wspania�y cz�owiek. Tylko dzi�ki niemu ten cholerny ob�z jeszcze si� nie rozpad�.
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
	description	= "Co robi� magowie?";
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
	AI_Output (other, self,"DIA_Jarvis_Magier_15_00"); //Co robi� magowie?
	AI_Output (self, other,"DIA_Jarvis_Magier_08_01"); //Badaj� magiczne w�a�ciwo�ci wydobywanej przez Krety rudy.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_02"); //O ile si� orientuj�, zamierzaj� wysadzi� w powietrze ca�y ten piekielny kopiec i zniszczy� Barier�.
	AI_Output (other, self,"DIA_Jarvis_Magier_15_03"); //To chyba niebezpiecznie.
	AI_Output (self, other,"DIA_Jarvis_Magier_08_04"); //Magowie twierdz�, �e nie mamy si� czego obawia�.
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
	description	= "Macie tutaj wielk� ha�d� rudy?";
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
	AI_Output (other, self,"DIA_Jarvis_Erzhaufen_15_00"); //Macie tutaj wielk� ha�d� rudy?
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_01"); //Aha, mo�na tak powiedzie�. Za tak� ilo�� rudy Rhobar sprzeda�by w�asn� �on�.
	AI_Output (self, other,"DIA_Jarvis_Erzhaufen_08_02"); //Ale my mamy gdzie� tego starego pierdziela. Chcemy si� st�d wydosta�!
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
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_01"); //Chcesz zobaczy� wielk� g�r� rudy, co? Na �rodku jaskini jest dziura. Tam wszystko zrzucaj�.
	AI_Output (self, other,"DIA_Jarvis_WoHaufen_08_02"); //Ale nie pozwol� ci si� do niej zbli�y�, m�wi� ci. Magowie i nasi ludzie pilnuj� rudy dniem i noc�.
	AI_Output (other, self,"DIA_Jarvis_WoHaufen_15_03"); //Pyta�em z ciekawo�ci.
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
	description	= "A co z innymi lud�mi?";
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
	AI_Output (other, self,"DIA_Jarvis_Rest_15_00"); //A co z innymi lud�mi?
	AI_Output (self, other,"DIA_Jarvis_Rest_08_01"); //Szumowiny, bez wyj�tku. Maj� gdzie� ten Ob�z. Ju� wola�bym, �eby byle zbieracze ry�u pilnowali bramy.
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
	description	= "Co s�ycha� w Obozie?";
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
	AI_Output (other, self,"DIA_Jarvis_PERM_15_00"); //Co s�ycha� w Obozie?
	AI_Output (self, other,"DIA_Jarvis_PERM_08_01"); //Krety nadal pracuj�. Kiedy uzbieraj� do�� rudy, wysadzimy j� w powietrze.
};

/*------------------------------------------------------------------------
//							S�LDNERAUFNAHME									//
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
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_01"); //Hej, s�ysza�em, �e nie�le da�e� popali� pe�zaczom z kopalni!
	AI_Output (self, other,"Sld_728_Jarvis_AUFNAHMESOLDIER_Info_08_02"); //Lee pewnie zgodzi si� przyj�� ci� do Najemnik�w. Powiniene� z nim pogada�.

	self.flags = 0;		// Immortal-Flag l�schen

	Log_CreateTopic (GE_BecomeMercenary,LOG_NOTE);
	B_LogEntry (GE_BecomeMercenary,"Powinienem porozmawia� z Lee. Mo�e pozwoli mi do��czy� do Najemnik�w.");
};






	


