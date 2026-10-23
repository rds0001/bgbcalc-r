grossunternehmen_zweijahresschwelle <- function(vertragsjahr = NULL, jahreswerte = NULL, bewertungsnachweis = NULL) {
  jahr <- .ganzzahl(vertragsjahr, "vertragsjahr", 3, 9999)
  .vorhanden(jahreswerte, "jahreswerte")
  if (!is.list(jahreswerte) || !is.null(names(jahreswerte)) || length(jahreswerte) != 2)
    .fehler("jahreswerte", "Genau zwei Jahresobjekte erforderlich.")
  gesehen <- integer()
  auswertung <- list()
  for (werte in jahreswerte) {
    if (!is.list(werte) || length(werte) != 4 || !setequal(names(werte), c("kalenderjahr", "arbeitnehmer_jahresdurchschnitt", "umsatzerloese", "bilanzsumme")))
      .fehler("jahreswerte", "Genau kalenderjahr, arbeitnehmer_jahresdurchschnitt, umsatzerloese und bilanzsumme erforderlich.")
    kalenderjahr <- .ganzzahl(werte$kalenderjahr, "kalenderjahr", 1, 9998)
    if (!(kalenderjahr %in% c(jahr-2, jahr-1)) || kalenderjahr %in% gesehen)
      .fehler("kalenderjahr", "Beide unmittelbar vorhergehenden Kalenderjahre genau einmal angeben.")
    gesehen <- c(gesehen, kalenderjahr)
    personal <- .geld(werte$arbeitnehmer_jahresdurchschnitt)
    umsatz <- .geld(werte$umsatzerloese)
    bilanz <- .geld(werte$bilanzsumme)
    personal_erfuellt <- .vergleichen(personal, .bruch(250)) >= 0
    umsatz_erfuellt <- .vergleichen(umsatz, .bruch(50000000)) > 0
    bilanz_erfuellt <- .vergleichen(bilanz, .bruch(43000000)) > 0
    anzahl <- sum(c(personal_erfuellt, umsatz_erfuellt, bilanz_erfuellt))
    auswertung[[length(auswertung)+1]] <- list(kalenderjahr = kalenderjahr, arbeitnehmerschwelle_erfuellt = personal_erfuellt,
      umsatzschwelle_erfuellt = umsatz_erfuellt, bilanzschwelle_erfuellt = bilanz_erfuellt,
      erfuellte_merkmale = anzahl, mindestens_zwei_merkmale = anzahl >= 2)
  }
  .text(bewertungsnachweis, "bewertungsnachweis")
  auswertung <- auswertung[order(vapply(auswertung, function(z) z$kalenderjahr, numeric(1)))]
  eingaben <- list(vertragsjahr = vertragsjahr, jahreswerte = jahreswerte, bewertungsnachweis = bewertungsnachweis)
  wert <- list(jahrespruefungen = auswertung, in_beiden_jahren_zwei_merkmale = all(vapply(auswertung, function(z) z$mindestens_zwei_merkmale, logical(1))))
  ergebnis <- .ergebnis(wert, "anzahlen_und_wahrheitswerte", "BGB_GROSSUNTERNEHMEN_ZWEIJAHRESSCHWELLE", eingaben,
    list(list(operation = "Je Vorjahr Besch\u00e4ftigte mindestens250, Umsatz strikt \u00fcber50Millionen und Bilanzsumme strikt \u00fcber43Millionen vergleichen; mindestens2 Merkmale in jedem Jahr")), eingaben)
  ergebnis$annahmen <- list("HGB-gem\u00e4\u00df vorqualifizierte Jahreswerte derselben Unternehmenseinheit; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur numerischer Gr\u00f6\u00dfenvergleich des\u00a7310 Absatz1a, keine vollst\u00e4ndige Freistellung von AGB-Kontrolle. Gesch\u00e4ftsart, Unternehmerstellung, rechtm\u00e4\u00dfige gewerbsm\u00e4\u00dfige T\u00e4tigkeit und weitere Tatbest\u00e4nde separat qualifizieren. Umsatz/Bilanz in EUR; Besch\u00e4ftigten-Jahresdurchschnitt nach\u00a7267 Absatz5 HGB und Bilanzsumme nach\u00a7267 Absatz4a HGB vorgeben, nicht beliebige Stichtagswerte. Die beiden erf\u00fcllten Merkmale d\u00fcrfen zwischen den Jahren wechseln; kein Zweijahresmittel und keine Addition beider Jahre. Arbeitnehmergrenze einschlie\u00dflich250; Umsatz und Bilanz strikt gr\u00f6\u00dfer als jeweilige Grenze.")
  ergebnis
}
