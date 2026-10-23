ratenlieferung_massgebliche_teilzahlungssumme <- function(teilzahlungen=NULL, fruehestmoeglicher_kuendigungszeitpunkt_utc=NULL, einordnungsnachweis=NULL) {
 ende <- .reise_utc_zeitpunkt(fruehestmoeglicher_kuendigungszeitpunkt_utc,'fruehestmoeglicher_kuendigungszeitpunkt_utc')
 .vorhanden(teilzahlungen,'teilzahlungen')
 if(!is.list(teilzahlungen)||!is.null(names(teilzahlungen))||length(teilzahlungen)<1||length(teilzahlungen)>10000) .fehler('teilzahlungen','Liste1bis10000 eindeutiger Teilzahlungen erforderlich.')
 .text(einordnungsnachweis,'einordnungsnachweis')
 namen <- character();summe <- .bruch(0);anzahl <- 0
 for(position in teilzahlungen) {
  if(!is.list(position)||length(position)!=3||!setequal(names(position),c('zahlungs_id','faellig_utc','betrag'))) .fehler('teilzahlungen','Genau zahlungs_id, faellig_utc und betrag erforderlich.')
  name <- .text(position$zahlungs_id,'zahlungs_id')
  if(name %in% namen) .fehler('zahlungs_id','Teilzahlung darf nicht mehrfach erfasst werden.')
  namen <- c(namen,name)
  faellig <- .reise_utc_zeitpunkt(position$faellig_utc,'faellig_utc');betrag <- .geld(position$betrag)
  if(faellig<=ende) {summe <- .addieren(summe,betrag);anzahl <- anzahl+1}
 }
 wert <- list(massgebliche_teilzahlungssumme=.bruchteile(summe),anzahl_einbezogener_teilzahlungen=anzahl,anzahl_spaeter_faelliger_teilzahlungen=length(teilzahlungen)-anzahl)
 eingaben <- list(teilzahlungen=teilzahlungen, fruehestmoeglicher_kuendigungszeitpunkt_utc=fruehestmoeglicher_kuendigungszeitpunkt_utc, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"EUR_und_anzahlen","BGB_RATENLIEFERUNG_MASSGEBLICHE_TEILZAHLUNGSSUMME",eingaben,list(list(operation="Vertragliche Teilzahlungen mit F\u00e4lligkeit bis einschlie\u00dflich des qualifizierten fr\u00fchestm\u00f6glichen K\u00fcndigungszeitpunkts ausw\u00e4hlen und exakt summieren.")),eingaben)
 ergebnis$hinweise <- list("\u00a7510III2: gesetzliche Ersatzbezugsgr\u00f6\u00dfe f\u00fcr den Nettodarlehensbetrag491II2Nr1. Alle bis zum ma\u00dfgeblichen K\u00fcndigungszeitpunkt zu entrichtenden Teilzahlungen einbeziehen, auch bereits entrichtete; keine Berechnung blo\u00df des offenen Saldos. Sp\u00e4ter f\u00e4llige Raten nicht einbeziehen. Mehrere verschiedene Raten d\u00fcrfen denselben F\u00e4lligkeitszeitpunkt haben, aber jede Zahlung nur einmal erfassen. K\u00fcndigungsregel und Zahlungsplan extern qualifizieren; Ergebnis entscheidet keine weiteren491-Ausnahmen, kein Widerrufsrecht und keine tats\u00e4chliche Restschuld. Strikte UTC-Zeitpunkte ohne Zeitzonenannahmen; vorhandenen Standard-Datumsparser wiederverwenden.")
 ergebnis
}
