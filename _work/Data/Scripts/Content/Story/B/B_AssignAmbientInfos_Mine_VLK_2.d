// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_2 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Mine_Vlk_2_EXIT_Condition;
	information	= Info_Mine_Vlk_2_EXIT_Info;
	permanent	= 1;
	description = "KONEC";
};                       

FUNC INT Info_Mine_Vlk_2_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Mine_Vlk_2_EXIT_Info()
{	
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Mine
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_Mine (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Mine_Vlk_2_Mine_Condition;
	information	= Info_Mine_Vlk_2_Mine_Info;
	permanent	= 1;
	description = "�ekni mi n�co o dole.";
};                       

FUNC INT Info_Mine_Vlk_2_Mine_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_Mine_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Mine_15_00"); //Pov�dej mi o dole.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_01"); //Je tu spousta jeskyn�, kde je�t� z�stala n�jak� ruda. Ale kv�li �erv�m nen� mo�n� se k n� dostat.
	AI_Output(self,other,"Info_Mine_Vlk_2_Mine_01_02"); //P��li� �tok�, p��li� ztr�t.
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Mine_Vlk_2_WichtigePersonen_Condition;
	information	= Info_Mine_Vlk_2_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kdo tady m� velen�?";
};                       

FUNC INT Info_Mine_Vlk_2_WichtigePersonen_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_WichtigePersonen_15_00"); //Kdo tady m� velen�?
	AI_Output(self,other,"Info_Mine_Vlk_2_WichtigePersonen_01_01"); //Viper je tavi�. V� o pec�ch v�echno a t�lo m� jak z �eleza. V�bec nev�, co je horko. Cel� den str�v� taven�m rudy.
};

// *************************************************************************
// 								Minecrawler
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_Minecrawler(C_INFO)
{
	nr			= 2;
	condition	= Info_Mine_Vlk_2_Minecrawler_Condition;
	information	= Info_Mine_Vlk_2_Minecrawler_Info;
	permanent	= 1;
	description = "Co v� o �ervech?";
};                       

FUNC INT Info_Mine_Vlk_2_Minecrawler_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_Minecrawler_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_Minecrawler_15_00"); //Co v� o d�ln�ch �ervech?
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_01"); //Mus�me se dostat bl� k t� velk� j�m� u dna. Je to tam sam� �erv.
	AI_Output(self,other,"Info_Mine_Vlk_2_Minecrawler_01_02"); //D�ln� �ervi jsou tady v�ude. Ty je nesly��? J� tedy jo!
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Mine_Vlk_2_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Mine_Vlk_2_DieLage_Condition;
	information	= Info_Mine_Vlk_2_DieLage_Info;
	permanent	= 1;
	description = "Jak to jde?";
};                       

FUNC INT Info_Mine_Vlk_2_DieLage_Condition()
{
	if (Kapitel < 3)
	{
		return 1;
	};
};

FUNC VOID Info_Mine_Vlk_2_DieLage_Info()
{
	AI_Output(other,self,"Info_Mine_Vlk_2_DieLage_15_00"); //Jak se m�?
	AI_Output(self,other,"Info_Mine_Vlk_2_DieLage_01_01"); //M�m moc pr�ce. Jestli m� str�e nachytaj�, jak tady zah�l�m, zaraz� mi p��d�ly.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Mine_Vlk_2(var c_NPC slf)
{
	Info_Mine_Vlk_2_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Minecrawler.npc				= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_Mine.npc					= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Mine_Vlk_2_DieLage.npc					= Hlp_GetInstanceID(slf);
};
