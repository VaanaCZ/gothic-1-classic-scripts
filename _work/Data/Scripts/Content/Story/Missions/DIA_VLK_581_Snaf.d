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
	AI_Output (self, other,"DIA_Snaf_Hello_01_01"); //Není to zlé. Když umíš dobøe vaøit, máš tady spoustu pøátel.
	AI_Output (self, other,"DIA_Snaf_Hello_01_02");	//Nechceš nìjaký z mých rýžových nákypù?
	AI_Output (other, self,"DIA_Snaf_Hello_15_03"); //Díky.
	AI_Output (self, other,"DIA_Snaf_Hello_01_04");	//Mohl bys pro mì udìlat laskavost.
	
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
	description		="Co pro tebe mùžu udìlat?";
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
	AI_Output (other, self,"DIA_Snaf_Zutaten_15_00"); //Co bych mìl udìlat?
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_01"); //Musíš být zvyklý na dobré jídlo. Mám nový recept: ragú ze žravých štìnic po zlodìjsku s rýží a houbami.
	AI_Output (self, other,"DIA_Snaf_Zutaten_01_02"); //Mùžeš mít, kolik si jen vzpomeneš, ale budeš potøebovat: 3 žravé štìnice a pár pekelných hub - 5 by mìlo staèit.
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"Chceš, abych se pozvracel?",DIA_Snaf_Zutaten_KOTZ);
	Info_AddChoice	 (DIA_Snaf_Zutaten,"To zní dobøe.",DIA_Snaf_Zutaten_DoIt);
};

func void DIA_Snaf_Zutaten_KOTZ()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_KOTZ_15_00"); //Chceš, abych se pozvracel?
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_01"); //Nemusíš to sníst, ale mohl bys to aspoò zkusit! Jestli se ti podaøí ty vìci sehnat, vzpomeò si na mì.
	AI_Output (self, other,"DIA_Snaf_Zutaten_KOTZ_01_02"); //Už jsem nìkoho poslal, ale ještì se nevrátil - zøejmì zbìhl do Nového tábora.
	Snaf_Zutaten = LOG_RUNNING;
	
	Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"Snaf, kuchaø který žije na Vnìjším okruhu, mì poslal, abych mu pro nový kuchaøský recept opatøil 3 žravé štìnice a 5 pekelných hub.");
	
	Info_ClearChoices(DIA_Snaf_Zutaten);
};

func void DIA_Snaf_Zutaten_DoIt()
{
	AI_Output (other, self,"DIA_Snaf_Zutaten_DoIt_15_00"); //To zní dobøe.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_01"); //Tak jdi a sežeò mi ty vìci.
	AI_Output (self, other,"DIA_Snaf_Zutaten_DoIt_01_02"); //Poslední, kterého jsem poslal, se ještì nevrátil - zøejmì zbìhl do Nového tábora.
	Snaf_Zutaten = LOG_RUNNING;
	Snaf_FreeMBRagout = TRUE;
		
    Log_CreateTopic(CH1_SnafsRecipe, LOG_MISSION);
	Log_SetTopicStatus(CH1_SnafsRecipe, LOG_RUNNING);
	B_LogEntry( CH1_SnafsRecipe,"Snaf, kuchaø žijící na Vnìjším okruhu, mì poslal, abych mu pro nový kuchaøský recept opatøil 3 žravé štìnice a 5 pekelných hub. Až to bude hotové, také z toho budu nìco mít.");		
			
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
	description		= "Mám ty vìci, co jsi po mnì chtìl!";
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
	AI_Output (other, self,"DIA_Snaf_ZutatenSuccess_15_00"); //Mám ty vìci, co jsi po mnì chtìl!
	AI_Output (self, other,"DIA_Snaf_ZutatenSuccess_01_01"); //Výbornì, musím je pøidat, pak bude to ragú hotové... Poèkej...
	
	CreateInvItems(other, ItFo_Plants_Mushroom_01, 3);
	B_GiveInvItems(other,self,ItFo_Plants_Mushroom_01,8);//Notwendig zur Anzeige 8 Items übergeben, wird sofort angepasst
	
	Npc_RemoveInvItems(self, ItFo_Plants_Mushroom_01, 8);//Alle Zutaten weg
	Npc_RemoveInvItems(other, ItAt_MeatBug_01, 3);
	
	CreateInvItems(self, ItFoMeatbugragout,3);
	B_GiveInvItems(self, other,ItFoMeatbugragout,3);
	
	Snaf_Zutaten = LOG_SUCCESS;
	
	Log_SetTopicStatus	(CH1_SnafsRecipe, LOG_SUCCESS);
	B_LogEntry			(CH1_SnafsRecipe,"Snaf byl velmi spokojený, když jsem mu pøinesl ty pøísady.");
	
	if Snaf_FreeMBRagout==TRUE
	{
	    B_LogEntry( CH1_SnafsRecipe,"Ode dneška mi bude každý den dávat ragú ze žravých štìnic.");
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
	description		= "Øekl jsi mi, že mùžu mít tolik ragú, kolik budu chtít...";
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
 	AI_Output (other, self,"DIA_Snaf_AfterSuccess_15_00"); //Øekl jsi mi, že mùžu mít tolik ragú, kolik budu chtít...
 	
 	if (Snaf_RagoutDay!=Wld_GetDay())
 	{
 		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_01"); //A to je pravda. Tady jsou tøi porce.
		CreateInvItems(self, ItFoMeatbugragout,3);
		B_GiveInvItems(self, other,ItFoMeatbugragout,3);
		Snaf_RagoutDay = Wld_GetDay();
	}
	else
	{
		AI_Output (self, other,"DIA_Snaf_AfterSuccess_01_02"); //Jistì! Ale dnes nic nezbylo. Pøijï zase zítra.
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
	description		= "Kde najdu žravé štìnice?";
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
	AI_Output (other, self,"DIA_Snaf_WhereMeatbugs_15_00"); //Kde najdu žravé štìnice?
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_01"); //Všude, kde se válí odpadky. Nìco bys mohl najít u té opuštìné chatrèe nedaleko hradní zdi.
	AI_Output (self, other,"DIA_Snaf_WhereMeatbugs_01_02"); //Nedej se zmást jejich nevábným vzhledem. Jakmile se uvaøí, jsou znamenité.
	
    B_LogEntry( CH1_SnafsRecipe,"Poblíž zpustlých chatrèí u hradních zdí se vyskytují žravé štìnice.");			
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
	AI_Output (self, other,"DIA_Snaf_WhereMushrooms_01_01"); //Když projdeš jižní branou - to je ta zhroucená vìž - uvidíš pøímo pøed sebou pláò. Tam rostou houby.
	
	B_LogEntry( CH1_SnafsRecipe,"Pekelné houby najdu na planinì pøed zøícenou vìží jižní brány.");			
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
	description		= "Kdo byl ten chlapík, kterého jsi poslal pøede mnou?";
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
	AI_Output (other, self,"DIA_Snaf_WhereNek_15_00"); //Kdo byl ten chlapík, kterého jsi poslal pøede mnou?
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_01"); //Jmenoval se Nek. Byl tady hroznì nespokojený - myslím, že je teï v Novém táboøe.
	AI_Output (self, other,"DIA_Snaf_WhereNek_01_02"); //Poslal jsem ho nasbírat houby - ale už se nevrátil zpátky...
	
	if	(Sly_LostNek != LOG_SUCCESS)
	&&	(Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		Log_CreateTopic		(CH1_LostNek,	LOG_MISSION);
		Log_SetTopicStatus	(CH1_LostNek,	LOG_RUNNING);
	};
	B_LogEntry			(CH1_LostNek,"Kuchaø Snaf vidìl Neka naposledy, když odešel sbírat houby.");
};







	
	 




