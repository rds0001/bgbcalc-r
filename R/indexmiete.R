indexmiete_betrag <- function(ausgangsmiete = NULL, ausgangsindex = NULL,
    neuer_index = NULL, indexnachweis = NULL, wirksame_indexvereinbarung = NULL) {
  miete <- .geld(ausgangsmiete)
  alt <- .geld(ausgangsindex)
  neu <- .geld(neuer_index)
  if (alt$zaehler == 0 || neu$zaehler == 0) .fehler("index", "Positive Indexst\u00e4nde erforderlich.")
  .text(indexnachweis, "indexnachweis")
  .wahrheitswert(wirksame_indexvereinbarung, "wirksame_indexvereinbarung")
  eingaben <- list(ausgangsmiete = ausgangsmiete, ausgangsindex = ausgangsindex,
    neuer_index = neuer_index, indexnachweis = indexnachweis,
    wirksame_indexvereinbarung = wirksame_indexvereinbarung)
  wert <- NULL
  if (wirksame_indexvereinbarung) {
    verhaeltnis <- .dividieren(neu, alt)
    neue_miete <- .multiplizieren(miete, verhaeltnis)
    wert <- list(indexverhaeltnis = .bruchteile(verhaeltnis),
      neue_miete = .bruchteile(neue_miete),
      mietaenderung = .bruchteile(.subtrahieren(neue_miete, miete)))
  }
  ergebnis <- .geld_ergebnis(if (wirksame_indexvereinbarung) .bruch(0) else NULL,
    "BGB_INDEXMIETE_BETRAG", eingaben, list(list(
      operation = "Mietbasis mit neuem Index geteilt durch Ausgangsindex fortschreiben", ergebnis = wert)))
  ergebnis["wert"] <- list(wert)
  ergebnis$hinweise <- list(
    "Nur die zur Indexvereinbarung und zum Ausgangsindex geh\u00f6rende Mietbasis verwenden; keine Doppelz\u00e4hlung fr\u00fcherer Index\u00e4nderungen.",
    "Indexst\u00e4nde m\u00fcssen derselben amtlichen Reihe und Basis entstammen; keine automatische Datenbeschaffung oder Umbasierung.",
    "Indexverh\u00e4ltnis dimensionslos; Mietbetr\u00e4ge in EUR, negative Miet\u00e4nderung bedeutet Senkung.",
    "Keine automatische Cent-Rundung; Erkl\u00e4rung, Jahresfrist, Ausgangsmietgrenze und gesonderte Erh\u00f6hungen bleiben zu pr\u00fcfen.")
  ergebnis
}

indexmiete_aenderungstermin_pruefen <- function(zugang_erklaerung = NULL,
    bisherige_indexmiete_ab = NULL, erklaerung_formell_ordnungsgemaess = NULL) {
  zugang <- .datum(zugang_erklaerung, "zugang_erklaerung")
  bisher <- .datum(bisherige_indexmiete_ab, "bisherige_indexmiete_ab")
  .wahrheitswert(erklaerung_formell_ordnungsgemaess, "erklaerung_formell_ordnungsgemaess")
  if (bisher > zugang) {
    .fehler("bisherige_indexmiete_ab", "Beginn der bisher geltenden Indexmiete darf nicht nach Zugang liegen.")
  }
  eingaben <- list(zugang_erklaerung = zugang_erklaerung,
    bisherige_indexmiete_ab = bisherige_indexmiete_ab,
    erklaerung_formell_ordnungsgemaess = erklaerung_formell_ordnungsgemaess)
  wert <- NULL
  if (erklaerung_formell_ordnungsgemaess) {
    erster <- as.Date(paste0(substr(.iso(zugang), 1, 7), "-01"))
    nach_zugang <- .monatsende(erster, 2, FALSE)
    nach_jahr <- .tage_addieren(.frist(bisherige_indexmiete_ab, 1, "jahre", "tagesbeginn"), 1)
    wert <- list(beginn_nach_zugang = .iso(nach_zugang),
      fruehester_beginn_nach_jahresfrist = .iso(nach_jahr),
      jahresfrist_eingehalten = nach_zugang >= nach_jahr)
  }
  ergebnis <- .ergebnis(wert, "datum_und_wahrheitswert",
    "BGB_INDEXMIETE_AENDERUNGSTERMIN_PRUEFEN", eingaben, list(list(
      operation = "\u00dcbern\u00e4chsten Monatsbeginn mit Ablauf eines unver\u00e4nderten Mietjahres vergleichen",
      ergebnis = wert)), eingaben)
  ergebnis$status <- if (erklaerung_formell_ordnungsgemaess) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list(
    "Feste lokale BGB-Fassung; wirksame Indexvereinbarung und ma\u00dfgeblicher Beginn der bisherigen Indexmiete vorgegeben.")
  ergebnis$hinweise <- list(
    "Teilpr\u00fcfung des \u00c4nderungstermins; jahresfrist_eingehalten muss gesondert ausgewertet werden.",
    "Ein zu fr\u00fcher Monatsbeginn wird nicht automatisch verschoben; die Wirkung einer verfr\u00fchten Erkl\u00e4rung wird nicht entschieden.",
    "Erh\u00f6hungen nach \u00a7\u00a7 559 bis 560 sind bei der Jahresfrist gesondert behandelt und setzen den eingegebenen Indexmietbeginn nicht automatisch neu.",
    "Keine Zahlungsf\u00e4lligkeitsberechnung und keine Feiertagsverschiebung des Mietbeginns.")
  ergebnis
}
