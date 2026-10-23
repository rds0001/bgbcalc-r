minderung_betrag <- function(vereinbarter_preis = NULL, mangelfreier_wert = NULL,
    wirklicher_wert = NULL, geleistete_zahlung = NULL, regelbereich = NULL,
    wertzeitpunkt = NULL, mangelzeitanteil_zaehler = NULL, mangelzeitanteil_nenner = NULL,
    wert_und_zeitnachweis = NULL, minderungsrecht = NULL, minderungserklaerung = NULL,
    anzeigeausschluss = NULL) {
  eingaben <- list(vereinbarter_preis = vereinbarter_preis, mangelfreier_wert = mangelfreier_wert,
    wirklicher_wert = wirklicher_wert, geleistete_zahlung = geleistete_zahlung,
    regelbereich = regelbereich, wertzeitpunkt = wertzeitpunkt,
    mangelzeitanteil_zaehler = mangelzeitanteil_zaehler, mangelzeitanteil_nenner = mangelzeitanteil_nenner,
    wert_und_zeitnachweis = wert_und_zeitnachweis, minderungsrecht = minderungsrecht,
    minderungserklaerung = minderungserklaerung, anzeigeausschluss = anzeigeausschluss)
  preis <- .geld(vereinbarter_preis)
  mangelfrei <- .geld(mangelfreier_wert)
  wirklich <- .geld(wirklicher_wert)
  bezahlt <- .geld(geleistete_zahlung)
  if (mangelfrei$zaehler == 0) .fehler("mangelfreier_wert", "Positiver Vergleichswert erforderlich.")
  if (.vergleichen(wirklich, mangelfrei) > 0) {
    .fehler("wirklicher_wert", "Minderung setzt wirklichen Wert h\u00f6chstens gleich Vergleichswert voraus.")
  }
  .auswahl(regelbereich, "regelbereich", c("kauf", "werk", "digital_einmal", "digital_dauer", "reise"))
  .auswahl(wertzeitpunkt, "wertzeitpunkt", c("vertragsschluss", "bereitstellung"))
  erwartet <- if (startsWith(regelbereich, "digital")) "bereitstellung" else "vertragsschluss"
  if (wertzeitpunkt != erwartet) .fehler("wertzeitpunkt", "Bewertungszeitpunkt passt nicht zum gew\u00e4hlten Regelbereich.")
  anteil <- .zeitanteil(mangelzeitanteil_zaehler, mangelzeitanteil_nenner, wert_und_zeitnachweis)
  vergleich <- .vergleichen(anteil, .bruch(1))
  if (vergleich > 0 || (regelbereich %in% c("kauf", "werk", "digital_einmal") && vergleich != 0)) {
    .fehler("mangelzeitanteil", "Anteil 0 bis 1; bei Kauf/Werk/digitaler Einmalbereitstellung genau 1.")
  }
  for (parameter in c("minderungsrecht", "minderungserklaerung", "anzeigeausschluss")) {
    .wahrheitswert(eingaben[[parameter]], parameter)
  }
  if (anzeigeausschluss && regelbereich != "reise") {
    .fehler("anzeigeausschluss", "Dieser Anzeigeausschluss betrifft ausschlie\u00dflich Reise.")
  }
  anwendbar <- minderungsrecht && (if (regelbereich == "reise") !anzeigeausschluss else minderungserklaerung)
  ergebnis <- .geld_ergebnis(if (anwendbar) .bruch(0) else NULL, "BGB_MINDERUNG_BETRAG", eingaben,
    list(list(operation = "Minderungsrecht und bereichsspezifische Voraussetzungen", anwendbar = anwendbar)),
    list(wert_und_zeitnachweis = wert_und_zeitnachweis))
  if (anwendbar) {
    wertquote <- .dividieren(wirklich, mangelfrei)
    minderung <- .multiplizieren(.multiplizieren(preis, .subtrahieren(.bruch(1), wertquote)), anteil)
    verbleibend <- .subtrahieren(preis, minderung)
    erstattung <- .subtrahieren(bezahlt, verbleibend)
    if (erstattung$zaehler < 0) erstattung <- .bruch(0)
    ergebnis$wert <- list(geminderter_preis = .bruchteile(verbleibend),
      minderungsbetrag = .bruchteile(minderung), erstattungsbetrag = .bruchteile(erstattung))
    ergebnis$rechenschritte <- c(ergebnis$rechenschritte, list(list(
      operation = "Relative Wertminderung auf betroffenen Zeitanteil anwenden; gezahlten Mehrbetrag erstatten",
      wertquote = .bruchteile(wertquote), mangelzeitanteil = .bruchteile(anteil))))
  }
  ergebnis
}
