inventarfrist_grundrahmen <- function(zustellung_fristbeschluss_am = NULL, annahme_erbschaft_am = NULL,
    bestimmtes_grundfristende = NULL, erstmalige_inventarfrist = NULL, einordnungsnachweis = NULL) {
  zustellung <- .datum(zustellung_fristbeschluss_am, "zustellung_fristbeschluss_am")
  annahme <- .datum(annahme_erbschaft_am, "annahme_erbschaft_am")
  ende <- .datum(bestimmtes_grundfristende, "bestimmtes_grundfristende")
  beginn <- max(zustellung, annahme)
  if (ende < beginn) .fehler("bestimmtes_grundfristende", "Bestimmtes Grundfristende darf nicht vor dem ma\u00dfgeblichen Beginn liegen.")
  .wahrheitswert(erstmalige_inventarfrist, "erstmalige_inventarfrist")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(zustellung_fristbeschluss_am = zustellung_fristbeschluss_am,
    annahme_erbschaft_am = annahme_erbschaft_am, bestimmtes_grundfristende = bestimmtes_grundfristende,
    erstmalige_inventarfrist = erstmalige_inventarfrist, einordnungsnachweis = einordnungsnachweis)
  wert <- NULL
  if (erstmalige_inventarfrist) {
    minimum <- .frist(.iso(beginn), 1, "monate", "ereignis")
    maximum <- .frist(.iso(beginn), 3, "monate", "ereignis")
    wert <- list(fristbeginnereignis_am = .iso(beginn), einmonatsgrenze = .iso(minimum),
      dreimonatsgrenze = .iso(maximum), bestimmtes_ende_im_sollrahmen = minimum <= ende && ende <= maximum)
  }
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswert", "BGB_INVENTARFRIST_GRUNDRAHMEN", eingaben,
    list(list(operation = "Sp\u00e4teren Tag von Zustellung und Annahme als Beginn; Ein-/Dreimonatsgrenzen des gesetzlichen Sollrahmens berechnen")), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Tats\u00e4chliche Zustellung, wirksame Annahme und erstmalige gerichtliche Grundfristbestimmung vorgegeben; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("\u00a71995 Absatz1 enth\u00e4lt einen Sollrahmen, keine automatische Unwirksamkeit jedes au\u00dferhalb liegenden gerichtlichen Termins. Ergebnis beurteilt nur den rechnerischen Rahmen der Erstbestimmung. Annahme kann ausdr\u00fccklich oder rechtlich anderweitig erfolgt sein und ist nicht automatisch Erbfalltag. Vor Annahme bestimmte Frist beginnt nicht vor Annahme; sp\u00e4tere Zustellung bleibt ebenfalls Startgrenze. Gerichtliche Verl\u00e4ngerung nach Absatz3 nicht auf drei Monate kappen und nicht ohne gerichtliche Entscheidung annehmen. Ablaufhemmung\u00a71997/210, Sonderfall Ehegatten\u00a72008 und zul\u00e4ssige Kalenderkorrekturen separat; bestimmtes_grundfristende ist die zum unbereinigten Rahmen vergleichbare Grundgrenze. Keine automatische Ermittlung eines endg\u00fcltigen Inventarablaufs oder unbeschr\u00e4nkter Erbenhaftung.")
  ergebnis
}
inventarfrist_neubestimmungsantrag <- function(hindernis_beseitigt_am = NULL,
    ende_zuerst_bestimmter_inventarfrist = NULL, massgebliches_zweiwochenfristende = NULL,
    massgebliche_jahreshoechstgrenze = NULL, antrag_massgeblich_gestellt_am = NULL,
    unverschuldete_verhinderung = NULL, einordnungsnachweis = NULL) {
  beseitigt <- .datum(hindernis_beseitigt_am, "hindernis_beseitigt_am")
  .datum(ende_zuerst_bestimmter_inventarfrist, "ende_zuerst_bestimmter_inventarfrist")
  korrigiert <- .datum(massgebliches_zweiwochenfristende, "massgebliches_zweiwochenfristende")
  jahresgrenze <- .datum(massgebliche_jahreshoechstgrenze, "massgebliche_jahreshoechstgrenze")
  antrag <- .datum(antrag_massgeblich_gestellt_am, "antrag_massgeblich_gestellt_am")
  grundende <- .frist(hindernis_beseitigt_am, 2, "wochen", "ereignis")
  hoechstende <- .frist(ende_zuerst_bestimmter_inventarfrist, 1, "jahre", "ereignis")
  if (korrigiert < grundende) .fehler("massgebliches_zweiwochenfristende", "Ma\u00dfgebliches Zweiwochenende darf die Grundfrist nicht verk\u00fcrzen.")
  if (jahresgrenze < hoechstende) .fehler("massgebliche_jahreshoechstgrenze", "Ma\u00dfgebliche Jahresgrenze darf die gesetzliche Jahresgrundgrenze nicht verk\u00fcrzen.")
  if (antrag < beseitigt) .fehler("antrag_massgeblich_gestellt_am", "Antrag vor Hindernisbeseitigung au\u00dferhalb dieses Fristmodells.")
  .wahrheitswert(unverschuldete_verhinderung, "unverschuldete_verhinderung")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(hindernis_beseitigt_am = hindernis_beseitigt_am,
    ende_zuerst_bestimmter_inventarfrist = ende_zuerst_bestimmter_inventarfrist,
    massgebliches_zweiwochenfristende = massgebliches_zweiwochenfristende,
    massgebliche_jahreshoechstgrenze = massgebliche_jahreshoechstgrenze,
    antrag_massgeblich_gestellt_am = antrag_massgeblich_gestellt_am,
    unverschuldete_verhinderung = unverschuldete_verhinderung, einordnungsnachweis = einordnungsnachweis)
  ende <- min(korrigiert, jahresgrenze)
  wert <- list(rechnerisches_zweiwochenfristende = .iso(grundende), jahreshoechstgrenze = .iso(hoechstende),
    massgeblicher_letzter_antragstag = .iso(ende), antragsfrist_eingehalten = antrag <= ende,
    verhinderung_und_frist_erfuellt = unverschuldete_verhinderung && antrag <= ende)
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_INVENTARFRIST_NEUBESTIMMUNGSANTRAG", eingaben,
    list(list(operation = "Zweiwochenfrist nach Hindernisbeseitigung mit absoluter Jahresgrenze ab zuerst bestimmtem Inventarfristende begrenzen; unverschuldete Verhinderung gesondert einbeziehen")), eingaben)
  ergebnis$annahmen <- list("Unverschuldete Verhinderung, Hindernisbeseitigung, erste Inventarfrist und rechtlicher Antragstag qualifiziert vorgegeben; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("\u00a71996 Absatz1 erfasst unverschuldete Verhinderung an Inventarerrichtung, gerechtfertigtem Verl\u00e4ngerungsantrag oder Einhaltung der Zweiwochenfrist. Keine automatische Bewertung des Verschuldens. \u00a71997 verweist f\u00fcr die Zweiwochenfrist auf\u00a7210; solche Korrektur im ma\u00dfgeblichen Zweiwochenende belegen. Die Jahresgrenze ist gesondert einschlie\u00dflich nur rechtlich zul\u00e4ssiger Kalenderkorrekturen vorzugeben; die Verweisung auf\u00a7210 in\u00a71997 betrifft gerade nicht diese Jahresgrenze. Keine frei w\u00e4hlbare Verl\u00e4ngerung. Jahresgrenze bezieht sich auf Ende der zuerst bestimmten Frist und wird hier nicht durch erneute Antr\u00e4ge oder sp\u00e4tere Grundfristen neu gestartet. Sp\u00e4te Hindernisbeseitigung kann hinter der Jahresgrenze liegen und l\u00e4sst diese nicht entfallen. Taggenau bis Ablauf des letzten Tages, rechtlichen Antragseingang statt Versand vorgeben. Gerichtliche Neubestimmung und Anh\u00f6rung\u00a71996 Absatz3 erfolgen nicht durch diese Berechnung; TRUE ist keine automatische gerichtliche Bewilligung.")
  ergebnis
}
