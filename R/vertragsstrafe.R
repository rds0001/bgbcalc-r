vertragsstrafe_schadensmindestbetrag <- function(strafbetrag = NULL,
    ersatzfaehiger_schaden = NULL, strafart = NULL, strafe_verwirkt = NULL,
    erfuellung_angenommen = NULL, vorbehalt_bei_annahme = NULL,
    schadensersatzanspruch_besteht = NULL, bewertungsnachweis = NULL) {
  strafe <- .geld(strafbetrag)
  schaden <- .geld(ersatzfaehiger_schaden)
  .auswahl(strafart, "strafart", c("nichterfuellung", "nicht_gehoerige_erfuellung"))
  eingaben <- list(strafbetrag = strafbetrag, ersatzfaehiger_schaden = ersatzfaehiger_schaden,
    strafart = strafart, strafe_verwirkt = strafe_verwirkt, erfuellung_angenommen = erfuellung_angenommen,
    vorbehalt_bei_annahme = vorbehalt_bei_annahme, schadensersatzanspruch_besteht = schadensersatzanspruch_besteht,
    bewertungsnachweis = bewertungsnachweis)
  for (name in names(eingaben)[4:7]) .wahrheitswert(eingaben[[name]], name)
  .text(bewertungsnachweis, "bewertungsnachweis")
  vorbehalt_noetig <- strafart == "nicht_gehoerige_erfuellung" && erfuellung_angenommen
  strafe_verlangbar <- strafe_verwirkt && (!vorbehalt_noetig || vorbehalt_bei_annahme)
  mindest <- if (strafe_verlangbar) strafe else .bruch(0)
  ersatz <- if (schadensersatzanspruch_besteht) schaden else .bruch(0)
  gesamt <- if (.vergleichen(mindest, ersatz) >= 0) mindest else ersatz
  ergebnis <- .geld_ergebnis(gesamt, "BGB_VERTRAGSSTRAFE_SCHADENSMINDESTBETRAG", eingaben,
    list(list(operation = "Verlangbare Strafe als Mindestbetrag; zus\u00e4tzlichen Schaden nur oberhalb der Strafe ber\u00fccksichtigen")))
  ergebnis$wert <- list(strafe_nach_diesen_voraussetzungen_verlangbar = strafe_verlangbar,
    strafmindestbetrag = .bruchteile(mindest), weiterer_schadensbetrag = .bruchteile(.subtrahieren(gesamt, mindest)),
    gesamtbetrag = .bruchteile(gesamt))
  ergebnis$hinweise <- c(ergebnis$hinweise, list("Nur derselbe von der Strafe erfasste Nichterf\u00fcllungs-/Schlechterf\u00fcllungsschaden; keine Addition voller Strafe und voller Schadenh\u00f6he. Wirksamer gegebenenfalls herabgesetzter Strafbetrag vorgegeben. Erf\u00fcllungsanspruch, dessen Ausschluss durch Erkl\u00e4rung\u00a7340 Absatz1 und sonstige Einwendungen separat. Fehlender Vorbehalt beseitigt hier die Strafe, nicht automatisch einen unabh\u00e4ngig bestehenden Schadensersatzanspruch."))
  ergebnis
}
