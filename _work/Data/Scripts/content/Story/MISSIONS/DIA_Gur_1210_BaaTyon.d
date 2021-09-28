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
// 					NICHT ansprechbar (Unglдubiger) 
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
		info_AddChoice	(DIA_BaalTyon_NoTalk,"(предложить улучшенный 'Зов мечты')"	,DIA_BaalTyon_SpecialJoint);
	};
	Info_Addchoice 		(DIA_BaalTyon_NoTalk,"С тобой все нормально, приятель?"			,DIA_BaalTyon_NoTalk_Imp);
	Info_Addchoice 		(DIA_BaalTyon_NoTalk,"Да пребудет с тобой Спящий!"	,DIA_BaalTyon_NoTalk_Sleeper);
	Info_Addchoice 		(DIA_BaalTyon_NoTalk,"Привет! Я здесь новенький!"		,DIA_BaalTyon_NoTalk_Hi);
};

func void DIA_BaalTyon_NoTalk_Hi()
{
	AI_Output			(other, self,"DIA_BaalTyon_NoTalk_Hi_15_00"); //Привет! Я здесь новенький!
	AI_Output			(self, other,"DIA_BaalTyon_NoTalk_Hi_11_01"); //
	BaalTyon_Sakrileg = TRUE;
};

func void DIA_BaalTyon_NoTalk_Sleeper()
{
	AI_Output			(other, self,"DIA_BaalTyon_NoTalk_Sleeper_15_00"); //Да пребудет с тобой Спящий!
	AI_Output			(self, other,"DIA_BaalTyon_NoTalk_Sleeper_11_01"); //
	BaalTyon_Sakrileg = TRUE;
};

func void DIA_BaalTyon_NoTalk_Imp()
{
	AI_Output			(other, self,"DIA_BaalTyon_NoTalk_Imp_15_00"); //С тобой все нормально, приятель? 
	AI_Output			(self, other,"DIA_BaalTyon_NoTalk_Imp_11_01"); //
	BaalTyon_Sakrileg = TRUE;
};

func void DIA_BaalTyon_NoTalk_ENDE()
{
	AI_StopProcessInfos	(self);
};

func void DIA_BaalTyon_SpecialJoint()
{
	AI_Output			(other, self,"DIA_BaalTyon_SpecialJoint_15_00"); //Вот, Учитель! Скромный подарок от верного ученика...
	AI_StopProcessInfos	(self);

	B_GiveInvItems	(hero, self, SpecialJoint, 1);
	if ( C_BodystateContains(self, BS_SIT) )
	{
		AI_StandUp		(self);
		AI_TurnToNpc	(self, hero);
	};
	AI_UseItem			(self, SpecialJoint);

	AI_Output			(self, other,"DIA_BaalTyon_SpecialJoint_11_01"); //

	BaalTyon_Ansprechbar = TRUE;
	Npc_SetRefuseTalk	(self,5);
	hero.aivar[AIV_INVINCIBLE] = FALSE; //SN: Workaround, da in diese Situation das INVINCIBLE-Flag nicht automatisch gelцscht wird!
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
	AI_Output			(self, other,"DIA_BaalTyon_Vision_11_00"); //Во имя Спящего! У меня было видение!
	AI_Output			(self, other,"DIA_BaalTyon_Vision_11_01"); //Невероятно! Я видел, как к нам присоединился новый брат. Он не был похож на тех, кто приходил к нам до этого.
	AI_Output			(self, other,"DIA_BaalTyon_Vision_11_02"); //Он что-то делал с нами... в руке его был меч, и он спускался по широкой лестнице. После этого я больше ничего не увидел.
	AI_Output			(self, other,"DIA_BaalTyon_Vision_11_03"); //И еще он был похож на тебя. Кто ты? Что тебе здесь нужно?
	AI_Output			(other, self,"DIA_BaalTyon_Vision_15_04"); //Я всего лишь скромный слуга Спящего...
	AI_Output			(self, other,"DIA_BaalTyon_Vision_11_05"); //Иди к Кор Галому. Он знает, что делать.
	
	self.npctype 	=	NPCTYPE_MAIN;
	self.flags 		=	0;

	BaalTyon_Ansprechbar = FALSE;
	B_LogEntry			(CH1_JoinPsi,	"Благодаря моему особому подарку Идола Тиона посетило видение! Он хочет, чтобы я поговорил с Кор Галомом!");
	B_GiveXP			(XP_ImpressedBaalTyon);
	
	AI_StopProcessInfos	(self);
};


