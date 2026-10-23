vertrauensschaden_nichtigkeit_anfechtung <- function(vertrauensschaden = NULL, gueltigkeitsinteresse = NULL,
    nichtigkeit_nach_118 = NULL, anfechtung_nach_119_120 = NULL,
    grund_bekannt_oder_kennen_muessen = NULL, bewertungsnachweis = NULL) {
  schaden <- .geld(vertrauensschaden)
  interesse <- .geld(gueltigkeitsinteresse)
  eingaben <- list(vertrauensschaden = vertrauensschaden, gueltigkeitsinteresse = gueltigkeitsinteresse,
    nichtigkeit_nach_118 = nichtigkeit_nach_118, anfechtung_nach_119_120 = anfechtung_nach_119_120,
    grund_bekannt_oder_kennen_muessen = grund_bekannt_oder_kennen_muessen, bewertungsnachweis = bewertungsnachweis)
  for (name in names(eingaben)[3:5]) .wahrheitswert(eingaben[[name]], name)
  .text(bewertungsnachweis, "bewertungsnachweis")
  wert <- NULL
  if (nichtigkeit_nach_118 || anfechtung_nach_119_120) {
    wert <- if (grund_bekannt_oder_kennen_muessen) .bruch(0) else
      if (.vergleichen(schaden, interesse) < 0) schaden else interesse
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_VERTRAUENSSCHADEN_NICHTIGKEIT_ANFECHTUNG", eingaben,
    list(list(operation = "Anwendungsfall\u00a7122 pr\u00fcfen; bei Kenntnis/Kennenm\u00fcssen kein Ersatz, sonst Vertrauensschaden auf G\u00fcltigkeitsinteresse begrenzen")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur\u00a7122, keine \u00dcbertragung auf beliebige Nichtigkeit oder Anfechtung nach\u00a7123. Gesch\u00fctzter Empf\u00e4nger/Dritter, Kausalit\u00e4t und Schadenh\u00f6he extern bestimmt; andere Anspr\u00fcche gesondert."))
  ergebnis
}

vertrauensschaden_vertretungsmangel <- function(vertrauensschaden = NULL, wirksamkeitsinteresse = NULL,
    vertretungsmangel_unbekannt = NULL, vertretungsmacht_nachgewiesen = NULL,
    genehmigung_verweigert = NULL, gegner_kennt_oder_kennen_muss = NULL,
    vertreter_beschraenkt_geschaeftsfaehig = NULL, mit_zustimmung_des_gesetzlichen_vertreters = NULL,
    bewertungsnachweis = NULL) {
  schaden <- .geld(vertrauensschaden)
  interesse <- .geld(wirksamkeitsinteresse)
  eingaben <- list(vertrauensschaden = vertrauensschaden, wirksamkeitsinteresse = wirksamkeitsinteresse,
    vertretungsmangel_unbekannt = vertretungsmangel_unbekannt, vertretungsmacht_nachgewiesen = vertretungsmacht_nachgewiesen,
    genehmigung_verweigert = genehmigung_verweigert, gegner_kennt_oder_kennen_muss = gegner_kennt_oder_kennen_muss,
    vertreter_beschraenkt_geschaeftsfaehig = vertreter_beschraenkt_geschaeftsfaehig,
    mit_zustimmung_des_gesetzlichen_vertreters = mit_zustimmung_des_gesetzlichen_vertreters,
    bewertungsnachweis = bewertungsnachweis)
  for (name in names(eingaben)[3:8]) .wahrheitswert(eingaben[[name]], name)
  .text(bewertungsnachweis, "bewertungsnachweis")
  wert <- NULL
  if (vertretungsmangel_unbekannt && !vertretungsmacht_nachgewiesen && genehmigung_verweigert) {
    ausgeschlossen <- gegner_kennt_oder_kennen_muss ||
      (vertreter_beschraenkt_geschaeftsfaehig && !mit_zustimmung_des_gesetzlichen_vertreters)
    wert <- if (ausgeschlossen) .bruch(0) else if (.vergleichen(schaden, interesse) < 0) schaden else interesse
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_VERTRAUENSSCHADEN_VERTRETUNGSMANGEL", eingaben,
    list(list(operation = "Unbekannten Vertretungsmangel und verweigerte Genehmigung pr\u00fcfen; Ausschl\u00fcsse anwenden und Vertrauensschaden auf Wirksamkeitsinteresse begrenzen")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur begrenzter Vertrauensschaden\u00a7179 Absatz2. Bei bekanntem Vertretungsmangel NICHT_ANWENDBAR, nicht Haftungsfreiheit; Erf\u00fcllung/Schadenersatzwahl nach Absatz1 gesondert. Vertragsschluss als Vertreter und weitere Voraussetzungen vorab bestimmen."))
  ergebnis
}
