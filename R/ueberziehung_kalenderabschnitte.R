ueberziehung_kalenderabschnitte <- function(kontosaldoabschnitte=NULL, bezugsbetrag=NULL, vergleichsregel=NULL, einordnungsnachweis=NULL) {
 .text(einordnungsnachweis,'einordnungsnachweis');.vorhanden(kontosaldoabschnitte,'kontosaldoabschnitte')
 if(!is.list(kontosaldoabschnitte)||!is.null(names(kontosaldoabschnitte))||length(kontosaldoabschnitte)<1||length(kontosaldoabschnitte)>10000) .fehler('kontosaldoabschnitte','Nichtleere begrenzte Liste erforderlich.')
 seg <- lapply(kontosaldoabschnitte,function(a){
  if(!is.list(a)||length(a)!=3||!setequal(names(a),c('erster_tag','letzter_tag','ueberziehungsbetrag'))) .fehler('kontosaldoabschnitte','Genau beide Tagesgrenzen und Betrag erforderlich.')
  v <- .datum(a$erster_tag,'erster_tag');b <- .datum(a$letzter_tag,'letzter_tag')
  if(b<v) .fehler('letzter_tag','Abschnittsende vor Beginn.')
  list(v=v,b=b,x=a$ueberziehungsbetrag)
 })
 seg <- seg[order(vapply(seg,function(a)as.numeric(a$v),numeric(1)))];tage <- list();vorher <- NULL
 for(a in seg) {
  if(!is.null(vorher)&&as.numeric(a$v-vorher)!=1) .fehler('kontosaldoabschnitte','Luecke oder Ueberschneidung im Beobachtungszeitraum.')
  tage[[length(tage)+1]] <- list(kalendertage=as.integer(a$b-a$v)+1L,ueberziehungsbetrag=a$x);vorher <- a$b
 }
 von <- seg[[1]]$v;bis <- seg[[length(seg)]]$b;gr <- lapply(c(1,3,6),function(m).frist(format(von,'%Y-%m-%d'),m,'monate','tagesbeginn'))
 k <- ueberziehung_durchschnittsvergleich(tage,bezugsbetrag,vergleichsregel,einordnungsnachweis)$wert
 wert <- list(erster_beobachteter_tag=format(von,'%Y-%m-%d'),letzter_beobachteter_tag=format(bis,'%Y-%m-%d'),einmonatsablauf=format(gr[[1]],'%Y-%m-%d'),dreimonatsablauf=format(gr[[2]],'%Y-%m-%d'),sechsmonatsablauf=format(gr[[3]],'%Y-%m-%d'),mehr_als_ein_monat=bis>gr[[1]],mehr_als_drei_monate=bis>gr[[2]],sechs_monate_erreicht=bis>=gr[[3]],durchschnitt=k)
 eingaben <- list(kontosaldoabschnitte=kontosaldoabschnitte, bezugsbetrag=bezugsbetrag, vergleichsregel=vergleichsregel, einordnungsnachweis=einordnungsnachweis)
 ergebnis <- .ergebnis(wert,"daten_und_betragsvergleich","BGB_UEBERZIEHUNG_KALENDERABSCHNITTE",eingaben,list(list(operation="Lueckenlose tatsaechliche Kalendertage je Kontosaldoabschnitt bestimmen, Kalender-Monatsgrenzen berechnen und vorhandenen Betragstage-Durchschnittskern verwenden.")),eingaben)
 ergebnis$hinweise <- list("\u00a7504aI/505II: tatsaechliche lueckenlose Tagesabschnitte sortieren, Ueberschneidungen/Luecken ablehnen, Dauer und Betragstage mit bestehendem Durchschnittskern rechnen. Kalendermonate nach187II/188: sechs Monate einschliesslich Ablauf, mehr als ein/drei Monate strikt nach jeweiligem Ablauf; keine180/90/30-Tage-Ersatzregel. Erste Nutzung und Ende als ganze rechtlich qualifizierte Tage, keine Rundung untertaegiger Ereignisse. Nullsaldoabschnitt bleibt in Mittelung enthalten und widerlegt ununterbrochene positive Ueberziehung. Bei vierteljaehrlichem Abschluss ist504aI2am jeweiligen Abschluss zu beurteilen;505II3nennt ausdruecklich die Informationsvoraussetzungen vonSatz1. Datum des bankvertraglichen Abschlusses vorgeben, nicht automatisch Kalenderquartal unterstellen. Die Berechnung am gewaehlten Beobachtungsende ersetzt keine gesetzliche Stichtagsqualifikation.505II2: Bezugsbetrag gesamter Geldeingang der letzten3Monate, Vergleichsgrenze dessen1/6; Bezugseingangsfenster rechtlich separat bestimmen. Veraenderliche Kreditlinie und andere Mittelungskonventionen nicht automatisch behandeln. Keine vollstaendige Beratungs-/Informationsentscheidung aus reinem Zahlenvergleich.")
 ergebnis
}
