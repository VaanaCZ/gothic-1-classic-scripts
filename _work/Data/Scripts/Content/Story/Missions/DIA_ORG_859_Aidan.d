// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Aidan_Exit (C_INFO)
{
	npc			= ORG_859_Aidan;
	nr			= 999;
	condition	= DIA_Aidan_Exit_Condition;
	information	= DIA_Aidan_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Aidan_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Aidan_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ****************************************
// 				Hallo
// ****************************************

instance DIA_Aidan_Hello (C_INFO)
{
	npc				= Org_859_Aidan;
	nr				= 1;
	condition		= DIA_Aidan_Hello_Condition;
	information		= DIA_Aidan_Hello_Info;
	permanent		= 0;
	description		= "Que fais-tu ici ?";
};

FUNC int  DIA_Aidan_Hello_Condition()
{	
	return 1;
};

func void  DIA_Aidan_Hello_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Que fais-tu ici ?
	AI_Output (self, other,"DIA_Aidan_Hello_13_01"); //Je suis un chasseur. Je gagne ma vie en vendant des peaux et des dents.
	AI_Output (other, self,"DIA_Aidan_Hello_15_02"); //C'est bien payé ?
	AI_Output (self, other,"DIA_Aidan_Hello_13_03"); //Si tu sais bien découper les bêtes, ouais.

	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Aidan, un chasseur vivant sur le chemin entre le Vieux et le Nouveau Camp , peut m'apprendre comment dépecer des animaux.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_859_Aidan_Creatures (C_INFO)
{
	npc			= Org_859_Aidan;
	nr			= 1;
	condition	= Org_859_Aidan_Creatures_Condition;
	information	= Org_859_Aidan_Creatures_Info;
	permanent	= 1;
	description = "Je veux apprendre comment dépecer des animaux.";
};                       

FUNC int  Org_859_Aidan_Creatures_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Aidan_Hello))
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_859_Aidan_Creatures_Info()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_15_00"); //Je veux apprendre comment dépecer des animaux.
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_13_01"); //Que veux-tu savoir ?
		
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice   (Org_859_Aidan_Creatures, DIALOG_BACK 											,Org_859_Aidan_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_859_Aidan_Creatures,"Extraction Dents (Coût : 1 point de compétence, 50 minerais)",Org_859_Aidan_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Enlèvement Fourrures (Coût : 1 point de compétence, 100 minerais)",Org_859_Aidan_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Enlèvement Griffes (Coût : 1 point de compétence, 50 minerais)",Org_859_Aidan_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Dépecer Reptiles (Coût : 1 point de compétence, 100 minerais)",Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //Je t'ai enseigné tout ce que je sais.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Zahn_15_00"); //Comment est-ce que je peux prendre les dents ?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Apprendre : Extraction de dent", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_01"); //La chose la plus importante est de s'assurer que les dents ne se brisent pas. Pour éviter cela, mets ton couteau près du centre de la dent et fait levier pour les extraire soigneusement.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_02"); //tu peux prendre les dents des loups, des ombres et des claque-machoîres.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Connaissance sur l'extraction de dents - loup, Chien Orc, claque-machoire, mordeur, chien de sang, bête de l'ombre.");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Tu as besoin de plus d'expérience, autrement ma connaissance ne te seras d'aucune utilité.
			PrintScreen	("Pas assez de points de compétence !", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Je veux voir un peu de minerai d'abord. Comme je le disais : Tout a son prix !
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Fell_15_00"); //Comment est-ce que je peux dépecer ces créatures ?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Apprendre : Enlèvement de la fourrure", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_01"); //Il est très important de les dépecer de l'avant vers l'arrière. Une fois que tu as ce coup de main, ce sera facile. Les fourrures ont une grande valeur !
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_02"); //Les fourrures des loups et des ombres peuvent être employées pour faire des vêtements. En examinant la fourrure d'un animal tué, tu sauras bientôt s'il peut être utilisé ou pas. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Connaissance sur enlèvement des peaux - loup, chien Orc, bête de l'ombre, troll");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Tu as besoin de plus d'expérience, autrement ma connaissance ne te seras d'aucune utilité.
			PrintScreen	("Pas assez de points de compétence !", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Je veux voir un peu de minerai d'abord. Comme je le disais : Tout a son prix !
	};
};

func void Org_859_Aidan_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Apprendre : Enlèvement de la mâchoire", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Montre-moi comment enlever les griffes !
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_01"); //En fait c'est très simple si tu sais quoi faire. Plie les griffes en avant - jamais vers l'arrière - et tu NE DOIS PAS tirer dessus non plus !
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Les griffes des lézards sont particulièrement utiles. Dorénavant, tu connaîtras quelles créatures ont des griffes à prendre.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Connaissance sur enlèvement de la mâchoire - lézard, Claque-machoire, Charognard, mordeur, Razeur");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Tu as besoin de plus d'expérience, autrement ma connaissance ne te seras d'aucune utilité.
			PrintScreen	("Pas assez de points de compétence !", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Je veux voir un peu de minerai d'abord. Comme je le disais : Tout a son prix !
	};
};

func void Org_859_Aidan_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Apprendre : Dépeçage de lézards", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_859_Aidan_Creatures_Haut_15_00"); //Qu'est-ce que je dois étudier en dépeçant des reptiles ?
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_01"); //Les seuls reptiles appropriés à cette fin sont des tapirs et des Requins des marais.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_02"); //Si tu fends la peau sur les côtés, elle s'épluchera toute seule. Dorénavant tu devrais pouvoir dépecer des reptiles.
				
			Knows_GetHide = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Connaissance sur le dépeçage - Charognard, requin des marais");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Tu as besoin de plus d'expérience, autrement ma connaissance ne te seras d'aucune utilité.
			PrintScreen	("Pas assez de points de compétence !", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Je veux voir un peu de minerai d'abord. Comme je le disais : Tout a son prix !
	};
};
