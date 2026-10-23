draufgabe_geldanrechnung <- function(anrechnungsfall=NULL, geschuldeter_betrag=NULL, draufgabebetrag=NULL, einordnungsnachweis=NULL) {
 art <- .text(anrechnungsfall,'anrechnungsfall')
 if(!(art %in% c('leistung_337','schadensersatz_338'))) .fehler('anrechnungsfall','leistung_337 oder schadensersatz_338 erforderlich.')
 schuld <- .geld(geschuldeter_betrag);draufgabe <- .geld(draufgabebetrag)
 .text(einordnungsnachweis,'einordnungsnachweis')
 zuordnung <- .anrechnen(draufgabe,list(betrag=schuld),c('betrag'))
 position <- zuordnung$zuordnungen[[1]]
 wert <- list(angerechneter_betrag=position$betrag,verbleibender_betrag=position$restforderung,nicht_angerechnete_draufgabe=zuordnung$nicht_zugeordnet)
 eingaben <- list(anrechnungsfall=anrechnungsfall, geschuldeter_betrag=geschuldeter_betrag, draufgabebetrag=draufgabebetrag, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR","BGB_DRAUFGABE_GELDANRECHNUNG",eingaben,list(list(operation="Anrechenbare Geld-Draufgabe bis zur bestimmten Leistung oder zum Schadensersatz anrechnen, Restbetrag und nicht angerechneten Draufgabenteil ausweisen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7337I beziehungsweise338Satz2: Anrechnung einer qualifizierten Geld-Draufgabe auf den bestimmten Leistungs- beziehungsweise Schadensersatzbetrag. Anrechnung h\u00f6chstens in H\u00f6he des geschuldeten Betrags, danach rechnerischer Rest. Ein nicht angerechneter Draufgabenteil wird separat ausgewiesen; daraus folgt weder R\u00fcckzahlungsanspruch noch Verwirkung. Insbesondere bei338 keine automatische R\u00fcckzahlung des den Schaden \u00fcbersteigenden Betrags. Nicht anrechenbare Sach-Draufgaben und reine R\u00fcckgabepflichten337II/338 sind keine eigenst\u00e4ndige Geldberechnung; weder Geldersatz noch Eigentums-/R\u00fcckgabeentscheidung wird erfunden. Keine automatische Bestimmung der gesetzlichen Zweifelregel oder Anrechnung auf zus\u00e4tzliche Zinsen/Kosten.")
 ergebnis
}
