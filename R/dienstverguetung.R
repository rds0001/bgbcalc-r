dienstverguetung_annahmeverzug <- function(vereinbarte_verguetung = NULL,
    ersparte_aufwendungen = NULL, anderweitiger_erwerb = NULL, boeswillig_unterlassener_erwerb = NULL,
    annahmeverzug = NULL, arbeitgeber_traegt_arbeitsausfallrisiko = NULL, bewertungsnachweis = NULL) {
  verguetung <- .geld(vereinbarte_verguetung)
  ersparnis <- .geld(ersparte_aufwendungen)
  erwerb <- .geld(anderweitiger_erwerb)
  unterlassen <- .geld(boeswillig_unterlassener_erwerb)
  .wahrheitswert(annahmeverzug, "annahmeverzug")
  .wahrheitswert(arbeitgeber_traegt_arbeitsausfallrisiko, "arbeitgeber_traegt_arbeitsausfallrisiko")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(vereinbarte_verguetung = vereinbarte_verguetung, ersparte_aufwendungen = ersparte_aufwendungen,
    anderweitiger_erwerb = anderweitiger_erwerb, boeswillig_unterlassener_erwerb = boeswillig_unterlassener_erwerb,
    annahmeverzug = annahmeverzug, arbeitgeber_traegt_arbeitsausfallrisiko = arbeitgeber_traegt_arbeitsausfallrisiko,
    bewertungsnachweis = bewertungsnachweis)
  wert <- NULL
  if (annahmeverzug || arbeitgeber_traegt_arbeitsausfallrisiko) {
    abzug <- .addieren(.addieren(ersparnis, erwerb), unterlassen)
    wert <- if (.vergleichen(verguetung, abzug) > 0) .subtrahieren(verguetung, abzug) else .bruch(0)
  }
  ergebnis <- .geld_ergebnis(wert, "BGB_DIENSTVERGUETUNG_ANNAHMEVERZUG", eingaben,
    list(list(operation = "Annahmeverzug oder Arbeitgeber-Arbeitsausfallrisiko; Verg\u00fctung um gesetzlich anrechenbare Ersparnis und Erwerbswerte vermindern, mindestens null")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur\u00a7615 im rechtlich einschl\u00e4gigen Fall; keine automatische Annahmeverzugs-/Risikobewertung. Abz\u00fcge m\u00fcssen infolge desselben Dienstausfalls und f\u00fcr denselben Verg\u00fctungszeitraum anrechenbar sein, keine Doppelz\u00e4hlung. Brutto-/Nettobez\u00fcge rechtlich konsistent bestimmen. Keine automatische Arbeitssuchpflicht oder Sch\u00e4tzung b\u00f6swillig unterlassenen Erwerbs. Keine Nachleistungspflicht nach\u00a7615 Satz1; andere Anspruchsgrundlagen und Sondergesetze gesondert."))
  ergebnis
}
dienstverguetung_persoenliche_verhinderung <- function(vereinbarte_verguetung = NULL,
    gesetzliche_kranken_unfallversicherungsleistung = NULL, grund_in_der_person = NULL,
    ohne_verschulden = NULL, zeit_verhaeltnismaessig_nicht_erheblich = NULL,
    regel_616_anwendbar = NULL, bewertungsnachweis = NULL) {
  verguetung <- .geld(vereinbarte_verguetung)
  versicherung <- .geld(gesetzliche_kranken_unfallversicherungsleistung)
  eingaben <- list(vereinbarte_verguetung = vereinbarte_verguetung,
    gesetzliche_kranken_unfallversicherungsleistung = gesetzliche_kranken_unfallversicherungsleistung,
    grund_in_der_person = grund_in_der_person, ohne_verschulden = ohne_verschulden,
    zeit_verhaeltnismaessig_nicht_erheblich = zeit_verhaeltnismaessig_nicht_erheblich,
    regel_616_anwendbar = regel_616_anwendbar, bewertungsnachweis = bewertungsnachweis)
  for (name in names(eingaben)[3:6]) .wahrheitswert(eingaben[[name]], name)
  .text(bewertungsnachweis, "bewertungsnachweis")
  gilt <- regel_616_anwendbar && grund_in_der_person && ohne_verschulden && zeit_verhaeltnismaessig_nicht_erheblich
  wert <- if (!gilt) NULL else if (.vergleichen(verguetung, versicherung) > 0) .subtrahieren(verguetung, versicherung) else .bruch(0)
  ergebnis <- .geld_ergebnis(wert, "BGB_DIENSTVERGUETUNG_PERSOENLICHE_VERHINDERUNG", eingaben,
    list(list(operation = "Pers\u00f6nlichen Grund, fehlendes Verschulden und rechtlich unerhebliche Dauer pr\u00fcfen; qualifizierte Kranken-/Unfallversicherungsleistung abziehen")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Keine feste Tageszahl f\u00fcr verh\u00e4ltnism\u00e4\u00dfig nicht erhebliche Zeit erfunden; rechtliche Einordnung des gesamten Verhinderungsfalls erforderlich. Nicht einen unzul\u00e4ssig abgeschnittenen kurzen Teil einer insgesamt erheblichen Verhinderung einsetzen. Nur auf gesetzlicher Verpflichtung beruhende Kranken-/Unfallversicherung f\u00fcr dieselbe Verhinderungszeit anrechnen. Vertrags-/Tarifausschluss und Sondergesetze vorab pr\u00fcfen. NICHT_ANWENDBAR schlie\u00dft andere Verg\u00fctungsanspr\u00fcche nicht aus."))
  ergebnis
}
