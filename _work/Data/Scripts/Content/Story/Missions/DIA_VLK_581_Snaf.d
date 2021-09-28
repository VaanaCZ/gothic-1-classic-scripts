// **************************************************
// 						 EXIT 
// **************************************************

INSTANCE DIA_Snaf_Exit (C_INFO)
{
	npc			= Vlk_581_Snaf;
	nr			= 999;
	condition	= DIA_Snaf_Exit_Condition;
	information	= DIA_Snaf_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Snaf_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Snaf_Exit_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
// 				Erstes Mal aufkreuzen
// **************************************************

INSTANCE DIA_Snaf_Hello (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Hello_Condition;
	information		= DIA_Snaf_Hello_Info;
	permanent		= 0;
	description		= "Jak to jde?";
};

FUNC INT DIA_Snaf_Hello_Condition()
{	
	return 1;
};

FUNC VOID DIA_Snaf_Hello_Info()
{
	AI_Output (other, self,"DIA_Snaf_Hello_15_00"); //Jak to jde?
	AI_Output (self, other,"DIA_Snaf_Hello_01_01"); //Nen� to zl�. Kdy� um� dob�e va�it, m� tady spoustu p��tel.
	AI_Output (self, other,"DIA_Snaf_Hello_01_02");	//Nechce� n�jak� z m�ch r��ov�ch n�kyp�?
	AI_Output (other, self,"DIA_Snaf_Hello_15_03"); //D�ky.
	AI_Output (self, other,"DIA_Snaf_Hello_01_04");	//Mohl bys pro m� ud�lat laskavost.
	
	CreateInvItem (self,ItFoRice);
	B_GiveInvItems(self,other,ItFoRice,1);
};

// **************************************************
// 				Bring Zutaten
// **************************************************
	var int Snaf_Zutaten; 
	var int Snaf_FreeMBRagout;
// **************************************************

INSTANCE DIA_Snaf_Zutaten (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_Zutaten_Condition;
	information		= DIA_Snaf_Zutaten_Info;
	permanent		= 0;
	description		="Co pro tebe m��u ud�lat?";
};

FUNC INT DIA_Snaf_Zutaten_Condition()
{	
	if (Npc_KnowsInfo(hero,DIA_Snaf_Hello))
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_Zutaten_Info()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_15_00"); //Co bych m�l ud�lat?
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_01"); //Mus� b�t zvykl� na dobr� j�dlo. M�m nov� recept: rag� ze �rav�ch �t�nic po zlod�jsku s r��� a houbami.
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_02"); //M��e� m�t, kolik si jen vzpomene�, ale bude� pot�ebovat: 3 �rav� �t�nice a p�r pekeln�ch hub - 5 by m�lo sta�it.
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"Chce�, abych se pozvracel?",DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"To zn� dob�e.",DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_KOTZ_15_00"); //Chce�, abych se pozvracel?
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_01"); //Nemus� to sn�st, ale mohl bys to aspo� zkusit! Jestli se ti poda�� ty v�ci sehnat, vzpome� si na m�.
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_02"); //U� jsem n�koho poslal, ale je�t� se nevr�til - z�ejm� zb�hl do Nov�ho t�bora.
	Snaf_Zutaten = LOG_RUNNING;
	
	Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"Snaf, kucha� kter� �ije na Vn�j��m okruhu, m� poslal, abych mu pro nov� kucha�sk� recept opat�il 3 �rav� �t�nice a 5 pekeln�ch hub.");
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_DoIt_15_00"); //To zn� dob�e.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_01"); //Tak jdi a se�e� mi ty v�ci.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_02"); //Posledn�, kter�ho jsem poslal, se je�t� nevr�til - z�ejm� zb�hl do Nov�ho t�bora.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
		
    Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"Snaf, kucha� �ij�c� na Vn�j��m okruhu, m� poslal, abych mu pro nov� kucha�sk� recept opat�il 3 �rav� �t�nice a 5 pekeln�ch hub. A� to bude hotov�, tak� z toho budu n�co m�t.");		
			
	Info_ClearChoices(DIA_Snaf_Zutaten);	
};

// **************************************************
// 					SUCCESS
// **************************************************

INSTANCE DIA_Snaf_ZutatenSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_ZutatenSuccess_Condition;
	information		= DIA_Snaf_ZutatenSuccess_Info;
	permanent		= 0;
	description		= "M�m ty v�ci, co jsi po mn� cht�l!";
};

FUNC INT DIA_Snaf_ZutatenSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) && (Npc_HasItems(other,ItFo_Plants_Mushroom_01)>=5) && (Npc_HasItems(other,ItAt_Meatbug_01)>=3) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_ZutatenSuccess_Info()
{
	AI_Output (other, self,"DIA_Snaf_ZutatenSuccess_15_00"); //M�m ty v�ci, co jsi po mn� cht�l!
	AI_Output (self, other,"DIA_Snaf_ZutatenSuccess_01_01"); //V�born�, mus�m je p�idat, pak bude to rag� hotov�... Po�kej...
	
	CreateInvItems(other, ItFo_Plants_Mushroom_01, 3);
	B_GiveInvItems(other,self,ItFo_Plants_Mushroom_01,8);//Notwendig zur Anzeige 8 Items �bergeben, wird sofort angepasst
	
	Npc_RemoveInvItems(self, ItFo_Plants_Mushroom_01, 8);//Alle Zutaten weg
	Npc_RemoveInvItems(other, ItAt_MeatBug_01, 3);
	
	CreateInvItems(self, ItFoMeatbugragout,3);
	B_GiveInvItems(self, other,ItFoMeatbugragout,3);
	
	Snaf_Zutaten = LOG_SUCCESS;
	
	Log_SetTopicStatus	(CH1_SnafsRecipe, LOG_SUCCESS);
	B_LogEntry			(CH1_SnafsRecipe,"Snaf byl velmi spokojen�, kdy� jsem mu p�inesl ty p��sady.");
	
	if Snaf_FreeMBRagout==TRUE
	{
	    B_LogEntry( CH1_SnafsRecipe,"Ode dne�ka mi bude ka�d� den d�vat rag� ze �rav�ch �t�nic.");
	};
	
	B_GiveXP(100);
	
	AI_StopProcessInfos	(self);
};

// **************************************************
// 					AFTER SUCCESS
// **************************************************
	var int Snaf_RagoutDay;
// **************************************************

INSTANCE DIA_Snaf_AfterSuccess (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 2;
	condition		= DIA_Snaf_AfterSuccess_Condition;
	information		= DIA_Snaf_AfterSuccess_Info;
	permanent		= 1;
	description		= "�ekl jsi mi, �e m��u m�t tolik rag�, kolik budu cht�t...";
};

FUNC INT DIA_Snaf_AfterSuccess_Condition()
{	
	if ( (Snaf_Zutaten==LOG_SUCCESS) && (Snaf_FreeMBRagout==TRUE) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_AfterSuccess_Info()
{
 	AI_Output (other, self,"DIA_Snaf_AfterSuccess_15_00"); //�ekl jsi mi, �e m��u m�t tolik rag�, kolik budu cht�t...
 	
 	if (Snaf_RagoutDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_01"); //A to je pravda. Tady jsou t�i porce.
		CreateInvItems(self, ItFoMeatbugragout,3);
		B_GiveInvItems(self, other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_02"); //Jist�! Ale dnes nic nezbylo. P�ij� zase z�tra.
	};
};

// **************************************************
// 					Wo Fleischwanzen
// **************************************************

INSTANCE DIA_Snaf_WhereMeatbugs (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 3;
	condition		= DIA_Snaf_WhereMeatbugs_Condition;
	information		= DIA_Snaf_WhereMeatbugs_Info;
	permanent		= 0;
	description		= "Kde najdu �rav� �t�nice?";
};

FUNC INT DIA_Snaf_WhereMeatbugs_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMeatbugs_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMeatbugs_15_00"); //Kde najdu �rav� �t�nice?
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_01"); //V�ude, kde se v�l� odpadky. N�co bys mohl naj�t u t� opu�t�n� chatr�e nedaleko hradn� zdi.
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_02"); //Nedej se zm�st jejich nev�bn�m vzhledem. Jakmile se uva��, jsou znamenit�.
	
    B_LogEntry( CH1_SnafsRecipe,"Pobl� zpustl�ch chatr�� u hradn�ch zd� se vyskytuj� �rav� �t�nice.");			
};

// **************************************************
// 					Where Mushrooms
// **************************************************

INSTANCE DIA_Snaf_WhereMushrooms (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 4;
	condition		= DIA_Snaf_WhereMushrooms_Condition;
	information		= DIA_Snaf_WhereMushrooms_Info;
	permanent		= 0;
	description		= "Kde najdu houby?";
};

FUNC INT DIA_Snaf_WhereMushrooms_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereMushrooms_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereMushrooms_15_00"); //Kde najdu houby?
	AI_Output (self, other,"DIA_Snaf_WhereMushrooms_01_01"); //Kdy� projde� ji�n� branou - to je ta zhroucen� v� - uvid� p��mo p�ed sebou pl��. Tam rostou houby.
	
	B_LogEntry( CH1_SnafsRecipe,"Pekeln� houby najdu na planin� p�ed z��cenou v�� ji�n� br�ny.");			
};

// **************************************************
// 					Where Nek
// **************************************************

INSTANCE DIA_Snaf_WhereNek (C_INFO)
{
	npc				= Vlk_581_Snaf;
	nr				= 5;
	condition		= DIA_Snaf_WhereNek_Condition;
	information		= DIA_Snaf_WhereNek_Info;
	permanent		= 0;
	description		= "Kdo byl ten chlap�k, kter�ho jsi poslal p�ede mnou?";
};

FUNC INT DIA_Snaf_WhereNek_Condition()
{	
	if ( (Snaf_Zutaten==LOG_RUNNING) )
	{
		return 1;
	};
};

FUNC VOID DIA_Snaf_WhereNek_Info()
{
	AI_Output (other, self,"DIA_Snaf_WhereNek_15_00"); //Kdo byl ten chlap�k, kter�ho jsi poslal p�ede mnou?
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_01"); //Jmenoval se Nek. Byl tady hrozn� nespokojen� - mysl�m, �e je te� v Nov�m t�bo�e.
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_02"); //Poslal jsem ho nasb�rat houby - ale u� se nevr�til zp�tky...
	
	if	(Sly_LostNek != LOG_SUCCESS)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_LostNek,"Kucha� Snaf vid�l Neka naposledy, kdy� ode�el sb�rat houby.");
};







	
	 




