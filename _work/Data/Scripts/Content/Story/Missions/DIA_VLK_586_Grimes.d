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
	AI_Output (other, self,"VLK_586_Grimes_Exit_Info_15_01"); //Hodnì štìstí!
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Tobì taky, chlapèe, tobì taky.
	
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
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //Jsem tady už 10 let. Vìø mi, nauèil jsem se toho už dost a také jsem nabyl zkušenosti.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //Èelil jsem už mnoha nebezpeèím a podaøilo se mi pøežít.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //Za starých èasù, když jsme pracovali v zavøeném dolu, v tom, který je teï opuštìný,  se zhroutily nosné trámy...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //To je ale starý pøíbìh...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Urèitì jsi také slyšel o spoustì únikových cest."; 
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
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //Urèitì jsi také slyšel o spoustì únikových cest.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Poslyš, hochu: vím, že odtud chceš pryè, ale na to zapomeò.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //Lepší bude zapomenout na ty únikové cesty. Vidìl jsem tváøe tìch, co se pokoušeli dostat z Bariéry.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //Neudìlej tu samou chybu, Bariéra zastaví každého.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //Nechci dalších deset let života rubat v dole!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //Ne, nebudeš! Snad budeš jedním z tìch velkých šéfù, kdo ví.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //Vypracuješ se dál, ale bez ohledu na to jak vysoko, Bariéra tì vždycky nakonec zastaví.
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
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //Nová tváø. Už si nìkdy kutal rudu, hochu?
};  
