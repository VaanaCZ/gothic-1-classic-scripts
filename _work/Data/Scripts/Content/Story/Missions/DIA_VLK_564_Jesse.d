// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Jesse_Exit (C_INFO)
{
	npc			= Vlk_564_Jesse;
	nr			= 999;
	condition	= DIA_Jesse_Exit_Condition;
	information	= DIA_Jesse_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Jesse_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Jesse_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Hi
// **************************************************

INSTANCE DIA_Jesse_Hallo (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Hallo_Condition;
	information		= DIA_Jesse_Hallo_Info;
	permanent		= 0;
	description		= "Как жизнь?";
};

FUNC INT DIA_Jesse_Hallo_Condition()
{	
	if (!Npc_KnowsInfo(hero,DIA_Herek_Bully))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Hallo_Info()
{
	AI_Output (other, self,"DIA_Jesse_Hallo_15_00"); //Как дела?
	AI_Output (self, other,"DIA_Jesse_Hallo_03_01"); //Ты новенький, да? Со стражниками держи ухо востро.
	AI_Output (self, other,"DIA_Jesse_Hallo_03_02"); //Когда они потребуют деньги за защиту, лучше заплатить, иначе половина Лагеря ополчится против тебя.
};

// **************************************************
// 				Schutzgeld-Bully
// **************************************************

INSTANCE DIA_Jesse_Warn (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Warn_Condition;
	information		= DIA_Jesse_Warn_Info;
	permanent		= 0;
	important		= 1;
};

FUNC INT DIA_Jesse_Warn_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Herek_Bully)) && (Herek_ProtectionBully==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Warn_Info()
{
	AI_Output (self, other,"DIA_Jesse_Warn_03_00"); //Эй, ты! Я слышал, ты отказался платить Бладвину за защиту.
	AI_Output (other, self,"DIA_Jesse_Warn_15_01"); //И что с того?
	AI_Output (self, other,"DIA_Jesse_Warn_03_02"); //Просто хочу предупредить тебя. Бладвин заплатил местным головорезам, чтобы они прикончили тебя.
	AI_Output (self, other,"DIA_Jesse_Warn_03_03"); //Я видел, как он разговаривал с Хереком, и Бог знает, кого он нанял еще.
	AI_Output (other, self,"DIA_Jesse_Warn_15_04"); //По поводу Херека... твое предупреждение слегка запоздало.
	AI_Output (self, other,"DIA_Jesse_Warn_03_05"); //Но он наверняка нанял кого-то еще, так что смотри в оба!
};

// **************************************************
// 				MISSION Pay 4 Me
// **************************************************
	
// ************************************************************

INSTANCE DIA_Jesse_Mission (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_Mission_Condition;
	information		= DIA_Jesse_Mission_Info;
	permanent		= 0;
	description		= "Почему ты рассказал мне про Бладвина?";
};

FUNC INT DIA_Jesse_Mission_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Jesse_Mission))
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_Mission_Info()
{
	AI_Output (other, self,"DIA_Jesse_Mission_15_00"); //Почему ты рассказал мне про Бладвина?
	AI_Output (self, other,"DIA_Jesse_Mission_03_01"); //Потому что на добро принято отвечать добром. И ты похож на человека, который понимает это.
	AI_Output (self, other,"DIA_Jesse_Mission_03_02"); //Я помог ТЕБЕ, и теперь у тебя есть возможность помочь мне.
	
	Info_ClearChoices	(DIA_Jesse_Mission );
	Info_AddChoice		(DIA_Jesse_Mission,"Забудь об этом. Я ничего тебе не должен!",DIA_Jesse_Mission_ForgetIt);
	Info_AddChoice		(DIA_Jesse_Mission,"Чего ты хочешь?",DIA_Jesse_Mission_What);
};

func void DIA_Jesse_Mission_ForgetIt()
{
	AI_Output (other, self,"DIA_Jesse_Mission_ForgetIt_15_00"); //Эй, я тебе ничего не должен!
	AI_Output (self, other,"DIA_Jesse_Mission_ForgetIt_03_01"); //Ну, раз так, проваливай!
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
	AI_StopProcessInfos	(self);
};

func void DIA_Jesse_Mission_What()
{
	AI_Output (other, self,"DIA_Jesse_Mission_What_15_00"); //Чего ты хочешь?
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_01"); //У меня совсем не осталось руды, да и Бладвин ободрал меня как липку.
	AI_Output (self, other,"DIA_Jesse_Mission_What_03_02"); //Я уже задолжал ему 10 кусков руды. Так вот, не мог бы ты отдать их ему за меня?
	Npc_SetTrueGuild(self,GIL_NONE); //KEIN Schutzgeld
	
	Info_AddChoice		(DIA_Jesse_Mission,"Чтобы я платил за тебя?! И думать забудь!",DIA_Jesse_Mission_NO);
	Info_AddChoice		(DIA_Jesse_Mission,"Посмотрим, что мне удастся сделать.",DIA_Jesse_Mission_YES);
};
//-------------------------------
func void DIA_Jesse_Mission_YES()
{
	AI_Output (other, self,"DIA_Jesse_Mission_YES_15_00"); //Ладно, посмотрим.
	AI_Output (self, other,"DIA_Jesse_Mission_YES_03_01"); //Спасибо, дружище! Ты буквально спас меня! Скажешь, когда все будет улажено, ладно?
	Jesse_PayForMe = LOG_RUNNING;
	
	Info_ClearChoices	(DIA_Jesse_Mission );
};

func void DIA_Jesse_Mission_NO()
{
	AI_Output (other, self,"DIA_Jesse_Mission_NO_15_00"); //Чтобы я платил за тебя?! И думать забудь!
	AI_Output (self, other,"DIA_Jesse_Mission_NO_03_01"); //Кажется, я в тебе ошибся. В будущем можешь на меня не рассчитывать.
	//MUSS SO - Mike
	Npc_SetPermAttitude(self,ATT_ANGRY);
	Info_ClearChoices	(DIA_Jesse_Mission );
};


// **************************************************
// 					RUNNING / SUCCESS
// **************************************************

INSTANCE DIA_Jesse_MisSuccess (C_INFO)
{
	npc				= Vlk_564_Jesse;
	nr				= 1;
	condition		= DIA_Jesse_MisSuccess_Condition;
	information		= DIA_Jesse_MisSuccess_Info;
	permanent		= 0;
	description		= "Я заплатил Бладвину!";
};

FUNC INT DIA_Jesse_MisSuccess_Condition()
{	
	if (Jesse_PayForMe == LOG_SUCCESS)
	{
		return 1;
	};
};

FUNC VOID DIA_Jesse_MisSuccess_Info()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_15_00"); //Я заплатил Бладвину!
	AI_Output (self, other,"DIA_Jesse_MisSuccess_03_01"); //Да? Здорово! Теперь мы с тобой в расчете.
	Npc_SetTrueGuild(self,GIL_VLK); //Schutzgeld GEZAHLT
	
	Info_ClearChoices	(DIA_Jesse_MisSuccess );
	Info_AddChoice		(DIA_Jesse_MisSuccess,"ЧТООО? Я заплатил 10 кусков руды за то, что и так уже знал?",DIA_Jesse_MisSuccess_Waaas);
	Info_AddChoice		(DIA_Jesse_MisSuccess,"Да. Услуга за услугу.",DIA_Jesse_MisSuccess_Ok);
};

func void DIA_Jesse_MisSuccess_Waaas()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Waaas_15_00"); //ЧТООО? Я заплатил 10 кусков руды за то, что и так уже знал?
	AI_Output (self, other,"DIA_Jesse_MisSuccess_Waaas_03_01"); //Получается, что так.
};

func void DIA_Jesse_MisSuccess_Ok()
{
	AI_Output (other, self,"DIA_Jesse_MisSuccess_Ok_15_00"); //Да. Услуга за услугу.
};

//a) <Herek tot>
//b) Herek wird versuchen, 


/* */
