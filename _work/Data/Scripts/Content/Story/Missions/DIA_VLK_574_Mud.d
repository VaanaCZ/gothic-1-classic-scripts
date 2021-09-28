// **************************************************
var int Mud_Nerve;
const int NerveSec = 30;
var int Mud_NerveRealized;
// **************************************************

// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Mud_Exit (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Exit_Condition;
	information	= DIA_Mud_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Mud_Exit_Condition()
{
	//if (Npc_KnowsInfo(hero, DIA_Mud_FirstEXIT))
	//{
		return 1;
	//};
};

FUNC VOID DIA_Mud_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						First + EXIT
// **************************************************

INSTANCE DIA_Mud_FirstEXIT (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 1;
	condition	= DIA_Mud_FirstEXIT_Condition;
	information	= DIA_Mud_FirstEXIT_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Mud_FirstEXIT_Condition()
{
	if (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist)
	{
		return 1;
	};
};

FUNC VOID DIA_Mud_FirstEXIT_Info()
{
	AI_Output (self, other,"DIA_Mud_FirstEXIT_07_00"); //Hej, èlovìèe! Nìjaké noviny? Nikdy jsem tì tu nevidìl.
	AI_Output (self, other,"DIA_Mud_FirstEXIT_07_01"); //Jestli dovolíš, na chvilku se k tobì pøidám. Urèitì potøebuješ pøítele.
	Info_ClearChoices(DIA_Mud_FirstEXIT);
	Info_AddChoice	 (DIA_Mud_FirstEXIT,"Ztra se!",DIA_Mud_FirstEXIT_Verpiss);
	Info_AddChoice	 (DIA_Mud_FirstEXIT,"Proè ne - pojï.",DIA_Mud_FirstEXIT_Komm);
};

func void DIA_Mud_FirstEXIT_Verpiss()
{
	AI_Output (other, self,"DIA_Mud_FirstEXIT_Verpiss_15_00"); //Ztra se!
	AI_Output (self, other,"DIA_Mud_FirstEXIT_Verpiss_07_01"); //Ty dneska nemáš dobrou náladu, viï? Radìji s tebou pùjdu.
	Info_ClearChoices(DIA_Mud_FirstEXIT);
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"FOLLOW");
};

func void DIA_Mud_FirstEXIT_Komm()
{
	AI_Output (other, self,"DIA_Mud_FirstEXIT_Komm_15_00"); //Proè ne - pojï.
	AI_Output (self, other,"DIA_Mud_FirstEXIT_Komm_07_01"); //Výbornì! Mùžeme si po cestì popovídat.
	Info_ClearChoices(DIA_Mud_FirstEXIT);
	AI_StopProcessInfos	( self );
	Npc_ExchangeRoutine (self,"FOLLOW");
};

// **************************************************
// 					Shut Up!
// **************************************************

INSTANCE DIA_Mud_ShutUp (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 3;
	condition	= DIA_Mud_ShutUp_Condition;
	information	= DIA_Mud_ShutUp_Info;
	permanent	= 1;
	description	= "Mohl bys být, PROSÍM, chvilku zticha?";
};                       

FUNC INT DIA_Mud_ShutUp_Condition()
{
	
	if (Mud_NerveRealized == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Mud_ShutUp_Info()
{
	AI_Output (other, self,"DIA_Mud_ShutUp_15_00"); //Mohl bys být, PROSÍM, chvilku zticha?
	AI_Output (self, other,"DIA_Mud_ShutUp_07_01"); //Jistì.
	Npc_SetRefuseTalk(self, 300);
};

// **************************************************
// 					Verpiß dich
// **************************************************

INSTANCE DIA_Mud_GetLost (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 2;
	condition	= DIA_Mud_GetLost_Condition;
	information	= DIA_Mud_GetLost_Info;
	permanent	= 1;
	description	= "Ztra se!";
};                       

FUNC INT DIA_Mud_GetLost_Condition()
{
	return 1;
};

FUNC VOID DIA_Mud_GetLost_Info()
{
	AI_Output (other, self,"DIA_Mud_GetLost_15_00"); //Ztra se!
	AI_Output (self, other,"DIA_Mud_GetLost_07_01"); //Chceš být chvilku sám, viï? Rozumím... Budu se držet vzadu.
};

// **************************************************
// 					DEFEATED
// **************************************************

INSTANCE DIA_Mud_Defeated (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 1;
	condition	= DIA_Mud_Defeated_Condition;
	information	= DIA_Mud_Defeated_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Defeated_Condition()
{
	if (self.aivar[AIV_WASDEFEATEDBYSC]==TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Mud_Defeated_Info()
{
	AI_Output (self, other,"DIA_Mud_GetLost_07_00"); //Hej, èlovìèe, tys mì praštil! Proè?
	AI_Output (other, self,"DIA_Mud_GetLost_15_01"); //Za okamžik tì praštím znovu! Jen tak!
	AI_Output (self, other,"DIA_Mud_GetLost_07_02"); //Ty jsi šílenej, èlovìèe! Nechci s tebou nic mít!
	
	AI_StopProcessInfos	(self);
	Npc_ExchangeRoutine(self,"START");
};

// **************************************************
// 						 Nerve 0 
// **************************************************

INSTANCE DIA_Mud_Nerve_0 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_0_Condition;
	information	= DIA_Mud_Nerve_0_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_0_Condition()
{
	if ( (Mud_Nerve==0) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_0_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_0_07_00"); //Øekni mi, kam jdeme? Nebo to má být pøekvapení? Miluju pøekvapení.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 1;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 1 
// **************************************************

INSTANCE DIA_Mud_Nerve_1 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_1_Condition;
	information	= DIA_Mud_Nerve_1_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_1_Condition()
{
	if ( (Mud_Nerve==1) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_1_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_1_07_00"); //Mì si nevšímej. Já ti neuteèu, neboj se.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 2;
	Mud_NerveRealized = TRUE;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 2 
// **************************************************

INSTANCE DIA_Mud_Nerve_2 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_2_Condition;
	information	= DIA_Mud_Nerve_2_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_2_Condition()
{
	if ( (Mud_Nerve==2) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_2_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_2_07_00"); //Už máš nìjaký plán, kam chceš dojít? Hledáš klidné místeèko? Kde si budeme moci trochu popovídat nebo tak?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 3;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 3
// **************************************************

INSTANCE DIA_Mud_Nerve_3 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_3_Condition;
	information	= DIA_Mud_Nerve_3_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_3_Condition()
{
	if ( (Mud_Nerve==3) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_3_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_3_07_00"); //Už máš nìjaký plán, kam chceš dojít? Hledáš klidné místeèko? Kde si budeme moci trochu popovídat nebo tak?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 4;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 4
// **************************************************

INSTANCE DIA_Mud_Nerve_4 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_4_Condition;
	information	= DIA_Mud_Nerve_4_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_4_Condition()
{
	if ( (Mud_Nerve==4) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_4_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_4_07_00"); //Je možné, že chodíme do kruhu? Zdá se mi, že nevíš, kam chceš dojít...
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 5;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 5
// **************************************************

INSTANCE DIA_Mud_Nerve_5 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_5_Condition;
	information	= DIA_Mud_Nerve_5_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_5_Condition()
{
	if ( (Mud_Nerve==5) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_5_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_5_07_00"); //To je legraèní. Díky, že jsi mì vzal sebou. Mohli bysme to dìlat èastìji, dneska ještì zbývá hromada èasu.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 6;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 6
// **************************************************

INSTANCE DIA_Mud_Nerve_6 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_6_Condition;
	information	= DIA_Mud_Nerve_6_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_6_Condition()
{
	if ( (Mud_Nerve==6) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_6_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_6_07_00"); //Už jsem si na tebe zvykl. Užijeme si spolu spoustu legrace, tím jsem si jistý. Co ty na to? Kde vùbec spíš? Mùžeš pøijít ke mnì, žádný problém.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 7;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 7
// **************************************************

INSTANCE DIA_Mud_Nerve_7 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_7_Condition;
	information	= DIA_Mud_Nerve_7_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_7_Condition()
{
	if ( (Mud_Nerve==7) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_7_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_7_07_00"); //Proè tì sem vùbec strèili? Máš rád taky zvíøátka? Nemìli pro to vùbec pochopení. Proto jsem tady zavøenej.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 8;
	AI_StopProcessInfos	( self );
};


// **************************************************
// 						 Nerve 8
// **************************************************

INSTANCE DIA_Mud_Nerve_8 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_8_Condition;
	information	= DIA_Mud_Nerve_8_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_8_Condition()
{
	if ( (Mud_Nerve==8) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_8_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_8_07_00"); //Jsou tady lidi, kteøí se mì soustavnì pokoušejí mlátit. Hrozný chlapi z Nového tábora. Opravdoví hrdloøezi. Pøíštì jim øeknu, a si to vyøídí s tebou. To je k smrti vydìsí.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 9;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 9
// **************************************************

INSTANCE DIA_Mud_Nerve_9 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_9_Condition;
	information	= DIA_Mud_Nerve_9_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_9_Condition()
{
	if ( (Mud_Nerve==9) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_9_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_9_07_00"); //Ti bastardi z Nového tábora budou pøekvapení, až se dozvìdí, že mám ochránce. Podìlaj se strachy. To bude legrace. Obvykle jsou s lidmi hotoví razdva, ale teï se budou rozmýšlet dvakrát.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 10;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 10
// **************************************************

INSTANCE DIA_Mud_Nerve_10 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_10_Condition;
	information	= DIA_Mud_Nerve_10_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_10_Condition()
{
	if ( (Mud_Nerve==10) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_10_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_10_07_00"); //Víš co? Udìlám ti laskavost. Pøimluvím se za tebe a pak tì snad pøijmou do tábora. Pak bysme se mohli scházet každý den.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 11;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 11
// **************************************************

INSTANCE DIA_Mud_Nerve_11 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_11_Condition;
	information	= DIA_Mud_Nerve_11_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_11_Condition()
{
	if ( (Mud_Nerve==11) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_11_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_11_07_00"); //Nìkteøí lidé si myslí, že jsem úplný cvok. Ale nìkdo jako ty, by mì nikdy nemìl brát jako blázna. Lidé by o tom mìli mluvit. Pak by nakonec pochopili, že se ve mnì mýlili.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 12;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 12
// **************************************************

INSTANCE DIA_Mud_Nerve_12 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_12_Condition;
	information	= DIA_Mud_Nerve_12_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_12_Condition()
{
	if ( (Mud_Nerve==12) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_12_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_12_07_00"); //Jsi tady mùj nejlepší pøítel. Ostatní se mì celou dobu chtìjí akorát zbavit. Jsem ti opravdu vdìèný.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 13;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 13
// **************************************************

INSTANCE DIA_Mud_Nerve_13 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_13_Condition;
	information	= DIA_Mud_Nerve_13_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_13_Condition()
{
	if ( (Mud_Nerve==13) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_13_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_13_07_00"); //Poslyš, tohle chození dokola je dost únavné. Nemìli bysme se poohlédnout po nìjakém pøíjemném místeèku a udìlat si trochu pohodlí?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 14;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 14
// **************************************************

INSTANCE DIA_Mud_Nerve_14 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_14_Condition;
	information	= DIA_Mud_Nerve_14_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_14_Condition()
{
	if ( (Mud_Nerve==14) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_14_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_14_07_00"); //Pøipadáš mi jako starší bratr. Nikdy jsem nemìl staršího bratra. Ani mladšího. Mí rodièe mì nechtìli. Ale urèitì to pro nì bylo složité.
	AI_Output (other, self,"DIA_Mud_Nerve_14_15_01"); //Urèitì bylo.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 15;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 15
// **************************************************

INSTANCE DIA_Mud_Nerve_15 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_15_Condition;
	information	= DIA_Mud_Nerve_15_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_15_Condition()
{
	if ( (Mud_Nerve==15) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_15_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_15_07_00"); //Odkud jsi? Musíš být šastný, že jsi koneènì našel nìkoho, kdo ti rozumí. Já jsem z Khorinisu. Byls tam nìkdy? Dobrá, to vùbec nevadí.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 16;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 16
// **************************************************

INSTANCE DIA_Mud_Nerve_16 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_16_Condition;
	information	= DIA_Mud_Nerve_16_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_16_Condition()
{
	if ( (Mud_Nerve==16) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_16_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_16_07_00"); //Máš pro mì nìco k jídlu? Jsem nìco jako návštìvník, a tak by bylo slušné, kdybys mi nìco dal. To jsou zvyky. To mì uèili mí pøátelé v Khorinisu. Mìli mì doopravdy rádi.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 17;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 17
// **************************************************

INSTANCE DIA_Mud_Nerve_17 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_17_Condition;
	information	= DIA_Mud_Nerve_17_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_17_Condition()
{
	if ( (Mud_Nerve==17) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_17_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_17_07_00"); //Myslíš, že nás ještì nìkdo pøijde navštívit? Asi ne, nikdo by se sem nedostal, že ne?
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 18;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 18
// **************************************************

INSTANCE DIA_Mud_Nerve_18 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_18_Condition;
	information	= DIA_Mud_Nerve_18_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_18_Condition()
{
	if ( (Mud_Nerve==18) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_18_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_18_07_00"); //Teï, když jsi se mnou, mohli bysme pár lidem dát nakládaèku. Ti bastardi mì už léta otravovali. Až nìkoho z nich uvidím, øeknu mu pár vìcí.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 19;
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						 Nerve 19
// **************************************************

INSTANCE DIA_Mud_Nerve_19 (C_INFO)
{
	npc			= Vlk_574_Mud;
	nr 			= 999;
	condition	= DIA_Mud_Nerve_19_Condition;
	information	= DIA_Mud_Nerve_19_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_Mud_Nerve_19_Condition()
{
	if ( (Mud_Nerve==19) && (Npc_RefuseTalk(self)==FALSE) && (Npc_GetDistToNpc(self,hero) < ZivilAnquatschDist) && (self.aivar[AIV_WASDEFEATEDBYSC] == FALSE ))	{	return 1;	};
};

FUNC VOID DIA_Mud_Nerve_19_Info()
{
	AI_Output (self, other,"DIA_Mud_Nerve_19_07_00"); //My dva jsme snový tým. Mohli bysme ovládnout Starý tábor. Rudobaroni by nepøedstavovali problém, dokud bysme byli tým. Vymyslím nìjaký plán.
	Npc_SetRefuseTalk(self, NerveSec);
	Mud_Nerve = 0;
	AI_StopProcessInfos	( self );
};
