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
	AI_Output (other, self,"VLK_586_Grimes_Exit_Info_15_01"); //Hodn� �t�st�!
	AI_Output (self, other,"VLK_586_Grimes_Exit_Info_04_02"); //Tob� taky, chlap�e, tob� taky.
	
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
	description		= "Jsi tady u� dlouho?"; 
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
	AI_Output (other, self,"VLK_586_Grimes_STORY_Info_15_01"); //Jsi tady u� dlouho?
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_02"); //Jsem tady u� 10 let. V�� mi, nau�il jsem se toho u� dost a tak� jsem nabyl zku�enosti.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_03"); //�elil jsem u� mnoha nebezpe��m a poda�ilo se mi p�e��t.
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_04"); //Za star�ch �as�, kdy� jsme pracovali v zav�en�m dolu, v tom, kter� je te� opu�t�n�,  se zhroutily nosn� tr�my...
	AI_Output (self, other,"VLK_586_Grimes_STORY_Info_04_05"); //To je ale star� p��b�h...
};

instance  VLK_586_Grimes_KNOW (C_INFO)
{
	npc				= VLK_586_Grimes;
	condition		= VLK_586_Grimes_KNOW_Condition;
	information		= VLK_586_Grimes_KNOW_Info;
	important		= 0;
	permanent		= 0;
	description		= "Ur�it� jsi tak� sly�el o spoust� �nikov�ch cest."; 
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
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_01"); //Ur�it� jsi tak� sly�el o spoust� �nikov�ch cest.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_02"); //Posly�, hochu: v�m, �e odtud chce� pry�, ale na to zapome�.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_03"); //Lep�� bude zapomenout na ty �nikov� cesty. Vid�l jsem tv��e t�ch, co se pokou�eli dostat z Bari�ry.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_04"); //Neud�lej tu samou chybu, Bari�ra zastav� ka�d�ho.
	AI_Output (other, self,"VLK_586_Grimes_KNOW_Info_15_05"); //Nechci dal��ch deset let �ivota rubat v dole!
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_06"); //Ne, nebude�! Snad bude� jedn�m z t�ch velk�ch ��f�, kdo v�.
	AI_Output (self, other,"VLK_586_Grimes_KNOW_Info_04_07"); //Vypracuje� se d�l, ale bez ohledu na to jak vysoko, Bari�ra t� v�dycky nakonec zastav�.
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
	AI_Output (self, other,"VLK_586_Grimes_FIRST_Info_04_02"); //Nov� tv��. U� si n�kdy kutal rudu, hochu?
};  
