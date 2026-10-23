bau_sicherungsbetrag <- function(offene_verguetung = NULL, aufrechenbare_gegenforderung = NULL,
    gegenforderung_unstreitig = NULL, gegenforderung_rechtskraeftig = NULL,
    bestellerart = NULL, baubetreuer_bevollmaechtigt = NULL) {
  eingaben <- list(offene_verguetung = offene_verguetung,
    aufrechenbare_gegenforderung = aufrechenbare_gegenforderung,
    gegenforderung_unstreitig = gegenforderung_unstreitig,
    gegenforderung_rechtskraeftig = gegenforderung_rechtskraeftig,
    bestellerart = bestellerart, baubetreuer_bevollmaechtigt = baubetreuer_bevollmaechtigt)
  verguetung <- .geld(offene_verguetung)
  gegenforderung <- .geld(aufrechenbare_gegenforderung)
  for (parameter in c("gegenforderung_unstreitig", "gegenforderung_rechtskraeftig", "baubetreuer_bevollmaechtigt")) {
    .wahrheitswert(eingaben[[parameter]], parameter)
  }
  .auswahl(bestellerart, "bestellerart",
    c("sonstiger", "oeffentlich_insolvenzunfaehig", "verbraucherbau", "bautraeger_verbraucher"))
  anwendbar <- bestellerart != "oeffentlich_insolvenzunfaehig" &&
    (bestellerart == "sonstiger" || baubetreuer_bevollmaechtigt)
  abzug <- if (gegenforderung_unstreitig || gegenforderung_rechtskraeftig) gegenforderung else .bruch(0)
  zu_sichern <- .subtrahieren(verguetung, abzug)
  if (zu_sichern$zaehler < 0) zu_sichern <- .bruch(0)
  wert <- if (anwendbar) .multiplizieren(zu_sichern, .bruch(11, 10)) else NULL
  .geld_ergebnis(wert, "BGB_BAU_SICHERUNG", eingaben, list(
    list(operation = "Ausnahmen nach Bestellerart und Baubetreuer", anwendbar = anwendbar),
    list(operation = "Ber\u00fccksichtigungsf\u00e4hige Gegenforderung abziehen",
      abzug = .bruchteile(abzug), zu_sichernde_verguetung = .bruchteile(zu_sichern)),
    list(operation = "Zehn Prozent Nebenforderungen hinzuf\u00fcgen")))
}

verbraucherbau_herstellungssicherheit <- function(urspruengliche_gesamtverguetung = NULL,
    zusaetzliche_verguetung = NULL, bereits_gestellte_sicherheit = NULL, verbraucherbauvertrag = NULL) {
  eingaben <- list(urspruengliche_gesamtverguetung = urspruengliche_gesamtverguetung,
    zusaetzliche_verguetung = zusaetzliche_verguetung, bereits_gestellte_sicherheit = bereits_gestellte_sicherheit,
    verbraucherbauvertrag = verbraucherbauvertrag)
  ursprung <- .geld(urspruengliche_gesamtverguetung)
  zusatz <- .geld(zusaetzliche_verguetung)
  gestellt <- .geld(bereits_gestellte_sicherheit)
  if (ursprung$zaehler == 0) .fehler("urspruengliche_gesamtverguetung", "Positive urspr\u00fcngliche Verg\u00fctung erforderlich.")
  .wahrheitswert(verbraucherbauvertrag, "verbraucherbauvertrag")
  ergebnis <- .geld_ergebnis(if (verbraucherbauvertrag) .bruch(0) else NULL,
    "BGB_VERBRAUCHERBAU_HERSTELLUNGSSICHERHEIT", eingaben,
    list(list(operation = "Verbraucherbauvertrag", anwendbar = verbraucherbauvertrag)))
  if (verbraucherbauvertrag) {
    grund <- .multiplizieren(ursprung, .bruch(1, 20))
    schwelle_ueberschritten <- .vergleichen(zusatz, .multiplizieren(ursprung, .bruch(1, 10))) > 0
    zusaetzlich <- if (schwelle_ueberschritten) .multiplizieren(zusatz, .bruch(1, 20)) else .bruch(0)
    gesamt <- .addieren(grund, zusaetzlich)
    offen <- .subtrahieren(gesamt, gestellt)
    if (offen$zaehler < 0) offen <- .bruch(0)
    ergebnis$wert <- list(grundsicherheit = .bruchteile(grund),
      zusaetzliche_sicherheit = .bruchteile(zusaetzlich), gesamtsicherheit = .bruchteile(gesamt),
      noch_zu_stellen = .bruchteile(offen))
    ergebnis$rechenschritte <- c(ergebnis$rechenschritte, list(list(
      operation = "F\u00fcnf Prozent Grundverg\u00fctung plus gegebenenfalls f\u00fcnf Prozent gesamter Mehrverg\u00fctung",
      zehnprozent_schwelle_ueberschritten = schwelle_ueberschritten)))
  }
  ergebnis
}
