modernisierung_haerteberuecksichtigung <- function(vereinfachtes_verfahren = NULL,
    qualifizierter_heizungseinbau = NULL, allgemein_ueblicher_zustand = NULL,
    umstaende_nicht_zu_vertreten = NULL, haerteumstaende_rechtzeitig_mitgeteilt = NULL,
    angekuendigter_erhoehungsbetrag = NULL, tatsaechlicher_erhoehungsbetrag = NULL) {
  eingaben <- list(vereinfachtes_verfahren = vereinfachtes_verfahren,
    qualifizierter_heizungseinbau = qualifizierter_heizungseinbau,
    allgemein_ueblicher_zustand = allgemein_ueblicher_zustand,
    umstaende_nicht_zu_vertreten = umstaende_nicht_zu_vertreten,
    haerteumstaende_rechtzeitig_mitgeteilt = haerteumstaende_rechtzeitig_mitgeteilt,
    angekuendigter_erhoehungsbetrag = angekuendigter_erhoehungsbetrag,
    tatsaechlicher_erhoehungsbetrag = tatsaechlicher_erhoehungsbetrag)
  for (name in c("vereinfachtes_verfahren", "qualifizierter_heizungseinbau",
      "allgemein_ueblicher_zustand", "umstaende_nicht_zu_vertreten",
      "haerteumstaende_rechtzeitig_mitgeteilt")) {
    .wahrheitswert(eingaben[[name]], name)
  }
  angekuendigt <- .geld(angekuendigter_erhoehungsbetrag)
  tatsaechlich <- .geld(tatsaechlicher_erhoehungsbetrag)
  ueberschreitung <- .vergleichen(tatsaechlich,
    .multiplizieren(angekuendigt, .bruch(11, 10))) > 0
  vereinfachungsausschluss <- vereinfachtes_verfahren && !qualifizierter_heizungseinbau
  umstandsausschluss <- umstaende_nicht_zu_vertreten && !qualifizierter_heizungseinbau
  abwaegung <- !(vereinfachungsausschluss || allgemein_ueblicher_zustand || umstandsausschluss)
  mitteilung <- haerteumstaende_rechtzeitig_mitgeteilt || ueberschreitung
  wert <- list(abwaegung_vorgesehen = abwaegung,
    umstaende_beruecksichtigungsfaehig = abwaegung && mitteilung,
    zehnprozentgrenze_ueberschritten = ueberschreitung)
  ergebnis <- .ergebnis(wert, "tatbestand", "BGB_MODERNISIERUNG_HAERTEBERUECKSICHTIGUNG",
    eingaben, list(
      list(operation = "Abw\u00e4gungsausschluss durch vereinfachtes Verfahren",
        erfuellt = vereinfachungsausschluss),
      list(operation = "Abw\u00e4gungsausschluss durch nicht zu vertretende Umst\u00e4nde",
        erfuellt = umstandsausschluss),
      list(operation = "Abw\u00e4gungsausschluss durch lediglich allgemein \u00fcblichen Zustand",
        erfuellt = allgemein_ueblicher_zustand),
      list(operation = "Rechtzeitige Mitteilung oder mehr als zehn Prozent \u00dcberschreitung",
        erfuellt = mitteilung)), eingaben)
  ergebnis$annahmen <- list(
    "Feste lokale BGB-Fassung; rechtliche und technische Einordnungen sind ausdr\u00fcckliche Nutzervorgaben.")
  ergebnis$hinweise <- list(
    "Keine Bewertung der H\u00e4rte, k\u00fcnftiger Betriebskosten oder berechtigter Vermieterinteressen.",
    "Ber\u00fccksichtigungsf\u00e4higkeit ist kein Beleg einer tats\u00e4chlich unzumutbaren H\u00e4rte oder eines bestimmten Erh\u00f6hungsbetrags.")
  ergebnis
}
