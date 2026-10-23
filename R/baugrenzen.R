verbraucherbau_abschlagsgrenze <- function(gesamtverguetung = NULL,
    bisherige_abschlaege = NULL, verbraucherbauvertrag = NULL,
    bautraegervertrag = NULL, abschlag_nach_632a = NULL) {
  eingaben <- list(gesamtverguetung = gesamtverguetung,
    bisherige_abschlaege = bisherige_abschlaege,
    verbraucherbauvertrag = verbraucherbauvertrag,
    bautraegervertrag = bautraegervertrag, abschlag_nach_632a = abschlag_nach_632a)
  verguetung <- .geld(gesamtverguetung)
  bisher <- .geld(bisherige_abschlaege)
  for (parameter in c("verbraucherbauvertrag", "bautraegervertrag", "abschlag_nach_632a")) {
    .wahrheitswert(eingaben[[parameter]], parameter)
  }
  anwendbar <- verbraucherbauvertrag && !bautraegervertrag && abschlag_nach_632a
  ergebnis <- .geld_ergebnis(if (anwendbar) .bruch(0) else NULL,
    "BGB_VERBRAUCHERBAU_ABSCHLAGSGRENZE", eingaben,
    list(list(operation = "Verbraucherbau, Abschlag nach \u00a7 632a und Bautr\u00e4gerausschluss",
      anwendbar = anwendbar)))
  if (anwendbar) {
    grenze <- .multiplizieren(verguetung, .bruch(9, 10))
    rest <- .subtrahieren(grenze, bisher)
    if (rest$zaehler < 0) rest <- .bruch(0)
    ergebnis$wert <- list(gesamtgrenze = .bruchteile(grenze),
      verbleibender_rahmen = .bruchteile(rest))
    ergebnis$rechenschritte <- c(ergebnis$rechenschritte, list(list(
      operation = "90 Prozent der Gesamtverg\u00fctung; bisherige Abschl\u00e4ge abziehen, mindestens null")))
  }
  ergebnis
}

verbraucherbau_sicherungsgrenze <- function(vereinbarte_verguetung = NULL,
    naechste_abschlagszahlung = NULL, vereinbarte_sicherheit = NULL,
    verbraucherbauvertrag = NULL, abschlaege_verlangt = NULL,
    abschlaege_vereinbart = NULL) {
  eingaben <- list(vereinbarte_verguetung = vereinbarte_verguetung,
    naechste_abschlagszahlung = naechste_abschlagszahlung,
    vereinbarte_sicherheit = vereinbarte_sicherheit,
    verbraucherbauvertrag = verbraucherbauvertrag,
    abschlaege_verlangt = abschlaege_verlangt, abschlaege_vereinbart = abschlaege_vereinbart)
  verguetung <- .geld(vereinbarte_verguetung)
  abschlag <- .geld(naechste_abschlagszahlung)
  sicherheit <- .geld(vereinbarte_sicherheit)
  for (parameter in c("verbraucherbauvertrag", "abschlaege_verlangt", "abschlaege_vereinbart")) {
    .wahrheitswert(eingaben[[parameter]], parameter)
  }
  anwendbar <- verbraucherbauvertrag && (abschlaege_verlangt || abschlaege_vereinbart)
  ergebnis <- .geld_ergebnis(if (anwendbar) .bruch(0) else NULL,
    "BGB_VERBRAUCHERBAU_SICHERUNGSGRENZE", eingaben,
    list(list(operation = "Verbraucherbau und verlangte oder vereinbarte Abschl\u00e4ge",
      anwendbar = anwendbar)))
  if (anwendbar) {
    prozentgrenze <- .multiplizieren(verguetung, .bruch(1, 5))
    grenze <- if (.vergleichen(abschlag, prozentgrenze) <= 0) abschlag else prozentgrenze
    ergebnis$wert <- list(betragsgrenze = .bruchteile(grenze),
      betragsgrenze_ueberschritten = .vergleichen(sicherheit, grenze) > 0)
    ergebnis$rechenschritte <- c(ergebnis$rechenschritte, list(list(
      operation = "Minimum aus n\u00e4chstem Abschlag und 20 Prozent der Verg\u00fctung; strenger Vergleich")))
  }
  ergebnis
}
