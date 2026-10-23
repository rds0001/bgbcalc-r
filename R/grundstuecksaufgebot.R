grundstuecksaufgebot_voraussetzungen <- function(
    eigenbesitzbeginn_am = NULL, prueftag = NULL, einfacher_eigenbesitzzeitraum = NULL,
    eigentuemer_im_grundbuch_eingetragen = NULL, eigentuemer_gestorben_oder_verschollen = NULL,
    letzte_zustimmungsbeduerftige_eintragung_am = NULL, einordnungsnachweis = NULL) {
  beginn <- .datum(eigenbesitzbeginn_am, "eigenbesitzbeginn_am")
  tag <- .datum(prueftag, "prueftag")
  if (beginn > tag) .fehler("eigenbesitzbeginn_am", "Eigenbesitzbeginn darf nicht nach dem Pr\u00fcftag liegen.")
  eintragung <- if (!is.null(letzte_zustimmungsbeduerftige_eintragung_am)) .datum(letzte_zustimmungsbeduerftige_eintragung_am, "letzte_zustimmungsbeduerftige_eintragung_am") else NULL
  if (!is.null(eintragung) && eintragung > tag) .fehler("letzte_zustimmungsbeduerftige_eintragung_am", "Letzte Eintragung darf nicht nach dem Pr\u00fcftag liegen.")
  eingaben <- list(eigenbesitzbeginn_am = eigenbesitzbeginn_am, prueftag = prueftag,
    einfacher_eigenbesitzzeitraum = einfacher_eigenbesitzzeitraum,
    eigentuemer_im_grundbuch_eingetragen = eigentuemer_im_grundbuch_eingetragen,
    eigentuemer_gestorben_oder_verschollen = eigentuemer_gestorben_oder_verschollen,
    letzte_zustimmungsbeduerftige_eintragung_am = letzte_zustimmungsbeduerftige_eintragung_am,
    einordnungsnachweis = einordnungsnachweis)
  for (name in names(eingaben)[3:5]) .wahrheitswert(eingaben[[name]], name)
  .text(einordnungsnachweis, "einordnungsnachweis")
  besitzende <- .frist(eigenbesitzbeginn_am, 30, "jahre", "ereignis")
  grundbuchende <- if (eigentuemer_im_grundbuch_eingetragen && !is.null(eintragung)) .frist(letzte_zustimmungsbeduerftige_eintragung_am, 30, "jahre", "ereignis") else NULL
  besitzzeit <- tag >= besitzende
  grundbuchruhe <- is.null(grundbuchende) || tag >= grundbuchende
  zusatz <- !eigentuemer_im_grundbuch_eingetragen || (eigentuemer_gestorben_oder_verschollen && grundbuchruhe)
  wert <- if (!einfacher_eigenbesitzzeitraum) NULL else list(
    eigenbesitz_dreissigjahresende = .iso(besitzende),
    grundbuchruhe_dreissigjahresende = if (!is.null(grundbuchende)) .iso(grundbuchende) else NULL,
    eigenbesitzzeit_erfuellt = besitzzeit,
    zusatzvoraussetzungen_eingetragener_eigentuemer_erfuellt = zusatz,
    zeit_und_statusvoraussetzungen_erfuellt = besitzzeit && zusatz)
  ergebnis <- .ergebnis(wert, "daten_und_wahrheitswerte", "BGB_GRUNDSTUECKSAUFGEBOT_VORAUSSETZUNGEN", eingaben,
    list(list(operation = "30 Jahre Eigenbesitz; bei eingetragenem Eigent\u00fcmer zus\u00e4tzlich Tod oder Verschollenheit und 30 Jahre ohne zustimmungsbed\u00fcrftige Eintragung")), eingaben)
  ergebnis$status <- if (einfacher_eigenbesitzzeitraum) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Pr\u00fcfung zum Ende des Pr\u00fcftags; Eigenbesitz eines anderen als des Eigent\u00fcmers und vollst\u00e4ndige relevante Grundbuchhistorie rechtlich qualifiziert; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Einfacher Eigenbesitzzeitraum bedeutet fortdauernder ungehemmter, ununterbrochener Eigenbesitz ohne anzurechnende Vorg\u00e4ngerzeit; andernfalls NICHT_ANWENDBAR und gesonderte Berechnung gem\u00e4\u00df\u00a7927 Absatz1 Satz2. NULL bei letzter zustimmungsbed\u00fcrftiger Eintragung bedeutet nach vollst\u00e4ndig gepr\u00fcfter Historie niemals eine solche Eintragung, nicht unbekannte Historie. Nur Eintragungen, die der Eigent\u00fcmerzustimmung bedurften; nicht jede Grundbuch\u00e4nderung. Ohne eingetragenen Eigent\u00fcmer greifen die zus\u00e4tzlichen Status-/Grundbuchruhevoraussetzungen nicht. Kein pauschales Erfordernis eines unbekannten Eigent\u00fcmers aus dem Gesetzeswortlaut abgeleitet. Keine gerichtliche Zul\u00e4ssigkeitsentscheidung oder Eigentums\u00fcbertragung: Absatz2 verlangt Ausschlie\u00dfungsbeschluss und anschlie\u00dfende eigene Eigent\u00fcmereintragung; Absatz3 sch\u00fctzt bestimmte vor Beschlusserlass eingetragene Drittrechte/Widerspr\u00fcche. Andere Verfahrenserfordernisse und Ersitzungsregeln separat. Keine automatische Feiertagsverschiebung.")
  ergebnis
}
