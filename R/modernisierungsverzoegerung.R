.verzoegerungs_ergebnis <- function(wert, kennung, eingaben, operation) {
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", kennung, eingaben,
    list(list(operation = operation)), eingaben)
  ergebnis$annahmen <- list("Sachlicher und zeitlicher Anwendungsbereich\u00a7559d und rechtlich ma\u00dfgebliche Zeitpunkte vorgegeben; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur zeitlicher Vermutungstatbestand; nachvollziehbarer objektiver Grund und weitere Tatbest\u00e4nde separat mit modernisierung_pflichtverletzungsvermutung pr\u00fcfen. Keine automatische Pflichtverletzungs- oder Schadensersatzentscheidung. Keine automatische Feiertagsverschiebung des tats\u00e4chlichen Beginns oder Ruhens; untert\u00e4gige Grenzf\u00e4lle gesondert rechtlich einordnen.")
  ergebnis
}
modernisierung_beginnverzoegerung <- function(ankuendigungszugang_am = NULL,
    angekuendigter_beginn_am = NULL, tatsaechlicher_beginn_am = NULL, prueftag = NULL, zeitnachweis = NULL) {
  zugang <- .datum(ankuendigungszugang_am, "ankuendigungszugang_am")
  angekuendigt <- if (!is.null(angekuendigter_beginn_am)) .datum(angekuendigter_beginn_am, "angekuendigter_beginn_am") else NULL
  tatsaechlich <- if (!is.null(tatsaechlicher_beginn_am)) .datum(tatsaechlicher_beginn_am, "tatsaechlicher_beginn_am") else NULL
  tag <- .datum(prueftag, "prueftag")
  .text(zeitnachweis, "zeitnachweis")
  if (tag < zugang) .fehler("prueftag", "Pr\u00fcftag darf nicht vor Ank\u00fcndigungszugang liegen.")
  if (!is.null(tatsaechlich) && tatsaechlich > tag) .fehler("tatsaechlicher_beginn_am", "Tats\u00e4chlicher Beginn darf nicht erst nach dem Pr\u00fcftag liegen.")
  basis <- if (!is.null(angekuendigt)) angekuendigt else zugang
  ende <- .frist(.iso(basis), 12, "monate", "ereignis")
  verzoegert <- if (!is.null(tatsaechlich)) tatsaechlich > ende else tag > ende
  eingaben <- list(ankuendigungszugang_am = ankuendigungszugang_am,
    angekuendigter_beginn_am = angekuendigter_beginn_am, tatsaechlicher_beginn_am = tatsaechlicher_beginn_am,
    prueftag = prueftag, zeitnachweis = zeitnachweis)
  wert <- list(anknuepfung_am = .iso(basis), zwoelfmonatsgrenze = .iso(ende),
    beginnverzoegerung_nummer_1 = verzoegert)
  .verzoegerungs_ergebnis(wert, "BGB_MODERNISIERUNG_BEGINNVERZOEGERUNG", eingaben,
    "Angek\u00fcndigten Beginn vorrangig, nur bei fehlender Angabe Ank\u00fcndigungszugang verwenden; tats\u00e4chlichen Beginn oder Pr\u00fcftag mit Zw\u00f6lfmonatsgrenze vergleichen")
}
modernisierung_arbeitsruhe <- function(ruhebeginn_am = NULL, beginnart = NULL,
    wiederaufnahme_am = NULL, prueftag = NULL, zeitnachweis = NULL) {
  ruhe <- .datum(ruhebeginn_am, "ruhebeginn_am")
  .auswahl(beginnart, "beginnart", c("ereignis", "tagesbeginn"))
  wieder <- if (!is.null(wiederaufnahme_am)) .datum(wiederaufnahme_am, "wiederaufnahme_am") else NULL
  tag <- .datum(prueftag, "prueftag")
  .text(zeitnachweis, "zeitnachweis")
  if (tag < ruhe) .fehler("prueftag", "Pr\u00fcftag darf nicht vor Beginn der Arbeitsruhe liegen.")
  if (!is.null(wieder) && (wieder < ruhe || wieder > tag)) .fehler("wiederaufnahme_am", "Wiederaufnahme muss zwischen Ruhebeginn und Pr\u00fcftag liegen.")
  grenze <- .frist(ruhebeginn_am, 12, "monate", beginnart)
  letzter_ruhetag <- if (!is.null(wieder)) .tage_addieren(wieder, -1) else tag
  wert <- list(zwoelfmonatsgrenze = .iso(grenze), letzter_beruecksichtigter_ruhetag = .iso(letzter_ruhetag),
    arbeitsruhe_nummer_4 = letzter_ruhetag > grenze)
  eingaben <- list(ruhebeginn_am = ruhebeginn_am, beginnart = beginnart,
    wiederaufnahme_am = wiederaufnahme_am, prueftag = prueftag, zeitnachweis = zeitnachweis)
  .verzoegerungs_ergebnis(wert, "BGB_MODERNISIERUNG_ARBEITSRUHE", eingaben,
    "Ununterbrochene Arbeitsruhe bis Pr\u00fcftagsschluss oder Vortag tagbeginnlicher Wiederaufnahme; strikt mehr als zw\u00f6lf Monate verlangen")
}
