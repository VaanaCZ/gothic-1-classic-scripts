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
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_06_00"); //И куда это мы идем?
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_15_01"); //В лагерь.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_06_02"); //От тебя ведь не будет неприятностей, а? Парень?
	
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Ну, я тут, знаешь ли, хотел весь лагерь взорвать..."		,DIA_Grd_215_Torwache_First_Trouble);
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Да просто хотел посмотреть, что здесь есть."		,DIA_Grd_215_Torwache_First_JustLooking);
	if (Npc_KnowsInfo(hero,Info_Diego_Kolonie))
	{
		Info_AddChoice		(DIA_Grd_215_Torwache_First,"Диего сказал, что я должен встретиться с ним в лагере."	,DIA_Grd_215_Torwache_First_Diego);
	};
};

func void DIA_Grd_215_Torwache_First_Trouble()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_Trouble_15_00"); //Ну, я тут, знаешь ли, хотел весь лагерь взорвать...
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_Trouble_06_01"); //А ты шутник... Не люблю шутов.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	
	AI_StopProcessInfos	( self );
	Npc_SetTarget(self, other);
	AI_StartState(self, ZS_Attack, 1, "");	
};

func void DIA_Grd_215_Torwache_First_JustLooking()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_JustLooking_15_00"); //Да просто хотел посмотреть, что здесь есть.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_JustLooking_06_01"); //За это с тебя десять кусков руды.
	
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"А, забудь об этом."					,DIA_Grd_215_Torwache_First_NoPay);
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Ладно, вот твои десять кусков."	,DIA_Grd_215_Torwache_First_Pay);
};

func void DIA_Grd_215_Torwache_First_Diego()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_Diego_15_00"); //Диего сказал, что я должен встретиться с ним в лагере.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_Diego_06_01"); //Ладно, раз так - проходи.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
};

func void DIA_Grd_215_Torwache_First_NoPay()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_NoPay_15_00"); //А, забудь об этом.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_NoPay_06_01"); //Тогда убирайся.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
};

func void DIA_Grd_215_Torwache_First_Pay()
{
	if (Npc_HasItems(other, itminugget) >= 10)
	{
		AI_Output (other, self,"DIA_Grd_215_Torwache_First_Pay_15_00"); //Ладно, вот твои десять кусков.
		AI_Output (self, other,"DIA_Grd_215_Torwache_First_Pay_06_01"); //Другой разговор, заходи.
		B_GiveInvItems 	(other,self, itminugget,10);CreateInvItems 		(self,  itminugget,10);
	}
	else
	{
		AI_Output (other, self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00"); //Но у меня не так много руды.
		AI_Output (self, other,"DIA_Grd_215_Torwache_First_Pay_NoOre_06_01"); //Хорошо, сделаю исключение для тебя, как для новенького. Но только один раз.
		
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
	description = "Есть что-нибудь новенькое?";
};                       

FUNC INT DIA_Grd_215_Torwache_PERM_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_215_Torwache_PERM_Info()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_PERM_15_00"); //Есть что-нибудь новенькое?
	AI_Output (self, other,"DIA_Grd_215_Torwache_PERM_06_01"); //Нет. Все по-прежнему.
};
