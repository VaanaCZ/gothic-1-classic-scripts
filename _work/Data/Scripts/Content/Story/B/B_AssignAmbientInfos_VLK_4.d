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
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00"); //Dziêki! Trzymaj siê!
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01"); //Uwa¿aj na siebie, ch³opcze.
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
	description = "Co mam zrobiæ, ¿eby do³¹czyæ do tego obozu?";
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
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01"); //Co mam zrobiæ, ¿eby do³¹czyæ do tego obozu?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04"); //To znaczy jako Stra¿nik, albo Cieñ? To nie takie proste, kolego. Czeka ciê kilka sprawdzianów zanim stary Thorus pozwoli ci spotkaæ siê z Gomezem.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02"); //No i musisz przekonaæ do siebie tutejszych tuzów. Ale dopóki nie bêdziesz nale¿a³ do obozu, ludzie nie bêd¹ traktowali ciê powa¿nie.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03"); //Na twoim miejscu zamieni³bym s³owo z kilkoma Cieniami. Mo¿e któryœ z nich zechce ci pomóc. Oczywiœcie, jeœli dasz mu coœ w zamian.
	
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
	description = "Kogo warto tutaj poznaæ?";
};                       

FUNC INT Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00"); //Kogo warto tutaj poznaæ?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01"); //Jako nowy powinieneœ dbaæ o dobre stosunki z Gravo. Mo¿e siê wydawaæ zwyk³ym Kopaczem, ale potrafi sobie radziæ nawet z Magnatami.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02"); //Jak podpadniesz kiedyœ ludziom Gomeza, on mo¿e ciê wyci¹gn¹æ z k³opotów.
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
	description = "Co warto tutaj zobaczyæ?";
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
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00"); //Co warto tutaj zobaczyæ?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01"); //Jeœli nie masz ochoty harowaæ w kopalni, trzymaj siê terenu pomiêdzy pó³nocn¹ bram¹ a bram¹ zamkow¹.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02"); //Jak bêdziesz mia³ szczêœcie, Thorus lub Diego mog¹ ciê o coœ poprosiæ. Wyrobienie sobie chodów u zaufanych ludzi Gomeza mo¿e ci tylko wyjœæ na dobre.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03"); //Albo mo¿e wpadniesz na jakiegoœ maga. Czasem prosz¹ ludzi o ró¿ne drobiazgi. I dobrze p³ac¹.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04"); //Magowie opuszczaj¹ czasem zamek? Kiedy?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05"); //Sk¹d mam wiedzieæ? Spytaj ludzi, którzy tam mieszkaj¹.
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
	description = "Co s³ychaæ?";
};                       

FUNC INT Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00"); //Co s³ychaæ?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01"); //To samo, co 20 lat temu. Nic siê nie zmieni³o od tej pory.
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
