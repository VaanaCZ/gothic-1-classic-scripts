// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_BaalParvez_EXIT (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 999;
	condition	= DIA_BaalParvez_EXIT_Condition;
	information	= DIA_BaalParvez_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalParvez_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalParvez_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  DIA_BaalParvez_Greet (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_Greet_Condition;
	information	= DIA_BaalParvez_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Greet_Info()
{
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_00"); //Sp�� s tebou, cizin�e!
	AI_Output (self, other,"DIA_BaalParvez_Greet_10_01"); //Jsem tady, abych t� p�ivedl na spr�vnou cestu.
};

// **************************************************
//					Rechter Weg
// **************************************************

instance  DIA_BaalParvez_RightWay (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_RightWay_Condition;
	information	= DIA_BaalParvez_RightWay_Info;
	permanent	= 0;
	description = "A jak� je ta spr�vn� cesta?";
};                       

FUNC int  DIA_BaalParvez_RightWay_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_RightWay_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_RightWay_15_00"); //A jak� je ta spr�vn� cesta?
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_01"); //Cesta Sp��ova. On s�m je tou silou, kter� n�s osvobod�.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_02"); //Guru p�ipravuj� v na�em t�bo�e velk� vz�v�n� - cht�j� nav�zat spojen� se Sp��em.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_03"); //Dosud k n�m promlouval jen ve viz�ch - ale te� nastal �as, kdy s n�m vstoup�me ve spojen�.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_04"); //Budeme k tomu pot�ebovat co nejv�ce pomocn�k�. Kdy� budem soust�edit sv� duchovn� s�ly, pak se k n�mu jejich prost�ednictv�m dostaneme.
	AI_Output (self, other,"DIA_BaalParvez_RightWay_10_05"); //N� t�bor je odsud dost daleko, v ba�in�ch - jestli chce�, m��u t� tam dov�st.
};

// **************************************************
//					Vorteile f�r mich
// **************************************************

instance  DIA_BaalParvez_MyAdvantage (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_MyAdvantage_Condition;
	information	= DIA_BaalParvez_MyAdvantage_Info;
	permanent	= 0;
	description = "Co z toho budu m�t, kdy� se k v�m p�id�m?";
};                       

FUNC int  DIA_BaalParvez_MyAdvantage_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_MyAdvantage_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_MyAdvantage_15_00"); //Co z toho budu m�t, kdy� se k v�m p�id�m?
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_01"); //Mo�n� se stane� jedn�m z vyvolen�ch lid�, kte�� od Sp��e dostanou dar magie.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_02"); //Nebo se ti mo�n� dostane nejvy��� pocty a stane� se templ��em. Jen ti nejlep�� bojovn�ci z n�s m��ou z�skat takov� postaven�.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_03"); //Pokud bude Sp�� s tebou, m��e� dokonce spojit oboj� - nejlep�� z templ��� dostanou tak� dar magie.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_04"); //Vid�, na�e Bratrstvo ti nab�z� spoustu p��le�itost�.
	AI_Output (self, other,"DIA_BaalParvez_MyAdvantage_10_05"); //M�l bys to zv�it, ne� se rozhodne� pro jin� t�bor!
};

// **************************************************
//					Schl�fer
// **************************************************

instance  DIA_BaalParvez_Sleeper (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_Sleeper_Condition;
	information	= DIA_BaalParvez_Sleeper_Info;
	permanent	= 0;
	description = "Kdo je ten Sp��?";
};                       

FUNC int  DIA_BaalParvez_Sleeper_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_Sleeper_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_00"); //Kdo je ten Sp��?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_01"); //Sp�� k n�m promlouv� prost�ednictv�m sn� a vidin.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_02"); //Od t� doby, co s n�m Y�Berion poprv� p�ed p�ti lety vstoupil do spojen�, n�s st�le vede.
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_03"); //V�ichni p��vr�enci Bratrstva se z�ekli t�� boh�. Modl�me se za sp�su jenom ke Sp��ovi.
	AI_Output (other, self,"DIA_BaalParvez_Sleeper_15_04"); //Sp�su od �eho?
	AI_Output (self, other,"DIA_BaalParvez_Sleeper_10_05"); //Od tohohle zpropaden�ho m�sta, p�ece! Sp�� n�m uk�e cestu ke svobod�!
};

// **************************************************
//			Was hat Schl�fer zu euch gesagt?
// **************************************************

instance  DIA_BaalParvez_SleeperSaid (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 2;
	condition	= DIA_BaalParvez_SleeperSaid_Condition;
	information	= DIA_BaalParvez_SleeperSaid_Info;
	permanent	= 0;
	description = "Co v�m Sp�� ��k�?";
};                       

FUNC int  DIA_BaalParvez_SleeperSaid_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_Sleeper))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_SleeperSaid_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_SleeperSaid_15_00"); //Co v�m Sp�� ��k�?
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_01"); //Dovedl n�s k ba�in�m, ke z��cenin� star�ho chr�mu. Tam jsme vybudovali n� t�bor.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_02"); //Dal n�m nez�vislost - nikdo z n�s nemus� pracovat v dolech.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_03"); //Uk�zal n�m, co dok�e droga z ba�in. Prod�v�me ji do ostatn�ch t�bor� a m�n�me ji za to, co pot�ebujeme.
	AI_Output (self, other,"DIA_BaalParvez_SleeperSaid_10_04"); //A n�kter�m z n�s p�edal dar magie. Star� a mocn� kouzla, kter� se li�� od t�ch, kter� pou��vaj� m�gov� t�to ��e.
};

// **************************************************
//		Erz�hl mir von der MAgie des Schl�fers
// **************************************************

instance  DIA_BaalParvez_PSIMagic (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 4;
	condition	= DIA_BaalParvez_PSIMagic_Condition;
	information	= DIA_BaalParvez_PSIMagic_Info;
	permanent	= 0;
	description = "Pov�dej mi o Sp��ov� magii.";
};                       

FUNC int  DIA_BaalParvez_PSIMagic_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_BaalParvez_SleeperSaid))
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_PSIMagic_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_PSIMagic_15_00"); //Pov�dej mi o Sp��ov� magii.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_01"); //Ten dar n�m umo��uje ��dit v�ci silou vlastn� mysli.
	AI_Output (self, other,"DIA_BaalParvez_PSIMagic_10_02"); //Do taj� tohoto kouzla byli zasv�ceni jen Guru na�eho Bratrstva.
};

// **************************************************
//					GotoNewcamp
// **************************************************
	var int BaalParvez_GotoPSI_Day;
// **************************************************

instance  DIA_BaalParvez_GotoPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 800;
	condition	= DIA_BaalParvez_GotoPSI_Condition;
	information	= DIA_BaalParvez_GotoPSI_Info;
	permanent	= 1;
	description = "Vezmi m� do va�eho t�bora. Chci si ho prohl�dnout.";
};                       

FUNC int  DIA_BaalParvez_GotoPSI_Condition()
{
	if	(Npc_RefuseTalk(self)==FALSE)
	&&	(Npc_KnowsInfo(hero, DIA_BaalParvez_RightWay))
	&&	(Npc_GetDistToWP(self,"PATH_OC_PSI_18")>5000)
	&&	!Npc_KnowsInfo(hero, DIA_BaalParvez_AtPSI)
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_GotoPSI_Info()
{
	AI_Output (other, self,"DIA_BaalParvez_GotoPSI_15_00"); //Vezmi m� do va�eho t�bora. Chci si ho prohl�dnout.
	if (Psi_Walk == 0)
	{
		if (Npc_GetTrueGuild(hero) == GIL_NONE)
		{
			Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
			Log_SetTopicStatus	(CH1_JoinPsi,	LOG_RUNNING);
		};
		B_LogEntry				(CH1_JoinPsi,"Baal Parvez, mision�� Bratrstva, hled� ve Star�m t�bo�e nov� v���c� pro SP��E! Nab�dl mi doprovod do T�bora v ba�in�ch, domova bratrstva.");
		Psi_Walk	= 1;
	};
	AI_Output (self, other,"DIA_BaalParvez_GotoPSI_10_01"); //Velmi dob�e! P�jdu nap�ed. N�sleduj m�!
	
	BaalParvez_GotoPSI_Day = Wld_GetDay();
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_SetRefuseTalk (self, 300);
	
	AI_StopProcessInfos	(self);
	
	Npc_SetPermAttitude(self,ATT_FRIENDLY);
	Npc_ExchangeRoutine(self,"GUIDE");
};

// **************************************************
//				AM PSICAMP ANGEKOMMEN
// **************************************************

instance DIA_BaalParvez_AtPSI (C_INFO)
{
	npc			= NOV_1330_BaalParvez;
	nr			= 1;
	condition	= DIA_BaalParvez_AtPSI_Condition;
	information	= DIA_BaalParvez_AtPSI_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  DIA_BaalParvez_AtPSI_Condition()
{
	if 	( Hlp_StrCmp(Npc_GetNearestWP(self),"PATH_OC_PSI_18") ) 
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalParvez_AtPSI_Info()
{
	if (BaalParvez_GotoPSI_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_10_00"); //Tak tady jsme... Dole le�� t�bor Bratrstva.
	}
	else
	{
		AI_Output (self, other,"DIA_BaalParvez_AtPSI_LATE_10_00"); //Dal sis na �as, brat�e! T�mhle dole je t�bor.
	};
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_01"); //Projdi branou a promluv s m�mi bratry. Douf�m, �es sem nep�i�el pronic zanic.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_02"); //Zeptej se na Cora Kaloma. Star� se o novice a ��ky.
	AI_Output 	(self, other,"DIA_BaalParvez_AtPSI_10_03"); //J� se vr�t�m do Star�ho t�bora - je tam po��d dost nev�rc�, kte�� pot�ebuj� nav�st na spr�vnou cestu
	AI_Output 	(other, self,"DIA_BaalParvez_AtPSI_15_04"); //Hodn� �t�st�.

	self.aivar[AIV_PARTYMEMBER] = FALSE;

	B_LogEntry	(CH1_JoinPsi,"T�bor v ba�in�ch je pode mnou. M�j spole�n�k mi poradil, abych si promluvil s Cor Kalomem. Je v�dcem a u�itelem novic�.");
	B_GiveXP	(XP_ArrivedAtPsiCamp);

	var C_NPC Kalom; Kalom = Hlp_GetNpc(Gur_1201_CorKalom);
	Kalom.aivar[AIV_FINDABLE]=TRUE;
	
	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};


