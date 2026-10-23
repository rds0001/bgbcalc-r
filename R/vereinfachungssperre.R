modernisierung_vereinfachung_sperrfrist <- function(zugang_vereinfachte_erhoehung_am = NULL,
    neue_geltendmachung_am = NULL, gesetzliche_modernisierungspflicht = NULL,
    pflicht_damals_bekannt_oder_kennen_muessen = NULL, modernisierung_auf_weg_beschluss = NULL,
    weg_beschluss_am = NULL, vereinfachte_erhoehung_geltend_gemacht = NULL,
    einordnungsnachweis = NULL) {
  zugang <- .datum(zugang_vereinfachte_erhoehung_am, "zugang_vereinfachte_erhoehung_am")
  neu <- .datum(neue_geltendmachung_am, "neue_geltendmachung_am")
  if (neu < zugang) .fehler("neue_geltendmachung_am", "Neue Geltendmachung darf nicht vor dem Ausgangszugang liegen.")
  eingaben <- list(zugang_vereinfachte_erhoehung_am = zugang_vereinfachte_erhoehung_am,
    neue_geltendmachung_am = neue_geltendmachung_am, gesetzliche_modernisierungspflicht = gesetzliche_modernisierungspflicht,
    pflicht_damals_bekannt_oder_kennen_muessen = pflicht_damals_bekannt_oder_kennen_muessen,
    modernisierung_auf_weg_beschluss = modernisierung_auf_weg_beschluss, weg_beschluss_am = weg_beschluss_am,
    vereinfachte_erhoehung_geltend_gemacht = vereinfachte_erhoehung_geltend_gemacht, einordnungsnachweis = einordnungsnachweis)
  for (name in c("gesetzliche_modernisierungspflicht", "pflicht_damals_bekannt_oder_kennen_muessen",
      "modernisierung_auf_weg_beschluss", "vereinfachte_erhoehung_geltend_gemacht")) .wahrheitswert(eingaben[[name]], name)
  beschluss <- NULL
  if (!is.null(weg_beschluss_am) || modernisierung_auf_weg_beschluss) {
    beschluss <- .datum(weg_beschluss_am, "weg_beschluss_am")
    if (beschluss > neu) .fehler("weg_beschluss_am", "Beschluss darf nicht nach neuer Geltendmachung liegen.")
  }
  .text(einordnungsnachweis, "einordnungsnachweis")
  wert <- NULL
  if (vereinfachte_erhoehung_geltend_gemacht) {
    sperrende <- .frist(.iso(zugang), 5, "jahre", "ereignis")
    beschluss_fruehestens <- .tage_addieren(.frist(.iso(zugang), 2, "jahre", "ereignis"), 1)
    pflichtausnahme <- gesetzliche_modernisierungspflicht && !pflicht_damals_bekannt_oder_kennen_muessen
    wegausnahme <- modernisierung_auf_weg_beschluss && beschluss >= beschluss_fruehestens
    gesperrt <- neu <= sperrende && !(pflichtausnahme || wegausnahme)
    wert <- list(sperrfrist_letzter_tag = .iso(sperrende), weg_beschluss_fruehestens = .iso(beschluss_fruehestens),
      pflichtausnahme = pflichtausnahme, wegausnahme = wegausnahme, neue_erhoehung_nach_559_559e_gesperrt = gesperrt)
  }
  ergebnis <- .ergebnis(wert, "fristdaten_und_wahrheitswerte", "BGB_MODERNISIERUNG_VEREINFACHUNG_SPERRFRIST", eingaben,
    list(list(operation = "F\u00fcnfj\u00e4hrige Ereignisfrist ab Zugang und Zweijahresabstand f\u00fcr WEG-Beschluss berechnen; gesetzliche Ausnahmen pr\u00fcfen")), eingaben)
  ergebnis$status <- if (vereinfachte_erhoehung_geltend_gemacht) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Rechtlich ma\u00dfgebliche Erkl\u00e4rung im vereinfachten Verfahren und neue Erh\u00f6hung nach\u00a7559/\u00a7559e sowie ma\u00dfnahmebezogene Ausnahmevoraussetzungen vorgegeben.")
  ergebnis$hinweise <- list("Pflichtausnahme nur soweit die konkrete Ma\u00dfnahme w\u00e4hrend des Zeitraums gesetzlich durchzuf\u00fchren ist und die Pflicht bei fr\u00fcherer Geltendmachung weder bekannt war noch bekannt sein musste. Gemischte Ma\u00dfnahmen getrennt beurteilen. WEG-Ausnahme erfordert Durchf\u00fchrung aufgrund des betreffenden Beschlusses; blo\u00dfe WEG-Zugeh\u00f6rigkeit gen\u00fcgt nicht.", "F\u00fcnfjahressperre und fr\u00fchester Beschluss nach voll abgelaufenen Ereignisjahren, keine automatische Werktagsverschiebung. Nicht gesperrt bedeutet nur keine Sperre aus\u00a7559c Absatz4, keinen fertigen Erh\u00f6hungsanspruch. Andere Voraussetzungen und sp\u00e4tere neue Sperren gesondert.")
  ergebnis
}
