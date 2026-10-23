entgeltforderung_dreissigtagefrist <- function(faelligkeit_am = NULL, bezugsereignis_am = NULL,
    bezugsart = NULL, dreissigtageregel_anwendbar = NULL, einordnungsnachweis = NULL) {
  faellig <- .datum(faelligkeit_am, "faelligkeit_am")
  bezug <- .datum(bezugsereignis_am, "bezugsereignis_am")
  .auswahl(bezugsart, "bezugsart", c("rechnungszugang", "gegenleistungsempfang_bei_unsicherem_zugang"))
  .wahrheitswert(dreissigtageregel_anwendbar, "dreissigtageregel_anwendbar")
  .text(einordnungsnachweis, "einordnungsnachweis")
  beginn <- max(faellig, bezug)
  ende <- .frist(.iso(beginn), 30, "tage", "ereignis")
  folgetag <- .tage_addieren(ende, 1)
  eingaben <- list(faelligkeit_am = faelligkeit_am, bezugsereignis_am = bezugsereignis_am,
    bezugsart = bezugsart, dreissigtageregel_anwendbar = dreissigtageregel_anwendbar, einordnungsnachweis = einordnungsnachweis)
  wert <- if (dreissigtageregel_anwendbar) list(massgeblicher_beginn = .iso(beginn), grundfristende = .iso(ende), tag_nach_grundfrist = .iso(folgetag)) else NULL
  ergebnis <- .ergebnis(wert, "daten", "BGB_ENTGELTFORDERUNG_DREISSIGTAGEFRIST", eingaben,
    list(list(operation = "Sp\u00e4teres Datum aus F\u00e4lligkeit und qualifiziertem Bezug w\u00e4hlen;30Kalendertage nach Ereignisbeginn und nachfolgenden Tag berechnen")), eingaben)
  ergebnis$status <- if (dreissigtageregel_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Qualifizierter Fall des\u00a7286 Absatz3; unver\u00e4nderte rechnerische Grundfrist der festen lokalen BGB-Fassung.")
  ergebnis$hinweise <- list("Rechnungszugang umfasst gleichwertige Zahlungsaufstellung. Bei Verbrauchern ist der besondere Hinweis auf die Folgen erforderlich. Ersatzankn\u00fcpfung an Gegenleistungsempfang gilt nur bei unsicherem Rechnungszugang und Nichtverbrauchern. Diese Voraussetzungen sind im Anwendungsnachweis zu best\u00e4tigen; die Fristberechnung entscheidet sie nicht selbst. Datum der F\u00e4lligkeit nicht durch Rechnungsdatum ersetzen. Tag nach Grundfrist ist kein abschlie\u00dfend festgestellter Verzugsbeginn: fr\u00fchere Verzugsgr\u00fcnde, Leistung, Vertretenm\u00fcssen, zul\u00e4ssige Kalenderkorrekturen und Vereinbarungen gesondert ber\u00fccksichtigen. Keine automatische Feiertagsverschiebung oder Verzinsung.")
  ergebnis
}
