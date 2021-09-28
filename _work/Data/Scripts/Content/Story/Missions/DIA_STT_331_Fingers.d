// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_STT_331_Fingers_Exit (C_INFO)
{
	npc			= STT_331_Fingers;
	nr			= 999;
	condition	= DIA_STT_331_Fingers_Exit_Condition;
	information	= DIA_STT_331_Fingers_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_STT_331_Fingers_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_STT_331_Fingers_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				 Schatten werden
// **************************************************
	var int Fingers_CanTeach;
// **************************************************

INSTANCE DIA_Fingers_BecomeShadow (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_BecomeShadow_Condition;
	information		= DIA_Fingers_BecomeShadow_Info;
	permanent		= 1;
	description		= "Chcê zostaæ Cieniem."; 
};

FUNC INT DIA_Fingers_BecomeShadow_Condition()
{	
	if ( (Fingers_CanTeach == FALSE) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_BecomeShadow_Info()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_15_00"); //Chcê zostaæ Cieniem!
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_05_01"); //I co z tego?
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
	Info_AddChoice		(DIA_Fingers_BecomeShadow,DIALOG_BACK										,DIA_Fingers_BecomeShadow_BACK);
	if (Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice		(DIA_Fingers_BecomeShadow,"Szukam kogoœ, kto móg³by mnie czegoœ nauczyæ.",DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice		(DIA_Fingers_BecomeShadow,"Mo¿esz mi pomóc?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //Mo¿esz mi pomóc?
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //Nie mam pojêcia jak to zrobiæ...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //Szukam kogoœ, kto móg³by mnie czegoœ nauczyæ.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //To dlaczego przyszed³eœ do mnie?
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Przys³a³ mnie Diego.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //Trzeba by³o mówiæ tak od razu.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //Jeœli chcesz do³¹czyæ do naszego obozu, powinieneœ byæ dobrym wojownikiem albo zrêcznym z³odziejem.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //Wp³ywowi ludzie z Obozu bêd¹ mieli dla ciebie ró¿ne zlecenia, podczas wykonywania których lepiej nie daæ siê z³apaæ.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //Dlatego na pocz¹tek proponowa³bym ci szkolenie siê w fachu z³odziejskim.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //Zupe³nym przypadkiem, tak siê sk³ada, ¿e jestem najlepszym z³odziejem w ca³ym Starym Obozie.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry			(GE_TeacherOC,"R¹czka mo¿e mnie nauczyæ otwierania zamków i kradzie¿y kieszonkowej.");
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

// **************************************************
// 						 Lehrer
// **************************************************
	var int Fingers_Wherecavalorn;

INSTANCE DIA_Fingers_Lehrer (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Lehrer_Condition;
	information		= DIA_Fingers_Lehrer_Info;
	permanent		= 1;
	description		= "Czego mo¿esz mnie nauczyæ?"; 
};

FUNC INT DIA_Fingers_Lehrer_Condition()
{	
	if (Fingers_CanTeach == TRUE)
	{
		return 1;	
	};
};

FUNC VOID DIA_Fingers_Lehrer_Info()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_15_00"); //Czego mo¿esz mnie nauczyæ?
	AI_Output (self, other,"DIA_Fingers_Lehrer_05_02"); //To zale¿y tylko od tego, co chcia³byœ wiedzieæ.



	Info_ClearChoices	(DIA_Fingers_Lehrer);
	Info_AddChoice		(DIA_Fingers_Lehrer,DIALOG_BACK																	,DIA_Fingers_Lehrer_BACK);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2	,	LPCOST_TALENT_PICKPOCKET_2,0)	,DIA_Fingers_Lehrer_Pickpocket2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1	,	LPCOST_TALENT_PICKPOCKET_1,0)	,DIA_Fingers_Lehrer_Pickpocket);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2		,	LPCOST_TALENT_PICKLOCK_2,0)	,DIA_Fingers_Lehrer_Lockpick2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1		,	LPCOST_TALENT_PICKLOCK_1,0)	,DIA_Fingers_Lehrer_Lockpick);
	Info_AddChoice		(DIA_Fingers_Lehrer,"Chcia³bym umieæ poruszaæ siê niepostrze¿enie.",DIA_Fingers_Lehrer_Schleichen);
};


func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //Chcia³bym umieæ poruszaæ siê niepostrze¿enie.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //Myœlê - bez ¿adnej fa³szywej skromnoœci - ¿e jestem jednym z najlepszych z³odziei zrzuconych do tej przeklêtej kolonii.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //Ale jeœli chodzi o skradanie siê, powinieneœ porozmawiaæ z Cavalornem.
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //Chcia³bym nauczyæ siê otwieraæ zamki.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //Nie w¹tpiê! Có¿... Pocz¹tki nie s¹ zbyt trudne.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa¿aæ, ¿eby nie z³amaæ wytrycha.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //Musisz byæ bardzo cierpliwy. Wtedy nie bêdziesz potrzebowa³ tylu wytrychów, he he!
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //Chcia³bym zostaæ ekspertem w otwieraniu zamków.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju¿ trochê doœwiadczenia, nauczysz siê rozpoznawaæ dŸwiêk, jaki wydaje wytrych zanim pêknie.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //Myœlê, ¿e powinieneœ sobie z tym poradziæ. Ws³uchaj siê uwa¿nie w dŸwiêki jakie wydaje otwierany zamek, a nie bêdziesz potrzebowa³ tylu wytrychów, he, he!
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzyæ ka¿d¹ skrzyniê nie ³ami¹c ani jednego wytrycha.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //Chcia³bym zostaæ zrêcznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //Chcia³byœ odci¹¿yæ parê osób z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //Poka¿ê ci na czym powinieneœ siê skoncentrowaæ, ale szanse, ¿e zostaniesz z³apany bêd¹ nadal znaczne.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy³¹cznie jeœli w pobli¿u ofiary nie ma osób trzecich.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukraœæ coœ pozostaj¹c ca³kowicie niezauwa¿onym!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //Nie ma o czym mówiæ! Nie bêdzie z ciebie z³odzieja, dopóki nie nauczysz siê skradaæ!
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //Chcia³bym zostaæ mistrzem kieszonkowców!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //Có¿, chyba rzeczywiœcie potrafisz ju¿ wystarczaj¹co du¿o, ¿eby opanowaæ zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //Ale musisz pamiêtaæ, ¿e nawet mistrzowie z³odziejscy od czasu do czasu zostaj¹ z³apani.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Uwa¿aj na siebie.
	};
};

func VOID DIA_Fingers_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Fingers_Lehrer );
};

// **************************************************
// 					Wo Cavalorn
// **************************************************

INSTANCE DIA_Fingers_WhereCavalorn (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_WhereCavalorn_Condition;
	information		= DIA_Fingers_WhereCavalorn_Info;
	permanent		= 1;
	description		= "Gdzie znajdê Cavalorna?"; 
};

FUNC INT DIA_Fingers_WhereCavalorn_Condition()
{	
	if (Fingers_Wherecavalorn == TRUE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_WhereCavalorn_Info()
{
	AI_Output (other, self,"DIA_Fingers_WhereCavalorn_15_00"); //Gdzie znajdê Cavalorna?
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_01"); //Poluje gdzieœ poza Obozem. Pewnie znajdziesz go na drodze do Nowego Obozu. Na zachód st¹d jest taki kanion.
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_02"); //Tam znajdziesz opuszczon¹ chatê drwala. Cavalorn powinien krêciæ siê w jej pobli¿u.
	
	B_LogEntry( GE_TeacherOW,"Cavalorn mo¿e mi pokazaæ, jak nale¿y siê skradaæ. Jego chata znajduje siê w kanionie, na zachód od Starego Obozu.");
};

// **************************************************
// 					Gutes Wort
// **************************************************
	var int Fingers_Learnt;
// **************************************************

INSTANCE DIA_Fingers_Learnt (C_INFO)
{
	npc				= STT_331_Fingers;
	nr				= 2;
	condition		= DIA_Fingers_Learnt_Condition;
	information		= DIA_Fingers_Learnt_Info;
	permanent		= 1;
	description		= "Nie móg³byœ wstawiæ siê za mn¹ u Diego?"; 
};

FUNC INT DIA_Fingers_Learnt_Condition()
{	
	if ( (Fingers_Learnt != LOG_SUCCESS) )
	&& (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID DIA_Fingers_Learnt_Info()
{
	AI_Output (other, self,"DIA_Fingers_Learnt_15_00"); //Nie móg³byœ wstawiæ siê za mn¹ u Diego?

	if ( Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK)+Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET)+Npc_GetTalentSkill(other, NPC_TALENT_SNEAK)	> 0)
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_01"); //Czemu nie. Nauczy³eœ siê czegoœ, co czyni ciê przydatnym dla Starego Obozu.
		AI_Output (self, other,"DIA_Fingers_Learnt_05_02"); //Zrêcznych z³odziei nigdy nie za wiele. Mo¿esz na mnie liczyæ.
		Fingers_Learnt = LOG_SUCCESS;
		
		B_GiveXP (XP_Fingerstrain);
		B_LogEntry( CH1_JoinOC,"R¹czka jest bardzo zadowolony z postêpów, które poczyni³em.");
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_03"); //To zale¿y...
		AI_Output (self, other,"DIA_Fingers_Learnt_05_04"); //Jeœli udowodnisz, ¿e nauczy³eœ siê czegoœ w z³odziejskim fachu, uznam, ¿e bêdzie z ciebie jakiœ po¿ytek.
		AI_Output (other, self,"DIA_Fingers_Learnt_15_05"); //Jak mam to niby zrobiæ?
		AI_Output (self, other,"DIA_Fingers_Learnt_05_06"); //Wyucz siê którejœ ze z³odziejskich umiejêtnoœci. Naucz siê skradaæ niepostrze¿enie, okradaæ ludzi albo otwieraæ zamki. Wtedy bêdziesz móg³ liczyæ na mój g³os.
		Fingers_Learnt = LOG_RUNNING;
		
		B_LogEntry( CH1_JoinOC,"R¹czka wstawi siê za mn¹, jeœli wyuczê siê jakiejœ z³odziejskiej umiejêtnoœci.");
	};
};




























