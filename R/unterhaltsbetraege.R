
unterhalt_unterschiedsbetrag <- function(voller_unterhalt=NULL, erwerbsdeckung=NULL, bewertungsnachweis=NULL) {
  links <- .geld(voller_unterhalt); rechts <- .geld(erwerbsdeckung)
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(voller_unterhalt=voller_unterhalt, erwerbsdeckung=erwerbsdeckung, bewertungsnachweis=bewertungsnachweis)
  rest <- .subtrahieren(links, rechts)
  if (.vergleichen(rest, .bruch(0)) < 0) rest <- .bruch(0)
  ergebnis <- .ergebnis(.bruchteile(rest), "EUR", "BGB_UNTERHALT_UNTERSCHIEDSBETRAG", eingaben, list(list(operation="Differenz der qualifizierten Betr\u00e4ge bilden und bei null begrenzen.")), eingaben)
  ergebnis$hinweise <- list("Gesetzlicher Unterschiedsbetrag nach\u00a71573II/IV2, mindestens null. Angemessenheit, Nachhaltigkeit, Anschlussunterhalt und Ausschluss konkurrierender Anspr\u00fcche vorqualifiziert; keine Bedarfsbemessung, Quotenmethode oder vollst\u00e4ndige Unterhaltspr\u00fcfung.")
  ergebnis
}

unterhalt_beerdigungskostenrest <- function(beerdigungskosten=NULL, vom_erben_erlangbar=NULL, bewertungsnachweis=NULL) {
  links <- .geld(beerdigungskosten); rechts <- .geld(vom_erben_erlangbar)
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(beerdigungskosten=beerdigungskosten, vom_erben_erlangbar=vom_erben_erlangbar, bewertungsnachweis=bewertungsnachweis)
  rest <- .subtrahieren(links, rechts)
  if (.vergleichen(rest, .bruch(0)) < 0) rest <- .bruch(0)
  ergebnis <- .ergebnis(.bruchteile(rest), "EUR", "BGB_UNTERHALT_BEERDIGUNGSKOSTENREST", eingaben, list(list(operation="Differenz der qualifizierten Betr\u00e4ge bilden und bei null begrenzen.")), eingaben)
  ergebnis$hinweise <- list("\u00a71615II: Kosten abz\u00fcglich vom Erben erlangbarem Betrag, mindestens null. Unterhaltspflicht und Umfang der Beerdigungskosten vorqualifiziert; keine automatische Erbenhaftungspr\u00fcfung.")
  ergebnis
}

ausstattung_schenkungsmehrbetrag <- function(ausstattungswert=NULL, angemessenes_mass=NULL, bewertungsnachweis=NULL) {
  links <- .geld(ausstattungswert); rechts <- .geld(angemessenes_mass)
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(ausstattungswert=ausstattungswert, angemessenes_mass=angemessenes_mass, bewertungsnachweis=bewertungsnachweis)
  rest <- .subtrahieren(links, rechts)
  if (.vergleichen(rest, .bruch(0)) < 0) rest <- .bruch(0)
  ergebnis <- .ergebnis(.bruchteile(rest), "EUR", "BGB_AUSSTATTUNG_SCHENKUNGSMEHRBETRAG", eingaben, list(list(operation="Differenz der qualifizierten Betr\u00e4ge bilden und bei null begrenzen.")), eingaben)
  ergebnis$hinweise <- list("\u00a71624I: Ausstattung \u00fcber dem qualifizierten entsprechenden Ma\u00df, mindestens null. Ausstattungseigenschaft und Bewertung vorqualifiziert; keine selbst erfundene Verm\u00f6gensquote.")
  ergebnis
}

unterhalt_monatsgesamtbetrag <- function(monatsbetrag=NULL, erster_voller_monat=NULL, beendigung_am=NULL, zeitraumnachweis=NULL) {
  betrag <- .geld(monatsbetrag)
  anfang <- .datum(erster_voller_monat, "erster_voller_monat")
  ende <- .datum(beendigung_am, "beendigung_am")
  .text(zeitraumnachweis, "zeitraumnachweis")
  if (substr(.iso(anfang), 9, 10) != "01") .fehler("erster_voller_monat", "Ersten Tag des ersten vollst\u00e4ndig geschuldeten Monats vorgeben.")
  if (ende < anfang) .fehler("beendigung_am", "Beendigung liegt vor dem ersten vollst\u00e4ndig geschuldeten Monat.")
  monate <- (as.integer(substr(.iso(ende), 1, 4)) - as.integer(substr(.iso(anfang), 1, 4))) * 12 + as.integer(substr(.iso(ende), 6, 7)) - as.integer(substr(.iso(anfang), 6, 7)) + 1
  eingaben <- list(monatsbetrag=monatsbetrag, erster_voller_monat=erster_voller_monat, beendigung_am=beendigung_am, zeitraumnachweis=zeitraumnachweis)
  ergebnis <- .ergebnis(list(monatsanzahl=monate, gesamtbetrag=.bruchteile(.multiplizieren(betrag, .bruch(monate)))), "EUR", "BGB_UNTERHALT_MONATSGESAMTBETRAG", eingaben, list(list(operation="Kalendermonate einschlie\u00dflich qualifiziertem Anfangs- und Endmonat z\u00e4hlen und mit konstantem vollem Monatsbetrag multiplizieren.")), eingaben)
  ergebnis$hinweise <- list("Konstanter qualifizierter voller Monatsbetrag und erster vollst\u00e4ndig geschuldeter Monat. Letzter Monat ist rechtlich als voll geschuldeter Monat bestimmt: Tod nach\u00a71361IV/1585I/1612III oder Wiederheirat nach\u00a71585I, gegebenenfalls\u00a71586II. Auch bei Beendigung am ersten oder letzten Tag z\u00e4hlt er voll. Keine t\u00e4gliche K\u00fcrzung dieses Endmonats; kein automatischer voller Anfangsmonat bei erstmaliger Entstehung im Monatslauf. Abweichende Vereinbarungen/Bestimmungen nach\u00a71612II und andere Endgr\u00fcnde nicht abgedeckt. Keine Ermittlung der Unterhaltsh\u00f6he, Zahlungsr\u00fcckst\u00e4nde oder F\u00e4lligkeit an Bankarbeitstagen.")
  ergebnis
}
