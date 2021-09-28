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
	AI_Output (self, other,"DIA_Wedge_Psst_05_02"); //Tak... ChodŸ no tutaj!
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
	AI_Output (self, other,"DIA_Wedge_Hello_05_01"); //Jesteœ tu nowy, co? Od razu zauwa¿y³em.
	AI_Output (self, other,"DIA_Wedge_Hello_05_02"); //Musisz siê jeszcze wiele nauczyæ. Móg³bym ci pokazaæ, co w trawie piszczy.
	AI_Output (self, other,"DIA_Wedge_Hello_05_03"); //Przede wszystkim musisz uwa¿aæ z kim rozmawiasz. Widzisz tego faceta, tam - przy ognisku? To Butch. Strze¿ siê go!
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
	AI_Output (self, other,"DIA_Wedge_WarnsOfButch_05_01"); //Ma paskudny nawyk napadania nowoprzyby³ych. Na twoim miejscu unika³bym go jak ognia.
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
	description		= "Czego mo¿esz mnie nauczyæ?"; 
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
		B_LogEntry			(GE_TeacherNC,"Szkodnik o przezwisku Klin mo¿e mnie nauczyæ skradania siê, otwierania zamków i kradzie¿y kieszonkowej.");
		log_wedgelearn = TRUE ;
	};
	AI_Output (other, self,"DIA_Wedge_Lehrer_15_00"); //Czego mo¿esz mnie nauczyæ?
	AI_Output (self, other,"DIA_Wedge_Lehrer_05_01"); //To zale¿y... A co chcesz wiedzieæ?
	

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
	AI_Output (other, self,"DIA_Wedge_Lehrer_Schleichen_15_00"); //Chcia³bym nauczyæ siê poruszaæ bezszelestnie.
	if (B_GiveSkill(other, NPC_TALENT_SNEAK, 1, LPCOST_TALENT_SNEAK))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_01"); //Grunt to zachowaæ równowagê. Oprócz tego musisz nauczyæ siê kontrolowaæ swój oddech.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Schleichen_05_02"); //Przyjmij odpowiedni¹ postawê, a nikt nie us³yszy twoich kroków.
	};
};

func void DIA_Wedge_Lehrer_Lockpick()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick_15_00"); //Chcia³bym nauczyæ siê otwieraæ zamki.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 1, LPCOST_TALENT_PICKLOCK_1))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_01"); //Nie w¹tpiê! Có¿... Pocz¹tki nie s¹ zbyt trudne.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_02"); //Przede wszystkim musisz uwa¿aæ, ¿eby nie z³amaæ wytrycha.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick_05_03"); //Musisz byæ bardzo cierpliwy. Wtedy nie bêdziesz potrzebowa³ tylu wytrychów, he he!
	};
};

func void DIA_Wedge_Lehrer_Lockpick2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Lockpick2_15_00"); //Chcia³bym zostaæ ekspertem w otwieraniu zamków.
	
	if (B_GiveSkill(other, NPC_TALENT_PICKLOCK, 2, LPCOST_TALENT_PICKLOCK_2))
	{
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_01"); //Gdy nabierzesz ju¿ trochê doœwiadczenia, nauczysz siê rozpoznawaæ dŸwiêk, jaki wydaje wytrych zanim pêknie.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_02"); //Myœlê, ¿e powinieneœ sobie z tym poradziæ. Ws³uchaj siê uwa¿nie w dŸwiêki jakie wydaje otwierany zamek, a nie bêdziesz potrzebowa³ tylu wytrychów, he, he!
		AI_Output (self, other,"DIA_Wedge_Lehrer_Lockpick2_05_03"); //Prawdziwy mistrz w tym fachu potrafi otworzyæ ka¿d¹ skrzyniê nie ³ami¹c ani jednego wytrycha.
	};
};

func void DIA_Wedge_Lehrer_Pickpocket()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_PICKPOCKET_15_00"); //Chcia³bym zostaæ zrêcznym kieszonkowcem!
	if (Npc_GetTalentSkill(other, NPC_TALENT_SNEAK) == 1)
	{
		if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 1, LPCOST_TALENT_PICKPOCKET_1))
		{
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_01"); //Chcia³byœ odci¹¿yæ parê osób z ich dobytku, co? No dobra.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_02"); //Poka¿ê ci na czym powinieneœ siê skoncentrowaæ, ale szanse, ¿e zostaniesz z³apany bêd¹ nadal znaczne.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_03"); //Podejmuj ryzyko wy³¹cznie jeœli w pobli¿u ofiary nie ma osób trzecich.
			AI_Output (self, other,"DIA_Wedge_Lehrer_PICKPOCKET_05_04"); //Tylko prawdziwy mistrz potrafi ukraœæ coœ pozostaj¹c ca³kowicie niezauwa¿onym!
		};
	}
	else
	{
		AI_Output (self, other,"DIA_Wedge_lehrer_Pickpocket_05_05"); //Nie ma o czym mówiæ! Nie bêdzie z ciebie z³odzieja, dopóki nie nauczysz siê skradaæ!
	};
};

func void DIA_Wedge_Lehrer_Pickpocket2()
{
	AI_Output (other, self,"DIA_Wedge_Lehrer_Pickpocket2_15_00"); //Chcia³bym zostaæ mistrzem kieszonkowców!
	
	if (B_GiveSkill(other, NPC_TALENT_PICKPOCKET, 2, LPCOST_TALENT_PICKPOCKET_2))
	{		
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_01"); //Có¿, chyba rzeczywiœcie potrafisz ju¿ wystarczaj¹co du¿o, ¿eby opanowaæ zaawansowane sztuczki.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_02"); //Ale musisz pamiêtaæ, ¿e nawet mistrzowie z³odziejscy od czasu do czasu zostaj¹ z³apani.
		AI_Output (self, other,"DIA_Wedge_Lehrer_Pickpocket2_05_03"); //Uwa¿aj na siebie.
	};
};

func VOID DIA_Wedge_Lehrer_BACK()
{
	Info_ClearChoices	( DIA_Wedge_Lehrer );
};

