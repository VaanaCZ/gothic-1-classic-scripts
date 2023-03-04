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
	description = "Qui es-tu ?";
};                       

FUNC INT Info_Bartholo_HAllo_Condition()
{	
	return 1;
};

FUNC VOID Info_Bartholo_HAllo_Info()
{
	AI_Output (other, self,"Info_Bartholo_HAllo_15_00"); //Qui es-tu ?
	AI_Output (self, other,"Info_Bartholo_HAllo_12_01"); //Mon nom est Bartholo. Je vois que les Barons du minerai ont leurs approvisionnements.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_02"); //Je suis responsable de pas mal de choses - des approvisionnements d'Herbe à la nourriture en passant par les provisions pour les femmes
	AI_Output (self, other,"Info_Bartholo_HAllo_12_03"); //En outre, je m'assure que ces idiots de cuisiniers font bien leur travail.
	AI_Output (self, other,"Info_Bartholo_HAllo_12_04"); //Ils devraient être reconnaissants. Gomez n'accepterait pas qu'on lui serve de la merde. Il a jeté en pâture les deux derniers cuisiniers aux bêtes du fleuve.
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
	description = "Je veux passer un marché avec toi.";
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
	AI_Output (other, self,"Info_Bartholo_PERM_15_00"); //Je veux faire affaire avec toi.
	AI_Output (self, other,"Info_Bartholo_PERM_12_01"); //Je peux faire une grosse offre - si tu possèdes assez de minerai.
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
	description = "J'ai de l'Herbe ici pour Gomez. Cor Kalom l'envoie.";
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
	AI_Output				(other, self,"Info_Bartholo_Krautbote_15_00"); //J'ai de l'Herbe ici pour Gomez. Cor Kalom l'envoie.
	AI_Output				(self, other,"Info_Bartholo_Krautbote_12_01"); //Montre moi!
	
	if (Npc_HasItems(other, itmijoint_3) >= 30)
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_02"); //Hmmmmmmm...
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_03"); //Bien ! Gomez était devenu impatient. Une chance pour toi que tu l'as livré aujourd'hui !
		AI_Output			(other, self,"Info_Bartholo_Krautbote_15_04"); //Quel est le salaire?
		AI_Output			(self, other,"Info_Bartholo_Krautbote_12_05"); //Pas si vite... Prends ça. 500 minerais, c'est ce dont nous avons convenu.
		
		B_GiveInvItems  	(other,self,itmijoint_3,30);
		CreateInvItems  	(self,itminugget, 500);
		B_GiveInvItems		(self,other, itminugget, 500);

		Kalom_DeliveredWeed	= TRUE;
		B_LogEntry			(CH1_KrautBote,"Bartholo m'a donné 500 minerais pour l'Herbe délivrée.");
		B_GiveXP			(XP_WeedShipmentDelivered);

		Info_Bartholo_Krautbote.permanent = 0;
	}
	else
	{
		AI_Output			(self, other,"Info_Bartholo_Krautbote_NoKraut_12_00"); //Tu n'as pas assez de Herbe pour être un coursier ! J'espère pour toi que tu n'as pas vendu la marchandise ailleurs ! Reviens quand tu auras la bonne quantité !
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
	AI_Output			(self, other,"Info_Bartholo_12_01");	//J'ai su que quelqu'un essayerait de nous nuire à travers le pentacle !
	AI_Output			(self, other,"Info_Bartholo_12_02");	//Mais, à la différence de ce fourbe de Stone le forgeron,on n'a plus besoin de toi !
	AI_Output			(other, self,"Info_Bartholo_15_03");	//Ou est Stone ?
	AI_Output			(self, other,"Info_Bartholo_12_04");	//En prison ! Mais tu vas être six pieds sous terre dans une minute !
	AI_Output			(self, other,"Info_Bartholo_12_05");	//Prenez-le, les gars, et découpez-le en rondelles !

	AI_StopProcessInfos	(self);
	
	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	(self, GIL_EBR);	
};
