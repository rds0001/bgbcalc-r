nachlass_dreissigster_zeitraum <- function(
    erbfall_am = NULL, prueftag = NULL, familienangehoeriger = NULL,
    hausstandszugehoerigkeit_bei_erbfall = NULL, unterhalt_vom_erblasser_bezogen = NULL,
    abweichende_letztwillige_anordnung = NULL, einordnungsnachweis = NULL) {
  erbfall <- .datum(erbfall_am, "erbfall_am")
  tag <- .datum(prueftag, "prueftag")
  if (tag < erbfall) .fehler("prueftag", "Pr\u00fcftag darf nicht vor dem Erbfall liegen.")
  eingaben <- list(erbfall_am = erbfall_am, prueftag = prueftag,
    familienangehoeriger = familienangehoeriger,
    hausstandszugehoerigkeit_bei_erbfall = hausstandszugehoerigkeit_bei_erbfall,
    unterhalt_vom_erblasser_bezogen = unterhalt_vom_erblasser_bezogen,
    abweichende_letztwillige_anordnung = abweichende_letztwillige_anordnung,
    einordnungsnachweis = einordnungsnachweis)
  for (name in names(eingaben)[3:6]) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  beginn <- .tage_addieren(erbfall, 1)
  ende <- .frist(erbfall_am, 30, "tage", "ereignis")
  person <- familienangehoeriger && hausstandszugehoerigkeit_bei_erbfall && unterhalt_vom_erblasser_bezogen
  wert <- if (abweichende_letztwillige_anordnung) NULL else list(
    zeitraumbeginn = .iso(beginn), zeitraumende = .iso(ende),
    persoenliche_voraussetzungen_erfuellt = person,
    prueftag_im_zeitraum = beginn <= tag && tag <= ende,
    gesetzliche_zeit_und_personenvoraussetzungen_erfuellt = person && beginn <= tag && tag <= ende)
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_NACHLASS_DREISSIGSTER_ZEITRAUM", eingaben,
    list(list(operation = "Erbfalltag ausschlie\u00dfen; folgende 30 Kalendertage einschlie\u00dflich Endtag; Familienzugeh\u00f6rigkeit, Hausstand und Unterhaltsbezug kumulativ pr\u00fcfen")), eingaben)
  ergebnis$annahmen <- list("Familienzugeh\u00f6rigkeit, Hausstand im Todeszeitpunkt, Unterhaltsbezug und letztwillige Anordnungen rechtlich qualifiziert; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur gesetzlicher Zeitraum und pers\u00f6nliche Voraussetzungen nach\u00a71969 Absatz1; keine abschlie\u00dfende Anspruchspr\u00fcfung. Abweichende letztwillige Anordnung ergibt NICHT_ANWENDBAR, nicht automatisch Anspruchsausschluss: Inhalt individuell auslegen. Unterhalt im bisherigen Umfang sowie Benutzung der Wohnung und Haushaltsgegenst\u00e4nde nicht in erfundene Tagesbetr\u00e4ge umrechnen. Entsprechende Anwendung der Verm\u00e4chtnisvorschriften nach Absatz2 einschlie\u00dflich Einwendungen und Haftungsbeschr\u00e4nkungen gesondert pr\u00fcfen. Keine automatische Verl\u00e4ngerung des Versorgungszeitraums wegen Wochenende/Feiertag. Der Erbfalltag selbst z\u00e4hlt nicht zu den folgenden 30 Tagen.")
  ergebnis$status <- if (abweichende_letztwillige_anordnung) "NICHT_ANWENDBAR" else "BERECHNET"
  ergebnis
}
