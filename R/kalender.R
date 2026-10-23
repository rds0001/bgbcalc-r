# Native Kalenderberechnung ohne Python oder Netzwerkzugriff.
.quellenfassung <- "BGB_PDF_SHA256_9b5a99536e7b00756e9fa5f20082bd9ad3951b37c381fc0f5d52aa5a556839eb"

.fehler <- function(parameter, meldung, status = "EINGABE_UNGUELTIG") {
  stop(structure(list(message = meldung, call = NULL, status = status,
                      parameter = parameter),
                 class = c("bgb_berechnungsfehler", "error", "condition")))
}

.vorhanden <- function(wert, parameter) {
  if (is.numeric(wert) && length(wert) == 1L && is.nan(wert)) {
    .fehler(parameter, "NaN ist keine g\u00fcltige Eingabe.")
  }
  if (is.null(wert) || (length(wert) == 1L && is.atomic(wert) && is.na(wert))) {
    .fehler(parameter, "Pflichteingabe fehlt.", "EINGABE_FEHLT")
  }
}

.text <- function(wert, parameter) {
  .vorhanden(wert, parameter)
  if (!is.character(wert) || length(wert) != 1L ||
      !nzchar(trimws(wert))) .fehler(parameter, "Nichtleere Zeichenfolge erforderlich.")
  wert
}

.auswahl <- function(wert, parameter, moeglichkeiten) {
  .text(wert, parameter)
  if (!wert %in% moeglichkeiten) .fehler(parameter, "Unzul\u00e4ssige Auswahl.")
  wert
}

.ganzzahl <- function(wert, parameter, minimum = 0, maximum = 3652059) {
  .vorhanden(wert, parameter)
  if (!is.numeric(wert) || is.object(wert) || length(wert) != 1L ||
      !is.finite(wert) || wert != floor(wert) ||
      wert < minimum || wert > maximum) {
    .fehler(parameter, "Ganzzahl au\u00dferhalb des erlaubten Bereichs oder falscher Typ.")
  }
  as.numeric(wert)
}

.iso <- function(datum) {
  sprintf("%04d-%02d-%02d", as.integer(format(datum, "%Y")),
          as.integer(format(datum, "%m")), as.integer(format(datum, "%d")))
}

.datum <- function(wert, parameter) {
  .text(wert, parameter)
  if (!grepl("^[0-9]{4}-[0-9]{2}-[0-9]{2}$", wert) ||
      substr(wert, 1L, 4L) == "0000") {
    .fehler(parameter, "ISO-Datum mit Jahr 0001..9999 erforderlich.")
  }
  datum <- tryCatch(as.Date(wert, format = "%Y-%m-%d"), error = function(e) as.Date(NA))
  if (is.na(datum) || .iso(datum) != wert) .fehler(parameter, "Ung\u00fcltiger Kalendertag.")
  datum
}

.tage_addieren <- function(datum, tage) {
  ergebnis <- datum + tage
  if (ergebnis < as.Date("0001-01-01") || ergebnis > as.Date("9999-12-31")) {
    .fehler("datum", "Ergebnis au\u00dferhalb des Datumsbereichs 0001..9999.")
  }
  ergebnis
}

.monatstage <- function(jahr, monat) {
  if (monat == 2) {
    return(if (jahr %% 4 == 0 && (jahr %% 100 != 0 || jahr %% 400 == 0)) 29 else 28)
  }
  if (monat %in% c(4, 6, 9, 11)) 30 else 31
}

.monatsende <- function(anfang, monate, tagesbeginn) {
  jahr <- as.numeric(format(anfang, "%Y"))
  monat <- as.numeric(format(anfang, "%m"))
  tag <- as.numeric(format(anfang, "%d"))
  zielindex <- (jahr - 1) * 12 + monat - 1 + monate
  zieltag <- tag - as.numeric(tagesbeginn)
  if (zieltag == 0) {
    zielindex <- zielindex - 1
    zieltag <- 31
  }
  zieljahr <- zielindex %/% 12 + 1
  zielmonat <- zielindex %% 12 + 1
  if (zieljahr < 1 || zieljahr > 9999) .fehler("anzahl", "Zielmonat au\u00dferhalb des Datumsbereichs.")
  as.Date(sprintf("%04d-%02d-%02d", as.integer(zieljahr), as.integer(zielmonat),
                  as.integer(min(zieltag, .monatstage(zieljahr, zielmonat)))))
}

.frist <- function(anfangstag, anzahl, einheit, beginnart) {
  anfang <- .datum(anfangstag, "anfangstag")
  anzahl <- .ganzzahl(anzahl, "anzahl", 1)
  .auswahl(beginnart, "beginnart", c("ereignis", "tagesbeginn"))
  .auswahl(einheit, "einheit", c("tage", "wochen", "monate", "jahre",
                                "halbjahre", "vierteljahre", "halber_monat"))
  mitgezaehlt <- beginnart == "tagesbeginn"
  if (einheit == "halber_monat") {
    if (anzahl != 1) .fehler("anzahl", "Ein halber Monat ist eine einzelne 15-Tage-Frist.")
    return(.tage_addieren(anfang, 15 - as.numeric(mitgezaehlt)))
  }
  if (einheit %in% c("tage", "wochen")) {
    faktor <- if (einheit == "wochen") 7 else 1
    return(.tage_addieren(anfang, anzahl * faktor - as.numeric(mitgezaehlt)))
  }
  faktor <- c(monate = 1, jahre = 12, halbjahre = 6, vierteljahre = 3)[[einheit]]
  .monatsende(anfang, anzahl * faktor, mitgezaehlt)
}

.ergebnis <- function(wert, einheit, regel_id, eingaben, schritte,
                      nutzervorgaben = list()) {
  structure(list(
    wert = wert, einheit = einheit, regel_id = regel_id, regelversion = "1",
    quellenfassung = .quellenfassung, eingaben = eingaben,
    nutzervorgaben = nutzervorgaben, rechenschritte = schritte,
    annahmen = list("Feste lokale BGB-Fassung; Anwendbarkeit der Auslegungsvorschrift vorausgesetzt."),
    hinweise = list("Keine automatische Feiertagsverschiebung au\u00dferhalb der ausdr\u00fccklichen \u00a7-193-Funktion."),
    status = "BERECHNET"
  ), class = c("bgb_ergebnis", "list"))
}

fristende <- function(anfangstag = NULL, anzahl = NULL, einheit = NULL, beginnart = NULL) {
  wert <- .iso(.frist(anfangstag, anzahl, einheit, beginnart))
  .ergebnis(wert, "datum", "BGB_FRIST_KALENDER",
    list(anfangstag = anfangstag, anzahl = anzahl, einheit = einheit, beginnart = beginnart),
    list(list(operation = "Kalenderfrist nach \u00a7\u00a7 187\u2013189", ergebnis = wert)))
}

fristende_monate_halb <- function(anfangstag = NULL, ganze_monate = NULL, beginnart = NULL) {
  zwischen <- .frist(anfangstag, ganze_monate, "monate", beginnart)
  wert <- .iso(.tage_addieren(zwischen, 15))
  .ergebnis(wert, "datum", "BGB_FRIST_MONATE_HALB",
    list(anfangstag = anfangstag, ganze_monate = ganze_monate, beginnart = beginnart),
    list(list(operation = "Ganze Monate", ergebnis = .iso(zwischen)),
         list(operation = "Anschlie\u00dfend 15 Tage", ergebnis = wert)))
}

fristverlaengerung <- function(bisheriges_fristende = NULL, anzahl = NULL, einheit = NULL) {
  wert <- .iso(.frist(bisheriges_fristende, anzahl, einheit, "ereignis"))
  .ergebnis(wert, "datum", "BGB_FRIST_VERLAENGERUNG",
    list(bisheriges_fristende = bisheriges_fristende, anzahl = anzahl, einheit = einheit),
    list(list(operation = "Voriger Ablauf als neues Ereignis", ergebnis = wert)))
}

zeitraum_tage <- function(anzahl = NULL, einheit = NULL, nicht_zusammenhaengend = NULL) {
  anzahl <- .ganzzahl(anzahl, "anzahl")
  .auswahl(einheit, "einheit", c("monate", "jahre"))
  .vorhanden(nicht_zusammenhaengend, "nicht_zusammenhaengend")
  if (!identical(nicht_zusammenhaengend, TRUE)) {
    .fehler("nicht_zusammenhaengend", "\u00a7 191 setzt nicht zusammenh\u00e4ngenden Zeitraum voraus.")
  }
  faktor <- if (einheit == "monate") 30 else 365
  wert <- anzahl * faktor
  .ergebnis(wert, "tage", "BGB_ZEITRAUM_UNZUSAMMENHAENGEND",
    list(anzahl = anzahl, einheit = einheit, nicht_zusammenhaengend = nicht_zusammenhaengend),
    list(list(operation = "Anzahl mal gesetzliche Tage je Einheit", faktor = faktor, ergebnis = wert)))
}

monatstermin <- function(jahr = NULL, monat = NULL, lage = NULL) {
  jahr <- .ganzzahl(jahr, "jahr", 1, 9999)
  monat <- .ganzzahl(monat, "monat", 1, 12)
  .auswahl(lage, "lage", c("anfang", "mitte", "ende"))
  tag <- switch(lage, anfang = 1, mitte = 15, ende = .monatstage(jahr, monat))
  wert <- sprintf("%04d-%02d-%02d", as.integer(jahr), as.integer(monat), as.integer(tag))
  .ergebnis(wert, "datum", "BGB_MONATSTERMIN",
    list(jahr = jahr, monat = monat, lage = lage),
    list(list(operation = "Monatstermin nach \u00a7 192", ergebnis = wert)))
}

werktagsverschiebung <- function(datum = NULL, anwendungsfall = NULL, feiertage = NULL,
                                 ort = NULL, kalenderquelle = NULL,
                                 kalender_von = NULL, kalender_bis = NULL) {
  tag <- .datum(datum, "datum")
  .auswahl(anwendungsfall, "anwendungsfall", c("leistung", "willenserklaerung"))
  .text(ort, "ort")
  .text(kalenderquelle, "kalenderquelle")
  von <- .datum(kalender_von, "kalender_von")
  bis <- .datum(kalender_bis, "kalender_bis")
  .vorhanden(feiertage, "feiertage")
  if ((!is.character(feiertage) && !is.list(feiertage)) || !is.null(names(feiertage))) {
    .fehler("feiertage", "Explizite Folge von Feiertagen erforderlich.")
  }
  feiertagsmenge <- vapply(feiertage, function(t) as.numeric(.datum(t, "feiertage")), numeric(1))
  if (tag < von || tag > bis ||
      any(feiertagsmenge < as.numeric(von) | feiertagsmenge > as.numeric(bis))) {
    .fehler("kalender", "Datum/Feiertag au\u00dferhalb des best\u00e4tigten Kalenderbereichs.")
  }
  uebersprungen <- character()
  # 1970-01-01 ist Donnerstag; Montag=0 bis Sonntag=6, auch vor 1970.
  while ((as.numeric(tag) + 3) %% 7 >= 5 || as.numeric(tag) %in% feiertagsmenge) {
    uebersprungen <- c(uebersprungen, .iso(tag))
    tag <- .tage_addieren(tag, 1)
    if (tag > bis) .fehler("kalender_bis", "Feiertagskalender deckt den n\u00e4chsten Pr\u00fcftag nicht ab.")
  }
  wert <- .iso(tag)
  .ergebnis(wert, "datum", "BGB_WERKTAG_ERSATZ",
    list(datum = datum, anwendungsfall = anwendungsfall, feiertage = as.list(feiertage),
         ort = ort, kalenderquelle = kalenderquelle, kalender_von = kalender_von, kalender_bis = kalender_bis),
    list(list(operation = "Unzul\u00e4ssige Tage \u00fcbersprungen", tage = as.list(uebersprungen), ergebnis = wert)),
    list(ort = ort, kalenderquelle = kalenderquelle,
         vollstaendigkeit = "Vom Nutzer f\u00fcr den angegebenen Bereich best\u00e4tigt."))
}

lebensalter_beginn <- function(geburtsdatum = NULL, lebensjahre = NULL) {
  geburt <- .datum(geburtsdatum, "geburtsdatum")
  lebensjahre <- .ganzzahl(lebensjahre, "lebensjahre")
  wert <- .iso(if (lebensjahre == 0) geburt else
    .tage_addieren(.monatsende(geburt, lebensjahre * 12, TRUE), 1))
  .ergebnis(wert, "datum", "BGB_LEBENSALTER_BEGINN",
    list(geburtsdatum = geburtsdatum, lebensjahre = lebensjahre),
    list(list(operation = "Geburtstag mitz\u00e4hlen, Beginn nach Vollendung", ergebnis = wert)))
}

volljaehrigkeitsbeginn <- function(geburtsdatum = NULL) {
  wert <- lebensalter_beginn(geburtsdatum, 18)$wert
  .ergebnis(wert, "datum", "BGB_VOLLJAEHRIGKEIT",
    list(geburtsdatum = geburtsdatum),
    list(list(operation = "Vollendung von 18 Lebensjahren", ergebnis = wert)))
}
