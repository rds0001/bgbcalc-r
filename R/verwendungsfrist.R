verwendungsersatz_erloeschensfrist <- function(herausgabe_am = NULL, grundstueck = NULL,
    massgebliches_fristende = NULL, prueftag = NULL, gerichtliche_geltendmachung_am = NULL,
    genehmigung_verwendungen_am = NULL, anspruch_unterliegt_1002 = NULL, einordnungsnachweis = NULL) {
  herausgabe <- .datum(herausgabe_am, "herausgabe_am")
  .wahrheitswert(grundstueck, "grundstueck")
  ende <- .datum(massgebliches_fristende, "massgebliches_fristende")
  tag <- .datum(prueftag, "prueftag")
  grundende <- .frist(herausgabe_am, if (grundstueck) 6 else 1, "monate", "ereignis")
  if (ende < grundende) .fehler("massgebliches_fristende", "Ma\u00dfgebliches Fristende darf die gesetzliche Grundfrist nicht verk\u00fcrzen.")
  if (tag < herausgabe) .fehler("prueftag", "Pr\u00fcftag darf nicht vor Herausgabe liegen.")
  eingaben <- list(herausgabe_am = herausgabe_am, grundstueck = grundstueck,
    massgebliches_fristende = massgebliches_fristende, prueftag = prueftag,
    gerichtliche_geltendmachung_am = gerichtliche_geltendmachung_am,
    genehmigung_verwendungen_am = genehmigung_verwendungen_am,
    anspruch_unterliegt_1002 = anspruch_unterliegt_1002, einordnungsnachweis = einordnungsnachweis)
  rechtzeitig <- logical(2)
  ereignisse <- c("gerichtliche_geltendmachung_am", "genehmigung_verwendungen_am")
  for (i in seq_along(ereignisse)) {
    name <- ereignisse[[i]]
    datum <- if (!is.null(eingaben[[name]])) .datum(eingaben[[name]], name) else NULL
    if (!is.null(datum) && datum > tag) .fehler(name, "Erhaltendes Ereignis darf nicht nach dem Pr\u00fcftag liegen.")
    rechtzeitig[[i]] <- !is.null(datum) && datum <= ende
  }
  .wahrheitswert(anspruch_unterliegt_1002, "anspruch_unterliegt_1002")
  .text(einordnungsnachweis, "einordnungsnachweis")
  wert <- if (anspruch_unterliegt_1002) list(rechnerisches_fristende = .iso(grundende),
    gerichtliche_geltendmachung_rechtzeitig = rechtzeitig[[1]], genehmigung_rechtzeitig = rechtzeitig[[2]],
    anspruch_nach_1002_erloschen = tag > ende && !any(rechtzeitig)) else NULL
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_VERWENDUNGSERSATZ_ERLOESCHENSFRIST", eingaben,
    list(list(operation = "Ab Herausgabe ein Monat, bei Grundst\u00fcck sechs Monate; qualifiziertes Fristende und rechtzeitige gerichtliche Geltendmachung oder Genehmigung pr\u00fcfen")), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Herausgabe an Eigent\u00fcmer und Anwendungsbereich rechtlich bestimmt; ma\u00dfgebliches Ende einschlie\u00dflich zul\u00e4ssiger Korrekturen vorgegeben; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("\u00a71002 Absatz2 verweist auf\u00a7\u00a7206/210/211: entsprechende Hemmungs-/Ablaufhemmungswirkungen gesondert berechnen und im ma\u00dfgeblichen Ende belegen; keine frei gew\u00e4hlte Verl\u00e4ngerung. Gerichtliche Geltendmachung muss rechtlich wirksam und diesem Anspruch zugeordnet sein; blo\u00dfe Mahnung oder au\u00dfergerichtliche Zahlungsaufforderung gen\u00fcgt nicht. Genehmigung betrifft die Verwendungen durch Eigent\u00fcmer, nicht eine beliebige Erkl\u00e4rung. NULL bei Ereignisdaten bedeutet bis Pr\u00fcftag nicht eingetreten, nicht unbekannt. Auch Ereignisse vor Herausgabe k\u00f6nnen erhalten; sp\u00e4tere Ereignisse nach Fristende beseitigen das hier berechnete Erl\u00f6schen nicht automatisch. Erneute Anspruchsbegr\u00fcndung und andere Anspr\u00fcche gesondert. FALSE best\u00e4tigt weder Anspruchsgrund noch Betrag oder F\u00e4lligkeit\u00a71001. Taggenau, Ereignisse am letzten Tag bis Fristablauf rechtzeitig; untert\u00e4gige Reihenfolge vorab einordnen.")
  ergebnis
}
