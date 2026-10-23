dienst_langzeitkuendigungsrahmen <- function(dienstbeginn_am = NULL, beginnart = NULL,
    lebenszeitvereinbarung = NULL, vereinbartes_dienstende_am = NULL, kuendigungszugang_am = NULL,
    kuendigung_durch_dienstverpflichteten = NULL, regel_624_anwendbar = NULL, einordnungsnachweis = NULL) {
  beginn <- .datum(dienstbeginn_am, "dienstbeginn_am")
  .auswahl(beginnart, "beginnart", c("ereignis", "tagesbeginn"))
  .wahrheitswert(lebenszeitvereinbarung, "lebenszeitvereinbarung")
  ende <- NULL
  if (!is.null(vereinbartes_dienstende_am) || !lebenszeitvereinbarung) ende <- .datum(vereinbartes_dienstende_am, "vereinbartes_dienstende_am")
  zugang <- .datum(kuendigungszugang_am, "kuendigungszugang_am")
  if (zugang < beginn) .fehler("kuendigungszugang_am", "K\u00fcndigungszugang darf nicht vor dem hier betrachteten Dienstbeginn liegen.")
  if (!is.null(ende) && ende < beginn) .fehler("vereinbartes_dienstende_am", "Vereinbartes Ende darf nicht vor Dienstbeginn liegen.")
  .wahrheitswert(kuendigung_durch_dienstverpflichteten, "kuendigung_durch_dienstverpflichteten")
  .wahrheitswert(regel_624_anwendbar, "regel_624_anwendbar")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(dienstbeginn_am = dienstbeginn_am, beginnart = beginnart,
    lebenszeitvereinbarung = lebenszeitvereinbarung, vereinbartes_dienstende_am = vereinbartes_dienstende_am,
    kuendigungszugang_am = kuendigungszugang_am,
    kuendigung_durch_dienstverpflichteten = kuendigung_durch_dienstverpflichteten,
    regel_624_anwendbar = regel_624_anwendbar, einordnungsnachweis = einordnungsnachweis)
  wert <- NULL
  if (regel_624_anwendbar) {
    fuenfjahre <- .frist(dienstbeginn_am, 5, "jahre", beginnart)
    fruehestens <- .tage_addieren(fuenfjahre, 1)
    lange_bindung <- lebenszeitvereinbarung || ende > fuenfjahre
    noch_laufend <- lebenszeitvereinbarung || zugang <= ende
    moeglich <- lange_bindung && noch_laufend && zugang >= fruehestens && kuendigung_durch_dienstverpflichteten
    kuendigungsende <- if (moeglich) .frist(kuendigungszugang_am, 6, "monate", "ereignis") else NULL
    wert <- list(fuenfjahreszeitraum_ende = .iso(fuenfjahre), fruehester_kuendigungstag = .iso(fruehestens),
      lange_bindung_erfuellt = lange_bindung, kuendigung_nach_624_zeitlich_moeglich = moeglich,
      rechnerisches_kuendigungsfristende = if (!is.null(kuendigungsende)) .iso(kuendigungsende) else NULL)
  }
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_DIENST_LANGZEITKUENDIGUNGSRAHMEN", eingaben,
    list(list(operation = "Lebenszeit oder strikt l\u00e4ngere Bindung als f\u00fcnf Jahre; Zugang durch Dienstverpflichteten erst nach F\u00fcnfjahresablauf und w\u00e4hrend laufender Bindung, anschlie\u00dfend sechs Monate")), eingaben)
  ergebnis$status <- if (regel_624_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Konkreter langfristiger Dienstvertrag, rechtlicher Beginn und vereinbarte Bindung vorgegeben; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Recht des Dienstverpflichteten, nicht automatisch des Dienstberechtigten. Genau f\u00fcnfj\u00e4hrige Bindung gen\u00fcgt nicht. K\u00fcndigungszugang vor Ablauf der f\u00fcnf Jahre nicht automatisch auf fr\u00fchesten Termin verschieben. Rechnerische Sechsmonatsfrist ist kein Aufschub eines ohnehin fr\u00fcher eintretenden vereinbarten Vertragsendes. Bei Lebenszeitvereinbarung ist ein optionales Kalenderende f\u00fcr diese Pr\u00fcfung ohne Wirkung; tats\u00e4chliches Lebenszeitende oder andere Beendigung vorab gesondert pr\u00fcfen. Besondere Schutz-/Tarif-/Vertragsregeln, Erkl\u00e4rung und Zugang sowie weitere Wirksamkeitsvoraussetzungen gesondert; keine automatische Werktagsverschiebung einer K\u00fcndigungsfrist.")
  ergebnis
}
