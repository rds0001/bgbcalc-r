nachbesserung_fehlgeschlagen <- function(erfolglose_versuche = NULL, abweichende_umstaende = NULL,
    fehlgeschlagen_nach_einzelfall = NULL, regel_440_anwendbar = NULL, einordnungsnachweis = NULL) {
  anzahl <- .ganzzahl(erfolglose_versuche, "erfolglose_versuche", 0, .zahlengrenze)
  eingaben <- list(erfolglose_versuche = erfolglose_versuche, abweichende_umstaende = abweichende_umstaende,
    fehlgeschlagen_nach_einzelfall = fehlgeschlagen_nach_einzelfall,
    regel_440_anwendbar = regel_440_anwendbar, einordnungsnachweis = einordnungsnachweis)
  for (name in names(eingaben)[2:4]) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  wert <- NULL
  if (regel_440_anwendbar) wert <- if (abweichende_umstaende) fehlgeschlagen_nach_einzelfall else anzahl >= 2
  ergebnis <- .ergebnis(wert, "wahrheitswert", "BGB_NACHBESSERUNG_FEHLGESCHLAGEN", eingaben,
    list(list(operation = "Mindestens zwei erfolglose Nachbesserungsversuche; bei abweichenden Umst\u00e4nden belegte Einzelfallbewertung einsetzen")), eingaben)
  ergebnis$status <- if (regel_440_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Dieselbe rechtlich zusammengeh\u00f6rige Nachbesserung; erfolglose Versuche und etwaige abweichende Umst\u00e4nde gepr\u00fcft.")
  ergebnis$hinweise <- list("Keine starre Zweiversuchsregel bei abweichender Art der Sache, des Mangels oder sonstigen Umst\u00e4nden. Nur Nachbesserung, nicht automatisch Ersatzlieferung. \u00a7475d weicht f\u00fcr erfasste Verbrauchsg\u00fcterf\u00e4lle von\u00a7440 ab; regel_440_anwendbar dort FALSE. FALSE beim Ergebnis best\u00e4tigt nicht, dass Fristsetzung aus anderen Gr\u00fcnden erforderlich ist; R\u00fccktritts- und Schadensersatzvoraussetzungen separat.")
  ergebnis
}
