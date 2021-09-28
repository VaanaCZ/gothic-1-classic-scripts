// ************************ EXIT **************************

instance VLK_586_Grimes_Exit (C_INFO)
{
	npc			= VLK_586_Grimes;
	nr			= 999;
	condition	= VLK_586_Grimes_Exit_Condition;
	information	= VLK_586_Grimes_Exit_Info;
	important	= 0;	
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  VLK_586_Grimes_Exit_Condition()
{
	return 1;
};

FUNC VOID  VLK_586_Grimes_Exit_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_Exit_Info_15_01"); //Powodzenia!
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Nawzajem, ch³opcze. Nawzajem.
	
	AI_StopProcessInfos	( self );
};




// ***************** Infos *****************************

instance  VLK_586_Grimes_STORY (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_STORY_Condition;
	information		= VLK_586_Grimes_STORY_Info;
	important		= 0;
	permanent		= 0;
	description		= "Od dawna tu jesteœ?"; 
};

FUNC int  VLK_586_Grimes_STORY_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_FIRST) )  
	{
		return 1;
	};

};


FUNC void  VLK_586_Grimes_STORY_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //Od dawna tu jesteœ?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //Od ca³ych 10 lat. Uwierz mi, du¿o ju¿ tu widzia³em.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //Stawi³em czo³a wielu niebezpieczeñstwom, ale jakoœ uda³o mi siê z nich wybrn¹æ.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //Pamiêtam jak pracowaliœmy jeszcze w pierwszej kopalni, tej, która teraz stoi pusta. Pewnego dnia nie wytrzyma³y podpory...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //Ale to stare dzieje...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Zapewne s³ysza³eœ te¿ o wielu planach ucieczki."; 
};

FUNC int  VLK_586_Grimes_KNOW_Condition()
{	
	if ( Npc_KnowsInfo (hero,VLK_586_Grimes_STORY) )  
	{
		return 1;
	};

};
FUNC void  VLK_586_Grimes_KNOW_Info()
{
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //Zapewne s³ysza³eœ te¿ o wielu planach ucieczki.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Pos³uchaj, ch³opcze. Wiem, ¿e chcia³byœ siê st¹d wydostaæ, ale zapomnij o tym.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //St¹d nie ma ucieczki! Widzia³em twarze tych, którzy próbowali sforsowaæ Barierê.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //Nie pope³niaj tego samego b³êdu. Bariera powstrzyma ka¿dego.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //Nie chcê spêdziæ nastêpnych 10 lat mojego ¿ycia wydobywaj¹c rudê!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //Wcale nie musisz. Mo¿e zostaniesz wielk¹ szych¹, kto wie?
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //Mo¿esz pi¹æ siê do góry, ale niewa¿ne jak wysokie stanowisko uda ci siê osi¹gn¹æ - Bariera wreszcie ciê zatrzyma.
};

instance VLK_586_Grimes_FIRST (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_FIRST_Condition;
	information		= VLK_586_Grimes_FIRST_Info;
	important		= 1;
	permanent		= 0;
};

FUNC int  VLK_586_Grimes_FIRST_Condition()
{
	return 1;
};

func void  VLK_586_Grimes_FIRST_Info()
{
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //Oho! Nowa twarz! Pracowa³eœ kiedyœ jako górnik, ch³opcze?
};  
