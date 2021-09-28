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
	description = "Kim jeste�?";
};                       

FUNC INT Info_Bartholo_HAllo_Condition()
{	
	return 1;
};

FUNC VOID Info_Bartholo_HAllo_Info()
{
	AI_Output (other, self,"Info_Bartholo_HAllo_15_00"); //Kim jeste�?
	AI_Output (self, other,"Info_Bartholo_HAllo_12_01"); //Nazywam si� Bartholo. Zajmuj� si� zaopatrywaniem Magnat�w.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_02"); //Dostarczam im wszystkiego - od ziela, przez �ywno��, a� po kobiety.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_03"); //Opr�cz tego pilnuj� tych imbecyli z kuchni.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_04"); //Te b�azny powinny mi by� wdzi�czne. Gomez nie toleruje partactwa, nawet w kuchni. Poprzednich dw�ch kucharzy skarmi� topielcom w rzece.
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
	description = "Chc� dobi� z tob� targu.";
	Trade		= 1;
};                       

FUNC INT Info_Bartholo_PERM_Condition()
{	
//SN: Problematisch, da Bartholo auch einen wichtigen Schl�ssel hat!
//	if (Npc_KnowsInfo(hero, Info_Bartholo_Hallo))
//	{
//		return 1;
//	};
};

FUNC VOID Info_Bartholo_PERM_Info()
{
	AI_Output (other, self,"Info_Bartholo_PERM_15_00"); //Chc� dobi� z tob� targu.
	AI_Output (self, other,"Info_Bartholo_PERM_12_01"); //Mam sporo ciekawych rzeczy - je�li masz wystarczaj�co du�o rudy.
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
	description = "Mam tu troch� ziela dla Gomeza. Przysy�a je Cor Kalom.";
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
	AI_Output				(other, self,"Info_Bartholo_Krautbote_15_00"); //Mam tu troch� ziela dla Gomeza. Przysy�a je Cor Kalom.
	AI_Output				(self, other,"Info_Bartholo_Krautbote_12_01"); //Poka�!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_02"); //Hmmmmmm...
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_03"); //�wietnie! Gomez zacz�� si� ju� niecierpliwi�. Masz szcz�cie, �e przynios�e� je jeszcze dzisiaj!
		AI_Output			(other, self,"Info_Bartholo_Krautbote_15_04"); //A co z moj� zap�at�?
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_05"); //Spokojnie... Masz tu 500 bry�ek rudy. Taka by�a umowa.
		
		B_GiveInvItems  	(other,self,itmijoint_3,30);
		CreateInvItems  	(self,itminugget, 500);
		B_GiveInvItems		(self,other, itminugget, 500);

		Kalom_DeliveredWeed	= TRUE;
		B_LogEntry			(CH1_KrautBote,"Bartholo da� mi 500 bry�ek rudy za dostarczenie ziela.");
		B_GiveXP			(XP_WeedShipmentDelivered);

		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //Jak na pos�a�ca masz przy sobie troch� za ma�o ziela! Mam nadziej�, �e nie sprzeda�e� go komu� innemu! Wr��, jak b�dziesz mia� ca�� parti�.
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
	AI_Output			(self, other,"Info_Bartholo_12_01");	//Podejrzewa�em, �e pr�dzej czy p�niej kto� spr�buje u�y� pentagramu.
	AI_Output			(self, other,"Info_Bartholo_12_02");	//Ale w odr�nieniu od tego zdradzieckiego kowala, Stone'a, CIEBIE ju� nie potrzebujemy!
	AI_Output			(other, self,"Info_Bartholo_15_03");	//Gdzie jest Stone?
	AI_Output			(self, other,"Info_Bartholo_12_04");	//Za kratkami! Ale ciebie czeka mi�y, przytulny GR�B!
	AI_Output			(self, other,"Info_Bartholo_12_05");	//Bra� go, ch�opcy! Posieka� go!

	AI_StopProcessInfos	(self);
	
	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(self, GIL_EBR);	
};
