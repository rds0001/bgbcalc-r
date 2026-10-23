grundbuch_rangpaarvergleich <- function(erstes_recht=NULL, zweites_recht=NULL, einordnungsnachweis=NULL) {
 .text(einordnungsnachweis,'einordnungsnachweis')
 lesen <- function(recht,parameter) {
  .vorhanden(recht,parameter)
  if(!is.list(recht) || !identical(sort(names(recht)),sort(c('recht_id','abteilung','eintragungsposition','eintragungstag')))) .fehler(parameter,'Genau Kennung, Abteilung, Position und Eintragungstag erforderlich.')
  list(kennung=.text(recht$recht_id,'recht_id'),abteilung=.text(recht$abteilung,'abteilung'),position=.ganzzahl(recht$eintragungsposition,'eintragungsposition',1,9007199254740991),tag=.datum(recht$eintragungstag,'eintragungstag'))
 }
 a <- lesen(erstes_recht,'erstes_recht');b <- lesen(zweites_recht,'zweites_recht')
 if(a$kennung==b$kennung) .fehler('zweites_recht','Verschiedene Rechte erforderlich.')
 if(a$abteilung==b$abteilung) {
  if(a$position==b$position) .fehler('eintragungsposition','Verschiedene tats\u00e4chliche Reihenfolgepositionen innerhalb derselben Abteilung erforderlich.')
  links <- a$position;rechts <- b$position;massstab <- 'eintragungsreihenfolge'
 } else {links <- a$tag;rechts <- b$tag;massstab <- 'eintragungstag'}
 wert <- list(rangvergleich=if(links<rechts) -1 else if(links>rechts) 1 else 0,vergleichsmassstab=massstab)
 eingaben <- list(erstes_recht=erstes_recht, zweites_recht=zweites_recht, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"rangvergleich","BGB_GRUNDBUCH_RANGPAARVERGLEICH",eingaben,list(list(operation="Zwei Grundst\u00fccksrechte nach abteilungsabh\u00e4ngigem Eintragungsma\u00dfstab paarweise vergleichen.")),eingaben)
 ergebnis$hinweise <- list("\u00a7879I/II: in derselben Grundbuchabteilung tats\u00e4chliche Reihenfolge der Eintragungen vergleichen; in verschiedenen Abteilungen angegebenen Eintragungstag vergleichen, bei gleichem Tag Gleichrang. Zeitpunkt einer sp\u00e4teren dinglichen Einigung ersetzt den Eintragungsma\u00dfstab nicht. Position ist wirkliche Reihenfolge, nicht ungepr\u00fcft laufende Nummer eines Rechts oder Antragsnummer. Nur Paarvergleich: bei mehreren Rechten keine transitive globale Ranggruppe aus einzelnen Gleichrangvergleichen erfinden. Abweichende eingetragene Rangbestimmung,880Rang\u00e4nderung,881Vorbehalt,883Vormerkung und Verwertungsbetr\u00e4ge gesondert. Gleiche Position verschiedener Rechte derselben Abteilung wird mangels eindeutig qualifizierter Reihenfolge nicht angenommen.")
 ergebnis
}
