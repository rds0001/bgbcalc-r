nacherbeneinsetzung_dreissigjahresgrenze <- function(erbfall_am = NULL, prueftag = NULL,
    nacherbfall_am = NULL, fortgeltungsgrund = NULL, ereignistraeger_bei_erbfall_vorhanden = NULL,
    ereignistraeger_juristische_person = NULL, einordnungsnachweis = NULL) {
  erbfall <- .datum(erbfall_am, "erbfall_am")
  tag <- .datum(prueftag, "prueftag")
  if (tag < erbfall) .fehler("prueftag", "Pr\u00fcftag darf nicht vor Erbfall liegen.")
  ende <- .frist(erbfall_am, 30, "jahre", "ereignis")
  nacherbfall <- if (!is.null(nacherbfall_am)) .datum(nacherbfall_am, "nacherbfall_am") else NULL
  if (!is.null(nacherbfall) && !(erbfall <= nacherbfall && nacherbfall <= tag))
    .fehler("nacherbfall_am", "Nacherbfallereignis muss zwischen Erbfall und Pr\u00fcftag liegen.")
  .auswahl(fortgeltungsgrund, "fortgeltungsgrund", c("keiner", "personenereignis", "geschwistergeburt"))
  .wahrheitswert(ereignistraeger_bei_erbfall_vorhanden, "ereignistraeger_bei_erbfall_vorhanden")
  .wahrheitswert(ereignistraeger_juristische_person, "ereignistraeger_juristische_person")
  if (fortgeltungsgrund == "geschwistergeburt" && ereignistraeger_juristische_person)
    .fehler("ereignistraeger_juristische_person", "Qualifizierte Geschwistergeburt setzt eine nat\u00fcrliche Bezugsperson voraus.")
  .text(einordnungsnachweis, "einordnungsnachweis")
  ausnahme <- fortgeltungsgrund == "geschwistergeburt" || (fortgeltungsgrund == "personenereignis" &&
    ereignistraeger_bei_erbfall_vorhanden && !ereignistraeger_juristische_person)
  rechtzeitig <- !is.null(nacherbfall) && nacherbfall <= ende
  wert <- list(dreissigjahresfristende = .iso(ende), nacherbfall_bis_fristablauf = rechtzeitig,
    fortgeltungsausnahme = ausnahme, unwirksam_wegen_dreissigjahresgrenze = tag >= ende && !rechtzeitig && !ausnahme)
  eingaben <- list(erbfall_am = erbfall_am, prueftag = prueftag, nacherbfall_am = nacherbfall_am,
    fortgeltungsgrund = fortgeltungsgrund, ereignistraeger_bei_erbfall_vorhanden = ereignistraeger_bei_erbfall_vorhanden,
    ereignistraeger_juristische_person = ereignistraeger_juristische_person, einordnungsnachweis = einordnungsnachweis)
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_NACHERBENEINSETZUNG_DREISSIGJAHRESGRENZE", eingaben,
    list(list(operation = "Drei\u00dfig Jahre ab Erbfall; rechtzeitiges Nacherbfallereignis und gesetzliche Fortgeltungsausnahme pr\u00fcfen")), eingaben)
  ergebnis$annahmen <- list("Pr\u00fcfung nach vollst\u00e4ndigem Ablauf des Pr\u00fcftags; Ereignis im Laufe des letzten Fristtags liegt vor dessen Ablauf. Feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("FALSE bei Unwirksamkeit betrifft nur die Drei\u00dfigjahresgrenze, nicht die gesamte Wirksamkeit oder den tats\u00e4chlichen Erwerb. Ma\u00dfgebliches Nacherbfallereignis rechtlich aus Verf\u00fcgung und gegebenenfalls\u00a72106 bestimmen; NULL bedeutet bis Pr\u00fcftag nicht eingetreten, nicht unbekannt. Sp\u00e4tes Ereignis heilt keine bereits nach\u00a72109 unwirksame Einsetzung. personenereignis verlangt gerade ein angeordnetes Ereignis in der Person des Vor- oder Nacherben; eine bei Erbfall lebende andere Person gen\u00fcgt nicht. Bei juristischem Ereignistr\u00e4ger verbleibt es trotz bereits bestehender Rechtspers\u00f6nlichkeit bei drei\u00dfig Jahren. geschwistergeburt verlangt exakt die Bruder-/Schwester-Nacherbeinsetzung nach\u00a72109 Absatz1 Nummer2; keine zus\u00e4tzliche Voraussetzung, dass die Bezugsperson bei Erbfall schon lebte. Ereignistr\u00e4ger ist diese nat\u00fcrliche Bezugsperson, nicht irgendein anderer Beteiligter. Keine automatische Testamentsauslegung, Berechnung von Ersatznacherbfolge oder Wochenend-/Feiertagsverschiebung.")
  ergebnis
}
