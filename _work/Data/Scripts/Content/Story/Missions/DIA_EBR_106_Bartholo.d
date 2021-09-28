// **************************************
//					EXIT 
// **************************************

instance DIA_Bartholo_Exit (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 999;
	condition	= DIA_Bartholo_Exit_Condition;
	information	= DIA_Bartholo_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Bartholo_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Bartholo_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 					HAllo
// ************************************************************

INSTANCE Info_Bartholo_HAllo (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_HAllo_Condition;
	information	= Info_Bartholo_HAllo_Info;
	permanent	= 0;
	description = "Kdo jsi?";
};                       

FUNC INT Info_Bartholo_HAllo_Condition()
{	
	return 1;
};

FUNC VOID Info_Bartholo_HAllo_Info()
{
	AI_Output (other, self,"Info_Bartholo_HAllo_15_00"); //Kdo jsi?
	AI_Output (self, other,"Info_Bartholo_HAllo_12_01"); //Jmenuji se Bartholo. Starám se o to, aby Rudobaroni dostávali své dodávky.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_02"); //Mám toho na starosti spoustu - od drogy z bain a po potravinové zásoby pro eny.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_03"); //A taky mám na starosti dohlíet, aby ti pitomí kuchaøi odvádìli dobrou práci.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_04"); //Mìli by bıt excelentní. Gomez se nespokojí s ádnım šlendriánem. Posledními dvìma kuchaøi nakrmil ryby v øece.
};

// ************************************************************
// 					PERM TRADE
// ************************************************************

INSTANCE Info_Bartholo_PERM (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_PERM_Condition;
	information	= Info_Bartholo_PERM_Info;
	permanent	= 0;
	description = "Chtìl bych s tebou obchodovat.";
	Trade		= 1;
};                       

FUNC INT Info_Bartholo_PERM_Condition()
{	
//SN: Problematisch, da Bartholo auch einen wichtigen Schlüssel hat!
//	if (Npc_KnowsInfo(hero, Info_Bartholo_Hallo))
//	{
//		return 1;
//	};
};

FUNC VOID Info_Bartholo_PERM_Info()
{
	AI_Output (other, self,"Info_Bartholo_PERM_15_00"); //Chtìl bych s tebou obchodovat.
	AI_Output (self, other,"Info_Bartholo_PERM_12_01"); //Mùu toho nabídnout hodnì - pokud máš dost rudy.
};


// ************************************************************
// 					KRAUTBOTE von Kalom
// ************************************************************

INSTANCE Info_Bartholo_Krautbote (C_INFO)
{
	npc			= EBR_106_Bartholo;
	nr			= 4;
	condition	= Info_Bartholo_Krautbote_Condition;
	information	= Info_Bartholo_Krautbote_Info;
	permanent	= 1;
	description = "Mám pro Gomeze trochu drogy z bain. Posílá ji Cor Kalom.";
};                       

FUNC INT Info_Bartholo_Krautbote_Condition()
{	
	if (Kalom_Krautbote == LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID Info_Bartholo_Krautbote_Info()
{
	AI_Output				(other, self,"Info_Bartholo_Krautbote_15_00"); //Mám pro Gomeze trochu drogy z bain. Posílá ji Cor Kalom.
	AI_Output				(self, other,"Info_Bartholo_Krautbote_12_01"); //Uka mi to!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_02"); //Hmmmm...
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_03"); //Dobrá! Gomez u zaèíná bıt netrpìlivı. Máš štìstí, es to pøinesl u dneska!
		AI_Output			(other, self,"Info_Bartholo_Krautbote_15_04"); //A co takhle platit?
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_05"); //Ne tak zhurta... Ták, tady. 500 nugetù, jak to bylo domluveno.
		
		B_GiveInvItems  	(other,self,itmijoint_3,30);
		CreateInvItems  	(self,itminugget, 500);
		B_GiveInvItems		(self,other, itminugget, 500);

		Kalom_DeliveredWeed	= TRUE;
		B_LogEntry			(CH1_KrautBote,"Bartholo mi dal za zásilku drogy 500 nugetù. ");
		B_GiveXP			(XP_WeedShipmentDelivered);

		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //Na poslíèka té drogy moc nemáš! Doufám, es tu zásilku u nerozprodal nìkde jinde! Vra se, a budeš mít to správné mnoství!
	};
};

// **************************************************************************
// 				Wartet auf den SC
// **************************************************************************

instance  DIA_EBR_106_Bartholo_Wait4SC (C_INFO)
{
	npc				= EBR_106_Bartholo;
	condition		= DIA_EBR_106_Bartholo_Wait4SC_Condition;
	information		= DIA_EBR_106_Bartholo_Wait4SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_EBR_106_Bartholo_Wait4SC_Condition()
{	
	if	ExploreSunkenTower
	{
		return TRUE;
	};
};
FUNC void  DIA_EBR_106_Bartholo_Wait4SC_Info()
{
	AI_SetWalkmode		(self, NPC_WALK);
	AI_GotoNpc			(self, other);
	AI_Output			(self, other,"Info_Bartholo_12_01");	//Vìdìl jsem, e se k nám nìkdo pokouší dostat pøes pentagram!
	AI_Output			(self, other,"Info_Bartholo_12_02");	//Ale na rozdíl od toho zrádného kováøe Stonea tebe u nebudeme potøebovat!
	AI_Output			(other, self,"Info_Bartholo_15_03");	//Kde je Stone?
	AI_Output			(self, other,"Info_Bartholo_12_04");	//Za katrem! Ale ty budeš v okamiku pod drnem!
	AI_Output			(self, other,"Info_Bartholo_12_05");	//Dejte mu, chlapi, roztrhejte ho na kusy!

	AI_StopProcessInfos	(self);
	
	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(self, GIL_EBR);	
};
