// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Wedge_Exit (C_INFO)
{
	npc			= ORG_850_Wedge;
	nr			= 999;
	condition	= DIA_Wedge_Exit_Condition;
	information	= DIA_Wedge_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Wedge_Exit_Condition()
{
	return TRUE;
};

FUNC VOID DIA_Wedge_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// ****************************************
// 					Psst
// ****************************************

instance DIA_Wedge_Psst (C_INFO)
{
	npc				= Org_850_Wedge;
	nr				= 1;
	condition		= DIA_Wedge_Psst_Condition;
	information		= DIA_Wedge_Psst_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  DIA_Wedge_Psst_Condition()
{	
	if ( (Npc_GetDistToNpc (hero,self) < 900) && (Wld_IsTime(08,00,23,30)) )
	{
		return TRUE;
	};
};
func void  DIA_Wedge_Psst_Info()
{
	AI_Output (self, other,"DIA_Wedge_Psst_05_00"); //Ciiii... Hej, ty!
	AI_Output (other, self,"DIA_Wedge_Psst_15_01"); //Co? Ja?
	AI_Output (self, other,"DIA_Wedge_Psst_05_02"); //Tak... Chod� no tutaj!
	AI_StopProcessInfos	(self);
};

// ****************************************
// 					Hallo
// ****************************************

instance  DIA_Wedge_Hello (C_INFO)
{
	npc				= Org_850_Wedge;
	condition		= DIA_Wedge_Hello_Condition;
	information		= DIA_Wedge_Hello_Info;
	important		= 0;
	permanent		= 0;
	description		= "Czego ode mnie chcesz?"; 
};

FUNC int  DIA_Wedge_Hello_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Psst))
	{
		return TRUE;
	};

};
FUNC void  DIA_Wedge_Hello_Info()
{
	AI_Output (other, self,"DIA_Wedge_Hello_15_00"); //Czego ode mnie chcesz?
	AI_Output (self, other,"DIA_Wedge_Hello_05_01"); //Jeste� tu nowy, co? Od razu zauwa�y�em.
	AI_Output (self, other,"DIA_Wedge_Hello_05_02"); //Musisz si� jeszcze wiele nauczy�. M�g�bym ci pokaza�, co w trawie piszczy.
	AI_Output (self, other,"DIA_Wedge_Hello_05_03"); //Przede wszystkim musisz uwa�a� z kim rozmawiasz. Widzisz tego faceta, tam - przy ognisku? To Butch. Strze� si� go!
};  

// ****************************************
// 				Was ist mit Butch
// ****************************************

instance  DIA_Wedge_WarnsOfButch (C_INFO)
{
	npc				= Org_850_Wedge;
	condition		= DIA_Wedge_WarnsOfButch_Condition;
	information		= DIA_Wedge_WarnsOfButch_Info;
	important		= 0;
	permanent		= 0;
	description		= "A co z tym Butchem?"; 
};

FUNC int  DIA_Wedge_WarnsOfButch_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Hello))
	{
		return TRUE;
	};

};
FUNC void  DIA_Wedge_WarnsOfButch_Info()
{
	AI_Output (other, self,"DIA_Wedge_WarnsOfButch_15_00"); //A co z nim jest nie tak?
	AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_01"); //Ma paskudny nawyk napadania nowoprzyby�ych. Na twoim miejscu unika�bym go jak ognia.
	//AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_02"); //Also, geh ihm am besten aus dem Weg.//***Doppelt***
};  

// ****************************************
// 					Lehrer
// ****************************************

INSTANCE DIA_Wedge_Lehrer (C_INFO)
{
	npc				= Org_850_Wedge;
	nr				= 700;
	condition		= DIA_Wedge_Lehrer_Condition;
	information		= DIA_Wedge_Lehrer_Info;
	permanent		= 1;
	description		= "Czego mo�esz mnie nauczy�?"; 
};

FUNC INT DIA_Wedge_Lehrer_Condition()
{	
	if (Npc_KnowsInfo (hero,DIA_Wedge_Hello))
	{	
		return TRUE;	
	};
};

FUNC VOID DIA_Wedge_Lehrer_Info()
{
	if (log_wedgelearn == FALSE)
	{
		Log_CreateTopic   	(GE_TeacherNC,LOG_NOTE);
		B_LogEntry			(GE_TeacherNC,"Szkodnik o przezwisku Klin mo�e mnie nauczy� skradania si�, otwierania zamk�w i kradzie�y kieszonkowej.");
		log_wedgelearn = TRUE ;
	};
	AI_Output (other, self,"DIA_Wedge_Lehrer_15_00"); //Czego mo�esz mnie nauczy�?
	AI_Output (self, other,"DIA_Wedge_Lehrer_05_01"); //To zale�y... A co chcesz wiedzie�?
	

	Info_ClearChoices	(DIA_Wedge_Lehrer );
	Info_AddChoice		(DIA_Wedge_Lehrer,DIALOG_BACK																,DIA_Wedge_Lehrer_BACK);
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 1) 
	{
		Info_AddChoice		(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_2,LPCOST_TALENT_PICKPOCKET_2,0)		,DIA_Wedge_Lehrer_Pickpocket2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKPOCKET) == 0) 
	{
		Info_AddChoice		(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPickpocket_1,LPCOST_TALENT_PICKPOCKET_1,0)		,DIA_Wedge_Lehrer_Pickpocket);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 1) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_2,	LPCOST_TALENT_PICKLOCK_2,0)		,DIA_Wedge_Lehrer_Lockpick2);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_PICKLOCK) == 0) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnPicklock_1,	LPCOST_TALENT_PICKLOCK_1,0)		,DIA_Wedge_Lehrer_Lockpick);
	};
	if	(Npc_GetTalentSkill(hero, NPC_TALENT_SNEAK) == 0) 
	{
		Info_AddChoice	(DIA_Wedge_Lehrer,B_BuildLearnString(NAME_LearnSneak, 		LPCOST_TALENT_SNEAK,0)			,DIA_Wedge_Lehrer_Schleichen);
	};
};


func void DIA_Wedge_Lehrer_Schleichen()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Schleichen_15_00"); //Chcia�bym nauczy� si� porusza� bezszelestnie.
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_01"); //Grunt to zachowa� r�wnowag�. Opr�cz tego musisz nauczy� si� kontrolowa� sw�j oddech.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni� postaw�, a nikt nie us�yszy twoich krok�w.
	};
};

func void DIA_Wedge_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick_15_00"); //Chcia�bym nauczy� si� otwiera� zamki.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_01"); //Nie w�tpi�! C�... Pocz�tki nie s� zbyt trudne.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa�a�, �eby nie z�ama� wytrycha.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_03"); //Musisz by� bardzo cierpliwy. Wtedy nie b�dziesz potrzebowa� tylu wytrych�w, he he!
	};
};

func void DIA_Wedge_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick2_15_00"); //Chcia�bym zosta� ekspertem w otwieraniu zamk�w.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju� troch� do�wiadczenia, nauczysz si� rozpoznawa� d�wi�k, jaki wydaje wytrych zanim p�knie.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_02"); //My�l�, �e powiniene� sobie z tym poradzi�. Ws�uchaj si� uwa�nie w d�wi�ki jakie wydaje otwierany zamek, a nie b�dziesz potrzebowa� tylu wytrych�w, he, he!
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzy� ka�d� skrzyni� nie �ami�c ani jednego wytrycha.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00"); //Chcia�bym zosta� zr�cznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01"); //Chcia�by� odci��y� par� os�b z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02"); //Poka�� ci na czym powiniene� si� skoncentrowa�, ale szanse, �e zostaniesz z�apany b�d� nadal znaczne.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy��cznie je�li w pobli�u ofiary nie ma os�b trzecich.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukra�� co� pozostaj�c ca�kowicie niezauwa�onym!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Wedge_lehrer_Pickpocket_05_05"); //Nie ma o czym m�wi�! Nie b�dzie z ciebie z�odzieja, dop�ki nie nauczysz si� skrada�!
	};
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Pickpocket2_15_00"); //Chcia�bym zosta� mistrzem kieszonkowc�w!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_01"); //C�, chyba rzeczywi�cie potrafisz ju� wystarczaj�co du�o, �eby opanowa� zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_02"); //Ale musisz pami�ta�, �e nawet mistrzowie z�odziejscy od czasu do czasu zostaj� z�apani.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_03"); //Uwa�aj na siebie.
	};
};

func VOID DIA_Wedge_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Wedge_Lehrer );
};

