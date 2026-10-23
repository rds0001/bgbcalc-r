verbraucher_informierte_nebenkosten <- function(kostenpositionen = NULL, regelfall = NULL,
    kostenregel_anwendbar = NULL, einordnungsnachweis = NULL) {
  .auswahl(regelfall, "regelfall", c("praesenz_312a_absatz_2", "fernabsatz_aussergeschaeftlich_312e"))
  .vorhanden(kostenpositionen, "kostenpositionen")
  if (!is.list(kostenpositionen) || !is.null(names(kostenpositionen)) || length(kostenpositionen) > 1000)
    .fehler("kostenpositionen", "Liste mit h\u00f6chstens1000 Kostenpositionen erforderlich.")
  namen <- character()
  summe <- .bruch(0)
  for (position in kostenpositionen) {
    if (!is.list(position) || length(position) != 3 || !setequal(names(position), c("position_id", "betrag", "ordnungsgemaess_informiert")))
      .fehler("kostenpositionen", "Genau position_id, betrag und ordnungsgemaess_informiert erforderlich.")
    name <- .text(position$position_id, "position_id")
    if (name %in% namen) .fehler("position_id", "Kostenposition darf nicht doppelt aufgef\u00fchrt werden.")
    namen <- c(namen, name)
    betrag <- .geld(position$betrag)
    informiert <- .wahrheitswert(position$ordnungsgemaess_informiert, "ordnungsgemaess_informiert")
    if (informiert) summe <- .addieren(summe, betrag)
  }
  .wahrheitswert(kostenregel_anwendbar, "kostenregel_anwendbar")
  .text(einordnungsnachweis, "einordnungsnachweis")
  eingaben <- list(kostenpositionen = kostenpositionen, regelfall = regelfall, kostenregel_anwendbar = kostenregel_anwendbar, einordnungsnachweis = einordnungsnachweis)
  ergebnis <- .geld_ergebnis(if (kostenregel_anwendbar) summe else NULL, "BGB_VERBRAUCHER_INFORMIERTE_NEBENKOSTEN", eingaben,
    list(list(operation = "Rechtlich zugeh\u00f6rige Kostenpositionen mit ordnungsgem\u00e4\u00dfer Information ausw\u00e4hlen und addieren")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur Fracht-, Liefer-, Versand- und sonstige Kosten der gew\u00e4hlten Norm. Vereinbarung, H\u00f6he, Verbrauchervertragsbereich und Informationsanforderungen nach einschl\u00e4gigem EGBGB-Verweis vorab qualifizieren.312a Absatz2 gilt nicht f\u00fcr Fernabsatz, au\u00dferhalb von Gesch\u00e4ftsr\u00e4umen oder Finanzdienstleistungen. Teilweise informierte Positionen rechtlich zutreffend aufteilen, nicht volle Position freigeben. Hauptpreis und zus\u00e4tzliche Entgeltgrenzen werden nicht berechnet. Leere Liste ergibt null EUR."))
  ergebnis
}
verbraucher_entgeltkostenvergleich <- function(vereinbartes_entgelt = NULL, massgebliche_kosten = NULL,
    regelfall = NULL, vergleich_anwendbar = NULL, einordnungsnachweis = NULL) {
  entgelt <- .geld(vereinbartes_entgelt)
  kosten <- .geld(massgebliche_kosten)
  .auswahl(regelfall, "regelfall", c("zahlungsmittel_312a_absatz_4", "vertragsanruf_312a_absatz_5"))
  .wahrheitswert(vergleich_anwendbar, "vergleich_anwendbar")
  .text(einordnungsnachweis, "einordnungsnachweis")
  ueberhang <- .subtrahieren(entgelt, kosten)
  if (ueberhang$zaehler < 0) ueberhang <- .bruch(0)
  eingaben <- list(vereinbartes_entgelt = vereinbartes_entgelt, massgebliche_kosten = massgebliche_kosten,
    regelfall = regelfall, vergleich_anwendbar = vergleich_anwendbar, einordnungsnachweis = einordnungsnachweis)
  wert <- if (vergleich_anwendbar) list(kostenobergrenze = .bruchteile(kosten), entgeltueberhang = .bruchteile(ueberhang), kostengrenze_ueberschritten = .vergleichen(entgelt, kosten) > 0) else NULL
  ergebnis <- .ergebnis(wert, "EUR_und_wahrheitswert", "BGB_VERBRAUCHER_ENTGELTKOSTENVERGLEICH", eingaben,
    list(list(operation = "Vereinbartes Entgelt minus ma\u00dfgebliche Kosten, mindestens null; strikte \u00dcberschreitung vergleichen")), eingaben)
  ergebnis$status <- if (vergleich_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Qualifiziertes Verbraucherentgelt und einschl\u00e4gige tats\u00e4chliche Kostenbasis, feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Zahlungsmittel: Kosten des Unternehmers durch die konkrete Nutzung; unabh\u00e4ngig davon muss eine g\u00e4ngige zumutbare unentgeltliche Zahlungsm\u00f6glichkeit bestehen, und weitere Entgeltverbote etwa\u00a7270a bleiben unber\u00fchrt. Vertragsanruf: Entgelt f\u00fcr blo\u00dfe Nutzung des Telekommunikationsdienstes, nicht Zusatzverg\u00fctung des Unternehmers. Das Ergebnis ist KEIN auf die Obergrenze reduzierter Zahlungsanspruch: Eine \u00fcberschreitende Vereinbarung ist nach der jeweiligen Norm unwirksam. Beim Vertragsanruf sieht Absatz5 zudem einen Anspruch des Telekommunikationsanbieters gegen den Unternehmer vor; kein solcher Anspruch wird hier automatisch festgestellt.")
  ergebnis
}
