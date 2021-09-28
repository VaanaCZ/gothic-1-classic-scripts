// ************************************************************
// 							EXIT 
// ************************************************************

INSTANCE Info_Yberion_EXIT(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 999;
	condition	= Info_Yberion_EXIT_Condition;
	information	= Info_Yberion_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT Info_Yberion_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Yberion_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

//############################### KAPITEL 1 ###############################


INSTANCE DIA_YBerion_Wache(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= DIA_YBerion_Wache_Condition;
	information	= DIA_YBerion_Wache_Info;
	permanent	= 1;
	important 	= 1;
};                       

FUNC INT DIA_YBerion_Wache_Condition()
{
	if (Kapitel == 1)
	{
		return 1;
	};
};

FUNC VOID DIA_YBerion_Wache_Info()
{	
	AI_Output			(self,	other,"DIA_YBerion_Wache_12_00"); //Как ты здесь оказался? Кто тебя впустил? Стража!
	B_IntruderAlert		(self,	other);
	AI_StopProcessInfos	(self);
};

//############################### Kennen? ###############################

INSTANCE DIA_YBerion_Kennen(C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= DIA_YBerion_Kennen_Condition;
	information	= DIA_YBerion_Kennen_Info;
	permanent	= 0;
	description = "Приветствую тебя, Учитель Юберион!";
};                       

FUNC INT DIA_YBerion_Kennen_Condition()
{
	if (Kapitel == 2)
	{
		return 1;
	};
};

FUNC VOID DIA_YBerion_Kennen_Info()
{	
	AI_Output (other, self,"DIA_YBerion_Kennen_15_00"); //Приветствую тебя, Учитель Юберион!
	AI_Output (self, other,"DIA_YBerion_Kennen_12_01"); //А! Я тебя знаю!
	AI_Output (other, self,"DIA_YBerion_Kennen_15_02"); //Это невозможно. Мы еще ни разу не встречались.
	AI_Output (self, other,"DIA_YBerion_Kennen_12_03"); //Я думал ты...Хорошо. Что тебе нужно?
};


//############################### KAPITEL 2 ###############################

// ------------------------------ BringFocus ---------------------------
INSTANCE Info_YBerion_BringFocus (C_INFO)
{
	npc			= GUR_1200_Yberion;
	condition	= Info_YBerion_BringFocus_Condition;
	information	= Info_YBerion_BringFocus_Info;
	permanent	= 1;
	description = "Я слышал, что ты хочешь что-то найти.";
};


FUNC INT Info_YBerion_BringFocus_Condition()
{
	if	(Npc_KnowsInfo(hero,DIA_YBerion_Kennen)	)
	&&	(Npc_GetTrueGuild(hero) != GIL_NONE		)
	&& 	(YBerion_BringFocus		!= LOG_RUNNING	)
	&& 	(YBerion_BringFocus		!= LOG_SUCCESS	)
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_BringFocus_Info()
{
	AI_Output (other, self,"Sit_2_PSI_Yberion_BringFocus_Info_15_01"); //Я слышал, что ты хочешь что-то найти.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_02"); //Так и есть. Нам нужен магический юнитор.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_03"); //Мы уже отправили за ним новенького, Нираса, но он все еще не вернулся.
	AI_Output (self, other,"Sit_2_PSI_Yberion_BringFocus_Info_12_04"); //Может, ты сможешь выяснить, что с ним случилось?
	
	Info_ClearChoices	(Info_YBerion_BringFocus);
	Info_AddChoice		(Info_YBerion_BringFocus,DIALOG_BACK							,	Info_YBerion_BringFocus_BACK);
	Info_AddChoice		(Info_YBerion_BringFocus,"Я верну вам юнитор!"	,	Info_YBerion_BringFocus_OK);
	Info_AddChoice		(Info_YBerion_BringFocus,"Где я должен его искать?"					,	Info_YBerion_BringFocus_WO);
	Info_AddChoice		(Info_YBerion_BringFocus,"Почему этот юнитор так важен?"	,	Info_YBerion_BringFocus_FOKUS);
};

func void Info_YBerion_BringFocus_BACK ()
{
	Info_ClearChoices	(Info_YBerion_BringFocus);
};

func void Info_YBerion_BringFocus_OK ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_OK_15_01"); //Я верну вам юнитор!
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_OK_12_02"); //Вот карта. На ней отмечено, где должен быть юнитор.

	B_Story_BringFirstFocus();

	B_LogEntry		(CH2_Focus,	"Юберион послал послушника Нираса за юнитором. Но он до сих пор не вернулся. Гуру дал мне карту, на которой отмечен путь к юнитору.");
};

func void Info_YBerion_BringFocus_WO ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_WO_15_01"); //Где я должен его искать?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_WO_12_02"); //Будешь выходить из лагеря, поверни направо и дальше вдоль скалы. Дальше будет лес, за ним море. Там и должен быть юнитор.
};

func void Info_YBerion_BringFocus_FOKUS ()
{
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_01"); //Почему этот юнитор так важен?
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_02"); //В нем сокрыта магия, способная концентрировать нашу силу.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_03"); //Он один из пяти камней, участвоваших в сотворении Барьера.
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_04"); //Мое видение сказало, что сила этого камня поможет нам.
	AI_Output			(other, self,"Sit_2_PSI_Yberion_BringFocus_FOKUS_15_05"); //Интересное видение!
	AI_Output			(self, other,"Sit_2_PSI_Yberion_BringFocus_FOKUS_12_06"); //Мое видение - это послание Спящего. И с помощью юнитора мы сможем призвать его!
};

// ------------------------------ RUNNING ----------------------------------
INSTANCE Info_YBerion_BringFocus_RUNNING (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_RUNNING_Condition;
	information	= Info_YBerion_BringFocus_RUNNING_Info;
	permanent	= 0;
	description	= "Я все еще не нашел юнитор.";
};                       

FUNC INT Info_YBerion_BringFocus_RUNNING_Condition()
{
	if  ( YBerion_BringFocus == LOG_RUNNING ) && ( !Npc_HasItems ( hero, Focus_1 ))
	{
		return TRUE;
	};
};

FUNC VOID Info_YBerion_BringFocus_RUNNING_Info()
{	
	AI_Output (other, self,"Info_YBerion_BringFocus_RUNNING_15_01"); //Я все еще не нашел юнитор.
	AI_Output (self, other,"Info_YBerion_BringFocus_RUNNING_12_02"); //Продолжай поиски! Спящий поможет тебе.
};

// ------------------------------ SUCCESS ----------------------------------
INSTANCE Info_YBerion_BringFocus_Success (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_BringFocus_Success_Condition;
	information	= Info_YBerion_BringFocus_Success_Info;
	permanent	= 0;
	description	= "Я нашел юнитор.";
};                       

FUNC INT Info_YBerion_BringFocus_Success_Condition()
{
	if  ( YBerion_BringFocus == LOG_RUNNING ) && ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_BringFocus_Success_Info()
{	
	AI_Output			(other, self,"Info_YBerion_BringFocus_Success_15_01"); //Я нашел юнитор.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_02"); //Замечательно! Ты очень сильно помог нам.
	AI_Output			(self, other,"Info_YBerion_BringFocus_Success_12_03"); //Отнеси его теперь Кор Галому. Он знает, что с ним делать.
	if	(Kalom_TalkedTo == FALSE)
	{
		AI_Output		(other, self,"Info_YBerion_BringFocus_Success_15_04"); //Где я могу найти этого Кор Галома?
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_05"); //Он почти все время работает в своей лаборатории на втором уровне.
		AI_Output		(self, other,"Info_YBerion_BringFocus_Success_12_06"); //У входа в лагерь должен быть Лестер. Обычно он помогает новичкам не заблудиться здесь.
		B_LogEntry		(CH2_Focus,	"Юберион поручил мне отнести юнитор Кор Галому, одному из Гуру. Он постоянно работает в своей лаборатории."); 
	}
	else
	{
		B_LogEntry		(CH2_Focus,	"Юберион поручил мне отнести юнитор Кор Галому. Как 'приятно' снова встретить этого всенародно любимого человека.");
	};

	Tpl_1406_Templer.aivar[AIV_PASSGATE] = TRUE;		//Tьrwache vor dem Labor

	YBerion_BringFocus = LOG_SUCCESS;
	B_GiveXP			(XP_BringFocusToYBerion);
};

// ------------------------------ NYRAS ----------------------------------
INSTANCE Info_YBerion_NYRAS (C_INFO)
{
	npc			= GUR_1200_Yberion;
	nr			= 1;
	condition	= Info_YBerion_NYRAS_Condition;
	information	= Info_YBerion_NYRAS_Info;
	permanent	= 0;
	description	= "Послушник Нирас сошел с ума!";
};                       

FUNC INT Info_YBerion_NYRAS_Condition()
{
	if  ( Npc_HasItems ( hero, Focus_1 ))
	{
		return 1;
	};
};

FUNC VOID Info_YBerion_NYRAS_Info()
{	
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_01"); //Послушник Нирас сошел с ума!
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_02"); //Он сказал, будто Спящий явился ему и избрал его своим единственным слугой!
	AI_Output			(other, self,"Info_YBerion_NYRAS_15_03"); //Потом он напал на меня и захотел убить!
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_04"); //Могущество Спящего слишком велико для разума послушника.
	AI_Output			(self, other,"Info_YBerion_NYRAS_12_05"); //Лишь мы, Гуру, после долгих лет медитации смогли достичь той силы духа, что позволяет нам выносить голос всемогущего Спящего.
};

// ------------------------------ BELOHNUNG ----------------------------------
instance  GUR_1200_Yberion_EARN (C_INFO)
{
	npc				= GUR_1200_Yberion;
	condition		= GUR_1200_Yberion_EARN_Condition;
	information		= GUR_1200_Yberion_EARN_Info;
	important		= 0;
	permanent		= 0;
	description		= "А я не заслужил награды?"; 
};

FUNC int  GUR_1200_Yberion_EARN_Condition()
{	
	if ( YBerion_BringFocus == LOG_SUCCESS) && ( Npc_GetTrueGuild (hero)!= GIL_NOV ) && ( C_IsChapter(2) )
	{
		return 1;
	};

};
FUNC void  GUR_1200_Yberion_EARN_Info()
{
	AI_Output				(other, self,"GUR_1200_Yberion_EARN_Info_15_01"); //А я не заслужил награды?
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_02"); //Так и быть, ты не из нашего Братства, но я награжу тебя.
	AI_Output				(self, other,"GUR_1200_Yberion_EARN_Info_12_03"); //Возьми этот амулет в благодарность за твою помощь.
	CreateInvItem	    (self, Schutzamulett_Feuer);
	B_GiveInvItems	    (self, hero, Schutzamulett_Feuer, 1);
};  



//############################### KAPITEL 3 ###############################
//SPIELER HAT DIE HEILKRДUTER ZU COR ANGAR GEBRACHT
//YBERION WACHT AUF UND STIRBT
/*
instance GUR_1200_Yberion_LASTWORDS (C_INFO)
{
	npc				= GUR_1200_Yberion;
	condition		= GUR_1200_Yberion_LASTWORDS_Condition;
	information		= GUR_1200_Yberion_LASTWORDS_Info;
	important		= 1;
	permanent		= 0;

};

FUNC int GUR_1200_Yberion_LASTWORDS_Condition()
{	
	if ( Npc_KnowsInfo (hero,Info_CorAngar_FindHerb_Success))
	{
		return 1;
	};

};
FUNC void  GUR_1200_Yberion_LASTWORDS_Info()
{
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_01"); //Das Ende...der Schlдfer...ich sah...IHN!
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_02"); //Wer...?...du bist es, gut. Hцr mir zu....
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_03"); //Du darfst den Schlдfer nicht wecken,... die Wassermagier, ...
	AI_Output (other, self,"GUR_1200_Yberion_LASTWORDS_Info_15_04"); //Was ist mit den Wassermagiern?
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_05"); //Du musst zu den Wassermagiern gehen. Sie werden es schaffen, hier rauszukommen.
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_06"); //Der Schlдfer...Ich sah ihn. Er ist ein ...ein ....Dдmon!
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_07"); //Wenn du die Barriere noch immer vernichten willst,... geh zum Neuen Lager. Berichte ihnen vom Fokus. Sag ihnen...
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_08"); //...sag ihnen das wir herausgefunden haben, wie sich die Foki aufladen lassen, sie sollen...sollen die Barriere vernichten......ihr mьsst ....
	AI_Output (self, other,"GUR_1200_Yberion_LASTWORDS_Info_12_09"); //...das Bцse....darf nicht erwachen .... 
	
	
	
};  
// ------------------------------  ----------------------------------
*/
