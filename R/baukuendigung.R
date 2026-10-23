bau_sicherheitskuendigung_verguetung <- function(erbrachte_verguetung=NULL, nicht_erbrachte_verguetung=NULL, abrechnungsart=NULL, ersparte_aufwendungen=NULL, anderweitiger_erwerb=NULL, boeswillig_unterlassener_erwerb=NULL, einordnungsnachweis=NULL) {
 erbracht <- .geld(erbrachte_verguetung);offen <- .geld(nicht_erbrachte_verguetung)
 erspart <- .geld(ersparte_aufwendungen);anderweitig <- .geld(anderweitiger_erwerb);unterlassen <- .geld(boeswillig_unterlassener_erwerb)
 .auswahl(abrechnungsart,'abrechnungsart',c('vermutung','konkret'));.text(einordnungsnachweis,'einordnungsnachweis')
 if(abrechnungsart=='vermutung') {
  if(any(vapply(list(erspart,anderweitig,unterlassen),function(x) .vergleichen(x,.bruch(0))!=0,logical(1)))) .fehler('abrechnungsart','Vermutung nicht mit konkreten Abz\u00fcgen vermischen.')
  wert <- .addieren(erbracht,.multiplizieren(offen,.bruch(1,20)))
 } else {
  abzug <- .addieren(.addieren(erspart,anderweitig),unterlassen)
  wert <- .subtrahieren(.addieren(erbracht,offen),abzug)
  if(.vergleichen(wert,.bruch(0))<0) wert <- .bruch(0)
 }
 eingaben <- list(erbrachte_verguetung=erbrachte_verguetung, nicht_erbrachte_verguetung=nicht_erbrachte_verguetung, abrechnungsart=abrechnungsart, ersparte_aufwendungen=ersparte_aufwendungen, anderweitiger_erwerb=anderweitiger_erwerb, boeswillig_unterlassener_erwerb=boeswillig_unterlassener_erwerb, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .geld_ergebnis(wert,"BGB_BAU_SICHERHEITSKUENDIGUNG_VERGUETUNG",eingaben,list(list(operation="Erbrachte Verg\u00fctung plus f\u00fcnf Prozent des nicht erbrachten Anteils oder gesamte Verg\u00fctung abz\u00fcglich qualifizierter Ersparnis und Erwerbsbetr\u00e4ge.")))
 ergebnis$hinweise <- c(ergebnis$hinweise,list("\u00a7650fV: Unternehmerk\u00fcndigung nach erfolgloser angemessener Frist zur Sicherheitsleistung; nicht mit freier Bestellerk\u00fcndigung648 gleichsetzen.650fVI-Ausnahmen und gegebenenfalls Baubetreuerfall vorqualifizieren. Gesetzliche5Prozent sind widerlegliche Vermutung ausschlie\u00dflich f\u00fcr den nicht erbrachten Verg\u00fctungsanteil; konkrete Abz\u00fcge nicht zus\u00e4tzlich zur Vermutung einsetzen. Konkrete Rechnung: Gesamtverg\u00fctung minus kausal zurechenbare Ersparnis, anderweitiger Erwerb und b\u00f6swillig unterlassener Erwerb, mindestens0. Abz\u00fcge \u00fcberschneidungsfrei, Brutto-/Nettobezug konsistent; keine automatisch negative Verg\u00fctungsforderung oder R\u00fcckerstattung aus Abzugs\u00fcberschuss. Bereits geleistete Zahlungen und sonstige Anspr\u00fcche separat."))
 ergebnis
}
