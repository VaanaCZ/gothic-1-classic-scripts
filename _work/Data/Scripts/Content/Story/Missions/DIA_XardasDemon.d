// ************************ EXIT **************************

instance  Info_XardasDemon_EXIT (C_INFO)
{
	npc			=	XardasDemon;
	nr			=	999;
	condition	=	Info_XardasDemon_EXIT_Condition;
	information	=	Info_XardasDemon_EXIT_Info;
	important	=	0;	
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_XardasDemon_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_XardasDemon_EXIT_Info()
{
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(вздох)
	AI_Output (hero, self,"Info_Saturas_EXIT_15_01"); //... Смертный? ... Кто, я? ... Ладно, я иду!

	AI_StopProcessInfos	(self);
};





//#####################################################################
//##
//##
//##							KAPITEL 4
//##
//##
//#####################################################################

//***************************************************************************
//	Info INTRO
//***************************************************************************
instance Info_XardasDemon_INTRO (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_INTRO_Condition;
	information	= Info_XardasDemon_INTRO_Info;
	permanent	= 0;
	important 	= 1;
};

FUNC INT Info_XardasDemon_INTRO_Condition()
{	
	if (FindXardas)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_INTRO_Info()
{
	AI_TurnAway		(hero, self);
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_01"); //Постой... Кто... Кто говорит со мной?
	AI_WhirlAround	(hero, self);	//KEIN B_Whirlaround()!!!
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_02"); //Так это ТЫ говорил со мной??? Как... Как тебе удалось проникнуть в мои мысли?
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(вздох)
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_03"); //Что ты есть?.. Слуга своего повелителя?
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_04"); //Ты похож на порождение ада!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(вздох)
	AI_Output		(hero, self,"Info_XardasDemon_INTRO_15_05"); //Хочешь, чтобы я замолчал?
};

//***************************************************************************
//	Info MASTERWHO
//***************************************************************************
instance Info_XardasDemon_MASTERWHO (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_MASTERWHO_Condition;
	information	= Info_XardasDemon_MASTERWHO_Info;
	permanent	= 0;
	important 	= 0;
	description = "Послушай, твоего повелителя случайно зовут не Ксардас?";
};

FUNC INT Info_XardasDemon_MASTERWHO_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_XardasDemon_INTRO))
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_MASTERWHO_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_MASTERWHO_15_01"); //Послушай, твоего повелителя случайно зовут не Ксардас?
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(вздох)
	AI_Output		(hero, self,"Info_XardasDemon_MASTERWHO_15_02"); //Ну, хорошо... Имена не играют роли... Ладно.
	AI_Output		(hero, self,"Info_XardasDemon_MASTERWHO_15_03"); //Просто мне кажется, что это и есть башня Ксардаса.
};

//***************************************************************************
//	Info MASTERHOW
//***************************************************************************
instance Info_XardasDemon_MASTERHOW (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_MASTERHOW_Condition;
	information	= Info_XardasDemon_MASTERHOW_Info;
	permanent	= 0;
	important 	= 0;
	description = "Мне нужно поговорить с твоим повелителем!";
};

FUNC INT Info_XardasDemon_MASTERHOW_Condition()
{	
	if (Npc_KnowsInfo(hero, Info_XardasDemon_INTRO))
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_MASTERHOW_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_01"); //Мне нужно поговорить с твоим повелителем!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(вздох)
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_02"); //... Не доверяет? ... Мне?? ... Что за испытание???
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(вздох)
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_03"); //... А-аа... Я понял... Тот, кто хочет поговорить с твоим повелителем, должен прежде доказать, что он этого достоин!
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_04"); //... Постой, что это было? ... Доказательство? ... Победа над чем? ... Победа над стихиями?
	AI_Output		(hero, self,"Info_XardasDemon_MASTERHOW_15_05"); //... Камень? ... Лед? ... Огонь?

	FindGolemHearts = 1;		// Auftrag vergeben

	B_LogEntry		(CH4_FindXardas,"В башне Ксардаса я встретил демона, который разговаривал со мной в моих мыслях. Прежде чем пустить меня к своему хозяину, он хочет получить три доказательства о трех победах на элементалями огня, льда и камня.");
};

//***************************************************************************
//	Info NOHEART
//***************************************************************************
instance Info_XardasDemon_NOHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_NOHEART_Condition;
	information	= Info_XardasDemon_NOHEART_Info;
	permanent	= 1;
	important 	= 0;
	description = "Ты говоришь загадками!";
};

FUNC INT Info_XardasDemon_NOHEART_Condition()
{	
	if 	 Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	!Npc_HasItems (hero, ItAt_StoneGolem_01)
	&&	!Npc_HasItems (hero, ItAt_IceGolem_01)
	&&	!Npc_HasItems (hero, ItAt_FireGolem_01)
	&&	(FindGolemHearts < 4)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_NOHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_NOHEART_15_01"); //Ты говоришь загадками!
	AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(вздох)
	AI_Output		(hero, self,"Info_XardasDemon_NOHEART_15_02"); //... Ты это уже говорил, ты повторяешься!
	AI_Output		(hero, self,"Info_XardasDemon_NOHEART_15_03"); //... Тебе нужны доказательства победы над стихиями Льда, Огня и Камня!
};

//***************************************************************************
//	Ein Herz abliefern
//***************************************************************************
func void B_XardasDemon_GiveHeart()
{
	if 		(FindGolemHearts == 1)
	{
		AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(вздох)
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_01"); //... Что? ... Верно! ... Убедительные доказательства!
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_02"); //... Не хватает? Не хватает еще двух?
		FindGolemHearts = 2;
	}
	else if (FindGolemHearts == 2)
	{
		AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(вздох)
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_03"); //... Двойственность? ... Второе доказательство?
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_04"); //... Осталось еще одно?
		FindGolemHearts = 3;
	}
	else if (FindGolemHearts == 3)
	{
		AI_Output (self, other,"DIA_BaalCadar_NoTalk_Hi_02_01"); //(вздох)
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_05"); //... Совершенство? ... Я выдержал испытание?
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_06"); //Если так, я желаю поговорить с твоим повелителем прямо сейчас!
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_07"); //... Контраргументы? ... О чем это ты? ... Руна? ... Руна для меня?
		AI_Output	(hero, self,"Info_XardasDemon_GIVEHEART_15_08"); //В таком случае я принимаю Руну Телепортации в знак твоего доверия!

		B_Story_AccessToXardas();
	};
};


//***************************************************************************
//	Info STONEHEART
//***************************************************************************
instance Info_XardasDemon_STONEHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_STONEHEART_Condition;
	information	= Info_XardasDemon_STONEHEART_Info;
	permanent	= 0;
	important 	= 0;
	description = "Вот сердце каменного голема.";
};

FUNC INT Info_XardasDemon_STONEHEART_Condition()
{	
	if 	Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	Npc_HasItems (hero, ItAt_StoneGolem_01)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_STONEHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_STONEHEART_15_01"); //Вот сердце каменного голема.

    B_GiveInvItems  (hero, self, ItAt_StoneGolem_01, 1);
	Npc_RemoveInvItem(self, ItAt_StoneGolem_01);

	B_XardasDemon_GiveHeart();
};

//***************************************************************************
//	Info ICEHEART
//***************************************************************************
instance Info_XardasDemon_ICEHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_ICEHEART_Condition;
	information	= Info_XardasDemon_ICEHEART_Info;
	permanent	= 0;
	important 	= 0;
	description = "Это сердце ледяного голема может служить доказательством?";
};

FUNC INT Info_XardasDemon_ICEHEART_Condition()
{	
	if 	Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	Npc_HasItems (hero, ItAt_IceGolem_01)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_ICEHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_ICEHEART_15_01"); //Это сердце ледяного голема может служить доказательством?

	B_GiveInvItems  (hero, self, ItAt_IceGolem_01, 1);

	B_XardasDemon_GiveHeart();
};

//***************************************************************************
//	Info FIREHEART
//***************************************************************************
instance Info_XardasDemon_FIREHEART (C_INFO)
{
	npc			= XardasDemon;
	condition	= Info_XardasDemon_FIREHEART_Condition;
	information	= Info_XardasDemon_FIREHEART_Info;
	permanent	= 0;
	important 	= 0;
	description = "Как насчет сердца огненного голема?";
};

FUNC INT Info_XardasDemon_FIREHEART_Condition()
{	
	if 	Npc_KnowsInfo(hero, Info_XardasDemon_MASTERHOW)
	&&	Npc_HasItems (hero, ItAt_FireGolem_01)
	{
		return TRUE;
	};	
};

FUNC VOID Info_XardasDemon_FIREHEART_Info()
{
	AI_Output		(hero, self,"Info_XardasDemon_FIREHEART_15_01"); //Как насчет сердца огненного голема?

	B_GiveInvItems  (hero, self, ItAt_FireGolem_01, 1);

	B_XardasDemon_GiveHeart();
};





