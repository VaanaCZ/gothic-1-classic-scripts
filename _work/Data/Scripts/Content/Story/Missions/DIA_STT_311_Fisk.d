// **************************************************
//						 EXIT 
// **************************************************

instance  Stt_311_Fisk_Exit (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 999;
	condition	= Stt_311_Fisk_Exit_Condition;
	information	= Stt_311_Fisk_Exit_Info;
	permanent	= 1;
	description = DIALOG_ENDE;
};                       

FUNC int  Stt_311_Fisk_Exit_Condition()
{
	return 1;
};

FUNC VOID  Stt_311_Fisk_Exit_Info()
{
	AI_StopProcessInfos	(self);
};

// **************************************************
//					First
// **************************************************

instance  Stt_311_Fisk_First (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 1;
	condition	= Stt_311_Fisk_First_Condition;
	information	= Stt_311_Fisk_First_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Stt_311_Fisk_First_Condition()
{
		return 1;
};

FUNC VOID  Stt_311_Fisk_First_Info()
{
	AI_Output		(self, other,"Stt_311_Fisk_First_12_00"); //Hej, �lov��e. J� jsem Fisk. Obchoduju se zbo��m v�eho druhu. Jestli bude� kdykoliv a cokoliv pot�ebovat - tady jsi na spr�vn�m m�st�.
	Log_CreateTopic (GE_TraderOC,LOG_NOTE);
	B_LogEntry		(GE_TraderOC,"Fisk, jeden ze St�n�, obchoduje se v��m zbo��m, zejm�na v�ak se ZBRAN�MI. B�v� obvykle na tr�i�ti."); 
	
};

// **************************************************
//					Handeln
// **************************************************

instance  Stt_311_Fisk_Trade (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 800;
	condition	= Stt_311_Fisk_Trade_Condition;
	information	= Stt_311_Fisk_Trade_Info;
	permanent	= 1;
	description = "Uka� mi svoje zbo��.";
	trade		= 1;
};                       

FUNC int  Stt_311_Fisk_Trade_Condition()
{
	return 1;
};

FUNC VOID  Stt_311_Fisk_Trade_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_Trade_15_00"); //Uka� mi svoje zbo��.
};



instance  Stt_311_Fisk_WhistlersSword (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 801;
	condition	= Stt_311_Fisk_WhistlersSword_Condition;
	information	= Stt_311_Fisk_WhistlersSword_Info;
	permanent	= 1;
	description = "Cht�l bych koupit me�. Ne ale n�jak� oby�ejn�. Cht�l bych n�jak� se zdoben�m.";
};                       

FUNC int  Stt_311_Fisk_WhistlersSword_Condition()
{
	if ( (Fisk_ForgetSword==FALSE) && (Whistler_BuyMySword == LOG_RUNNING) && (Fisk_SwordSold == FALSE)  )
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_WhistlersSword_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_15_00"); //Cht�l bych koupit me�. Ne ale n�jak� oby�ejn�. Cht�l bych n�jak� se zdoben�m.
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_12_01"); //M�m jeden takov�. St�n, kter� ho cht�l koupit, u� ke mn� nikdy znovu nep�i�el.
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_12_02"); //Bude to 110 nuget�, bere�?
	Fisk_SCknows110 = TRUE;

	Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
	Info_AddChoice		(Stt_311_Fisk_WhistlersSword,"Mo�n� pozd�ji.",Stt_311_Fisk_WhistlersSword_BACK);
	Info_AddChoice		(Stt_311_Fisk_WhistlersSword,"Whistlerovi jsi ho cht�l prodat za sto...",Stt_311_Fisk_WhistlersSword_Fault);
	Info_AddChoice		(Stt_311_Fisk_WhistlersSword,"Ano, vezmu si ho.",Stt_311_Fisk_WhistlersSword_TakeIt);
};

func void Stt_311_Fisk_WhistlersSword_BACK()
{
	AI_Output (other, self,"Org_826_Mordrag_WhistlersSword_BACK_15_00"); //Mo�n� pozd�ji.
	Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
};

func void Stt_311_Fisk_WhistlersSword_Fault()
{
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_Fault_15_00"); //Whistlerovi jsi ho cht�l prodat za sto...
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_Fault_12_01"); //Ach! Po�kej... pravda, m�lem jsem ti �ekl moc m�lo! Myslel jsem samoz�ejm� 500.
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_Fault_15_02"); //P�t set?
	AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_Fault_12_03"); //P��li� m�lo? Rad�ji bys za 1000? T�m l�p pro m�. Dob�e, pop�em��l�m o tom - rad�ji si ho nech�m!
	
	Fisk_ForgetSword = TRUE;
	Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
};

func void Stt_311_Fisk_WhistlersSword_TakeIt()
{
	AI_Output (other, self,"Stt_311_Fisk_WhistlersSword_TakeIt_15_00"); //Ano, vezmu si ho.
	
	if (Npc_HasItems(other,itminugget) >= 110)
	{
		AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_01"); //Ud�lal jsi dobr� obchod!
		B_GiveInvItems(other, self,itminugget,110);
		CreateInvItem (self,Whistlers_Schwert);
		B_GiveInvItems(self, other,Whistlers_Schwert,1);
		Info_ClearChoices	(Stt_311_Fisk_WhistlersSword );
		
		Fisk_SwordSold = TRUE;
	}
	else
	{
		AI_Output (self, other,"Stt_311_Fisk_WhistlersSword_TakeIt_12_02"); //M�m obavy, �e nem� dost rudy. Budu ti ten me� je�t� n�jak� �as dr�et, ale nebudu �ekat moc dlouho!
	};
};

// **************************************************
//					Forget Sword
// **************************************************

instance  Stt_311_Fisk_ForgetSword (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 800;
	condition	= Stt_311_Fisk_ForgetSword_Condition;
	information	= Stt_311_Fisk_ForgetSword_Info;
	permanent	= 1;
	description = "O Whistlerov� me�i...";
};                       

FUNC int  Stt_311_Fisk_ForgetSword_Condition()
{
	if (Fisk_ForgetSword==TRUE)
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_ForgetSword_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_ForgetSword_15_00"); //Poj�me si je�t� promluvit o tom Whistlerov� me�i.
	AI_Output (self, other,"Stt_311_Fisk_ForgetSword_12_01"); //M��e� mu ��ci, �e sv�j me� nikdy nedostane.
};

// **************************************************
//					MordragKO
// **************************************************
	var int Fisk_GetNewHehler;
// **************************************************

instance  Stt_311_Fisk_MordragKO (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 800;
	condition	= Stt_311_Fisk_MordragKO_Condition;
	information	= Stt_311_Fisk_MordragKO_Info;
	permanent	= 0;
	important 	= 1;
};                       

FUNC int  Stt_311_Fisk_MordragKO_Condition()
{
	if (MordragKO_HauAb == TRUE)  
	&& (Npc_GetTrueGuild(hero) == GIL_NONE)
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_MordragKO_Info()
{
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_12_00"); //Hej, ty!
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_12_01"); //Mordrag byl jeden z m�ch nejd�le�it�j��ch dodavatel�, ty idiote!
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_12_02"); //Jestli se chce� p�idat k na�emu t�boru, bude pro tebe velmi obt�n� z�skat M�J hlas!

	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	Info_AddChoice   (Stt_311_Fisk_MordragKO,"Obchoduje� s majetkem Rudobaron�! To bude Thoruse zaj�mat...",Stt_311_Fisk_MordragKO_Petze);
	Info_AddChoice   (Stt_311_Fisk_MordragKO,"Klid! Mo�n� to m��u n�jak napravit, ne?",Stt_311_Fisk_MordragKO_Relax);
	Info_AddChoice	 (Stt_311_Fisk_MordragKO,"Pak mi polib zadek!",Stt_311_Fisk_MordragKO_FuckOff);
};

func void Stt_311_Fisk_MordragKO_Relax()
{
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_Relax_15_00"); //Klid! Mo�n� to m��u n�jak napravit, ne?
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_Relax_12_01"); //Nev�m ale, jak bys to cht�l ud�lat. Leda�e bys mi na�el nov�ho p�echov�va�e v�c� z Nov�ho t�bora!
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_Relax_15_02"); //Jak si mysl�, �e bych n�koho takov�ho na�el?
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_Relax_12_03"); //Jak jsem �ekl, nev���m, �e bys to m�l u m� n�kdy dobr�.
	
	Log_CreateTopic(CH1_FiskNewDealer, LOG_MISSION);
	Log_SetTopicStatus(CH1_FiskNewDealer, LOG_RUNNING);
	B_LogEntry( CH1_FiskNewDealer,"Pot�, co jsem vyhnal Mordraga, chce po m� obchodn�k Fisk z tr�i�t�, abych mu na�el nov�ho p�echov�va�e.");
	
	Fisk_GetNewHehler = LOG_RUNNING;
};

func void Stt_311_Fisk_MordragKO_FuckOff()
{
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_FuckOff_15_00"); //Pak mi polib zadek!
	Info_ClearChoices(Stt_311_Fisk_MordragKO);
	
	AI_StopProcessInfos	(self);
};

func void Stt_311_Fisk_MordragKO_Petze()
{
	AI_Output (other, self,"Stt_311_Fisk_MordragKO_Petze_15_00"); //Obchoduje� s v�cmi, kter� pat�� Rudobaron�m. Thoruse to bude zaj�mat.
	AI_Output (self, other,"Stt_311_Fisk_MordragKO_Petze_12_01"); //Tak takhle ne, mlad�ku!
};

// **************************************************
//					New Hehler
// **************************************************

instance  Stt_311_Fisk_HehlerSuccess (C_INFO)
{
	npc			= Stt_311_Fisk;
	nr			= 10;
	condition	= Stt_311_Fisk_HehlerSuccess_Condition;
	information	= Stt_311_Fisk_HehlerSuccess_Info;
	permanent	= 0;
	description	= "M�m n�koho z Nov�ho t�bora, kdo by cht�l s tebou obchodovat.";
};                       

FUNC int  Stt_311_Fisk_HehlerSuccess_Condition()
{
	if ( (Fisk_GetNewHehler==LOG_RUNNING) && (Npc_KnowsInfo(hero,Org_843_Sharky_Fisk)))  
	{
		return 1;
	};
};

FUNC VOID  Stt_311_Fisk_HehlerSuccess_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_HehlerSuccess_15_00"); //M�m n�koho z Nov�ho t�bora, kdo by cht�l s tebou obchodovat.
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_01"); //Ne! Kdo by si to byl pomyslel. Vypad� to, �e se tu pokou�� b�t obl�ben�...
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_02"); //Vypad�, �e se ti to taky povedlo! Kdo to je?
	AI_Output (other, self,"Stt_311_Fisk_HehlerSuccess_15_03"); //Jmenuje se Sharky.
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_04"); //Sharky? Je je�t� hor�� ne� Mordrag.
	AI_Output (self, other,"Stt_311_Fisk_HehlerSuccess_12_05"); //Co se t��e Diega... nemus� u� m�t obavy.
	
	Fisk_GetNewHehler = LOG_SUCCESS;
	B_GiveXP(XP_fiskdealer);

	Log_SetTopicStatus(CH1_FiskNewDealer, LOG_SUCCESS);
	B_LogEntry( CH1_FiskNewDealer,"Fisk je spokojen�, proto�e Sharky p�evzal Mordragovu pr�ci.");
};
/*------------------------------------------------------------------------
							R�STUNG									
------------------------------------------------------------------------*/

instance  Stt_311_Fisk_ARMOR (C_INFO)
{
	npc				= Stt_311_Fisk;
	condition		= Stt_311_Fisk_ARMOR_Condition;
	information		= Stt_311_Fisk_ARMOR_Info;
	important		= 0;
	permanent		= 1;
	description		= "M� pro m� n�jakou zbroj?"; 
};

FUNC int  Stt_311_Fisk_ARMOR_Condition()
{	
	if (Kapitel < 2)
	&& (Npc_KnowsInfo (hero, Stt_311_Fisk_First))
	{
		return TRUE;
	};

};
FUNC void  Stt_311_Fisk_ARMOR_Info()
{
	AI_Output (other, self,"Stt_311_Fisk_ARMOR_Info_15_01"); //M� pro m� tak� zbroj?
	AI_Output (self, other,"Stt_311_Fisk_ARMOR_Info_12_02"); //Ano, ur�it� bude� spokojen�.
	Info_ClearChoices (Stt_311_Fisk_ARMOR);
	Info_Addchoice (Stt_311_Fisk_ARMOR,DIALOG_BACK,Stt_311_Fisk_ARMOR_BACK);
	Info_Addchoice (Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskLightDiggers,VALUE_VLK_ARMOR_L),Stt_311_Fisk_ARMOR_L);
	Info_Addchoice (Stt_311_Fisk_ARMOR,B_BuildBuyArmorString(NAME_FiskDiggers,VALUE_VLK_ARMOR_M),Stt_311_Fisk_ARMOR_M);

};  

func void Stt_311_Fisk_ARMOR_BACK()
{
	Info_ClearChoices (Stt_311_Fisk_ARMOR);
};

func void Stt_311_Fisk_ARMOR_L()
{
	AI_Output (other, self,"Stt_311_Fisk_ARMOR_L_Info_15_01"); //Dej mi lehk� kop��sk� kalhoty.
	
	if (Npc_HasItems (hero,ItMiNugget) <  VALUE_VLK_ARMOR_L)
	{
		AI_Output (self, other,"Stt_311_Fisk_ARMOR_L_Info_12_02"); //Vra� se, a� bude� m�t dost rudy!
	}
	else
	{
		AI_Output		(self,	other,	"Stt_311_Fisk_ARMOR_L_Info_12_03"); //Dobr� volba!
		B_GiveInvItems	(hero,	self,	ItMinugget, VALUE_VLK_ARMOR_L);
		CreateInvItem	(self,			VLK_ARMOR_L);
		B_GiveInvItems	(self,	hero,	VLK_ARMOR_L, 1);
	};
};

func void Stt_311_Fisk_ARMOR_M()
{
	AI_Output (other, self,"Stt_311_Fisk_ARMOR_M_Info_15_01"); //Dej mi kop��sk� kalhoty.
	if (Npc_HasItems (hero,ItMiNugget) <  VALUE_VLK_ARMOR_M)
	{
		AI_Output (self, other,"Stt_311_Fisk_ARMOR_M_Info_12_02"); //Vra� se, a� bude� m�t dost rudy!
	}
	else
	{
		AI_Output		(self, other,"Stt_311_Fisk_ARMOR_M_Info_12_03"); //Dobr� volba!
		B_GiveInvItems	(hero, self, ItMinugget, VALUE_VLK_ARMOR_M);
		CreateInvItem	(self, VLK_ARMOR_M);
		B_GiveInvItems	(self,hero, VLK_ARMOR_M, 1);
	};
};







