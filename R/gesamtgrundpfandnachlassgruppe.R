gesamtgrundpfandvermaechtnis_nachlassgruppe_mit_fremdhaftung <- function(gesamtbelastungsbetrag=NULL, grundpfandart=NULL,
    grundstuecke=NULL, vermachtes_grundstueck_id=NULL, fremdhaftung_und_erblasserpflicht_qualifiziert=NULL,
    zweifelsregel_anwendbar=NULL, rechts_und_bewertungsnachweis=NULL) {
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
  .wahrheitswert(fremdhaftung_und_erblasserpflicht_qualifiziert, "fremdhaftung_und_erblasserpflicht_qualifiziert")
  .wahrheitswert(zweifelsregel_anwendbar, "zweifelsregel_anwendbar")
  .text(rechts_und_bewertungsnachweis, "rechts_und_bewertungsnachweis")
  eingaben <- list(gesamtbelastungsbetrag=gesamtbelastungsbetrag, grundpfandart=grundpfandart,
    grundstuecke=grundstuecke, vermachtes_grundstueck_id=vermachtes_grundstueck_id,
    fremdhaftung_und_erblasserpflicht_qualifiziert=fremdhaftung_und_erblasserpflicht_qualifiziert,
    zweifelsregel_anwendbar=zweifelsregel_anwendbar, rechts_und_bewertungsnachweis=rechts_und_bewertungsnachweis)
  wert <- NULL
  if (fremdhaftung_und_erblasserpflicht_qualifiziert && zweifelsregel_anwendbar) {
    eigenwert <- werte[[match(vermacht,namen)]]; quote <- if(.vergleichen(summe,.bruch(0))!=0).dividieren(eigenwert,summe) else NULL
    anteil <- if(!is.null(quote)).multiplizieren(betrag,quote) else NULL
    wert <- list(bereinigter_wert_vermachtes_grundstueck=.bruchteile(eigenwert),
      bereinigter_gesamtwert=.bruchteile(summe), wertquote=if(!is.null(quote)).bruchteile(quote) else NULL,
      anteil_vor_wertbegrenzung=if(!is.null(anteil)).bruchteile(anteil) else NULL,
      befriedigungsbetrag=.bruchteile(if(is.null(anteil)).bruch(0) else if(.vergleichen(anteil,eigenwert)<=0)anteil else eigenwert))
  }
  .gesamtgrundpfand_ergebnis(wert, "BGB_GESAMTGRUNDPFANDVERMAECHTNIS_NACHLASSGRUPPE_MIT_FREMDHAFTUNG", eingaben, "2168II-Nachlassvergleichsgruppe rangbereinigen; Fremdwerte ausgeschlossen; Gesamtbelastung mal Eigenwertquote,aufEigenwertbegrenzen", "Nur2168II mit weiterenNachlassgrundst\u00fccken und mindestens einemFremdgrundst\u00fcck sowie qualifizierterErblasserpflicht imErbfall gegen\u00fcberFremdeigent\u00fcmer/Rechtsvorg\u00e4nger f\u00fcr betrachtetenGesamtbetrag. grundstuecke enth\u00e4lt vollst\u00e4ndig ausschlie\u00dflichmithaftendeNachlassgrundst\u00fccke,keinFremdgrundst\u00fcck.2167-Quote nurinnerhalbNachlassgruppe; anschlie\u00dfend2166I-Eigenwertdeckel. Fremdwerte sindkeinInput undverd\u00fcnnenQuoten nicht. Keine2166II-Drittberichtigung/ungleicheTeilpflichten/abweichendenInnenlasten. WertebeiEigentums\u00fcbergangvergleichbar; RentenschuldnurqualifiziertereinheitlicherEUR-Betrag,keineKapitalisierung. NurinterneLast,keineAu\u00dfenhaftungs-/F\u00e4lligkeitsentscheidung.")
}