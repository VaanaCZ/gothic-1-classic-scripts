// **********************************************
// Standard	Voice Module
// **********************************************

// Diese Klasse	kann beliebig von den Skriptern	erweitert um
// "VAR	STRING xxxx" erweitert werden, diese können	dann in	den
// einzelnen SVM - Instanzen initialisiert werden.


CLASS C_SVM
{
// SC hat Waffe oder Magie gezogen oder zielt auf NSC
	VAR	STRING	StopMagic;					// NSC  sieht wie in seiner Nähe gezaubert wird -> er fordert auf, damit aufzuhören!
	VAR	STRING	ISaidStopMagic;				// NSC hat bereits mit $StopMagic gewarnt und greift nun an	(nachdem er	diesen Satz	gesagt hat;	WICHTIG: dies ist KEINE	letzte Warnung,	sonder sofort Angriff!)

	var string	WeaponDown				;	//ZS_AssessFighter: SC steht mit gezogener Waffe vor NSC -> NSC ist NEUTRAL zu SC	-> (herausfordernd,	bei	Pünten-Stimme etwas	unsicher, trotzdem kernig)
	var string	ISaidWeaponDown			;	//Kommt nachdem der SC $WeaponDown ignoriert hat!

	VAR	STRING	WatchYourAim;				// ein FRIENDLY-SC zielt mit einer Fernkampfwaffe auf den NSC .	'Paß auf! Ziel woanders	hin!' B_Orc_AssessThreat hat das auch noch
	var string	WatchYourAimAngry		;	// SC zielt mit einer Fernkampfwaffe auf den Angry-NSC. (genervte Auffordern, damit	aufzuhören)
	VAR	STRING	WhatAreYouDoing;			// NSC wird von einem FRIENDLY-SC/NSC geschlagen

// SC hat Waffe weggesteckt, NSC beendet Kampf
	VAR	STRING	LetsForgetOurLittleFight;	//Friede, kann direkt kommen ( Wenn freundliche kämpfen und der Spieler die Waffe wegsteckt) oder als Reaction über das news-Gedächtnis, sollte daher Zeitneutral sein (--> nicht wie jetzt lass uns den Streit von letztens vergessen

// NSC hat Gegner aus den Augen verloren
	VAR	STRING	Strange			;			// 1. NSC wird attackiert -> rennt mit gezogener Waffe zum Angreifer ->	kann ihn plötzlich nicht mehr entdecken	-> (muttering to himself)
											// 2. NSC sieht	einen Mord -> rennt	mit	gezogener Waffe	zum	Mörder -> kann ihn plötzlich nicht mehr	entdecken

// NSC greift an!
	var string	DieMonster				;	// NSC greift Monster an -> "Aus dir mach ich Gulasch, Drecksvieh!"
	var string	DieMOrtalEnemy;				// Der Nsc greift an, da er durch die Story permanent Hostile ist, d.h. die Lager sind in Blutfehde

	VAR	STRING	NowWait;					// NSC hat den SC früher noch NICHT besiegt -> SC greift den NSC an -> "Na warte!"
	VAR	STRING	YouStillNotHaveEnough	;	// NSC hat den SC früher besiegt ->	SC greift den NSC an -> "Hast du immer noch nicht genug?!"

	var	string	YouAskedForIt			;	// 1. SC hat eine Aufforderung ignoriert: den Raum zu verlassen, ein Item zurückzugeben, seine Waffe wegzustecken -> "Wer nicht hören will muß fühlen..."
	var string	NowWaitIntruder			;	// SC hat einen bewachten Durchgang durchbrochen...

	var	string	IWillTeachYouRespectForForeignProperty;	// 1. SC benutzt ein Besitz-Mob(Tür,Fallgitter-Drehkreuz,Kiste,...) und	wird ohne Vorwarnung attackiert
											// 2. SC trägt Waffe des NSCs -> NSC ist stärker und holt sie sich mit Gewalt wieder ->	vorher dieser Spruch

	VAR	STRING	DirtyThief;					// 1. NSC ertappt den (schwächeren)	SC mit den Fingern in den eigenen Taschen
											// 2. NSC sieht	wie	der	(schwächere) SC	etwas nimmt, daß ihm gehört	(z.B. Waffe	auf	den	Tisch)
											// 3. NSC sieht	feindlichen, schwächeren SC, der ihn vorher	mal	beklaut	hat	und	sagt ihm diesen	Spruch,	bevor er angreift "Da hab ich Dich also	wieder,	Du dreckiger Dieb"
											// 4. Nsc ist in einen Raum eingedrungen

	var string	YouAttackedMyCharge		;	// SC/NSC greift einen Schützling einer NSC-Wache an -> Wache attackiert den Angreifer danach
	var string	YouKilledOneOfUs;			// NSC erblickt feindlichen SC, der einen Freund des NSCs getötet hat -> Angriff!

// im Kampf
	VAR	STRING	Dead			;			// Tödlich verletzt
	VAR	STRING	Aargh_1			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_2			;			// Treffer kassiert im Kampf	
	VAR	STRING	Aargh_3			;			// Treffer kassiert im Kampf	

	var string	Berzerk			;			// Wahnsinnsschrei im Zustand der Raserei!

// SC hat NSC niedergeschlagen oder bedroht
	VAR	STRING	YoullBeSorryForThis;		// NSC wurde durch SC/aNSC besiegt und wacht aus der Ohnmacht wieder auf: 'Das wird	Dir	noch leidtun!'

	VAR	STRING	YesYes			;			// 1. NSC wurde	im Kampf besiegt ->	erwacht	wieder ist aber	schächer als sein Kontrahent
											// 2. SC zieht Waffe oder nähert sich mit Waffe und NSC ist schwächer als SC
// NSC flieht
	var string	ShitWhatAMonster		;	// NSC flieht vor zu starkem Monster -> "Scheiße, was ein Höllenvieh. Nichts wie weg!"
	VAR	STRING	Help;						// NSC flieht vor Gegner, Babe Nsc flieht vor Spieler, Orcs haben das auch
	var	STRING	WeWillMeetAgain;			// NSC flieht vor Gegner, ist aber eigentlich Stärker als er, ist aber trotzdem besiegt worden

// SC wurde von NSC besiegt und wird geplündert
	VAR	STRING	NeverTryThatAgain	;		// NSC hat Gegner besiegt -> ("Versuch das NIE wieder!!")
	var string	ITakeYourWeapon;			// NSC plündert bewußtlosen SC/aNSC. Während er sich bückt, um nach der vom Besiegten fallengelassenen Waffe zu greifen sagt er diesen Spruch.
	VAR	STRING	ITookYourOre	;			// NSC plündert bewußtlosen SC/aNSC. Nachdem er sich einen Teil des Erzes genommen hat, sagt er diesen Spruch.
	var string	ShitNoOre		;			// NSC ärgert sich darüber, daß er beim Durchsuchen eines bewußtlosen/toten Körpers kein Erz gefunden hat!

// NSC verwarnt SC
	VAR	STRING	HandsOff;					// SC manipuliert ein MOB (Drehkreuz, Truhe, Tür) und ein befreundeter bzw. gildengleicher NSC sieht das...
	VAR	STRING	GetOutOfHere		;		// NSC erwischt	schwächeren	SC in seiner Hütte -> ("Raus hier")	(SC	soll aus Raum gehen)
	var	string	YouViolatedForbiddenTerritory		;	// SC wird beim Betreten eines verbotenen Portalraums erwischt -> Warnung!

	var	STRING	YouWannaFoolMe;				// SC schnappt NSC ein Item vor der Nase weg und wird mit $GiveItToMe aufgefordert es zurückzugeben -> SC gibt ein falsches Item an den NSC -> 'Willst Du mich verarschen'

	VAR	STRING	WhatsThisSupposedToBe	;	// 1. SC schleicht vor den Augen des NSCs -> "Was schleichst Du	hier rum?" (besser als "Was	soll das denn werden", weil	besseres Feedback!)
											// 2. SC bewegt	sich hinter	einer Wache	-> diese dreht sich	um und sagt	dann
	var string	WhyAreYouInHere			;	//im ZS_ClearRoom / SC steht in verbotenem Portalraum	-> schwächerer NSC fragt
	var string	WhatDidYouInThere		;	// Wache sieht Sc aus einer Hütte rauskommen und verwarnt ihn, ohne das ein Angriff folgt

	VAR	STRING	WiseMove;					// 1. NSC wurde	gewarnt, seine Waffe wegzustecken ($RemoveYourWeapon) -> SC	befolgt	dies und steckt	die	Waffe weg
											// 2. SC steht in verbotenem Raum und wird mit $GetOutOfHere aufgefordert, rauszugehen -> SC befolgt die Aufforderung
											// 3. SC hat NSC ein Item vor der Nase weggeschnappt und wurde mit $GiveItToMe aufgefordert	es zurückzugeben ->	SC gehorcht

// NSC alarmiert/warnt andere NSCs vor SC
	VAR	STRING	Alarm;						// Wache alarmiert die Sichtung	eines permanent	HOSTILE	SC/aNSC	"Alaaaaaaarm!!!!!"
											// Nicht Wache sieht wie ein Portalraum betreten wird, der einer Gilde zugeordnet ist und ruft die Wachen
											// Gemüse (NpcWorker) ruft Wachen nach einem Diebstahl/beobachteten Diebstahl etc.
	var string	IntruderAlert;				// SC hat einen bewachten Durchgang durchbrochen und die Wache alarmiert alle umstehenden
	VAR	STRING	BehindYou;					// NSC sieht, wie ein anderer NSC vom SC bestohlen wird	und	warnt das Opfer

// NSC beobachtet Kampf
	var	string	TheresAFight	;			// NSC entdeckt	einen Kampf	und	will zuschauen (ZS_WatchFight) -> vorher ein Spruch	wie	"Hey da	drüben gibt's einen	Kampf"
	VAR	STRING	HeyHeyHey;					// Hintergrund anfeuern	beim Beobachten	eines Kampfes: 'Hau	ihm	aufs Maul!'	(kommt alle	paar Sekunden!)
	VAR	STRING	CheerFight;					// NSC ist im Zustand WatchFight: Neutraler	Kämpfer	schlägt irgendeinen Typen. '5 Erz auf den Dicken'
	VAR	STRING	CheerFriend;				// NSC ist im Zustand WatchFight: Freund landet	einen Treffer. 'Immer in die Fresse!'
	VAR	STRING	Ooh;						// NSC ist im Zustand WatchFight: Freund kriegt	aufs Maul. 'Mist - das tat weh.'
	var	STRING	YeahWellDone;				// NSC sieht, wie SC/aNSC, zu dem er ANGRY/HOSTILE ist getötet wird. 'Gut gemacht, das hat sie Sau verdient.'

// NSC-Gegner flieht
	VAR	STRING	RunCoward;					// 1. Der NSC befindet sich	im Zustand WatchFight -> einer der Kämpfer haut	ab
											// 2. Der Gegner des NSCs flieht
	var	string	HeDefeatedHim	;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC besiegt 	(WICHTIG: dies ist der normale Ausgang!)
	var	string	HeDeservedIt	;			// NSC sieht wie ein SC/aNSC, zu dem er	ANGRY/HOSTILE steht, besiegt wird -> ("DAS hat er verdient!")
	var	string	HeKilledHim		;			// NSC sieht wie ein SC/aNSC einen anderen aNSC/SC tötet	(WICHTIG: dies ist ein Skandal, niemand wird normalerweise	in einer "Schlägerei" getötet)
	var	string	ItWasAGoodFight	;			// NSC sieht wie ein FRIENDLY/NEUTRAL-SC/aNSC einen	anderen	besiegt

	VAR	STRING	Awake			;			// NSC wacht aus dem Zustand Sleep wieder auf (Aufwachen, räkeln)

// Grüße
	VAR	STRING	FriendlyGreetings;			// 1. Am Anfang	eines Dialoges, wenn NSC FRIENDLY/NEUTRAL zum SC,  2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	ALGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC aus Altem Lager und FRIENDLY/NEUTRAL ('Für Gomez'), 2. Wenn sie sich unterwegs begegnen.
	var	STRING	MageGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC und SC beide Magier und FRIENDLY/NEUTRAL, 2. Wenn sie sich unterwegs begegnen.
	VAR	STRING	SectGreetings;				// 1. Am Anfang	eines Dialoges, wenn NSC aus Psi-Camp und FRIENDLY/NEUTRAL	zum	SC ('Erwache. Der Schläfer erwache.') 2. Wenn sie sich unterwegs begegnen.

	var string	ThereHeIs;					// NSC zeigt SC wo ein anderer NSC steht nach dem der SC gefragt hat: "Da drüben ist er"

// Lehrer-Kommentare
	var string	NoLearnNoPoints			;	// NSC-Lehrer verbietet Steigerung - keine Lernpunkte!
	var string	NoLearnOverMax			;	// NSC-Lehrer verbietet Attribut-Steigerung über 100
	var string	NoLearnYouAlreadyKnow	;	// Du mußt erst Fortgeschritten sein, bevor du ein Meister werden kannst!
	var string	NoLearnYoureBetter		;	// Du bist jetzt schon besser!

// NSC spricht SC an
	VAR	STRING	HeyYou;						// z.B. Wache, die den SC im Räumen erwischt, wo er nicht hin darf sagt HeyYou, und geht dann zum SC

// NSC will nicht reden
	VAR	STRING	NotNow;						// NSC / Babe wird vom SC angesprochen,	lehnt aber ein Gespräch	ab.

// SC zu nah
	VAR	STRING	WhatDoYouWant;				// SC rückt NSC zu dicht auf die Pelle -> "Kann ich was für Dich tun?"
	VAR	STRING	ISaidWhatDoYouWant;			// NSC hat $WhatDoYouWant gesagt, aber der SC hat nicht reagiert -> "Was willst Du?"
// SC im Weg
	VAR	STRING	MakeWay;					// SC steht	schwächerem NSC im Weg	-> Aufforderung, Platz zu	machen
	VAR	STRING	OutOfMyWay;					// SC steht stärkerem NSC (Magier, Erzbaron) im Weg -> aggressive Aufforderung, Platz zu machen
	VAR	STRING	YouDeafOrWhat;				// SC folgt	nicht der Aufforderung des stärkeren NSCs	-> letzte Warnung, danach Angriff

// SC spricht NSC an, der ihn besiegt hat
	VAR	STRING	LookingForTroubleAgain;		//Erster Satz eines Dialoges, nachdem der NSC und der SC gekämpft haben (entweder wurde der SC besiegt oder es gab keinen klaren Ausgang des Kampfes)

// NSC ist schwächer...
	var string	LookAway;					// Eingeschüchterter NSC guckt weg bei bedrohlichen Situationen
	VAR	STRING	OkayKeepIt;					// SC trägt	Waffe des schächeren NSCs -> NSCs verlangt die Waffe zurück	($GiveItToMe) -> SC	bedroht	NSC	-> ("Okay, okay, du	kannst das Ding	behalten..." zurückweichen)
	VAR	STRING	WhatsThat;					// Verwandelter SC wird vor den Augen des NSCs wieder zum Menschen (Erschreckter Ausruf) Nsc wird aus dem MagicSleep wieder wach und wundert sich...

	VAR	STRING	ThatsMyWeapon;				// SC trägt	eine Waffe,	die	dem	NSC	gehört -> Folge: ZS_GetBackBelongings
	VAR	STRING	GiveItToMe;					// 1. SC trägt Waffe des NSCs -> NSC ist schwächer (also kein Kampf) ->	"Gib sie mir wieder"
	VAR	STRING	YouCanKeeptheCrap;			// 1. SC trägt Waffe des schwächeren NSCs ->	NSCs verlangt die Waffe	zurück ($GiveItToMe) ->	SC geht	einfach	weg	-> ("Behalt	das	Scheiß-Ding	doch!)
											// 2. NSC will ein Item	aufheben und wird von einem	stärkeren NSC gewarnt, der das auch	tun	will ->	unser NSC weicht zurück

	VAR	STRING	TheyKilledMyFriend;			// NSC Täter - NSC zu Opfer freundlich, zu Täter freundlich oder neutral

	var	string	YouDisturbedMySlumber;		// NSC wurde vom SC	mittelsanft	aus	dem	Schlaf gerissen	(z.B. durch	Ansprechen)

// Angry NSCs kommentieren SC-Aktionen
	VAR	STRING	SuckerGotSome;				// Angry NSC hat gehört, daß der SC umgehauen wurde. "Das Dich jemand umgehauen hat, geschieht Dir Recht!"

	VAR	STRING	SuckerDefeatedEBr;			// Du hast einen	EBR	besiegt. Er war wirklich beeindruckt!
	VAR	STRING	SuckerDefeatedGur;			// Du hast einen	GUR	niedergeschlagen,	Du bist	ein	toter Mann
	VAR	STRING	SuckerDefeatedMage;			// (News) - im Stil von SuckerDefeatedXY

	var string	SuckerDefeatedNOV_Guard;	// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist ANGRY zu Spieler
	var string	SuckerDefeatedVLK_Guard;	// Der Spieler hat einen Schützling der Wache niedergeschlagen
	var string	YouDefeatedMyComrade;		// Wache stellt fest, das sie gesehen/gehört hat, daß ich eine andere Wache umgehauen habe
	var string	YouDefeatedNOV_Guard;		// Der Spieler hat einen Novizen umgehauen, Templer spricht den Spieler an, Templer ist NEUTRAL/FRIENDLY zu Spieler
	var string	YouDefeatedVLK_Guard;		// Der Spieler hat einen Buddler umgehauen, Wache spricht den Spieler an, Wache ist NEUTRAL/FRIENDLY zu Spieler
	VAR	STRING	YouStoleFromMe;				// Du Sau hast mich beklaut

//Wichtige Person (Lehrer, Auftraggeber?), hat davon gehört, daß Du Mist gebaut hat...
// FIXME: damit das so benutzt werden kann müssen noch Anpassungen in der B_ReactToMemory.d gemacht werden
	VAR	STRING	YouStoleFromUs;				// eigene oder befreundete Gilde beklaut.
	VAR	STRING	YouStoleFromEBr;			// Erzbarone beklaut.
	VAR	STRING	YouStoleFromGur;			// Gurus beklaut.
	VAR	STRING	StoleFromMage;				// Magier beklaut.

	VAR	STRING	YouKilledMyFriend;			// jemand aus eigener oder befreundeter Gilde getötet
	var	STRING	YouKilledEBr;				// Erzbaron getötet
	VAR	STRING	YouKilledGur;				// Guru getötet
	VAR	STRING	YouKilledMage;				// Guru getötet

	VAR	STRING	YouKilledOCfolk;			// Gardist, Schatten oder Buddler getötet.
	VAR	STRING	YouKilledNCfolk;			// Söldner, Organisator, Schürfer oder Bauer getötet
	VAR	STRING	YouKilledPSIfolk;			// Templer oder Novize getötet

	VAR	STRING	GetThingsRight;				//SC hat Mist gebaut. NSC sagt, "Das wieder hinzubiegen wird nicht einfach!"

	VAR	STRING	YouDefeatedMeWell;			//Zu SC	freundlich/neutral:	Du hast	mich ganz schön	geplättet

// Ambient-Unterhaltungen zwischen zwei NSCs (gemurmelte Wortfetzen, die zufällig zu "Dialogen" zusammengewürfelt werden...
	VAR	STRING	Smalltalk01;				// ...wenn Du meinst...
	VAR	STRING	Smalltalk02;				// ...kann schon sein...
	VAR	STRING	Smalltalk03;				// ...war nicht besonders schlau....
	VAR	STRING	Smalltalk04;				// ...ich halt mich da lieber raus...
	VAR	STRING	Smalltalk05;				// ...das ist wirklich nicht mein Problem...
	VAR	STRING	Smalltalk06;				// ...war doch klar, daß das Ärger gibt...
	VAR	STRING	Smalltalk07;				// ...aber behalt's für Dich, muß nicht gleich jeder wissen...
	VAR	STRING	Smalltalk08;				// ...das passiert mir nicht nochmal...
	VAR	STRING	Smalltalk09;				// ...an der Gechichte muß wohl doch was dran sein...
	VAR	STRING	Smalltalk10;				// ...man muß eben aufpassen was man rumerzählt...
	VAR	STRING	Smalltalk11;				// ...solange ich damit nichts zu tun habe...
	VAR	STRING	Smalltalk12;				// ...man darf auch nicht alles glauben, was man hört...
	VAR	STRING	Smalltalk13;				// ...in seiner Haut will ich trotzdem nicht stecken...
	VAR	STRING	Smalltalk14;				// ...immer wieder die selbe Leier...
	VAR	STRING	Smalltalk15;				// ...manche lernen eben garnichts dazu...
	VAR	STRING	Smalltalk16;				// ...früher wäre das ganz anders gelaufen...
	VAR	STRING	Smalltalk17;				// ...gequatscht wird viel...
	VAR	STRING	Smalltalk18;				// ...ich hör nicht mehr auf das Gefasel...
	VAR	STRING	Smalltalk19;				// ...verlaß Dich auf jemanden und Du bist verlassen, das ist eben so...
	VAR	STRING	Smalltalk20;				// ...ich glaube kaum, daß sich daran was ändern wird...
	VAR	STRING	Smalltalk21;				// ...wahrscheinlich hast Du recht...
	VAR	STRING	Smalltalk22;				// ...erstmal abwarten. Es wird nichts so heiß gegessen, wie es gekocht wird...
	VAR	STRING	Smalltalk23;				// ...ich dachte, das wäre schon lange geklärt, aber das ist wohl nicht so...
	VAR	STRING	Smalltalk24;				// ...laß uns lieber über was anderes reden...
	VAR	STRING	Om;							// Ommm (Meditation)

// SC Dialog
	var string	SC_HeyTurnAround;			//SC: Hey du! (Nsc ansprechen, steht mit Rücken zu dir)                                   
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
// 		Die SVM-Instanzen		(ToDo: News noch überarbeiten wie in Prototypen)
// ********************************

// Die einzelnen Instanzen der SVMs
// Diese müssen	immer "SVM_x" heissen, wobei x die VoiceNummer ist.

instance SVM_1 (C_SVM)	//Malocher (Volk, Schürfer)	Nörgler, Alkoholiker, schimpft über	alles - zieht Kraft aus seinem Hass

{
	StopMagic					=	"SVM_1_StopMagic"					;//Basta con gli incantesimi!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Vuoi che ti colpisca? Smettila subito!!!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Abbassa quell'arma!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Allontana quella maledetta arma. Ora!!!
	WatchYourAim				=	"SVM_1_WatchYourAim"				;//Smettila!
	WatchYourAimAngry			=	"SVM_1_WatchYourAimAngry"			;//Continua a puntarmi contro quell'arma e vedrai...
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Attento! Provaci di nuovo e ti cancellerò quel sorriso dal grugno!
	LetsForgetOurLittleFight	=	"SVM_1_LetsForgetOurLittleFight"	;//Lasciamo stare questa storia, d'accordo?
	Strange						=	"SVM_1_Strange"						;//Vattene, bastardo!
	DieMonster					=	"SVM_1_DieMonster"					;//Brutto figlio di puttana!
	DieMortalEnemy				=	"SVM_1_DieMortalEnemy"				;//Sei spacciato!
	NowWait						=	"SVM_1_NowWait"						;//Ora ti spacco il muso...
	YouStillNotHaveEnough		=	"SVM_1_YouStillNotHaveEnough"		;//Ancora non ne hai abbastanza?
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//L'hai voluto tu!
	NowWaitIntruder				= 	"SVM_1_NowWaitIntruder"				;//Quando avrò finito, dovranno raccogliere i tuoi pezzi!
	IWillTeachYouRespectForForeignProperty	=	"SVM_1_IWillTeachYouRespectForForeignProperty"	;//Ti avevo avvisato di lasciar stare la mia roba!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Sei finito, sporco ladro!
	YouAttackedMyCharge			=	"SVM_1_YouAttackedMyCharge"			;//Nessuno attacca i miei amici!
	YouKilledOneOfUs			=	"SVM_1_YouKilledOneOfUs"			;//Hai colpito uno dei nostri. Ora io colpirò TE!
	Dead						=	"SVM_1_Dead"						;//Aaaaaargl!
	Aargh_1						=	"SVM_1_Aargh_1"						;//Aargh!
	Aargh_2						=	"SVM_1_Aargh_2"						;//Aargh!
	Aargh_3						=	"SVM_1_Aargh_3"						;//Aargh!
	Berzerk						=	"SVM_1_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_1_YoullBeSorryForThis"			;//Te ne pentirai!
	YesYes						=	"SVM_1_YesYes"						;//Calmati! Hai vinto!
	ShitWhatAMonster			=	"SVM_1_ShitWhatAMonster"			;//Merda! Scappa più veloce che puoi!
	Help						=	"SVM_1_Help"						;//Maledizione!
	WeWillMeetAgain				=	"SVM_1_WeWillMeetAgain"				;//Ci rivedremo ancora!
	NeverTryThatAgain			=	"SVM_1_NeverTryThatAgain"			;//Provaci di nuovo e te ne pentirai!
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Bell’arma! Dalla a me!
	ITookYourOre				=	"SVM_1_ITookYourOre"				;//Grazie per il metallo, eroe!
	ShitNoOre					=	"SVM_1_ShitNoOre"					;//Povero idiota... Non hai neppure del metallo!
	HandsOff					=	"SVM_1_HandsOff"					;//Giù le mani!
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Taglia la corda!
	YouViolatedForbiddenTerritory=	"SVM_1_YouViolatedForbiddenTerritory";//Ehi! Come sei entrato?
	YouWannaFoolMe				=	"SVM_1_YouWannaFoolMe"				;//Mi prendi per stupido?
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Ehi, tu! Perché giri da queste parti?
	WhyAreYouInHere				=	"SVM_1_WhyYouAreInHere"				;//Esci subito o chiamo le guardie!
	WhatDidYouInThere			=	"SVM_1_WhatDidYouInThere"			;//Non hai niente da fare, qui. Sparisci!
	WiseMove					=	"SVM_1_WiseMove"					;//Bravo ragazzo!
	Alarm						=	"SVM_1_Alarm"						;//Guardie!
	IntruderAlert				= 	"SVM_1_IntruderAlert"				;//ALLARME!!! UN INTRUSO!!!
	BehindYou					=	"SVM_1_BehindYou"					;//Dietro di te!
	TheresAFight				=	"SVM_1_TheresAFight"				;//Ah! Un combattimento!
	HeyHeyHey					=	"SVM_1_HeyHeyHey"					;//Più forte!
	CheerFight					=	"SVM_1_CheerFight"					;//Combattete come delle donnicciole!
	CheerFriend					=	"SVM_1_CheerFriend"					;//Finiscilo!
	Ooh							=	"SVM_1_Ooh"							;//Al contrattacco!
	YeahWellDone				=	"SVM_1_YeahWellDone"				;//Suonagliele!
	RunCoward					=	"SVM_1_RunCoward"					;//Torna indietro, mammoletta!
	HeDefeatedHim				=	"SVM_1_HeDefeatedHim"				;//Ne ha avuto abbastanza!
	HeDeservedIt				=	"SVM_1_HeDeservedIt"				;//Gli sta bene!
	HeKilledHim					=	"SVM_1_HeKilledHim"					;//Perché l'hai ucciso? Sei un animale!
	ItWasAGoodFight				=	"SVM_1_ItWasAGoodFight"				;//Bel combattimento!
	Awake						=	"SVM_1_Awake"						;//Yawn!
	FriendlyGreetings			=	"SVM_1_FriendlyGreetings"			;//Salve!
	ALGreetings					=	"SVM_1_ALGreetings"					;//Per Gomez!
	MageGreetings				=	"SVM_1_MageGreetings"				;//Per la magia!
	SectGreetings				=	"SVM_1_SectGreetings"				;//Sveglia!
	ThereHeIs					= 	"SVM_1_ThereHeIs"					;//Eccolo lassù!
	NoLearnNoPoints				= 	"SVM_1_NoLearnNoPoints"				;//Torna quando avrai più esperienza.
	NoLearnOverMax				= 	"SVM_1_NoLearnOverMax"				;//Non puoi migliorare ulteriormente, in questo campo. Dovresti imparare qualcos'altro.
	NoLearnYouAlreadyKnow		=	"SVM_1_NoLearnYouAlreadyKnow"		;//Devi migliorare ancora, prima di diventare un maestro!
	NoLearnYoureBetter			=	"SVM_1_NoLearnYoureBetter"			;//Sei già abbastanza esperto!
	HeyYou						=	"SVM_1_HeyYou"						;//Ehi, tu!
	NotNow						=	"SVM_1_NotNow"						;//Non adesso!
	WhatDoYouWant				=	"SVM_1_WhatDoYouWant"				;//Cosa vuoi?
	ISaidWhatDoYouWant			=	"SVM_1_ISaidWhatDoYouWant"			;//Cosa posso fare per te?
	MakeWay						=	"SVM_1_MakeWay"						;//Fammi passare!
	OutOfMyWay					=	"SVM_1_OutOfMyWay"					;//Scansati, amico!
	YouDeafOrWhat				=	"SVM_1_YouDeafOrWhat"				;//Sei sordo? MUOVITI!
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//Ancora in cerca di guai?
	LookAway					=	"SVM_1_LookAway"					;//Uhhhh! Non ho visto nulla!
	OkayKeepIt					=	"SVM_1_OkayKeepIt"					;//Va bene, va bene! Smettila!
	WhatsThat					=	"SVM_1_WhatsThat"					;//Cosa è stato?
	ThatsMyWeapon				=	"SVM_1_ThatsMyWeapon"				;//Quella è la MIA arma!
	GiveItToMe					=	"SVM_1_GiveItToMe"					;//Dammela!
	YouCanKeeptheCrap			=	"SVM_1_YouCanKeeptheCrap"			;//Tienitela! Non ne ho bisogno!
	TheyKilledMyFriend			=	"SVM_1_TheyKilledMyFriend"			;//Hanno catturato uno dei nostri. Se prendo quel porco...
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//Maledizione! Perché mi hai svegliato?
	SuckerGotSome				=	"SVM_1_SuckerGotSome"				;//Sei stato sconfitto? Ben ti sta!
	SuckerDefeatedEBr			=	"SVM_1_SuckerDefeatedEBr"			;//Hai colpito un barone delle miniere! Ora è davvero infuriato con te!
	SuckerDefeatedGur			=	"SVM_1_SuckerDefeatedGur"			;//Hai colpito un guru. Attiri i guai come una calamita!
	SuckerDefeatedMage			=	"SVM_1_SuckerDefeatedMage"			;//Sfidare un mago è un'idea pessima!
	SuckerDefeatedNov_Guard		= 	"SVM_1_SuckerDefeatedNov_Guard"		;//Non puoi andare in giro a colpire i novizi!
	SuckerDefeatedVlk_Guard		= 	"SVM_1_SuckerDefeatedVlk_Guard"		;//Lascia in pace i miei uomini!
	YouDefeatedMyComrade		=	"SVM_1_YouDefeatedMyComrade"		;//Hai battuto il mio amico...
	YouDefeatedNOV_Guard		=	"SVM_1_YouDefeatedNOV_Guard"		;//Il tuo comportamento non sarà tollerato!
	YouDefeatedVLK_Guard		=	"SVM_1_YouDefeatedVLK_Guard"		;//Se colpirai qualcuno sotto la mia protezione, ne subirai gli effetti!
	YouStoleFromMe				=	"SVM_1_YouStoleFromMe"				;//Maledetto bastardo, mi hai derubato! Non riprovarci!
	YouStoleFromUs				=	"SVM_1_YouStoleFromUs"				;//Rivogliamo le nostre cose! Daccele!
	YouStoleFromEBr				=	"SVM_1_YouStoleFromEBr"				;//Hai derubato i baroni delle miniere! Cosa diavolo ti è saltato in mente?
	YouStoleFromGur				=	"SVM_1_YouStoleFromGur"				;//Hai derubato i guru? Purtroppo per te sei stato scoperto.
	StoleFromMage				=	"SVM_1_StoleFromMage"				;//Hai derubato i maghi! Che idea stupida!
	YouKilledMyFriend			=	"SVM_1_YouKilledMyFriend"			;//Uno dei nostri è morto e tu c'entri qualcosa! Commetti un errore qualsiasi e te ne pentirai!
	YouKilledEBr				=	"SVM_1_YouKilledEBr"				;//Hai ucciso un barone delle miniere! Sei diventato pazzo?
	YouKilledGur				=	"SVM_1_YouKilledGur"				;//Hai ucciso un guru! Non posso crederci!
	YouKilledMage				=	"SVM_1_YouKilledMage"				;//Hai ucciso un mago! Come pensi di giustificarti?
	YouKilledOCfolk				=	"SVM_1_YouKilledOCfolk"				;//Un membro di Campo Vecchio è morto e sei nell'elenco dei sospettati...
	YouKilledNCfolk				=	"SVM_1_YouKilledNCfolk"				;//C'è stata una terribile tragedia a Campo Nuovo e sembra che tu ne sia coinvolto!
	YouKilledPSIfolk			=	"SVM_1_YouKilledPSIfolk"			;//La Fratellanza conta un credente in meno e hai la sua morte sulla coscienza!
	GetThingsRight				=	"SVM_1_GetThingsRight"				;//Non sarà facile mettere a posto le cose!
	YouDefeatedMeWell			=	"SVM_1_YouDefeatedMeWell"			;//Bel combattimento! Mi hai dato una lezione, amico!
	Smalltalk01					=	"SVM_1_Smalltalk01"					;// ...l'ultimo stronzo...
	Smalltalk02					=	"SVM_1_Smalltalk02"					;// ...forse, ma chi se ne frega?...
	Smalltalk03					=	"SVM_1_Smalltalk03"					;// ...un vero idiota...
	Smalltalk04					=	"SVM_1_Smalltalk04"					;// ...meglio che ne resti fuori...
	Smalltalk05					=	"SVM_1_Smalltalk05"					;// ...non mi riguarda affatto...
	Smalltalk06					=	"SVM_1_Smalltalk06"					;// ...era ovvio che ci sarebbero stati dei guai...
	Smalltalk07					=	"SVM_1_Smalltalk07"					;// ...perché continua ad accadere?...
	Smalltalk08					=	"SVM_1_Smalltalk08"					;// ...non accadrà di nuovo...
	Smalltalk09					=	"SVM_1_Smalltalk09"					;// ...doveva esserci del vero in quella storia, dopo tutto...
	Smalltalk10					=	"SVM_1_Smalltalk10"					;// ...sì, sì, piantala di blaterare...
	Smalltalk11					=	"SVM_1_Smalltalk11"					;// ...dato che non mi riguarda...
	Smalltalk12					=	"SVM_1_Smalltalk12"					;// ...non dovresti credere a tutto ciò che senti...
	Smalltalk13					=	"SVM_1_Smalltalk13"					;// ...non vorrei essere nei suoi panni...
	Smalltalk14					=	"SVM_1_Smalltalk14"					;// ...sempre la stessa storia...
	Smalltalk15					=	"SVM_1_Smalltalk15"					;// ...certe persone non imparano mai...
	Smalltalk16					=	"SVM_1_Smalltalk16"					;// ...un tempo, le cose sarebbero andate diversamente...
	Smalltalk17					=	"SVM_1_Smalltalk17"					;// ...la gente parla troppo...
	Smalltalk18					=	"SVM_1_Smalltalk18"					;// ...non ascolto più le chiacchiere...
	Smalltalk19					=	"SVM_1_Smalltalk19"					;// ...fidati di qualcuno e ti ritroverai nei guai: ecco come vanno le cose...
	Smalltalk20					=	"SVM_1_Smalltalk20"					;// ...credo che non cambierà mai...
	Smalltalk21					=	"SVM_1_Smalltalk21"					;// ...probabilmente hai ragione...
	Smalltalk22					=	"SVM_1_Smalltalk22"					;// ...aspetta. Meglio non affrettarsi mai...
	Smalltalk23					=	"SVM_1_Smalltalk23"					;// ...pensavo che questa faccenda fosse stata sistemata molto tempo fa...
	Smalltalk24					=	"SVM_1_Smalltalk24"					;// ...parliamo di qualcos'altro...
	Om							= 	"SVM_1_Om"							;//Ommm!
};


//SVM_2	// Misstrauisch (Volk, Bauern, Novizen, MILTEN) Misstrauisch. Defensiv. Angst in was reingezogen zu werden. Klug. Nov: Glauben durch Einschüchterung

instance SVM_2 (C_SVM)				// Misstrauisch
{
	StopMagic					=	"SVM_2_StopMagic"					;//Niente incantesimi!
	ISaidStopMagic				=	"SVM_2_ISaidStopMagic"				;//Ehi! Ho detto niente incantesimi!
	WeaponDown					=	"SVM_2_WeaponDown"					;//Andiamo, metti via quell’affare!
	ISaidWeaponDown				=	"SVM_2_ISaidWeaponDown"				;//Abbassa quell’arma!
	WatchYourAim				=	"SVM_2_WatchYourAim"				;//Puntala da qualche altra parte!
	WatchYourAimAngry			=	"SVM_2_WatchYourAimAngry"			;//Se continui a puntarmi addosso quell’arma, mi arrabbio sul serio!
	WhatAreYouDoing				=	"SVM_2_WhatAreYouDoing"				;//Ehi! Cosa vuoi fare?
	LetsForgetOurLittleFight	=	"SVM_2_LetsForgetOurLittleFight"	;//Mettiamoci una pietra sopra, va bene?
	Strange						=	"SVM_2_Strange"						;//Strano! Dove è finito?
	DieMonster					=	"SVM_2_DieMonster"					;//Un altro!
	DieMortalEnemy				=	"SVM_2_DieMortalEnemy"				;//Temo di doverti eliminare!
	NowWait						=	"SVM_2_NowWait"						;//Tutta colpa tua!
	YouStillNotHaveEnough		=	"SVM_2_YouStillNotHaveEnough"		;//Non ne hai ancora abbastanza?
	YouAskedForIt				=	"SVM_2_YouAskedForIt"				;//Se questo è ciò che desideri!...
	NowWaitIntruder				= 	"SVM_2_NowWaitIntruder"				;//Sai benissimo che qui non hai nulla da fare!
	IWillTeachYouRespectForForeignProperty	=	"SVM_2_IWillTeachYouRespectForForeignProperty"	;//Perché t'impicci di affari che non ti riguardano?
	DirtyThief					=	"SVM_2_DirtyThief"					;//Mi hai derubato! Non lo dimenticherò!
	YouAttackedMyCharge			=	"SVM_2_YouAttackedMyCharge"			;//Nessuno attacca i miei uomini!
	YouKilledOneOfUs			=	"SVM_2_YouKilledOneOfUs"			;//Hai ucciso uno dei nostri! La pagherai!
	Dead						=	"SVM_2_Dead"						;//Aaargh!
	Aargh_1						=	"SVM_2_Aargh_1"						;//Aargh!
	Aargh_2						=	"SVM_2_Aargh_2"						;//Aargh!
	Aargh_3						=	"SVM_2_Aargh_3"						;//Aargh!
	Berzerk						=	"SVM_2_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_2_YoullBeSorryForThis"			;//Te ne pentirai!
	YesYes						=	"SVM_2_YesYes"						;//Calma, calma: hai vinto!
	ShitWhatAMonster			=	"SVM_2_ShitWhatAMonster"			;//Io - ehm - ho bisogno d'aiuto!
	Help						=	"SVM_2_Help"						;//Non ho tempo: ho molto da fare!
	WeWillMeetAgain				=	"SVM_2_WeWillMeetAgain"				;//Ci rivedremo!
	NeverTryThatAgain			=	"SVM_2_NeverTryThatAgain"			;//Non riprovarci!
	ITakeYourWeapon				=	"SVM_2_ITakeYourWeapon"				;//Mi prendo quest'arma!
	ITookYourOre				=	"SVM_2_ITookYourOre"				;//Non hai bisogno di tutto questo metallo!
	ShitNoOre					=	"SVM_2_ShitNoOre"					;//Non hai metallo? Oggi non è proprio il tuo giorno fortunato!
	HandsOff					=	"SVM_2_HandsOff"					;//Giù le mani!
	GetOutOfHere				=	"SVM_2_GetOutOfHere"				;//Fuori dai piedi!
	YouViolatedForbiddenTerritory=	"SVM_2_YouViolatedForbiddenTerritory";//Ehi! Come sei entrato?
	YouWannaFoolMe				=	"SVM_2_YouWannaFoolMe"				;//Non ti consiglio di prendermi in giro!
	WhatsThisSupposedToBe		=	"SVM_2_WhatsThisSupposedToBe"		;//Cosa stai cercando?
	WhyAreYouInHere				=	"SVM_2_WhyYouAreInHere"				;//Vattene o chiamo le guardie!
	WhatDidYouInThere			=	"SVM_2_WhatDidYouInThere"			;//Fuori dai piedi!
	WiseMove					=	"SVM_2_WiseMove"					;//Ottima scelta!
	Alarm						=	"SVM_2_Alarm"						;//Guardie!
	IntruderAlert				= 	"SVM_2_IntruderAlert"				;//Allarme!
	BehindYou					=	"SVM_2_BehindYou"					;//Dietro di te!
	TheresAFight				=	"SVM_2_TheresAFight"				;//Ah, un combattimento!
	HeyHeyHey					=	"SVM_2_HeyHeyHey"					;//Tutto qui?
	CheerFight					=	"SVM_2_CheerFight"					;//Sveglia, morto di sonno!
	CheerFriend					=	"SVM_2_CheerFriend"					;//Bel colpo!
	Ooh							=	"SVM_2_Ooh"							;//Che male!
	YeahWellDone				=	"SVM_2_YeahWellDone"				;//Si muove ancora.
	RunCoward					=	"SVM_2_RunCoward"					;//Torna qui, vigliacco!
	HeDefeatedHim				=	"SVM_2_HeDefeatedHim"				;//Ne ha avuto abbastanza!
	HeDeservedIt				=	"SVM_2_HeDeservedIt"				;//Se l'è meritato!
	HeKilledHim					=	"SVM_2_HeKilledHim"					;//L'hai ucciso! Era proprio necessario?
	ItWasAGoodFight				=	"SVM_2_ItWasAGoodFight"				;//Un bel combattimento, ma un po' breve!
	Awake						=	"SVM_2_Awake"						;//Yawn!
	FriendlyGreetings			=	"SVM_2_FriendlyGreetings"			;//Salve!
	ALGreetings					=	"SVM_2_ALGreetings"					;//Per Gomez!
	MageGreetings				=	"SVM_2_MageGreetings"				;//Per la magia!
	SectGreetings				=	"SVM_2_SectGreetings"				;//Sveglia!
	ThereHeIs					= 	"SVM_2_ThereHeIs"					;//Lassù!
	NoLearnNoPoints				= 	"SVM_2_NoLearnNoPoints"				;//Non posso insegnarti nulla: non hai abbastanza esperienza.
	NoLearnOverMax				= 	"SVM_2_NoLearnOverMax"				;//Non puoi migliorare ulteriormente, in questo campo. Dovresti imparare qualcos'altro.
	NoLearnYouAlreadyKnow		=	"SVM_2_NoLearnYouAlreadyKnow"		;//Devi migliorare ancora, prima di diventare un maestro!
	NoLearnYoureBetter			=	"SVM_2_NoLearnYoureBetter"			;//Sei già abbastanza esperto!
	HeyYou						=	"SVM_2_HeyYou"						;//Ehi, tu!
	NotNow						=	"SVM_2_NotNow"						;//Non adesso!
	WhatDoYouWant				=	"SVM_2_WhatDoYouWant"				;//Cosa vuoi?
	ISaidWhatDoYouWant			=	"SVM_2_ISaidWhatDoYouWant"			;//Cosa posso fare per te?
	MakeWay						=	"SVM_2_MakeWay"						;//Fammi passare!
	OutOfMyWay					=	"SVM_2_OutOfMyWay"					;//Fuori dai piedi!
	YouDeafOrWhat				=	"SVM_2_YouDeafOrWhat"				;//Taglia la corda o chiamo le guardie!
	LookingForTroubleAgain		=	"SVM_2_LookingForTroubleAgain"		;//Sei ancora in cerca di guai?
	LookAway					=	"SVM_2_LookAway"					;//Non ho visto NULLA! Non c'è problema!
	OkayKeepIt					=	"SVM_2_OkayKeepIt"					;//Va bene! È tutto tuo!
	WhatsThat					=	"SVM_2_WhatsThat"					;//Eh? Cosa?
	ThatsMyWeapon				=	"SVM_2_ThatsMyWeapon"				;//Quella che imbracci sembra proprio la mia arma!
	GiveItToMe					=	"SVM_2_GiveItToMe"					;//Coraggio, dammela!
	YouCanKeeptheCrap			=	"SVM_2_YouCanKeeptheCrap"			;//Tanto non mi serviva più!
	TheyKilledMyFriend			=	"SVM_2_TheyKilledMyFriend"			;//Qualcuno ha ucciso uno dei nostri! Se lo prendiamo, è spacciato!
	YouDisturbedMySlumber		=	"SVM_2_YouDisturbedMySlumber"		;//Perché mi hai svegliato?
	SuckerGotSome				=	"SVM_2_SuckerGotSome"				;//Sei stato sconfitto! Devo ammetterlo: sono contento!
	SuckerDefeatedEBr			=	"SVM_2_SuckerDefeatedEBr"			;//Hai sconfitto un barone delle miniere!
	SuckerDefeatedGur			=	"SVM_2_SuckerDefeatedGur"			;//Vincere contro un guru... Non so se sia coraggio o pazzia!
	SuckerDefeatedMage			=	"SVM_2_SuckerDefeatedMage"			;//Hai battuto un mago... Devi essere un tipo coraggioso!
	SuckerDefeatedNov_Guard		= 	"SVM_2_SuckerDefeatedNov_Guard"		;//Mi assicurerò che ci sia ordine!
	SuckerDefeatedVlk_Guard		= 	"SVM_2_SuckerDefeatedVlk_Guard"		;//Non importa il motivo: se colpisci un minatore, sei nei guai!
	YouDefeatedMyComrade		=	"SVM_2_YouDefeatedMyComrade"		;//Hai battuto un mio amico!
	YouDefeatedNOV_Guard		=	"SVM_2_YouDefeatedNOV_Guard"		;//Lascia in pace i novizi!
	YouDefeatedVLK_Guard		=	"SVM_2_YouDefeatedVLK_Guard"		;//Non si colpiscono i miei uomini! Capito?
	YouStoleFromMe				=	"SVM_2_YouStoleFromMe"				;//Perché mi hai derubato?
	YouStoleFromUs				=	"SVM_2_YouStoleFromUs"				;//Hai qualcosa che ci appartiene. Ci piacerebbe riaverlo indietro!
	YouStoleFromEBr				=	"SVM_2_YouStoleFromEBr"				;//Ha derubato i baroni delle miniere! Saranno infuriati!
	YouStoleFromGur				=	"SVM_2_YouStoleFromGur"				;//Hai derubato i guru! Sei fortunato che non ti abbiano preso!
	StoleFromMage				=	"SVM_2_StoleFromMage"				;//Ai maghi non piacciono le persone che s'impicciano delle loro cose!
	YouKilledMyFriend			=	"SVM_2_YouKilledMyFriend"			;//Hai uno dei nostri sulla coscienza. Commetti un altro errore e sarà il tuo turno!
	YouKilledEBr				=	"SVM_2_YouKilledEBr"				;//Hai ucciso un barone delle miniere! Sei diventato pazzo?
	YouKilledGur				=	"SVM_2_YouKilledGur"				;//Hai ucciso un guru! Non posso crederci!
	YouKilledMage				=	"SVM_2_YouKilledMage"				;//Hai ucciso un mago! Come pensi di giustificarti?
	YouKilledOCfolk				=	"SVM_2_YouKilledOCfolk"				;//Un membro di Campo Vecchio è morto e sei nell'elenco dei sospettati...
	YouKilledNCfolk				=	"SVM_2_YouKilledNCfolk"				;//C'è stata una terribile tragedia a Campo Nuovo e sembra che tu ne sia coinvolto!
	YouKilledPSIfolk			=	"SVM_2_YouKilledPSIfolk"			;//La Fratellanza conta un credente in meno e hai la sua morte sulla coscienza!
	GetThingsRight				=	"SVM_2_GetThingsRight"				;//Hai idea di come sarà difficile rimettere a posto le cose?
	YouDefeatedMeWell			=	"SVM_2_YouDefeatedMeWell"			;//Sì, mi hai battuto. Bel combattimento! Ma ora basta!
	Smalltalk01					=	"SVM_2_Smalltalk01"					;// ...se credi...
	Smalltalk02					=	"SVM_2_Smalltalk02"					;// ...forse...
	Smalltalk03					=	"SVM_2_Smalltalk03"					;// ...pessima idea...
	Smalltalk04					=	"SVM_2_Smalltalk04"					;// ...farò meglio a starne fuori...
	Smalltalk05					=	"SVM_2_Smalltalk05"					;// ...non è affar mio...
	Smalltalk06					=	"SVM_2_Smalltalk06"					;// ...era ovvio che ci sarebbero stati dei guai...
	Smalltalk07					=	"SVM_2_Smalltalk07"					;// ...ma tienilo per te: la gente non deve saperlo.
	Smalltalk08					=	"SVM_2_Smalltalk08"					;// ...non accadrà di nuovo...
	Smalltalk09					=	"SVM_2_Smalltalk09"					;// ...doveva esserci del vero in quella storia, dopo tutto...
	Smalltalk10					=	"SVM_2_Smalltalk10"					;// ...devi stare attento a ciò che dici in giro...
	Smalltalk11					=	"SVM_2_Smalltalk11"					;// ...dato che non mi riguarda...
	Smalltalk12					=	"SVM_2_Smalltalk12"					;// ...non dovresti credere a tutto ciò che senti...
	Smalltalk13					=	"SVM_2_Smalltalk13"					;// ...non vorrei essere nei suoi panni...
	Smalltalk14					=	"SVM_2_Smalltalk14"					;// ...sempre la stessa storia...
	Smalltalk15					=	"SVM_2_Smalltalk15"					;// ...certe persone non imparano mai...
	Smalltalk16					=	"SVM_2_Smalltalk16"					;// ...un tempo, le cose sarebbero andate diversamente...
	Smalltalk17					=	"SVM_2_Smalltalk17"					;// ...la gente parla troppo...
	Smalltalk18					=	"SVM_2_Smalltalk18"					;// ...non ascolto più le chiacchiere...
	Smalltalk19					=	"SVM_2_Smalltalk19"					;// ...fidati di qualcuno e ti ritroverai nei guai: ecco come vanno le cose...
	Smalltalk20					=	"SVM_2_Smalltalk20"					;// ...credo che non cambierà mai...
	Smalltalk21					=	"SVM_2_Smalltalk21"					;// ...probabilmente hai ragione...
	Smalltalk22					=	"SVM_2_Smalltalk22"					;// ...aspetta. Meglio non affrettarsi mai...
	Smalltalk23					=	"SVM_2_Smalltalk23"					;// ...pensavo che questa faccenda fosse stata sistemata molto tempo fa...
	Smalltalk24					=	"SVM_2_Smalltalk24"					;// ...parliamo di qualcos'altro...
	Om							= 	"SVM_2_Om"							;// Ommm!
};




instance SVM_3 (C_SVM)				 // Depressiv (Resigniert. Menschliches Gemüse. "Ich schau noch´n bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic					=	"SVM_3_StopMagic"					;//Niente magia!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"				;//Smettila con la magia, subito!
	WeaponDown					=	"SVM_3_WeaponDown"					;//Abbassa quell'arma!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"				;//Continua a giocare con quell'arma e mi arrabbierò sul serio!
	WatchYourAim				=	"SVM_3_WatchYourAim"				;//Perché mi stai puntando addosso quell'arma?
	WatchYourAimAngry			=	"SVM_3_WatchYourAimAngry"			;//Abbassa l'arma o mi arrabbio!
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"				;//Ehi! Cosa stai facendo???
	LetsForgetOurLittleFight	=	"SVM_3_LetsForgetOurLittleFight"	;//Va bene, diciamo che è stato tutto un malinteso.
	Strange						=	"SVM_3_Strange"						;//È sparito!
	DieMonster					=	"SVM_3_DieMonster"					;//Schifoso animale! Non mi darai più noia!
	DieMortalEnemy				=	"SVM_3_DieMortalEnemy"				;//Presto sarai morto!
	NowWait						=	"SVM_3_NowWait"						;//Forse non sono stato abbastanza chiaro!
	YouStillNotHaveEnough		=	"SVM_3_YouStillNotHaveEnough"		;//Non ne hai ancora abbastanza?
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//L'hai voluto tu!
	NowWaitIntruder				= 	"SVM_3_NowWaitIntruder"				;//Non hai niente da fare, qui! Adesso mi tocca massacrarti!
	IWillTeachYouRespectForForeignProperty	=	"SVM_3_IWillTeachYouRespectForForeignProperty"	;//Temo di doverti rompere qualche dito: sembra essere l'unico linguaggio che comprendi!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Mi stai derubando! Non posso crederci!
	YouAttackedMyCharge			=	"SVM_3_YouAttackedMyCharge"			;//Non puoi picchiare tutti quelli che incontri!
	YouKilledOneOfUs			=	"SVM_3_YouKilledOneOfUs"			;//Hai ucciso uno dei nostri! Hai commesso l'ultimo errore!
	Dead						=	"SVM_3_Dead"						;//Aaargh!
	Aargh_1						=	"SVM_3_Aargh_1"						;//Aargh!
	Aargh_2						=	"SVM_3_Aargh_2"						;//Aargh!
	Aargh_3						=	"SVM_3_Aargh_3"						;//Aargh!
	Berzerk						=	"SVM_3_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_3_YoullBeSorryForThis"			;//Te ne pentirai!
	YesYes						=	"SVM_3_YesYes"						;//Va bene, hai vinto!
	ShitWhatAMonster			=	"SVM_3_ShitWhatAMonster"			;//Merda! Scappa più veloce che puoi!
	Help						=	"SVM_3_Help"						;//Devo andare!
	WeWillMeetAgain				=	"SVM_3_WeWillMeetAgain"				;//Ci rivedremo ancora!
	NeverTryThatAgain			=	"SVM_3_NeverTryThatAgain"			;//Non riprovarci mai più!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"				;//Grazie per l'arma!
	ITookYourOre				=	"SVM_3_ITookYourOre"				;//Prenderò un altro po' del tuo metallo!
	ShitNoOre					=	"SVM_3_ShitNoOre"					;//Niente metallo? Questo è triste, amico... MOLTO triste!
	HandsOff					=	"SVM_3_HandsOff"					;//Giù le mani!
	GetOutOfHere				=	"SVM_3_GetOutOfHere"				;//Scappa!
	YouViolatedForbiddenTerritory=	"SVM_3_YouViolatedForbiddenTerritory";//Ehi! Da dove salti fuori?
	YouWannaFoolMe				=	"SVM_3_YouWannaFoolMe"				;//Non sono stupido come credi!
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"		;//Smettila di gironzolare da queste parti!
	WhyAreYouInHere				=	"SVM_3_WhyYouAreInHere"				;//Sparisci o chiamo le guardie!
	WhatDidYouInThere			=	"SVM_3_WhatDidYouInThere"			;//Cosa stai facendo? Se ti prendo, sei morto!
	WiseMove					=	"SVM_3_WiseMove"					;//Hai capito cosa è meglio per te!
	Alarm						=	"SVM_3_Alarm"						;//Guardie, accorrete!
	IntruderAlert				= 	"SVM_3_IntruderAlert"				;//ALLARME!
	BehindYou					=	"SVM_3_BehindYou"					;//Attento!
	TheresAFight				=	"SVM_3_TheresAFight"				;//Un combattimento!
	HeyHeyHey					=	"SVM_3_HeyHeyHey"					;//Colpiscilo!
	CheerFight					=	"SVM_3_CheerFight"					;//Cosa vuoi fare?
	CheerFriend					=	"SVM_3_CheerFriend"					;//Bel colpo!
	Ooh							=	"SVM_3_Ooh"							;//Ooooh!
	YeahWellDone				=	"SVM_3_YeahWellDone"				;//Sì! Ben fatto!
	RunCoward					=	"SVM_3_RunCoward"					;//Sta scappando!
	HeDefeatedHim				=	"SVM_3_HeDefeatedHim"				;//L'ha battuto!
	HeDeservedIt				=	"SVM_3_HeDeservedIt"				;//Per un po' non darà fastidio!
	HeKilledHim					=	"SVM_3_HeKilledHim"					;//Non si muoverà più. L'hai ucciso.
	ItWasAGoodFight				=	"SVM_3_ItWasAGoodFight"				;//Nulla di meglio di un bel combattimento...
	Awake						=	"SVM_3_Awake"						;//Un nuovo giorno e nulla è cambiato...
	FriendlyGreetings			=	"SVM_3_FriendlyGreetings"			;//Ehi, amico.
	ALGreetings					=	"SVM_3_ALGreetings"					;//Per Gomez!
	MageGreetings				=	"SVM_3_MageGreetings"				;//Per la magia!
	SectGreetings				=	"SVM_3_SectGreetings"				;//Sveglia!
	ThereHeIs					= 	"SVM_3_ThereHeIs"					;//Eccolo lassù!
	NoLearnNoPoints				= 	"SVM_3_NoLearnNoPoints"				;//Non posso insegnartelo: non hai abbastanza esperienza.
	NoLearnOverMax				= 	"SVM_3_NoLearnOverMax"				;//Non puoi migliorare ulteriormente, in questo campo. Dovresti imparare qualcos'altro.
	NoLearnYouAlreadyKnow		=	"SVM_3_NoLearnYouAlreadyKnow"		;//Devi migliorare ancora, prima di diventare un maestro!
	NoLearnYoureBetter			=	"SVM_3_NoLearnYoureBetter"			;//Sei già abbastanza esperto!
	HeyYou						=	"SVM_3_HeyYou"						;//Ehi, tu!
	NotNow						=	"SVM_3_NotNow"						;//Non adesso!
	WhatDoYouWant				=	"SVM_3_WhatDoYouWant"				;//Volevi qualcosa?
	ISaidWhatDoYouWant			=	"SVM_3_ISaidWhatDoYouWant"			;//Cosa posso fare per te?
	MakeWay						=	"SVM_3_MakeWay"						;//Fammi passare!
	OutOfMyWay					=	"SVM_3_OutOfMyWay"					;//Fuori dai piedi, amico!
	YouDeafOrWhat				=	"SVM_3_YouDeafOrWhat"				;//Quante volte te lo devo ripetere? Fammi passare!
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"		;//Sei ancora in cerca di guai?
	LookAway					=	"SVM_3_LookAway"					;//Non ho visto NULLA! Non sono neppure qui!
	OkayKeepIt					=	"SVM_3_OkayKeepIt"					;//Va bene, piantala!
	WhatsThat					=	"SVM_3_WhatsThat"					;//Cosa è stato?
	ThatsMyWeapon				=	"SVM_3_ThatsMyWeapon"				;//Hai la mia arma!
	GiveItToMe					=	"SVM_3_GiveItToMe"					;//Dammela!
	YouCanKeeptheCrap			=	"SVM_3_YouCanKeeptheCrap"			;//Come desideri! Tanto non mi serve più.
	TheyKilledMyFriend			=	"SVM_3_TheyKilledMyFriend"			;//Hai ucciso un altro dei nostri. Nessuno uscirà vivo da qui...
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"		;//Perché mi hai strappato ai miei sogni?
	SuckerGotSome				=	"SVM_3_SuckerGotSome"				;//Ben ti sta!
	SuckerDefeatedEBr			=	"SVM_3_SuckerDefeatedEBr"			;//Hai sconfitto un barone delle miniere! Sei in cerca di guai, vero?
	SuckerDefeatedGur			=	"SVM_3_SuckerDefeatedGur"			;//Hai sconfitto un guru! La sua gente ce l'ha a morte con te!
	SuckerDefeatedMage			=	"SVM_3_SuckerDefeatedMage"			;//Sconfiggere un mago è sempre causa di grossi guai!
	SuckerDefeatedNov_Guard		= 	"SVM_3_SuckerDefeatedNov_Guard"		;//La prossima volta, lascia in pace i novizi!
	SuckerDefeatedVlk_Guard		= 	"SVM_3_SuckerDefeatedVlk_Guard"		;//Se colpisci un minatore, farò lo stesso con te!
	YouDefeatedMyComrade		=	"SVM_3_YouDefeatedMyComrade"		;//Ha sconfitto uno dei miei amici!
	YouDefeatedNOV_Guard		=	"SVM_3_YouDefeatedNOV_Guard"		;//I novizi sono sotto la mia protezione! Lasciali in pace!
	YouDefeatedVLK_Guard		=	"SVM_3_YouDefeatedVLK_Guard"		;//I minatori mi pagano per non avere guai! Ora dimostrerò che non spendono i loro soldi invano!
	YouStoleFromMe				=	"SVM_3_YouStoleFromMe"				;//Mi hai derubato, sporco ladro!
	YouStoleFromUs				=	"SVM_3_YouStoleFromUs"				;//Hai degli oggetti che ci appartengono. Farai meglio a ridarceli.
	YouStoleFromEBr				=	"SVM_3_YouStoleFromEBr"				;//Hai derubato i baroni delle miniere! Saranno infuriati!
	YouStoleFromGur				=	"SVM_3_YouStoleFromGur"				;//Hai derubato i guru! Purtroppo ti hanno beccato!
	StoleFromMage				=	"SVM_3_StoleFromMage"				;//Devi essere più veloce, se vuoi derubare un mago!
	YouKilledMyFriend			=	"SVM_3_YouKilledMyFriend"			;//Hai uno dei nostri sulla coscienza. Commetti un altro errore e sarà il tuo turno!
	YouKilledEBr				=	"SVM_3_YouKilledEBr"				;//Hai ucciso un barone delle miniere! Sei diventato pazzo?
	YouKilledGur				=	"SVM_3_YouKilledGur"				;//Hai ucciso un guru! Non posso crederci!
	YouKilledMage				=	"SVM_3_YouKilledMage"				;//Hai ucciso un mago! Come pensi di giustificarti?
	YouKilledOCfolk				=	"SVM_3_YouKilledOCfolk"				;//Un membro di Campo Vecchio è morto e sei nell'elenco dei sospettati...
	YouKilledNCfolk				=	"SVM_3_YouKilledNCfolk"				;//C'è stata una terribile tragedia a Campo Nuovo e sembra che tu ne sia coinvolto!
	YouKilledPSIfolk			=	"SVM_3_YouKilledPSIfolk"			;//La Fratellanza conta un credente in meno e hai la sua morte sulla coscienza!
	GetThingsRight				=	"SVM_3_GetThingsRight"				;//Non sarà facile rimettere a posto le cose!
	YouDefeatedMeWell			=	"SVM_3_YouDefeatedMeWell"			;//Bel combattimento! Non devi preoccuparti di avermi sconfitto!
	Smalltalk01					=	"SVM_3_Smalltalk01"					;// ...se credi...
	Smalltalk02					=	"SVM_3_Smalltalk02"					;// ...forse...
	Smalltalk03					=	"SVM_3_Smalltalk03"					;// ...pessima idea...
	Smalltalk04					=	"SVM_3_Smalltalk04"					;// ...farò meglio a starne fuori...
	Smalltalk05					=	"SVM_3_Smalltalk05"					;// ...non è affar mio...
	Smalltalk06					=	"SVM_3_Smalltalk06"					;// ...era ovvio che ci sarebbero stati dei guai...
	Smalltalk07					=	"SVM_3_Smalltalk07"					;// ...ma tienilo per te: la gente non deve saperlo.
	Smalltalk08					=	"SVM_3_Smalltalk08"					;// ...non accadrà di nuovo...
	Smalltalk09					=	"SVM_3_Smalltalk09"					;// ...doveva esserci del vero in quella storia, dopo tutto...
	Smalltalk10					=	"SVM_3_Smalltalk10"					;// ...devi stare attento a ciò che dici in giro...
	Smalltalk11					=	"SVM_3_Smalltalk11"					;// ...dato che non mi riguarda...
	Smalltalk12					=	"SVM_3_Smalltalk12"					;// ...non dovresti credere a tutto ciò che senti...
	Smalltalk13					=	"SVM_3_Smalltalk13"					;// ...non vorrei essere nei suoi panni...
	Smalltalk14					=	"SVM_3_Smalltalk14"					;// ...sempre la stessa storia...
	Smalltalk15					=	"SVM_3_Smalltalk15"					;// ...certe persone non imparano mai...
	Smalltalk16					=	"SVM_3_Smalltalk16"					;// ...un tempo, le cose sarebbero andate diversamente...
	Smalltalk17					=	"SVM_3_Smalltalk17"					;// ...la gente parla troppo...
	Smalltalk18					=	"SVM_3_Smalltalk18"					;// ...non ascolto più le chiacchiere...
	Smalltalk19					=	"SVM_3_Smalltalk19"					;// ...fidati di qualcuno e ti ritroverai nei guai: ecco come vanno le cose...
	Smalltalk20					=	"SVM_3_Smalltalk20"					;// ...credo che non cambierà mai...
	Smalltalk21					=	"SVM_3_Smalltalk21"					;// ...probabilmente hai ragione...
	Smalltalk22					=	"SVM_3_Smalltalk22"					;// ...aspetta. Meglio non affrettarsi mai...
	Smalltalk23					=	"SVM_3_Smalltalk23"					;// ...pensavo che questa faccenda fosse stata sistemata molto tempo fa...
	Smalltalk24					=	"SVM_3_Smalltalk24"					;// ...parliamo di qualcos'altro...
	Om							= 	"SVM_3_Om"							;// Ommm!
};


instance SVM_4 (C_SVM)				// Alter Sack,  (Torrez, KDF-Magier, alte Buddler....), alter Hase. Kann Grünschnäbeln noch was zeigen
{
	StopMagic					=	"SVM_4_StopMagic"					;//Niente magia!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"				;//Dammi retta e piantala con la magia!
	WeaponDown					=	"SVM_4_WeaponDown"					;//Allontana quell'arma, se non vuoi guai!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"				;//Abbassa subito quell'arma!
	WatchYourAim				=	"SVM_4_WatchYourAim"				;//Attento a dove punti quell'affare!
	WatchYourAimAngry			=	"SVM_4_WatchYourAimAngry"			;//Se non la smetti, ti tolgo quel giocattolo!
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"				;//Ehi, attento!
	LetsForgetOurLittleFight	=	"SVM_4_LetsForgetOurLittleFight"	;//Dimentichiamo la nostra piccola discussione!
	Strange						=	"SVM_4_Strange"						;//Coraggio, fatti vedere!
	DieMonster					=	"SVM_4_DieMonster"					;//Non importa quanti ne uccidi: continuano ad arrivarne!
	DieMortalEnemy				=	"SVM_4_DieMortalEnemy"				;//Hai finito di vivere!
	NowWait						=	"SVM_4_NowWait"						;//T'insegnerò a lasciarmi in pace...
	YouStillNotHaveEnough		=	"SVM_4_YouStillNotHaveEnough"		;//Non ne hai ancora abbastanza?
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//L'hai voluto tu!
	NowWaitIntruder				= 	"SVM_4_NowWaitIntruder"				;//Intrufolarti qui è stata un'idea davvero stupida!
	IWillTeachYouRespectForForeignProperty	=	"SVM_4_IWillTeachYouRespectForForeignProperty"	;//Non puoi aggirarti impunemente da queste parti!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Hai osato derubarmi!
	YouAttackedMyCharge			=	"SVM_4_YouAttackedMyCharge"			;//Crearci problemi non ti porterà alcun beneficio.
	YouKilledOneOfUs			=	"SVM_4_YouKilledOneOfUs"			;//Hai ucciso uno dei nostri! Occhio per occhio...
	Dead						=	"SVM_4_Dead"						;//Aaargh!
	Aargh_1						=	"SVM_4_Aargh_1"						;//Aargh!
	Aargh_2						=	"SVM_4_Aargh_2"						;//Aargh!
	Aargh_3						=	"SVM_4_Aargh_3"						;//Aargh!
	Berzerk						=	"SVM_4_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_4_YoullBeSorryForThis"			;//Te ne pentirai!
	YesYes						=	"SVM_4_YesYes"						;//Calmati, hai vinto!
	ShitWhatAMonster			=	"SVM_4_ShitWhatAMonster"			;//Andiamocene in fretta da questo posto!
	Help						=	"SVM_4_Help"						;//Sono troppo vecchio per queste cose!
	WeWillMeetAgain				=	"SVM_4_WeWillMeetAgain"				;//Non lo dimenticherò!
	NeverTryThatAgain			=	"SVM_4_NeverTryThatAgain"			;//Non provarci più!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"				;//Farò meglio a portarmi dietro quest'arma!
	ITookYourOre				=	"SVM_4_ITookYourOre"				;//Mi prenderò cura del tuo metallo!
	ShitNoOre					=	"SVM_4_ShitNoOre"					;//Neanche un pezzettino!
	HandsOff					=	"SVM_4_HandsOff"					;//Giù le mani!
	GetOutOfHere				=	"SVM_4_GetOutOfHere"				;//Taglia la corda!
	YouViolatedForbiddenTerritory=	"SVM_4_YouViolatedForbiddenTerritory";//Non hai nulla da fare, qui!
	YouWannaFoolMe				=	"SVM_4_YouWannaFoolMe"				;//Non sono in vena di scherzi!
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"		;//Ehi! Perché gironzoli da queste parti?
	WhyAreYouInHere				=	"SVM_4_WhyYouAreInHere"				;//Vattene o chiamo le guardie!
	WhatDidYouInThere			=	"SVM_4_WhatDidYouInThere"			;//Cosa stai facendo qui?
	WiseMove					=	"SVM_4_WiseMove"					;//Sei stato fortunato.
	Alarm						=	"SVM_4_Alarm"						;//Guardie!
	IntruderAlert				= 	"SVM_4_IntruderAlert"				;//UN INTRUSO!!!
	BehindYou					=	"SVM_4_BehindYou"					;//Dietro di te!
	TheresAFight				=	"SVM_4_TheresAFight"				;//Un altro combattimento.
	HeyHeyHey					=	"SVM_4_HeyHeyHey"					;//Più forte!
	CheerFight					=	"SVM_4_CheerFight"					;//Tutto qui quello che sai fare?
	CheerFriend					=	"SVM_4_CheerFriend"					;//Suonagliele!
	Ooh							=	"SVM_4_Ooh"							;//Reagisci!
	YeahWellDone				=	"SVM_4_YeahWellDone"				;//Ben fatto!
	RunCoward					=	"SVM_4_RunCoward"					;//Il vigliacco sta scappando!
	HeDefeatedHim				=	"SVM_4_HeDefeatedHim"				;//Ai miei tempi, gli uomini erano più resistenti!
	HeDeservedIt				=	"SVM_4_HeDeservedIt"				;//Tutta colpa tua!
	HeKilledHim					=	"SVM_4_HeKilledHim"					;//L'hai ucciso! Hai commesso un grave errore!
	ItWasAGoodFight				=	"SVM_4_ItWasAGoodFight"				;//Ai vecchi tempi, i combattimenti erano migliori!
	Awake						=	"SVM_4_Awake"						;//Yawn!
	FriendlyGreetings			=	"SVM_4_FriendlyGreetings"			;//Salute!
	ALGreetings					=	"SVM_4_ALGreetings"					;//Per Gomez!
	MageGreetings				=	"SVM_4_MageGreetings"				;//Per la magia!
	SectGreetings				=	"SVM_4_SectGreetings"				;//Sveglia!
	ThereHeIs					= 	"SVM_4_ThereHeIs"					;//Lo troverai lassù!
	NoLearnNoPoints				= 	"SVM_4_NoLearnNoPoints"				;//Non posso insegnarti nulla: non hai abbastanza esperienza.
	NoLearnOverMax				= 	"SVM_4_NoLearnOverMax"				;//Non puoi migliorare ulteriormente, in questo campo. Dovresti imparare qualcos'altro.
	NoLearnYouAlreadyKnow		=	"SVM_4_NoLearnYouAlreadyKnow"		;//Devi migliorare ancora, prima di diventare un maestro!
	NoLearnYoureBetter			=	"SVM_4_NoLearnYoureBetter"			;//Sei già meglio di così!
	HeyYou						=	"SVM_4_HeyYou"						;//Ehi!
	NotNow						=	"SVM_4_NotNow"						;//Non ora.
	WhatDoYouWant				=	"SVM_4_WhatDoYouWant"				;//Cosa vuoi?
	ISaidWhatDoYouWant			=	"SVM_4_ISaidWhatDoYouWant"			;//Volevi qualcosa?
	MakeWay						=	"SVM_4_MakeWay"						;//Fammi passare.
	OutOfMyWay					=	"SVM_4_OutOfMyWay"					;//Fuori dai piedi, subito!
	YouDeafOrWhat				=	"SVM_4_YouDeafOrWhat"				;//Vattene o te ne pentirai!
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"		;//Sei ancora in cerca di guai?
	LookAway					=	"SVM_4_LookAway"					;//Non vedo nulla, non sento nulla, non dico nulla...
	OkayKeepIt					=	"SVM_4_OkayKeepIt"					;//Smettila!
	WhatsThat					=	"SVM_4_WhatsThat"					;//Cosa è stato?
	ThatsMyWeapon				=	"SVM_4_ThatsMyWeapon"				;//Fai il bravo e restituiscimi l'arma!
	GiveItToMe					=	"SVM_4_GiveItToMe"					;//Coraggio, dammela!
	YouCanKeeptheCrap			=	"SVM_4_YouCanKeeptheCrap"			;//Sono felice di sbarazzarmene!
	TheyKilledMyFriend			=	"SVM_4_TheyKilledMyFriend"			;//Se scopro chi ha ucciso uno dei nostri...
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"		;//Stai disturbando il mio riposo!
	SuckerGotSome				=	"SVM_4_SuckerGotSome"				;//Sei stato battuto! Avevi bisogno di una bella ripassata!
	SuckerDefeatedEBr			=	"SVM_4_SuckerDefeatedEBr"			;//Hai sconfitto un barone delle miniere!
	SuckerDefeatedGur			=	"SVM_4_SuckerDefeatedGur"			;//Hai sconfitto un guru! Sono impressionato, ma non provarci mai più.
	SuckerDefeatedMage			=	"SVM_4_SuckerDefeatedMage"			;//Hai battuto un mago... Devi essere un tipo coraggioso!
	SuckerDefeatedNov_Guard		= 	"SVM_4_SuckerDefeatedNov_Guard"		;//Devi essere pazzo a colpire un novizio.
	SuckerDefeatedVlk_Guard		= 	"SVM_4_SuckerDefeatedVlk_Guard"		;//Cosa pensavi di ottenere, battendo un minatore?
	YouDefeatedMyComrade		=	"SVM_4_YouDefeatedMyComrade"		;//Hai disturbato uno dei miei amici e questo è MOLTO pericoloso!
	YouDefeatedNOV_Guard		=	"SVM_4_YouDefeatedNOV_Guard"		;//Alza le mani su un altro novizio e te ne pentirai!
	YouDefeatedVLK_Guard		=	"SVM_4_YouDefeatedVLK_Guard"		;//Toccare uno dei miei protetti è molto pericoloso.
	YouStoleFromMe				=	"SVM_4_YouStoleFromMe"				;//Tieni le mani lontane dalla mia roba, capito?
	YouStoleFromUs				=	"SVM_4_YouStoleFromUs"				;//Hai un oggetto che ci appartiene. Restituiscicelo!
	YouStoleFromEBr				=	"SVM_4_YouStoleFromEBr"				;//Hai derubato i baroni delle miniere! Saranno infuriati!
	YouStoleFromGur				=	"SVM_4_YouStoleFromGur"				;//Hai derubato i guru! Cerca almeno di non farti prendere!
	StoleFromMage				=	"SVM_4_StoleFromMage"				;//Ai maghi non piacciono le persone che s'impicciano delle loro cose!
	YouKilledMyFriend			=	"SVM_4_YouKilledMyFriend"			;//Hai uno dei nostri sulla coscienza. Commetti un altro errore e sarà il tuo turno!
	YouKilledEBr				=	"SVM_4_YouKilledEBr"				;//Hai ucciso un barone delle miniere! Sei diventato pazzo?
	YouKilledGur				=	"SVM_4_YouKilledGur"				;//Hai ucciso un guru! Non posso crederci!
	YouKilledMage				=	"SVM_4_YouKilledMage"				;//Hai ucciso un mago! Come pensi di giustificarti?
	YouKilledOCfolk				=	"SVM_4_YouKilledOCfolk"				;//Un membro di Campo Vecchio è morto e sei nell'elenco dei sospettati...
	YouKilledNCfolk				=	"SVM_4_YouKilledNCfolk"				;//C'è stata una terribile tragedia a Campo Nuovo e sembra che tu ne sia coinvolto!
	YouKilledPSIfolk			=	"SVM_4_YouKilledPSIfolk"			;//La Fratellanza conta un credente in meno e hai la sua morte sulla coscienza!
	GetThingsRight				=	"SVM_4_GetThingsRight"				;//Non sarà facile rimettere a posto le cose!
	YouDefeatedMeWell			=	"SVM_4_YouDefeatedMeWell"			;//Mi hai dato una bella lezione, amico! Mi sono divertito, ma ora basta combattere!
	Smalltalk01					=	"SVM_4_Smalltalk01"					;// ...se credi...
	Smalltalk02					=	"SVM_4_Smalltalk02"					;// ...forse...
	Smalltalk03					=	"SVM_4_Smalltalk03"					;// ...pessima idea...
	Smalltalk04					=	"SVM_4_Smalltalk04"					;// ...farò meglio a starne fuori...
	Smalltalk05					=	"SVM_4_Smalltalk05"					;// ...non è affar mio...
	Smalltalk06					=	"SVM_4_Smalltalk06"					;// ...era ovvio che ci sarebbero stati dei guai...
	Smalltalk07					=	"SVM_4_Smalltalk07"					;// ...ma tienilo per te: la gente non deve saperlo.
	Smalltalk08					=	"SVM_4_Smalltalk08"					;// ...non accadrà di nuovo...
	Smalltalk09					=	"SVM_4_Smalltalk09"					;// ...doveva esserci del vero in quella storia, dopo tutto...
	Smalltalk10					=	"SVM_4_Smalltalk10"					;// ...devi stare attento a ciò che dici in giro...
	Smalltalk11					=	"SVM_4_Smalltalk11"					;// ...dato che non mi riguarda...
	Smalltalk12					=	"SVM_4_Smalltalk12"					;// ...non dovresti credere a tutto ciò che senti...
	Smalltalk13					=	"SVM_4_Smalltalk13"					;// ...non vorrei essere nei suoi panni...
	Smalltalk14					=	"SVM_4_Smalltalk14"					;// ...sempre la stessa storia...
	Smalltalk15					=	"SVM_4_Smalltalk15"					;// ...certe persone non imparano mai...
	Smalltalk16					=	"SVM_4_Smalltalk16"					;// ...un tempo, le cose sarebbero andate diversamente...
	Smalltalk17					=	"SVM_4_Smalltalk17"					;// ...la gente parla troppo...
	Smalltalk18					=	"SVM_4_Smalltalk18"					;// ...non ascolto più le chiacchiere...
	Smalltalk19					=	"SVM_4_Smalltalk19"					;// ...fidati di qualcuno e ti ritroverai nei guai: ecco come vanno le cose...
	Smalltalk20					=	"SVM_4_Smalltalk20"					;// ...credo che non cambierà mai...
	Smalltalk21					=	"SVM_4_Smalltalk21"					;// ...probabilmente hai ragione...
	Smalltalk22					=	"SVM_4_Smalltalk22"					;// ...aspetta. Meglio non affrettarsi mai...
	Smalltalk23					=	"SVM_4_Smalltalk23"					;// ...pensavo che questa faccenda fosse stata sistemata molto tempo fa...
	Smalltalk24					=	"SVM_4_Smalltalk24"					;// ...parliamo di qualcos'altro...
	Om							= 	"SVM_4_Om"							;//Ommm!
};


instance SVM_5 (C_SVM)				//Lebenskünstler, offen, Fröhlich. humorvoller Verarscher. Auch: Fauler Verpisser. Selbstbewußt, wortgewandt, charismatisch. (Lester)
{
	StopMagic					=	"SVM_5_StopMagic"					;//Basta con la magia!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Quando dico 'Basta con la magia', parlo sul serio!
	WeaponDown					=	"SVM_5_WeaponDown"					;//Cosa vuoi fare con quell'arma?
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Coraggio, metti via quell'arnese!
	WatchYourAim				=	"SVM_5_WatchYourAim"				;//Me lo stai puntando addosso, buffone!
	WatchYourAimAngry			=	"SVM_5_WatchYourAimAngry"			;//Se non la pianti subito, ti userò per allenarmi!
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Ehi! Sei cieco?
	LetsForgetOurLittleFight	=	"SVM_5_LetsForgetOurLittleFight"	;//Dimentichiamo la nostra piccola discussione, va bene?
	Strange						=	"SVM_5_Strange"						;//Era qui un attimo fa! Strano...
	DieMonster					=	"SVM_5_DieMonster"					;//Tocca a te, bastardo!
	DieMortalEnemy				=	"SVM_5_DieMortalEnemy"				;//Giorno di paga!
	NowWait						=	"SVM_5_NowWait"						;//Hai bisogno di una bella lezione!
	YouStillNotHaveEnough		=	"SVM_5_YouStillNotHaveEnough"		;//Non ne hai ancora abbastanza?
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//L'hai voluto tu!
	NowWaitIntruder				= 	"SVM_5_NowWaitIntruder"				;//Dovranno portarti via con un carretto!
	IWillTeachYouRespectForForeignProperty	=	"SVM_5_IWillTeachYouRespectForForeignProperty"	;//Ti avevo avvertito: se tocchi la mia roba, sei nei guai!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Ladro! T'insegnerò le buone maniere!
	YouAttackedMyCharge			=	"SVM_5_YouAttackedMyCharge"			;//Nessuno picchia i miei uomini senza pentirsene!
	YouKilledOneOfUs			=	"SVM_5_YouKilledOneOfUs"			;//Hai ucciso uno dei miei uomini. Ora io ucciderò TE!
	Dead						=	"SVM_5_Dead"					;//Aaargh!
	Aargh_1						=	"SVM_5_Aargh_1"						;//Aargh!
	Aargh_2						=	"SVM_5_Aargh_2"						;//Aargh!
	Aargh_3						=	"SVM_5_Aargh_3"						;//Aargh!
	Berzerk						=	"SVM_5_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_5_YoullBeSorryForThis"			;//Te ne pentirai!
	YesYes						=	"SVM_5_YesYes"						;//Calma, hai vinto!
	ShitWhatAMonster			=	"SVM_5_ShitWhatAMonster"			;//Questo è troppo grosso per me!
	Help						=	"SVM_5_Help"						;//Maledizione!
	WeWillMeetAgain				=	"SVM_5_WeWillMeetAgain"				;//La prossima volta, le cose andranno diversamente!
	NeverTryThatAgain			=	"SVM_5_NeverTryThatAgain"			;//Non riprovarci!
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Mi piace quest'arma!
	ITookYourOre				=	"SVM_5_ITookYourOre"				;//Mi assicurerò che il tuo metallo sia ben investito!
	ShitNoOre					=	"SVM_5_ShitNoOre"					;//Che sfortuna! Niente metallo!
	HandsOff					=	"SVM_5_HandsOff"					;//Giù le mani!
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Fuori dai piedi!
	YouViolatedForbiddenTerritory=	"SVM_5_YouViolatedForbiddenTerritory";//Ehi! Da dove salti fuori?
	YouWannaFoolMe				=	"SVM_5_YouWannaFoolMe"				;//Bella battuta!
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Perché gironzoli da queste parti?
	WhyAreYouInHere				=	"SVM_5_WhyYouAreInHere"				;//Vattene subito o chiamo le guardie!
	WhatDidYouInThere			=	"SVM_5_WhatDidYouInThere"			;//Non hai nulla da fare, qui!
	WiseMove					=	"SVM_5_WiseMove"					;//Impari in fretta!
	Alarm						=	"SVM_5_Alarm"						;//Guardie, accorrete!
	IntruderAlert				= 	"SVM_5_IntruderAlert"				;//ALLARME!!!
	BehindYou					=	"SVM_5_BehindYou"					;//Ehi, attento!
	TheresAFight				=	"SVM_5_TheresAFight"				;//Un combattimento!
	HeyHeyHey					=	"SVM_5_HeyHeyHey"					;//Colpiscilo!
	CheerFight					=	"SVM_5_CheerFight"					;//Bene!
	CheerFriend					=	"SVM_5_CheerFriend"					;//Stendilo, adesso!
	Ooh							=	"SVM_5_Ooh"							;//Attento!
	YeahWellDone				=	"SVM_5_YeahWellDone"				;//Era ora!
	RunCoward					=	"SVM_5_RunCoward"					;//Il tizio se la sta svignando!
	HeDefeatedHim				=	"SVM_5_HeDefeatedHim"				;//Direi che è una vittoria piena!
	HeDeservedIt				=	"SVM_5_HeDeservedIt"				;//Se l'è meritata!
	HeKilledHim					=	"SVM_5_HeKilledHim"					;//Vai in giro a uccidere la gente. Ora sei davvero nei guai!
	ItWasAGoodFight				=	"SVM_5_ItWasAGoodFight"				;//Che combattimento!
	Awake						=	"SVM_5_Awake"						;//Yawn!
	FriendlyGreetings			=	"SVM_5_FriendlyGreetings"			;//Ciao, amico!
	ALGreetings					=	"SVM_5_ALGreetings"					;//Per Gomez!
	MageGreetings				=	"SVM_5_MageGreetings"				;//Per la magia!
	SectGreetings				=	"SVM_5_SectGreetings"				;//Sveglia!
	ThereHeIs					= 	"SVM_5_ThereHeIs"					;//Lassù!
	NoLearnNoPoints				= 	"SVM_5_NoLearnNoPoints"				;//Non posso insegnarti nulla: non hai abbastanza esperienza.
	NoLearnOverMax				= 	"SVM_5_NoLearnOverMax"				;//Non puoi migliorare ulteriormente, in questo campo. Dovresti imparare qualcos'altro.
	NoLearnYouAlreadyKnow		=	"SVM_5_NoLearnYouAlreadyKnow"		;//Devi migliorare ancora, prima di diventare un maestro!
	NoLearnYoureBetter			=	"SVM_5_NoLearnYoureBetter"			;//Sei già abbastanza esperto!
	HeyYou						=	"SVM_5_HeyYou"						;//Ehi, tu!
	NotNow						=	"SVM_5_NotNow"						;//Non adesso!
	WhatDoYouWant				=	"SVM_5_WhatDoYouWant"				;//Posso aiutarti?
	ISaidWhatDoYouWant			=	"SVM_5_ISaidWhatDoYouWant"			;//Cosa vuoi?
	MakeWay						=	"SVM_5_MakeWay"						;//Fammi passare!
	OutOfMyWay					=	"SVM_5_OutOfMyWay"					;//Andiamo, voglio passare!
	YouDeafOrWhat				=	"SVM_5_YouDeafOrWhat"				;//Sei sordo o cerchi guai?
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//Sei ancora in cerca di guai?
	LookAway					=	"SVM_5_LookAway"					;//Io non ho visto NULLA... Perché, è successo qualcosa?
	OkayKeepIt					=	"SVM_5_OkayKeepIt"					;//Va bene, ma piantala!
	WhatsThat					=	"SVM_5_WhatsThat"					;//Cosa è stato?
	ThatsMyWeapon				=	"SVM_5_ThatsMyWeapon"				;//Vorrei riavere la mia arma!
	GiveItToMe					=	"SVM_5_GiveItToMe"					;//Dalla a me!
	YouCanKeeptheCrap			=	"SVM_5_YouCanKeeptheCrap"			;//Non è male, ma ho di meglio!
	TheyKilledMyFriend			=	"SVM_5_TheyKilledMyFriend"			;//Hanno ucciso uno dei nostri. Se prendo quel porco...
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;//Cosa succede? Perché mi hai svegliato?
	SuckerGotSome				=	"SVM_5_SuckerGotSome"				;//Ti hanno dato una bella ripassata, eh? Ben ti sta!
	SuckerDefeatedEBr			=	"SVM_5_SuckerDefeatedEBr"			;//Hai battuto un barone delle miniere! Deve esserci rimasto di stucco!
	SuckerDefeatedGur			=	"SVM_5_SuckerDefeatedGur"			;//Hai sconfitto un guru! Sono impressionato, ma non provarci mai più.
	SuckerDefeatedMage			=	"SVM_5_SuckerDefeatedMage"			;//Hai battuto un mago... Devi essere un tipo coraggioso!
	SuckerDefeatedNov_Guard		= 	"SVM_5_SuckerDefeatedNov_Guard"		;//Devi essere pazzo a colpire un novizio.
	SuckerDefeatedVlk_Guard		= 	"SVM_5_SuckerDefeatedVlk_Guard"		;//Cosa pensavi di ottenere, battendo un minatore?
	YouDefeatedMyComrade		=	"SVM_5_YouDefeatedMyComrade"		;//Perché hai colpito uno dei miei amici?
	YouDefeatedNOV_Guard		=	"SVM_5_YouDefeatedNOV_Guard"		;//Alza le mani su un altro novizio e te ne pentirai!
	YouDefeatedVLK_Guard		=	"SVM_5_YouDefeatedVLK_Guard"		;//Toccare uno dei miei protetti è molto pericoloso.
	YouStoleFromMe				=	"SVM_5_YouStoleFromMe"				;//Osi tornare da queste parti, sporco ladro?
	YouStoleFromUs				=	"SVM_5_YouStoleFromUs"				;//Hai degli oggetti che ci appartengono. Farai meglio a ridarceli.
	YouStoleFromEBr				=	"SVM_5_YouStoleFromEBr"				;//Hai derubato i baroni delle miniere! Saranno infuriati!
	YouStoleFromGur				=	"SVM_5_YouStoleFromGur"				;//Hai derubato i guru! Cerca almeno di non farti prendere!
	StoleFromMage				=	"SVM_5_StoleFromMage"				;//Ai maghi non piacciono le persone che s'impicciano delle loro cose!
	YouKilledMyFriend			=	"SVM_5_YouKilledMyFriend"			;//Hai uno dei nostri sulla coscienza. Commetti un altro errore e sarà il tuo turno!
	YouKilledEBr				=	"SVM_5_YouKilledEBr"				;//Hai ucciso un barone delle miniere! Sei diventato pazzo?
	YouKilledGur				=	"SVM_5_YouKilledGur"				;//Hai ucciso un guru! Non posso crederci!
	YouKilledMage				=	"SVM_5_YouKilledMage"				;//Hai ucciso un mago! Come pensi di giustificarti?
	YouKilledOCfolk				=	"SVM_5_YouKilledOCfolk"				;//Un membro di Campo Vecchio è morto e sei nell'elenco dei sospettati...
	YouKilledNCfolk				=	"SVM_5_YouKilledNCfolk"				;//C'è stata una terribile tragedia a Campo Nuovo e sembra che tu ne sia coinvolto!
	YouKilledPSIfolk			=	"SVM_5_YouKilledPSIfolk"			;//La Fratellanza conta un credente in meno e hai la sua morte sulla coscienza!
	GetThingsRight				=	"SVM_5_GetThingsRight"				;//Non sarà facile rimettere a posto le cose!
	YouDefeatedMeWell			=	"SVM_5_YouDefeatedMeWell"			;//Mi hai dato una bella lezione, amico! Mi sono divertito, ma ora basta combattere!
	Smalltalk01					=	"SVM_5_Smalltalk01"					;// ...se credi...
	Smalltalk02					=	"SVM_5_Smalltalk02"					;// ...forse...
	Smalltalk03					=	"SVM_5_Smalltalk03"					;// ...pessima idea...
	Smalltalk04					=	"SVM_5_Smalltalk04"					;// ...farò meglio a starne fuori...
	Smalltalk05					=	"SVM_5_Smalltalk05"					;// ...non è affar mio...
	Smalltalk06					=	"SVM_5_Smalltalk06"					;// ...era ovvio che ci sarebbero stati dei guai...
	Smalltalk07					=	"SVM_5_Smalltalk07"					;// ...ma tienilo per te: la gente non deve saperlo.
	Smalltalk08					=	"SVM_5_Smalltalk08"					;// ...non accadrà di nuovo...
	Smalltalk09					=	"SVM_5_Smalltalk09"					;// ...doveva esserci del vero in quella storia, dopo tutto...
	Smalltalk10					=	"SVM_5_Smalltalk10"					;// ...devi stare attento a ciò che dici in giro...
	Smalltalk11					=	"SVM_5_Smalltalk11"					;// ...dato che non mi riguarda...
	Smalltalk12					=	"SVM_5_Smalltalk12"					;// ...non dovresti credere a tutto ciò che senti...
	Smalltalk13					=	"SVM_5_Smalltalk13"					;// ...non vorrei essere nei suoi panni...
	Smalltalk14					=	"SVM_5_Smalltalk14"					;// ...sempre la stessa storia...
	Smalltalk15					=	"SVM_5_Smalltalk15"					;// ...certe persone non imparano mai...
	Smalltalk16					=	"SVM_5_Smalltalk16"					;// ...un tempo, le cose sarebbero andate diversamente...
	Smalltalk17					=	"SVM_5_Smalltalk17"					;// ...la gente parla troppo...
	Smalltalk18					=	"SVM_5_Smalltalk18"					;// ...non ascolto più le chiacchiere...
	Smalltalk19					=	"SVM_5_Smalltalk19"					;// ...fidati di qualcuno e ti ritroverai nei guai: ecco come vanno le cose...
	Smalltalk20					=	"SVM_5_Smalltalk20"					;// ...credo che non cambierà mai...
	Smalltalk21					=	"SVM_5_Smalltalk21"					;// ...probabilmente hai ragione...
	Smalltalk22					=	"SVM_5_Smalltalk22"					;// ...aspetta. Meglio non affrettarsi mai...
	Smalltalk23					=	"SVM_5_Smalltalk23"					;// ...pensavo che questa faccenda fosse stata sistemata molto tempo fa...
	Smalltalk24					=	"SVM_5_Smalltalk24"					;// ...parliamo di qualcos'altro...
	Om							= 	"SVM_5_Om"							;//Ommm!
};

//////////////////////////////////////////
instance SVM_6 (C_SVM)				//Raufbold	(Will saufen und raufen	(Matrose) Alkoholiker. Grölt viel)
{
	StopMagic					=	"SVM_6_StopMagic"					;//Niente magia!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"				;//Piantala con la magia, subito!
	WeaponDown					=	"SVM_6_WeaponDown"					;//Allontana quella maledetta arma!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"				;//Vuoi che ti sistemi? Allontana quell'affare!
	WatchYourAim				=	"SVM_6_WatchYourAim"				;//Abbassa quell'arnese o ti succederà qualcosa di brutto!
	WatchYourAimAngry			=	"SVM_6_WatchYourAimAngry"			;//Continua a puntarmi addosso quell'arma e ti userò come straccio per pulire il pavimento!
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"				;//Ehi, attento!
	LetsForgetOurLittleFight	=	"SVM_6_LetsForgetOurLittleFight"	;//Dimentichiamo la nostra piccola discussione, va bene?
	Strange						=	"SVM_6_Strange"						;//Coraggio, fatti vedere!
	DieMonster					=	"SVM_6_DieMonster"					;//Ti ridurrò in polpette, bastardo!
	DieMortalEnemy				=	"SVM_6_DieMortalEnemy"				;//Sei spacciato!
	NowWait						=	"SVM_6_NowWait"						;//Preparati a ricevere un bel colpo sul grugno...
	YouStillNotHaveEnough		=	"SVM_6_YouStillNotHaveEnough"		;//Sembri desideroso di ricevere una bella lezione!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Era questo che volevi!
	NowWaitIntruder				= 	"SVM_6_NowWaitIntruder"				;//Ora ti distruggo!
	IWillTeachYouRespectForForeignProperty	=	"SVM_6_IWillTeachYouRespectForForeignProperty"	;//Ti avevo avvertito: se tocchi la mia roba, sei nei guai!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Ladro! Ti finirò!
	YouAttackedMyCharge			=	"SVM_6_YouAttackedMyCharge"			;//Nessuno attacca i miei uomini!
	YouKilledOneOfUs			=	"SVM_6_YouKilledOneOfUs"			;//Hai ucciso uno dei miei uomini. Ora io ucciderò TE!
	Dead						=	"SVM_6_Dead"						;//Aaargh!
	Aargh_1						=	"SVM_6_Aargh_1"						;//Aargh!
	Aargh_2						=	"SVM_6_Aargh_2"						;//Aargh!
	Aargh_3						=	"SVM_6_Aargh_3"						;//Aargh!
	Berzerk						=	"SVM_6_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_6_YoullBeSorryForThis"			;//Te ne pentirai!
	YesYes						=	"SVM_6_YesYes"						;//Va bene, adesso calmati: hai vinto!
	ShitWhatAMonster			=	"SVM_6_ShitWhatAMonster"			;//Che bestia! Scappa il più in fretta possibile!
	Help						=	"SVM_6_Help"						;//Maledizione!
	WeWillMeetAgain				=	"SVM_6_WeWillMeetAgain"				;//Ci rivedremo!
	NeverTryThatAgain			=	"SVM_6_NeverTryThatAgain"			;//Provaci ancora e te ne pentirai!
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"				;//Quell'arma sembra maneggevole!
	ITookYourOre				=	"SVM_6_ITookYourOre"				;//Grazie per il metallo! Brinderò in tuo onore!
	ShitNoOre					=	"SVM_6_ShitNoOre"					;//Merda! Non ha neanche del metallo...
	HandsOff					=	"SVM_6_HandsOff"					;//Giù le mani!
	GetOutOfHere				=	"SVM_6_GetOutOfHere"				;//Fuori dai piedi!
	YouViolatedForbiddenTerritory=	"SVM_6_YouViolatedForbiddenTerritory";//Ehi! Da dove salti fuori?
	YouWannaFoolMe				=	"SVM_6_YouWannaFoolMe"				;//Mi hai preso per uno stupido?
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"		;//Ehi! Cosa cerchi da queste parti?
	WhyAreYouInHere				=	"SVM_6_WhyYouAreInHere"				;//Vattene o chiamo le guardie!
	WhatDidYouInThere			=	"SVM_6_WhatDidYouInThere"			;//Cosa stai facendo qui?
	WiseMove					=	"SVM_6_WiseMove"					;//Sei stato fortunato!
	Alarm						=	"SVM_6_Alarm"						;//Guardie!!!
	IntruderAlert				= 	"SVM_6_IntruderAlert"				;//ALLARME!!! UN INTRUSO!!!
	BehindYou					=	"SVM_6_BehindYou"					;//Dietro di te!
	TheresAFight				=	"SVM_6_TheresAFight"				;//Ah! Un combattimento!
	HeyHeyHey					=	"SVM_6_HeyHeyHey"					;//Più forte!
	CheerFight					=	"SVM_6_CheerFight"					;//Combattete come donnicciole!
	CheerFriend					=	"SVM_6_CheerFriend"					;//Finiscilo!
	Ooh							=	"SVM_6_Ooh"							;//Non perdere tempo! Colpiscilo!
	YeahWellDone				=	"SVM_6_YeahWellDone"				;//Suonagliele! Si muove ancora!
	RunCoward					=	"SVM_6_RunCoward"					;//Torna qui, codardo!
	HeDefeatedHim				=	"SVM_6_HeDefeatedHim"				;//Ne ha avuto abbastanza!
	HeDeservedIt				=	"SVM_6_HeDeservedIt"				;//Gli sta bene!
	HeKilledHim					=	"SVM_6_HeKilledHim"					;//Sei spacciato! Così imparerai ad andare in giro a uccidere la gente!
	ItWasAGoodFight				=	"SVM_6_ItWasAGoodFight"				;//Ha ha ha! Beh... Gli hai proprio dato una lezione!
	Awake						=	"SVM_6_Awake"						;//Yawn!
	FriendlyGreetings			=	"SVM_6_FriendlyGreetings"			;//Salve.
	ALGreetings					=	"SVM_6_ALGreetings"					;//Per Gomez!
	MageGreetings				=	"SVM_6_MageGreetings"				;//Per la magia!
	SectGreetings				=	"SVM_6_SectGreetings"				;//Sveglia!
	ThereHeIs					= 	"SVM_6_ThereHeIs"					;//Eccolo lassù!
	NoLearnNoPoints				= 	"SVM_6_NoLearnNoPoints"				;//Non posso insegnarti nulla: non hai abbastanza esperienza.
	NoLearnOverMax				= 	"SVM_6_NoLearnOverMax"				;//Non puoi migliorare ulteriormente, in questo campo. Dovresti imparare qualcos'altro.
	NoLearnYouAlreadyKnow		=	"SVM_6_NoLearnYouAlreadyKnow"		;//Devi migliorare ancora, prima di diventare un maestro!
	NoLearnYoureBetter			=	"SVM_6_NoLearnYoureBetter"			;//Sei già abbastanza esperto!
	HeyYou						=	"SVM_6_HeyYou"						;//Ehi, tu!
	NotNow						=	"SVM_6_NotNow"						;//Non adesso!
	WhatDoYouWant				=	"SVM_6_WhatDoYouWant"				;//Cosa vuoi?
	ISaidWhatDoYouWant			=	"SVM_6_ISaidWhatDoYouWant"			;//Cosa posso fare per te?
	MakeWay						=	"SVM_6_MakeWay"						;//Fammi passare!
	OutOfMyWay					=	"SVM_6_OutOfMyWay"					;//Coraggio, fatti da parte!
	YouDeafOrWhat				=	"SVM_6_YouDeafOrWhat"				;//Sparisci o ti spacco la testa!
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"		;//Sei ancora in cerca di guai?
	LookAway					=	"SVM_6_LookAway"					;//Non ho visto nulla! Davvero!
	OkayKeepIt					=	"SVM_6_OkayKeepIt"					;//Va bene, tieniti la tua roba!
	WhatsThat					=	"SVM_6_WhatsThat"					;//Cosa è stato?
	ThatsMyWeapon				=	"SVM_6_ThatsMyWeapon"				;//Restituiscimi l'arma, buffone!
	GiveItToMe					=	"SVM_6_GiveItToMe"					;//Dalla a me, amico!
	YouCanKeeptheCrap			=	"SVM_6_YouCanKeeptheCrap"			;//Non fa nulla! Non mi serviva più!
	TheyKilledMyFriend			=	"SVM_6_TheyKilledMyFriend"			;//Hanno ucciso uno dei nostri. Se prendo quel porco...
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"		;//Maledizione, perché mi hai svegliato?
	SuckerGotSome				=	"SVM_6_SuckerGotSome"				;//Hai ricevuto una bella lezione, eh? Ben ti sta!
	SuckerDefeatedEBr			=	"SVM_6_SuckerDefeatedEBr"			;//Hai colpito un barone delle miniere! Ora è davvero infuriato con te!
	SuckerDefeatedGur			=	"SVM_6_SuckerDefeatedGur"			;//Hai colpito un guru. Attiri i guai come una calamita!
	SuckerDefeatedMage			=	"SVM_6_SuckerDefeatedMage"			;//Sfidare un mago è una pessima idea!
	SuckerDefeatedNov_Guard		= 	"SVM_6_SuckerDefeatedNov_Guard"		;//Non puoi andare in giro a colpire i novizi!
	SuckerDefeatedVlk_Guard		= 	"SVM_6_SuckerDefeatedVlk_Guard"		;//Lascia in pace i miei uomini!
	YouDefeatedMyComrade		=	"SVM_6_YouDefeatedMyComrade"		;//Hai colpito un mio amico...
	YouDefeatedNOV_Guard		=	"SVM_6_YouDefeatedNOV_Guard"		;//Il tuo comportamento non sarà tollerato!
	YouDefeatedVLK_Guard		=	"SVM_6_YouDefeatedVLK_Guard"		;//Se colpirai qualcuno sotto la mia protezione, ne subirai gli effetti!
	YouStoleFromMe				=	"SVM_6_YouStoleFromMe"				;//Bastardo, mi hai derubato! Non provarci mai più!
	YouStoleFromUs				=	"SVM_6_YouStoleFromUs"				;//Rivogliamo le nostre cose! Dammele!
	YouStoleFromEBr				=	"SVM_6_YouStoleFromEBr"				;//Hai derubato i baroni delle miniere! Cosa diavolo ti è saltato in mente?
	YouStoleFromGur				=	"SVM_6_YouStoleFromGur"				;//Hai derubato i guru? Purtroppo sei stato scoperto.
	StoleFromMage				=	"SVM_6_StoleFromMage"				;//Hai derubato i maghi! Che idea stupida!
	YouKilledMyFriend			=	"SVM_6_YouKilledMyFriend"			;//Uno dei nostri è morto e tu c'entri qualcosa! Commetti un errore qualsiasi e te ne pentirai!
	YouKilledEBr				=	"SVM_6_YouKilledEBr"				;//Hai ucciso un barone delle miniere! Sei diventato pazzo?
	YouKilledGur				=	"SVM_6_YouKilledGur"				;//Hai ucciso un guru! Non posso crederci!
	YouKilledMage				=	"SVM_6_YouKilledMage"				;//Hai ucciso un mago! Come pensi di giustificarti?
	YouKilledOCfolk				=	"SVM_6_YouKilledOCfolk"				;//Un membro di Campo Vecchio è morto e sei nell'elenco dei sospettati...
	YouKilledNCfolk				=	"SVM_6_YouKilledNCfolk"				;//C'è stata una terribile tragedia a Campo Nuovo e sembra che tu ne sia coinvolto!
	YouKilledPSIfolk			=	"SVM_6_YouKilledPSIfolk"			;//La Fratellanza conta un credente in meno e hai la sua morte sulla coscienza!
	GetThingsRight				=	"SVM_6_GetThingsRight"				;//Non sarà facile rimettere a posto le cose!
	YouDefeatedMeWell			=	"SVM_6_YouDefeatedMeWell"			;//Mi hai dato una bella lezione, amico! Mi sono divertito, ma ora basta combattere!
	Smalltalk01					=	"SVM_6_Smalltalk01"					;// ...se credi...
	Smalltalk02					=	"SVM_6_Smalltalk02"					;// ...forse...
	Smalltalk03					=	"SVM_6_Smalltalk03"					;// ...pessima idea...
	Smalltalk04					=	"SVM_6_Smalltalk04"					;// ...farò meglio a starne fuori...
	Smalltalk05					=	"SVM_6_Smalltalk05"					;// ...non è affar mio...
	Smalltalk06					=	"SVM_6_Smalltalk06"					;// ...era ovvio che ci sarebbero stati dei guai...
	Smalltalk07					=	"SVM_6_Smalltalk07"					;// ...ma tienilo per te: la gente non deve saperlo.
	Smalltalk08					=	"SVM_6_Smalltalk08"					;// ...non accadrà di nuovo...
	Smalltalk09					=	"SVM_6_Smalltalk09"					;// ...doveva esserci del vero in quella storia, dopo tutto...
	Smalltalk10					=	"SVM_6_Smalltalk10"					;// ...devi stare attento a ciò che dici in giro...
	Smalltalk11					=	"SVM_6_Smalltalk11"					;// ...dato che non mi riguarda...
	Smalltalk12					=	"SVM_6_Smalltalk12"					;// ...non dovresti credere a tutto ciò che senti...
	Smalltalk13					=	"SVM_6_Smalltalk13"					;// ...non vorrei essere nei suoi panni...
	Smalltalk14					=	"SVM_6_Smalltalk14"					;// ...sempre la stessa storia...
	Smalltalk15					=	"SVM_6_Smalltalk15"					;// ...certe persone non imparano mai...
	Smalltalk16					=	"SVM_6_Smalltalk16"					;// ...un tempo, le cose sarebbero andate diversamente...
	Smalltalk17					=	"SVM_6_Smalltalk17"					;// ...la gente parla troppo...
	Smalltalk18					=	"SVM_6_Smalltalk18"					;// ...non ascolto più le chiacchiere...
	Smalltalk19					=	"SVM_6_Smalltalk19"					;// ...fidati di qualcuno e ti ritroverai nei guai: ecco come vanno le cose...
	Smalltalk20					=	"SVM_6_Smalltalk20"					;// ...credo che non cambierà mai...
	Smalltalk21					=	"SVM_6_Smalltalk21"					;// ...probabilmente hai ragione...
	Smalltalk22					=	"SVM_6_Smalltalk22"					;// ...aspetta. Meglio non affrettarsi mai...
	Smalltalk23					=	"SVM_6_Smalltalk23"					;// ...pensavo che questa faccenda fosse stata sistemata molto tempo fa...
	Smalltalk24					=	"SVM_6_Smalltalk24"					;// ...parliamo di qualcos'altro...
	Om							= 	"SVM_6_Om"							;//Ommm!
};

//////////////////////////////////////////
instance SVM_7 (C_SVM)				//Freak, Aggressiv. Spielt mit seiner Macht. Sadist. Org: Abschaum, den im AL keiner wollte. Nov (selten): Durchgeknallter Abschaum.
{
	StopMagic					=	"SVM_7_StopMagic"					;//Smettila! Smettila!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"				;//Piantala con la magia!
	WeaponDown					=	"SVM_7_WeaponDown"					;//Metti via quell'arma! Mettila via!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"				;//Dico sul serio! Mettila via!
	WatchYourAim				=	"SVM_7_WatchYourAim"				;//Stai puntando contro di me? Attento a quel che fai!
	WatchYourAimAngry			=	"SVM_7_WatchYourAimAngry"			;//Pensi d'intimidirmi? Lascia stare!
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"				;//Me lo ricorderò! Stai attento!
	LetsForgetOurLittleFight	=	"SVM_7_LetsForgetOurLittleFight"	;//Dimentichiamo la nostra piccola discussione, va bene?
	Strange						=	"SVM_7_Strange"						;//Dove si è cacciato? Non è possibile!!!
	DieMonster					=	"SVM_7_DieMonster"					;//Ti faccio a fette, mostro!
	DieMortalEnemy				=	"SVM_7_DieMortalEnemy"				;//Ti distruggo! Tocca a te, stavolta, e non avrò pietà!
	NowWait						=	"SVM_7_NowWait"						;//Finalmente mi dai un motivo per farlo!
	YouStillNotHaveEnough		=	"SVM_7_YouStillNotHaveEnough"		;//Non ci proverai più, vero?
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Sangue! Il TUO sangue!
	NowWaitIntruder				= 	"SVM_7_NowWaitIntruder"				;//Ti faccio a fette!
	IWillTeachYouRespectForForeignProperty	=	"SVM_7_IWillTeachYouRespectForForeignProperty"	;//Dovrei tagliarti le dita!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Sporco ladro! Voglio vederti soffrire!
	YouAttackedMyCharge			=	"SVM_7_YouAttackedMyCharge"			;//Qui nessuno colpisce qualcun altro, a parte me!
	YouKilledOneOfUs			=	"SVM_7_YouKilledOneOfUs"			;//Hai ucciso uno dei nostri!
	Dead						=	"SVM_7_Dead"						;//Aaargh!
	Aargh_1						=	"SVM_7_Aargh_1"						;//Aargh!
	Aargh_2						=	"SVM_7_Aargh_2"						;//Aargh!
	Aargh_3						=	"SVM_7_Aargh_3"						;//Aargh!
	Berzerk						=	"SVM_7_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_7_YoullBeSorryForThis"			;//Non avrai nemmeno il tempo di pentirti!
	YesYes						=	"SVM_7_YesYes"						;//Va bene, va bene!
	ShitWhatAMonster			=	"SVM_7_ShitWhatAMonster"			;//Non ho l'arma giusta. Ci rivedremo...
	Help						=	"SVM_7_Help"						;//Maledizione!
	WeWillMeetAgain				=	"SVM_7_WeWillMeetAgain"				;//Ti cercherò!
	NeverTryThatAgain			=	"SVM_7_NeverTryThatAgain"			;//Non farlo mai più!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"				;//Mi terrò quest'arma!
	ITookYourOre				=	"SVM_7_ITookYourOre"				;//Preferirei ucciderti, ma il metallo non mi dispiace!
	ShitNoOre					=	"SVM_7_ShitNoOre"					;//Niente metallo? Inutile pezzente!
	HandsOff					=	"SVM_7_HandsOff"					;//Tieni giù le mani!
	GetOutOfHere				=	"SVM_7_GetOutOfHere"				;//Sparisci! Vattene!
	YouViolatedForbiddenTerritory=	"SVM_7_YouViolatedForbiddenTerritory";//Come sei entrato?
	YouWannaFoolMe				=	"SVM_7_YouWannaFoolMe"				;//Ti piace prendermi in giro, vero?
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"		;//Ehi, tu! Perché giri da queste parti?
	WhyAreYouInHere				=	"SVM_7_WhyYouAreInHere"				;//Taglia la corda o chiamo le guardie!
	WhatDidYouInThere			=	"SVM_7_WhatDidYouInThere"			;//Non hai nulla da fare, qui!
	WiseMove					=	"SVM_7_WiseMove"					;//Sei fortunato! Mi sarebbe piaciuto spaccarti il muso!
	Alarm						=	"SVM_7_Alarm"						;//Guardie! Accorrete!
	IntruderAlert				= 	"SVM_7_IntruderAlert"				;//ALLARME!
	BehindYou					=	"SVM_7_BehindYou"					;//Dietro di te!
	TheresAFight				=	"SVM_7_TheresAFight"				;//Un combattimento!
	HeyHeyHey					=	"SVM_7_HeyHeyHey"					;//Più forte!
	CheerFight					=	"SVM_7_CheerFight"					;//Voglio vedere il sangue!
	CheerFriend					=	"SVM_7_CheerFriend"					;//Fallo fuori!
	Ooh							=	"SVM_7_Ooh"							;//Contrattacca, idiota!
	YeahWellDone				=	"SVM_7_YeahWellDone"				;//Siiii!
	RunCoward					=	"SVM_7_RunCoward"					;//Corri dalla mamma!
	HeDefeatedHim				=	"SVM_7_HeDefeatedHim"				;//Ne ha avuto abbastanza!
	HeDeservedIt				=	"SVM_7_HeDeservedIt"				;//Tutta colpa tua!
	HeKilledHim					=	"SVM_7_HeKilledHim"					;//Uccidere qualcuno davanti a dei testimoni è un vero e proprio suicidio.
	ItWasAGoodFight				=	"SVM_7_ItWasAGoodFight"				;//Bel combattimento!
	Awake						=	"SVM_7_Awake"						;//È tempo d'alzarsi!
	FriendlyGreetings			=	"SVM_7_FriendlyGreetings"			;//Salve!
	ALGreetings					=	"SVM_7_ALGreetings"					;//Per Gomez!
	MageGreetings				=	"SVM_7_MageGreetings"				;//Per la magia!
	SectGreetings				=	"SVM_7_SectGreetings"				;//Sveglia!
	ThereHeIs					= 	"SVM_7_ThereHeIs"					;//Sei cieco? Eccolo lassù!
	NoLearnNoPoints				= 	"SVM_7_NoLearnNoPoints"				;//Non posso insegnarti nulla: non hai abbastanza esperienza.
	NoLearnOverMax				= 	"SVM_7_NoLearnOverMax"				;//Non puoi migliorare ulteriormente, in questo campo. Dovresti imparare qualcos'altro.
	NoLearnYouAlreadyKnow		=	"SVM_7_NoLearnYouAlreadyKnow"		;//Devi migliorare ancora, prima di diventare un maestro!
	NoLearnYoureBetter			=	"SVM_7_NoLearnYoureBetter"			;//Sei già abbastanza esperto!
	HeyYou						=	"SVM_7_HeyYou"						;//Ehi, tu!
	NotNow						=	"SVM_7_NotNow"						;//Non adesso!
	WhatDoYouWant				=	"SVM_7_WhatDoYouWant"				;//Cosa vuoi?
	ISaidWhatDoYouWant			=	"SVM_7_ISaidWhatDoYouWant"			;//Cosa posso fare per te?
	MakeWay						=	"SVM_7_MakeWay"						;//Fammi passare!
	OutOfMyWay					=	"SVM_7_OutOfMyWay"					;//Fuori dai piedi!
	YouDeafOrWhat				=	"SVM_7_YouDeafOrWhat"				;//Cerchi guai? Vattene da qui!
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"		;//Sei ancora in cerca di guai?
	LookAway					=	"SVM_7_LookAway"					;//Non ho visto NULLA!
	OkayKeepIt					=	"SVM_7_OkayKeepIt"					;//Va bene, va bene! Smettila!
	WhatsThat					=	"SVM_7_WhatsThat"					;//Cosa è stato?
	ThatsMyWeapon				=	"SVM_7_ThatsMyWeapon"				;//Restituiscimi l'arma!
	GiveItToMe					=	"SVM_7_GiveItToMe"					;//Dammela!
	YouCanKeeptheCrap			=	"SVM_7_YouCanKeeptheCrap"			;//D'accordo, tienitela! Troverò un'altra soluzione!
	TheyKilledMyFriend			=	"SVM_7_TheyKilledMyFriend"			;//Uno dei nostri è morto e grida vendetta!
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"		;//Perché mi hai svegliato?
	SuckerGotSome				=	"SVM_7_SuckerGotSome"				;//Ben ti sta!
	SuckerDefeatedEBr			=	"SVM_7_SuckerDefeatedEBr"			;//Hai colpito un barone delle miniere! Ora è davvero infuriato con te!
	SuckerDefeatedGur			=	"SVM_7_SuckerDefeatedGur"			;//Hai colpito un guru. Attiri i guai come una calamita!
	SuckerDefeatedMage			=	"SVM_7_SuckerDefeatedMage"			;//Sfidare un mago è una pessima idea!
	SuckerDefeatedNov_Guard		= 	"SVM_7_SuckerDefeatedNov_Guard"		;//Sei tu quello che attacca i novizi!
	SuckerDefeatedVlk_Guard		= 	"SVM_7_SuckerDefeatedVlk_Guard"		;//Lascia in pace i miei uomini!
	YouDefeatedMyComrade		=	"SVM_7_YouDefeatedMyComrade"		;//Hai attaccato la persona sbagliata! Te la farò pagare!
	YouDefeatedNOV_Guard		=	"SVM_7_YouDefeatedNOV_Guard"		;//Il tuo comportamento non sarà tollerato!
	YouDefeatedVLK_Guard		=	"SVM_7_YouDefeatedVLK_Guard"		;//Se colpirai qualcuno sotto la mia protezione, ne subirai gli effetti!
	YouStoleFromMe				=	"SVM_7_YouStoleFromMe"				;//Mi hai derubato! Non provarci mai più!
	YouStoleFromUs				=	"SVM_7_YouStoleFromUs"				;//Rivogliamo le nostre cose! Daccele!
	YouStoleFromEBr				=	"SVM_7_YouStoleFromEBr"				;//Hai derubato i baroni delle miniere! Cosa diavolo ti è saltato in mente?
	YouStoleFromGur				=	"SVM_7_YouStoleFromGur"				;//Hai derubato i guru? Purtroppo sei stato scoperto.
	StoleFromMage				=	"SVM_7_StoleFromMage"				;//Hai derubato i maghi! Che idea stupida!
	YouKilledMyFriend			=	"SVM_7_YouKilledMyFriend"			;//Uno dei nostri è morto e tu c'entri qualcosa! Commetti un errore qualsiasi e te ne pentirai!
	YouKilledEBr				=	"SVM_7_YouKilledEBr"				;//Hai ucciso un barone delle miniere! Sei diventato pazzo?
	YouKilledGur				=	"SVM_7_YouKilledGur"				;//Hai ucciso un guru! Non posso crederci!
	YouKilledMage				=	"SVM_7_YouKilledMage"				;//Hai ucciso un mago! Come pensi di giustificarti?
	YouKilledOCfolk				=	"SVM_7_YouKilledOCfolk"				;//Un membro di Campo Vecchio è morto e sei nell'elenco dei sospettati...
	YouKilledNCfolk				=	"SVM_7_YouKilledNCfolk"				;//C'è stata una terribile tragedia a Campo Nuovo e sembra che tu ne sia coinvolto!
	YouKilledPSIfolk			=	"SVM_7_YouKilledPSIfolk"			;//La Fratellanza conta un credente in meno e hai la sua morte sulla coscienza!
	GetThingsRight				=	"SVM_7_GetThingsRight"				;//Non sarà facile rimettere a posto le cose!
	YouDefeatedMeWell			=	"SVM_7_YouDefeatedMeWell"			;//Mi hai dato una bella lezione, amico! Mi sono divertito, ma ora basta combattere!
	Smalltalk01					=	"SVM_7_Smalltalk01"					;// ...se credi...
	Smalltalk02					=	"SVM_7_Smalltalk02"					;// ...forse...
	Smalltalk03					=	"SVM_7_Smalltalk03"					;// ...pessima idea...
	Smalltalk04					=	"SVM_7_Smalltalk04"					;// ...farò meglio a starne fuori...
	Smalltalk05					=	"SVM_7_Smalltalk05"					;// ...non è affar mio...
	Smalltalk06					=	"SVM_7_Smalltalk06"					;// ...era ovvio che ci sarebbero stati dei guai...
	Smalltalk07					=	"SVM_7_Smalltalk07"					;// ...ma tienilo per te: la gente non deve saperlo.
	Smalltalk08					=	"SVM_7_Smalltalk08"					;// ...non accadrà di nuovo...
	Smalltalk09					=	"SVM_7_Smalltalk09"					;// ...doveva esserci del vero in quella storia, dopo tutto...
	Smalltalk10					=	"SVM_7_Smalltalk10"					;// ...devi stare attento a ciò che dici in giro...
	Smalltalk11					=	"SVM_7_Smalltalk11"					;// ...dato che non mi riguarda...
	Smalltalk12					=	"SVM_7_Smalltalk12"					;// ...non dovresti credere a tutto ciò che senti...
	Smalltalk13					=	"SVM_7_Smalltalk13"					;// ...non vorrei essere nei suoi panni...
	Smalltalk14					=	"SVM_7_Smalltalk14"					;// ...sempre la stessa storia...
	Smalltalk15					=	"SVM_7_Smalltalk15"					;// ...certe persone non imparano mai...
	Smalltalk16					=	"SVM_7_Smalltalk16"					;// ...un tempo, le cose sarebbero andate diversamente...
	Smalltalk17					=	"SVM_7_Smalltalk17"					;// ...la gente parla troppo...
	Smalltalk18					=	"SVM_7_Smalltalk18"					;// ...non ascolto più le chiacchiere...
	Smalltalk19					=	"SVM_7_Smalltalk19"					;// ...fidati di qualcuno e ti ritroverai nei guai: ecco come vanno le cose...
	Smalltalk20					=	"SVM_7_Smalltalk20"					;// ...credo che non cambierà mai...
	Smalltalk21					=	"SVM_7_Smalltalk21"					;// ...probabilmente hai ragione...
	Smalltalk22					=	"SVM_7_Smalltalk22"					;// ...aspetta. Meglio non affrettarsi mai...
	Smalltalk23					=	"SVM_7_Smalltalk23"					;// ...pensavo che questa faccenda fosse stata sistemata molto tempo fa...
	Smalltalk24					=	"SVM_7_Smalltalk24"					;// ...parliamo di qualcos'altro...
	Om							= 	"SVM_7_Om"							;//Ommm!
};

//////////////////////////////////////////
instance SVM_8 (C_SVM)				// Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, nüchtern! Klare Stimme
{
	StopMagic					=	"SVM_8_StopMagic"					;//Non usare la magia su di me!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"				;//Ho detto smettila! Subito!
	WeaponDown					=	"SVM_8_WeaponDown"					;//Abbassa quell'arma!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"				;//Allontana quell'affare o sei finito!
	WatchYourAim				=	"SVM_8_WatchYourAim"				;//Abbassa quell'arma, idiota!
	WatchYourAimAngry			=	"SVM_8_WatchYourAimAngry"			;//Tu, verme schifoso, osi puntare la tua arma su di me?
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"				;//Attento!
	LetsForgetOurLittleFight	=	"SVM_8_LetsForgetOurLittleFight"	;//Dimentichiamo la nostra piccola discussione!
	Strange						=	"SVM_8_Strange"						;//Fatti vedere! Lo so che mi senti!
	DieMonster					=	"SVM_8_DieMonster"					;//Dannate creature!
	DieMortalEnemy				=	"SVM_8_DieMortalEnemy"				;//Ora morirai! Niente di personale, ovviamente!
	NowWait						=	"SVM_8_NowWait"						;//Verme schifoso! Tu attacchi ME? Ora vedrai...
	YouStillNotHaveEnough		=	"SVM_8_YouStillNotHaveEnough"		;//Non ti ho già fatto mangiare la polvere una volta? Ne vuoi ancora?
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Se non vuoi ascoltare, avrai ciò che meriti!
	NowWaitIntruder				= 	"SVM_8_NowWaitIntruder"				;//Osi venire QUI? Aspetta un attimo!
	IWillTeachYouRespectForForeignProperty	=	"SVM_8_IWillTeachYouRespectForForeignProperty"	;//Ti spezzo le dita!
	DirtyThief					=	"SVM_8_DirtyThief"					;//Non avresti mai dovuto rubare!
	YouAttackedMyCharge			=	"SVM_8_YouAttackedMyCharge"			;//Nessuno picchia i miei uomini senza pentirsene!
	YouKilledOneOfUs			=	"SVM_8_YouKilledOneOfUs"			;//Uccidere uno dei nostri è stato il tuo ultimo errore!
	Dead						=	"SVM_8_Dead"						;//Aaargh!
	Aargh_1						=	"SVM_8_Aargh_1"						;//Aargh!
	Aargh_2						=	"SVM_8_Aargh_2"						;//Aargh!
	Aargh_3						=	"SVM_8_Aargh_3"						;//Aargh!
	Berzerk						=	"SVM_8_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_8_YoullBeSorryForThis"			;//Te ne pentirai!
	YesYes						=	"SVM_8_YesYes"						;//Tutto a posto!
	ShitWhatAMonster			=	"SVM_8_ShitWhatAMonster"			;//Meglio guardare questo mostro da lontano!
	Help						=	"SVM_8_Help"						;//Fuori di qui, presto!
	WeWillMeetAgain				=	"SVM_8_WeWillMeetAgain"				;//Ci rivedremo ancora!
	NeverTryThatAgain			=	"SVM_8_NeverTryThatAgain"			;//Riprovaci e sei morto!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"				;//Mi piace quest'arma!
	ITookYourOre				=	"SVM_8_ITookYourOre"				;//Non hai ancora pagato la mia tassa personale sui metalli!
	ShitNoOre					=	"SVM_8_ShitNoOre"					;//Ovviamente, un perdente come te non ha metallo!
	HandsOff					=	"SVM_8_HandsOff"					;//Giù le mani!
	GetOutOfHere				=	"SVM_8_GetOutOfHere"				;//Fuori dai piedi!
	YouViolatedForbiddenTerritory=	"SVM_8_YouViolatedForbiddenTerritory";//Ehi! Come sei entrato?
	YouWannaFoolMe				=	"SVM_8_YouWannaFoolMe"				;//Ti credi molto furbo, vero?
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"		;//Ehi, tu! Perché giri da queste parti?
	WhyAreYouInHere				=	"SVM_8_WhyYouAreInHere"				;//Taglia la corda o chiamo le guardie!
	WhatDidYouInThere			=	"SVM_8_WhatDidYouInThere"			;//Cosa stai facendo qui?
	WiseMove					=	"SVM_8_WiseMove"					;//Sei stato fortunato.
	Alarm						=	"SVM_8_Alarm"						;//Guardie!
	IntruderAlert				= 	"SVM_8_IntruderAlert"				;//UN INTRUSO!!!
	BehindYou					=	"SVM_8_BehindYou"					;//Dietro di te!
	TheresAFight				=	"SVM_8_TheresAFight"				;//Vediamo chi combatte!
	HeyHeyHey					=	"SVM_8_HeyHeyHey"					;//Più forte!
	CheerFight					=	"SVM_8_CheerFight"					;//Andiamo, andiamo!
	CheerFriend					=	"SVM_8_CheerFriend"					;//Bene! Non mollare!
	Ooh							=	"SVM_8_Ooh"							;//Non perdere tempo! Rompigli il muso!
	YeahWellDone				=	"SVM_8_YeahWellDone"				;//Suonagliele! Si muove ancora!
	RunCoward					=	"SVM_8_RunCoward"					;//Non farti più vedere da queste parti!
	HeDefeatedHim				=	"SVM_8_HeDefeatedHim"				;//Che combattimento noioso!
	HeDeservedIt				=	"SVM_8_HeDeservedIt"				;//Gli sta bene!
	HeKilledHim					=	"SVM_8_HeKilledHim"					;//Ucciderlo non era necessario. Ora ne pagherai le conseguenze.
	ItWasAGoodFight				=	"SVM_8_ItWasAGoodFight"				;//È stato un bel combattimento!
	Awake						=	"SVM_8_Awake"						;//Yawn!
	FriendlyGreetings			=	"SVM_8_FriendlyGreetings"			;//Salve!
	ALGreetings					=	"SVM_8_ALGreetings"					;//Per Gomez!
	MageGreetings				=	"SVM_8_MageGreetings"				;//Per la magia!
	SectGreetings				=	"SVM_8_SectGreetings"				;//Sveglia!
	ThereHeIs					= 	"SVM_8_ThereHeIs"					;//Eccolo lassù!
	NoLearnNoPoints				= 	"SVM_8_NoLearnNoPoints"				;//Non posso insegnarti nulla: non hai abbastanza esperienza.
	NoLearnOverMax				= 	"SVM_8_NoLearnOverMax"				;//Non puoi migliorare ulteriormente, in questo campo. Dovresti imparare qualcos'altro.
	NoLearnYouAlreadyKnow		=	"SVM_8_NoLearnYouAlreadyKnow"		;//Devi migliorare ancora, prima di diventare un maestro!
	NoLearnYoureBetter			=	"SVM_8_NoLearnYoureBetter"			;//Sei già abbastanza esperto!
	HeyYou						=	"SVM_8_HeyYou"						;//Ehi, tu!
	NotNow						=	"SVM_8_NotNow"						;//Non adesso!
	WhatDoYouWant				=	"SVM_8_WhatDoYouWant"				;//Cosa vuoi?
	ISaidWhatDoYouWant			=	"SVM_8_ISaidWhatDoYouWant"			;//Cosa posso fare per te?
	MakeWay						=	"SVM_8_MakeWay"						;//Posso passare?
	OutOfMyWay					=	"SVM_8_OutOfMyWay"					;//Fatti da parte!
	YouDeafOrWhat				=	"SVM_8_YouDeafOrWhat"				;//Vuoi che ti spacchi la testa? Vattene via!
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"		;//Sei ancora in cerca di guai?
	LookAway					=	"SVM_8_LookAway"					;//Ehm... Ottima vista!
	OkayKeepIt					=	"SVM_8_OkayKeepIt"					;//Va bene, è tutta tua!
	WhatsThat					=	"SVM_8_WhatsThat"					;//Ehi! Cos'è stato?
	ThatsMyWeapon				=	"SVM_8_ThatsMyWeapon"				;//Quella è la mia arma!
	GiveItToMe					=	"SVM_8_GiveItToMe"					;//Restituiscimela subito!
	YouCanKeeptheCrap			=	"SVM_8_YouCanKeeptheCrap"			;//Tienila, tanto non mi serve!
	TheyKilledMyFriend			=	"SVM_8_TheyKilledMyFriend"			;//Hanno ucciso uno dei nostri. Se prendo quel porco...
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"		;//Che succede?
	SuckerGotSome				=	"SVM_8_SuckerGotSome"				;//Ti hanno dato una bella ripassata, eh? Ben ti sta!
	SuckerDefeatedEBr			=	"SVM_8_SuckerDefeatedEBr"			;//Hai battuto un barone delle miniere! Deve esserci rimasto di stucco!
	SuckerDefeatedGur			=	"SVM_8_SuckerDefeatedGur"			;//Hai sconfitto un guru! Sono impressionato, ma non provarci mai più.
	SuckerDefeatedMage			=	"SVM_8_SuckerDefeatedMage"			;//Hai battuto un mago... Devi essere un tipo coraggioso!
	SuckerDefeatedNov_Guard		= 	"SVM_8_SuckerDefeatedNov_Guard"		;//Sai benissimo che i novizi sono sotto la mia protezione, perché continui ad attaccarli?
	SuckerDefeatedVlk_Guard		= 	"SVM_8_SuckerDefeatedVlk_Guard"		;//Attaccando i minatori metti in pericolo i miei profitti!
	YouDefeatedMyComrade		=	"SVM_8_YouDefeatedMyComrade"		;//Non dovresti dar fastidio ai miei amici.
	YouDefeatedNOV_Guard		=	"SVM_8_YouDefeatedNOV_Guard"		;//Alza le mani su un altro novizio e te ne pentirai!
	YouDefeatedVLK_Guard		=	"SVM_8_YouDefeatedVLK_Guard"		;//Attacca un altro dei miei protetti e pagherai con la vita!
	YouStoleFromMe				=	"SVM_8_YouStoleFromMe"				;//Osi tornare da queste parti, sporco ladro?
	YouStoleFromUs				=	"SVM_8_YouStoleFromUs"				;//Hai degli oggetti che ci appartengono. Farai meglio a ridarceli.
	YouStoleFromEBr				=	"SVM_8_YouStoleFromEBr"				;//Hai derubato i baroni delle miniere! Saranno infuriati!
	YouStoleFromGur				=	"SVM_8_YouStoleFromGur"				;//Hai derubato i guru, vero?
	StoleFromMage				=	"SVM_8_StoleFromMage"				;//Hai derubato i maghi, vero?
	YouKilledMyFriend			=	"SVM_8_YouKilledMyFriend"			;//Hai uno dei nostri sulla coscienza. Commetti un altro errore e sarà il tuo turno!
	YouKilledEBr				=	"SVM_8_YouKilledEBr"				;//Hai ucciso un barone delle miniere! Sei diventato pazzo?
	YouKilledGur				=	"SVM_8_YouKilledGur"				;//Hai ucciso un guru! Non posso crederci!
	YouKilledMage				=	"SVM_8_YouKilledMage"				;//Hai ucciso un mago! Come pensi di giustificarti?
	YouKilledOCfolk				=	"SVM_8_YouKilledOCfolk"				;//Un membro di Campo Vecchio è morto e sei nell'elenco dei sospettati...
	YouKilledNCfolk				=	"SVM_8_YouKilledNCfolk"				;//C'è stata una terribile tragedia a Campo Nuovo e sembra che tu ne sia coinvolto!
	YouKilledPSIfolk			=	"SVM_8_YouKilledPSIfolk"			;//La Fratellanza conta un credente in meno e hai la sua morte sulla coscienza!
	GetThingsRight				=	"SVM_8_GetThingsRight"				;//Non sarà facile rimettere a posto le cose!
	YouDefeatedMeWell			=	"SVM_8_YouDefeatedMeWell"			;//Mi hai dato una bella lezione, amico! Mi sono divertito, ma ora basta combattere!
	Smalltalk01					=	"SVM_8_Smalltalk01"					;// ...se credi...
	Smalltalk02					=	"SVM_8_Smalltalk02"					;// ...forse...
	Smalltalk03					=	"SVM_8_Smalltalk03"					;// ...pessima idea...
	Smalltalk04					=	"SVM_8_Smalltalk04"					;// ...farò meglio a starne fuori...
	Smalltalk05					=	"SVM_8_Smalltalk05"					;// ...non è affar mio...
	Smalltalk06					=	"SVM_8_Smalltalk06"					;// ...era ovvio che ci sarebbero stati dei guai...
	Smalltalk07					=	"SVM_8_Smalltalk07"					;// ...ma tienilo per te: la gente non deve saperlo.
	Smalltalk08					=	"SVM_8_Smalltalk08"					;// ...non accadrà di nuovo...
	Smalltalk09					=	"SVM_8_Smalltalk09"					;// ...doveva esserci del vero in quella storia, dopo tutto...
	Smalltalk10					=	"SVM_8_Smalltalk10"					;// ...devi stare attento a ciò che dici in giro...
	Smalltalk11					=	"SVM_8_Smalltalk11"					;// ...dato che non mi riguarda...
	Smalltalk12					=	"SVM_8_Smalltalk12"					;// ...non dovresti credere a tutto ciò che senti...
	Smalltalk13					=	"SVM_8_Smalltalk13"					;// ...non vorrei essere nei suoi panni...
	Smalltalk14					=	"SVM_8_Smalltalk14"					;// ...sempre la stessa storia...
	Smalltalk15					=	"SVM_8_Smalltalk15"					;// ...certe persone non imparano mai...
	Smalltalk16					=	"SVM_8_Smalltalk16"					;// ...un tempo, le cose sarebbero andate diversamente...
	Smalltalk17					=	"SVM_8_Smalltalk17"					;// ...la gente parla troppo...
	Smalltalk18					=	"SVM_8_Smalltalk18"					;// ...non ascolto più le chiacchiere...
	Smalltalk19					=	"SVM_8_Smalltalk19"					;// ...fidati di qualcuno e ti ritroverai nei guai: ecco come vanno le cose...
	Smalltalk20					=	"SVM_8_Smalltalk20"					;// ...credo che non cambierà mai...
	Smalltalk21					=	"SVM_8_Smalltalk21"					;// ...probabilmente hai ragione...
	Smalltalk22					=	"SVM_8_Smalltalk22"					;// ...aspetta. Meglio non affrettarsi mai...
	Smalltalk23					=	"SVM_8_Smalltalk23"					;// ...pensavo che questa faccenda fosse stata sistemata molto tempo fa...
	Smalltalk24					=	"SVM_8_Smalltalk24"					;// ...parliamo di qualcos'altro...
	Om							= 	"SVM_8_Om"							;//Ommm!
};


instance SVM_9 (C_SVM)				// brummig		   gemütlicher Hüne, Besonnen, Brummiger Bär, Einfacher	Mensch
{
	StopMagic					=	"SVM_9_StopMagic"					;//Non voglio nessuna magia dalle mie parti!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"				;//Ho detto smettila! Subito!
	WeaponDown					=	"SVM_9_WeaponDown"					;//Hai intenzione di attaccarmi?
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"				;//Metti via quell'arma o preferisci che ti spacchi il muso?
	WatchYourAim				=	"SVM_9_WatchYourAim"				;//Puntala da qualche altra parte!
	WatchYourAimAngry			=	"SVM_9_WatchYourAimAngry"			;//Metti via quell'affare!
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"				;//Ehi, attento!
	LetsForgetOurLittleFight	=	"SVM_9_LetsForgetOurLittleFight"	;//I wouldn't mind forgetting about this little argument ...
	Strange						=	"SVM_9_Strange"						;//Fatti vedere! Lo so che puoi sentirmi!
	DieMonster					=	"SVM_9_DieMonster"					;//Questi mostri sono densi come il fango!
	DieMortalEnemy				=	"SVM_9_DieMortalEnemy"				;//Sei spacciato!
	NowWait						=	"SVM_9_NowWait"						;//Ora ti faccio vedere io!
	YouStillNotHaveEnough		=	"SVM_9_YouStillNotHaveEnough"		;//Sei dannatamente ostinato!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Se non vuoi ascoltare, avrai ciò che meriti!
	NowWaitIntruder				= 	"SVM_9_NowWaitIntruder"				;//Ora ti prendo, intruso!
	IWillTeachYouRespectForForeignProperty	=	"SVM_9_IWillTeachYouRespectForForeignProperty"	;//Ti avevo avvertito: tocca la mia roba e sarai nei guai!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Ladro! Ti finirò!
	YouAttackedMyCharge			=	"SVM_9_YouAttackedMyCharge"			;//Nessuno attacca i miei uomini!
	YouKilledOneOfUs			=	"SVM_9_YouKilledOneOfUs"			;//Hai ucciso uno dei miei uomini. Ora io ucciderò TE!
	Dead						=	"SVM_9_Dead"						;//Aaargh!
	Aargh_1						=	"SVM_9_Aargh_1"						;//Aargh!
	Aargh_2						=	"SVM_9_Aargh_2"						;//Aargh!
	Aargh_3						=	"SVM_9_Aargh_3"						;//Aargh!
	Berzerk						=	"SVM_9_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_9_YoullBeSorryForThis"			;//Sei morto e non te ne sei accorto.
	YesYes						=	"SVM_9_YesYes"						;//Tutto a posto!
	ShitWhatAMonster			=	"SVM_9_ShitWhatAMonster"			;//Merda! Che mostro!
	Help						=	"SVM_9_Help"						;//Fuori di qui, presto!
	WeWillMeetAgain				=	"SVM_9_WeWillMeetAgain"				;//Ci si rivede sempre!
	NeverTryThatAgain			=	"SVM_9_NeverTryThatAgain"			;//La prossima volta ti ucciderò!
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"				;//Ora quest'arma è mia!
	ITookYourOre				=	"SVM_9_ITookYourOre"				;//Metallo! Beh... Meglio che niente!
	ShitNoOre					=	"SVM_9_ShitNoOre"					;//Non ha neppure del metallo!
	HandsOff					=	"SVM_9_HandsOff"					;//Giù le mani, amico!
	GetOutOfHere				=	"SVM_9_GetOutOfHere"				;//Fuori dai piedi!
	YouViolatedForbiddenTerritory=	"SVM_9_YouViolatedForbiddenTerritory";//Cosa ci fai qui?
	YouWannaFoolMe				=	"SVM_9_YouWannaFoolMe"				;//Vuoi prendermi in giro, amico?
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"		;//Ehi, tu! Perché giri da queste parti?
	WhyAreYouInHere				=	"SVM_9_WhyYouAreInHere"				;//Vattene o chiamo le guardie!
	WhatDidYouInThere			=	"SVM_9_WhatDidYouInThere"			;//Cosa stai facendo qui?
	WiseMove					=	"SVM_9_WiseMove"					;//Ottima idea!
	Alarm						=	"SVM_9_Alarm"						;//Guardie!
	IntruderAlert				= 	"SVM_9_IntruderAlert"				;//UN INTRUSO!!!
	BehindYou					=	"SVM_9_BehindYou"					;//Dietro di te!
	TheresAFight				=	"SVM_9_TheresAFight"				;//Vediamo come se la cavano...
	HeyHeyHey					=	"SVM_9_HeyHeyHey"					;//Piantala!
	CheerFight					=	"SVM_9_CheerFight"					;//Andiamo, andiamo!
	CheerFriend					=	"SVM_9_CheerFriend"					;//Bene!
	Ooh							=	"SVM_9_Ooh"							;//Ehi, quello è andato proprio a segno!
	YeahWellDone				=	"SVM_9_YeahWellDone"				;//Ottimo controllo, ragazzo!
	RunCoward					=	"SVM_9_RunCoward"					;//Non farti più vedere da queste parti!
	HeDefeatedHim				=	"SVM_9_HeDefeatedHim"				;//L'esito del combattimento è stato deciso.
	HeDeservedIt				=	"SVM_9_HeDeservedIt"				;//Tutta colpa tua!
	HeKilledHim					=	"SVM_9_HeKilledHim"					;//Ucciderlo non era necessario. Ora ne pagherai le conseguenze.
	ItWasAGoodFight				=	"SVM_9_ItWasAGoodFight"				;//È stato un bel combattimento!
	Awake						=	"SVM_9_Awake"						;//Yawn!
	FriendlyGreetings			=	"SVM_9_FriendlyGreetings"			;//Salve!
	ALGreetings					=	"SVM_9_ALGreetings"					;//Per Gomez!
	MageGreetings				=	"SVM_9_MageGreetings"				;//Per la magia!
	SectGreetings				=	"SVM_9_SectGreetings"				;//Sveglia!
	ThereHeIs					= 	"SVM_13_ThereHeIs"					;//Sei cieco? Eccolo lassù!
	NoLearnNoPoints				= 	"SVM_9_NoLearnNoPoints"				;//Non posso insegnarti nulla: non hai abbastanza esperienza.
	NoLearnOverMax				= 	"SVM_9_NoLearnOverMax"				;//Non puoi migliorare ulteriormente, in questo campo. Dovresti imparare qualcos'altro.
	NoLearnYouAlreadyKnow		=	"SVM_9_NoLearnYouAlreadyKnow"		;//Devi migliorare ancora, prima di diventare un maestro!
	NoLearnYoureBetter			=	"SVM_9_NoLearnYoureBetter"			;//Sei già abbastanza esperto!
	HeyYou						=	"SVM_9_HeyYou"						;//Ehi, tu!
	NotNow						=	"SVM_9_NotNow"						;//Non adesso!
	WhatDoYouWant				=	"SVM_9_WhatDoYouWant"				;//Cosa vuoi?
	ISaidWhatDoYouWant			=	"SVM_9_ISaidWhatDoYouWant"			;//Cosa posso fare per te?
	MakeWay						=	"SVM_9_MakeWay"						;//Fammi passare!
	OutOfMyWay					=	"SVM_9_OutOfMyWay"					;//Fatti da parte!
	YouDeafOrWhat				=	"SVM_9_YouDeafOrWhat"				;//Andiamo, togliti di mezzo!
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"		;//Sei ancora in cerca di guai? Perché te la prendi sempre con me?
	LookAway					=	"SVM_9_LookAway"					;//Bellissima giornata, oggi!
	OkayKeepIt					=	"SVM_9_OkayKeepIt"					;//Va bene, è tutta tua!
	WhatsThat					=	"SVM_9_WhatsThat"					;//Cosa è stato?
	ThatsMyWeapon				=	"SVM_9_ThatsMyWeapon"				;//Conterò fino a tre e tu mi ridarai l'arma.
	GiveItToMe					=	"SVM_9_GiveItToMe"					;//Restituiscimela subito!
	YouCanKeeptheCrap			=	"SVM_9_YouCanKeeptheCrap"			;//Tienila, tanto non mi serve!
	TheyKilledMyFriend			=	"SVM_9_TheyKilledMyFriend"			;//Hanno ucciso uno dei nostri. Se prendo quel porco...
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"		;//Che succede?
	SuckerGotSome				=	"SVM_9_SuckerGotSome"				;//Ti hanno dato una bella ripassata, eh? Ben ti sta!
	SuckerDefeatedEBr			=	"SVM_9_SuckerDefeatedEBr"			;//Hai battuto un barone delle miniere! Deve esserci rimasto di stucco!
	SuckerDefeatedGur			=	"SVM_9_SuckerDefeatedGur"			;//Hai sconfitto un guru! Sono impressionato, ma non provarci mai più.
	SuckerDefeatedMage			=	"SVM_9_SuckerDefeatedMage"			;//Hai battuto un mago... Devi essere un tipo coraggioso!
	SuckerDefeatedNov_Guard		= 	"SVM_9_SuckerDefeatedNov_Guard"		;//Devi essere pazzo a colpire un novizio.
	SuckerDefeatedVlk_Guard		= 	"SVM_9_SuckerDefeatedVlk_Guard"		;//Cosa pensavi di ottenere, battendo un minatore?
	YouDefeatedMyComrade		=	"SVM_9_YouDefeatedMyComrade"		;//Perché hai colpito uno dei miei amici?
	YouDefeatedNOV_Guard		=	"SVM_9_YouDefeatedNOV_Guard"		;//Alza le mani su un altro novizio e te ne pentirai!
	YouDefeatedVLK_Guard		=	"SVM_9_YouDefeatedVLK_Guard"		;//Toccare uno dei miei protetti è molto pericoloso.
	YouStoleFromMe				=	"SVM_9_YouStoleFromMe"				;//Osi tornare da queste parti, sporco ladro?
	YouStoleFromUs				=	"SVM_9_YouStoleFromUs"				;//Derubarci è stata la cosa peggiore che potessi fare. Te ne pentirai!
	YouStoleFromEBr				=	"SVM_9_YouStoleFromEBr"				;//Hai derubato i baroni delle miniere! Saranno infuriati!
	YouStoleFromGur				=	"SVM_9_YouStoleFromGur"				;//Hai derubato i guru, vero?
	StoleFromMage				=	"SVM_9_StoleFromMage"				;//Hai derubato i maghi, vero?
	YouKilledMyFriend			=	"SVM_9_YouKilledMyFriend"			;//Hai uno dei nostri sulla coscienza. Commetti un altro errore e sarà il tuo turno!
	YouKilledEBr				=	"SVM_9_YouKilledEBr"				;//Hai ucciso un barone delle miniere! Sei diventato pazzo?
	YouKilledGur				=	"SVM_9_YouKilledGur"				;//Hai ucciso un guru! Non posso crederci!
	YouKilledMage				=	"SVM_9_YouKilledMage"				;//Hai ucciso un mago! Come pensi di giustificarti?
	YouKilledOCfolk				=	"SVM_9_YouKilledOCfolk"				;//Un membro di Campo Vecchio è morto e sei nell'elenco dei sospettati...
	YouKilledNCfolk				=	"SVM_9_YouKilledNCfolk"				;//C'è stata una terribile tragedia a Campo Nuovo e sembra che tu ne sia coinvolto!
	YouKilledPSIfolk			=	"SVM_9_YouKilledPSIfolk"			;//La Fratellanza conta un credente in meno e hai la sua morte sulla coscienza!
	GetThingsRight				=	"SVM_9_GetThingsRight"				;//Non sarà facile rimettere a posto le cose!
	YouDefeatedMeWell			=	"SVM_9_YouDefeatedMeWell"			;//Bel combattimento. Il tuo allenamento è servito!
	Smalltalk01					=	"SVM_9_Smalltalk01"					;// ...sì, se la pensi così...
	Smalltalk02					=	"SVM_9_Smalltalk02"					;// ...forse...
	Smalltalk03					=	"SVM_9_Smalltalk03"					;// ...pessima idea...
	Smalltalk04					=	"SVM_9_Smalltalk04"					;// ...farò meglio a starne fuori...
	Smalltalk05					=	"SVM_9_Smalltalk05"					;// ...non è affar mio...
	Smalltalk06					=	"SVM_9_Smalltalk06"					;// ...era ovvio che ci sarebbero stati dei guai...
	Smalltalk07					=	"SVM_9_Smalltalk07"					;// ...ma tienilo per te: la gente non deve saperlo.
	Smalltalk08					=	"SVM_9_Smalltalk08"					;// ...non accadrà di nuovo...
	Smalltalk09					=	"SVM_9_Smalltalk09"					;// ...doveva esserci del vero in quella storia, dopo tutto...
	Smalltalk10					=	"SVM_9_Smalltalk10"					;// ...devi stare attento a ciò che dici in giro...
	Smalltalk11					=	"SVM_9_Smalltalk11"					;// ...dato che non mi riguarda...
	Smalltalk12					=	"SVM_9_Smalltalk12"					;// ...non dovresti credere a tutto ciò che senti...
	Smalltalk13					=	"SVM_9_Smalltalk13"					;// ...non vorrei essere nei suoi panni...
	Smalltalk14					=	"SVM_9_Smalltalk14"					;// ...sempre la stessa storia...
	Smalltalk15					=	"SVM_9_Smalltalk15"					;// ...certe persone non imparano mai...
	Smalltalk16					=	"SVM_9_Smalltalk16"					;// ...un tempo, le cose sarebbero andate diversamente...
	Smalltalk17					=	"SVM_9_Smalltalk17"					;// ...la gente parla troppo...
	Smalltalk18					=	"SVM_9_Smalltalk18"					;// ...non ascolto più le chiacchiere...
	Smalltalk19					=	"SVM_9_Smalltalk19"					;// ...fidati di qualcuno e ti ritroverai nei guai: ecco come vanno le cose...
	Smalltalk20					=	"SVM_9_Smalltalk20"					;// ...credo che non cambierà mai...
	Smalltalk21					=	"SVM_9_Smalltalk21"					;// ...probabilmente hai ragione...
	Smalltalk22					=	"SVM_9_Smalltalk22"					;// ...aspetta. Meglio non affrettarsi mai...
	Smalltalk23					=	"SVM_9_Smalltalk23"					;// ...pensavo che questa faccenda fosse stata sistemata molto tempo fa...
	Smalltalk24					=	"SVM_9_Smalltalk24"					;// ...parliamo di qualcos'altro...
	Om							= 	"SVM_9_Om"							;// Ommm!   
};



instance SVM_10	(C_SVM)				// Schlau, verschlagen,	heimlich, Zwielichtig, zynisch,	intrigant Dealer (RAVEN, KALOM)
{
	StopMagic					=	"SVM_10_StopMagic"						;//Niente magia!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"					;//Piantala subito!
	WeaponDown					=	"SVM_10_WeaponDown"						;//Abbassa quell'arma!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"				;//Cosa pensi di fare? Sei in cerca di guai?
	WatchYourAim				=	"SVM_10_WatchYourAim"					;//Abbassa quell'arma o ti sistemo io!
	WatchYourAimAngry			=	"SVM_10_WatchYourAimAngry"				;//Continua a puntarmi addosso quell'arma, se sei in cerca di guai!
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"				;//Ehi, attento! Fallo ancora una volta e ti sistemo io!
	LetsForgetOurLittleFight	=	"SVM_10_LetsForgetOurLittleFight"		;//Ehi, amico! Dimentichiamo la nostra piccola discussione, d'accordo?
	Strange						=	"SVM_10_Strange"						;//Coraggio, fatti vedere!
	DieMonster					=	"SVM_10_DieMonster"						;//Maledetti mostri!
	DieMortalEnemy				=	"SVM_10_DieMortalEnemy"					;//Sei spacciato!
	NowWait						=	"SVM_10_NowWait"						;//Giorno di paga!
	YouStillNotHaveEnough		=	"SVM_10_YouStillNotHaveEnough"			;//Sembra che tu voglia un bel pugno in faccia!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"					;//L'hai voluto tu!
	NowWaitIntruder				= 	"SVM_10_NowWaitIntruder"				;//Ora ti prendo, intruso!
	IWillTeachYouRespectForForeignProperty	=	"SVM_10_IWillTeachYouRespectForForeignProperty"	;//Ti avevo avvertito: se tocchi la mia roba, sarai nei guai!
	DirtyThief					=	"SVM_10_DirtyThief"						;//Ladro! Ti finirò!
	YouAttackedMyCharge			=	"SVM_10_YouAttackedMyCharge"			;//Nessuno attacca i miei uomini!
	YouKilledOneOfUs			=	"SVM_10_YouKilledOneOfUs"				;//Hai ucciso uno dei miei uomini. Ora io ucciderò TE!
	Dead						=	"SVM_10_Dead"							;//Aaargh!
	Aargh_1						=	"SVM_10_Aargh_1"						;//Aargh!
	Aargh_2						=	"SVM_10_Aargh_2"						;//Aargh!
	Aargh_3						=	"SVM_10_Aargh_3"						;//Aargh!
	Berzerk						=	"SVM_10_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_10_YoullBeSorryForThis"			;//Bastardo! Te ne pentirai!
	YesYes						=	"SVM_10_YesYes"							;//Va bene, adesso calmati: hai vinto!
	ShitWhatAMonster			=	"SVM_10_ShitWhatAMonster"				;//Che mostro! Corri più in fretta che puoi!
	Help						=	"SVM_10_Help"							;//Ritirata!
	WeWillMeetAgain				=	"SVM_10_WeWillMeetAgain"				;//Ci rivedremo!
	NeverTryThatAgain			=	"SVM_10_NeverTryThatAgain"				;//Provaci di nuovo e te ne pentirai!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"				;//Ora quest'arma è mia!
	ITookYourOre				=	"SVM_10_ITookYourOre"					;//Mi prendo un po' del tuo metallo!
	ShitNoOre					=	"SVM_10_ShitNoOre"						;//Niente metallo, maledizione!
	HandsOff					=	"SVM_10_HandsOff"						;//Giù le mani, topo di fogna!
	GetOutOfHere				=	"SVM_10_GetOutOfHere"					;//Fuori dai piedi!
	YouViolatedForbiddenTerritory=	"SVM_10_YouViolatedForbiddenTerritory"	;//Ehi! Da dove salti fuori?
	YouWannaFoolMe				=	"SVM_10_YouWannaFoolMe"					;//Mi devi credere proprio stupido!
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"			;//Ehi! Perché gironzoli da queste parti?
	WhyAreYouInHere				=	"SVM_10_WhyYouAreInHere"				;//Vattene o chiamo le guardie!
	WhatDidYouInThere			=	"SVM_10_WhatDidYouInThere"				;//Cosa stai facendo qui?
	WiseMove					=	"SVM_10_WiseMove"						;//Sei stato fortunato.
	Alarm						=	"SVM_10_Alarm"							;//Guardie!
	IntruderAlert				= 	"SVM_10_IntruderAlert"					;//UN INTRUSO!!!
	BehindYou					=	"SVM_10_BehindYou"						;//Dietro di te!
	TheresAFight				=	"SVM_10_TheresAFight"					;//Ah! Un combattimento!
	HeyHeyHey					=	"SVM_10_HeyHeyHey"						;//Più forte!
	CheerFight					=	"SVM_10_CheerFight"						;//Non avere pietà!
	CheerFriend					=	"SVM_10_CheerFriend"					;//Finiscilo!
	Ooh							=	"SVM_10_Ooh"							;//Non perdere tempo!
	YeahWellDone				=	"SVM_10_YeahWellDone"					;//Rompigli il muso!
	RunCoward					=	"SVM_10_RunCoward"						;//Torna qui, codardo!
	HeDefeatedHim				=	"SVM_10_HeDefeatedHim"					;//Sarebbe bastato un alito di vento, per farlo cadere a terra da solo!
	HeDeservedIt				=	"SVM_10_HeDeservedIt"					;//Gli sta bene!
	HeKilledHim					=	"SVM_10_HeKilledHim"					;//Sei spacciato! Così imparerai ad andare in giro a uccidere la gente!
	ItWasAGoodFight				=	"SVM_10_ItWasAGoodFight"				;//Gli hai dato una lezione!
	Awake						=	"SVM_10_Awake"							;//Yawn!
	FriendlyGreetings			=	"SVM_10_FriendlyGreetings"				;//Salve!
	ALGreetings					=	"SVM_10_ALGreetings"					;//Per Gomez!
	MageGreetings				=	"SVM_10_MageGreetings"					;//Per la magia!
	SectGreetings				=	"SVM_10_SectGreetings"					;//Sveglia!
	ThereHeIs					= 	"SVM_10_ThereHeIs"						;//Eccolo lassù!
	NoLearnNoPoints				= 	"SVM_10_NoLearnNoPoints"				;//Non posso insegnarti nulla: non hai abbastanza esperienza.
	NoLearnOverMax				= 	"SVM_10_NoLearnOverMax"					;//Non puoi migliorare ulteriormente, in questo campo. Dovresti imparare qualcos'altro.
	NoLearnYouAlreadyKnow		=	"SVM_10_NoLearnYouAlreadyKnow"			;//Devi migliorare ancora, prima di diventare un maestro!
	NoLearnYoureBetter			=	"SVM_10_NoLearnYoureBetter"				;//Sei già abbastanza esperto!
	HeyYou						=	"SVM_10_HeyYou"							;//Ehi, tu!
	NotNow						=	"SVM_10_NotNow"							;//Non adesso!
	WhatDoYouWant				=	"SVM_10_WhatDoYouWant"					;//Cosa vuoi?
	ISaidWhatDoYouWant			=	"SVM_10_ISaidWhatDoYouWant"				;//Cosa posso fare per te?
	MakeWay						=	"SVM_10_MakeWay"						;//Fammi passare!
	OutOfMyWay					=	"SVM_10_OutOfMyWay"						;//Fuori dai piedi!
	YouDeafOrWhat				=	"SVM_10_YouDeafOrWhat"					;//Vuoi che ti spacchi la testa? Vattene via!
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"			;//Sei ancora in cerca di guai?
	LookAway					=	"SVM_10_LookAway"						;//Io non ci sono...
	OkayKeepIt					=	"SVM_10_OkayKeepIt"						;//Tieniti tutto!
	WhatsThat					=	"SVM_10_WhatsThat"						;//Cosa è stato?
	ThatsMyWeapon				=	"SVM_10_ThatsMyWeapon"					;//Restituiscimi l'arma!
	GiveItToMe					=	"SVM_10_GiveItToMe"						;//Dammela!
	YouCanKeeptheCrap			=	"SVM_10_YouCanKeeptheCrap"				;//Tieni! Tanto non mi serve.
	TheyKilledMyFriend			=	"SVM_10_TheyKilledMyFriend"				;//Hanno preso uno dei nostri e questo mi fa infuriare!
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"			;//Perché mi hai svegliato?
	SuckerGotSome				=	"SVM_10_SuckerGotSome"					;//Ti hanno dato una bella ripassata, eh? Ben ti sta!
	SuckerDefeatedEBr			=	"SVM_10_SuckerDefeatedEBr"				;//Hai colpito un barone delle miniere!
	SuckerDefeatedGur			=	"SVM_10_SuckerDefeatedGur"				;//Hai sconfitto un guru.
	SuckerDefeatedMage			=	"SVM_10_SuckerDefeatedMage"				;//Sconfiggere un mago...
	SuckerDefeatedNov_Guard		= 	"SVM_10_SuckerDefeatedNov_Guard"		;//Dovresti sapere a chi stai dando fastidio, prima di attaccare i novizi!
	SuckerDefeatedVlk_Guard		= 	"SVM_10_SuckerDefeatedVlk_Guard"		;//Io sono qui per mantenere l'ordine! Lascia in pace la mia gente!
	YouDefeatedMyComrade		=	"SVM_10_YouDefeatedMyComrade"			;//Hai colpito il mio amico.
	YouDefeatedNOV_Guard		=	"SVM_10_YouDefeatedNOV_Guard"			;//Alza le mani su un altro novizio e te ne pentirai!
	YouDefeatedVLK_Guard		=	"SVM_10_YouDefeatedVLK_Guard"			;//Toccare uno dei miei protetti costa caro.
	YouStoleFromMe				=	"SVM_10_YouStoleFromMe"					;//Non riprovarci ancora, sporco ladro!
	YouStoleFromUs				=	"SVM_10_YouStoleFromUs"					;//Hai degli oggetti che ci appartengono. Farai meglio a ridarceli.
	YouStoleFromEBr				=	"SVM_10_YouStoleFromEBr"				;//Hai derubato i baroni delle miniere! Saranno infuriati!
	YouStoleFromGur				=	"SVM_10_YouStoleFromGur"				;//Hai derubato i guru. Farti cogliere sul fatto non è stata una buona idea!
	StoleFromMage				=	"SVM_10_StoleFromMage"					;//Hai derubato i maghi, vero?
	YouKilledMyFriend			=	"SVM_10_YouKilledMyFriend"				;//Hai uno dei nostri sulla coscienza. Commetti un altro errore e sarà il tuo turno!
	YouKilledEBr				=	"SVM_10_YouKilledEBr"					;//Hai ucciso un barone delle miniere! Sei diventato pazzo?
	YouKilledGur				=	"SVM_10_YouKilledGur"					;//Hai ucciso un guru! Non posso crederci!
	YouKilledMage				=	"SVM_10_YouKilledMage"					;//Hai ucciso un mago! Come pensi di giustificarti?
	YouKilledOCfolk				=	"SVM_10_YouKilledOCfolk"				;//Un membro di Campo Vecchio è morto e sei nell'elenco dei sospettati...
	YouKilledNCfolk				=	"SVM_10_YouKilledNCfolk"				;//C'è stata una terribile tragedia a Campo Nuovo e sembra che tu ne sia coinvolto!
	YouKilledPSIfolk			=	"SVM_10_YouKilledPSIfolk"				;//La Fratellanza conta un credente in meno e hai la sua morte sulla coscienza!
	GetThingsRight				=	"SVM_10_GetThingsRight"					;//Non sarà facile rimettere a posto le cose!
	YouDefeatedMeWell			=	"SVM_10_YouDefeatedMeWell"				;//Congratulazioni, hai vinto! Bel combattimento.
	Smalltalk01					=	"SVM_10_Smalltalk01"					;// ...se credi...
	Smalltalk02					=	"SVM_10_Smalltalk02"					;// ...forse...
	Smalltalk03					=	"SVM_10_Smalltalk03"					;// ...pessima idea...
	Smalltalk04					=	"SVM_10_Smalltalk04"					;// ...farò meglio a starne fuori...
	Smalltalk05					=	"SVM_10_Smalltalk05"					;// ...non è affar mio...
	Smalltalk06					=	"SVM_10_Smalltalk06"					;// ...era ovvio che ci sarebbero stati dei guai...
	Smalltalk07					=	"SVM_10_Smalltalk07"					;// ...ma tienilo per te: la gente non deve saperlo.
	Smalltalk08					=	"SVM_10_Smalltalk08"					;// ...non accadrà di nuovo...
	Smalltalk09					=	"SVM_10_Smalltalk09"					;// ...doveva esserci del vero in quella storia, dopo tutto...
	Smalltalk10					=	"SVM_10_Smalltalk10"					;// ...devi stare attento a ciò che dici in giro...
	Smalltalk11					=	"SVM_10_Smalltalk11"					;// ...dato che non mi riguarda...
	Smalltalk12					=	"SVM_10_Smalltalk12"					;// ...non dovresti credere a tutto ciò che senti...
	Smalltalk13					=	"SVM_10_Smalltalk13"					;// ...non vorrei essere nei suoi panni...
	Smalltalk14					=	"SVM_10_Smalltalk14"					;// ...sempre la stessa storia...
	Smalltalk15					=	"SVM_10_Smalltalk15"					;// ...certe persone non imparano mai...
	Smalltalk16					=	"SVM_10_Smalltalk16"					;// ...un tempo, le cose sarebbero andate diversamente...
	Smalltalk17					=	"SVM_10_Smalltalk17"					;// ...la gente parla troppo...
	Smalltalk18					=	"SVM_10_Smalltalk18"					;// ...non ascolto più le chiacchiere...
	Smalltalk19					=	"SVM_10_Smalltalk19"					;// ...fidati di qualcuno e ti ritroverai nei guai: ecco come vanno le cose...
	Smalltalk20					=	"SVM_10_Smalltalk20"					;// ...credo che non cambierà mai...
	Smalltalk21					=	"SVM_10_Smalltalk21"					;// ...probabilmente hai ragione...
	Smalltalk22					=	"SVM_10_Smalltalk22"					;// ...aspetta. Meglio non affrettarsi mai...
	Smalltalk23					=	"SVM_10_Smalltalk23"					;// ...pensavo che questa faccenda fosse stata sistemata molto tempo fa...
	Smalltalk24					=	"SVM_10_Smalltalk24"					;// ...parliamo di qualcos'altro...
	Om							= 	"SVM_10_Om"							;//Ommm!
};



//////////////////////////////////////////
instance SVM_11	(C_SVM)				//Profi				Ruhig, abgezockt, Vernünftig aberknallhart
{
	StopMagic					=	"SVM_11_StopMagic"						;//Non usare la magia su di me!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"					;//Ho detto smettila! Subito!
	WeaponDown					=	"SVM_11_WeaponDown"						;//Se cerchi guai sei nel posto giusto!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Allontana quell'affare o sei finito!
	WatchYourAim				=	"SVM_11_WatchYourAim"					;//Abbassa quell'affare!
	WatchYourAimAngry			=	"SVM_11_WatchYourAimAngry"				;//Sei sicuro di volermi creare dei problemi?
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Cosa stai facendo? Smettila!
	LetsForgetOurLittleFight	=	"SVM_11_LetsForgetOurLittleFight"		;//Dimentichiamo la nostra piccola discussione!
	Strange						=	"SVM_11_Strange"						;//Maledizione, dove si è cacciato?
	DieMonster					=	"SVM_11_DieMonster"						;//Se continuano a intralciarmi il cammino, sono spacciati!
	DieMortalEnemy				=	"SVM_11_DieMortalEnemy"					;//Ricorda: mai farti dei nemici che non puoi sistemare. Ora muori!
	NowWait						=	"SVM_11_NowWait"						;//Non avresti dovuto!
	YouStillNotHaveEnough		=	"SVM_11_YouStillNotHaveEnough"			;//Non ti ho già fatto mangiare la polvere una volta? Ne vuoi ancora?
	YouAskedForIt				=	"SVM_11_YouAskedForIt"					;//Se non ascolti, sarai molto triste!
	NowWaitIntruder				= 	"SVM_11_NowWaitIntruder"				;//Ehi, intruso! La tua lezione è in arrivo!
	IWillTeachYouRespectForForeignProperty	=	"SVM_11_IWillTeachYouRespectForForeignProperty"	;//Ti spezzo le dita!
	DirtyThief					=	"SVM_11_DirtyThief"						;//Non vale la pena rubare!
	YouAttackedMyCharge			=	"SVM_11_YouAttackedMyCharge"			;//Stai creando scompiglio nel mio territorio! Ora ti finirò!
	YouKilledOneOfUs			=	"SVM_11_YouKilledOneOfUs"				;//Uccidere uno dei nostri è stato il tuo ultimo errore!
	Dead						=	"SVM_11_Dead"							;//Aaargh!
	Aargh_1						=	"SVM_11_Aargh_1"						;//Aargh!
	Aargh_2						=	"SVM_11_Aargh_2"						;//Aargh!
	Aargh_3						=	"SVM_11_Aargh_3"						;//Aargh!
	Berzerk						=	"SVM_11_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_11_YoullBeSorryForThis"			;//Non avresti dovuto!
	YesYes						=	"SVM_11_YesYes"							;//Va bene, hai vinto tu!
	ShitWhatAMonster			=	"SVM_11_ShitWhatAMonster"				;//Questo è troppo grosso per me!
	Help						=	"SVM_11_Help"							;//Ritirata!
	WeWillMeetAgain				=	"SVM_11_WeWillMeetAgain"				;//Non finisce qui, amico!
	NeverTryThatAgain			=	"SVM_11_NeverTryThatAgain"				;//Non riprovarci!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//Mi prenderò cura io della tua arma!
	ITookYourOre				=	"SVM_11_ITookYourOre"					;//Sei gentile a regalarmi un po' del tuo metallo!
	ShitNoOre					=	"SVM_11_ShitNoOre"						;//Niente metallo!
	HandsOff					=	"SVM_11_HandsOff"						;//Metti giù quelle manacce!
	GetOutOfHere				=	"SVM_11_GetOutOfHere"					;//Vattene o ti faccio scappare io!
	YouViolatedForbiddenTerritory=	"SVM_11_YouViolatedForbiddenTerritory"	;//Ehi! Come sei entrato?
	YouWannaFoolMe				=	"SVM_11_YouWannaFoolMe"					;//Con me non attacca, amico!
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"			;//Cosa dovrebbe essere?
	WhyAreYouInHere				=	"SVM_11_WhyYouAreInHere"				;//Questo posto è mio. Vattene o chiamo le guardie!
	WhatDidYouInThere			=	"SVM_11_WhatDidYouInThere"				;//Che ci fai, qui? Scappa, prima che ti metta le mani addosso!
	WiseMove					=	"SVM_11_WiseMove"						;//Bravo! Non farlo mai più!
	Alarm						=	"SVM_11_Alarm"							;//Guardie!
	IntruderAlert				= 	"SVM_11_IntruderAlert"					;//UN INTRUSO!!!
	BehindYou					=	"SVM_11_BehindYou"						;//Dietro di te!
	TheresAFight				=	"SVM_11_TheresAFight"					;//Vediamo chi vince, stavolta!
	HeyHeyHey					=	"SVM_11_HeyHeyHey"						;//Coraggio, fammi vedere!
	CheerFight					=	"SVM_11_CheerFight"						;//Smettila di giocare!
	CheerFriend					=	"SVM_11_CheerFriend"					;//Andiamo, puoi sistemarlo!
	Ooh							=	"SVM_11_Ooh"							;//Ah! Non va bene!
	YeahWellDone				=	"SVM_11_YeahWellDone"					;//Uhmm... Niente male!
	RunCoward					=	"SVM_11_RunCoward"						;//Non farti più vedere da queste parti!
	HeDefeatedHim				=	"SVM_11_HeDefeatedHim"					;//Bel colpo!
	HeDeservedIt				=	"SVM_11_HeDeservedIt"					;//Non fa nulla! Se l'è meritato!
	HeKilledHim					=	"SVM_11_HeKilledHim"					;//L'hai ucciso! Guai in arrivo!
	ItWasAGoodFight				=	"SVM_11_ItWasAGoodFight"				;//Ben fatto! Ottima prestazione!
	Awake						=	"SVM_11_Awake"							;//Yawn!
	FriendlyGreetings			=	"SVM_11_FriendlyGreetings"				;//Salve!
	ALGreetings					=	"SVM_11_ALGreetings"					;//Per Gomez!
	MageGreetings				=	"SVM_11_MageGreetings"					;//Per la magia!
	SectGreetings				=	"SVM_11_SectGreetings"					;//Sveglia!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Sei cieco? Eccolo lassù!
	NoLearnNoPoints				= 	"SVM_11_NoLearnNoPoints"				;//Non posso insegnarti nulla: non hai abbastanza esperienza.
	NoLearnOverMax				= 	"SVM_11_NoLearnOverMax"					;//Non puoi migliorare ulteriormente, in questo campo. Dovresti imparare qualcos'altro.
	NoLearnYouAlreadyKnow		=	"SVM_11_NoLearnYouAlreadyKnow"			;//Devi migliorare ancora, prima di diventare un maestro!
	NoLearnYoureBetter			=	"SVM_11_NoLearnYoureBetter"				;//Sei già meglio di così!
	HeyYou						=	"SVM_11_HeyYou"							;//Ehi, tu!
	NotNow						=	"SVM_11_NotNow"							;//Non adesso!
	WhatDoYouWant				=	"SVM_11_WhatDoYouWant"					;//Cosa vuoi?
	ISaidWhatDoYouWant			=	"SVM_11_ISaidWhatDoYouWant"				;//Cosa posso fare per te?
	MakeWay						=	"SVM_11_MakeWay"						;//Posso passare?
	OutOfMyWay					=	"SVM_11_OutOfMyWay"						;//Fatti da parte!
	YouDeafOrWhat				=	"SVM_11_YouDeafOrWhat"					;//Vuoi che ti spacchi la testa? Vattene via!
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"			;//Sei ancora in cerca di guai?
	LookAway					=	"SVM_11_LookAway"						;//Non voglio essere coinvolto in questa storia!
	OkayKeepIt					=	"SVM_11_OkayKeepIt"						;//Va bene, è tutta tua!
	WhatsThat					=	"SVM_11_WhatsThat"						;//Cosa è stato?
	ThatsMyWeapon				=	"SVM_11_ThatsMyWeapon"					;//Quella è la mia arma!
	GiveItToMe					=	"SVM_11_GiveItToMe"						;//Coraggio, dammela!
	YouCanKeeptheCrap			=	"SVM_11_YouCanKeeptheCrap"				;//Tienila, tanto non mi serve!
	TheyKilledMyFriend			=	"SVM_11_TheyKilledMyFriend"				;//Hanno ucciso uno dei nostri. Se prendo quel porco...
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"			;//Cosa succede?
	SuckerGotSome				=	"SVM_11_SuckerGotSome"					;//Sei stato sconfitto? Ben ti sta!
	SuckerDefeatedEBr			=	"SVM_11_SuckerDefeatedEBr"				;//Hai sconfitto un barone delle miniere. Impressionante, ma stupido. Molto stupido.
	SuckerDefeatedGur			=	"SVM_11_SuckerDefeatedGur"				;//Hai sconfitto un guru.
	SuckerDefeatedMage			=	"SVM_11_SuckerDefeatedMage"				;//Sconfiggere un mago non è un'idea molto furba.
	SuckerDefeatedNov_Guard		= 	"SVM_11_SuckerDefeatedNov_Guard"		;//Io proteggo questa gente e tu l'hai attaccata...
	SuckerDefeatedVlk_Guard		= 	"SVM_11_SuckerDefeatedVlk_Guard"		;//Attaccando i minatori metti in pericolo i miei profitti!
	YouDefeatedMyComrade		=	"SVM_11_YouDefeatedMyComrade"			;//Chiunque infastidisca i miei amici infastidisce me.
	YouDefeatedNOV_Guard		=	"SVM_11_YouDefeatedNOV_Guard"			;//Alza le mani su un altro novizio e te ne pentirai!
	YouDefeatedVLK_Guard		=	"SVM_11_YouDefeatedVLK_Guard"			;//Attaccare i miei protetti può costarti la testa.
	YouStoleFromMe				=	"SVM_11_YouStoleFromMe"					;//Osi tornare da queste parti, sporco ladro?
	YouStoleFromUs				=	"SVM_11_YouStoleFromUs"					;//Hai degli oggetti che ci appartengono. Farai meglio a ridarceli.
	YouStoleFromEBr				=	"SVM_11_YouStoleFromEBr"				;//Hai derubato i baroni delle miniere! Saranno infuriati!
	YouStoleFromGur				=	"SVM_11_YouStoleFromGur"				;//Hai derubato i guru, vero?
	StoleFromMage				=	"SVM_11_StoleFromMage"					;//Hai derubato i maghi, vero?
	YouKilledMyFriend			=	"SVM_11_YouKilledMyFriend"				;//Hai infranto la regola no 1: niente omicidi!
	YouKilledEBr				=	"SVM_11_YouKilledEBr"					;//Hai ucciso un barone delle miniere! Sei diventato pazzo?
	YouKilledGur				=	"SVM_11_YouKilledGur"					;//Hai ucciso un guru! Non posso crederci!
	YouKilledMage				=	"SVM_11_YouKilledMage"					;//Hai ucciso un mago! Come pensi di giustificarti?
	YouKilledOCfolk				=	"SVM_11_YouKilledOCfolk"				;//Un membro di Campo Vecchio è morto e sei nell'elenco dei sospettati...
	YouKilledNCfolk				=	"SVM_11_YouKilledNCfolk"				;//C'è stata una terribile tragedia a Campo Nuovo e sembra che tu ne sia coinvolto!
	YouKilledPSIfolk			=	"SVM_11_YouKilledPSIfolk"				;//La Fratellanza conta un credente in meno e hai la sua morte sulla coscienza!
	GetThingsRight				=	"SVM_11_GetThingsRight"					;//Non sarà facile rimettere a posto le cose!
	YouDefeatedMeWell			=	"SVM_11_YouDefeatedMeWell"				;//È stato un bel combattimento. Le ossa mi faranno male per un bel po'.
	Smalltalk01					=	"SVM_11_Smalltalk01"					;// ...se credi...
	Smalltalk02					=	"SVM_11_Smalltalk02"					;// ...forse...
	Smalltalk03					=	"SVM_11_Smalltalk03"					;// ...pessima idea...
	Smalltalk04					=	"SVM_11_Smalltalk04"					;// ...farò meglio a starne fuori...
	Smalltalk05					=	"SVM_11_Smalltalk05"					;// ...non è affar mio...
	Smalltalk06					=	"SVM_11_Smalltalk06"					;// ...era ovvio che ci sarebbero stati dei guai...
	Smalltalk07					=	"SVM_11_Smalltalk07"					;// ...ma tienilo per te: la gente non deve saperlo.
	Smalltalk08					=	"SVM_11_Smalltalk08"					;// ...non accadrà di nuovo...
	Smalltalk09					=	"SVM_11_Smalltalk09"					;// ...doveva esserci del vero in quella storia, dopo tutto...
	Smalltalk10					=	"SVM_11_Smalltalk10"					;// ...devi stare attento a ciò che dici in giro...
	Smalltalk11					=	"SVM_11_Smalltalk11"					;// ...dato che non mi riguarda...
	Smalltalk12					=	"SVM_11_Smalltalk12"					;// ...non dovresti credere a tutto ciò che senti...
	Smalltalk13					=	"SVM_11_Smalltalk13"					;// ...non vorrei essere nei suoi panni...
	Smalltalk14					=	"SVM_11_Smalltalk14"					;// ...sempre la stessa storia...
	Smalltalk15					=	"SVM_11_Smalltalk15"					;// ...certe persone non imparano mai...
	Smalltalk16					=	"SVM_11_Smalltalk16"					;// ...un tempo, le cose sarebbero andate diversamente...
	Smalltalk17					=	"SVM_11_Smalltalk17"					;// ...la gente parla troppo...
	Smalltalk18					=	"SVM_11_Smalltalk18"					;// ...non ascolto più le chiacchiere...
	Smalltalk19					=	"SVM_11_Smalltalk19"					;// ...fidati di qualcuno e ti ritroverai nei guai: ecco come vanno le cose...
	Smalltalk20					=	"SVM_11_Smalltalk20"					;// ...credo che non cambierà mai...
	Smalltalk21					=	"SVM_11_Smalltalk21"					;// ...probabilmente hai ragione...
	Smalltalk22					=	"SVM_11_Smalltalk22"					;// ...aspetta. Meglio non affrettarsi mai...
	Smalltalk23					=	"SVM_11_Smalltalk23"					;// ...pensavo che questa faccenda fosse stata sistemata molto tempo fa...
	Smalltalk24					=	"SVM_11_Smalltalk24"					;// ...parliamo di qualcos'altro...
	Om							= 	"SVM_11_Om"								;//Ommm!
};


instance SVM_12	(C_SVM)		//Bazaar-Händler		Nach außen freundlich,jovial,Innen hinterhältig, raffgierig
{
	StopMagic					=	"SVM_12_StopMagic"						;//Niente magia!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"					;//Quando dico 'Basta con la magia', parlo sul serio!
	WeaponDown					=	"SVM_12_WeaponDown"						;//Cosa vuoi fare con quell'arma?
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"				;//Abbassa quell'affare!
	WatchYourAim				=	"SVM_12_WatchYourAim"					;//Mi stai puntando addosso!
	WatchYourAimAngry			=	"SVM_12_WatchYourAimAngry"				;//Piantala o ti ritroverai nei guai!
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"				;//Ehi! Sei cieco?
	LetsForgetOurLittleFight	=	"SVM_12_LetsForgetOurLittleFight"		;//Dimentichiamo la nostra piccola discussione, va bene?
	Strange						=	"SVM_12_Strange"						;//Era qui un istante fa! Strano...
	DieMonster					=	"SVM_12_DieMonster"						;//È giunta la tua ora, bastardo!
	DieMortalEnemy				=	"SVM_12_DieMortalEnemy"					;//Giorno di paga!
	NowWait						=	"SVM_12_NowWait"						;//Sei in cerca di una bella ripassata!
	YouStillNotHaveEnough		=	"SVM_12_YouStillNotHaveEnough"			;//Non ne hai ancora abbastanza?
	YouAskedForIt				=	"SVM_12_YouAskedForIt"					;//L'hai voluto tu!
	NowWaitIntruder				= 	"SVM_12_NowWaitIntruder"				;//Dovranno portarti via con un carretto!
	IWillTeachYouRespectForForeignProperty	=	"SVM_12_IWillTeachYouRespectForForeignProperty"	;//Ti avevo avvertito: se tocchi la mia roba, sarai nei guai!
	DirtyThief					=	"SVM_12_DirtyThief"						;//Ladro! Ti finirò!
	YouAttackedMyCharge			=	"SVM_12_YouAttackedMyCharge"			;//Nessuno picchia i miei uomini senza pentirsene!
	YouKilledOneOfUs			=	"SVM_12_YouKilledOneOfUs"				;//Hai ucciso uno dei miei uomini. Ora io ucciderò TE!
	Dead						=	"SVM_12_Dead"							;//Aaargh!
	Aargh_1						=	"SVM_12_Aargh_1"						;//Aargh!
	Aargh_2						=	"SVM_12_Aargh_2"						;//Aargh!
	Aargh_3						=	"SVM_12_Aargh_3"						;//Aargh!
	Berzerk						=	"SVM_12_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_12_YoullBeSorryForThis"			;//Te ne pentirai!
	YesYes						=	"SVM_12_YesYes"							;//Calma, hai vinto!
	ShitWhatAMonster			=	"SVM_12_ShitWhatAMonster"				;//Questo è troppo grosso per me!
	Help						=	"SVM_12_Help"							;//Maledizione!
	WeWillMeetAgain				=	"SVM_12_WeWillMeetAgain"				;//La prossima volta, le cose andranno diversamente!
	NeverTryThatAgain			=	"SVM_12_NeverTryThatAgain"				;//Non riprovarci!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"				;//Mi piace quest'arma!
	ITookYourOre				=	"SVM_12_ITookYourOre"					;//Mi assicurerò che il tuo metallo sia ben investito!
	ShitNoOre					=	"SVM_12_ShitNoOre"						;//Maledizione! Niente metallo!
	HandsOff					=	"SVM_12_HandsOff"						;//Giù le mani!
	GetOutOfHere				=	"SVM_12_GetOutOfHere"					;//Fuori dai piedi!
	YouViolatedForbiddenTerritory=	"SVM_12_YouViolatedForbiddenTerritory";//Ehi! Da dove salti fuori?
	YouWannaFoolMe				=	"SVM_12_YouWannaFoolMe"					;//Mi credi tanto stupido?
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"			;//Perché gironzoli da queste parti?
	WhyAreYouInHere				=	"SVM_12_WhyYouAreInHere"				;//Vattene o chiamo le guardie!
	WhatDidYouInThere			=	"SVM_12_WhatDidYouInThere"				;//Non hai nulla da fare, qui!
	WiseMove					=	"SVM_12_WiseMove"						;//Impari in fretta!
	Alarm						=	"SVM_12_Alarm"							;//Guardie, accorrete!
	IntruderAlert				= 	"SVM_12_IntruderAlert"					;//ALLARME!
	BehindYou					=	"SVM_12_BehindYou"						;//Attento!
	TheresAFight				=	"SVM_12_TheresAFight"					;//Un combattimento!
	HeyHeyHey					=	"SVM_12_HeyHeyHey"						;//Colpiscilo!
	CheerFight					=	"SVM_12_CheerFight"						;//Bene!
	CheerFriend					=	"SVM_12_CheerFriend"					;//Stendilo, adesso!
	Ooh							=	"SVM_12_Ooh"							;//Attento!
	YeahWellDone				=	"SVM_12_YeahWellDone"					;//Era ora!
	RunCoward					=	"SVM_12_RunCoward"						;//Il tizio se la sta svignando!
	HeDefeatedHim				=	"SVM_12_HeDefeatedHim"					;//Direi che è una vittoria totale!
	HeDeservedIt				=	"SVM_12_HeDeservedIt"					;//Se l'è meritata!
	HeKilledHim					=	"SVM_12_HeKilledHim"					;//Vai in giro a uccidere la gente. Ora sei davvero nei guai!
	ItWasAGoodFight				=	"SVM_12_ItWasAGoodFight"				;//Che combattimento!
	Awake						=	"SVM_12_Awake"							;//Yawn!
	FriendlyGreetings			=	"SVM_12_FriendlyGreetings"				;//Ciao, amico!
	ALGreetings					=	"SVM_12_ALGreetings"					;//Per Gomez!
	MageGreetings				=	"SVM_12_MageGreetings"					;//Per la magia!
	SectGreetings				=	"SVM_12_SectGreetings"					;//Sveglia!
	ThereHeIs					= 	"SVM_12_ThereHeIs"						;//Lassù!
	NoLearnNoPoints				= 	"SVM_12_NoLearnNoPoints"				;//Non posso insegnarti nulla: non hai abbastanza esperienza.
	NoLearnOverMax				= 	"SVM_12_NoLearnOverMax"					;//Non puoi migliorare ulteriormente, in questo campo. Dovresti imparare qualcos'altro.
	NoLearnYouAlreadyKnow		=	"SVM_12_NoLearnYouAlreadyKnow"			;//Devi migliorare ancora, prima di diventare un maestro!
	NoLearnYoureBetter			=	"SVM_12_NoLearnYoureBetter"				;//Sei già abbastanza esperto!
	HeyYou						=	"SVM_12_HeyYou"							;//Ehi, tu!
	NotNow						=	"SVM_12_NotNow"							;//Non adesso!
	WhatDoYouWant				=	"SVM_12_WhatDoYouWant"					;//Cosa vuoi?
	ISaidWhatDoYouWant			=	"SVM_12_ISaidWhatDoYouWant"				;//Cosa posso fare per te?
	MakeWay						=	"SVM_12_MakeWay"						;//Fammi passare!
	OutOfMyWay					=	"SVM_12_OutOfMyWay"						;//Coraggio, fammi passare!
	YouDeafOrWhat				=	"SVM_12_YouDeafOrWhat"					;//Sei sordo o cerchi guai?
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"			;//Sei ancora in cerca di guai?
	LookAway					=	"SVM_12_LookAway"						;//È successo qualcosa? Io non ho visto NULLA...
	OkayKeepIt					=	"SVM_12_OkayKeepIt"						;//Va bene, ma piantala!
	WhatsThat					=	"SVM_12_WhatsThat"						;//Cosa è stato?
	ThatsMyWeapon				=	"SVM_12_ThatsMyWeapon"					;//Vorrei davvero riavere la mia arma!
	GiveItToMe					=	"SVM_12_GiveItToMe"						;//Dalla a me!
	YouCanKeeptheCrap			=	"SVM_12_YouCanKeeptheCrap"				;//Non è male, ma ho di meglio!
	TheyKilledMyFriend			=	"SVM_12_TheyKilledMyFriend"				;//Hanno ucciso uno dei nostri. Se prendo quel porco...
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"			;//Hm? Che c'è? Perché mi hai svegliato?
	SuckerGotSome				=	"SVM_12_SuckerGotSome"					;//Ti hanno dato una bella ripassata, eh? Ben ti sta!
	SuckerDefeatedEBr			=	"SVM_12_SuckerDefeatedEBr"				;//Hai battuto un barone delle miniere! Deve esserci rimasto di stucco!
	SuckerDefeatedGur			=	"SVM_12_SuckerDefeatedGur"				;//Hai sconfitto un guru! Sono impressionato, ma non provarci mai più.
	SuckerDefeatedMage			=	"SVM_12_SuckerDefeatedMage"				;//Hai battuto un mago... Devi essere un tipo coraggioso!
	SuckerDefeatedNov_Guard		= 	"SVM_12_SuckerDefeatedNov_Guard"		;//Devi essere pazzo a colpire un novizio.
	SuckerDefeatedVlk_Guard		= 	"SVM_12_SuckerDefeatedVlk_Guard"		;//Cosa pensavi di ottenere, battendo un minatore?
	YouDefeatedMyComrade		=	"SVM_12_YouDefeatedMyComrade"			;//Hai steso il mio amico! Perché?
	YouDefeatedNOV_Guard		=	"SVM_12_YouDefeatedNOV_Guard"			;//Alza le mani su un altro novizio e te ne pentirai!
	YouDefeatedVLK_Guard		=	"SVM_12_YouDefeatedVLK_Guard"			;//Toccare uno dei miei protetti è molto pericoloso.
	YouStoleFromMe				=	"SVM_12_YouStoleFromMe"					;//Osi tornare da queste parti, sporco ladro?
	YouStoleFromUs				=	"SVM_12_YouStoleFromUs"					;//Hai degli oggetti che ci appartengono. Farai meglio a ridarceli.
	YouStoleFromEBr				=	"SVM_12_YouStoleFromEBr"				;//Hai derubato i baroni delle miniere! Saranno infuriati!
	YouStoleFromGur				=	"SVM_12_YouStoleFromGur"				;//Hai derubato i guru! Cerca almeno di non farti prendere!
	StoleFromMage				=	"SVM_12_StoleFromMage"					;//Ai maghi non piacciono le persone che s'impicciano delle loro cose!
	YouKilledMyFriend			=	"SVM_12_YouKilledMyFriend"				;//Hai uno dei nostri sulla coscienza. Commetti un altro errore e sarà il tuo turno!
	YouKilledEBr				=	"SVM_12_YouKilledEBr"					;//Hai ucciso un barone delle miniere! Sei diventato pazzo?
	YouKilledGur				=	"SVM_12_YouKilledGur"					;//Hai ucciso un guru! Non posso crederci!
	YouKilledMage				=	"SVM_12_YouKilledMage"					;//Hai ucciso un mago! Come pensi di giustificarti?
	YouKilledOCfolk				=	"SVM_12_YouKilledOCfolk"				;//Un membro di Campo Vecchio è morto e sei nell'elenco dei sospettati...
	YouKilledNCfolk				=	"SVM_12_YouKilledNCfolk"				;//C'è stata una terribile tragedia a Campo Nuovo e sembra che tu ne sia coinvolto!
	YouKilledPSIfolk			=	"SVM_12_YouKilledPSIfolk"				;//La Fratellanza conta un credente in meno e hai la sua morte sulla coscienza!
	GetThingsRight				=	"SVM_12_GetThingsRight"					;//Non sarà facile rimettere a posto le cose!
	YouDefeatedMeWell			=	"SVM_12_YouDefeatedMeWell"				;//Mi hai dato una bella lezione, amico! Mi sono divertito, ma ora basta combattere!
	Smalltalk01					=	"SVM_12_Smalltalk01"					;// ...se credi...
	Smalltalk02					=	"SVM_12_Smalltalk02"					;// ...forse...
	Smalltalk03					=	"SVM_12_Smalltalk03"					;// ...pessima idea...
	Smalltalk04					=	"SVM_12_Smalltalk04"					;// ...farò meglio a starne fuori...
	Smalltalk05					=	"SVM_12_Smalltalk05"					;// ...non è affar mio...
	Smalltalk06					=	"SVM_12_Smalltalk06"					;// ...era ovvio che ci sarebbero stati dei guai...
	Smalltalk07					=	"SVM_12_Smalltalk07"					;// ...ma tienilo per te: la gente non deve saperlo.
	Smalltalk08					=	"SVM_12_Smalltalk08"					;// ...non accadrà di nuovo...
	Smalltalk09					=	"SVM_12_Smalltalk09"					;// ...doveva esserci del vero in quella storia, dopo tutto...
	Smalltalk10					=	"SVM_12_Smalltalk10"					;// ...devi stare attento a ciò che dici in giro...
	Smalltalk11					=	"SVM_12_Smalltalk11"					;// ...dato che non mi riguarda...
	Smalltalk12					=	"SVM_12_Smalltalk12"					;// ...non dovresti credere a tutto ciò che senti...
	Smalltalk13					=	"SVM_12_Smalltalk13"					;// ...non vorrei essere nei suoi panni...
	Smalltalk14					=	"SVM_12_Smalltalk14"					;// ...sempre la stessa storia...
	Smalltalk15					=	"SVM_12_Smalltalk15"					;// ...certe persone non imparano mai...
	Smalltalk16					=	"SVM_12_Smalltalk16"					;// ...un tempo, le cose sarebbero andate diversamente...
	Smalltalk17					=	"SVM_12_Smalltalk17"					;// ...la gente parla troppo...
	Smalltalk18					=	"SVM_12_Smalltalk18"					;// ...non ascolto più le chiacchiere...
	Smalltalk19					=	"SVM_12_Smalltalk19"					;// ...fidati di qualcuno e ti ritroverai nei guai: ecco come vanno le cose...
	Smalltalk20					=	"SVM_12_Smalltalk20"					;// ...credo che non cambierà mai...
	Smalltalk21					=	"SVM_12_Smalltalk21"					;// ...probabilmente hai ragione...
	Smalltalk22					=	"SVM_12_Smalltalk22"					;// ...aspetta. Meglio non affrettarsi mai...
	Smalltalk23					=	"SVM_12_Smalltalk23"					;// ...pensavo che questa faccenda fosse stata sistemata molto tempo fa...
	Smalltalk24					=	"SVM_12_Smalltalk24"					;// ...parliamo di qualcos'altro...
	Om							= 	"SVM_12_Om"							;//Ommm!
};


instance SVM_13	(C_SVM)					// Fanatiker	Agressiv, übereifrig, Ähnlich wie Stimme7Freak,	aber klarer, Ruhm-und-Ehre-Typ,	Nov: Glauben an	Y´berion blind,	Mitläufer
{
	StopMagic					=	"SVM_13_StopMagic"						;//Piantala con la magia!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"					;//Mettila via! VIA!
	WeaponDown					=	"SVM_13_WeaponDown"						;//Abbassa quell'arma!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"				;//Abbassa quell'arma!
	WatchYourAim				=	"SVM_13_WatchYourAim"					;//Me la stai puntando addosso? Attento a quel che fai!
	WatchYourAimAngry			=	"SVM_13_WatchYourAimAngry"				;//Stai correndo verso la morte. Farai meglio a puntare quell'arma da un'altra parte!
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"				;//A cosa ti serve?
	LetsForgetOurLittleFight	=	"SVM_13_LetsForgetOurLittleFight"		;//Dimentichiamo la nostra discussione, va bene?
	Strange						=	"SVM_13_Strange"						;//Dove si è cacciato? Non è possibile!!!
	DieMonster					=	"SVM_13_DieMonster"						;//Stasera mangiamo carne!
	DieMortalEnemy				=	"SVM_13_DieMortalEnemy"					;//Tocca a te, stavolta, e non avrò pietà!
	NowWait						=	"SVM_13_NowWait"						;//Ecco un buon nascondiglio...
	YouStillNotHaveEnough		=	"SVM_13_YouStillNotHaveEnough"			;//Non ci proverai più, vero?
	YouAskedForIt				=	"SVM_13_YouAskedForIt"					;//L'hai voluto tu!
	NowWaitIntruder				= 	"SVM_13_NowWaitIntruder"				;//Sei spacciato, intruso!
	IWillTeachYouRespectForForeignProperty	=	"SVM_13_IWillTeachYouRespctForForeignProperty"	;//Dovrei tagliarti le dita!
	DirtyThief					=	"SVM_13_DirtyThief"						;//Maledetto ladro! Ti spezzerò le braccia!
	YouAttackedMyCharge			=	"SVM_13_YouAttackedMyCharge"			;//Qui nessuno colpisce qualcun altro, a parte me!
	YouKilledOneOfUs			=	"SVM_13_YouKilledOneOfUs"				;//Hai ucciso uno dei nostri!
	Dead						=	"SVM_13_Dead"							;//Aaargh!
	Aargh_1						=	"SVM_13_Aargh_1"						;//Aargh!
	Aargh_2						=	"SVM_13_Aargh_2"						;//Aargh!
	Aargh_3						=	"SVM_13_Aargh_3"						;//Aargh!
	Berzerk						=	"SVM_13_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_13_YoullBeSorryForThis"			;//Non avrai nemmeno il tempo di pentirti!
	YesYes						=	"SVM_13_YesYes"							;//Nessun problema!
	ShitWhatAMonster			=	"SVM_13_ShitWhatAMonster"				;//Non ho l'arma giusta. Ci rivedremo...
	Help						=	"SVM_13_Help"							;//Woooooaaahhh! Tagliamo la corda!
	WeWillMeetAgain				=	"SVM_13_WeWillMeetAgain"				;//Ti cercherò!
	NeverTryThatAgain			=	"SVM_13_NeverTryThatAgain"				;//La prossima volta ti ucciderò!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"				;//Bell'arma! È tua? No? Ottimo!
	ITookYourOre				=	"SVM_13_ITookYourOre"					;//Non hai nulla in contrario se prendo un po' del tuo metallo, vero?
	ShitNoOre					=	"SVM_13_ShitNoOre"						;//Non hai neppure un po' di metallo!
	HandsOff					=	"SVM_13_HandsOff"						;//Schifoso topo di fogna! Giù le mani o te la farò pagare!
	GetOutOfHere				=	"SVM_13_GetOutOfHere"					;//Sparisci! Vattene!
	YouViolatedForbiddenTerritory=	"SVM_13_YouViolatedForbiddenTerritory"	;//Cosa ci fai qui?
	YouWannaFoolMe				=	"SVM_13_YouWannaFoolMe"					;//Hai intenzione di prenderti gioco di me?
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"			;//Ehi, tu! Perché giri da queste parti?
	WhyAreYouInHere				=	"SVM_13_WhyYouAreInHere"				;//Cosa stai facendo qui? Sparisci o chiamo le guardie!
	WhatDidYouInThere			=	"SVM_13_WhatDidYouInThere"				;//Non hai nulla da fare, qui!
	WiseMove					=	"SVM_13_WiseMove"						;//Sei fortunato! Mi sarebbe piaciuto spaccarti il muso!
	Alarm						=	"SVM_13_Alarm"							;//Guardie! Accorrete!
	IntruderAlert				= 	"SVM_13_IntruderAlert"					;//ALLARME!
	BehindYou					=	"SVM_13_BehindYou"						;//Dietro di te!
	TheresAFight				=	"SVM_13_TheresAFight"					;//Vediamo chi sarà il primo a mangiare la polvere!
	HeyHeyHey					=	"SVM_13_HeyHeyHey"						;//Ancora!
	CheerFight					=	"SVM_13_CheerFight"						;//Voglio vedere il sangue!
	CheerFriend					=	"SVM_13_CheerFriend"					;//Fallo fuori!
	Ooh							=	"SVM_13_Ooh"							;//Contrattacca, idiota!
	YeahWellDone				=	"SVM_13_YeahWellDone"					;//Siiii!
	RunCoward					=	"SVM_13_RunCoward"						;//Bravo, scappa!
	HeDefeatedHim				=	"SVM_13_HeDefeatedHim"					;//Pessimo combattimento! Sarebbe bastato un alito di vento per farlo cadere!
	HeDeservedIt				=	"SVM_13_HeDeservedIt"					;//Gli sta bene!
	HeKilledHim					=	"SVM_13_HeKilledHim"					;//Uccidere qualcuno davanti a dei testimoni è un vero e proprio suicidio.
	ItWasAGoodFight				=	"SVM_13_ItWasAGoodFight"				;//Bel combattimento!
	Awake						=	"SVM_13_Awake"							;//Yawn!
	FriendlyGreetings			=	"SVM_13_FriendlyGreetings"				;//Tutto bene?
	ALGreetings					=	"SVM_13_ALGreetings"					;//Per Gomez!
	MageGreetings				=	"SVM_13_MageGreetings"					;//Per la magia!
	SectGreetings				=	"SVM_13_SectGreetings"					;//Sveglia!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Sei cieco? Eccolo lassù!
	NoLearnNoPoints				= 	"SVM_13_NoLearnNoPoints"				;//Non posso insegnarti nulla: non hai abbastanza esperienza.
	NoLearnOverMax				= 	"SVM_13_NoLearnOverMax"					;//Non puoi migliorare ulteriormente, in questo campo. Dovresti imparare qualcos'altro.
	NoLearnYouAlreadyKnow		=	"SVM_13_NoLearnYouAlreadyKnow"			;//Devi migliorare ancora, prima di diventare un maestro!
	NoLearnYoureBetter			=	"SVM_13_NoLearnYoureBetter"				;//Sei già abbastanza esperto!
	HeyYou						=	"SVM_13_HeyYou"							;//Ehi, tu!
	NotNow						=	"SVM_13_NotNow"							;//Non adesso!
	WhatDoYouWant				=	"SVM_13_WhatDoYouWant"					;//Cosa vuoi?
	ISaidWhatDoYouWant			=	"SVM_13_ISaidWhatDoYouWant"				;//Cosa posso fare per te?
	MakeWay						=	"SVM_13_MakeWay"						;//Fammi passare!
	OutOfMyWay					=	"SVM_13_OutOfMyWay"						;//Fuori dai piedi!
	YouDeafOrWhat				=	"SVM_13_YouDeafOrWhat"					;//Cerchi guai? Vattene da qui!
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"			;//Sei ancora in cerca di guai?
	LookAway					=	"SVM_13_LookAway"						;//Non ho visto NULLA!
	OkayKeepIt					=	"SVM_13_OkayKeepIt"						;//È tutta tua!
	WhatsThat					=	"SVM_13_WhatsThat"						;//Cosa è stato?
	ThatsMyWeapon				=	"SVM_13_ThatsMyWeapon"					;//Restituiscimi l'arma!
	GiveItToMe					=	"SVM_13_GiveItToMe"						;//Dammela!
	YouCanKeeptheCrap			=	"SVM_13_YouCanKeeptheCrap"				;//D'accordo, tienila! Troverò un'altra soluzione!
	TheyKilledMyFriend			=	"SVM_13_TheyKilledMyFriend"				;//Uno dei nostri è morto e grida vendetta!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"			;//Perché mi hai svegliato?
	SuckerGotSome				=	"SVM_13_SuckerGotSome"					;//Ben ti sta!
	SuckerDefeatedEBr			=	"SVM_13_SuckerDefeatedEBr"				;//Hai colpito un barone delle miniere! Ora è davvero infuriato con te!
	SuckerDefeatedGur			=	"SVM_13_SuckerDefeatedGur"				;//Hai colpito un guru. Attiri i guai come una calamita!
	SuckerDefeatedMage			=	"SVM_13_SuckerDefeatedMage"				;//Sfidare un mago è un'idea pessima!
	SuckerDefeatedNov_Guard		= 	"SVM_13_SuckerDefeatedNov_Guard"		;//Sei tu quello che attacca i novizi!
	SuckerDefeatedVlk_Guard		= 	"SVM_13_SuckerDefeatedVlk_Guard"		;//Lascia in pace i miei uomini!
	YouDefeatedMyComrade		=	"SVM_13_YouDefeatedMyComrade"			;//Non avvicinarti ai miei amici.
	YouDefeatedNOV_Guard		=	"SVM_13_YouDefeatedNOV_Guard"			;//Il tuo comportamento non sarà tollerato!
	YouDefeatedVLK_Guard		=	"SVM_13_YouDefeatedVLK_Guard"			;//Se colpirai qualcuno sotto la mia protezione, ne subirai gli effetti!
	YouStoleFromMe				=	"SVM_13_YouStoleFromMe"					;//Mi hai derubato! Non provarci mai più!
	YouStoleFromUs				=	"SVM_13_YouStoleFromUs"					;//Rivogliamo le nostre cose! Daccele!
	YouStoleFromEBr				=	"SVM_13_YouStoleFromEBr"				;//Hai derubato i baroni delle miniere! Cosa diavolo ti è saltato in mente?
	YouStoleFromGur				=	"SVM_13_YouStoleFromGur"				;//Hai derubato i guru? Purtroppo sei stato scoperto.
	StoleFromMage				=	"SVM_13_StoleFromMage"					;//Hai derubato i maghi! Che idea stupida!
	YouKilledMyFriend			=	"SVM_13_YouKilledMyFriend"				;//Uno dei nostri è morto e tu c'entri qualcosa! Commetti un errore qualsiasi e te ne pentirai!
	YouKilledEBr				=	"SVM_13_YouKilledEBr"					;//Hai ucciso un barone delle miniere! Sei diventato pazzo?
	YouKilledGur				=	"SVM_13_YouKilledGur"					;//Hai ucciso un guru! Non posso crederci!
	YouKilledMage				=	"SVM_13_YouKilledMage"					;//Hai ucciso un mago! Come pensi di giustificarti?
	YouKilledOCfolk				=	"SVM_13_YouKilledOCfolk"				;//Un membro di Campo Vecchio è morto e sei nell'elenco dei sospettati...
	YouKilledNCfolk				=	"SVM_13_YouKilledNCfolk"				;//C'è stata una terribile tragedia a Campo Nuovo e sembra che tu ne sia coinvolto!
	YouKilledPSIfolk			=	"SVM_13_YouKilledPSIfolk"				;//La Fratellanza conta un credente in meno e hai la sua morte sulla coscienza!
	GetThingsRight				=	"SVM_13_GetThingsRight"					;//Non sarà facile rimettere a posto le cose!
	YouDefeatedMeWell			=	"SVM_13_YouDefeatedMeWell"				;//Mi hai dato una bella lezione, amico! Mi sono divertito, ma ora basta combattere!
	Smalltalk01					=	"SVM_13_Smalltalk01"					;// ...se credi...
	Smalltalk02					=	"SVM_13_Smalltalk02"					;// ...forse...
	Smalltalk03					=	"SVM_13_Smalltalk03"					;// ...pessima idea...
	Smalltalk04					=	"SVM_13_Smalltalk04"					;// ...farò meglio a starne fuori...
	Smalltalk05					=	"SVM_13_Smalltalk05"					;// ...non è affar mio...
	Smalltalk06					=	"SVM_13_Smalltalk06"					;// ...era ovvio che ci sarebbero stati dei guai...
	Smalltalk07					=	"SVM_13_Smalltalk07"					;// ...ma tienilo per te: la gente non deve saperlo.
	Smalltalk08					=	"SVM_13_Smalltalk08"					;// ...non accadrà di nuovo...
	Smalltalk09					=	"SVM_13_Smalltalk09"					;// ...doveva esserci del vero in quella storia, dopo tutto...
	Smalltalk10					=	"SVM_13_Smalltalk10"					;// ...devi stare attento a ciò che dici in giro...
	Smalltalk11					=	"SVM_13_Smalltalk11"					;// ...dato che non mi riguarda...
	Smalltalk12					=	"SVM_13_Smalltalk12"					;// ...non dovresti credere a tutto ciò che senti...
	Smalltalk13					=	"SVM_13_Smalltalk13"					;// ...non vorrei essere nei suoi panni...
	Smalltalk14					=	"SVM_13_Smalltalk14"					;// ...sempre la stessa storia...
	Smalltalk15					=	"SVM_13_Smalltalk15"					;// ...certe persone non imparano mai...
	Smalltalk16					=	"SVM_13_Smalltalk16"					;// ...un tempo, le cose sarebbero andate diversamente...
	Smalltalk17					=	"SVM_13_Smalltalk17"					;// ...la gente parla troppo...
	Smalltalk18					=	"SVM_13_Smalltalk18"					;// ...non ascolto più le chiacchiere...
	Smalltalk19					=	"SVM_13_Smalltalk19"					;// ...fidati di qualcuno e ti ritroverai nei guai: ecco come vanno le cose...
	Smalltalk20					=	"SVM_13_Smalltalk20"					;// ...credo che non cambierà mai...
	Smalltalk21					=	"SVM_13_Smalltalk21"					;// ...probabilmente hai ragione...
	Smalltalk22					=	"SVM_13_Smalltalk22"					;// ...aspetta. Meglio non affrettarsi mai...
	Smalltalk23					=	"SVM_13_Smalltalk23"					;// ...pensavo che questa faccenda fosse stata sistemata molto tempo fa...
	Smalltalk24					=	"SVM_13_Smalltalk24"					;// ...parliamo di qualcos'altro...
	Om							= 	"SVM_13_Om"							;//Ommm!
};



//////////////////////////////////////////
instance SVM_14	(C_SVM)				// Xardas(DMB),Corristo,Erzähler	alt	arrogant, gebildet
{
	StopMagic					=	"SVM_14_StopMagic"						;//Basta con la magia!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"					;//Mi hai sentito? Ho detto di smetterla!
	WeaponDown					=	"SVM_14_WeaponDown"						;//Cosa vuoi fare con quell'arma?
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Abbassa quell'arma!
	WatchYourAim				=	"SVM_14_WatchYourAim"					;//Me la stai puntando addosso!
	WatchYourAimAngry			=	"SVM_14_WatchYourAimAngry"				;//Vuoi piantarla di puntarmi quell’arma addosso?
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Attento!
	LetsForgetOurLittleFight	=	"SVM_14_LetsForgetOurLittleFight"		;//Dimentichiamo il nostro malinteso!
	Strange						=	"SVM_14_Strange"						;//Bel trucco: è sparito!
	DieMonster					=	"SVM_14_DieMonster"						;//Che creatura insopportabile!
	DieMortalEnemy				=	"SVM_14_DieMortalEnemy"					;//Devo ucciderti... Niente di personale, ovviamente!
	NowWait						=	"SVM_14_NowWait"						;//Basta così, per ora!
	YouStillNotHaveEnough		=	"SVM_14_YouStillNotHaveEnough"			;//Sei ancora in cerca di guai?
	YouAskedForIt				=	"SVM_14_YouAskedForIt"					;//Era questo che volevi!
	NowWaitIntruder				= 	"SVM_14_NowWaitIntruder"				;//Non sei stato invitato!
	IWillTeachYouRespectForForeignProperty	=	"SVM_14_IWillTeachYouRespectForForeignProperty"	;//La mia proprietà non ti appartiene!
	DirtyThief					=	"SVM_14_DirtyThief"						;//Mi hai derubato! Ora la pagherai!
	YouAttackedMyCharge			=	"SVM_14_YouAttackedMyCharge"			;//Devi imparare a rispettare le regole!
	YouKilledOneOfUs			=	"SVM_14_YouKilledOneOfUs"				;//Hai ucciso qualcuno!
	Dead						=	"SVM_14_Dead"							;//Aaargh!
	Aargh_1						=	"SVM_14_Aargh_1"						;//Aargh!
	Aargh_2						=	"SVM_14_Aargh_2"						;//Aargh!
	Aargh_3						=	"SVM_14_Aargh_3"						;//Aargh!
	Berzerk						=	"SVM_14_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_14_YoullBeSorryForThis"			;//Te ne pentirai!
	YesYes						=	"SVM_14_YesYes"							;//Va bene, va bene!
	ShitWhatAMonster			=	"SVM_14_ShitWhatAMonster"				;//In questo momento non sono in grado di accettare la sfida!
	Help						=	"SVM_14_Help"							;//Devo tornare ai miei studi!
	WeWillMeetAgain				=	"SVM_14_WeWillMeetAgain"				;//Ci rivedremo ancora!
	NeverTryThatAgain			=	"SVM_14_NeverTryThatAgain"				;//Farai meglio a non riprovarci!
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Mi prendo quest'arma!
	ITookYourOre				=	"SVM_14_ITookYourOre"					;//Il metallo serve sempre!
	ShitNoOre					=	"SVM_14_ShitNoOre"						;//Non hai metallo!
	HandsOff					=	"SVM_14_HandsOff"						;//Giù le mani!
	GetOutOfHere				=	"SVM_14_GetOutOfHere"					;//Fuori dai piedi!
	YouViolatedForbiddenTerritory=	"SVM_14_YouViolatedForbiddenTerritory"	;//Come sei entrato?
	YouWannaFoolMe				=	"SVM_14_YouWannaFoolMe"					;//Starai scherzando!
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"			;//Perché gironzoli da queste parti?
	WhyAreYouInHere				=	"SVM_14_WhyYouAreInHere"				;//Vattene, prima che chiami le guardie!
	WhatDidYouInThere			=	"SVM_14_WhatDidYouInThere"				;//Non hai nulla da fare, qui. Capito?
	WiseMove					=	"SVM_14_WiseMove"						;//Saggia decisione!
	Alarm						=	"SVM_14_Alarm"							;//Guardie!
	IntruderAlert				= 	"SVM_14_IntruderAlert"					;//UN INTRUSO!!!
	BehindYou					=	"SVM_14_BehindYou"						;//Dietro di te!
	TheresAFight				=	"SVM_14_TheresAFight"					;//Un combattimento!
	HeyHeyHey					=	"SVM_14_HeyHeyHey"						;//Mmh...
	CheerFight					=	"SVM_14_CheerFight"						;//Non serve a nulla!
	CheerFriend					=	"SVM_14_CheerFriend"					;//Quanto accanimento!
	Ooh							=	"SVM_14_Ooh"							;//Questo fa male!
	YeahWellDone				=	"SVM_14_YeahWellDone"					;//Così si fa!
	RunCoward					=	"SVM_14_RunCoward"						;//Ha imparato qualcosa, oggi!
	HeDefeatedHim				=	"SVM_14_HeDefeatedHim"					;//È tutto finito.
	HeDeservedIt				=	"SVM_14_HeDeservedIt"					;//Gli sta bene!
	HeKilledHim					=	"SVM_14_HeKilledHim"					;//Non era necessario ucciderlo. Ora sei nei guai!
	ItWasAGoodFight				=	"SVM_14_ItWasAGoodFight"				;//Questi combattimenti mi annoiano!
	Awake						=	"SVM_14_Awake"							;//Ero sveglio?
	FriendlyGreetings			=	"SVM_14_FriendlyGreetings"				;//Salute!
	ALGreetings					=	"SVM_14_ALGreetings"					;//Per Gomez!
	MageGreetings				=	"SVM_14_MageGreetings"					;//Per la magia!
	SectGreetings				=	"SVM_14_SectGreetings"					;//Sveglia!
	ThereHeIs					= 	"SVM_14_ThereHeIs"						;//Eccolo lassù!
	NoLearnNoPoints				= 	"SVM_14_NoLearnNoPoints"				;//Non posso insegnarti nulla: non hai abbastanza esperienza.
	NoLearnOverMax				= 	"SVM_14_NoLearnOverMax"					;//Non puoi migliorare ulteriormente, in questo campo. Dovresti imparare qualcos'altro.
	NoLearnYouAlreadyKnow		=	"SVM_14_NoLearnYouAlreadyKnow"			;//Devi migliorare ancora, prima di diventare un maestro!
	NoLearnYoureBetter			=	"SVM_14_NoLearnYoureBetter"				;//Sei già abbastanza esperto!
	HeyYou						=	"SVM_14_HeyYou"							;//Ehi, tu!
	NotNow						=	"SVM_14_NotNow"							;//Non adesso!
	WhatDoYouWant				=	"SVM_14_WhatDoYouWant"					;//Cosa vuoi?
	ISaidWhatDoYouWant			=	"SVM_14_ISaidWhatDoYouWant"				;//Cosa posso fare per te?
	MakeWay						=	"SVM_14_MakeWay"						;//Fammi passare!
	OutOfMyWay					=	"SVM_14_OutOfMyWay"						;//Fatti da parte!
	YouDeafOrWhat				=	"SVM_14_YouDeafOrWhat"					;//Ora sparisci!
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"			;//Sei ancora in cerca di guai?
	LookAway					=	"SVM_14_LookAway"						;//Non m'interessa cosa stai cercando di fare!
	OkayKeepIt					=	"SVM_14_OkayKeepIt"						;//Smettila!
	WhatsThat					=	"SVM_14_WhatsThat"						;//Cosa è stato?
	ThatsMyWeapon				=	"SVM_14_ThatsMyWeapon"					;//Restituiscimi l'arma!
	GiveItToMe					=	"SVM_14_GiveItToMe"						;//Dammela!
	YouCanKeeptheCrap			=	"SVM_14_YouCanKeeptheCrap"				;//Va bene. Non lo voglio più!
	TheyKilledMyFriend			=	"SVM_14_TheyKilledMyFriend"				;//Uno dei nostri è stato ucciso. Troveremo il colpevole...
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"			;//Stai disturbando i miei studi!
	SuckerGotSome				=	"SVM_14_SuckerGotSome"					;//Ho sentito dire che sei nei guai!
	SuckerDefeatedEBr			=	"SVM_14_SuckerDefeatedEBr"				;//Hai battuto un barone delle miniere! Deve esserci rimasto di stucco!
	SuckerDefeatedGur			=	"SVM_14_SuckerDefeatedGur"				;//Hai sconfitto un guru! Sono impressionato.
	SuckerDefeatedMage			=	"SVM_14_SuckerDefeatedMage"				;//Sconfiggere un mago...
	SuckerDefeatedNov_Guard		= 	"SVM_14_SuckerDefeatedNov_Guard"		;//Sai benissimo che i novizi sono sotto la mia protezione, perché continui ad attaccarli?
	SuckerDefeatedVlk_Guard		= 	"SVM_14_SuckerDefeatedVlk_Guard"		;//Attaccando i minatori metti in pericolo i miei profitti!
	YouDefeatedMyComrade		=	"SVM_14_YouDefeatedMyComrade"			;//Non dovresti dar fastidio ai miei amici.
	YouDefeatedNOV_Guard		=	"SVM_14_YouDefeatedNOV_Guard"			;//Alza le mani su un altro novizio e te ne pentirai!
	YouDefeatedVLK_Guard		=	"SVM_14_YouDefeatedVLK_Guard"			;//Attacca un altro dei miei protetti e pagherai con la vita!
	YouStoleFromMe				=	"SVM_14_YouStoleFromMe"					;//Come osi farti vedere, sporco ladro?
	YouStoleFromUs				=	"SVM_14_YouStoleFromUs"					;//Hai degli oggetti che ci appartengono. Farai meglio a ridarceli.
	YouStoleFromEBr				=	"SVM_14_YouStoleFromEBr"				;//Hai derubato i baroni delle miniere! Saranno infuriati!
	YouStoleFromGur				=	"SVM_14_YouStoleFromGur"				;//Hai derubato i guru.
	StoleFromMage				=	"SVM_14_StoleFromMage"					;//Hai derubato i maghi.
	YouKilledMyFriend			=	"SVM_14_YouKilledMyFriend"				;//Hai ucciso uno dei nostri. Commetti un altro errore e sarà il tuo turno!
	YouKilledEBr				=	"SVM_14_YouKilledEBr"					;//Hai ucciso un barone delle miniere! Sei diventato pazzo?
	YouKilledGur				=	"SVM_14_YouKilledGur"					;//Hai ucciso un guru! Non posso crederci!
	YouKilledMage				=	"SVM_14_YouKilledMage"					;//Hai ucciso un mago! Come pensi di giustificarti?
	YouKilledOCfolk				=	"SVM_14_YouKilledOCfolk"				;//Un membro di Campo Vecchio è morto e sei nell'elenco dei sospettati...
	YouKilledNCfolk				=	"SVM_14_YouKilledNCfolk"				;//C'è stata una terribile tragedia a Campo Nuovo e sembra che tu ne sia coinvolto!
	YouKilledPSIfolk			=	"SVM_14_YouKilledPSIfolk"				;//La Fratellanza conta un credente in meno e hai la sua morte sulla coscienza!
	GetThingsRight				=	"SVM_14_GetThingsRight"					;//Non sarà facile rimettere a posto le cose!
	YouDefeatedMeWell			=	"SVM_14_YouDefeatedMeWell"				;//Mi hai dato una bella lezione, amico! Mi sono divertito, ma ora basta combattere!
	Smalltalk01					=	"SVM_14_Smalltalk01"					;// ...se credi...
	Smalltalk02					=	"SVM_14_Smalltalk02"					;// ...forse...
	Smalltalk03					=	"SVM_14_Smalltalk03"					;// ...pessima idea...
	Smalltalk04					=	"SVM_14_Smalltalk04"					;// ...farò meglio a starne fuori...
	Smalltalk05					=	"SVM_14_Smalltalk05"					;// ...non è affar mio...
	Smalltalk06					=	"SVM_14_Smalltalk06"					;// ...era ovvio che ci sarebbero stati dei guai...
	Smalltalk07					=	"SVM_14_Smalltalk07"					;// ...ma tienilo per te: la gente non deve saperlo.
	Smalltalk08					=	"SVM_14_Smalltalk08"					;// ...non accadrà di nuovo...
	Smalltalk09					=	"SVM_14_Smalltalk09"					;// ...doveva esserci del vero in quella storia, dopo tutto...
	Smalltalk10					=	"SVM_14_Smalltalk10"					;// ...devi stare attento a ciò che dici in giro...
	Smalltalk11					=	"SVM_14_Smalltalk11"					;// ...dato che non mi riguarda...
	Smalltalk12					=	"SVM_14_Smalltalk12"					;// ...non dovresti credere a tutto ciò che senti...
	Smalltalk13					=	"SVM_14_Smalltalk13"					;// ...non vorrei essere nei suoi panni...
	Smalltalk14					=	"SVM_14_Smalltalk14"					;// ...sempre la stessa storia...
	Smalltalk15					=	"SVM_14_Smalltalk15"					;// ...certe persone non imparano mai...
	Smalltalk16					=	"SVM_14_Smalltalk16"					;// ...un tempo, le cose sarebbero andate diversamente...
	Smalltalk17					=	"SVM_14_Smalltalk17"					;// ...la gente parla troppo...
	Smalltalk18					=	"SVM_14_Smalltalk18"					;// ...non ascolto più le chiacchiere...
	Smalltalk19					=	"SVM_14_Smalltalk19"					;// ...fidati di qualcuno e ti ritroverai nei guai: ecco come vanno le cose...
	Smalltalk20					=	"SVM_14_Smalltalk20"					;// ...credo che non cambierà mai...
	Smalltalk21					=	"SVM_14_Smalltalk21"					;// ...probabilmente hai ragione...
	Smalltalk22					=	"SVM_14_Smalltalk22"					;// ...aspetta. Meglio non affrettarsi mai...
	Smalltalk23					=	"SVM_14_Smalltalk23"					;// ...pensavo che questa faccenda fosse stata sistemata molto tempo fa...
	Smalltalk24					=	"SVM_14_Smalltalk24"					;// ...parliamo di qualcos'altro...
	Om							= 	"SVM_14_Om"							;//Ommm!
};


//////////////////////////////////////////
INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Ehi, tu!
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Aspetta!

	SectGreetings			=	"SVM_15_SectGreetings"				;//Sveglia!
	ALGreetings				=	"SVM_15_ALGreetings"				;//Per Gomez!
	MageGreetings			=	"SVM_15_MageGreetings"				;//Salute!
	FriendlyGreetings		=	"SVM_15_FriendlyGreetings"			;//Salve!
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh!
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh!
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh!
	Dead					=	"SVM_15_Dead"						;//Aaargh!
	Awake					=	"SVM_15_Awake"						;//(si sveglia)
	DoesntWork				= 	"SVM_15_DoesntWork"					;//Non funziona.
	PickBroke				= 	"SVM_15_PickBroke"					;// È rotto.
	NeedKey					= 	"SVM_15_NeedKey"					;// Mi serve una chiave...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;// Hai terminato le chiavi scheletriche.
	InvFull					= 	"SVM_15_InvFull"					;// Non posso trasportarne ancora.
};

//////////////////////////////////////////
INSTANCE SVM_16	(C_SVM)				// Stimmbeschreibung	:		Babes halt!!!!!
{
	NotNow						=	"SVM_16_NotNow"			;	//Vattene! Non dovresti parlare con me!
	Help						=	"SVM_16_Help"			;	//(urla)
	Aargh_1						=	"SVM_16_Aargh_1"		;	//Aargh!
	Aargh_2						=	"SVM_16_Aargh_2"		;	//Aargh!
	Aargh_3						=	"SVM_16_Aargh_3"		;	//Aargh!
	Dead						=	"SVM_16_Dead"			;	//Aaargh!
};

//////////////////////////////////////////
INSTANCE SVM_17	(C_SVM)							//Ork-Stimme (alle SVMs werden auf wenige guturalen, unverständlichen Laute umgeleitet)
												//Die Dialoge mit dem verbannten Ork-Shamanen im Kastell und dem Ork-Sklaven in der Freien Mine laufen auch
												//über Stimme 17, sind aber in halbwegsverständlichem orkisch-deutsch
												//Das hier überall vergebene SVM_17_OrcSound01 wird noch durch 9 weitere Variationen ergänzt

// FIXME: mehr Varianten!?
{
	StopMagic					=	"SVM_17_OrcSound01"			;//
	ISaidStopMagic				=	"SVM_17_OrcSound02"			;//ROK KRUSHAK KOR GANORG
	WeaponDown					=	"SVM_17_OrcSound03"			;//NEMROK KA VARROK
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




