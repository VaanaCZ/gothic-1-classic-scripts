// ****************************************
// 					Exit
// ****************************************

INSTANCE DIA_Aidan_Exit (C_INFO)
{
	npc			= ORG_859_Aidan;
	nr			= 999;
	condition	= DIA_Aidan_Exit_Condition;
	information	= DIA_Aidan_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC INT DIA_Aidan_Exit_Condition()
{
	return 1;
};

FUNC VOID DIA_Aidan_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// ****************************************
// 				Hallo
// ****************************************

instance DIA_Aidan_Hello (C_INFO)
{
	npc				= Org_859_Aidan;
	nr				= 1;
	condition		= DIA_Aidan_Hello_Condition;
	information		= DIA_Aidan_Hello_Info;
	permanent		= 0;
	description		= "Co tady d�l�?";
};

FUNC int  DIA_Aidan_Hello_Condition()
{	
	return 1;
};

func void  DIA_Aidan_Hello_Info()
{
	AI_Output (other, self,"DIA_Aidan_Hello_15_00"); //Co tady d�l�?
	AI_Output (self, other,"DIA_Aidan_Hello_13_01"); //Jsem lovec. �iju z prodeje k��� a zub�.
	AI_Output (other, self,"DIA_Aidan_Hello_15_02"); //Plat� se za to?
	AI_Output (self, other,"DIA_Aidan_Hello_13_03"); //Kdy� v�, jak spr�vn� ty bestie roz�ezat, tak jo.

	Log_CreateTopic	(GE_TeacherOW,	LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Adan, lovec �ij�c� na cest� mezi Star�m a Nov�m t�borem, m� m��e nau�it kuchat zv��.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_859_Aidan_Creatures (C_INFO)
{
	npc			= Org_859_Aidan;
	nr			= 1;
	condition	= Org_859_Aidan_Creatures_Condition;
	information	= Org_859_Aidan_Creatures_Info;
	permanent	= 1;
	description = "Chci se nau�it roz�ez�vat zv��.";
};                       

FUNC int  Org_859_Aidan_Creatures_Condition()
{
	if ( Npc_KnowsInfo(hero, DIA_Aidan_Hello))
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_859_Aidan_Creatures_Info()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_15_00"); //Chci se nau�it roz�ez�vat zv��.
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_13_01"); //Co bys cht�l v�d�t?
		
		Info_ClearChoices(Org_859_Aidan_Creatures);
		Info_AddChoice   (Org_859_Aidan_Creatures, DIALOG_BACK 											,Org_859_Aidan_Creatures_BACK);

		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_859_Aidan_Creatures,"Vyjmout zuby (cena: 1 dovednostn� bod, 50 nuget�)",Org_859_Aidan_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"St�hnout ko�e�inu (cena:1 dovednostn� bod, 100 nuget�)",Org_859_Aidan_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"Vyjmout dr�py (cena: 1 dovednostn� bod, 50 nuget�)",Org_859_Aidan_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_859_Aidan_Creatures,"St�hnout plaza (cena: 1 dovednostn� bod, 100 nuget�)",Org_859_Aidan_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_TaughtAll_13_00"); //Nau�il jsem t� v�echno, co v�m.
	};
};

func void Org_859_Aidan_Creatures_BACK()
{
	Info_ClearChoices(Org_859_Aidan_Creatures);
};

func void Org_859_Aidan_Creatures_Zahn()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Zahn_15_00"); //Jak dostanu zuby?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nau�it se: vytahovat zuby", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_01"); //Nejd�le�it�j�� je zajistit, aby se zuby net��tily. Tomu se vyhne� tak, �e vlo�� n�� bl�zko st�edu zubu a opatrn� ho vyp���.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Zahn_13_02"); //Tak si m��e� vz�t zuby vlk�, st�nov�ch p��er a kousavc�.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost vytahov�n� zub� - vlk, sk�et� pes, ch�apavec, kousavec, loveck� pes, st�nov� �elma");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Pot�ebuje� v�c zku�enost�, jinak ti m� v�domosti nebudou k ni�emu.
			PrintScreen	("Nedostatek zku�enostn�ch bod�!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Nejd��v chci vid�t n�jakou rudu. Jak jsem �ekl: v�echno m� svou cenu!
	};
};

func void Org_859_Aidan_Creatures_Fell()
{
	AI_Output (other, self,"Org_859_Aidan_Creatures_Fell_15_00"); //Jak dostanu k��i t�ch p��er?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Nau�it se: stahovat ko�e�inu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_01"); //D�le�it� je k��i stahovat zezadu dop�edu. Jakmile se ti napne, u� je to snadn�. Ko�e�iny se velmi cen�!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Fell_13_02"); //K��e vlk� a st�nov�ch p��er se m��ou pou��t na od�v. Kdy� prohl�dne� ko�e�inu zabit�ho zv��ete, hned pozn�, jestli ji p�jde pou��t nebo ne. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost stahov�n� ko�e�iny - vlk, sk�et� pes, ch�apavec, kousavec, loveck� pes, st�nov� �elma, trol");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Pot�ebuje� v�c zku�enost�, jinak ti m� v�domosti nebudou k ni�emu.
			PrintScreen	("Nedostatek zku�enostn�ch bod�!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Nejd��v chci vid�t n�jakou rudu. Jak jsem �ekl: v�echno m� svou cenu!
	};
};

func void Org_859_Aidan_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nau�it se: vytahovat dr�py", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_859_Aidan_Creatures_Kralle_15_00"); //Uka� mi, jak dostanu dr�py!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_01"); //Je to v podstat� velmi jednoduch�, pokud v� jak na to. Ohne� dr�py dop�edu - nikdy ne dozadu - ale NESM͊ je vytahovat!
			AI_Output (self, other,"Org_859_Aidan_Creatures_Kralle_13_02"); //Dr�py m��e� dostat hlavn� z je�t�rek. Te� u� v�, jak vz�t z p��er dr�py.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost vytahov�n� dr�p� - je�t�rka, ch�apavec, ��havec, kousavec, b�itvoun");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Pot�ebuje� v�c zku�enost�, jinak ti m� v�domosti nebudou k ni�emu.
			PrintScreen	("Nedostatek zku�enostn�ch bod�!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Nejd��v chci vid�t n�jakou rudu. Jak jsem �ekl: v�echno m� svou cenu!
	};
};

func void Org_859_Aidan_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Nau�it se: stahovat plaz� k��i", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_859_Aidan_Creatures_Haut_15_00"); //Na co mus�m d�vat pozor, kdy� stahuji plaz� k��i?
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_01"); //Jedin� plazi, kte�� jsou k tomuhle ��elu vhodn�, jsou ��havci a mo��lov� �raloci.
			AI_Output (self, other,"Org_859_Aidan_Creatures_Haut_13_02"); //Kdy� na��zne� k��i po stran�ch, sloupne se sama. Te� u� bys m�l um�t stahovat plazy.
				
			Knows_GetHide = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost stahov�n� plaz� - ��havec, mo��lov� �ralok");
		}
		else
		{
			AI_Output (self, other,"Org_859_Aidan_Creatures_KEINE_LP_13_00"); //Pot�ebuje� v�c zku�enost�, jinak ti m� v�domosti nebudou k ni�emu.
			PrintScreen	("Nedostatek zku�enostn�ch bod�!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_859_Aidan_Creatures_KEIN_ERZ_13_00"); //Nejd��v chci vid�t n�jakou rudu. Jak jsem �ekl: v�echno m� svou cenu!
	};
};
