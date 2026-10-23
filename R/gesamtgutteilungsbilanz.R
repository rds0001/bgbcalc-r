gesamtgut_teilungsbilanz <- function(bereinigte_masse_ohne_ersatzforderungen=NULL,ersatzschuld_ehegatte=NULL,ersatzschuld_anderer=NULL,bilanznachweis=NULL) {
  masse <- .geld(bereinigte_masse_ohne_ersatzforderungen);erster <- .geld(ersatzschuld_ehegatte);zweiter <- .geld(ersatzschuld_anderer)
  .text(bilanznachweis,"bilanznachweis")
  teilungsmasse <- .addieren(.addieren(masse,erster),zweiter);haelfte <- .dividieren(teilungsmasse,.bruch(2))
  einzel <- function(ersatz) {
    saldo <- .subtrahieren(haelfte,ersatz)
    anrechnung <- if (.vergleichen(haelfte,ersatz)<=0) haelfte else ersatz
    anspruch <- if (.vergleichen(saldo,.bruch(0))>=0) saldo else .bruch(0)
    rest <- .subtrahieren(ersatz,haelfte);if (.vergleichen(rest,.bruch(0))<0) rest <- .bruch(0)
    list(halbanteil=.bruchteile(haelfte),ersatzanrechnung=.bruchteile(anrechnung),auseinandersetzungssaldo=.bruchteile(saldo),auseinandersetzungsanspruch=.bruchteile(anspruch),restersatzpflicht=.bruchteile(rest))
  }
  eingaben <- list(bereinigte_masse_ohne_ersatzforderungen=bereinigte_masse_ohne_ersatzforderungen,ersatzschuld_ehegatte=ersatzschuld_ehegatte,ersatzschuld_anderer=ersatzschuld_anderer,bilanznachweis=bilanznachweis)
  ergebnis <- .ergebnis(list(teilungsmasse_einschliesslich_ersatzforderungen=.bruchteile(teilungsmasse),ehegatte=einzel(erster),anderer_ehegatte=einzel(zweiter)),"EUR","BGB_GESAMTGUT_TEILUNGSBILANZ",eingaben,list(list(operation="Voll bewertete Ersatzforderungen beider Ehegatten zur bereits bereinigten sonstigen Restmasse addieren, halbieren und jede eigene Ersatzschuld auf den eigenen Halbteil anrechnen; \u00fcberschie\u00dfende Ersatzschuld als Restpflicht ausweisen.")),eingaben)
  ergebnis$hinweise <- list("\u00a71476I/II im Standardfall nach erledigter vorrangiger Verbindlichkeitenberichtigung und erforderlichen R\u00fcckbehalten nach\u00a71475. Eingabemasse umfasst sonstiges verbleibendes Gesamtgut, aber gerade keine der gesondert eingegebenen Ersatzforderungen und keine nochmals abzuziehenden schon ber\u00fccksichtigten Schulden. Beide Ersatzforderungen sind rechtlich festgestellt und in voller angesetzter H\u00f6he realisierbar beziehungsweise anrechenbar; Abschl\u00e4ge wegen Uneinbringlichkeit, Insolvenz und Bewertungsstreit gesondert. Vor Halbteilung geh\u00f6ren die Ersatzforderungen zur Masse, danach wird die jeweilige Ersatzschuld auf den eigenen Halbanteil angerechnet; blo\u00dfes Halbieren der ersatzforderungsfreien Masse w\u00e4re falsch. Positiver Anspruch kann vorhandene Restmasse plus noch zu leistenden Ersatz des anderen umfassen und ist kein Nachweis sofort verf\u00fcgbarer Barauszahlung. Negativer Saldo bedeutet \u00fcberschie\u00dfende Restersatzpflicht nachAbsatz2, nicht negativer Auszahlungsbetrag. Sonderr\u00fcckerstattung\u00a71478, Abfindungen\u00a71501 und abweichende Vereinbarungen nicht in diese Standardbilanz hineinmischen.")
  ergebnis
}
