// *********************************************************************
// main menu (startup)
// *********************************************************************

INSTANCE MENU_MAIN(C_MENU_DEF) 
{
	backpic			= MENU_BACK_PIC;
	musictheme		= "SYS_Menu";
	
	items[0]		= "MENUITEM_MAIN_HEADLINE";
	items[1]		= "MENUITEM_MAIN_HEADLINE2";
	items[2]		= "MENUITEM_MAIN_NEWGAME";
	items[3]		= "MENUITEM_MAIN_SAVEGAME_LOAD";	
	items[4]		= "MENUITEM_MAIN_SAVEGAME_SAVE";	
	items[5]		= "MENUITEM_MAIN_RESUME"; 
	items[6]		= "MENUITEM_MAIN_OPTIONS";
	items[7]		= "MENUITEM_MAIN_INTRO"; 
	items[8]		= "MENUITEM_MAIN_CREDITS";	
	items[9]		= "MENUITEM_MAIN_EXIT"; 
	
	defaultOutGame	= 2;	// NEWGAME
	defaultInGame	= 4;	// SAVEGAME
	
	flags = flags | MENU_SHOW_INFO;
};
	
	
const int MENU_MAIN_DY = 550;
const int MENU_MAIN_Y = 2500;

//
// NEW GAME
//

instance MENUITEM_MAIN_NEWGAME(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Nueva partida";
	text[1]		= "Empezar una nueva aventura.";  // Kommentar
	
	// Positionen  und Dimensionen	
	posx		= 0;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*0;
	dimx		= 8100;		dimy		=  750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_CLOSE;
	onSelAction_S[0]= "NEW_GAME";
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER;
};


//
// LOAD & SAVE GAME
//


INSTANCE MENUITEM_MAIN_SAVEGAME_LOAD(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Cargar partida";
	text[1]		=	"Cargar una partida guardada.";  // Kommentar
	
	// Positionen  und Dimensionen	
	posx		=  0;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*1;
	dimx		= 8100;		dimy		=  750;
	// Aktionen
	onSelAction_S[0]= "MENU_SAVEGAME_LOAD";
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER;
};

instance MENUITEM_MAIN_SAVEGAME_SAVE(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Guardar partida";
	text[1]		= "Guardar la partida actual.";  // Kommentar
	
	// Positionen  und Dimensionen
	posx		= 0;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*2;
	dimx		=  8100;	dimy		= 750;
	// Aktionen
	onSelAction_S[0]= "MENU_SAVEGAME_SAVE";
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER | IT_ONLY_IN_GAME;
};


//
// RESUME
//


INSTANCE MENUITEM_MAIN_RESUME(C_MENU_ITEM_DEF)
{
	backpic		=	MENU_ITEM_BACK_PIC;
	text[0]		=	"Continuar";
	text[1]		=   "Continuar la partida actual.";  // Kommentar
	
	// Position und Dimension
	posx		=	0;		posy		=	MENU_MAIN_Y + MENU_MAIN_DY*3;
	dimx		=	8192;	dimy		=	750;
	// Aktionen
	onSelAction[0]	= 	SEL_ACTION_BACK;
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER | IT_ONLY_IN_GAME;
};


//
// OPTIONS, INTRO & CREDITS
//

instance MENUITEM_MAIN_OPTIONS(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Configuración";
	text[1]		= "Ajustar juego, gráficos, sonido, teclado";  // Kommentar
	
	// Positionen  und Dimensionen	
	posx		= 0;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*4;
	dimx		= 8100;		dimy		=  750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	onSelAction_S[0]= "MENU_OPTIONS";
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER;
};


instance MENUITEM_MAIN_INTRO(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Reprod. Intro";
	text[1]		= "Reproducir de nuevo la introducción.";
	// Positionen  und Dimensione	
	posx		= 0;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*5;
	dimx		= 8100;		dimy		=  750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onEventAction[EVENT_EXECUTE] = ShowIntro;
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER;
};

INSTANCE MENUITEM_MAIN_CREDITS(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Créditos";
	text[1]		= "Créditos";  // Kommentar
	
	// Positionen  und Dimensionen	
	posx		= 0;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*6;
	dimx		= 8100;		dimy		=  750;	
	// Aktionen
	onSelAction[0]	= SEL_ACTION_UNDEF;
	onEventAction[EVENT_EXECUTE] = ShowCredits;
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER;
};

//
// EXIT
//


INSTANCE MENUITEM_MAIN_EXIT(C_MENU_ITEM_DEF) 
{
	backpic		= MENU_ITEM_BACK_PIC;
	text[0]		= "Salir de Gothic";
	text[1]		= "Salir del mundo de Gothic.";  // Kommentar
	
	// Positionen  und Dimensionen
	posx		= 0;		posy		= MENU_MAIN_Y + MENU_MAIN_DY*7;	
	dimx		= 8100;		dimy		=  750;
	// Aktionen
	onSelAction[0]	= SEL_ACTION_STARTMENU;
	onSelAction_S[0]= "MENU_LEAVE_GAME";
	// Weitere Eigenschaften
	flags			= flags | IT_TXT_CENTER;
};



//
// Statische Items
//

INSTANCE MENUITEM_MAIN_HEADLINE2(C_MENU_ITEM_DEF) 
{
	backPic		= "menu_gothic.tga";
	// Positionen  und Dimensionen	
	posx		=  250;		posy		=  500;	
	dimx		= 7900;		dimy		= 2300;	
	// Weitere Eigenschaften
	alphaMode 		= "BLEND";	
	alpha			= 255;		
	flags			= flags | IT_TXT_CENTER;
	flags			= flags & ~IT_SELECTABLE;
};

INSTANCE MENUITEM_MAIN_HEADLINE(C_MENU_ITEM_DEF) 
{
	backPic		= "menu_gothicshadow.tga";
	// Positionen  und Dimensionen	
	posx		=  250;		posy		=  500;
	dimx		= 7900;		dimy		= 2300;				
	// Weitere Eigenschaften
	alphaMode		= "BLEND";	
	alpha			= 220;			
	flags			= flags | IT_TXT_CENTER;
	flags			= flags & ~IT_SELECTABLE;
};


func int ShowIntro()
{
	PlayVideo("intro.bik");
	return 1;
};

func int ShowCredits()
{
	PlayVideo("credits.bik");
	return 1;
};
