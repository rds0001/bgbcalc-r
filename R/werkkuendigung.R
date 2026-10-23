werk_bestellerkuendigung_verguetung <- function(erbrachte_verguetung = NULL,
    nicht_erbrachte_verguetung = NULL, abrechnungsart = NULL,
    ersparte_aufwendungen = NULL, anderweitiger_erwerb = NULL,
    boeswillig_unterlassener_erwerb = NULL, bestellerkuendigung_wirksam = NULL,
    werk_vollendet = NULL, bautraegervertrag = NULL) {
  eingaben <- list(erbrachte_verguetung = erbrachte_verguetung,
    nicht_erbrachte_verguetung = nicht_erbrachte_verguetung,
    abrechnungsart = abrechnungsart, ersparte_aufwendungen = ersparte_aufwendungen,
    anderweitiger_erwerb = anderweitiger_erwerb,
    boeswillig_unterlassener_erwerb = boeswillig_unterlassener_erwerb,
    bestellerkuendigung_wirksam = bestellerkuendigung_wirksam,
    werk_vollendet = werk_vollendet, bautraegervertrag = bautraegervertrag)
  erbracht <- .geld(erbrachte_verguetung)
  offen <- .geld(nicht_erbrachte_verguetung)
  erspart <- .geld(ersparte_aufwendungen)
  anderweitig <- .geld(anderweitiger_erwerb)
  unterlassen <- .geld(boeswillig_unterlassener_erwerb)
  .auswahl(abrechnungsart, "abrechnungsart", c("vermutung", "konkret"))
  for (parameter in c("bestellerkuendigung_wirksam", "werk_vollendet", "bautraegervertrag")) {
    .wahrheitswert(eingaben[[parameter]], parameter)
  }
  if (abrechnungsart == "vermutung" &&
      any(c(erspart$zaehler, anderweitig$zaehler, unterlassen$zaehler) != 0)) {
    .fehler("abrechnungsart", "Vermutung und konkrete Abz\u00fcge nicht vermischen.")
  }
  anwendbar <- bestellerkuendigung_wirksam && !werk_vollendet && !bautraegervertrag
  schritte <- list(list(operation = "Freie Bestellerk\u00fcndigung vor Vollendung, kein Bautr\u00e4gervertrag",
    anwendbar = anwendbar))
  wert <- NULL
  if (anwendbar) {
    if (abrechnungsart == "vermutung") {
      restverguetung <- .multiplizieren(offen, .bruch(1, 20))
      wert <- .addieren(erbracht, restverguetung)
      schritte <- c(schritte, list(list(
        operation = "Erbrachte Verg\u00fctung plus f\u00fcnf Prozent nicht erbrachter Verg\u00fctung",
        vermutete_restverguetung = .bruchteile(restverguetung))))
    } else {
      gesamt <- .addieren(erbracht, offen)
      abzug <- .addieren(.addieren(erspart, anderweitig), unterlassen)
      wert <- .subtrahieren(gesamt, abzug)
      if (wert$zaehler < 0) wert <- .bruch(0)
      schritte <- c(schritte, list(list(
        operation = "Gesamtverg\u00fctung minus ersparte Aufwendungen und zurechenbarer Erwerb",
        gesamtverguetung = .bruchteile(gesamt), anrechnung = .bruchteile(abzug))))
    }
  }
  .geld_ergebnis(wert, "BGB_WERK_BESTELLERKUENDIGUNG_VERGUETUNG", eingaben, schritte)
}
