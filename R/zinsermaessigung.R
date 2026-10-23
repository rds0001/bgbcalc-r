modernisierung_zinsermaessigung <- function(darlehensursprungsbetrag = NULL,
    ermaessigter_zinssatz_prozent = NULL, marktueblicher_zinssatz_prozent = NULL,
    marktzinssatz_nachweis = NULL, beruecksichtigungsfaehiges_darlehen = NULL,
    vereinfachtes_verfahren = NULL) {
  ursprung <- .geld(darlehensursprungsbetrag)
  ermaessigt <- .zahleneingabe(ermaessigter_zinssatz_prozent)
  markt <- .zahleneingabe(marktueblicher_zinssatz_prozent)
  .text(marktzinssatz_nachweis, "marktzinssatz_nachweis")
  if (.vergleichen(ermaessigt, markt) > 0) {
    .fehler("ermaessigter_zinssatz_prozent",
      "Erm\u00e4\u00dfigungssatz darf den ma\u00dfgeblichen Marktzinssatz nicht \u00fcbersteigen.")
  }
  .wahrheitswert(beruecksichtigungsfaehiges_darlehen, "beruecksichtigungsfaehiges_darlehen")
  .wahrheitswert(vereinfachtes_verfahren, "vereinfachtes_verfahren")
  anwendbar <- beruecksichtigungsfaehiges_darlehen && !vereinfachtes_verfahren
  unterschied <- .subtrahieren(markt, ermaessigt)
  wert <- if (anwendbar) .multiplizieren(.multiplizieren(ursprung, unterschied), .bruch(1, 100)) else NULL
  .geld_ergebnis(wert, "BGB_MODERNISIERUNG_ZINSERMAESSIGUNG",
    list(darlehensursprungsbetrag = darlehensursprungsbetrag,
      ermaessigter_zinssatz_prozent = ermaessigter_zinssatz_prozent,
      marktueblicher_zinssatz_prozent = marktueblicher_zinssatz_prozent,
      marktzinssatz_nachweis = marktzinssatz_nachweis,
      beruecksichtigungsfaehiges_darlehen = beruecksichtigungsfaehiges_darlehen,
      vereinfachtes_verfahren = vereinfachtes_verfahren),
    list(list(operation = "Ber\u00fccksichtigungsf\u00e4higes Darlehen und Ausnahme des vereinfachten Verfahrens",
      anwendbar = anwendbar),
      list(operation = "Urspr\u00fcnglichen Darlehensbetrag mit j\u00e4hrlicher Zinsdifferenz multiplizieren",
        zinsdifferenz_prozentpunkte = .bruchteile(unterschied))))
}
