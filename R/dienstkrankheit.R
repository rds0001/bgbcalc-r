dienst_krankenfuersorge_zeitraum <- function(erkrankungsbeginn_am = NULL, beginnart = NULL,
    dienstverhaeltnis_ende_am = NULL, dauerndes_hauptdienstverhaeltnis = NULL,
    in_haeusliche_gemeinschaft_aufgenommen = NULL, erkrankung_vorsaetzlich_oder_grob_fahrlaessig = NULL,
    versicherung_oder_oeffentliche_krankenpflege = NULL, krankheitskuendigung_626_durch_dienstberechtigten = NULL,
    einordnungsnachweis = NULL) {
  beginn <- .datum(erkrankungsbeginn_am, "erkrankungsbeginn_am")
  .auswahl(beginnart, "beginnart", c("ereignis", "tagesbeginn"))
  dienstende <- if (!is.null(dienstverhaeltnis_ende_am)) .datum(dienstverhaeltnis_ende_am, "dienstverhaeltnis_ende_am") else NULL
  if (!is.null(dienstende) && dienstende < beginn) .fehler("dienstverhaeltnis_ende_am", "Dienstende darf nicht vor hier betrachtetem Erkrankungsbeginn liegen.")
  eingaben <- list(erkrankungsbeginn_am = erkrankungsbeginn_am, beginnart = beginnart,
    dienstverhaeltnis_ende_am = dienstverhaeltnis_ende_am,
    dauerndes_hauptdienstverhaeltnis = dauerndes_hauptdienstverhaeltnis,
    in_haeusliche_gemeinschaft_aufgenommen = in_haeusliche_gemeinschaft_aufgenommen,
    erkrankung_vorsaetzlich_oder_grob_fahrlaessig = erkrankung_vorsaetzlich_oder_grob_fahrlaessig,
    versicherung_oder_oeffentliche_krankenpflege = versicherung_oder_oeffentliche_krankenpflege,
    krankheitskuendigung_626_durch_dienstberechtigten = krankheitskuendigung_626_durch_dienstberechtigten,
    einordnungsnachweis = einordnungsnachweis)
  for (name in names(eingaben)[4:8]) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  gilt <- dauerndes_hauptdienstverhaeltnis && in_haeusliche_gemeinschaft_aufgenommen &&
    !erkrankung_vorsaetzlich_oder_grob_fahrlaessig && !versicherung_oder_oeffentliche_krankenpflege
  wert <- NULL
  if (gilt) {
    sechswochen <- .frist(erkrankungsbeginn_am, 6, "wochen", beginnart)
    ende <- if (!is.null(dienstende) && !krankheitskuendigung_626_durch_dienstberechtigten) min(sechswochen, dienstende) else sechswochen
    wert <- list(sechswochengrenze = .iso(sechswochen), fuersorge_spaetestens_bis = .iso(ende))
  }
  ergebnis <- .ergebnis(wert, "fristdaten", "BGB_DIENST_KRANKENFUERSORGE_ZEITRAUM", eingaben,
    list(list(operation = "Qualifizierte Krankenf\u00fcrsorge h\u00f6chstens sechs Wochen; fr\u00fcheres Dienstende begrenzt, au\u00dfer krankheitsbedingter K\u00fcndigung durch Dienstberechtigten nach\u00a7626")), eingaben)
  ergebnis$status <- if (gilt) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Dauerndes Dienstverh\u00e4ltnis, h\u00e4usliche Aufnahme und konkrete Erkrankung rechtlich eingeordnet; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur zeitliche H\u00f6chstgrenze erforderlicher Verpflegung/\u00e4rztlicher Behandlung; fr\u00fchere Genesung oder Wegfall der Erforderlichkeit begrenzt tats\u00e4chliche F\u00fcrsorge. Keine allgemeine Entgeltfortzahlung und kein unbegrenzter Verg\u00fctungsanspruch. Ausnahme vom Dienstende nur bei gerade wegen Erkrankung vom Dienstberechtigten erkl\u00e4rter\u00a7626-K\u00fcndigung. Vorsorge durch Versicherung/\u00f6ffentliche Krankenpflege muss gerade Verpflegung und Behandlung abdecken. Keine automatische Kalenderverl\u00e4ngerung der tats\u00e4chlichen F\u00fcrsorgedauer; keine Addition mehrerer Krankheitsf\u00e4lle ohne rechtliche Pr\u00fcfung.")
  ergebnis
}
dienst_krankheitskosten_anrechnung <- function(verguetung_erkrankungszeit = NULL, anrechenbare_fuersorgekosten = NULL,
    kostenanrechnung_nach_617_zulaessig = NULL, anrechnung_ausgeuebt = NULL, kostennachweis = NULL) {
  verguetung <- .geld(verguetung_erkrankungszeit)
  kosten <- .geld(anrechenbare_fuersorgekosten)
  .wahrheitswert(kostenanrechnung_nach_617_zulaessig, "kostenanrechnung_nach_617_zulaessig")
  .wahrheitswert(anrechnung_ausgeuebt, "anrechnung_ausgeuebt")
  .text(kostennachweis, "kostennachweis")
  eingaben <- list(verguetung_erkrankungszeit = verguetung_erkrankungszeit,
    anrechenbare_fuersorgekosten = anrechenbare_fuersorgekosten,
    kostenanrechnung_nach_617_zulaessig = kostenanrechnung_nach_617_zulaessig,
    anrechnung_ausgeuebt = anrechnung_ausgeuebt, kostennachweis = kostennachweis)
  ergebnis <- .geld_ergebnis(NULL, "BGB_DIENST_KRANKHEITSKOSTEN_ANRECHNUNG", eingaben,
    list(list(operation = "Bei zul\u00e4ssiger ausge\u00fcbter Anrechnung geringeren Betrag aus Periodenverg\u00fctung und qualifizierten F\u00fcrsorgekosten abziehen")))
  if (kostenanrechnung_nach_617_zulaessig) {
    anrechnung <- if (anrechnung_ausgeuebt) {if (.vergleichen(verguetung, kosten) < 0) verguetung else kosten} else .bruch(0, 1)
    ergebnis$wert <- list(angerechnete_kosten = .bruchteile(anrechnung),
      verbleibende_verguetung = .bruchteile(.subtrahieren(verguetung, anrechnung)))
    ergebnis$status <- "BERECHNET"
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Verg\u00fctung und Kosten m\u00fcssen denselben rechtlich zugeh\u00f6rigen Erkrankungszeitraum betreffen, ohne Doppelanrechnung und mit konsistenter Brutto-/Nettobasis. Kosten gesetzlich erforderlicher Verpflegung/Behandlung vorab bestimmen; keine beliebige Pauschale und keine Anrechnung von bereits durch Versicherung gedeckten Kosten. Anrechnung kann erfolgen, ist keine automatische Lohnk\u00fcrzung. Keine negative Verg\u00fctung oder automatische weitere Erstattungspflicht aus \u00fcbersteigenden Kosten ableiten; etwaige andere Rechtsgrundlagen bleiben gesondert."))
  ergebnis
}
