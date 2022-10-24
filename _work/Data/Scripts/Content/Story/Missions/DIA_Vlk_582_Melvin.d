// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Melvin_Exit (C_INFO)
{
	npc			= Vlk_582_Melvin;
	nr			= 999;
	condition	= DIA_Melvin_Exit_Condition;
	information	= DIA_Melvin_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Melvin_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Melvin_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Was machst du?
// **************************************************

INSTANCE DIA_Melvin_Hello (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_Hello_Condition;
	information		= DIA_Melvin_Hello_Info;
	permanent		= 0;
	description		= "Привет! Ты не похож на послушника. Ты из этого лагеря?";
};

FUNC INT DIA_Melvin_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Melvin_Hello_Info()
{
	AI_Output (other, self,"DIA_Melvin_Hello_15_00"); //Привет! Ты не похож на послушника. Ты из этого лагеря?
	AI_Output (self, other,"DIA_Melvin_Hello_03_01"); //Да! Неделя прошла с тех пор, как я покинул Старый лагерь. Я предлагал моему другу Дасти пойти со мной, он засомневался и сказал, что подождет еще немного.

	Log_CreateTopic		(CH1_RecruitDusty,	LOG_MISSION);
	Log_SetTopicStatus	(CH1_RecruitDusty,	LOG_RUNNING);
	B_LogEntry			(CH1_RecruitDusty,	"Рудокоп Мелвин присоединился к Братству. Его друг Дасти остался в Старом лагере. Но он постоянно думает о том, чтобы тоже уйти в Болотный лагерь.");
};

// **************************************************
// 				Dusty getroffen
// **************************************************

INSTANCE DIA_Melvin_MetDusty (C_INFO)
{
	npc				= Vlk_582_Melvin;
	nr				= 1;
	condition		= DIA_Melvin_MetDusty_Condition;
	information		= DIA_Melvin_MetDusty_Info;
	permanent		= 0;
	description		= "Я знаю Дасти. Разговаривал с ним совсем недавно.";
};

FUNC INT DIA_Melvin_MetDusty_Condition()
{	
	if ( (Npc_KnowsInfo(hero,DIA_Melvin_Hello)) && (Npc_KnowsInfo(hero,DIA_Dusty_Hello)) )
	{
		return 1;
	};
};

FUNC VOID DIA_Melvin_MetDusty_Info()
{
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_00"); //Я знаю Дасти. Разговаривал с ним совсем недавно.
	AI_Output (self, other,"DIA_Melvin_MetDusty_03_01"); //Если ты увидишь его, передай, что он зря остался там. Здесь же гораздо лучше, чем в Старом лагере, где стражники издеваются над бедными рудокопами. Надеюсь, ему тоже здесь понравится.
	AI_Output (other, self,"DIA_Melvin_MetDusty_15_02"); //Ну, если увижу, передам, конечно.
};


