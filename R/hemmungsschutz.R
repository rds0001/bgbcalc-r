.schutz_ergebnis <- function(wert, kennung, eingaben) {
  ergebnis <- .ergebnis(wert, "wahrheitswerte", kennung, eingaben,
    list(list(operation = "Gesetzliche Personenbeziehung und Alters- beziehungsweise Gemeinschaftsvoraussetzungen am Stichtag verkn\u00fcpfen")), eingaben)
  ergebnis$annahmen <- list("Anspruchsrichtung, Rechtsbeziehung und Tatsachen am Stichtag rechtlich bestimmt; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur Hemmungstatbestand am angegebenen Stichtag, keine Summe von Hemmungstagen und kein endg\u00fcltiger Verj\u00e4hrungstag. Andere Hemmungsgr\u00fcnde bleiben selbst bei negativem Ergebnis m\u00f6glich.", "Eine bereits vor Eintritt eines Hemmungsgrundes abgelaufene Verj\u00e4hrung wird nicht wiederbelebt. Rechtliche Fristlage und \u00c4nderungen w\u00e4hrend des gesamten Zeitraums gesondert pr\u00fcfen.")
  ergebnis
}
verjaehrung_familienhemmung <- function(beziehungsart = NULL,
    rechtsbeziehung_besteht = NULL, stichtag = NULL, geburtsdatum_kind = NULL,
    einordnungsnachweis = NULL) {
  .auswahl(beziehungsart, "beziehungsart", c("ehegatten", "lebenspartner", "kind_eltern",
    "kind_partner_elternteil", "vormund_muendel", "betreuer_betreuter",
    "pfleger_pflegling", "kind_gegen_beistand"))
  .wahrheitswert(rechtsbeziehung_besteht, "rechtsbeziehung_besteht")
  tag <- .datum(stichtag, "stichtag")
  altersfall <- beziehungsart %in% c("kind_eltern", "kind_partner_elternteil")
  geburt <- NULL
  if (!is.null(geburtsdatum_kind) || altersfall) {
    geburt <- .datum(geburtsdatum_kind, "geburtsdatum_kind")
    if (geburt > tag) .fehler("geburtsdatum_kind", "Geburt darf nicht nach dem Stichtag liegen.")
  }
  .text(einordnungsnachweis, "einordnungsnachweis")
  altersvoraussetzung <- TRUE
  if (altersfall) {
    altersvoraussetzung <- tag < .datum(lebensalter_beginn(geburtsdatum_kind, 21)$wert, "altersgrenze")
  }
  eingaben <- list(beziehungsart = beziehungsart, rechtsbeziehung_besteht = rechtsbeziehung_besteht,
    stichtag = stichtag, geburtsdatum_kind = geburtsdatum_kind, einordnungsnachweis = einordnungsnachweis)
  wert <- list(altersbegrenzung_anwendbar = altersfall,
    altersvoraussetzung_erfuellt = altersvoraussetzung,
    hemmungstatbestand_am_stichtag = rechtsbeziehung_besteht && altersvoraussetzung)
  .schutz_ergebnis(wert, "BGB_VERJAEHRUNG_FAMILIENHEMMUNG", eingaben)
}
verjaehrung_sexuelle_selbstbestimmung_hemmung <- function(geburtsdatum = NULL,
    stichtag = NULL, anspruch_wegen_sexueller_selbstbestimmung = NULL,
    gemeinschaft_bei_verjaehrungsbeginn = NULL, gemeinschaft_ununterbrochen_bis_stichtag = NULL,
    einordnungsnachweis = NULL) {
  geburt <- .datum(geburtsdatum, "geburtsdatum")
  tag <- .datum(stichtag, "stichtag")
  if (geburt > tag) .fehler("geburtsdatum", "Geburt darf nicht nach dem Stichtag liegen.")
  for (name in c("anspruch_wegen_sexueller_selbstbestimmung", "gemeinschaft_bei_verjaehrungsbeginn",
      "gemeinschaft_ununterbrochen_bis_stichtag")) .wahrheitswert(get(name), name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  jung <- tag < .datum(lebensalter_beginn(geburtsdatum, 21)$wert, "altersgrenze")
  gemeinschaft <- gemeinschaft_bei_verjaehrungsbeginn && gemeinschaft_ununterbrochen_bis_stichtag
  eingaben <- list(geburtsdatum = geburtsdatum, stichtag = stichtag,
    anspruch_wegen_sexueller_selbstbestimmung = anspruch_wegen_sexueller_selbstbestimmung,
    gemeinschaft_bei_verjaehrungsbeginn = gemeinschaft_bei_verjaehrungsbeginn,
    gemeinschaft_ununterbrochen_bis_stichtag = gemeinschaft_ununterbrochen_bis_stichtag,
    einordnungsnachweis = einordnungsnachweis)
  wert <- list(altershemmung = anspruch_wegen_sexueller_selbstbestimmung && jung,
    gemeinschaftshemmung = anspruch_wegen_sexueller_selbstbestimmung && gemeinschaft,
    hemmungstatbestand_am_stichtag = anspruch_wegen_sexueller_selbstbestimmung && (jung || gemeinschaft))
  .schutz_ergebnis(wert, "BGB_VERJAEHRUNG_SEXUELLE_SELBSTBESTIMMUNG_HEMMUNG", eingaben)
}
