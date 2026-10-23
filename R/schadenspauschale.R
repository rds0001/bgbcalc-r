schadenspauschale_betragsvergleich <- function(pauschalbetrag=NULL, gewoehnlich_zu_erwartender_betrag=NULL, einordnungsnachweis=NULL) {
 pauschale <- .geld(pauschalbetrag);vergleich <- .geld(gewoehnlich_zu_erwartender_betrag)
 .text(einordnungsnachweis,'einordnungsnachweis')
 ueber <- .vergleichen(pauschale,vergleich)>0
 wert <- list(pauschale_uebersteigt_vergleichsbetrag=ueber,ueberschreitungsbetrag=.bruchteile(if(ueber) .subtrahieren(pauschale,vergleich) else .bruch(0)))
 eingaben <- list(pauschalbetrag=pauschalbetrag, gewoehnlich_zu_erwartender_betrag=gewoehnlich_zu_erwartender_betrag, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR_und_wahrheitswert","BGB_SCHADENSPAUSCHALE_BETRAGSVERGLEICH",eingaben,list(list(operation="Schadens- oder Wertminderungspauschale mit qualifiziertem gew\u00f6hnlichen Erwartungsbetrag vergleichen und positiven \u00dcberschreitungsbetrag berechnen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7309Nr5a: strenger Betragsvergleich der Pauschale mit dem qualifizierten gew\u00f6hnlich zu erwartenden Schaden oder der Wertminderung. Vergleichsma\u00dfstab ist nicht automatisch der konkret entstandene Einzelschaden. Keine automatische Wirksamkeitsentscheidung, insbesondere keine Pr\u00fcfung von309Nr5b. Der positive \u00dcberschreitungsbetrag ist keine automatische R\u00fcckforderung oder geltungserhaltende Herabsetzung auf einen zul\u00e4ssigen Vertragsbetrag.")
 ergebnis
}
