// **************************************
//					EXIT 
// **************************************

instance DIA_Gomez_Exit (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 999;
	condition	= DIA_Gomez_Exit_Condition;
	information	= DIA_Gomez_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int DIA_Gomez_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Gomez_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************
//		Nicht mit Raven geredet
// **************************************

instance DIA_Gomez_Fault (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Fault_Condition;
	information	= DIA_Gomez_Fault_Info;
	permanent	= 0;
	description	= "Я пришел, чтобы предложить свои услуги.";
};                       

FUNC int DIA_Gomez_Fault_Condition()
{
	if (!Npc_KnowsInfo(hero,DIA_Raven_There))
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_Fault_Info()
{
	AI_Output (other, self,"DIA_Gomez_Fault_15_00"); //Я пришел, чтобы предложить свои услуги.
	AI_Output (self, other,"DIA_Gomez_Fault_11_01"); //Ты ворвался сюда и надеешься, что я буду слушать тебя, червяк?! СТРАЖА!
	
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};

// **************************************
//				Hallo
// **************************************
	var int gomez_kontakte;
// **************************************
	

instance DIA_Gomez_Hello (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Hello_Condition;
	information	= DIA_Gomez_Hello_Info;
	permanent	= 1;
	description	= "Я пришел, чтобы предложить свои услуги.";
};                       

FUNC int DIA_Gomez_Hello_Condition()
{
	if (Npc_KnowsInfo(hero,DIA_Raven_There) && (gomez_kontakte<4) )
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_Hello_Info()
{
	AI_Output (other, self,"DIA_Gomez_Hello_15_00"); //Я пришел, чтобы предложить свои услуги.
	AI_Output (self, other,"DIA_Gomez_Hello_11_01"); //А почему ты думаешь, что твои услуги нужны мне?
	
	Info_ClearChoices	(DIA_Gomez_Hello);																			
	Info_AddChoice		(DIA_Gomez_Hello,"Надеюсь, мне не понадобится отрывать тебе голову.",DIA_Gomez_Hello_KopfAb);
	Info_AddChoice		(DIA_Gomez_Hello,"Кругом одни болваны.",DIA_Gomez_Hello_Spinner);
	Info_AddChoice		(DIA_Gomez_Hello,"У меня есть связи во всех Лагерях.",DIA_Gomez_Hello_Kontakte);
	Info_AddChoice		(DIA_Gomez_Hello,"Я прошел испытание.",DIA_Gomez_Hello_ThorusSays);
	
};

func void DIA_Gomez_Hello_ThorusSays()
{
	AI_Output (other, self,"DIA_Gomez_Hello_ThorusSays_15_00"); //Я прошел испытание на преданность, и Торус сказал, что я достоин этого.
	AI_Output (self, other,"DIA_Gomez_Hello_ThorusSays_11_01"); //Если бы это было не так, ты не прошел бы сюда живым. Но хочется верить, что ты способен на большее.
};

func void DIA_Gomez_Hello_Kontakte()
{
	gomez_kontakte = 0;
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_15_00"); //Я много путешествовал по колонии, и у меня есть связи во всех Лагерях.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_11_01"); //Это может оказаться полезным. С кем, говоришь, ты знаком?
	Info_ClearChoices	(DIA_Gomez_Hello);
	Info_AddChoice		(DIA_Gomez_Hello,"Это были самые влиятельные люди.",DIA_Gomez_Hello_Kontakte_ThatsAll);
	Info_AddChoice		(DIA_Gomez_Hello,"Несколько фехтовальщиков в Новом Лагере.",DIA_Gomez_Hello_Kontakte_NLHehler);
	Info_AddChoice		(DIA_Gomez_Hello,"К Ларсу.",DIA_Gomez_Hello_Kontakte_Lares);
	//Info_AddChoice		(DIA_Gomez_Hello,"Zu Lee."	,DIA_Gomez_Hello_Kontakte_Lee);
	Info_AddChoice		(DIA_Gomez_Hello,"Несколько Идолов в Лагере Братства.",DIA_Gomez_Hello_Kontakte_Baals);
	Info_AddChoice		(DIA_Gomez_Hello,"Кор Галом.",DIA_Gomez_Hello_Kontakte_Kalom);
	
	if (gomez_kontakte < 3)
	{
	Info_AddChoice		(DIA_Gomez_Hello,"Ю`Берион.",DIA_Gomez_Hello_Kontakte_YBerion);
	};
};

func void DIA_Gomez_Hello_Spinner()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Spinner_15_00"); //Кругом одни болваны, которые только и делают, что пытаются переложить свою работу на плечи новичков, вместо того чтобы выполнять ее самим.
	AI_Output (self, other,"DIA_Gomez_Hello_Spinner_11_01"); //За небольшим исключением, это действительно так. Но я все равно не вижу причины нанимать еще одного болвана.
};

func void DIA_Gomez_Hello_KopfAb()
{
	AI_Output (other, self,"DIA_Gomez_Hello_KopfAb_15_00"); //Надеюсь, мне не придется отрубать вам голову, чтобы доказать, что я хорошо владею оружием.
	AI_Output (self, other,"DIA_Gomez_Hello_KopfAb_11_01"); //Фраза, достойная храбреца... или безумца.
	
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget		(self,other);
	AI_StartState		(self,ZS_ATTACK,1,"");
};

//----------------KONTAKTE--------------------


func void DIA_Gomez_Hello_Kontakte_YBerion()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_YBerion_15_00"); //Ю`Берион.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_01"); //Ю`Берион не станет тратить время на типов вроде тебя.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_02"); //Ты солгал мне. Похоже, ты думаешь, что я идиот.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_03"); //Я очень огорчен тем, что ты считаешь меня глупцом.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_YBerion_11_04"); //И знаешь что? Я ненавижу огорчаться.
	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};

func void DIA_Gomez_Hello_Kontakte_Kalom()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Kalom_15_00"); //Кор Галом.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Kalom_11_01"); //И?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_Baals()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Baals_15_00"); //Несколько Идолов в Лагере Братства.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Baals_11_01"); //И?
	gomez_kontakte = gomez_kontakte + 1;
};

/*
func void DIA_Gomez_Hello_Kontakte_Lee()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Lee_15_00"); //Zu Lee.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Lee_11_01"); //Lee ist also ein guter Freund von dir, ja?
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Lee_11_02"); //Dann sieht die Sache natьrlich ANDERS AUS (zornig am ENDE)

	AI_StopProcessInfos	(self);
	Npc_SetPermAttitude	(self, ATT_HOSTILE);
	Npc_SetTarget (self,other);
	AI_StartState (self,ZS_ATTACK,1,"");
};
*/
func void DIA_Gomez_Hello_Kontakte_Lares()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_Lares_15_00"); //Ларс.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_Lares_11_01"); //И еще?
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_NLHehler()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_NLHehler_15_00"); //Несколько фехтовальщиков в Новом Лагере.
	AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_NLHehler_11_01"); //Еще.
	gomez_kontakte = gomez_kontakte + 1;
};

func void DIA_Gomez_Hello_Kontakte_ThatsAll()
{
	AI_Output (other, self,"DIA_Gomez_Hello_Kontakte_ThatsAll_15_00"); //Это были самые влиятельные люди.
	if (gomez_kontakte >= 4)	
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_01"); //Не так уж плохо для новичка...
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_11_02"); //У тебя будет шанс.
		Info_ClearChoices	(DIA_Gomez_Hello);
	}
	else
	{
		AI_Output (self, other,"DIA_Gomez_Hello_Kontakte_ThatsAll_INSUFF_11_00"); //Ты надеешься удивить меня ЭТИМ? У нас есть РУДОКОПЫ с лучшими связями!
		Info_ClearChoices	(DIA_Gomez_Hello);
	};
};

// **************************************
//				Bin ich dabei
// **************************************

instance DIA_Gomez_Dabei (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_Dabei_Condition;
	information	= DIA_Gomez_Dabei_Info;
	permanent	= 0;
	description	= "Так что же - я в деле?";
};                       

FUNC int DIA_Gomez_Dabei_Condition()
{
	if	(gomez_kontakte >= 3)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_Dabei_Info()
{
	AI_Output (other, self,"DIA_Gomez_Dabei_15_00"); //Так что же - я в деле?
	AI_Output (self, other,"DIA_Gomez_Dabei_11_01"); //Точно так. Теперь ты один из нас, малыш.
	AI_Output (self, other,"DIA_Gomez_Dabei_11_02"); //Равен введет тебя в курс дела.
	
	Npc_SetTrueGuild (hero,GIL_STT );
	hero.guild = GIL_STT;
	B_GiveXP (XP_BecomeShadow);
	B_LogEntry			(CH1_JoinOC,"С сегодняшнего дня я работаю на Гомеза и Старый Лагерь. Детали мне расскажет Равен.");
	Log_SetTopicStatus	(CH1_JoinOC,	LOG_SUCCESS);

	// Canceln der anderen Aufnahmen
	Log_CreateTopic		(CH1_JoinNC,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinNC,	LOG_FAILED);
	B_LogEntry			(CH1_JoinNC,"Поскольку я принадлежу к людям Гомеза, банда Ларса теперь не для меня!");
	
	Log_CreateTopic		(CH1_JoinPsi,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_JoinPsi,	LOG_FAILED);
	B_LogEntry			(CH1_JoinPsi,"С сегодняшнего дня Старый Лагерь становится моим домом. Братству придется как-то обходиться без меня.");
	
	AI_StopProcessInfos	(self);
};

// **************************************
//				Nur so (PERM)
// **************************************

instance DIA_Gomez_NurSo (C_INFO)
{
	npc			= Ebr_100_Gomez;
	nr			= 1;
	condition	= DIA_Gomez_NurSo_Condition;
	information	= DIA_Gomez_NurSo_Info;
	permanent	= 1;
	description	= "Я подумал, мне стоит доложить о прибытии. ";
};                       

FUNC int DIA_Gomez_NurSo_Condition()
{
	if (Raven_SpySect==LOG_RUNNING)
	{
		return 1;
	};
};

FUNC VOID DIA_Gomez_NurSo_Info()
{
	AI_Output (other, self,"DIA_Gomez_NurSo_15_00"); //Я хотел доложить о прибытии. 
	AI_Output (self, other,"DIA_Gomez_NurSo_11_00"); //Доложи Равену. Никогда не обращайся ко мне без разрешения!
};


////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////
/////////////////   	Kapitel 5        ///////////////////
////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////


// ***********************************************
// 				Wartet auf den SC
// ***********************************************

instance  DIA_EBR_100_Gomez_Wait4SC (C_INFO)
{
	npc				= EBR_100_Gomez;
	condition		= DIA_EBR_100_Gomez_Wait4SC_Condition;
	information		= DIA_EBR_100_Gomez_Wait4SC_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_EBR_100_Gomez_Wait4SC_Condition()
{	
	if	ExploreSunkenTower
	{
		return TRUE;
	};
};
FUNC void  DIA_EBR_100_Gomez_Wait4SC_Info()
{
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_01"); //Как ты сюда попал?
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_02"); //Подожди-ка! Уж не ты ли сражался с моими людьми в Свободной Шахте?
	AI_Output (other, self,"DIA_EBR_100_Gomez_Wait4SC_15_03"); //Твоим людям не стоило вторгаться туда. Я просто излечил их от мании величия.
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_04"); //Разговаривать таким тоном со мной, ГОМЕЗОМ, - это смелый поступок. Но с твоей стороны все равно было большой глупостью появляться здесь.
	AI_Output (self, other,"DIA_EBR_100_Gomez_Wait4SC_11_05"); //Я лично позабочусь о том, чтобы больше наши пути не пересекались.
	
	AI_StopProcessInfos	( self );

	self.guild 	= GIL_EBR;
	Npc_SetTrueGuild	( self, GIL_EBR );	
};
