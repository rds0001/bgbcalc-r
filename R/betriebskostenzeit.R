betriebskostenpauschale_erhoehungsbeginn <- function(erklaerungstag = NULL,
    kostenerhoehung_ab = NULL, kenntnis_am = NULL,
    massgebliches_dreimonatsfristende = NULL, kosten_rueckwirkend_erhoeht = NULL,
    erhoehung_nach_absatz_eins_zulaessig = NULL, zeitnachweis = NULL) {
  erklaerung <- .datum(erklaerungstag, "erklaerungstag")
  kosten <- .datum(kostenerhoehung_ab, "kostenerhoehung_ab")
  kenntnis <- .datum(kenntnis_am, "kenntnis_am")
  ende <- .datum(massgebliches_dreimonatsfristende, "massgebliches_dreimonatsfristende")
  .wahrheitswert(kosten_rueckwirkend_erhoeht, "kosten_rueckwirkend_erhoeht")
  .wahrheitswert(erhoehung_nach_absatz_eins_zulaessig, "erhoehung_nach_absatz_eins_zulaessig")
  .text(zeitnachweis, "zeitnachweis")
  if (kenntnis > erklaerung) .fehler("kenntnis_am", "Kenntnis darf nicht nach der Erh\u00f6hungserkl\u00e4rung liegen.")
  if (kosten_rueckwirkend_erhoeht && kosten > kenntnis) .fehler("kostenerhoehung_ab", "Eine r\u00fcckwirkende Erh\u00f6hung darf nicht erst nach der Kenntnis beginnen.")
  grundende <- .frist(kenntnis_am, 3, "monate", "ereignis")
  if (ende < grundende) .fehler("massgebliches_dreimonatsfristende", "Ma\u00dfgebliches Fristende darf die gesetzliche Dreimonatsgrundfrist nicht verk\u00fcrzen.")
  eingaben <- list(erklaerungstag = erklaerungstag, kostenerhoehung_ab = kostenerhoehung_ab,
    kenntnis_am = kenntnis_am, massgebliches_dreimonatsfristende = massgebliches_dreimonatsfristende,
    kosten_rueckwirkend_erhoeht = kosten_rueckwirkend_erhoeht,
    erhoehung_nach_absatz_eins_zulaessig = erhoehung_nach_absatz_eins_zulaessig,
    zeitnachweis = zeitnachweis)
  wert <- NULL
  if (erhoehung_nach_absatz_eins_zulaessig) {
    regulaer <- .monatsende(.datum(paste0(substr(erklaerungstag, 1, 7), "-01"), "erklaerungstag"), 2, FALSE)
    rechtzeitig <- erklaerung <= ende
    rueckwirkung <- kosten_rueckwirkend_erhoeht && rechtzeitig
    if (rueckwirkung) {
      jahr <- as.integer(substr(erklaerungstag, 1, 4))
      if (jahr == 1) .fehler("erklaerungstag", "Vorjahresbeginn liegt au\u00dferhalb des unterst\u00fctzten Kalenderbereichs.")
      untergrenze <- .datum(sprintf("%04d-01-01", jahr - 1), "erklaerungstag")
      beginn <- max(kosten, untergrenze)
    } else beginn <- regulaer
    wert <- list(regulaerer_erhoehungsbeginn = .iso(regulaer),
      rechnerisches_dreimonatsfristende = .iso(grundende),
      dreimonatsfrist_eingehalten = rechtzeitig, rueckwirkung_anwendbar = rueckwirkung,
      erhoehungsbeginn = .iso(beginn))
  }
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_BETRIEBSKOSTENPAUSCHALE_ERHOEHUNGSBEGINN", eingaben,
    list(list(operation = "\u00dcbern\u00e4chsten Monatsbeginn berechnen; rechtzeitige r\u00fcckwirkende Kostensteigerung h\u00f6chstens bis Vorjahresbeginn zur\u00fcckbeziehen")), eingaben)
  ergebnis$status <- if (erhoehung_nach_absatz_eins_zulaessig) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Rechtlich ma\u00dfgeblicher Erkl\u00e4rungstag, Kenntnis und qualifizierte r\u00fcckwirkende Kostensteigerung vorgegeben; wirksame Pauschalenerh\u00f6hung nach\u00a7560 Absatz1 separat gepr\u00fcft.")
  ergebnis$hinweise <- list("Erkl\u00e4rungstag bezeichnet den rechtlich ma\u00dfgeblichen Tag der Erkl\u00e4rung gegen\u00fcber dem Mieter; Versanddatum nicht ungepr\u00fcft einsetzen. Ma\u00dfgebliches Dreimonatsfristende muss zul\u00e4ssige Kalenderkorrekturen bereits ber\u00fccksichtigen und belegt sein; keine frei w\u00e4hlbare Verl\u00e4ngerung. Am letzten Fristtag ist die Erkl\u00e4rung rechtzeitig. Nur Erh\u00f6hungen einer Betriebskostenpauschale; keine Vorauszahlungen und keine r\u00fcckwirkende Vereinbarung. Bei versp\u00e4teter Erkl\u00e4rung entf\u00e4llt nur der hier gepr\u00fcfte R\u00fcckwirkungsweg. Verschiedene Kostensteigerungen mit verschiedenen Kenntnistagen getrennt berechnen. Kein R\u00fcckwirkungsbetrag ohne zus\u00e4tzliche periodengerechte Betragsrechnung.")
  ergebnis
}
