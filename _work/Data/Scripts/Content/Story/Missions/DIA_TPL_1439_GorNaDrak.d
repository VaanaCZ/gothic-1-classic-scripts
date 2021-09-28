// **************************************************
//						 EXIT 
// **************************************************

instance  DIA_GorNaDrak_EXIT (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 999;
	condition	= DIA_GorNaDrak_EXIT_Condition;
	information	= DIA_GorNaDrak_EXIT_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  DIA_GorNaDrak_EXIT_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_EXIT_Info()
{
	AI_StopProcessInfos	( self );
};

// **************************************************
//					Erste Begr�ssung
// **************************************************

instance  DIA_GorNaDrak_Greet (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Greet_Condition;
	information	= DIA_GorNaDrak_Greet_Info;
	permanent	= 0;
	description  = "Zdar! Kam odch�z�?";
};                       

FUNC int  DIA_GorNaDrak_Greet_Condition()
{
	return 1;
};

FUNC VOID  DIA_GorNaDrak_Greet_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Greet_15_00"); //Zdar! Kam odch�z�?
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_01"); //Neseme v�m�ek d�ln�ho �erva od na�ich bratr� ze Star�ho dolu ke Cor Kalomovi.
	AI_Output (self, other,"DIA_GorNaDrak_Greet_09_02"); //Chod�me pro n�j do Star�ho dolu ka�d� den.
};

// **************************************************
//					Was ist Sekret
// **************************************************

instance  DIA_GorNaDrak_WasSekret (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WasSekret_Condition;
	information	= DIA_GorNaDrak_WasSekret_Info;
	permanent	= 0;
	description  = "Jak� druh v�m�ku to je?";
};                       

FUNC int  DIA_GorNaDrak_WasSekret_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_Greet))
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_WasSekret_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_WasSekret_15_00"); //Jak� druh v�m�ku to je?
	AI_Output (self, other,"DIA_GorNaDrak_WasSekret_09_01"); //Je obsa�en� v �elistech d�ln�ch �erv�. Kdy� v� jak na to, m��e� je odn�st, ani� bys ztratil v�m�ek.
};

// **************************************************
//			 	LERNE: Zangen Nehmen
// **************************************************

instance  DIA_GorNaDrak_TeachMandibles (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_TeachMandibles_Condition;
	information	= DIA_GorNaDrak_TeachMandibles_Info;
	permanent	= 0;
	description  = "M��e� mi n�co ��ci o tom, jak z�sk�v� v�m�ek d�ln�ch �erv�?";
};                       

FUNC int  DIA_GorNaDrak_TeachMandibles_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WasSekret) && (Knows_GetMCMandibles == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_TeachMandibles_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_TeachMandibles_15_00"); //M��e� mi n�co ��ci o tom, jak z�sk�v� v�m�ek d�ln�ch �erv�?
	AI_Output (self, other,"DIA_GorNaDrak_TeachMandibles_09_01"); //Jist�. Kdy� tu bestii zabije�, vezme� jej� �elisti a odnese� je. Tak z�sk� �l�zu s v�m�kem, ani� bys ji po�kodil.
	
	PrintScreen	("Nau�it se: Od��znout �elisti d�ln�ch �erv�", -1,-1,"FONT_OLD_20_WHITE.TGA",3);
	Knows_GetMCMandibles = TRUE;
	Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
	B_LogEntry (GE_AnimalTrophies,"Jak odstranit �elisti - d�ln� �ervi");
};

// **************************************************
//			 	Wof�r ist Sekret da?
// **************************************************

instance  DIA_GorNaDrak_WhatFor (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_WhatFor_Condition;
	information	= DIA_GorNaDrak_WhatFor_Info;
	permanent	= 0;
	description  = "Na co Cor Kalom ten v�m�ek pot�ebuje?";
};                       

FUNC int  DIA_GorNaDrak_WhatFor_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WasSekret))
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_WhatFor_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_WhatFor_15_00"); //Na co Cor Kalom ten v�m�ek pot�ebuje?
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_01"); //Co j� v�m, p�ipravuje z n�j n�jak� lektvar, kter� umoc�uje magick� s�ly novic�.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_02"); //Od t� doby, co p�ipravujeme velk� vz�v�n�, nem� t� l�tky st�le dost.
	AI_Output (self, other,"DIA_GorNaDrak_WhatFor_09_03"); //S pomoc� toho lektvaru p�ipravuje novice na ten velk� den.
};

// **************************************************
//			 	Kap 1 Permanent
// **************************************************

instance  DIA_GorNaDrak_Permanent (C_INFO)
{
	npc			= Tpl_1439_GorNaDrak;
	nr			= 1;
	condition	= DIA_GorNaDrak_Permanent_Condition;
	information	= DIA_GorNaDrak_Permanent_Info;
	permanent	= 1;
	description  = "M�te dost lektvaru na to velk� vz�v�n� Sp��e?";
};                       

FUNC int  DIA_GorNaDrak_Permanent_Condition()
{
	if (Npc_KnowsInfo(hero, DIA_GorNaDrak_WhatFor) && (Kapitel < 3) )
	{
		return 1;
	};
};

FUNC VOID  DIA_GorNaDrak_Permanent_Info()
{
	AI_Output (other, self,"DIA_GorNaDrak_Permanent_15_00"); //M�te dost lektvaru na to velk� vz�v�n� Sp��e?
	AI_Output (self, other,"DIA_GorNaDrak_Permanent_09_01"); //Ne - Po��d sb�r�me dal�� - jednotky na�ich lovc� d�ln�ch �erv� jsou ve dne v noci v akci.
};




