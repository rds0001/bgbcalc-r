arbeitsverhaeltnis_kuendigungstermin <- function(beschaeftigungsbeginn = NULL,
    zugang_kuendigung = NULL, kuendigende_partei = NULL, probezeit_vereinbart = NULL,
    vereinbartes_probezeitende = NULL, gesetzliche_standardregel_anwendbar = NULL,
    fristnachweis = NULL) {
  beginn <- .datum(beschaeftigungsbeginn, "beschaeftigungsbeginn")
  zugang <- .datum(zugang_kuendigung, "zugang_kuendigung")
  if (zugang < beginn) .fehler("zugang_kuendigung", "K\u00fcndigung vor Besch\u00e4ftigungsbeginn au\u00dferhalb dieses Modells.")
  .auswahl(kuendigende_partei, "kuendigende_partei", c("arbeitnehmer", "arbeitgeber"))
  .wahrheitswert(probezeit_vereinbart, "probezeit_vereinbart")
  .wahrheitswert(gesetzliche_standardregel_anwendbar, "gesetzliche_standardregel_anwendbar")
  .text(fristnachweis, "fristnachweis")
  probeende <- NULL
  if (!is.null(vereinbartes_probezeitende) || probezeit_vereinbart) {
    probeende <- .datum(vereinbartes_probezeitende, "vereinbartes_probezeitende")
    if (probeende < beginn) .fehler("vereinbartes_probezeitende", "Probezeitende darf nicht vor Besch\u00e4ftigungsbeginn liegen.")
  }
  eingaben <- list(beschaeftigungsbeginn = beschaeftigungsbeginn,
    zugang_kuendigung = zugang_kuendigung, kuendigende_partei = kuendigende_partei,
    probezeit_vereinbart = probezeit_vereinbart, vereinbartes_probezeitende = vereinbartes_probezeitende,
    gesetzliche_standardregel_anwendbar = gesetzliche_standardregel_anwendbar,
    fristnachweis = fristnachweis)
  wert <- NULL
  if (gesetzliche_standardregel_anwendbar) {
    jahre <- as.integer(substr(zugang_kuendigung, 1, 4)) - as.integer(substr(beschaeftigungsbeginn, 1, 4)) -
      as.integer(substr(zugang_kuendigung, 6, 10) < substr(beschaeftigungsbeginn, 6, 10))
    probe <- FALSE
    if (probezeit_vereinbart && zugang <= probeende)
      probe <- zugang <= .frist(beschaeftigungsbeginn, 6, "monate", "tagesbeginn")
    monate <- sum(jahre >= c(2, 5, 8, 10, 12, 15, 20))
    if (probe) {
      anzahl <- 2; einheit <- "wochen"; bindung <- "jeder_tag"
    } else if (kuendigende_partei == "arbeitgeber" && monate > 0) {
      anzahl <- monate; einheit <- "monate"; bindung <- "monatsende"
    } else {
      anzahl <- 4; einheit <- "wochen"; bindung <- "fuenfzehnter_oder_monatsende"
    }
    ende <- .frist(zugang_kuendigung, anzahl, einheit, "ereignis")
    mindestende <- ende
    ende_iso <- .iso(ende)
    if (bindung == "monatsende" ||
        (bindung == "fuenfzehnter_oder_monatsende" && as.integer(substr(ende_iso, 9, 10)) > 15)) {
      ende <- .datum(paste0(substr(ende_iso, 1, 8),
        sprintf("%02d", .monatstage(as.integer(substr(ende_iso, 1, 4)), as.integer(substr(ende_iso, 6, 7))))), "ende")
    } else if (bindung == "fuenfzehnter_oder_monatsende") {
      ende <- .datum(paste0(substr(ende_iso, 1, 8), "15"), "ende")
    }
    wert <- list(vollendete_beschaeftigungsjahre = jahre, probezeitfrist_anwendbar = probe,
      fristanzahl = anzahl, fristeinheit = einheit, terminbindung = bindung,
      rechnerisches_mindestende = .iso(mindestende), fruehester_beendigungstag = .iso(ende))
  }
  ergebnis <- .ergebnis(wert, "kuendigungsfrist_und_datum", "BGB_ARBEITSVERHAELTNIS_KUENDIGUNGSTERMIN",
    eingaben, list(list(operation = "Probezeitgrenze und Arbeitgeberstaffel bestimmen; Frist ab Zugang und gesetzlichen Beendigungstermin berechnen")), eingaben)
  ergebnis$status <- if (gesetzliche_standardregel_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Besch\u00e4ftigung ab Tagesbeginn; Zugang rechtlich festgestellt. Besch\u00e4ftigungsbeginn bildet anrechenbare Betriebs-/Unternehmenszugeh\u00f6rigkeit ohne gesondert zu verrechnende Unterbrechungen ab.")
  ergebnis$hinweise <- list("Nur gesetzliche Standardfristen\u00a7622 Abs\u00e4tze1\u20133. Tarifvertrag, einzelvertragliche l\u00e4ngere oder wirksam k\u00fcrzere Frist, Sondergesetze, K\u00fcndigungsverbote und Wirksamkeit der Erkl\u00e4rung gesondert pr\u00fcfen.",
    "Probezeitfrist nur bei Zugang innerhalb der vereinbarten Probezeit und h\u00f6chstens sechs Monaten; das Vertragsende darf danach liegen. Keine automatische Verl\u00e4ngerung einer k\u00fcrzer vereinbarten Probezeit.",
    "Beendigungstermine werden nicht wegen Wochenenden oder Feiertagen verschoben. Keine Berechnung eines letzten Versandtags oder einer Zugangsfiktion.")
  ergebnis
}
