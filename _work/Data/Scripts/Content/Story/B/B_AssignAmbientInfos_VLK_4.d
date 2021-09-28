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
	description = "KONEC";
};                       

FUNC INT Info_Vlk_4_EXIT_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_EXIT_Info()
{	
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_00"); //D�ky. Hodn� �t�st�.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_01"); //Hlavu vzh�ru, hochu.
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
	description = "Co mus�m ud�lat, abych se mohl p�idat k t�boru?";
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
	AI_Output(other,self,"Info_Vlk_4_EinerVonEuchWerden_15_01"); //Co mus�m ud�lat, abych se mohl p�idat k t�boru?
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_04"); //Mysl� jako St�n nebo jako str�ce? To nebude snadn�, �lov��e. Ne� t� star� Thorus pust� za Gomezem, bude� muset slo�it p�r zkou�ek.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_02"); //A bude� tu muset dob�e vyj�t s lidmi Ale dokud nebude� pat�it k n�jak�mu t�boru, nikdo t� nebude br�t v�n�.
	AI_Output(self,other,"Info_Vlk_4_EinerVonEuchWerden_04_03"); //B�t tebou, dal bych �e� s n�kter�m ze St�n�. Mo�n� bys na�el n�koho, kdo by ti mohl pomoci. Samoz�ejm� kdy� nab�dne� n�co na opl�tku.
	
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
	description = "Je tu n�co zvl�tn�ho, co bych m�l v�d�t?";
};                       

FUNC INT Info_Vlk_4_WichtigePersonen_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_WichtigePersonen_Info()
{
	AI_Output(other,self,"Info_Vlk_4_WichtigePersonen_15_00"); //Je tu n�kdo d�le�it�, koho bych m�l zn�t?
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_01"); //Kdy� jsi tu nov�, nem�l by ses dostat do k��ku s Gravem. I kdy� je jenom kop��, v�, jak jednat s Rudobarony.
	AI_Output(self,other,"Info_Vlk_4_WichtigePersonen_04_02"); //Pokud se dostane� do probl�m� s n�k�m z Gomezovy party, m��e ti z toho pomoci ven.
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
	description = "Kter� m�sta bych tady m�l zn�t?";
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
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_00"); //Kter� m�sta bych tady m�l zn�t?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_01"); //Jestli nem� chu� kopat v dolech, m�l by ses porozhl�dnout mezi severn� a hradn� br�nou.
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_02"); //Kdy� bude� m�t �t�st�, Thorus nebo Diego by ti mohli navrhnout n�co, co bys pro n� mohl ud�lat - tak bude� m�t �anci dostat se na jejich stranu. Ur�it� nen� �patn� pat�it ke Gomezov�m lidem..
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_03"); //Nebo by ses m�l setkat s m�gy. Ob�as pot�ebuj� vy��dit n�jak� obch�zky. A plat� v�dycky dob�e.
	AI_Output(other,self,"Info_Vlk_4_DasLager_15_04"); //M�gov� vych�zej� z hradu? A kdy?
	AI_Output(self,other,"Info_Vlk_4_DasLager_04_05"); //Co j� v�m.Zeptej se lid�, kte�� tam �ij�.
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
	description = "Jsi v po��dku?";
};                       

FUNC INT Info_Vlk_4_DieLage_Condition()
{
	return 1;
};

FUNC VOID Info_Vlk_4_DieLage_Info()
{
	AI_Output(other,self,"Info_Vlk_4_DieLage_15_00"); //Jsi v po��dku?
	AI_Output(self,other,"Info_Vlk_4_DieLage_04_01"); //Tak jako p�ed dvaceti lety. Nic se za tu dobu nezm�nilo.
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
