// *************************************************************************
// 									Kapitel 1
// *************************************************************************


// *************************************************************************
// 									EXIT
// *************************************************************************

INSTANCE Info_Vlk_4_EXIT(C_INFO)
{
	// npc wird in B_AssignAmbientInfos_Vlk_4 (s.u.) jeweils gesetzt
	nr			= 999;
	condition	= Info_Vlk_4_EXIT_Condition;
	information	= Info_Vlk_4_EXIT_Info;
	permanent	= 1;
	description = "KONIEC";
};                       

FUNC INT Info_Vlk_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_EXIT_Info()
{	
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00"); //Dzi�ki! Trzymaj si�!
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01"); //Uwa�aj na siebie, ch�opcze.
	AI_StopProcessInfos	(self);
};

// *************************************************************************
// 								Einer von Euch werden
// *************************************************************************

INSTANCE Info_Vlk_4_EinerVonEuchWerden (C_INFO) // E1
{
	nr			= 4;
	condition	= Info_Vlk_4_EinerVonEuchWerden_Condition;
	information	= Info_Vlk_4_EinerVonEuchWerden_Info;
	permanent	= 1;
	description = "Co mam zrobi�, �eby do��czy� do tego obozu?";
};                       

FUNC INT Info_Vlk_4_EinerVonEuchWerden_Condition()
{
	if (Npc_GetTrueGuild(other) == GIL_NONE)
	{
		return TRUE;
	};
};

FUNC VOID Info_Vlk_4_EinerVonEuchWerden_Info()
{
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01"); //Co mam zrobi�, �eby do��czy� do tego obozu?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04"); //To znaczy jako Stra�nik, albo Cie�? To nie takie proste, kolego. Czeka ci� kilka sprawdzian�w zanim stary Thorus pozwoli ci spotka� si� z Gomezem.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02"); //No i musisz przekona� do siebie tutejszych tuz�w. Ale dop�ki nie b�dziesz nale�a� do obozu, ludzie nie b�d� traktowali ci� powa�nie.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03"); //Na twoim miejscu zamieni�bym s�owo z kilkoma Cieniami. Mo�e kt�ry� z nich zechce ci pom�c. Oczywi�cie, je�li dasz mu co� w zamian.
	
	var C_NPC Thorus;		Thorus 	= Hlp_GetNpc(GRD_200_Thorus);
	Thorus.aivar[AIV_FINDABLE] = TRUE;
};

// *************************************************************************
// 							Wichtige Personen
// *************************************************************************

INSTANCE Info_Vlk_4_WichtigePersonen(C_INFO)
{
	nr			= 3;
	condition	= Info_Vlk_4_WichtigePersonen_Condition;
	information	= Info_Vlk_4_WichtigePersonen_Info;
	permanent	= 1;
	description = "Kogo warto tutaj pozna�?";
};                       

FUNC INT Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00"); //Kogo warto tutaj pozna�?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01"); //Jako nowy powiniene� dba� o dobre stosunki z Gravo. Mo�e si� wydawa� zwyk�ym Kopaczem, ale potrafi sobie radzi� nawet z Magnatami.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02"); //Jak podpadniesz kiedy� ludziom Gomeza, on mo�e ci� wyci�gn�� z k�opot�w.
};

// *************************************************************************
// 								Das Lager (Orts-Infos)
// *************************************************************************

INSTANCE Info_Vlk_4_DasLager(C_INFO)
{
	nr			= 2;
	condition	= Info_Vlk_4_DasLager_Condition;
	information	= Info_Vlk_4_DasLager_Info;
	permanent	= 1;
	description = "Co warto tutaj zobaczy�?";
};                       

FUNC INT Info_Vlk_4_DasLager_Condition()
{	
	if (Npc_GetTrueGuild (hero) == GIL_NONE)
	{
		return 1;
	};
};
FUNC VOID Info_Vlk_4_DasLager_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00"); //Co warto tutaj zobaczy�?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01"); //Je�li nie masz ochoty harowa� w kopalni, trzymaj si� terenu pomi�dzy p�nocn� bram� a bram� zamkow�.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02"); //Jak b�dziesz mia� szcz�cie, Thorus lub Diego mog� ci� o co� poprosi�. Wyrobienie sobie chod�w u zaufanych ludzi Gomeza mo�e ci tylko wyj�� na dobre.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03"); //Albo mo�e wpadniesz na jakiego� maga. Czasem prosz� ludzi o r�ne drobiazgi. I dobrze p�ac�.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04"); //Magowie opuszczaj� czasem zamek? Kiedy?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05"); //Sk�d mam wiedzie�? Spytaj ludzi, kt�rzy tam mieszkaj�.
};

// *************************************************************************
// 									Die Lage
// *************************************************************************

INSTANCE Info_Vlk_4_DieLage(C_INFO) // E1
{
	nr			= 1;
	condition	= Info_Vlk_4_DieLage_Condition;
	information	= Info_Vlk_4_DieLage_Info;
	permanent	= 1;
	description = "Co s�ycha�?";
};                       

FUNC INT Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00"); //Co s�ycha�?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01"); //To samo, co 20 lat temu. Nic si� nie zmieni�o od tej pory.
};
	
// *************************************************************************
// -------------------------------------------------------------------------

FUNC VOID B_AssignAmbientInfos_Vlk_4(var c_NPC slf)
{
	B_AssignFindNpc_OC(slf);
	
	Info_Vlk_4_EXIT.npc					= Hlp_GetInstanceID(slf);
	Info_Vlk_4_EinerVonEuchWerden.npc	= Hlp_GetInstanceID(slf);
	Info_Vlk_4_WichtigePersonen.npc		= Hlp_GetInstanceID(slf);
	Info_Vlk_4_DasLager.npc				= Hlp_GetInstanceID(slf);
	Info_Vlk_4_DieLage.npc				= Hlp_GetInstanceID(slf);
};
