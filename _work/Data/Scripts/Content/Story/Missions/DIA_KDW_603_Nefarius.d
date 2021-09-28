// **************************** 
//				EXIT 
// ****************************

instance  Info_Nefarius_EXIT (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	999;
	condition	=	Info_Nefarius_EXIT_Condition;
	information	=	Info_Nefarius_EXIT_Info;
	permanent	=	1;
	description =	DIALOG_ENDE;
};                       

FUNC int  Info_Nefarius_EXIT_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_EXIT_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************** 
//			Hallo 
// ****************************

instance  Info_Nefarius_Hallo (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_Hallo_Condition;
	information	=	Info_Nefarius_Hallo_Info;
	permanent	=	0;
	description =	"Как тебя зовут?";
};                       

FUNC int  Info_Nefarius_Hallo_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_Hallo_Info()
{
	AI_Output (other, self,"Info_Nefarius_Hallo_15_00"); //Кто ты?
	AI_Output (self, other,"Info_Nefarius_Hallo_04_01"); //Я Нефариус, маг Круга Воды.
};

// **************************** 
//			Wo Saturas
// ****************************

instance  Info_Nefarius_WoSaturas (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	2;
	condition	=	Info_Nefarius_WoSaturas_Condition;
	information	=	Info_Nefarius_WoSaturas_Info;
	permanent	=	0;
	description =	"Где мне найти Сатураса?";
};                       

FUNC int  Info_Nefarius_WoSaturas_Condition()
{
	return 1;
};

FUNC VOID  Info_Nefarius_WoSaturas_Info()
{
	AI_Output (other, self,"Info_Nefarius_WoSaturas_15_00"); //Где мне найти Сатураса?
	AI_Output (self, other,"Info_Nefarius_WoSaturas_04_01"); //Иди в большие круглые ворота. Там ты и найдешь его.
};

// **************************** 
//			WannaMage
// ****************************

instance  Info_Nefarius_WannaMage (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_WannaMage_Condition;
	information	=	Info_Nefarius_WannaMage_Info;
	permanent	=	0;
	description =	"Я хочу стать магом Круга Воды!";
};                       

FUNC int  Info_Nefarius_WannaMage_Condition()
{
	if (Npc_KnowsInfo(hero,Info_Nefarius_Hallo))
	{
		return 1;
	};
};

FUNC VOID  Info_Nefarius_WannaMage_Info()
{
	AI_Output (other, self,"Info_Nefarius_WannaMage_15_00"); //Я хочу стать магом Круга Воды!
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_01"); //(со смехом) Не так быстро, мой мальчик!
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_02"); //Прежде чем мы позволим новичку присоединиться к нам, он должен проявить себя в каком-нибудь великом деянии.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_03"); //И он должен служить нам какое-то время.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_04"); //Если ты серьезен в своих намерениях, ты должен стать одним из наших наемников. Так ты сможешь служить нам.
	AI_Output (self, other,"Info_Nefarius_WannaMage_04_05"); //И может быть однажды тебе представится шанс сделать что-то большое.
};

// **************************** 
//			NowReady
// ****************************

instance  Info_Nefarius_NowReady (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_NowReady_Condition;
	information	=	Info_Nefarius_NowReady_Info;
	permanent	=	1;
	description =	"Я готов присоединиться к Кругу Воды?";
};                       

FUNC int  Info_Nefarius_NowReady_Condition()
{
	if	( !FMTaken && Npc_KnowsInfo(hero, Info_Nefarius_WannaMage) && (Npc_GetTrueGuild(hero)!=GIL_KDW) )
	{
		return 1;
	};	
};

FUNC VOID  Info_Nefarius_NowReady_Info()
{
	AI_Output (other, self,"Info_Nefarius_NowReady_15_00"); //Я готов присоединиться к Кругу Воды?
	
	if (Npc_GetTrueGuild (hero) != GIL_SLD) 
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_01"); //Стань одним из наших наемников, а там посмотрим...
	}
	else
	{
		AI_Output (self, other,"Info_Nefarius_NowReady_04_02"); //Вижу, ты стал одним из наших наемников. Очень хорошо, очень хорошо...
		AI_Output (self, other,"Info_Nefarius_NowReady_04_03"); //Теперь дело за временем...
	};
};

//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////
///////////////		Kapitel 4				//////////////
//////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////

// **************************** 
//			OCNews
// ****************************

instance  Info_Nefarius_OCNews (C_INFO)
{
	npc			=	KDW_603_Nefarius;
	nr			=	1;
	condition	=	Info_Nefarius_OCNews_Condition;
	information	=	Info_Nefarius_OCNews_Info;
	permanent	=	0;
	important	= 	1;
};                       

FUNC int  Info_Nefarius_OCNews_Condition()
{
	if	FMTaken
	&&	!FindXardas
	{
		return TRUE;
	};	
};

FUNC VOID  Info_Nefarius_OCNews_Info()
{
	AI_Output (self, other,"Info_Nefarius_OCNews_04_00"); //Есть какие-нибудь новости от наших друзей из Старого Лагеря?
	AI_Output (other, self,"Info_Nefarius_OCNews_15_01"); //Гомез расправился с магами Огня!
	AI_Output (self, other,"Info_Nefarius_OCNews_04_02"); //Нет! Кретин! Я предупреждал Корристо - ему нельзя доверять! Ты должен рассказать об этом Сатурасу!
	if (Npc_GetTrueGuild(hero)==GIL_SLD)
	{
		AI_Output (self, other,"Info_Nefarius_OCNews_04_03"); //Подожди!
		AI_Output (self, other,"Info_Nefarius_OCNews_04_04"); //Ради нас ты пережил много опасностей и встретил их достойно.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_05"); //Думаю, что теперь ты готов носить одеяние магов Воды.
		AI_Output (self, other,"Info_Nefarius_OCNews_04_06"); //Но сейчас ты должен поговорить с Сатурасом! Торопись!
	};
	AI_StopProcessInfos	(self);
};
