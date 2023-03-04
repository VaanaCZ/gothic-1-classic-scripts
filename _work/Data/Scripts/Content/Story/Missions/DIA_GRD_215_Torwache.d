// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grd_215_Torwache_Exit (C_INFO)
{
	npc			= Grd_215_Torwache;
	nr			= 999;
	condition	= DIA_Grd_215_Torwache_Exit_Condition;
	information	= DIA_Grd_215_Torwache_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grd_215_Torwache_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_215_Torwache_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Grd_215_Torwache_First (C_INFO)
{
	npc				= Grd_215_Torwache;
	nr				= 2;
	condition		= DIA_Grd_215_Torwache_First_Condition;
	information		= DIA_Grd_215_Torwache_First_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Grd_215_Torwache_First_Condition()
{	
	if	(!Npc_KnowsInfo(hero,DIA_Grd_216_First))  //Wenn der SC nicht durchs Hintertor rein ist.
	&&	(Kapitel < 2)
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_215_Torwache_First_Info()
{
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_06_00"); //Ou comptes-tu aller ?
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_15_01"); //Au Camp.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_06_02"); //Tu n'es pas venu pour créer des ennuis, hein? 
	
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"C'est ça, je fomente de prendre d'assaut tout le Camp !",DIA_Grd_215_Torwache_First_Trouble);
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"je veux juste visiter.",DIA_Grd_215_Torwache_First_JustLooking);
	if (Npc_KnowsInfo(hero,Info_Diego_Kolonie))
	{
		Info_AddChoice		(DIA_Grd_215_Torwache_First,"Diego a dit que je dois le rencontrer dans le Camp.",DIA_Grd_215_Torwache_First_Diego);
	};
};

func void DIA_Grd_215_Torwache_First_Trouble()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_Trouble_15_00"); //C'est ça, je fomente de prendre d'assaut tout le Camp !
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_Trouble_06_01"); //Hé, ce gars est drôle... J'aime pas les marrants.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	
	AI_StopProcessInfos	( self );
	Npc_SetTarget(self, other);
	AI_StartState(self, ZS_Attack, 1, "");	
};

func void DIA_Grd_215_Torwache_First_JustLooking()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_JustLooking_15_00"); //je veux juste visiter.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_JustLooking_06_01"); //Cela te coûtera 10 minerais.
	
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Laisse tomber.",DIA_Grd_215_Torwache_First_NoPay);
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"D'accord, voila tes 10 minerais.",DIA_Grd_215_Torwache_First_Pay);
};

func void DIA_Grd_215_Torwache_First_Diego()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_Diego_15_00"); //Diego a dit que je dois le rencontrer dans le Camp.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_Diego_06_01"); //D'accord - alors entre.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
};

func void DIA_Grd_215_Torwache_First_NoPay()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_NoPay_15_00"); //Laisse tomber.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_NoPay_06_01"); //Alors tape dessus.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
};

func void DIA_Grd_215_Torwache_First_Pay()
{
	if (Npc_HasItems(other, itminugget) >= 10)
	{
		AI_Output (other, self,"DIA_Grd_215_Torwache_First_Pay_15_00"); //D'accord, voila tes 10 minerais.
		AI_Output (self, other,"DIA_Grd_215_Torwache_First_Pay_06_01"); //Va t'en alors.
		B_GiveInvItems 	(other,self, itminugget,10);CreateInvItems 		(self,  itminugget,10);
	}
	else
	{
		AI_Output (other, self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00"); //Je n'ai pas beaucoup sur moi.
		AI_Output (self, other,"DIA_Grd_215_Torwache_First_Pay_NoOre_06_01"); //Je fais une exception pour une fois, parce que tu es nouveau.
		
	};
		
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	AI_StopProcessInfos	( self );
};

// **************************************************
// 						PERM
// **************************************************

INSTANCE DIA_Grd_215_Torwache_PERM (C_INFO)
{
	npc			= Grd_215_Torwache;
	nr			= 1;
	condition	= DIA_Grd_215_Torwache_PERM_Condition;
	information	= DIA_Grd_215_Torwache_PERM_Info;
	permanent	= 1;
	description = "Des nouvelles ?";
};                       

FUNC INT DIA_Grd_215_Torwache_PERM_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_215_Torwache_PERM_Info()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_PERM_15_00"); //Des nouvelles ?
	AI_Output (self, other,"DIA_Grd_215_Torwache_PERM_06_01"); //Non, tout est toujours pareil.
};
