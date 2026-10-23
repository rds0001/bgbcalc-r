erbnachlass_ueberschussanteil <- function(nachlasswert=NULL,gemeinsame_verbindlichkeiten=NULL,erforderlicher_rueckbehalt=NULL,erbquote_zaehler=NULL,erbquote_nenner=NULL,einfaches_teilungsmodell_qualifiziert=NULL,bewertungsnachweis=NULL) {
 nachlass <- .geld(nachlasswert); lasten <- .geld(gemeinsame_verbindlichkeiten); reserve <- .geld(erforderlicher_rueckbehalt)
 z <- .ganzzahl(erbquote_zaehler,'erbquote_zaehler',0,.zahlengrenze);n <- .ganzzahl(erbquote_nenner,'erbquote_nenner',1,.zahlengrenze)
 if(z>n) .fehler('erbquote','Erbquote darf eins nicht \u00fcbersteigen.')
 .wahrheitswert(einfaches_teilungsmodell_qualifiziert,'einfaches_teilungsmodell_qualifiziert');.text(bewertungsnachweis,'bewertungsnachweis')
 eingaben <- list(nachlasswert=nachlasswert,gemeinsame_verbindlichkeiten=gemeinsame_verbindlichkeiten,erforderlicher_rueckbehalt=erforderlicher_rueckbehalt,erbquote_zaehler=erbquote_zaehler,erbquote_nenner=erbquote_nenner,einfaches_teilungsmodell_qualifiziert=einfaches_teilungsmodell_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 wert <- NULL
 if(einfaches_teilungsmodell_qualifiziert) {
  rest <- .subtrahieren(.subtrahieren(nachlass,lasten),reserve);ueberschuss <- if(.vergleichen(rest,.bruch(0))<0) .bruch(0) else rest
  wert <- list(nettobetrag_nach_lasten_und_reserve=.bruchteile(rest),verteilbarer_ueberschuss=.bruchteile(ueberschuss),anteil_am_ueberschuss=.bruchteile(.multiplizieren(ueberschuss,.bruch(z,n))))
 }
 ergebnis <- .ergebnis(wert,'EUR','BGB_ERBNACHLASS_UEBERSCHUSSANTEIL',eingaben,list(list(operation='Gemeinsame Lasten und getrennte erforderliche Reserve abziehen; positiven Rest nach Erbquote anteilig berechnen')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Vollst\u00e4ndig qualifizierte und \u00fcberschneidungsfreie gemeinsame Lasten/Reserve; einfaches Teilungsmodell ohne Ausgleichung oder abweichende Teilungsanordnung.")
 ergebnis$hinweise <- list("Nachlasswert vor den eingegebenen Abz\u00fcgen; bereits daraus bezahlte Lasten nicht erneut abziehen. Reserve f\u00fcr noch nicht f\u00e4llige/streitige Verbindlichkeiten rechtlich bewerten und nicht zugleich als gemeinsame Verbindlichkeit erfassen. Nur einigen Erben zur Last fallende Verbindlichkeiten2046II nicht von gemeinsamer Masse abziehen; deren Anteil und Deckung separat. Negativer Nettobetrag ist kein negativer Verteilungsanspruch und keine Insolvenzfeststellung. Keine Auszahlungserlaubnis, kein vollst\u00e4ndiger Teilungsplan, keine Verwertung in Geld oder Verteilung gemeinschaftlicher Schriftst\u00fccke2047II.")
 ergebnis
}
ausgleichung_zuschuss_mehrbetrag <- function(zuwendungswert=NULL,angemessenes_mass=NULL,zuwendung_nach_2050_abs2_qualifiziert=NULL,bewertungsnachweis=NULL) {
 wert_z <- .geld(zuwendungswert);mass <- .geld(angemessenes_mass)
 .wahrheitswert(zuwendung_nach_2050_abs2_qualifiziert,'zuwendung_nach_2050_abs2_qualifiziert');.text(bewertungsnachweis,'bewertungsnachweis')
 eingaben <- list(zuwendungswert=zuwendungswert,angemessenes_mass=angemessenes_mass,zuwendung_nach_2050_abs2_qualifiziert=zuwendung_nach_2050_abs2_qualifiziert,bewertungsnachweis=bewertungsnachweis)
 wert <- NULL
 if(zuwendung_nach_2050_abs2_qualifiziert) {
  rest <- .subtrahieren(wert_z,mass);if(.vergleichen(rest,.bruch(0))<0) rest <- .bruch(0)
  wert <- .bruchteile(rest)
 }
 ergebnis <- .ergebnis(wert,'EUR','BGB_AUSGLEICHUNG_ZUSCHUSS_MEHRBETRAG',eingaben,list(list(operation='Qualifizierter Zuwendungswert minus verm\u00f6gensangemessenes Ma\u00df, mindestens null')),eingaben)
 ergebnis$status <- if(!is.null(wert)) 'BERECHNET' else 'NICHT_ANWENDBAR'
 ergebnis$annahmen <- list("Rechtlich qualifizierter Ausgleichungsfall2050II; Zuwendung und angemessenes Ma\u00df auf vergleichbarer Wertgrundlage.")
 ergebnis$hinweise <- list("Angemessenes Ma\u00df nach damaligen Verm\u00f6gensverh\u00e4ltnissen des Erblassers vorgeben; keine feste gesetzliche Prozentgrenze erfinden. Zusch\u00fcsse zur Verwendung als Eink\u00fcnfte und Berufsvorbildungskosten rechtlich abgrenzen. Ergebnis ist ausgleichungsrelevanter Mehrbetrag vor weiterer Bewertung/Ausgleichungsrechnung2055/2056, kein sofortiger R\u00fcckzahlungsanspruch. Keine automatische Zusammenfassung verschiedener Lebensabschnitte oder Zuwendungen.")
 ergebnis
}
