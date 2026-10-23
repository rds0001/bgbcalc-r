dienstverhaeltnis_kuendigungstermin <- function(zugang_kuendigung = NULL, verguetungsbemessung = NULL,
    erwerbstaetigkeit_vollstaendig_oder_hauptsaechlich = NULL, erster_werktag_der_zugangswoche = NULL,
    gesetzliche_regel_621_anwendbar = NULL, einordnungsnachweis = NULL) {
  zugang <- .datum(zugang_kuendigung, "zugang_kuendigung")
  .auswahl(verguetungsbemessung, "verguetungsbemessung", c("tage", "wochen", "monate", "vierteljahre_oder_laenger", "ohne_zeitabschnitte"))
  .wahrheitswert(erwerbstaetigkeit_vollstaendig_oder_hauptsaechlich, "erwerbstaetigkeit_vollstaendig_oder_hauptsaechlich")
  .wahrheitswert(gesetzliche_regel_621_anwendbar, "gesetzliche_regel_621_anwendbar")
  .text(einordnungsnachweis, "einordnungsnachweis")
  erster <- NULL
  if (!is.null(erster_werktag_der_zugangswoche) || verguetungsbemessung == "wochen") {
    erster <- .datum(erster_werktag_der_zugangswoche, "erster_werktag_der_zugangswoche")
    montag <- .tage_addieren(zugang, 1 - as.integer(format(zugang, "%u")))
    samstag <- .tage_addieren(montag, 5)
    if (erster < montag || erster > samstag)
      .fehler("erster_werktag_der_zugangswoche", "Erster Werktag muss zwischen Montag und Samstag der Zugangswoche liegen.")
  }
  eingaben <- list(zugang_kuendigung = zugang_kuendigung, verguetungsbemessung = verguetungsbemessung,
    erwerbstaetigkeit_vollstaendig_oder_hauptsaechlich = erwerbstaetigkeit_vollstaendig_oder_hauptsaechlich,
    erster_werktag_der_zugangswoche = erster_werktag_der_zugangswoche,
    gesetzliche_regel_621_anwendbar = gesetzliche_regel_621_anwendbar, einordnungsnachweis = einordnungsnachweis)
  wert <- NULL
  if (gesetzliche_regel_621_anwendbar) {
    if (verguetungsbemessung == "tage") {
      ende <- .tage_addieren(zugang, 1)
    } else if (verguetungsbemessung == "wochen") {
      ende <- .tage_addieren(zugang, 6 - as.integer(format(zugang, "%u")) + if (zugang <= erster) 0 else 7)
    } else if (verguetungsbemessung == "monate") {
      bezug <- if (as.integer(format(zugang, "%d")) <= 15) zugang else .frist(zugang_kuendigung, 1, "monate", "ereignis")
      jahr <- as.integer(format(bezug, "%Y")); monat <- as.integer(format(bezug, "%m"))
      ende <- .datum(sprintf("%04d-%02d-%02d", jahr, monat, .monatstage(jahr, monat)), "ende")
    } else if (verguetungsbemessung == "vierteljahre_oder_laenger") {
      mindestende <- .frist(zugang_kuendigung, 6, "wochen", "ereignis")
      jahr <- as.integer(format(mindestende, "%Y"))
      monat <- ((as.integer(format(mindestende, "%m")) - 1) %/% 3 + 1) * 3
      ende <- .datum(sprintf("%04d-%02d-%02d", jahr, monat, .monatstage(jahr, monat)), "ende")
    } else if (erwerbstaetigkeit_vollstaendig_oder_hauptsaechlich) {
      ende <- .frist(zugang_kuendigung, 2, "wochen", "ereignis")
    } else {
      ende <- zugang
    }
    wert <- list(fruehester_beendigungstag = .iso(ende),
      ohne_kuendigungsfrist = verguetungsbemessung == "ohne_zeitabschnitte" && !erwerbstaetigkeit_vollstaendig_oder_hauptsaechlich)
  }
  ergebnis <- .ergebnis(wert, "datum_und_wahrheitswert", "BGB_DIENSTVERHAELTNIS_KUENDIGUNGSTERMIN", eingaben,
    list(list(operation = "Verg\u00fctungsbemessung bestimmt gesetzlichen fr\u00fchesten Beendigungstermin ab K\u00fcndigungszugang; Woche mit erstem Werktag und Quartal mit sechs Wochen Vorlauf")), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Dienstverh\u00e4ltnis au\u00dferhalb\u00a7622; ma\u00dfgeblicher Zugang, Verg\u00fctungsbemessung und gesetzliche K\u00fcndbarkeit rechtlich bestimmt; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Bemessung der Verg\u00fctung ist nicht automatisch Auszahlungsrhythmus. Nur gesetzliche Standardregel\u00a7621, keine Arbeitsverh\u00e4ltnisse\u00a7622, Sondergesetze oder abweichenden wirksamen Vereinbarungen. Erster Werktag der Zugangswoche ist anhand \u00f6rtlicher Feiertage rechtlich zu bestimmen; nicht automatisch Montag und nicht erster pers\u00f6nlicher Arbeitstag. Eingabe wird auf dieselbe Kalenderwoche Montag bis Samstag gepr\u00fcft; Feiertagsvollst\u00e4ndigkeit ist durch Nachweis zu sichern. K\u00fcndigung sp\u00e4testens am ersten Werktag wirkt zum folgenden Samstag derselben Woche, danach fr\u00fchestens Samstag der Folgewoche. Monatsgrenze15 einschlie\u00dflich; Quartalsregel sechs Wochen zu M\u00e4rz/Juni/September/Dezemberende. Keine automatische Verschiebung von K\u00fcndigungszugangsgrenzen oder Beendigungsterminen nach\u00a7193. Ohne Zeitbemessung und ohne \u00fcberwiegende Erwerbsbeanspruchung keine K\u00fcndigungsfrist; Datum bezeichnet Zugangstag, nicht eine erfundene Bindung bis Tagesende. K\u00fcndigungswirksamkeit, Befristung, besondere Verbote und tats\u00e4chliche Bestimmung des Termins separat.")
  ergebnis
}
