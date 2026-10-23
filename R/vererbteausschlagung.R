vererbte_ausschlagungsfrist <- function(tod_des_erben_am = NULL,
    bisheriges_ausschlagungsfristende = NULL, ausschlagungsfristende_erbeserbschaft = NULL,
    ausschlagungsrecht_vererblich_vorhanden = NULL, einordnungsnachweis = NULL) {
  tod <- .datum(tod_des_erben_am, "tod_des_erben_am")
  bisher <- .datum(bisheriges_ausschlagungsfristende, "bisheriges_ausschlagungsfristende")
  erbe <- .datum(ausschlagungsfristende_erbeserbschaft, "ausschlagungsfristende_erbeserbschaft")
  if (erbe < tod) .fehler("ausschlagungsfristende_erbeserbschaft", "Frist f\u00fcr Erbschaft des Erben darf nicht vor dessen Tod enden.")
  .wahrheitswert(ausschlagungsrecht_vererblich_vorhanden, "ausschlagungsrecht_vererblich_vorhanden")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(tod_des_erben_am = tod_des_erben_am,
    bisheriges_ausschlagungsfristende = bisheriges_ausschlagungsfristende,
    ausschlagungsfristende_erbeserbschaft = ausschlagungsfristende_erbeserbschaft,
    ausschlagungsrecht_vererblich_vorhanden = ausschlagungsrecht_vererblich_vorhanden,
    einordnungsnachweis = einordnungsnachweis)
  gilt <- ausschlagungsrecht_vererblich_vorhanden && tod <= bisher
  wert <- if (gilt) .iso(max(bisher, erbe)) else NULL
  ergebnis <- .ergebnis(wert, "datum", "BGB_VERERBTE_AUSSCHLAGUNGSFRIST", eingaben,
    list(list(operation = "Bei Tod vor Fristablauf Ende der urspr\u00fcnglichen Ausschlagungsfrist mindestens auf Ende der Frist f\u00fcr Erbschaft des Erben verl\u00e4ngern")), eingaben)
  ergebnis$status <- if (gilt) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Zwei getrennte Erbf\u00e4lle und rechtlich bestimmte Ausschlagungsfristen f\u00fcr denselben Erbeserben; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Bisheriges Fristende geh\u00f6rt zum zuerst angefallenen Nachlass; Vergleichsende zur Erbschaft des verstorbenen Erben. Jeweilige Fristen einschlie\u00dflich Kenntnis, Bekanntgabe und zul\u00e4ssiger Korrekturen gesondert bestimmen, beispielsweise mit erbausschlagung_grundfrist f\u00fcr Grundfristen. Kein Neubeginn um sechs Wochen ab Tod und keine Addition beider Fristen. Bereits wirksame Annahme oder Ausschlagung und sonstiger Verlust des Rechts verhindern ein vorhandenes vererbliches Ausschlagungsrecht. Tod am letzten Tag liegt im taggenauen Modell vor Ablauf am Tagesende; untert\u00e4gige Sonderreihenfolge vorab kl\u00e4ren. F\u00fcr mehrere Erbeserben individuell berechnen; Teilrecht nach\u00a71952 Absatz3 nicht durch ein gemeinsames pauschales Datum ersetzen. Fristverl\u00e4ngerung entscheidet nicht \u00fcber Form/Adressat der Ausschlagung oder sp\u00e4tere Hemmung.")
  ergebnis
}
