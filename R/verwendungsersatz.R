besitzer_nuetzlicher_verwendungsersatz <- function(verwendungskosten = NULL,
    fortbestehende_werterhoehung = NULL, andere_als_notwendige_verwendung = NULL,
    vor_rechtshaengigkeit_verwendet = NULL, vor_haftungsbeginn_990_verwendet = NULL,
    eigentuemer_besitzer_verhaeltnis_anwendbar = NULL, bewertungsnachweis = NULL) {
  kosten <- .geld(verwendungskosten)
  wert <- .geld(fortbestehende_werterhoehung)
  eingaben <- list(verwendungskosten = verwendungskosten, fortbestehende_werterhoehung = fortbestehende_werterhoehung,
    andere_als_notwendige_verwendung = andere_als_notwendige_verwendung,
    vor_rechtshaengigkeit_verwendet = vor_rechtshaengigkeit_verwendet,
    vor_haftungsbeginn_990_verwendet = vor_haftungsbeginn_990_verwendet,
    eigentuemer_besitzer_verhaeltnis_anwendbar = eigentuemer_besitzer_verhaeltnis_anwendbar,
    bewertungsnachweis = bewertungsnachweis)
  for (name in names(eingaben)[3:6]) .wahrheitswert(eingaben[[name]], name)
  .text(bewertungsnachweis, "bewertungsnachweis")
  gilt <- andere_als_notwendige_verwendung && vor_rechtshaengigkeit_verwendet &&
    vor_haftungsbeginn_990_verwendet && eigentuemer_besitzer_verhaeltnis_anwendbar
  betrag <- if (gilt) {if (.vergleichen(kosten, wert) < 0) kosten else wert} else NULL
  ergebnis <- .geld_ergebnis(betrag, "BGB_BESITZER_NUETZLICHER_VERWENDUNGSERSATZ", eingaben,
    list(list(operation = "Andere als notwendige Verwendungen vor Rechtsh\u00e4ngigkeit und Haftungsbeginn\u00a7990, begrenzt auf bei Wiedererlangung fortbestehende Werterh\u00f6hung")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Werterh\u00f6hung muss auf den betrachteten Verwendungen beruhen und gerade bei Wiedererlangung durch Eigent\u00fcmer fortbestehen; keine automatische Gleichsetzung mit damaligem Aufwand. Beide zeitlichen Voraussetzungen sind kumulativ und rechtlich vorzugeben; untert\u00e4gige Reihenfolge nicht aus gleichem Datum folgern. Notwendige Verwendungen\u00a7994/995 und sonstige Anspruchsgrundlagen separat. Geltendmachung/F\u00e4lligkeit\u00a71001 und Erl\u00f6schen\u00a71002 nicht mitberechnet; keine doppelte Erstattung desselben Aufwands."))
  ergebnis
}
besitzer_landwirtschaftlicher_verwendungsersatz <- function(ordnungsgemaesse_fruchtkosten = NULL,
    wert_noch_ungetrennter_fruechte = NULL, landwirtschaftliches_grundstueck_herauszugeben = NULL,
    fruechte_noch_ungetrennt = NULL, trennung_vor_wirtschaftsjahresende_ordnungsgemaess = NULL,
    bewertungsnachweis = NULL) {
  kosten <- .geld(ordnungsgemaesse_fruchtkosten)
  wert <- .geld(wert_noch_ungetrennter_fruechte)
  eingaben <- list(ordnungsgemaesse_fruchtkosten = ordnungsgemaesse_fruchtkosten,
    wert_noch_ungetrennter_fruechte = wert_noch_ungetrennter_fruechte,
    landwirtschaftliches_grundstueck_herauszugeben = landwirtschaftliches_grundstueck_herauszugeben,
    fruechte_noch_ungetrennt = fruechte_noch_ungetrennt,
    trennung_vor_wirtschaftsjahresende_ordnungsgemaess = trennung_vor_wirtschaftsjahresende_ordnungsgemaess,
    bewertungsnachweis = bewertungsnachweis)
  for (name in names(eingaben)[3:5]) .wahrheitswert(eingaben[[name]], name)
  .text(bewertungsnachweis, "bewertungsnachweis")
  gilt <- landwirtschaftliches_grundstueck_herauszugeben && fruechte_noch_ungetrennt &&
    trennung_vor_wirtschaftsjahresende_ordnungsgemaess
  betrag <- if (gilt) {if (.vergleichen(kosten, wert) < 0) kosten else wert} else NULL
  ergebnis <- .geld_ergebnis(betrag, "BGB_BESITZER_LANDWIRTSCHAFTLICHER_VERWENDUNGSERSATZ", eingaben,
    list(list(operation = "Bei herauszugebendem landwirtschaftlichem Grundst\u00fcck ordnungsgem\u00e4\u00dfe Kosten ungetrennter, vor Wirtschaftsjahresende zu trennender Fr\u00fcchte auf Fruchtwert begrenzen")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Kosten und Fruchtwert m\u00fcssen dieselben noch ungetrennten Fr\u00fcchte betreffen. Nur wirtschaftlich ordnungsgem\u00e4\u00dfe Kostenanteile eingehen lassen; keine erfundene Angemessenheitsquote. Wirtschaftsjahr ist nicht automatisch Kalenderjahr. Wert und ordnungsgem\u00e4\u00df rechtzeitige Trennbarkeit fachlich bestimmen; keine Berechnung zuk\u00fcnftiger Ernteertr\u00e4ge aus frei erfundenen Annahmen. Andere Nutzungs-/Fruchtherausgabe- und Verwendungsanspr\u00fcche gesondert und ohne Doppelz\u00e4hlung."))
  ergebnis
}
