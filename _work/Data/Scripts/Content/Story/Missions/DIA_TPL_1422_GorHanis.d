// **************************************************
//						 EXIT 
// **************************************************

instance Info_GorHanis_Exit (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 999;
	condition		= Info_GorHanis_Exit_Condition;
	information		= Info_GorHanis_Exit_Info;
	permanent		= 1;
	description 	= DIALOG_ENDE;
};                       

FUNC INT Info_GorHanis_Exit_Condition()
{
	return 1;
};

func VOID Info_GorHanis_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//				Was machst du hier?
// **************************************************

instance Info_GorHanis_What(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_GorHanis_What_Condition;
	information		= Info_GorHanis_What_Info;
	permanent		= 0;
	description 	= "Чем ты занимаешься?";
};                       

FUNC INT Info_GorHanis_What_Condition()
{
	return 1;
};

func VOID Info_GorHanis_What_Info()
{
	AI_Output (other, self,"Info_GorHanis_What_15_00"); //Чем ты занимаешься?
	AI_Output (self, other,"Info_GorHanis_What_08_01"); //Я? Сражаюсь во славу Спящего!
};

// **************************************************
//					Arena
// **************************************************

instance Info_GorHanis_Arena(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 1;
	condition		= Info_GorHanis_Arena_Condition;
	information		= Info_GorHanis_Arena_Info;
	permanent		= 1;
	description 	= "Ты дерешься на арене?";
};                       

FUNC INT Info_GorHanis_Arena_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Arena_Info()
{
	AI_Output (other, self,"Info_GorHanis_Arena_15_00"); //Ты дерешься на арене?
	AI_Output (self, other,"Info_GorHanis_Arena_08_01"); //Болотные братья послали меня сюда сражаться во славу Спящего.
	AI_Output (self, other,"Info_GorHanis_Arena_08_02"); //Я дерусь во имя Спящего - и неверные видят, какой силой он наделил меня!
};

// **************************************************
//					Schlдfer
// **************************************************

instance Info_GorHanis_Sleeper(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Sleeper_Condition;
	information		= Info_GorHanis_Sleeper_Info;
	permanent		= 0;
	description 	= "Кто такой Спящий?";
};                       

FUNC INT Info_GorHanis_Sleeper_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_What))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Sleeper_Info()
{
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_00"); //Кто такой Спящий?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_01"); //Жрецы в нашем Лагере расскажут тебе о нем куда лучше, чем я.
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_02"); //Я только вот что тебе скажу: Спящий - наш спаситель. Он привел нас сюда, он же и выведет нас отсюда.
	AI_Output (other, self,"Info_GorHanis_Sleeper_15_03"); //То есть вы ждете, пока ваш бог подарит вам свободу?
	AI_Output (self, other,"Info_GorHanis_Sleeper_08_04"); //Да! И наше ожидание скоро окончится. Уже готовится Великая Церемония.
};

// **************************************************
//					GroЯe Anrufung
// **************************************************

instance Info_GorHanis_Summoning (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 2;
	condition		= Info_GorHanis_Summoning_Condition;
	information		= Info_GorHanis_Summoning_Info;
	permanent		= 0;
	description 	= "Что за церемония?";
};                       

FUNC INT Info_GorHanis_Summoning_Condition()
{
	if (Npc_KnowsInfo(self,Info_GorHanis_Sleeper))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Summoning_Info()
{
	AI_Output (other, self,"Info_GorHanis_Summoning_15_00"); //Что за церемония?
	AI_Output (self, other,"Info_GorHanis_Summoning_08_01"); //Наши пророки говорят, что Великая Церемония вызова Спящего откроет нам путь к свободе!
	AI_Output (self, other,"Info_GorHanis_Summoning_08_02"); //Если хочешь узнать об этом больше, приходи в наш Лагерь.
};

// **************************************************
//					Weg zum ST
// **************************************************

instance Info_GorHanis_WayToST(C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 0;
	condition		= Info_GorHanis_WayToST_Condition;
	information		= Info_GorHanis_WayToST_Info;
	permanent		= 1;
	description 	= "Как добраться до вашего Лагеря?";
};                       

FUNC INT Info_GorHanis_WayToST_Condition()
{
	if ( Npc_KnowsInfo(hero,Info_GorHanis_Sleeper) || Npc_KnowsInfo(hero,Info_GorHanis_Summoning) )
	{
		return 1;
	};
};

func VOID Info_GorHanis_WayToST_Info()
{
	AI_Output (other, self,"Info_GorHanis_WayToST_15_00"); //Как добраться до вашего Лагеря?
	AI_Output (self, other,"Info_GorHanis_WayToST_08_01"); //Здесь, в Старом Лагере, всегда можно найти кого-нибудь из послушников. Они с радостью проводят тебя в наш Лагерь. Тебе просто нужно поговорить с ними.
};

// **************************************************
//					FORDERN
// **************************************************

instance Info_GorHanis_Charge (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 3;
	condition		= Info_GorHanis_Charge_Condition;
	information		= Info_GorHanis_Charge_Info;
	permanent		= 0;
	description 	= "Я вызываю тебя на бой!";
};                       

FUNC INT Info_GorHanis_Charge_Condition()
{
	if (Npc_KnowsInfo (hero,Info_GorHanis_Arena))
	{
		return 1;
	};
};

func VOID Info_GorHanis_Charge_Info()
{
	AI_Output (other, self,"Info_GorHanis_Charge_15_00"); //Я вызываю тебя на бой!
	AI_Output (self, other,"Info_GorHanis_Charge_08_01"); //Невелика слава для Спящего, если я буду убивать каждого бездельника на глазах у толпы.
	AI_Output (self, other,"Info_GorHanis_Charge_08_02"); //Я буду драться с тобой только тогда, когда ты станешь достойным противником.
	AI_Output (self, other,"Info_GorHanis_Charge_08_03"); //Но я думаю, что у бойцов из других Лагерей куда меньше принципов...…
};

// **************************************************
//					NOCHMAL FORDERN
// **************************************************

instance Info_GorHanis_ChargeGood (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	nr				= 3;
	condition		= Info_GorHanis_ChargeGood_Condition;
	information		= Info_GorHanis_ChargeGood_Info;
	permanent		= 1;
	description 	= "Ну что, теперь ты будешь драться со мной?";
};                       

FUNC INT Info_GorHanis_ChargeGood_Condition()
{
	if (Npc_KnowsInfo (hero,Info_GorHanis_Charge))
	{
		return 1;
	};
};

func VOID Info_GorHanis_ChargeGood_Info()
{
	AI_Output (other, self,"Info_GorHanis_ChargeGood_15_00"); //Ну что, теперь ты будешь драться со мной?
	AI_Output (self, other,"Info_GorHanis_ChargeGood_08_01"); //Нет! Ты еще недостаточно силен для этого!
};























/*

// infos 
instance Info_TPL_1422_GorHanis (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis_Condition;
	information		= Info_TPL_1422_GorHanis_Info;
	important			= 1;
	permanent		= 0;
};

FUNC int Info_TPL_1422_GorHanis_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_PC_Mage_LoadSword3 )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis_Info()
{
	AI_Output (self, other,"Info_TPL_1422_GorHanis_08_01"); //Was machst du hier?
};


instance Info_TPL_1422_GorHanis1 (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis1_Condition;
	information		= Info_TPL_1422_GorHanis1_Info;
	important			= 0;
	permanent		= 0;
	description		= "Ich will helfen den Schlдfer zu erwecken."; 
};

FUNC int Info_TPL_1422_GorHanis1_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis1_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis1_15_01"); //Ich will helfen den Schlдfer zu erwecken.
	AI_Output (self, other,"Info_TPL_1422_GorHanis1_08_02"); //Hmm, siehst gar nicht so aus, als wolltest Du wirklich helfen wollen. Geh aber ruhig weiter, ich halte dich nicht auf, falls du lьgst, wird der Hohenpriester dir schon eine Lektion erteilen.
};



instance Info_TPL_1422_GorHanis2 (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis2_Condition;
	information		= Info_TPL_1422_GorHanis2_Info;
	important			= 0;
	permanent		= 0;
	description		= "Das geht dich nichts an!"; 
};

FUNC int Info_TPL_1422_GorHanis2_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis2_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis2_15_01"); //Das geht dich nichts an!
	AI_Output (self, other,"Info_TPL_1422_GorHanis2_08_02"); //Soso, dann lasse ich dich lieber passieren, bevor du mir weh tust (lacht). Am Hohenpriester kommst Du eh nicht vorbei und ich muss mein Schwert nicht mit deinem Blut beschmutzen. 
};


instance Info_TPL_1422_GorHanis3 (C_INFO)
{
	npc				= TPL_1422_GorHanis;
	condition			= Info_TPL_1422_GorHanis3_Condition;
	information		= Info_TPL_1422_GorHanis3_Info;
	important			= 0;
	permanent		= 0;
	description		= "Wie seit ihr an dem Priester vorbei gekommen?"; 
};

FUNC int Info_TPL_1422_GorHanis3_Condition()
{
	if ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis2 )) || ( Npc_KnowsInfo ( hero, Info_TPL_1422_GorHanis1 )) {
		return 1;
	};	
};

func void Info_TPL_1422_GorHanis3_Info()
{
	AI_Output (other, self,"Info_TPL_1422_GorHanis3_15_01"); //Wie seit ihr an dem Priester vorbei gekommen?
	AI_Output (self, other,"Info_TPL_1422_GorHanis3_08_02"); //Ich sage es dir, es wird dir eh nicht nutzen. Der Priester hat uns nur passieren lassen, weil Meister Kalom mit im gesprochen hat, dass Glьck wirst du nicht haben. Geh nur (lacht).
};

*/
