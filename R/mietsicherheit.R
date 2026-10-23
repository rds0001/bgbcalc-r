mietsicherheit_hoechstbetrag <- function(monatsmiete = NULL,
    ausgewiesene_betriebskosten = NULL, wohnraummietverhaeltnis = NULL) {
  miete <- .geld(monatsmiete)
  kosten <- .geld(ausgewiesene_betriebskosten)
  .wahrheitswert(wohnraummietverhaeltnis, "wohnraummietverhaeltnis")
  if (.vergleichen(kosten, miete) > 0) {
    .fehler("ausgewiesene_betriebskosten", "Ausgewiesene Betriebskosten d\u00fcrfen die Monatsmiete nicht \u00fcbersteigen.")
  }
  basis <- .subtrahieren(miete, kosten)
  wert <- if (wohnraummietverhaeltnis) .multiplizieren(basis, .bruch(3)) else NULL
  .geld_ergebnis(wert, "BGB_MIETSICHERHEIT_HOECHSTBETRAG",
    list(monatsmiete = monatsmiete, ausgewiesene_betriebskosten = ausgewiesene_betriebskosten,
      wohnraummietverhaeltnis = wohnraummietverhaeltnis),
    list(list(operation = "Wohnraummietverh\u00e4ltnis pr\u00fcfen", anwendbar = wohnraummietverhaeltnis),
      list(operation = "Ausgewiesene Betriebskosten abziehen; verbleibende Monatsmiete verdreifachen",
        massgebliche_monatsmiete = .bruchteile(basis))))
}

mietsicherheit_raten <- function(geschuldete_geldsicherheit = NULL, mietbeginn = NULL,
    zweite_mietfaelligkeit = NULL, dritte_mietfaelligkeit = NULL,
    wohnraummietverhaeltnis = NULL, geldsicherheit_geschuldet = NULL) {
  sicherheit <- .geld(geschuldete_geldsicherheit)
  termine <- list(mietbeginn, zweite_mietfaelligkeit, dritte_mietfaelligkeit)
  namen <- c("mietbeginn", "zweite_mietfaelligkeit", "dritte_mietfaelligkeit")
  daten <- lapply(seq_along(termine), function(i) .datum(termine[[i]], namen[[i]]))
  if (!(daten[[1]] < daten[[2]] && daten[[2]] < daten[[3]])) {
    .fehler("mietfaelligkeiten", "Die drei Teilzahlungstermine m\u00fcssen zeitlich aufeinander folgen.")
  }
  .wahrheitswert(wohnraummietverhaeltnis, "wohnraummietverhaeltnis")
  .wahrheitswert(geldsicherheit_geschuldet, "geldsicherheit_geschuldet")
  anwendbar <- wohnraummietverhaeltnis && geldsicherheit_geschuldet
  ergebnis <- .geld_ergebnis(if (anwendbar) .bruch(0) else NULL, "BGB_MIETSICHERHEIT_RATEN",
    list(geschuldete_geldsicherheit = geschuldete_geldsicherheit, mietbeginn = mietbeginn,
      zweite_mietfaelligkeit = zweite_mietfaelligkeit, dritte_mietfaelligkeit = dritte_mietfaelligkeit,
      wohnraummietverhaeltnis = wohnraummietverhaeltnis, geldsicherheit_geschuldet = geldsicherheit_geschuldet),
    list(list(operation = "Geschuldete Geldsicherheit im Wohnraummietverh\u00e4ltnis", anwendbar = anwendbar),
      list(operation = "Dritteln; Mietbeginn und ausdr\u00fccklich bestimmte Folgemietf\u00e4lligkeiten verwenden")))
  if (anwendbar) {
    rate <- .multiplizieren(sicherheit, .bruch(1, 3))
    ergebnis$wert <- lapply(seq_along(termine), function(i)
      list(nummer = i, faellig_am = termine[[i]], betrag = .bruchteile(rate)))
  }
  ergebnis
}
