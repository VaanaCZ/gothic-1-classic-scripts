//***************************************************************************
//	Info EXIT
//***************************************************************************

INSTANCE Info_Gorn_EXIT (C_INFO)
{
	npc			= PC_Fighter;
	nr   		= 999;
	condition	= Info_Gorn_EXIT_Condition;
	information	= Info_Gorn_EXIT_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Gorn_EXIT_Condition()
{
	return 1;
};

func VOID Info_Gorn_EXIT_Info()
{
	if	self.aivar[AIV_PARTYMEMBER]
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_01"); //Do boje!
	}
	else
	{
		AI_Output (self, other,"Info_Gorn_EXIT_09_02"); //Je�t� se uvid�me.
	};
	
	AI_StopProcessInfos	( self );
};

//*************************************
//			1. Begr��ung
//*************************************

instance DIA_Gorn_First (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_First_Condition;
	information		= Dia_Gorn_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC int DIA_Gorn_First_Condition()
{
	if	(Kapitel < 3)
	{
		return 1;
	};
};

func void DIA_Gorn_First_Info()
{
	AI_Output (self, other,"DIA_Gorn_First_09_00"); //Hej. Nov� tv��.
	AI_Output (other, self,"DIA_Gorn_First_15_01"); //Kdo jsi?
	AI_Output (self, other,"DIA_Gorn_First_09_02"); //Jsem Gorn, �old�k m�g�.
};

//*************************************
//				Leben
//*************************************

instance DIA_Gorn_Leben (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 2;
	condition		= Dia_Gorn_Leben_Condition;
	information		= Dia_Gorn_Leben_Info;
	permanent		= 0;
	description		= "Co mus� d�lat jako �old�k m�g�?";
};

FUNC int DIA_Gorn_Leben_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Leben_Info()
{
	AI_Output (other, self,"DIA_Gorn_Leben_15_00"); //Co mus� d�lat jako �old�k m�g�?
	AI_Output (self, other,"DIA_Gorn_Leben_09_01"); //Lee uzav�el s m�gy smlouvu. Pronaj�m� nejlep�� bojovn�ky, jak� je mo�n� v kolonii naj�t. Tedy n�s.
	AI_Output (self, other,"DIA_Gorn_Leben_09_02"); //Star�me se o to, aby ruda�i mohli t�it rudu a nebyli p�itom obt�ov�ni a chr�n�me m�gy p�ed nesn�zemi.
	AI_Output (self, other,"DIA_Gorn_Leben_09_03"); //M�gov� se postaraj�, abychom odsud mohli odej�t. A my dost�v�me mal� pod�l rudy jako plat.
};

//*************************************
//			H�tte (Shrike)
//*************************************
	var int Gorn_ShrikesHut;
//*************************************

instance DIA_Gorn_Hut (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_Hut_Condition;
	information		= Dia_Gorn_Hut_Info;
	permanent		= 0;
	description		= "M��u tu n�kde z�stat?";
};

FUNC int DIA_Gorn_Hut_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Gorn_First))
	{
		return 1;
	};
};

func void DIA_Gorn_Hut_Info()
{
	AI_Output (other, self,"DIA_Gorn_Hut_15_00"); //M��u tu n�kde z�stat, ani� bych musel n�koho vykopnout z jeho chatr�e?
	AI_Output (self, other,"DIA_Gorn_Hut_09_01"); //Mysl�m, �e ne. Ale jestli to opravdu chce�, zajdi za Shrikem.
	AI_Output (self, other,"DIA_Gorn_Hut_09_02"); //M� chatr� �pln� vp�edu, u vchodu do jeskyn�. Byla pr�zdn� - ale vlastn� pat�ila n�m.
	AI_Output (other, self,"DIA_Gorn_Hut_15_03"); //N�m?
	AI_Output (self, other,"DIA_Gorn_Hut_09_04"); //Ano, n�m �old�k�m. �old�ci a bandit� tu �ij� zvl᚝. A nikdo z Laresovy tlupy by tady, na stran� velk� propasti, nem�l co pohled�vat.
	AI_Output (self, other,"DIA_Gorn_Hut_09_05"); //Ve skute�nosti v tom nen� velk� rozd�l. On se ale nikoho nezeptal. A t�mhle bandit�m nesm� nechat �pln� v�echno proj�t, proto�e se z nich pak stanou opravdov� nafoukanci!

	Log_CreateTopic		(CH1_ShrikesHut,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_RUNNING);
	B_LogEntry			(CH1_ShrikesHut,"�old�k Gorn mi �ekl, �e mu Shrike bez dovolen� zabral jeho chatr�. Po��dal jsem Gorna, aby nikdo ze �old�k� nezasahoval, dokud 'nep�esv�d��m' Shrika, aby si na�el jinou chatr�.");
	Gorn_ShrikesHut = LOG_RUNNING;
};

//*************************************
//			H�tte LEER (Shrike)
//*************************************

instance DIA_Gorn_HutFree (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 3;
	condition		= Dia_Gorn_HutFree_Condition;
	information		= Dia_Gorn_HutFree_Info;
	permanent		= 0;
	description		= "Shrike se p�est�hoval do jin� chatr�e.";
};

FUNC int DIA_Gorn_HutFree_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_Shrike_GetLost))
	{
		return 1;
	};
};

func void DIA_Gorn_HutFree_Info()
{
	AI_Output			(other, self,"DIA_Gorn_HutFree_15_00"); //Shrike se p�est�hoval do jin� chatr�e.
	AI_Output			(self, other,"DIA_Gorn_HutFree_09_01"); //Dob�e. Torlof mi pr�v� �ekl, �e by si cht�l s t�m chlap�kem promluvit.

	Gorn_ShrikesHut = LOG_SUCCESS;
	Log_SetTopicStatus	(CH1_ShrikesHut,	LOG_SUCCESS);
	B_LogEntry			(CH1_ShrikesHut,"Gorn byl velmi pot�en, kdy� jsem Shrika vyrazil z jeho chatr�e. Mysl�m, �e je to ten nej�estn�j�� chlap�k. M�l bych s n�m v budoucnu dr�et.");
	B_GiveXP			(XP_ReportedKickedShrike);
};

//*************************************
//			S�ldner werden
//*************************************

instance DIA_Gorn_BecomeSLD (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 5;
	condition		= Dia_Gorn_BecomeSLD_Condition;
	information		= Dia_Gorn_BecomeSLD_Info;
	permanent		= 0;
	description		= "Co mus�m ud�lat, abych se mohl p�idat k Nov�mu t�boru?";
};

FUNC int DIA_Gorn_BecomeSLD_Condition()
{
	if	Npc_KnowsInfo(hero, DIA_Gorn_First)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

func void DIA_Gorn_BecomeSLD_Info()
{
	AI_Output (other, self,"DIA_Gorn_BecomeSLD_15_00"); //Co mus�m ud�lat, abych se mohl p�idat k Nov�mu t�boru?
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_01"); //Ne� t� Lee uzn�, mus� se nau�it l�pe bojovat. Nez�le�� na tom, jakou zbra� pou��v�, ale ty s�m mus� b�t dobr�.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_02"); //Krom� toho bys m�l m�t velk� zku�enosti se zdej��m �ivotem a tak.
	AI_Output (self, other,"DIA_Gorn_BecomeSLD_09_03"); //Jestli nebude� cht�t do jin�ch t�bor�, mohl by ses zkusit p�idat k bandit�m, ne� za�ne� jako �old�k.
};

/*
//*************************************
//				PERM
//*************************************

instance DIA_Gorn_PERM (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_PERM_Condition;
	information		= Dia_Gorn_PERM_Info;
	permanent		= 1;
	description		= "";
};

FUNC int DIA_Gorn_PERM_Condition()
{
	return 1;
};

func void DIA_Gorn_PERM_Info()
{
	AI_Output (other, self,"DIA_Gorn_PERM_15_00"); //
	AI_Output (self, other,"DIA_Gorn_PERM_09_01"); //
};
*/

//*************************************
//				TRADE
//*************************************
	var int Gorn_Trade;
//*************************************

instance DIA_Gorn_TRADE (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 800;
	condition		= Dia_Gorn_TRADE_Condition;
	information		= Dia_Gorn_TRADE_Info;
	permanent		= 1;
	description		= DIALOG_TRADE;
	trade 			= 1;
};

FUNC int DIA_Gorn_TRADE_Condition()
{
	//if (Npc_KnowsInfo(hero,DIA_Gorn_DuHehler))
	//{
		//return 1; //***Man darf NICHT seine Waffe weggkaufen oder so...
	//};
};

func void DIA_Gorn_TRADE_Info()
{
	AI_Output (other, self,"DIA_Gorn_TRADE_15_00"); //M� je�t� v�c tohohle zbo��?
	AI_Output (self, other,"DIA_Gorn_TRADE_09_01"); //Spousty. Chce� ud�lat obchod?
};

//*************************************
//			DU Hehler?
//*************************************

instance DIA_Gorn_DuHehler (C_INFO)
{
	npc				= PC_Fighter;
	nr				= 1;
	condition		= Dia_Gorn_DuHehler_Condition;
	information		= Dia_Gorn_DuHehler_Info;
	permanent		= 0;
	description		= "Pro� ses z��astnil �toku t� tlupy?";
};

FUNC int DIA_Gorn_DuHehler_Condition()
{
	if (Npc_KnowsInfo(hero,ORG_801_Lares_BringListAnteil))
	{
		return 1;
	};
};

func void DIA_Gorn_DuHehler_Info()
{
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_00"); //Pro� ses z��astnil �toku t� tlupy?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_01"); //Kdo to ��kal?
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_02"); //Kde bys teda potom vzal tolik toho zbo��, kdyby to nebyla pravda?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_03"); //Nemysli si, �e je to v�echno z JEDN� v�rky.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_04"); //��astnil ses �tok� pravideln�?
	AI_Output (self, other,"DIA_Gorn_DuHehler_09_05"); //Kdyby ano, tak bych ti to stejn� ne�ekl. Leeovi by se to pranic nel�bilo.
	AI_Output (other, self,"DIA_Gorn_DuHehler_15_06"); //Aha.
	
	CreateInvItems(self, ItFoApple, 21);
	B_GiveInvItems	(self,other, ItFoApple,21); //Notwendig f�r Screenausgabe
	Npc_RemoveInvItems (other, ItFoApple,21);
	
	CreateInvItems(other, ItMw_1H_LightGuardsSword_03, 1);
	CreateInvItems(other, ItFoApple, 5);
	CreateInvItems(other, ItFoLoaf, 5);
	CreateInvItems(other, ItFoCheese, 5);
	CreateInvItems(other, ItFoBeer, 5);
};







//#####################################################################
//##
//##
//##							KAPITEL 3
//##
//##
//#####################################################################

//***************************************************************************
//	Info NCWAIT
//***************************************************************************
INSTANCE Info_Gorn_NCWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 1;
	condition	= Info_Gorn_NCWAIT_Condition;
	information	= Info_Gorn_NCWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_NCWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"NC_PATH52")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_NCWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_NCWAIT_09_01"); //�hh, to jsi ty! M�j p��tel Lester z t�bora z ba�in mi �ekl v�echno o tom, cos tam d�lal.
	AI_Output (self, other,"Info_Gorn_NCWAIT_09_02"); //Na n�koho, kdo tu je�t� nen� dlouho, m� u� docela rozhled.
	AI_Output (other, self,"Info_Gorn_NCWAIT_15_03"); //U� jsem m�l taky p�rkr�t nam�le, abych se nestal �r�dlem pro �ervy.
};

//***************************************************************************
//	Info MAGES
//***************************************************************************
INSTANCE Info_Gorn_MAGES (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MAGES_Condition;
	information	= Info_Gorn_MAGES_Info;
	important	= 0;	
	permanent	= 0;
	description	= "M�m d�le�itou zpr�vu pro m�gy Vody!";
};                       

FUNC INT Info_Gorn_MAGES_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_NCWAIT))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MAGES_Info()
{
	AI_Output (other, self,"Info_Gorn_MAGES_15_01"); //M�m d�le�itou zpr�vu pro m�gy Vody!
	AI_Output (self, other,"Info_Gorn_MAGES_09_02"); //Pak bys m�l mluvit se Saturasem. Je nejvy��� z m�g� Vody a cel� dny tr�v� studiemi n�jak�ch p�semnost� nebo tak.
	AI_Output (self, other,"Info_Gorn_MAGES_09_03"); //Bez ohledu na z�va�nost t� zpr�vy t� v�ak str�e z horn� roviny za n�m nepust�.
	AI_Output (other, self,"Info_Gorn_MAGES_15_04"); //Nem��e� se za m� p�imluvit?
	AI_Output (self, other,"Info_Gorn_MAGES_09_05"); //J� ne, ale Cronos, str�ce rudy, by ti mohl ud�lit povolen�.
};

//***************************************************************************
//	Info CRONOS
//***************************************************************************
INSTANCE Info_Gorn_CRONOS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_CRONOS_Condition;
	information	= Info_Gorn_CRONOS_Info;
	important	= 0;	
	permanent	= 0;
	description	= "Kde najdu toho 'str�ce rudy'?";
};                       

FUNC INT Info_Gorn_CRONOS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_MAGES))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_CRONOS_Info()
{
	AI_Output			(other, self,"Info_Gorn_CRONOS_15_01"); //Kde najdu toho 'str�ce rudy'?
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_01a");//Kdy� vyjde� odtud, projde� velkou obytnou jeskyn� za hr�z�.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_02"); //Cronos obvykle b�v� u m��e p�ed velkou haldou rudy.
	AI_Output			(self, other,"Info_Gorn_CRONOS_09_03"); //Je ale trochu arogantn�. Bude� ho muset p�esv�d�it, �e je tv� zpr�va d�le�it�.

	VAR C_NPC Cronos;
	Cronos = Hlp_GetNpc(KdW_604_Cronos);
	Cronos.aivar[AIV_FINDABLE] = TRUE;
	
	B_LogEntry		(CH3_EscapePlanNC,"Gorn mi poradil, abych �el p��mo za nejvy���m m�gem Vody, Saturasem. Cronos, dr�itel rudy, m� vyslechne. Cronose je mo�n� naj�t v chr�mu u m��e nad rudnou haldou."); 

	Npc_ExchangeRoutine	(self, "start");
};

//***************************************************************************
//	Info RUINWAIT
//***************************************************************************
INSTANCE Info_Gorn_RUINWAIT (C_INFO)
{
	npc			= PC_Fighter;
	nr			= 2;
	condition	= Info_Gorn_RUINWAIT_Condition;
	information	= Info_Gorn_RUINWAIT_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWAIT_Condition()
{
	if (Npc_GetDistToWP(self,"OW_PATH_ABYSS_4")<1000)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWAIT_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_01"); //Zdar, zelen��i. Jak vid�, kolonie je mal� vesnice.
	AI_Output	(self, other,"Info_Gorn_RUINWAIT_09_02"); //Nen� mo�n� j�t a nikoho nepotkat.
};

//***************************************************************************
//	Info RUINWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWHAT_Condition;
	information	= Info_Gorn_RUINWHAT_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co tady d�l�?";
};                       

FUNC INT Info_Gorn_RUINWHAT_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWHAT_Info()
{
	AI_Output 		(other, self,"Info_Gorn_RUINWHAT_15_01"); //Co tady d�l�?
	AI_Output		(self, other,"Info_Gorn_RUINWHAT_09_02"); //Och, pokou��m se vystopovat starou legendu.
	AI_Output		(other, self,"Info_Gorn_RUINWHAT_15_03"); //Legendu?
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_04"); //Ano, Milten, m�j kamar�d ze Star�ho t�bora, mi �ekl, �e tady kdysi �ili mni�i.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_05"); //Samoz�ejm�, u� d�vno p�edt�m, ne� tady byla Bari�ra.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_06"); //��k� se, �e uct�vali boha, kter� jim d�val moc prom��ovat se ve zv��ata.
	AI_Output 		(self, other,"Info_Gorn_RUINWHAT_09_07"); //Jsem p�esv�d�en�, �e tady jsou st�le ty poklady ze star�ch dob.

	if (!Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS))
	{	
		AI_Output	(self, other,"Info_Gorn_RUINWHAT_09_08"); //Co t� sem p�ivedlo?
	};
};

//***************************************************************************
//	Info RUINFOCUS
//***************************************************************************
INSTANCE Info_Gorn_RUINFOCUS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINFOCUS_Condition;
	information	= Info_Gorn_RUINFOCUS_Info;
	important	= 0;	
	permanent	= 0;
	description = "Hled�m magick� ohnisko.";
};                       

FUNC INT Info_Gorn_RUINFOCUS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINWAIT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINFOCUS_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_01"); //Hled�m magick� ohnisko.
	AI_Output (other, self,"Info_Gorn_RUINFOCUS_15_02"); //Mus� tady n�kde b�t.
	AI_Output (self, other,"Info_Gorn_RUINFOCUS_09_03"); //Ta v�c, kterou hled�, by mohla b�t ve z��cenin� kl�tera za ka�onem.
};

//***************************************************************************
//	Info RUINJOIN
//***************************************************************************
INSTANCE Info_Gorn_RUINJOIN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINJOIN_Condition;
	information	= Info_Gorn_RUINJOIN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Mohli bychom pokra�ovat spole�n�.";
};                       

FUNC INT Info_Gorn_RUINJOIN_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINFOCUS) && Npc_KnowsInfo(hero, Info_Gorn_RUINWHAT))
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINJOIN_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_01"); //Mohli bysme pokra�ovat spole�n�.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_02"); //Dobr� n�pad. Tahle oblast se hem�� kousavci.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_03"); //Samotn� nejsou pro zku�en�ho lovce probl�m, ale v�t�inou lov� ve sme�k�ch.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_04"); //Sme�ka m��e dokonce i toho nejudatn�j��ho �erm��e roztrhat na kusy.
	AI_Output (other, self,"Info_Gorn_RUINJOIN_15_05"); //Tak p�jdeme spolu?
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_06"); //Dob�e, ale je�t� ne� vyraz�me, cht�l bych prozkoumat ten ka�on. R�d v�m, co m�m za z�dama.
	AI_Output (self, other,"Info_Gorn_RUINJOIN_09_07"); //Poj� se mnou, na�el jsem cestu, po kter� p�jdeme.

	Log_CreateTopic		(CH3_MonasteryRuin,	LOG_MISSION);
	Log_SetTopicStatus	(CH3_MonasteryRuin,	LOG_RUNNING);
	B_LogEntry			(CH3_MonasteryRuin,"Kdy� jsem se p�ibl�il k rozvalin�m kl�tera, potkal jsem �old�ka Gorna. Vypravil se sem, aby tu hledal  star� poklad.");
	B_LogEntry			(CH3_MonasteryRuin,"Budeme pokra�ovat v p�tr�n� spole�n�. Gorn m� varoval p�ed velk�mi sme�kami ch�apavc�, kter� se v t�to oblasti vyskytuj�.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,	"RuinAbyss");
};

//***************************************************************************
//	Info RUINABYSS
//***************************************************************************
INSTANCE Info_Gorn_RUINABYSS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINABYSS_Condition;
	information	= Info_Gorn_RUINABYSS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINABYSS_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) && (Npc_GetDistToWP(self,"OW_ABYSS_TO_CAVE_MOVE6")<1000) )
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINABYSS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_01"); //Tomu se ��k� �t�st�. Ur�it� tu b�vala z�sobn� jeskyn�.
	AI_Output			(self, other,"Info_Gorn_RUINABYSS_09_02"); //Tak si te� p�evezmi veden�, cht�l bych m�t jistotu, �e na zp�te�n� cest� neza�ijeme n�jak� p�ekvapen�.

	B_LogEntry		(CH3_MonasteryRuin,"Nalezli jsme tajnou z�sobovac� jeskyni. Krom� toho jeden kl�� a dva kouzeln� svitky, kter� vypadaly velmi zaj�mav�.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinFollow");
};

//***************************************************************************
//	Info RUINLEAVE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVE_Condition;
	information	= Info_Gorn_RUINLEAVE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_175_MEATBUG")>15000)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEAVE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_01"); //Mysl�m, �e u� t� ta z��cenina kl�tera p�estala zaj�mat.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_02"); //Budu pokra�ovat s�m.
	AI_Output (self, other,"Info_Gorn_RUINLEAVE_09_03"); //Jestli si to rozmysl�, tak jdi za mnou.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinWall");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINWALL
//***************************************************************************
INSTANCE Info_Gorn_RUINWALL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALL_Condition;
	information	= Info_Gorn_RUINWALL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINWALL_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		(Npc_GetDistToWP(hero,"OW_PATH_175_GATE1")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINWALL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_01"); //Ta proklat� br�na. ��kaj�, �e ji nikdo z kolonie nedok�e otev��t.
	AI_Output			(self, other,"Info_Gorn_RUINWALL_09_02"); //Ty mal� bestie jsou z�ejm� jedin�, co se dok�e dostat do vnit�n�ho prostoru.

	B_LogEntry		(CH3_MonasteryRuin,"Stoj�me p��mo p�ed zav�enou br�nou. Vypad� to, �e zven�� nep�jde otev��t.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinWall");
};

//***************************************************************************
//	Info RUINWALLWHAT
//***************************************************************************
INSTANCE Info_Gorn_RUINWALLWHAT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINWALLWHAT_Condition;
	information	= Info_Gorn_RUINWALLWHAT_Info;
	important	= 0;	
	permanent	= 1;
	description = "Jak to dopadlo?";
};                       

FUNC INT Info_Gorn_RUINWALLWHAT_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINWALL)
	&& 		!Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINWALLWHAT_Info()
{
	AI_Output (other, self,"Info_Gorn_RUINWALLWHAT_15_01"); //Co se d�je?
	AI_Output (self, other,"Info_Gorn_RUINWALLWHAT_09_02"); //Mus� naj�t cestu na druhou stranu br�ny.
};

//***************************************************************************
//	Info RUINLEDGE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEDGE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEDGE_Condition;
	information	= Info_Gorn_RUINLEDGE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEDGE_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_MONSTER_NAVIGATE_02")<1000)										)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINLEDGE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_01"); //Tamhle naho�e je n�jak� plo�ina. Ale vypad� to, �e je moc vysoko, aby se na n� dalo vy�plhat.
	AI_Output 	(self, other,"Info_Gorn_RUINLEDGE_09_02"); //Mus�me naj�t jinou cestu.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINPLATFORM
//***************************************************************************
INSTANCE Info_Gorn_RUINPLATFORM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINPLATFORM_Condition;
	information	= Info_Gorn_RUINPLATFORM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINPLATFORM_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		!Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_176_TEMPELFOCUS4")<300)	)
	{
		return 1;
	};
};

func VOID Info_Gorn_RUINPLATFORM_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_01"); //Vypad� to jako podstavec pro n�co.
	AI_Output 	(self, other,"Info_Gorn_RUINPLATFORM_09_02"); //Snad ten artefakt, kter� hled�, le�el pr�v� tady.

	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINGATE
//***************************************************************************
INSTANCE Info_Gorn_RUINGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINGATE_Condition;
	information	= Info_Gorn_RUINGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINGATE_Condition()
{
	if (	(Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) || Npc_KnowsInfo(hero, Info_Gorn_RUINLEAVE))
	&&		MonasteryRuin_GateOpen																	)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINGATE_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output			(self, other,"Info_Gorn_RUINGATE_09_01"); //Doopravdy se poda�ilo tu br�nu otev��t. To tvoje kouzlo bylo skute�n� �ikovn�.
	AI_Output			(other, self,"Info_Gorn_RUINGATE_15_02"); //A m��eme j�t d�l.

	B_LogEntry		(CH3_MonasteryRuin,"Pomoc� kouzeln�ho svitku ze z�sobovac� jeskyn� jsem se prom�nil ve �ravou �t�nici a mohl jsem proklouznout �kv�rou ve zdi.");
	B_LogEntry		(CH3_MonasteryRuin,"Vrata jsou nyn� otev�ena.");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"RuinFollowInside");
	AI_StopProcessInfos	(self);
};

//***************************************************************************
//	Info RUINLEAVEINSIDE
//***************************************************************************
INSTANCE Info_Gorn_RUINLEAVEINSIDE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINLEAVEINSIDE_Condition;
	information	= Info_Gorn_RUINLEAVEINSIDE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINLEAVEINSIDE_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_RUINGATE)
	&&	(Npc_GetDistToWP(hero,"OW_PATH_ABYSS_CROSS_6")<1000)
	&&	!Npc_HasItems(hero, Focus_4)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINLEAVEINSIDE_Info()
{
	AI_GotoNpc	(self,	hero);

	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_01"); //Mysl�m, �e u� t� ta z��cenina kl�tera p�estala zaj�mat.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_02"); //Budu pokra�ovat s�m.
	AI_Output (self, other,"Info_Gorn_RUINLEAVEINSIDE_09_03"); //Jestli si to rozmysl�, tak jdi za mnou.

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine(self,	"RuinStay");
	AI_StopProcessInfos(self);
};

//***************************************************************************
//	Info RUINSUCCESS
//***************************************************************************
INSTANCE Info_Gorn_RUINSUCCESS (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINSUCCESS_Condition;
	information	= Info_Gorn_RUINSUCCESS_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINSUCCESS_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINJOIN) 
	&&		Npc_HasItems (hero, Focus_4)			)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINSUCCESS_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_01"); //Tak jsi na�el sv�j kouzeln� artefakt!
	AI_Output 			(other, self,"Info_Gorn_RUINSUCCESS_15_02"); //Ano. Mus�m ohnisko p�edat m�g�m Vody. Pot�ebuj� ho.
	AI_Output 			(self, other,"Info_Gorn_RUINSUCCESS_09_03"); //Budu t� chv�li doprov�zet.

	B_LogEntry		(CH3_MonasteryRuin,"V jak�si studovn� jsem na�el ohnisko. Gorn m� bude je�t� doprov�zet.");

	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine	(self,	"RuinYard");

	Wld_InsertNpc		(YoungTroll,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINTROLL
//***************************************************************************
INSTANCE Info_Gorn_RUINTROLL (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINTROLL_Condition;
	information	= Info_Gorn_RUINTROLL_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINTROLL_Condition()
{
	if (	Npc_KnowsInfo(hero, Info_Gorn_RUINSUCCESS) 
	&&		(Npc_GetDistToWP(hero,"OW_PATH_SNAPPER04_SPAWN01")<1000)		)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINTROLL_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_01"); //K �ERTU!!! Co je to tady za p��eru?
	AI_Output 			(other, self,"Info_Gorn_RUINTROLL_15_02"); //Kde se TO tu vzalo?
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_03"); //Vypad� to jako jeden z t�ch nep�emo�iteln�ch trol�. Jen trochu men��!
	AI_Output 			(self, other,"Info_Gorn_RUINTROLL_09_04"); //Jestli se ale chceme odtud dostat, mus�me ka�dop�dn� p�es tu p��eru p�ej�t.

	AI_StopProcessInfos	(self);

	AI_DrawWeapon		(self);
	AI_SetWalkmode		(self,	NPC_RUN);
	//AI_GotoWP			(self,	"OW_PATH_176");
};

//***************************************************************************
//	Info RUINVICTORY
//***************************************************************************
INSTANCE Info_Gorn_RUINVICTORY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RUINVICTORY_Condition;
	information	= Info_Gorn_RUINVICTORY_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RUINVICTORY_Condition()
{
	var C_NPC	yTroll;
	yTroll = Hlp_GetNpc(YoungTroll);

	if	Npc_KnowsInfo(hero, Info_Gorn_RUINTROLL) 
	&&	Npc_IsDead(yTroll)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RUINVICTORY_Info()
{
	AI_GotoNpc			(self,	hero);

	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_01"); //To byla d�ina.
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_02"); //Dob�e, porazili jsme tu p��eru. Jestli to ale byl jenom mlad� trol...
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_03"); //...pak bysme se rad�ji nem�li potkat s jeho rodi�i, co?
	AI_Output 			(other, self,"Info_Gorn_RUINVICTORY_15_04"); //Tak n�jak.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_05"); //Tady se na�e cesty rozd�l�. Chci tady chv�li z�stat a porozhl�dnout se kolem.
	AI_Output 			(self, other,"Info_Gorn_RUINVICTORY_09_06"); //Jsem si ale jist�, �e se je�t� potk�me. Tak na vid�nou, p��teli.

	B_LogEntry		(CH3_MonasteryRuin,"Na zp�te�n� cest� na kl�tern�mu n�dvo�� jsme potkali mlad�ho trola. Do�lo k tvrd�mu boji, ve kter�m jsme v�ak zv�t�zili.");
	B_LogEntry		(CH3_MonasteryRuin,"M� pou� s Gornem nyn� skon�ila. M�m pocit, �e jej zase brzy potk�m.");

	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"RuinStay");
	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//---------------------------------------------------------------------
//	Info DIEGOMILTEN
//---------------------------------------------------------------------
INSTANCE Info_Gorn_DIEGOMILTEN (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_DIEGOMILTEN_Condition;
	information	= Info_Gorn_DIEGOMILTEN_Info;
	important	= 0;	
	permanent	= 0;
	description = "Potkal jsem p�es Star�m t�borem Diega a Miltena!";
};                       

FUNC INT Info_Gorn_DIEGOMILTEN_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Diego_OCFAVOR)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_DIEGOMILTEN_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_01"); //Potkal jsem p�es Star�m t�borem Diega a Miltena!
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_02"); //To jsou dobr� zpr�vy!
	AI_Output 			(hero,self,"Info_Gorn_DIEGOMILTEN_15_03"); //Cht�j� nav�t�vit tebe a Lestera. Na va�em obvykl�m m�st�.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_04"); //D�ky. Ve �patn�ch �asech, jako jsou te�, nen� nic cenn�j��ho ne� dob�� p��tel�.
	AI_Output 			(self,hero,"Info_Gorn_DIEGOMILTEN_09_05"); //Te� u� jsi t�m�� jedn�m z n�s. Jsi spolehliv�!

	B_GiveXP			(XP_MessageForGorn);
	
	if (warned_gorn_or_lester == FALSE)
	{
		warned_gorn_or_lester = TRUE ;
	}
	else 
	{
		B_LogEntry			(CH4_4Friends,		"�ekl jsem Lesterovi a Gornovi o setk�n� s jejich p��teli. Te� u� to nen� moje v�c. D�l si porad� sami..."); 
		Log_SetTopicStatus	(CH4_4Friends,		LOG_SUCCESS);
	};

};

//---------------------------------------------------------------------
//	Info FREEMINE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FREEMINE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FREEMINE_Condition;
	information	= Info_Gorn_FREEMINE_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co jsi vid�l ve Svobodn�m dole?";
};                       

FUNC INT Info_Gorn_FREEMINE_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	&& !FindXardas
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FREEMINE_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_01"); //Co jsi vid�l ve Svobodn�m dole?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_02"); //Kdy� jsem se vr�til z rozbo�en�ho kl�tera, cht�l jsem se zastavit u Okyla, ��fa Svobodn�ho dolu.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_03"); //Kdy� jsem ale p�i�el, v�ude se povalovaly mrtvoly.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_04"); //Zahl�dl jsem akor�t n�kolik str�c�, kte�� se opevnili u vchodu do dolu.
	AI_Output 			(hero,self,"Info_Gorn_FREEMINE_15_05"); //Jak mohly pouh� dva tucty str�� porazit tolik �old�k�?
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_06"); //P�ipadalo mi to jako l��ka. Nikdo nep�edpokl�dal, �e by �to�n�ci p�ekro�ili hory.
	AI_Output 			(self,hero,"Info_Gorn_FREEMINE_09_07"); //Prvek p�ekvapen� m��e mnohon�sobn� zv��it s�lu bojovn�ka.
};

//---------------------------------------------------------------------
//	Info GUARDNC
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNC (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNC_Condition;
	information	= Info_Gorn_GUARDNC_Info;
	important	= 0;	
	permanent	= 0;
	description = "Co m� te� v pl�nu?";
};                       

FUNC INT Info_Gorn_GUARDNC_Condition()
{
	if Npc_KnowsInfo(hero, Info_Saturas_AMBUSH)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNC_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_01"); //Co m� te� v pl�nu?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_02"); //Cel� na�e obrann� strategie se mus� zm�nit. To zabere n�jak� �as.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_03"); //Dokud Lee a jeho lid� nebudou p�ipraveni, p�id�m se ke Cordov� provizorn� str�i.
	AI_Output 			(hero,self,"Info_Gorn_GUARDNC_15_04"); //Chyst� proti�tok?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_05"); //Zat�m ne, ale ten den p�ijde.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNC_09_06"); //Jestli m� n�kdy bude� hledat, jdi odtud sm�rem k dolu. Budu tam na str�i.

	B_Story_CordsPost	();

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info GUARDNCRUNNING
//---------------------------------------------------------------------
INSTANCE Info_Gorn_GUARDNCRUNNING (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_GUARDNCRUNNING_Condition;
	information	= Info_Gorn_GUARDNCRUNNING_Info;
	important	= 0;	
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_Gorn_GUARDNCRUNNING_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_GUARDNC)
	&&	!UrShak_SpokeOfUluMulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_GUARDNCRUNNING_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_GUARDNCRUNNING_15_01"); //Jak to jde?
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_02"); //V�ude klid. Ve Svobodn�m dole se nic ned�je.
	AI_Output 			(self,hero,"Info_Gorn_GUARDNCRUNNING_09_03"); //Lee je po��d zanepr�zdn�n� organizac� na�� obrany.
};

//---------------------------------------------------------------------
//	Info POST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_POST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_POST_Condition;
	information	= Info_Gorn_POST_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_POST_Condition()
{
	if (UrShak_SpokeOfUluMulu)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_POST_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_POST_09_01"); //Jde� pr�v� v�as. P�ipravujeme proti�tok.
	AI_Output 			(self, hero,"Info_Gorn_POST_09_02"); //V prvn� f�zi p�evezmeme zp�t Svobodn� d�l.
};

//---------------------------------------------------------------------
//	Info TAKEBACK
//---------------------------------------------------------------------
INSTANCE Info_Gorn_TAKEBACK (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_TAKEBACK_Condition;
	information	= Info_Gorn_TAKEBACK_Info;
	important	= 0;	
	permanent	= 0;
	description = "Pl�nuje� jeho p�evzet� jenom se �ty�mi mu�i? Kde jsou v�ichni �old�ci?";
};                       

FUNC INT Info_Gorn_TAKEBACK_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_TAKEBACK_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_TAKEBACK_15_01"); //Pl�nuje� jeho p�evzet� jenom se �ty�mi mu�i? Kde jsou v�ichni �old�ci?
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_02"); //�eln� �tok nen� dobr�! Gomezovi lid� jsou na to p��li� dob�e opevn�n�!
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_03"); //Mohli bysme ale zah�jit tajnou misi a likvidovat jednoho mu�e po druh�m - to by fungovalo.
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_04"); //Lee m� po��dal, abych ti p�edal zpr�vu.

	var int guild;
	guild = Npc_GetTrueGuild(hero);
	if 		(guild == GIL_SLD)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_05"); //Jako jeden ze �ty� nejlep��ch �old�k� jsi byl vybr�n, abys vykonal tuhle misi.
	}
	else if	(guild == GIL_KDW)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_06"); //Jako m�g Kruhu vody a zku�en� bojovn�k jsi byl vybr�n, abys vykonal tuhle misi.
	}
	else if (guild == GIL_ORG)
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_07"); //Jako jeden z nejlep��ch bandit� jsi byl vybr�n, abys vykonal tuhle misi.
	}
	else
	{
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_08"); //I kdy� nejsi jedn�m z n�s, vykonal jsi pro n� t�bor velikou slu�bu a v�cekr�t jsi dok�zal svou kvalitu.
		AI_Output 		(self, hero,"Info_Gorn_TAKEBACK_09_09"); //Nab�z�me ti p��le�itost, abys vykonal tuhle misi.
	};
	AI_Output 			(self, hero,"Info_Gorn_TAKEBACK_09_10"); //P�jdu s tebou. Dohromady se n�m to poda��!
};

//---------------------------------------------------------------------
//	Info SECOND
//---------------------------------------------------------------------
INSTANCE Info_Gorn_SECOND (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_SECOND_Condition;
	information	= Info_Gorn_SECOND_Info;
	important	= 0;	
	permanent	= 0;
	description = "Prvn� f�ze? Co bude druh�?";
};                       

FUNC INT Info_Gorn_SECOND_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_POST))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_SECOND_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_01"); //Prvn� f�ze? Co bude druh�?
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_02"); //Jakmile bude d�l zase n�, za�neme hledat horsk� pr�smyk, p�es kter� p�e�li Gomezovi lid�, aby n�s napadli!
	AI_Output 			(self, hero,"Info_Gorn_SECOND_09_03"); //Kdy� bude ten pr�smyk uzav�en�, situace bude zase pod na�� kontrolou.
	AI_Output 			(hero, self,"Info_Gorn_SECOND_15_04"); //Aha.
};

//---------------------------------------------------------------------
//	Info WHYME
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WHYME (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WHYME_Condition;
	information	= Info_Gorn_WHYME_Info;
	important	= 0;	
	permanent	= 0;
	description = "Pro� pr�v� j�?";
};                       

FUNC INT Info_Gorn_WHYME_Condition()
{
	if (Npc_KnowsInfo(hero, Info_Gorn_TAKEBACK))
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WHYME_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_WHYME_15_01"); //Pro� pr�v� j�?
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_02"); //U� jsi v�cekr�t dok�zal, �e jsi sou�asn� odv�n� i chytr�!
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_03"); //A krom� toho zn� Star� t�bor a jeho str�e l�p ne� kdokoliv z n�s.
	AI_Output 			(self, hero,"Info_Gorn_WHYME_09_04"); //Pro tenhle �kol jsi nejlep�� mu�!
};

//---------------------------------------------------------------------
//	Info KICKBUTT
//---------------------------------------------------------------------
INSTANCE Info_Gorn_KICKBUTT (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_KICKBUTT_Condition;
	information	= Info_Gorn_KICKBUTT_Info;
	important	= 0;	
	permanent	= 0;
	description = "Dobr�, tak poj�me d�t na�im nev�tan�m host�m do dolu po��dnou lekci!";
};                       

FUNC INT Info_Gorn_KICKBUTT_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_MYWAY)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_KICKBUTT_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_KICKBUTT_15_01"); //Dobr�, tak poj�me d�t na�im nev�tan�m host�m do dolu po��dnou lekci!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_02"); //Ne�ekal jsem, �e �ekne� n�co jin�ho!
	AI_Output 			(self, hero,"Info_Gorn_KICKBUTT_09_03"); //Tady je kl��. Je od vr�tnice p�ed vstupem do dolu.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info MYWAY
//---------------------------------------------------------------------
INSTANCE Info_Gorn_MYWAY (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_MYWAY_Condition;
	information	= Info_Gorn_MYWAY_Info;
	important	= 0;	
	permanent	= 0;
	description = "Pro� ne. Pot�ebuju se stejn� dostat do dolu!";
};                       

FUNC INT Info_Gorn_MYWAY_Condition()
{
	if 	 Npc_KnowsInfo(hero, Info_Gorn_WHYME)
	&&	!Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_MYWAY_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_MYWAY_15_01"); //Pro� ne. Pot�ebuju se stejn� dostat do dolu!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_02"); //A� u� m� k tomu jak�koliv d�vod, jsem r�d, �e jsme se v t�hle v�ci spolu dohodli!
	AI_Output 			(self, hero,"Info_Gorn_MYWAY_09_03"); //Tady je kl��. Je od vr�tnice p�ed vstupem do dolu.

	B_Story_GornJoins	();
};

//---------------------------------------------------------------------
//	Info WOLF
//---------------------------------------------------------------------
INSTANCE Info_Gorn_WOLF (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_WOLF_Condition;
	information	= Info_Gorn_WOLF_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_WOLF_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_076")<500)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_WOLF_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_01"); //Och, m�lem jsem zapomn�l!
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_02"); //Bandita Wolf chce s tebou nutn� mluvit, je�t� ne� odejde� do dolu.

	Info_ClearChoices	(Info_Gorn_WOLF);
	Info_AddChoice		(Info_Gorn_WOLF,"M��e po�kat, m�me na pr�ci d�le�it�j�� v�ci.",	Info_Gorn_WOLF_FM);	
	Info_AddChoice		(Info_Gorn_WOLF,"Pak tam rad�ji p�jdu hned.",		Info_Gorn_WOLF_WOLF);	

	B_LogEntry			(CH4_UluMulu,"Bandita Wolf chce se mnou mluvit je�t� p�edt�m, ne� se vyd�me na cestu do dolu. P�jdu ho nav�t�vit.");
	Gorn_GotoWolf = TRUE;
};

func void Info_Gorn_WOLF_FM ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_04"); //M��e po�kat, m�me na pr�ci d�le�it�j�� v�ci.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_05"); //Jak ��k�!
	AI_StopProcessInfos	(self);
};

func void Info_Gorn_WOLF_WOLF ()
{
	AI_Output 			(hero, self,"Info_Gorn_WOLF_15_06"); //Pak tam rad�ji p�jdu hned.
	AI_Output 			(self, hero,"Info_Gorn_WOLF_09_07"); //Ud�lej to. Po�k�m tady na tebe.

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};


//---------------------------------------------------------------------
//	Info LEAVEFORPOST
//---------------------------------------------------------------------
INSTANCE Info_Gorn_LEAVEFORPOST (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_LEAVEFORPOST_Condition;
	information	= Info_Gorn_LEAVEFORPOST_Info;
	important	= 1;	
	permanent	= 1;
};                       

FUNC INT Info_Gorn_LEAVEFORPOST_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_074")<2000)
	&& (FreemineOrc_LookingUlumulu != LOG_RUNNING)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_LEAVEFORPOST_Info()
{
	AI_GotoNpc			(self, hero);

	if (Npc_KnowsInfo(hero,Info_Gorn_WOLF))
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_01"); //Vypad� to, �e chce� mluvit s Wolfem!
	}
	else
	{
		AI_Output		(self, hero,"Info_Gorn_LEAVEFORPOST_09_02"); //To je �patn� sm�r! Mus�me j�t k dolu!
	};
	AI_Output 			(self, hero,"Info_Gorn_LEAVEFORPOST_09_03"); //Po�k�m na tebe u provizorn� str�nice!

	Gorn_JoinedForFM = FALSE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;
	Npc_ExchangeRoutine	(self,	"GuardNC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info REJOINFORFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_REJOINFORFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_REJOINFORFM_Condition;
	information	= Info_Gorn_REJOINFORFM_Info;
	important	= 0;	
	permanent	= 1;
	description = "Poj�me k dolu!";
};                       

FUNC INT Info_Gorn_REJOINFORFM_Condition()
{
	if 	(Npc_KnowsInfo  (hero, Info_Gorn_MYWAY) || Npc_KnowsInfo(hero, Info_Gorn_KICKBUTT))
	&&	(Npc_GetDistToWP(hero, "OW_PATH_075_GUARD4")<1000)
	&&	(!Gorn_JoinedForFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_REJOINFORFM_Info()
{
	AI_Output 			(hero, self,"Info_Gorn_REJOINFORFM_15_01"); //Poj�me k dolu!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_02"); //Nejvy��� �as vyhnat odtud str�e!
	AI_Output 			(self, hero,"Info_Gorn_REJOINFORFM_09_03"); //Jdi nap�ed, p�jdu za tebou!

	Gorn_JoinedForFM = TRUE;
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	Npc_ExchangeRoutine	(self,	"FollowToFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info RAZOR
//---------------------------------------------------------------------
INSTANCE Info_Gorn_RAZOR (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_RAZOR_Condition;
	information	= Info_Gorn_RAZOR_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_RAZOR_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "OW_PATH_3000")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_RAZOR_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_01"); //POZOR, NEBEZPE��!!!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_02"); //Lov� ve sme�k�ch jako kousavci, ale kou�ou daleko h��!
	AI_Output 			(self, hero,"Info_Gorn_RAZOR_09_03"); //M�li bysme je sprovodit ze sv�ta. Zn� m�, m�m r�d, kdy� v�m, co m�m za z�dy.

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMCENTRANCE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMCENTRANCE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMCENTRANCE_Condition;
	information	= Info_Gorn_FMCENTRANCE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMCENTRANCE_Condition()
{
	if Gorn_JoinedForFM
	&& (Npc_GetDistToWP(hero, "FMC_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMCENTRANCE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_01"); //Zadr�, vid� v�echny ty mrtvoly?
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_02"); //Jdi ke vchodu do dolu, j� z�stanu tady a ohl�d�m, abysme nebyli zezadu nemile zasko�eni.
	AI_Output 			(self, hero,"Info_Gorn_FMCENTRANCE_09_03"); //A� bude� dole, p�jdu za tebou.

	Npc_ExchangeRoutine	(self,	"WaitFMC");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMGATE
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMGATE (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMGATE_Condition;
	information	= Info_Gorn_FMGATE_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FMGATE_Condition()
{
	if Gorn_JoinedForFM
	&& !FM_GateOpen
	&& (Npc_GetDistToWP(hero, "FMC_FM_ENTRANCE")<1000)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMGATE_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_01"); //Sly�el jsem, jak bojuje�, a tak jsem za tebou ihned vyrazil.
	AI_Output 			(hero, self,"Info_Gorn_FMGATE_15_02"); //Star� zn�m�... Ale ��et je srovnan�!
	AI_Output 			(self, hero,"Info_Gorn_FMGATE_09_03"); //Dobr�, otev�i ta vrata, j� budu hl�dat.

	Npc_ExchangeRoutine	(self,	"WaitFM");
	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info AFTERFM
//---------------------------------------------------------------------
INSTANCE Info_Gorn_AFTERFM (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_AFTERFM_Condition;
	information	= Info_Gorn_AFTERFM_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_AFTERFM_Condition()
{
	if	FreemineOrc_LookingUlumulu
	{
		return TRUE;
	};
};

func VOID Info_Gorn_AFTERFM_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_01"); //Ach, �lov��e. To byl opravdu tvrd� boj.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_02"); //Nikdy bych si nebyl pomyslel, �e by Gomezovy str�e dok�zaly kl�st takov� odpor.
	AI_Output 			(hero, self,"Info_Gorn_AFTERFM_15_03"); //Hlavn� je, �e jsme je vyhnali z na�eho dolu.
	AI_Output 			(self, hero,"Info_Gorn_AFTERFM_09_04"); //Jsem po��d tady a hl�d�m situaci!

	B_Story_LeftFM		();
	
	Lee_freeminereport = 1;  //jetzt kann der SC Lee �ber die befreite Mine informieren.     ***Bj�rn***

	AI_StopProcessInfos	(self);
};

//---------------------------------------------------------------------
//	Info FMWATCH
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FMWATCH (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FMWATCH_Condition;
	information	= Info_Gorn_FMWATCH_Info;
	important	= 0;	
	permanent	= 1;
	description = "Jak� je situace?";
};                       

FUNC INT Info_Gorn_FMWATCH_Condition()
{
	if	Npc_KnowsInfo(hero, Info_Gorn_AFTERFM)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FMWATCH_Info()
{
	AI_Output 			(hero,self,"Info_Gorn_FMWATCH_15_01"); //Jak� je situace?
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_02"); //V�ude klid. Ve Svobodn�m dole se nic ned�je.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_03"); //U� to nebude dlouho trvat, ne� sem doraz� posily, kter� vyslal Lee.
	AI_Output 			(self,hero,"Info_Gorn_FMWATCH_09_04"); //Do t� doby bych u� byl d�vno doma.
};


//---------------------------------------------------------------------
//	Info FOUNDULUMULU
//---------------------------------------------------------------------
INSTANCE Info_Gorn_FOUNDULUMULU (C_INFO)
{
	npc			= PC_Fighter;
	condition	= Info_Gorn_FOUNDULUMULU_Condition;
	information	= Info_Gorn_FOUNDULUMULU_Info;
	important	= 1;	
	permanent	= 0;
};                       

FUNC INT Info_Gorn_FOUNDULUMULU_Condition()
{
	if	(FreemineOrc_LookingUlumulu == LOG_SUCCESS)
	{
		return TRUE;
	};
};

func VOID Info_Gorn_FOUNDULUMULU_Info()
{
	AI_GotoNpc			(self, hero);

	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_01"); //To je zaj�mav� sk�et� standarta, co tady m�.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_02"); //Pat�ila tomu sk�et�mu otrokovi z dolu?
	AI_Output 			(hero, self,"Info_Gorn_FOUNDULUMULU_15_03"); //Je to sk�et� symbol p��telstv�. Chci s n�m j�t do sk�et�ho m�sta.
	AI_Output 			(self, hero,"Info_Gorn_FOUNDULUMULU_09_04"); //Douf�m, �e bude� m�t �t�st� a �e budou sk�eti respektovat tuhle... V�C!

	B_Kapitelwechsel	(5);

	AI_StopProcessInfos	(self);
};








