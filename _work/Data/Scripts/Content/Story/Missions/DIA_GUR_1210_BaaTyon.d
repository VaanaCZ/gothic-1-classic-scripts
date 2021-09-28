// **************************************************
//						EXIT
// **************************************************

instance  DIA_BaalTyon_Exit (C_INFO)
{
	npc			=  Gur_1210_BaalTyon;
	nr			=  999;
	condition	=  DIA_BaalTyon_Exit_Condition;
	information	=  DIA_BaalTyon_Exit_Info;
	important	=  0;	
	permanent	=  1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_BaalTyon_Exit_Condition()
{
	return 1;
};

FUNC VOID  DIA_BaalTyon_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ************************************************************
// 					NICHT ansprechbar (Ungläubiger) 
// ************************************************************
	var int BaalTyon_Ansprechbar;
	var int BaalTyon_Sakrileg;
// ************************************************************

INSTANCE DIA_BaalTyon_NoTalk(C_INFO)
{
	npc				= GUR_1210_BaalTyon;
	nr				= 1;
	condition		= DIA_BaalTyon_NoTalk_Condition;
	information		= DIA_BaalTyon_NoTalk_Info;
	permanent		= 1;
	important 		= 1;
};                       

FUNC INT DIA_BaalTyon_NoTalk_Condition()
{
	if ( Npc_IsInState(self,ZS_TALK) && (BaalTyon_Ansprechbar==FALSE) && (Npc_GetPermAttitude(self,other)!=ATT_FRIENDLY) )
	{
		return 1;
	};
};

FUNC VOID DIA_BaalTyon_NoTalk_Info()
{	
	Info_ClearChoices 	(DIA_BaalTyon_NoTalk);
	Info_Addchoice 		(DIA_BaalTyon_NoTalk,DIALOG_ENDE					,DIA_BaalTyon_NoTalk_ENDE);
	if (Npc_HasItems(other,SpecialJoint)>=1)
	{
		info_AddChoice	(DIA_BaalTyon_NoTalk,"(zaoferuj przygotowany zew nocy)",DIA_BaalTyon_SpecialJoint);
	};
	Info_Addchoice 		(DIA_BaalTyon_NoTalk,"Wszystko w porz¹dku, kolego?",DIA_BaalTyon_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalTyon_NoTalk,"Niech Œni¹cy bêdzie z tob¹!",DIA_BaalTyon_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalTyon_NoTalk,"Czeœæ! Jestem tu nowy!",DIA_BaalTyon_NoTalk_Hi);
};

func void DIA_BaalTyon_NoTalk_Hi()
{
	AI_Output			(other, self,"DIA_BaalTyon_NoTalk_Hi_15_00"); //Czeœæ! Jestem tu nowy!
	AI_Output			(self, other,"DIA_BaalTyon_NoTalk_Hi_11_01"); //(Wzdycha)
	BaalTyon_Sakrileg = TRUE;
};

func void DIA_BaalTyon_NoTalk_Sleeper()
{
	AI_Output			(other, self,"DIA_BaalTyon_NoTalk_Sleeper_15_00"); //Niech Œni¹cy bêdzie z tob¹!
	AI_Output			(self, other,"DIA_BaalTyon_NoTalk_Sleeper_11_01"); //(Wzdycha)
	BaalTyon_Sakrileg = TRUE;
};

func void DIA_BaalTyon_NoTalk_Imp()
{
	AI_Output			(other, self,"DIA_BaalTyon_NoTalk_Imp_15_00"); //Wszystko w porz¹dku, kolego?
	AI_Output			(self, other,"DIA_BaalTyon_NoTalk_Imp_11_01"); //(Wzdycha)
	BaalTyon_Sakrileg = TRUE;
};

func void DIA_BaalTyon_NoTalk_ENDE()
{
	AI_StopProcessInfos	(self);
};

func void DIA_BaalTyon_SpecialJoint()
{
	AI_Output			(other, self,"DIA_BaalTyon_SpecialJoint_15_00"); //Proszê, Mistrzu! Oto skromny prezent od twojego ucznia...
	AI_StopProcessInfos	(self);

	B_GiveInvItems	(hero, self, SpecialJoint, 1);
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		AI_TurnToNpc	(self, hero);
	};
	AI_UseItem			(self, SpecialJoint);

	AI_Output			(self, other,"DIA_BaalTyon_SpecialJoint_11_01"); //Mmmmmmm...

	BaalTyon_Ansprechbar = TRUE;
	Npc_SetRefuseTalk	(self,5);
	hero.aivar[AIV_INVINCIBLE] = FALSE; //SN: Workaround, da in diese Situation das INVINCIBLE-Flag nicht automatisch gelöscht wird!
};

// **************************************************
//					Hatte Vision
// **************************************************

instance  DIA_BaalTyon_Vision (C_INFO)
{
	npc			=  Gur_1210_BaalTyon;
	nr			=  1;
	condition	=  DIA_BaalTyon_Vision_Condition;
	information	=  DIA_BaalTyon_Vision_Info;
	permanent	=  0;
	important	=  1;	
};                       

FUNC int  DIA_BaalTyon_Vision_Condition()
{
	if ( (BaalTyon_Ansprechbar==TRUE) && (Npc_RefuseTalk(self)==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_BaalTyon_Vision_Info()
{
	AI_Output			(self, other,"DIA_BaalTyon_Vision_11_00"); //Na chwa³ê Œni¹cego! Mia³em wizjê!
	AI_Output			(self, other,"DIA_BaalTyon_Vision_11_01"); //To by³o niesamowite! Zobaczy³em, ¿e wkrótce zyskamy nowego brata, który bêdzie inny ni¿ wszyscy przed nim.
	AI_Output			(self, other,"DIA_BaalTyon_Vision_11_02"); //To mia³o coœ wspólnego ze mn¹. W jego rêku lœni³ miecz. On sam zaœ zbiega³ w dó³ po szerokich stopniach. Tutaj wizja siê skoñczy³a.
	AI_Output			(self, other,"DIA_BaalTyon_Vision_11_03"); //Wygl¹da³ zupe³nie jak TY! Kim jesteœ? Czego tu szukasz?
	AI_Output			(other, self,"DIA_BaalTyon_Vision_15_04"); //Jestem tylko skromnym s³ug¹ Œni¹cego...
	AI_Output			(self, other,"DIA_BaalTyon_Vision_11_05"); //IdŸ do Cor Kaloma. On siê tob¹ zajmie.
	
	self.npctype 	=	NPCTYPE_MAIN;
	self.flags 		=	0;

	BaalTyon_Ansprechbar = FALSE;
	B_LogEntry			(CH1_JoinPsi,"Dziêki mojemu specjalnemu prezentowi, Baal Tyon mia³ objawienie! Wys³a³ mnie teraz do Cor Kaloma!");
	B_GiveXP			(XP_ImpressedBaalTyon);
	
	AI_StopProcessInfos	(self);
};


