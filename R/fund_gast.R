finderlohn_betrag <- function(sachwert = NULL, tier = NULL, nur_persoenlicher_wert = NULL,
    billiger_finderlohn = NULL, fundort = NULL, bediensteter = NULL,
    anzeigepflicht_verletzt = NULL, fund_verheimlicht = NULL, ablieferungspflicht_verletzt = NULL) {
  eingaben <- list(sachwert = sachwert, tier = tier, nur_persoenlicher_wert = nur_persoenlicher_wert,
    billiger_finderlohn = billiger_finderlohn, fundort = fundort, bediensteter = bediensteter,
    anzeigepflicht_verletzt = anzeigepflicht_verletzt, fund_verheimlicht = fund_verheimlicht,
    ablieferungspflicht_verletzt = ablieferungspflicht_verletzt)
  sachbetrag <- .geld(sachwert)
  for (parameter in c("tier", "nur_persoenlicher_wert", "bediensteter",
                      "anzeigepflicht_verletzt", "fund_verheimlicht", "ablieferungspflicht_verletzt")) {
    .wahrheitswert(eingaben[[parameter]], parameter)
  }
  .auswahl(fundort, "fundort", c("allgemein", "behoerde_oder_verkehrsanstalt"))
  billiger_betrag <- if (nur_persoenlicher_wert) .geld(billiger_finderlohn) else NULL
  if (!nur_persoenlicher_wert && !is.null(billiger_finderlohn)) {
    .fehler("billiger_finderlohn", "Bewertung nur bei ausschlie\u00dflich pers\u00f6nlichem Wert zul\u00e4ssig.")
  }
  oeffentlich <- fundort == "behoerde_oder_verkehrsanstalt"
  ausgeschlossen <- if (oeffentlich) {
    .vergleichen(sachbetrag, .bruch(50)) < 0 || bediensteter || ablieferungspflicht_verletzt
  } else anzeigepflicht_verletzt || fund_verheimlicht
  schritte <- list(list(operation = "Fundortbezogene Ausschl\u00fcsse", ausgeschlossen = ausgeschlossen))
  wert <- NULL
  if (!ausgeschlossen) {
    if (nur_persoenlicher_wert) {
      wert <- billiger_betrag
      schritte <- c(schritte, list(list(operation = "Billige Bemessung als Nutzervorgabe, nicht automatisch ermittelt")))
    } else if (tier) {
      wert <- .multiplizieren(sachbetrag, .bruch(3, 100))
      schritte <- c(schritte, list(list(operation = "Tierwert mal 3/100")))
    } else {
      grundwert <- if (.vergleichen(sachbetrag, .bruch(500)) < 0) sachbetrag else .bruch(500)
      mehrwert <- .subtrahieren(sachbetrag, .bruch(500))
      if (mehrwert$zaehler < 0) mehrwert <- .bruch(0)
      wert <- .addieren(.multiplizieren(grundwert, .bruch(5, 100)),
                       .multiplizieren(mehrwert, .bruch(3, 100)))
      schritte <- c(schritte, list(list(operation = "Bis 500 EUR mal 5/100, Mehrwert mal 3/100")))
    }
    if (oeffentlich) {
      wert <- .multiplizieren(wert, .bruch(1, 2))
      schritte <- c(schritte, list(list(operation = "\u00d6ffentlicher Fund: Betrag halbieren")))
    }
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_FINDERLOHN_BETRAG", eingaben, schritte,
    if (nur_persoenlicher_wert) list(billiger_finderlohn = billiger_finderlohn) else list())
  ergebnis$hinweise <- c(ergebnis$hinweise,
    list("Betragsberechnung entscheidet nicht Durchsetzbarkeit nach \u00a7 1001 oder Erl\u00f6schen nach \u00a7 978 Abs. 3."))
  ergebnis
}

gastwirt_haftungsbetrag <- function(beherbergungspreis_tag = NULL, schaden = NULL,
    beherbergung_gewerblich = NULL, eingebracht_nach_701 = NULL,
    sachenart = NULL, ursache = NULL, verschulden_gastwirt_oder_leute = NULL,
    aufbewahrung_uebernommen = NULL, aufbewahrung_pflichtwidrig_abgelehnt = NULL,
    anzeige_unverzueglich = NULL) {
  eingaben <- list(beherbergungspreis_tag = beherbergungspreis_tag, schaden = schaden,
    beherbergung_gewerblich = beherbergung_gewerblich, eingebracht_nach_701 = eingebracht_nach_701,
    sachenart = sachenart, ursache = ursache, verschulden_gastwirt_oder_leute = verschulden_gastwirt_oder_leute,
    aufbewahrung_uebernommen = aufbewahrung_uebernommen,
    aufbewahrung_pflichtwidrig_abgelehnt = aufbewahrung_pflichtwidrig_abgelehnt,
    anzeige_unverzueglich = anzeige_unverzueglich)
  preis <- .geld(beherbergungspreis_tag)
  schadensbetrag <- .geld(schaden)
  for (parameter in c("beherbergung_gewerblich", "eingebracht_nach_701",
                      "verschulden_gastwirt_oder_leute", "aufbewahrung_uebernommen",
                      "aufbewahrung_pflichtwidrig_abgelehnt", "anzeige_unverzueglich")) {
    .wahrheitswert(eingaben[[parameter]], parameter)
  }
  .auswahl(sachenart, "sachenart", c("sonstige", "geld_wertpapiere_kostbarkeiten",
                                     "fahrzeug", "fahrzeuginhalt", "lebendes_tier"))
  .auswahl(ursache, "ursache", c("sonstige", "gast", "begleiter", "aufgenommene_person",
                                 "sachbeschaffenheit", "hoehere_gewalt"))
  ausgeschlossen <- !beherbergung_gewerblich || !eingebracht_nach_701 ||
    ursache != "sonstige" || sachenart %in% c("fahrzeug", "fahrzeuginhalt", "lebendes_tier")
  erloschen <- !(anzeige_unverzueglich || aufbewahrung_uebernommen || verschulden_gastwirt_oder_leute)
  schritte <- list(
    list(operation = "Gesetzlichen Anwendungsbereich und Ausschl\u00fcsse pr\u00fcfen", ausgeschlossen = ausgeschlossen),
    list(operation = "Anzeige und Ausnahmen nach \u00a7 703 pr\u00fcfen", erloschen = erloschen))
  wert <- NULL
  if (!ausgeschlossen && !erloschen) {
    unbeschraenkt <- verschulden_gastwirt_oder_leute || aufbewahrung_uebernommen ||
      aufbewahrung_pflichtwidrig_abgelehnt
    if (unbeschraenkt) {
      wert <- schadensbetrag
      schritte <- c(schritte, list(list(operation = "Unbeschr\u00e4nkte Haftung nach \u00a7 702 Abs. 2 bis zum Schaden")))
    } else {
      obergrenze <- .bruch(if (sachenart == "geld_wertpapiere_kostbarkeiten") 800 else 3500)
      if (.vergleichen(preis, .dividieren(obergrenze, .bruch(100))) >= 0) {
        grenze <- obergrenze
      } else {
        grenze <- .multiplizieren(preis, .bruch(100))
        if (.vergleichen(grenze, .bruch(600)) < 0) grenze <- .bruch(600)
        # Hier gilt preis < obergrenze / 100; auch das Minimum 600
        # überschreitet weder die Obergrenze 800 noch 3500.
      }
      wert <- if (.vergleichen(schadensbetrag, grenze) < 0) schadensbetrag else grenze
      schritte <- c(schritte, list(list(
        operation = "100 Tagespreise, mindestens 600, h\u00f6chstens 3500/800; Schaden deckeln",
        haftungsgrenze = list(zaehler = sprintf("%.0f", grenze$zaehler),
                             nenner = sprintf("%.0f", grenze$nenner)))))
    }
  }
  .geld_ergebnis(wert, "BGB_GASTWIRT_HAFTUNGSBETRAG", eingaben, schritte)
}
