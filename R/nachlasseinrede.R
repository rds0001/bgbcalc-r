nachlass_dreimonatseinrede <- function(annahme_erbschaft_am = NULL, nachlasspflegerbestellung_am = NULL,
    inventarerrichtung_am = NULL, prueftag = NULL, erbe_haftet_unbeschraenkt = NULL,
    glaeubiger_nach_2016_ausgenommen = NULL, einordnungsnachweis = NULL) {
  tag <- .datum(prueftag, "prueftag")
  annahme <- if (!is.null(annahme_erbschaft_am)) .datum(annahme_erbschaft_am, "annahme_erbschaft_am") else NULL
  pfleger <- if (!is.null(nachlasspflegerbestellung_am)) .datum(nachlasspflegerbestellung_am, "nachlasspflegerbestellung_am") else NULL
  if (is.null(annahme) && is.null(pfleger))
    .fehler("annahme_erbschaft_am", "Annahme oder vorherige Bestellung eines Verwaltungspflegers erforderlich.", "EINGABE_FEHLT")
  ereignisse <- list(annahme_erbschaft_am = annahme, nachlasspflegerbestellung_am = pfleger)
  for (name in names(ereignisse)) {
    datum <- ereignisse[[name]]
    if (!is.null(datum) && datum > tag)
      .fehler(name, "Eingetragenes Ereignis darf nicht nach dem Pr\u00fcftag liegen; noch nicht eingetretenes Ereignis als NULL angeben.")
  }
  beginn <- if (is.null(annahme)) pfleger else if (is.null(pfleger)) annahme else min(annahme, pfleger)
  ende <- .frist(.iso(beginn), 3, "monate", "ereignis")
  inventar <- NULL
  if (!is.null(inventarerrichtung_am)) {
    inventar <- .datum(inventarerrichtung_am, "inventarerrichtung_am")
    if (inventar > tag) .fehler("inventarerrichtung_am", "Inventarerrichtung darf nicht nach dem Pr\u00fcftag liegen.")
  }
  .wahrheitswert(erbe_haftet_unbeschraenkt, "erbe_haftet_unbeschraenkt")
  .wahrheitswert(glaeubiger_nach_2016_ausgenommen, "glaeubiger_nach_2016_ausgenommen")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(annahme_erbschaft_am = annahme_erbschaft_am, nachlasspflegerbestellung_am = nachlasspflegerbestellung_am,
    inventarerrichtung_am = inventarerrichtung_am, prueftag = prueftag,
    erbe_haftet_unbeschraenkt = erbe_haftet_unbeschraenkt,
    glaeubiger_nach_2016_ausgenommen = glaeubiger_nach_2016_ausgenommen, einordnungsnachweis = einordnungsnachweis)
  wert <- list(fristbeginnereignis_am = .iso(beginn), dreimonatsfristende = .iso(ende),
    inventar_beendet_einrede = !is.null(inventar),
    verweigerungsrecht_am_prueftag = tag <= ende && is.null(inventar) && !erbe_haftet_unbeschraenkt && !glaeubiger_nach_2016_ausgenommen)
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_NACHLASS_DREIMONATSEINREDE", eingaben,
    list(list(operation = "Drei Monate ab Annahme beziehungsweise fr\u00fcherer Verwaltungspflegerbestellung; Inventarerrichtung und gesetzliche Haftungs-/Gl\u00e4ubigerausnahmen schlie\u00dfen Einrede aus")), eingaben)
  ergebnis$annahmen <- list("Pr\u00fcfung zum Ende des Pr\u00fcftags; wirksame Annahme, Bestellung und Inventarerrichtung sowie Haftung/Gl\u00e4ubigereinordnung rechtlich bestimmt; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nachlasspflegerbestellung nur zur Verwaltung des Nachlasses im Sinne\u00a72017, nicht beliebige Betreuung oder sp\u00e4tere Beauftragung. Fr\u00fchere Bestellung startet Frist auch vor Annahme; sp\u00e4tere Bestellung startet keine neue Frist. NULL bei Annahme/Bestellung/Inventar bedeutet Ereignis bis Pr\u00fcftag nicht eingetreten, nicht unbekannt. Inventarerrichtung beendet Einrede bereits ab diesem Ereignis, nicht erst nach einem zus\u00e4tzlich gew\u00e4hrten Tag; taggenau zum Tagesende gepr\u00fcft. \u00a72016 Absatz2: Gl\u00e4ubigerausnahme\u00a71971 einschlie\u00dflich Einschr\u00e4nkung f\u00fcr erst nach Erbfall durch Vollstreckung/Arrest erworbene Rechte beziehungsweise einstweilig erworbene Vormerkung qualifizieren. Keine pauschale Gleichsetzung jedes gesicherten Gl\u00e4ubigers mit Ausnahme. FALSE betrifft nur\u00a72014, nicht andere Einreden oder die Anspruchsexistenz. Keine automatische Aus\u00fcbung der Einrede oder Fristverschiebung wegen Wochenende/Feiertag; keine drei Monate ab Erbfall ohne Annahme/Bestellung.")
  ergebnis
}
