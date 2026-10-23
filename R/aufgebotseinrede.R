nachlass_aufgebotseinrede <- function(annahme_erbschaft_am = NULL, nachlasspflegerbestellung_am = NULL,
    aufgebotsantrag_am = NULL, massgebliches_jahresfristende = NULL, antrag_zugelassen = NULL,
    verfahrensbeendigung_am = NULL, prueftag = NULL, erbe_haftet_unbeschraenkt = NULL,
    glaeubiger_nach_2016_ausgenommen = NULL, einordnungsnachweis = NULL) {
  tag <- .datum(prueftag, "prueftag")
  annahme <- if (!is.null(annahme_erbschaft_am)) .datum(annahme_erbschaft_am, "annahme_erbschaft_am") else NULL
  pfleger <- if (!is.null(nachlasspflegerbestellung_am)) .datum(nachlasspflegerbestellung_am, "nachlasspflegerbestellung_am") else NULL
  if (is.null(annahme) && is.null(pfleger))
    .fehler("annahme_erbschaft_am", "Annahme oder vorherige Bestellung eines Verwaltungspflegers erforderlich.", "EINGABE_FEHLT")
  antrag <- .datum(aufgebotsantrag_am, "aufgebotsantrag_am")
  ende <- .datum(massgebliches_jahresfristende, "massgebliches_jahresfristende")
  beendet <- if (!is.null(verfahrensbeendigung_am)) .datum(verfahrensbeendigung_am, "verfahrensbeendigung_am") else NULL
  ereignisse <- list(annahme_erbschaft_am = annahme, nachlasspflegerbestellung_am = pfleger,
    aufgebotsantrag_am = antrag, verfahrensbeendigung_am = beendet)
  for (name in names(ereignisse)) {
    datum <- ereignisse[[name]]
    if (!is.null(datum) && datum > tag) .fehler(name, "Eingetragenes tats\u00e4chliches Ereignis darf nicht nach dem Pr\u00fcftag liegen.")
  }
  if (!is.null(beendet) && beendet < antrag)
    .fehler("verfahrensbeendigung_am", "Beendigung desselben Verfahrens darf nicht vor seinem Antrag liegen.")
  beginn <- if (is.null(annahme)) pfleger else if (is.null(pfleger)) annahme else min(annahme, pfleger)
  grundende <- .frist(.iso(beginn), 1, "jahre", "ereignis")
  if (ende < grundende) .fehler("massgebliches_jahresfristende", "Ma\u00dfgebliches Jahresfristende darf die Grundfrist nicht verk\u00fcrzen.")
  eingaben <- list(annahme_erbschaft_am = annahme_erbschaft_am, nachlasspflegerbestellung_am = nachlasspflegerbestellung_am,
    aufgebotsantrag_am = aufgebotsantrag_am, massgebliches_jahresfristende = massgebliches_jahresfristende,
    antrag_zugelassen = antrag_zugelassen, verfahrensbeendigung_am = verfahrensbeendigung_am, prueftag = prueftag,
    erbe_haftet_unbeschraenkt = erbe_haftet_unbeschraenkt,
    glaeubiger_nach_2016_ausgenommen = glaeubiger_nach_2016_ausgenommen, einordnungsnachweis = einordnungsnachweis)
  for (name in c("antrag_zugelassen", "erbe_haftet_unbeschraenkt", "glaeubiger_nach_2016_ausgenommen"))
    .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  wert <- NULL
  if (antrag >= beginn) {
    rechtzeitig <- antrag <= ende
    wert <- list(fristbeginnereignis_am = .iso(beginn), rechnerisches_jahresfristende = .iso(grundende),
      aufgebotsantrag_rechtzeitig = rechtzeitig, verfahren_beendet = !is.null(beendet),
      verweigerungsrecht_am_prueftag = rechtzeitig && antrag_zugelassen && is.null(beendet) &&
        !erbe_haftet_unbeschraenkt && !glaeubiger_nach_2016_ausgenommen)
  }
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_NACHLASS_AUFGEBOTSEINREDE", eingaben,
    list(list(operation = "Jahresfrist ab Annahme oder fr\u00fcherer Verwaltungspflegerbestellung f\u00fcr Antrag; bei Zulassung bis Verfahrensbeendigung unter gesetzlichen Ausschl\u00fcssen verweigern")), eingaben)
  ergebnis$status <- if (!is.null(wert)) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Tats\u00e4chliche Ereignisse bis Pr\u00fcftag, rechtliche Verfahrensbeendigung und Gl\u00e4ubiger-/Haftungslage qualifiziert; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Jahresfrist betrifft Antragstellung, nicht Zulassung oder Ende des Verfahrens; die Einrede kann bei rechtzeitigem Antrag \u00fcber das Jahr hinaus dauern. Bei Ausschlie\u00dfungsbeschluss oder Zur\u00fcckweisung gilt nach\u00a72015 Absatz3 erst Rechtskraft als Beendigung, nicht blo\u00dfer Erlass. verfahrensbeendigung_am muss diese rechtlich bestimmte Grenze enthalten; NULL bedeutet bis Pr\u00fcftag nicht beendet, auch wenn ein noch nicht rechtskr\u00e4ftiger Beschluss vorliegt. Zulassung ist zum Pr\u00fcftag zu beurteilen. Fr\u00fchere Bestellung eines Pflegers zur Nachlassverwaltung nach\u00a72017 verschiebt den Start vor Annahme, sp\u00e4tere Bestellung startet kein neues Jahr. Antr\u00e4ge vor dem hier bestimmten Fristbeginn sind in diesem Modell gesondert offen und ergeben NICHT_ANWENDBAR, keine Aussage ihrer Unwirksamkeit. Ma\u00dfgebliches Jahresende nur mit rechtlich zul\u00e4ssigen belegten Korrekturen, nicht frei verl\u00e4ngern. \u00a72016 Absatz2/\u00a71971 samt Einschr\u00e4nkung f\u00fcr erst nach Erbfall erworbene Vollstreckungs-/Arrestrechte und einstweilige Vormerkung qualifizieren. FALSE betrifft nur diese Einrede; keine automatische Aus\u00fcbung und keine umfassende Forderungspr\u00fcfung.")
  ergebnis
}
