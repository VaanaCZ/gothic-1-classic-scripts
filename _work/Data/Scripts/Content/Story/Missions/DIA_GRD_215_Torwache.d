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
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_06_00"); //Kam máš namíøeno?
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_15_01"); //Do tábora.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_06_02"); //Nechceš se dostat do problémù, viï?
	
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Jistì, mám v úmyslu zabrat celý tábor.",DIA_Grd_215_Torwache_First_Trouble);
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Chci se tu jenom porozhlédnout.",DIA_Grd_215_Torwache_First_JustLooking);
	if (Npc_KnowsInfo(hero,Info_Diego_Kolonie))
	{
		Info_AddChoice		(DIA_Grd_215_Torwache_First,"Diego øekl, že ho mám v táboøe navštívit.",DIA_Grd_215_Torwache_First_Diego);
	};
};

func void DIA_Grd_215_Torwache_First_Trouble()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_Trouble_15_00"); //Jistì, mám v úmyslu zabrat celý tábor.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_Trouble_06_01"); //No, to je pìknej šprýmaø... A já nemám šprýmaøe rád .
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	
	AI_StopProcessInfos	( self );
	Npc_SetTarget(self, other);
	AI_StartState(self, ZS_Attack, 1, "");	
};

func void DIA_Grd_215_Torwache_First_JustLooking()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_JustLooking_15_00"); //Chci se tu jenom porozhlédnout.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_JustLooking_06_01"); //To tì bude stát 10 nugetù.
	
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Na to zapomeò.",DIA_Grd_215_Torwache_First_NoPay);
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Dobrá, tady je tvých 10 nugetù.",DIA_Grd_215_Torwache_First_Pay);
};

func void DIA_Grd_215_Torwache_First_Diego()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_Diego_15_00"); //Diego øekl, že ho mám v táboøe navštívit.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_Diego_06_01"); //Dobrá, pak tedy pojï dál.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
};

func void DIA_Grd_215_Torwache_First_NoPay()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_NoPay_15_00"); //Na to zapomeò.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_NoPay_06_01"); //Pak vypadni.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
};

func void DIA_Grd_215_Torwache_First_Pay()
{
	if (Npc_HasItems(other, itminugget) >= 10)
	{
		AI_Output (other, self,"DIA_Grd_215_Torwache_First_Pay_15_00"); //Dobrá, tady je tvých 10 nugetù.
		AI_Output (self, other,"DIA_Grd_215_Torwache_First_Pay_06_01"); //Pak pojï dál.
		B_GiveInvItems 	(other,self, itminugget,10);CreateInvItems 		(self,  itminugget,10);
	}
	else
	{
		AI_Output (other, self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00"); //Tolik u sebe nemám.
		AI_Output (self, other,"DIA_Grd_215_Torwache_First_Pay_NoOre_06_01"); //Pro tentokrát udìlám výjimku, protože jsi tu nový.
		
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
	description = "Nìco nového?";
};                       

FUNC INT DIA_Grd_215_Torwache_PERM_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_215_Torwache_PERM_Info()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_PERM_15_00"); //Nìco nového?
	AI_Output (self, other,"DIA_Grd_215_Torwache_PERM_06_01"); //Ne. Všechno pøi starém.
};
