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
	description		= "Chc� zosta� Cieniem."; 
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
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_15_00"); //Chc� zosta� Cieniem!
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_05_01"); //I co z tego?
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
	Info_AddChoice		(DIA_Fingers_BecomeShadow,DIALOG_BACK										,DIA_Fingers_BecomeShadow_BACK);
	if (Npc_KnowsInfo(hero,Info_Diego_Teachers))
	{
		Info_AddChoice		(DIA_Fingers_BecomeShadow,"Szukam kogo�, kto m�g�by mnie czego� nauczy�.",DIA_Fingers_BecomeShadow_TeachMe);
	};
	Info_AddChoice		(DIA_Fingers_BecomeShadow,"Mo�esz mi pom�c?",DIA_Fingers_BecomeShadow_AnyTips);
};

func void DIA_Fingers_BecomeShadow_BACK()
{
	Info_ClearChoices	(DIA_Fingers_BecomeShadow );
};

func void DIA_Fingers_BecomeShadow_AnyTips()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_AnyTips_15_00"); //Mo�esz mi pom�c?
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_AnyTips_05_01"); //Nie mam poj�cia jak to zrobi�...
};

func void DIA_Fingers_BecomeShadow_TeachMe()
{
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_00"); //Szukam kogo�, kto m�g�by mnie czego� nauczy�.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_01"); //To dlaczego przyszed�e� do mnie?
	AI_Output (other, self,"DIA_Fingers_BecomeShadow_TeachMe_15_02"); //Przys�a� mnie Diego.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_03"); //Trzeba by�o m�wi� tak od razu.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_04"); //Je�li chcesz do��czy� do naszego obozu, powiniene� by� dobrym wojownikiem albo zr�cznym z�odziejem.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_05"); //Wp�ywowi ludzie z Obozu b�d� mieli dla ciebie r�ne zlecenia, podczas wykonywania kt�rych lepiej nie da� si� z�apa�.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_06"); //Dlatego na pocz�tek proponowa�bym ci szkolenie si� w fachu z�odziejskim.
	AI_Output (self, other,"DIA_Fingers_BecomeShadow_TeachMe_05_07"); //Zupe�nym przypadkiem, tak si� sk�ada, �e jestem najlepszym z�odziejem w ca�ym Starym Obozie.
	Fingers_CanTeach = TRUE;
	Log_CreateTopic   	(GE_TeacherOC,LOG_NOTE);
	B_LogEntry			(GE_TeacherOC,"R�czka mo�e mnie nauczy� otwierania zamk�w i kradzie�y kieszonkowej.");
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
	description		= "Czego mo�esz mnie nauczy�?"; 
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
	AI_Output (other, self,"DIA_Fingers_Lehrer_15_00"); //Czego mo�esz mnie nauczy�?
	AI_Output (self, other,"DIA_Fingers_Lehrer_05_02"); //To zale�y tylko od tego, co chcia�by� wiedzie�.



	Info_ClearChoices	(DIA_Fingers_Lehrer);
	Info_AddChoice		(DIA_Fingers_Lehrer,DIALOG_BACK																	,DIA_Fingers_Lehrer_BACK);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2	,	LPCOST_TALENT_PICKPOCKET_2,0)	,DIA_Fingers_Lehrer_Pickpocket2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1	,	LPCOST_TALENT_PICKPOCKET_1,0)	,DIA_Fingers_Lehrer_Pickpocket);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2		,	LPCOST_TALENT_PICKLOCK_2,0)	,DIA_Fingers_Lehrer_Lockpick2);
	Info_AddChoice		(DIA_Fingers_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1		,	LPCOST_TALENT_PICKLOCK_1,0)	,DIA_Fingers_Lehrer_Lockpick);
	Info_AddChoice		(DIA_Fingers_Lehrer,"Chcia�bym umie� porusza� si� niepostrze�enie.",DIA_Fingers_Lehrer_Schleichen);
};


func void DIA_Fingers_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Schleichen_15_00"); //Chcia�bym umie� porusza� si� niepostrze�enie.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_01"); //My�l� - bez �adnej fa�szywej skromno�ci - �e jestem jednym z najlepszych z�odziei zrzuconych do tej przekl�tej kolonii.
	AI_Output (self, other,"DIA_Fingers_Lehrer_Schleichen_05_02"); //Ale je�li chodzi o skradanie si�, powiniene� porozmawia� z Cavalornem.
	Fingers_Wherecavalorn = TRUE;
};

func void DIA_Fingers_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick_15_00"); //Chcia�bym nauczy� si� otwiera� zamki.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_01"); //Nie w�tpi�! C�... Pocz�tki nie s� zbyt trudne.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa�a�, �eby nie z�ama� wytrycha.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick_05_03"); //Musisz by� bardzo cierpliwy. Wtedy nie b�dziesz potrzebowa� tylu wytrych�w, he he!
	};
};

func void DIA_Fingers_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Lockpick2_15_00"); //Chcia�bym zosta� ekspertem w otwieraniu zamk�w.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju� troch� do�wiadczenia, nauczysz si� rozpoznawa� d�wi�k, jaki wydaje wytrych zanim p�knie.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_02"); //My�l�, �e powiniene� sobie z tym poradzi�. Ws�uchaj si� uwa�nie w d�wi�ki jakie wydaje otwierany zamek, a nie b�dziesz potrzebowa� tylu wytrych�w, he, he!
		AI_Output (self, other,"DIA_Fingers_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzy� ka�d� skrzyni� nie �ami�c ani jednego wytrycha.
	};
};

func void DIA_Fingers_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_PICKPOCKET_15_00"); //Chcia�bym zosta� zr�cznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_01"); //Chcia�by� odci��y� par� os�b z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_02"); //Poka�� ci na czym powiniene� si� skoncentrowa�, ale szanse, �e zostaniesz z�apany b�d� nadal znaczne.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy��cznie je�li w pobli�u ofiary nie ma os�b trzecich.
			AI_Output (self, other,"DIA_Fingers_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukra�� co� pozostaj�c ca�kowicie niezauwa�onym!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_lehrer_Pickpocket_05_05"); //Nie ma o czym m�wi�! Nie b�dzie z ciebie z�odzieja, dop�ki nie nauczysz si� skrada�!
	};
};

func void DIA_Fingers_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Fingers_Lehrer_Pickpocket2_15_00"); //Chcia�bym zosta� mistrzem kieszonkowc�w!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_01"); //C�, chyba rzeczywi�cie potrafisz ju� wystarczaj�co du�o, �eby opanowa� zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_02"); //Ale musisz pami�ta�, �e nawet mistrzowie z�odziejscy od czasu do czasu zostaj� z�apani.
		AI_Output (self, other,"DIA_Fingers_Lehrer_Pickpocket2_05_03"); //Uwa�aj na siebie.
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
	description		= "Gdzie znajd� Cavalorna?"; 
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
	AI_Output (other, self,"DIA_Fingers_WhereCavalorn_15_00"); //Gdzie znajd� Cavalorna?
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_01"); //Poluje gdzie� poza Obozem. Pewnie znajdziesz go na drodze do Nowego Obozu. Na zach�d st�d jest taki kanion.
	AI_Output (self, other,"DIA_Fingers_WhereCavalorn_05_02"); //Tam znajdziesz opuszczon� chat� drwala. Cavalorn powinien kr�ci� si� w jej pobli�u.
	
	B_LogEntry( GE_TeacherOW,"Cavalorn mo�e mi pokaza�, jak nale�y si� skrada�. Jego chata znajduje si� w kanionie, na zach�d od Starego Obozu.");
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
	description		= "Nie m�g�by� wstawi� si� za mn� u Diego?"; 
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
	AI_Output (other, self,"DIA_Fingers_Learnt_15_00"); //Nie m�g�by� wstawi� si� za mn� u Diego?

	if ( Npc_GetTalentSkill(other, NPC_TALENT_PICKLOCK)+Npc_GetTalentSkill(other, NPC_TALENT_PICKPOCKET)+Npc_GetTalentSkill(other, NPC_TALENT_SNEAK)	> 0)
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_01"); //Czemu nie. Nauczy�e� si� czego�, co czyni ci� przydatnym dla Starego Obozu.
		AI_Output (self, other,"DIA_Fingers_Learnt_05_02"); //Zr�cznych z�odziei nigdy nie za wiele. Mo�esz na mnie liczy�.
		Fingers_Learnt = LOG_SUCCESS;
		
		B_GiveXP (XP_Fingerstrain);
		B_LogEntry( CH1_JoinOC,"R�czka jest bardzo zadowolony z post�p�w, kt�re poczyni�em.");
	}
	else
	{
		AI_Output (self, other,"DIA_Fingers_Learnt_05_03"); //To zale�y...
		AI_Output (self, other,"DIA_Fingers_Learnt_05_04"); //Je�li udowodnisz, �e nauczy�e� si� czego� w z�odziejskim fachu, uznam, �e b�dzie z ciebie jaki� po�ytek.
		AI_Output (other, self,"DIA_Fingers_Learnt_15_05"); //Jak mam to niby zrobi�?
		AI_Output (self, other,"DIA_Fingers_Learnt_05_06"); //Wyucz si� kt�rej� ze z�odziejskich umiej�tno�ci. Naucz si� skrada� niepostrze�enie, okrada� ludzi albo otwiera� zamki. Wtedy b�dziesz m�g� liczy� na m�j g�os.
		Fingers_Learnt = LOG_RUNNING;
		
		B_LogEntry( CH1_JoinOC,"R�czka wstawi si� za mn�, je�li wyucz� si� jakiej� z�odziejskiej umiej�tno�ci.");
	};
};




























