// **************************************************
VAR INT MordragKO_PlayerChoseOreBarons;
VAR INT MordragKO_PlayerChoseThorus;
VAR INT MordragKO_HauAb;
var int MordragKO_StayAtNC;
// **************************************************

// **************************************************
//						 EXIT 
// **************************************************

instance  Org_826_Mordrag_Exit (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 999;
	condition	= Org_826_Mordrag_Exit_Condition;
	information	= Org_826_Mordrag_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_826_Mordrag_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  Org_826_Mordrag_Greet (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 1;
	condition	= Org_826_Mordrag_Greet_Condition;
	information	= Org_826_Mordrag_Greet_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_Greet_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Greet_Info()
{
	AI_Output (self, other,"Org_826_Mordrag_Greet_11_00"); //Hej, ty novej! J� jsem Mordrag. To jm�no by sis m�l zapamatovat - ode m� m��e� koupit jak�koliv zbo�� za dobrou cenu!
};

// **************************************************
//					Handeln
// **************************************************
var int Mordrag_Traded;
// **************************************************

instance  Org_826_Mordrag_Trade (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 800;
	condition	= Org_826_Mordrag_Trade_Condition;
	information	= Org_826_Mordrag_Trade_Info;
	permanent	= 1;
	description = "Uka� mi svoje zbo��.";
	trade		= 1;
};                       

func int  Org_826_Mordrag_Trade_Condition()
{
	return 1;
};

FUNC VOID  Org_826_Mordrag_Trade_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Trade_15_00"); //Uka� mi tvoje zbo��.
	AI_Output (self, other,"Org_826_Mordrag_Trade_11_01"); //N�co si vyber...
	if	(Mordrag_Traded==0)
	{
		Log_CreateTopic	(GE_TraderOC,	LOG_NOTE);
		B_LogEntry		(GE_TraderOC,"Bandita Mordrag prod�v� na tr�i�ti kraden� zbo��.");
		Mordrag_Traded=1;
	};
};

// **************************************************
//					KURIER F�R MAGIER
// **************************************************

instance  Org_826_Mordrag_Courier (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Courier_Condition;
	information	= Org_826_Mordrag_Courier_Info;
	permanent	= 1;
	description = "Jsi doopravdy kur�r m�g�?";
};                       

FUNC int  Org_826_Mordrag_Courier_Condition()
{
	if	Thorus_MordragMageMessenger 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Courier_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_00"); //Jsi doopravdy kur�r m�g�?
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_01"); //A co kdy� jsem?
	AI_Output (other, self,"Org_826_Mordrag_Courier_15_02"); //Pot�eboval bych si promluvit s m�gy. Mus�m se dostat do hradu.
	AI_Output (self, other,"Org_826_Mordrag_Courier_11_03"); //Kur��i m�g� nos� znak, kter� jim umo�n� vstup na hrad. Jestli jsi jeden z n�s, pak bys m�l m�t takov� znak...
};

// **************************************************
//					DU HAST EIN PROBLEM
// **************************************************

instance  Org_826_Mordrag_Problem (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Problem_Condition;
	information	= Org_826_Mordrag_Problem_Info;
	permanent	= 0;
	description = "M� probl�m.";
};                       

FUNC int  Org_826_Mordrag_Problem_Condition()
{
	if Thorus_MordragKo == LOG_RUNNING 	
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Problem_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_00"); //M� probl�m.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_01"); //Opravdu? Co se d�je?
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_02"); //Jsou tady lidi, kte�� se t� cht�j� zbavit.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_03"); //Opravdu? Pak jim m��e� ��ci, �e by m�li n�koho vyslat, aby jim splnil jejich p��n�.
	AI_Output (other, self,"Org_826_Mordrag_Problem_15_04"); //Jak si m��e� b�t tak jist�, �e nejsem ten, kdo to m� ud�lat?
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_05"); //Proto�e si mysl�m, �e na to jsi p��li� bystr�, chlap�e. Brzy si uv�dom�, �e je lep�� st�t proti Gomezovi, ne� pro n�j pracovat.
	AI_Output (self, other,"Org_826_Mordrag_Problem_11_06"); //V Nov�m t�bo�e hodn� pot�ebujeme schopn� lidi a nikdo ti tam nebude p�ikazovat, co m� d�lat.
};

// **************************************************
//					  NCInfo
// **************************************************

instance  Org_826_Mordrag_NCInfo(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_NCInfo_Condition;
	information	= Org_826_Mordrag_NCInfo_Info;
	permanent	= 0;
	description = "Pov�z mi v�c o Nov�m t�bo�e.";
};                       

FUNC int  Org_826_Mordrag_NCInfo_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_NCInfo_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_00"); //Pov�z mi v�c o Nov�m t�bo�e.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_01"); //Je to t�bor, ve kter�m m� nejv�t�� svobodu v cel� kolonii. Nem�me ��dn� Rudobarony ani Guru, kte�� by n�m ��fovali.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_02"); //M�me vlastn� d�l. Ale ruda, kterou vyr�b�me, neputuje k ��dn�mu zpropaden�mu kr�li!
	AI_Output (other, self,"Org_826_Mordrag_NCInfo_15_03"); //Tak k �emu se pou��v�?
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_04"); //Na�i m�gov� pracuj� na pl�nu, jak prolomit Bari�ru. V�echna ruda se shroma��uje pro tento pl�n.
	AI_Output (self, other,"Org_826_Mordrag_NCInfo_11_05"); //Zat�mco se Gomez a jeho lid� povaluj�, my se d�eme za svobodu - to je to, co se d�je.
};

// **************************************************
//					JoinNewcamp
// **************************************************

instance  Org_826_Mordrag_JoinNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_JoinNewcamp_Condition;
	information	= Org_826_Mordrag_JoinNewcamp_Info;
	permanent	= 0;
	description = "A kdybych se cht�l p�idat k Nov�mu t�boru... mohl bys mi pomoci?";//k�nntest du mir dabei helfen... ZU LANG
};                       

FUNC int  Org_826_Mordrag_JoinNewcamp_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_826_Mordrag_Problem) || Npc_KnowsInfo(hero,Org_826_Mordrag_Courier) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_JoinNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_JoinNewcamp_15_00"); //A kdybych se cht�l p�idat k Nov�mu t�boru... mohl bys mi pomoci?
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_01"); //Jestli to mysl� v�n�, m��eme hned j�t! Zavedu t� k Laresovi. Je hlavou tlupy.
	AI_Output (self, other,"Org_826_Mordrag_JoinNewcamp_11_02"); //Ale jestli m� chce� rad�ji zml�tit n�kde mimo t�bor... Dobr�, do toho!
};


instance  Org_826_Mordrag_GotoNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_GotoNewcamp_Condition;
	information	= Org_826_Mordrag_GotoNewcamp_Info;
	permanent	= 0;
	description = "Tak poj�me do Nov�ho t�bora!";
};                       

FUNC int  Org_826_Mordrag_GotoNewcamp_Condition()
{
	if (Npc_KnowsInfo(hero,Org_826_Mordrag_JoinNewcamp))
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoNewcamp_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoNewcamp_15_00"); //Tak poj�me do Nov�ho t�bora!
	AI_Output (self, other,"Org_826_Mordrag_GotoNewcamp_11_01"); //Dob�e! N�sleduj m�.
	
	Mordrag_GotoNC_Day = Wld_GetDay();
	
	AI_StopProcessInfos	(self);

	Npc_SetPermAttitude(self,ATT_FRIENDLY);	// damit hat der Spieler einen Freischlag. Nach dem zweiten wehrt sich Mordrag!
	
	if	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_JoinNC, LOG_MISSION);
		Log_SetTopicStatus	(CH1_JoinNC, LOG_RUNNING);
	};
	B_LogEntry				(CH1_JoinNC,"Mordrag mi sl�bil, �e mi uk�e cestu do Nov�ho t�bora. Douf�m, �e to nen� l��ka!");

	self.aivar[AIV_PARTYMEMBER] = TRUE;
	
	Npc_ExchangeRoutine		(self,"GUIDE");
};

// **************************************************
//				AM NEWCMAP ANGEKOMMEN
// **************************************************

instance  Org_826_Mordrag_AtNewcamp(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_AtNewcamp_Condition;
	information	= Org_826_Mordrag_AtNewcamp_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_AtNewcamp_Condition()
{
	if 	( Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp) && Hlp_StrCmp(Npc_GetNearestWP(self),"OW_PATH_07_21") ) 
	{
		self.flags	= 0;
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_AtNewcamp_Info()
{
	if (Mordrag_GotoNC_Day > (Wld_GetDay()-2))
	{	
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_00"); //Tak, a jsme tady.
	}
	else
	{
		AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_LATE_11_00"); //Myslel jsem, �e u� nikdy nep�ijde�! Nevad� - jsme tady!
	};
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_01"); //Jakmile projde� branou, bude� v Nov�m t�bo�e. Promluv si s Laresem. Pom��e ti. Dej mu tohle. Je to n�dhern� prsten.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_02"); //To je tvoje vstupenka k Laresovi. Mus� m�t dobr� d�vod, abys ho mohl nav�t�vit.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_03"); //Dobr�, jak o tom p�em��l�m, mysl�m, �e tady na n�jak� �as z�stanu. U� jsem vyd�lal dost a ve Star�m t�bo�e je te� trochu dusno.
	AI_Output (self, other,"Org_826_Mordrag_AtNewcamp_11_04"); //Jestli chce�, p�ij� za mnou do baru - to je ta chatr� na jeze�e. D�vej pozor!
	AI_Output (other, self,"Org_826_Mordrag_AtNewcamp_15_05"); //Uvid�me se!
	
	CreateInvItems  (self, MordragsRing, 1);
	B_GiveInvItems	(self, other, MordragsRing, 1);

	B_GiveXP		(XP_ArrivedWithMordrag);	
	B_LogEntry		(CH1_JoinNC,"Stoj�me u p�edn� br�ny Nov�ho t�bora a Mordrag mi dal prsten, kter� m�m uk�zat v�dci bandit� Laresovi, pokud se chci p�idat k Nov�mu t�boru. Mordrag se chce na chvilku zastavit v baru na jeze�e.");
	var C_NPC lares; lares = Hlp_GetNpc(Org_801_Lares);
	Lares.aivar [AIV_FINDABLE]=TRUE;
	
	MordragKO_StayAtNC = TRUE;
	self.aivar[AIV_PARTYMEMBER] = FALSE;

	AI_StopProcessInfos	(self);
	
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
//					AUFS MAUL
// **************************************************

instance  Org_826_Mordrag_Fight (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_Fight_Condition;
	information	= Org_826_Mordrag_Fight_Info;
	permanent	= 0;
	description = "Tenhle t�bor nen� pro n�s dva dost velk�!";
};                       

FUNC int  Org_826_Mordrag_Fight_Condition()
{
	if ( (Thorus_MordragKo == LOG_RUNNING) && (!Npc_KnowsInfo(hero,Org_826_Mordrag_GotoNewcamp)) )
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_Fight_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_Fight_15_00"); //Tenhle t�bor nen� pro n�s dva dost velk�!
	AI_Output (self, other,"Org_826_Mordrag_Fight_11_01"); //Co pros�m?
	
	Info_ClearChoices(Org_826_Mordrag_Fight);
	Info_AddChoice   (Org_826_Mordrag_Fight,"Prost� odsud vypadni!",Info_Mordrag_Fight_GetAway);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Tady nen� m�sto pro lidi, kte�� kradou u Rudobaron�!",Info_Mordrag_Fight_OreBarons);
	Info_AddChoice	 (Org_826_Mordrag_Fight,"Poslal m� Thorus. Chce, abych t� prov�dy odstranil.",Info_Mordrag_Fight_Thorus);
};

FUNC VOID Info_Mordrag_Fight_GetAway()
{
	AI_Output (other, self,"Info_Mordrag_Fight_GetAway_15_00"); //Prost� odsud vypadni!
	AI_Output (self, other,"Info_Mordrag_Fight_GetAway_11_01"); //Velk� slova mal�ho chlapa...
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_OreBarons()
{
	AI_Output (other, self,"Info_Mordrag_Fight_OreBarons_15_00"); //Tady nen� m�sto pro lidi, kte�� kradou u Rudobaron�!
	AI_Output (self, other,"Info_Mordrag_Fight_OreBarons_11_01"); //�, tak tohle m� na mysli! Pro� ne�ekne� rovnou...
	
	MordragKO_PlayerChoseOreBarons = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

FUNC VOID Info_Mordrag_Fight_Thorus()
{
	AI_Output (other, self,"Info_Mordrag_Fight_Thorus_15_00"); //Poslal m� Thorus. Chce, abych t� prov�dy odstranil.
	AI_Output (self, other,"Info_Mordrag_Fight_Thorus_11_01"); //Opravdu? Thorus? To je v�echno, co jsem cht�l v�d�t...
	
	MordragKO_PlayerChoseThorus = TRUE;
	
	AI_StopProcessInfos(self);
	Npc_SetTarget(self, other);
	AI_StartState(self,ZS_Attack,1,"");
};

// **************************************************
//					HauAb
// **************************************************

instance  Org_826_Mordrag_HauAb(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 3;
	condition	= Org_826_Mordrag_HauAb_Condition;
	information	= Org_826_Mordrag_HauAb_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Org_826_Mordrag_HauAb_Condition()
{
	VAR C_NPC Mordrag;
	Mordrag = Hlp_GetNpc(Org_826_Mordrag);
	
	if (Mordrag.aivar[AIV_WASDEFEATEDBYSC] >= 1)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_HauAb_Info()
{
	AI_Output (other, self,"Org_826_HauAb_GotoNewcamp_15_00"); //Tak odsud vypadni...
	
	AI_StopProcessInfos	(self);
	
	MordragKO_HauAb = TRUE;
	
	B_LogEntry    (CH1_MordragKO,"Vyb�hl jsem s Mordragem a �ekl mu, �e ho u� nikdy nechci ve Star�m t�bo�e vid�t.");

	Npc_ExchangeRoutine	(self, "Start");
};
		
// **************************************************
//					GotoKalom
// **************************************************

instance  Org_826_Mordrag_GotoKalom(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalom_Condition;
	information	= Org_826_Mordrag_GotoKalom_Info;
	permanent	= 0;
	description = "Lares m� pro tebe zpr�vu.";
};                       

FUNC int  Org_826_Mordrag_GotoKalom_Condition()
{
	if 	(Npc_GetTrueGuild(other)!=GIL_ORG)
	&&	(Lares_InformMordrag == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalom_Info()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_00"); //Lares m� pro tebe zpr�vu.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_01"); //�ekni mi o tom.
	AI_Output (other, self,"Org_826_Mordrag_GotoKalom_15_02"); //Chce v�d�t, co se d�je v Sektovn�m t�bo�e a chce, abys mu to zjistil ty.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalom_11_03"); //M�m pocit, �e se ten probl�m vy�e�� s�m...

	B_LogEntry	(CH1_JoinNC,"�ekl jsem Mordragovi, co po mn� Lares cht�l. Mumlal n�co o tom, �e se v�ci vyvrb� samy. Nem�m tu�en�, co t�m m�l na mysli!");
};

// **************************************************
//					GotoKalom - NOW
// **************************************************
	var int Mordrag_GotoKalom;
// **************************************************

instance  Org_826_Mordrag_GotoKalomNOW(C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_GotoKalomNOW_Condition;
	information	= Org_826_Mordrag_GotoKalomNOW_Info;
	permanent	= 0;
	description = "Lares mi �ekl, abych ti pomohl s tou sekt��skou z�le�itost�.";
};                       

FUNC int  Org_826_Mordrag_GotoKalomNOW_Condition()
{
	if 	(Npc_GetTrueGuild(other)==GIL_ORG)
	&&	Npc_KnowsInfo(hero,ORG_801_Lares_GotoKalom)
	{
		return TRUE;
	};
};

FUNC VOID  Org_826_Mordrag_GotoKalomNOW_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_00"); //Lares mi �ekl, abych ti pomohl s tou sekt��skou z�le�itost�.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_01"); //Vid�... V�d�l jsem, �e se o to nebudu muset starat s�m.
	AI_Output			(other, self,"Org_826_Mordrag_GotoKalomNOW_15_02"); //Chce�, abych ten p��pad vy�e�il cel� j� s�m?
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_03"); //Jsem si jist�, �e to zvl�dne�. Poslouchej: d�le�it� je zjistit, co je pravdy na t�ch pov�stech o vz�v�n�.
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_04"); //V�m, ti sekt���t� bl�zni pl�nuj� velk� vz�v�n�. Co se m� t��e, j� ve Sp��e nev���m - jedna v�c je ale jist�:
	AI_Output			(self, other,"Org_826_Mordrag_GotoKalomNOW_11_05"); //Guru maj� ve sv� moci siln� kouzla. Proto bude lep�� v�d�t, o co p�jde. Rozum� mi?

	B_LogEntry			(CH1_GotoPsiCamp,"Mordrag provedl sv�j v�zv�dn� �kol v t�bo�e v ba�in�ch docela chyt�e. Guru se z�ejm� p�ipravuj� k velk�mu vz�v�n�, j� bych cht�l ale zn�t dal�� podrobnosti.");
	B_GiveXP			(XP_AssistMordrag);	
	
	Lares_InformMordrag = LOG_SUCCESS;
	Mordrag_GotoKalom = LOG_RUNNING;
	
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"M��e� mi d�t n�jak� podrobn�j�� pokyny?",Org_826_Mordrag_GotoKalomNOW_Precise);
	Info_AddChoice		(Org_826_Mordrag_GotoKalomNOW,"Uvid�m, co budu moci ud�lat.",Org_826_Mordrag_GotoKalomNOW_DoIt);

};

func void Org_826_Mordrag_GotoKalomNOW_Precise()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_Precise_15_00"); //M��e� mi d�t n�jak� podrobn�j�� pokyny?
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_Precise_11_01"); //�ekni Lesterovi. Kdysi jsem str�vil dlouhou dobu v Sektovn�m t�bo�e a on mi tam pom�hal. Pat�� k t�m dobr�m chlap�m.
	B_LogEntry(CH1_GotoPsiCamp,"V t�bo�e Bratrstva si m�m promluvit s novicem Lesterem. Zd� se, �e je d�v�ryhodn�, proto�e kdysi pomohl Mordragovi.");
};

func void Org_826_Mordrag_GotoKalomNOW_DoIt()
{
	AI_Output (other, self,"Org_826_Mordrag_GotoKalomNOW_DoIt_15_00"); //Uvid�m, co budu moci ud�lat.
	AI_Output (self, other,"Org_826_Mordrag_GotoKalomNOW_DoIt_11_01"); //Jakmile se dozv� o jejich pl�nech, vra� se a podej mi hl�en�.
	Info_ClearChoices	(Org_826_Mordrag_GotoKalomNOW);
	AI_StopProcessInfos	(self);
};

// **************************************************
//					RUNNING
// **************************************************

instance  Org_826_Mordrag_RUNNING (C_INFO)
{
	npc			= Org_826_Mordrag;
	nr			= 2;
	condition	= Org_826_Mordrag_RUNNING_Condition;
	information	= Org_826_Mordrag_RUNNING_Info;
	permanent	= 1;
	description = "O t� sekt��sk� z�le�itosti...";
};                       

FUNC int  Org_826_Mordrag_RUNNING_Condition()
{
	if (Mordrag_GotoKalom == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID  Org_826_Mordrag_RUNNING_Info()
{
	AI_Output			(other, self,"Org_826_Mordrag_RUNNING_15_00"); //O t� sekt��sk� z�le�itosti...
	AI_Output			(self, other,"Org_826_Mordrag_RUNNING_11_01"); //Co�e?

	if	(CorKalom_BringMCQBalls == LOG_SUCCESS)
	{
		if (Kapitel >= 3)
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_04"); //Nade�lo velk� vz�v�n�.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_09"); //Ne! Z��astnil ses toho jejich bl�znovstv�?
		}
		else
		{
			AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_06"); //Maj� v �myslu kontaktovat Sp��e prost�ednictv�m lektvaru, kter� vyrobili z vaj��ek d�ln�ch �erv�.
			AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_07"); //Jak po�etil�! Ty ��len� hlavy tomu v�emu opravdu v���, �e jo?
		};
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_10"); //Jsem zv�dav�, co z toho vzejde.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_11"); //J� taky. Dej mi v�d�t, a� z toho Guru kone�n� �pln� ze��l�.

		Mordrag_GotoKalom = LOG_SUCCESS;
		B_GiveXP			(XP_ReportToMordrag);
		Log_SetTopicStatus	(CH1_GotoPsiCamp,	LOG_SUCCESS);
		B_LogEntry			(CH1_GotoPsiCamp,"Mordrag se mohl potrhat sm�chy, kdy� jsem mu �ekl o vaj��k�ch d�ln�ho �erva. Vypad� to, �e u� ho vyzv�d�n� u guru p��li� nezaj�m�. Shled�v�m �e z�le�itost je vy�e�ena!");
	}
	else
	{
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_02"); //Nic jsme neobjevil.
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_03"); //Tak v tom pokra�uj...
	};

/*	
	//SN: Werde nicht gebraucht, da sie nicht zur Kapitel 2-6-Story passen!!!
		AI_Output		(other, self,"Org_826_Mordrag_RUNNING_15_08"); //Ich hab' die Eier bei mir.
		
		AI_Output		(self, other,"Org_826_Mordrag_RUNNING_11_05"); //(sarkastisch) Hab' ich auch gemerkt. Diese verdammten Sektenspinner haben Gomez die alte Mine gekostet. Wird nicht mehr lange dauern, dann stehen seine Gardisten bei UNS vor der T�r, um sich ihr Erz abzuholen...
*/
};
	
	













	




	
