vereins_haftungsprivileg <- function(personenrolle = NULL, jaehrliche_verguetung = NULL,
    gesetzlicher_taetigkeitsbezug = NULL, vorsatz = NULL, grobe_fahrlaessigkeit = NULL,
    drittersatzpflicht_besteht = NULL, satzungsabweichung_mitgliederhaftung = NULL,
    bewertungsnachweis = NULL) {
  .auswahl(personenrolle, "personenrolle", c("organmitglied", "besonderer_vertreter", "vereinsmitglied"))
  verguetung <- .geld(jaehrliche_verguetung)
  eingaben <- list(personenrolle = personenrolle, jaehrliche_verguetung = jaehrliche_verguetung,
    gesetzlicher_taetigkeitsbezug = gesetzlicher_taetigkeitsbezug, vorsatz = vorsatz,
    grobe_fahrlaessigkeit = grobe_fahrlaessigkeit, drittersatzpflicht_besteht = drittersatzpflicht_besteht,
    satzungsabweichung_mitgliederhaftung = satzungsabweichung_mitgliederhaftung,
    bewertungsnachweis = bewertungsnachweis)
  for (name in names(eingaben)[3:7]) .wahrheitswert(eingaben[[name]], name)
  .text(bewertungsnachweis, "bewertungsnachweis")
  grenze <- .vergleichen(verguetung, .bruch(3300)) <= 0
  beguenstigt <- grenze && gesetzlicher_taetigkeitsbezug
  ausschluss <- beguenstigt && !vorsatz && !grobe_fahrlaessigkeit
  wert <- list(verguetungsgrenze_eingehalten = grenze,
    haftungsausschluss_gegenueber_verein_nach_31a_31b = ausschluss,
    haftungsausschluss_gegenueber_mitgliedern_nach_31a =
      (ausschluss && personenrolle != "vereinsmitglied" && !satzungsabweichung_mitgliederhaftung),
    befreiung_von_drittersatzpflicht_nach_31a_31b = ausschluss && drittersatzpflicht_besteht)
  ergebnis <- .ergebnis(wert, "wahrheitswerte", "BGB_VEREINS_HAFTUNGSPRIVILEG", eingaben,
    list(list(operation = "Jahresverg\u00fctung bis3300Euro, gesetzliche Aufgabe, Verschuldensgrad und gegebenenfalls Drittersatzpflicht verkn\u00fcpfen")), eingaben)
  ergebnis$annahmen <- list("Rolle, relevante Jahresverg\u00fctung, konkreter Aufgabenbezug und Verschulden rechtlich bestimmt; Drittersatzpflicht ist eigenst\u00e4ndig festgestellt.")
  ergebnis$hinweise <- list("Nur benannte gesetzliche Privilegien. FALSE begr\u00fcndet nicht automatisch Haftung; TRUE bei Befreiung beseitigt nicht die vorgegebene Haftung gegen\u00fcber dem Dritten.",
    "\u00a731b erfasst keine allgemeine Haftungsfreistellung gegen\u00fcber anderen Vereinsmitgliedern. Satzungsabweichung von\u00a731a Absatz1 Satz2 f\u00fchrt insoweit aus diesem Standardprivileg; andere vertragliche Anspr\u00fcche getrennt.",
    "Keine automatische Verg\u00fctungsjahresabgrenzung oder Beweisw\u00fcrdigung. Beweislastregeln\u00a731a Absatz1 Satz3 und\u00a731b Absatz1 Satz2 gesondert.")
  ergebnis
}
