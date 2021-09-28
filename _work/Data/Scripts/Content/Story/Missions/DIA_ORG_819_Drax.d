
// **************************************************
//						 EXIT 
// **************************************************

instance  Org_819_Drax_Exit (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 999;
	condition	= Org_819_Drax_Exit_Condition;
	information	= Org_819_Drax_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Org_819_Drax_Exit_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					 Ihr jagt hier...
// **************************************************

instance  Org_819_Drax_HuntHere (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_HuntHere_Condition;
	information	= Org_819_Drax_HuntHere_Info;
	permanent	= 0;
	description = "Ty tady lov�, �e jo?";
};                       

FUNC int  Org_819_Drax_HuntHere_Condition()
{
	return 1;
};

FUNC VOID  Org_819_Drax_HuntHere_Info()
{
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_00"); //Ty tady lov�, �e jo?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_01"); //Vypad� to tak... co chce�?
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_02"); //M��e� mi d�t n�jak� rady pro lov?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_03"); //M��u t� nau�it p�r v�c� - ale v�echno m� svoji cenu.
	AI_Output (other, self,"Org_819_Drax_HuntHere_15_04"); //Kolik by to st�lo?
	AI_Output (self, other,"Org_819_Drax_HuntHere_06_05"); //Po��dn� dou�ek piva by pro za��tek mohl sta�it - pak se uvid�.
};

// **************************************************
//				Scavenger jagen + Bier
// **************************************************
	var int drax_bierbekommen;
	var int drax_Lehrer_frei;
// **************************************************

instance  Org_819_Drax_Scavenger (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Scavenger_Condition;
	information	= Org_819_Drax_Scavenger_Info;
	permanent	= 1;
	description = "Tady je, vezmi si pivo a vypr�v�j mi o lovu.";
};                       

FUNC int  Org_819_Drax_Scavenger_Condition()
{
	if ( Npc_KnowsInfo(hero,Org_819_Drax_HuntHere) && (drax_bierbekommen==FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Scavenger_Info()
{
	if (Npc_HasItems(other,itfobeer)>0)
	{
		B_GiveInvItems	(other, self, itfobeer,1);
	
		AI_Output	(other, self,"Org_819_Drax_Scavenger_15_00"); //Tady je, vezmi si pivo a vypr�v�j mi o lovu.
		if ( C_BodystateContains(self, BS_SIT) )
		{
			AI_StandUp		(self);
			AI_TurnToNpc	(self, hero);
		};
		AI_UseItem	(self,	ItFobeer);
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_01"); //Mrcho�routy, tak ��k�me t�m velk�m pt�k�m, je nejlep�� lovit jednoho po druh�m. Vyl�kat jednoho mrcho�routa z hejna je snadn�.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_02"); //Kdy� p�ijde� moc bl�zko, jsou podr�d�n�. Za chvilku vyraz� tv�m sm�rem. V tom okam�iku bys na n� m�l �ekat s p�ipravenou zbran�.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_03"); //Kdy� se ti tu potvoru poda�� srazit, je�t� ne� na tebe za�to��, mus� b�t po��d ve st�ehu, abys ji pak mohl dorazit, a s�m se p�itom nezranil.
		AI_Output	(self, other,"Org_819_Drax_Scavenger_06_04"); //Pokud ude�� prvn� TY - v�born� - ale nenech to ud�lat je.
		drax_bierbekommen = TRUE;
	}
	else
	{
		AI_Output (other, self,"Org_819_Drax_Scavenger_KEIN_BIER_15_00"); //Nem�m ��dn� pivo.
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_01"); //Tak b� a n�jak� se�e�. Takhle lacino u� nikdy k ��dn� dobr� rad� nep�ijde�. A a� p�ijde� p��t�, p�ines tak� n�jakou rudu!
		AI_Output (self, other,"Org_819_Drax_Scavenger_KEIN_BIER_06_02"); //M��u ti d�t p�r informac� o zv��i, ale bude t� to n�co st�t!
	};	
	drax_Lehrer_frei = TRUE;
	
	Log_CreateTopic	(GE_TeacherOW, LOG_NOTE);
	B_LogEntry		(GE_TeacherOW,"Bandita Drax mi nab�dl, �e m� nau�� kuchat zv��, kdy� mu zaplat�m, o� po��d�. V�t�inou lov� na cest� z tr�i�t� do Star�ho t�bora.");
};

// **************************************************
//				Animaltrophies
// **************************************************

instance  Org_819_Drax_Creatures (C_INFO)
{
	npc			= Org_819_Drax;
	nr			= 1;
	condition	= Org_819_Drax_Creatures_Condition;
	information	= Org_819_Drax_Creatures_Info;
	permanent	= 1;
	description = "Co mi je�t� m��e� ��ci o lovu?";
};                       

FUNC int  Org_819_Drax_Creatures_Condition()
{
	if ( Drax_Lehrer_frei == TRUE )
	&& ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		return 1;
	};
};

FUNC VOID  Org_819_Drax_Creatures_Info()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_15_00"); //Co mi je�t� m��e� ��ci o lovu?
	
	if ( (Knows_GetTeeth == FALSE)||(Knows_GetFur == FALSE)||(Knows_GetClaws == FALSE)||(Knows_GetHide == FALSE) )
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_06_01"); //Spoustu - ale bude t� to st�t mnohem v�c ne� pivo.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_02"); //Kdy� v� jak, m��e� si z t�ch p��er vz�t zuby, dr�py a k��i. Je t�k� je z�skat, ale maj� velkou cenu.
		AI_Output (self, other,"Org_819_Drax_Creatures_06_03"); //Ka�d� obchodn�k ty v�ci s tebou vym�n�.
		
		Info_ClearChoices(Org_819_Drax_Creatures);
		Info_AddChoice   (Org_819_Drax_Creatures, DIALOG_BACK 													,Org_819_Drax_Creatures_BACK);
		Info_AddChoice   (Org_819_Drax_Creatures,"Po�aduje� toho za sv� rady moc.",Org_819_Drax_Creatures_PrettyMuch);
		if (Knows_GetTeeth == FALSE)
		{
			Info_AddChoice   (Org_819_Drax_Creatures,"Vyjmout zuby (cena: 1 dovednostn� bod, 50 nuget�)",Org_819_Drax_Creatures_Zahn);
		};
		if (Knows_GetFur == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"St�hnout ko�e�inu (cena: 1 dovednostn� bod, 100 nuget�)",Org_819_Drax_Creatures_Fell);
		};
		if (Knows_GetClaws == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"Vyjmout dr�py (cena: 1 dovednostn� bod, 50 nuget�)",Org_819_Drax_Creatures_Kralle);
		};
		if (Knows_GetHide == FALSE)
		{
			Info_AddChoice	 (Org_819_Drax_Creatures,"St�hnout plaza (cena: 1 dovednostn� bod, 100 nuget�)",Org_819_Drax_Creatures_Haut);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_TaughtAll_06_00"); //�ekl jsem ti v�echno, co v�m.
	};
};

func void Org_819_Drax_Creatures_BACK()
{
	Info_ClearChoices(Org_819_Drax_Creatures);
};

func void Org_819_Drax_Creatures_PrettyMuch()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_PrettyMuch_15_00"); //Po�aduje� toho za sv� rady moc.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_01"); //Mo�n�, ale ty na nich m��e� vyd�lat daleko v�c.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_02"); //V�echna ta zv��, kterou zabije�, ti shnije, kdy� nebude� v�d�t, jak ji roz�ezat.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_03"); //T�m ztrat� mo�nost st�hnout ji z k��e a za vysokou cenu prodat ko�e�inu.
	AI_Output (self, other,"Org_819_Drax_Creatures_PrettyMuch_06_04"); //J� b�t tebou, pokusil bych si doplnit v�domosti, jak nejv�ce to p�jde.
};

func void Org_819_Drax_Creatures_Zahn()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Zahn_15_00"); //Jak dostanu zuby?
	
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nau�it se: vytahovat zuby", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
					
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_01"); //Nejd�le�it�j�� je zajistit, aby se zuby net��tily. Tomu se vyhne� tak, �e vlo�� n�� bl�zko st�edu zubu a opatrn� ho vyp���.
			AI_Output (self, other,"Org_819_Drax_Creatures_Zahn_06_02"); //Tak si m��e� vz�t zuby vlk�, st�nov�ch p��er a kousavc�.
			
			Knows_GetTeeth = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost vytahov�n� zub� - vlk, sk�et� pes, ch�apavec, kousavec, loveck� pes, st�nov� �elma");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_00"); //Mus� je�t� z�skat zku�enosti, jinak ti m� rady nebudou k ni�emu.
			PrintScreen	("Nedostatek zku�enostn�ch bod�!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_00"); //Nejd��v chci vid�t n�jakou rudu. Jak jsem �ekl: v�echno m� svou cenu!
	};
};

func void Org_819_Drax_Creatures_Fell()
{
	AI_Output (other, self,"Org_819_Drax_Creatures_Fell_15_00"); //Jak dostanu k��i t�ch p��er?
	
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self, itminugget,100);
			
			PrintScreen	("Nau�it se: stahovat ko�e�inu", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_01"); //D�le�it� je k��i stahovat zezadu dop�edu. Jakmile se ti napne, u� je to snadn�. Ko�e�iny se velmi cen�!
			AI_Output (self, other,"Org_819_Drax_Creatures_Fell_06_02"); //K��e vlk� a st�nov�ch p��er se m��ou pou��t na od�v. Kdy� prohl�dne� ko�e�inu zabit�ho zv��ete, hned pozn�, jestli ji p�jde pou��t, nebo ne. 
			
			Knows_GetFur = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost stahov�n� ko�e�iny - vlk, sk�et� pes, ch�apavec, kousavec, loveck� pes, st�nov� �elma, trol");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_01"); //Pot�ebuje� v�c zku�enost�, jinak ti m� v�domosti nebudou k ni�emu.
			PrintScreen	("Nedostatek zku�enostn�ch bod�!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_01"); //Nejd��v chci vid�t n�jakou rudu. Jak jsem �ekl: v�echno m� svou cenu!
	};
};

func void Org_819_Drax_Creatures_Kralle()
{
	if (Npc_HasItems(other,itminugget)>=50)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
			
			B_GiveInvItems	(other, self,itminugget,50);
			
			PrintScreen	("Nau�it se: vytahovat dr�py", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
			
			AI_Output (other, self,"Org_819_Drax_Creatures_Kralle_15_00"); //Uka� mi, jak dostanu dr�py!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_01"); //Je to v podstat� velmi jednoduch�, pokud v� jak na to. Ohne� dr�py dop�edu - nikdy ne dozadu - ale NESM͊ je vytahovat!
			AI_Output (self, other,"Org_819_Drax_Creatures_Kralle_06_02"); //Dr�py m��e� dostat hlavn� z je�t�rek. Te� u� v�, z kter�ch p��er dr�py br�t.
			
			Knows_GetClaws = TRUE;
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost vytahov�n� dr�p� - je�t�rka, ch�apavec, ��havec, kousavec, b�itvoun");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_02"); //Pot�ebuje� v�c zku�enost�, jinak ti m� v�domosti nebudou k ni�emu.
			PrintScreen	("Nedostatek zku�enostn�ch bod�!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_02"); //Nejd��v chci vid�t n�jakou rudu. Jak jsem �ekl: v�echno m� svou cenu!
	};
};

func void Org_819_Drax_Creatures_Haut()
{
	if (Npc_HasItems(other,itminugget)>=100)
	{
		if (other.lp >= 1)
		{
			other.lp = other.lp - 1;
						
			B_GiveInvItems	(other, self,itminugget,100);
			
			PrintScreen	("Nau�it se: stahovat plaz� k��i", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
				
			AI_Output (other, self,"Org_819_Drax_Creatures_Haut_15_00"); //Na co mus�m d�vat pozor, kdy� stahuji plaz� k��i?
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_01"); //Jedin� plazi, kte�� jsou k tomuhle ��elu vhodn�, jsou ��havci a mo��lov� �raloci.
			AI_Output (self, other,"Org_819_Drax_Creatures_Haut_06_02"); //Kdy� na��zne� k��i po stran�ch, sloupne se sama. Te� u� bys m�l um�t stahovat plazy.
				
			Knows_GetHide = TRUE;
			
			Log_CreateTopic (GE_AnimalTrophies,LOG_NOTE);
			B_LogEntry (GE_AnimalTrophies,"Znalost stahov�n� plaz� - ��havec, mo��lov� �ralok");
		}
		else
		{
			AI_Output (self, other,"Org_819_Drax_Creatures_KEINE_LP_06_03"); //Pot�ebuje� v�c zku�enost�, jinak ti m� v�domosti nebudou k ni�emu.
			PrintScreen	("Nedostatek zku�enostn�ch bod�!", -1,-1,"FONT_OLD_20_WHITE.TGA",2);
		};
	}
	else
	{
		AI_Output (self, other,"Org_819_Drax_Creatures_KEIN_ERZ_06_03"); //Nejd��v chci vid�t n�jakou rudu. Jak jsem �ekl: v�echno m� svou cenu!
	};
};
