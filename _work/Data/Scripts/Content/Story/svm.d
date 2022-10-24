// **********************************************
// Standard	Voice Module
// **********************************************

// Diese Klasse	kann beliebig von den Skriptern	erweitert um
// "VAR	STRING xxxx" erweitert werden, diese k�nnen	dann in	den
// einzelnen SVM - Instanzen initialisiert werden.


CLASS C_SVM
{
// SC hat Waffe oder Magie gezogen oder zielt auf NSC
	VAR	STRING	StopMagic;					// NSC  sieht wie in seiner N�he gezaubert wird -> er fordert auf, damit aufzuh�ren!
	VAR	STRING	ISaidStopMagic;				// NSC hat bereits mit $StopMagic gewarnt und greift nun an	(nachdem er	diesen Satz	gesagt hat;	WICHTIG: dies ist KEINE	letzte Warnung,	sonder sofort Angriff!)

	var string	WeaponDown				;	//ZS_AssessFighter: SC steht mit gezogener Waffe vor NSC -> NSC ist NEUTRAL zu SC	-> (herausfordernd,	bei	P�nten-Stimme etwas	unsicher, trotzdem kernig)
	var string	ISaidWeaponDown			;	//Kommt nachdem der SC $WeaponDown ignoriert hat!

	VAR	STRING	WatchYourAim;				// ein FRIENDLY-SC zielt mit einer Fernkampfwaffe auf den NSC .	'Pa� auf! Ziel woanders	hin!' B_Orc_AssessThreat hat das auch noch
	var string	WatchYourAimAngry		;	// SC zielt mit einer Fernkampfwaffe auf den Angry-NSC. (genervte Auffordern, damit	aufzuh�ren)
	VAR	STRING	WhatAreYouDoing;			// NSC wird von einem FRIENDLY-SC/NSC geschlagen

// SC hat Waffe weggesteckt, NSC beendet Kampf
	VAR	STRING	LetsForgetOurLittleFight;	//Friede, kann direkt kommen ( Wenn freundliche k�mpfen und der Spieler die Waffe wegsteckt) oder als Reaction �ber das news-Ged�chtnis, sollte daher Zeitneutral sein (--> nicht wie jetzt lass uns den Streit von letztens vergessen

// NSC hat Gegner aus den Augen verloren
	VAR	STRING	Strange			;			// 1. NSC wird attackiert -> rennt mit gezogener Waffe zum Angreifer ->	kann ihn pl�tzlich nicht mehr entdecken	-> (muttering to himself)
											// 2. NSC sieht	einen Mord -> rennt	mit	gezogener Waffe	zum	M�rder -> kann ihn pl�tzlich nicht mehr	entdecken

// NSC greift an!
	var string	DieMonster				;	// NSC greift Monster an -> "Aus dir mach ich Gulasch, Drecksvieh!"
	var string	DieMOrtalEnemy;				// Der Nsc greift an, da er durch die Story permanent Hostile ist, d.h. die Lager sind in Blutfehde

	VAR	STRING	NowWait;					// NSC hat den SC fr�her noch NICHT besiegt -> SC greift den NSC an -> "Na warte!"
	VAR	STRING	YouStillNotHaveEnough	;	// NSC hat den SC fr�her besiegt ->	SC greift den NSC an -> "Hast du immer noch nicht genug?!"

	var	string	YouAskedForIt			;	// 1. SC hat eine Aufforderung ignoriert: den Raum zu verlassen, ein Item zur�ckzugeben, seine Waffe wegzustecken -> "Wer nicht h�ren will mu� f�hlen..."
	var string	NowWaitIntruder			;	// SC hat einen bewachten Durchgang durchbrochen...

	var	string	IWillTeachYouRespectForForeignProperty;	// 1. SC benutzt ein Besitz-Mob(T�r,Fallgitter-Drehkreuz,Kiste,...) und	wird ohne Vorwarnung attackiert
											// 2. SC tr�gt Waffe des NSCs -> NSC ist st�rker und holt sie sich mit Gewalt wieder ->	vorher dieser Spruch

	VAR	STRING	DirtyThief;					// 1. NSC ertappt den (schw�cheren)	SC mit den Fingern in den eigenen Taschen
											// 2. NSC sieht	wie	der	(schw�chere) SC	etwas nimmt, da� ihm geh�rt	(z.B. Waffe	auf	den	Tisch)
											// 3. NSC sieht	feindlichen, schw�cheren SC, der ihn vorher	mal	beklaut	hat	und	sagt ihm diesen	Spruch,	bevor er angreift "Da hab ich Dich also	wieder,	Du dreckiger Dieb"
											// 4. Nsc ist in einen Raum eingedrungen

	var string	YouAttackedMyCharge		;	// SC/NSC greift einen Sch�tzling einer NSC-Wache an -> Wache attackiert den Angreifer danach
	var string	YouKilledOneOfUs;			// NSC erblickt feindlichen SC, der einen Freund des NSCs get�tet hat -> Angriff!

// im Kampf
	VAR	STRING	Dead			;			// T�dlich verletzt
	VAR	STRING	Aargh_1			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_2			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_3			;			// Treffer kassiert im Kampf	

	var string	Berzerk			;			// Wahnsinnsschrei im Zustand der Raserei!

// SC hat NSC niedergeschlagen oder bedroht
	VAR	STRING	YoullBeSorryForThis;		// NSC wurde durch SC/aNSC besiegt und wacht aus der Ohnmacht wieder auf: 'Das wird	Dir	noch leidtun!'

	VAR	STRING	YesYes			;			// 1. NSC wurde	im Kampf besiegt ->	erwacht	wieder ist aber	sch�cher als sein Kontrahent
											// 2. SC zieht Waffe oder n�hert sich mit Waffe und NSC ist schw�cher als SC
// NSC flieht
	var string	ShitWhatAMonster		;	// NSC flieht vor zu starkem Monster -> "Schei�e, was ein H�llenvieh. Nichts wie weg!"
	VAR	STRING	Help;						// NSC flieht vor Gegner, Babe Nsc flieht vor Spieler, Orcs haben das auch
	var	STRING	WeWillMeetAgain;			// NSC flieht vor Gegner, ist aber eigentlich St�rker als er, ist aber trotzdem besiegt worden

// SC wurde von NSC besiegt und wird gepl�ndert
	VAR	STRING	NeverTryThatAgain	;		// NSC hat Gegner besiegt -> ("Versuch das NIE wieder!!")
	var string	ITakeYourWeapon;			// NSC pl�ndert bewu�tlosen SC/aNSC. W�hrend er sich b�ckt, um nach der vom Besiegten fallengelassenen Waffe zu greifen sagt er diesen Spruch.
	VAR	STRING	ITookYourOre	;			// NSC pl�ndert bewu�tlosen SC/aNSC. Nachdem er sich einen Teil des Erzes genommen hat, sagt er diesen Spruch.
	var string	ShitNoOre		;			// NSC �rgert sich dar�ber, da� er beim Durchsuchen eines bewu�tlosen/toten K�rpers kein Erz gefunden hat!

// NSC verwarnt SC
	VAR	STRING	HandsOff;					// SC manipuliert ein MOB (Drehkreuz, Truhe, T�r) und ein befreundeter bzw. gildengleicher NSC sieht das...
	VAR	STRING	GetOutOfHere		;		// NSC erwischt	schw�cheren	SC in seiner H�tte -> ("Raus hier")	(SC	soll aus Raum gehen)
	var	string	YouViolatedForbiddenTerritory		;	// SC wird beim Betreten eines verbotenen Portalraums erwischt -> Warnung!

	var	STRING	YouWannaFoolMe;				// SC schnappt NSC ein Item vor der Nase weg und wird mit $GiveItToMe aufgefordert es zur�ckzugeben -> SC gibt ein falsches Item an den NSC -> 'Willst Du mich verarschen'

	VAR	STRING	WhatsThisSupposedToBe	;	// 1. SC schleicht vor den Augen des NSCs -> "Was schleichst Du	hier rum?" (besser als "Was	soll das denn werden", weil	besseres Feedback!)
											// 2. SC bewegt	sich hinter	einer Wache	-> diese dreht sich	um und sagt	dann
	var string	WhyAreYouInHere			;	//im ZS_ClearRoom / SC steht in verbotenem Portalraum	-> schw�cherer NSC fragt
	var string	WhatDidYouInThere		;	// Wache sieht Sc aus einer H�tte rauskommen und verwarnt ihn, ohne das ein Angriff folgt

	VAR	STRING	WiseMove;					// 1. NSC wurde	gewarnt, seine Waffe wegzustecken ($RemoveYourWeapon) -> SC	befolgt	dies und steckt	die	Waffe weg
											// 2. SC steht in verbotenem Raum und wird mit $GetOutOfHere aufgefordert, rauszugehen -> SC befolgt die Aufforderung
											// 3. SC hat NSC ein Item vor der Nase weggeschnappt und wurde mit $GiveItToMe aufgefordert	es zur�ckzugeben ->	SC gehorcht

// NSC alarmiert/warnt andere NSCs vor SC
	VAR	STRING	Alarm;						// Wache alarmiert die Sichtung	eines permanent	HOSTILE	SC/aNSC	"Alaaaaaaarm!!!!!"
											// Nicht Wache sieht wie ein Portalraum betreten wird, der einer Gilde zugeordnet ist und ruft die Wachen
											// Gem�se (NpcWorker) ruft Wachen nach einem Diebstahl/beobachteten Diebstahl etc.
	var string	IntruderAlert;				// SC hat einen bewachten Durchgang durchbrochen und die Wache alarmiert alle umstehenden
	VAR	STRING	BehindYou;					// NSC sieht, wie ein anderer NSC vom SC bestohlen wird	und	warnt das Opfer

// NSC beobachtet Kampf
	var	string	TheresAFight	;			// NSC entdeckt	einen Kampf	und	will zuschauen (ZS_WatchFight) -> vorher ein Spruch	wie	"Hey da	dr�ben gibt's einen	Kampf"
	VAR	STRING	HeyHeyHey;					// Hintergrund anfeuern	beim Beobachten	eines Kampfes: 'Hau	ihm	aufs Maul!'	(kommt alle	paar Sekunden!)
	VAR	STRING	CheerFight;					// NSC ist im Zustand WatchFight: Neutraler	K�mpfer	schl�gt irgendeinen Typen. '5 Erz auf den Dicken'
	VAR	STRING	CheerFriend;				// NSC ist im Zustand WatchFight: Freund landet	einen Treffer. 'Immer in die Fresse!'
	VAR	STRING	Ooh;						// NSC ist im Zustand WatchFight: Freund kriegt	aufs Maul. 'Mist - das tat weh.'
	var	STRING	YeahWellDone;				// NSC sieht, wie SC/aNSC, zu dem er ANGRY/HOSTILE ist get�tet wird. 'Gut gemacht, das hat sie Sau verdient.'

// NSC-Gegner flieht
	VAR	STRING	RunCoward;					// 1. Der NSC befindet sich	im Zustand WatchFight -> einer der K�mpfer haut	ab
											// 2. Der Gegner des NSCs flieht
	var	string	HeDefeatedHim	;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC besiegt 	(WICHTIG: dies ist der normale Ausgang!)
	var	string	HeDeservedIt	;			// NSC sieht wie ein SC/aNSC, zu dem er	ANGRY/HOSTILE steht, besiegt wird -> ("DAS hat er verdient!")
	var	string	HeKilledHim		;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC t�tet	(WICHTIG: dies ist ein Skandal, niemand wird normalerweise	in einer "Schl�gerei" get�tet)
	var	string	ItWasAGoodFight	;			// NSC sieht wie ein FRIENDLY/NEUTRAL-SC/aNSC einen	anderen	besiegt

	VAR	STRING	Awake			;			// NSC wacht aus dem Zustand Sleep wieder auf (Aufwachen, r�keln)

// Gr��e
	VAR	STRING	FriendlyGreetings;			// 1. Am Anfang	eines Dialoges, wenn NSC FRIENDLY/NEUTRAL zum SC,  2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	ALGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC aus Altem Lager und FRIENDLY/NEUTRAL ('F�r Gomez'), 2. Wenn sie sich unterwegs begegnen.
	var	STRING	MageGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC beide Magier und FRIENDLY/NEUTRAL, 2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	SectGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC aus Psi-Camp und FRIENDLY/NEUTRAL	zum	SC ('Erwache. Der Schl�fer erwache.') 2. Wenn sie sich unterwegs begegnen.

	var string	ThereHeIs;					// NSC zeigt SC wo ein anderer NSC steht nach dem der SC gefragt hat: "Da dr�ben ist er"

// Lehrer-Kommentare
	var string	NoLearnNoPoints			;	// NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
	var string	NoLearnOverMax			;	// NSC-Lehrer verbietet Attribut-Steigerung �ber 100
	var string	NoLearnYouAlreadyKnow	;	// Du mu�t erst Fortgeschritten sein, bevor du ein Meister werden kannst!
	var string	NoLearnYoureBetter		;	// Du bist jetzt schon besser!

// NSC spricht SC an
	VAR	STRING	HeyYou;						// z.B. Wache, die den SC im R�umen erwischt, wo er nicht hin darf sagt HeyYou, und geht dann zum SC

// NSC will nicht reden
	VAR	STRING	NotNow;						// NSC / Babe wird vom SC angesprochen,	lehnt aber ein Gespr�ch	ab.

// SC zu nah
	VAR	STRING	WhatDoYouWant;				// SC r�ckt NSC zu dicht auf die Pelle -> "Kann ich was f�r Dich tun?"
	VAR	STRING	ISaidWhatDoYouWant;			// NSC hat $WhatDoYouWant gesagt, aber der SC hat nicht reagiert -> "Was willst Du?"
// SC im Weg
	VAR	STRING	MakeWay;					// SC steht	schw�cherem NSC im Weg	-> Aufforderung, Platz zu	machen
	VAR	STRING	OutOfMyWay;					// SC steht st�rkerem NSC (Magier, Erzbaron) im Weg -> aggressive Aufforderung, Platz zu machen
	VAR	STRING	YouDeafOrWhat;				// SC folgt	nicht der Aufforderung des st�rkeren NSCs	-> letzte Warnung, danach Angriff

// SC spricht NSC an, der ihn besiegt hat
	VAR	STRING	LookingForTroubleAgain;		//Erster Satz eines Dialoges, nachdem der NSC und der SC gek�mpft haben (entweder wurde der SC besiegt oder es gab keinen klaren Ausgang des Kampfes)

// NSC ist schw�cher...
	var string	LookAway;					// Eingesch�chterter NSC guckt weg bei bedrohlichen Situationen
	VAR	STRING	OkayKeepIt;					// SC tr�gt	Waffe des sch�cheren NSCs -> NSCs verlangt die Waffe zur�ck	($GiveItToMe) -> SC	bedroht	NSC	-> ("Okay, okay, du	kannst das Ding	behalten..." zur�ckweichen)
	VAR	STRING	WhatsThat;					// Verwandelter SC wird vor den Augen des NSCs wieder zum Menschen (Erschreckter Ausruf) Nsc wird aus dem MagicSleep wieder wach und wundert sich...

	VAR	STRING	ThatsMyWeapon;				// SC tr�gt	eine Waffe,	die	dem	NSC	geh�rt -> Folge: ZS_GetBackBelongings
	VAR	STRING	GiveItToMe;					// 1. SC tr�gt Waffe des NSCs -> NSC ist schw�cher (also kein Kampf) ->	"Gib sie mir wieder"
	VAR	STRING	YouCanKeeptheCrap;			// 1. SC tr�gt Waffe des schw�cheren NSCs ->	NSCs verlangt die Waffe	zur�ck ($GiveItToMe) ->	SC geht	einfach	weg	-> ("Behalt	das	Schei�-Ding	doch!)
											// 2. NSC will ein Item	aufheben und wird von einem	st�rkeren NSC gewarnt, der das auch	tun	will ->	unser NSC weicht zur�ck

	VAR	STRING	TheyKilledMyFriend;			// NSC T�ter - NSC zu Opfer freundlich, zu T�ter freundlich oder neutral

	var	string	YouDisturbedMySlumber;		// NSC wurde vom SC	mittelsanft	aus	dem	Schlaf gerissen	(z.B. durch	Ansprechen)

// Angry NSCs kommentieren SC-Aktionen
	VAR	STRING	SuckerGotSome;				// Angry NSC hat geh�rt, da� der SC umgehauen wurde. "Das Dich jemand umgehauen hat, geschieht Dir Recht!"

	VAR	STRING	SuckerDefeatedEBr;			// Du hast einen	EBR	besiegt. Er war wirklich beeindruckt!
	VAR	STRING	SuckerDefeatedGur;			// Du hast einen	GUR	niedergeschlagen,	Du bist	ein	toter Mann
	VAR	STRING	SuckerDefeatedMage;			// (News) - im Stil von SuckerDefeatedXY

	var string	SuckerDefeatedNOV_Guard;	// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist ANGRY zu Spieler
	var string	SuckerDefeatedVLK_Guard;	// Der Spieler hat einen Sch�tzling der Wache niedergeschlagen
	var string	YouDefeatedMyComrade;		// Wache stellt fest, das sie gesehen/geh�rt hat, da� ich eine andere Wache umgehauen habe
	var string	YouDefeatedNOV_Guard;		// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist NEUTRAL/FRIENDLY zu Spieler
	var string	YouDefeatedVLK_Guard;		// Der Spieler hat einen Buddler umgehauen, Wache spricht den Spieler an, Wache ist NEUTRAL/FRIENDLY zu Spieler
	VAR	STRING	YouStoleFromMe;				// Du Sau hast mich beklaut

//Wichtige Person (Lehrer, Auftraggeber?), hat davon geh�rt, da� Du Mist gebaut hat...
// FIXME: damit das so benutzt werden kann m�ssen noch Anpassungen in der B_ReactToMemory.d gemacht werden
	VAR	STRING	YouStoleFromUs;				// eigene oder befreundete Gilde beklaut.
	VAR	STRING	YouStoleFromEBr;			// Erzbarone beklaut.
	VAR	STRING	YouStoleFromGur;			// Gurus beklaut.
	VAR	STRING	StoleFromMage;				// Magier beklaut.

	VAR	STRING	YouKilledMyFriend;			// jemand aus eigener oder befreundeter Gilde get�tet
	var	STRING	YouKilledEBr;				// Erzbaron get�tet
	VAR	STRING	YouKilledGur;				// Guru get�tet
	VAR	STRING	YouKilledMage;				// Guru get�tet

	VAR	STRING	YouKilledOCfolk;			// Gardist, Schatten oder Buddler get�tet.
	VAR	STRING	YouKilledNCfolk;			// S�ldner, Organisator, Sch�rfer oder Bauer get�tet
	VAR	STRING	YouKilledPSIfolk;			// Templer oder Novize get�tet

	VAR	STRING	GetThingsRight;				//SC hat Mist gebaut. NSC sagt, "Das wieder hinzubiegen wird nicht einfach!"

	VAR	STRING	YouDefeatedMeWell;			//Zu SC	freundlich/neutral:	Du hast	mich ganz sch�n	gepl�ttet

// Ambient-Unterhaltungen zwischen zwei NSCs (gemurmelte Wortfetzen, die zuf�llig zu "Dialogen" zusammengew�rfelt werden...
	VAR	STRING	Smalltalk01;				// ...wenn Du meinst...
	VAR	STRING	Smalltalk02;				// ...kann schon sein...
	VAR	STRING	Smalltalk03;				// ...war nicht besonders schlau....
	VAR	STRING	Smalltalk04;				// ...ich halt mich da lieber raus...
	VAR	STRING	Smalltalk05;				// ...das ist wirklich nicht mein Problem...
	VAR	STRING	Smalltalk06;				// ...war doch klar, da� das �rger gibt...
	VAR	STRING	Smalltalk07;				// ...aber behalt's f�r Dich, mu� nicht gleich jeder wissen...
	VAR	STRING	Smalltalk08;				// ...das passiert mir nicht nochmal...
	VAR	STRING	Smalltalk09;				// ...an der Gechichte mu� wohl doch was dran sein...
	VAR	STRING	Smalltalk10;				// ...man mu� eben aufpassen was man rumerz�hlt...
	VAR	STRING	Smalltalk11;				// ...solange ich damit nichts zu tun habe...
	VAR	STRING	Smalltalk12;				// ...man darf auch nicht alles glauben, was man h�rt...
	VAR	STRING	Smalltalk13;				// ...in seiner Haut will ich trotzdem nicht stecken...
	VAR	STRING	Smalltalk14;				// ...immer wieder die selbe Leier...
	VAR	STRING	Smalltalk15;				// ...manche lernen eben garnichts dazu...
	VAR	STRING	Smalltalk16;				// ...fr�her w�re das ganz anders gelaufen...
	VAR	STRING	Smalltalk17;				// ...gequatscht wird viel...
	VAR	STRING	Smalltalk18;				// ...ich h�r nicht mehr auf das Gefasel...
	VAR	STRING	Smalltalk19;				// ...verla� Dich auf jemanden und Du bist verlassen, das ist eben so...
	VAR	STRING	Smalltalk20;				// ...ich glaube kaum, da� sich daran was �ndern wird...
	VAR	STRING	Smalltalk21;				// ...wahrscheinlich hast Du recht...
	VAR	STRING	Smalltalk22;				// ...erstmal abwarten. Es wird nichts so hei� gegessen, wie es gekocht wird...
	VAR	STRING	Smalltalk23;				// ...ich dachte, das w�re schon lange gekl�rt, aber das ist wohl nicht so...
	VAR	STRING	Smalltalk24;				// ...la� uns lieber �ber was anderes reden...
	VAR	STRING	Om;							//  (Meditation)

// SC Dialog
	var string	SC_HeyTurnAround;			//SC: Hey du! (Nsc ansprechen, steht mit R�cken zu dir)                                   
	var string	SC_HeyWaitASecond;			//SC: Warte mal! (Nsc im vorgeigehen anhalten)                                            
	var string DoesntWork;				
	var string PickBroke;				
	var string NeedKey;					
	var string NoMorePicks;				
	var string InvFull;					

};


instance SVM_0 (C_SVM)				// wird nur intern gebraucht...
{

};


// ********************************
// 		Die SVM-Instanzen		(ToDo: News noch �berarbeiten wie in Prototypen)
// ********************************

// Die einzelnen Instanzen der SVMs
// Diese m�ssen	immer "SVM_x" heissen, wobei x die VoiceNummer ist.

instance SVM_1 (C_SVM)	//Malocher (Volk, Sch�rfer)	N�rgler, Alkoholiker, schimpft �ber	alles - zieht Kraft aus seinem Hass

{
	StopMagic					=	"SVM_1_StopMagic"					;//��, ������� �����!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//�������� �������? �������� ������ ��!
	WeaponDown					=	"SVM_1_WeaponDown"					;//����� ������!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//����� ��� ������� ������!
	WatchYourAim				=	"SVM_1_WatchYourAim"				;//������ ������!
	WatchYourAimAngry			=	"SVM_1_WatchYourAimAngry"			;//�����, ������ � ����, ���� ������ ��������!
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//���������! ��� ���, � � �������� ���� ��� �������!
	LetsForgetOurLittleFight	=	"SVM_1_LetsForgetOurLittleFight"	;//����� ������� �� ���� �����, �����?
	Strange						=	"SVM_1_Strange"						;//��������!
	DieMonster					=	"SVM_1_DieMonster"					;//��������� �����!
	DieMortalEnemy				=	"SVM_1_DieMortalEnemy"				;//���� �����!
	NowWait						=	"SVM_1_NowWait"						;//��, ������ �� ����� ��������...
	YouStillNotHaveEnough		=	"SVM_1_YouStillNotHaveEnough"		;//�� ����� �����������?
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//�� ��� ����������!
	NowWaitIntruder				= 	"SVM_1_NowWaitIntruder"				;//������ � ���� ������� �����!
	IWillTeachYouRespectForForeignProperty	=	"SVM_1_IWillTeachYouRespectForForeignProperty"	;//� �� ������������ ���� �� ������� ��� ����!
	DirtyThief					=	"SVM_1_DirtyThief"					;//� �������� ����, ���!
	YouAttackedMyCharge			=	"SVM_1_YouAttackedMyCharge"			;//����� �� ����� ����� � ���� �������!
	YouKilledOneOfUs			=	"SVM_1_YouKilledOneOfUs"			;//�� ������ ������ ��������! ������ � ����� ����! 
	Dead						=	"SVM_1_Dead"						;//
	Aargh_1						=	"SVM_1_Aargh_1"						;//
	Aargh_2						=	"SVM_1_Aargh_2"						;//
	Aargh_3						=	"SVM_1_Aargh_3"						;//
	Berzerk						=	"SVM_1_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_1_YoullBeSorryForThis"			;//�� ��� �� ���� ���������!
	YesYes						=	"SVM_1_YesYes"						;//�� ��������! �� �������!
	ShitWhatAMonster			=	"SVM_1_ShitWhatAMonster"			;//���� ������� ����!
	Help						=	"SVM_1_Help"						;//���������!
	WeWillMeetAgain				=	"SVM_1_WeWillMeetAgain"				;//�� � ����� ��� ���������!
	NeverTryThatAgain			=	"SVM_1_NeverTryThatAgain"			;//������ �������� ������� ��� ��� ���!
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//������� ������! � ������ ���.
	ITookYourOre				=	"SVM_1_ITookYourOre"				;//������� �� ����, �����!
	ShitNoOre					=	"SVM_1_ShitNoOre"					;//������ ������, �� � ���� �� ��� �� ����� ����!
	HandsOff					=	"SVM_1_HandsOff"					;//����� ����!
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//�������� ������!
	YouViolatedForbiddenTerritory=	"SVM_1_YouViolatedForbiddenTerritory";//��! � �� ������ ����� ������?
	YouWannaFoolMe				=	"SVM_1_YouWannaFoolMe"				;//�� �������, ���� ��� ����� ��������?
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//��, ��! ��� ��� �� ����� �������?
	WhyAreYouInHere				=	"SVM_1_WhyYouAreInHere"				;//�������� �� ����� ����, ��� ���� ������� ������!
	WhatDidYouInThere			=	"SVM_1_WhatDidYouInThere"			;//����� �� ������ �� �������! �������!
	WiseMove					=	"SVM_1_WiseMove"					;//�������, ��������� �������!
	Alarm						=	"SVM_1_Alarm"						;//������! ����!
	IntruderAlert				= 	"SVM_1_IntruderAlert"				;//�������! ����� �����!
	BehindYou					=	"SVM_1_BehindYou"					;//���� ���������!
	TheresAFight				=	"SVM_1_TheresAFight"				;//�, �����!
	HeyHeyHey					=	"SVM_1_HeyHeyHey"					;//��� ���!
	CheerFight					=	"SVM_1_CheerFight"					;//�������� ��� ����!
	CheerFriend					=	"SVM_1_CheerFriend"					;//�������� ���!
	Ooh							=	"SVM_1_Ooh"							;//�� ��� �� ���!
	YeahWellDone				=	"SVM_1_YeahWellDone"				;//����� ���!
	RunCoward					=	"SVM_1_RunCoward"					;//���� �� ��, ����!
	HeDefeatedHim				=	"SVM_1_HeDefeatedHim"				;//������ � ����!
	HeDeservedIt				=	"SVM_1_HeDeservedIt"				;//��� ��� � ����!
	HeKilledHim					=	"SVM_1_HeKilledHim"					;//����� �� ���� ���? ������ ���� �� ����!
	ItWasAGoodFight				=	"SVM_1_ItWasAGoodFight"				;//������� ���!
	Awake						=	"SVM_1_Awake"						;//
	FriendlyGreetings			=	"SVM_1_FriendlyGreetings"			;//������!
	ALGreetings					=	"SVM_1_ALGreetings"					;//�� ������!
	MageGreetings				=	"SVM_1_MageGreetings"				;//�� ��� �����!
	SectGreetings				=	"SVM_1_SectGreetings"				;//���������!
	ThereHeIs					= 	"SVM_1_ThereHeIs"					;//��� �� ��.
	NoLearnNoPoints				= 	"SVM_1_NoLearnNoPoints"				;//�������, ����� ������ ����� ������.
	NoLearnOverMax				= 	"SVM_1_NoLearnOverMax"				;//�� ������ �� ������ ����� ���������. ���� ����� ����������� ���-�� ������.
	NoLearnYouAlreadyKnow		=	"SVM_1_NoLearnYouAlreadyKnow"		;//���� ����� ������� ������, ������ ��� ����� ��������� ��������.
	NoLearnYoureBetter			=	"SVM_1_NoLearnYoureBetter"			;//�� ��� ���� �����.
	HeyYou						=	"SVM_1_HeyYou"						;//��, ��!  
	NotNow						=	"SVM_1_NotNow"						;//� �����!
	WhatDoYouWant				=	"SVM_1_WhatDoYouWant"				;//��� ���� �����!
	ISaidWhatDoYouWant			=	"SVM_1_ISaidWhatDoYouWant"			;//��� ���� ���-�� �����?
	MakeWay						=	"SVM_1_MakeWay"						;//��� ������!
	OutOfMyWay					=	"SVM_1_OutOfMyWay"					;//���� � ������!
	YouDeafOrWhat				=	"SVM_1_YouDeafOrWhat"				;//�� ������? � ������!
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//�� ����� ����� �������������?
	LookAway					=	"SVM_1_LookAway"					;//�, � � ������ �� �����!
	OkayKeepIt					=	"SVM_1_OkayKeepIt"					;//������, ��� ������! ������ ����!
	WhatsThat					=	"SVM_1_WhatsThat"					;//��� ��� ����?
	ThatsMyWeapon				=	"SVM_1_ThatsMyWeapon"				;//�� ������ ��� ������!
	GiveItToMe					=	"SVM_1_GiveItToMe"					;//����� ��� ���!
	YouCanKeeptheCrap			=	"SVM_1_YouCanKeeptheCrap"			;//��, �����, ��������. ��� ��� ��� ����� �� �����.
	TheyKilledMyFriend			=	"SVM_1_TheyKilledMyFriend"			;//���-�� ���� ������ �� ���� �����. ���� � ��� �����...
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//��, �� ����� �� ���� ��������?
	SuckerGotSome				=	"SVM_1_SuckerGotSome"				;//��, ���, �������? ������� ����!
	SuckerDefeatedEBr			=	"SVM_1_SuckerDefeatedEBr"			;//�� ����� ������! �� �� �� ���� ��������!
	SuckerDefeatedGur			=	"SVM_1_SuckerDefeatedGur"			;//�� ������ ����. �� ����� �������������� �� ������������!
	SuckerDefeatedMage			=	"SVM_1_SuckerDefeatedMage"			;//�� ������� ����... � ��� ������ �� ��������� �� �����?!
	SuckerDefeatedNov_Guard		= 	"SVM_1_SuckerDefeatedNov_Guard"		;//�������, �� ������ ������������ ������� ����� �����������?
	SuckerDefeatedVlk_Guard		= 	"SVM_1_SuckerDefeatedVlk_Guard"		;//����� ���� �� ���� �����!
	YouDefeatedMyComrade		=	"SVM_1_YouDefeatedMyComrade"		;//�� ������ ����� ���������...
	YouDefeatedNOV_Guard		=	"SVM_1_YouDefeatedNOV_Guard"		;//�� ���� ����� ���� ������������. ��� ������ �� ����� ������������!
	YouDefeatedVLK_Guard		=	"SVM_1_YouDefeatedVLK_Guard"		;//���� �� ������� ����-������ �� ���� ����������, ������ ����� ���� �� ����!
	YouStoleFromMe				=	"SVM_1_YouStoleFromMe"				;//�� ������� ����! ������ �������� ������� �� ��� ��� ���!
	YouStoleFromUs				=	"SVM_1_YouStoleFromUs"				;//� ���� �������� ���� ����! � �� �����!
	YouStoleFromEBr				=	"SVM_1_YouStoleFromEBr"				;//�� ������� �������! ����� �� ��� ������?  
	YouStoleFromGur				=	"SVM_1_YouStoleFromGur"				;//�� ������� ����! � ��� ��� ����� �� ����!
	StoleFromMage				=	"SVM_1_StoleFromMage"				;//�� ������� �����! ����� �������� ����!
	YouKilledMyFriend			=	"SVM_1_YouKilledMyFriend"			;//���� �� ����� ����� ����. ��������� ����� ������ ��� ���, � ���� �����!
	YouKilledEBr				=	"SVM_1_YouKilledEBr"				;//�� ���� ������! ������ ����������� ��� ����� �� ���!
	YouKilledGur				=	"SVM_1_YouKilledGur"				;//�� ���� ����! � �� ���� � ��� ��������!
	YouKilledMage				=	"SVM_1_YouKilledMage"				;//�� ���� ����! ������ ���������, ����� �� ��� ������?
	YouKilledOCfolk				=	"SVM_1_YouKilledOCfolk"				;//� ������ ������ ��������� ��������. ����� �����, ��� �� � ���� �������...
	YouKilledNCfolk				=	"SVM_1_YouKilledNCfolk"				;//� ����� ������ ����� �������� � ������������, ��� ��� ��� ���� �� ��������!
	YouKilledPSIfolk			=	"SVM_1_YouKilledPSIfolk"			;//���� ���� �� ������������ ����� ����, � ��� ������ �� ����� �������!
	GetThingsRight				=	"SVM_1_GetThingsRight"				;//�� �� ������� �������� ���������������!
	YouDefeatedMeWell			=	"SVM_1_YouDefeatedMeWell"			;//��� ��� ������� ���. ���� ������� �������� ����!
	Smalltalk01					=	"SVM_1_Smalltalk01"					;// ...���� ��� ��, ���...
	Smalltalk02					=	"SVM_1_Smalltalk02"					;// ...����� ����, �� ���� ��� ����...
	Smalltalk03					=	"SVM_1_Smalltalk03"					;// ...������ ������...
	Smalltalk04					=	"SVM_1_Smalltalk04"					;// ...�� ����� � ��� �����������...
	Smalltalk05					=	"SVM_1_Smalltalk05"					;// ...� ��� ��� �� ��� ��������...
	Smalltalk06					=	"SVM_1_Smalltalk06"					;// ...��� ����� ���� ����, ��� ���� ���� �� ��������...
	Smalltalk07					=	"SVM_1_Smalltalk07"					;// ...�� ���� ��� ����� ���������...
	Smalltalk08					=	"SVM_1_Smalltalk08"					;// ...�� ���� �������� ��� �����...
	Smalltalk09					=	"SVM_1_Smalltalk09"					;// ...� � ���� ������� ���-�� ����...
	Smalltalk10					=	"SVM_1_Smalltalk10"					;// ...�� ��, ������ �������...
	Smalltalk11					=	"SVM_1_Smalltalk11"					;// ...� �� ���� � ����� �������� ���������...
	Smalltalk12					=	"SVM_1_Smalltalk12"					;// ...������ ������ �����, ��� �������...
	Smalltalk13					=	"SVM_1_Smalltalk13"					;// ...�� ����� �� ��������� �� ��� �����...
	Smalltalk14					=	"SVM_1_Smalltalk14"					;// ...��� ����� ���� � �� ��...
	Smalltalk15					=	"SVM_1_Smalltalk15"					;// ...��������� ������ ������ �������...
	Smalltalk16					=	"SVM_1_Smalltalk16"					;// ...������ ��� ���� ������ ��-�������...
	Smalltalk17					=	"SVM_1_Smalltalk17"					;// ...���� ������� ����� �������...
	Smalltalk18					=	"SVM_1_Smalltalk18"					;// ...������ �� ���� ��� �������...
	Smalltalk19					=	"SVM_1_Smalltalk19"					;// ...������ �� �������, ����� ������ ���������...
	Smalltalk20					=	"SVM_1_Smalltalk20"					;// ...�� �����, ��� ����� ����� ���� ���-������ ��������...
	Smalltalk21					=	"SVM_1_Smalltalk21"					;// ...���� �����, �� � ����...
	Smalltalk22					=	"SVM_1_Smalltalk22"					;// ...�������. �� ����� ��������� ��������� �������...
	Smalltalk23					=	"SVM_1_Smalltalk23"					;// ...� �����, �� ���� ��� ��� ����� �����...
	Smalltalk24					=	"SVM_1_Smalltalk24"					;// ...��������� �� ���� � ��������� ���...
	Om							= 	"SVM_1_Om"							;// 
};


//SVM_2	// Misstrauisch (Volk, Bauern, Novizen, MILTEN) Misstrauisch. Defensiv. Angst in was reingezogen zu werden. Klug. Nov: Glauben durch Einsch�chterung

instance SVM_2 (C_SVM)				// Misstrauisch
{
	StopMagic					=	"SVM_2_StopMagic"					;//������� �����!
	ISaidStopMagic				=	"SVM_2_ISaidStopMagic"				;//��! ������� �����. � ������!
	WeaponDown					=	"SVM_2_WeaponDown"					;//�����, ������ ���!
	ISaidWeaponDown				=	"SVM_2_ISaidWeaponDown"				;//����� ������!
	WatchYourAim				=	"SVM_2_WatchYourAim"				;//�� ������ ���� ��������?
	WatchYourAimAngry			=	"SVM_2_WatchYourAimAngry"			;//���� �� � ������ ����������� �������� � ����, � ���� ��� ����������� ������!
	WhatAreYouDoing				=	"SVM_2_WhatAreYouDoing"				;//��, ��� ���� ���?
	LetsForgetOurLittleFight	=	"SVM_2_LetsForgetOurLittleFight"	;//������� �� ����, ������?
	Strange						=	"SVM_2_Strange"						;//�������! ���� �� �����?!
	DieMonster					=	"SVM_2_DieMonster"					;//��� ����!
	DieMortalEnemy				=	"SVM_2_DieMortalEnemy"				;//�����, ��� �������� ����� ����!
	NowWait						=	"SVM_2_NowWait"						;//��� ���� ����!
	YouStillNotHaveEnough		=	"SVM_2_YouStillNotHaveEnough"		;//���� ���, ����?
	YouAskedForIt				=	"SVM_2_YouAskedForIt"				;//��, ���� �� ����� ������...
	NowWaitIntruder				= 	"SVM_2_NowWaitIntruder"				;//�� ������, ��� ���� ������ ����� ������!
	IWillTeachYouRespectForForeignProperty	=	"SVM_2_IWillTeachYouRespectForForeignProperty"	;//������ �� ������� � ����� �����?!
	DirtyThief					=	"SVM_2_DirtyThief"					;//�� ������� ����! � ��� �������!
	YouAttackedMyCharge			=	"SVM_2_YouAttackedMyCharge"			;//����� �� ����� ������� ���� ������!
	YouKilledOneOfUs			=	"SVM_2_YouKilledOneOfUs"			;//�� ���� ������ �� �����! �� �� ��� ���������!
	Dead						=	"SVM_2_Dead"						;//
	Aargh_1						=	"SVM_2_Aargh_1"						;//
	Aargh_2						=	"SVM_2_Aargh_2"						;//
	Aargh_3						=	"SVM_2_Aargh_3"						;//
	Berzerk						=	"SVM_2_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_2_YoullBeSorryForThis"			;//�� �� ���� ���������!
	YesYes						=	"SVM_2_YesYes"						;//��������. ��������. �� �������.
	ShitWhatAMonster			=	"SVM_2_ShitWhatAMonster"			;//�, ��... ��� ������ ����� ���� ������!
	Help						=	"SVM_2_Help"						;//��� ������� - ������� ����!
	WeWillMeetAgain				=	"SVM_2_WeWillMeetAgain"				;//������, �� ��� ����������!
	NeverTryThatAgain			=	"SVM_2_NeverTryThatAgain"			;//������ �� ����� �����!
	ITakeYourWeapon				=	"SVM_2_ITakeYourWeapon"				;//� ������ ���!
	ITookYourOre				=	"SVM_2_ITookYourOre"				;//� ����� ������, ��� ���� ���� ��� �� ����������!
	ShitNoOre					=	"SVM_2_ShitNoOre"					;//���, ���������� �������, ��������. ������ ��� ����?
	HandsOff					=	"SVM_2_HandsOff"					;//����� ����!
	GetOutOfHere				=	"SVM_2_GetOutOfHere"				;//����� �����!
	YouViolatedForbiddenTerritory=	"SVM_2_YouViolatedForbiddenTerritory";//��! ��� �� ����� ��������?
	YouWannaFoolMe				=	"SVM_2_YouWannaFoolMe"				;//��-������, � �����?
	WhatsThisSupposedToBe		=	"SVM_2_WhatsThisSupposedToBe"		;//��� �� ����� ���������? 
	WhyAreYouInHere				=	"SVM_2_WhyYouAreInHere"				;//�������� �� ����� ����, ��� � ������ ������!
	WhatDidYouInThere			=	"SVM_2_WhatDidYouInThere"			;//������� �������� �� �����!
	WiseMove					=	"SVM_2_WiseMove"					;//���������� �������!
	Alarm						=	"SVM_2_Alarm"						;//������! ����!
	IntruderAlert				= 	"SVM_2_IntruderAlert"				;//�������!
	BehindYou					=	"SVM_2_BehindYou"					;//�����!
	TheresAFight				=	"SVM_2_TheresAFight"				;//�, �����!
	HeyHeyHey					=	"SVM_2_HeyHeyHey"					;//� ��� ���?!
	CheerFight					=	"SVM_2_CheerFight"					;//����������, ������!
	CheerFriend					=	"SVM_2_CheerFriend"					;//������� ����!
	Ooh							=	"SVM_2_Ooh"							;//������!
	YeahWellDone				=	"SVM_2_YeahWellDone"				;//�� ��� ��� ���������!
	RunCoward					=	"SVM_2_RunCoward"					;//��������� �����, ������ ����.
	HeDefeatedHim				=	"SVM_2_HeDefeatedHim"				;//������ � ����!
	HeDeservedIt				=	"SVM_2_HeDeservedIt"				;//�� ������� �� ��������.
	HeKilledHim					=	"SVM_2_HeKilledHim"					;//�� ���� ���! ��� ���, ���� ��� ����������?
	ItWasAGoodFight				=	"SVM_2_ItWasAGoodFight"				;//������� ���, �� ������� �������������.
	Awake						=	"SVM_2_Awake"						;// 
	FriendlyGreetings			=	"SVM_2_FriendlyGreetings"			;//������.
	ALGreetings					=	"SVM_2_ALGreetings"					;//�� ������!
	MageGreetings				=	"SVM_2_MageGreetings"				;//�� ��� �����!
	SectGreetings				=	"SVM_2_SectGreetings"				;//���������!
	ThereHeIs					= 	"SVM_2_ThereHeIs"					;//����.
	NoLearnNoPoints				= 	"SVM_2_NoLearnNoPoints"				;//� �� ����� ����� ����� ��������. � ���� ������������ ������������ �������.
	NoLearnOverMax				= 	"SVM_2_NoLearnOverMax"				;//�� �� ������� ����� ������������. ���� ����� ��������� ����-������ ���.
	NoLearnYouAlreadyKnow		=	"SVM_2_NoLearnYouAlreadyKnow"		;//���� ���������� �������� ������� ����, ������ ��� �� ������� ��������.
	NoLearnYoureBetter			=	"SVM_2_NoLearnYoureBetter"			;//��� �����!
	HeyYou						=	"SVM_2_HeyYou"						;//��, ��!
	NotNow						=	"SVM_2_NotNow"						;//�� ������.
	WhatDoYouWant				=	"SVM_2_WhatDoYouWant"				;//��� ���� �����?
	ISaidWhatDoYouWant			=	"SVM_2_ISaidWhatDoYouWant"			;//��� � ���� ��� ���� �������?
	MakeWay						=	"SVM_2_MakeWay"						;//��� ��� ������!
	OutOfMyWay					=	"SVM_2_OutOfMyWay"					;//� ������!
	YouDeafOrWhat				=	"SVM_2_YouDeafOrWhat"				;//��������. ����� ���� �� ������������.
	LookingForTroubleAgain		=	"SVM_2_LookingForTroubleAgain"		;//����� ����� �������������?
	LookAway					=	"SVM_2_LookAway"					;//� ������ �� �����! ������� �������!
	OkayKeepIt					=	"SVM_2_OkayKeepIt"					;//������. ��� ����.
	WhatsThat					=	"SVM_2_WhatsThat"					;//��? ���?
	ThatsMyWeapon				=	"SVM_2_ThatsMyWeapon"				;//����� ������ �� ��� ������.
	GiveItToMe					=	"SVM_2_GiveItToMe"					;//�����, ����� ����!
	YouCanKeeptheCrap			=	"SVM_2_YouCanKeeptheCrap"			;//��� ��� ��� ����� �� �����!
	TheyKilledMyFriend			=	"SVM_2_TheyKilledMyFriend"			;//����� ������ �� �����! ���� ������ ����, ��� ��� ������, ��� �� �����������.
	YouDisturbedMySlumber		=	"SVM_2_YouDisturbedMySlumber"		;//����� �� ���� ������?
	SuckerGotSome				=	"SVM_2_SuckerGotSome"				;//�������? ������ ����������, ��� ��� ��������!
	SuckerDefeatedEBr			=	"SVM_2_SuckerDefeatedEBr"			;//�� ������� ������!
	SuckerDefeatedGur			=	"SVM_2_SuckerDefeatedGur"			;//�� ������� ����! ���� �� ����, ���� � ���� ������ - ��������� ��� �������!
	SuckerDefeatedMage			=	"SVM_2_SuckerDefeatedMage"			;//�������� ����... ��, ������ ����, �������� ������!
	SuckerDefeatedNov_Guard		= 	"SVM_2_SuckerDefeatedNov_Guard"		;//� ����� ����� �� ��������!
	SuckerDefeatedVlk_Guard		= 	"SVM_2_SuckerDefeatedVlk_Guard"		;//��� ����������� ��-�� ���� ��� ���������. �� ������ ��������, � � ���� ��������, ������!
	YouDefeatedMyComrade		=	"SVM_2_YouDefeatedMyComrade"		;//�� ������ ����� �����!
	YouDefeatedNOV_Guard		=	"SVM_2_YouDefeatedNOV_Guard"		;//������ �������� � �����!
	YouDefeatedVLK_Guard		=	"SVM_2_YouDefeatedVLK_Guard"		;//������� ����. �����?
	YouStoleFromMe				=	"SVM_2_YouStoleFromMe"				;//����� �� ������� ����?
	YouStoleFromUs				=	"SVM_2_YouStoleFromUs"				;//� ���� ���� ���-���, ������������� ���. ����� �� ���� ��� �������!
	YouStoleFromEBr				=	"SVM_2_YouStoleFromEBr"				;//������! �� ������� �������! ��� ������ � ������!
	YouStoleFromGur				=	"SVM_2_YouStoleFromGur"				;//�� ������� ����! ������� �����, ��� ���� �� �������.
	StoleFromMage				=	"SVM_2_StoleFromMage"				;//����� ����� �� ��������, ����� ���-�� ������ � �� �����.
	YouKilledMyFriend			=	"SVM_2_YouKilledMyFriend"			;//����� ������ �� ����� ����� �� ����� �������. ��� ���� �������� ���, � �� ������ ���������!
	YouKilledEBr				=	"SVM_2_YouKilledEBr"				;//�� ���� ������! ������, �� ������������ ������� ��������?!
	YouKilledGur				=	"SVM_2_YouKilledGur"				;//�� ���� ����! � ������ ����� �� ����!
	YouKilledMage				=	"SVM_2_YouKilledMage"				;//�� ���� ����! ��� �� ����������� ��������� ���?
	YouKilledOCfolk				=	"SVM_2_YouKilledOCfolk"				;//���� ������� �� ������� ������, � ���-��� ��������� ���� � ���� ���������...
	YouKilledNCfolk				=	"SVM_2_YouKilledNCfolk"				;//����� ������ ����� ������� ������, �, ������, �� ��������� � �����!
	YouKilledPSIfolk			=	"SVM_2_YouKilledPSIfolk"			;//�������� �������� ������ �� ����� ������, � ��� ����� �� ����� �������!
	GetThingsRight				=	"SVM_2_GetThingsRight"				;//���� ����� ������� �����������!
	YouDefeatedMeWell			=	"SVM_2_YouDefeatedMeWell"			;//��, �� �������. ��� ��� �������� ���, �� ������ ��� ������!
	Smalltalk01					=	"SVM_2_Smalltalk01"					;// ...���� �� �������...
	Smalltalk02					=	"SVM_2_Smalltalk02"					;// ..��, ����� ����...
	Smalltalk03					=	"SVM_2_Smalltalk03"					;// ...��, ��� ���� �� ������� ����...
	Smalltalk04					=	"SVM_2_Smalltalk04"					;// ...� �� ���� � ��� �����������...
	Smalltalk05					=	"SVM_2_Smalltalk05"					;// ...��� ����� �� ��� ��������...
	Smalltalk06					=	"SVM_2_Smalltalk06"					;// ...��, ��������� ��������...
	Smalltalk07					=	"SVM_2_Smalltalk07"					;// ...�� ������, ����� ��� ��� ����, ����� ������������� ����� �� ����.
	Smalltalk08					=	"SVM_2_Smalltalk08"					;// ...������ ����� �� ��������...
	Smalltalk09					=	"SVM_2_Smalltalk09"					;// ...���-�� �� ��� � ���� �������...
	Smalltalk10					=	"SVM_2_Smalltalk10"					;// ...�� ������ ������� �� ���, ��� �������� �����...
	Smalltalk11					=	"SVM_2_Smalltalk11"					;// ...���� ���� �� �������...
	Smalltalk12					=	"SVM_2_Smalltalk12"					;// ...�� �� ������ ������ �����...
	Smalltalk13					=	"SVM_2_Smalltalk13"					;// ...�� ����� �� � ��������� �� ��� �����...
	Smalltalk14					=	"SVM_2_Smalltalk14"					;// ...������ ��� ���� � �� �� �������...
	Smalltalk15					=	"SVM_2_Smalltalk15"					;// ...��������� ����� ������ �� ����...
	Smalltalk16					=	"SVM_2_Smalltalk16"					;// ...��, ���� �������, ����� ��� ���� ������ ��-�������...
	Smalltalk17					=	"SVM_2_Smalltalk17"					;// ...��, ���� ������ �������...
	Smalltalk18					=	"SVM_2_Smalltalk18"					;// ...� ������ �� ������ ������ ��������...
	Smalltalk19					=	"SVM_2_Smalltalk19"					;// ...��� ������ ����-�� - � � ���������� ��������� � ������������, ��� ������ � ������...
	Smalltalk20					=	"SVM_2_Smalltalk20"					;// ...� � ����������, ��� ��� �����-������ ���������...
	Smalltalk21					=	"SVM_2_Smalltalk21"					;// ...������ �����, �� ����...
	Smalltalk22					=	"SVM_2_Smalltalk22"					;// ...������. ����� �� �� ��� �� ����������� �������...
	Smalltalk23					=	"SVM_2_Smalltalk23"					;// ...� �����, ��� �������� ��� ����� �����...
	Smalltalk24					=	"SVM_2_Smalltalk24"					;// ...����� ��������� � ���-������ ���...
	Om							= 	"SVM_2_Om"							;// 
};




instance SVM_3 (C_SVM)				 // Depressiv (Resigniert. Menschliches Gem�se. "Ich schau noch�n bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic					=	"SVM_3_StopMagic"					;//��������� ���������!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"				;//� �� ������ ����� ������ ���������.
	WeaponDown					=	"SVM_3_WeaponDown"					;//����� ���� ������!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"				;//���� �� �� ������� ������, � �� ���� �� �������!
	WatchYourAim				=	"SVM_3_WatchYourAim"				;//�� ������ ���� �����?
	WatchYourAimAngry			=	"SVM_3_WatchYourAimAngry"			;//����� ������, ��� ���� ����� ����!
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"				;//��! ��� ��� �����?
	LetsForgetOurLittleFight	=	"SVM_3_LetsForgetOurLittleFight"	;//�����, ��� ���� ����� ���� ��������� �������������.
	Strange						=	"SVM_3_Strange"						;//�� ���� �� ���, �����?!
	DieMonster					=	"SVM_3_DieMonster"					;//��� �� �� ��� ������, ������ � � ����� �������!
	DieMortalEnemy				=	"SVM_3_DieMortalEnemy"				;//� � ����� ��� ���������!
	NowWait						=	"SVM_3_NowWait"						;//��� ������ ����� ����� ���� ����!
	YouStillNotHaveEnough		=	"SVM_3_YouStillNotHaveEnough"		;//���� ����� ����? ��� �������?
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//��� �������!
	NowWaitIntruder				= 	"SVM_3_NowWaitIntruder"				;//���� ����� �� �����! ������ � ���� ��� ������!
	IWillTeachYouRespectForForeignProperty	=	"SVM_3_IWillTeachYouRespectForForeignProperty"	;//��������, ���� ������ ���� ����� ����� �������, ��� �� ����� �� ���� �� ���������!
	DirtyThief					=	"SVM_3_DirtyThief"					;//�� ������� ����! ��� �� ������?!
	YouAttackedMyCharge			=	"SVM_3_YouAttackedMyCharge"			;//�� ��������� ����! ���� �������� �������� �� ���� ��������!
	YouKilledOneOfUs			=	"SVM_3_YouKilledOneOfUs"			;//�� ���� ������ �� ����� �����! �� �� ��� ��������!
	Dead						=	"SVM_3_Dead"						;//
	Aargh_1						=	"SVM_3_Aargh_1"						;//
	Aargh_2						=	"SVM_3_Aargh_2"						;//
	Aargh_3						=	"SVM_3_Aargh_3"						;//
	Berzerk						=	"SVM_3_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_3_YoullBeSorryForThis"			;//�� ��� �� ���� ���������!
	YesYes						=	"SVM_3_YesYes"						;//���������, �� �������!
	ShitWhatAMonster			=	"SVM_3_ShitWhatAMonster"			;//����! ���� ������ ������!
	Help						=	"SVM_3_Help"						;//��� ���� �������!
	WeWillMeetAgain				=	"SVM_3_WeWillMeetAgain"				;//���� �� �������� ���� �����!
	NeverTryThatAgain			=	"SVM_3_NeverTryThatAgain"			;//������ �������� ������� ��� ��� ���!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"				;//��� ������ ��� ��� ����������!
	ITookYourOre				=	"SVM_3_ITookYourOre"				;//� ������ � ���� ��� ����, �����...
	ShitNoOre					=	"SVM_3_ShitNoOre"					;//� ���� ��� ����? �� ������� ����. ��� �� ���?
	HandsOff					=	"SVM_3_HandsOff"					;//���� �����!
	GetOutOfHere				=	"SVM_3_GetOutOfHere"				;//��������!
	YouViolatedForbiddenTerritory=	"SVM_3_YouViolatedForbiddenTerritory";//��! ������ �� ����� ������?
	YouWannaFoolMe				=	"SVM_3_YouWannaFoolMe"				;//� ���� ���� ��������, ������! ���� �� ����� �� ����!
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"		;//�������� ������!
	WhyAreYouInHere				=	"SVM_3_WhyYouAreInHere"				;//��� ��� ���. �����, ��� � ������ ������!
	WhatDidYouInThere			=	"SVM_3_WhatDidYouInThere"			;//��� ���� �����? ���� �������� ��������, � �� ����!
	WiseMove					=	"SVM_3_WiseMove"					;//�� ��� �������. ������ �� ������ �������!
	Alarm						=	"SVM_3_Alarm"						;//������, �� ���!
	IntruderAlert				= 	"SVM_3_IntruderAlert"				;//�������!
	BehindYou					=	"SVM_3_BehindYou"					;//���������!
	TheresAFight				=	"SVM_3_TheresAFight"				;//�, �����!
	HeyHeyHey					=	"SVM_3_HeyHeyHey"					;//��� ���!
	CheerFight					=	"SVM_3_CheerFight"					;//��� ��� �� �������?
	CheerFriend					=	"SVM_3_CheerFriend"					;//�������� ����!
	Ooh							=	"SVM_3_Ooh"							;//��!
	YeahWellDone				=	"SVM_3_YeahWellDone"				;//��! �������!
	RunCoward					=	"SVM_3_RunCoward"					;//�� ������ �� ���!
	HeDefeatedHim				=	"SVM_3_HeDefeatedHim"				;//�� �� ���� ���!
	HeDeservedIt				=	"SVM_3_HeDeservedIt"				;//����� ���� ���� ��� �������!
	HeKilledHim					=	"SVM_3_HeKilledHim"					;//�� �� �����. �� ���� ���!
	ItWasAGoodFight				=	"SVM_3_ItWasAGoodFight"				;//����� ������ ������� � �����...
	Awake						=	"SVM_3_Awake"						;//����� ����, � ������ ��� ��-�������...
	FriendlyGreetings			=	"SVM_3_FriendlyGreetings"			;//��, ��.
	ALGreetings					=	"SVM_3_ALGreetings"					;//�� ������.
	MageGreetings				=	"SVM_3_MageGreetings"				;//�� ��� �����!
	SectGreetings				=	"SVM_3_SectGreetings"				;//���������!
	ThereHeIs					= 	"SVM_3_ThereHeIs"					;//��������, ��� ��.
	NoLearnNoPoints				= 	"SVM_3_NoLearnNoPoints"				;// �� ������������ ������. � �� ����� ������� ����.
	NoLearnOverMax				= 	"SVM_3_NoLearnOverMax"				;//�� ��������� ������ ��� �����. ���� ����� ��������� ����-������ ���.
	NoLearnYouAlreadyKnow		=	"SVM_3_NoLearnYouAlreadyKnow"		;//�� ������ ��������� �������� ��� �� �����, ������ ����� ����� �� ������� ��������!
	NoLearnYoureBetter			=	"SVM_3_NoLearnYoureBetter"			;//������ �� �������.
	HeyYou						=	"SVM_3_HeyYou"						;//��, ��!
	NotNow						=	"SVM_3_NotNow"						;//� �����.
	WhatDoYouWant				=	"SVM_3_WhatDoYouWant"				;//�� ���-�� ������ �� ����?
	ISaidWhatDoYouWant			=	"SVM_3_ISaidWhatDoYouWant"			;//� ���� ���-�� ������ ����?
	MakeWay						=	"SVM_3_MakeWay"						;//������ ������!
	OutOfMyWay					=	"SVM_3_OutOfMyWay"					;//���� � ������!
	YouDeafOrWhat				=	"SVM_3_YouDeafOrWhat"				;//� �� ���� ������ ���������! ��� ������!
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"		;//�� ����� �������������� �� ������������?
	LookAway					=	"SVM_3_LookAway"					;//� ������ �� �����! ���� ����� �� ����!
	OkayKeepIt					=	"SVM_3_OkayKeepIt"					;//������, ������ ��� ����!
	WhatsThat					=	"SVM_3_WhatsThat"					;//��� ��� ����?
	ThatsMyWeapon				=	"SVM_3_ThatsMyWeapon"				;//��-�����, ��� ��� ������!
	GiveItToMe					=	"SVM_3_GiveItToMe"					;//����� �� �����!
	YouCanKeeptheCrap			=	"SVM_3_YouCanKeeptheCrap"			;//��� ������! ��� ��� ��� ����� �� �����!
	TheyKilledMyFriend			=	"SVM_3_TheyKilledMyFriend"			;//���� ��� ���� �� �����. �� �� ����� ������ ������...
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"		;//����� �� ������� ��� ���?
	SuckerGotSome				=	"SVM_3_SuckerGotSome"				;//��� ����� ���� ������� ������!
	SuckerDefeatedEBr			=	"SVM_3_SuckerDefeatedEBr"			;//�� ������� ������! �� �������������� �� ������������?
	SuckerDefeatedGur			=	"SVM_3_SuckerDefeatedGur"			;//�� ������� ����. ���� ����� �� ������������!
	SuckerDefeatedMage			=	"SVM_3_SuckerDefeatedMage"			;//������ ��� ����� ������ ���� �������� ��������������!
	SuckerDefeatedNov_Guard		= 	"SVM_3_SuckerDefeatedNov_Guard"		;//� ������ ��� �� ������ ����� � �����������!
	SuckerDefeatedVlk_Guard		= 	"SVM_3_SuckerDefeatedVlk_Guard"		;//� ������� ���������. �� ���� �� �������!
	YouDefeatedMyComrade		=	"SVM_3_YouDefeatedMyComrade"		;//�� ����� ����� ���������!
	YouDefeatedNOV_Guard		=	"SVM_3_YouDefeatedNOV_Guard"		;//� ������� �����������. ������ �� � �����!
	YouDefeatedVLK_Guard		=	"SVM_3_YouDefeatedVLK_Guard"		;//�������� ������ ��� �� ������ �� �������� ������! ������ �������� �� �������!
	YouStoleFromMe				=	"SVM_3_YouStoleFromMe"				;//�� ������� ����, ������� ���!
	YouStoleFromUs				=	"SVM_3_YouStoleFromUs"				;//� ���� ���� ��, ��� ����������� ���. ����� ����������!
	YouStoleFromEBr				=	"SVM_3_YouStoleFromEBr"				;//��� ��� ��! �� ������� �������! ��� ���� ����� �� �������!
	YouStoleFromGur				=	"SVM_3_YouStoleFromGur"				;//�� ������� ����! ����, �� ��� ��� ����� �� ����!
	StoleFromMage				=	"SVM_3_StoleFromMage"				;//�� �� ������� �����, ���� �� ���� �������� ���� � �����!
	YouKilledMyFriend			=	"SVM_3_YouKilledMyFriend"			;//�� ���� ������ �� ����� �����! �������� ������ ������� �� ����-������ ����, � ���� �� ������������!
	YouKilledEBr				=	"SVM_3_YouKilledEBr"				;//�� ���� ������! � ���� ���, ��� �� ������� �� ����� � ����?
	YouKilledGur				=	"SVM_3_YouKilledGur"				;//�� ���� ����?! ����� �� ����� ����. � �� ����!
	YouKilledMage				=	"SVM_3_YouKilledMage"				;//�� ���� ����! � ���� ���� ��������� ����������?
	YouKilledOCfolk				=	"SVM_3_YouKilledOCfolk"				;//� ������ ������ ���� �������. ����� �����, ��� �� � ���� ���-�� �������...
	YouKilledNCfolk				=	"SVM_3_YouKilledNCfolk"				;//� ����� ������ ��������� ��������. �������, ��� ��� ���� �� ��������.
	YouKilledPSIfolk			=	"SVM_3_YouKilledPSIfolk"			;//�������� �������� ������ �� ����� ��������������, � ��� ����� ��� ����!
	GetThingsRight				=	"SVM_3_GetThingsRight"				;//�� �� ������� ���� �� ���������������!
	YouDefeatedMeWell			=	"SVM_3_YouDefeatedMeWell"			;//�� ������� ���� � ������� ���! � �� � �����!
	Smalltalk01					=	"SVM_3_Smalltalk01"					;// ...��� �� ��������...
	Smalltalk02					=	"SVM_3_Smalltalk02"					;// ...��������...
	Smalltalk03					=	"SVM_3_Smalltalk03"					;// ...�� ����� ������ �������...
	Smalltalk04					=	"SVM_3_Smalltalk04"					;// ...�� ����� � �������� �� �������...
	Smalltalk05					=	"SVM_3_Smalltalk05"					;// ...����� �������� �� ��� ����...
	Smalltalk06					=	"SVM_3_Smalltalk06"					;// ...��� ����� ���� ����, ��� ���� ���� �� ��������...
	Smalltalk07					=	"SVM_3_Smalltalk07"					;// ...������ ����� ����, ������ �� ����� ������������...
	Smalltalk08					=	"SVM_3_Smalltalk08"					;// ...����� �� ���� ������ �� ��������...
	Smalltalk09					=	"SVM_3_Smalltalk09"					;// ...���������, � � ���� ���-�� ����...
	Smalltalk10					=	"SVM_3_Smalltalk10"					;// ...����� ������, ������ ��� ���-������ ��������...
	Smalltalk11					=	"SVM_3_Smalltalk11"					;// ...� �� ���� ��������� � ����� ����...
	Smalltalk12					=	"SVM_3_Smalltalk12"					;// ...������ ������ �����, ��� �������...
	Smalltalk13					=	"SVM_3_Smalltalk13"					;// ...�� ����� �� �, ����� �� ���� ��������� ��� ��...
	Smalltalk14					=	"SVM_3_Smalltalk14"					;// ...��� ����� ���� � �� ��...
	Smalltalk15					=	"SVM_3_Smalltalk15"					;// ...�������� ����������, � ����� ��� ����...
	Smalltalk16					=	"SVM_3_Smalltalk16"					;// ...������ ��� ���� ������� �����, �� ��, ��� ������...
	Smalltalk17					=	"SVM_3_Smalltalk17"					;// ...� ������ ������ ������� ���� �� ������...
	Smalltalk18					=	"SVM_3_Smalltalk18"					;// ...������ �� ���� ������� ��� ��������...
	Smalltalk19					=	"SVM_3_Smalltalk19"					;// ...����� ������ ������ ��������, ������ ������� ����� ����������, �������...
	Smalltalk20					=	"SVM_3_Smalltalk20"					;// ...�� �����, ��� ����� ���� ���-������ ���������...
	Smalltalk21					=	"SVM_3_Smalltalk21"					;// ...��������, �� ����...
	Smalltalk22					=	"SVM_3_Smalltalk22"					;// ...���� ������� �����. ������ �� ������� �� �����...
	Smalltalk23					=	"SVM_3_Smalltalk23"					;// ...� �����, ��� ��� ����� �������� ������...
	Smalltalk24					=	"SVM_3_Smalltalk24"					;// ...��� �� ������� ���������, ��������� � ���-������ ������...
	Om							= 	"SVM_3_Om"							;// 
};


instance SVM_4 (C_SVM)				// Alter Sack,  (Torrez, KDF-Magier, alte Buddler....), alter Hase. Kann Gr�nschn�beln noch was zeigen
{
	StopMagic					=	"SVM_4_StopMagic"					;//����� ������ ������������ �����!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"				;//��� ���� �����: ��������� ���������!
	WeaponDown					=	"SVM_4_WeaponDown"					;//����� ������, ���� �� ������ �������!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"				;//������ �� ����� ������!
	WatchYourAim				=	"SVM_4_WatchYourAim"				;//��������� � ���� ��������!
	WatchYourAimAngry			=	"SVM_4_WatchYourAimAngry"			;//���� �� ������� ��� �������, � ��� �� ������!
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"				;//��! ������, ��� �������!
	LetsForgetOurLittleFight	=	"SVM_4_LetsForgetOurLittleFight"	;//����� ������� �� ���� �����, �����?
	Strange						=	"SVM_4_Strange"						;//��, ������! ��� ��?
	DieMonster					=	"SVM_4_DieMonster"					;//�� ������, � ������ ��, � ��� ��� ���� � ����!
	DieMortalEnemy				=	"SVM_4_DieMortalEnemy"				;//�� ���, ���� �� ����!
	NowWait						=	"SVM_4_NowWait"						;//������ � ���� �����, ��� ���� �����...
	YouStillNotHaveEnough		=	"SVM_4_YouStillNotHaveEnough"		;//��� ���� ��� ����?
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//�� ��� ����������!
	NowWaitIntruder				= 	"SVM_4_NowWaitIntruder"				;//���� �� ������ ���� ��������!
	IWillTeachYouRespectForForeignProperty	=	"SVM_4_IWillTeachYouRespectForForeignProperty"	;//�� �������, ��� ������ ������������ �������� ����?
	DirtyThief					=	"SVM_4_DirtyThief"					;//�� ������ ���� ���������!
	YouAttackedMyCharge			=	"SVM_4_YouAttackedMyCharge"			;//���� �� ������ � ��� �����, ��� ������ �� ��������!
	YouKilledOneOfUs			=	"SVM_4_YouKilledOneOfUs"			;//�� ���� ������ ��������! ������ �� ����� ����!
	Dead						=	"SVM_4_Dead"						;//
	Aargh_1						=	"SVM_4_Aargh_1"						;//
	Aargh_2						=	"SVM_4_Aargh_2"						;//
	Aargh_3						=	"SVM_4_Aargh_3"						;//
	Berzerk						=	"SVM_4_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_4_YoullBeSorryForThis"			;//�� ��� ��������� �� ����!
	YesYes						=	"SVM_4_YesYes"						;//������, ������, �� �������!
	ShitWhatAMonster			=	"SVM_4_ShitWhatAMonster"			;//������ ������! ������!
	Help						=	"SVM_4_Help"						;//� ������� ���� ��� �����!
	WeWillMeetAgain				=	"SVM_4_WeWillMeetAgain"				;//� ��� ���� ��������!
	NeverTryThatAgain			=	"SVM_4_NeverTryThatAgain"			;//������ ��� �� �����!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"				;//� ��� ������ �, �������, ������ ����!
	ITookYourOre				=	"SVM_4_ITookYourOre"				;//�����, � ���� ����� ��������� ��������� ���� ����.
	ShitNoOre					=	"SVM_4_ShitNoOre"					;//���� ��! �� ������� ����...
	HandsOff					=	"SVM_4_HandsOff"					;//����� ����!
	GetOutOfHere				=	"SVM_4_GetOutOfHere"				;//�������� ������!
	YouViolatedForbiddenTerritory=	"SVM_4_YouViolatedForbiddenTerritory";//���� ����� ������ ������!
	YouWannaFoolMe				=	"SVM_4_YouWannaFoolMe"				;//��� ������ �� �� �����!
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"		;//��! ��� �� ����� �������?
	WhyAreYouInHere				=	"SVM_4_WhyYouAreInHere"				;//��������, ��� ���� ������� ������!
	WhatDidYouInThere			=	"SVM_4_WhatDidYouInThere"			;//��� �� ����� �����?
	WiseMove					=	"SVM_4_WiseMove"					;//�� ���� ��� ���� �������.
	Alarm						=	"SVM_4_Alarm"						;//������! ����!
	IntruderAlert				= 	"SVM_4_IntruderAlert"				;//�����!
	BehindYou					=	"SVM_4_BehindYou"					;//���������!
	TheresAFight				=	"SVM_4_TheresAFight"				;//����� �����.
	HeyHeyHey					=	"SVM_4_HeyHeyHey"					;//�����!
	CheerFight					=	"SVM_4_CheerFight"					;//� ��� ���?
	CheerFriend					=	"SVM_4_CheerFriend"					;//����� ���!
	Ooh							=	"SVM_4_Ooh"							;//�� ��� �� ���!
	YeahWellDone				=	"SVM_4_YeahWellDone"				;//�������!
	RunCoward					=	"SVM_4_RunCoward"					;//���� ���� ����� �������!
	HeDefeatedHim				=	"SVM_4_HeDefeatedHim"				;//�����-�� ���� ���� �������!
	HeDeservedIt				=	"SVM_4_HeDeservedIt"				;//��� �������!
	HeKilledHim					=	"SVM_4_HeKilledHim"					;//�� ���� ���! ��� ���� ������� ������!
	ItWasAGoodFight				=	"SVM_4_ItWasAGoodFight"				;//������ ���� ��������� �����, ��� ������.
	Awake						=	"SVM_4_Awake"						;// 
	FriendlyGreetings			=	"SVM_4_FriendlyGreetings"			;//����������� ����!
	ALGreetings					=	"SVM_4_ALGreetings"					;//�� ������!
	MageGreetings				=	"SVM_4_MageGreetings"				;//�� ��� �����!
	SectGreetings				=	"SVM_4_SectGreetings"				;//���������! 
	ThereHeIs					= 	"SVM_4_ThereHeIs"					;//�� ������� ��� ��� ���!
	NoLearnNoPoints				= 	"SVM_4_NoLearnNoPoints"				;//� �� ����� ������ ������� ����. ���� �� ������� �����.
	NoLearnOverMax				= 	"SVM_4_NoLearnOverMax"				;//�� �� ������� ��� �������. ����� ����� ���-������ ������.
	NoLearnYouAlreadyKnow		=	"SVM_4_NoLearnYouAlreadyKnow"		;//�������� ������� � ������, ������ ��� �� ������� ����� �� ���������� ����������.
	NoLearnYoureBetter			=	"SVM_4_NoLearnYoureBetter"			;//������ ��� �����!
	HeyYou						=	"SVM_4_HeyYou"						;//��, ��!
	NotNow						=	"SVM_4_NotNow"						;//�� ������!
	WhatDoYouWant				=	"SVM_4_WhatDoYouWant"				;//��� ���� �����?
	ISaidWhatDoYouWant			=	"SVM_4_ISaidWhatDoYouWant"			;//�� ���-�� ������ �� ����?
	MakeWay						=	"SVM_4_MakeWay"						;//��� ������!
	OutOfMyWay					=	"SVM_4_OutOfMyWay"					;//���� � ������!
	YouDeafOrWhat				=	"SVM_4_YouDeafOrWhat"				;//� ������ ��� ���������!
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"		;//�� ����� ������ ��������?
	LookAway					=	"SVM_4_LookAway"					;//�� ����, �� ����� � ������ ������ �� �����...
	OkayKeepIt					=	"SVM_4_OkayKeepIt"					;//��, ������ ����!
	WhatsThat					=	"SVM_4_WhatsThat"					;//��� �� ����������?
	ThatsMyWeapon				=	"SVM_4_ThatsMyWeapon"				;//� ��-��, ����� ��� ������!
	GiveItToMe					=	"SVM_4_GiveItToMe"					;//����� ����, � ������!
	YouCanKeeptheCrap			=	"SVM_4_YouCanKeeptheCrap"			;//�����, ��� ������! � ����� ����� ���������� �� ����� �����!
	TheyKilledMyFriend			=	"SVM_4_TheyKilledMyFriend"			;//��� ������ � ����� ����, ��� ���� ������ ��������, � ���...
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"		;//��, ����� �� �������� ����?
	SuckerGotSome				=	"SVM_4_SuckerGotSome"				;//���, ��������, ��! ��� ������ ���� �� ������!
	SuckerDefeatedEBr			=	"SVM_4_SuckerDefeatedEBr"			;//�� ������� ������.  
	SuckerDefeatedGur			=	"SVM_4_SuckerDefeatedGur"			;//�� ����� ������ �� ����. ������ �� �����, ��� ���� �������� ��������� ����� '������'.
	SuckerDefeatedMage			=	"SVM_4_SuckerDefeatedMage"			;//��� �� ������� ����? �������� ���� �� ��������!
	SuckerDefeatedNov_Guard		= 	"SVM_4_SuckerDefeatedNov_Guard"		;//�� �� ������ �� ��� �����! ������ ���� ����� �����������!
	SuckerDefeatedVlk_Guard		= 	"SVM_4_SuckerDefeatedVlk_Guard"		;//��� �� ���� �����? �������, �� ����� ������ � �������, ���� �� ������ ���� ���������?
	YouDefeatedMyComrade		=	"SVM_4_YouDefeatedMyComrade"		;//�� ������ ������ �� ���� ������! �� ������ ����� ������!
	YouDefeatedNOV_Guard		=	"SVM_4_YouDefeatedNOV_Guard"		;//������ �������� ��� ��� ������� ����������. �� ����� �� �� ���� ���������!
	YouDefeatedVLK_Guard		=	"SVM_4_YouDefeatedVLK_Guard"		;//������� �� ������������. ��������� ������� ���� ����������, ����� ��������!
	YouStoleFromMe				=	"SVM_4_YouStoleFromMe"				;//����� ���� ������� ���� �������� �� ���� �����!
	YouStoleFromUs				=	"SVM_4_YouStoleFromUs"				;//� ���� ���� ���� ����. ����� �����!
	YouStoleFromEBr				=	"SVM_4_YouStoleFromEBr"				;//� ��� �����! �� ������� �������! ��� ���� � ����� �� �������!
	YouStoleFromGur				=	"SVM_4_YouStoleFromGur"				;//�� ������� ����! ����� ���� ��������� �� ����!
	StoleFromMage				=	"SVM_4_StoleFromMage"				;//���� ������ �� �����, ����� ���-�� ���������� �� �� �����!
	YouKilledMyFriend			=	"SVM_4_YouKilledMyFriend"			;//�������� ������ �� ����� ����� �� ����� �������. ��� ��� ����������, � ������ ���������!
	YouKilledEBr				=	"SVM_4_YouKilledEBr"				;//�� ���� ������! ������ ����������� ��� ����� �� ���!
	YouKilledGur				=	"SVM_4_YouKilledGur"				;//�� ���� ����! ���, � �� ����, ����� �� ����� ����!
	YouKilledMage				=	"SVM_4_YouKilledMage"				;//�� ���� ����! ���, ��� ����� ���� ��������� �������?
	YouKilledOCfolk				=	"SVM_4_YouKilledOCfolk"				;//� ������ ������ ����� ������� ��������. ���-��� �������, ��� � ���� ������� ��...
	YouKilledNCfolk				=	"SVM_4_YouKilledNCfolk"				;//� ����� ������ �� ����������� ������ ��������, � �������, ��� �� ������ � ���� ���������!
	YouKilledPSIfolk			=	"SVM_4_YouKilledPSIfolk"			;//� �������� ���� ���� �� ��������������. ���� ������, ��� �� ������� � ��� ��������!
	GetThingsRight				=	"SVM_4_GetThingsRight"				;//���� �� �����������. �� �� ��� ���������!
	YouDefeatedMeWell			=	"SVM_4_YouDefeatedMeWell"			;//�� ������� ���� � ������� ���! �� ������ ��� ������! � �� � �����!
	Smalltalk01					=	"SVM_4_Smalltalk01"					;// ...��� �� ��������...
	Smalltalk02					=	"SVM_4_Smalltalk02"					;// ...��������...
	Smalltalk03					=	"SVM_4_Smalltalk03"					;// ...�� ����� ������ �������...
	Smalltalk04					=	"SVM_4_Smalltalk04"					;// ...�� ����� � �������� �� �������...
	Smalltalk05					=	"SVM_4_Smalltalk05"					;// ...����� �������� �� ��� ����...
	Smalltalk06					=	"SVM_4_Smalltalk06"					;// ...��� ����� ���� ����, ��� ���� ���� �� ��������...
	Smalltalk07					=	"SVM_4_Smalltalk07"					;// ...������ ����� ����, ������ �� ����� ������������...
	Smalltalk08					=	"SVM_4_Smalltalk08"					;// ...����� �� ���� ������ �� ��������...
	Smalltalk09					=	"SVM_4_Smalltalk09"					;// ...���������, � � ���� ���-�� ����...
	Smalltalk10					=	"SVM_4_Smalltalk10"					;// ...����� ������, ������ ��� ���-������ ��������...
	Smalltalk11					=	"SVM_4_Smalltalk11"					;// ...� �� ���� ��������� � ����� ����...
	Smalltalk12					=	"SVM_4_Smalltalk12"					;// ...������ ������ �����, ��� �������...
	Smalltalk13					=	"SVM_4_Smalltalk13"					;// ...�� ����� �� �, ����� �� ���� ��������� ��� ��...
	Smalltalk14					=	"SVM_4_Smalltalk14"					;// ...��� ����� ���� � �� ��...
	Smalltalk15					=	"SVM_4_Smalltalk15"					;// ...�������� ����������, � ����� ��� ����...
	Smalltalk16					=	"SVM_4_Smalltalk16"					;// ...������ ��� ���� ������� �����, �� ��, ��� ������...
	Smalltalk17					=	"SVM_4_Smalltalk17"					;// ...� ������ ������ ������� ���� �� ������...
	Smalltalk18					=	"SVM_4_Smalltalk18"					;// ...������ �� ���� ������� ��� ��������...
	Smalltalk19					=	"SVM_4_Smalltalk19"					;// ...����� ������ ������ ��������, ������ ������� ����� ����������...
	Smalltalk20					=	"SVM_4_Smalltalk20"					;// ...�� �����, ��� ����� ���� ���-������ ���������...
	Smalltalk21					=	"SVM_4_Smalltalk21"					;// ...��������, �� ����...
	Smalltalk22					=	"SVM_4_Smalltalk22"					;// ...���� ������� �����. ������ �� ������� �� �����...
	Smalltalk23					=	"SVM_4_Smalltalk23"					;// ...� �����, ��� ��� ����� �������� ������...
	Smalltalk24					=	"SVM_4_Smalltalk24"					;// ...��� �� ������� ���������, ��������� � ���-������ ������...
	Om							= 	"SVM_4_Om"							;//
};


instance SVM_5 (C_SVM)				//Lebensk�nstler, offen, Fr�hlich. humorvoller Verarscher. Auch: Fauler Verpisser. Selbstbewu�t, wortgewandt, charismatisch. (Lester)
{
	StopMagic					=	"SVM_5_StopMagic"					;//����� ��������� ���������!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//� �� ������: ��������� ���������!
	WeaponDown					=	"SVM_5_WeaponDown"					;//����� �� �� ������� ���� ������!
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//������ ����� ������!
	WatchYourAim				=	"SVM_5_WatchYourAim"				;//�� � ���� ��������, ��?
	WatchYourAimAngry			=	"SVM_5_WatchYourAimAngry"			;//��������! � ���� ����� ������������� �������?
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//��, �� ���, ������ �����?
	LetsForgetOurLittleFight	=	"SVM_5_LetsForgetOurLittleFight"	;//����� ������� �� ���� �����, �����?
	Strange						=	"SVM_5_Strange"						;//�� �� ������ ��� ��� �����! ���� �� �����? 
	DieMonster					=	"SVM_5_DieMonster"					;//������ ���� �������, �������!
	DieMortalEnemy				=	"SVM_5_DieMortalEnemy"				;//������ ��� ��������!
	NowWait						=	"SVM_5_NowWait"						;//�������� �������? ������ � ����� ���� �� ���!
	YouStillNotHaveEnough		=	"SVM_5_YouStillNotHaveEnough"		;//�, ���� ��� ��� ����!
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//��, ��� �������!
	NowWaitIntruder				= 	"SVM_5_NowWaitIntruder"				;//���� �������� ������� ������!
	IWillTeachYouRespectForForeignProperty	=	"SVM_5_IWillTeachYouRespectForForeignProperty"	;//� ���� �����������. ������ �������� ���-������ �������!
	DirtyThief					=	"SVM_5_DirtyThief"					;//���! ��, ������ �� ��������!
	YouAttackedMyCharge			=	"SVM_5_YouAttackedMyCharge"			;//���� ������ ����� �� ���, �� ������ ���������!
	YouKilledOneOfUs			=	"SVM_5_YouKilledOneOfUs"			;//�� ���� ������ �� ���� �����. ������ ���� �������!
	Dead						=	"SVM_5_Dead"					;//
	Aargh_1						=	"SVM_5_Aargh_1"						;//
	Aargh_2						=	"SVM_5_Aargh_2"						;//
	Aargh_3						=	"SVM_5_Aargh_3"						;//
	Berzerk						=	"SVM_5_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_5_YoullBeSorryForThis"			;//�� ��� ��������� �� ����!
	YesYes						=	"SVM_5_YesYes"						;//��, ��������! �� ���� �������.
	ShitWhatAMonster			=	"SVM_5_ShitWhatAMonster"			;//��� ��� �� �������!
	Help						=	"SVM_5_Help"						;//����!
	WeWillMeetAgain				=	"SVM_5_WeWillMeetAgain"				;//� ��������� ��� � ������ ����!
	NeverTryThatAgain			=	"SVM_5_NeverTryThatAgain"			;//� �� ������� ���������!
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//����� ������� ������!
	ITookYourOre				=	"SVM_5_ITookYourOre"				;//��, ���� ���� ����� ������! � ������� �� � �������!
	ShitNoOre					=	"SVM_5_ShitNoOre"					;//�� �������! ���� ���!
	HandsOff					=	"SVM_5_HandsOff"					;//���� �����!
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//����� ���!
	YouViolatedForbiddenTerritory=	"SVM_5_YouViolatedForbiddenTerritory";//��! ������ �� ������?
	YouWannaFoolMe				=	"SVM_5_YouWannaFoolMe"				;//������� �����!
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//��� ���� ����� �����? ��� �� ����������?
	WhyAreYouInHere				=	"SVM_5_WhyYouAreInHere"				;//��������, ��� ���� ������� ������!
	WhatDidYouInThere			=	"SVM_5_WhatDidYouInThere"			;//����� ���� ������ ������!
	WiseMove					=	"SVM_5_WiseMove"					;//�� ��� ����� ���������!
	Alarm						=	"SVM_5_Alarm"						;//������! ����!
	IntruderAlert				= 	"SVM_5_IntruderAlert"				;//�������!
	BehindYou					=	"SVM_5_BehindYou"					;//��, ���������!
	TheresAFight				=	"SVM_5_TheresAFight"				;//����� �����!
	HeyHeyHey					=	"SVM_5_HeyHeyHey"					;//��� ���!
	CheerFight					=	"SVM_5_CheerFight"					;//��� ���!
	CheerFriend					=	"SVM_5_CheerFriend"					;//������ ���!
	Ooh							=	"SVM_5_Ooh"							;//��, ���� ����������!
	YeahWellDone				=	"SVM_5_YeahWellDone"				;//��� ������!
	RunCoward					=	"SVM_5_RunCoward"					;//���� ���� �� ��� ������!
	HeDefeatedHim				=	"SVM_5_HeDefeatedHim"				;//������ ������, ��!
	HeDeservedIt				=	"SVM_5_HeDeservedIt"				;//��� ��� � ����!
	HeKilledHim					=	"SVM_5_HeKilledHim"					;//�� ������! ��� �����������! � ���� ����� ��������!
	ItWasAGoodFight				=	"SVM_5_ItWasAGoodFight"				;//�������� �����!
	Awake						=	"SVM_5_Awake"						;// 
	FriendlyGreetings			=	"SVM_5_FriendlyGreetings"			;//������, �������!
	ALGreetings					=	"SVM_5_ALGreetings"					;//�� ������!
	MageGreetings				=	"SVM_5_MageGreetings"				;//�� ��� �����!
	SectGreetings				=	"SVM_5_SectGreetings"				;//���������! 
	ThereHeIs					= 	"SVM_5_ThereHeIs"					;//��� ����.
	NoLearnNoPoints				= 	"SVM_5_NoLearnNoPoints"				;//� ������ �� ����� ������� ����, ���� �� ������� �����.
	NoLearnOverMax				= 	"SVM_5_NoLearnOverMax"				;//�� ������ ���, ��� �����. ���� ����� ��������� ����-������ ���.
	NoLearnYouAlreadyKnow		=	"SVM_5_NoLearnYouAlreadyKnow"		;//���������� �������� �� ��������. ���� ����� ������ �����!
	NoLearnYoureBetter			=	"SVM_5_NoLearnYoureBetter"			;//���� ���������� ������!
	HeyYou						=	"SVM_5_HeyYou"						;//��, ������!
	NotNow						=	"SVM_5_NotNow"						;//� ���� ��� �������.
	WhatDoYouWant				=	"SVM_5_WhatDoYouWant"				;//� ���� ������ ����?
	ISaidWhatDoYouWant			=	"SVM_5_ISaidWhatDoYouWant"			;//��� ���� �����?
	MakeWay						=	"SVM_5_MakeWay"						;//��� ������!
	OutOfMyWay					=	"SVM_5_OutOfMyWay"					;//�����, ����� � ������!
	YouDeafOrWhat				=	"SVM_5_YouDeafOrWhat"				;//���� ����� ������������? � ���� ���� ��� ��������!
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//�� ����� ������ ��������?
	LookAway					=	"SVM_5_LookAway"					;//� ������ �� �����... � ���, ���-�� ���������?
	OkayKeepIt					=	"SVM_5_OkayKeepIt"					;//�����, ������� ����!
	WhatsThat					=	"SVM_5_WhatsThat"					;//��� ���������?
	ThatsMyWeapon				=	"SVM_5_ThatsMyWeapon"				;//� ���� ������� ���� ������!
	GiveItToMe					=	"SVM_5_GiveItToMe"					;//������ ����� ��� ���!
	YouCanKeeptheCrap			=	"SVM_5_YouCanKeeptheCrap"			;//��, ��� �� ��� �� � �����! � ���� ��� ����!
	TheyKilledMyFriend			=	"SVM_5_TheyKilledMyFriend"			;//���� ��� �������. �� � ������ ����, ��� ��� ������...
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//��, � ��� ����? ����� �� ���� ��������?
	SuckerGotSome				=	"SVM_5_SuckerGotSome"				;//��? �� �������? ��� ����� ���� ������!
	SuckerDefeatedEBr			=	"SVM_5_SuckerDefeatedEBr"			;//�� ������� ������. ��� �� �� ��� �������!
	SuckerDefeatedGur			=	"SVM_5_SuckerDefeatedGur"			;//�� ������� ����. �� �� �����! �� ���� �� �����, ��� � ��������� ��� ��� ������ ���� � ���.
	SuckerDefeatedMage			=	"SVM_5_SuckerDefeatedMage"			;//�� ������� ����... ����������! �� � ����� �� ��!
	SuckerDefeatedNov_Guard		= 	"SVM_5_SuckerDefeatedNov_Guard"		;//�� ������ �����������! �� ����� � ���?
	SuckerDefeatedVlk_Guard		= 	"SVM_5_SuckerDefeatedVlk_Guard"		;//�� ����� ����� ���������? ���� ��� ��������!
	YouDefeatedMyComrade		=	"SVM_5_YouDefeatedMyComrade"		;//����� �� ������ ����� ���������?
	YouDefeatedNOV_Guard		=	"SVM_5_YouDefeatedNOV_Guard"		;//������ ����� ����������, � �� � ���� ����� �������!
	YouDefeatedVLK_Guard		=	"SVM_5_YouDefeatedVLK_Guard"		;//�� ��������� ����! � ������� ���� �����. ������� �� ���� �������, ����� �� ����! 
	YouStoleFromMe				=	"SVM_5_YouStoleFromMe"				;//��� �� ������ �������� ����, ������� ���!
	YouStoleFromUs				=	"SVM_5_YouStoleFromUs"				;//� ���� ���� ��, ��� ����������� ���. ����� �� �� ����� ��� ��� �����������!
	YouStoleFromEBr				=	"SVM_5_YouStoleFromEBr"				;//��, �� �����! �� �� ������� ������ �������! ��� �� ������� ���� � �����!
	YouStoleFromGur				=	"SVM_5_YouStoleFromGur"				;//�� ������� ����! ���������� �� ���������� �� �� �����!
	StoleFromMage				=	"SVM_5_StoleFromMage"				;//�� ����� �������� ��, ��� ����������� �����. ����� ��� ������� �� �����!
	YouKilledMyFriend			=	"SVM_5_YouKilledMyFriend"			;//�� ���� ������ �� ����� �����. ��������� �������� �������, � ���� �� ������������!
	YouKilledEBr				=	"SVM_5_YouKilledEBr"				;//�� ���� ������� ������! �� ���, ������ ������� ������?
	YouKilledGur				=	"SVM_5_YouKilledGur"				;//�� ���� ����! ����� ����!
	YouKilledMage				=	"SVM_5_YouKilledMage"				;//�� ���� ����! � ���� ���� ��������� ����������?
	YouKilledOCfolk				=	"SVM_5_YouKilledOCfolk"				;//� ������ ������ ��� ���� �������. ����� �����, ��� �� ��������� � �����...
	YouKilledNCfolk				=	"SVM_5_YouKilledNCfolk"				;//� ����� ������ ��������� ��������. �������, �� ���-�� ������� � ����!
	YouKilledPSIfolk			=	"SVM_5_YouKilledPSIfolk"			;//�������� �������� ������ �� ����� ������������. ��� ����� ��� ����!
	GetThingsRight				=	"SVM_5_GetThingsRight"				;//�� ����� �� � ������� � �������� ���������!
	YouDefeatedMeWell			=	"SVM_5_YouDefeatedMeWell"			;//�� ������� � ������� ���. �� ������ ������� �� ���� �����!
	Smalltalk01					=	"SVM_5_Smalltalk01"					;// ...�� ������ �������...
	Smalltalk02					=	"SVM_5_Smalltalk02"					;// ...��������...
	Smalltalk03					=	"SVM_5_Smalltalk03"					;// ...��, ������ ���� ��������...
	Smalltalk04					=	"SVM_5_Smalltalk04"					;// ...� �� ���� �����������...
	Smalltalk05					=	"SVM_5_Smalltalk05"					;// ...��� �� �� ��� ����...
	Smalltalk06					=	"SVM_5_Smalltalk06"					;// ...�������, ��� ������ ��� �� �������...
	Smalltalk07					=	"SVM_5_Smalltalk07"					;// ...������� ��� � �����, ����� ����� ����� �� �����.
	Smalltalk08					=	"SVM_5_Smalltalk08"					;// ...�� ���� ������ �� ��������...
	Smalltalk09					=	"SVM_5_Smalltalk09"					;// ...������, � � ���� ���-�� ����...
	Smalltalk10					=	"SVM_5_Smalltalk10"					;// ...����� ������ �������� ��� ������...
	Smalltalk11					=	"SVM_5_Smalltalk11"					;// ...� �� ��������� � ����� ����...
	Smalltalk12					=	"SVM_5_Smalltalk12"					;// ...������ ������ �����, ��� �������...
	Smalltalk13					=	"SVM_5_Smalltalk13"					;// ...�� ����� �� � ������� � �������� ���������...
	Smalltalk14					=	"SVM_5_Smalltalk14"					;// ...������� ����� ��������� ���� � �� ��...
	Smalltalk15					=	"SVM_5_Smalltalk15"					;// ...��� ����� �� �������� �����...
	Smalltalk16					=	"SVM_5_Smalltalk16"					;// ...��, ������ ��� ���� ������� �����...
	Smalltalk17					=	"SVM_5_Smalltalk17"					;// ...�� ���� ������� ����� �������...
	Smalltalk18					=	"SVM_5_Smalltalk18"					;// ...��� ��� ������� ��� �������...
	Smalltalk19					=	"SVM_5_Smalltalk19"					;// ...����� ������ ������ ��������, ������ ����� ��������...
	Smalltalk20					=	"SVM_5_Smalltalk20"					;// ...�� �����, ��� ����� ����� ���� ���-������ ��������...
	Smalltalk21					=	"SVM_5_Smalltalk21"					;// ...����� ����, ��� ������...
	Smalltalk22					=	"SVM_5_Smalltalk22"					;// ...� ���� ���� ������� - ������� �����, � ����� ����� �����...
	Smalltalk23					=	"SVM_5_Smalltalk23"					;// ...��� ��������, ��� ��� �������� ����� ��� ������...
	Smalltalk24					=	"SVM_5_Smalltalk24"					;// ...����� ����� ������ ����...
	Om							= 	"SVM_5_Om"							;//
};

//////////////////////////////////////////
instance SVM_6 (C_SVM)				//Raufbold	(Will saufen und raufen	(Matrose) Alkoholiker. Gr�lt viel)
{
	StopMagic					=	"SVM_6_StopMagic"					;//����� ��������� ���������!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"				;//� �� ������: ��������� ���������!
	WeaponDown					=	"SVM_6_WeaponDown"					;//����� �� �� ������� ���� ������!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"				;//������ ����� ������!
	WatchYourAim				=	"SVM_6_WatchYourAim"				;//�� � ���� ��������, ��?
	WatchYourAimAngry			=	"SVM_6_WatchYourAimAngry"			;//��������! � ���� ����� ������������� �������?
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"				;//��, �� ���, ������ �����?
	LetsForgetOurLittleFight	=	"SVM_6_LetsForgetOurLittleFight"	;//����� ������� �� ���� �����, �����?
	Strange						=	"SVM_6_Strange"						;//�� �� ������ ��� ��� �����! ���� �� �����?
	DieMonster					=	"SVM_6_DieMonster"					;//������ ���� �������, �������!
	DieMortalEnemy				=	"SVM_6_DieMortalEnemy"				;//������ ��� ��������!
	NowWait						=	"SVM_6_NowWait"						;//�������� �������? ������ � ����� ���� �� ���!
	YouStillNotHaveEnough		=	"SVM_6_YouStillNotHaveEnough"		;//�, ���� ��� ��� ����!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//��, ��� �������!
	NowWaitIntruder				= 	"SVM_6_NowWaitIntruder"				;//���� �������� ������� ������!
	IWillTeachYouRespectForForeignProperty	=	"SVM_6_IWillTeachYouRespectForForeignProperty"	;//� ���� �����������. ������ �������� ���-������ �������!
	DirtyThief					=	"SVM_6_DirtyThief"					;//���! ��, ������ �� ��������!
	YouAttackedMyCharge			=	"SVM_6_YouAttackedMyCharge"			;//���� ������ ����� �� ���, �� ������ ���������!
	YouKilledOneOfUs			=	"SVM_6_YouKilledOneOfUs"			;//�� ���� ������ �� ���� �����. ������ ���� �������!
	Dead						=	"SVM_6_Dead"						;//
	Aargh_1						=	"SVM_6_Aargh_1"						;//
	Aargh_2						=	"SVM_6_Aargh_2"						;//
	Aargh_3						=	"SVM_6_Aargh_3"						;//
	Berzerk						=	"SVM_6_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_6_YoullBeSorryForThis"			;//�� ��� ��������� �� ����!
	YesYes						=	"SVM_6_YesYes"						;//��, ��������! �� ���� �������.
	ShitWhatAMonster			=	"SVM_6_ShitWhatAMonster"			;//��� ��� �� �������!
	Help						=	"SVM_6_Help"						;//����!
	WeWillMeetAgain				=	"SVM_6_WeWillMeetAgain"				;//� ��������� ��� � ������ ����!
	NeverTryThatAgain			=	"SVM_6_NeverTryThatAgain"			;//� �� ������� ���������!
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"				;//����� ������� ������!
	ITookYourOre				=	"SVM_6_ITookYourOre"				;//��, ���� ���� ����� ������! � ������� �� � �������!
	ShitNoOre					=	"SVM_6_ShitNoOre"					;//�� �������! ���� ���!
	HandsOff					=	"SVM_6_HandsOff"					;//���� �����!
	GetOutOfHere				=	"SVM_6_GetOutOfHere"				;//����� ���!
	YouViolatedForbiddenTerritory=	"SVM_6_YouViolatedForbiddenTerritory";//��! ������ �� ������?
	YouWannaFoolMe				=	"SVM_6_YouWannaFoolMe"				;//������� �����!
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"		;//��� ���� ����� �����? ��� �� ����������?
	WhyAreYouInHere				=	"SVM_6_WhyYouAreInHere"				;//��������, ��� ���� ������� ������!
	WhatDidYouInThere			=	"SVM_6_WhatDidYouInThere"			;//����� ���� ������ ������!
	WiseMove					=	"SVM_6_WiseMove"					;//�� ��� ����� ���������!
	Alarm						=	"SVM_6_Alarm"						;//������! ����!
	IntruderAlert				= 	"SVM_6_IntruderAlert"				;//�������!
	BehindYou					=	"SVM_6_BehindYou"					;//��, ���������!
	TheresAFight				=	"SVM_6_TheresAFight"				;//����� �����!
	HeyHeyHey					=	"SVM_6_HeyHeyHey"					;//��� ���!
	CheerFight					=	"SVM_6_CheerFight"					;//��� ���!
	CheerFriend					=	"SVM_6_CheerFriend"					;//���� ���!
	Ooh							=	"SVM_6_Ooh"							;//��, ���� ����������!
	YeahWellDone				=	"SVM_6_YeahWellDone"				;//��� ������!
	RunCoward					=	"SVM_6_RunCoward"					;//���� ���� �� ��� ������!
	HeDefeatedHim				=	"SVM_6_HeDefeatedHim"				;//������ ������, ��!
	HeDeservedIt				=	"SVM_6_HeDeservedIt"				;//��� ��� � ����!
	HeKilledHim					=	"SVM_6_HeKilledHim"					;//�� ������! ��� �����������! � ���� ����� ��������!
	ItWasAGoodFight				=	"SVM_6_ItWasAGoodFight"				;//�������� �����!
	Awake						=	"SVM_6_Awake"						;//
	FriendlyGreetings			=	"SVM_6_FriendlyGreetings"			;//������, �������!
	ALGreetings					=	"SVM_6_ALGreetings"					;//�� ������!
	MageGreetings				=	"SVM_6_MageGreetings"				;//�� ��� �����!
	SectGreetings				=	"SVM_6_SectGreetings"				;//���������!
	ThereHeIs					= 	"SVM_6_ThereHeIs"					;//��� ����.
	NoLearnNoPoints				= 	"SVM_6_NoLearnNoPoints"				;//� ������ �� ����� ������� ����, ���� �� ������� �����.
	NoLearnOverMax				= 	"SVM_6_NoLearnOverMax"				;//�� ������ ���, ��� �����. ���� ����� ��������� ����-������ ���.
	NoLearnYouAlreadyKnow		=	"SVM_6_NoLearnYouAlreadyKnow"		;//���������� �������� �� ��������. ���� ����� ������ �����!
	NoLearnYoureBetter			=	"SVM_6_NoLearnYoureBetter"			;//���� ���������� ������!
	HeyYou						=	"SVM_6_HeyYou"						;//��, ������!
	NotNow						=	"SVM_6_NotNow"						;//� ���� ��� �������.
	WhatDoYouWant				=	"SVM_6_WhatDoYouWant"				;//� ���� ������ ����?
	ISaidWhatDoYouWant			=	"SVM_6_ISaidWhatDoYouWant"			;//��� ���� �����?
	MakeWay						=	"SVM_6_MakeWay"						;//��� ������!
	OutOfMyWay					=	"SVM_6_OutOfMyWay"					;//�����, ����� � ������!
	YouDeafOrWhat				=	"SVM_6_YouDeafOrWhat"				;//���� ����� ������������? � ���� ���� ��� ��������!
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"		;//�� ����� ������ ��������?
	LookAway					=	"SVM_6_LookAway"					;//� ������ �� �����... � ���, ���-�� ���������?
	OkayKeepIt					=	"SVM_6_OkayKeepIt"					;//�����, ������� ����!
	WhatsThat					=	"SVM_6_WhatsThat"					;//��� ���������?
	ThatsMyWeapon				=	"SVM_6_ThatsMyWeapon"				;//� ���� ������� ���� ������!
	GiveItToMe					=	"SVM_6_GiveItToMe"					;//������ ����� ��� ���!
	YouCanKeeptheCrap			=	"SVM_6_YouCanKeeptheCrap"			;//��, ��� �� ��� �� � �����! � ���� ���� ���!
	TheyKilledMyFriend			=	"SVM_6_TheyKilledMyFriend"			;//���� ��� �������. �� � ������ ����, ��� ��� ������...
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"		;//��, � ��� ����? ����� �� ���� ��������?
	SuckerGotSome				=	"SVM_6_SuckerGotSome"				;//��? �� �������? ��� ����� ���� ������!
	SuckerDefeatedEBr			=	"SVM_6_SuckerDefeatedEBr"			;//�� ������� ������. ��� �� �� ��� �������!
	SuckerDefeatedGur			=	"SVM_6_SuckerDefeatedGur"			;//�� ������� ����. ��, �� �����! �� ���� �� �����, ��� � ��������� ��� ��� ������ ���� � ���.
	SuckerDefeatedMage			=	"SVM_6_SuckerDefeatedMage"			;//�� ������� ����... ����������! �� � ����� �� ��!
	SuckerDefeatedNov_Guard		= 	"SVM_6_SuckerDefeatedNov_Guard"		;//�� ������ �����������! �� ����� � ���?
	SuckerDefeatedVlk_Guard		= 	"SVM_6_SuckerDefeatedVlk_Guard"		;//�� ����� ����� ���������? ��� ���� ��������!
	YouDefeatedMyComrade		=	"SVM_6_YouDefeatedMyComrade"		;//����� �� ������ ����� ���������?
	YouDefeatedNOV_Guard		=	"SVM_6_YouDefeatedNOV_Guard"		;//������ ����� ����������, � �� � ���� ����� �������!
	YouDefeatedVLK_Guard		=	"SVM_6_YouDefeatedVLK_Guard"		;//�� ��������� ����! � ������� ���� �����. ������� �� ���� �������, ����� �� ����!
	YouStoleFromMe				=	"SVM_6_YouStoleFromMe"				;//��� �� ������ �������� ����, ������� ���!
	YouStoleFromUs				=	"SVM_6_YouStoleFromUs"				;//� ���� ���� ��, ��� ����������� ���. ����� �� �� ����� ��� ��� �����������!
	YouStoleFromEBr				=	"SVM_6_YouStoleFromEBr"				;//��, �� �����! �� �� ������� �������! ��� �� ������� ���� � �����!
	YouStoleFromGur				=	"SVM_6_YouStoleFromGur"				;//�� ������� ����! ���������� �� ���������� �� �� �����!
	StoleFromMage				=	"SVM_6_StoleFromMage"				;//�� ����� �������� ��, ��� ����������� �����. ����� ��� ������� �� �����!
	YouKilledMyFriend			=	"SVM_6_YouKilledMyFriend"			;//�� ���� ������ �� ����� �����. ��������� �������� �������, � ���� �� ������������!
	YouKilledEBr				=	"SVM_6_YouKilledEBr"				;//�� ���� ������! �� ���, ������ ������� ������?
	YouKilledGur				=	"SVM_6_YouKilledGur"				;//�� ���� ����! ����� ����!
	YouKilledMage				=	"SVM_6_YouKilledMage"				;//�� ���� ����! � ���� ���� ��������� ����������?
	YouKilledOCfolk				=	"SVM_6_YouKilledOCfolk"				;//� ������ ������ ��� ���� �������. ����� �����, ��� �� ��������� � �����...
	YouKilledNCfolk				=	"SVM_6_YouKilledNCfolk"				;//� ����� ������ ��������� ��������. �������, �� ���-�� ������� � ����!
	YouKilledPSIfolk			=	"SVM_6_YouKilledPSIfolk"			;//�������� �������� ������ �� ����� ������������. ��� ����� ��� ����!
	GetThingsRight				=	"SVM_6_GetThingsRight"				;//�� �� ������� �������� ���������������!
	YouDefeatedMeWell			=	"SVM_6_YouDefeatedMeWell"			;//�� ������� � ������� ���. �� ������ ������� �� ���� �����!
	Smalltalk01					=	"SVM_6_Smalltalk01"					;// ...�� ������ �������...
	Smalltalk02					=	"SVM_6_Smalltalk02"					;// ...��������...
	Smalltalk03					=	"SVM_6_Smalltalk03"					;// ...��, ������ ���� ��������...
	Smalltalk04					=	"SVM_6_Smalltalk04"					;// ...� �� ���� �����������...
	Smalltalk05					=	"SVM_6_Smalltalk05"					;// ...��� �� �� ��� ����...
	Smalltalk06					=	"SVM_6_Smalltalk06"					;// ...�������, ��� ������ ��� �� �������...
	Smalltalk07					=	"SVM_6_Smalltalk07"					;// ...������� ��� � �����, ����� ����� ����� �� �����.
	Smalltalk08					=	"SVM_6_Smalltalk08"					;// ...�� ���� ������ �� ��������...
	Smalltalk09					=	"SVM_6_Smalltalk09"					;// ...������, � � ���� ���-�� ����...
	Smalltalk10					=	"SVM_6_Smalltalk10"					;// ...����� ������ �������� ��� ������...
	Smalltalk11					=	"SVM_6_Smalltalk11"					;// ...� �� ��������� � ����� ����...
	Smalltalk12					=	"SVM_6_Smalltalk12"					;// ...������ ������ �����, ��� �������...
	Smalltalk13					=	"SVM_6_Smalltalk13"					;// ...�� ����� �� � ������� � �������� ���������...
	Smalltalk14					=	"SVM_6_Smalltalk14"					;// ...������� ����� ��������� ���� � �� ��...
	Smalltalk15					=	"SVM_6_Smalltalk15"					;// ...��� ����� �� �������� �����...
	Smalltalk16					=	"SVM_6_Smalltalk16"					;// ...������ ��� ���� ������� �����...
	Smalltalk17					=	"SVM_6_Smalltalk17"					;// ...�� ���� ������� ����� �������...
	Smalltalk18					=	"SVM_6_Smalltalk18"					;// ...��� ��� ������� ��� �������...
	Smalltalk19					=	"SVM_6_Smalltalk19"					;// ...����� ������ ������ ��������, ������ ����� ��������...
	Smalltalk20					=	"SVM_6_Smalltalk20"					;// ...�� �����, ��� ����� ����� ���� ���-������ ��������...
	Smalltalk21					=	"SVM_6_Smalltalk21"					;// ...����� ����, ��� ������...
	Smalltalk22					=	"SVM_6_Smalltalk22"					;// ...� ���� ���� ������� ������� �����, � ����� ����� �����...
	Smalltalk23					=	"SVM_6_Smalltalk23"					;// ...��� ��������, ��� ��� �������� ����� ��� ������...
	Smalltalk24					=	"SVM_6_Smalltalk24"					;// ...����� ����� ������ ����...
	Om							= 	"SVM_6_Om"							;//
};

//////////////////////////////////////////
instance SVM_7 (C_SVM)				//Freak, Aggressiv. Spielt mit seiner Macht. Sadist. Org: Abschaum, den im AL keiner wollte. Nov (selten): Durchgeknallter Abschaum.
{
	StopMagic					=	"SVM_7_StopMagic"					;//��������� ����������!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"				;//��������� ���������, ������!
	WeaponDown					=	"SVM_7_WeaponDown"					;//����� ������!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"				;//� �� ����! ����� ���!
	WatchYourAim				=	"SVM_7_WatchYourAim"				;//��, �� � ���� ��������?!
	WatchYourAimAngry			=	"SVM_7_WatchYourAimAngry"			;//�������� ���� �������? � ���� �� �����!
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"				;//� ��� ���� ��������! ������, ��� �������!
	LetsForgetOurLittleFight	=	"SVM_7_LetsForgetOurLittleFight"	;//������� �� ����, ������?
	Strange						=	"SVM_7_Strange"						;//����... �� ����? ����������! ��� ����� ����� ����?!
	DieMonster					=	"SVM_7_DieMonster"					;//������ � ���� ��������!
	DieMortalEnemy				=	"SVM_7_DieMortalEnemy"				;//������ ���� ���! ������ �� ���!
	NowWait						=	"SVM_7_NowWait"						;//������ � ���� ���� ����� ����� ����!
	YouStillNotHaveEnough		=	"SVM_7_YouStillNotHaveEnough"		;//������ �� ������ �� ��� �����, �����?
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//�����! ���� �����!
	NowWaitIntruder				= 	"SVM_7_NowWaitIntruder"				;//� ������� ���� �� ������ �������...
	IWillTeachYouRespectForForeignProperty	=	"SVM_7_IWillTeachYouRespectForForeignProperty"	;//� �������� ���� �������!
	DirtyThief					=	"SVM_7_DirtyThief"					;//������� ���! �� ��� ���������!
	YouAttackedMyCharge			=	"SVM_7_YouAttackedMyCharge"			;//����� ������ � ������� �����!
	YouKilledOneOfUs			=	"SVM_7_YouKilledOneOfUs"			;//�� ���� ������ ��������!
	Dead						=	"SVM_7_Dead"						;//
	Aargh_1						=	"SVM_7_Aargh_1"						;//
	Aargh_2						=	"SVM_7_Aargh_2"						;//
	Aargh_3						=	"SVM_7_Aargh_3"						;//
	Berzerk						=	"SVM_7_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_7_YoullBeSorryForThis"			;//�� ���� �� ������� �������� �� ���� ��� �������!
	YesYes						=	"SVM_7_YesYes"						;//�����, �� �������!
	ShitWhatAMonster			=	"SVM_7_ShitWhatAMonster"			;//� ���� ��� �������� ������. �� �� ��� ����������...
	Help						=	"SVM_7_Help"						;//���������!
	WeWillMeetAgain				=	"SVM_7_WeWillMeetAgain"				;//�� ��� ����������!
	NeverTryThatAgain			=	"SVM_7_NeverTryThatAgain"			;//������ �������� ������� ��� ��� ���!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"				;//� ������ �, �������, ������!
	ITookYourOre				=	"SVM_7_ITookYourOre"				;//� �� ��� ���� �����. �� ���� - ��� ���� �� ��� �� �����!
	ShitNoOre					=	"SVM_7_ShitNoOre"					;//���, ��� ����? �� �� ���� ��� �������� �����!
	HandsOff					=	"SVM_7_HandsOff"					;//����� ���� ���� ��� ����!
	GetOutOfHere				=	"SVM_7_GetOutOfHere"				;//��������! ����� ������!
	YouViolatedForbiddenTerritory=	"SVM_7_YouViolatedForbiddenTerritory";//��� �� ����� ����?
	YouWannaFoolMe				=	"SVM_7_YouWannaFoolMe"				;//�� ��������� ���� ��������, ��?
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"		;//��, ��! ��� ���� ����� �����?
	WhyAreYouInHere				=	"SVM_7_WhyYouAreInHere"				;//��������, ��� � ������ ������!
	WhatDidYouInThere			=	"SVM_7_WhatDidYouInThere"			;//���� ������ ����� ������!
	WiseMove					=	"SVM_7_WiseMove"					;//�� ���� ��� ���� �������! �� � �� � ������������� ������� ����!
	Alarm						=	"SVM_7_Alarm"						;//������, ����!
	IntruderAlert				= 	"SVM_7_IntruderAlert"				;//�������!
	BehindYou					=	"SVM_7_BehindYou"					;//���� ���������!
	TheresAFight				=	"SVM_7_TheresAFight"				;//�, �����!
	HeyHeyHey					=	"SVM_7_HeyHeyHey"					;//��� �������!
	CheerFight					=	"SVM_7_CheerFight"					;//� ���� ������ �����!
	CheerFriend					=	"SVM_7_CheerFriend"					;//����� ���!
	Ooh							=	"SVM_7_Ooh"							;//��, ��, ���������!
	YeahWellDone				=	"SVM_7_YeahWellDone"				;//��!
	RunCoward					=	"SVM_7_RunCoward"					;//����, ����! ��� ����� �������!
	HeDefeatedHim				=	"SVM_7_HeDefeatedHim"				;//������ � ����!
	HeDeservedIt				=	"SVM_7_HeDeservedIt"				;//��� �������!
	HeKilledHim					=	"SVM_7_HeKilledHim"					;//��������, ���� ���� �������. �� ������ ������� ��� ��� ����������!
	ItWasAGoodFight				=	"SVM_7_ItWasAGoodFight"				;//������� �����!
	Awake						=	"SVM_7_Awake"						;//���, ���� ��������?
	FriendlyGreetings			=	"SVM_7_FriendlyGreetings"			;//������!
	ALGreetings					=	"SVM_7_ALGreetings"					;//�� ������!
	MageGreetings				=	"SVM_7_MageGreetings"				;//�� ��� �����!
	SectGreetings				=	"SVM_7_SectGreetings"				;//���������!
	ThereHeIs					= 	"SVM_7_ThereHeIs"					;//�� ���, ������ �����?
	NoLearnNoPoints				= 	"SVM_7_NoLearnNoPoints"				;//� �� ���� ������ ������� ����. ������ ����� ������������.
	NoLearnOverMax				= 	"SVM_7_NoLearnOverMax"				;//�� �� ������ ������ ����� ���, ����� ������ ���-������ ������.
	NoLearnYouAlreadyKnow		=	"SVM_7_NoLearnYouAlreadyKnow"		;//�� ������ ������� ��� ����� ����������. ������ ��� �� ������� ����� ��������.
	NoLearnYoureBetter			=	"SVM_7_NoLearnYoureBetter"			;//�, � ���� ��� ������ �����!
	HeyYou						=	"SVM_7_HeyYou"						;//��, ��!
	NotNow						=	"SVM_7_NotNow"						;//������ �� �����!
	WhatDoYouWant				=	"SVM_7_WhatDoYouWant"				;//��� ���� �� ���� �����?
	ISaidWhatDoYouWant			=	"SVM_7_ISaidWhatDoYouWant"			;//�� ������ ��������� ���� � ���-��?
	MakeWay						=	"SVM_7_MakeWay"						;//��� ������.
	OutOfMyWay					=	"SVM_7_OutOfMyWay"					;//���� � ������!
	YouDeafOrWhat				=	"SVM_7_YouDeafOrWhat"				;//������ �� ���� �����������? ���� � ������!
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"		;//�� ����� ����� �����?
	LookAway					=	"SVM_7_LookAway"					;//� ������ �� �����!
	OkayKeepIt					=	"SVM_7_OkayKeepIt"					;//������, ������! ������ ����!
	WhatsThat					=	"SVM_7_WhatsThat"					;//��� ��� ����?
	ThatsMyWeapon				=	"SVM_7_ThatsMyWeapon"				;//����� ��� ������!
	GiveItToMe					=	"SVM_7_GiveItToMe"					;//�����, ���� �������!
	YouCanKeeptheCrap			=	"SVM_7_YouCanKeeptheCrap"			;//��, �����, ������ ����! � � ����� ���� ���-�� ������.
	TheyKilledMyFriend			=	"SVM_7_TheyKilledMyFriend"			;//���� �� ����� ����� ��� ����! �� �������� �� ����!
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"		;//����� �� �������� ����?
	SuckerGotSome				=	"SVM_7_SuckerGotSome"				;//��� �������� ���� ������� ������!
	SuckerDefeatedEBr			=	"SVM_7_SuckerDefeatedEBr"			;//�� ����� ������! �� ���� ��������!
	SuckerDefeatedGur			=	"SVM_7_SuckerDefeatedGur"			;//�� ������ ����! ��������, ���� �������� �������� � ������������!
	SuckerDefeatedMage			=	"SVM_7_SuckerDefeatedMage"			;//��� �� ������� �������� ����, ��?
	SuckerDefeatedNov_Guard		= 	"SVM_7_SuckerDefeatedNov_Guard"		;//��� �� �������� ����� �����������?
	SuckerDefeatedVlk_Guard		= 	"SVM_7_SuckerDefeatedVlk_Guard"		;//��������� ����� � ���� �����!
	YouDefeatedMyComrade		=	"SVM_7_YouDefeatedMyComrade"		;//�� �� �� ��� �����! �� ����� �������� ���� ����� �� �����, ��� ��!
	YouDefeatedNOV_Guard		=	"SVM_7_YouDefeatedNOV_Guard"		;//��� ������ �� ��������, ��� �� ����������� ����!
	YouDefeatedVLK_Guard		=	"SVM_7_YouDefeatedVLK_Guard"		;//���� �� ������� ������ �� ���� ����������, �� ������ ����� ���� �� ����!
	YouStoleFromMe				=	"SVM_7_YouStoleFromMe"				;//�� �� ������� ����! � ��������� ��� ��� ����� ������ ���� �����!
	YouStoleFromUs				=	"SVM_7_YouStoleFromUs"				;//�� ����� ������� ���� ����! ����� �� ���!
	YouStoleFromEBr				=	"SVM_7_YouStoleFromEBr"				;//�� ������� �������! ����� �� ��� ������?
	YouStoleFromGur				=	"SVM_7_YouStoleFromGur"				;//�� ������� ����! ����, �� ��� ��� ����� �� ���� �����!
	StoleFromMage				=	"SVM_7_StoleFromMage"				;//�� ������� �����! ����� �������� ����!
	YouKilledMyFriend			=	"SVM_7_YouKilledMyFriend"			;//�� ���� ������ �� ����� �����! �������� ������ ������� �� ����-������ ����, � ���� �� ������������!
	YouKilledEBr				=	"SVM_7_YouKilledEBr"				;//�� ���� ������! � ���� ���, ��� �� ������� �� ����� � ����?
	YouKilledGur				=	"SVM_7_YouKilledGur"				;//�� ���� ����?! ����� �� ����� ����. � �� ����!
	YouKilledMage				=	"SVM_7_YouKilledMage"				;//�� ���� ����! � ���� ���� ��������� ����������?
	YouKilledOCfolk				=	"SVM_7_YouKilledOCfolk"				;//� ������ ������ ���� �������. ����� �����, ��� �� � ���� ���-�� �������...
	YouKilledNCfolk				=	"SVM_7_YouKilledNCfolk"				;//� ����� ������ ��������� ��������. �������, ��� ��� ���� �� ��������.
	YouKilledPSIfolk			=	"SVM_7_YouKilledPSIfolk"			;//�������� �������� ������ �� ����� ��������������, � ��� ����� ��� ����!
	GetThingsRight				=	"SVM_7_GetThingsRight"				;//�� �� ������� ���� �� ���������������!
	YouDefeatedMeWell			=	"SVM_7_YouDefeatedMeWell"			;//�� ��� �������, �� ��� ��������. �� ������� ���� � ������� ���, �� ������ ��� ������!
	Smalltalk01					=	"SVM_7_Smalltalk01"					;// ...��� �� ��������...
	Smalltalk02					=	"SVM_7_Smalltalk02"					;// ...��������...
	Smalltalk03					=	"SVM_7_Smalltalk03"					;// ...�� ����� ������ �������...
	Smalltalk04					=	"SVM_7_Smalltalk04"					;// ...�� ����� � �������� �� �������...
	Smalltalk05					=	"SVM_7_Smalltalk05"					;// ...����� �������� �� ��� ����...
	Smalltalk06					=	"SVM_7_Smalltalk06"					;// ...��� ����� ���� ����, ��� ���� ���� �� ��������...
	Smalltalk07					=	"SVM_7_Smalltalk07"					;// ...������ ����� ����, ������ �� ����� ������������...
	Smalltalk08					=	"SVM_7_Smalltalk08"					;// ...����� �� ���� ������ �� ��������...
	Smalltalk09					=	"SVM_7_Smalltalk09"					;// ...���������, � � ���� ���-�� ����...
	Smalltalk10					=	"SVM_7_Smalltalk10"					;// ...����� ������, ������ ��� ���-������ ��������...
	Smalltalk11					=	"SVM_7_Smalltalk11"					;// ...� �� ���� ��������� � ����� ����...
	Smalltalk12					=	"SVM_7_Smalltalk12"					;// ...������ ������ �����, ��� �������...
	Smalltalk13					=	"SVM_7_Smalltalk13"					;// ...�� ����� �� �, ����� �� ���� ��������� ��� ��...
	Smalltalk14					=	"SVM_7_Smalltalk14"					;// ...��� ����� ���� � �� ��...
	Smalltalk15					=	"SVM_7_Smalltalk15"					;// ...�������� ����������, � ����� ��� ����...
	Smalltalk16					=	"SVM_7_Smalltalk16"					;// ...������ ��� ���� ������� �����, �� ��, ��� ������...
	Smalltalk17					=	"SVM_7_Smalltalk17"					;// ...� ������ ������ ������� ���� �� ������...
	Smalltalk18					=	"SVM_7_Smalltalk18"					;// ...������ �� ���� ������� ��� ��������...
	Smalltalk19					=	"SVM_7_Smalltalk19"					;// ...����� ������ ������ ��������, ������ ������� ����� ����������, �������...
	Smalltalk20					=	"SVM_7_Smalltalk20"					;// ...�� �����, ��� ����� ���� ���-������ ���������...
	Smalltalk21					=	"SVM_7_Smalltalk21"					;// ...��������, �� ����...
	Smalltalk22					=	"SVM_7_Smalltalk22"					;// ...���� ������� �����. ������ �� ������� �� �����...
	Smalltalk23					=	"SVM_7_Smalltalk23"					;// ...� �����, ��� ��� ����� �������� ������...
	Smalltalk24					=	"SVM_7_Smalltalk24"					;// ...��� �� ������� ���������, ��������� � ���-������ ������...
	Om							= 	"SVM_7_Om"							;//
};

//////////////////////////////////////////
instance SVM_8 (C_SVM)				// Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, n�chtern! Klare Stimme
{
	StopMagic					=	"SVM_8_StopMagic"					;//�� ���� ��� ��� ���������!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"				;//�������� ���������, � ������!
	WeaponDown					=	"SVM_8_WeaponDown"					;//����� ������!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"				;//����� ��� ��� ���� ����� �����!
	WatchYourAim				=	"SVM_8_WatchYourAim"				;//������ ������, �����!
	WatchYourAimAngry			=	"SVM_8_WatchYourAimAngry"			;//�� ��� ������ �������� � ����?
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"				;//������, ���� ��������!
	LetsForgetOurLittleFight	=	"SVM_8_LetsForgetOurLittleFight"	;//������, ������� �� ����.
	Strange						=	"SVM_8_Strange"						;//������! � �� ����, ��� �� ������� ����!
	DieMonster					=	"SVM_8_DieMonster"					;//��������� �����!
	DieMortalEnemy				=	"SVM_8_DieMortalEnemy"				;//����������� � ������. ������ �������, ������!
	NowWait						=	"SVM_8_NowWait"						;//�� ������ ������� �� ����, ������! ��, �������...
	YouStillNotHaveEnough		=	"SVM_8_YouStillNotHaveEnough"		;//���� ���� �������� ����? ���, ������ ���������?
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//�� ������ �������, ��� � ������� ��-�������!
	NowWaitIntruder				= 	"SVM_8_NowWaitIntruder"				;//� �� ��� ������ ���������� �����? ��, �������!
	IWillTeachYouRespectForForeignProperty	=	"SVM_8_IWillTeachYouRespectForForeignProperty"	;//�� ��� � ������ �������� ���� ����!
	DirtyThief					=	"SVM_8_DirtyThief"					;//���� �� ������ �������� � ����!
	YouAttackedMyCharge			=	"SVM_8_YouAttackedMyCharge"			;//����� �� ����� ������� ���� ����� ������������!
	YouKilledOneOfUs			=	"SVM_8_YouKilledOneOfUs"			;//�� �������� ������� ������, ���� ������ �� ���!
	Dead						=	"SVM_8_Dead"						;//
	Aargh_1						=	"SVM_8_Aargh_1"						;//
	Aargh_2						=	"SVM_8_Aargh_2"						;//
	Aargh_3						=	"SVM_8_Aargh_3"						;//
	Berzerk						=	"SVM_8_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_8_YoullBeSorryForThis"			;//�� ��� �� ���� ���������!
	YesYes						=	"SVM_8_YesYes"						;//����, ����. ��� � �������!
	ShitWhatAMonster			=	"SVM_8_ShitWhatAMonster"			;//��-�����, � ���� ����� �� ����� ��������� ������� ������!
	Help						=	"SVM_8_Help"						;//���� ������� ������!
	WeWillMeetAgain				=	"SVM_8_WeWillMeetAgain"				;//�� ��� ����������!
	NeverTryThatAgain			=	"SVM_8_NeverTryThatAgain"			;//��� ���� ����� �������, � �� ����!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"				;//����� ������� ������!
	ITookYourOre				=	"SVM_8_ITookYourOre"				;//�, �������, �� ��� �� ������ �������. ��, ������ �� � �������!
	ShitNoOre					=	"SVM_8_ShitNoOre"					;//�� ����� � ������ ���������� ����� ���� ����?!
	HandsOff					=	"SVM_8_HandsOff"					;//����� ����!
	GetOutOfHere				=	"SVM_8_GetOutOfHere"				;//����� ���!
	YouViolatedForbiddenTerritory=	"SVM_8_YouViolatedForbiddenTerritory";//��, ��� ��� �� ����� �������?
	YouWannaFoolMe				=	"SVM_8_YouWannaFoolMe"				;//�������, �� ���� ����� �����, ��?
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"		;//��, ��! ��� ���� ����� �����?
	WhyAreYouInHere				=	"SVM_8_WhyYouAreInHere"				;//�������� ��� � ������ �� ������!
	WhatDidYouInThere			=	"SVM_8_WhatDidYouInThere"			;//��� �� ������ � ���� �����?
	WiseMove					=	"SVM_8_WiseMove"					;//��, ������, ��� ���� �������.
	Alarm						=	"SVM_8_Alarm"						;//������! ����� ���!
	IntruderAlert				= 	"SVM_8_IntruderAlert"				;//�������! ����� �����!
	BehindYou					=	"SVM_8_BehindYou"					;//���� ���������!
	TheresAFight				=	"SVM_8_TheresAFight"				;//��-��, ��� ��� ��� �������?!
	HeyHeyHey					=	"SVM_8_HeyHeyHey"					;//��� �������!
	CheerFight					=	"SVM_8_CheerFight"					;//��, ��� ���, ���!
	CheerFriend					=	"SVM_8_CheerFriend"					;//������! ����� ���!
	Ooh							=	"SVM_8_Ooh"							;//�� �� ���� ��� �����! ��� ���!
	YeahWellDone				=	"SVM_8_YeahWellDone"				;//��, ����� ���! �� ��� ���!
	RunCoward					=	"SVM_8_RunCoward"					;//������ �������� ��������� ����� ��� ���!
	HeDefeatedHim				=	"SVM_8_HeDefeatedHim"				;//��� �� ��� ���������! 
	HeDeservedIt				=	"SVM_8_HeDeservedIt"				;//��� ����� ��� ������!
	HeKilledHim					=	"SVM_8_HeKilledHim"					;//����� �� ��� ������? �� ������ ������ �������� �� ���� ��������!
	ItWasAGoodFight				=	"SVM_8_ItWasAGoodFight"				;//��� ��� �������� ���!
	Awake						=	"SVM_8_Awake"						;//
	FriendlyGreetings			=	"SVM_8_FriendlyGreetings"			;//������!
	ALGreetings					=	"SVM_8_ALGreetings"					;//�� ������!
	MageGreetings				=	"SVM_8_MageGreetings"				;//�� ��� �����!
	SectGreetings				=	"SVM_8_SectGreetings"				;//���������!
	ThereHeIs					= 	"SVM_8_ThereHeIs"					;//��� ��.
	NoLearnNoPoints				= 	"SVM_8_NoLearnNoPoints"				;//� �� ����� ����� ����, ���� � ���� ������������ �����.
	NoLearnOverMax				= 	"SVM_8_NoLearnOverMax"				;//�� �� ������� ������� ���� ������� �����. ���� ����� ����������� ���-������ ������.
	NoLearnYouAlreadyKnow		=	"SVM_8_NoLearnYouAlreadyKnow"		;//������� �� ������ ������� ������ � ������ ����� ���������� � ����� ������� �����.
	NoLearnYoureBetter			=	"SVM_8_NoLearnYoureBetter"			;//������ �� �����!
	HeyYou						=	"SVM_8_HeyYou"						;//��, ��!
	NotNow						=	"SVM_8_NotNow"						;//������ �� �����.
	WhatDoYouWant				=	"SVM_8_WhatDoYouWant"				;//���� ���-�� �����?
	ISaidWhatDoYouWant			=	"SVM_8_ISaidWhatDoYouWant"			;//���� �����, � ���� ������ ����?
	MakeWay						=	"SVM_8_MakeWay"						;//� ���� ������?
	OutOfMyWay					=	"SVM_8_OutOfMyWay"					;//���� � �������!
	YouDeafOrWhat				=	"SVM_8_YouDeafOrWhat"				;//�� �� ������ ����? ��� ������!
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"		;//�� ������ �� ���� �����������?
	LookAway					=	"SVM_8_LookAway"					;//��... ��� ������ ������! 
	OkayKeepIt					=	"SVM_8_OkayKeepIt"					;//������! ������ ����!
	WhatsThat					=	"SVM_8_WhatsThat"					;//��! ��� ��� ����?
	ThatsMyWeapon				=	"SVM_8_ThatsMyWeapon"				;//�� ������ ��� ������...
	GiveItToMe					=	"SVM_8_GiveItToMe"					;//����� ��� ���! ������?!
	YouCanKeeptheCrap			=	"SVM_8_YouCanKeeptheCrap"			;//��� ������, ������ ����. ��� ��� ��� ����� �� �����.
	TheyKilledMyFriend			=	"SVM_8_TheyKilledMyFriend"			;//���-�� ���� ������ ��������. ����� ������ ���� ������ ��������� ��������� �����...
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"		;//� ��� ����?
	SuckerGotSome				=	"SVM_8_SuckerGotSome"				;//��, ���? �����������? ���� ������ ��������!
	SuckerDefeatedEBr			=	"SVM_8_SuckerDefeatedEBr"			;//�� ����� ������. �� �� ������, ��� �� ����� ������?
	SuckerDefeatedGur			=	"SVM_8_SuckerDefeatedGur"			;//�� ������� ����. �������. �� ������ �� ������� ������� ��� ��� ���.
	SuckerDefeatedMage			=	"SVM_8_SuckerDefeatedMage"			;//�� ������� ����... ��������, �� ����� �������, ��?
	SuckerDefeatedNov_Guard		= 	"SVM_8_SuckerDefeatedNov_Guard"		;//�� �� ������, ��� ��� ���������� ��������� ��� ���� �������. � �� ��� ����� ��������� �������� �� ���?
	SuckerDefeatedVlk_Guard		= 	"SVM_8_SuckerDefeatedVlk_Guard"		;//���� ������ ����� � ���������, � ����� ��������, ����� �� ��� ������� ��� �������!
	YouDefeatedMyComrade		=	"SVM_8_YouDefeatedMyComrade"		;//�� ����� ���� ������� ���� ������.
	YouDefeatedNOV_Guard		=	"SVM_8_YouDefeatedNOV_Guard"		;//������ �������� ������� ������ �� ����� �����, � �� ���������!
	YouDefeatedVLK_Guard		=	"SVM_8_YouDefeatedVLK_Guard"		;//���� ������ ����� � ���� ����������, ������ �������� ������!
	YouStoleFromMe				=	"SVM_8_YouStoleFromMe"				;//� �� ��� ������ ���������� ����, ������� ���?!
	YouStoleFromUs				=	"SVM_8_YouStoleFromUs"				;//� ���� ���� ����, ������� ����������� ���. ����� �� �����!
	YouStoleFromEBr				=	"SVM_8_YouStoleFromEBr"				;//��� ��� ��! �� ������� �������! ��� ����� � ������!
	YouStoleFromGur				=	"SVM_8_YouStoleFromGur"				;//�� ���-�� ����� � ����, ��? �� ������ ����� ������!
	StoleFromMage				=	"SVM_8_StoleFromMage"				;//�� ���-�� ����� � �����, ������? �� �� �� ������� ��������, ��� ��� �� ���?
	YouKilledMyFriend			=	"SVM_8_YouKilledMyFriend"			;//���� �� ����� ����� ���� �� ����� ����. ��� ��� ���������, � �� ������ ����!
	YouKilledEBr				=	"SVM_8_YouKilledEBr"				;//�� ���� ������! ��������, �� ����� � ���!
	YouKilledGur				=	"SVM_8_YouKilledGur"				;//�� ���� ����! ���, � �� ���� � ��� ��������!
	YouKilledMage				=	"SVM_8_YouKilledMage"				;//�� ���� ����! ��� �� ������ ��� ���������?
	YouKilledOCfolk				=	"SVM_8_YouKilledOCfolk"				;//� ������ ������ ����� ��������. ���-�� �� ������ ������, ��� ��� �� ��� ����...
	YouKilledNCfolk				=	"SVM_8_YouKilledNCfolk"				;//���� ������� �� ������ ������. ��������� ������, ��� �� ������ � ���� ���������!
	YouKilledPSIfolk			=	"SVM_8_YouKilledPSIfolk"			;//���� �� ������������ �������� ��� ����, � ������� � ���� ��!
	GetThingsRight				=	"SVM_8_GetThingsRight"				;//���� ������� ����� ��������� ���, ��� �� ������!
	YouDefeatedMeWell			=	"SVM_8_YouDefeatedMeWell"			;//��� �� ���� ������� ���������, �� ��� ��� ������� ���. � ������ ��� �������!
	Smalltalk01					=	"SVM_8_Smalltalk01"					;// ...���� �� �������...
	Smalltalk02					=	"SVM_8_Smalltalk02"					;// ...��������...
	Smalltalk03					=	"SVM_8_Smalltalk03"					;// ...�� ����� ������ �������...
	Smalltalk04					=	"SVM_8_Smalltalk04"					;// ...� �� ���� � ��� �����������...
	Smalltalk05					=	"SVM_8_Smalltalk05"					;// ...����� �������� - �� ��� ����...
	Smalltalk06					=	"SVM_8_Smalltalk06"					;// ...��� ����� ���� ����, ��� ���� ���� �� ��������...
	Smalltalk07					=	"SVM_8_Smalltalk07"					;// ...������ ����� ����, ������ ������������� ����� �� ����.
	Smalltalk08					=	"SVM_8_Smalltalk08"					;// ...������ ����� �� ��������...
	Smalltalk09					=	"SVM_8_Smalltalk09"					;// ...���-�� �� �� � ���� �������...
	Smalltalk10					=	"SVM_8_Smalltalk10"					;// ...����� ������, ������ ��� ���-������ ��������...
	Smalltalk11					=	"SVM_8_Smalltalk11"					;// ...���� ���� �� �������...
	Smalltalk12					=	"SVM_8_Smalltalk12"					;// ...������ ������ �����, ��� �������...
	Smalltalk13					=	"SVM_8_Smalltalk13"					;// ...�� ����� �� �, ����� �� ���� ��������� ��� ��...
	Smalltalk14					=	"SVM_8_Smalltalk14"					;// ...��� ����� ���� � �� ��...
	Smalltalk15					=	"SVM_8_Smalltalk15"					;// ...�������� ����������, � ����� ��� ����...
	Smalltalk16					=	"SVM_8_Smalltalk16"					;// ...������ ��� ���� ������� �����, �� ��, ��� ������...
	Smalltalk17					=	"SVM_8_Smalltalk17"					;// ...� ������ ������ ������� ���� �� ������...
	Smalltalk18					=	"SVM_8_Smalltalk18"					;// ...������ �� ���� ������� ��� ��������...
	Smalltalk19					=	"SVM_8_Smalltalk19"					;// ...����� ������ ������ ��������, ������ ������� ����� ����������, �������...
	Smalltalk20					=	"SVM_8_Smalltalk20"					;// ...�� �����, ��� ����� ���-������ ���������...
	Smalltalk21					=	"SVM_8_Smalltalk21"					;// ...��������, �� ����...
	Smalltalk22					=	"SVM_8_Smalltalk22"					;// ...�������. ����� �� �� ��� �� ����������...
	Smalltalk23					=	"SVM_8_Smalltalk23"					;// ...� �����, ��� ��� ����� �������� ������...
	Smalltalk24					=	"SVM_8_Smalltalk24"					;// ...����� ��������� � ���-������ ������...
	Om							= 	"SVM_8_Om"							;//
};


instance SVM_9 (C_SVM)				// brummig		   gem�tlicher H�ne, Besonnen, Brummiger B�r, Einfacher	Mensch
{
	StopMagic					=	"SVM_9_StopMagic"					;//�� ������� ������������ ����� �����!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"				;//�������� ����������!
	WeaponDown					=	"SVM_9_WeaponDown"					;//�� ������ ������� �� ����?
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"				;//������ ���, ����� ���������!
	WatchYourAim				=	"SVM_9_WatchYourAim"				;//������, ���� ��������!
	WatchYourAimAngry			=	"SVM_9_WatchYourAimAngry"			;//����� ���� ������!
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"				;//��! ����������! 
	LetsForgetOurLittleFight	=	"SVM_9_LetsForgetOurLittleFight"	;//�����, ����� ������ �� ����...
	Strange						=	"SVM_9_Strange"						;//�����, ��������. � ����, �� ���� �������!
	DieMonster					=	"SVM_9_DieMonster"					;//��� ����� ������������� ��������!
	DieMortalEnemy				=	"SVM_9_DieMortalEnemy"				;//������ ���� ������ �����!
	NowWait						=	"SVM_9_NowWait"						;//�� ��� ���� �������!
	YouStillNotHaveEnough		=	"SVM_9_YouStillNotHaveEnough"		;//����� �� �� ������� �����!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//�� ������ �������, ����� � ������� ���� �����!
	NowWaitIntruder				= 	"SVM_9_NowWaitIntruder"				;//��� �� � �������, ������!
	IWillTeachYouRespectForForeignProperty	=	"SVM_9_IWillTeachYouRespectForForeignProperty"	;//� ���� �����������. ������� ������� ��� ����, � � ���� ����� ��������!
	DirtyThief					=	"SVM_9_DirtyThief"					;//���! � �������� ����!
	YouAttackedMyCharge			=	"SVM_9_YouAttackedMyCharge"			;//����� �� ����� ����� ������� ���� ������!
	YouKilledOneOfUs			=	"SVM_9_YouKilledOneOfUs"			;//� ���� ����, �� ��, ��� �� ���� ������ �� ���� �����!
	Dead						=	"SVM_9_Dead"						;//
	Aargh_1						=	"SVM_9_Aargh_1"						;//
	Aargh_2						=	"SVM_9_Aargh_2"						;//
	Aargh_3						=	"SVM_9_Aargh_3"						;//
	Berzerk						=	"SVM_9_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_9_YoullBeSorryForThis"			;//�� ��� ����, ������ ��� �� ������ �� ����.
	YesYes						=	"SVM_9_YesYes"						;//�������. ��� ���������!
	ShitWhatAMonster			=	"SVM_9_ShitWhatAMonster"			;//����, �� � �����!
	Help						=	"SVM_9_Help"						;//�������, ������ ������!
	WeWillMeetAgain				=	"SVM_9_WeWillMeetAgain"				;//��� ��������!
	NeverTryThatAgain			=	"SVM_9_NeverTryThatAgain"			;//� ��������� ��� �� ������ �����!
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"				;//��� ������ ������ ���!
	ITookYourOre				=	"SVM_9_ITookYourOre"				;//����! ���� ���-��, � �� ������!
	ShitNoOre					=	"SVM_9_ShitNoOre"					;//���� ���� ���!
	HandsOff					=	"SVM_9_HandsOff"					;//��, ���� �����!
	GetOutOfHere				=	"SVM_9_GetOutOfHere"				;//����� ���!
	YouViolatedForbiddenTerritory=	"SVM_9_YouViolatedForbiddenTerritory";//��� ���� ����, ������?
	YouWannaFoolMe				=	"SVM_9_YouWannaFoolMe"				;//������, �� ���, ��������� ������� �� ���� ������?
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"		;//��, ��! ��� �� ����� �������?
	WhyAreYouInHere				=	"SVM_9_WhyYouAreInHere"				;//���� ������, ��� � ������ ������!
	WhatDidYouInThere			=	"SVM_9_WhatDidYouInThere"			;//��� ���� ����� ����?
	WiseMove					=	"SVM_9_WiseMove"					;//������!
	Alarm						=	"SVM_9_Alarm"						;//������! ����!
	IntruderAlert				= 	"SVM_9_IntruderAlert"				;//�������! �����!
	BehindYou					=	"SVM_9_BehindYou"					;//�� �����!
	TheresAFight				=	"SVM_9_TheresAFight"				;//�, ��...���������, ��������� ��� ������...
	HeyHeyHey					=	"SVM_9_HeyHeyHey"					;//�������!
	CheerFight					=	"SVM_9_CheerFight"					;//�����, �����!
	CheerFriend					=	"SVM_9_CheerFriend"					;//������!
	Ooh							=	"SVM_9_Ooh"							;//�, ������ ��, ��� ����!
	YeahWellDone				=	"SVM_9_YeahWellDone"				;//�������, ������!
	RunCoward					=	"SVM_9_RunCoward"					;//������ �� ��� ���� ��� ����!
	HeDefeatedHim				=	"SVM_9_HeDefeatedHim"				;//����� ��� ��� � ��� �������.
	HeDeservedIt				=	"SVM_9_HeDeservedIt"				;//��� �������!
	HeKilledHim					=	"SVM_9_HeKilledHim"					;//������� ���� ��� ���. � ��������� ��� ����� � ������������.
	ItWasAGoodFight				=	"SVM_9_ItWasAGoodFight"				;//�������� ��� ���!
	Awake						=	"SVM_9_Awake"						;//
	FriendlyGreetings			=	"SVM_9_FriendlyGreetings"			;//�������!
	ALGreetings					=	"SVM_9_ALGreetings"					;//�� ������!
	MageGreetings				=	"SVM_9_MageGreetings"				;//�� ��� �����!
	SectGreetings				=	"SVM_9_SectGreetings"				;//���������!
	ThereHeIs					= 	"SVM_13_ThereHeIs"					;//�� ���, ������? ��� �� ��!
	NoLearnNoPoints				= 	"SVM_9_NoLearnNoPoints"				;//�� ������������ ������, ����� � ���� ���� �����.
	NoLearnOverMax				= 	"SVM_9_NoLearnOverMax"				;//�� ��� ������ ��� ���������. ����� ������� ����-������ �������.
	NoLearnYouAlreadyKnow		=	"SVM_9_NoLearnYouAlreadyKnow"		;//����� ����� ��������, ���� ����� ������ �����.
	NoLearnYoureBetter			=	"SVM_9_NoLearnYoureBetter"			;//������ �� �������!
	HeyYou						=	"SVM_9_HeyYou"						;//��, ��! 
	NotNow						=	"SVM_9_NotNow"						;//���, �� ������.
	WhatDoYouWant				=	"SVM_9_WhatDoYouWant"				;//��� ���� ����?
	ISaidWhatDoYouWant			=	"SVM_9_ISaidWhatDoYouWant"			;//� ���� ������?
	MakeWay						=	"SVM_9_MakeWay"						;//��� ������!
	OutOfMyWay					=	"SVM_9_OutOfMyWay"					;//������!
	YouDeafOrWhat				=	"SVM_9_YouDeafOrWhat"				;//��, �����, ����� � ������!
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"		;//����� ����� ��������? ������ �� ������ ��������� ���� ��� �����?
	LookAway					=	"SVM_9_LookAway"					;//��! ������ ������� ��������!
	OkayKeepIt					=	"SVM_9_OkayKeepIt"					;//�����! ������ ��� ����.
	WhatsThat					=	"SVM_9_WhatsThat"					;//��� ��� ����?
	ThatsMyWeapon				=	"SVM_9_ThatsMyWeapon"				;//������ �� ����, � �� ����������� ��� ������.
	GiveItToMe					=	"SVM_9_GiveItToMe"					;//����� ���! ����������!
	YouCanKeeptheCrap			=	"SVM_9_YouCanKeeptheCrap"			;//��� ��� �� �����, ������ �������� ����.
	TheyKilledMyFriend			=	"SVM_9_TheyKilledMyFriend"			;//���� �� ����� ����! ��� ������ � �������� �� ����� �������...
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"		;//��� �����?
	SuckerGotSome				=	"SVM_9_SuckerGotSome"				;//��, ���? �������? ������ ������ �����!
	SuckerDefeatedEBr			=	"SVM_9_SuckerDefeatedEBr"			;//������ ������. ��� ��� ����������!
	SuckerDefeatedGur			=	"SVM_9_SuckerDefeatedGur"			;//������� ����! �� ��! �� ����� ������ ��� �� ������.
	SuckerDefeatedMage			=	"SVM_9_SuckerDefeatedMage"			;//�� ��������! �������� ����, ��� ���-��...
	SuckerDefeatedNov_Guard		= 	"SVM_9_SuckerDefeatedNov_Guard"		;//����� � �������� - ��� �������!
	SuckerDefeatedVlk_Guard		= 	"SVM_9_SuckerDefeatedVlk_Guard"		;//� ��� �� �����, ����� ��� ���������?
	YouDefeatedMyComrade		=	"SVM_9_YouDefeatedMyComrade"		;//������ �����, �� ������ ����� ��������?
	YouDefeatedNOV_Guard		=	"SVM_9_YouDefeatedNOV_Guard"		;//������� ���������� ��� ���, � �� ������ ���������!
	YouDefeatedVLK_Guard		=	"SVM_9_YouDefeatedVLK_Guard"		;//����� �� ����� ������� ���, ���� � �������, ���� ����� ������� ��� ��.
	YouStoleFromMe				=	"SVM_9_YouStoleFromMe"				;//������� ���, � �� ��������� ��������� �����?
	YouStoleFromUs				=	"SVM_9_YouStoleFromUs"				;//�� ����������� ���� ��� - �������� � ������ ������! �� ��������� �� ����!
	YouStoleFromEBr				=	"SVM_9_YouStoleFromEBr"				;//������! �� ������� �������! ��� ��� ��� �� �������!
	YouStoleFromGur				=	"SVM_9_YouStoleFromGur"				;//�� ������� ����, �� ��� ��?
	StoleFromMage				=	"SVM_9_StoleFromMage"				;//��-�� ���� ���� �� ����������� ����� �����, �� ��� ��?
	YouKilledMyFriend			=	"SVM_9_YouKilledMyFriend"			;//�� ����� ������� ������ ������ �� �����. �������� ��� ���-�� ��������, � �������� ���� �����!
	YouKilledEBr				=	"SVM_9_YouKilledEBr"				;//������, �� ��� ����?! �������� ������, ���� ������!
	YouKilledGur				=	"SVM_9_YouKilledGur"				;//�� ���� ��������, � ���� ������� ��� ����� ����!
	YouKilledMage				=	"SVM_9_YouKilledMage"				;//���� ����! ����� ����� ����� ���� ����������, �?
	YouKilledOCfolk				=	"SVM_9_YouKilledOCfolk"				;//���� ������ �� ������� ������ �����, �, �������, �� � ���� �������...
	YouKilledNCfolk				=	"SVM_9_YouKilledNCfolk"				;//� ����� ������ ������ �������� ������, �, ������, �� ����� ����!
	YouKilledPSIfolk			=	"SVM_9_YouKilledPSIfolk"			;//� �������� ����� �� ������ ��������� ������, � ��� ����� �� ����� �������!
	GetThingsRight				=	"SVM_9_GetThingsRight"				;//�� ����� ���� ����� �����������!
	YouDefeatedMeWell			=	"SVM_9_YouDefeatedMeWell"			;//������� ���! ����� ����� ���� �� ������.
	Smalltalk01					=	"SVM_9_Smalltalk01"					;// ...��, ���� �� ��� �������...
	Smalltalk02					=	"SVM_9_Smalltalk02"					;// ...�����...
	Smalltalk03					=	"SVM_9_Smalltalk03"					;// ...��� ���� �� ������� �������...
	Smalltalk04					=	"SVM_9_Smalltalk04"					;// ����� � �� ���� � ��� �����������...
	Smalltalk05					=	"SVM_9_Smalltalk05"					;// ...��� �� ��� ��������...
	Smalltalk06					=	"SVM_9_Smalltalk06"					;// ...�������, ����� �������� ��������...
	Smalltalk07					=	"SVM_9_Smalltalk07"					;// ...����� ���� �� ������, ��������� ������� ����� �� ����.
	Smalltalk08					=	"SVM_9_Smalltalk08"					;// ...������ ����� �� ��������...
	Smalltalk09					=	"SVM_9_Smalltalk09"					;// ...���-�� �� �� � ���� �������...
	Smalltalk10					=	"SVM_9_Smalltalk10"					;// ...�����������, ��� �������� �����...
	Smalltalk11					=	"SVM_9_Smalltalk11"					;// ...���� ���� �� �������...
	Smalltalk12					=	"SVM_9_Smalltalk12"					;// ...�� ����� ������ �����...
	Smalltalk13					=	"SVM_9_Smalltalk13"					;// ...�� ����� �� � ��������� � ��� �����...
	Smalltalk14					=	"SVM_9_Smalltalk14"					;// ...������ ��� ���� � ����...
	Smalltalk15					=	"SVM_9_Smalltalk15"					;// ...��������� ���� ������� �� ������...
	Smalltalk16					=	"SVM_9_Smalltalk16"					;// ...���� ����� - ��� ���� ��-�������...
	Smalltalk17					=	"SVM_9_Smalltalk17"					;// ...����� ����������� �������...
	Smalltalk18					=	"SVM_9_Smalltalk18"					;// ...������ � �� ������ ��� ��������...
	Smalltalk19					=	"SVM_9_Smalltalk19"					;// ...����� ���, �������� ����-������, � �� ���� � ������������ ������...
	Smalltalk20					=	"SVM_9_Smalltalk20"					;// ...�� �����, ��� ��� ��������� �����-������...
	Smalltalk21					=	"SVM_9_Smalltalk21"					;// ..��, ������, �� ����....
	Smalltalk22					=	"SVM_9_Smalltalk22"					;// ...�������. ����� �� �� ��� �� ����������...
	Smalltalk23					=	"SVM_9_Smalltalk23"					;// ..� �������, ��� �������� ��� ��� ��� �����...
	Smalltalk24					=	"SVM_9_Smalltalk24"					;// ...����� ����� � ������ ���������...
	Om							= 	"SVM_9_Om"							;//
};



instance SVM_10	(C_SVM)				// Schlau, verschlagen,	heimlich, Zwielichtig, zynisch,	intrigant Dealer (RAVEN, KALOM)
{
	StopMagic					=	"SVM_10_StopMagic"						;//��������� ���������!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"					;//�������� ����������!
	WeaponDown					=	"SVM_10_WeaponDown"						;//����� ������!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"				;//��� ��� ������? �������� �������?
	WatchYourAim				=	"SVM_10_WatchYourAim"					;//����� ���, ��� � ������ ��� �� ����?
	WatchYourAimAngry			=	"SVM_10_WatchYourAimAngry"				;//������ ������� �� ���� ������? ������ ��� � ���� �����!
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"				;//��! ���������! ��� ���, � �� ��������!
	LetsForgetOurLittleFight	=	"SVM_10_LetsForgetOurLittleFight"		;//��! ����� ������� � ����� �����, ������?
	Strange						=	"SVM_10_Strange"						;//��, ��� ��? ������!
	DieMonster					=	"SVM_10_DieMonster"						;//�������������� �����!
	DieMortalEnemy				=	"SVM_10_DieMortalEnemy"					;//������ ���� �����!
	NowWait						=	"SVM_10_NowWait"						;//������ �� �� ��� ���������!
	YouStillNotHaveEnough		=	"SVM_10_YouStillNotHaveEnough"			;//�� ��� � ������ �������� �� ������!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"					;//�� ��� �������!
	NowWaitIntruder				= 	"SVM_10_NowWaitIntruder"				;//������ � ������ �� ���� �������!
	IWillTeachYouRespectForForeignProperty	=	"SVM_10_IWillTeachYouRespectForForeignProperty"	;//� ���� ������������. �� ����� ������� ��� ����!
	DirtyThief					=	"SVM_10_DirtyThief"						;//���! ������ � ���� ��������!
	YouAttackedMyCharge			=	"SVM_10_YouAttackedMyCharge"			;//����� �� ����� ������� ���� ������!
	YouKilledOneOfUs			=	"SVM_10_YouKilledOneOfUs"				;//�� ���� ������ �� ���� �����. ������ ���� �������!
	Dead						=	"SVM_10_Dead"							;//
	Aargh_1						=	"SVM_10_Aargh_1"						;//
	Aargh_2						=	"SVM_10_Aargh_2"						;//
	Aargh_3						=	"SVM_10_Aargh_3"						;//
	Berzerk						=	"SVM_10_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_10_YoullBeSorryForThis"			;//������ �� �� ��� ���������!
	YesYes						=	"SVM_10_YesYes"							;//�����, �� ��������! �� �������!
	ShitWhatAMonster			=	"SVM_10_ShitWhatAMonster"				;//��� ��� �������! �����!
	Help						=	"SVM_10_Help"							;//���������!
	WeWillMeetAgain				=	"SVM_10_WeWillMeetAgain"				;//����� � ���� �� �����!
	NeverTryThatAgain			=	"SVM_10_NeverTryThatAgain"				;//��� ���, � �� ����� ��������!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"				;//������ ��� ����� ��� ������!
	ITookYourOre				=	"SVM_10_ITookYourOre"					;//��, � ������ � ���� ������� ����?
	ShitNoOre					=	"SVM_10_ShitNoOre"						;//�� ����� ����!
	HandsOff					=	"SVM_10_HandsOff"						;//��! ����� ����!
	GetOutOfHere				=	"SVM_10_GetOutOfHere"					;//����� ���!
	YouViolatedForbiddenTerritory=	"SVM_10_YouViolatedForbiddenTerritory"	;//��! � �� ������ ����� ������?
	YouWannaFoolMe				=	"SVM_10_YouWannaFoolMe"					;//�������, � ������ ������ �� ���������?!
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"			;//��, ��! ��� �� ����� �������?
	WhyAreYouInHere				=	"SVM_10_WhyYouAreInHere"				;//���� ������, ��� � ������ ������!
	WhatDidYouInThere			=	"SVM_10_WhatDidYouInThere"				;//��� ��� �� ����� �����?
	WiseMove					=	"SVM_10_WiseMove"						;//���� �������.
	Alarm						=	"SVM_10_Alarm"							;//������! ����!
	IntruderAlert				= 	"SVM_10_IntruderAlert"					;//�������! �����!
	BehindYou					=	"SVM_10_BehindYou"						;//���������!
	TheresAFight				=	"SVM_10_TheresAFight"					;//�, �����!
	HeyHeyHey					=	"SVM_10_HeyHeyHey"						;//��� �������!
	CheerFight					=	"SVM_10_CheerFight"						;//������� ������!
	CheerFriend					=	"SVM_10_CheerFriend"					;//�������� ���!
	Ooh							=	"SVM_10_Ooh"							;//�����, ���������!
	YeahWellDone				=	"SVM_10_YeahWellDone"					;//����� ��� ��� �������!
	RunCoward					=	"SVM_10_RunCoward"						;//�������, ����!
	HeDefeatedHim				=	"SVM_10_HeDefeatedHim"					;//�� ��� �� ������� �����, � �� �����������!
	HeDeservedIt				=	"SVM_10_HeDeservedIt"					;//�� ��� ��������!
	HeKilledHim					=	"SVM_10_HeKilledHim"					;//������ ��� � ����� ��������! ������ �� ���� �������!
	ItWasAGoodFight				=	"SVM_10_ItWasAGoodFight"				;//��� ��� � ����!
	Awake						=	"SVM_10_Awake"							;//
	FriendlyGreetings			=	"SVM_10_FriendlyGreetings"				;//������!
	ALGreetings					=	"SVM_10_ALGreetings"					;//�� ������!
	MageGreetings				=	"SVM_10_MageGreetings"					;//�� ��� �����!
	SectGreetings				=	"SVM_10_SectGreetings"					;//���������!
	ThereHeIs					= 	"SVM_10_ThereHeIs"						;//�� ��� ��.
	NoLearnNoPoints				= 	"SVM_10_NoLearnNoPoints"				;//������ �� �� ������� ������ ���������. ���� ����� ����.
	NoLearnOverMax				= 	"SVM_10_NoLearnOverMax"					;//�� �� ������� ��� �������. �������� ���-������ ������.
	NoLearnYouAlreadyKnow		=	"SVM_10_NoLearnYouAlreadyKnow"			;//������� ���� ����� ������� ������, � ������ ����� �� ������� ������� ����������.
	NoLearnYoureBetter			=	"SVM_10_NoLearnYoureBetter"				;//��, ��� ������� �����!
	HeyYou						=	"SVM_10_HeyYou"							;//��, ��!
	NotNow						=	"SVM_10_NotNow"							;//� ���� ��� �������.
	WhatDoYouWant				=	"SVM_10_WhatDoYouWant"					;//���� ���-�� �����?
	ISaidWhatDoYouWant			=	"SVM_10_ISaidWhatDoYouWant"				;//� ���� ���� ������?
	MakeWay						=	"SVM_10_MakeWay"						;//�������� ����!
	OutOfMyWay					=	"SVM_10_OutOfMyWay"						;//����� � ������!
	YouDeafOrWhat				=	"SVM_10_YouDeafOrWhat"					;//�� ������, ����� � �������� ����? ���� ������!
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"			;//����� ����� �����?
	LookAway					=	"SVM_10_LookAway"						;//�, �� ������� �� ���� ��������...
	OkayKeepIt					=	"SVM_10_OkayKeepIt"						;//������ ������ ����!
	WhatsThat					=	"SVM_10_WhatsThat"						;//��� ��� ����?
	ThatsMyWeapon				=	"SVM_10_ThatsMyWeapon"					;//����� ��� ������!
	GiveItToMe					=	"SVM_10_GiveItToMe"						;//��� ��� ���!
	YouCanKeeptheCrap			=	"SVM_10_YouCanKeeptheCrap"				;//��, �����, ������. ��� ��� ��� ����� �� �����.
	TheyKilledMyFriend			=	"SVM_10_TheyKilledMyFriend"				;//���� �� ����� ����� ����. ��� ��� ��� �� ��������!
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"			;//����� �� ���� ��������?
	SuckerGotSome				=	"SVM_10_SuckerGotSome"					;//��? �������? ��� ���� � ����!
	SuckerDefeatedEBr			=	"SVM_10_SuckerDefeatedEBr"				;//�� ����� ������!
	SuckerDefeatedGur			=	"SVM_10_SuckerDefeatedGur"				;//�� ������� ������ � ����.
	SuckerDefeatedMage			=	"SVM_10_SuckerDefeatedMage"				;//��, �������� ����...
	SuckerDefeatedNov_Guard		= 	"SVM_10_SuckerDefeatedNov_Guard"		;//���� ������� ���������� ���� �������, ������ ����� ���� �� ����!
	SuckerDefeatedVlk_Guard		= 	"SVM_10_SuckerDefeatedVlk_Guard"		;//� ����� ����� �� ��������. ������ ���� ����� � �����!
	YouDefeatedMyComrade		=	"SVM_10_YouDefeatedMyComrade"			;//�� ������ ������ �� ���� ������!  
	YouDefeatedNOV_Guard		=	"SVM_10_YouDefeatedNOV_Guard"			;//������ �������� ������� ����-������. ���� ��� ����� �� �������!
	YouDefeatedVLK_Guard		=	"SVM_10_YouDefeatedVLK_Guard"			;//�� ������ ���� ����������. ��� ����� ���� ������ ������!
	YouStoleFromMe				=	"SVM_10_YouStoleFromMe"					;//�� ������� ��������� ����� ��� ���, ���!
	YouStoleFromUs				=	"SVM_10_YouStoleFromUs"					;//�� ���� ��, ��� ����������� ���. ����� ���, ���� ���.
	YouStoleFromEBr				=	"SVM_10_YouStoleFromEBr"				;//�� ������� �������! ��� ��� ��� �� �������!
	YouStoleFromGur				=	"SVM_10_YouStoleFromGur"				;//�� ���-��� ����� � ����! ����, �� ��� ��� ��� �����!
	StoleFromMage				=	"SVM_10_StoleFromMage"					;//��� �� ����� � ����� ���-�� ������, ��?
	YouKilledMyFriend			=	"SVM_10_YouKilledMyFriend"				;//�� ���� ������ �� ����� �����. ��� ���� ������, � �� �������� � ����� ��� ��.
	YouKilledEBr				=	"SVM_10_YouKilledEBr"					;//�� ���� ������! ��� �� �����?
	YouKilledGur				=	"SVM_10_YouKilledGur"					;//�� ���� ������ �� ����! ����� ���, ��� ��� ��������!
	YouKilledMage				=	"SVM_10_YouKilledMage"					;//�� ���� ����! ��� �� ������ ��� ���������?
	YouKilledOCfolk				=	"SVM_10_YouKilledOCfolk"				;//� ������ ������ ���� �������, � �������, ��� ��� ���� ������ ��...
	YouKilledNCfolk				=	"SVM_10_YouKilledNCfolk"				;//� ����� ������ ����-�� �����. �������, �� � ���� �������...
	YouKilledPSIfolk			=	"SVM_10_YouKilledPSIfolk"				;//�������� �������� ������ �� ����� ��������������, � ��� ������ �� ����� �������!
	GetThingsRight				=	"SVM_10_GetThingsRight"					;//�� �� ������� �����������!
	YouDefeatedMeWell			=	"SVM_10_YouDefeatedMeWell"				;//����������! ��� ���� ������ ������!
	Smalltalk01					=	"SVM_10_Smalltalk01"					;// ...��� �� ��������...
	Smalltalk02					=	"SVM_10_Smalltalk02"					;// ...��������...
	Smalltalk03					=	"SVM_10_Smalltalk03"					;// ...�� ����� ������ �������...
	Smalltalk04					=	"SVM_10_Smalltalk04"					;// ...�� ����� � �������� �� �������...
	Smalltalk05					=	"SVM_10_Smalltalk05"					;// ...����� �������� �� ��� ����...
	Smalltalk06					=	"SVM_10_Smalltalk06"					;// ...��� ����� ���� ����, ��� ���� ���� �� ��������...
	Smalltalk07					=	"SVM_10_Smalltalk07"					;// ...������ ����� ����, ������ �� ����� ������������...
	Smalltalk08					=	"SVM_10_Smalltalk08"					;// ...����� �� ���� ������ �� ��������...
	Smalltalk09					=	"SVM_10_Smalltalk09"					;// ...���������, � � ���� ���-�� ����...
	Smalltalk10					=	"SVM_10_Smalltalk10"					;// ...����� ������, ������ ��� ���-������ ��������...
	Smalltalk11					=	"SVM_10_Smalltalk11"					;// ...� �� ���� ��������� � ����� ����...
	Smalltalk12					=	"SVM_10_Smalltalk12"					;// ...������ ������ �����, ��� �������...
	Smalltalk13					=	"SVM_10_Smalltalk13"					;// ...�� ����� �� �, ����� �� ���� ��������� ��� ��...
	Smalltalk14					=	"SVM_10_Smalltalk14"					;// ...��� ����� ���� � �� ��...
	Smalltalk15					=	"SVM_10_Smalltalk15"					;// ...�������� ����������, � ����� ��� ����...
	Smalltalk16					=	"SVM_10_Smalltalk16"					;// ...������ ��� ���� ������� �����, �� ��, ��� ������...
	Smalltalk17					=	"SVM_10_Smalltalk17"					;// ...� ������ ������ ������� ���� �� ������...
	Smalltalk18					=	"SVM_10_Smalltalk18"					;// ...������ �� ���� ������� ��� ��������...
	Smalltalk19					=	"SVM_10_Smalltalk19"					;// ...����� ������ ������ ��������, ������ ������� ����� ����������...
	Smalltalk20					=	"SVM_10_Smalltalk20"					;// ...�� �����, ��� ����� ���� ���-������ ���������...
	Smalltalk21					=	"SVM_10_Smalltalk21"					;// ...��������, �� ����...
	Smalltalk22					=	"SVM_10_Smalltalk22"					;// ...���� ������� �����. ������ �� ������� �� �����...
	Smalltalk23					=	"SVM_10_Smalltalk23"					;// ...� �����, ��� ��� ����� �������� ������...
	Smalltalk24					=	"SVM_10_Smalltalk24"					;// ...��� �� ������� ���������, ��������� � ���-������ ������...
	Om							= 	"SVM_10_Om"							;//
};



//////////////////////////////////////////
instance SVM_11	(C_SVM)				//Profi				Ruhig, abgezockt, Vern�nftig aberknallhart
{
	StopMagic					=	"SVM_11_StopMagic"						;//�� ���� ����� ���������!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"					;//� �� ������: ��������� ���������!
	WeaponDown					=	"SVM_11_WeaponDown"						;//���� ������ ����������� �� ����, ������� �� ���!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//����� ���, ��� � ������ ����!
	WatchYourAim				=	"SVM_11_WatchYourAim"					;//����� ������!
	WatchYourAimAngry			=	"SVM_11_WatchYourAimAngry"				;//��� �� ������ ����������� �� ����? ��?
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//��� �� �������? ��������!
	LetsForgetOurLittleFight	=	"SVM_11_LetsForgetOurLittleFight"		;//�����, ������� �� ���� �����.
	Strange						=	"SVM_11_Strange"						;//����! ���� �� ���������?
	DieMonster					=	"SVM_11_DieMonster"						;//� ���� ��, ���� ��� ����� ������ ���!
	DieMortalEnemy				=	"SVM_11_DieMortalEnemy"					;//������ ��� �������� ������, �������, ��� ������� � ���� ����������. ����.
	NowWait						=	"SVM_11_NowWait"						;//�� �� ������ ��� ����� ������!
	YouStillNotHaveEnough		=	"SVM_11_YouStillNotHaveEnough"			;//���� ���� �������� ����? ���, ������ ���������?
	YouAskedForIt				=	"SVM_11_YouAskedForIt"					;//�� ������ �������, ��� � ����� ��� ���� ��-�������!
	NowWaitIntruder				= 	"SVM_11_NowWaitIntruder"				;//��, �����! ������ �� ���� ������, ��� ���� �����!
	IWillTeachYouRespectForForeignProperty	=	"SVM_11_IWillTeachYouRespectForForeignProperty"	;//�� ��������� �� ���. 
	DirtyThief					=	"SVM_11_DirtyThief"						;//�� ������ � ���� ��������!
	YouAttackedMyCharge			=	"SVM_11_YouAttackedMyCharge"			;//�� ������ ��� ��� ���������? �� ��� � ������ ���� ��������!
	YouKilledOneOfUs			=	"SVM_11_YouKilledOneOfUs"				;//�� ���� ������ ��������, ��� ���� ��������� ������!
	Dead						=	"SVM_11_Dead"							;//
	Aargh_1						=	"SVM_11_Aargh_1"						;//
	Aargh_2						=	"SVM_11_Aargh_2"						;//
	Aargh_3						=	"SVM_11_Aargh_3"						;//
	Berzerk						=	"SVM_11_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_11_YoullBeSorryForThis"			;//����� �� �� ����� �� �����!
	YesYes						=	"SVM_11_YesYes"							;//��� � �������! �� �� �������!
	ShitWhatAMonster			=	"SVM_11_ShitWhatAMonster"				;//����� �� �� ��������!
	Help						=	"SVM_11_Help"							;//���������!
	WeWillMeetAgain				=	"SVM_11_WeWillMeetAgain"				;//�� ��� ��������� �� ����, ��������!
	NeverTryThatAgain			=	"SVM_11_NeverTryThatAgain"				;//� ��������� ��� ���� �� ����!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//����� � ������� ��� ������ ����!
	ITookYourOre				=	"SVM_11_ITookYourOre"					;//��� ������, ��� �� ��������� �� ���� ���� �����!
	ShitNoOre					=	"SVM_11_ShitNoOre"						;//���� ��! � ���� ��� ����!
	HandsOff					=	"SVM_11_HandsOff"						;//����� ���� ����!
	GetOutOfHere				=	"SVM_11_GetOutOfHere"					;//��������, ��� � �������� ���� ������!
	YouViolatedForbiddenTerritory=	"SVM_11_YouViolatedForbiddenTerritory"	;//��, � �� ��� ���� �����?
	YouWannaFoolMe				=	"SVM_11_YouWannaFoolMe"					;//�� ���� �� ����!
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"			;//� ��� ��� ��� ����� �������?
	WhyAreYouInHere				=	"SVM_11_WhyYouAreInHere"				;//��� ��� ���. ���, ��� � ������ ������!
	WhatDidYouInThere			=	"SVM_11_WhatDidYouInThere"				;//��� ��� ���� ����� �����? ��������, ���� � �� ����� ���� ���!
	WiseMove					=	"SVM_11_WiseMove"						;//�����! ������ ��� �� �����!
	Alarm						=	"SVM_11_Alarm"							;//������! ����!
	IntruderAlert				= 	"SVM_11_IntruderAlert"					;//�������! �����!
	BehindYou					=	"SVM_11_BehindYou"						;//���������!
	TheresAFight				=	"SVM_11_TheresAFight"					;//���������, ��� ������ �������!
	HeyHeyHey					=	"SVM_11_HeyHeyHey"						;//�����, ���!
	CheerFight					=	"SVM_11_CheerFight"						;//��������� � ��� ������!
	CheerFriend					=	"SVM_11_CheerFriend"					;//����� ��, �� ������� ��� ��������!
	Ooh							=	"SVM_11_Ooh"							;//�! �� ������!
	YeahWellDone				=	"SVM_11_YeahWellDone"					;//�������� ����!
	RunCoward					=	"SVM_11_RunCoward"						;//������ ����� �� ���������!
	HeDefeatedHim				=	"SVM_11_HeDefeatedHim"					;//��, ����� ����!
	HeDeservedIt				=	"SVM_11_HeDeservedIt"					;//�� �����! ��� ��� � ����!
	HeKilledHim					=	"SVM_11_HeKilledHim"					;//�� ���� ���! ������ � ���� ����� ��������!
	ItWasAGoodFight				=	"SVM_11_ItWasAGoodFight"				;//������! �������� ���� �����!
	Awake						=	"SVM_11_Awake"							;//
	FriendlyGreetings			=	"SVM_11_FriendlyGreetings"				;//������!
	ALGreetings					=	"SVM_11_ALGreetings"					;//�� ������!
	MageGreetings				=	"SVM_11_MageGreetings"					;//�� ��� �����!
	SectGreetings				=	"SVM_11_SectGreetings"					;//���������!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Bist du blind? Da vorne! //*** 11er war falsch betont!***
	NoLearnNoPoints				= 	"SVM_11_NoLearnNoPoints"				;//� �� ���� ����� ����. �� ��� ������������ ������.
	NoLearnOverMax				= 	"SVM_11_NoLearnOverMax"					;//�� �� ������� ����� ������ ���������. ���� ����� ������� ���-������ ������.
	NoLearnYouAlreadyKnow		=	"SVM_11_NoLearnYouAlreadyKnow"			;//������� �� ������ ������� ������, � ������ ����� ��������� ����������.
	NoLearnYoureBetter			=	"SVM_11_NoLearnYoureBetter"				;//�� ��� ������ ������!
	HeyYou						=	"SVM_11_HeyYou"							;//��, ��!
	NotNow						=	"SVM_11_NotNow"							;//�� ������.
	WhatDoYouWant				=	"SVM_11_WhatDoYouWant"					;//���� ���-������ �����?
	ISaidWhatDoYouWant			=	"SVM_11_ISaidWhatDoYouWant"				;//�����, ��� �� ������?
	MakeWay						=	"SVM_11_MakeWay"						;//����� ������?
	OutOfMyWay					=	"SVM_11_OutOfMyWay"						;//���� � ������!
	YouDeafOrWhat				=	"SVM_11_YouDeafOrWhat"					;//�� ������, ����� � ����� ������� �����? ��������!
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"			;//�� ��� ��� ������ ���������� �� ����?
	LookAway					=	"SVM_11_LookAway"						;//� �� ���� �� �� ��� �����������!
	OkayKeepIt					=	"SVM_11_OkayKeepIt"						;//������! ��� ����.
	WhatsThat					=	"SVM_11_WhatsThat"						;//��� ��� ����?
	ThatsMyWeapon				=	"SVM_11_ThatsMyWeapon"					;//�� ������ ��� ������?..
	GiveItToMe					=	"SVM_11_GiveItToMe"						;//�����, ��� ��� ����!
	YouCanKeeptheCrap			=	"SVM_11_YouCanKeeptheCrap"				;//��, ��� ������. ������ ����. ��� ��� ��� ����� �� �����.
	TheyKilledMyFriend			=	"SVM_11_TheyKilledMyFriend"				;//���� ��� �������! ��� ������ ��� ������ ��������� ���, � ���...
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"			;//��� ���������?
	SuckerGotSome				=	"SVM_11_SuckerGotSome"					;//���, �������? ������ �����!
	SuckerDefeatedEBr			=	"SVM_11_SuckerDefeatedEBr"				;//�� ������� ������ �� �������. �����, �� �����. ����� ����� �� ����� ����.
	SuckerDefeatedGur			=	"SVM_11_SuckerDefeatedGur"				;//�� ������� ������ �� ����.
	SuckerDefeatedMage			=	"SVM_11_SuckerDefeatedMage"				;//�������� ����... �� ����� ������ �������!
	SuckerDefeatedNov_Guard		= 	"SVM_11_SuckerDefeatedNov_Guard"		;//��� ���� ��� ���� �������. �� ������ ������ �� ���...
	SuckerDefeatedVlk_Guard		= 	"SVM_11_SuckerDefeatedVlk_Guard"		;//�� ���� � ���������, ����� ���� �������!
	YouDefeatedMyComrade		=	"SVM_11_YouDefeatedMyComrade"			;//���� ���� ������ - ��� ����.
	YouDefeatedNOV_Guard		=	"SVM_11_YouDefeatedNOV_Guard"			;//��� ��� ������� ���� �����, � �� ���������!
	YouDefeatedVLK_Guard		=	"SVM_11_YouDefeatedVLK_Guard"			;//���������� ���� �� ���� ����������? ��� ����� ������ ���� ������.
	YouStoleFromMe				=	"SVM_11_YouStoleFromMe"					;//� �� ��� ������ ���������� ��� �� �����, ������� ���?
	YouStoleFromUs				=	"SVM_11_YouStoleFromUs"					;//� ���� ���� ����, ������� ������������ ���. ����� ���� �� ������.
	YouStoleFromEBr				=	"SVM_11_YouStoleFromEBr"				;//�� �� ������� �������! ��, ��� ������ �� ��������!
	YouStoleFromGur				=	"SVM_11_YouStoleFromGur"				;//�� ������� ����! ��� ������, ��?
	StoleFromMage				=	"SVM_11_StoleFromMage"					;//� ���� ������� �������� ��������� �����?
	YouKilledMyFriend			=	"SVM_11_YouKilledMyFriend"				;//���� ������ �������: �� �������. �� ��� �������!
	YouKilledEBr				=	"SVM_11_YouKilledEBr"					;//�� ���� ������! �� �� ������ � ��� �����!
	YouKilledGur				=	"SVM_11_YouKilledGur"					;//�� ���� ����! ��� �� ����� ���� �������!
	YouKilledMage				=	"SVM_11_YouKilledMage"					;//�� ���� ����! ��� �� ��� ������ ���������?
	YouKilledOCfolk				=	"SVM_11_YouKilledOCfolk"				;//� ������ ������ ���-�� ����. �������, ��� �� � ���� �������...
	YouKilledNCfolk				=	"SVM_11_YouKilledNCfolk"				;//� ����� ������ ����� ��������. �������, �� �������� ���� � ����� ��������!
	YouKilledPSIfolk			=	"SVM_11_YouKilledPSIfolk"				;//���� ���� �� ������������ ��������. ��� ����� �� ����� �������!
	GetThingsRight				=	"SVM_11_GetThingsRight"					;//�� �� ������� ��������� ���� ��������!
	YouDefeatedMeWell			=	"SVM_11_YouDefeatedMeWell"				;//�� ������ ���������. � ��� ����� ���� ���������� �� ���� ��������. �� ������ ��� ������!
	Smalltalk01					=	"SVM_11_Smalltalk01"					;// ...��� �� ��������...
	Smalltalk02					=	"SVM_11_Smalltalk02"					;// ...��������...
	Smalltalk03					=	"SVM_11_Smalltalk03"					;// ...�� ����� ������ �������...
	Smalltalk04					=	"SVM_11_Smalltalk04"					;// ...�� ����� � �������� �� �������...
	Smalltalk05					=	"SVM_11_Smalltalk05"					;// ...����� �������� - �� ��� ����...
	Smalltalk06					=	"SVM_11_Smalltalk06"					;// ...��� ����� ���� ����, ��� ���� ���� �� ��������...
	Smalltalk07					=	"SVM_11_Smalltalk07"					;// ...������ ����� ����, ������ �� ����� ������������...
	Smalltalk08					=	"SVM_11_Smalltalk08"					;// ...����� �� ���� ������ �� ��������...
	Smalltalk09					=	"SVM_11_Smalltalk09"					;// ...���������, � � ���� ���-�� ����...
	Smalltalk10					=	"SVM_11_Smalltalk10"					;// ...����� ������, ������ ��� ���-������ ��������...
	Smalltalk11					=	"SVM_11_Smalltalk11"					;// ...� �� ���� ��������� � ����� ����...
	Smalltalk12					=	"SVM_11_Smalltalk12"					;// ...������ ������ �����, ��� �������...
	Smalltalk13					=	"SVM_11_Smalltalk13"					;// ...�� ����� �� �, ����� �� ���� ��������� ��� ��...
	Smalltalk14					=	"SVM_11_Smalltalk14"					;// ...��� ����� ���� � �� ��...
	Smalltalk15					=	"SVM_11_Smalltalk15"					;// ...�������� ����������, � ����� ��� ����...
	Smalltalk16					=	"SVM_11_Smalltalk16"					;// ...������ ��� ���� ������� �����, �� ��, ��� ������...
	Smalltalk17					=	"SVM_11_Smalltalk17"					;// ...� ������ ������ ������� ���� �� ������...
	Smalltalk18					=	"SVM_11_Smalltalk18"					;// ...������ �� ���� ������� ��� ��������...
	Smalltalk19					=	"SVM_11_Smalltalk19"					;// ...����� ������ ������ ��������, ������ ������� ����� ����������...
	Smalltalk20					=	"SVM_11_Smalltalk20"					;// ...�� �����, ��� ����� ���� ���-������ ���������...
	Smalltalk21					=	"SVM_11_Smalltalk21"					;// ...��������, �� ����...
	Smalltalk22					=	"SVM_11_Smalltalk22"					;// ...���� ������� �����. ������ �� ������� �� �����...
	Smalltalk23					=	"SVM_11_Smalltalk23"					;// ...� �����, ��� ��� ����� �������� ������...
	Smalltalk24					=	"SVM_11_Smalltalk24"					;// ...��� �� ������� ���������, ��������� � ���-������ ������...
	Om							= 	"SVM_11_Om"							;//
};


instance SVM_12	(C_SVM)		//Bazaar-H�ndler		Nach au�en freundlich,jovial,Innen hinterh�ltig, raffgierig
{
	StopMagic					=	"SVM_12_StopMagic"						;//��������� ���������!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"					;//��������� ���������, ���� ������!
	WeaponDown					=	"SVM_12_WeaponDown"						;//����� ��� ���� ������, ������!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"				;//������ ������, � ������!
	WatchYourAim				=	"SVM_12_WatchYourAim"					;//�� �������� ���� �����! ������ ��������!
	WatchYourAimAngry			=	"SVM_12_WatchYourAimAngry"				;//��������� � ���� ��������, ����� � ���� ����� ��������!
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"				;//��, �� ������ ��� ���?
	LetsForgetOurLittleFight	=	"SVM_12_LetsForgetOurLittleFight"		;//����� ������� ��� �����, �����?
	Strange						=	"SVM_12_Strange"						;//�� �� ������ ��� ��� �����?! �������! 
	DieMonster					=	"SVM_12_DieMonster"						;//���� �������, �������!
	DieMortalEnemy				=	"SVM_12_DieMortalEnemy"					;//������ ����� ��������!
	NowWait						=	"SVM_12_NowWait"						;//������ ����� ������� �����...
	YouStillNotHaveEnough		=	"SVM_12_YouStillNotHaveEnough"			;//��, ���, ������ ���?
	YouAskedForIt				=	"SVM_12_YouAskedForIt"					;//�� ��� ����������!
	NowWaitIntruder				= 	"SVM_12_NowWaitIntruder"				;//������ ���� �� ��� �� ����!
	IWillTeachYouRespectForForeignProperty	=	"SVM_12_IWillTeachYouRespectForForeignProperty"	;//������ � ���� ������ ������!
	DirtyThief					=	"SVM_12_DirtyThief"						;//������� ���! ������ � ���� ������!
	YouAttackedMyCharge			=	"SVM_12_YouAttackedMyCharge"			;//����� �� ����� ������� ���� ������!
	YouKilledOneOfUs			=	"SVM_12_YouKilledOneOfUs"				;//�� ���� ������ �� ���! ������ ���� �����!
	Dead						=	"SVM_12_Dead"							;//
	Aargh_1						=	"SVM_12_Aargh_1"						;//
	Aargh_2						=	"SVM_12_Aargh_2"						;//
	Aargh_3						=	"SVM_12_Aargh_3"						;//
	Berzerk						=	"SVM_12_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_12_YoullBeSorryForThis"			;//�� ��� �� ���� ���������!
	YesYes						=	"SVM_12_YesYes"							;//��������, ������! �� �������.
	ShitWhatAMonster			=	"SVM_12_ShitWhatAMonster"				;//����� �������� ��������. ���� ��� �� �� �����!
	Help						=	"SVM_12_Help"							;//���� �������!
	WeWillMeetAgain				=	"SVM_12_WeWillMeetAgain"				;//�� ��� ����������!
	NeverTryThatAgain			=	"SVM_12_NeverTryThatAgain"				;//� ��������� ��� ���� �� ������!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"				;//�������� ������! �� ����� ��������� ��� �����.
	ITookYourOre				=	"SVM_12_ITookYourOre"					;//��, �������, �� ������ ������, ���� � ����������� ������� ����?
	ShitNoOre					=	"SVM_12_ShitNoOre"						;//�� � ���� �� ������ ��� ����?!
	HandsOff					=	"SVM_12_HandsOff"						;//��, �������! ����� ����! � ���� ������!
	GetOutOfHere				=	"SVM_12_GetOutOfHere"					;//�����! ����� ���� �� �����!
	YouViolatedForbiddenTerritory=	"SVM_12_YouViolatedForbiddenTerritory";//��� ��� �� ����� �������?
	YouWannaFoolMe				=	"SVM_12_YouWannaFoolMe"					;//�������� ���� �������? ������ ��������!
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"			;//��, ��! �� ��� ����� �����?
	WhyAreYouInHere				=	"SVM_12_WhyYouAreInHere"				;//��� �� ����� �������? �����, ����� � ������ ������!
	WhatDidYouInThere			=	"SVM_12_WhatDidYouInThere"				;//���� ������ ����� ������!
	WiseMove					=	"SVM_12_WiseMove"						;//�� ������ �������!
	Alarm						=	"SVM_12_Alarm"							;//������, ����!
	IntruderAlert				= 	"SVM_12_IntruderAlert"					;//�������!
	BehindYou					=	"SVM_12_BehindYou"						;//���� ���������!
	TheresAFight				=	"SVM_12_TheresAFight"					;//������ �� ���������, ��� ����.
	HeyHeyHey					=	"SVM_12_HeyHeyHey"						;//��� ���� ���?!
	CheerFight					=	"SVM_12_CheerFight"						;//������!
	CheerFriend					=	"SVM_12_CheerFriend"					;//��� �������!
	Ooh							=	"SVM_12_Ooh"							;//���������, �����!
	YeahWellDone				=	"SVM_12_YeahWellDone"					;//��!
	RunCoward					=	"SVM_12_RunCoward"						;//�� �������!
	HeDefeatedHim				=	"SVM_12_HeDefeatedHim"					;//� �� ������, ������ ������!
	HeDeservedIt				=	"SVM_12_HeDeservedIt"					;//��, ��� ��� � ����!
	HeKilledHim					=	"SVM_12_HeKilledHim"					;//�� �������� �����. ������ � ���� ������� ������������!
	ItWasAGoodFight				=	"SVM_12_ItWasAGoodFight"				;//�������� �����!
	Awake						=	"SVM_12_Awake"							;// 
	FriendlyGreetings			=	"SVM_12_FriendlyGreetings"				;//������!
	ALGreetings					=	"SVM_12_ALGreetings"					;//�� ������!
	MageGreetings				=	"SVM_12_MageGreetings"					;//�� ��� �����!
	SectGreetings				=	"SVM_12_SectGreetings"					;//���������!
	ThereHeIs					= 	"SVM_12_ThereHeIs"						;//����.
	NoLearnNoPoints				= 	"SVM_12_NoLearnNoPoints"				;//� �� ���� ������� ����. � ���� ������������ �����.
	NoLearnOverMax				= 	"SVM_12_NoLearnOverMax"					;//�� ��� ������ ��� �����. ���� ����� ��������� ����-������ ���.
	NoLearnYouAlreadyKnow		=	"SVM_12_NoLearnYouAlreadyKnow"			;//���� ����� ��������� �����, ������ ��� �� ������� ��������� ��������.
	NoLearnYoureBetter			=	"SVM_12_NoLearnYoureBetter"				;//������ �� ������� �����!
	HeyYou						=	"SVM_12_HeyYou"							;//��, ��!  
	NotNow						=	"SVM_12_NotNow"							;//�� ������.
	WhatDoYouWant				=	"SVM_12_WhatDoYouWant"					;//��� ���� ������?
	ISaidWhatDoYouWant			=	"SVM_12_ISaidWhatDoYouWant"				;//��� �� ������?
	MakeWay						=	"SVM_12_MakeWay"						;//��� ��� ������!
	OutOfMyWay					=	"SVM_12_OutOfMyWay"						;//�� ��, ���� � ������!
	YouDeafOrWhat				=	"SVM_12_YouDeafOrWhat"					;//�� ������ ��� � ���� ���� �������?
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"			;//�� ������ �� ���� �����������?
	LookAway					=	"SVM_12_LookAway"						;//���-�� ���������? � ������ �� �����...
	OkayKeepIt					=	"SVM_12_OkayKeepIt"						;//�����. ������ ������� ��� ����.
	WhatsThat					=	"SVM_12_WhatsThat"						;//��� ��� ����?
	ThatsMyWeapon				=	"SVM_12_ThatsMyWeapon"					;//����� ��� ��� ������!
	GiveItToMe					=	"SVM_12_GiveItToMe"						;//�����, ���� �������!
	YouCanKeeptheCrap			=	"SVM_12_YouCanKeeptheCrap"				;//��, �� ��� �� �����! � ���� ���� ���!
	TheyKilledMyFriend			=	"SVM_12_TheyKilledMyFriend"				;//����� ������ �� �����! ���� � �������� �� ����� �������...
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"			;//��, ��� �����? ����� �� ���� ��������?
	SuckerGotSome				=	"SVM_12_SuckerGotSome"					;//�? ������� � �����? ��� �������� ���� ������!
	SuckerDefeatedEBr			=	"SVM_12_SuckerDefeatedEBr"				;//�� ����� ������. ���� �� �������� ��� �����!
	SuckerDefeatedGur			=	"SVM_12_SuckerDefeatedGur"				;//�� ����� ����. ������, ���� ��� � ��� �� ������!
	SuckerDefeatedMage			=	"SVM_12_SuckerDefeatedMage"				;//�������� ����... ��, ������ ����, ������� ������!
	SuckerDefeatedNov_Guard		= 	"SVM_12_SuckerDefeatedNov_Guard"		;//������ ����� ����� ������� � ���������!
	SuckerDefeatedVlk_Guard		= 	"SVM_12_SuckerDefeatedVlk_Guard"		;//�������, ���� ��������� ���� ���������?
	YouDefeatedMyComrade		=	"SVM_12_YouDefeatedMyComrade"			;//�� ������ ����� �����. ������ �����?!
	YouDefeatedNOV_Guard		=	"SVM_12_YouDefeatedNOV_Guard"			;//��� ��� ������� ����������, � �� �� ���� ���������!
	YouDefeatedVLK_Guard		=	"SVM_12_YouDefeatedVLK_Guard"			;//���� �� ������ ����� � ���� ����������, � ����� � ����� ���������!
	YouStoleFromMe				=	"SVM_12_YouStoleFromMe"					;//��� �� ������ ��������� �����, ������� �������?
	YouStoleFromUs				=	"SVM_12_YouStoleFromUs"					;//�� ����� �������� ���� ����! ������ �����!
	YouStoleFromEBr				=	"SVM_12_YouStoleFromEBr"				;//�� ������� �������! ��� ����� � ������!
	YouStoleFromGur				=	"SVM_12_YouStoleFromGur"				;//�� ������� ����! ���� �� ������ ���������� �� ����!
	StoleFromMage				=	"SVM_12_StoleFromMage"					;//�� ������� �����! � ��� �� ����� ���, ��� ������ � �� �����!
	YouKilledMyFriend			=	"SVM_12_YouKilledMyFriend"				;//���� �� ����� ��� ���� �������. �������, ��� ������ �� ����� �������. � ��������� ��� �� ���� ����� �� �������!
	YouKilledEBr				=	"SVM_12_YouKilledEBr"					;//�� ���� ������! ������, �� ������������ ������?!
	YouKilledGur				=	"SVM_12_YouKilledGur"					;//�� ���� ����! ����� �� ����� ����, ��� �� ���?
	YouKilledMage				=	"SVM_12_YouKilledMage"					;//�� ���� ����! � ���� ���� ���� �����-������ ����������?
	YouKilledOCfolk				=	"SVM_12_YouKilledOCfolk"				;//���� ������� �� ������� ������, � ���-��� ��������� ���� � ���� ���������...
	YouKilledNCfolk				=	"SVM_12_YouKilledNCfolk"				;//���� ���� �� ����� ������ ������. �������, ��� ��� ���� �� ��������!
	YouKilledPSIfolk			=	"SVM_12_YouKilledPSIfolk"				;//���� ���� �� �������������� ��������. ���-�� �������, ��� �� �������� � ���� �������.
	GetThingsRight				=	"SVM_12_GetThingsRight"					;//�� �� ������� ���� �� ���������������!
	YouDefeatedMeWell			=	"SVM_12_YouDefeatedMeWell"				;//�� ������� ���� � ������� ���. �� ������ ��� �����������.
	Smalltalk01					=	"SVM_12_Smalltalk01"					;// ...��, ���� �� �������...
	Smalltalk02					=	"SVM_12_Smalltalk02"					;// ...��������...
	Smalltalk03					=	"SVM_12_Smalltalk03"					;// ...�� ����� ������ �������...
	Smalltalk04					=	"SVM_12_Smalltalk04"					;// ...� �� ���� � ��� �����������...
	Smalltalk05					=	"SVM_12_Smalltalk05"					;// ...����� �������� - �� ��� ����...
	Smalltalk06					=	"SVM_12_Smalltalk06"					;// ...��� ����� ���� ����, ��� ���� ���� �� ��������...
	Smalltalk07					=	"SVM_12_Smalltalk07"					;// ...������ ����� ����, ������ ������������� ����� �� ����.
	Smalltalk08					=	"SVM_12_Smalltalk08"					;// ...������ ����� �� ��������...
	Smalltalk09					=	"SVM_12_Smalltalk09"					;// ...���-�� �� �� � ���� �������...
	Smalltalk10					=	"SVM_12_Smalltalk10"					;// ...����� ������, ������ ��� ���-������ ��������...
	Smalltalk11					=	"SVM_12_Smalltalk11"					;// ...���� ���� �� �������...
	Smalltalk12					=	"SVM_12_Smalltalk12"					;// ...������ ������ �����, ��� �������...
	Smalltalk13					=	"SVM_12_Smalltalk13"					;// ...�� ����� �� �, ����� �� ���� ��������� ��� ��...
	Smalltalk14					=	"SVM_12_Smalltalk14"					;// ...��� ����� ���� � �� ��...
	Smalltalk15					=	"SVM_12_Smalltalk15"					;// ...�������� ����������, � ����� ��� ����...
	Smalltalk16					=	"SVM_12_Smalltalk16"					;// ...������ ��� ���� ������� �����, �� ��, ��� ������...
	Smalltalk17					=	"SVM_12_Smalltalk17"					;// ...� ������ ������ ������� ���� �� ������...
	Smalltalk18					=	"SVM_12_Smalltalk18"					;// ...������ �� ���� ������� ��� ��������...
	Smalltalk19					=	"SVM_12_Smalltalk19"					;// ...����� ������ ������ ��������, ������ ������� ����� ����������, �������...
	Smalltalk20					=	"SVM_12_Smalltalk20"					;// ...� �� �����, ��� ����� ���� ���-������ ���������...
	Smalltalk21					=	"SVM_12_Smalltalk21"					;// ...��������, �� ����...
	Smalltalk22					=	"SVM_12_Smalltalk22"					;// ...�������. ����� �� �� ��� �� ����������...
	Smalltalk23					=	"SVM_12_Smalltalk23"					;// ...� �����, ��� ��� ����� �������� ������...
	Smalltalk24					=	"SVM_12_Smalltalk24"					;// ...����� ��������� � ���-������ ������...
	Om							= 	"SVM_12_Om"							;//
};


instance SVM_13	(C_SVM)					// Fanatiker	Agressiv, �bereifrig, �hnlich wie Stimme7Freak,	aber klarer, Ruhm-und-Ehre-Typ,	Nov: Glauben an	Y�berion blind,	Mitl�ufer
{
	StopMagic					=	"SVM_13_StopMagic"						;//��������� ���������!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"					;//��������� ���������, ���� ������!
	WeaponDown					=	"SVM_13_WeaponDown"						;//����� ������!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"				;//������ ������, � ������!
	WatchYourAim				=	"SVM_13_WatchYourAim"					;//�� �������� ���� �����! ������ ��������!
	WatchYourAimAngry			=	"SVM_13_WatchYourAimAngry"				;//������ �������? ��������� � ���� ��������!
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"				;//����� �� ��� �������?
	LetsForgetOurLittleFight	=	"SVM_13_LetsForgetOurLittleFight"		;//����� ������� ��� �����, �����?
	Strange						=	"SVM_13_Strange"						;//�� ���� �� ���! ���� �� �� �����?
	DieMonster					=	"SVM_13_DieMonster"						;//�� ���� ��������� �������� ����!
	DieMortalEnemy				=	"SVM_13_DieMortalEnemy"					;//������ ���� �����! ������ �� ���!
	NowWait						=	"SVM_13_NowWait"						;//������ ����� ������� �����...
	YouStillNotHaveEnough		=	"SVM_13_YouStillNotHaveEnough"			;//�� ���, ������ ���?
	YouAskedForIt				=	"SVM_13_YouAskedForIt"					;//�� ��� ����������!
	NowWaitIntruder				= 	"SVM_13_NowWaitIntruder"				;//������ ���� �� ��� �� ����!
	IWillTeachYouRespectForForeignProperty	=	"SVM_13_IWillTeachYouRespctForForeignProperty"	;//������ � ���� ������ ������!
	DirtyThief					=	"SVM_13_DirtyThief"						;//������� ���! ������ � ���� ������!
	YouAttackedMyCharge			=	"SVM_13_YouAttackedMyCharge"			;//����� ������ � ���� ���������� �����!
	YouKilledOneOfUs			=	"SVM_13_YouKilledOneOfUs"				;//�� ���� ������ �� ���!
	Dead						=	"SVM_13_Dead"							;//
	Aargh_1						=	"SVM_13_Aargh_1"						;//
	Aargh_2						=	"SVM_13_Aargh_2"						;//
	Aargh_3						=	"SVM_13_Aargh_3"						;//
	Berzerk						=	"SVM_13_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_13_YoullBeSorryForThis"			;//������ ������������, ������ � ���� ����!
	YesYes						=	"SVM_13_YesYes"							;//��� ��? � �� ������ �� �����!
	ShitWhatAMonster			=	"SVM_13_ShitWhatAMonster"				;//����� �������� ��������. �� ��� ����������...
	Help						=	"SVM_13_Help"							;//���� �������!
	WeWillMeetAgain				=	"SVM_13_WeWillMeetAgain"				;//�� ��� ����������!
	NeverTryThatAgain			=	"SVM_13_NeverTryThatAgain"				;//� ��������� ��� ���� �� ������!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"				;//�������� ������! �� ����� ��������� ��� �����.
	ITookYourOre				=	"SVM_13_ITookYourOre"					;//��, �������, �� ������ ������, ���� � ����������� ������� ����?
	ShitNoOre					=	"SVM_13_ShitNoOre"						;//�� � ���� �� ������ ��� ����?!
	HandsOff					=	"SVM_13_HandsOff"						;//��, �������! ����� ����! � ���� ������!
	GetOutOfHere				=	"SVM_13_GetOutOfHere"					;//�����! ����� ���� �� �����!
	YouViolatedForbiddenTerritory=	"SVM_13_YouViolatedForbiddenTerritory"	;//��� ��� �� ����� �������?
	YouWannaFoolMe				=	"SVM_13_YouWannaFoolMe"					;//�������� ���� �������? ������ ��������!
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"			;//��, ��! �� ����� ���-�� �����?
	WhyAreYouInHere				=	"SVM_13_WhyYouAreInHere"				;//��� �� ����� �������? �����, ����� � ������ ������!
	WhatDidYouInThere			=	"SVM_13_WhatDidYouInThere"				;//���� ������ ����� ������!
	WiseMove					=	"SVM_13_WiseMove"						;//���� �������! �� � ��������� ��� � ���� ����� �� �����!
	Alarm						=	"SVM_13_Alarm"							;//������, ����!
	IntruderAlert				= 	"SVM_13_IntruderAlert"					;//�������!
	BehindYou					=	"SVM_13_BehindYou"						;//���� ���������!
	TheresAFight				=	"SVM_13_TheresAFight"					;//������ �� ���������, ��� ����.
	HeyHeyHey					=	"SVM_13_HeyHeyHey"						;//��, ��� ���!
	CheerFight					=	"SVM_13_CheerFight"						;//� ���� ������� �����!
	CheerFriend					=	"SVM_13_CheerFriend"					;//��� �������!
	Ooh							=	"SVM_13_Ooh"							;//���������, �����!
	YeahWellDone				=	"SVM_13_YeahWellDone"					;//��!
	RunCoward					=	"SVM_13_RunCoward"						;//��, ��������!
	HeDefeatedHim				=	"SVM_13_HeDefeatedHim"					;//������ �������! �� ��� �� �������� ������� ������� ������!
	HeDeservedIt				=	"SVM_13_HeDeservedIt"					;//��, ��� ��� � ����!
	HeKilledHim					=	"SVM_13_HeKilledHim"					;//���� ���� �������, ��? ������� �� � ���� ��� ������� ����� ��� ����������.
	ItWasAGoodFight				=	"SVM_13_ItWasAGoodFight"				;//�������� �����!
	Awake						=	"SVM_13_Awake"							;//
	FriendlyGreetings			=	"SVM_13_FriendlyGreetings"				;//� ���� ��� � �������?
	ALGreetings					=	"SVM_13_ALGreetings"					;//�� ������!
	MageGreetings				=	"SVM_13_MageGreetings"					;//�� ��� �����!
	SectGreetings				=	"SVM_13_SectGreetings"					;//���������!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Bist du blind? Da vorne!
	NoLearnNoPoints				= 	"SVM_13_NoLearnNoPoints"				;//� �� ���� ������� ����. � ���� ������������ �����.
	NoLearnOverMax				= 	"SVM_13_NoLearnOverMax"					;//�� ��� ������ ��� �����. ���� ����� ��������� ����-������ ���.
	NoLearnYouAlreadyKnow		=	"SVM_13_NoLearnYouAlreadyKnow"			;//�������� ������ ����������� ����������, ������ ��� �� ������� ��������� ��������.
	NoLearnYoureBetter			=	"SVM_13_NoLearnYoureBetter"				;//�� ��� ������ ������.
	HeyYou						=	"SVM_13_HeyYou"							;//��, ��!
	NotNow						=	"SVM_13_NotNow"							;//�� ������.
	WhatDoYouWant				=	"SVM_13_WhatDoYouWant"					;//��� ���� �� ���� �����?
	ISaidWhatDoYouWant			=	"SVM_13_ISaidWhatDoYouWant"				;//� ���� ���-������ ��� ���� �������?
	MakeWay						=	"SVM_13_MakeWay"						;//�������� ����!
	OutOfMyWay					=	"SVM_13_OutOfMyWay"						;//���� � ������!
	YouDeafOrWhat				=	"SVM_13_YouDeafOrWhat"					;//����� �������������? ��� ������!
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"			;//�� ������ �� ���� �����������?
	LookAway					=	"SVM_13_LookAway"						;//� ������ �� �����!
	OkayKeepIt					=	"SVM_13_OkayKeepIt"						;//��������. ������ ������� ��� ����.
	WhatsThat					=	"SVM_13_WhatsThat"						;//��� ��� ����?
	ThatsMyWeapon				=	"SVM_13_ThatsMyWeapon"					;//����� ��� ��� ������!
	GiveItToMe					=	"SVM_13_GiveItToMe"						;//�����, ���� �������!
	YouCanKeeptheCrap			=	"SVM_13_YouCanKeeptheCrap"				;//������! ������ ����! � ����� ���� ���-������ ������!
	TheyKilledMyFriend			=	"SVM_13_TheyKilledMyFriend"				;//���� �� ����� ����� ��� ������� ����. ��� ����� ������� � �����!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"			;//����� �� ���� ��������?
	SuckerGotSome				=	"SVM_13_SuckerGotSome"					;//��� �������� ���� ������� ������. ������ �� ������ �������� ���� ������!
	SuckerDefeatedEBr			=	"SVM_13_SuckerDefeatedEBr"				;//�� ����� ������. ���� �� �������� ��� �����!
	SuckerDefeatedGur			=	"SVM_13_SuckerDefeatedGur"				;//�� ����� ����. ������, ���� ��� � ��� �� ������!
	SuckerDefeatedMage			=	"SVM_13_SuckerDefeatedMage"				;//���� ���� ������ �������, ����� ����������� � ����� � �����.
	SuckerDefeatedNov_Guard		= 	"SVM_13_SuckerDefeatedNov_Guard"		;//��� �� �������� ����� �����������?!
	SuckerDefeatedVlk_Guard		= 	"SVM_13_SuckerDefeatedVlk_Guard"		;//�� ������ ���� �����!
	YouDefeatedMyComrade		=	"SVM_13_YouDefeatedMyComrade"			;//�� ������ ��������� ���� �� ���� ������, �� �� ��� �����������.
	YouDefeatedNOV_Guard		=	"SVM_13_YouDefeatedNOV_Guard"			;//�������� �������� ��� �����. ��� ����� ������ ���� �����!
	YouDefeatedVLK_Guard		=	"SVM_13_YouDefeatedVLK_Guard"			;//���� �� ������ ����� � ���� ����������, � ����� � ����� ���������!
	YouStoleFromMe				=	"SVM_13_YouStoleFromMe"					;//�� ������� ����! ���� ��� ��������!
	YouStoleFromUs				=	"SVM_13_YouStoleFromUs"					;//�� ����� �������� ���� ����! ������ �����!
	YouStoleFromEBr				=	"SVM_13_YouStoleFromEBr"				;//�� ������� �������! ����� �� ��� ������?
	YouStoleFromGur				=	"SVM_13_YouStoleFromGur"				;//�� ������� ����! ��� ��� �����, ��� ��� ��� ��.
	StoleFromMage				=	"SVM_13_StoleFromMage"					;//�� ������� �����! ��� ���� ��������� � ����� �������.
	YouKilledMyFriend			=	"SVM_13_YouKilledMyFriend"				;//���� �� ����� ��� ���� �������. �������, ��� ������ �� ����� �������. � ��������� ��� �� ���� ����� �� �������!
	YouKilledEBr				=	"SVM_13_YouKilledEBr"					;//�� ���� ������! �������, ���� ��� ������ � ���?
	YouKilledGur				=	"SVM_13_YouKilledGur"					;//�� ���� ����! ����� �� ����� ����, ��� �� ���?
	YouKilledMage				=	"SVM_13_YouKilledMage"					;//�� ���� ����! � ���� ���� ���� �����-������ ����������?
	YouKilledOCfolk				=	"SVM_13_YouKilledOCfolk"				;//� ������ ������ ��������� ��������. ����� �����, ��� �� � ���� �������...
	YouKilledNCfolk				=	"SVM_13_YouKilledNCfolk"				;//���� ���� �� ����� ������ ������. �������, ��� ��� ���� �� ��������!
	YouKilledPSIfolk			=	"SVM_13_YouKilledPSIfolk"				;//���� ���� �� �������������� ��������. ���-�� �������, ��� �� �������� � ���� �������.
	GetThingsRight				=	"SVM_13_GetThingsRight"					;//�� �� ������� ���� �� ���������������!
	YouDefeatedMeWell			=	"SVM_13_YouDefeatedMeWell"				;//�� ������� ���� � ������� ���. �� ������ ��� �����������, � �� ����� �� ���� ���.
	Smalltalk01					=	"SVM_13_Smalltalk01"					;// ...��� �� ��������...
	Smalltalk02					=	"SVM_13_Smalltalk02"					;// ...��������...
	Smalltalk03					=	"SVM_13_Smalltalk03"					;// ...�� ����� ������ �������...
	Smalltalk04					=	"SVM_13_Smalltalk04"					;// ...�� ����� � �������� �� �������...
	Smalltalk05					=	"SVM_13_Smalltalk05"					;// ...����� �������� �� ��� ����...
	Smalltalk06					=	"SVM_13_Smalltalk06"					;// ...��� ����� ���� ����, ��� ���� ���� �� ��������...
	Smalltalk07					=	"SVM_13_Smalltalk07"					;// ...������ ����� ����, ������ �� ����� ������������...
	Smalltalk08					=	"SVM_13_Smalltalk08"					;// ...����� �� ���� ������ �� ��������...
	Smalltalk09					=	"SVM_13_Smalltalk09"					;// ...���������, � � ���� ���-�� ����...
	Smalltalk10					=	"SVM_13_Smalltalk10"					;// ...����� ������, ������ ��� ���-������ ��������...
	Smalltalk11					=	"SVM_13_Smalltalk11"					;// ...� �� ���� ��������� � ����� ����...
	Smalltalk12					=	"SVM_13_Smalltalk12"					;// ...������ ������ �����, ��� �������...
	Smalltalk13					=	"SVM_13_Smalltalk13"					;// ...�� ����� �� �, ����� �� ���� ��������� ��� ��...
	Smalltalk14					=	"SVM_13_Smalltalk14"					;// ...��� ����� ���� � �� ��...
	Smalltalk15					=	"SVM_13_Smalltalk15"					;// ...�������� ����������, � ����� ��� ����...
	Smalltalk16					=	"SVM_13_Smalltalk16"					;// ...������ ��� ���� ������� �����, �� ��, ��� ������...
	Smalltalk17					=	"SVM_13_Smalltalk17"					;// ...� ������ ������ ������� ���� �� ������...
	Smalltalk18					=	"SVM_13_Smalltalk18"					;// ...������ �� ���� ������� ��� ��������...
	Smalltalk19					=	"SVM_13_Smalltalk19"					;// ...����� ������ ������ ��������, ������ ������� ����� ����������, �������...
	Smalltalk20					=	"SVM_13_Smalltalk20"					;// ...�� �����, ��� ����� ���-������ ���������...
	Smalltalk21					=	"SVM_13_Smalltalk21"					;// ...��������, �� ����...
	Smalltalk22					=	"SVM_13_Smalltalk22"					;// ...���� ������� �����. ������ �� ������� �� �����...
	Smalltalk23					=	"SVM_13_Smalltalk23"					;// ...� �����, ��� ��� ����� �������� ������...
	Smalltalk24					=	"SVM_13_Smalltalk24"					;// ...��� �� ������� ���������, ��������� � ���-������ ������...
	Om							= 	"SVM_13_Om"							;//
};



//////////////////////////////////////////
instance SVM_14	(C_SVM)				// Xardas(DMB),Corristo,Erz�hler	alt	arrogant, gebildet
{
	StopMagic					=	"SVM_14_StopMagic"						;//������ ���������!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"					;//�� ��� �� �������: ������� �����!
	WeaponDown					=	"SVM_14_WeaponDown"						;//����� ���� ��� ������?
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//������ ������!
	WatchYourAim				=	"SVM_14_WatchYourAim"					;//�� ��� ���������?
	WatchYourAimAngry			=	"SVM_14_WatchYourAimAngry"				;//�����, ������ �������� � ����?
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//������, ��� �� �������!
	LetsForgetOurLittleFight	=	"SVM_14_LetsForgetOurLittleFight"		;//����� ������� � ����� ������������, ������?
	Strange						=	"SVM_14_Strange"						;//��� ��� ����: ���� � �����!
	DieMonster					=	"SVM_14_DieMonster"						;//���������� �����!
	DieMortalEnemy				=	"SVM_14_DieMortalEnemy"					;//� ������ ������ ���� �����. �����, ������ �������!
	NowWait						=	"SVM_14_NowWait"						;//���� ������!
	YouStillNotHaveEnough		=	"SVM_14_YouStillNotHaveEnough"			;//���� ���� �� ����� ������������, ��?
	YouAskedForIt				=	"SVM_14_YouAskedForIt"					;//��� ����������!
	NowWaitIntruder				= 	"SVM_14_NowWaitIntruder"				;//���� ���� �� ����������!
	IWillTeachYouRespectForForeignProperty	=	"SVM_14_IWillTeachYouRespectForForeignProperty"	;//��� �� ��� ����!
	DirtyThief					=	"SVM_14_DirtyThief"						;//������, �� ���� ���-��� ���. �� ��������� �� ���!
	YouAttackedMyCharge			=	"SVM_14_YouAttackedMyCharge"			;//� ���� ����� ��������� �����!
	YouKilledOneOfUs			=	"SVM_14_YouKilledOneOfUs"				;//�� ���� ����-��!
	Dead						=	"SVM_14_Dead"							;//
	Aargh_1						=	"SVM_14_Aargh_1"						;//
	Aargh_2						=	"SVM_14_Aargh_2"						;//
	Aargh_3						=	"SVM_14_Aargh_3"						;//
	Berzerk						=	"SVM_14_Berzerk"						;//
	YoullBeSorryForThis			=	"SVM_14_YoullBeSorryForThis"			;//�� ������ �� ���� ������!
	YesYes						=	"SVM_14_YesYes"							;//�����, ������!
	ShitWhatAMonster			=	"SVM_14_ShitWhatAMonster"				;//� �� ���� ������ ����������� � �����!
	Help						=	"SVM_14_Help"							;//� ������ ��������� � ������ �������!
	WeWillMeetAgain				=	"SVM_14_WeWillMeetAgain"				;//�� �� ��� ����������, ���� ������!
	NeverTryThatAgain			=	"SVM_14_NeverTryThatAgain"				;//����� ���� ��� ������ �� ������!
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//� ������ ��� ������!
	ITookYourOre				=	"SVM_14_ITookYourOre"					;//���� - ���� ��������!
	ShitNoOre					=	"SVM_14_ShitNoOre"						;//� ����� �������� ������ ��� ����!
	HandsOff					=	"SVM_14_HandsOff"						;//���� �����!
	GetOutOfHere				=	"SVM_14_GetOutOfHere"					;//��� ������!
	YouViolatedForbiddenTerritory=	"SVM_14_YouViolatedForbiddenTerritory"	;//��� �� ����� ��������?
	YouWannaFoolMe				=	"SVM_14_YouWannaFoolMe"					;//������ ��� ��?
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"			;//���� �� ��� ���������?
	WhyAreYouInHere				=	"SVM_14_WhyYouAreInHere"				;//�������� ��� � ������ ������!
	WhatDidYouInThere			=	"SVM_14_WhatDidYouInThere"				;//���� ����� �� �����! ����?
	WiseMove					=	"SVM_14_WiseMove"						;//��� ��� ���������!
	Alarm						=	"SVM_14_Alarm"							;//������, ����, ����!
	IntruderAlert				= 	"SVM_14_IntruderAlert"					;//�����!
	BehindYou					=	"SVM_14_BehindYou"						;//���������!
	TheresAFight				=	"SVM_14_TheresAFight"					;//�����!
	HeyHeyHey					=	"SVM_14_HeyHeyHey"						;//��.
	CheerFight					=	"SVM_14_CheerFight"						;//��� �������!
	CheerFriend					=	"SVM_14_CheerFriend"					;//�������� �������� �����������!
	Ooh							=	"SVM_14_Ooh"							;//��� ���� ������!
	YeahWellDone				=	"SVM_14_YeahWellDone"					;//��� ������������ ������.
	RunCoward					=	"SVM_14_RunCoward"						;//�� ������� ���������!
	HeDefeatedHim				=	"SVM_14_HeDefeatedHim"					;//��, ��� � ���.
	HeDeservedIt				=	"SVM_14_HeDeservedIt"					;//��� �������� ��� ������� ������!
	HeKilledHim					=	"SVM_14_HeKilledHim"					;//�� ������ ��� �������, ������ � ���� ����� ������� ������������!
	ItWasAGoodFight				=	"SVM_14_ItWasAGoodFight"				;//��� ����� ���� ��������!
	Awake						=	"SVM_14_Awake"							;//� ���? ����?
	FriendlyGreetings			=	"SVM_14_FriendlyGreetings"				;//�����������.
	ALGreetings					=	"SVM_14_ALGreetings"					;//�� ������!
	MageGreetings				=	"SVM_14_MageGreetings"					;//�� ��� �����!
	SectGreetings				=	"SVM_14_SectGreetings"					;//��������!
	ThereHeIs					= 	"SVM_14_ThereHeIs"						;//�� ���.
	NoLearnNoPoints				= 	"SVM_14_NoLearnNoPoints"				;//� �� ���� ���� �������. � ���� ������������ �����.
	NoLearnOverMax				= 	"SVM_14_NoLearnOverMax"					;//�� ��� ������ ��� �����. ���� ����� ��������� ����-������ ���.
	NoLearnYouAlreadyKnow		=	"SVM_14_NoLearnYouAlreadyKnow"			;//�������� ������ ����������� ����������, ������ ��� �� ������� ��������� ��������.
	NoLearnYoureBetter			=	"SVM_14_NoLearnYoureBetter"				;//�� ��� ������ ������.
	HeyYou						=	"SVM_14_HeyYou"							;//��, ��! 
	NotNow						=	"SVM_14_NotNow"							;//�� ������.
	WhatDoYouWant				=	"SVM_14_WhatDoYouWant"					;//��� ���� �� ���� �����?
	ISaidWhatDoYouWant			=	"SVM_14_ISaidWhatDoYouWant"				;//� ���� ���-������ ��� ���� �������?
	MakeWay						=	"SVM_14_MakeWay"						;//�������� ����!
	OutOfMyWay					=	"SVM_14_OutOfMyWay"						;//���� � ������!
	YouDeafOrWhat				=	"SVM_14_YouDeafOrWhat"					;//����� �������������? ��� ������!
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"			;//�� ������ �� ���� �����������?
	LookAway					=	"SVM_14_LookAway"						;//���� �� ����������, ��� �� ����� �������!
	OkayKeepIt					=	"SVM_14_OkayKeepIt"						;//������ �������� ��� ����.
	WhatsThat					=	"SVM_14_WhatsThat"						;//��� ��� ����?
	ThatsMyWeapon				=	"SVM_14_ThatsMyWeapon"					;//� ���� �������� ����� ���� ������!
	GiveItToMe					=	"SVM_14_GiveItToMe"						;//�����, ���� �������!
	YouCanKeeptheCrap			=	"SVM_14_YouCanKeeptheCrap"				;//������! ������ ����! � ����� ���� ���-������ ������!
	TheyKilledMyFriend			=	"SVM_14_TheyKilledMyFriend"				;//���� �� ����� ����� ��� ������� ����. ��� ����� ������� � �����!
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"			;//�� ������� ���� �� ������ ������!
	SuckerGotSome				=	"SVM_14_SuckerGotSome"					;//� ������, � ���� ���� ��������!
	SuckerDefeatedEBr			=	"SVM_14_SuckerDefeatedEBr"				;//�� ����� ������. ���� �� �������� ��� �����!
	SuckerDefeatedGur			=	"SVM_14_SuckerDefeatedGur"				;//�� ����� ����. ������, ���� ��� � ��� �� ������!
	SuckerDefeatedMage			=	"SVM_14_SuckerDefeatedMage"				;//�������� ����...
	SuckerDefeatedNov_Guard		= 	"SVM_14_SuckerDefeatedNov_Guard"		;//�� ������, ��� ������� ��������� ��� ���� �������, � ��� ����� �� ������������� ������� ��?
	SuckerDefeatedVlk_Guard		= 	"SVM_14_SuckerDefeatedVlk_Guard"		;//���� �� �������� ���������, �� ����������� �� ��� �����!
	YouDefeatedMyComrade		=	"SVM_14_YouDefeatedMyComrade"			;//�� ������ ��������� ���� �� ���� ������, �� �� ��� �����������.
	YouDefeatedNOV_Guard		=	"SVM_14_YouDefeatedNOV_Guard"			;//��� ��� ������� �������, � �� ���������!
	YouDefeatedVLK_Guard		=	"SVM_14_YouDefeatedVLK_Guard"			;//���� �� ������ ����� � ���� ����������, � ����� � ����� ���������!
	YouStoleFromMe				=	"SVM_14_YouStoleFromMe"					;//��� �� ������ ��������� �����, ������� �������?
	YouStoleFromUs				=	"SVM_14_YouStoleFromUs"					;//�� ����� �������� ���� ����! ������ �����!
	YouStoleFromEBr				=	"SVM_14_YouStoleFromEBr"				;//�� ������� �������! ����� �� ��� ������? ��� ����� � ������!
	YouStoleFromGur				=	"SVM_14_YouStoleFromGur"				;//�� ������� ����! ��� ��� �����, ��� ��� ��� ��.
	StoleFromMage				=	"SVM_14_StoleFromMage"					;//�� ������� �����! ��� ���� ��������� � ����� �������.
	YouKilledMyFriend			=	"SVM_14_YouKilledMyFriend"				;//���� �� ����� ��� ���� �������. �������, ��� ������ �� ����� �������. � ��������� ��� �� ���� ����� �� �������!
	YouKilledEBr				=	"SVM_14_YouKilledEBr"					;//�� ���� ������! �������, ���� ��� ������ � ���?
	YouKilledGur				=	"SVM_14_YouKilledGur"					;//�� ���� ����! ����� �� ����� ����, ��� �� ���?
	YouKilledMage				=	"SVM_14_YouKilledMage"					;//�� ���� ����! � ���� ���� �����-������ ����������?
	YouKilledOCfolk				=	"SVM_14_YouKilledOCfolk"				;//� ������ ������ ��������� ��������. ����� �����, ��� �� � ���� �������...
	YouKilledNCfolk				=	"SVM_14_YouKilledNCfolk"				;//���� ���� �� ����� ������ ������. �������, ��� ��� ���� �� ��������!
	YouKilledPSIfolk			=	"SVM_14_YouKilledPSIfolk"				;//���� ���� �� �������������� ��������. ���-�� �������, ��� �� �������� � ���� �������.
	GetThingsRight				=	"SVM_14_GetThingsRight"					;//�� �� ������� ���� �� ���������������!
	YouDefeatedMeWell			=	"SVM_14_YouDefeatedMeWell"				;//�� ����� ��� ������� ������, ������. ��� ��� ������� ���, �� ������ �� �������!
	Smalltalk01					=	"SVM_14_Smalltalk01"					;// ...��� �� ��������...
	Smalltalk02					=	"SVM_14_Smalltalk02"					;// ...����� ����...
	Smalltalk03					=	"SVM_14_Smalltalk03"					;// ...�� ����� ������ �������...
	Smalltalk04					=	"SVM_14_Smalltalk04"					;// ...� �� ���� � ���� �����������...
	Smalltalk05					=	"SVM_14_Smalltalk05"					;// ...����� �������� �� ��� ����...
	Smalltalk06					=	"SVM_14_Smalltalk06"					;// ...������, ��������� ��������...
	Smalltalk07					=	"SVM_14_Smalltalk07"					;// ...������ ����� ����, ������ �� ����� ������������...
	Smalltalk08					=	"SVM_14_Smalltalk08"					;// ...����� �� ���� ������ �� ��������...
	Smalltalk09					=	"SVM_14_Smalltalk09"					;// ...���������, � � ���� ���-�� ����...
	Smalltalk10					=	"SVM_14_Smalltalk10"					;// ...����� ������, ������ ��� ���-������ ��������...
	Smalltalk11					=	"SVM_14_Smalltalk11"					;// ...� �� ���� ��������� � ����� ����...
	Smalltalk12					=	"SVM_14_Smalltalk12"					;// ...������ ������ �����, ��� �������...
	Smalltalk13					=	"SVM_14_Smalltalk13"					;// ...�� ����� �� �, ����� �� ���� ��������� ��� ��...
	Smalltalk14					=	"SVM_14_Smalltalk14"					;// ...������ ��� ���� � �� �� �������...
	Smalltalk15					=	"SVM_14_Smalltalk15"					;// ...�������� ����������, � ����� ��� ����...
	Smalltalk16					=	"SVM_14_Smalltalk16"					;// ...������ ��� ���� ������� �����, �� ��, ��� ������...
	Smalltalk17					=	"SVM_14_Smalltalk17"					;// ...� ������ ������ ������� ���� �� ������...
	Smalltalk18					=	"SVM_14_Smalltalk18"					;// ...� ������ �� ������ ������ ��������...
	Smalltalk19					=	"SVM_14_Smalltalk19"					;// ...������ ����-�� - � � ���������� ��������� � ������������, ��� ������ � ������...
	Smalltalk20					=	"SVM_14_Smalltalk20"					;// ...�� �����, ��� ����� ���� ���-������ ���������...
	Smalltalk21					=	"SVM_14_Smalltalk21"					;// ...��������, �� ����...
	Smalltalk22					=	"SVM_14_Smalltalk22"					;// ...�������. ����� �� �� ��� �� ����������...
	Smalltalk23					=	"SVM_14_Smalltalk23"					;// ...� �����, ��� ��� ����� �������� ������...
	Smalltalk24					=	"SVM_14_Smalltalk24"					;// ...��� �� ������� ���������, ��������� � ���-������ ������...
	Om							= 	"SVM_14_Om"							;//
};


//////////////////////////////////////////
INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//��, ��!
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//�������!

	SectGreetings			=	"SVM_15_SectGreetings"				;//���������!
	ALGreetings				=	"SVM_15_ALGreetings"				;//�� ������!
	MageGreetings			=	"SVM_15_MageGreetings"				;//�����������!
	FriendlyGreetings		=	"SVM_15_FriendlyGreetings"			;//������!
	Aargh_1					=	"SVM_15_Aargh_1"					;//
	Aargh_2					=	"SVM_15_Aargh_2"					;//
	Aargh_3					=	"SVM_15_Aargh_3"					;//
	Dead					=	"SVM_15_Dead"						;//
	Awake					=	"SVM_15_Awake"						;//
	DoesntWork				= 	"SVM_15_DoesntWork"					;//�� ��������.
	PickBroke				= 	"SVM_15_PickBroke"					;// ��, ������.
	NeedKey					= 	"SVM_15_NeedKey"					;// ��� ����� ��� ����� ����...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;// �������� ������ ������ ���...
	InvFull					= 	"SVM_15_InvFull"					;// � �� ���� ����� ��� ������.
};

//////////////////////////////////////////
INSTANCE SVM_16	(C_SVM)				// Stimmbeschreibung	:		Babes halt!!!!!
{
	NotNow						=	"SVM_16_NotNow"			;	//�����! ���� ������ �� ���� �������������!
	Help						=	"SVM_16_Help"			;	//
	Aargh_1						=	"SVM_16_Aargh_1"		;	//
	Aargh_2						=	"SVM_16_Aargh_2"		;	//
	Aargh_3						=	"SVM_16_Aargh_3"		;	//
	Dead						=	"SVM_16_Dead"			;	//
};

//////////////////////////////////////////
INSTANCE SVM_17	(C_SVM)							//Ork-Stimme (alle SVMs werden auf wenige guturalen, unverst�ndlichen Laute umgeleitet)
												//Die Dialoge mit dem verbannten Ork-Shamanen im Kastell und dem Ork-Sklaven in der Freien Mine laufen auch
												//�ber Stimme 17, sind aber in halbwegsverst�ndlichem orkisch-deutsch
												//Das hier �berall vergebene SVM_17_OrcSound01 wird noch durch 9 weitere Variationen erg�nzt

// FIXME: mehr Varianten!?
{
	StopMagic					=	"SVM_17_OrcSound01"			;//������ �� ��� ��� ������ �� ���!
	ISaidStopMagic				=	"SVM_17_OrcSound02"			;//��� ������ ��� �������!
	WeaponDown					=	"SVM_17_OrcSound03"			;//������ �� ������!
/*
	ISaidWeaponDown				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	WatchYourAim				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WatchYourAimAngry			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WhatAreYouDoing				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	LetsForgetOurLittleFight	=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	Strange						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	DieMonster					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	DieMortalEnemy				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	NowWait						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	YouStillNotHaveEnough		=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouAskedForIt				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	NowWaitIntruder				= 	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	DirtyThief					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouAttackedMyCharge			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouKilledOneOfUs			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	Dead						=	"SVM_17_Dead"				;//Aaaarglll....
	Aargh_1						=	"SVM_17_Aargh_1"			;//Aargh!
	Aargh_2						=	"SVM_17_Aargh_2"			;//Aargh!
	Aargh_3						=	"SVM_17_Aargh_3"			;//Aargh!
	Berzerk						=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YoullBeSorryForThis			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	ShitWhatAMonster			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	Help						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WeWillMeetAgain				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	NeverTryThatAgain			=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	ITakeYourWeapon				=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	ITookYourOre				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	ShitNoOre					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	HandsOff					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	GetOutOfHere				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouViolatedForbiddenTerritory=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WhatsThisSupposedToBe		=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WhyAreYouInHere				=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	WhatDidYouInThere			=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	WiseMove					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	Alarm						=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	IntruderAlert				= 	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	BehindYou					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	CheerFight					=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	CheerFriend					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	Ooh							=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	HeDefeatedHim				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	HeKilledHim					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	Awake						=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	FriendlyGreetings			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	HeyYou						=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	NotNow						=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WhatDoYouWant				=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	ISaidWhatDoYouWant			=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	MakeWay						=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	OutOfMyWay					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
	YouDeafOrWhat				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	LookingForTroubleAgain		=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	GiveItToMe					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouDisturbedMySlumber		=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouStoleFromMe				=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
	YouStoleFromUs				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	YouKilledMyFriend			=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
*/

};



// ***********************
// 		Maximale SVMs
// ***********************

CONST INT SVM_MODULES =	18;




