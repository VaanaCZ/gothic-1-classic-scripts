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
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_06_00"); //A ty dok¹d siê wybierasz?
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_15_01"); //To Obozu.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_06_02"); //Chyba nie przyszed³eœ tu, ¿eby sprawiaæ k³opoty, co?
	
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Jasne, zamierzam przej¹æ kontrolê nad ca³ym obozem!",DIA_Grd_215_Torwache_First_Trouble);
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Chcia³em siê tylko trochê rozejrzeæ.",DIA_Grd_215_Torwache_First_JustLooking);
	if (Npc_KnowsInfo(hero,Info_Diego_Kolonie))
	{
		Info_AddChoice		(DIA_Grd_215_Torwache_First,"Diego powiedzia³, ¿e mam siê z nim spotkaæ w obozie.",DIA_Grd_215_Torwache_First_Diego);
	};
};

func void DIA_Grd_215_Torwache_First_Trouble()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_Trouble_15_00"); //Jasne, zamierzam przej¹æ kontrolê nad ca³ym obozem!
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_Trouble_06_01"); //Hej, facet jest ca³kiem zabawny... Nie lubiê zabawnych facetów.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	
	AI_StopProcessInfos	( self );
	Npc_SetTarget(self, other);
	AI_StartState(self, ZS_Attack, 1, "");	
};

func void DIA_Grd_215_Torwache_First_JustLooking()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_JustLooking_15_00"); //Chcia³em siê tylko trochê rozejrzeæ.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_JustLooking_06_01"); //To ciê bêdzie kosztowaæ 10 bry³ek rudy.
	
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Niewa¿ne.",DIA_Grd_215_Torwache_First_NoPay);
	Info_AddChoice		(DIA_Grd_215_Torwache_First,"Dobrze, masz tu swoje 10 bry³ek.",DIA_Grd_215_Torwache_First_Pay);
};

func void DIA_Grd_215_Torwache_First_Diego()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_Diego_15_00"); //Diego powiedzia³, ¿e mam siê z nim spotkaæ w obozie.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_Diego_06_01"); //W takim razie - w³aŸ.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
};

func void DIA_Grd_215_Torwache_First_NoPay()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_First_NoPay_15_00"); //Niewa¿ne.
	AI_Output (self, other,"DIA_Grd_215_Torwache_First_NoPay_06_01"); //W takim razie - spadaj.
	Info_ClearChoices	(DIA_Grd_215_Torwache_First );
};

func void DIA_Grd_215_Torwache_First_Pay()
{
	if (Npc_HasItems(other, itminugget) >= 10)
	{
		AI_Output (other, self,"DIA_Grd_215_Torwache_First_Pay_15_00"); //Dobrze, masz tu swoje 10 bry³ek.
		AI_Output (self, other,"DIA_Grd_215_Torwache_First_Pay_06_01"); //Dobra. Zapraszam do œrodka.
		B_GiveInvItems 	(other,self, itminugget,10);CreateInvItems 		(self,  itminugget,10);
	}
	else
	{
		AI_Output (other, self,"DIA_Grd_215_Torwache_First_Pay_NoOre_15_00"); //Nie mam tyle przy sobie.
		AI_Output (self, other,"DIA_Grd_215_Torwache_First_Pay_NoOre_06_01"); //Có¿. Tym razem zrobiê wyj¹tek, bo jesteœ tu nowy.
		
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
	description = "Coœ nowego?";
};                       

FUNC INT DIA_Grd_215_Torwache_PERM_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_215_Torwache_PERM_Info()
{
	AI_Output (other, self,"DIA_Grd_215_Torwache_PERM_15_00"); //Coœ nowego?
	AI_Output (self, other,"DIA_Grd_215_Torwache_PERM_06_01"); //Nie. Wszystko po staremu.
};
