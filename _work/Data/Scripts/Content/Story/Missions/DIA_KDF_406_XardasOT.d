//#####################################################################
//##
//##
//##							KAPITEL 6
//##
//##
//#####################################################################
instance  Info_Xardas_OT (C_INFO)
{
	npc				= Kdf_406_OTXardas;
	condition		= Info_Xardas_OT_Condition;
	information		= Info_Xardas_OT_Info;
	important		= 1;
	permanent		= 0; 
};

FUNC int  Info_Xardas_OT_Condition()
{	
	if (Npc_GetDistToWP(self, "TPL_331") < 1000)
	{			
		return TRUE;
	}; 
};

FUNC void  Info_Xardas_OT_Info()
{
	AI_Output			(self, other,"Info_Xardas_OT_14_01"); //Nous n'avons pas beaucoup de temps, alors écoute soigneusement !
	AI_Output			(other, self,"Info_Xardas_OT_15_02"); //Comment as-tu fait....
	AI_Output			(self, other,"Info_Xardas_OT_14_03"); //Le Dormeur n'est pas si loin. J'ai dû utiliser tous mes pouvoirs pour en arriver là..
	AI_Output			(self, other,"Info_Xardas_OT_14_04"); //J'ai traduit les prophéties des Orcs et j'ai découvert de quoi il en retournait au sujet des cinq coeurs.
	AI_Output			(self, other,"Info_Xardas_OT_14_05"); //Les coeurs des cinq prêtres que tu as défaits ont été placés dans cinq tombeaux.
	AI_Output			(self, other,"Info_Xardas_OT_14_06"); //Ces tombeaux peuvent être ouverts, mais seules les lames ancestrales portées par les prêtres peuvent endommager les coeurs.
	AI_Output			(self, other,"Info_Xardas_OT_14_07"); //A présent tu dois percer les coeurs avec les cinq lames. Ainsi par ta volonté sera amené le Dormeur de ce monde.
	AI_Output			(other, self,"Info_Xardas_OT_15_08"); //J'ai compris !
	AI_Output			(self, other,"Info_Xardas_OT_14_09"); //Dépêches-toi, le réveil du démon de l'Archimonde est imminent, et ce fou de Cor Kalom et ses faux disciples sont ici.
	AI_Output			(self, other,"Info_Xardas_OT_14_10"); //Ils sont rassemblés dans la grande salle du Dormeur.
	AI_Output			(other, self,"Info_Xardas_OT_15_11"); //J'ai suffisamment souffert. Personne ne peut plus m'arrêter maintenant !
	AI_Output			(self, other,"Info_Xardas_OT_14_12"); //La puissance du Dormeur devient de plus en plus grande, je ne peux pas...
	AI_Output			(other, self,"Info_Xardas_OT_15_13"); //Quel est ton problème ?
	AI_Output			(self, other,"Info_Xardas_OT_14_14"); //Je... dois..

	Npc_ExchangeRoutine	(self,	"DRAINED"); 
	
	Log_CreateTopic		(CH6_Sleeper,	LOG_MISSION);
	Log_SetTopicStatus	(CH6_Sleeper,	LOG_RUNNING);
	B_LogEntry			(CH6_Sleeper,"Le temps est venu. Je dois être tout prés du lieu de repos du Dormeur. Xardas a soudainement apparu et m'a donné des instructions pour le combattre. Les cinq coeurs des chamans Orc non morts sont dans des lieux saints, je dois les percer avec les cinq lames que j'ai sur moi. C'est la seule façon de détruire le Dormeur. Cela à l'air simple...");
	
	AI_StopProcessInfos	(self);
};		
