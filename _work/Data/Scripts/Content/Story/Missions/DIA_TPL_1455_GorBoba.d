// infos 
instance Info_TPL_1455_GorBoba (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba_Condition;
	information		= Info_TPL_1455_GorBoba_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int Info_TPL_1455_GorBoba_Condition()
{
	return TRUE;
};

func void Info_TPL_1455_GorBoba_Info()
{
	AI_Output (self, other,"Info_TPL_1455_GorBoba_08_01"); //Fous le camp, on ne veut pas de toi ici.
};


instance Info_TPL_1455_GorBoba1 (C_INFO)
{
	npc				= TPL_1455_GorBoba;
	condition		= Info_TPL_1455_GorBoba1_Condition;
	information		= Info_TPL_1455_GorBoba1_Info;
	important		= 0;
	permanent		= 0;
	description 	= "Et TU vas m'arrêter ?";	
};

FUNC int Info_TPL_1455_GorBoba1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1455_GorBoba )) {
		return 1;
	};	
};

func void Info_TPL_1455_GorBoba1_Info()
{
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_01"); //Et TU vas m'arrêter ?
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_02"); //OUI ! Je t'arrêterai - tu n'empêcheras pas Maître Kalom de réveiller le Dormeur.
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_03"); //N'essaye pas de m'attaquer, le haut prêtre a transféré une partie de sa puissance à maître Kalom et à nous. Maintenant nous sommes immortels.
	AI_Output (other, self,"Info_TPL_1455_GorBoba1_15_04"); //Je vais te montrer comment tu es immortel !
	AI_Output (self, other,"Info_TPL_1455_GorBoba1_08_05"); //Prépare-toi à rencontrer ton Créateur !

	AI_StopProcessInfos	( self );
	
	Log_CreateTopic        ( "Orktempel", LOG_NOTE );
	B_LogEntry            ( "Orktempel","GorBoba a voulu m'arrêter. Il m'a dit que Kalom et ses partisans ont reçu des pouvoirs de la part du grand prêtre pour les rendre invincibles aux armes humaines."); 

	Npc_SetAttitude 		( self, ATT_HOSTILE );
	Npc_SetTempAttitude 	( self, ATT_HOSTILE );	
};
