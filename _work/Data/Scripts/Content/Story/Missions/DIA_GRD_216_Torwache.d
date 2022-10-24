// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Grd_216_Exit (C_INFO)
{
	npc			= Grd_216_Torwache;
	nr			= 999;
	condition	= DIA_Grd_216_Exit_Condition;
	information	= DIA_Grd_216_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Grd_216_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Grd_216_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Kap 1 Standard Hallo
// **************************************************

INSTANCE DIA_Grd_216_First (C_INFO)
{
	npc				= Grd_216_Torwache;
	nr				= 1;
	condition		= DIA_Grd_216_First_Condition;
	information		= DIA_Grd_216_First_Info;
	permanent		= 0;
	important 		= 1;
};

FUNC INT DIA_Grd_216_First_Condition()
{	
	if (Npc_GetDistToWP(other,"OCR_NORTHGATE_ADVANCE") > 400) //NICHT von hinten!
	{
		Npc_SetRefuseTalk(self,30);
	};
	
	if (Npc_RefuseTalk(self) == FALSE)
	{
		var C_NPC Dusty; Dusty = Hlp_GetNpc(Vlk_524_Dusty);
		if	(Dusty.aivar[AIV_PARTYMEMBER] == FALSE)
		&&	(Kapitel < 2)
		{
			return 1;
		};
	};
};

FUNC VOID DIA_Grd_216_First_Info()
{
	AI_Output (self, other,"DIA_Grd_216_First_13_00"); //Эй, ты! Я тебя раньше здесь не видел!
	AI_Output (other, self,"DIA_Grd_216_First_15_01"); //Еще бы. Меня недавно сюда забросили.
	AI_Output (self, other,"DIA_Grd_216_First_13_02"); //Будь осторожен. За пределами лагеря очень опасно. Только в лагере тебя смогут защитить.
};

// **************************************************
// 					Dusty Zoll
// **************************************************

INSTANCE DIA_Grd_216_DustyZoll (C_INFO)
{
	npc				= Grd_216_Torwache;
	nr				= 1;
	condition		= DIA_Grd_216_DustyZoll_Condition;
	information		= DIA_Grd_216_DustyZoll_Info;
	permanent		= 1;
	important 		= 1;
};

FUNC INT DIA_Grd_216_DustyZoll_Condition()
{	
	var C_NPC Dusty; Dusty = Hlp_GetNpc(Vlk_524_Dusty);
	if (Dusty.aivar[AIV_PARTYMEMBER] == TRUE)
	&&	(Npc_GetDistToNpc(hero,dusty)<2000)
	{
		return 1;
	};
};

FUNC VOID DIA_Grd_216_DustyZoll_Info()
{
	AI_Output			(self, other,"DIA_Grd_216_Dusty_Zoll_13_00"); //Стоять! И куда это ты направляешься с нашим другом?
	Info_ClearChoices	(DIA_Grd_216_DustyZoll);
	Info_AddChoice		(DIA_Grd_216_DustyZoll,"Это тебе знать не положено!" ,DIA_Grd_216_DustyZoll_PissOff);
	Info_AddChoice		(DIA_Grd_216_DustyZoll,"Мы хотим пойти в лагерь Братства." ,DIA_Grd_216_DustyZoll_ToPSI);
	if (Npc_HasItems (other,itminugget) >= 100)
	{
		Info_AddChoice	(DIA_Grd_216_DustyZoll,"Мы просто хотим прогуляться. А вот тебе от нас небольшой подарок." ,DIA_Grd_216_DustyZoll_LittleWalk);
	};
};

func void DIA_Grd_216_DustyZoll_PissOff()
{
	AI_Output			(other, self,"DIA_Grd_216_Dusty_Zoll_PissOff_15_00"); //Это тебе знать не положено!
	AI_Output			(self, other,"DIA_Grd_216_Dusty_Zoll_PIssOff_13_00"); //Я так не думаю!
	AI_StopProcessInfos	(self);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_Attack,1,"");

	B_ExchangeRoutine	(Vlk_524_Dusty,"start");
	var C_NPC dusty;	dusty = Hlp_GetNpc(Vlk_524_Dusty);
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal lцschen
};

func void DIA_Grd_216_DustyZoll_ToPSI()
{
	AI_Output			(other, self,"DIA_Grd_216_Dusty_Zoll_ToPsi_15_00"); //Мы хотим пойти в лагерь Братства.
	AI_Output 			(self, other,"DIA_Grd_216_Dusty_Zoll_ToPsi_13_00"); //Ну, вам туда дорога закрыта...
	AI_StopProcessInfos	(self);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_Attack,1,"");

	B_ExchangeRoutine	(Vlk_524_Dusty,"start");
	var C_NPC dusty;	dusty = Hlp_GetNpc(Vlk_524_Dusty);
	dusty.aivar[AIV_PARTYMEMBER] = FALSE;
	dusty.flags = 0;	// Immortal lцschen
};

func void DIA_Grd_216_DustyZoll_LittleWalk()
{
	AI_Output				(other, self,"DIA_Grd_216_Dusty_Zoll_LittleWalk_15_00"); //Мы просто хотим прогуляться. А вот тебе от нас небольшой подарок.
	if (Npc_HasItems (hero,itminugget) >= 100)
	{
		AI_Output			(self, other,"DIA_Grd_216_Dusty_Zoll_LittleWalk_13_00"); //Я ничего не видел.

		B_GiveInvItems	(hero, self, ItMiNugget, 100);
		DIA_Grd_216_DustyZoll.permanent = 0;
		B_LogEntry			(CH1_RecruitDusty,	"Охранник у южных ворот сделал вид, что он нас не видел. За небольшую плату, конечно. Все имеет свою цену!");
		B_GiveXP			(XP_BribedDustyGuard);
		
		AI_StopProcessInfos	(self);
	}
	else
	{
		AI_Output			(self, other,"DIA_Grd_216_Dusty_Zoll_LittleWalk_13_02"); //Ты, что пытаешься меня надуть? Так не пойдет, малыш!
		AI_StopProcessInfos	(self);
		Npc_SetTarget		(self,other);
		AI_StartState		(self,ZS_Attack,1,"");

		B_ExchangeRoutine	(Vlk_524_Dusty,"start");
		var C_NPC dusty;	dusty = Hlp_GetNpc(Vlk_524_Dusty);
		dusty.aivar[AIV_PARTYMEMBER] = FALSE;
		dusty.flags = 0;	// Immortal lцschen
	};
};

//-------------------------------------------------------
// WEGEN AUFNAHME GARDIST ZU THORUS SCHICKEN
//-------------------------------------------------------
instance GRD_216_Torwache_SEETHORUS (C_INFO)
{
	npc				= GRD_216_Torwache;
	condition		= GRD_216_Torwache_SEETHORUS_Condition;
	information		= GRD_216_Torwache_SEETHORUS_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  GRD_216_Torwache_SEETHORUS_Condition()
{	
	if  (! Npc_KnowsInfo (hero,GRD_214_TORWACHE_SEETHORUS))
	&&  ((CorKalom_BringMCQBalls == LOG_SUCCESS) || (Npc_HasItems(hero, ItAt_Crawlerqueen) >= 3))
	&& 	(! Npc_KnowsInfo (hero,GRD_200_Thorus_GARDIST))
	&&  (Npc_GetTrueGuild (hero) == GIL_STT) 
	 
	{
		return TRUE;
	};
};

func void  GRD_216_Torwache_SEETHORUS_Info()
{
	AI_Output (self, other,"Grd_216_Torwache_SEETHORUS_Info_13_01"); //Рад, что ты объявился. Торус хочет поговорить с тобой!
	AI_Output (other, self,"Grd_216_Torwache_SEETHORUS_Info_15_02"); //А что ему нужно?
	AI_Output (self, other,"Grd_216_Torwache_SEETHORUS_Info_13_03"); //Он сам тебе все расскажет.
};
