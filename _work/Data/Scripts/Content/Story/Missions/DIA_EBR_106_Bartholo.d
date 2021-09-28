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
	description = "Kim jesteœ?";
};                       

FUNC INT Info_Bartholo_HAllo_Condition()
{	
	return 1;
};

FUNC VOID Info_Bartholo_HAllo_Info()
{
	AI_Output (other, self,"Info_Bartholo_HAllo_15_00"); //Kim jesteœ?
	AI_Output (self, other,"Info_Bartholo_HAllo_12_01"); //Nazywam siê Bartholo. Zajmujê siê zaopatrywaniem Magnatów.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_02"); //Dostarczam im wszystkiego - od ziela, przez ¿ywnoœæ, a¿ po kobiety.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_03"); //Oprócz tego pilnujê tych imbecyli z kuchni.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_04"); //Te b³azny powinny mi byæ wdziêczne. Gomez nie toleruje partactwa, nawet w kuchni. Poprzednich dwóch kucharzy skarmi³ topielcom w rzece.
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
	description = "Chcê dobiæ z tob¹ targu.";
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
	AI_Output (other, self,"Info_Bartholo_PERM_15_00"); //Chcê dobiæ z tob¹ targu.
	AI_Output (self, other,"Info_Bartholo_PERM_12_01"); //Mam sporo ciekawych rzeczy - jeœli masz wystarczaj¹co du¿o rudy.
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
	description = "Mam tu trochê ziela dla Gomeza. Przysy³a je Cor Kalom.";
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
	AI_Output				(other, self,"Info_Bartholo_Krautbote_15_00"); //Mam tu trochê ziela dla Gomeza. Przysy³a je Cor Kalom.
	AI_Output				(self, other,"Info_Bartholo_Krautbote_12_01"); //Poka¿!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_02"); //Hmmmmmm...
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_03"); //Œwietnie! Gomez zacz¹³ siê ju¿ niecierpliwiæ. Masz szczêœcie, ¿e przynios³eœ je jeszcze dzisiaj!
		AI_Output			(other, self,"Info_Bartholo_Krautbote_15_04"); //A co z moj¹ zap³at¹?
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_05"); //Spokojnie... Masz tu 500 bry³ek rudy. Taka by³a umowa.
		
		B_GiveInvItems  	(other,self,itmijoint_3,30);
		CreateInvItems  	(self,itminugget, 500);
		B_GiveInvItems		(self,other, itminugget, 500);

		Kalom_DeliveredWeed	= TRUE;
		B_LogEntry			(CH1_KrautBote,"Bartholo da³ mi 500 bry³ek rudy za dostarczenie ziela.");
		B_GiveXP			(XP_WeedShipmentDelivered);

		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //Jak na pos³añca masz przy sobie trochê za ma³o ziela! Mam nadziejê, ¿e nie sprzeda³eœ go komuœ innemu! Wróæ, jak bêdziesz mia³ ca³¹ partiê.
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
	AI_Output			(self, other,"Info_Bartholo_12_01");	//Podejrzewa³em, ¿e prêdzej czy póŸniej ktoœ spróbuje u¿yæ pentagramu.
	AI_Output			(self, other,"Info_Bartholo_12_02");	//Ale w odró¿nieniu od tego zdradzieckiego kowala, Stone'a, CIEBIE ju¿ nie potrzebujemy!
	AI_Output			(other, self,"Info_Bartholo_15_03");	//Gdzie jest Stone?
	AI_Output			(self, other,"Info_Bartholo_12_04");	//Za kratkami! Ale ciebie czeka mi³y, przytulny GRÓB!
	AI_Output			(self, other,"Info_Bartholo_12_05");	//Braæ go, ch³opcy! Posiekaæ go!

	AI_StopProcessInfos	(self);
	
	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(self, GIL_EBR);	
};
