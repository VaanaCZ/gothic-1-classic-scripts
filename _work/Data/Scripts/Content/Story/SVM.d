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
	VAR	STRING	Om;							// Hmmm (Meditation)

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
	StopMagic					=	"SVM_1_StopMagic"					;//Přestaň s těmi čáry!
	ISaidStopMagic				=	"SVM_1_ISaidStopMagic"				;//Chceš jednu koupit? Okamžitě toho nech!
	WeaponDown					=	"SVM_1_WeaponDown"					;//Dej pryč tu zbraň!
	ISaidWeaponDown				=	"SVM_1_ISaidWeaponDown"				;//Dej tu zatracenou zbraň pryč!
	WatchYourAim				=	"SVM_1_WatchYourAim"				;//Pryč s ní!
	WatchYourAimAngry			=	"SVM_1_WatchYourAimAngry"			;//Jestli chceš pořádnou do zubů, tak na mě zkus ještě zamířit!
	WhatAreYouDoing				=	"SVM_1_WhatAreYouDoing"				;//Dej si pozor! Ještě jednou a máš ji!
	LetsForgetOurLittleFight	=	"SVM_1_LetsForgetOurLittleFight"	;//Zapomeneme na tohle malé nedorozumění, oukej?
	Strange						=	"SVM_1_Strange"						;//Odpal, ty bastarde!
	DieMonster					=	"SVM_1_DieMonster"					;//Ty proklatej čubčí synu!
	DieMortalEnemy				=	"SVM_1_DieMortalEnemy"				;//Teď si to odneseš!
	NowWait						=	"SVM_1_NowWait"						;//Napálím ti jí takovou...
	YouStillNotHaveEnough		=	"SVM_1_YouStillNotHaveEnough"		;//Vypadáš, jako kdybys chtěl jednu na tlamu!
	YouAskedForIt				=	"SVM_1_YouAskedForIt"				;//Říkáš si o to!
	NowWaitIntruder				= 	"SVM_1_NowWaitIntruder"				;//Mám pocit, že tě odtud odnesou po kouskách.
	IWillTeachYouRespectForForeignProperty	=	"SVM_1_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem tě, abys dal pracky pryč od mých věcí!
	DirtyThief					=	"SVM_1_DirtyThief"					;//Skončím to s tebou, zloději!
	YouAttackedMyCharge			=	"SVM_1_YouAttackedMyCharge"			;//Na moje kamarády si nikdo dovolovat nebude!
	YouKilledOneOfUs			=	"SVM_1_YouKilledOneOfUs"			;//Vztáhl jsi ruku na jednoho z nás,  teď přijde řada na tebe!
	Dead						=	"SVM_1_Dead"						;//Aaaaaargl!
	Aargh_1						=	"SVM_1_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_1_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_1_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_1_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_1_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_1_YesYes"						;//Žádný strach! Zvítězil jsi!
	ShitWhatAMonster			=	"SVM_1_ShitWhatAMonster"			;//K sakru! Utíkej, jak nejrychleji umíš!
	Help						=	"SVM_1_Help"						;//K čertu!
	WeWillMeetAgain				=	"SVM_1_WeWillMeetAgain"				;//Ještě se uvidíme!
	NeverTryThatAgain			=	"SVM_1_NeverTryThatAgain"			;//Zkus to ještě jednou a budeš litovat!
	ITakeYourWeapon				=	"SVM_1_ITakeYourWeapon"				;//Pěkná zbraň! Dej mi ji!
	ITookYourOre				=	"SVM_1_ITookYourOre"				;//Díky, hrdino!
	ShitNoOre					=	"SVM_1_ShitNoOre"					;//Ty bídnej červe, nemáš ani kousek rudy!
	HandsOff					=	"SVM_1_HandsOff"					;//Ruce od toho pryč!
	GetOutOfHere				=	"SVM_1_GetOutOfHere"				;//Kliď se odsuď!
	YouViolatedForbiddenTerritory=	"SVM_1_YouViolatedForbiddenTerritory";//Hej! Jak ses sem dostal?
	YouWannaFoolMe				=	"SVM_1_YouWannaFoolMe"				;//Myslíš, že jsem hlupák?
	WhatsThisSupposedToBe		=	"SVM_1_WhatsThisSupposedToBe"		;//Hej, ty! Co tady pohledáváš?
	WhyAreYouInHere				=	"SVM_1_WhyYouAreInHere"				;//Vypadni z mojí chatrče nebo zavolám stráže!
	WhatDidYouInThere			=	"SVM_1_WhatDidYouInThere"			;//Tady nemáš co dělat! Vypadni!
	WiseMove					=	"SVM_1_WiseMove"					;//Bystrej chlapík!
	Alarm						=	"SVM_1_Alarm"						;//Stráže! Sem!
	IntruderAlert				= 	"SVM_1_IntruderAlert"				;//POZOR!! VETŘELEC!!
	BehindYou					=	"SVM_1_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_1_TheresAFight"				;//Hej, do boje!
	HeyHeyHey					=	"SVM_1_HeyHeyHey"					;//Pořádně!
	CheerFight					=	"SVM_1_CheerFight"					;//Pereš se jako ženská!
	CheerFriend					=	"SVM_1_CheerFriend"					;//Skonči to s ním!
	Ooh							=	"SVM_1_Ooh"							;//Vyřiď ho!
	YeahWellDone				=	"SVM_1_YeahWellDone"				;//Dej mu co proto!
	RunCoward					=	"SVM_1_RunCoward"					;//Kliď se, ty nádhero!
	HeDefeatedHim				=	"SVM_1_HeDefeatedHim"				;//Ten má dost!
	HeDeservedIt				=	"SVM_1_HeDeservedIt"				;//Podej si ho!
	HeKilledHim					=	"SVM_1_HeKilledHim"					;//Proč jsi ho zabil? Jako bys byl mrtvej!
	ItWasAGoodFight				=	"SVM_1_ItWasAGoodFight"				;//Dobrá práce!
	Awake						=	"SVM_1_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_1_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_1_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_1_MageGreetings"				;//Za slávu magie!
	SectGreetings				=	"SVM_1_SectGreetings"				;//Vzbuď se!
	ThereHeIs					= 	"SVM_1_ThereHeIs"					;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_1_NoLearnNoPoints"				;//Vrať se, až budeš moudřejší.
	NoLearnOverMax				= 	"SVM_1_NoLearnOverMax"				;//Jsi u konce svých možností. Měl by ses učit něco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_1_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vůdcem, musíš na sobě ještě pracovat!
	NoLearnYoureBetter			=	"SVM_1_NoLearnYoureBetter"			;//Už je to s tebou lepší!
	HeyYou						=	"SVM_1_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_1_NotNow"						;//Teď ne!
	WhatDoYouWant				=	"SVM_1_WhatDoYouWant"				;//Co chceš?
	ISaidWhatDoYouWant			=	"SVM_1_ISaidWhatDoYouWant"			;//Můžu pro tebe něco udělat?
	MakeWay						=	"SVM_1_MakeWay"						;//Nech mě jít!
	OutOfMyWay					=	"SVM_1_OutOfMyWay"					;//Uhni mi z cesty, člověče!
	YouDeafOrWhat				=	"SVM_1_YouDeafOrWhat"				;//Jseš hluchej? TAK UHNI!
	LookingForTroubleAgain		=	"SVM_1_LookingForTroubleAgain"		;//Chceš mít problémy?
	LookAway					=	"SVM_1_LookAway"					;//Uhhh! Nic jsem neviděl!
	OkayKeepIt					=	"SVM_1_OkayKeepIt"					;//Dobrá, dobrá! Tak si jí nech!
	WhatsThat					=	"SVM_1_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_1_ThatsMyWeapon"				;//Chodíš tu s MOJÍ zbraní!
	GiveItToMe					=	"SVM_1_GiveItToMe"					;//Dej mi tu věcičku!
	YouCanKeeptheCrap			=	"SVM_1_YouCanKeeptheCrap"			;//Tak si jí nech! Já ji beztak nepotřebuju!
	TheyKilledMyFriend			=	"SVM_1_TheyKilledMyFriend"			;//Dostali jednoho z našich chlapíků. Až já toho lotra dostanu...
	YouDisturbedMySlumber		=	"SVM_1_YouDisturbedMySlumber"		;//K čertu, proč mě budíš?
	SuckerGotSome				=	"SVM_1_SuckerGotSome"				;//Dostal jsi nakládačku? Dobře ti tak!
	SuckerDefeatedEBr			=	"SVM_1_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Má na tebe vztek!
	SuckerDefeatedGur			=	"SVM_1_SuckerDefeatedGur"			;//Porazil jsi Guru. Vypadá to, že přitahuješ problémy jako magnet!
	SuckerDefeatedMage			=	"SVM_1_SuckerDefeatedMage"			;//Zvítězit nad mágem není zrovna dobrý nápad!
	SuckerDefeatedNov_Guard		= 	"SVM_1_SuckerDefeatedNov_Guard"		;//Nemůžeš se tu potloukat a mlátit novice!
	SuckerDefeatedVlk_Guard		= 	"SVM_1_SuckerDefeatedVlk_Guard"		;//Nech mé chlapy na pokoji!
	YouDefeatedMyComrade		=	"SVM_1_YouDefeatedMyComrade"		;//Odrovnal jsi mého kamaráda...
	YouDefeatedNOV_Guard		=	"SVM_1_YouDefeatedNOV_Guard"		;//Nebudeš tu dělat problémy!
	YouDefeatedVLK_Guard		=	"SVM_1_YouDefeatedVLK_Guard"		;//Jestli vztáhneš ruku na někoho, kdo je pod mojí ochranou, tak si to schytáš!
	YouStoleFromMe				=	"SVM_1_YouStoleFromMe"				;//Seš mi ukradenej, ty zmetku! Už to znovu nezkoušej!
	YouStoleFromUs				=	"SVM_1_YouStoleFromUs"				;//Chceme naše věci zpátky! Vrať nám je!
	YouStoleFromEBr				=	"SVM_1_YouStoleFromEBr"				;//Kradl jsi u Rudobaronů? Probůh, proč?
	YouStoleFromGur				=	"SVM_1_YouStoleFromGur"				;//Okradl jsi Guru? Jaká škoda, že tě nachytali!
	StoleFromMage				=	"SVM_1_StoleFromMage"				;//Kradl jsi u mágů! Jak stupidní nápad!
	YouKilledMyFriend			=	"SVM_1_YouKilledMyFriend"			;//Jeden z našich lidí zemřel a ty s tím máš co do činění! Stačí malá chybička a půjdeš za ním!
	YouKilledEBr				=	"SVM_1_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronů! Člověče, úplně ses pominul?
	YouKilledGur				=	"SVM_1_YouKilledGur"				;//Zabil jsi jednoho z Guru! Hochu, tomu nemůžu uvěřit!
	YouKilledMage				=	"SVM_1_YouKilledMage"				;//Zabil jsi jednoho z mágů! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_1_YouKilledOCfolk"				;//Jeden z členů Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_1_YouKilledNCfolk"				;//Nový tábor utrpěl těžkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_1_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svých věřících a ty ho máš na svědomí!
	GetThingsRight				=	"SVM_1_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_1_YouDefeatedMeWell"			;//Byl to dobrý boj! Pořádně jsem to od tebe schytal, člověče!
	Smalltalk01					=	"SVM_1_Smalltalk01"					;// ...nejhorší špína...
	Smalltalk02					=	"SVM_1_Smalltalk02"					;// ...možná, ale koho to zajímá?
	Smalltalk03					=	"SVM_1_Smalltalk03"					;// ...naprosto stupidní...
	Smalltalk04					=	"SVM_1_Smalltalk04"					;// ...udělám nejlíp, když se budu držet dál...
	Smalltalk05					=	"SVM_1_Smalltalk05"					;// ...tohle opravdu není můj problém...
	Smalltalk06					=	"SVM_1_Smalltalk06"					;// ...bylo jasné, že z toho bude mrzutost...
	Smalltalk07					=	"SVM_1_Smalltalk07"					;// ...proč se to dělo pořád dál...
	Smalltalk08					=	"SVM_1_Smalltalk08"					;// ...už se to znovu nestane...
	Smalltalk09					=	"SVM_1_Smalltalk09"					;// ...a přesto na tom musí něco být...
	Smalltalk10					=	"SVM_1_Smalltalk10"					;// ...šetři si dech, jo, jo...
	Smalltalk11					=	"SVM_1_Smalltalk11"					;// ...jestli se mě to netýká...
	Smalltalk12					=	"SVM_1_Smalltalk12"					;// ...neměl bys všemu věřit...
	Smalltalk13					=	"SVM_1_Smalltalk13"					;// ...přesto bych nechtěl být v jeho kůži...
	Smalltalk14					=	"SVM_1_Smalltalk14"					;// ...pořád ta samá pohádka...
	Smalltalk15					=	"SVM_1_Smalltalk15"					;// ...někteří lidé se nikdy nepoučí...
	Smalltalk16					=	"SVM_1_Smalltalk16"					;// ...dříve bývalo všechno docela jinak...
	Smalltalk17					=	"SVM_1_Smalltalk17"					;// ...lidé říkají...
	Smalltalk18					=	"SVM_1_Smalltalk18"					;// ...takové řeči já nikdy neposlouchám...
	Smalltalk19					=	"SVM_1_Smalltalk19"					;// ...na někoho se spoléháš a dostaneš se do problémů, tak to chodí...
	Smalltalk20					=	"SVM_1_Smalltalk20"					;// ...pochybuji, že by se to mohlo změnit...
	Smalltalk21					=	"SVM_1_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_1_Smalltalk22"					;// ...vydrž. Lepší je do ničeho se nepouštět...
	Smalltalk23					=	"SVM_1_Smalltalk23"					;// ...myslel jsem, že už je to dávno za námi...
	Smalltalk24					=	"SVM_1_Smalltalk24"					;// ...pojďme raději mluvit o něčem jiném...
	Om							= 	"SVM_1_Om"							;//Hmmm
};


//SVM_2	// Misstrauisch (Volk, Bauern, Novizen, MILTEN) Misstrauisch. Defensiv. Angst in was reingezogen zu werden. Klug. Nov: Glauben durch Einschüchterung

instance SVM_2 (C_SVM)				// Misstrauisch
{
	StopMagic					=	"SVM_2_StopMagic"					;//Žádná kouzla!
	ISaidStopMagic				=	"SVM_2_ISaidStopMagic"				;//HEJ! Řekl jsem žádné čáry!
	WeaponDown					=	"SVM_2_WeaponDown"					;//Dělej! Dej tu věc pryč!
	ISaidWeaponDown				=	"SVM_2_ISaidWeaponDown"				;//Dej tu zbraň pryč!
	WatchYourAim				=	"SVM_2_WatchYourAim"				;//Dívej se, kam míříš!
	WatchYourAimAngry			=	"SVM_2_WatchYourAimAngry"			;//Jestli zamíříš na mě, budu si to brát osobně!
	WhatAreYouDoing				=	"SVM_2_WhatAreYouDoing"				;//Hej, co to má znamenat?
	LetsForgetOurLittleFight	=	"SVM_2_LetsForgetOurLittleFight"	;//Zapomeneme na to, dobrá?
	Strange						=	"SVM_2_Strange"						;//Zvláštní! Kam se poděl?
	DieMonster					=	"SVM_2_DieMonster"					;//A další!
	DieMortalEnemy				=	"SVM_2_DieMortalEnemy"				;//Obávám se, že tě budu muset zlikvidovat
	NowWait						=	"SVM_2_NowWait"						;//Tvoje chyba!
	YouStillNotHaveEnough		=	"SVM_2_YouStillNotHaveEnough"		;//Nemáš ještě dost?
	YouAskedForIt				=	"SVM_2_YouAskedForIt"				;//Jestli po tom opravdu toužíš!
	NowWaitIntruder				= 	"SVM_2_NowWaitIntruder"				;//Víš, že tu nemáš co dělat!
	IWillTeachYouRespectForForeignProperty	=	"SVM_2_IWillTeachYouRespectForForeignProperty"	;//Proč se pleteš do věcí, do kterých ti nic není?
	DirtyThief					=	"SVM_2_DirtyThief"					;//Tys tady kradl! Tohle ti nezapomenu!
	YouAttackedMyCharge			=	"SVM_2_YouAttackedMyCharge"			;//Na moje chlapy si nikdo vyskakovat nebude!
	YouKilledOneOfUs			=	"SVM_2_YouKilledOneOfUs"			;//Zabil jsi jednoho z nás! Za to zaplatíš!
	Dead						=	"SVM_2_Dead"						;//Aaargl
	Aargh_1						=	"SVM_2_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_2_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_2_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_2_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_2_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_2_YesYes"						;//Klid, klid, vyhrál jsi!
	ShitWhatAMonster			=	"SVM_2_ShitWhatAMonster"			;//Já - ehm - s malou pomocí!
	Help						=	"SVM_2_Help"						;//Nemám čas, jenom si vyřídím své věci!
	WeWillMeetAgain				=	"SVM_2_WeWillMeetAgain"				;//Určitě se ještě uvidíme!
	NeverTryThatAgain			=	"SVM_2_NeverTryThatAgain"			;//Už to znova nezkoušej!
	ITakeYourWeapon				=	"SVM_2_ITakeYourWeapon"				;//Tuhle zbraň si vezmu!
	ITookYourOre				=	"SVM_2_ITookYourOre"				;//Tolik rudy nebudeš stejně potřebovat!
	ShitNoOre					=	"SVM_2_ShitNoOre"					;//Ty nemáš žádnou rudu? Tohle nevypadá na tvůj šťastný den!
	HandsOff					=	"SVM_2_HandsOff"					;//Ruce od toho pryč!
	GetOutOfHere				=	"SVM_2_GetOutOfHere"				;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_2_YouViolatedForbiddenTerritory";//Hej! Jak ses sem dostal?
	YouWannaFoolMe				=	"SVM_2_YouWannaFoolMe"				;//Není od tebe chytré mít mě za hlupáka!
	WhatsThisSupposedToBe		=	"SVM_2_WhatsThisSupposedToBe"		;//Co tady pohledáváš?
	WhyAreYouInHere				=	"SVM_2_WhyYouAreInHere"				;//Vypadni z mojí chatrče nebo zavolám stráže!
	WhatDidYouInThere			=	"SVM_2_WhatDidYouInThere"			;//Vypadni z mojí chatrče!
	WiseMove					=	"SVM_2_WiseMove"					;//Správné rozhodnutí!
	Alarm						=	"SVM_2_Alarm"						;//Stráže! Sem!
	IntruderAlert				= 	"SVM_2_IntruderAlert"				;//POZOR!!
	BehindYou					=	"SVM_2_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_2_TheresAFight"				;//Hej, do boje!
	HeyHeyHey					=	"SVM_2_HeyHeyHey"					;//To je všechno!
	CheerFight					=	"SVM_2_CheerFight"					;//Vstávej, lenochu!
	CheerFriend					=	"SVM_2_CheerFriend"					;//Dobrá rána!
	Ooh							=	"SVM_2_Ooh"							;//Vyřiď ho!
	YeahWellDone				=	"SVM_2_YeahWellDone"				;//Ještě se hýbe!
	RunCoward					=	"SVM_2_RunCoward"					;//Kliď se, ty nádhero!
	HeDefeatedHim				=	"SVM_2_HeDefeatedHim"				;//Ten má dost!
	HeDeservedIt				=	"SVM_2_HeDeservedIt"				;//To mu patří!
	HeKilledHim					=	"SVM_2_HeKilledHim"					;//Tys ho zabil! Bylo to nutné?
	ItWasAGoodFight				=	"SVM_2_ItWasAGoodFight"				;//Skvělý boj, jen trochu krátký!
	Awake						=	"SVM_2_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_2_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_2_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_2_MageGreetings"				;//Za slávu magie
	SectGreetings				=	"SVM_2_SectGreetings"				;//Vzbuď se!
	ThereHeIs					= 	"SVM_2_ThereHeIs"					;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_2_NoLearnNoPoints"				;//Nemůžu tě nic naučit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_2_NoLearnOverMax"				;//Jsi u konce svých možností. Měl by ses učit něco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_2_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vůdcem, musíš na sobě ještě pracovat!
	NoLearnYoureBetter			=	"SVM_2_NoLearnYoureBetter"			;//Už je to s tebou lepší!
	HeyYou						=	"SVM_2_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_2_NotNow"						;//Teď ne!
	WhatDoYouWant				=	"SVM_2_WhatDoYouWant"				;//Co chceš?
	ISaidWhatDoYouWant			=	"SVM_2_ISaidWhatDoYouWant"			;//Můžu pro tebe něco udělat?
	MakeWay						=	"SVM_2_MakeWay"						;//Nech mě jít!
	OutOfMyWay					=	"SVM_2_OutOfMyWay"					;//Uhni mi z cesty, člověče!
	YouDeafOrWhat				=	"SVM_2_YouDeafOrWhat"				;//Ztrať se, nebo se po tobě projdu!
	LookingForTroubleAgain		=	"SVM_2_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_2_LookAway"					;//NIC jsem neviděl! VŠECHNO je v pořádku!
	OkayKeepIt					=	"SVM_2_OkayKeepIt"					;//Dobrá! Je tvoje!
	WhatsThat					=	"SVM_2_WhatsThat"					;//Hej? Co?
	ThatsMyWeapon				=	"SVM_2_ThatsMyWeapon"				;//To, s čím tady chodíš, vypadá jako moje zbraň!
	GiveItToMe					=	"SVM_2_GiveItToMe"					;//Pojď a dej mi tu věcičku!
	YouCanKeeptheCrap			=	"SVM_2_YouCanKeeptheCrap"			;//Já ji beztak nepotřebuju!
	TheyKilledMyFriend			=	"SVM_2_TheyKilledMyFriend"			;//Dostali jednoho z našich chlapíků. Až my toho lotra dostaneme...
	YouDisturbedMySlumber		=	"SVM_2_YouDisturbedMySlumber"		;//Proč mě budíš?
	SuckerGotSome				=	"SVM_2_SuckerGotSome"				;//Dostali tě! Musím přiznat, že to bylo dobrý!
	SuckerDefeatedEBr			=	"SVM_2_SuckerDefeatedEBr"			;//Přemohl jsi Rudobarona!
	SuckerDefeatedGur			=	"SVM_2_SuckerDefeatedGur"			;//Porazil jsi Guru. Nevím, jestli je to odvaha nebo bláznovství!
	SuckerDefeatedMage			=	"SVM_2_SuckerDefeatedMage"			;//Zvítězit nad mágem... Musíš mít pro strach uděláno!
	SuckerDefeatedNov_Guard		= 	"SVM_2_SuckerDefeatedNov_Guard"		;//Musím tu sjednat pořádek!
	SuckerDefeatedVlk_Guard		= 	"SVM_2_SuckerDefeatedVlk_Guard"		;//Nezáleží na tom, co máš v úmyslu! Jestli odrovnáš některého kopáče, budeš v maléru!
	YouDefeatedMyComrade		=	"SVM_2_YouDefeatedMyComrade"		;//Odrovnal jsi jednoho z mých kamarádů!
	YouDefeatedNOV_Guard		=	"SVM_2_YouDefeatedNOV_Guard"		;//Nech ty novice na pokoji!
	YouDefeatedVLK_Guard		=	"SVM_2_YouDefeatedVLK_Guard"		;//Moje chlapy necháš na pokoji! Jasný?
	YouStoleFromMe				=	"SVM_2_YouStoleFromMe"				;//Proč jsi mě okradl?
	YouStoleFromUs				=	"SVM_2_YouStoleFromUs"				;//Sebral jsi něco, co bylo naše. Chceme to zpátky!
	YouStoleFromEBr				=	"SVM_2_YouStoleFromEBr"				;//Člověče, tys kradl u Rudobaronů? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_2_YouStoleFromGur"				;//Okradl jsi Guru? Máš štěstí, že tě nechytili!
	StoleFromMage				=	"SVM_2_StoleFromMage"				;//Mágové nemají rádi lidi, co se motají kolem jejich věcí!
	YouKilledMyFriend			=	"SVM_2_YouKilledMyFriend"			;//Máš na svědomí jednoho z našich mužů. Stačí malá chybička a přijde řada na tebe!
	YouKilledEBr				=	"SVM_2_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronů! Člověče, úplně ses pominul?
	YouKilledGur				=	"SVM_2_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nemůžu tomu uvěřit!
	YouKilledMage				=	"SVM_2_YouKilledMage"				;//Zabil jsi jednoho z mágů! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_2_YouKilledOCfolk"				;//Jeden z členů Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_2_YouKilledNCfolk"				;//Nový tábor utrpěl těžkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_2_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svých věřících a ty ho máš na svědomí!
	GetThingsRight				=	"SVM_2_GetThingsRight"				;//Máš vůbec ponětí, jak je těžké dát to zas do pořádku?
	YouDefeatedMeWell			=	"SVM_2_YouDefeatedMeWell"			;//Ano, vítězíš. Byl to dobrý boj! Ale teď už je konec!
	Smalltalk01					=	"SVM_2_Smalltalk01"					;// ...když myslíš...
	Smalltalk02					=	"SVM_2_Smalltalk02"					;// ...možná...
	Smalltalk03					=	"SVM_2_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_2_Smalltalk04"					;// ...udělám nejlíp, když se budu držet dál...
	Smalltalk05					=	"SVM_2_Smalltalk05"					;// ...tohle opravdu není můj problém...
	Smalltalk06					=	"SVM_2_Smalltalk06"					;// ...bylo jasné, že z toho bude mrzutost...
	Smalltalk07					=	"SVM_2_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vědět...
	Smalltalk08					=	"SVM_2_Smalltalk08"					;// ...už se to znovu nestane...
	Smalltalk09					=	"SVM_2_Smalltalk09"					;// ...a přesto na tom musí něco být...
	Smalltalk10					=	"SVM_2_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem říkáš...
	Smalltalk11					=	"SVM_2_Smalltalk11"					;// ...jestli se mě to netýká...
	Smalltalk12					=	"SVM_2_Smalltalk12"					;// ...neměl bys všemu věřit...
	Smalltalk13					=	"SVM_2_Smalltalk13"					;// ...přesto bych nechtěl být v jeho kůži...
	Smalltalk14					=	"SVM_2_Smalltalk14"					;// ...pořád ta samá pohádka...
	Smalltalk15					=	"SVM_2_Smalltalk15"					;// ...někteří lidé se nikdy nepoučí...
	Smalltalk16					=	"SVM_2_Smalltalk16"					;// ...dříve bývalo všechno docela jinak...
	Smalltalk17					=	"SVM_2_Smalltalk17"					;// ...lidé říkají...
	Smalltalk18					=	"SVM_2_Smalltalk18"					;// ...takové řeči já nikdy neposlouchám...
	Smalltalk19					=	"SVM_2_Smalltalk19"					;// ...na někoho se spoléháš a dostaneš se do problémů, tak to chodí...
	Smalltalk20					=	"SVM_2_Smalltalk20"					;// ...pochybuji, že by se to mohlo změnit...
	Smalltalk21					=	"SVM_2_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_2_Smalltalk22"					;// ...vydrž. Lepší je do ničeho se nepouštět...
	Smalltalk23					=	"SVM_2_Smalltalk23"					;// ...myslel jsem, že už je to dávno za námi...
	Smalltalk24					=	"SVM_2_Smalltalk24"					;// ...pojďme raději mluvit o něčem jiném...
	Om							= 	"SVM_2_Om"							;// Hmmm
};




instance SVM_3 (C_SVM)				 // Depressiv (Resigniert. Menschliches Gemüse. "Ich schau noch´n bisschen an die Decke.." , "Wir sind eh alle verloren..." Nov:Glauben an Drogen
{
	StopMagic					=	"SVM_3_StopMagic"					;//Žádné čarování!
	ISaidStopMagic				=	"SVM_3_ISaidStopMagic"				;//Přestaň už s těmi kouzly!
	WeaponDown					=	"SVM_3_WeaponDown"					;//Polož tu zbraň!
	ISaidWeaponDown				=	"SVM_3_ISaidWeaponDown"				;//Jestli se tu s tou zbraní budeš motat, dostanu vztek!
	WatchYourAim				=	"SVM_3_WatchYourAim"				;//Proč na mě míříš?
	WatchYourAimAngry			=	"SVM_3_WatchYourAimAngry"			;//Polož tu zbraň nebo budu zlej!
	WhatAreYouDoing				=	"SVM_3_WhatAreYouDoing"				;//Hééj, co to má znamenat?
	LetsForgetOurLittleFight	=	"SVM_3_LetsForgetOurLittleFight"	;//Dobrá, berme tuhle hádku jako malé nedorozumění.
	Strange						=	"SVM_3_Strange"						;//Je pryč! Kam se poděl?
	DieMonster					=	"SVM_3_DieMonster"					;//Ty prašivá bestie, ihned mě přestaň obtěžovat!
	DieMortalEnemy				=	"SVM_3_DieMortalEnemy"				;//Budu s tebou brzy hotovej!
	NowWait						=	"SVM_3_NowWait"						;//Asi budu muset mluvit jasněji!
	YouStillNotHaveEnough		=	"SVM_3_YouStillNotHaveEnough"		;//Vypadá to, že ještě nemáš  dost!
	YouAskedForIt				=	"SVM_3_YouAskedForIt"				;//Sám jsi to chtěl!
	NowWaitIntruder				= 	"SVM_3_NowWaitIntruder"				;//Nemáš tu co pohledávat! Budu tě odsuď muset vyrazit!
	IWillTeachYouRespectForForeignProperty	=	"SVM_3_IWillTeachYouRespectForForeignProperty"	;//Asi tě budu muset praštit přes prsty. Jediná věc, na kterou slyšíš!
	DirtyThief					=	"SVM_3_DirtyThief"					;//Tys tady kradl! Tohle ti nezapomenu!
	YouAttackedMyCharge			=	"SVM_3_YouAttackedMyCharge"			;//Nemůžeš tu na potkání hned každého spráskat!
	YouKilledOneOfUs			=	"SVM_3_YouKilledOneOfUs"			;//Zabil jsi jednoho z nás! To byl tvůj poslední omyl!
	Dead						=	"SVM_3_Dead"						;//Aaargl
	Aargh_1						=	"SVM_3_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_3_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_3_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_3_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_3_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_3_YesYes"						;//Vyhrál jsi! Dobrá!
	ShitWhatAMonster			=	"SVM_3_ShitWhatAMonster"			;//K sakru! Utíkej, jak nejrychleji umíš!
	Help						=	"SVM_3_Help"						;//Musím jít!
	WeWillMeetAgain				=	"SVM_3_WeWillMeetAgain"				;//Ještě se uvidíme!
	NeverTryThatAgain			=	"SVM_3_NeverTryThatAgain"			;//Už se o to nikdy nepokoušej!
	ITakeYourWeapon				=	"SVM_3_ITakeYourWeapon"				;//Díky za tu zbraň!
	ITookYourOre				=	"SVM_3_ITookYourOre"				;//Vezmu si ještě víc tvojí rudy!
	ShitNoOre					=	"SVM_3_ShitNoOre"					;//Ty už nemáš rudu? To je smutné, člověče, opravdu smutné!
	HandsOff					=	"SVM_3_HandsOff"					;//Ruce od toho pryč!
	GetOutOfHere				=	"SVM_3_GetOutOfHere"				;//Kliď se odsuď!
	YouViolatedForbiddenTerritory=	"SVM_3_YouViolatedForbiddenTerritory";//Hej! Odkud si přišel?
	YouWannaFoolMe				=	"SVM_3_YouWannaFoolMe"				;//Nejsem tak hloupý, jak si myslíš!
	WhatsThisSupposedToBe		=	"SVM_3_WhatsThisSupposedToBe"		;//Přestaň tu slídit!
	WhyAreYouInHere				=	"SVM_3_WhyYouAreInHere"				;//Kliď se z mojí chatrče nebo zavolám stráže!
	WhatDidYouInThere			=	"SVM_3_WhatDidYouInThere"			;//Co tady pohledáváš? Jestli tě dostanu, bude to tvůj konec!
	WiseMove					=	"SVM_3_WiseMove"					;//Však ty víš, co pro tebe bude nejlepší!
	Alarm						=	"SVM_3_Alarm"						;//Stráže! Sem!
	IntruderAlert				= 	"SVM_3_IntruderAlert"				;//POZOR!!
	BehindYou					=	"SVM_3_BehindYou"					;//Dej pozor!
	TheresAFight				=	"SVM_3_TheresAFight"				;//Do boje!
	HeyHeyHey					=	"SVM_3_HeyHeyHey"					;//Dej mu!
	CheerFight					=	"SVM_3_CheerFight"					;//O co se to pokoušíš?
	CheerFriend					=	"SVM_3_CheerFriend"					;//Dobrá rána!
	Ooh							=	"SVM_3_Ooh"							;//Ooooh!
	YeahWellDone				=	"SVM_3_YeahWellDone"				;//Výborně! Dobrá práce!
	RunCoward					=	"SVM_3_RunCoward"					;//Utíká pryč!
	HeDefeatedHim				=	"SVM_3_HeDefeatedHim"				;//Dostal ho!
	HeDeservedIt				=	"SVM_3_HeDeservedIt"				;//To už se mělo stát dávno!
	HeKilledHim					=	"SVM_3_HeKilledHim"					;//Ten už se ani nepohne! Zabil jsi ho!
	ItWasAGoodFight				=	"SVM_3_ItWasAGoodFight"				;//Pořád jen šarvátky...
	Awake						=	"SVM_3_Awake"						;//Zas další den a nic se nezměnilo...
	FriendlyGreetings			=	"SVM_3_FriendlyGreetings"			;//Hej, člověče.
	ALGreetings					=	"SVM_3_ALGreetings"					;//Za Gomeze! Hurá, hurá!
	MageGreetings				=	"SVM_3_MageGreetings"				;//Za slávu magie!
	SectGreetings				=	"SVM_3_SectGreetings"				;//Vzbuď se!
	ThereHeIs					= 	"SVM_3_ThereHeIs"					;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_3_NoLearnNoPoints"				;//Nemáš dost zkušeností. Tohle tě nemůžu naučit!
	NoLearnOverMax				= 	"SVM_3_NoLearnOverMax"				;//Jsi u konce svých možností. Měl by ses učit něco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_3_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vůdcem, musíš na sobě ještě pracovat!
	NoLearnYoureBetter			=	"SVM_3_NoLearnYoureBetter"			;//Už je to s tebou lepší!
	HeyYou						=	"SVM_3_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_3_NotNow"						;//Teď ne!
	WhatDoYouWant				=	"SVM_3_WhatDoYouWant"				;//Chceš ode mě něco?
	ISaidWhatDoYouWant			=	"SVM_3_ISaidWhatDoYouWant"			;//Můžu pro tebe něco udělat?
	MakeWay						=	"SVM_3_MakeWay"						;//Nech mě jít!
	OutOfMyWay					=	"SVM_3_OutOfMyWay"					;//Uhni mi z cesty, člověče!
	YouDeafOrWhat				=	"SVM_3_YouDeafOrWhat"				;//Kolikrát to budu opakovat? Nech mě jít!
	LookingForTroubleAgain		=	"SVM_3_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_3_LookAway"					;//NIC jsem neviděl! Ani tu vlastně nejsem!
	OkayKeepIt					=	"SVM_3_OkayKeepIt"					;//Dobrá, dobrá! Tak si jí nech!
	WhatsThat					=	"SVM_3_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_3_ThatsMyWeapon"				;//Máš moji zbraň!
	GiveItToMe					=	"SVM_3_GiveItToMe"					;//Dej mi ji!
	YouCanKeeptheCrap			=	"SVM_3_YouCanKeeptheCrap"			;//Jak myslíš! Beztak ji nepotřebuju!
	TheyKilledMyFriend			=	"SVM_3_TheyKilledMyFriend"			;//Dostali dalšího. Nikdo z nás se odsud nedostane živý...
	YouDisturbedMySlumber		=	"SVM_3_YouDisturbedMySlumber"		;//K čertu, proč mě budíš?
	SuckerGotSome				=	"SVM_3_SuckerGotSome"				;//Říkal sis o pořádnou nakládačku!
	SuckerDefeatedEBr			=	"SVM_3_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Asi si koleduješ o malér, viď?
	SuckerDefeatedGur			=	"SVM_3_SuckerDefeatedGur"			;//Porazil jsi jednoho z Guru. Budou mít na tebe pořádný vztek!
	SuckerDefeatedMage			=	"SVM_3_SuckerDefeatedMage"			;//Vítězství nad mágem znamená pořádný malér!
	SuckerDefeatedNov_Guard		= 	"SVM_3_SuckerDefeatedNov_Guard"		;//Uděláš líp, když necháš příště novice na pokoji!
	SuckerDefeatedVlk_Guard		= 	"SVM_3_SuckerDefeatedVlk_Guard"		;//Jestli zabiješ nějakého kopáče, tak ti to vrátím!
	YouDefeatedMyComrade		=	"SVM_3_YouDefeatedMyComrade"		;//Odrovnal jsi jednoho z mých přátel!
	YouDefeatedNOV_Guard		=	"SVM_3_YouDefeatedNOV_Guard"		;//Novicové jsou po mojí ochranou! Nech je na pokoji!
	YouDefeatedVLK_Guard		=	"SVM_3_YouDefeatedVLK_Guard"		;//Kopáči mi platí, a tak nemají žádné problémy! A tak to taky zůstane!
	YouStoleFromMe				=	"SVM_3_YouStoleFromMe"				;//Seš mi ukradenej, ty zatracenej zloději!
	YouStoleFromUs				=	"SVM_3_YouStoleFromUs"				;//Máš u sebe něco, co patří nám. Uděláš nejlíp, když nám to vrátíš!
	YouStoleFromEBr				=	"SVM_3_YouStoleFromEBr"				;//Člověče, tys kradl u Rudobaronů? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_3_YouStoleFromGur"				;//Okradl jsi Guru? Jaká škoda, že tě nachytali!
	StoleFromMage				=	"SVM_3_StoleFromMage"				;//Když už se pokoušíš okrást mágy, měl bys být důvtipnější!
	YouKilledMyFriend			=	"SVM_3_YouKilledMyFriend"			;//Máš na svědomí jednoho z našich mužů. Stačí malá chybička a přijde řada na tebe!
	YouKilledEBr				=	"SVM_3_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronů! Člověče, úplně ses pominul?
	YouKilledGur				=	"SVM_3_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nemůžu tomu uvěřit!
	YouKilledMage				=	"SVM_3_YouKilledMage"				;//Zabil jsi jednoho z mágů! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_3_YouKilledOCfolk"				;//Jeden z členů Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_3_YouKilledNCfolk"				;//Nový tábor utrpěl těžkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_3_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svých věřících a ty ho máš na svědomí!
	GetThingsRight				=	"SVM_3_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_3_YouDefeatedMeWell"			;//Byl to dobrý boj! Čert vem, žes mě porazil!
	Smalltalk01					=	"SVM_3_Smalltalk01"					;// ...když myslíš...
	Smalltalk02					=	"SVM_3_Smalltalk02"					;// ...možná...
	Smalltalk03					=	"SVM_3_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_3_Smalltalk04"					;// ...udělám nejlíp, když se budu držet dál...
	Smalltalk05					=	"SVM_3_Smalltalk05"					;// ...tohle opravdu není můj problém...
	Smalltalk06					=	"SVM_3_Smalltalk06"					;// ...bylo jasné, že z toho bude mrzutost...
	Smalltalk07					=	"SVM_3_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vědět...
	Smalltalk08					=	"SVM_3_Smalltalk08"					;// ...už se to znovu nestane...
	Smalltalk09					=	"SVM_3_Smalltalk09"					;// ...a přesto na tom musí něco být...
	Smalltalk10					=	"SVM_3_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem říkáš...
	Smalltalk11					=	"SVM_3_Smalltalk11"					;// ...jestli se mě to netýká...
	Smalltalk12					=	"SVM_3_Smalltalk12"					;// ...neměl bys všemu věřit...
	Smalltalk13					=	"SVM_3_Smalltalk13"					;// ...přesto bych nechtěl být v jeho kůži...
	Smalltalk14					=	"SVM_3_Smalltalk14"					;// ...pořád ta samá pohádka...
	Smalltalk15					=	"SVM_3_Smalltalk15"					;// ...někteří lidé se nikdy nepoučí...
	Smalltalk16					=	"SVM_3_Smalltalk16"					;// ...dříve bývalo všechno docela jinak...
	Smalltalk17					=	"SVM_3_Smalltalk17"					;// ...lidé říkají...
	Smalltalk18					=	"SVM_3_Smalltalk18"					;// ...takové řeči já nikdy neposlouchám...
	Smalltalk19					=	"SVM_3_Smalltalk19"					;// ...na někoho se spoléháš a dostaneš se do problémů, tak to chodí...
	Smalltalk20					=	"SVM_3_Smalltalk20"					;// ...pochybuji, že by se to mohlo změnit...
	Smalltalk21					=	"SVM_3_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_3_Smalltalk22"					;// ...vydrž. Lepší je do ničeho se nepouštět...
	Smalltalk23					=	"SVM_3_Smalltalk23"					;// ...myslel jsem, že už je to dávno za námi...
	Smalltalk24					=	"SVM_3_Smalltalk24"					;// ...pojďme raději mluvit o něčem jiném...
	Om							= 	"SVM_3_Om"							;// Hmmm
};


instance SVM_4 (C_SVM)				// Alter Sack,  (Torrez, KDF-Magier, alte Buddler....), alter Hase. Kann Grünschnäbeln noch was zeigen
{
	StopMagic					=	"SVM_4_StopMagic"					;//Přestaň s těmi čáry!
	ISaidStopMagic				=	"SVM_4_ISaidStopMagic"				;//Uděláš líp, když mě poslechneš a necháš toho čarování!
	WeaponDown					=	"SVM_4_WeaponDown"					;//Jestli se nechceš dostat do maléru, dej tu zbraň pryč!
	ISaidWeaponDown				=	"SVM_4_ISaidWeaponDown"				;//Odlož tu zbraň!
	WatchYourAim				=	"SVM_4_WatchYourAim"				;//Měl bys dávat pozor, kam míříš!
	WatchYourAimAngry			=	"SVM_4_WatchYourAimAngry"			;//Jestli s tím nepřestaneš, tak ti tu hračku seberu!
	WhatAreYouDoing				=	"SVM_4_WhatAreYouDoing"				;//Hej, ty tam! Dávej pozor!
	LetsForgetOurLittleFight	=	"SVM_4_LetsForgetOurLittleFight"	;//Zapomeňme na tohle malé nedorozumění.
	Strange						=	"SVM_4_Strange"						;//Neschovávej se! Ukaž se!
	DieMonster					=	"SVM_4_DieMonster"					;//Nezáleží na tom, kolik mužů zabiješ. Vždycky přijdou další!
	DieMortalEnemy				=	"SVM_4_DieMortalEnemy"				;//A ty už tu nebudeš!
	NowWait						=	"SVM_4_NowWait"						;//Radím ti, aby ses se mnou nedostal do křížku...
	YouStillNotHaveEnough		=	"SVM_4_YouStillNotHaveEnough"		;//Ty ještě nemáš dost?
	YouAskedForIt				=	"SVM_4_YouAskedForIt"				;//Říkáš si o to!
	NowWaitIntruder				= 	"SVM_4_NowWaitIntruder"				;//Bylo od tebe hloupé, že ses sem vetřel!
	IWillTeachYouRespectForForeignProperty	=	"SVM_4_IWillTeachYouRespectForForeignProperty"	;//Nemůžeš se tu motat a nebýt potrestán!
	DirtyThief					=	"SVM_4_DirtyThief"					;//Troufl sis mě okrást!
	YouAttackedMyCharge			=	"SVM_4_YouAttackedMyCharge"			;//To, že ses s náma dostal do křížku, ti nic dobrého nepřinese!
	YouKilledOneOfUs			=	"SVM_4_YouKilledOneOfUs"			;//Zabil jsi jednoho z nás. Oko za oko!
	Dead						=	"SVM_4_Dead"						;//Aaaaaargl!
	Aargh_1						=	"SVM_4_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_4_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_4_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_4_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_4_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_4_YesYes"						;//Klídek! Zvítězil jsi!
	ShitWhatAMonster			=	"SVM_4_ShitWhatAMonster"			;//Padej odsud jak nejrychleji umíš!
	Help						=	"SVM_4_Help"						;//Na to už jsem příliš starý!
	WeWillMeetAgain				=	"SVM_4_WeWillMeetAgain"				;//Tohle jen tak nezapomenu!
	NeverTryThatAgain			=	"SVM_4_NeverTryThatAgain"			;//Tohle už nikdy nezkoušej!
	ITakeYourWeapon				=	"SVM_4_ITakeYourWeapon"				;//Raději si tu zbraň vezmu sebou!
	ITookYourOre				=	"SVM_4_ITookYourOre"				;//Tvé rudě bude nejlépe v mých rukách!
	ShitNoOre					=	"SVM_4_ShitNoOre"					;//Už nikdy takové nedomrlé magické nugety.
	HandsOff					=	"SVM_4_HandsOff"					;//Ruce od toho pryč!
	GetOutOfHere				=	"SVM_4_GetOutOfHere"				;//Ztrať se odsuď!
	YouViolatedForbiddenTerritory=	"SVM_4_YouViolatedForbiddenTerritory";//Tady nemáš co dělat!
	YouWannaFoolMe				=	"SVM_4_YouWannaFoolMe"				;//Na takovéhle vtipy nemám náladu!
	WhatsThisSupposedToBe		=	"SVM_4_WhatsThisSupposedToBe"		;//Hej, ty! Co tady pohledáváš?
	WhyAreYouInHere				=	"SVM_4_WhyYouAreInHere"				;//Vypadni nebo zavolám stráže!
	WhatDidYouInThere			=	"SVM_4_WhatDidYouInThere"			;//Cos tady pohledával?
	WiseMove					=	"SVM_4_WiseMove"					;//Měls štěstí!
	Alarm						=	"SVM_4_Alarm"						;//Stráže! Sem!
	IntruderAlert				= 	"SVM_4_IntruderAlert"				;//VETŘELEC!!
	BehindYou					=	"SVM_4_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_4_TheresAFight"				;//Ještě jednou!
	HeyHeyHey					=	"SVM_4_HeyHeyHey"					;//Pořádně!
	CheerFight					=	"SVM_4_CheerFight"					;//To je všechno, co umíš?
	CheerFriend					=	"SVM_4_CheerFriend"					;//Skonči to s ním!
	Ooh							=	"SVM_4_Ooh"							;//Vrať mu to!
	YeahWellDone				=	"SVM_4_YeahWellDone"				;//Dobrá práce!
	RunCoward					=	"SVM_4_RunCoward"					;//Ten zbabělec prchá!
	HeDefeatedHim				=	"SVM_4_HeDefeatedHim"				;//Kdysi bývali muži z oceli!
	HeDeservedIt				=	"SVM_4_HeDeservedIt"				;//Tvoje chyba!
	HeKilledHim					=	"SVM_4_HeKilledHim"					;//Proč jsi ho zabil? To byla velká chyba!
	ItWasAGoodFight				=	"SVM_4_ItWasAGoodFight"				;//Za starých časů, to se bojovalo jinak!
	Awake						=	"SVM_4_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_4_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_4_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_4_MageGreetings"				;//Za slávu magie!
	SectGreetings				=	"SVM_4_SectGreetings"				;//Vzbuď se!
	ThereHeIs					= 	"SVM_4_ThereHeIs"					;//Najdeš ho támhle!
	NoLearnNoPoints				= 	"SVM_4_NoLearnNoPoints"				;//Nemůžu tě nic naučit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_4_NoLearnOverMax"				;//Jsi u konce svých možností. Měl by ses učit něco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_4_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vůdcem, musíš na sobě ještě pracovat!
	NoLearnYoureBetter			=	"SVM_4_NoLearnYoureBetter"			;//Už je to s tebou lepší než tehdy!
	HeyYou						=	"SVM_4_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_4_NotNow"						;//Teď ne!
	WhatDoYouWant				=	"SVM_4_WhatDoYouWant"				;//Co chceš?
	ISaidWhatDoYouWant			=	"SVM_4_ISaidWhatDoYouWant"			;//Něco po mně chceš?
	MakeWay						=	"SVM_4_MakeWay"						;//Nech mě jít!
	OutOfMyWay					=	"SVM_4_OutOfMyWay"					;//Uhni mi z cesty!
	YouDeafOrWhat				=	"SVM_4_YouDeafOrWhat"				;//Uhni mi z cesty, jinak budeš litovat!
	LookingForTroubleAgain		=	"SVM_4_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_4_LookAway"					;//Nic zlého nevidím, neslyším, neříkám...
	OkayKeepIt					=	"SVM_4_OkayKeepIt"					;//Tak si jí nech!
	WhatsThat					=	"SVM_4_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_4_ThatsMyWeapon"				;//Buď hodnej chlapec a vrať mi mou zbraň!
	GiveItToMe					=	"SVM_4_GiveItToMe"					;//Pojď a dej mi ji!
	YouCanKeeptheCrap			=	"SVM_4_YouCanKeeptheCrap"			;//Stejně jsem rád, že jsem se jí zbavil!
	TheyKilledMyFriend			=	"SVM_4_TheyKilledMyFriend"			;//Jestli zjistím, kdo zabil jednoho z nás...
	YouDisturbedMySlumber		=	"SVM_4_YouDisturbedMySlumber"		;//Rušíš můj odpočinek!
	SuckerGotSome				=	"SVM_4_SuckerGotSome"				;//Byls poražen! Potřeboval jsi pořádný výprask!
	SuckerDefeatedEBr			=	"SVM_4_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona!
	SuckerDefeatedGur			=	"SVM_4_SuckerDefeatedGur"			;//Porazil jsi jednoho z Guru. Obdivuhodné, ale už se o to znovu nepokoušej .
	SuckerDefeatedMage			=	"SVM_4_SuckerDefeatedMage"			;//Zvítězit nad mágem... Musíš mít pro strach uděláno!
	SuckerDefeatedNov_Guard		= 	"SVM_4_SuckerDefeatedNov_Guard"		;//Musíš být šílený, žes srazil toho novice.
	SuckerDefeatedVlk_Guard		= 	"SVM_4_SuckerDefeatedVlk_Guard"		;//Co sis vlastně myslel, že děláš, když jsi zabíjel kopáče?
	YouDefeatedMyComrade		=	"SVM_4_YouDefeatedMyComrade"		;//Dostal ses do maléru s jedním z mých přátel! To je dost zlý!
	YouDefeatedNOV_Guard		=	"SVM_4_YouDefeatedNOV_Guard"		;//Ještě jednou se dotkneš některého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_4_YouDefeatedVLK_Guard"		;//Jsi příliš smělý, problém s některým z mých chráněnců by pro tebe mohl znamenat nebezpečí.
	YouStoleFromMe				=	"SVM_4_YouStoleFromMe"				;//Ruce pryč od mých věcí, jasný?
	YouStoleFromUs				=	"SVM_4_YouStoleFromUs"				;//Máš u sebe něco, co patří nám. Vrať nám to!
	YouStoleFromEBr				=	"SVM_4_YouStoleFromEBr"				;//Člověče, tys kradl u Rudobaronů? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_4_YouStoleFromGur"				;//Okradl jsi Guru? Nemusel ses aspoň nechat chytit!
	StoleFromMage				=	"SVM_4_StoleFromMage"				;//Mágové nemají rádi lidi, co se motají kolem jejich věcí!
	YouKilledMyFriend			=	"SVM_4_YouKilledMyFriend"			;//Máš na svědomí jednoho z našich mužů. Stačí malá chybička a přijde řada na tebe!
	YouKilledEBr				=	"SVM_4_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronů! Člověče, úplně ses pominul?
	YouKilledGur				=	"SVM_4_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nemůžu tomu uvěřit!
	YouKilledMage				=	"SVM_4_YouKilledMage"				;//Zabil jsi jednoho z mágů! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_4_YouKilledOCfolk"				;//Jeden z členů Starého tábora je mrtev a tvé jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_4_YouKilledNCfolk"				;//Nový tábor utrpěl těžkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_4_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svých věřících a ty ho máš na svědomí!
	GetThingsRight				=	"SVM_4_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_4_YouDefeatedMeWell"			;//Pořádně jsi mi to nandal, člověče. Byl to dobrý boj! Ale teď už je konec!
	Smalltalk01					=	"SVM_4_Smalltalk01"					;// ...když myslíš...
	Smalltalk02					=	"SVM_4_Smalltalk02"					;// ...možná...
	Smalltalk03					=	"SVM_4_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_4_Smalltalk04"					;// ...udělám nejlíp, když se budu držet dál...
	Smalltalk05					=	"SVM_4_Smalltalk05"					;// ...tohle opravdu není můj problém...
	Smalltalk06					=	"SVM_4_Smalltalk06"					;// ...bylo jasné, že z toho bude mrzutost...
	Smalltalk07					=	"SVM_4_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vědět...
	Smalltalk08					=	"SVM_4_Smalltalk08"					;// ...už se to znovu nestane...
	Smalltalk09					=	"SVM_4_Smalltalk09"					;// ...a přesto na tom musí něco být...
	Smalltalk10					=	"SVM_4_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem říkáš...
	Smalltalk11					=	"SVM_4_Smalltalk11"					;// ...jestli se mě to netýká...
	Smalltalk12					=	"SVM_4_Smalltalk12"					;// ...neměl bys všemu věřit...
	Smalltalk13					=	"SVM_4_Smalltalk13"					;// ...přesto bych nechtěl být v jeho kůži...
	Smalltalk14					=	"SVM_4_Smalltalk14"					;// ...pořád ta samá pohádka...
	Smalltalk15					=	"SVM_4_Smalltalk15"					;// ...někteří lidé se nikdy nepoučí...
	Smalltalk16					=	"SVM_4_Smalltalk16"					;// ...dříve bývalo všechno docela jinak...
	Smalltalk17					=	"SVM_4_Smalltalk17"					;// ...lidé říkají...
	Smalltalk18					=	"SVM_4_Smalltalk18"					;// ...takové řeči já nikdy neposlouchám...
	Smalltalk19					=	"SVM_4_Smalltalk19"					;// ...na někoho se spoléháš a dostaneš se do problémů, tak to chodí...
	Smalltalk20					=	"SVM_4_Smalltalk20"					;// ...pochybuji, že by se to mohlo změnit...
	Smalltalk21					=	"SVM_4_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_4_Smalltalk22"					;// ...vydrž. Lepší je do ničeho se nepouštět...
	Smalltalk23					=	"SVM_4_Smalltalk23"					;// ...myslel jsem, že už je to dávno za námi...
	Smalltalk24					=	"SVM_4_Smalltalk24"					;// ...pojďme raději mluvit o něčem jiném...
	Om							= 	"SVM_4_Om"							;//Hmmm
};


instance SVM_5 (C_SVM)				//Lebenskünstler, offen, Fröhlich. humorvoller Verarscher. Auch: Fauler Verpisser. Selbstbewußt, wortgewandt, charismatisch. (Lester)
{
	StopMagic					=	"SVM_5_StopMagic"					;//Žádné čarování!
	ISaidStopMagic				=	"SVM_5_ISaidStopMagic"				;//Přestaň už s těmi kouzly!
	WeaponDown					=	"SVM_5_WeaponDown"					;//Co chceš s tou zbraní dělat, člověče?
	ISaidWeaponDown				=	"SVM_5_ISaidWeaponDown"				;//Dělej! Dej tu věc pryč!
	WatchYourAim				=	"SVM_5_WatchYourAim"				;//Míříš na mě, ty šašku!
	WatchYourAimAngry			=	"SVM_5_WatchYourAimAngry"			;//Jestli s tím nepřestaneš, ukážu ti, zač je toho loket!
	WhatAreYouDoing				=	"SVM_5_WhatAreYouDoing"				;//Hej, jseš slepej nebo co?
	LetsForgetOurLittleFight	=	"SVM_5_LetsForgetOurLittleFight"	;//Dobrá, zapomeňme na tuhle hádku, dobrý?
	Strange						=	"SVM_5_Strange"						;//Ještě před chvilkou tu byl! To je divné!
	DieMonster					=	"SVM_5_DieMonster"					;//Teď je řada na tobě, bastarde!
	DieMortalEnemy				=	"SVM_5_DieMortalEnemy"				;//Vyrovnáme účty!
	NowWait						=	"SVM_5_NowWait"						;//Říkáš si o pořádnou nakládačku!
	YouStillNotHaveEnough		=	"SVM_5_YouStillNotHaveEnough"		;//Ty nemáš ještě dost?
	YouAskedForIt				=	"SVM_5_YouAskedForIt"				;//Dobrá! Říkal sis o to!
	NowWaitIntruder				= 	"SVM_5_NowWaitIntruder"				;//Nemáš tu co pohledávat!
	IWillTeachYouRespectForForeignProperty	=	"SVM_5_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem tě. Jestli se dotkneš mých věcí, lítáš v průšvihu!
	DirtyThief					=	"SVM_5_DirtyThief"					;//Zloději! Však já tě naučím!
	YouAttackedMyCharge			=	"SVM_5_YouAttackedMyCharge"			;//Není nikdo, kdo by měl problém s mými lidmi a pak toho nelitoval!
	YouKilledOneOfUs			=	"SVM_5_YouKilledOneOfUs"			;//Zabil jsi jednoho z mých chlapů. Teď zabiju já TEBE!
	Dead						=	"SVM_5_Dead"					;//Aaargl
	Aargh_1						=	"SVM_5_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_5_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_5_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_5_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_5_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_5_YesYes"						;//Vyhrál jsi! Dobrá!
	ShitWhatAMonster			=	"SVM_5_ShitWhatAMonster"			;//To je na mě trochu moc!
	Help						=	"SVM_5_Help"						;//K čertu!
	WeWillMeetAgain				=	"SVM_5_WeWillMeetAgain"				;//Příště to dopadne jinak!
	NeverTryThatAgain			=	"SVM_5_NeverTryThatAgain"			;//Už to znovu nezkoušej!
	ITakeYourWeapon				=	"SVM_5_ITakeYourWeapon"				;//Ta zbraň se mi líbí!
	ITookYourOre				=	"SVM_5_ITookYourOre"				;//Podívám se, jak je tvá ruda dobře uložená!
	ShitNoOre					=	"SVM_5_ShitNoOre"					;//Už žádná ruda? To je smůla!
	HandsOff					=	"SVM_5_HandsOff"					;//Ruce od toho pryč!
	GetOutOfHere				=	"SVM_5_GetOutOfHere"				;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_5_YouViolatedForbiddenTerritory";//Hej! Odkud jsi přišel?
	YouWannaFoolMe				=	"SVM_5_YouWannaFoolMe"				;//Dobrý vtip!
	WhatsThisSupposedToBe		=	"SVM_5_WhatsThisSupposedToBe"		;//Po čem tu slídíš?
	WhyAreYouInHere				=	"SVM_5_WhyYouAreInHere"				;//Kliď se odsud nebo zavolám stráže!
	WhatDidYouInThere			=	"SVM_5_WhatDidYouInThere"			;//Tady nemáš co dělat!
	WiseMove					=	"SVM_5_WiseMove"					;//Učíš se rychle!
	Alarm						=	"SVM_5_Alarm"						;//Stráže! Sem!
	IntruderAlert				= 	"SVM_5_IntruderAlert"				;//POZOR!!
	BehindYou					=	"SVM_5_BehindYou"					;//Dej pozor!
	TheresAFight				=	"SVM_5_TheresAFight"				;//Do boje!
	HeyHeyHey					=	"SVM_5_HeyHeyHey"					;//Dej mu!
	CheerFight					=	"SVM_5_CheerFight"					;//Dobře!
	CheerFriend					=	"SVM_5_CheerFriend"					;//Vraž mu ji!
	Ooh							=	"SVM_5_Ooh"							;//Tak dávej pozor!
	YeahWellDone				=	"SVM_5_YeahWellDone"				;//Už bylo na čase!
	RunCoward					=	"SVM_5_RunCoward"					;//Ten chlapík utíká pryč!
	HeDefeatedHim				=	"SVM_5_HeDefeatedHim"				;//Jasné vítězství, řekl bych!
	HeDeservedIt				=	"SVM_5_HeDeservedIt"				;//Zasloužil si to!
	HeKilledHim					=	"SVM_5_HeKilledHim"					;//Pořád zabíjíš lidi. Teď máš skutečný problém!
	ItWasAGoodFight				=	"SVM_5_ItWasAGoodFight"				;//To byl ale boj!
	Awake						=	"SVM_5_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_5_FriendlyGreetings"			;//Nazdar, kamaráde!
	ALGreetings					=	"SVM_5_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_5_MageGreetings"				;//Za slávu magie!
	SectGreetings				=	"SVM_5_SectGreetings"				;//Vzbuď se!
	ThereHeIs					= 	"SVM_5_ThereHeIs"					;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_5_NoLearnNoPoints"				;//Nemůžu tě nic naučit, protože nemáš žádné zkušenosti.
	NoLearnOverMax				= 	"SVM_5_NoLearnOverMax"				;//Jsi u konce svých možností. Měl by ses učit něco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_5_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vůdcem, musíš na sobě ještě pracovat!
	NoLearnYoureBetter			=	"SVM_5_NoLearnYoureBetter"			;//Už je to s tebou lepší!
	HeyYou						=	"SVM_5_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_5_NotNow"						;//Teď ne!
	WhatDoYouWant				=	"SVM_5_WhatDoYouWant"				;//Můžu ti pomoci?
	ISaidWhatDoYouWant			=	"SVM_5_ISaidWhatDoYouWant"			;//Co chceš?
	MakeWay						=	"SVM_5_MakeWay"						;//Nech mě jít!
	OutOfMyWay					=	"SVM_5_OutOfMyWay"					;//Uhni, chci projít!
	YouDeafOrWhat				=	"SVM_5_YouDeafOrWhat"				;//Jseš hluchej nebo toužíš po maléru?
	LookingForTroubleAgain		=	"SVM_5_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_5_LookAway"					;//NIC jsem neviděl... Co se vlastně stalo?
	OkayKeepIt					=	"SVM_5_OkayKeepIt"					;//Dobrá, nech si ten krám!
	WhatsThat					=	"SVM_5_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_5_ThatsMyWeapon"				;//Rád bych svou zbraň zpátky!
	GiveItToMe					=	"SVM_5_GiveItToMe"					;//Tak dej mi ji!
	YouCanKeeptheCrap			=	"SVM_5_YouCanKeeptheCrap"			;//Hm, není špatná! Sehnal jsem další!
	TheyKilledMyFriend			=	"SVM_5_TheyKilledMyFriend"			;//Dostali jednoho z našich chlapíků. Jestli já toho lotra dostanu...
	YouDisturbedMySlumber		=	"SVM_5_YouDisturbedMySlumber"		;// Hej, co je? Proč mě budíš?
	SuckerGotSome				=	"SVM_5_SuckerGotSome"				;//Eh? Dostal jsi nakládačku? Dobře ti tak!
	SuckerDefeatedEBr			=	"SVM_5_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Nestačil se divit!
	SuckerDefeatedGur			=	"SVM_5_SuckerDefeatedGur"			;//Porazil jsi jednoho z Guru. Skvělé, ale už se o to nepokoušej znovu.
	SuckerDefeatedMage			=	"SVM_5_SuckerDefeatedMage"			;//Zvítězit nad mágem... Musíš mít pro strach uděláno!
	SuckerDefeatedNov_Guard		= 	"SVM_5_SuckerDefeatedNov_Guard"		;//Musíš být šílený, žes srazil toho novice.
	SuckerDefeatedVlk_Guard		= 	"SVM_5_SuckerDefeatedVlk_Guard"		;//Co sis vlastně myslel, že děláš, když jsi zabíjel kopáče?
	YouDefeatedMyComrade		=	"SVM_5_YouDefeatedMyComrade"		;//Srazil jsi mého přítele, proč?
	YouDefeatedNOV_Guard		=	"SVM_5_YouDefeatedNOV_Guard"		;//Ještě jednou se dotkneš některého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_5_YouDefeatedVLK_Guard"		;//Jsi příliš smělý, problém s některým z mých chráněnců by pro tebe mohl znamenat nebezpečí.
	YouStoleFromMe				=	"SVM_5_YouStoleFromMe"				;//Jak se tu opovažuješ objevit, ty zloději?
	YouStoleFromUs				=	"SVM_5_YouStoleFromUs"				;//Máš u sebe něco, co patří nám. Vrať nám to!
	YouStoleFromEBr				=	"SVM_5_YouStoleFromEBr"				;//Člověče, tys kradl u Rudobaronů? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_5_YouStoleFromGur"				;//Okradl jsi Guru? Nemusel ses aspoň nechat chytit!
	StoleFromMage				=	"SVM_5_StoleFromMage"				;//Mágové nemají rádi lidi, co se motají kolem jejich věcí!
	YouKilledMyFriend			=	"SVM_5_YouKilledMyFriend"			;//Máš na svědomí jednoho z našich mužů. Stačí malá chybička a přijde řada na tebe!
	YouKilledEBr				=	"SVM_5_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronů! Člověče, úplně ses pominul?
	YouKilledGur				=	"SVM_5_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nemůžu tomu uvěřit!
	YouKilledMage				=	"SVM_5_YouKilledMage"				;//Zabil jsi jednoho z mágů! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_5_YouKilledOCfolk"				;//Jeden z členů Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_5_YouKilledNCfolk"				;//Nový tábor utrpěl těžkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_5_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svých věřících a ty ho máš na svědomí!
	GetThingsRight				=	"SVM_5_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_5_YouDefeatedMeWell"			;//Pořádně jsi mi to nandal, člověče. Byl to dobrý boj! Ale teď už je konec!
	Smalltalk01					=	"SVM_5_Smalltalk01"					;// ...když myslíš...
	Smalltalk02					=	"SVM_5_Smalltalk02"					;// ...možná...
	Smalltalk03					=	"SVM_5_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_5_Smalltalk04"					;// ...udělám nejlíp, když se budu držet dál...
	Smalltalk05					=	"SVM_5_Smalltalk05"					;// ...tohle opravdu není můj problém...
	Smalltalk06					=	"SVM_5_Smalltalk06"					;// ...bylo jasné, že z toho bude mrzutost...
	Smalltalk07					=	"SVM_5_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vědět...
	Smalltalk08					=	"SVM_5_Smalltalk08"					;// ...už se to znovu nestane...
	Smalltalk09					=	"SVM_5_Smalltalk09"					;// ...a přesto na tom musí něco být...
	Smalltalk10					=	"SVM_5_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem říkáš...
	Smalltalk11					=	"SVM_5_Smalltalk11"					;// ...jestli se mě to netýká...
	Smalltalk12					=	"SVM_5_Smalltalk12"					;// ...neměl bys všemu věřit...
	Smalltalk13					=	"SVM_5_Smalltalk13"					;// ...přesto bych nechtěl být v jeho kůži...
	Smalltalk14					=	"SVM_5_Smalltalk14"					;// ...pořád ta samá pohádka...
	Smalltalk15					=	"SVM_5_Smalltalk15"					;// ...někteří lidé se nikdy nepoučí...
	Smalltalk16					=	"SVM_5_Smalltalk16"					;// ...dříve bývalo všechno docela jinak...
	Smalltalk17					=	"SVM_5_Smalltalk17"					;// ...lidé říkají...
	Smalltalk18					=	"SVM_5_Smalltalk18"					;// ...takové řeči já nikdy neposlouchám...
	Smalltalk19					=	"SVM_5_Smalltalk19"					;// ...na někoho se spoléháš a dostaneš se do problémů, tak to chodí...
	Smalltalk20					=	"SVM_5_Smalltalk20"					;// ...pochybuji, že by se to mohlo změnit...
	Smalltalk21					=	"SVM_5_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_5_Smalltalk22"					;// ...vydrž. Lepší je do ničeho se nepouštět...
	Smalltalk23					=	"SVM_5_Smalltalk23"					;// ...myslel jsem, že už je to dávno za námi...
	Smalltalk24					=	"SVM_5_Smalltalk24"					;// ...pojďme raději mluvit o něčem jiném...
	Om							= 	"SVM_5_Om"							;//Hmmm
};

//////////////////////////////////////////
instance SVM_6 (C_SVM)				//Raufbold	(Will saufen und raufen	(Matrose) Alkoholiker. Grölt viel)
{
	StopMagic					=	"SVM_6_StopMagic"					;//Žádné čarování!
	ISaidStopMagic				=	"SVM_6_ISaidStopMagic"				;//Přestaň už s těmi kouzly! Ihned!
	WeaponDown					=	"SVM_6_WeaponDown"					;//Dej tu zatracenou zbraň pryč!
	ISaidWeaponDown				=	"SVM_6_ISaidWeaponDown"				;//Chceš ode mě nakládačku? Dej tu věc pryč!
	WatchYourAim				=	"SVM_6_WatchYourAim"				;//Dej tu věc pryč nebo se něco stane!
	WatchYourAimAngry			=	"SVM_6_WatchYourAimAngry"			;//Ještě jednou na mě namíříš a dostaneš po tlamě!
	WhatAreYouDoing				=	"SVM_6_WhatAreYouDoing"				;//Hej! Dávej pozor!
	LetsForgetOurLittleFight	=	"SVM_6_LetsForgetOurLittleFight"	;//Hej, člověče! Zapomeneme na tuhle hádku, dobrý?
	Strange						=	"SVM_6_Strange"						;//Vyjdi! Ukaž se!
	DieMonster					=	"SVM_6_DieMonster"					;//Nadělám z tebe guláš, bastarde!
	DieMortalEnemy				=	"SVM_6_DieMortalEnemy"				;//To máš za to!
	NowWait						=	"SVM_6_NowWait"						;//Dostaneš jednu přes tlamu...
	YouStillNotHaveEnough		=	"SVM_6_YouStillNotHaveEnough"		;//Jako by sis říkal o pořádnou přes tlamu!
	YouAskedForIt				=	"SVM_6_YouAskedForIt"				;//Tumáš cos chtěl!
	NowWaitIntruder				= 	"SVM_6_NowWaitIntruder"				;//Rozsekám tě na maděru!
	IWillTeachYouRespectForForeignProperty	=	"SVM_6_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem tě. Jestli se dotkneš mých věcí, lítáš v průšvihu!
	DirtyThief					=	"SVM_6_DirtyThief"					;//Zloději! Tohle bude tvůj konec!
	YouAttackedMyCharge			=	"SVM_6_YouAttackedMyCharge"			;//Mých chlapů se nikdo nedotkne!
	YouKilledOneOfUs			=	"SVM_6_YouKilledOneOfUs"			;//Zabil jsi jednoho z mých chlapů. Teď zabiju já TEBE!
	Dead						=	"SVM_6_Dead"						;//Aaargl
	Aargh_1						=	"SVM_6_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_6_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_6_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_6_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_6_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_6_YesYes"						;//Dobrá, dobrá! Klid, vyhrál jsi!
	ShitWhatAMonster			=	"SVM_6_ShitWhatAMonster"			;//K čertu, taková bestie! Utíkej jak nejrychleji umíš!
	Help						=	"SVM_6_Help"						;//K čertu!
	WeWillMeetAgain				=	"SVM_6_WeWillMeetAgain"				;//Ještě mě poznáš!
	NeverTryThatAgain			=	"SVM_6_NeverTryThatAgain"			;//Ještě jednou to zkus a budeš litovat!
	ITakeYourWeapon				=	"SVM_6_ITakeYourWeapon"				;//Ta zbraň vypadá dobře!
	ITookYourOre				=	"SVM_6_ITookYourOre"				;//Díky za rudu, připíjím na tebe!
	ShitNoOre					=	"SVM_6_ShitNoOre"					;//Sakra, už nemá ani kousek rudy...
	HandsOff					=	"SVM_6_HandsOff"					;//Ruce od toho pryč!
	GetOutOfHere				=	"SVM_6_GetOutOfHere"				;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_6_YouViolatedForbiddenTerritory";//Hej! Odkud si přišel?
	YouWannaFoolMe				=	"SVM_6_YouWannaFoolMe"				;//Myslíš si, že jsem úplně hloupý?
	WhatsThisSupposedToBe		=	"SVM_6_WhatsThisSupposedToBe"		;//Hej! Po čem tu slídíš?
	WhyAreYouInHere				=	"SVM_6_WhyYouAreInHere"				;//Kliď se odsud nebo zavolám stráže!
	WhatDidYouInThere			=	"SVM_6_WhatDidYouInThere"			;//Cos tady dělal?
	WiseMove					=	"SVM_6_WiseMove"					;//To bylo štěstí!
	Alarm						=	"SVM_6_Alarm"						;//Stráže! Sem!
	IntruderAlert				= 	"SVM_6_IntruderAlert"				;//POZOR!!! VETŘELEC!!!
	BehindYou					=	"SVM_6_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_6_TheresAFight"				;//Do boje!
	HeyHeyHey					=	"SVM_6_HeyHeyHey"					;//Pořádně!
	CheerFight					=	"SVM_6_CheerFight"					;//Biješ se jak ženská!
	CheerFriend					=	"SVM_6_CheerFriend"					;//Doraž ho!
	Ooh							=	"SVM_6_Ooh"							;//Nepárej se s ním! Dej mu přes tlamu!
	YeahWellDone				=	"SVM_6_YeahWellDone"				;//Dej mu! Ještě se hýbe!
	RunCoward					=	"SVM_6_RunCoward"					;//Vrať se, zbabělče!
	HeDefeatedHim				=	"SVM_6_HeDefeatedHim"				;//Ten má dost!
	HeDeservedIt				=	"SVM_6_HeDeservedIt"				;//Zasloužil si to!
	HeKilledHim					=	"SVM_6_HeKilledHim"					;//Jsi jako samotná smrt! Ta tě naučí takhle zabíjet!
	ItWasAGoodFight				=	"SVM_6_ItWasAGoodFight"				;//Ha ha ha! Dobře jsi mu to ukázal!
	Awake						=	"SVM_6_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_6_FriendlyGreetings"			;//Nazdar!
	ALGreetings					=	"SVM_6_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_6_MageGreetings"				;//Za slávu magie!
	SectGreetings				=	"SVM_6_SectGreetings"				;//Vzbuď se!
	ThereHeIs					= 	"SVM_6_ThereHeIs"					;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_6_NoLearnNoPoints"				;//Nemůžu tě nic naučit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_6_NoLearnOverMax"				;//Jsi u konce svých možností. Měl by ses učit něco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_6_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vůdcem, musíš na sobě ještě pracovat!
	NoLearnYoureBetter			=	"SVM_6_NoLearnYoureBetter"			;//Už je to s tebou lepší!
	HeyYou						=	"SVM_6_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_6_NotNow"						;//Teď ne!
	WhatDoYouWant				=	"SVM_6_WhatDoYouWant"				;//Co chceš?
	ISaidWhatDoYouWant			=	"SVM_6_ISaidWhatDoYouWant"			;//Bylo tam něco, cos chtěl?
	MakeWay						=	"SVM_6_MakeWay"						;//Nech mě jít!
	OutOfMyWay					=	"SVM_6_OutOfMyWay"					;//Tak uhni!
	YouDeafOrWhat				=	"SVM_6_YouDeafOrWhat"				;//Kliď se! Nebo chceš, abych ti to vrazil do mozku?
	LookingForTroubleAgain		=	"SVM_6_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_6_LookAway"					;//Nic jsem neviděl! Opravdu nic!
	OkayKeepIt					=	"SVM_6_OkayKeepIt"					;//Dobrá, nech si ten krám!
	WhatsThat					=	"SVM_6_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_6_ThatsMyWeapon"				;//Vrať mi zbraň, ty šašku!
	GiveItToMe					=	"SVM_6_GiveItToMe"					;//Tak dej mi ji, člověče!
	YouCanKeeptheCrap			=	"SVM_6_YouCanKeeptheCrap"			;//Nevadí! Stejně ji už nebudu potřebovat!
	TheyKilledMyFriend			=	"SVM_6_TheyKilledMyFriend"			;//Dostali jednoho z našich chlapíků. Jestli já toho lotra dostanu...
	YouDisturbedMySlumber		=	"SVM_6_YouDisturbedMySlumber"		;//Sakra, proč mě budíš?
	SuckerGotSome				=	"SVM_6_SuckerGotSome"				;//Dostal jsi nakládačku? Dobře ti tak!
	SuckerDefeatedEBr			=	"SVM_6_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Má na tebe opravdu vztek!
	SuckerDefeatedGur			=	"SVM_6_SuckerDefeatedGur"			;//Porazil jsi Guru. Přitahuješ problémy jako magnet!
	SuckerDefeatedMage			=	"SVM_6_SuckerDefeatedMage"			;//Zvítězit nad mágem je opravdu šílený nápad, člověče!
	SuckerDefeatedNov_Guard		= 	"SVM_6_SuckerDefeatedNov_Guard"		;//Nemůžeš se tu potloukat a takhle mlátit novice!
	SuckerDefeatedVlk_Guard		= 	"SVM_6_SuckerDefeatedVlk_Guard"		;//Nech mé chlapy na pokoji!
	YouDefeatedMyComrade		=	"SVM_6_YouDefeatedMyComrade"		;//Odrovnal jsi mého kamaráda...
	YouDefeatedNOV_Guard		=	"SVM_6_YouDefeatedNOV_Guard"		;//Nebudeš tu dělat problémy!
	YouDefeatedVLK_Guard		=	"SVM_6_YouDefeatedVLK_Guard"		;//Jestli vztáhneš ruku na někoho, kdo je pod mojí ochranou, tak si to schytáš!
	YouStoleFromMe				=	"SVM_6_YouStoleFromMe"				;//Seš mi ukradenej, ty zmetku! Už to znovu nezkoušej!
	YouStoleFromUs				=	"SVM_6_YouStoleFromUs"				;//Chceme naše věci zpátky! Vrať nám je!
	YouStoleFromEBr				=	"SVM_6_YouStoleFromEBr"				;//Kradl jsi u Rudobaronů? Probůh, proč?
	YouStoleFromGur				=	"SVM_6_YouStoleFromGur"				;//Okradl jsi Guru? Jaká škoda, že tě nachytali!
	StoleFromMage				=	"SVM_6_StoleFromMage"				;//Kradl jsi u mágů! Jak stupidní nápad!
	YouKilledMyFriend			=	"SVM_6_YouKilledMyFriend"			;//Jeden z našich lidí zemřel a ty s tím máš co do činění! Stačí malá chybička a půjdeš za ním!
	YouKilledEBr				=	"SVM_6_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronů! Člověče, úplně ses pominul?
	YouKilledGur				=	"SVM_6_YouKilledGur"				;//Zabil jsi jednoho z Guru! Tomu, hochu, nemůžu uvěřit!
	YouKilledMage				=	"SVM_6_YouKilledMage"				;//Zabil jsi jednoho z mágů! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_6_YouKilledOCfolk"				;//Jeden z členů Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_6_YouKilledNCfolk"				;//Nový tábor utrpěl těžkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_6_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svých věřících a ty ho máš na svědomí!
	GetThingsRight				=	"SVM_6_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_6_YouDefeatedMeWell"			;//Pořádně jsi mi to nandal, člověče. Byl to dobrý boj! Ale teď už je konec!
	Smalltalk01					=	"SVM_6_Smalltalk01"					;// ...nejhorší špína...
	Smalltalk02					=	"SVM_6_Smalltalk02"					;// ...možná, ale koho to zajímá?
	Smalltalk03					=	"SVM_6_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_6_Smalltalk04"					;// ...udělám nejlíp, když se budu držet dál...
	Smalltalk05					=	"SVM_6_Smalltalk05"					;// ...tohle opravdu není můj problém...
	Smalltalk06					=	"SVM_6_Smalltalk06"					;// ...bylo jasné, že z toho bude mrzutost...
	Smalltalk07					=	"SVM_6_Smalltalk07"					;// ...proč se to dělo pořád dál...
	Smalltalk08					=	"SVM_6_Smalltalk08"					;// ...už se to znovu nestane...
	Smalltalk09					=	"SVM_6_Smalltalk09"					;// ...a přesto na tom musí něco být...
	Smalltalk10					=	"SVM_6_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem říkáš...
	Smalltalk11					=	"SVM_6_Smalltalk11"					;// ...jestli se mě to netýká...
	Smalltalk12					=	"SVM_6_Smalltalk12"					;// ...neměl bys všemu věřit...
	Smalltalk13					=	"SVM_6_Smalltalk13"					;// ...přesto bych nechtěl být v jeho kůži...
	Smalltalk14					=	"SVM_6_Smalltalk14"					;// ...pořád ta samá pohádka...
	Smalltalk15					=	"SVM_6_Smalltalk15"					;// ...někteří lidé se nikdy nepoučí...
	Smalltalk16					=	"SVM_6_Smalltalk16"					;// ...dříve bývalo všechno docela jinak...
	Smalltalk17					=	"SVM_6_Smalltalk17"					;// ...lidé říkají...
	Smalltalk18					=	"SVM_6_Smalltalk18"					;// ...takové řeči já nikdy neposlouchám...
	Smalltalk19					=	"SVM_6_Smalltalk19"					;// ...na někoho se spoléháš a dostaneš se do problémů, tak to chodí...
	Smalltalk20					=	"SVM_6_Smalltalk20"					;// ...pochybuji, že by se to mohlo změnit...
	Smalltalk21					=	"SVM_6_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_6_Smalltalk22"					;// ...vydrž. Lepší je do ničeho se nepouštět...
	Smalltalk23					=	"SVM_6_Smalltalk23"					;// ...myslel jsem, že už je to dávno za námi...
	Smalltalk24					=	"SVM_6_Smalltalk24"					;// ...pojďme raději mluvit o něčem jiném...
	Om							= 	"SVM_6_Om"							;//Hmmm
};

//////////////////////////////////////////
instance SVM_7 (C_SVM)				//Freak, Aggressiv. Spielt mit seiner Macht. Sadist. Org: Abschaum, den im AL keiner wollte. Nov (selten): Durchgeknallter Abschaum.
{
	StopMagic					=	"SVM_7_StopMagic"					;//Dej to pryč! Dej to pryč!
	ISaidStopMagic				=	"SVM_7_ISaidStopMagic"				;//Přestaň s těmi kouzly, dej to pryč!
	WeaponDown					=	"SVM_7_WeaponDown"					;//Dej tu zbraň pryč, dej jí pryč!
	ISaidWeaponDown				=	"SVM_7_ISaidWeaponDown"				;//Myslím to vážně! Pryč s ní!
	WatchYourAim				=	"SVM_7_WatchYourAim"				;//Míříš na mě? Dej si pozor!
	WatchYourAimAngry			=	"SVM_7_WatchYourAimAngry"			;//Myslíš, že se tě leknu? Jak chceš!
	WhatAreYouDoing				=	"SVM_7_WhatAreYouDoing"				;//Tohle si zapamatuju! Dej si pozor!
	LetsForgetOurLittleFight	=	"SVM_7_LetsForgetOurLittleFight"	;//Zapomeneme na to, dobrá?
	Strange						=	"SVM_7_Strange"						;//Kam se poděl? To není možné!
	DieMonster					=	"SVM_7_DieMonster"					;//Rozsekám tě, lotře!
	DieMortalEnemy				=	"SVM_7_DieMortalEnemy"				;//Dostanu tě! Teď na tebe došla řada! Žádné slitování!
	NowWait						=	"SVM_7_NowWait"						;//Konečně jsi mi dal důvod!
	YouStillNotHaveEnough		=	"SVM_7_YouStillNotHaveEnough"		;//Už to nemáš chuť zkusit podruhé, viď?
	YouAskedForIt				=	"SVM_7_YouAskedForIt"				;//Krev! Tvoje krev!
	NowWaitIntruder				= 	"SVM_7_NowWaitIntruder"				;//Rozpářu tě na cáry!
	IWillTeachYouRespectForForeignProperty	=	"SVM_7_IWillTeachYouRespectForForeignProperty"	;//Měl bych ti usekat prsty!
	DirtyThief					=	"SVM_7_DirtyThief"					;//Ty všivej zloději! Chci tě vidět, jak trpíš!
	YouAttackedMyCharge			=	"SVM_7_YouAttackedMyCharge"			;//Na moje chlapy si kromě mě nikdo vyskakovat nebude!
	YouKilledOneOfUs			=	"SVM_7_YouKilledOneOfUs"			;//Zabil jsi jednoho z nás!
	Dead						=	"SVM_7_Dead"						;//Aaargl
	Aargh_1						=	"SVM_7_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_7_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_7_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_7_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_7_YoullBeSorryForThis"			;//Nebudeš mít ani čas toho litovat!
	YesYes						=	"SVM_7_YesYes"						;//Dobře, dobře!
	ShitWhatAMonster			=	"SVM_7_ShitWhatAMonster"			;//Nemám tu správnou zbraň. Ještě se uvidíme...
	Help						=	"SVM_7_Help"						;//K čertu!
	WeWillMeetAgain				=	"SVM_7_WeWillMeetAgain"				;//Ještě se uvidíme!
	NeverTryThatAgain			=	"SVM_7_NeverTryThatAgain"			;//Už to znova nezkoušej!
	ITakeYourWeapon				=	"SVM_7_ITakeYourWeapon"				;//Tuhle zbraň si vezmu!
	ITookYourOre				=	"SVM_7_ITookYourOre"				;//Radši bych tě zabil, ta ruda ale není špatná!
	ShitNoOre					=	"SVM_7_ShitNoOre"					;//Ty nemáš žádnou rudu? Seš nicotná veš!
	HandsOff					=	"SVM_7_HandsOff"					;//Ruce od toho pryč!
	GetOutOfHere				=	"SVM_7_GetOutOfHere"				;//Vypadni odsud! Ven!
	YouViolatedForbiddenTerritory=	"SVM_7_YouViolatedForbiddenTerritory";//Jak ses sem dostal?
	YouWannaFoolMe				=	"SVM_7_YouWannaFoolMe"				;//Snažíš se mě přechytračit, co?
	WhatsThisSupposedToBe		=	"SVM_7_WhatsThisSupposedToBe"		;//Hej ty! Co tady pohledáváš?
	WhyAreYouInHere				=	"SVM_7_WhyYouAreInHere"				;//Vypadni odsud nebo zavolám stráže!
	WhatDidYouInThere			=	"SVM_7_WhatDidYouInThere"			;//Tady nemáš co dělat!
	WiseMove					=	"SVM_7_WiseMove"					;//Máš štěstí! Měl jsem chuť ti rozmlátit tlamu!
	Alarm						=	"SVM_7_Alarm"						;//Stráže! Sem!
	IntruderAlert				= 	"SVM_7_IntruderAlert"				;//POZOR!!
	BehindYou					=	"SVM_7_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_7_TheresAFight"				;//Do boje!
	HeyHeyHey					=	"SVM_7_HeyHeyHey"					;//Pořádně!
	CheerFight					=	"SVM_7_CheerFight"					;//Chci vidět krev!
	CheerFriend					=	"SVM_7_CheerFriend"					;//Vyřiď ho!
	Ooh							=	"SVM_7_Ooh"							;//Vrať mu to, idiote!
	YeahWellDone				=	"SVM_7_YeahWellDone"				;//Uaaah!!!!!!
	RunCoward					=	"SVM_7_RunCoward"					;//Uaaah!!!!!!
	HeDefeatedHim				=	"SVM_7_HeDefeatedHim"				;//Ten má dost!
	HeDeservedIt				=	"SVM_7_HeDeservedIt"				;//Jeho chyba!
	HeKilledHim					=	"SVM_7_HeKilledHim"					;//Zabít někoho před svědky je sebevražda!
	ItWasAGoodFight				=	"SVM_7_ItWasAGoodFight"				;//Skvělý boj!
	Awake						=	"SVM_7_Awake"						;//Je čas dát se dál!
	FriendlyGreetings			=	"SVM_7_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_7_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_7_MageGreetings"				;//Za slávu magie
	SectGreetings				=	"SVM_7_SectGreetings"				;//Probuď se!
	ThereHeIs					= 	"SVM_7_ThereHeIs"					;//Jsi slepý? Támhle!
	NoLearnNoPoints				= 	"SVM_7_NoLearnNoPoints"				;//Nemůžu tě nic naučit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_7_NoLearnOverMax"				;//Jsi u konce svých možností. Měl by ses učit něco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_7_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vůdcem, musíš na sobě ještě pracovat!
	NoLearnYoureBetter			=	"SVM_7_NoLearnYoureBetter"			;//Už je to s tebou lepší!
	HeyYou						=	"SVM_7_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_7_NotNow"						;//Teď ne!
	WhatDoYouWant				=	"SVM_7_WhatDoYouWant"				;//Co ode mě chceš?
	ISaidWhatDoYouWant			=	"SVM_7_ISaidWhatDoYouWant"			;//Můžu pro tebe něco udělat?
	MakeWay						=	"SVM_7_MakeWay"						;//Nech mě jít!
	OutOfMyWay					=	"SVM_7_OutOfMyWay"					;//Uhni mi z cesty!
	YouDeafOrWhat				=	"SVM_7_YouDeafOrWhat"				;//Chceš mít problémy? Kliď se odsud!
	LookingForTroubleAgain		=	"SVM_7_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_7_LookAway"					;//NIC jsem neviděl!
	OkayKeepIt					=	"SVM_7_OkayKeepIt"					;//Dobrá! Je tvoje!
	WhatsThat					=	"SVM_7_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_7_ThatsMyWeapon"				;//Vrať mi mou zbraň!
	GiveItToMe					=	"SVM_7_GiveItToMe"					;//Vrať mi ji!
	YouCanKeeptheCrap			=	"SVM_7_YouCanKeeptheCrap"			;//Dobře! Nech si ji! Vyřeším to jinak!
	TheyKilledMyFriend			=	"SVM_7_TheyKilledMyFriend"			;//Jeden z nás je mrtev! To si zasluhuje odplatu!
	YouDisturbedMySlumber		=	"SVM_7_YouDisturbedMySlumber"		;//Proč jsi mě vzbudil?
	SuckerGotSome				=	"SVM_7_SuckerGotSome"				;//Dostal jsi nakládačku, o kterou sis koledoval!
	SuckerDefeatedEBr			=	"SVM_7_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Má na tebe vztek!
	SuckerDefeatedGur			=	"SVM_7_SuckerDefeatedGur"			;//Porazil jsi Guru. Přitahuješ problémy jako magnet!
	SuckerDefeatedMage			=	"SVM_7_SuckerDefeatedMage"			;//Zvítězit nad mágem, to je šílený nápad!
	SuckerDefeatedNov_Guard		= 	"SVM_7_SuckerDefeatedNov_Guard"		;//Tak ty jsi ten, co mlátí novice!
	SuckerDefeatedVlk_Guard		= 	"SVM_7_SuckerDefeatedVlk_Guard"		;//Nech mé chlapy na pokoji!
	YouDefeatedMyComrade		=	"SVM_7_YouDefeatedMyComrade"		;//Odrovnal jsi, koho jsi neměl! Táhneme tu za jeden provaz!
	YouDefeatedNOV_Guard		=	"SVM_7_YouDefeatedNOV_Guard"		;//Nebudeš tu dělat problémy!
	YouDefeatedVLK_Guard		=	"SVM_7_YouDefeatedVLK_Guard"		;//Jestli vztáhneš ruku na někoho, kdo je pod mojí ochranou, tak si to schytáš!
	YouStoleFromMe				=	"SVM_7_YouStoleFromMe"				;//Seš mi ukradenej, ty zmetku! Už to znovu nezkoušej!
	YouStoleFromUs				=	"SVM_7_YouStoleFromUs"				;//Chceme naše věci zpátky! Vrať nám je!
	YouStoleFromEBr				=	"SVM_7_YouStoleFromEBr"				;//Kradl jsi u Rudobaronů? Probůh, proč?
	YouStoleFromGur				=	"SVM_7_YouStoleFromGur"				;//Okradl jsi Guru? Jaká škoda, že tě nachytali!
	StoleFromMage				=	"SVM_7_StoleFromMage"				;//Kradl jsi u mágů! Jak stupidní nápad!
	YouKilledMyFriend			=	"SVM_7_YouKilledMyFriend"			;//Jeden z našich lidí zemřel a ty s tím máš co do činění! Stačí malá chybička a půjdeš za ním!
	YouKilledEBr				=	"SVM_7_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronů! Člověče, úplně ses pominul?
	YouKilledGur				=	"SVM_7_YouKilledGur"				;//Zabil jsi jednoho z Guru! Tomu, hochu, nemůžu uvěřit!
	YouKilledMage				=	"SVM_7_YouKilledMage"				;//Zabil jsi jednoho z mágů! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_7_YouKilledOCfolk"				;//Jeden z členů Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_7_YouKilledNCfolk"				;//Nový tábor utrpěl těžkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_7_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svých věřících a ty ho máš na svědomí!
	GetThingsRight				=	"SVM_7_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_7_YouDefeatedMeWell"			;//Pořádně jsi mi to nandal, člověče. Byl to dobrý boj! Ale teď už je konec!
	Smalltalk01					=	"SVM_7_Smalltalk01"					;// ...když myslíš...
	Smalltalk02					=	"SVM_7_Smalltalk02"					;// ...možná...
	Smalltalk03					=	"SVM_7_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_7_Smalltalk04"					;// ...udělám nejlíp, když se budu držet dál...
	Smalltalk05					=	"SVM_7_Smalltalk05"					;// ...tohle opravdu není můj problém...
	Smalltalk06					=	"SVM_7_Smalltalk06"					;// ...bylo jasné, že z toho bude mrzutost...
	Smalltalk07					=	"SVM_7_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vědět...
	Smalltalk08					=	"SVM_7_Smalltalk08"					;// ...už se to znovu nestane...
	Smalltalk09					=	"SVM_7_Smalltalk09"					;// ...a přesto na tom musí něco být...
	Smalltalk10					=	"SVM_7_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem říkáš...
	Smalltalk11					=	"SVM_7_Smalltalk11"					;// ...jestli se mě to netýká...
	Smalltalk12					=	"SVM_7_Smalltalk12"					;// ...neměl bys všemu věřit...
	Smalltalk13					=	"SVM_7_Smalltalk13"					;// ...přesto bych nechtěl být v jeho kůži...
	Smalltalk14					=	"SVM_7_Smalltalk14"					;// ...pořád ta samá pohádka...
	Smalltalk15					=	"SVM_7_Smalltalk15"					;// ...někteří lidé se nikdy nepoučí...
	Smalltalk16					=	"SVM_7_Smalltalk16"					;// ...dříve bývalo všechno docela jinak...
	Smalltalk17					=	"SVM_7_Smalltalk17"					;// ...lidé říkají...
	Smalltalk18					=	"SVM_7_Smalltalk18"					;// ...takové řeči já nikdy neposlouchám...
	Smalltalk19					=	"SVM_7_Smalltalk19"					;// ...na někoho se spoléháš a dostaneš se do problémů, tak to chodí...
	Smalltalk20					=	"SVM_7_Smalltalk20"					;// ...pochybuji, že by se to mohlo změnit...
	Smalltalk21					=	"SVM_7_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_7_Smalltalk22"					;// ...vydrž. Lepší je do ničeho se nepouštět...
	Smalltalk23					=	"SVM_7_Smalltalk23"					;// ...myslel jsem, že už je to dávno za námi...
	Smalltalk24					=	"SVM_7_Smalltalk24"					;// ...pojďme raději mluvit o něčem jiném...
	Om							= 	"SVM_7_Om"							;//Hmmm
};

//////////////////////////////////////////
instance SVM_8 (C_SVM)				// Elite-Garde. Ultra-cool. Pflichtbewusst, ernst, nüchtern! Klare Stimme
{
	StopMagic					=	"SVM_8_StopMagic"					;//Nezkoušej tady žádné čáry!
	ISaidStopMagic				=	"SVM_8_ISaidStopMagic"				;//Přestaň už s tím! Ihned!
	WeaponDown					=	"SVM_8_WeaponDown"					;//Polož tu zbraň!
	ISaidWeaponDown				=	"SVM_8_ISaidWeaponDown"				;//Dej tu věc pryč nebo to schytáš!
	WatchYourAim				=	"SVM_8_WatchYourAim"				;//Dej tu zbraň pryč, idiote!
	WatchYourAimAngry			=	"SVM_8_WatchYourAimAngry"			;//Ty se na mě odvažuješ mířit?
	WhatAreYouDoing				=	"SVM_8_WhatAreYouDoing"				;//Dávej pozor!
	LetsForgetOurLittleFight	=	"SVM_8_LetsForgetOurLittleFight"	;//Dobrá, zapomeneme na tohle malé nedorozumění.
	Strange						=	"SVM_8_Strange"						;//Ukaž se! Vím, že mě slyšíš!
	DieMonster					=	"SVM_8_DieMonster"					;//Prašivé bestie!
	DieMortalEnemy				=	"SVM_8_DieMortalEnemy"				;//Teď zemřeš! Neber si to osobně!
	NowWait						=	"SVM_8_NowWait"						;//Tys MĚ napadl, červe! Jen počkej...
	YouStillNotHaveEnough		=	"SVM_8_YouStillNotHaveEnough"		;//Nezašlapal jsem tě už jednou do prachu? Tak si to zopakujeme...
	YouAskedForIt				=	"SVM_8_YouAskedForIt"				;//Když neposloucháš, tak si to vyzkoušíš na vlastní kůži!
	NowWaitIntruder				= 	"SVM_8_NowWaitIntruder"				;//Jak ses SEM opovážil? Počkej za moment!
	IWillTeachYouRespectForForeignProperty	=	"SVM_8_IWillTeachYouRespectForForeignProperty"	;//Asi tě budu muset praštit přes prsty.
	DirtyThief					=	"SVM_8_DirtyThief"					;//Tak tohles krást neměl!
	YouAttackedMyCharge			=	"SVM_8_YouAttackedMyCharge"			;//Není nikdo, kdo by měl problém s mými lidmi a pak toho nelitoval!
	YouKilledOneOfUs			=	"SVM_8_YouKilledOneOfUs"			;//Zabil jsi jednoho z nás! To byl tvůj poslední omyl!
	Dead						=	"SVM_8_Dead"						;//Aaargl
	Aargh_1						=	"SVM_8_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_8_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_8_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_8_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_8_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_8_YesYes"						;//Dobrá! Všechno je v pořádku!
	ShitWhatAMonster			=	"SVM_8_ShitWhatAMonster"			;//Měl jsem se od té bestie držet raději dál!
	Help						=	"SVM_8_Help"						;//Rychle odsud!
	WeWillMeetAgain				=	"SVM_8_WeWillMeetAgain"				;//Ještě se uvidíme!
	NeverTryThatAgain			=	"SVM_8_NeverTryThatAgain"			;//Ještě jednou to zkusíš a jsi mrtvej!
	ITakeYourWeapon				=	"SVM_8_ITakeYourWeapon"				;//Dobrá zbraň!
	ITookYourOre				=	"SVM_8_ITookYourOre"				;//Mám dojem, žes mi ještě nezaplatil daň z rudy!
	ShitNoOre					=	"SVM_8_ShitNoOre"					;//Ubožák, jako jsi ty, samozřejmě nemá žádnou rudu!
	HandsOff					=	"SVM_8_HandsOff"					;//Ruce od toho pryč!
	GetOutOfHere				=	"SVM_8_GetOutOfHere"				;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_8_YouViolatedForbiddenTerritory";//Hej! Kde TY ses tu vzal?
	YouWannaFoolMe				=	"SVM_8_YouWannaFoolMe"				;//Ty jsi opravdu vykutálenej otrava, co?
	WhatsThisSupposedToBe		=	"SVM_8_WhatsThisSupposedToBe"		;//Hej, ty! Po čem tu pořád slídíš?
	WhyAreYouInHere				=	"SVM_8_WhyYouAreInHere"				;//Kliď se odsud nebo zavolám stráže!
	WhatDidYouInThere			=	"SVM_8_WhatDidYouInThere"			;//Po čem jsi sem přišel slídit?
	WiseMove					=	"SVM_8_WiseMove"					;//Měls štěstí!
	Alarm						=	"SVM_8_Alarm"						;//Stráže! Sem!
	IntruderAlert				= 	"SVM_8_IntruderAlert"				;//VETŘELEC!!
	BehindYou					=	"SVM_8_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_8_TheresAFight"				;//Podívejme, kdo se to tu bije!
	HeyHeyHey					=	"SVM_8_HeyHeyHey"					;//Pořádně!
	CheerFight					=	"SVM_8_CheerFight"					;//Tak pojď, pojď!
	CheerFriend					=	"SVM_8_CheerFriend"					;//Dobře! Nepolevuj!
	Ooh							=	"SVM_8_Ooh"							;//Nepárej se s ním! Dej mu pořádnou po tlamě!
	YeahWellDone				=	"SVM_8_YeahWellDone"				;//Dej mu! Ještě se hýbe!
	RunCoward					=	"SVM_8_RunCoward"					;//Už se tu nikdy neukazuj!
	HeDefeatedHim				=	"SVM_8_HeDefeatedHim"				;//Nudný boj!
	HeDeservedIt				=	"SVM_8_HeDeservedIt"				;//Ukázals mu to!
	HeKilledHim					=	"SVM_8_HeKilledHim"					;//To nebylo nutné. Poneseš za to následky.
	ItWasAGoodFight				=	"SVM_8_ItWasAGoodFight"				;//Byl to dobrý boj!
	Awake						=	"SVM_8_Awake"						;//Uaah
	FriendlyGreetings			=	"SVM_8_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_8_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_8_MageGreetings"				;//Za slávu magie!
	SectGreetings				=	"SVM_8_SectGreetings"				;//Vzbuď se!
	ThereHeIs					= 	"SVM_8_ThereHeIs"					;//Támhle je.
	NoLearnNoPoints				= 	"SVM_8_NoLearnNoPoints"				;//Nemůžu tě nic naučit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_8_NoLearnOverMax"				;//Jsi u konce svých možností. Měl by ses učit něco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_8_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vůdcem, musíš na sobě ještě pracovat!
	NoLearnYoureBetter			=	"SVM_8_NoLearnYoureBetter"			;//Už je to s tebou lepší než tehdy!
	HeyYou						=	"SVM_8_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_8_NotNow"						;//Teď ne!
	WhatDoYouWant				=	"SVM_8_WhatDoYouWant"				;//Co chceš?
	ISaidWhatDoYouWant			=	"SVM_8_ISaidWhatDoYouWant"			;//Můžu pro tebe něco udělat?
	MakeWay						=	"SVM_8_MakeWay"						;//Můžu tudy projít?
	OutOfMyWay					=	"SVM_8_OutOfMyWay"					;//Tak uhni!
	YouDeafOrWhat				=	"SVM_8_YouDeafOrWhat"				;//Kliď se! Nebo chceš, abych ti to vrazil do mozku? Vypadni odsud!
	LookingForTroubleAgain		=	"SVM_8_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_8_LookAway"					;//Ehm... Opravdu pěkný pohled!
	OkayKeepIt					=	"SVM_8_OkayKeepIt"					;//Dobrá, je tvoje!
	WhatsThat					=	"SVM_8_WhatsThat"					;//Ha? Co to bylo?
	ThatsMyWeapon				=	"SVM_8_ThatsMyWeapon"				;//Ty nosíš moji zbraň...?
	GiveItToMe					=	"SVM_8_GiveItToMe"					;//Tak dej mi ji, ihned!
	YouCanKeeptheCrap			=	"SVM_8_YouCanKeeptheCrap"			;//Nech si ji, stejně ji už nebudu potřebovat!
	TheyKilledMyFriend			=	"SVM_8_TheyKilledMyFriend"			;//Dostali jednoho z našich chlapíků. Jestli já toho lotra dostanu...
	YouDisturbedMySlumber		=	"SVM_8_YouDisturbedMySlumber"		;//Co se děje?
	SuckerGotSome				=	"SVM_8_SuckerGotSome"				;//Eh? Dostal jsi nakládačku? Dobře ti tak!
	SuckerDefeatedEBr			=	"SVM_8_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Nestačil se divit!
	SuckerDefeatedGur			=	"SVM_8_SuckerDefeatedGur"			;//Porazil jsi jednoho z Guru. Skvělé, ale už se o to nepokoušej znovu.
	SuckerDefeatedMage			=	"SVM_8_SuckerDefeatedMage"			;//Zvítězit nad mágem... Musíš mít pro strach uděláno!
	SuckerDefeatedNov_Guard		= 	"SVM_8_SuckerDefeatedNov_Guard"		;//Víš, že tihle novicové jsou pod mojí ochranou. A přesto na ně pořád dorážíš!
	SuckerDefeatedVlk_Guard		= 	"SVM_8_SuckerDefeatedVlk_Guard"		;//Jestli se dotkneš kopáčů, jako bys sahal na moje příjmy!
	YouDefeatedMyComrade		=	"SVM_8_YouDefeatedMyComrade"		;//Neměl by ses zaplétat s mými přáteli.
	YouDefeatedNOV_Guard		=	"SVM_8_YouDefeatedNOV_Guard"		;//Ještě jednou se dotkneš některého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_8_YouDefeatedVLK_Guard"		;//Jestli se pustíš do některého z mých chráněnců, mohlo by tě to stát hlavu!
	YouStoleFromMe				=	"SVM_8_YouStoleFromMe"				;//Jak se tu opovažuješ objevit, ty zloději?
	YouStoleFromUs				=	"SVM_8_YouStoleFromUs"				;//Máš u sebe něco, co patří nám. Vrať nám to!
	YouStoleFromEBr				=	"SVM_8_YouStoleFromEBr"				;//Člověče, tys kradl u Rudobaronů? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_8_YouStoleFromGur"				;//Okradl jsi Guru o pár věcí, viď?
	StoleFromMage				=	"SVM_8_StoleFromMage"				;//Okradl jsi mágy o pár věcí, viď?
	YouKilledMyFriend			=	"SVM_8_YouKilledMyFriend"			;//Máš na svědomí jednoho z našich mužů. Stačí malá chybička a přijde řada na tebe!
	YouKilledEBr				=	"SVM_8_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronů! Člověče, úplně ses pominul?
	YouKilledGur				=	"SVM_8_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nemůžu tomu uvěřit!
	YouKilledMage				=	"SVM_8_YouKilledMage"				;//Zabil jsi jednoho z mágů! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_8_YouKilledOCfolk"				;//Jeden z členů Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_8_YouKilledNCfolk"				;//Nový tábor utrpěl těžkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_8_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svých věřících a ty ho máš na svědomí!
	GetThingsRight				=	"SVM_8_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_8_YouDefeatedMeWell"			;//Pořádně jsi mi to nandal, člověče. Byl to dobrý boj! Ale teď už je konec!
	Smalltalk01					=	"SVM_8_Smalltalk01"					;// ...když myslíš...
	Smalltalk02					=	"SVM_8_Smalltalk02"					;// ...možná...
	Smalltalk03					=	"SVM_8_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_8_Smalltalk04"					;// ...udělám nejlíp, když se budu držet dál...
	Smalltalk05					=	"SVM_8_Smalltalk05"					;// ...tohle opravdu není můj problém...
	Smalltalk06					=	"SVM_8_Smalltalk06"					;// ...bylo jasné, že z toho bude mrzutost...
	Smalltalk07					=	"SVM_8_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vědět...
	Smalltalk08					=	"SVM_8_Smalltalk08"					;// ...už se to znovu nestane...
	Smalltalk09					=	"SVM_8_Smalltalk09"					;// ...a přesto na tom musí něco být...
	Smalltalk10					=	"SVM_8_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem říkáš...
	Smalltalk11					=	"SVM_8_Smalltalk11"					;// ...jestli se mě to netýká...
	Smalltalk12					=	"SVM_8_Smalltalk12"					;// ...neměl bys všemu věřit...
	Smalltalk13					=	"SVM_8_Smalltalk13"					;// ...přesto bych nechtěl být v jeho kůži...
	Smalltalk14					=	"SVM_8_Smalltalk14"					;// ...pořád ta samá pohádka...
	Smalltalk15					=	"SVM_8_Smalltalk15"					;// ...někteří lidé se nikdy nepoučí...
	Smalltalk16					=	"SVM_8_Smalltalk16"					;// ...dříve bývalo všechno docela jinak...
	Smalltalk17					=	"SVM_8_Smalltalk17"					;// ...lidé říkají...
	Smalltalk18					=	"SVM_8_Smalltalk18"					;// ...takové řeči já nikdy neposlouchám...
	Smalltalk19					=	"SVM_8_Smalltalk19"					;// ...na někoho se spoléháš a dostaneš se do problémů, tak to chodí...
	Smalltalk20					=	"SVM_8_Smalltalk20"					;// ...pochybuji, že by se to mohlo změnit...
	Smalltalk21					=	"SVM_8_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_8_Smalltalk22"					;// ...vydrž. Lepší je do ničeho se nepouštět...
	Smalltalk23					=	"SVM_8_Smalltalk23"					;// ...myslel jsem, že už je to dávno za námi...
	Smalltalk24					=	"SVM_8_Smalltalk24"					;// ...pojďme raději mluvit o něčem jiném...
	Om							= 	"SVM_8_Om"							;//Hmmm
};


instance SVM_9 (C_SVM)				// brummig		   gemütlicher Hüne, Besonnen, Brummiger Bär, Einfacher	Mensch
{
	StopMagic					=	"SVM_9_StopMagic"					;//Nechci tu žádné čarování!
	ISaidStopMagic				=	"SVM_9_ISaidStopMagic"				;//Říkám přestaň! Ihned!
	WeaponDown					=	"SVM_9_WeaponDown"					;//Chystáš se do mě pustit?
	ISaidWeaponDown				=	"SVM_9_ISaidWeaponDown"				;//Chceš ode mě nakládačku? Dej tu věc pryč!
	WatchYourAim				=	"SVM_9_WatchYourAim"				;//Dávej pozor, kam míříš!
	WatchYourAimAngry			=	"SVM_9_WatchYourAimAngry"			;//Dej tu věc pryč!
	WhatAreYouDoing				=	"SVM_9_WhatAreYouDoing"				;//Hej! Dávej pozor!
	LetsForgetOurLittleFight	=	"SVM_9_LetsForgetOurLittleFight"	;//Raději bych na tohle malé nedorozumění zapomněl...
	Strange						=	"SVM_9_Strange"						;//Ukaž se! Vím, že mě slyšíš!
	DieMonster					=	"SVM_9_DieMonster"					;//Tahle zvěř je opravdu stupidní!
	DieMortalEnemy				=	"SVM_9_DieMortalEnemy"				;//To máš za to!
	NowWait						=	"SVM_9_NowWait"						;//Teď poznáš, kdo jsem!
	YouStillNotHaveEnough		=	"SVM_9_YouStillNotHaveEnough"		;//Ty máš ale výdrž!
	YouAskedForIt				=	"SVM_9_YouAskedForIt"				;//Když neposloucháš, tak si to vyzkoušíš na vlastní kůži!
	NowWaitIntruder				= 	"SVM_9_NowWaitIntruder"				;//Teď tě dostanu, vetřelče!
	IWillTeachYouRespectForForeignProperty	=	"SVM_9_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem tě. Jestli se dotkneš mých věcí, lítáš v průšvihu!
	DirtyThief					=	"SVM_9_DirtyThief"					;//Zloději! Tohle bude tvůj konec!
	YouAttackedMyCharge			=	"SVM_9_YouAttackedMyCharge"			;//Mých chlapů se nikdo nedotkne!
	YouKilledOneOfUs			=	"SVM_9_YouKilledOneOfUs"			;//Zabil jsi jednoho z nás!
	Dead						=	"SVM_9_Dead"						;//Aaargl
	Aargh_1						=	"SVM_9_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_9_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_9_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_9_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_9_YoullBeSorryForThis"			;//Jseš mrtvej muž, akorát o tom ještě nevíš.
	YesYes						=	"SVM_9_YesYes"						;//Dobře. Všechno dobrý!
	ShitWhatAMonster			=	"SVM_9_ShitWhatAMonster"			;//Sakra, takový zvíře!
	Help						=	"SVM_9_Help"						;//Rychle odsud!
	WeWillMeetAgain				=	"SVM_9_WeWillMeetAgain"				;//Ještě se uvidíme!
	NeverTryThatAgain			=	"SVM_9_NeverTryThatAgain"			;//Ještě jednou a zabiju tě!
	ITakeYourWeapon				=	"SVM_9_ITakeYourWeapon"				;//Tahle zbraň je teď moje!
	ITookYourOre				=	"SVM_9_ITookYourOre"				;//Ruda! Je to lepší než nic!
	ShitNoOre					=	"SVM_9_ShitNoOre"					;//Už nemá ani kousek rudy!
	HandsOff					=	"SVM_9_HandsOff"					;//Ruce od toho pryč!
	GetOutOfHere				=	"SVM_9_GetOutOfHere"				;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_9_YouViolatedForbiddenTerritory";//Co tady děláš?
	YouWannaFoolMe				=	"SVM_9_YouWannaFoolMe"				;//Snažíš se mě přechytračit, co?
	WhatsThisSupposedToBe		=	"SVM_9_WhatsThisSupposedToBe"		;//Hej ty! Co tady pohledáváš?
	WhyAreYouInHere				=	"SVM_9_WhyYouAreInHere"				;//Vypadni odsud nebo zavolám stráže!
	WhatDidYouInThere			=	"SVM_9_WhatDidYouInThere"			;//Cos tady dělal?
	WiseMove					=	"SVM_9_WiseMove"					;//Chytrá hlavička!
	Alarm						=	"SVM_9_Alarm"						;//Stráže! Sem!
	IntruderAlert				= 	"SVM_9_IntruderAlert"				;//POZOR!! VETŘELEC!!!
	BehindYou					=	"SVM_9_BehindYou"					;//Za tebou!
	TheresAFight				=	"SVM_9_TheresAFight"				;//Uvidíme, jak jsou dobrý...
	HeyHeyHey					=	"SVM_9_HeyHeyHey"					;//Pořádně!
	CheerFight					=	"SVM_9_CheerFight"					;//Táák! Pokračuj, pokračuj!
	CheerFriend					=	"SVM_9_CheerFriend"					;//Výborně!
	Ooh							=	"SVM_9_Ooh"							;//Ah, dobře mířená rána!
	YeahWellDone				=	"SVM_9_YeahWellDone"				;//Výborná práce, hochu!
	RunCoward					=	"SVM_9_RunCoward"					;//Uaaah!!!!!!
	HeDefeatedHim				=	"SVM_9_HeDefeatedHim"				;//O tomhle boji už je rozhodnuto.
	HeDeservedIt				=	"SVM_9_HeDeservedIt"				;//Tvoje chyba!
	HeKilledHim					=	"SVM_9_HeKilledHim"					;//To nebylo nutné. Poneseš za to následky.
	ItWasAGoodFight				=	"SVM_9_ItWasAGoodFight"				;//Skvělý boj!
	Awake						=	"SVM_9_Awake"						;//Jo
	FriendlyGreetings			=	"SVM_9_FriendlyGreetings"			;//Nazdar
	ALGreetings					=	"SVM_9_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_9_MageGreetings"				;//Za slávu magie
	SectGreetings				=	"SVM_9_SectGreetings"				;//Probuď se!
	ThereHeIs					= 	"SVM_13_ThereHeIs"					;//Jsi slepý? Támhle!
	NoLearnNoPoints				= 	"SVM_9_NoLearnNoPoints"				;//Nemůžu tě nic naučit. Nemáš dost zkušeností..
	NoLearnOverMax				= 	"SVM_9_NoLearnOverMax"				;//Jsi u konce svých možností. Měl by ses učit něco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_9_NoLearnYouAlreadyKnow"		;//Aby ses mohl stát vůdcem, musíš na sobě ještě pracovat!
	NoLearnYoureBetter			=	"SVM_9_NoLearnYoureBetter"			;//Už je to s tebou lepší!
	HeyYou						=	"SVM_9_HeyYou"						;//Hej, ty!
	NotNow						=	"SVM_9_NotNow"						;//Teď ne!
	WhatDoYouWant				=	"SVM_9_WhatDoYouWant"				;//Co ode mě chceš?
	ISaidWhatDoYouWant			=	"SVM_9_ISaidWhatDoYouWant"			;//Můžu pro tebe něco udělat?
	MakeWay						=	"SVM_9_MakeWay"						;//Nech mě jít!
	OutOfMyWay					=	"SVM_9_OutOfMyWay"					;//Uhni stranou!
	YouDeafOrWhat				=	"SVM_9_YouDeafOrWhat"				;//Dělej, jdi z cesty!
	LookingForTroubleAgain		=	"SVM_9_LookingForTroubleAgain"		;//Chceš mít zas se mnou problémy? Proč si mě pořád dobíráš?
	LookAway					=	"SVM_9_LookAway"					;//Nojo! To máme dneska pěkné počasí!
	OkayKeepIt					=	"SVM_9_OkayKeepIt"					;//Dobrá! Je tvoje!
	WhatsThat					=	"SVM_9_WhatsThat"					;//Co to bylo?
	ThatsMyWeapon				=	"SVM_9_ThatsMyWeapon"				;//Než napočítám do tří, chci svou zbraň zpátky!
	GiveItToMe					=	"SVM_9_GiveItToMe"					;//Vrať mi ji! Hned!
	YouCanKeeptheCrap			=	"SVM_9_YouCanKeeptheCrap"			;//Nech si ji! Už ji nebudu potřebovat.
	TheyKilledMyFriend			=	"SVM_9_TheyKilledMyFriend"			;//Dostali jednoho z našich kluků. Jestli já toho lotra...
	YouDisturbedMySlumber		=	"SVM_9_YouDisturbedMySlumber"		;//Co se děje?
	SuckerGotSome				=	"SVM_9_SuckerGotSome"				;//Eh? Dostal jsi nakládačku? Dobře ti tak!
	SuckerDefeatedEBr			=	"SVM_9_SuckerDefeatedEBr"			;//Porazil jsi Rudobarona! Má na tebe vztek!
	SuckerDefeatedGur			=	"SVM_9_SuckerDefeatedGur"			;//Porazil jsi jednoho z Guru. Obdivuhodné, ale už se o to znovu nepokoušej.
	SuckerDefeatedMage			=	"SVM_9_SuckerDefeatedMage"			;//Zvítězit nad mágem... Musíš mít pro strach uděláno!
	SuckerDefeatedNov_Guard		= 	"SVM_9_SuckerDefeatedNov_Guard"		;//Musíš být šílený, žes srazil toho novice.
	SuckerDefeatedVlk_Guard		= 	"SVM_9_SuckerDefeatedVlk_Guard"		;//Co sis vlastně myslel, že děláš, když jsi zabíjel kopáče?
	YouDefeatedMyComrade		=	"SVM_9_YouDefeatedMyComrade"		;//Srazil jsi mého přítele, proč?
	YouDefeatedNOV_Guard		=	"SVM_9_YouDefeatedNOV_Guard"		;//Ještě jednou se dotkneš některého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_9_YouDefeatedVLK_Guard"		;//Jsi příliš smělý, problém s některým z chráněnců by pro tebe mohl znamenat nebezpečí.
	YouStoleFromMe				=	"SVM_9_YouStoleFromMe"				;//Jak se tu opovažuješ objevit, ty zloději?
	YouStoleFromUs				=	"SVM_9_YouStoleFromUs"				;//Krást u naší rodiny je horší než cokoliv jiného! Toho budeš litovat!
	YouStoleFromEBr				=	"SVM_9_YouStoleFromEBr"				;//Člověče, tys kradl u Rudobaronů? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_9_YouStoleFromGur"				;//Okradl jsi Guru o pár věcí, viď?
	StoleFromMage				=	"SVM_9_StoleFromMage"				;//Okradl jsi mágy o pár věcí, viď?
	YouKilledMyFriend			=	"SVM_9_YouKilledMyFriend"			;//Máš na svědomí jednoho z našich mužů. Stačí malá chybička a přijde řada na tebe!
	YouKilledEBr				=	"SVM_9_YouKilledEBr"				;//Zabil jsi jednoho z Rudobaronů! Člověče, úplně ses pominul?
	YouKilledGur				=	"SVM_9_YouKilledGur"				;//Zabil jsi jednoho z Guru! Nemůžu tomu uvěřit!
	YouKilledMage				=	"SVM_9_YouKilledMage"				;//Zabil jsi jednoho z mágů! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_9_YouKilledOCfolk"				;//Jeden z členů Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_9_YouKilledNCfolk"				;//Nový tábor utrpěl těžkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_9_YouKilledPSIfolk"			;//Bratrstvo ztratilo jednoho ze svých věřících a ty ho máš na svědomí!
	GetThingsRight				=	"SVM_9_GetThingsRight"				;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_9_YouDefeatedMeWell"			;//Dobrý boj! Tvá příprava stála za to!
	Smalltalk01					=	"SVM_9_Smalltalk01"					;// ...když myslíš...
	Smalltalk02					=	"SVM_9_Smalltalk02"					;// ...možná...
	Smalltalk03					=	"SVM_9_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_9_Smalltalk04"					;// ...udělám nejlíp, když se budu držet dál...
	Smalltalk05					=	"SVM_9_Smalltalk05"					;// ...tohle opravdu není můj problém...
	Smalltalk06					=	"SVM_9_Smalltalk06"					;// ...bylo jasné, že z toho bude mrzutost...
	Smalltalk07					=	"SVM_9_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vědět...
	Smalltalk08					=	"SVM_9_Smalltalk08"					;// ...už se to znovu nestane...
	Smalltalk09					=	"SVM_9_Smalltalk09"					;// ...a přesto na tom musí něco být...
	Smalltalk10					=	"SVM_9_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem říkáš...
	Smalltalk11					=	"SVM_9_Smalltalk11"					;// ...jestli se mě to netýká...
	Smalltalk12					=	"SVM_9_Smalltalk12"					;// ...neměl bys všemu věřit...
	Smalltalk13					=	"SVM_9_Smalltalk13"					;// ...přesto bych nechtěl být v jeho kůži...
	Smalltalk14					=	"SVM_9_Smalltalk14"					;// ...pořád ta samá pohádka...
	Smalltalk15					=	"SVM_9_Smalltalk15"					;// ...někteří lidé se nikdy nepoučí...
	Smalltalk16					=	"SVM_9_Smalltalk16"					;// ...dříve bývalo všechno docela jinak...
	Smalltalk17					=	"SVM_9_Smalltalk17"					;// ...lidé říkají...
	Smalltalk18					=	"SVM_9_Smalltalk18"					;// ...takové řeči já nikdy neposlouchám...
	Smalltalk19					=	"SVM_9_Smalltalk19"					;// ...na někoho se spoléháš a dostaneš se do problémů, tak to chodí...
	Smalltalk20					=	"SVM_9_Smalltalk20"					;// ...pochybuji, že by se to mohlo změnit...
	Smalltalk21					=	"SVM_9_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_9_Smalltalk22"					;// ...vydrž. Lepší je do ničeho se nepouštět...
	Smalltalk23					=	"SVM_9_Smalltalk23"					;// ...myslel jsem, že už je to dávno za námi...
	Smalltalk24					=	"SVM_9_Smalltalk24"					;// ...pojďme raději mluvit o něčem jiném...
	Om							= 	"SVM_9_Om"							;// Hmmm   
};



instance SVM_10	(C_SVM)				// Schlau, verschlagen,	heimlich, Zwielichtig, zynisch,	intrigant Dealer (RAVEN, KALOM)
{
	StopMagic					=	"SVM_10_StopMagic"						;//Žádné čarování!
	ISaidStopMagic				=	"SVM_10_ISaidStopMagic"					;//Přestaň už s těmi kouzly! Ihned!
	WeaponDown					=	"SVM_10_WeaponDown"						;//Dej tu zbraň pryč!
	ISaidWeaponDown				=	"SVM_10_ISaidWeaponDown"				;//Co tady pohledáváš? Chceš mít se mnou problémy?
	WatchYourAim				=	"SVM_10_WatchYourAim"					;//Dej to pryč nebo ti ukážu!
	WatchYourAimAngry			=	"SVM_10_WatchYourAimAngry"				;//Jestli chceš mít problémy, tak na mě ještě jednou zamiř!
	WhatAreYouDoing				=	"SVM_10_WhatAreYouDoing"				;//Hej! Dávej pozor! Ještě jednou a schytáš to!
	LetsForgetOurLittleFight	=	"SVM_10_LetsForgetOurLittleFight"		;//Poslyš, člověče! Zapomeneme na tuhle malou hádku, jo?
	Strange						=	"SVM_10_Strange"						;//Vystup! Ukaž se!
	DieMonster					=	"SVM_10_DieMonster"						;//Prašivé bestie!
	DieMortalEnemy				=	"SVM_10_DieMortalEnemy"					;//Teď zemřeš!
	NowWait						=	"SVM_10_NowWait"						;//Je čas zúčtování!
	YouStillNotHaveEnough		=	"SVM_10_YouStillNotHaveEnough"			;//Vypadá to, jako bys chtěl ještě jednu do tlamy!
	YouAskedForIt				=	"SVM_10_YouAskedForIt"					;//Říkal sis o to!
	NowWaitIntruder				= 	"SVM_10_NowWaitIntruder"				;//Teď tě dostanu, vetřelče!
	IWillTeachYouRespectForForeignProperty	=	"SVM_10_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem tě. Jestli se dotkneš mých věcí, lítáš v průšvihu!
	DirtyThief					=	"SVM_10_DirtyThief"						;//Zloději! Tohle bude tvůj konec!
	YouAttackedMyCharge			=	"SVM_10_YouAttackedMyCharge"			;//Mých chlapů se nikdo nedotkne!
	YouKilledOneOfUs			=	"SVM_10_YouKilledOneOfUs"				;//Zabil jsi jednoho z mých chlapů. Teď zabiju já TEBE!
	Dead						=	"SVM_10_Dead"							;//Aaargl
	Aargh_1						=	"SVM_10_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_10_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_10_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_10_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_10_YoullBeSorryForThis"			;//Toho budeš litovat! Bastarde!
	YesYes						=	"SVM_10_YesYes"							;//Dobrá, dobrá! Klid, vyhrál jsi!
	ShitWhatAMonster			=	"SVM_10_ShitWhatAMonster"				;//Taková bestie! Utíkej jak nejrychleji umíš!
	Help						=	"SVM_10_Help"							;//Pryč!
	WeWillMeetAgain				=	"SVM_10_WeWillMeetAgain"				;//Ještě mě poznáš!
	NeverTryThatAgain			=	"SVM_10_NeverTryThatAgain"				;//Ještě jednou to zkus a budeš litovat!
	ITakeYourWeapon				=	"SVM_10_ITakeYourWeapon"				;//Ta zbraň je teď moje!
	ITookYourOre				=	"SVM_10_ITookYourOre"					;//Vezmu si trochu tvojí rudy!
	ShitNoOre					=	"SVM_10_ShitNoOre"						;//Sakra, žádná RUDA!
	HandsOff					=	"SVM_10_HandsOff"						;//Ruce od toho pryč!Ty kryso!
	GetOutOfHere				=	"SVM_10_GetOutOfHere"					;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_10_YouViolatedForbiddenTerritory"	;//Hej! Odkud si přišel?
	YouWannaFoolMe				=	"SVM_10_YouWannaFoolMe"					;//Myslíš si, že jsem úplně hloupý?
	WhatsThisSupposedToBe		=	"SVM_10_WhatsThisSupposedToBe"			;//Hej! Po čem tu slídíš?
	WhyAreYouInHere				=	"SVM_10_WhyYouAreInHere"				;//Kliď se odsud nebo zavolám stráže!
	WhatDidYouInThere			=	"SVM_10_WhatDidYouInThere"				;//Cos tady dělal?
	WiseMove					=	"SVM_10_WiseMove"						;//To bylo štěstí!
	Alarm						=	"SVM_10_Alarm"							;//Stráže! Sem!
	IntruderAlert				= 	"SVM_10_IntruderAlert"					;//POZOR!!! VETŘELEC!!!
	BehindYou					=	"SVM_10_BehindYou"						;//Za tebou!
	TheresAFight				=	"SVM_10_TheresAFight"					;//Do boje!
	HeyHeyHey					=	"SVM_10_HeyHeyHey"						;//Pořádně!
	CheerFight					=	"SVM_10_CheerFight"						;//Žádnou lítost!
	CheerFriend					=	"SVM_10_CheerFriend"					;//Doraž ho!
	Ooh							=	"SVM_10_Ooh"							;//Nepárej se s ním!
	YeahWellDone				=	"SVM_10_YeahWellDone"					;//Dej mu přes tlamu!
	RunCoward					=	"SVM_10_RunCoward"						;//Vrať se, zbabělče!
	HeDefeatedHim				=	"SVM_10_HeDefeatedHim"					;//Jenom závan větru a hned by to s ním praštilo!
	HeDeservedIt				=	"SVM_10_HeDeservedIt"					;//Zasloužil si to!
	HeKilledHim					=	"SVM_10_HeKilledHim"					;//Jsi jako samotná smrt! Ta tě naučí takhle zabíjet!
	ItWasAGoodFight				=	"SVM_10_ItWasAGoodFight"				;//Tys mu dal lekci!
	Awake						=	"SVM_10_Awake"							;//Uaah
	FriendlyGreetings			=	"SVM_10_FriendlyGreetings"				;//Nazdar.
	ALGreetings					=	"SVM_10_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_10_MageGreetings"					;//Za slávu magie!
	SectGreetings				=	"SVM_10_SectGreetings"					;//Vzbuď se!
	ThereHeIs					= 	"SVM_10_ThereHeIs"						;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_10_NoLearnNoPoints"				;//Nemůžu tě nic naučit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_10_NoLearnOverMax"					;//Jsi u konce svých možností. Měl by ses učit něco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_10_NoLearnYouAlreadyKnow"			;//Aby ses mohl stát vůdcem, musíš na sobě ještě pracovat!
	NoLearnYoureBetter			=	"SVM_10_NoLearnYoureBetter"				;//Už je to s tebou lepší!
	HeyYou						=	"SVM_10_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_10_NotNow"							;//Teď ne!
	WhatDoYouWant				=	"SVM_10_WhatDoYouWant"					;//Co chceš?
	ISaidWhatDoYouWant			=	"SVM_10_ISaidWhatDoYouWant"				;//Můžu ti pomoci?
	MakeWay						=	"SVM_10_MakeWay"						;//Nech mě jít!
	OutOfMyWay					=	"SVM_10_OutOfMyWay"						;//Uhni mi z cesty!
	YouDeafOrWhat				=	"SVM_10_YouDeafOrWhat"					;//Kliď se! Nebo chceš, abych ti to vrazil do mozku?
	LookingForTroubleAgain		=	"SVM_10_LookingForTroubleAgain"			;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_10_LookAway"						;//Nejsem vlastně tady...
	OkayKeepIt					=	"SVM_10_OkayKeepIt"						;//Dobrá, nech si ten krám!
	WhatsThat					=	"SVM_10_WhatsThat"						;//Co to bylo?
	ThatsMyWeapon				=	"SVM_10_ThatsMyWeapon"					;//Vrať mi mou zbraň!
	GiveItToMe					=	"SVM_10_GiveItToMe"						;//Tak dej mi ji!
	YouCanKeeptheCrap			=	"SVM_10_YouCanKeeptheCrap"				;//Nech si ji! Už ji nebudu potřebovat.
	TheyKilledMyFriend			=	"SVM_10_TheyKilledMyFriend"				;//Dostali jednoho z našich chlapíků. To mě doopravdy štve!
	YouDisturbedMySlumber		=	"SVM_10_YouDisturbedMySlumber"			;// Hej, co je? Proč mě budíš?
	SuckerGotSome				=	"SVM_10_SuckerGotSome"					;//Eh? Dostal jsi nakládačku? Dobře ti tak!
	SuckerDefeatedEBr			=	"SVM_10_SuckerDefeatedEBr"				;//Porazil jsi Rudobarona!
	SuckerDefeatedGur			=	"SVM_10_SuckerDefeatedGur"				;//Porazil jsi jednoho z Guru.
	SuckerDefeatedMage			=	"SVM_10_SuckerDefeatedMage"				;//Zvítězit nad mágem...
	SuckerDefeatedNov_Guard		= 	"SVM_10_SuckerDefeatedNov_Guard"		;//Možná bys měl vědět, s kým si začínáš, když takhle srážíš novice!
	SuckerDefeatedVlk_Guard		= 	"SVM_10_SuckerDefeatedVlk_Guard"		;//Musím tu sjednat pořádek! Nech mé lidi na pokoji!
	YouDefeatedMyComrade		=	"SVM_10_YouDefeatedMyComrade"			;//Srazil jsi mého přítele.
	YouDefeatedNOV_Guard		=	"SVM_10_YouDefeatedNOV_Guard"			;//Ještě jednou se dotkneš některého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_10_YouDefeatedVLK_Guard"			;//Dotkni se některého z mých chráněnců a přijde tě to draho.
	YouStoleFromMe				=	"SVM_10_YouStoleFromMe"					;//Už to nezkoušej znova, zloději!
	YouStoleFromUs				=	"SVM_10_YouStoleFromUs"					;//Máš u sebe něco, co patří nám. Měl bys nám to vrátit.
	YouStoleFromEBr				=	"SVM_10_YouStoleFromEBr"				;//Člověče, tys kradl u Rudobaronů? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_10_YouStoleFromGur"				;//Okradl jsi Guru o pár věcí. To nebylo moudré nechat se přitom chytit!
	StoleFromMage				=	"SVM_10_StoleFromMage"					;//Okradl jsi mágy o pár věcí, viď?
	YouKilledMyFriend			=	"SVM_10_YouKilledMyFriend"				;//Máš na svědomí jednoho z našich mužů. Stačí malá chybička a přijde řada na tebe!
	YouKilledEBr				=	"SVM_10_YouKilledEBr"					;//Zabil jsi jednoho z Rudobaronů! Člověče, úplně ses pominul?
	YouKilledGur				=	"SVM_10_YouKilledGur"					;//Zabil jsi jednoho z Guru! Nemůžu tomu uvěřit!
	YouKilledMage				=	"SVM_10_YouKilledMage"					;//Zabil jsi jednoho z mágů! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_10_YouKilledOCfolk"				;//Jeden z členů Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_10_YouKilledNCfolk"				;//Nový tábor utrpěl těžkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_10_YouKilledPSIfolk"				;//Bratrstvo ztratilo jednoho ze svých věřících a ty ho máš na svědomí!
	GetThingsRight				=	"SVM_10_GetThingsRight"					;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_10_YouDefeatedMeWell"				;//Výborně! Vyhrál jsi, ale byl to dobrý boj.
	Smalltalk01					=	"SVM_10_Smalltalk01"					;// ...když myslíš...
	Smalltalk02					=	"SVM_10_Smalltalk02"					;// ...možná...
	Smalltalk03					=	"SVM_10_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_10_Smalltalk04"					;// ...udělám nejlíp, když se budu držet dál...
	Smalltalk05					=	"SVM_10_Smalltalk05"					;// ...tohle opravdu není můj problém...
	Smalltalk06					=	"SVM_10_Smalltalk06"					;// ...bylo jasné, že z toho bude mrzutost...
	Smalltalk07					=	"SVM_10_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vědět...
	Smalltalk08					=	"SVM_10_Smalltalk08"					;// ...už se to znovu nestane...
	Smalltalk09					=	"SVM_10_Smalltalk09"					;// ...a přesto na tom musí něco být...
	Smalltalk10					=	"SVM_10_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem říkáš...
	Smalltalk11					=	"SVM_10_Smalltalk11"					;// ...jestli se mě to netýká...
	Smalltalk12					=	"SVM_10_Smalltalk12"					;// ...neměl bys všemu věřit...
	Smalltalk13					=	"SVM_10_Smalltalk13"					;// ...přesto bych nechtěl být v jeho kůži...
	Smalltalk14					=	"SVM_10_Smalltalk14"					;// ...pořád ta samá pohádka...
	Smalltalk15					=	"SVM_10_Smalltalk15"					;// ...někteří lidé se nikdy nepoučí...
	Smalltalk16					=	"SVM_10_Smalltalk16"					;// ...dříve bývalo všechno docela jinak...
	Smalltalk17					=	"SVM_10_Smalltalk17"					;// ...lidé říkají...
	Smalltalk18					=	"SVM_10_Smalltalk18"					;// ...takové řeči já nikdy neposlouchám...
	Smalltalk19					=	"SVM_10_Smalltalk19"					;// ...na někoho se spoléháš a dostaneš se do problémů, tak to chodí...
	Smalltalk20					=	"SVM_10_Smalltalk20"					;// ...pochybuji, že by se to mohlo změnit...
	Smalltalk21					=	"SVM_10_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_10_Smalltalk22"					;// ...vydrž. Lepší je do ničeho se nepouštět...
	Smalltalk23					=	"SVM_10_Smalltalk23"					;// ...myslel jsem, že už je to dávno za námi...
	Smalltalk24					=	"SVM_10_Smalltalk24"					;// ...pojďme raději mluvit o něčem jiném...
	Om							= 	"SVM_10_Om"							;//Hmmm
};



//////////////////////////////////////////
instance SVM_11	(C_SVM)				//Profi				Ruhig, abgezockt, Vernünftig aberknallhart
{
	StopMagic					=	"SVM_11_StopMagic"						;//Nepokoušej se tu čarovat!
	ISaidStopMagic				=	"SVM_11_ISaidStopMagic"					;//Přestaň už s těmi kouzly! Ihned!
	WeaponDown					=	"SVM_11_WeaponDown"						;//Jestli hledáš problémy, tak pokračuj!
	ISaidWeaponDown				=	"SVM_11_ISaidWeaponDown"				;//Ruce od toho pryč nebo tě oddělám!
	WatchYourAim				=	"SVM_11_WatchYourAim"					;//Dej tu věc pryč!
	WatchYourAimAngry			=	"SVM_11_WatchYourAimAngry"				;//Tak ty chceš mít se mnou problémy? Víš to jistě?
	WhatAreYouDoing				=	"SVM_11_WhatAreYouDoing"				;//Co to děláš! Přestaň!
	LetsForgetOurLittleFight	=	"SVM_11_LetsForgetOurLittleFight"		;//Dobrá, zapomeneme na tuhle hádku.
	Strange						=	"SVM_11_Strange"						;//Hmm! Sakra! Jak se sem dostal?
	DieMonster					=	"SVM_11_DieMonster"						;//Jestli mi zkříží cestu, bude to jejich smrt!
	DieMortalEnemy				=	"SVM_11_DieMortalEnemy"					;//Pokud si uděláš nepřátele, pak se s nimi musíš dokázat vypořádat. Zemři.
	NowWait						=	"SVM_11_NowWait"						;//Tos neměl dělat!
	YouStillNotHaveEnough		=	"SVM_11_YouStillNotHaveEnough"			;//Copak jsem ti už jednu nevrazil? Tumáš další...
	YouAskedForIt				=	"SVM_11_YouAskedForIt"					;//Když neumíš poslouchat, bude tě to mrzet!
	NowWaitIntruder				= 	"SVM_11_NowWaitIntruder"				;//Hej, vetřelče! Teď dostaneš lekci!
	IWillTeachYouRespectForForeignProperty	=	"SVM_11_IWillTeachYouRespectForForeignProperty"	;//Asi tě budu muset praštit přes prsty.
	DirtyThief					=	"SVM_11_DirtyThief"						;//Krádež za to nestojí.
	YouAttackedMyCharge			=	"SVM_11_YouAttackedMyCharge"			;//Narušil jsi moje území! Teď tě oddělám!
	YouKilledOneOfUs			=	"SVM_11_YouKilledOneOfUs"				;//Zabil jsi jednoho z mých chlapů. To byla tvoje poslední chyba!
	Dead						=	"SVM_11_Dead"							;//Aaargl
	Aargh_1						=	"SVM_11_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_11_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_11_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_11_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_11_YoullBeSorryForThis"			;//Tos neměl dělat!
	YesYes						=	"SVM_11_YesYes"							;//Dobrá, dobrá! Klid, vyhrál jsi!
	ShitWhatAMonster			=	"SVM_11_ShitWhatAMonster"				;//To je na mě moc!
	Help						=	"SVM_11_Help"							;//Kliď se!
	WeWillMeetAgain				=	"SVM_11_WeWillMeetAgain"				;//Tohle bude mít následky, kamaráde!
	NeverTryThatAgain			=	"SVM_11_NeverTryThatAgain"				;//Už to znova nezkoušej!
	ITakeYourWeapon				=	"SVM_11_ITakeYourWeapon"				;//O tvojí zbraň se postarám líp než ty!
	ITookYourOre				=	"SVM_11_ITookYourOre"					;//Dík, žes mi nechal trochu své rudy!
	ShitNoOre					=	"SVM_11_ShitNoOre"						;//Nic, žádná ruda!
	HandsOff					=	"SVM_11_HandsOff"						;//Dej ty svý špinavý pracky pryč!
	GetOutOfHere				=	"SVM_11_GetOutOfHere"					;//Kliď se odsuď nebo tě proženu!
	YouViolatedForbiddenTerritory=	"SVM_11_YouViolatedForbiddenTerritory"	;//Hej! Kde TY ses tu vzal?
	YouWannaFoolMe				=	"SVM_11_YouWannaFoolMe"					;//Se mnou ne, příteli!
	WhatsThisSupposedToBe		=	"SVM_11_WhatsThisSupposedToBe"			;//Po čem tu slídíš?
	WhyAreYouInHere				=	"SVM_11_WhyYouAreInHere"				;//Ta chatrč je moje! Kliď se nebo zavolám stráže!
	WhatDidYouInThere			=	"SVM_11_WhatDidYouInThere"				;//Cos tady dělal? Vypadni, než tě sejmu!
	WiseMove					=	"SVM_11_WiseMove"						;//Dobrá! Už to znovu nedělej!
	Alarm						=	"SVM_11_Alarm"							;//Stráže! Sem!
	IntruderAlert				= 	"SVM_11_IntruderAlert"					;//POZOR!!! VETŘELEC!!!
	BehindYou					=	"SVM_11_BehindYou"						;//Za tebou!
	TheresAFight				=	"SVM_11_TheresAFight"					;//Uvidíme tentokrát, kdo z koho!
	HeyHeyHey					=	"SVM_11_HeyHeyHey"						;//Pořádně! Do toho!
	CheerFight					=	"SVM_11_CheerFight"						;//Přestaň si s ním hrát!
	CheerFriend					=	"SVM_11_CheerFriend"					;//Dělej, snad na něj stačíš, ne?
	Ooh							=	"SVM_11_Ooh"							;//Oh! Nic moc!
	YeahWellDone				=	"SVM_11_YeahWellDone"					;//Hmm! To nebylo zlý!
	RunCoward					=	"SVM_11_RunCoward"						;//Už se tu nikdy neukazuj!
	HeDefeatedHim				=	"SVM_11_HeDefeatedHim"					;//Dobrá rána!
	HeDeservedIt				=	"SVM_11_HeDeservedIt"					;//Co dělat! Zasloužil si to!
	HeKilledHim					=	"SVM_11_HeKilledHim"					;//Tys ho zabil! Z toho bude velká mrzutost!
	ItWasAGoodFight				=	"SVM_11_ItWasAGoodFight"				;//Výborná práce! Krásné představení!
	Awake						=	"SVM_11_Awake"							;//Uaah
	FriendlyGreetings			=	"SVM_11_FriendlyGreetings"				;//Nazdar!
	ALGreetings					=	"SVM_11_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_11_MageGreetings"					;//Za slávu magie!
	SectGreetings				=	"SVM_11_SectGreetings"					;//Vzbuď se!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Jsi slepý? Támhle!
	NoLearnNoPoints				= 	"SVM_11_NoLearnNoPoints"				;//Nemůžu tě nic naučit, protože nemáš žádné zkušenosti.
	NoLearnOverMax				= 	"SVM_11_NoLearnOverMax"					;//Jsi u konce svých možností. Měl by ses učit něco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_11_NoLearnYouAlreadyKnow"			;//Aby ses mohl stát vůdcem, musíš na sobě ještě pracovat!
	NoLearnYoureBetter			=	"SVM_11_NoLearnYoureBetter"				;//Už je to s tebou lepší!
	HeyYou						=	"SVM_11_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_11_NotNow"							;//Teď ne!
	WhatDoYouWant				=	"SVM_11_WhatDoYouWant"					;//Co chceš?
	ISaidWhatDoYouWant			=	"SVM_11_ISaidWhatDoYouWant"				;//Můžu pro tebe něco udělat?
	MakeWay						=	"SVM_11_MakeWay"						;//Můžu tudy projít?
	OutOfMyWay					=	"SVM_11_OutOfMyWay"						;//Ustup stranou!
	YouDeafOrWhat				=	"SVM_11_YouDeafOrWhat"					;//Kliď se! Nebo chceš, abych ti to vrazil do mozku?
	LookingForTroubleAgain		=	"SVM_11_LookingForTroubleAgain"			;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_11_LookAway"						;//Nechci se do toho zaplést!
	OkayKeepIt					=	"SVM_11_OkayKeepIt"						;//Dobrá, je tvoje!
	WhatsThat					=	"SVM_11_WhatsThat"						;//Co to bylo?
	ThatsMyWeapon				=	"SVM_11_ThatsMyWeapon"					;//Ty máš moji zbraň...?
	GiveItToMe					=	"SVM_11_GiveItToMe"						;//Tak dej mi ji, dělej!
	YouCanKeeptheCrap			=	"SVM_11_YouCanKeeptheCrap"				;//Nech si ji! Stejně ji už nebudu potřebovat!
	TheyKilledMyFriend			=	"SVM_11_TheyKilledMyFriend"				;//Dostali jednoho z našich chlapíků. Jestli já toho lotra dostanu...
	YouDisturbedMySlumber		=	"SVM_11_YouDisturbedMySlumber"			;//Co pořád je?
	SuckerGotSome				=	"SVM_11_SuckerGotSome"					;//Dostal jsi nakládačku? Dobře ti tak!
	SuckerDefeatedEBr			=	"SVM_11_SuckerDefeatedEBr"				;//Porazil jsi jednoho z Rudobaronů! Skvělé, ale hloupé! Velmi hloupé!
	SuckerDefeatedGur			=	"SVM_11_SuckerDefeatedGur"				;//Porazil jsi jednoho z Guru.
	SuckerDefeatedMage			=	"SVM_11_SuckerDefeatedMage"				;//Zvítězit nad mágem... to není právě moudré!
	SuckerDefeatedNov_Guard		= 	"SVM_11_SuckerDefeatedNov_Guard"		;//Tihle hoši jsou pod mojí ochranou, a tys jednoho z nich srazil...
	SuckerDefeatedVlk_Guard		= 	"SVM_11_SuckerDefeatedVlk_Guard"		;//Jestli se dotkneš kopáčů, jako bys sahal na moje příjmy!
	YouDefeatedMyComrade		=	"SVM_11_YouDefeatedMyComrade"			;//Kdo je proti mému  příteli, jakoby byl proti mně!
	YouDefeatedNOV_Guard		=	"SVM_11_YouDefeatedNOV_Guard"			;//Ještě jednou se dotkneš některého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_11_YouDefeatedVLK_Guard"			;//Jestli vztáhneš ruku na někoho, kdo je pod mojí ochranou, bude tě to stát hlavu!
	YouStoleFromMe				=	"SVM_11_YouStoleFromMe"					;//Jak se sem opovažuješ vrátit, ty zloději?
	YouStoleFromUs				=	"SVM_11_YouStoleFromUs"					;//Máš něco, co patří nám. Měl bys nám to vrátit.
	YouStoleFromEBr				=	"SVM_11_YouStoleFromEBr"				;//Člověče, tys kradl u Rudobaronů? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_11_YouStoleFromGur"				;//Okradl jsi Guru o pár věcí, viď?
	StoleFromMage				=	"SVM_11_StoleFromMage"					;//Okradl jsi mágy o pár věcí, viď?
	YouKilledMyFriend			=	"SVM_11_YouKilledMyFriend"				;//Porušil jsi naše pravidlo číslo 1. Nezabíjet!
	YouKilledEBr				=	"SVM_11_YouKilledEBr"					;//Zabil jsi jednoho z Rudobaronů! Člověče, úplně ses pominul?
	YouKilledGur				=	"SVM_11_YouKilledGur"					;//Zabil jsi jednoho z Guru! Tomu, hochu, nemůžu uvěřit!
	YouKilledMage				=	"SVM_11_YouKilledMage"					;//Zabil jsi jednoho z mágů! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_11_YouKilledOCfolk"				;//Jeden z členů Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_11_YouKilledNCfolk"				;//Nový tábor utrpěl těžkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_11_YouKilledPSIfolk"				;//Bratrstvo ztratilo jednoho ze svých věřících a ty ho máš na svědomí!
	GetThingsRight				=	"SVM_11_GetThingsRight"					;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_11_YouDefeatedMeWell"				;//Byl to dobrý boj! Pořádně jsem to od tebe schytal, člověče!
	Smalltalk01					=	"SVM_11_Smalltalk01"					;// ...když myslíš...
	Smalltalk02					=	"SVM_11_Smalltalk02"					;// ...možná...
	Smalltalk03					=	"SVM_11_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_11_Smalltalk04"					;// ...udělám nejlíp, když se budu držet dál...
	Smalltalk05					=	"SVM_11_Smalltalk05"					;// ...tohle opravdu není můj problém...
	Smalltalk06					=	"SVM_11_Smalltalk06"					;// ...bylo jasné, že z toho bude mrzutost...
	Smalltalk07					=	"SVM_11_Smalltalk07"					;// ...nech si to pro sebe, lidé to nemusejí vědět...
	Smalltalk08					=	"SVM_11_Smalltalk08"					;// ...už se to znovu nestane...
	Smalltalk09					=	"SVM_11_Smalltalk09"					;// ...a přesto na tom musí něco být...
	Smalltalk10					=	"SVM_11_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem říkáš...
	Smalltalk11					=	"SVM_11_Smalltalk11"					;// ...jestli se mě to netýká...
	Smalltalk12					=	"SVM_11_Smalltalk12"					;// ...neměl bys všemu věřit...
	Smalltalk13					=	"SVM_11_Smalltalk13"					;// ...přesto bych nechtěl být v jeho kůži...
	Smalltalk14					=	"SVM_11_Smalltalk14"					;// ...pořád ta samá pohádka...
	Smalltalk15					=	"SVM_11_Smalltalk15"					;// ...někteří lidé se nikdy nepoučí...
	Smalltalk16					=	"SVM_11_Smalltalk16"					;// ...dříve bývalo všechno docela jinak...
	Smalltalk17					=	"SVM_11_Smalltalk17"					;// ...lidé říkají...
	Smalltalk18					=	"SVM_11_Smalltalk18"					;// ...takové řeči já nikdy neposlouchám...
	Smalltalk19					=	"SVM_11_Smalltalk19"					;// ...na někoho se spoléháš a dostaneš se do problémů, tak to chodí...
	Smalltalk20					=	"SVM_11_Smalltalk20"					;// ...pochybuji, že by se to mohlo změnit...
	Smalltalk21					=	"SVM_11_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_11_Smalltalk22"					;// ...vydrž. Lepší je do ničeho se nepouštět...
	Smalltalk23					=	"SVM_11_Smalltalk23"					;// ...myslel jsem, že už je to dávno za námi...
	Smalltalk24					=	"SVM_11_Smalltalk24"					;// ...pojďme raději mluvit o něčem jiném...
	Om							= 	"SVM_11_Om"								;//Hmmm
};


instance SVM_12	(C_SVM)		//Bazaar-Händler		Nach außen freundlich,jovial,Innen hinterhältig, raffgierig
{
	StopMagic					=	"SVM_12_StopMagic"						;//Přestaň s těmi kouzly!
	ISaidStopMagic				=	"SVM_12_ISaidStopMagic"					;//Když říkám: přestaň s těmi kouzly, tak to myslím vážně!
	WeaponDown					=	"SVM_12_WeaponDown"						;//Co chceš s tou zbraní udělat, člověče!
	ISaidWeaponDown				=	"SVM_12_ISaidWeaponDown"				;//Dej to pryč!
	WatchYourAim				=	"SVM_12_WatchYourAim"					;//Míříš na mě!
	WatchYourAimAngry			=	"SVM_12_WatchYourAimAngry"				;//Jestli s tím nepřestaneš, budeš mít problémy!
	WhatAreYouDoing				=	"SVM_12_WhatAreYouDoing"				;//Hej, seš slepej, nebo co?
	LetsForgetOurLittleFight	=	"SVM_12_LetsForgetOurLittleFight"		;//Zapomeneme na to malé nedorozumění, dobrá?
	Strange						=	"SVM_12_Strange"						;//Ještě před chvilkou tu byl! Divné!
	DieMonster					=	"SVM_12_DieMonster"						;//Tvůj čas nadešel, bastarde!
	DieMortalEnemy				=	"SVM_12_DieMortalEnemy"					;//Je čas zúčtování!
	NowWait						=	"SVM_12_NowWait"						;//Říkáš si o pořádnou nakládačku!
	YouStillNotHaveEnough		=	"SVM_12_YouStillNotHaveEnough"			;//Ty ještě nemáš dost?
	YouAskedForIt				=	"SVM_12_YouAskedForIt"					;//Dobrá, říkal sis o to!
	NowWaitIntruder				= 	"SVM_12_NowWaitIntruder"				;//Oni tě odsud vynesou!
	IWillTeachYouRespectForForeignProperty	=	"SVM_12_IWillTeachYouRespectForForeignProperty"	;//Varoval jsem tě. Jestli se dotkneš mých věcí, lítáš v průšvihu!
	DirtyThief					=	"SVM_12_DirtyThief"						;//Ty všivej zloději! Já tě naučím!
	YouAttackedMyCharge			=	"SVM_12_YouAttackedMyCharge"			;//Není nikdo, kdo by měl problém s mými lidmi a pak toho nelitoval!
	YouKilledOneOfUs			=	"SVM_12_YouKilledOneOfUs"				;//Zabil jsi jednoho z nás! Teď zabiju já TEBE!
	Dead						=	"SVM_12_Dead"							;//Aaargl
	Aargh_1						=	"SVM_12_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_12_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_12_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_12_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_12_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_12_YesYes"							;//Klid, klid, vyhrál jsi!
	ShitWhatAMonster			=	"SVM_12_ShitWhatAMonster"				;//To je na mě moc! Na to nestačím!
	Help						=	"SVM_12_Help"							;//K čertu!
	WeWillMeetAgain				=	"SVM_12_WeWillMeetAgain"				;//Ještě se uvidíme!
	NeverTryThatAgain			=	"SVM_12_NeverTryThatAgain"				;//Už to znova nezkoušej!
	ITakeYourWeapon				=	"SVM_12_ITakeYourWeapon"				;//Tahle zbraň se mi líbí!
	ITookYourOre				=	"SVM_12_ITookYourOre"					;//Podívám se, jak je tvá ruda dobře uložená!
	ShitNoOre					=	"SVM_12_ShitNoOre"						;//K čertu! Žádná ruda!
	HandsOff					=	"SVM_12_HandsOff"						;//Ruce od toho pryč!
	GetOutOfHere				=	"SVM_12_GetOutOfHere"					;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_12_YouViolatedForbiddenTerritory";//Hej! Jak ses sem dostal?
	YouWannaFoolMe				=	"SVM_12_YouWannaFoolMe"					;//Myslíš, že jsem tak hloupý?
	WhatsThisSupposedToBe		=	"SVM_12_WhatsThisSupposedToBe"			;//Co tady pohledáváš?
	WhyAreYouInHere				=	"SVM_12_WhyYouAreInHere"				;//Vypadni odsud nebo zavolám stráže!
	WhatDidYouInThere			=	"SVM_12_WhatDidYouInThere"				;//Tady nemáš co dělat!
	WiseMove					=	"SVM_12_WiseMove"						;//Učíš se rychle!
	Alarm						=	"SVM_12_Alarm"							;//Stráže! Sem!
	IntruderAlert				= 	"SVM_12_IntruderAlert"					;//POZOR!!
	BehindYou					=	"SVM_12_BehindYou"						;//Za tebou!
	TheresAFight				=	"SVM_12_TheresAFight"					;//Do boje!
	HeyHeyHey					=	"SVM_12_HeyHeyHey"						;//Pořádně!
	CheerFight					=	"SVM_12_CheerFight"						;//Výborně!
	CheerFriend					=	"SVM_12_CheerFriend"					;//Vyřiď ho!
	Ooh							=	"SVM_12_Ooh"							;//Tak dávej pozor!
	YeahWellDone				=	"SVM_12_YeahWellDone"					;//Už bylo na čase!
	RunCoward					=	"SVM_12_RunCoward"						;//Ten chlapík utíká pryč!
	HeDefeatedHim				=	"SVM_12_HeDefeatedHim"					;//Jasný vítěz, jak jsem řek!
	HeDeservedIt				=	"SVM_12_HeDeservedIt"					;//Zasloužil si to!
	HeKilledHim					=	"SVM_12_HeKilledHim"					;//Akorát zabíjíš lidi. Máš teď pořádnej problém.
	ItWasAGoodFight				=	"SVM_12_ItWasAGoodFight"				;//Skvělý boj!
	Awake						=	"SVM_12_Awake"							;//Uuaah
	FriendlyGreetings			=	"SVM_12_FriendlyGreetings"				;//Nazdar
	ALGreetings					=	"SVM_12_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_12_MageGreetings"					;//Za slávu magie
	SectGreetings				=	"SVM_12_SectGreetings"					;//Probuď se!
	ThereHeIs					= 	"SVM_12_ThereHeIs"						;//Támhle!
	NoLearnNoPoints				= 	"SVM_12_NoLearnNoPoints"				;//Nemůžu tě nic naučit. Nemáš dost zkušeností..
	NoLearnOverMax				= 	"SVM_12_NoLearnOverMax"					;//Jsi u konce svých možností. Měl by ses učit něco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_12_NoLearnYouAlreadyKnow"			;//Aby ses mohl stát vůdcem, musíš na sobě ještě pracovat!
	NoLearnYoureBetter			=	"SVM_12_NoLearnYoureBetter"				;//Už je to s tebou lepší!
	HeyYou						=	"SVM_12_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_12_NotNow"							;//Teď ne!
	WhatDoYouWant				=	"SVM_12_WhatDoYouWant"					;//Můžu ti pomoci?
	ISaidWhatDoYouWant			=	"SVM_12_ISaidWhatDoYouWant"				;//Co chceš?
	MakeWay						=	"SVM_12_MakeWay"						;//Nech mě jít!
	OutOfMyWay					=	"SVM_12_OutOfMyWay"						;//Dělej, uhni mi z cesty!
	YouDeafOrWhat				=	"SVM_12_YouDeafOrWhat"					;//Jseš hluchej nebo toužíš po maléru?
	LookingForTroubleAgain		=	"SVM_12_LookingForTroubleAgain"			;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_12_LookAway"						;//Stalo se něco? Neviděl jsem NIC...
	OkayKeepIt					=	"SVM_12_OkayKeepIt"						;//Dobrá! Tak si ji nech!
	WhatsThat					=	"SVM_12_WhatsThat"						;//Co to bylo?
	ThatsMyWeapon				=	"SVM_12_ThatsMyWeapon"					;//Opravdu chci svoji zbraň zpátky!
	GiveItToMe					=	"SVM_12_GiveItToMe"						;//Tak dej mi ji!
	YouCanKeeptheCrap			=	"SVM_12_YouCanKeeptheCrap"				;//Hm, není špatná! Sehnal jsem další!
	TheyKilledMyFriend			=	"SVM_12_TheyKilledMyFriend"				;//Dostali jednoho z našich kluků. Jestli já toho lotra...
	YouDisturbedMySlumber		=	"SVM_12_YouDisturbedMySlumber"			;//Hm, co to je? Proč mě budíš?
	SuckerGotSome				=	"SVM_12_SuckerGotSome"					;//Eh? Dostal jsi nakládačku? Dobře ti tak!
	SuckerDefeatedEBr			=	"SVM_12_SuckerDefeatedEBr"				;//Porazil jsi Rudobarona! Má na tebe vztek!
	SuckerDefeatedGur			=	"SVM_12_SuckerDefeatedGur"				;//Porazil jsi jednoho z Guru. Skvělé, ale už se o to znovu nepokoušej.
	SuckerDefeatedMage			=	"SVM_12_SuckerDefeatedMage"				;//Zvítězit nad mágem... Musíš mít pro strach uděláno!
	SuckerDefeatedNov_Guard		= 	"SVM_12_SuckerDefeatedNov_Guard"		;//Musíš být šílený, žes srazil toho novice.
	SuckerDefeatedVlk_Guard		= 	"SVM_12_SuckerDefeatedVlk_Guard"		;//Co sis vlastně myslel, že děláš, když jsi zabíjel kopáče?
	YouDefeatedMyComrade		=	"SVM_12_YouDefeatedMyComrade"			;//Srazil jsi mého přítele, proč?
	YouDefeatedNOV_Guard		=	"SVM_12_YouDefeatedNOV_Guard"			;//Ještě jednou se dotkneš některého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_12_YouDefeatedVLK_Guard"			;//Jsi příliš smělý, problém s některým z mých chráněnců by pro tebe mohl znamenat nebezpečí.
	YouStoleFromMe				=	"SVM_12_YouStoleFromMe"					;//Jak se sem opovažuješ vrátit, ty zloději?
	YouStoleFromUs				=	"SVM_12_YouStoleFromUs"					;//Máš něco, co patří nám. Měl bys nám to vrátit.
	YouStoleFromEBr				=	"SVM_12_YouStoleFromEBr"				;//Člověče, tys kradl u Rudobaronů? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_12_YouStoleFromGur"				;//Kradl jsi u Guru! Nemusel ses aspoň nechat nachytat!
	StoleFromMage				=	"SVM_12_StoleFromMage"					;//Mágové nemají rádi lidi, co se motají kolem jejich věcí!
	YouKilledMyFriend			=	"SVM_12_YouKilledMyFriend"				;//Máš na svědomí jednoho z našich mužů. Stačí malá chybička a přijde řada na tebe!
	YouKilledEBr				=	"SVM_12_YouKilledEBr"					;//Zabil jsi jednoho z Rudobaronů! Člověče, úplně ses pominul?
	YouKilledGur				=	"SVM_12_YouKilledGur"					;//Zabil jsi jednoho z Guru! Tomu, hochu, nemůžu uvěřit!
	YouKilledMage				=	"SVM_12_YouKilledMage"					;//Zabil jsi jednoho z mágů! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_12_YouKilledOCfolk"				;//Jeden z členů Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_12_YouKilledNCfolk"				;//Nový tábor utrpěl těžkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_12_YouKilledPSIfolk"				;//Bratrstvo ztratilo jednoho ze svých věřících a ty ho máš na svědomí!
	GetThingsRight				=	"SVM_12_GetThingsRight"					;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_12_YouDefeatedMeWell"				;//Pořádně jsi mi to nandal, člověče. Byl to dobrý boj! Ale teď už je konec!
	Smalltalk01					=	"SVM_12_Smalltalk01"					;// ...když myslíš...
	Smalltalk02					=	"SVM_12_Smalltalk02"					;// ...možná...
	Smalltalk03					=	"SVM_12_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_12_Smalltalk04"					;// ...udělám nejlíp, když se budu držet dál...
	Smalltalk05					=	"SVM_12_Smalltalk05"					;// ...tohle opravdu není můj problém...
	Smalltalk06					=	"SVM_12_Smalltalk06"					;// ...bylo jasné, že z toho bude mrzutost...
	Smalltalk07					=	"SVM_12_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vědět...
	Smalltalk08					=	"SVM_12_Smalltalk08"					;// ...už se to znovu nestane...
	Smalltalk09					=	"SVM_12_Smalltalk09"					;// ...a přesto na tom musí něco být...
	Smalltalk10					=	"SVM_12_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem říkáš...
	Smalltalk11					=	"SVM_12_Smalltalk11"					;// ...jestli se mě to netýká...
	Smalltalk12					=	"SVM_12_Smalltalk12"					;// ...neměl bys všemu věřit...
	Smalltalk13					=	"SVM_12_Smalltalk13"					;// ...přesto bych nechtěl být v jeho kůži...
	Smalltalk14					=	"SVM_12_Smalltalk14"					;// ...pořád ta samá pohádka...
	Smalltalk15					=	"SVM_12_Smalltalk15"					;// ...někteří lidé se nikdy nepoučí...
	Smalltalk16					=	"SVM_12_Smalltalk16"					;// ...dříve bývalo všechno docela jinak...
	Smalltalk17					=	"SVM_12_Smalltalk17"					;// ...lidé říkají...
	Smalltalk18					=	"SVM_12_Smalltalk18"					;// ...takové řeči já nikdy neposlouchám...
	Smalltalk19					=	"SVM_12_Smalltalk19"					;// ...na někoho se spoléháš a dostaneš se do problémů, tak to chodí...
	Smalltalk20					=	"SVM_12_Smalltalk20"					;// ...pochybuji, že by se to mohlo změnit...
	Smalltalk21					=	"SVM_12_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_12_Smalltalk22"					;// ...vydrž. Lepší je do ničeho se nepouštět...
	Smalltalk23					=	"SVM_12_Smalltalk23"					;// ...myslel jsem, že už je to dávno za námi...
	Smalltalk24					=	"SVM_12_Smalltalk24"					;// ...pojďme raději mluvit o něčem jiném...
	Om							= 	"SVM_12_Om"							;//Hmmm
};


instance SVM_13	(C_SVM)					// Fanatiker	Agressiv, übereifrig, Ähnlich wie Stimme7Freak,	aber klarer, Ruhm-und-Ehre-Typ,	Nov: Glauben an	Y´berion blind,	Mitläufer
{
	StopMagic					=	"SVM_13_StopMagic"						;//Přestaň už s těmi kouzly!
	ISaidStopMagic				=	"SVM_13_ISaidStopMagic"					;//Dej to pryč! IHNED!
	WeaponDown					=	"SVM_13_WeaponDown"						;//Polož tu zbraň!
	ISaidWeaponDown				=	"SVM_13_ISaidWeaponDown"				;//Polož tu zbraň!
	WatchYourAim				=	"SVM_13_WatchYourAim"					;//Ty na mě míříš? Dej si pozor!
	WatchYourAimAngry			=	"SVM_13_WatchYourAimAngry"				;//Jdeš si rovnou pro smrt! Měl bys raději mířit jinam!
	WhatAreYouDoing				=	"SVM_13_WhatAreYouDoing"				;//Co to mělo znamenat?
	LetsForgetOurLittleFight	=	"SVM_13_LetsForgetOurLittleFight"		;//Dobrá, zapomeňme na tuhle hádku, dobrý?
	Strange						=	"SVM_13_Strange"						;//Kam se poděl? To není možné!
	DieMonster					=	"SVM_13_DieMonster"						;//Dnes večer budeme mít maso!
	DieMortalEnemy				=	"SVM_13_DieMortalEnemy"					;//Teď je řada na tobě! Bez milosti!
	NowWait						=	"SVM_13_NowWait"						;//To znamená pořádný výprask!
	YouStillNotHaveEnough		=	"SVM_13_YouStillNotHaveEnough"			;//Už to znova nezkoušej! Jasný?
	YouAskedForIt				=	"SVM_13_YouAskedForIt"					;//Sám jsi to chtěl!
	NowWaitIntruder				= 	"SVM_13_NowWaitIntruder"				;//Nemáš tu co pohledávat, vetřelče!
	IWillTeachYouRespectForForeignProperty	=	"SVM_13_IWillTeachYouRespctForForeignProperty"	;//Asi tě budu muset praštit přes prsty!
	DirtyThief					=	"SVM_13_DirtyThief"						;//Zloději prašivej! Zpřerážím ti hnáty...
	YouAttackedMyCharge			=	"SVM_13_YouAttackedMyCharge"			;//Tady se nikdo nikoho nedotkne, s výjimkou mě!
	YouKilledOneOfUs			=	"SVM_13_YouKilledOneOfUs"				;//Zabil jsi jednoho z nás!
	Dead						=	"SVM_13_Dead"							;//Aaargl
	Aargh_1						=	"SVM_13_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_13_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_13_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_13_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_13_YoullBeSorryForThis"			;//Nebudeš mít moc času toho litovat!
	YesYes						=	"SVM_13_YesYes"							;//Nic se neděje, vůbec nic!
	ShitWhatAMonster			=	"SVM_13_ShitWhatAMonster"				;//Nemám tu správnou zbraň. Ještě se uvidíme...
	Help						=	"SVM_13_Help"							;//Uuuuaaaaahh! Zmiz!
	WeWillMeetAgain				=	"SVM_13_WeWillMeetAgain"				;//Ještě se uvidíme!
	NeverTryThatAgain			=	"SVM_13_NeverTryThatAgain"				;//Příště tě zabiju!
	ITakeYourWeapon				=	"SVM_13_ITakeYourWeapon"				;//Pěkná zbraň! Tvoje? Ne? Dobrá!
	ITookYourOre				=	"SVM_13_ITookYourOre"					;//Doufám, že se na mě nenaštveš, když si vezmu trochu rudy.
	ShitNoOre					=	"SVM_13_ShitNoOre"						;//Ty už nemáš ani kousek rudy!
	HandsOff					=	"SVM_13_HandsOff"						;//Ty kryso! Ruce pryč, nebo tě zabiju!
	GetOutOfHere				=	"SVM_13_GetOutOfHere"					;//Padej odsud! Kliď se odsuď!
	YouViolatedForbiddenTerritory=	"SVM_13_YouViolatedForbiddenTerritory"	;//Co tady pohledáváš?
	YouWannaFoolMe				=	"SVM_13_YouWannaFoolMe"					;//Ty se mě snad snažíš přechytračit?
	WhatsThisSupposedToBe		=	"SVM_13_WhatsThisSupposedToBe"			;//Hej, ty! Co tady pohledáváš?
	WhyAreYouInHere				=	"SVM_13_WhyYouAreInHere"				;//Co tady děláš? Upaluj nebo zavolám stráže!
	WhatDidYouInThere			=	"SVM_13_WhatDidYouInThere"				;//Tady nemáš co dělat!
	WiseMove					=	"SVM_13_WiseMove"						;//Máš štěstí! Nejradši bych ti dal jednu po tlamě!
	Alarm						=	"SVM_13_Alarm"							;//Stráže! Sem!
	IntruderAlert				= 	"SVM_13_IntruderAlert"					;//POZOR!!
	BehindYou					=	"SVM_13_BehindYou"						;//Za tebou!
	TheresAFight				=	"SVM_13_TheresAFight"					;//Uvidíme, kdo bude žrát hlínu první.
	HeyHeyHey					=	"SVM_13_HeyHeyHey"						;//Výborně! Ještě!
	CheerFight					=	"SVM_13_CheerFight"						;//Chci vidět krev!
	CheerFriend					=	"SVM_13_CheerFriend"					;//Ukaž mu!
	Ooh							=	"SVM_13_Ooh"							;//Stáhni se, idiote!
	YeahWellDone				=	"SVM_13_YeahWellDone"					;//Uuaahh!!!
	RunCoward					=	"SVM_13_RunCoward"						;//Uahh, upaluj pryč!
	HeDefeatedHim				=	"SVM_13_HeDefeatedHim"					;//Trapné vystoupení! Slabounký závan větru a uletěl jako věchet slámy!
	HeDeservedIt				=	"SVM_13_HeDeservedIt"					;//Uh! Nandej mu to!
	HeKilledHim					=	"SVM_13_HeKilledHim"					;//To je sebevražda, zabít někoho před svědky!
	ItWasAGoodFight				=	"SVM_13_ItWasAGoodFight"				;//Pěkný boj!
	Awake						=	"SVM_13_Awake"							;//Uuahh
	FriendlyGreetings			=	"SVM_13_FriendlyGreetings"				;//Jsi v pořádku?
	ALGreetings					=	"SVM_13_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_13_MageGreetings"					;//Za slávu magie!
	SectGreetings				=	"SVM_13_SectGreetings"					;//Vzbuď se!
	ThereHeIs					= 	"SVM_13_ThereHeIs"						;//Jsi slepý? Támhle!
	NoLearnNoPoints				= 	"SVM_13_NoLearnNoPoints"				;//Nemůžu tě nic naučit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_13_NoLearnOverMax"					;//Jsi u konce svých možností. Měl by ses učit něco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_13_NoLearnYouAlreadyKnow"			;//Aby ses mohl stát vůdcem, musíš na sobě ještě pracovat!
	NoLearnYoureBetter			=	"SVM_13_NoLearnYoureBetter"				;//Už je to s tebou lepší!
	HeyYou						=	"SVM_13_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_13_NotNow"							;//Teď ne!
	WhatDoYouWant				=	"SVM_13_WhatDoYouWant"					;//Chceš ode mě něco?
	ISaidWhatDoYouWant			=	"SVM_13_ISaidWhatDoYouWant"				;//Můžu pro tebe něco udělat?
	MakeWay						=	"SVM_13_MakeWay"						;//Nech mě jít!
	OutOfMyWay					=	"SVM_13_OutOfMyWay"						;//Uhni mi z cesty, člověče!
	YouDeafOrWhat				=	"SVM_13_YouDeafOrWhat"					;//Hledáš problémy? Uhni!
	LookingForTroubleAgain		=	"SVM_13_LookingForTroubleAgain"			;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_13_LookAway"						;//NIC jsem neviděl!
	OkayKeepIt					=	"SVM_13_OkayKeepIt"						;//Dobrá. Je tvoje.
	WhatsThat					=	"SVM_13_WhatsThat"						;//Co to bylo?
	ThatsMyWeapon				=	"SVM_13_ThatsMyWeapon"					;//Vrať mi moji zbraň!
	GiveItToMe					=	"SVM_13_GiveItToMe"						;//Dej mi ji!
	YouCanKeeptheCrap			=	"SVM_13_YouCanKeeptheCrap"				;//Dobrá! Nech si ji! Najdu jiné řešení!
	TheyKilledMyFriend			=	"SVM_13_TheyKilledMyFriend"				;//Jeden z nás je mrtev. To si zasluhuje odplatu!
	YouDisturbedMySlumber		=	"SVM_13_YouDisturbedMySlumber"			;//Proč jsi mě vzbudil?
	SuckerGotSome				=	"SVM_13_SuckerGotSome"					;//Dostal jsi nakládačku, o kterou sis koledoval!
	SuckerDefeatedEBr			=	"SVM_13_SuckerDefeatedEBr"				;//Porazil jsi Rudobarona! Bude na tebe pořádně naštvaný!
	SuckerDefeatedGur			=	"SVM_13_SuckerDefeatedGur"				;//Porazil jsi jednoho z Guru. Vypadá to, že přitahuješ problémy jako magnet!
	SuckerDefeatedMage			=	"SVM_13_SuckerDefeatedMage"				;//Zvítězit nad mágem je opravdu šílený nápad, člověče!
	SuckerDefeatedNov_Guard		= 	"SVM_13_SuckerDefeatedNov_Guard"		;//Tak ty jsi ten, kdo mlátí novice!
	SuckerDefeatedVlk_Guard		= 	"SVM_13_SuckerDefeatedVlk_Guard"		;//Nech mé hochy na pokoji!
	YouDefeatedMyComrade		=	"SVM_13_YouDefeatedMyComrade"			;//Motat se kolem mých přátel není rozumné!
	YouDefeatedNOV_Guard		=	"SVM_13_YouDefeatedNOV_Guard"			;//Nebudeš tu dělat problémy!
	YouDefeatedVLK_Guard		=	"SVM_13_YouDefeatedVLK_Guard"			;//Jestli vztáhneš ruku na někoho, kdo je pod mojí ochranou, tak si to schytáš!
	YouStoleFromMe				=	"SVM_13_YouStoleFromMe"					;//Seš mi ukradenej, ty zmetku! Už to znovu nezkoušej!
	YouStoleFromUs				=	"SVM_13_YouStoleFromUs"					;//Chceme naše věci zpátky! Vrať nám je!
	YouStoleFromEBr				=	"SVM_13_YouStoleFromEBr"				;//Kradl jsi u Rudobaronů? Probůh, proč?
	YouStoleFromGur				=	"SVM_13_YouStoleFromGur"				;//Okradl jsi Guru? Jaká škoda, že tě nachytali!
	StoleFromMage				=	"SVM_13_StoleFromMage"					;//Kradl jsi u mágů! Jak stupidní nápad!
	YouKilledMyFriend			=	"SVM_13_YouKilledMyFriend"				;//Jeden z našich lidí zemřel a ty s tím máš co do činění! Stačí malá chybička a půjdeš za ním!
	YouKilledEBr				=	"SVM_13_YouKilledEBr"					;//Zabil jsi jednoho z Rudobaronů! Člověče, úplně ses pominul?
	YouKilledGur				=	"SVM_13_YouKilledGur"					;//Zabil jsi jednoho z Guru! Tomu, hochu, nemůžu uvěřit!
	YouKilledMage				=	"SVM_13_YouKilledMage"					;//Zabil jsi jednoho z mágů! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_13_YouKilledOCfolk"				;//Jeden z členů Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_13_YouKilledNCfolk"				;//Nový tábor utrpěl těžkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_13_YouKilledPSIfolk"				;//Bratrstvo ztratilo jednoho ze svých věřících a ty ho máš na svědomí!
	GetThingsRight				=	"SVM_13_GetThingsRight"					;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_13_YouDefeatedMeWell"				;//Pořádně jsi mi to nandal, člověče. Byl to dobrý boj! Ale teď už je konec!
	Smalltalk01					=	"SVM_13_Smalltalk01"					;// ...když myslíš...
	Smalltalk02					=	"SVM_13_Smalltalk02"					;// ...možná...
	Smalltalk03					=	"SVM_13_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_13_Smalltalk04"					;// ...udělám nejlíp, když se budu držet dál...
	Smalltalk05					=	"SVM_13_Smalltalk05"					;// ...tohle opravdu není můj problém...
	Smalltalk06					=	"SVM_13_Smalltalk06"					;// ...bylo jasné, že z toho bude mrzutost...
	Smalltalk07					=	"SVM_13_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vědět...
	Smalltalk08					=	"SVM_13_Smalltalk08"					;// ...už se to znovu nestane...
	Smalltalk09					=	"SVM_13_Smalltalk09"					;// ...a přesto na tom musí něco být...
	Smalltalk10					=	"SVM_13_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem říkáš...
	Smalltalk11					=	"SVM_13_Smalltalk11"					;// ...jestli se mě to netýká...
	Smalltalk12					=	"SVM_13_Smalltalk12"					;// ...neměl bys všemu věřit...
	Smalltalk13					=	"SVM_13_Smalltalk13"					;// ...přesto bych nechtěl být v jeho kůži...
	Smalltalk14					=	"SVM_13_Smalltalk14"					;// ...pořád ta samá pohádka...
	Smalltalk15					=	"SVM_13_Smalltalk15"					;// ...někteří lidé se nikdy nepoučí...
	Smalltalk16					=	"SVM_13_Smalltalk16"					;// ...dříve bývalo všechno docela jinak...
	Smalltalk17					=	"SVM_13_Smalltalk17"					;// ...lidé říkají...
	Smalltalk18					=	"SVM_13_Smalltalk18"					;// ...takové řeči já nikdy neposlouchám...
	Smalltalk19					=	"SVM_13_Smalltalk19"					;// ...na někoho se spoléháš a dostaneš se do problémů, tak to chodí...
	Smalltalk20					=	"SVM_13_Smalltalk20"					;// ...pochybuji, že by se to mohlo změnit...
	Smalltalk21					=	"SVM_13_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_13_Smalltalk22"					;// ...vydrž. Lepší je do ničeho se nepouštět...
	Smalltalk23					=	"SVM_13_Smalltalk23"					;// ...myslel jsem, že už je to dávno za námi...
	Smalltalk24					=	"SVM_13_Smalltalk24"					;// ...pojďme raději mluvit o něčem jiném...
	Om							= 	"SVM_13_Om"							;//Hmmm
};



//////////////////////////////////////////
instance SVM_14	(C_SVM)				// Xardas(DMB),Corristo,Erzähler	alt	arrogant, gebildet
{
	StopMagic					=	"SVM_14_StopMagic"						;//Přestaň už s těmi kouzly!
	ISaidStopMagic				=	"SVM_14_ISaidStopMagic"					;//Slyšel jsi mě! Přestaň s těmi kouzly!
	WeaponDown					=	"SVM_14_WeaponDown"						;//Co chceš s tou zbraní udělat, člověče!
	ISaidWeaponDown				=	"SVM_14_ISaidWeaponDown"				;//Dej tu zbraň pryč!
	WatchYourAim				=	"SVM_14_WatchYourAim"					;//Míříš na mě!
	WatchYourAimAngry			=	"SVM_14_WatchYourAimAngry"				;//Tak přestaneš na mě mířit?
	WhatAreYouDoing				=	"SVM_14_WhatAreYouDoing"				;//Tak dávej pozor!
	LetsForgetOurLittleFight	=	"SVM_14_LetsForgetOurLittleFight"		;//Zapomeňme na tuhle malou neshodu názorů!
	Strange						=	"SVM_14_Strange"						;//Dobrý trik, najednou zmizel!
	DieMonster					=	"SVM_14_DieMonster"						;//Otravná stvůra.
	DieMortalEnemy				=	"SVM_14_DieMortalEnemy"					;//Musím tě zabít... Nic osobního, chápeš!
	NowWait						=	"SVM_14_NowWait"						;//Pro dnešek dost!
	YouStillNotHaveEnough		=	"SVM_14_YouStillNotHaveEnough"			;//Už nechceš mít znova problémy, viď?
	YouAskedForIt				=	"SVM_14_YouAskedForIt"					;//Takhle jsi to chtěl!
	NowWaitIntruder				= 	"SVM_14_NowWaitIntruder"				;//Nebyl jsi pozvaný!
	IWillTeachYouRespectForForeignProperty	=	"SVM_14_IWillTeachYouRespectForForeignProperty"	;//Do mých věcí ti nic není!
	DirtyThief					=	"SVM_14_DirtyThief"						;//Něco sis ode mě vypůjčil! Teď mi to budeš muset zaplatit!
	YouAttackedMyCharge			=	"SVM_14_YouAttackedMyCharge"			;//Musíš se naučit dodržovat pravidla!
	YouKilledOneOfUs			=	"SVM_14_YouKilledOneOfUs"				;//Někoho jsi zabil!
	Dead						=	"SVM_14_Dead"							;//Aaargl
	Aargh_1						=	"SVM_14_Aargh_1"						;//Aargh
	Aargh_2						=	"SVM_14_Aargh_2"						;//Aargh
	Aargh_3						=	"SVM_14_Aargh_3"						;//Aargh
	Berzerk						=	"SVM_14_Berzerk"						;//UUAAARRGGGHHH!!!
	YoullBeSorryForThis			=	"SVM_14_YoullBeSorryForThis"			;//Toho budeš litovat!
	YesYes						=	"SVM_14_YesYes"							;//Dobře, dobře!
	ShitWhatAMonster			=	"SVM_14_ShitWhatAMonster"				;//Tuhle výzvu teď nechci přijmout!
	Help						=	"SVM_14_Help"							;//Potřebuji se vrátit k svým studiím!
	WeWillMeetAgain				=	"SVM_14_WeWillMeetAgain"				;//Určitě se ještě uvidíme!
	NeverTryThatAgain			=	"SVM_14_NeverTryThatAgain"				;//Raději už to znova nedělej!
	ITakeYourWeapon				=	"SVM_14_ITakeYourWeapon"				;//Vezmu si tu zbraň!
	ITookYourOre				=	"SVM_14_ITookYourOre"					;//Ta ruda je jistě znamenitá!
	ShitNoOre					=	"SVM_14_ShitNoOre"						;//Nemáš žádnou rudu!
	HandsOff					=	"SVM_14_HandsOff"						;//Ruce pryč!
	GetOutOfHere				=	"SVM_14_GetOutOfHere"					;//Vypadni odsud!
	YouViolatedForbiddenTerritory=	"SVM_14_YouViolatedForbiddenTerritory"	;//Jak jsi se sem dostal?
	YouWannaFoolMe				=	"SVM_14_YouWannaFoolMe"					;//Ty si snad děláš legraci!
	WhatsThisSupposedToBe		=	"SVM_14_WhatsThisSupposedToBe"			;//Po čem tady slídíš?
	WhyAreYouInHere				=	"SVM_14_WhyYouAreInHere"				;//Vypadni nebo zavolám stráže!
	WhatDidYouInThere			=	"SVM_14_WhatDidYouInThere"				;//Tady nemáš co dělat! Rozumíš?
	WiseMove					=	"SVM_14_WiseMove"						;//Chytré rozhodnutí!
	Alarm						=	"SVM_14_Alarm"							;//Stráže, sem!
	IntruderAlert				= 	"SVM_14_IntruderAlert"					;//VETŘELEC!!!
	BehindYou					=	"SVM_14_BehindYou"						;//Za tebou!
	TheresAFight				=	"SVM_14_TheresAFight"					;//Do boje!
	HeyHeyHey					=	"SVM_14_HeyHeyHey"						;//Hmmm.
	CheerFight					=	"SVM_14_CheerFight"						;//Jak neschopný!
	CheerFriend					=	"SVM_14_CheerFriend"					;//Vypadá snaživě!
	Ooh							=	"SVM_14_Ooh"							;//To bylo trapné!
	YeahWellDone				=	"SVM_14_YeahWellDone"					;//To je jediný způsob, jako to udělat....
	RunCoward					=	"SVM_14_RunCoward"						;//Něco se naučil!
	HeDefeatedHim				=	"SVM_14_HeDefeatedHim"					;//To bylo až potom!
	HeDeservedIt				=	"SVM_14_HeDeservedIt"					;//Dobře mu tak!
	HeKilledHim					=	"SVM_14_HeKilledHim"					;//Nebylo nutné ho zabíjet, budeš mít z toho velkou nepříjemnost!
	ItWasAGoodFight				=	"SVM_14_ItWasAGoodFight"				;//Takovéhle šarvátky mě nudí!
	Awake						=	"SVM_14_Awake"							;//Zaspal jsem?
	FriendlyGreetings			=	"SVM_14_FriendlyGreetings"				;//Nazdar.
	ALGreetings					=	"SVM_14_ALGreetings"					;//Za Gomeze!
	MageGreetings				=	"SVM_14_MageGreetings"					;//Za slávu magie!
	SectGreetings				=	"SVM_14_SectGreetings"					;//Vzbuď se!
	ThereHeIs					= 	"SVM_14_ThereHeIs"						;//Tamhle je.
	NoLearnNoPoints				= 	"SVM_14_NoLearnNoPoints"				;//Nemůžu tě nic naučit. Nemáš dost zkušeností.
	NoLearnOverMax				= 	"SVM_14_NoLearnOverMax"					;//Jsi u konce svých možností. Měl by ses učit něco jiného.
	NoLearnYouAlreadyKnow		=	"SVM_14_NoLearnYouAlreadyKnow"			;//Aby ses mohl stát vůdcem, musíš na sobě ještě pracovat!
	NoLearnYoureBetter			=	"SVM_14_NoLearnYoureBetter"				;//Už je to s tebou lepší!
	HeyYou						=	"SVM_14_HeyYou"							;//Hej, ty!
	NotNow						=	"SVM_14_NotNow"							;//Teď ne!
	WhatDoYouWant				=	"SVM_14_WhatDoYouWant"					;//Co pro tebe můžu udělat?
	ISaidWhatDoYouWant			=	"SVM_14_ISaidWhatDoYouWant"				;//Můžu ti pomoci?
	MakeWay						=	"SVM_14_MakeWay"						;//Ustup stranou!
	OutOfMyWay					=	"SVM_14_OutOfMyWay"						;//Nech mě jít!
	YouDeafOrWhat				=	"SVM_14_YouDeafOrWhat"					;//Teď se ztrať!
	LookingForTroubleAgain		=	"SVM_14_LookingForTroubleAgain"			;//Chceš mít zas se mnou problémy?
	LookAway					=	"SVM_14_LookAway"						;//Nezajímá mě, co máš za lubem!
	OkayKeepIt					=	"SVM_14_OkayKeepIt"						;//Nech si ji!
	WhatsThat					=	"SVM_14_WhatsThat"						;//Co to bylo?
	ThatsMyWeapon				=	"SVM_14_ThatsMyWeapon"					;//Vrať mi moji zbraň!
	GiveItToMe					=	"SVM_14_GiveItToMe"						;//Vrať mi ji!
	YouCanKeeptheCrap			=	"SVM_14_YouCanKeeptheCrap"				;//Dobře. Už ji nechci!
	TheyKilledMyFriend			=	"SVM_14_TheyKilledMyFriend"				;//Dostali jednoho z našich chlapíků. Najdeme viníka...
	YouDisturbedMySlumber		=	"SVM_14_YouDisturbedMySlumber"			;//Rušíš mě při studiích!
	SuckerGotSome				=	"SVM_14_SuckerGotSome"					;//Slyšel jsem, že máš problémy!
	SuckerDefeatedEBr			=	"SVM_14_SuckerDefeatedEBr"				;//Porazil jsi Rudobarona! Nestačil se divit!
	SuckerDefeatedGur			=	"SVM_14_SuckerDefeatedGur"				;//Porazil jsi jednoho z Guru. Skvělé.
	SuckerDefeatedMage			=	"SVM_14_SuckerDefeatedMage"				;//Zvítězit nad mágem...
	SuckerDefeatedNov_Guard		= 	"SVM_14_SuckerDefeatedNov_Guard"		;//Víš, že tihle novicové jsou pod mojí ochranou. A přesto na ně pořád dorážíš!
	SuckerDefeatedVlk_Guard		= 	"SVM_14_SuckerDefeatedVlk_Guard"		;//Jestli se dotkneš kopáčů, jako bys sahal na moje příjmy!
	YouDefeatedMyComrade		=	"SVM_14_YouDefeatedMyComrade"			;//Neměl by ses zaplétat s mými přáteli.
	YouDefeatedNOV_Guard		=	"SVM_14_YouDefeatedNOV_Guard"			;//Ještě jednou se dotkneš některého novice a budeš litovat!
	YouDefeatedVLK_Guard		=	"SVM_14_YouDefeatedVLK_Guard"			;//Jestli se pustíš do některého z mých chráněnců, mohlo by tě to stát hlavu!
	YouStoleFromMe				=	"SVM_14_YouStoleFromMe"					;//Jak se tu opovažuješ objevit, ty zloději?
	YouStoleFromUs				=	"SVM_14_YouStoleFromUs"					;//Máš u sebe něco, co patří nám. Vrať nám to!
	YouStoleFromEBr				=	"SVM_14_YouStoleFromEBr"				;//Člověče, tys kradl u Rudobaronů? Budou vzteky bez sebe!
	YouStoleFromGur				=	"SVM_14_YouStoleFromGur"				;//Okradl jsi Guru o pár věcí, viď?
	StoleFromMage				=	"SVM_14_StoleFromMage"					;//Okradl jsi mágy o pár věcí, viď?
	YouKilledMyFriend			=	"SVM_14_YouKilledMyFriend"				;//Máš na svědomí jednoho z našich mužů. Stačí malá chybička a přijde řada na tebe!
	YouKilledEBr				=	"SVM_14_YouKilledEBr"					;//Zabil jsi jednoho z Rudobaronů! Člověče, úplně ses pominul?
	YouKilledGur				=	"SVM_14_YouKilledGur"					;//Zabil jsi jednoho z Guru! Nemůžu tomu uvěřit!
	YouKilledMage				=	"SVM_14_YouKilledMage"					;//Zabil jsi jednoho z mágů! Jak se to chystáš obhájit?
	YouKilledOCfolk				=	"SVM_14_YouKilledOCfolk"				;//Jeden z členů Starého tábora je mrtev a tvoje jméno je spojeno s jeho smrtí...
	YouKilledNCfolk				=	"SVM_14_YouKilledNCfolk"				;//Nový tábor utrpěl těžkou ztrátu a ty v tom máš prsty!
	YouKilledPSIfolk			=	"SVM_14_YouKilledPSIfolk"				;//Bratrstvo ztratilo jednoho ze svých věřících a ty ho máš na svědomí!
	GetThingsRight				=	"SVM_14_GetThingsRight"					;//To nebude snadné napravit!
	YouDefeatedMeWell			=	"SVM_14_YouDefeatedMeWell"				;//Pořádně jsi mi to nandal, člověče. Byl to dobrý boj! Ale teď už je konec!
	Smalltalk01					=	"SVM_14_Smalltalk01"					;// ...když myslíš...
	Smalltalk02					=	"SVM_14_Smalltalk02"					;// ...možná...
	Smalltalk03					=	"SVM_14_Smalltalk03"					;// ...to nebylo moc chytré...
	Smalltalk04					=	"SVM_14_Smalltalk04"					;// ...udělám nejlíp, když se budu držet dál...
	Smalltalk05					=	"SVM_14_Smalltalk05"					;// ...tohle opravdu není můj problém...
	Smalltalk06					=	"SVM_14_Smalltalk06"					;// ...bylo jasné, že z toho bude mrzutost...
	Smalltalk07					=	"SVM_14_Smalltalk07"					;// ...nech si to ale pro sebe, lidé to nemusí vědět...
	Smalltalk08					=	"SVM_14_Smalltalk08"					;// ...už se to znovu nestane...
	Smalltalk09					=	"SVM_14_Smalltalk09"					;// ...a přesto na tom musí něco být...
	Smalltalk10					=	"SVM_14_Smalltalk10"					;// ...musíš dávat pozor na to, co lidem říkáš...
	Smalltalk11					=	"SVM_14_Smalltalk11"					;// ...jestli se mě to netýká...
	Smalltalk12					=	"SVM_14_Smalltalk12"					;// ...neměl bys všemu věřit...
	Smalltalk13					=	"SVM_14_Smalltalk13"					;// ...přesto bych nechtěl být v jeho kůži...
	Smalltalk14					=	"SVM_14_Smalltalk14"					;// ...pořád ta samá pohádka...
	Smalltalk15					=	"SVM_14_Smalltalk15"					;// ...někteří lidé se nikdy nepoučí...
	Smalltalk16					=	"SVM_14_Smalltalk16"					;// ...dříve bývalo všechno docela jinak...
	Smalltalk17					=	"SVM_14_Smalltalk17"					;// ...lidé říkají...
	Smalltalk18					=	"SVM_14_Smalltalk18"					;// ...takové řeči já nikdy neposlouchám...
	Smalltalk19					=	"SVM_14_Smalltalk19"					;// ...na někoho se spoléháš a dostaneš se do problémů, tak to chodí...
	Smalltalk20					=	"SVM_14_Smalltalk20"					;// ...pochybuji, že by se to mohlo změnit...
	Smalltalk21					=	"SVM_14_Smalltalk21"					;// ...máš asi pravdu...
	Smalltalk22					=	"SVM_14_Smalltalk22"					;// ...vydrž. Lepší je do ničeho se nepouštět...
	Smalltalk23					=	"SVM_14_Smalltalk23"					;// ...myslel jsem, že už je to dávno za námi...
	Smalltalk24					=	"SVM_14_Smalltalk24"					;// ...pojďme raději mluvit o něčem jiném...
	Om							= 	"SVM_14_Om"							;//Hmmm
};


//////////////////////////////////////////
INSTANCE SVM_15	(C_SVM)		//	PLAYER	trocken,ernst
{
	SC_HeyTurnAround		= 	"SVM_15_SC_HeyTurnAround"			;//Hej, ty!
	SC_HeyWaitASecond		= 	"SVM_15_SC_HeyWaitASecond"			;//Počkej!

	SectGreetings			=	"SVM_15_SectGreetings"				;//Vzbuď se!
	ALGreetings				=	"SVM_15_ALGreetings"				;//Za Gomeze!
	MageGreetings			=	"SVM_15_MageGreetings"				;//Zdravím.
	FriendlyGreetings		=	"SVM_15_FriendlyGreetings"			;//Zdar.
	Aargh_1					=	"SVM_15_Aargh_1"					;//Aargh
	Aargh_2					=	"SVM_15_Aargh_2"					;//Aargh
	Aargh_3					=	"SVM_15_Aargh_3"					;//Aargh
	Dead					=	"SVM_15_Dead"						;//Aaargl
	Awake					=	"SVM_15_Awake"						;//(probouzí se)
	DoesntWork				= 	"SVM_15_DoesntWork"					;//Nejde to.
	PickBroke				= 	"SVM_15_PickBroke"					;// Hm, je to rozbité.
	NeedKey					= 	"SVM_15_NeedKey"					;// Potřebuji od toho klíč...
	NoMorePicks				= 	"SVM_15_NoMorePicks"				;// Už žádný další paklíč není...
	InvFull					= 	"SVM_15_InvFull"					;// Nemůžu s tím nic víc udělat.
};

//////////////////////////////////////////
INSTANCE SVM_16	(C_SVM)				// Stimmbeschreibung	:		Babes halt!!!!!
{
	NotNow						=	"SVM_16_NotNow"			;	//Jdi pryč! Se mnou nesmíš mluvit!
	Help						=	"SVM_16_Help"			;	//(výkřiky)
	Aargh_1						=	"SVM_16_Aargh_1"		;	//Aargh
	Aargh_2						=	"SVM_16_Aargh_2"		;	//Aargh
	Aargh_3						=	"SVM_16_Aargh_3"		;	//Aargh
	Dead						=	"SVM_16_Dead"			;	//Aaargl
};

//////////////////////////////////////////
INSTANCE SVM_17	(C_SVM)							//Ork-Stimme (alle SVMs werden auf wenige guturalen, unverständlichen Laute umgeleitet)
												//Die Dialoge mit dem verbannten Ork-Shamanen im Kastell und dem Ork-Sklaven in der Freien Mine laufen auch
												//über Stimme 17, sind aber in halbwegsverständlichem orkisch-deutsch
												//Das hier überall vergebene SVM_17_OrcSound01 wird noch durch 9 weitere Variationen ergänzt

// FIXME: mehr Varianten!?
{
	StopMagic					=	"SVM_17_OrcSound01"			;//KARROK UR SHAK TOS KARRAS DA GACH
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




