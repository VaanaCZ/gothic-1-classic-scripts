//****************************************************
//	Typ der den SC an der Nase herum fьhrt!
//****************************************************

//Variablen:
//--------------------------------------
var int SLD_753_Baloro_SC_choice;
var int SLD_753_Baloro_SC_wills_wissen;
var int SLD_753_Baloro_SC_besorgt_den_Kram;
//--------------------------------------





instance DIA_SLD_753_Baloro (C_INFO)
{
	npc				= SLD_753_Baloro;
	condition		= DIA_SLD_753_Baloro_Condition;
	information		= DIA_SLD_753_Baloro_Intro_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int DIA_SLD_753_Baloro_Condition()
{
	return 1;
};

func void DIA_SLD_753_Baloro_Intro_Info()
{
	AI_Output (self, other,"DIA_SLD_753_Baloro_Intro_08_01"); //Эй, ты! В чем дело?
};

// ********************** Was meinst du? *****************

instance DIA_SLD_753_Baloro_Wasmeinstdu (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Wasmeinstdu_Condition;
	information	= DIA_SLD_753_Baloro_Wasmeinstdu_Info;
	important	= 0;	
	permanent	= 0;
	description = "Привет!  ";
};                       

FUNC int DIA_SLD_753_Baloro_Wasmeinstdu_Condition()
{
	return 1;
};

FUNC VOID DIA_SLD_753_Baloro_Wasmeinstdu_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_01"); //Привет!  
	AI_Output (self, other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_02"); //Ты ходишь здесь, словно тебе нужно что-то найти!
	AI_Output (other, self,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_15_03"); //Ты так думаешь? Быть может, ты и прав.
	AI_Output (self, other,"DIA_SLD_753_Baloro_Wasmeinstdu_Info_08_04"); //Отлично! Спроси меня! Может, я и помогу тебе!


};

// ********************** Woran hast du dabei gedacht *****************

instance DIA_SLD_753_Baloro_Worumgehts (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Worumgehts_Condition;
	information	= DIA_SLD_753_Baloro_Worumgehts_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "А чем ты сможешь мне помочь?";
};                       

FUNC int DIA_SLD_753_Baloro_Worumgehts_Condition()
{
	if ((Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Wasmeinstdu))	&& (SLD_753_Baloro_SC_choice == 0) )
	{
	return 1;
	};
	
};

FUNC VOID DIA_SLD_753_Baloro_Worumgehts_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_01"); //А чем ты сможешь мне помочь?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_01"); //Так что тебе нужно?
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_Info_15_02"); //Ну, мне пригодился бы хороший меч, доспех какой-нибудь более прочный или разрешение попасть в шахту...
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_02"); //А, что ты?! Это же ерунда!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_03"); //Могу предложить кое-что получше. Думаю, у меня есть чем тебя удивить. Я могу достать такое оружие, которым можно победить любого врага!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_Info_08_04"); //За это ты окажешь мне маленькую услугу. И оружие будет у тебя в руках! Договорились?

	Info_ClearChoices	(DIA_SLD_753_Baloro_Worumgehts); // alte choices loeschen
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"А что для этого нужно сделать?"	,DIA_SLD_753_Baloro_Worumgehts_ja);
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Мне это не нужно!"	,DIA_SLD_753_Baloro_Exit_Info);
	
};

FUNC VOID DIA_SLD_753_Baloro_Worumgehts_ja()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_05"); //А что для этого нужно сделать?
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_03"); //Это очень простая работа!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_04"); //Принеси мне пять яблок, две бутылки рисового шнапса, пять бутылок пива, три буханки хлеба, два куска сыра и две грозди винограда.
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_05"); //Поверь мне, ты об этом не пожалеешь. Как я сказал, этим оружием можно победить любого врага!
	
	Info_ClearChoices	(DIA_SLD_753_Baloro_Worumgehts); // alte choices loeschen
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Ладно! Я постараюсь все это найти!"						,DIA_SLD_753_Baloro_Worumgehts_jaklar);
	Info_AddChoice		(DIA_SLD_753_Baloro_Worumgehts,"Этот тип пытается меня провести!"	,DIA_SLD_753_Baloro_Exit_Info);
};
	
FUNC VOID DIA_SLD_753_Baloro_Worumgehts_jaklar()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_06"); //Ладно! Я постараюсь все это найти!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_06"); //Отлично! Только быстрее!
	AI_Output (self, other,"DIA_SLD_753_Baloro_Worumgehts_ja_08_07"); //И не забудь, мне нужно пять яблок, две бутылки рисового шнапса, пять бутылок пива, три буханки хлеба, два куска сыра и две грозди винограда.
	AI_Output (other, self,"DIA_SLD_753_Baloro_Worumgehts_ja_15_07"); //Конечно!
	
	
//********	Auftragannahme	**************************
	


	SLD_753_Baloro_SC_besorgt_den_Kram = LOG_RUNNING ;
	
		
	Log_CreateTopic		(Baloros_Waffe,		LOG_MISSION);
	Log_SetTopicStatus	(Baloros_Waffe,		LOG_RUNNING);
	B_LogEntry			(Baloros_Waffe,		"Балоро обещал, что если я принесу ему 5 яблок, 2 бутылки рисового шнапса, 5 бутылок пива, 3 буханки хлеба, 2 куска сыра и 2 грозди винограда, он даст мне какое-то мощное оружие."); 

	AI_StopProcessInfos	( self );
};
	



// ********************** Ich habґs noch nicht dabei *****************	


instance DIA_SLD_753_Baloro_habsnichtdabei (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_habsnichtdabei_Condition;
	information	= DIA_SLD_753_Baloro_habsnichtdabei_Info;
	important	= 0;	
	permanent	= 1;
	description = "Я еще не все достал! Повтори, что ты хотел. Этих вещей так много!";
};                       

FUNC int DIA_SLD_753_Baloro_habsnichtdabei_Condition()
{
	if 	(SLD_753_Baloro_SC_besorgt_den_Kram == LOG_RUNNING)   
	{
		return 1;
	};

};

FUNC VOID DIA_SLD_753_Baloro_habsnichtdabei_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_01"); //Я еще не все достал! Повтори, что ты там хотел. Этих вещей так много!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_01"); //Ладно! Можешь даже записать. Так вот, мне нужно...
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsnichtdabei_Info_08_02"); //5 яблок, 2 бутылки рисового шнапса, 5 бутылок пива, 3 буханки хлеба, 2 куска сыра и 2 грозди винограда.
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsnichtdabei_Info_15_02"); //Ну, да! Конечно! Пойду, поищу.

	AI_StopProcessInfos	( self );	
};


// ********************** Ich habґs  dabei *****************	

instance DIA_SLD_753_Baloro_habsdabei (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_habsdabei_Condition;
	information	= DIA_SLD_753_Baloro_habsdabei_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Я принес тебе все, что ты просил. Показывай оружие!";
};                       

FUNC int DIA_SLD_753_Baloro_habsdabei_Condition()
{
	if (	(SLD_753_Baloro_SC_besorgt_den_Kram == LOG_RUNNING)      
		&&   (Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Worumgehts))	
		&& (SLD_753_Baloro_SC_choice == 0) 
		&& (Npc_HasItems(other,ItFoApple)>=5)  
		&& (Npc_HasItems(other,ItFoBooze)>=2) 
		&& (Npc_HasItems(other,ItFoBeer)>=5) 
		&& (Npc_HasItems(other,ItFoLoaf)>=3) 
		&& (Npc_HasItems(other,ItFoCheese)>=2) 
		&& (Npc_HasItems(other,ItFo_wineberrys_01)>=2) )
	{
		return 1;
	};

};

FUNC VOID DIA_SLD_753_Baloro_habsdabei_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_01"); //Вот, я принес тебе все, что ты просил. Показывай, что там у тебя за оружие!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_01"); //А ты сначала покажи мне все, что принес!
	
	CreateInvItems(other, ItFoApple, 14);
	
	B_GiveInvItems(other, self, ItFoApple, 19); //Nцtig fьr die Ausschrift "19 Itmes abgegeben", wird sofort angeglichen.
	
	Npc_RemoveInvItems ( other,ItFoBooze,2);
	Npc_RemoveInvItems ( other,ItFoBeer,5);
	Npc_RemoveInvItems ( other,ItFoLoaf,3);
	Npc_RemoveInvItems ( other,ItFoCheese,2);
	Npc_RemoveInvItems ( other,ItFo_wineberrys_01,2);
	
	Npc_RemoveInvItems ( self,ItFoApple,14);
	CreateInvItems	(self,ItFoBooze,2);
	CreateInvItems	(self,ItFoBeer,5);
	CreateInvItems	(self,ItFoLoaf,3);
	CreateInvItems	(self,ItFoCheese,2);
	CreateInvItems	(self,ItFo_wineberrys_01,2);

	
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_02"); //Я принес все, что ты просил.
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_02"); //Да, отлично!
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_03"); //Теперь твоя очередь. Давай то, что обещал!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_03"); //Да забудь об этом!
	AI_Output (other, self,"DIA_SLD_753_Baloro_habsdabei_Info_15_04"); //Что?
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_04"); //Ты действительно думал, что я тебе что-то дам? Ты так легко поверил во всю эту чушь. Грех было тебя не обмануть! 
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_05"); //Удивительно еще, что ты до сих пор жив! Если ты и дальше будешь всем доверять, ты долго не протянешь!
	AI_Output (self, other,"DIA_SLD_753_Baloro_habsdabei_Info_08_06"); //Но, это уже не важно. Теперь у нас есть так много еды, можно целый праздник устроить! Спасибо! Может быть, мы еще встретимся.
	
	SLD_753_Baloro_SC_besorgt_den_Kram = LOG_SUCCESS ;
	B_GiveXP (300);
	B_LogEntry			(Baloros_Waffe,		"Так и думал, что он захотел меня провести. Теперь это неважно! Постараюсь больше так не попадаться."); 

	Log_SetTopicStatus	(Baloros_Waffe,		LOG_SUCCESS);
	
	AI_StopProcessInfos	( self );	
};


// **********************	EXIT\ Spieler will Rechenschaft	*****************	

instance DIA_SLD_753_Baloro_letztes_Wort (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_letztes_Wort_Condition;
	information	= DIA_SLD_753_Baloro_letztes_Wort_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Эй! Зачем ты это сделал! Так же нельзя!";
	
};                       

FUNC int DIA_SLD_753_Baloro_letztes_Wort_Condition()
	{
		if (SLD_753_Baloro_SC_besorgt_den_Kram == LOG_SUCCESS)
		{
		return 1;
		};	
	};


FUNC VOID DIA_SLD_753_Baloro_letztes_Wort_Info()

	 	{
			AI_Output (other, self,"DIA_SLD_753_Baloro_letztes_Wort_Info_15_01"); //Эй! Зачем ты это сделал! Так же нельзя!
			AI_Output (self, other,"DIA_SLD_753_Baloro_letztes_Wort_Info_08_01"); //Тебе нужно что-то еще? Убирайся! Будешь действовать мне на нервы, я тебя проучу! Понял?
		
			SLD_753_Baloro_SC_wills_wissen = 1	;
			
			AI_StopProcessInfos	(self);	
		
		};



// **********************	EXIT\ Spieler willґs wissen	*****************	

instance DIA_SLD_753_Baloro_SC_wills_wissen (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_SC_wills_wissen_Condition;
	information	= DIA_SLD_753_Baloro_SC_wills_wissen_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Кажется, настало время проучить тебя!";
	
};                       

FUNC int DIA_SLD_753_Baloro_SC_wills_wissen_Condition()
	{
		if (SLD_753_Baloro_SC_wills_wissen == 1)
		{
	
		return 1;
		};	
	};


FUNC VOID DIA_SLD_753_Baloro_Attack()
{
//	B_FullStop			(self);	
	AI_StopProcessInfos	(self);					
	Npc_SetTarget		(self,	hero);
	AI_StartState		(self,	ZS_Attack,	1,	"");
};

FUNC VOID DIA_SLD_753_Baloro_SC_wills_wissen_Info()
{
	AI_Output (other, self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_01"); //Кажется, настало время проучить тебя!
	AI_Output (self, other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_01"); //Мы отлично повеселились. А теперь тебе пора убраться отсюда!
	AI_Output (other, self,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_15_02"); //Я думаю, ты меня не так понял!
	AI_Output (self, other,"DIA_SLD_753_Baloro_SC_wills_wissen_Info_08_02"); //Ну, как хочешь! Раз ты по-другому не понимаешь! Я тебя предупредил!
	
	DIA_SLD_753_Baloro_Attack () ;
	
};




// **********************	EXIT	*****************	


instance DIA_SLD_753_Baloro_Exit (C_INFO)
{
	npc			= SLD_753_Baloro;
	nr			=999;
	condition	= DIA_SLD_753_Baloro_Exit_Condition;
	information	= DIA_SLD_753_Baloro_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description 	= "Извини! У меня сейчас нет времени на разговоры.";
	
};                       

FUNC int DIA_SLD_753_Baloro_Exit_Condition()
	{
		if    ((SLD_753_Baloro_SC_wills_wissen == 0)	&&  (SLD_753_Baloro_SC_besorgt_den_Kram == 0)    )
		{
		return 1;
		};
	};


FUNC VOID DIA_SLD_753_Baloro_Exit_Info()
{		
		
				if ( (Npc_KnowsInfo(hero,DIA_SLD_753_Baloro_Wasmeinstdu))  &&   (SLD_753_Baloro_SC_choice == 0)	)  
					{
						AI_Output (other, self,"DIA_SLD_753_Baloro_Exit_Info_15_01"); //Мне это не нужно!
						AI_Output (self, other,"DIA_SLD_753_Baloro_Exit_Info_08_02"); //Как скажешь! Я дал тебе шанс!
						
						SLD_753_Baloro_SC_choice = 1 ;
					}
				else
					{
						AI_Output (other, self,"DIA_SLD_753_Baloro_Exit_Info_15_03"); //Извини! У меня сейчас нет времени на разговоры.
						AI_Output (self, other,"DIA_SLD_753_Baloro_Exit_Info_08_04"); //О, так у тебя много дел, да? Ну, еще увидимся!
					};
			
	
	AI_StopProcessInfos	( self );
};


// **********************	EXIT\ wie war das mit deinem Angebot	*****************	

instance DIA_SLD_753_Baloro_Angebotdochannehmen (C_INFO)
{
	npc			= SLD_753_Baloro;
	condition	= DIA_SLD_753_Baloro_Angebotdochannehmen_Condition;
	information	= DIA_SLD_753_Baloro_Angebotdochannehmen_Info;
	important	= 0;	
	permanent	= 0;
	description 	= "Я все обдумал. Я принимаю твое предложение.";
	
};                       

FUNC int DIA_SLD_753_Baloro_Angebotdochannehmen_Condition()
	{
		if (SLD_753_Baloro_SC_choice == 1)
		{
		return 1;
		};	
	};


FUNC VOID DIA_SLD_753_Baloro_Angebotdochannehmen_Info()

	 	{
			AI_Output (other, self,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_15_01"); //Я все обдумал. Я принимаю твое предложение.
			AI_Output (self, other,"DIA_SLD_753_Baloro_Angebotdochannehmen_Info_08_01"); //Нет, теперь уже поздно! Ты упустил свой шанс!
		
			
			AI_StopProcessInfos	(self);	
		
		};

