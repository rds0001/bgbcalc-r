arbeitnehmerzahl_kuendigungsfrist <- function(beschaeftigte = NULL, bestandsnachweis = NULL) {
  .vorhanden(beschaeftigte, "beschaeftigte")
  if (!is.list(beschaeftigte) || !is.null(names(beschaeftigte)) || length(beschaeftigte) > 10000)
    .fehler("beschaeftigte", "Unbenannte Liste mit h\u00f6chstens10000 Personen erforderlich.")
  .text(bestandsnachweis, "bestandsnachweis")
  gewichte <- list()
  summe <- .bruch(0)
  for (person in beschaeftigte) {
    if (!is.list(person) || length(person) != 3 || is.null(names(person)) ||
        anyDuplicated(names(person)) || !setequal(names(person),
          c("wochenstunden", "teilzeitbeschaeftigt", "zur_berufsbildung_beschaeftigt")))
      .fehler("beschaeftigte", "Jede Person ben\u00f6tigt genau wochenstunden, teilzeitbeschaeftigt und zur_berufsbildung_beschaeftigt.")
    stunden <- .geld(person$wochenstunden)
    teilzeit <- .wahrheitswert(person$teilzeitbeschaeftigt, "teilzeitbeschaeftigt")
    ausbildung <- .wahrheitswert(person$zur_berufsbildung_beschaeftigt, "zur_berufsbildung_beschaeftigt")
    if (ausbildung) {
      gewicht <- .bruch(0)
    } else if (teilzeit && .vergleichen(stunden, .bruch(20)) <= 0) {
      gewicht <- .bruch(1, 2)
    } else if (teilzeit && .vergleichen(stunden, .bruch(30)) <= 0) {
      gewicht <- .bruch(3, 4)
    } else {
      gewicht <- .bruch(1)
    }
    gewichte[[length(gewichte) + 1]] <- .bruchteile(gewicht)
    summe <- .addieren(summe, gewicht)
  }
  wert <- list(gewichtete_arbeitnehmerzahl = .bruchteile(summe),
    hoechstens_zwanzig = .vergleichen(summe, .bruch(20)) <= 0, personengewichte = gewichte)
  eingaben <- list(beschaeftigte = beschaeftigte, bestandsnachweis = bestandsnachweis)
  ergebnis <- .ergebnis(wert, "gewichtete_personenzahl", "BGB_ARBEITNEHMERZAHL_KUENDIGUNGSFRIST",
    eingaben, list(list(operation = "Regelm\u00e4\u00dfigen Besch\u00e4ftigtenbestand ohne Berufsbildung und mit gesetzlicher Teilzeitgewichtung summieren")), eingaben)
  ergebnis$annahmen <- list("Regelm\u00e4\u00dfiger Arbeitnehmerbestand beim Arbeitgeber und Besch\u00e4ftigtenstatus rechtlich vorab bestimmt; keine blo\u00dfe ungepr\u00fcfte Tagesaufnahme.")
  ergebnis$hinweise <- list("Nur Z\u00e4hlregel\u00a7622 Absatz5. H\u00f6chstens20 Personen erlaubt nicht automatisch jede k\u00fcrzere Frist: wirksame einzelvertragliche Vereinbarung und mindestens vier Wochen bleiben gesondert zu pr\u00fcfen.",
    "Teilzeitstatus wird ausdr\u00fccklich eingegeben; Vollzeitkr\u00e4fte z\u00e4hlen auch bei branchen\u00fcblich kurzer Vollzeit jeweils1. Keine automatische \u00dcbernahme anderer arbeitsrechtlicher Schwellenwertregeln.")
  ergebnis
}
