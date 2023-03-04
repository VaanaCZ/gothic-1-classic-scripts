// **************************************************
//						 EXIT 
// **************************************************

instance  Stt_311_Fisk_Exit (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 999;
	condition	= Stt_311_Fisk_Exit_Condition;
	information	= Stt_311_Fisk_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Stt_311_Fisk_Exit_Condition()
{
	return 1;
};

FUNC VOID  Stt_311_Fisk_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					First
// **************************************************

instance  Stt_311_Fisk_First (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 1;
	condition	= Stt_311_Fisk_First_Condition;
	information	= Stt_311_Fisk_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Stt_311_Fisk_First_Condition()
{
		return 1;
};

FUNC VOID  Stt_311_Fisk_First_Info()
{
	AI_Output		(self, other,"Stt_311_Fisk_First_12_00"); //Hé, l'ami ! Je suis Fisk. Je vends des marchandises de toutes sortes. Si jamais tu as besoin de quoi que ce soit - c'est ici que tu vas le trouver.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Fisk, l'Ombre, fait du commerce avec toutes sortes de marchandises, particulièrement des ARMES. Il est d'habitude au marché."); 
	
};

// **************************************************
//					Handeln
// **************************************************

instance  Stt_311_Fisk_Trade (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 800;
	condition	= Stt_311_Fisk_Trade_Condition;
	information	= Stt_311_Fisk_Trade_Info;
	permanent	= 1;
	description = "Montre moi tes marchandises.";
	trade		= 1;
};                       

FUNC int  Stt_311_Fisk_Trade_Condition()
{
	return 1;
};

FUNC VOID  Stt_311_Fisk_Trade_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_Trade_15_00"); //Montre moi tes marchandises.
};



instance  Stt_311_Fisk_WhistlersSword (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 801;
	condition	= Stt_311_Fisk_WhistlersSword_Condition;
	information	= Stt_311_Fisk_WhistlersSword_Info;
	permanent	= 1;
	description = "Je voudrais acheter une épée - je voudrais quelque chose de plus ornemental...";
};                       

FUNC int  Stt_311_Fisk_WhistlersSword_Condition()
{
	if ( (Fisk_ForgetSword==FALSE) && (Whistler_BuyMySword == LOG_RUNNING) && (Fisk_SwordSold == FALSE)  )
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_WhistlersSword_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_15_00"); //J'ai envie d'acheter une épée. Mais pas juste une simple épée. J'aurais voulu quelque chose de plus décoré.
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_12_01"); //J'en ai une qui va te plaire. L'Ombre à qui elle était destinée ne viendra plus.
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_12_02"); //ça te coûtera 110 minerais. Intéressé ?
	Fisk_SCknows110 = TRUE;

	Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
	Info_AddChoice		(Stt_311_Fisk_WhistlersSword,"Peut-être plus tard.",Stt_311_Fisk_WhistlersSword_BACK);
	Info_AddChoice		(Stt_311_Fisk_WhistlersSword,"Tu as voulu le vendre à Whistler pour cent...",Stt_311_Fisk_WhistlersSword_Fault);
	Info_AddChoice		(Stt_311_Fisk_WhistlersSword,"Oui, je vais le prendre.",Stt_311_Fisk_WhistlersSword_TakeIt);
};

func void Stt_311_Fisk_WhistlersSword_BACK()
{
	AI_Output (other, self,"Org_826_Mordrag_WhistlersSword_BACK_15_00"); //Peut-être plus tard.
	Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
};

func void Stt_311_Fisk_WhistlersSword_Fault()
{
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_Fault_15_00"); //Tu as voulu le vendre à Whistler pour cent...
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_Fault_12_01"); //Ah ! Un moment... je t'ai compté trop peu ! Évidement, j'ai voulu dire 500.
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_Fault_15_02"); //Cinq cents ?
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_Fault_12_03"); //Trop peu ? Tu préfères 1000 ? ça me va. Bon, maintenant que je pense à ça - je n'ai plus envie de la vendre !
	
	Fisk_ForgetSword = TRUE;
	Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
};

func void Stt_311_Fisk_WhistlersSword_TakeIt()
{
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00"); //Oui, je vais le prendre.
	
	if (Npc_HasItems(other,itminugget) >= 110)
	{
		AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01"); //Tu avais un bon marché !
		B_GiveInvItems(other, self,itminugget,110);
		CreateInvItem (self,Whistlers_Schwert);
		B_GiveInvItems(self, other,Whistlers_Schwert,1);
		Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
		
		Fisk_SwordSold = TRUE;
	}
	else
	{
		AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_02"); //Je crains que tu n'ai pas assez de minerai. Je mettrais l'épée de côté pendant un moment, mais ne sois pas trop long !
	};
};

// **************************************************
//					Forget Sword
// **************************************************

instance  Stt_311_Fisk_ForgetSword (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 800;
	condition	= Stt_311_Fisk_ForgetSword_Condition;
	information	= Stt_311_Fisk_ForgetSword_Info;
	permanent	= 1;
	description = "A propos de l'épée de Whistler ...";
};                       

FUNC int  Stt_311_Fisk_ForgetSword_Condition()
{
	if (Fisk_ForgetSword==TRUE)
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_ForgetSword_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_ForgetSword_15_00"); //Parlons encore de l'épée de Whistler.
	AI_Output (self, other,"Stt_311_Fisk_ForgetSword_12_01"); //Tu peux lui dire qu'il n'aura jamais son épée.
};

// **************************************************
//					MordragKO
// **************************************************
	var int Fisk_GetNewHehler;
// **************************************************

instance  Stt_311_Fisk_MordragKO (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 800;
	condition	= Stt_311_Fisk_MordragKO_Condition;
	information	= Stt_311_Fisk_MordragKO_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Stt_311_Fisk_MordragKO_Condition()
{
	if (MordragKO_HauAb == TRUE)  
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_MordragKO_Info()
{
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_12_00"); //Hé, toi !
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_12_01"); //Mordrag était l'un de mes fournisseurs plus importants,  idiot !
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_12_02"); //Si tu veux rejoindre ce camp il sera très difficile d'avoir MON soutien !

	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	Info_AddChoice   (Stt_311_Fisk_MordragKO,"Tu fais échange le minerai du Baron ! Thorus sera intéressé...",Stt_311_Fisk_MordragKO_Petze);
	Info_AddChoice   (Stt_311_Fisk_MordragKO,"Détend-toi ! Peut-être que je peux oublier, n'est-ce pas ?",Stt_311_Fisk_MordragKO_Relax);
	Info_AddChoice	 (Stt_311_Fisk_MordragKO,"Alors embrasse juste mon cul !",Stt_311_Fisk_MordragKO_FuckOff);
};

func void Stt_311_Fisk_MordragKO_Relax()
{
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_Relax_15_00"); //Détend-toi ! Peut-être que je peux oublier, n'est-ce pas ?
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_Relax_12_01"); //Je ne sais pas comment tu vas faire. À moins que tu ne me rapportes une nouvelle clôture du Nouveau camp !
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_Relax_15_02"); //Comment est-ce que je suis censé trouver quelqu'un comme cela ?
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_Relax_12_03"); //Je t'ai juste dit que je ne crois pas que tu seras un jour en bons termes avec moi.
	
	Log_CreateTopic(CH1_FiskNewDealer, LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer, LOG_RUNNING);
	B_LogEntry( CH1_FiskNewDealer,"Le marchand Fisk au marché du Vieux Camp veut que je lui trouve une nouvelle barrière, après que j'ai corrigé Mordrag.");
	
	Fisk_GetNewHehler = LOG_RUNNING;
};

func void Stt_311_Fisk_MordragKO_FuckOff()
{
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_FuckOff_15_00"); //Alors embrasse juste mon cul !
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	
	AI_StopProcessInfos	(self);
};

func void Stt_311_Fisk_MordragKO_Petze()
{
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_Petze_15_00"); //Tu fais du commerce avec les choses qui appartiennent aux Barons du minerai. Thorus sera intéressé par ça...
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_Petze_12_01"); //N'essaye pas, l'ami !
};

// **************************************************
//					New Hehler
// **************************************************

instance  Stt_311_Fisk_HehlerSuccess (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 10;
	condition	= Stt_311_Fisk_HehlerSuccess_Condition;
	information	= Stt_311_Fisk_HehlerSuccess_Info;
	permanent	= 0;
	description	= "J'ai quelqu'un du Nouveau Camp qui veut entrer dans l'affaire...";
};                       

FUNC int  Stt_311_Fisk_HehlerSuccess_Condition()
{
	if ( (Fisk_GetNewHehler==LOG_RUNNING) && (Npc_KnowsInfo(hero,Org_843_Sharky_Fisk)))  
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_HehlerSuccess_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_HehlerSuccess_15_00"); //Je connais quelqu'un du Nouveau camp qui veut faire des affaires avec toi.
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_01"); //Non ! Qui aurait pensé ça. Regarde comme ils essayent de te ressembler pour devenir populaires dans le coin...
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_02"); //On dirait que tu le commandes ! Qui est-il ?
	AI_Output (other, self,"Stt_311_Fisk_HehlerSuccess_15_03"); //Il s'appelle Sharky.
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_04"); //Sharky ? Il est encore plus mauvais que Mordrag.
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_05"); //A propos de Diego... tu n'as plus besoin de t'inquiéter.
	
	Fisk_GetNewHehler = LOG_SUCCESS;
	B_GiveXP(XP_fiskdealer);

	Log_SetTopicStatus(CH1_FiskNewDealer, LOG_SUCCESS);
	B_LogEntry( CH1_FiskNewDealer,"Fisk est content, parce que Sharky reprendra l'affaire de Mordrag.");
};
/*------------------------------------------------------------------------
							RÜSTUNG									
------------------------------------------------------------------------*/

instance  Stt_311_Fisk_ARMOR (C_INFO)
{
	npc				= Stt_311_Fisk;
	condition		= Stt_311_Fisk_ARMOR_Condition;
	information		= Stt_311_Fisk_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "As-tu obtenu une armure pour moi comme prévue."; 
};

FUNC int  Stt_311_Fisk_ARMOR_Condition()
{	
	if (Kapitel < 2)
	&& (Npc_KnowsInfo (hero, Stt_311_Fisk_First))
	{
		return TRUE;
	};

};
FUNC void  Stt_311_Fisk_ARMOR_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_ARMOR_Info_15_01"); //As-tu obtenu une armure pour moi comme prévue.
	AI_Output (self, other,"Stt_311_Fisk_ARMOR_Info_12_02"); //Bon, je suis sûr que je peux te satisfaire.
	Info_ClearChoices (Stt_311_Fisk_ARMOR);
	Info_Addchoice (Stt_311_Fisk_ARMOR,DIALOG_BACK,Stt_311_Fisk_ARMOR_BACK);
	Info_Addchoice (Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskLightDiggers,VALUE_VLK_ARMOR_L),Stt_311_Fisk_ARMOR_L);
	Info_Addchoice (Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskDiggers,VALUE_VLK_ARMOR_M),Stt_311_Fisk_ARMOR_M);

};  

func void Stt_311_Fisk_ARMOR_BACK()
{
	Info_ClearChoices (Stt_311_Fisk_ARMOR);
};

func void Stt_311_Fisk_ARMOR_L()
{
	AI_Output (other, self,"Stt_311_Fisk_ARMOR_L_Info_15_01"); //Donne-moi le pantalon léger des mineurs.
	
	if (Npc_HasItems (hero,ItMiNugget) <  VALUE_VLK_ARMOR_L)
	{
		AI_Output (self, other,"Stt_311_Fisk_ARMOR_L_Info_12_02"); //Reviens dès que tu auras assez de minerai !
	}
	else
	{
		AI_Output		(self,	other,	"Stt_311_Fisk_ARMOR_L_Info_12_03"); //Un bon choix !
		B_GiveInvItems	(hero,	self,	ItMinugget, VALUE_VLK_ARMOR_L);
		CreateInvItem	(self,			VLK_ARMOR_L);
		B_GiveInvItems	(self,	hero,	VLK_ARMOR_L, 1);
	};
};

func void Stt_311_Fisk_ARMOR_M()
{
	AI_Output (other, self,"Stt_311_Fisk_ARMOR_M_Info_15_01"); //Donne-moi un pantalon de mineur.
	if (Npc_HasItems (hero,ItMiNugget) <  VALUE_VLK_ARMOR_M)
	{
		AI_Output (self, other,"Stt_311_Fisk_ARMOR_M_Info_12_02"); //Reviens dès que tu auras assez de minerai !
	}
	else
	{
		AI_Output		(self, other,"Stt_311_Fisk_ARMOR_M_Info_12_03"); //Un bon choix !
		B_GiveInvItems	(hero, self, ItMinugget, VALUE_VLK_ARMOR_M);
		CreateInvItem	(self, VLK_ARMOR_M);
		B_GiveInvItems	(self,hero, VLK_ARMOR_M, 1);
	};
};







