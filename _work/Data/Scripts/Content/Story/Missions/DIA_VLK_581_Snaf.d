// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Snaf_Exit (C_INFO)
{
	npc			= Vlk_581_Snaf;
	nr			= 999;
	condition	= DIA_Snaf_Exit_Condition;
	information	= DIA_Snaf_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Snaf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Snaf_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Snaf_Hello (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Hello_Condition;
	information		= DIA_Snaf_Hello_Info;
	permanent		= 0;
	description		= "Comment vont les choses ?";
};

FUNC INT DIA_Snaf_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Snaf_Hello_Info()
{
	AI_Output (other, self,"DIA_Snaf_Hello_15_00"); //Comment vont les choses ?
	AI_Output (self, other,"DIA_Snaf_Hello_01_01"); //Pas mauvais. Si tu peux bien cuisiner, tu as pleins d'amis par ici.
	AI_Output (self, other,"DIA_Snaf_Hello_01_02");	//Veux-tu un peu de mon ragoût de riz ?
	AI_Output (other, self,"DIA_Snaf_Hello_15_03"); //Merci.
	AI_Output (self, other,"DIA_Snaf_Hello_01_04");	//Tu pourrais me rendre un service.
	
	CreateInvItem (self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};

// **************************************************
// 				Bring Zutaten
// **************************************************
	var int Snaf_Zutaten; 
	var int Snaf_FreeMBRagout;
// **************************************************

INSTANCE DIA_Snaf_Zutaten (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Zutaten_Condition;
	information		= DIA_Snaf_Zutaten_Info;
	permanent		= 0;
	description		="Qu'est-ce que je peux faire pour toi ?";
};

FUNC INT DIA_Snaf_Zutaten_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Zutaten_Info()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_15_00"); //Qu'est-ce que je peux faire pour toi ?
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_01"); //De la bonne nourriture doit t'être utile. J'ai une nouvelle recette : ragoût d'insecte a la Snaf avec du riz et des champignons.
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_02"); //tu peux en avoir autant que tu en veux, mais j'ai encore besoin de 3 insectes et des champignons infernaux - 5 devrait suffire.
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"Tu veux que je le jette ?",DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"Ca semble bien.",DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_KOTZ_15_00"); //Tu veux que je le jette ?
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_01"); //Tu n'as pas à le manger, mais je crois que tu devrais essayé ! Si tu essayes, pense à moi.
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_02"); //J'ai déjà envoyé quelqu'un mais il n'est pas revenu - il a dû déserté vers le Nouveau Camp.
	Snaf_Zutaten = LOG_RUNNING;
	
	Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"Snaf, le cuisinier qui vit dans l'Anneau Extérieur du Vieux Camp, m'a envoyé obtenir 3 viandes d'insecte et 5 champignons infernaux pour une nouvelle recette.");
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_DoIt_15_00"); //Ca semble bien.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_01"); //Alors part et reviens avec ce que je t'ai demandé.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_02"); //Le dernier que j'ai envoyé n'est pas revenu - il a dû déserté vers le Nouveau Camp.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
		
    Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"Snaf, le cuisinier qui vit dans l'Anneau Extérieur du Vieux Camp , m'a envoyé obtenir 3 viandes d'insecte et 5 champignons infernaux pour une nouvelle recette. Je pourrai en avoir quand tout sera fini.");		
			
	Info_ClearChoices(DIA_Snaf_Zutaten);	
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Snaf_ZutatenSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_ZutatenSuccess_Condition;
	information		= DIA_Snaf_ZutatenSuccess_Info;
	permanent		= 0;
	description		= "J'ai les choses que tu voulez !";
};

FUNC INT DIA_Snaf_ZutatenSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Mushroom_01)>=5) && (Npc_HasItems(other,ItAt_Meatbug_01)>=3) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_ZutatenSuccess_Info()
{
	AI_Output (other, self,"DIA_Snaf_ZutatenSuccess_15_00"); //J'ai les choses que tu voulez !
	AI_Output (self, other,"DIA_Snaf_ZutatenSuccess_01_01"); //Bien, je dois juste les ajouter, et le ragoût sera prêt... Attend ...
	
	CreateInvItems(other, ItFo_Plants_Mushroom_01, 3);
	B_GiveInvItems(other,self,ItFo_Plants_Mushroom_01,8);//Notwendig zur Anzeige 8 Items übergeben, wird sofort angepasst
	
	Npc_RemoveInvItems(self, ItFo_Plants_Mushroom_01, 8);//Alle Zutaten weg
	Npc_RemoveInvItems(other, ItAt_MeatBug_01, 3);
	
	CreateInvItems(self, ItFoMeatbugragout,3);
	B_GiveInvItems(self, other,ItFoMeatbugragout,3);
	
	Snaf_Zutaten = LOG_SUCCESS;
	
	Log_SetTopicStatus	(CH1_SnafsRecipe, LOG_SUCCESS);
	B_LogEntry			(CH1_SnafsRecipe,"Snaf a été vraiment satisfait quand je lui ai donné les ingrédients.");
	
	if Snaf_FreeMBRagout==TRUE
	{
	    B_LogEntry( CH1_SnafsRecipe,"Dorénavant, il me donnera du ragoût d'insecte chaque jour.");
	};
	
	B_GiveXP(100);
	
	AI_StopProcessInfos	(self);
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************
	var int Snaf_RagoutDay;
// **************************************************

INSTANCE DIA_Snaf_AfterSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_AfterSuccess_Condition;
	information		= DIA_Snaf_AfterSuccess_Info;
	permanent		= 1;
	description		= "Tu m'as dit que je pouvais prendre autant de ragoût que je voulais...";
};

FUNC INT DIA_Snaf_AfterSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_SUCCESS) && (Snaf_FreeMBRagout==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_AfterSuccess_Info()
{
 	AI_Output (other, self,"DIA_Snaf_AfterSuccess_15_00"); //Tu m'as dit que je pouvais prendre autant de ragoût que je voulais...
 	
 	if (Snaf_RagoutDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_01"); //Et c'est vrai. Tiens, prend ces 3 portions.
		CreateInvItems(self, ItFoMeatbugragout,3);
		B_GiveInvItems(self, other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_02"); //Biens sûr ! Mais il n'y a plus rien aujourd'hui. Revient demain !
	};
};

// **************************************************
// 					Wo Fleischwanzen
// **************************************************

INSTANCE DIA_Snaf_WhereMeatbugs (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 3;
	condition		= DIA_Snaf_WhereMeatbugs_Condition;
	information		= DIA_Snaf_WhereMeatbugs_Info;
	permanent		= 0;
	description		= "Où puis-je trouver de la viande d'insecte ?";
};

FUNC INT DIA_Snaf_WhereMeatbugs_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMeatbugs_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMeatbugs_15_00"); //Où puis-je trouver des insectes ?
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_01"); //Partout où il y a des ordures. Tu devrais en trouver dans les cabanes abandonnées prés des murs du château.
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_02"); //Ne fait pas attention à leurs aspects. Une fois cuisiné ils sont délicieux.
	
    B_LogEntry( CH1_SnafsRecipe,"Il y a de la viande d'insecte près des cabanes désertes au mur du château.");			
};

// **************************************************
// 					Where Mushrooms
// **************************************************

INSTANCE DIA_Snaf_WhereMushrooms (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 4;
	condition		= DIA_Snaf_WhereMushrooms_Condition;
	information		= DIA_Snaf_WhereMushrooms_Info;
	permanent		= 0;
	description		= "Où puis-je trouver des champignons infernaux ?";
};

FUNC INT DIA_Snaf_WhereMushrooms_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMushrooms_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMushrooms_15_00"); //Où puis-je trouver des champignons infernaux ?
	AI_Output (self, other,"DIA_Snaf_WhereMushrooms_01_01"); //Si tu sors par la grille sud - c'est la tour en ruine - tu verra une plaine directement devant toi. Il y a des champignons qui pousse là.
	
	B_LogEntry( CH1_SnafsRecipe,"Les champignons infernaux peuvent être trouvés dans la plaine devant la tour de la porte tombée du sud .");			
};

// **************************************************
// 					Where Nek
// **************************************************

INSTANCE DIA_Snaf_WhereNek (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 5;
	condition		= DIA_Snaf_WhereNek_Condition;
	information		= DIA_Snaf_WhereNek_Info;
	permanent		= 0;
	description		= "Quel est le type qui a été envoyé avant moi ?";
};

FUNC INT DIA_Snaf_WhereNek_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereNek_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereNek_15_00"); //Quel est le type qui a été envoyé avant moi ?
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_01"); //Son nom est Nek. Il n'était pas très content ici - Je pense qu'il est dans le Nouveau Camp maintenant.
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_02"); //Je l'ai envoyé ramasser des champignons - mais il n'est jamais revenu...
	
	if	(Sly_LostNek != LOG_SUCCESS)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_LostNek,"Snaf, le cuisinier, a vu pour la dernière fois Nek quand il est allé cueillir des champignons.");
};







	
	 




