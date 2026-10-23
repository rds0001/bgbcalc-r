.schuldrechtzeitgrenzen <- list(
  zahlungsvereinbarung_271a_absatz_1 = list(60, "tage"),
  oeffentliche_zahlung_271a_absatz_2_nummer_1 = list(30, "tage"),
  oeffentliche_zahlung_271a_absatz_2_nummer_2 = list(60, "tage"),
  abnahme_271a_absatz_3 = list(30, "tage"),
  agb_zahlung_308_nummer_1a = list(30, "tage"),
  agb_abnahme_308_nummer_1b = list(15, "tage"),
  agb_preiserhoehung_309_nummer_1 = list(4, "monate"),
  agb_laufzeit_309_nummer_9a = list(2, "jahre"),
  agb_verlaengerungskuendigung_309_nummer_9b = list(1, "monate"),
  finanzvorgaenge_312_absatz_5 = list(1, "jahre"),
  leistungsbestimmung_anfechtung_318_absatz_2 = list(30, "jahre"))
schuldrechtliche_zeitgrenze <- function(regelfall = NULL, anfangstag = NULL, beginnart = NULL,
    vergleichstag = NULL, gesetzliche_zeitgrenze_anwendbar = NULL, einordnungsnachweis = NULL) {
  .auswahl(regelfall, "regelfall", names(.schuldrechtzeitgrenzen))
  anfang <- .datum(anfangstag, "anfangstag")
  .auswahl(beginnart, "beginnart", c("ereignis", "tagesbeginn"))
  vergleich <- .datum(vergleichstag, "vergleichstag")
  if (vergleich < anfang) .fehler("vergleichstag", "Vergleichstag darf nicht vor dem Anfangstag liegen.")
  .wahrheitswert(gesetzliche_zeitgrenze_anwendbar, "gesetzliche_zeitgrenze_anwendbar")
  .text(einordnungsnachweis, "einordnungsnachweis")
  dauer <- .schuldrechtzeitgrenzen[[regelfall]]
  grenze <- .frist(anfangstag, dauer[[1]], dauer[[2]], beginnart)
  eingaben <- list(regelfall = regelfall, anfangstag = anfangstag, beginnart = beginnart,
    vergleichstag = vergleichstag, gesetzliche_zeitgrenze_anwendbar = gesetzliche_zeitgrenze_anwendbar,
    einordnungsnachweis = einordnungsnachweis)
  wert <- if (gesetzliche_zeitgrenze_anwendbar) list(grenztag = .iso(grenze),
    abstand_zur_grenze_tage = as.integer(vergleich - grenze), zeitgrenze_ueberschritten = vergleich > grenze) else NULL
  ergebnis <- .ergebnis(wert, "datum_tage_und_wahrheitswert", "BGB_SCHULDRECHTLICHE_ZEITGRENZE", eingaben,
    list(list(operation = "F\u00fcr den gew\u00e4hlten Normfall gesetzliche Dauer ab qualifiziertem Beginn berechnen; Vergleichstag minus Grenztag in Kalendertagen")), eingaben)
  ergebnis$status <- if (gesetzliche_zeitgrenze_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Qualifizierter Anwendungsfall und Beginn; reine unver\u00e4nderte Zeitgrenze der lokalen BGB-Fassung.")
  ergebnis$hinweise <- list("Kein abschlie\u00dfendes Urteil zur Klauselwirksamkeit, Angemessenheit, Anfechtung oder Informationspflicht. Genau am Grenztag ist die Grenze nicht \u00fcberschritten. Anwendungsbereich, Beginnart, Beweisvermutungen und gesetzliche Ausnahmen anhand des Fachvertrags vorgeben. Kalenderkorrekturen, Hemmung und abweichende Vereinbarungen sind nicht eingerechnet; bei erforderlicher Korrektur diesen Standardfall nicht verwenden.")
  ergebnis
}

digitale_produkte_verjaehrungsgrundfrist <- function(bereitstellung_am = NULL, bereitstellungsende_am = NULL,
    aktualisierungsende_am = NULL, mangel_gezeigt_am = NULL, unveraenderter_anwendungsfall = NULL,
    einordnungsnachweis = NULL) {
  beginn <- .datum(bereitstellung_am, "bereitstellung_am")
  daten <- list(bereitstellungsende_am = bereitstellungsende_am, aktualisierungsende_am = aktualisierungsende_am, mangel_gezeigt_am = mangel_gezeigt_am)
  for (name in names(daten)) {
    datum <- if (!is.null(daten[[name]])) .datum(daten[[name]], name) else NULL
    if (!is.null(datum) && datum < beginn) .fehler(name, "Datum darf nicht vor der Bereitstellung liegen.")
  }
  .wahrheitswert(unveraenderter_anwendungsfall, "unveraenderter_anwendungsfall")
  .text(einordnungsnachweis, "einordnungsnachweis")
  grundende <- .frist(bereitstellung_am, 2, "jahre", "ereignis")
  dauerende <- if (!is.null(bereitstellungsende_am)) .frist(bereitstellungsende_am, 12, "monate", "ereignis") else NULL
  updateende <- if (!is.null(aktualisierungsende_am)) .frist(aktualisierungsende_am, 12, "monate", "ereignis") else NULL
  vor_mangel <- grundende
  if (!is.null(dauerende)) vor_mangel <- max(vor_mangel, dauerende)
  if (!is.null(updateende)) vor_mangel <- max(vor_mangel, updateende)
  mangel <- if (!is.null(mangel_gezeigt_am)) .datum(mangel_gezeigt_am, "mangel_gezeigt_am") else NULL
  mangelzeit <- if (!is.null(mangel) && mangel <= vor_mangel) .frist(mangel_gezeigt_am, 4, "monate", "ereignis") else NULL
  ende <- if (!is.null(mangelzeit)) max(vor_mangel, mangelzeit) else vor_mangel
  eingaben <- list(bereitstellung_am = bereitstellung_am, bereitstellungsende_am = bereitstellungsende_am,
    aktualisierungsende_am = aktualisierungsende_am, mangel_gezeigt_am = mangel_gezeigt_am,
    unveraenderter_anwendungsfall = unveraenderter_anwendungsfall, einordnungsnachweis = einordnungsnachweis)
  wert <- if (unveraenderter_anwendungsfall) list(zweijahresende = .iso(grundende),
    mindestende_dauerbereitstellung = if (!is.null(dauerende)) .iso(dauerende) else NULL,
    mindestende_aktualisierung = if (!is.null(updateende)) .iso(updateende) else NULL,
    ende_vor_mangelablaufhemmung = .iso(vor_mangel), mindestende_mangel = if (!is.null(mangelzeit)) .iso(mangelzeit) else NULL,
    verjaehrungsgrundfristende = .iso(ende)) else NULL
  ergebnis <- .ergebnis(wert, "daten", "BGB_DIGITALE_PRODUKTE_VERJAEHRUNGSGRUNDFRIST", eingaben,
    list(list(operation = "Maximum aus2 Jahren nach Bereitstellung und einschl\u00e4gigen12 Monaten nach Bereitstellungs-/Aktualisierungsende; rechtzeitig gezeigten Mangel mit4 Monaten Mindestablauf ber\u00fccksichtigen")), eingaben)
  ergebnis$status <- if (unveraenderter_anwendungsfall) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Qualifizierter Anspruch nach\u00a7327i Nummer1 oder3; keine sonstige Frist\u00e4nderung, feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Optionale Enddaten bedeuten bei NULL, dass der jeweilige Mindestablauf auf diesen Anspruch nicht anwendbar ist; unbekannte erforderliche Enddaten d\u00fcrfen nicht als NULL ersetzt werden. Aktualisierungsende nur bei Anspruch wegen Verletzung der Aktualisierungspflicht angeben. mangel_gezeigt_am ist erstmaliges Zeigen dieses Mangels; ein erst nach Fristende gezeigter Mangel verl\u00e4ngert nicht. Keine automatische Hemmung, Arglist-, \u00dcbergangs- oder Kalenderkorrektur; Rechte nach\u00a7327i Nummer2/\u00a7218 gesondert. Kein Erl\u00f6schen und keine automatische Einrede.")
  ergebnis
}
