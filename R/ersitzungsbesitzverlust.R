ersitzung_besitzverlust_nichtunterbrechung <- function(
    eigenbesitzverlust_am = NULL, prueftag = NULL, massgebliches_jahresfristende = NULL,
    wiedererlangung_am = NULL, klageerhebung_am = NULL,
    eigenbesitz_ohne_willen_verloren = NULL, wiedererlangung_mittels_klage = NULL,
    einordnungsnachweis = NULL) {
  verlust <- .datum(eigenbesitzverlust_am, "eigenbesitzverlust_am")
  tag <- .datum(prueftag, "prueftag")
  if (tag < verlust) .fehler("prueftag", "Pr\u00fcftag darf nicht vor dem Eigenbesitzverlust liegen.")
  rohende <- .frist(eigenbesitzverlust_am, 1, "jahre", "ereignis")
  ende <- .datum(massgebliches_jahresfristende, "massgebliches_jahresfristende")
  if (ende < rohende) .fehler("massgebliches_jahresfristende", "Ma\u00dfgebliches Fristende darf nicht vor dem kalendarischen Jahresfristende liegen.")
  wieder <- if (!is.null(wiedererlangung_am)) .datum(wiedererlangung_am, "wiedererlangung_am") else NULL
  klage <- if (!is.null(klageerhebung_am)) .datum(klageerhebung_am, "klageerhebung_am") else NULL
  ereignisse <- list(wiedererlangung_am = wieder, klageerhebung_am = klage)
  for (name in names(ereignisse)) {
    datum <- ereignisse[[name]]
    if (!is.null(datum) && !(verlust <= datum && datum <= tag))
      .fehler(name, "Tats\u00e4chliches Ereignis muss zwischen Eigenbesitzverlust und Pr\u00fcftag liegen.")
  }
  .wahrheitswert(eigenbesitz_ohne_willen_verloren, "eigenbesitz_ohne_willen_verloren")
  .wahrheitswert(wiedererlangung_mittels_klage, "wiedererlangung_mittels_klage")
  .text(einordnungsnachweis, "einordnungsnachweis")
  if (wiedererlangung_mittels_klage) {
    if (is.null(wieder) || is.null(klage)) .fehler("wiedererlangung_mittels_klage", "Wiedererlangung mittels Klage erfordert tats\u00e4chliche Wiedererlangung und Klageerhebung.", "EINGABE_FEHLT")
    if (klage > wieder) .fehler("klageerhebung_am", "Urs\u00e4chliche Klage darf nicht erst nach der Wiedererlangung erhoben sein.")
  }
  direkt <- !is.null(wieder) && wieder <= ende
  klageweg <- wiedererlangung_mittels_klage && klage <= ende
  eingaben <- list(eigenbesitzverlust_am = eigenbesitzverlust_am, prueftag = prueftag,
    massgebliches_jahresfristende = massgebliches_jahresfristende,
    wiedererlangung_am = wiedererlangung_am, klageerhebung_am = klageerhebung_am,
    eigenbesitz_ohne_willen_verloren = eigenbesitz_ohne_willen_verloren,
    wiedererlangung_mittels_klage = wiedererlangung_mittels_klage, einordnungsnachweis = einordnungsnachweis)
  wert <- list(kalendarisches_jahresfristende = .iso(rohende),
    massgebliches_jahresfristende = .iso(ende), wiedererlangung_binnen_jahresfrist = direkt,
    wiedererlangung_durch_rechtzeitige_klage = klageweg,
    unterbrechung_gilt_als_nicht_erfolgt = eigenbesitz_ohne_willen_verloren && (direkt || klageweg))
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_ERSITZUNG_BESITZVERLUST_NICHTUNTERBRECHUNG", eingaben,
    list(list(operation = "Unfreiwilliger Eigenbesitzverlust; tats\u00e4chliche Wiedererlangung innerhalb Jahresfrist oder mittels innerhalb Jahresfrist erhobener Klage")), eingaben)
  ergebnis$annahmen <- list("Qualifizierter Verlust und Wiedererlangung gerade des Eigenbesitzes; ma\u00dfgebliches Fristende und wirksame Klageerhebung rechtlich bestimmt; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("NULL bei Wiedererlangung/Klage bedeutet bis Pr\u00fcftag nicht eingetreten, nicht unbekannt. Eine rechtzeitige Klage allein gen\u00fcgt nicht: Eigenbesitz muss mittels dieser Klage tats\u00e4chlich wiedererlangt sein; sp\u00e4tere Wiedererlangung kann das Ergebnis \u00e4ndern. Innerhalb der Jahresfrist gen\u00fcgt tats\u00e4chliche Wiedererlangung unabh\u00e4ngig vom Klageweg. Untert\u00e4gige Reihenfolge bei gleichem Datum rechtlich vorgeben. Ma\u00dfgebliches Jahresfristende separat begr\u00fcnden; ohne gesetzliche Korrektur kalendarisches Ende verwenden, keine pauschale Feiertagsverl\u00e4ngerung. Nur Nichtunterbrechung durch diesen Besitzverlust nach\u00a7940 Absatz2; andere Hemmungen\u00a7939, Vollstreckungsunterbrechung\u00a7941, Rechtsfolgen\u00a7942 und vollst\u00e4ndiger Eigentumserwerb\u00a7937 werden nicht berechnet.")
  ergebnis
}
