hypothek_wiederkehrende_faelligkeitsgrenze <- function(beschlagnahme_am=NULL, faelligkeit_am=NULL, grenzmethode=NULL, einordnungsnachweis=NULL) {
 .datum(beschlagnahme_am,'beschlagnahme_am');f <- .datum(faelligkeit_am,'faelligkeit_am');.text(einordnungsnachweis,'einordnungsnachweis')
 .auswahl(grenzmethode,'grenzmethode',c('nach_ablauf_dreimonatsfrist','ab_dreimonatsvergleichstag'))
 e <- .frist(beschlagnahme_am,3,'monate','ereignis')
 wert <- list(dreimonatsvergleichstag=format(e,'%Y-%m-%d'),zeitliches_unwirksamkeitsmerkmal=if(grenzmethode=='nach_ablauf_dreimonatsfrist') f>e else f>=e,angewandte_grenzmethode=grenzmethode)
 eingaben <- list(beschlagnahme_am=beschlagnahme_am, faelligkeit_am=faelligkeit_am, grenzmethode=grenzmethode, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"datum_und_wahrheitswert","BGB_HYPOTHEK_WIEDERKEHRENDE_FAELLIGKEITSGRENZE",eingaben,list(list(operation="Drei Kalendermonate ab Beschlagnahme und F\u00e4lligkeitslage nach ausdr\u00fccklich gew\u00e4hlter Grenztagsmethode berechnen.")),eingaben)
 ergebnis$hinweise <- list("1126Satz3: Vorverf\u00fcgung \u00fcber wiederkehrende Leistung, keine Mietzeitraumpr\u00fcfung nach1124II. Drei Kalendermonate mit bestehendem187/188-Kern rechnen, keine90Tage. Nach_ablauf_dreimonatsfrist vergleicht F\u00e4lligkeit streng nach dem letzten Fristtag; ab_dreimonatsvergleichstag bezieht diesen Vergleichstag ein. Die lokale Norm allein kl\u00e4rt die hier strittige Tagesgrenze nicht abschlie\u00dfend; verpflichtende Methodenwahl macht beide bedingten Rechnungen sichtbar, ohne eine allgemein verbindliche Grenztagsauslegung zu behaupten. \u00dcbrige rechtliche Unwirksamkeitsvoraussetzungen sind nicht Gegenstand dieser zeitlichen Rechnung. Keine193-Wochenendverschiebung einer F\u00e4lligkeitsabgrenzung.")
 ergebnis
}
