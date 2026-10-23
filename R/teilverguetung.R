.teilbetrag <- function(gesamtverguetung, leistungsanteil_zaehler, leistungsanteil_nenner) {
  betrag <- .geld(gesamtverguetung)
  zaehler <- .ganzzahl(leistungsanteil_zaehler, "leistungsanteil_zaehler", 0, .zahlengrenze)
  nenner <- .ganzzahl(leistungsanteil_nenner, "leistungsanteil_nenner", 1, .zahlengrenze)
  if (zaehler > nenner) .fehler("leistungsanteil_zaehler", "Leistungsanteil darf eins nicht \u00fcbersteigen.")
  .multiplizieren(betrag, .bruch(zaehler, nenner))
}
dienstkuendigung_teilverguetung <- function(gesamtverguetung = NULL,
    leistungsanteil_zaehler = NULL, leistungsanteil_nenner = NULL,
    interesseloser_verguetungsanteil = NULL, selbst_gekuendigt = NULL,
    durch_vertragsbruch_des_anderen_veranlasst = NULL, fremdkuendigung_durch_eigenen_vertragsbruch = NULL,
    kuendigung_nach_626_627_nach_dienstbeginn = NULL, bewertungsnachweis = NULL) {
  anteilig <- .teilbetrag(gesamtverguetung, leistungsanteil_zaehler, leistungsanteil_nenner)
  interesselos <- .geld(interesseloser_verguetungsanteil)
  if (.vergleichen(interesselos, anteilig) > 0) .fehler("interesseloser_verguetungsanteil", "Interesseloser Verg\u00fctungsanteil darf bisherige Teilverg\u00fctung nicht \u00fcbersteigen.")
  eingaben <- list(gesamtverguetung = gesamtverguetung, leistungsanteil_zaehler = leistungsanteil_zaehler,
    leistungsanteil_nenner = leistungsanteil_nenner, interesseloser_verguetungsanteil = interesseloser_verguetungsanteil,
    selbst_gekuendigt = selbst_gekuendigt, durch_vertragsbruch_des_anderen_veranlasst = durch_vertragsbruch_des_anderen_veranlasst,
    fremdkuendigung_durch_eigenen_vertragsbruch = fremdkuendigung_durch_eigenen_vertragsbruch,
    kuendigung_nach_626_627_nach_dienstbeginn = kuendigung_nach_626_627_nach_dienstbeginn,
    bewertungsnachweis = bewertungsnachweis)
  for (name in names(eingaben)[5:8]) .wahrheitswert(eingaben[[name]], name)
  .text(bewertungsnachweis, "bewertungsnachweis")
  verlust <- (selbst_gekuendigt && !durch_vertragsbruch_des_anderen_veranlasst) || fremdkuendigung_durch_eigenen_vertragsbruch
  wert <- NULL
  if (kuendigung_nach_626_627_nach_dienstbeginn) wert <- if (verlust) .subtrahieren(anteilig, interesselos) else anteilig
  ergebnis <- .geld_ergebnis(wert, "BGB_DIENSTKUENDIGUNG_TEILVERGUETUNG", eingaben,
    list(list(operation = "Verg\u00fctung entsprechend bisheriger Leistung; bei gesetzlicher Verlustkonstellation den interesselos gewordenen Anteil abziehen")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Leistungsanteil und Interessenverlust rechtlich bewerten; keine automatische Zeitquote. Interessenverlust muss gerade infolge der K\u00fcndigung bestehen. Blo\u00dfe Eigenk\u00fcndigung f\u00fchrt nicht automatisch zum Verlust s\u00e4mtlicher Verg\u00fctung. Vorausverg\u00fctungsr\u00fcckzahlung\u00a7628 Absatz1 Satz3 und K\u00fcndigungsschadenAbsatz2 separat; keine automatische Aufrechnung oder Aussage \u00fcber andere Verg\u00fctungsregime."))
  ergebnis
}
werk_teilverguetung_und_auslagen <- function(gesamtverguetung = NULL,
    leistungsanteil_zaehler = NULL, leistungsanteil_nenner = NULL,
    nicht_inbegriffene_auslagen = NULL, werkbeeintraechtigung_vor_abnahme = NULL,
    bestellerstoffmangel_oder_anweisung_ursaechlich = NULL, unternehmer_zu_vertretender_umstand = NULL,
    aufhebung_nach_643 = NULL, kuendigung_nach_649 = NULL, bewertungsnachweis = NULL) {
  anteilig <- .teilbetrag(gesamtverguetung, leistungsanteil_zaehler, leistungsanteil_nenner)
  auslagen <- .geld(nicht_inbegriffene_auslagen)
  eingaben <- list(gesamtverguetung = gesamtverguetung, leistungsanteil_zaehler = leistungsanteil_zaehler,
    leistungsanteil_nenner = leistungsanteil_nenner, nicht_inbegriffene_auslagen = nicht_inbegriffene_auslagen,
    werkbeeintraechtigung_vor_abnahme = werkbeeintraechtigung_vor_abnahme,
    bestellerstoffmangel_oder_anweisung_ursaechlich = bestellerstoffmangel_oder_anweisung_ursaechlich,
    unternehmer_zu_vertretender_umstand = unternehmer_zu_vertretender_umstand,
    aufhebung_nach_643 = aufhebung_nach_643, kuendigung_nach_649 = kuendigung_nach_649,
    bewertungsnachweis = bewertungsnachweis)
  for (name in names(eingaben)[5:9]) .wahrheitswert(eingaben[[name]], name)
  .text(bewertungsnachweis, "bewertungsnachweis")
  werkfall <- werkbeeintraechtigung_vor_abnahme && bestellerstoffmangel_oder_anweisung_ursaechlich &&
    !unternehmer_zu_vertretender_umstand
  gilt <- werkfall || aufhebung_nach_643 || kuendigung_nach_649
  ergebnis <- .geld_ergebnis(if (gilt) .addieren(anteilig, auslagen) else NULL,
    "BGB_WERK_TEILVERGUETUNG_UND_AUSLAGEN", eingaben,
    list(list(operation = "Werkbeeintr\u00e4chtigung ohne mitwirkendes Unternehmervertretenm\u00fcssen oder qualifizierte Aufhebung/K\u00fcndigung; geleisteten Verg\u00fctungsanteil und nicht inbegriffene Auslagen addieren")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur gesetzliche F\u00e4lle\u00a7645 Absatz1/\u00a7649 Absatz1, nicht freie Bestellerk\u00fcndigung\u00a7648. Leistungsanteil rechtlich bestimmen, keine automatische Zeitquote; in Verg\u00fctung enthaltene Auslagen nicht erneut addieren. Weitergehende Bestellerhaftung\u00a7645 Absatz2, Anzeige wesentlicher Anschlags\u00fcberschreitung\u00a7649 Absatz2 und andere Schadenersatzanspr\u00fcche separat."))
  ergebnis
}
werkkuendigung_wichtiger_grund_verguetung <- function(verguetung_gekuendigter_umfang = NULL,
    leistungsanteil_zaehler = NULL, leistungsanteil_nenner = NULL,
    wichtiger_grund_wirksam_gekuendigt = NULL, bautraegervertrag = NULL, leistungsstandsnachweis = NULL) {
  anteilig <- .teilbetrag(verguetung_gekuendigter_umfang, leistungsanteil_zaehler, leistungsanteil_nenner)
  .wahrheitswert(wichtiger_grund_wirksam_gekuendigt, "wichtiger_grund_wirksam_gekuendigt")
  .wahrheitswert(bautraegervertrag, "bautraegervertrag")
  .text(leistungsstandsnachweis, "leistungsstandsnachweis")
  eingaben <- list(verguetung_gekuendigter_umfang = verguetung_gekuendigter_umfang,
    leistungsanteil_zaehler = leistungsanteil_zaehler, leistungsanteil_nenner = leistungsanteil_nenner,
    wichtiger_grund_wirksam_gekuendigt = wichtiger_grund_wirksam_gekuendigt,
    bautraegervertrag = bautraegervertrag, leistungsstandsnachweis = leistungsstandsnachweis)
  ergebnis <- .geld_ergebnis(if (wichtiger_grund_wirksam_gekuendigt && !bautraegervertrag) anteilig else NULL,
    "BGB_WERKKUENDIGUNG_WICHTIGER_GRUND_VERGUETUNG", eingaben,
    list(list(operation = "Verg\u00fctung des gek\u00fcndigten Umfangs mit Anteil der bis zur K\u00fcndigung erbrachten Leistung multiplizieren")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur wirksame K\u00fcndigung aus wichtigem Grund\u00a7648a, kein Bautr\u00e4gervertrag gem\u00e4\u00df\u00a7650u Absatz2; keine F\u00fcnfprozentvermutung oder Verg\u00fctung f\u00fcr nicht erbrachten Teil aus\u00a7648 \u00fcbertragen. Bei Teilk\u00fcndigung ausschlie\u00dflich abgegrenzten gek\u00fcndigten Umfang bewerten. Leistungsstand und Beweislast\u00a7648a Absatz4 rechtlich bestimmen; SchadenersatzAbsatz6 und Verg\u00fctung fortgesetzter Teile separat."))
  ergebnis
}
