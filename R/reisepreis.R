pauschalreise_preiserhoehungsgrenze <- function(reisepreis = NULL, erhoehungsbetrag = NULL,
    reisebeginn = NULL, unterrichtungstag = NULL, aenderungsvorbehalt_ordnungsgemaess = NULL,
    zulaessiger_kostengrund = NULL, unterrichtung_formgerecht = NULL, berechnungsnachweis = NULL) {
  preis <- .geld(reisepreis)
  if (preis$zaehler <= 0) .fehler("reisepreis", "Positiver Reisepreis erforderlich.")
  erhoehung <- .geld(erhoehungsbetrag)
  beginn <- .datum(reisebeginn, "reisebeginn")
  unterrichtung <- .datum(unterrichtungstag, "unterrichtungstag")
  .text(berechnungsnachweis, "berechnungsnachweis")
  eingaben <- list(reisepreis = reisepreis, erhoehungsbetrag = erhoehungsbetrag,
    reisebeginn = reisebeginn, unterrichtungstag = unterrichtungstag,
    aenderungsvorbehalt_ordnungsgemaess = aenderungsvorbehalt_ordnungsgemaess,
    zulaessiger_kostengrund = zulaessiger_kostengrund, unterrichtung_formgerecht = unterrichtung_formgerecht,
    berechnungsnachweis = berechnungsnachweis)
  for (name in c("aenderungsvorbehalt_ordnungsgemaess", "zulaessiger_kostengrund", "unterrichtung_formgerecht"))
    .wahrheitswert(eingaben[[name]], name)
  grenze <- .multiplizieren(preis, .bruch(2, 25))
  letzter_tag <- .tage_addieren(beginn, -20)
  fristgerecht <- unterrichtung <= letzter_tag
  ueber_grenze <- .vergleichen(erhoehung, grenze) > 0
  wert <- list(achtprozentbetrag = .bruchteile(grenze), achtprozentgrenze_ueberschritten = ueber_grenze,
    spaetester_unterrichtungstag = .iso(letzter_tag), zwanzigtage_vorlauf_eingehalten = fristgerecht,
    einseitige_erhoehungsvoraussetzungen_erfuellt = (aenderungsvorbehalt_ordnungsgemaess &&
      zulaessiger_kostengrund && unterrichtung_formgerecht && fristgerecht && !ueber_grenze))
  ergebnis <- .ergebnis(wert, "preisgrenze_und_voraussetzungen", "BGB_PAUSCHALREISE_PREISERHOEHUNGSGRENZE",
    eingaben, list(list(operation = "Acht Prozent des Reisepreises und Unterrichtung sp\u00e4testens zwanzig Tage vor Reisebeginn pr\u00fcfen")), eingaben)
  ergebnis$annahmen <- list("Pauschalreise und konkrete Preis\u00e4nderung nach fester BGB-Fassung; Berechnung und Kostenursache rechtlich bewertet vorgegeben.")
  ergebnis$hinweise <- list("\u00dcber8Prozent keine einseitige Erh\u00f6hung; m\u00f6gliches \u00c4nderungsangebot nach\u00a7651g und dessen weitere Voraussetzungen gesondert. Genau8Prozent \u00fcberschreitet die Grenze nicht.",
    "Keine automatische Ermittlung von Energie-, Abgaben- oder Wechselkurs\u00e4nderungen und keine freie gesetzliche Aufschlagserlaubnis. Der konkrete \u00c4nderungsbetrag folgt dem zul\u00e4ssigen vertraglichen Berechnungsweg.",
    "Taggenauer Vorlauf ohne Verschiebung zugunsten sp\u00e4terer Unterrichtung; tats\u00e4chliche rechtzeitige Information auf dauerhaftem Datentr\u00e4ger vorgeben.")
  ergebnis
}

pauschalreise_preissenkung_erstattung <- function(reisepreis = NULL, preissenkungsbetrag = NULL,
    geleistete_zahlung = NULL, tatsaechliche_verwaltungsausgaben = NULL,
    senkungsvoraussetzungen_erfuellt = NULL, berechnungsnachweis = NULL) {
  preis <- .geld(reisepreis)
  senkung <- .geld(preissenkungsbetrag)
  gezahlt <- .geld(geleistete_zahlung)
  ausgaben <- .geld(tatsaechliche_verwaltungsausgaben)
  if (.vergleichen(senkung, preis) > 0) .fehler("preissenkungsbetrag", "Preissenkung darf den Reisepreis nicht \u00fcbersteigen.")
  .wahrheitswert(senkungsvoraussetzungen_erfuellt, "senkungsvoraussetzungen_erfuellt")
  .text(berechnungsnachweis, "berechnungsnachweis")
  eingaben <- list(reisepreis = reisepreis, preissenkungsbetrag = preissenkungsbetrag,
    geleistete_zahlung = geleistete_zahlung, tatsaechliche_verwaltungsausgaben = tatsaechliche_verwaltungsausgaben,
    senkungsvoraussetzungen_erfuellt = senkungsvoraussetzungen_erfuellt, berechnungsnachweis = berechnungsnachweis)
  ergebnis <- .geld_ergebnis(NULL, "BGB_PAUSCHALREISE_PREISSENKUNG_ERSTATTUNG", eingaben,
    list(list(operation = "Gesenkten Reisepreis, gezahlten Mehrbetrag und h\u00f6chstens diesen Mehrbetrag erreichenden Verwaltungsabzug berechnen")))
  if (senkungsvoraussetzungen_erfuellt) {
    gesenkt <- .subtrahieren(preis, senkung)
    mehrbetrag <- .subtrahieren(gezahlt, gesenkt)
    if (mehrbetrag$zaehler < 0) mehrbetrag <- .bruch(0)
    abzug <- if (.vergleichen(mehrbetrag, ausgaben) < 0) mehrbetrag else ausgaben
    ergebnis$wert <- list(gesenkter_reisepreis = .bruchteile(gesenkt), gezahlter_mehrbetrag = .bruchteile(mehrbetrag),
      verwaltungsabzug = .bruchteile(abzug), erstattungsbetrag = .bruchteile(.subtrahieren(mehrbetrag, abzug)))
    ergebnis$status <- "BERECHNET"
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Verwaltungsausgaben nur vom zu erstattenden Mehrbetrag abziehen, nicht den gesenkten Vertragspreis erh\u00f6hen. Nur tats\u00e4chlich entstandene gesetzlich abzugsf\u00e4hige Ausgaben; Nachweis auf Verlangen gesondert."))
  ergebnis
}
