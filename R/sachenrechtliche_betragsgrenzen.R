grundbuch_wertersatzgrenze <- function(wertersatz = NULL, eingetragener_hoechstbetrag = NULL, hoechstbetrag_wirksam_bestimmt = NULL, bewertungsnachweis = NULL) {
  ersatz <- .geld(wertersatz)
  grenze <- .geld(eingetragener_hoechstbetrag)
  .wahrheitswert(hoechstbetrag_wirksam_bestimmt, "hoechstbetrag_wirksam_bestimmt")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(wertersatz = wertersatz, eingetragener_hoechstbetrag = eingetragener_hoechstbetrag,
    hoechstbetrag_wirksam_bestimmt = hoechstbetrag_wirksam_bestimmt, bewertungsnachweis = bewertungsnachweis)
  wert <- if (hoechstbetrag_wirksam_bestimmt) { if (.vergleichen(ersatz, grenze) <= 0) ersatz else grenze } else NULL
  ergebnis <- .geld_ergebnis(wert, "BGB_GRUNDBUCH_WERTERSATZGRENZE", eingaben,
    list(list(operation = "Qualifizierten Wertersatz auf wirksam eingetragenen H\u00f6chstbetrag begrenzen")))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur Recht mit Wertersatz aus Versteigerungserl\u00f6s bei Erl\u00f6schen durch Zuschlag im Sinne\u00a7882. Wertersatz nach einschl\u00e4gigen Versteigerungsvorschriften ist qualifizierte Eingabe. Eingetragene Obergrenze schafft keinen Zahlungsanspruch in voller Grenzh\u00f6he. Kein Verteilungsplan und keine Berechnung der Erl\u00f6sdeckung oder Rangfolge."))
  ergebnis
}
hoechstbetragshypothek_forderung_und_zinsen <- function(hauptforderung = NULL, zinsen = NULL, eingetragener_hoechstbetrag = NULL, hoechstbetragshypothek_anwendbar = NULL, einordnungsnachweis = NULL) {
  haupt <- .geld(hauptforderung)
  zins <- .geld(zinsen)
  grenze <- .geld(eingetragener_hoechstbetrag)
  .wahrheitswert(hoechstbetragshypothek_anwendbar, "hoechstbetragshypothek_anwendbar")
  .text(einordnungsnachweis, "einordnungsnachweis")
  summe <- .addieren(haupt, zins)
  gesichert <- if (.vergleichen(summe, grenze) <= 0) summe else grenze
  eingaben <- list(hauptforderung = hauptforderung, zinsen = zinsen, eingetragener_hoechstbetrag = eingetragener_hoechstbetrag,
    hoechstbetragshypothek_anwendbar = hoechstbetragshypothek_anwendbar, einordnungsnachweis = einordnungsnachweis)
  ergebnis <- .ergebnis(if (hoechstbetragshypothek_anwendbar) list(forderung_mit_zinsen = .bruchteile(summe),
    durch_hoechstbetrag_erfasster_betrag = .bruchteile(gesichert), nicht_vom_hoechstbetrag_erfasster_anteil = .bruchteile(.subtrahieren(summe, gesichert))) else NULL,
    "EUR", "BGB_HOECHSTBETRAGSHYPOTHEK_FORDERUNG_UND_ZINSEN", eingaben,
    list(list(operation = "Hauptforderung und Zinsen addieren, gemeinsame Summe auf eingetragenen H\u00f6chstbetrag begrenzen und \u00dcberschuss bestimmen")), eingaben)
  ergebnis$status <- if (hoechstbetragshypothek_anwendbar) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Qualifizierte Hauptforderung, Zinsen und wirksame H\u00f6chstbetragshypothek; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Nur gemeinsame Grenze f\u00fcr Hauptforderung und Zinsen nach\u00a71190 Absatz2. Sonstige Kosten/Nebenleistungen und deren Behandlung gesondert, keine abschlie\u00dfende Gesamthaftungsrechnung. Kein weiterer Zinsaufschlag auf den eingetragenen H\u00f6chstbetrag; \u00fcbersteigender pers\u00f6nlicher Forderungsanteil erlischt nicht automatisch. Keine Verteilung innerhalb der Grenze auf einzelne Anspruchskomponenten und keine Berechnung des Grundst\u00fccksverwertungserl\u00f6ses. Zinsbetrag kommt aus gesonderter qualifizierter Zinsberechnung.")
  ergebnis
}
pfand_edelmetall_mindestpreis <- function(angebotener_preis = NULL, gold_oder_silberwert = NULL, gold_oder_silbersache = NULL, bewertungsnachweis = NULL) {
  preis <- .geld(angebotener_preis)
  metall <- .geld(gold_oder_silberwert)
  .wahrheitswert(gold_oder_silbersache, "gold_oder_silbersache")
  .text(bewertungsnachweis, "bewertungsnachweis")
  eingaben <- list(angebotener_preis = angebotener_preis, gold_oder_silberwert = gold_oder_silberwert,
    gold_oder_silbersache = gold_oder_silbersache, bewertungsnachweis = bewertungsnachweis)
  ergebnis <- .ergebnis(if (gold_oder_silbersache) list(mindestpreis = .bruchteile(metall), mindestpreis_erreicht = .vergleichen(preis, metall) >= 0) else NULL,
    "EUR_und_wahrheitswert", "BGB_PFAND_EDELMETALL_MINDESTPREIS", eingaben,
    list(list(operation = "Gebot beziehungsweise Preis mit rechtlich bewertetem Gold- oder Silberwert vergleichen")), eingaben)
  ergebnis$status <- if (gold_oder_silbersache) "BERECHNET" else "NICHT_ANWENDBAR"
  ergebnis$annahmen <- list("Edelmetallwert, Art des Pfandes und einschl\u00e4giges gesetzliches Verkaufsregime qualifiziert vorgegeben; feste lokale BGB-Fassung.")
  ergebnis$hinweise <- list("Preisuntergrenze gilt f\u00fcr Zuschlag und freih\u00e4ndigen Ersatzverkauf nach\u00a71240 Absatz2. Kein B\u00f6rsenkursabruf, keine automatische Material-/Feingehaltsbewertung und kein Abschlag wegen fehlender Gebote. Qualifizierten ma\u00dfgeblichen Gold-/Silberwert vorgeben; andere gesetzliche Verkaufsbedingungen, befugte Verkaufsperson und zul\u00e4ssige Abweichungen gesondert. Erreichter Mindestpreis bedeutet keine vollst\u00e4ndige Rechtm\u00e4\u00dfigkeit des Verkaufs.")
  ergebnis
}
