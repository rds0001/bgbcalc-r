schenkung_widerrufsausschluss <- function(kenntnis_widerrufsvoraussetzungen_am = NULL,
    massgebliches_jahresfristende = NULL, widerrufserklaerung_am = NULL,
    schenker_hat_verziehen = NULL, beschenkter_bereits_verstorben = NULL,
    pflicht_oder_anstandsschenkung = NULL, einordnungsnachweis = NULL) {
  .datum(kenntnis_widerrufsvoraussetzungen_am, "kenntnis_widerrufsvoraussetzungen_am")
  ende <- .datum(massgebliches_jahresfristende, "massgebliches_jahresfristende")
  erklaerung <- .datum(widerrufserklaerung_am, "widerrufserklaerung_am")
  grundende <- .frist(kenntnis_widerrufsvoraussetzungen_am, 1, "jahre", "ereignis")
  if (ende < grundende) .fehler("massgebliches_jahresfristende", "Ma\u00dfgebliches Fristende darf die gesetzliche Jahresgrundfrist nicht verk\u00fcrzen.")
  eingaben <- list(kenntnis_widerrufsvoraussetzungen_am = kenntnis_widerrufsvoraussetzungen_am,
    massgebliches_jahresfristende = massgebliches_jahresfristende, widerrufserklaerung_am = widerrufserklaerung_am,
    schenker_hat_verziehen = schenker_hat_verziehen, beschenkter_bereits_verstorben = beschenkter_bereits_verstorben,
    pflicht_oder_anstandsschenkung = pflicht_oder_anstandsschenkung, einordnungsnachweis = einordnungsnachweis)
  for (name in names(eingaben)[4:6]) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  abgelaufen <- erklaerung > ende
  wert <- list(rechnerisches_jahresfristende = .iso(grundende), jahresfrist_ueberschritten = abgelaufen,
    widerruf_nach_532_oder_534_ausgeschlossen = abgelaufen || schenker_hat_verziehen ||
      beschenkter_bereits_verstorben || pflicht_oder_anstandsschenkung)
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_SCHENKUNG_WIDERRUFSAUSSCHLUSS", eingaben,
    list(list(operation = "Jahresfrist seit Kenntnis der Widerrufsvoraussetzungen und alternative Ausschl\u00fcsse Verzeihung, Beschenktentod, Pflicht-/Anstandsschenkung pr\u00fcfen")), eingaben)
  ergebnis$annahmen <- list("Konkrete Schenkung, Kenntnis des Widerrufsberechtigten, rechtlich ma\u00dfgeblicher Erkl\u00e4rungstag und Jahresfristkorrekturen vorgegeben; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur Ausschl\u00fcsse\u00a7\u00a7532/534. FALSE best\u00e4tigt keinen Widerruf: grober Undank und Erbenvoraussetzungen\u00a7530, Erkl\u00e4rung gegen\u00fcber Beschenktem\u00a7531, m\u00f6glicher Verzicht\u00a7533 und sonstige Voraussetzungen separat. Kenntnis der Voraussetzungen des Rechts, nicht automatisch Tag der Schenkung oder ersten blo\u00dfen Verdachts. Ma\u00dfgebliches Jahresende nur mit rechtlich zul\u00e4ssigen belegten Kalenderkorrekturen, keine frei w\u00e4hlbare Verl\u00e4ngerung. Verzeihung durch Schenker und Tod des Beschenkten zum ma\u00dfgeblichen Erkl\u00e4rungszeitpunkt ausdr\u00fccklich einordnen; nicht den Tod des Schenkers an dessen Stelle setzen. Taggenaues Modell, untert\u00e4gige Reihenfolge rechtlich vorab pr\u00fcfen.")
  ergebnis
}
