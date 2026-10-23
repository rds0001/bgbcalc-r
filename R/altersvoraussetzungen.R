.vollendete_jahre <- function(geburtsdatum, stichtag, stichtag_parameter = "stichtag") {
  geburt <- .datum(geburtsdatum, "geburtsdatum")
  tag <- .datum(stichtag, stichtag_parameter)
  if (tag < geburt) .fehler(stichtag_parameter, "Stichtag darf nicht vor der Geburt liegen.")
  geburt_iso <- .iso(geburt)
  tag_iso <- .iso(tag)
  as.integer(substr(tag_iso, 1, 4)) - as.integer(substr(geburt_iso, 1, 4)) -
    as.integer(substr(tag_iso, 6, 10) < substr(geburt_iso, 6, 10))
}

geschaeftsfaehigkeit_altersvoraussetzungen <- function(geburtsdatum = NULL, stichtag = NULL) {
  alter <- .vollendete_jahre(geburtsdatum, stichtag)
  eingaben <- list(geburtsdatum = geburtsdatum, stichtag = stichtag)
  wert <- list(vollendete_lebensjahre = alter, unter_sieben = alter < 7,
    minderjaehrig_ab_sieben = alter >= 7 && alter < 18, volljaehrig = alter >= 18)
  ergebnis <- .ergebnis(wert, "lebensjahre_und_wahrheitswerte",
    "BGB_GESCHAEFTSFAEHIGKEIT_ALTERSVORAUSSETZUNGEN", eingaben, list(list(
      operation = "Vollendetes Lebensalter mit sieben und achtzehn Jahren vergleichen",
      ergebnis = wert)), eingaben)
  ergebnis$annahmen <- list("Feste lokale BGB-Fassung; Geburtsdatum und Stichtag ausdr\u00fccklich vorgegeben.")
  ergebnis$hinweise <- list(
    "Nur Altersvoraussetzungen; volljaehrig ist keine Best\u00e4tigung uneingeschr\u00e4nkter Gesch\u00e4ftsf\u00e4higkeit.",
    "\u00a7 104 Nummer 2, Zust\u00e4nde nach \u00a7 105 Absatz 2 sowie die Regeln der \u00a7\u00a7 107 bis 113 sind gesondert.",
    "Keine Entscheidung \u00fcber die Wirksamkeit einer konkreten Willenserkl\u00e4rung.")
  ergebnis
}

delikt_altersvoraussetzungen <- function(geburtsdatum = NULL, handlungstag = NULL,
    unfallprivileg_sachlich_anwendbar = NULL, verletzung_vorsaetzlich = NULL,
    erforderliche_einsicht_vorhanden = NULL) {
  alter <- .vollendete_jahre(geburtsdatum, handlungstag, "handlungstag")
  eingaben <- list(geburtsdatum = geburtsdatum, handlungstag = handlungstag,
    unfallprivileg_sachlich_anwendbar = unfallprivileg_sachlich_anwendbar,
    verletzung_vorsaetzlich = verletzung_vorsaetzlich,
    erforderliche_einsicht_vorhanden = erforderliche_einsicht_vorhanden)
  for (name in c("unfallprivileg_sachlich_anwendbar", "verletzung_vorsaetzlich",
      "erforderliche_einsicht_vorhanden")) .wahrheitswert(eingaben[[name]], name)
  erster <- alter < 7
  zweiter <- alter >= 7 && alter < 10 && unfallprivileg_sachlich_anwendbar && !verletzung_vorsaetzlich
  dritter <- !(erster || zweiter) && alter < 18 && !erforderliche_einsicht_vorhanden
  wert <- list(vollendete_lebensjahre = alter,
    ausschluss_nach_absatz_1 = erster, ausschluss_nach_absatz_2 = zweiter,
    ausschluss_nach_absatz_3 = dritter,
    verantwortlichkeit_nach_828_ausgeschlossen = erster || zweiter || dritter)
  ergebnis <- .ergebnis(wert, "lebensjahre_und_wahrheitswerte",
    "BGB_DELIKT_ALTERSVORAUSSETZUNGEN", eingaben, list(list(
      operation = "Altersausschluss, Unfallprivileg und subsidi\u00e4re Einsichtsausnahme nach \u00a7 828",
      ergebnis = wert)), eingaben)
  ergebnis$annahmen <- list(
    "Feste lokale BGB-Fassung; sachliche Anwendbarkeit des Unfallprivilegs, Vorsatz und erforderliche Einsicht ausdr\u00fccklich bewertet.")
  ergebnis$hinweise <- list(
    "FALSE beim Gesamtausschluss begr\u00fcndet keine Haftung; andere Voraussetzungen und Ausschl\u00fcsse bleiben zu pr\u00fcfen.",
    "Unfallprivileg ist eine rechtlich bewertete Nutzervorgabe, keine automatische Einordnung jedes Unfalls mit einem Fahrzeug.",
    "Vorsatz hebt nur den Ausschluss des Absatzes 2 auf; Absatz 3 ist anschlie\u00dfend gesondert zu pr\u00fcfen.",
    "Keine automatische Feststellung von Einsicht, Vorsatz, Aufsichtspflichtverletzung oder Billigkeitshaftung nach \u00a7 829.")
  ergebnis
}
