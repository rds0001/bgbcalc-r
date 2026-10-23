vergleichsmiete_kappungsrahmen <- function(ausgangsmiete_drei_jahre = NULL,
    nicht_anzurechnende_erhoehungen = NULL, derzeitige_monatsmiete = NULL,
    ortsuebliche_vergleichsmiete = NULL, gueltige_fuenfzehnprozent_verordnung = NULL,
    ausgleichszahlungsausnahme = NULL, drittmittelabzug_erforderlich = NULL,
    vergleichsmietregel_anwendbar = NULL, mietnachweis = NULL) {
  basis <- .geld(ausgangsmiete_drei_jahre)
  ausgenommen <- .geld(nicht_anzurechnende_erhoehungen)
  bisher <- .geld(derzeitige_monatsmiete)
  vergleich <- .geld(ortsuebliche_vergleichsmiete)
  eingaben <- list(ausgangsmiete_drei_jahre = ausgangsmiete_drei_jahre,
    nicht_anzurechnende_erhoehungen = nicht_anzurechnende_erhoehungen,
    derzeitige_monatsmiete = derzeitige_monatsmiete, ortsuebliche_vergleichsmiete = ortsuebliche_vergleichsmiete,
    gueltige_fuenfzehnprozent_verordnung = gueltige_fuenfzehnprozent_verordnung,
    ausgleichszahlungsausnahme = ausgleichszahlungsausnahme, drittmittelabzug_erforderlich = drittmittelabzug_erforderlich,
    vergleichsmietregel_anwendbar = vergleichsmietregel_anwendbar, mietnachweis = mietnachweis)
  for (name in names(eingaben)[5:8]) .wahrheitswert(eingaben[[name]], name)
  .text(mietnachweis, "mietnachweis")
  gilt <- vergleichsmietregel_anwendbar && !ausgleichszahlungsausnahme && !drittmittelabzug_erforderlich
  ergebnis <- .geld_ergebnis(NULL, "BGB_VERGLEICHSMIETE_KAPPUNGSRAHMEN", eingaben,
    list(list(operation = "Dreijahres-Ausgangsmiete um20 oder15Prozent erh\u00f6hen, nicht anzurechnende Erh\u00f6hungen hinzuf\u00fcgen und durch Vergleichsmiete begrenzen")))
  if (gilt) {
    prozent <- if (gueltige_fuenfzehnprozent_verordnung) 15 else 20
    kappung <- .addieren(.multiplizieren(basis, .bruch(100 + prozent, 100)), ausgenommen)
    obergrenze <- if (.vergleichen(kappung, vergleich) < 0) kappung else vergleich
    spielraum <- if (.vergleichen(obergrenze, bisher) > 0) .subtrahieren(obergrenze, bisher) else .bruch(0)
    ergebnis$wert <- list(kappungsgrenze_prozent = prozent, kappungsbetrag_monatlich = .bruchteile(kappung),
      obergrenze_monatlich = .bruchteile(obergrenze), maximaler_erhoehungsbetrag = .bruchteile(spielraum),
      miete_nach_maximaler_erhoehung = .bruchteile(.addieren(bisher, spielraum)))
    ergebnis$status <- "BERECHNET"
  }
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur regul\u00e4rer Betragsrahmen ohne Ausnahme\u00a7558 Absatz4 und ohne DrittmittelabzugAbsatz5. Drei-Jahres-Ausgangsmiete, Ver\u00e4nderungen und ausgeschlossene Erh\u00f6hungen rechtlich konsistent bestimmen; Modernisierungsbetr\u00e4ge nicht zugleich in die Ausgangsmiete einrechnen und addieren. G\u00fcltigkeit der \u00f6rtlichen15Prozent-Verordnung ist Nutzervorgabe. Zeitvoraussetzungen, formgerechtes Verlangen, Zustimmung und Sonderregime separat. Kein automatischer Senkungsanspruch bei bereits h\u00f6herer Bestandsmiete."))
  ergebnis
}
