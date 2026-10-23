reiseuebertragung_siebentagevergleich <- function(reisebeginn_am=NULL, erklaerungszugang_am=NULL, einordnungsnachweis=NULL) {
 beginn <- .datum(reisebeginn_am,'reisebeginn_am')
 zugang <- .datum(erklaerungszugang_am,'erklaerungszugang_am');.text(einordnungsnachweis,'einordnungsnachweis')
 tage <- as.integer(beginn-zugang)
 wert <- list(kalendertage_vorlauf=tage,mindestens_sieben_kalendertage=tage>=7)
 eingaben <- list(reisebeginn_am=reisebeginn_am, erklaerungszugang_am=erklaerungszugang_am, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"tage_und_wahrheitswert","BGB_REISEUEBERTRAGUNG_SIEBENTAGEVERGLEICH",eingaben,list(list(operation="Taggenau qualifizierten Abstand zwischen tats\u00e4chlichem Erkl\u00e4rungszugang und Reisebeginn bestimmen und mit sieben Kalendertagen vergleichen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7651eI2: nur Anzahl der qualifizierten Kalendertage zwischen Zugang und Reisebeginn und Vergleich mit sieben Tagen. Erreichen ist rechnerischer Nachweis der gesetzlichen Siebentage-Sicherheitsgrenze im taggenau qualifizierten Fall. Unterschreiten bedeutet nicht automatisch Unwirksamkeit oder Versp\u00e4tung: angemessene k\u00fcrzere Frist nachSatz1 bleibt rechtlich zu pr\u00fcfen. Dauerhafter Datentr\u00e4ger, tats\u00e4chlicher Zugang und Eignung des Dritten extern. Keine pauschale Umrechnung in168Stunden, keine automatische Feiertagsverschiebung und kein untert\u00e4giges Zugangs-/Reisebeginnurteil.")
 ergebnis
}
reiseuebertragung_mehrkostenbetrag <- function(tatsaechliche_mehrkosten=NULL, angemessener_hoechstbetrag=NULL, einordnungsnachweis=NULL) {
 tatsaechlich <- .geld(tatsaechliche_mehrkosten);angemessen <- .geld(angemessener_hoechstbetrag)
 .text(einordnungsnachweis,'einordnungsnachweis')
 wert <- .bruchteile(if(.vergleichen(tatsaechlich,angemessen)<=0) tatsaechlich else angemessen)
 eingaben <- list(tatsaechliche_mehrkosten=tatsaechliche_mehrkosten, angemessener_hoechstbetrag=angemessener_hoechstbetrag, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_REISEUEBERTRAGUNG_MEHRKOSTENBETRAG",eingaben,list(list(operation="Tats\u00e4chlich entstandene \u00dcbertragungsmehrkosten auf rechtlich angemessenen H\u00f6chstbetrag begrenzen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7651eIII2/IV: nur kleinere Zahl aus tats\u00e4chlichen nachgewiesenen Mehrkosten und rechtlich angemessener Betragsgrenze. Keine Geb\u00fchrentabelle oder automatische Angemessenheitspr\u00fcfung. Reisepreis nicht nochmals als Mehrkosten z\u00e4hlen. Gesamtschuld von Reisendem und Drittem rechtlich vorausgesetzt; Betrag nicht verdoppeln und nicht automatisch nach K\u00f6pfen aufteilen. Andere Zahlungs-/Erf\u00fcllungsvorg\u00e4nge separat.")
 ergebnis
}
