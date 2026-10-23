zinsscheine_zurueckbehaltungsbetrag <- function(
    zinsscheine = NULL, einloesung_der_hauptschuldverschreibung = NULL, einordnungsnachweis = NULL) {
  .vorhanden(zinsscheine, "zinsscheine")
  if (!is.list(zinsscheine) || !is.null(names(zinsscheine)) || length(zinsscheine) > 1000)
    .fehler("zinsscheine", "Liste mit h\u00f6chstens1000 eindeutig identifizierten Zinsscheinen erforderlich; leere Liste ist zul\u00e4ssig.")
  namen <- character()
  summe <- .bruch(0)
  for (schein in zinsscheine) {
    if (!is.list(schein) || !identical(sort(names(schein)), sort(c("schein_id", "zahlbetrag", "zurueckgegeben", "zahlungspflicht_nach_803_absatz_1"))))
      .fehler("zinsscheine", "Genau schein_id, zahlbetrag, zurueckgegeben und zahlungspflicht_nach_803_absatz_1 erforderlich.")
    name <- .text(schein$schein_id, "schein_id")
    if (name %in% namen) .fehler("schein_id", "Zinsschein darf nicht doppelt aufgef\u00fchrt werden.")
    namen <- c(namen, name)
    betrag <- .geld(schein$zahlbetrag)
    zurueck <- .wahrheitswert(schein$zurueckgegeben, "zurueckgegeben")
    pflicht <- .wahrheitswert(schein$zahlungspflicht_nach_803_absatz_1, "zahlungspflicht_nach_803_absatz_1")
    if (!zurueck && pflicht) summe <- .addieren(summe, betrag)
  }
  .wahrheitswert(einloesung_der_hauptschuldverschreibung, "einloesung_der_hauptschuldverschreibung")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(zinsscheine = zinsscheine, einloesung_der_hauptschuldverschreibung = einloesung_der_hauptschuldverschreibung,
    einordnungsnachweis = einordnungsnachweis)
  ergebnis <- .geld_ergebnis(if (einloesung_der_hauptschuldverschreibung) summe else NULL,
    "BGB_ZINSSCHEINE_ZURUECKBEHALTUNGSBETRAG", eingaben,
    list(list(operation = "Zahlbetr\u00e4ge nicht zur\u00fcckgegebener Zinsscheine mit fortbestehender Zahlungspflicht nach\u00a7803 Absatz1 addieren")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur Zinsscheine zu dieser einzul\u00f6senden Inhaberschuldverschreibung; keine Vermischung mit Renten-/Gewinnanteilscheinen oder fremden Haupturkunden. Zahlungspflicht nach Absatz1 rechtlich vorgeben, einschlie\u00dflich entgegenstehender Scheinbestimmungen und sonstiger Einwendungen; Erl\u00f6schen der Hauptforderung oder \u00c4nderung der Verzinsung allein l\u00e4sst Zinsscheine nicht automatisch entfallen. Zahlbetrag ist tats\u00e4chlich geschuldeter Betrag, nicht erfundener Abzinsungs- oder Risikowert. R\u00fcckbehaltungsberechtigung wird nicht automatisch ausge\u00fcbt. Ergebnis ist die Summe der einschl\u00e4gigen Scheinbetr\u00e4ge, kein negativer Auszahlungsbetrag, keine zus\u00e4tzliche Zahlungspflicht des Einl\u00f6senden und keine automatische endg\u00fcltige K\u00fcrzung der Hauptforderung. Leere oder vollst\u00e4ndig ausgeschlossene Liste ergibt null EUR."))
  ergebnis
}
