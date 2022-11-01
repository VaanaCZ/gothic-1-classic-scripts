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
	AI_Output (other, self,"VLK_586_Grimes_Exit_Info_15_01"); //Hodně štěstí!
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Tobě taky, chlapče, tobě taky.
	
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
	description		= "Jsi tady už dlouho?"; 
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
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //Jsi tady už dlouho?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //Jsem tady už 10 let. Věř mi, naučil jsem se toho už dost a také jsem nabyl zkušenosti.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //Čelil jsem už mnoha nebezpečím a podařilo se mi přežít.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //Za starých časů, když jsme pracovali v zavřeném dolu, v tom, který je teď opuštěný,  se zhroutily nosné trámy...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //To je ale starý příběh...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Určitě jsi také slyšel o spoustě únikových cest."; 
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
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //Určitě jsi také slyšel o spoustě únikových cest.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Poslyš, hochu: vím, že odtud chceš pryč, ale na to zapomeň.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //Lepší bude zapomenout na ty únikové cesty. Viděl jsem tváře těch, co se pokoušeli dostat z Bariéry.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //Neudělej tu samou chybu, Bariéra zastaví každého.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //Nechci dalších deset let života rubat v dole!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //Ne, nebudeš! Snad budeš jedním z těch velkých šéfů, kdo ví.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //Vypracuješ se dál, ale bez ohledu na to jak vysoko, Bariéra tě vždycky nakonec zastaví.
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
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //Nová tvář. Už si někdy kutal rudu, hochu?
};  
