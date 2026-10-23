verbraucher_betragsschwelle <- function(schwellenfall = NULL, massgeblicher_betrag = NULL, einordnungsnachweis = NULL) {
  faelle <- list(
    sofortgeschaeft_kleinbetrag = list(40, "hoechstens", "\u00a7312 Absatz2 Nummer12: Entgelt im qualifizierten sofort erf\u00fcllten und bezahlten Au\u00dfergesch\u00e4ftsraumvertrag; nur Betragsmerkmal."),
    einwendungsdurchgriff_mindestentgelt = list(200, "mindestens", "\u00a7359 Absatz2: finanziertes Entgelt mindestens200Euro vermeidet nur diesen Kleinbetragsausschluss; andere Ausschl\u00fcsse und Voraussetzungen separat."),
    allgemeindarlehen_kleinbetrag = list(200, "weniger_als", "\u00a7491 Absatz2 Satz2 Nummer1: Nettodarlehensbetrag unter200Euro; kein allgemeiner Ausschluss aller Verbraucherschutzrechte."),
    existenzgruendung_hoechstbetrag = list(75000, "hoechstens", "\u00a7513: Nettodarlehensbetrag oder Barzahlungspreis bis75000Euro; Existenzgr\u00fcndungszweck/nat\u00fcrliche Person und EU-Ausnahme separat qualifizieren."),
    fehlende_sicherheitenangabe_ausnahme = list(75000, "mehr_als", "\u00a7494 Absatz6 Satz2: Allgemein-Verbraucherdarlehen mit Nettodarlehensbetrag \u00fcber75000Euro; nur Betragsmerkmal der Ausnahme bei fehlender Sicherheitenangabe."))
  faelle[["reisesicherung_alternative_absicherung_umsatz"]] <- list(10000000,"weniger_als","\u00a7651rII2: qualifizierter Umsatz im letzten abgeschlossenen Gesch\u00e4ftsjahr strikt unter10MillionenEUR; nur Zahlenvoraussetzung der alternativen Absicherung im folgenden Gesch\u00e4ftsjahr. Umsatzbegriff nachReisesicherungsfondsgesetz vorqualifiziert. Keine automatische Zul\u00e4ssigkeit eines Versicherers/Kreditinstituts.")
  faelle[["reisesicherung_einstandshoechstbetrag_umsatz"]] <- list(3000000,"weniger_als","\u00a7651rIII3: qualifizierter Vorjahresumsatz strikt unter3MillionenEUR; nur Umsatzmerkmal einer zul\u00e4ssigen vereinbarten1Million-EUR-Grenze je Insolvenz bei Versicherer/Kreditinstitut. Kein automatischer Deckel oder Schadensbetrag; Reisesicherungsfonds und weitere Voraussetzungen gesondert.")
  .auswahl(schwellenfall, "schwellenfall", names(faelle))
  betrag <- .geld(massgeblicher_betrag)
  .text(einordnungsnachweis, "einordnungsnachweis")
  fall <- faelle[[schwellenfall]]
  grenze <- .bruch(fall[[1]])
  richtung <- fall[[2]]
  vergleich <- .vergleichen(betrag, grenze)
  erfuellt <- switch(richtung, hoechstens=vergleich <= 0, mindestens=vergleich >= 0, weniger_als=vergleich < 0, mehr_als=vergleich > 0)
  eingaben <- list(schwellenfall=schwellenfall, massgeblicher_betrag=massgeblicher_betrag, einordnungsnachweis=einordnungsnachweis)
  ergebnis <- .ergebnis(list(gesetzlicher_grenzbetrag=.bruchteile(grenze), vergleichsrichtung=richtung, betragsmerkmal_erfuellt=erfuellt), "eur_und_wahrheitswert", "BGB_VERBRAUCHER_BETRAGSSCHWELLE", eingaben,
    list(list(operation="Exakten ma\u00dfgeblichen EUR-Betrag mit gesetzlicher Schwelle und ausdr\u00fccklich fallbezogener Vergleichsrichtung vergleichen")), eingaben)
  ergebnis$annahmen <- list("Anwendungsbereich und ma\u00dfgebliche gesetzliche Bezugsgr\u00f6\u00dfe einschlie\u00dflich gegebenenfalls qualifiziertem Vorjahresumsatz rechtlich bestimmt; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur numerische Teilpr\u00fcfung; kein vollst\u00e4ndiger Verbrauchervertrags-/Darlehens-/Einwendungs- oder Sicherheitenentscheid. Kein automatischer Anspruch auf den Grenzbetrag und keine Rundung vor dem Vergleich. Unterschiedliche gesetzliche Bezugsgr\u00f6\u00dfen nicht durch Bruttozahlung oder Restschuld ersetzen.", fall[[3]])
  ergebnis
}
