vereins_minderheitenverlangen <- function(mitgliederzahl = NULL, verlangende_mitglieder = NULL,
    satzungsquote = NULL, verlangen_schriftlich_begruendet = NULL, bestandsnachweis = NULL) {
  anzahl <- .ganzzahl(mitgliederzahl, "mitgliederzahl", 1, 9007199254740991)
  verlangend <- .ganzzahl(verlangende_mitglieder, "verlangende_mitglieder", 0, anzahl)
  quote <- if (is.null(satzungsquote)) .bruch(1, 10) else .zahleneingabe(satzungsquote)
  if (quote$zaehler <= 0 || .vergleichen(quote, .bruch(1)) > 0)
    .fehler("satzungsquote", "Quote gr\u00f6\u00dfer null bis einschlie\u00dflich eins erforderlich.")
  .wahrheitswert(verlangen_schriftlich_begruendet, "verlangen_schriftlich_begruendet")
  .text(bestandsnachweis, "bestandsnachweis")
  minimum <- as.numeric(.runden(.multiplizieren(.bruch(anzahl), quote), 0, "auf"))
  erreicht <- verlangend >= minimum
  wert <- list(massgebliche_quote = .bruchteile(quote), mindestens_verlangende = minimum,
    minderheitenschwelle_erreicht = erreicht,
    verlangen_nach_diesen_voraussetzungen_ausreichend = erreicht && verlangen_schriftlich_begruendet)
  eingaben <- list(mitgliederzahl = mitgliederzahl, verlangende_mitglieder = verlangende_mitglieder,
    satzungsquote = satzungsquote, verlangen_schriftlich_begruendet = verlangen_schriftlich_begruendet,
    bestandsnachweis = bestandsnachweis)
  ergebnis <- .ergebnis(wert, "mitgliederquote_und_wahrheitswerte", "BGB_VEREINS_MINDERHEITENVERLANGEN",
    eingaben, list(list(operation = "Vorgegebene wirksame Satzungsquote oder ein Zehntel auf Mitgliederzahl anwenden und auf ganze Mitglieder aufrunden")), eingaben)
  ergebnis$annahmen <- list("Vollst\u00e4ndiger ma\u00dfgeblicher Mitgliederbestand und Wirksamkeit einer gegebenenfalls abweichenden Satzungsquote rechtlich bestimmt.")
  ergebnis$hinweise <- list("Schriftliches Verlangen muss Zweck und Gr\u00fcnde angeben. Gerichtliche Erm\u00e4chtigung bei Nichtbefolgung nach\u00a737 Absatz2 ist ein gesonderter Schritt; rechnerischer Schwellenwert ersetzt keine Erm\u00e4chtigung.")
  ergebnis
}

vereins_mitgliederschwellen <- function(mitgliederzahl = NULL, satzungsunterzeichner = NULL) {
  mitglieder <- .ganzzahl(mitgliederzahl, "mitgliederzahl", 0, 9007199254740991)
  unterschriften <- .ganzzahl(satzungsunterzeichner, "satzungsunterzeichner", 0, 9007199254740991)
  eingaben <- list(mitgliederzahl = mitgliederzahl, satzungsunterzeichner = satzungsunterzeichner)
  wert <- list(eintragungs_mitgliederzahl_erreicht = mitglieder >= 7,
    satzungsunterschriftenzahl_erreicht = unterschriften >= 7, mitgliederzahl_unter_drei = mitglieder < 3)
  ergebnis <- .ergebnis(wert, "wahrheitswerte", "BGB_VEREINS_MITGLIEDERSCHWELLEN", eingaben,
    list(list(operation = "Mitgliederzahl mit sieben und drei sowie ma\u00dfgebliche Satzungsunterschriften mit sieben vergleichen")), eingaben)
  ergebnis$annahmen <- list("Mitgliederzahl und rechtlich z\u00e4hlende Mitgliedsunterschriften jeweils f\u00fcr ihren ma\u00dfgeblichen Zeitpunkt vorgegeben.")
  ergebnis$hinweise <- list("Nur Zahlengrenzen; kein automatischer Eintragungsanspruch und kein automatischer Verlust der Rechtsf\u00e4higkeit. Satzungserrichtungsdatum, weitere Registervoraussetzungen, Dreimonatsfrist und gerichtliches Verfahren\u00a773 gesondert.")
  ergebnis
}
