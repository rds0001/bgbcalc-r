regelverjaehrung_grundfrist <- function(entstehung_oder_zuwiderhandlung_am = NULL,
    kenntnis_oder_kennenmuessen_am = NULL,
    regelmaessiger_jahresschlussbeginn_anwendbar = NULL) {
  eingaben <- list(entstehung_oder_zuwiderhandlung_am = entstehung_oder_zuwiderhandlung_am,
    kenntnis_oder_kennenmuessen_am = kenntnis_oder_kennenmuessen_am,
    regelmaessiger_jahresschlussbeginn_anwendbar = regelmaessiger_jahresschlussbeginn_anwendbar)
  entstehung <- .datum(entstehung_oder_zuwiderhandlung_am, "entstehung_oder_zuwiderhandlung_am")
  kenntnis <- .datum(kenntnis_oder_kennenmuessen_am, "kenntnis_oder_kennenmuessen_am")
  .wahrheitswert(regelmaessiger_jahresschlussbeginn_anwendbar,
    "regelmaessiger_jahresschlussbeginn_anwendbar")
  wert <- NULL
  jahr <- max(as.numeric(format(entstehung, "%Y")), as.numeric(format(kenntnis, "%Y")))
  if (regelmaessiger_jahresschlussbeginn_anwendbar) {
    beginn <- as.Date(sprintf("%04d-12-31", as.integer(jahr)))
    ende <- .monatsende(beginn, 36, FALSE)
    wert <- list(beginn_mit_jahresschluss = .iso(beginn),
      rechnerischer_letzter_tag = .iso(ende))
  }
  ergebnis <- .ergebnis(wert, "datum", "BGB_REGELVERJAEHRUNG_GRUNDFRIST", eingaben,
    list(
      list(operation = "Sp\u00e4teres Jahr der beiden gesetzlichen Voraussetzungen", jahr = jahr),
      list(operation = "Jahresschluss und unmodifizierte Dreijahresfrist", ergebnis = wert)),
    eingaben)
  ergebnis$status <- if (regelmaessiger_jahresschlussbeginn_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list(
    "Feste lokale BGB-Fassung; Anspruchsentstehung oder Zuwiderhandlung und Kenntnis oder Kennenm\u00fcssen rechtlich vorgegeben.")
  ergebnis$hinweise <- list(
    "Beide Ergebnisdaten bezeichnen den Tagesschluss; kein abschlie\u00dfender Verj\u00e4hrungstag.",
    "H\u00f6chstfristen, Hemmung, Ablaufhemmung, Neubeginn, Sonderregeln und eine gegebenenfalls erforderliche Werktagsverschiebung sind nicht eingerechnet.")
  ergebnis
}
