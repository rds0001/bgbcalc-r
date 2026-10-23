untervermaechtnis_verweigerungsbetrag <- function(erhaltener_vermaechtniswert = NULL,
    erforderlicher_erfuellungswert = NULL, beschwerter_vermaechtnisnehmer = NULL, bewertungsnachweis = NULL) {
  erhalten <- .geld(erhaltener_vermaechtniswert)
  erforderlich <- .geld(erforderlicher_erfuellungswert)
  .wahrheitswert(beschwerter_vermaechtnisnehmer, "beschwerter_vermaechtnisnehmer")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(erhaltener_vermaechtniswert = erhaltener_vermaechtniswert,
    erforderlicher_erfuellungswert = erforderlicher_erfuellungswert,
    beschwerter_vermaechtnisnehmer = beschwerter_vermaechtnisnehmer, bewertungsnachweis = bewertungsnachweis)
  wert <- if (beschwerter_vermaechtnisnehmer) {
    differenz <- .subtrahieren(erforderlich, erhalten)
    if (.vergleichen(differenz, .bruch(0)) > 0) differenz else .bruch(0)
  } else NULL
  ergebnis <- .geld_ergebnis(wert, "BGB_UNTERVERMAECHTNIS_VERWEIGERUNGSBETRAG", eingaben,
    list(list(operation = "Erforderlichen Erf\u00fcllungswert abz\u00fcglich erhaltenem Verm\u00e4chtniswert auf mindestens null begrenzen")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur betragsm\u00e4\u00dfiger Umfang des Verweigerungsrechts\u00a72187 Absatz1, auch nach Annahme. Tats\u00e4chlich aus Verm\u00e4chtnis Erhaltenes konsistent bewerten, nicht ungepr\u00fcft ungek\u00fcrzten Nominalanspruch einsetzen. Berechnung \u00fcbt das Recht nicht aus und ordnet keine automatische Schuldtilgung an. F\u00e4lligkeit\u00a72186, Nachr\u00fccken\u00a72161/2187 Absatz2 und entsprechende Haftungsregeln\u00a71992/2187 Absatz3 gesondert; bei mehreren Beschwerungen keine unzul\u00e4ssige Einzelverwendung desselben Deckungswerts oder erfundene Rangfolge."))
  ergebnis
}
vermaechtnis_beschwerungskuerzung <- function(ungekuerzter_vermaechtniswert = NULL,
    verbleibender_vermaechtniswert = NULL, urspruengliche_beschwerung = NULL, kuerzungsgrund = NULL,
    abweichender_erblasserwille = NULL, beschwerungsregel_anwendbar = NULL, bewertungsnachweis = NULL) {
  vorher <- .geld(ungekuerzter_vermaechtniswert)
  nachher <- .geld(verbleibender_vermaechtniswert)
  belastung <- .geld(urspruengliche_beschwerung)
  if (.vergleichen(vorher, .bruch(0)) == 0)
    .fehler("ungekuerzter_vermaechtniswert", "Positive urspr\u00fcngliche Leistung f\u00fcr Verh\u00e4ltnisrechnung erforderlich.")
  if (.vergleichen(nachher, vorher) > 0)
    .fehler("verbleibender_vermaechtniswert", "Verbleibende Leistung darf urspr\u00fcngliche Leistung nicht \u00fcbersteigen.")
  .auswahl(kuerzungsgrund, "kuerzungsgrund", c("erbenhaftungsbeschraenkung", "pflichtteilsanspruch", "untervermaechtnis_2187"))
  .wahrheitswert(abweichender_erblasserwille, "abweichender_erblasserwille")
  .wahrheitswert(beschwerungsregel_anwendbar, "beschwerungsregel_anwendbar")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(ungekuerzter_vermaechtniswert = ungekuerzter_vermaechtniswert,
    verbleibender_vermaechtniswert = verbleibender_vermaechtniswert,
    urspruengliche_beschwerung = urspruengliche_beschwerung, kuerzungsgrund = kuerzungsgrund,
    abweichender_erblasserwille = abweichender_erblasserwille,
    beschwerungsregel_anwendbar = beschwerungsregel_anwendbar, bewertungsnachweis = bewertungsnachweis)
  ergebnis <- .geld_ergebnis(NULL, "BGB_VERMAECHTNIS_BESCHWERUNGSKUERZUNG", eingaben,
    list(list(operation = "Beschwerung mit Verh\u00e4ltnis verbleibender zu ungek\u00fcrzter Verm\u00e4chtnisleistung multiplizieren")))
  if (beschwerungsregel_anwendbar && !abweichender_erblasserwille) {
    faktor <- .dividieren(nachher, vorher)
    verbleibend <- .multiplizieren(belastung, faktor)
    ergebnis$wert <- list(verbleibensquote = .bruchteile(faktor),
      gekuerzte_beschwerung = .bruchteile(verbleibend),
      kuerzungsbetrag = .bruchteile(.subtrahieren(belastung, verbleibend)))
    ergebnis$status <- "BERECHNET"
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur K\u00fcrzung aufgrund der drei gesetzlichen Gr\u00fcnde, rechtlich wirksam vorgegeben. Freiwillige Zahlung, Marktwertschwankung oder beliebiger Forderungsverzicht allein gen\u00fcgt nicht. Abweichender Erblasserwille schlie\u00dft dieses proportionale Modell aus. Urspr\u00fcnglichen Verm\u00e4chtniswert und urspr\u00fcngliche Beschwerung als gemeinsame unver\u00e4nderte Basis verwenden; bereits gek\u00fcrzte Beschwerung nicht nochmals mit kumulierter Quote k\u00fcrzen. Geldwerte m\u00fcssen dieselbe Leistung und Bewertungsbasis abbilden. Ergebnis bezeichnet zul\u00e4ssige K\u00fcrzung bei Aus\u00fcbung des Rechts, keine automatische \u00c4nderung oder Durchsetzbarkeit der Beschwerung. Andere Anspr\u00fcche und Rangfragen gesondert."))
  ergebnis
}
