// ************************************************************
// 			  				   EXIT 
// ************************************************************

INSTANCE Info_Swiney_EXIT(C_INFO)
{
	npc			= SfB_1037_Swiney ;
	nr			= 999;
	condition	= Info_Swiney_EXIT_Condition;
	information	= Info_Swiney_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Swiney_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// ************************************************************
// 						Hallo
// ************************************************************

INSTANCE Info_Swiney_Hello(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Hello_Condition;
	information	= Info_Swiney_Hello_Info;
	permanent	= 0;
	description = "Qui es-tu ?";
};                       

FUNC INT Info_Swiney_Hello_Condition()
{
	return 1;
};

FUNC VOID Info_Swiney_Hello_Info()
{	
	AI_Output (other, self,"Info_Swiney_Hello_15_00"); //Qui es-tu ?
	AI_Output (self, other,"Info_Swiney_Hello_09_01"); //Je suis le meilleur ingénieur des mines que cette fichue colonie n'a jamais vu, mon garçon.
	AI_Output (self, other,"Info_Swiney_Hello_09_02"); //Je m'assure que la moitié de nos garçons ne seront pas être écrasés par des chutes de pierre, uniquement parce qu'ils sont trop stupides pour travailler aux bons endroits.
};

// ************************************************************
// 						Schürfer
// ************************************************************

INSTANCE Info_Swiney_Schuerfer(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_Schuerfer_Condition;
	information	= Info_Swiney_Schuerfer_Info;
	permanent	= 0;
	description = "Je voudrais vous rejoindre comme Gratteur !";
};                       

FUNC INT Info_Swiney_Schuerfer_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Hello))
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_Schuerfer_Info()
{	
	AI_Output (other, self,"Info_Swiney_Schuerfer_15_00"); //Je voudrais vous rejoindre comme Gratteur !
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_01"); //Oh ouais ? Et bien, ne pense pas que tu vas obtenir beaucoup plus sans lui. Il y a trois parts de riz par jour, tous les suppléments que tu auras tu les devras à toi-même.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_02"); //Sais-tu ce qu'on fait ici ? Nous faisons ce travail pour qu'un jour nous puissions sortir d'ici librement.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_03"); //Cela signifie que tout le minerai doit être extrait puis amené au grand tas de minerai. Et une fois par mois tout ceux qui travaillent ici reçoivent 50 minerai pour se soûler.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_04"); //Ce sont les choses les plus importantes que tu dois savoir.
	AI_Output (self, other,"Info_Swiney_Schuerfer_09_05"); //As-tu au moins une expérience du travail ?
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
	Info_AddChoice   (Info_Swiney_Schuerfer,"Non.",Info_Swiney_Schuerfer_Nein);
	Info_AddChoice	 (Info_Swiney_Schuerfer,"Oui.",Info_Swiney_Schuerfer_Ja);
};

func void Info_Swiney_Schuerfer_Ja()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Ja_15_00"); //Oui.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Ja_09_01"); //Bon ! Alors tu sais ce qu'il faut faire. Voici tes vêtements de protection. Tu devras trouver ta propre pioche. Amuses-toi bien !
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

func void Info_Swiney_Schuerfer_Nein()
{
	AI_Output (other, self,"Info_Swiney_Schuerfer_Nein_15_00"); //Non.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_01"); //Bien sûr que non ! Pourquoi est-ce toujours moi ? D'accord. Écoute bien. Tu prends cette marchandise et la mets ici.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_02"); //Si une pépite de minerai tombe sur ton pied alors que tu ne portes pas de vêtements de protection, tu seras estropié pendant pour le reste de tes jours et tu ne vaudras plus que la moitié de ce que tu étais avant.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_03"); //Il doit y avoir une pioche quelque part dans le coin.
	AI_Output (self, other,"Info_Swiney_Schuerfer_Nein_09_04"); //Mais tu ne pourrais pas faire grand-chose avec ça - bon - enfin..,
	
	CreateInvItem (self, SFB_ARMOR_L);
	B_GiveInvItems(self, hero, SFB_ARMOR_L, 1);
	
	Info_ClearChoices(Info_Swiney_Schuerfer);
};

// ************************************************************
// 							PERM
// ************************************************************

INSTANCE Info_Swiney_PERM(C_INFO)
{
	npc			= SfB_1037_Swiney;
	nr			= 1;
	condition	= Info_Swiney_PERM_Condition;
	information	= Info_Swiney_PERM_Info;
	permanent	= 1;
	description = "Combien de minerai as-tu rassemblé jusqu'ici ?";
};                       

FUNC INT Info_Swiney_PERM_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Swiney_Schuerfer)) 
	{
		return 1;
	};
};

FUNC VOID Info_Swiney_PERM_Info()
{	
	AI_Output (other, self,"Info_Swiney_PERM_15_00"); //Combien de minerai as-tu rassemblé jusqu'ici ?
	AI_Output (self, other,"Info_Swiney_PERM_09_01"); //Les Mages disent que nous n'en aurions pas besoin de beaucoup plus. Va au Nouveau camp voir le tas.
	AI_StopProcessInfos	(self);
};


