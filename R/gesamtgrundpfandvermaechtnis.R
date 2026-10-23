.gesamtgrundpfand_ergebnis <- function(wert, kennung, eingaben, operation, hinweis) {
  ergebnis <- .ergebnis(wert, "EUR_und_quote", kennung, eingaben, list(list(operation=operation)), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Feste lokale BGB-Fassung; rechtlich vergleichbare Grundst\u00fcckswerte bei Eigentums\u00fcbergang und einheitlich qualifizierter Bezugsbetrag der Gesamtbelastung.")
  ergebnis$hinweise <- list(hinweis)
  ergebnis
}
gesamtgrundpfandvermaechtnis_nachlassanteil <- function(gesamtbelastungsbetrag=NULL, grundpfandart=NULL,
    grundstuecke=NULL, vermachtes_grundstueck_id=NULL, ausschliesslich_nachlassgrundstuecke=NULL,
    zweifelsregel_anwendbar=NULL, bewertungsnachweis=NULL) {
  betrag <- .geld(gesamtbelastungsbetrag)
  .auswahl(grundpfandart, "grundpfandart", c("gesamtgrundschuld", "gesamtrentenschuld"))
  .vorhanden(grundstuecke, "grundstuecke")
  if (!is.list(grundstuecke) || !is.null(names(grundstuecke)) || length(grundstuecke)<2 || length(grundstuecke)>1000)
    .fehler("grundstuecke", "Liste mit 2 bis 1000 mithaftenden Grundst\u00fccken erforderlich.")
  namen <- character(); werte <- list(); summe <- .bruch(0)
  for (i in seq_along(grundstuecke)) {
    g <- grundstuecke[[i]]
    if (!is.list(g) || !identical(sort(names(g)), sort(c("grundstueck_id", "grundstueckswert", "vorrangige_belastungen"))))
      .fehler("grundstuecke", "Genau grundstueck_id, grundstueckswert und vorrangige_belastungen erforderlich.")
    name <- .text(g$grundstueck_id, "grundstueck_id")
    if (name %in% namen) .fehler("grundstueck_id", "Grundst\u00fccke d\u00fcrfen nicht doppelt vorkommen.")
    bereinigt <- .subtrahieren(.geld(g$grundstueckswert), .geld(g$vorrangige_belastungen))
    if (.vergleichen(bereinigt, .bruch(0))<0) bereinigt <- .bruch(0)
    namen <- c(namen,name); werte[[i]] <- bereinigt; summe <- .addieren(summe, bereinigt)
  }
  vermacht <- .text(vermachtes_grundstueck_id, "vermachtes_grundstueck_id")
  if (!(vermacht %in% namen)) .fehler("vermachtes_grundstueck_id", "Vermachtes Grundst\u00fcck muss in vollst\u00e4ndiger Grundst\u00fccksliste enthalten sein.")
  if (.vergleichen(summe,.bruch(0))==0) .fehler("grundstuecke", "Positive Summe bereinigter Grundst\u00fcckswerte f\u00fcr Verh\u00e4ltnis erforderlich.")
  .wahrheitswert(ausschliesslich_nachlassgrundstuecke, "ausschliesslich_nachlassgrundstuecke")
  .wahrheitswert(zweifelsregel_anwendbar, "zweifelsregel_anwendbar")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(gesamtbelastungsbetrag=gesamtbelastungsbetrag, grundpfandart=grundpfandart,
    grundstuecke=grundstuecke, vermachtes_grundstueck_id=vermachtes_grundstueck_id,
    ausschliesslich_nachlassgrundstuecke=ausschliesslich_nachlassgrundstuecke,
    zweifelsregel_anwendbar=zweifelsregel_anwendbar, bewertungsnachweis=bewertungsnachweis)
  wert <- NULL
  if (ausschliesslich_nachlassgrundstuecke && zweifelsregel_anwendbar) {
    eigenwert <- werte[[match(vermacht,namen)]]; quote <- .dividieren(eigenwert,summe)
    wert <- list(bereinigter_wert_vermachtes_grundstueck=.bruchteile(eigenwert),
      bereinigter_gesamtwert=.bruchteile(summe), wertquote=.bruchteile(quote),
      zugeordneter_belastungsteil=.bruchteile(.multiplizieren(betrag,quote)))
  }
  .gesamtgrundpfand_ergebnis(wert, "BGB_GESAMTGRUNDPFANDVERMAECHTNIS_NACHLASSANTEIL", eingaben, "Rangvorrangige Lasten von Grundst\u00fcckswerten abziehen; nichtnegative Werte summieren; Gesamtbelastungsbetrag mit Wertquote des vermachten Grundst\u00fccks multiplizieren", "Nur\u00a72168 Absatz1: s\u00e4mtliche mithaftenden Grundst\u00fccke geh\u00f6ren zum Nachlass. Werte bei Eigentums\u00fcbergang auf Verm\u00e4chtnisnehmer; nur rangvorrangige Lasten abziehen, nicht die Gesamtbelastung selbst. Keine zus\u00e4tzliche Begrenzung auf Grundst\u00fcckswert oder pers\u00f6nliche Schuld und kein Drittleistungsabzug aus\u00a72166 Absatz2: Absatz1 verweist nur auf dessen Wertbestimmung. Gesamtbelastungsbetrag ist ein rechtlich bestimmter einheitlicher EUR-Bezugsbetrag der betrachteten Grund-/Rentenschuld; bei wiederkehrender Rentenschuld selben qualifizierten Zeitraum verwenden. Keine Kapitalisierung oder Wahl zwischen laufender Rente und Abl\u00f6sungssumme. Interne Lastenverteilung gegen\u00fcber Erben, keine Einschr\u00e4nkung dinglicher Gl\u00e4ubigerrechte oder F\u00e4lligkeitsberechnung. Fremdgrundst\u00fccksf\u00e4lle nach Absatz2 gesondert; abweichender Erblasserwille sperrt Zweifelsregel.")
}
gesamtgrundpfandvermaechtnis_fremdgrundstueck <- function(gesamtbelastungsbetrag=NULL, grundpfandart=NULL,
    wert_vermachtes_grundstueck=NULL, vorrangige_lasten_vermachtes_grundstueck=NULL,
    wert_fremdgrundstueck=NULL, vorrangige_lasten_fremdgrundstueck=NULL,
    erblasserpflicht_gegenueber_fremdeigentuemer=NULL, zweifelsregel_anwendbar=NULL,
    genau_zwei_grundstuecke_qualifiziert=NULL, bewertungsnachweis=NULL) {
  betrag <- .geld(gesamtbelastungsbetrag)
  .auswahl(grundpfandart, "grundpfandart", c("gesamtgrundschuld", "gesamtrentenschuld"))
  eigener <- .subtrahieren(.geld(wert_vermachtes_grundstueck), .geld(vorrangige_lasten_vermachtes_grundstueck))
  .geld(wert_fremdgrundstueck); .geld(vorrangige_lasten_fremdgrundstueck)
  if (.vergleichen(eigener,.bruch(0))<0) eigener <- .bruch(0)
  summe <- eigener
  eingaben <- list(gesamtbelastungsbetrag=gesamtbelastungsbetrag, grundpfandart=grundpfandart,
    wert_vermachtes_grundstueck=wert_vermachtes_grundstueck,
    vorrangige_lasten_vermachtes_grundstueck=vorrangige_lasten_vermachtes_grundstueck,
    wert_fremdgrundstueck=wert_fremdgrundstueck,
    vorrangige_lasten_fremdgrundstueck=vorrangige_lasten_fremdgrundstueck,
    erblasserpflicht_gegenueber_fremdeigentuemer=erblasserpflicht_gegenueber_fremdeigentuemer,
    zweifelsregel_anwendbar=zweifelsregel_anwendbar,
    genau_zwei_grundstuecke_qualifiziert=genau_zwei_grundstuecke_qualifiziert, bewertungsnachweis=bewertungsnachweis)
  for (name in names(eingaben)[7:9]) .wahrheitswert(eingaben[[name]],name)
  .text(bewertungsnachweis,"bewertungsnachweis")
  wert <- NULL
  if (erblasserpflicht_gegenueber_fremdeigentuemer && zweifelsregel_anwendbar && genau_zwei_grundstuecke_qualifiziert) {
    quote <- if (.vergleichen(summe,.bruch(0))!=0) .dividieren(eigener,summe) else NULL
    anteil <- if (!is.null(quote)) .multiplizieren(betrag,quote) else NULL
    deckel <- if (is.null(anteil)) .bruch(0) else if (.vergleichen(anteil,eigener)<0) anteil else eigener
    wert <- list(bereinigter_wert_vermachtes_grundstueck=.bruchteile(eigener),
      bereinigter_gesamtwert=.bruchteile(summe), wertquote=if (!is.null(quote)) .bruchteile(quote) else NULL,
      anteil_vor_wertbegrenzung=if (!is.null(anteil)) .bruchteile(anteil) else NULL, befriedigungsbetrag=.bruchteile(deckel))
  }
  .gesamtgrundpfand_ergebnis(wert, "BGB_GESAMTGRUNDPFANDVERMAECHTNIS_FREMDGRUNDSTUECK", eingaben, "Eigenwert um rangvorrangige Lasten bereinigen; nur Nachlassgrundst\u00fccke bilden2167-Vergleichsgruppe; hier einzigesNachlassgrundst\u00fcck, Gesamtbetrag aufEigenwert begrenzen", "Nur2168Absatz2 mit genau einem vermachtenNachlassgrundst\u00fcck und einem fremdenGrundst\u00fcck. Erblasserpflicht imErbfall gegen\u00fcberFremdeigent\u00fcmer/Rechtsvorg\u00e4nger qualifizieren.2167 bezieht nurNachlassgrundst\u00fccke in Vergleichsgruppe ein: Fremdwerte mindern diese interneLast nicht. Hier einzigesNachlassgrundst\u00fcck, deshalb Befriedigung=min(Gesamtbetrag,bereinigterEigenwert). bereinigter_gesamtwert ist alleinWertsumme derNachlassgrundst\u00fccke; wertquote beiEigenwertpositiv1,bei0NULL. Fremdwert-/Ranglastenparameter werden ausKompatibilit\u00e4tsgr\u00fcnden validiert,aber nichtquotenbildend verwendet. Kein2166II-Drittleistungsabzug, keineAu\u00dfenhaftungsbegrenzung, Rentenkapitalisierung oderF\u00e4lligkeitsentscheidung. WeitereNachlassgrundst\u00fccke ben\u00f6tigen gesonderte2167-Quote.")
}
